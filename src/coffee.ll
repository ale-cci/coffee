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
%relpath.3655 = alloca i8*
store i8* %.tmp3654, i8** %relpath.3655
%.tmp3656 = load i8*, i8** %relpath.3655
%.tmp3657 = icmp eq i8* %.tmp3656, null
br i1 %.tmp3657, label %.if.true.3658, label %.if.false.3658
.if.true.3658:
%.tmp3659 = getelementptr i8*, i8** %err_buf.3143, i32 0
%.tmp3661 = getelementptr [54 x i8], [54 x i8]*@.str3660, i32 0, i32 0
%.tmp3662 = load i8*, i8** %mod_name.3619
%.tmp3663 = load i8*, i8** %mod_abspath.3651
%.tmp3664 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3659, i8* %.tmp3661, i8* %.tmp3662, i8* %.tmp3663)
%.tmp3665 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3666 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3667 = load i8*, i8** %err_buf.3143
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3665, %m307$.Node.type* %.tmp3666, i8* %.tmp3667)
ret void
br label %.if.end.3658
.if.false.3658:
br label %.if.end.3658
.if.end.3658:
%.tmp3668 = load i8*, i8** %relpath.3655
store i8* %.tmp3668, i8** %mod_abspath.3651
%m.3669 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %m.3669
%.tmp3670 = bitcast ptr null to %m1861$.ModuleLookup.type*
%mod.3671 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3670, %m1861$.ModuleLookup.type** %mod.3671
%.tmp3673 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3674 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3673, i32 0, i32 6
%.tmp3675 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3674
store %m1861$.ModuleLookup.type* %.tmp3675, %m1861$.ModuleLookup.type** %m.3669
br label %.for.start.3672
.for.start.3672:
%.tmp3676 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3669
%.tmp3677 = icmp ne %m1861$.ModuleLookup.type* %.tmp3676, null
%.tmp3678 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3671
%.tmp3679 = icmp eq %m1861$.ModuleLookup.type* %.tmp3678, null
%.tmp3680 = and i1 %.tmp3677, %.tmp3679
br i1 %.tmp3680, label %.for.continue.3672, label %.for.end.3672
.for.continue.3672:
%.tmp3681 = load i8*, i8** %mod_abspath.3651
%.tmp3682 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3669
%.tmp3683 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3682, i32 0, i32 0
%.tmp3684 = load i8*, i8** %.tmp3683
%.tmp3685 = call i32(i8*,i8*) @strcmp(i8* %.tmp3681, i8* %.tmp3684)
%.tmp3686 = icmp eq i32 %.tmp3685, 0
br i1 %.tmp3686, label %.if.true.3687, label %.if.false.3687
.if.true.3687:
%.tmp3688 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3669
store %m1861$.ModuleLookup.type* %.tmp3688, %m1861$.ModuleLookup.type** %mod.3671
br label %.if.end.3687
.if.false.3687:
br label %.if.end.3687
.if.end.3687:
%.tmp3689 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3669
%.tmp3690 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3689, i32 0, i32 2
%.tmp3691 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3690
store %m1861$.ModuleLookup.type* %.tmp3691, %m1861$.ModuleLookup.type** %m.3669
br label %.for.start.3672
.for.end.3672:
%.tmp3692 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3693 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3692, i32 0, i32 6
%.tmp3694 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3693
%.tmp3695 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3694, i32 0, i32 7
%.tmp3696 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3695
%.tmp3697 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3696, i32 0, i32 7
%.tmp3698 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3697
%.tmp3699 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3698, i32 0, i32 7
%.tmp3700 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3699
%.tmp3701 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3700, i32 0, i32 1
%.tmp3702 = load i8*, i8** %.tmp3701
%asname.3703 = alloca i8*
store i8* %.tmp3702, i8** %asname.3703
%.tmp3704 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3671
%.tmp3705 = icmp eq %m1861$.ModuleLookup.type* %.tmp3704, null
br i1 %.tmp3705, label %.if.true.3706, label %.if.false.3706
.if.true.3706:
%.tmp3707 = load i32, i32* @ModuleLookup_size
%.tmp3708 = call i8*(i32) @malloc(i32 %.tmp3707)
%.tmp3709 = bitcast i8* %.tmp3708 to %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp3709, %m1861$.ModuleLookup.type** %mod.3671
%.tmp3710 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3671
%.tmp3711 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3710, i32 0, i32 0
%.tmp3712 = load i8*, i8** %mod_abspath.3651
store i8* %.tmp3712, i8** %.tmp3711
%.tmp3713 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3671
%.tmp3714 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3713, i32 0, i32 2
store %m1861$.ModuleLookup.type* null, %m1861$.ModuleLookup.type** %.tmp3714
%.tmp3715 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3671
%.tmp3716 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3715, i32 0, i32 3
store %m1861$.Scope.type* null, %m1861$.Scope.type** %.tmp3716
%.tmp3717 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3671
%.tmp3718 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3717, i32 0, i32 1
%.tmp3719 = getelementptr i8*, i8** %.tmp3718, i32 0
%.tmp3721 = getelementptr [5 x i8], [5 x i8]*@.str3720, i32 0, i32 0
%.tmp3722 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3723 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3722)
%.tmp3724 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3719, i8* %.tmp3721, i32 %.tmp3723)
%.tmp3726 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3727 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3726, i32 0, i32 6
%.tmp3728 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3727
store %m1861$.ModuleLookup.type* %.tmp3728, %m1861$.ModuleLookup.type** %m.3669
br label %.for.start.3725
.for.start.3725:
%.tmp3729 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3669
%.tmp3730 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3729, i32 0, i32 2
%.tmp3731 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3730
%.tmp3732 = icmp ne %m1861$.ModuleLookup.type* %.tmp3731, null
br i1 %.tmp3732, label %.for.continue.3725, label %.for.end.3725
.for.continue.3725:
%.tmp3733 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3669
%.tmp3734 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3733, i32 0, i32 2
%.tmp3735 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %.tmp3734
store %m1861$.ModuleLookup.type* %.tmp3735, %m1861$.ModuleLookup.type** %m.3669
br label %.for.start.3725
.for.end.3725:
%.tmp3736 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %m.3669
%.tmp3737 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3736, i32 0, i32 2
%.tmp3738 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3671
store %m1861$.ModuleLookup.type* %.tmp3738, %m1861$.ModuleLookup.type** %.tmp3737
%.tmp3739 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3740 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3741 = load i8*, i8** %asname.3703
%.tmp3742 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3671
%.tmp3743 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3742, i32 0, i32 0
%.tmp3744 = load i8*, i8** %.tmp3743
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3739, %m307$.Node.type* %.tmp3740, i8* %.tmp3741, i8* %.tmp3744)
%.tmp3745 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3746 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3745, i32 0, i32 7
%.tmp3747 = load i8*, i8** %.tmp3746
%curr_mod.3748 = alloca i8*
store i8* %.tmp3747, i8** %curr_mod.3748
%.tmp3749 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3750 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3749, i32 0, i32 7
%.tmp3751 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3671
%.tmp3752 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3751, i32 0, i32 0
%.tmp3753 = load i8*, i8** %.tmp3752
store i8* %.tmp3753, i8** %.tmp3750
%.tmp3754 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3755 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3756 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3671
%.tmp3757 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3756, i32 0, i32 0
%.tmp3758 = load i8*, i8** %.tmp3757
%.tmp3759 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3754, %m307$.Node.type* %.tmp3755, i8* %.tmp3758)
%.tmp3760 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3761 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3760, i32 0, i32 7
%.tmp3762 = load i8*, i8** %curr_mod.3748
store i8* %.tmp3762, i8** %.tmp3761
br label %.if.end.3706
.if.false.3706:
%.tmp3763 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3764 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3765 = load i8*, i8** %asname.3703
%.tmp3766 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.3671
%.tmp3767 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp3766, i32 0, i32 0
%.tmp3768 = load i8*, i8** %.tmp3767
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,i8*) @m1861$define_module.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp3763, %m307$.Node.type* %.tmp3764, i8* %.tmp3765, i8* %.tmp3768)
br label %.if.end.3706
.if.end.3706:
br label %.if.end.3611
.if.false.3611:
br label %.if.end.3611
.if.end.3611:
br label %.if.end.3608
.if.false.3608:
%.tmp3769 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3770 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3772 = getelementptr [40 x i8], [40 x i8]*@.str3771, i32 0, i32 0
%.tmp3773 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp3769, %m307$.Node.type* %.tmp3770, i8* %.tmp3772)
%.tmp3774 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3775 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3774, i32 0, i32 0
%.tmp3776 = load i8*, i8** %.tmp3775
%.tmp3777 = call i32(i8*,...) @printf(i8* %.tmp3773, i8* %.tmp3776)
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
%buf.3778 = alloca i8*
store i8* null, i8** %buf.3778
%.tmp3779 = getelementptr i8*, i8** %buf.3778, i32 0
%.tmp3781 = getelementptr [31 x i8], [31 x i8]*@.str3780, i32 0, i32 0
%.tmp3782 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3783 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3782, i32 0, i32 7
%.tmp3784 = load i8*, i8** %.tmp3783
%.tmp3785 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3786 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3785, i32 0, i32 3
%.tmp3787 = load i32, i32* %.tmp3786
%.tmp3788 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3789 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3788, i32 0, i32 4
%.tmp3790 = load i32, i32* %.tmp3789
%.tmp3791 = load i8*, i8** %msg
%.tmp3792 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3779, i8* %.tmp3781, i8* %.tmp3784, i32 %.tmp3787, i32 %.tmp3790, i8* %.tmp3791)
%.tmp3793 = load i8*, i8** %buf.3778
ret i8* %.tmp3793
}
define void @m1861$compile_fn_params.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%fn_params = alloca %m307$.Node.type*
store %m307$.Node.type* %.fn_params.arg, %m307$.Node.type** %fn_params
%param_type.3794 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %param_type.3794
%.tmp3796 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%param_ptr.3797 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3796, %m307$.Node.type** %param_ptr.3797
br label %.for.start.3795
.for.start.3795:
%.tmp3798 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3797
%.tmp3799 = icmp ne %m307$.Node.type* %.tmp3798, null
br i1 %.tmp3799, label %.for.continue.3795, label %.for.end.3795
.for.continue.3795:
%.tmp3800 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3797
%.tmp3801 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3802 = icmp ne %m307$.Node.type* %.tmp3800, %.tmp3801
br i1 %.tmp3802, label %.if.true.3803, label %.if.false.3803
.if.true.3803:
%.tmp3804 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3797
%.tmp3805 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3804, i32 0, i32 7
%.tmp3806 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3805
store %m307$.Node.type* %.tmp3806, %m307$.Node.type** %param_ptr.3797
br label %.if.end.3803
.if.false.3803:
br label %.if.end.3803
.if.end.3803:
%.tmp3807 = load %m307$.Node.type*, %m307$.Node.type** %fn_params
%.tmp3808 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3807)
%param_info.3809 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3808, %m1861$.AssignableInfo.type** %param_info.3809
%.tmp3810 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3809
%.tmp3811 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3810, i32 0, i32 3
%.tmp3813 = getelementptr [9 x i8], [9 x i8]*@.str3812, i32 0, i32 0
store i8* %.tmp3813, i8** %.tmp3811
%.tmp3814 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3797
%.tmp3815 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3814, i32 0, i32 0
%.tmp3816 = load i8*, i8** %.tmp3815
%.tmp3818 = getelementptr [5 x i8], [5 x i8]*@.str3817, i32 0, i32 0
%.tmp3819 = call i32(i8*,i8*) @strcmp(i8* %.tmp3816, i8* %.tmp3818)
%.tmp3820 = icmp eq i32 %.tmp3819, 0
br i1 %.tmp3820, label %.if.true.3821, label %.if.false.3821
.if.true.3821:
%.tmp3822 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3823 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3797
%.tmp3824 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3823, i32 0, i32 6
%.tmp3825 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3824
%.tmp3826 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3822, %m307$.Node.type* %.tmp3825)
store %m1861$.Type.type* %.tmp3826, %m1861$.Type.type** %param_type.3794
%.tmp3827 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3797
%.tmp3828 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3827, i32 0, i32 7
%.tmp3829 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3828
store %m307$.Node.type* %.tmp3829, %m307$.Node.type** %param_ptr.3797
br label %.if.end.3821
.if.false.3821:
br label %.if.end.3821
.if.end.3821:
%.tmp3830 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3809
%.tmp3831 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3830, i32 0, i32 4
%.tmp3832 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.3794
store %m1861$.Type.type* %.tmp3832, %m1861$.Type.type** %.tmp3831
%.tmp3833 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3797
%.tmp3834 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3833, i32 0, i32 1
%.tmp3835 = load i8*, i8** %.tmp3834
%var_name.3836 = alloca i8*
store i8* %.tmp3835, i8** %var_name.3836
%.tmp3837 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3809
%.tmp3838 = load i8, i8* @SCOPE_LOCAL
%.tmp3839 = load i8*, i8** %var_name.3836
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp3837, i8 %.tmp3838, i8* %.tmp3839)
%.tmp3840 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3841 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3809
%.tmp3842 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3841, i32 0, i32 4
%.tmp3843 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3842
%.tmp3844 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3840, %m1861$.Type.type* %.tmp3843)
%param_info_tr.3845 = alloca i8*
store i8* %.tmp3844, i8** %param_info_tr.3845
%.tmp3846 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3847 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3846, i32 0, i32 1
%.tmp3848 = load %m0$.File.type*, %m0$.File.type** %.tmp3847
%.tmp3850 = getelementptr [16 x i8], [16 x i8]*@.str3849, i32 0, i32 0
%.tmp3851 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3809
%.tmp3852 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3851)
%.tmp3853 = load i8*, i8** %param_info_tr.3845
%.tmp3854 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3848, i8* %.tmp3850, i8* %.tmp3852, i8* %.tmp3853)
%.tmp3855 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3856 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3797
%.tmp3857 = load i8*, i8** %var_name.3836
%.tmp3858 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3809
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3855, %m307$.Node.type* %.tmp3856, i8* %.tmp3857, %m1861$.AssignableInfo.type* %.tmp3858)
%.tmp3859 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3860 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3859, i32 0, i32 1
%.tmp3861 = load %m0$.File.type*, %m0$.File.type** %.tmp3860
%.tmp3863 = getelementptr [28 x i8], [28 x i8]*@.str3862, i32 0, i32 0
%.tmp3864 = load i8*, i8** %param_info_tr.3845
%.tmp3865 = load i8*, i8** %var_name.3836
%.tmp3866 = load i8*, i8** %param_info_tr.3845
%.tmp3867 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %param_info.3809
%.tmp3868 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3867)
%.tmp3869 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3861, i8* %.tmp3863, i8* %.tmp3864, i8* %.tmp3865, i8* %.tmp3866, i8* %.tmp3868)
%.tmp3870 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.3797
%.tmp3871 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3870, i32 0, i32 7
%.tmp3872 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3871
store %m307$.Node.type* %.tmp3872, %m307$.Node.type** %param_ptr.3797
br label %.for.start.3795
.for.end.3795:
ret void
}
define void @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp3873 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3875 = getelementptr [6 x i8], [6 x i8]*@.str3874, i32 0, i32 0
%.tmp3876 = bitcast ptr null to i8*
%.tmp3877 = bitcast ptr null to i8*
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp3873, i8* %.tmp3875, i8* %.tmp3876, i8* %.tmp3877)
%.tmp3878 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3879 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3878, i32 0, i32 6
%.tmp3880 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3879
%.tmp3882 = getelementptr [12 x i8], [12 x i8]*@.str3881, i32 0, i32 0
%.tmp3883 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp3880, i8* %.tmp3882)
%exprs.3884 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3883, %m307$.Node.type** %exprs.3884
%.tmp3885 = load %m307$.Node.type*, %m307$.Node.type** %exprs.3884
%.tmp3886 = icmp ne %m307$.Node.type* %.tmp3885, null
br i1 %.tmp3886, label %.if.true.3887, label %.if.false.3887
.if.true.3887:
%.tmp3889 = load %m307$.Node.type*, %m307$.Node.type** %exprs.3884
%.tmp3890 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3889, i32 0, i32 6
%.tmp3891 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3890
%b.3892 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp3891, %m307$.Node.type** %b.3892
br label %.for.start.3888
.for.start.3888:
%.tmp3893 = load %m307$.Node.type*, %m307$.Node.type** %b.3892
%.tmp3894 = icmp ne %m307$.Node.type* %.tmp3893, null
br i1 %.tmp3894, label %.for.continue.3888, label %.for.end.3888
.for.continue.3888:
%.tmp3895 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3896 = load %m307$.Node.type*, %m307$.Node.type** %b.3892
%.tmp3897 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3896, i32 0, i32 6
%.tmp3898 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3897
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3895, %m307$.Node.type* %.tmp3898)
%.tmp3899 = load %m307$.Node.type*, %m307$.Node.type** %b.3892
%.tmp3900 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp3899, i32 0, i32 7
%.tmp3901 = load %m307$.Node.type*, %m307$.Node.type** %.tmp3900
store %m307$.Node.type* %.tmp3901, %m307$.Node.type** %b.3892
br label %.for.start.3888
.for.end.3888:
br label %.if.end.3887
.if.false.3887:
br label %.if.end.3887
.if.end.3887:
%.tmp3902 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3902)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$get_struct_attr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.i(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp3903 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3904 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3905 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3903, %m307$.Node.type* %.tmp3904)
%val.3906 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3905, %m1861$.AssignableInfo.type** %val.3906
%.tmp3907 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3906
%.tmp3908 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3907, i32 0, i32 4
%.tmp3909 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3908
%.tmp3910 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3909, i32 0, i32 0
%.tmp3911 = load i8*, i8** %.tmp3910
%.tmp3913 = getelementptr [7 x i8], [7 x i8]*@.str3912, i32 0, i32 0
%.tmp3914 = call i32(i8*,i8*) @strcmp(i8* %.tmp3911, i8* %.tmp3913)
%.tmp3915 = icmp ne i32 %.tmp3914, 0
br i1 %.tmp3915, label %.if.true.3916, label %.if.false.3916
.if.true.3916:
%.tmp3918 = getelementptr [7 x i8], [7 x i8]*@.str3917, i32 0, i32 0
%.tmp3919 = call i32(i8*,...) @printf(i8* %.tmp3918)
%.tmp3920 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp3920
br label %.if.end.3916
.if.false.3916:
br label %.if.end.3916
.if.end.3916:
%.tmp3921 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3906
%.tmp3922 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3921, i32 0, i32 4
%.tmp3923 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3922
%.tmp3924 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3923, i32 0, i32 3
%.tmp3925 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3924
%node_type.3926 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp3925, %m1861$.Type.type** %node_type.3926
%i.3928 = alloca i32
store i32 0, i32* %i.3928
br label %.for.start.3927
.for.start.3927:
%.tmp3929 = load i32, i32* %i.3928
%.tmp3930 = load i32, i32* %attr_id
%.tmp3931 = icmp slt i32 %.tmp3929, %.tmp3930
br i1 %.tmp3931, label %.for.continue.3927, label %.for.end.3927
.for.continue.3927:
%.tmp3932 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.3926
%.tmp3933 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3932, i32 0, i32 4
%.tmp3934 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3933
store %m1861$.Type.type* %.tmp3934, %m1861$.Type.type** %node_type.3926
%.tmp3935 = load i32, i32* %i.3928
%.tmp3936 = add i32 %.tmp3935, 1
store i32 %.tmp3936, i32* %i.3928
br label %.for.start.3927
.for.end.3927:
%.tmp3937 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3938 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp3937)
%info.3939 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3938, %m1861$.AssignableInfo.type** %info.3939
%.tmp3940 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3939
%.tmp3941 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3940, i32 0, i32 4
%.tmp3942 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.3926
store %m1861$.Type.type* %.tmp3942, %m1861$.Type.type** %.tmp3941
%.tmp3943 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3944 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp3943)
%tmp_id.3945 = alloca i32
store i32 %.tmp3944, i32* %tmp_id.3945
%.tmp3946 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3947 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3906
%.tmp3948 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3947, i32 0, i32 4
%.tmp3949 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3948
%.tmp3950 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3946, %m1861$.Type.type* %.tmp3949)
%type_as_str.3951 = alloca i8*
store i8* %.tmp3950, i8** %type_as_str.3951
%.tmp3952 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3953 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3939
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp3952, %m1861$.AssignableInfo.type* %.tmp3953)
%.tmp3954 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3955 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3954, i32 0, i32 1
%.tmp3956 = load %m0$.File.type*, %m0$.File.type** %.tmp3955
%.tmp3958 = getelementptr [52 x i8], [52 x i8]*@.str3957, i32 0, i32 0
%.tmp3959 = load i32, i32* %tmp_id.3945
%.tmp3960 = load i8*, i8** %type_as_str.3951
%.tmp3961 = load i8*, i8** %type_as_str.3951
%.tmp3962 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3906
%.tmp3963 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3962)
%.tmp3964 = load i32, i32* %attr_id
%.tmp3965 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3956, i8* %.tmp3958, i32 %.tmp3959, i8* %.tmp3960, i8* %.tmp3961, i8* %.tmp3963, i32 %.tmp3964)
%.tmp3966 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3967 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp3966, i32 0, i32 1
%.tmp3968 = load %m0$.File.type*, %m0$.File.type** %.tmp3967
%.tmp3970 = getelementptr [28 x i8], [28 x i8]*@.str3969, i32 0, i32 0
%.tmp3971 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3939
%.tmp3972 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp3971)
%.tmp3973 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3974 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3939
%.tmp3975 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3974, i32 0, i32 4
%.tmp3976 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3975
%.tmp3977 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3973, %m1861$.Type.type* %.tmp3976)
%.tmp3978 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3979 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3939
%.tmp3980 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3979, i32 0, i32 4
%.tmp3981 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3980
%.tmp3982 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp3978, %m1861$.Type.type* %.tmp3981)
%.tmp3983 = load i32, i32* %tmp_id.3945
%.tmp3984 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3968, i8* %.tmp3970, i8* %.tmp3972, i8* %.tmp3977, i8* %.tmp3982, i32 %.tmp3983)
%.tmp3985 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.3939
ret %m1861$.AssignableInfo.type* %.tmp3985
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
%.tmp3986 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp3987 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp3988 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp3986, %m307$.Node.type* %.tmp3987)
%val.3989 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp3988, %m1861$.AssignableInfo.type** %val.3989
%.tmp3990 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3989
%.tmp3991 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp3990, i32 0, i32 4
%.tmp3992 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp3991
%.tmp3993 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp3992, i32 0, i32 0
%.tmp3994 = load i8*, i8** %.tmp3993
%.tmp3996 = getelementptr [7 x i8], [7 x i8]*@.str3995, i32 0, i32 0
%.tmp3997 = call i32(i8*,i8*) @strcmp(i8* %.tmp3994, i8* %.tmp3996)
%.tmp3998 = icmp ne i32 %.tmp3997, 0
br i1 %.tmp3998, label %.if.true.3999, label %.if.false.3999
.if.true.3999:
%.tmp4001 = getelementptr [7 x i8], [7 x i8]*@.str4000, i32 0, i32 0
%.tmp4002 = call i32(i8*,...) @printf(i8* %.tmp4001)
ret void
br label %.if.end.3999
.if.false.3999:
br label %.if.end.3999
.if.end.3999:
%.tmp4003 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3989
%.tmp4004 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4003, i32 0, i32 4
%.tmp4005 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4004
%.tmp4006 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4005, i32 0, i32 3
%.tmp4007 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4006
%node_type.4008 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4007, %m1861$.Type.type** %node_type.4008
%i.4010 = alloca i32
store i32 0, i32* %i.4010
br label %.for.start.4009
.for.start.4009:
%.tmp4011 = load i32, i32* %i.4010
%.tmp4012 = load i32, i32* %attr_id
%.tmp4013 = icmp slt i32 %.tmp4011, %.tmp4012
br i1 %.tmp4013, label %.for.continue.4009, label %.for.end.4009
.for.continue.4009:
%.tmp4014 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4008
%.tmp4015 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4014, i32 0, i32 4
%.tmp4016 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4015
store %m1861$.Type.type* %.tmp4016, %m1861$.Type.type** %node_type.4008
%.tmp4017 = load i32, i32* %i.4010
%.tmp4018 = add i32 %.tmp4017, 1
store i32 %.tmp4018, i32* %i.4010
br label %.for.start.4009
.for.end.4009:
%.tmp4019 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4020 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4019)
%tmp_id.4021 = alloca i32
store i32 %.tmp4020, i32* %tmp_id.4021
%.tmp4022 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4023 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3989
%.tmp4024 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4023, i32 0, i32 4
%.tmp4025 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4024
%.tmp4026 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4022, %m1861$.Type.type* %.tmp4025)
%type_as_str.4027 = alloca i8*
store i8* %.tmp4026, i8** %type_as_str.4027
%.tmp4028 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4029 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4028, i32 0, i32 1
%.tmp4030 = load %m0$.File.type*, %m0$.File.type** %.tmp4029
%.tmp4032 = getelementptr [52 x i8], [52 x i8]*@.str4031, i32 0, i32 0
%.tmp4033 = load i32, i32* %tmp_id.4021
%.tmp4034 = load i8*, i8** %type_as_str.4027
%.tmp4035 = load i8*, i8** %type_as_str.4027
%.tmp4036 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %val.3989
%.tmp4037 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4036)
%.tmp4038 = load i32, i32* %attr_id
%.tmp4039 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4030, i8* %.tmp4032, i32 %.tmp4033, i8* %.tmp4034, i8* %.tmp4035, i8* %.tmp4037, i32 %.tmp4038)
%.tmp4040 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4041 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4040, i32 0, i32 1
%.tmp4042 = load %m0$.File.type*, %m0$.File.type** %.tmp4041
%.tmp4044 = getelementptr [18 x i8], [18 x i8]*@.str4043, i32 0, i32 0
%.tmp4045 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4046 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4008
%.tmp4047 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4045, %m1861$.Type.type* %.tmp4046)
%.tmp4048 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4049 = load %m1861$.Type.type*, %m1861$.Type.type** %node_type.4008
%.tmp4050 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4048, %m1861$.Type.type* %.tmp4049)
%.tmp4051 = load i8*, i8** %attr
%.tmp4052 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4042, i8* %.tmp4044, i8* %.tmp4047, i8* %.tmp4050, i8* %.tmp4051)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4053 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4054 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4053, i32 0, i32 6
%.tmp4055 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4054
%.tmp4056 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4055, i32 0, i32 6
%.tmp4057 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4056
%dotted.4058 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4057, %m307$.Node.type** %dotted.4058
%.tmp4059 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4058
%.tmp4060 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4059, i32 0, i32 7
%.tmp4061 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4060
%.tmp4062 = icmp ne %m307$.Node.type* %.tmp4061, null
br i1 %.tmp4062, label %.if.true.4063, label %.if.false.4063
.if.true.4063:
%.tmp4064 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4064
br label %.if.end.4063
.if.false.4063:
br label %.if.end.4063
.if.end.4063:
%.tmp4065 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4058
%.tmp4066 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4065, i32 0, i32 1
%.tmp4067 = load i8*, i8** %.tmp4066
%.tmp4069 = getelementptr [7 x i8], [7 x i8]*@.str4068, i32 0, i32 0
%.tmp4070 = call i32(i8*,i8*) @strcmp(i8* %.tmp4067, i8* %.tmp4069)
%.tmp4071 = icmp eq i32 %.tmp4070, 0
br i1 %.tmp4071, label %.if.true.4072, label %.if.false.4072
.if.true.4072:
%.tmp4073 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4075 = getelementptr [8 x i8], [8 x i8]*@.str4074, i32 0, i32 0
%.tmp4076 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4073, i8* %.tmp4075)
%args.4077 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4076, %m307$.Node.type** %args.4077
%.tmp4078 = load %m307$.Node.type*, %m307$.Node.type** %args.4077
%.tmp4079 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4078, i32 0, i32 6
%.tmp4080 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4079
%.tmp4082 = getelementptr [11 x i8], [11 x i8]*@.str4081, i32 0, i32 0
%.tmp4083 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4080, i8* %.tmp4082)
%value.4084 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4083, %m307$.Node.type** %value.4084
%.tmp4085 = load %m307$.Node.type*, %m307$.Node.type** %value.4084
%.tmp4086 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4085, i32 0, i32 6
%.tmp4087 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4086
%.tmp4088 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4087, i32 0, i32 6
%.tmp4089 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4088
%.tmp4090 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4089, i32 0, i32 6
%.tmp4091 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4090
%.tmp4092 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4091, i32 0, i32 6
%.tmp4093 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4092
store %m307$.Node.type* %.tmp4093, %m307$.Node.type** %value.4084
%.tmp4094 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4095 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4094)
%tmp_id.4096 = alloca i32
store i32 %.tmp4095, i32* %tmp_id.4096
%.tmp4097 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4098 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4097)
%info.4099 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4098, %m1861$.AssignableInfo.type** %info.4099
%.tmp4100 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4101 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4099
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4100, %m1861$.AssignableInfo.type* %.tmp4101)
%.tmp4102 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4099
%.tmp4103 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4102, i32 0, i32 4
%.tmp4104 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4104, %m1861$.Type.type** %.tmp4103
%.tmp4105 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4099
%.tmp4106 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4105, i32 0, i32 4
%.tmp4107 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4106
%.tmp4108 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4107, i32 0, i32 0
%.tmp4110 = getelementptr [4 x i8], [4 x i8]*@.str4109, i32 0, i32 0
store i8* %.tmp4110, i8** %.tmp4108
%.tmp4111 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4112 = load %m307$.Node.type*, %m307$.Node.type** %value.4084
%.tmp4113 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4111, %m307$.Node.type* %.tmp4112)
%inspected_type.4114 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4113, %m1861$.Type.type** %inspected_type.4114
%.tmp4115 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4116 = load %m1861$.Type.type*, %m1861$.Type.type** %inspected_type.4114
%.tmp4117 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4115, %m1861$.Type.type* %.tmp4116)
%type_as_str.4118 = alloca i8*
store i8* %.tmp4117, i8** %type_as_str.4118
%.tmp4119 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4120 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4119, i32 0, i32 1
%.tmp4121 = load %m0$.File.type*, %m0$.File.type** %.tmp4120
%.tmp4123 = getelementptr [46 x i8], [46 x i8]*@.str4122, i32 0, i32 0
%.tmp4124 = load i32, i32* %tmp_id.4096
%.tmp4125 = load i8*, i8** %type_as_str.4118
%.tmp4126 = load i8*, i8** %type_as_str.4118
%.tmp4127 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4121, i8* %.tmp4123, i32 %.tmp4124, i8* %.tmp4125, i8* %.tmp4126)
%.tmp4128 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4129 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4128, i32 0, i32 1
%.tmp4130 = load %m0$.File.type*, %m0$.File.type** %.tmp4129
%.tmp4132 = getelementptr [35 x i8], [35 x i8]*@.str4131, i32 0, i32 0
%.tmp4133 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4099
%.tmp4134 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4133)
%.tmp4135 = load i8*, i8** %type_as_str.4118
%.tmp4136 = load i32, i32* %tmp_id.4096
%.tmp4137 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4130, i8* %.tmp4132, i8* %.tmp4134, i8* %.tmp4135, i32 %.tmp4136)
%.tmp4138 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4099
ret %m1861$.AssignableInfo.type* %.tmp4138
br label %.if.end.4072
.if.false.4072:
%.tmp4139 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4058
%.tmp4140 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4139, i32 0, i32 1
%.tmp4141 = load i8*, i8** %.tmp4140
%.tmp4143 = getelementptr [7 x i8], [7 x i8]*@.str4142, i32 0, i32 0
%.tmp4144 = call i32(i8*,i8*) @strcmp(i8* %.tmp4141, i8* %.tmp4143)
%.tmp4145 = icmp eq i32 %.tmp4144, 0
br i1 %.tmp4145, label %.if.true.4146, label %.if.false.4146
.if.true.4146:
%.tmp4147 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4149 = getelementptr [8 x i8], [8 x i8]*@.str4148, i32 0, i32 0
%.tmp4150 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4147, i8* %.tmp4149)
%args.4151 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4150, %m307$.Node.type** %args.4151
%.tmp4152 = load %m307$.Node.type*, %m307$.Node.type** %args.4151
%.tmp4153 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4152, i32 0, i32 6
%.tmp4154 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4153
%.tmp4156 = getelementptr [11 x i8], [11 x i8]*@.str4155, i32 0, i32 0
%.tmp4157 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4154, i8* %.tmp4156)
%array.4158 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4157, %m307$.Node.type** %array.4158
%.tmp4159 = load %m307$.Node.type*, %m307$.Node.type** %array.4158
%.tmp4160 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4159, i32 0, i32 7
%.tmp4161 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4160
%.tmp4163 = getelementptr [11 x i8], [11 x i8]*@.str4162, i32 0, i32 0
%.tmp4164 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4161, i8* %.tmp4163)
%value.4165 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4164, %m307$.Node.type** %value.4165
%.tmp4166 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4167 = load %m307$.Node.type*, %m307$.Node.type** %value.4165
%.tmp4168 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4166, %m307$.Node.type* %.tmp4167)
%value_info.4169 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4168, %m1861$.AssignableInfo.type** %value_info.4169
%.tmp4170 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4171 = load %m307$.Node.type*, %m307$.Node.type** %array.4158
%.tmp4172 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4170, %m307$.Node.type* %.tmp4171)
%array_info.4173 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4172, %m1861$.AssignableInfo.type** %array_info.4173
%.tmp4174 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4175 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4174)
%info.4176 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4175, %m1861$.AssignableInfo.type** %info.4176
%.tmp4177 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4178 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4176
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4177, %m1861$.AssignableInfo.type* %.tmp4178)
%.tmp4179 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4176
%.tmp4180 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4179, i32 0, i32 4
%.tmp4181 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4173
%.tmp4182 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4181, i32 0, i32 4
%.tmp4183 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4182
store %m1861$.Type.type* %.tmp4183, %m1861$.Type.type** %.tmp4180
%builtin_prefix.4184 = alloca i8*
store i8* null, i8** %builtin_prefix.4184
%.tmp4185 = getelementptr i8*, i8** %builtin_prefix.4184, i32 0
%.tmp4187 = getelementptr [5 x i8], [5 x i8]*@.str4186, i32 0, i32 0
%.tmp4188 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4189 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4188)
%.tmp4190 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4185, i8* %.tmp4187, i32 %.tmp4189)
%.tmp4191 = call i8*() @m2434$append_tmpl.cp()
%tmpl.4192 = alloca i8*
store i8* %.tmp4191, i8** %tmpl.4192
%.tmp4193 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4194 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4193, i32 0, i32 1
%.tmp4195 = load %m0$.File.type*, %m0$.File.type** %.tmp4194
%.tmp4196 = load i8*, i8** %tmpl.4192
%.tmp4197 = load i8*, i8** %builtin_prefix.4184
%.tmp4198 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4199 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4173
%.tmp4200 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4199, i32 0, i32 4
%.tmp4201 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4200
%.tmp4202 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4198, %m1861$.Type.type* %.tmp4201)
%.tmp4203 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %array_info.4173
%.tmp4204 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4203)
%.tmp4205 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4206 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4169
%.tmp4207 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4206, i32 0, i32 4
%.tmp4208 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4207
%.tmp4209 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4205, %m1861$.Type.type* %.tmp4208)
%.tmp4210 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %value_info.4169
%.tmp4211 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4210)
%.tmp4212 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4176
%.tmp4213 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4212)
%.tmp4214 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4195, i8* %.tmp4196, i8* %.tmp4197, i8* %.tmp4202, i8* %.tmp4204, i8* %.tmp4209, i8* %.tmp4211, i8* %.tmp4213)
%.tmp4215 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4216 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4215)
%info_g.4217 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4216, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4218 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4219 = load i8, i8* @SCOPE_GLOBAL
%.tmp4221 = getelementptr [8 x i8], [8 x i8]*@.str4220, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp4218, i8 %.tmp4219, i8* %.tmp4221)
%.tmp4222 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4223 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4222, i32 0, i32 4
%.tmp4224 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4224, %m1861$.Type.type** %.tmp4223
%.tmp4225 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4226 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4225, i32 0, i32 4
%.tmp4227 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4226
%.tmp4228 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4227, i32 0, i32 0
%.tmp4230 = getelementptr [9 x i8], [9 x i8]*@.str4229, i32 0, i32 0
store i8* %.tmp4230, i8** %.tmp4228
%.tmp4231 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4232 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4231, i32 0, i32 4
%.tmp4233 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4232
%.tmp4234 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4233, i32 0, i32 3
%.tmp4235 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4235, %m1861$.Type.type** %.tmp4234
%.tmp4236 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4237 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4236, i32 0, i32 4
%.tmp4238 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4237
%.tmp4239 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4238, i32 0, i32 3
%.tmp4240 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4239
%.tmp4241 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4240, i32 0, i32 0
%.tmp4243 = getelementptr [4 x i8], [4 x i8]*@.str4242, i32 0, i32 0
store i8* %.tmp4243, i8** %.tmp4241
%.tmp4244 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4245 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4244, i32 0, i32 4
%.tmp4246 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4245
%.tmp4247 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4246, i32 0, i32 3
%.tmp4248 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4247
%.tmp4249 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4248, i32 0, i32 3
%.tmp4250 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4250, %m1861$.Type.type** %.tmp4249
%.tmp4251 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4252 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4251, i32 0, i32 4
%.tmp4253 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4252
%.tmp4254 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4253, i32 0, i32 3
%.tmp4255 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4254
%.tmp4256 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4255, i32 0, i32 3
%.tmp4257 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4256
%.tmp4258 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4257, i32 0, i32 0
%.tmp4260 = getelementptr [4 x i8], [4 x i8]*@.str4259, i32 0, i32 0
store i8* %.tmp4260, i8** %.tmp4258
%.tmp4261 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4262 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4261, i32 0, i32 4
%.tmp4263 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4262
%.tmp4264 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4263, i32 0, i32 3
%.tmp4265 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4264
%.tmp4266 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4265, i32 0, i32 4
%.tmp4267 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4267, %m1861$.Type.type** %.tmp4266
%.tmp4268 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4269 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4268, i32 0, i32 4
%.tmp4270 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4269
%.tmp4271 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4270, i32 0, i32 3
%.tmp4272 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4271
%.tmp4273 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4272, i32 0, i32 4
%.tmp4274 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4273
%.tmp4275 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4274, i32 0, i32 0
%.tmp4277 = getelementptr [4 x i8], [4 x i8]*@.str4276, i32 0, i32 0
store i8* %.tmp4277, i8** %.tmp4275
%.tmp4278 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4279 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4278, i32 0, i32 4
%.tmp4280 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4279
%.tmp4281 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4280, i32 0, i32 3
%.tmp4282 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4281
%.tmp4283 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4282, i32 0, i32 4
%.tmp4284 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4283
%.tmp4285 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4284, i32 0, i32 3
%.tmp4286 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4286, %m1861$.Type.type** %.tmp4285
%.tmp4287 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4288 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4287, i32 0, i32 4
%.tmp4289 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4288
%.tmp4290 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4289, i32 0, i32 3
%.tmp4291 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4290
%.tmp4292 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4291, i32 0, i32 4
%.tmp4293 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4292
%.tmp4294 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4293, i32 0, i32 3
%.tmp4295 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4294
%.tmp4296 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4295, i32 0, i32 0
%.tmp4298 = getelementptr [4 x i8], [4 x i8]*@.str4297, i32 0, i32 0
store i8* %.tmp4298, i8** %.tmp4296
%.tmp4299 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4300 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4299, i32 0, i32 4
%.tmp4301 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4300
%.tmp4302 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4301, i32 0, i32 3
%.tmp4303 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4302
%.tmp4304 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4303, i32 0, i32 4
%.tmp4305 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4304
%.tmp4306 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4305, i32 0, i32 4
%.tmp4307 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp4307, %m1861$.Type.type** %.tmp4306
%.tmp4308 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
%.tmp4309 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4308, i32 0, i32 4
%.tmp4310 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4309
%.tmp4311 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4310, i32 0, i32 3
%.tmp4312 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4311
%.tmp4313 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4312, i32 0, i32 4
%.tmp4314 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4313
%.tmp4315 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4314, i32 0, i32 4
%.tmp4316 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4315
%.tmp4317 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4316, i32 0, i32 0
%.tmp4319 = getelementptr [4 x i8], [4 x i8]*@.str4318, i32 0, i32 0
store i8* %.tmp4319, i8** %.tmp4317
%.tmp4320 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4322 = getelementptr [8 x i8], [8 x i8]*@.str4321, i32 0, i32 0
%.tmp4324 = getelementptr [7 x i8], [7 x i8]*@.str4323, i32 0, i32 0
%.tmp4325 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info_g.4217
call void(%m1861$.CompilerCtx.type*,i8*,i8*,%m1861$.AssignableInfo.type*,i1,i1) @m1861$define_global.v.m1861$.CompilerCtx.typep.cp.cp.m1861$.AssignableInfo.typep.b.b(%m1861$.CompilerCtx.type* %.tmp4320, i8* %.tmp4322, i8* %.tmp4324, %m1861$.AssignableInfo.type* %.tmp4325, i1 1, i1 0)
%.tmp4326 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4176
ret %m1861$.AssignableInfo.type* %.tmp4326
br label %.if.end.4146
.if.false.4146:
%.tmp4327 = load %m307$.Node.type*, %m307$.Node.type** %dotted.4058
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
br label %.if.end.4146
.if.end.4146:
br label %.if.end.4072
.if.end.4072:
%.tmp4350 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4350
}
define i8* @m1861$resolve_import_path.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp4352 = getelementptr [1 x i8], [1 x i8]*@.str4351, i32 0, i32 0
%err_buf.4353 = alloca i8*
store i8* %.tmp4352, i8** %err_buf.4353
%.tmp4354 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4355 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4354, i32 0, i32 7
%.tmp4356 = load i8*, i8** %.tmp4355
%mod_abspath.4357 = alloca i8*
store i8* %.tmp4356, i8** %mod_abspath.4357
%.tmp4358 = load i8*, i8** %mod_abspath.4357
%.tmp4359 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp4358)
%dirname.4360 = alloca i8*
store i8* %.tmp4359, i8** %dirname.4360
%.tmp4361 = load i8*, i8** %import_str
%.tmp4362 = getelementptr i8, i8* %.tmp4361, i32 0
%.tmp4363 = load i8, i8* %.tmp4362
%.tmp4364 = icmp eq i8 %.tmp4363, 47
br i1 %.tmp4364, label %.if.true.4365, label %.if.false.4365
.if.true.4365:
%.tmp4366 = getelementptr i8*, i8** %err_buf.4353, i32 0
%.tmp4368 = getelementptr [46 x i8], [46 x i8]*@.str4367, i32 0, i32 0
%.tmp4369 = load i8*, i8** %import_str
%.tmp4370 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4366, i8* %.tmp4368, i8* %.tmp4369)
%.tmp4371 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4372 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4373 = load i8*, i8** %err_buf.4353
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4371, %m307$.Node.type* %.tmp4372, i8* %.tmp4373)
%.tmp4374 = bitcast ptr null to i8*
ret i8* %.tmp4374
br label %.if.end.4365
.if.false.4365:
br label %.if.end.4365
.if.end.4365:
%.tmp4375 = load i8*, i8** %import_str
%.tmp4376 = getelementptr i8, i8* %.tmp4375, i32 0
%.tmp4377 = load i8, i8* %.tmp4376
%.tmp4378 = icmp ne i8 %.tmp4377, 46
%.tmp4379 = load i8*, i8** %import_str
%.tmp4380 = getelementptr i8, i8* %.tmp4379, i32 1
%.tmp4381 = load i8, i8* %.tmp4380
%.tmp4382 = icmp ne i8 %.tmp4381, 47
%.tmp4383 = and i1 %.tmp4378, %.tmp4382
br i1 %.tmp4383, label %.if.true.4384, label %.if.false.4384
.if.true.4384:
%.tmp4385 = call i8*() @m1861$get_root.cp()
%root.4386 = alloca i8*
store i8* %.tmp4385, i8** %root.4386
%.tmp4387 = getelementptr i8*, i8** %mod_abspath.4357, i32 0
%.tmp4389 = getelementptr [13 x i8], [13 x i8]*@.str4388, i32 0, i32 0
%.tmp4390 = load i8*, i8** %root.4386
%.tmp4391 = load i8*, i8** %import_str
%.tmp4392 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4387, i8* %.tmp4389, i8* %.tmp4390, i8* %.tmp4391)
br label %.if.end.4384
.if.false.4384:
%.tmp4393 = load i8*, i8** %dirname.4360
%.tmp4395 = getelementptr [1 x i8], [1 x i8]*@.str4394, i32 0, i32 0
%.tmp4396 = call i32(i8*,i8*) @strcmp(i8* %.tmp4393, i8* %.tmp4395)
%.tmp4397 = icmp eq i32 %.tmp4396, 0
br i1 %.tmp4397, label %.if.true.4398, label %.if.false.4398
.if.true.4398:
%.tmp4399 = getelementptr i8*, i8** %mod_abspath.4357, i32 0
%.tmp4401 = getelementptr [6 x i8], [6 x i8]*@.str4400, i32 0, i32 0
%.tmp4402 = load i8*, i8** %import_str
%.tmp4403 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4399, i8* %.tmp4401, i8* %.tmp4402)
br label %.if.end.4398
.if.false.4398:
%.tmp4404 = getelementptr i8*, i8** %mod_abspath.4357, i32 0
%.tmp4406 = getelementptr [9 x i8], [9 x i8]*@.str4405, i32 0, i32 0
%.tmp4407 = load i8*, i8** %dirname.4360
%.tmp4408 = load i8*, i8** %import_str
%.tmp4409 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4404, i8* %.tmp4406, i8* %.tmp4407, i8* %.tmp4408)
br label %.if.end.4398
.if.end.4398:
br label %.if.end.4384
.if.end.4384:
%.tmp4410 = load i8*, i8** %mod_abspath.4357
ret i8* %.tmp4410
}
define %m1861$.AssignableInfo.type* @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp4411 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4412 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4413 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_builtin.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4411, %m307$.Node.type* %.tmp4412)
%info.4414 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4413, %m1861$.AssignableInfo.type** %info.4414
%.tmp4415 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4416 = icmp ne %m1861$.AssignableInfo.type* %.tmp4415, null
br i1 %.tmp4416, label %.if.true.4417, label %.if.false.4417
.if.true.4417:
%.tmp4418 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
ret %m1861$.AssignableInfo.type* %.tmp4418
br label %.if.end.4417
.if.false.4417:
br label %.if.end.4417
.if.end.4417:
%.tmp4419 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4420 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4421 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4419, %m307$.Node.type* %.tmp4420)
store %m1861$.AssignableInfo.type* %.tmp4421, %m1861$.AssignableInfo.type** %info.4414
%.tmp4422 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4423 = icmp eq %m1861$.AssignableInfo.type* %.tmp4422, null
br i1 %.tmp4423, label %.if.true.4424, label %.if.false.4424
.if.true.4424:
%.tmp4425 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4425, label %.if.true.4426, label %.if.false.4426
.if.true.4426:
%.tmp4427 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4428 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4430 = getelementptr [35 x i8], [35 x i8]*@.str4429, i32 0, i32 0
%.tmp4431 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4427, %m307$.Node.type* %.tmp4428, i8* %.tmp4430)
%.tmp4432 = call i32(i8*,...) @printf(i8* %.tmp4431)
br label %.if.end.4426
.if.false.4426:
br label %.if.end.4426
.if.end.4426:
%.tmp4433 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4433
br label %.if.end.4424
.if.false.4424:
br label %.if.end.4424
.if.end.4424:
%.tmp4434 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4436 = getelementptr [8 x i8], [8 x i8]*@.str4435, i32 0, i32 0
%.tmp4437 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4434, i8* %.tmp4436)
%args.4438 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4437, %m307$.Node.type** %args.4438
%.tmp4440 = getelementptr [1 x i8], [1 x i8]*@.str4439, i32 0, i32 0
%params_buff.4441 = alloca i8*
store i8* %.tmp4440, i8** %params_buff.4441
%tmp.4442 = alloca i8*
store i8* null, i8** %tmp.4442
%.tmp4443 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4444 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4443, i32 0, i32 4
%.tmp4445 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4444
%.tmp4446 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4445, i32 0, i32 0
%.tmp4447 = load i8*, i8** %.tmp4446
%.tmp4449 = getelementptr [4 x i8], [4 x i8]*@.str4448, i32 0, i32 0
%.tmp4450 = call i32(i8*,i8*) @strcmp(i8* %.tmp4447, i8* %.tmp4449)
%.tmp4451 = icmp eq i32 %.tmp4450, 0
br i1 %.tmp4451, label %.if.true.4452, label %.if.false.4452
.if.true.4452:
%.tmp4453 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4454 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4453)
%new_info.4455 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4454, %m1861$.AssignableInfo.type** %new_info.4455
%.tmp4456 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4457 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.4455
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4456, %m1861$.AssignableInfo.type* %.tmp4457)
%.tmp4458 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.4455
%.tmp4459 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4458, i32 0, i32 4
%.tmp4460 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4461 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4460, i32 0, i32 4
%.tmp4462 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4461
%.tmp4463 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4462, i32 0, i32 3
%.tmp4464 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4463
store %m1861$.Type.type* %.tmp4464, %m1861$.Type.type** %.tmp4459
%.tmp4465 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4466 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4465, i32 0, i32 1
%.tmp4467 = load %m0$.File.type*, %m0$.File.type** %.tmp4466
%.tmp4469 = getelementptr [22 x i8], [22 x i8]*@.str4468, i32 0, i32 0
%.tmp4470 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.4455
%.tmp4471 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4470)
%.tmp4472 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4473 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4474 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4473, i32 0, i32 4
%.tmp4475 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4474
%.tmp4476 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4472, %m1861$.Type.type* %.tmp4475)
%.tmp4477 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4478 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4479 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4478, i32 0, i32 4
%.tmp4480 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4479
%.tmp4481 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4477, %m1861$.Type.type* %.tmp4480)
%.tmp4482 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4483 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4482)
%.tmp4484 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4467, i8* %.tmp4469, i8* %.tmp4471, i8* %.tmp4476, i8* %.tmp4481, i8* %.tmp4483)
%.tmp4485 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.4455
store %m1861$.AssignableInfo.type* %.tmp4485, %m1861$.AssignableInfo.type** %info.4414
br label %.if.end.4452
.if.false.4452:
br label %.if.end.4452
.if.end.4452:
%.tmp4486 = load %m307$.Node.type*, %m307$.Node.type** %args.4438
%.tmp4487 = icmp ne %m307$.Node.type* %.tmp4486, null
br i1 %.tmp4487, label %.if.true.4488, label %.if.false.4488
.if.true.4488:
%.tmp4489 = load %m307$.Node.type*, %m307$.Node.type** %args.4438
%.tmp4490 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4489, i32 0, i32 6
%.tmp4491 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4490
%.tmp4493 = getelementptr [11 x i8], [11 x i8]*@.str4492, i32 0, i32 0
%.tmp4494 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4491, i8* %.tmp4493)
%start.4495 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4494, %m307$.Node.type** %start.4495
%argno.4496 = alloca i32
store i32 1, i32* %argno.4496
%.tmp4497 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4498 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4497, i32 0, i32 4
%.tmp4499 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4498
%.tmp4500 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4499, i32 0, i32 3
%.tmp4501 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4500
%.tmp4502 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4501, i32 0, i32 4
%.tmp4503 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4502
%expect_type.4504 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4503, %m1861$.Type.type** %expect_type.4504
%provided_args.4505 = alloca i32
store i32 0, i32* %provided_args.4505
%.tmp4507 = load %m307$.Node.type*, %m307$.Node.type** %start.4495
%pp.4508 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4507, %m307$.Node.type** %pp.4508
br label %.for.start.4506
.for.start.4506:
%.tmp4509 = load %m307$.Node.type*, %m307$.Node.type** %pp.4508
%.tmp4510 = icmp ne %m307$.Node.type* %.tmp4509, null
br i1 %.tmp4510, label %.for.continue.4506, label %.for.end.4506
.for.continue.4506:
%.tmp4511 = load i32, i32* %provided_args.4505
%.tmp4512 = add i32 %.tmp4511, 1
store i32 %.tmp4512, i32* %provided_args.4505
%.tmp4513 = load %m307$.Node.type*, %m307$.Node.type** %pp.4508
%.tmp4514 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4513, i32 0, i32 7
%.tmp4515 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4514
%.tmp4517 = getelementptr [11 x i8], [11 x i8]*@.str4516, i32 0, i32 0
%.tmp4518 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4515, i8* %.tmp4517)
store %m307$.Node.type* %.tmp4518, %m307$.Node.type** %pp.4508
br label %.for.start.4506
.for.end.4506:
%.tmp4520 = load %m307$.Node.type*, %m307$.Node.type** %start.4495
%pp.4521 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp4520, %m307$.Node.type** %pp.4521
br label %.for.start.4519
.for.start.4519:
%.tmp4522 = load %m307$.Node.type*, %m307$.Node.type** %pp.4521
%.tmp4523 = icmp ne %m307$.Node.type* %.tmp4522, null
br i1 %.tmp4523, label %.for.continue.4519, label %.for.end.4519
.for.continue.4519:
%.tmp4524 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4504
%.tmp4525 = icmp eq %m1861$.Type.type* %.tmp4524, null
br i1 %.tmp4525, label %.if.true.4526, label %.if.false.4526
.if.true.4526:
%.tmp4527 = getelementptr i8*, i8** %tmp.4442, i32 0
%.tmp4529 = getelementptr [43 x i8], [43 x i8]*@.str4528, i32 0, i32 0
%.tmp4530 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4531 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4530, i32 0, i32 2
%.tmp4532 = load i8*, i8** %.tmp4531
%.tmp4533 = load i32, i32* %argno.4496
%.tmp4534 = sub i32 %.tmp4533, 1
%.tmp4535 = load i32, i32* %provided_args.4505
%.tmp4536 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4527, i8* %.tmp4529, i8* %.tmp4532, i32 %.tmp4534, i32 %.tmp4535)
%.tmp4537 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4538 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4539 = load i8*, i8** %tmp.4442
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4537, %m307$.Node.type* %.tmp4538, i8* %.tmp4539)
%.tmp4540 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4540
br label %.if.end.4526
.if.false.4526:
br label %.if.end.4526
.if.end.4526:
%.tmp4541 = load %m307$.Node.type*, %m307$.Node.type** %pp.4521
%.tmp4542 = load %m307$.Node.type*, %m307$.Node.type** %start.4495
%.tmp4543 = icmp ne %m307$.Node.type* %.tmp4541, %.tmp4542
br i1 %.tmp4543, label %.if.true.4544, label %.if.false.4544
.if.true.4544:
%.tmp4545 = getelementptr i8*, i8** %tmp.4442, i32 0
%.tmp4547 = getelementptr [5 x i8], [5 x i8]*@.str4546, i32 0, i32 0
%.tmp4548 = load i8*, i8** %params_buff.4441
%.tmp4549 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4545, i8* %.tmp4547, i8* %.tmp4548)
%.tmp4550 = load i8*, i8** %params_buff.4441
%tmp_buff.4551 = alloca i8*
store i8* %.tmp4550, i8** %tmp_buff.4551
%.tmp4552 = load i8*, i8** %tmp.4442
store i8* %.tmp4552, i8** %params_buff.4441
%.tmp4553 = load i8*, i8** %tmp_buff.4551
store i8* %.tmp4553, i8** %tmp.4442
%.tmp4554 = load i8*, i8** %tmp.4442
call void(i8*) @free(i8* %.tmp4554)
br label %.if.end.4544
.if.false.4544:
br label %.if.end.4544
.if.end.4544:
%.tmp4555 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4556 = load %m307$.Node.type*, %m307$.Node.type** %pp.4521
%.tmp4557 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4555, %m307$.Node.type* %.tmp4556)
%a_info.4558 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4557, %m1861$.AssignableInfo.type** %a_info.4558
%.tmp4559 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4558
%.tmp4560 = icmp eq %m1861$.AssignableInfo.type* %.tmp4559, null
br i1 %.tmp4560, label %.if.true.4561, label %.if.false.4561
.if.true.4561:
%.tmp4562 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4562
br label %.if.end.4561
.if.false.4561:
br label %.if.end.4561
.if.end.4561:
%.tmp4563 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4504
%.tmp4564 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp4563)
%exp.4565 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4564, %m1861$.Type.type** %exp.4565
%.tmp4566 = load %m1861$.Type.type*, %m1861$.Type.type** %exp.4565
%.tmp4567 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4566, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp4567
%.tmp4568 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4504
%.tmp4569 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4568, i32 0, i32 0
%.tmp4570 = load i8*, i8** %.tmp4569
%.tmp4572 = getelementptr [7 x i8], [7 x i8]*@.str4571, i32 0, i32 0
%.tmp4573 = call i32(i8*,i8*) @strcmp(i8* %.tmp4570, i8* %.tmp4572)
%.tmp4574 = icmp ne i32 %.tmp4573, 0
%.tmp4575 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4576 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4558
%.tmp4577 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4576, i32 0, i32 4
%.tmp4578 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4577
%.tmp4579 = load %m1861$.Type.type*, %m1861$.Type.type** %exp.4565
%.tmp4580 = call i1(%m1861$.CompilerCtx.type*,%m1861$.Type.type*,%m1861$.Type.type*) @m1861$is_same_type.b.m1861$.CompilerCtx.typep.m1861$.Type.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4575, %m1861$.Type.type* %.tmp4578, %m1861$.Type.type* %.tmp4579)
%.tmp4581 = icmp eq i1 %.tmp4580, 0
%.tmp4582 = and i1 %.tmp4574, %.tmp4581
br i1 %.tmp4582, label %.if.true.4583, label %.if.false.4583
.if.true.4583:
%.tmp4585 = getelementptr [1 x i8], [1 x i8]*@.str4584, i32 0, i32 0
%err_buf.4586 = alloca i8*
store i8* %.tmp4585, i8** %err_buf.4586
%.tmp4587 = getelementptr i8*, i8** %err_buf.4586, i32 0
%.tmp4589 = getelementptr [52 x i8], [52 x i8]*@.str4588, i32 0, i32 0
%.tmp4590 = load i32, i32* %argno.4496
%.tmp4591 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4592 = load %m1861$.Type.type*, %m1861$.Type.type** %exp.4565
%.tmp4593 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4591, %m1861$.Type.type* %.tmp4592)
%.tmp4594 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4595 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4558
%.tmp4596 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4595, i32 0, i32 4
%.tmp4597 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4596
%.tmp4598 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4594, %m1861$.Type.type* %.tmp4597)
%.tmp4599 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4587, i8* %.tmp4589, i32 %.tmp4590, i8* %.tmp4593, i8* %.tmp4598)
%.tmp4600 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4601 = load %m307$.Node.type*, %m307$.Node.type** %pp.4521
%.tmp4602 = load i8*, i8** %err_buf.4586
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4600, %m307$.Node.type* %.tmp4601, i8* %.tmp4602)
%.tmp4603 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4603
br label %.if.end.4583
.if.false.4583:
br label %.if.end.4583
.if.end.4583:
%.tmp4604 = getelementptr i8*, i8** %params_buff.4441, i32 0
%.tmp4606 = getelementptr [8 x i8], [8 x i8]*@.str4605, i32 0, i32 0
%.tmp4607 = load i8*, i8** %params_buff.4441
%.tmp4608 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4609 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4558
%.tmp4610 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4609, i32 0, i32 4
%.tmp4611 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4610
%.tmp4612 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4608, %m1861$.Type.type* %.tmp4611)
%.tmp4613 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4558
%.tmp4614 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4613)
%.tmp4615 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4604, i8* %.tmp4606, i8* %.tmp4607, i8* %.tmp4612, i8* %.tmp4614)
%.tmp4616 = load %m307$.Node.type*, %m307$.Node.type** %pp.4521
%.tmp4617 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4616, i32 0, i32 7
%.tmp4618 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4617
store %m307$.Node.type* %.tmp4618, %m307$.Node.type** %pp.4521
%.tmp4619 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4504
%.tmp4620 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4619, i32 0, i32 0
%.tmp4621 = load i8*, i8** %.tmp4620
%.tmp4623 = getelementptr [7 x i8], [7 x i8]*@.str4622, i32 0, i32 0
%.tmp4624 = call i32(i8*,i8*) @strcmp(i8* %.tmp4621, i8* %.tmp4623)
%.tmp4625 = icmp ne i32 %.tmp4624, 0
br i1 %.tmp4625, label %.if.true.4626, label %.if.false.4626
.if.true.4626:
%.tmp4627 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4504
%.tmp4628 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4627, i32 0, i32 4
%.tmp4629 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4628
store %m1861$.Type.type* %.tmp4629, %m1861$.Type.type** %expect_type.4504
br label %.if.end.4626
.if.false.4626:
br label %.if.end.4626
.if.end.4626:
%.tmp4630 = load i32, i32* %argno.4496
%.tmp4631 = add i32 %.tmp4630, 1
store i32 %.tmp4631, i32* %argno.4496
%.tmp4632 = load %m307$.Node.type*, %m307$.Node.type** %pp.4521
%.tmp4634 = getelementptr [11 x i8], [11 x i8]*@.str4633, i32 0, i32 0
%.tmp4635 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4632, i8* %.tmp4634)
store %m307$.Node.type* %.tmp4635, %m307$.Node.type** %pp.4521
br label %.for.start.4519
.for.end.4519:
%.tmp4636 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4504
%.tmp4637 = icmp ne %m1861$.Type.type* %.tmp4636, null
br i1 %.tmp4637, label %.if.true.4638, label %.if.false.4638
.if.true.4638:
%.tmp4639 = load %m1861$.Type.type*, %m1861$.Type.type** %expect_type.4504
%.tmp4640 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4639, i32 0, i32 0
%.tmp4641 = load i8*, i8** %.tmp4640
%.tmp4643 = getelementptr [7 x i8], [7 x i8]*@.str4642, i32 0, i32 0
%.tmp4644 = call i32(i8*,i8*) @strcmp(i8* %.tmp4641, i8* %.tmp4643)
%.tmp4645 = icmp ne i32 %.tmp4644, 0
br i1 %.tmp4645, label %.if.true.4646, label %.if.false.4646
.if.true.4646:
%.tmp4647 = getelementptr i8*, i8** %tmp.4442, i32 0
%.tmp4649 = getelementptr [43 x i8], [43 x i8]*@.str4648, i32 0, i32 0
%.tmp4650 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4651 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4650, i32 0, i32 2
%.tmp4652 = load i8*, i8** %.tmp4651
%.tmp4653 = load i32, i32* %argno.4496
%.tmp4654 = load i32, i32* %provided_args.4505
%.tmp4655 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4647, i8* %.tmp4649, i8* %.tmp4652, i32 %.tmp4653, i32 %.tmp4654)
%.tmp4656 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4657 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4658 = load i8*, i8** %tmp.4442
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4656, %m307$.Node.type* %.tmp4657, i8* %.tmp4658)
%.tmp4659 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4659
br label %.if.end.4646
.if.false.4646:
br label %.if.end.4646
.if.end.4646:
br label %.if.end.4638
.if.false.4638:
br label %.if.end.4638
.if.end.4638:
br label %.if.end.4488
.if.false.4488:
%.tmp4660 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4661 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4660, i32 0, i32 4
%.tmp4662 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4661
%.tmp4663 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4662, i32 0, i32 3
%.tmp4664 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4663
%.tmp4665 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4664, i32 0, i32 4
%.tmp4666 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4665
%.tmp4667 = icmp ne %m1861$.Type.type* %.tmp4666, null
br i1 %.tmp4667, label %.if.true.4668, label %.if.false.4668
.if.true.4668:
%args_required.4669 = alloca i32
store i32 0, i32* %args_required.4669
%.tmp4671 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4672 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4671, i32 0, i32 4
%.tmp4673 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4672
%.tmp4674 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4673, i32 0, i32 3
%.tmp4675 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4674
%.tmp4676 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4675, i32 0, i32 4
%.tmp4677 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4676
%pp.4678 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp4677, %m1861$.Type.type** %pp.4678
br label %.for.start.4670
.for.start.4670:
%.tmp4679 = load %m1861$.Type.type*, %m1861$.Type.type** %pp.4678
%.tmp4680 = icmp ne %m1861$.Type.type* %.tmp4679, null
br i1 %.tmp4680, label %.for.continue.4670, label %.for.else.4670
.for.continue.4670:
%.tmp4681 = load %m1861$.Type.type*, %m1861$.Type.type** %pp.4678
%.tmp4682 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4681, i32 0, i32 0
%.tmp4683 = load i8*, i8** %.tmp4682
%.tmp4685 = getelementptr [7 x i8], [7 x i8]*@.str4684, i32 0, i32 0
%.tmp4686 = call i32(i8*,i8*) @strcmp(i8* %.tmp4683, i8* %.tmp4685)
%.tmp4687 = icmp eq i32 %.tmp4686, 0
br i1 %.tmp4687, label %.if.true.4688, label %.if.false.4688
.if.true.4688:
br label %.for.end.4670
br label %.if.end.4688
.if.false.4688:
br label %.if.end.4688
.if.end.4688:
%.tmp4689 = load i32, i32* %args_required.4669
%.tmp4690 = add i32 %.tmp4689, 1
store i32 %.tmp4690, i32* %args_required.4669
%.tmp4691 = load %m1861$.Type.type*, %m1861$.Type.type** %pp.4678
%.tmp4692 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4691, i32 0, i32 4
%.tmp4693 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4692
store %m1861$.Type.type* %.tmp4693, %m1861$.Type.type** %pp.4678
br label %.for.start.4670
.for.else.4670:
%.tmp4694 = getelementptr i8*, i8** %tmp.4442, i32 0
%.tmp4696 = getelementptr [42 x i8], [42 x i8]*@.str4695, i32 0, i32 0
%.tmp4697 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4698 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4697, i32 0, i32 2
%.tmp4699 = load i8*, i8** %.tmp4698
%.tmp4700 = load i32, i32* %args_required.4669
%.tmp4701 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4694, i8* %.tmp4696, i8* %.tmp4699, i32 %.tmp4700)
%.tmp4702 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4703 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4704 = load i8*, i8** %tmp.4442
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4702, %m307$.Node.type* %.tmp4703, i8* %.tmp4704)
%.tmp4705 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4705
br label %.for.end.4670
.for.end.4670:
br label %.if.end.4668
.if.false.4668:
br label %.if.end.4668
.if.end.4668:
br label %.if.end.4488
.if.end.4488:
%.tmp4706 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4707 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4708 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4707, i32 0, i32 4
%.tmp4709 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4708
%.tmp4710 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4709, i32 0, i32 3
%.tmp4711 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4710
%.tmp4712 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4706, %m1861$.Type.type* %.tmp4711)
%.tmp4714 = getelementptr [5 x i8], [5 x i8]*@.str4713, i32 0, i32 0
%.tmp4715 = call i32(i8*,i8*) @strcmp(i8* %.tmp4712, i8* %.tmp4714)
%.tmp4716 = icmp eq i32 %.tmp4715, 0
br i1 %.tmp4716, label %.if.true.4717, label %.if.false.4717
.if.true.4717:
%.tmp4718 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4719 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4718, i32 0, i32 1
%.tmp4720 = load %m0$.File.type*, %m0$.File.type** %.tmp4719
%.tmp4722 = getelementptr [16 x i8], [16 x i8]*@.str4721, i32 0, i32 0
%.tmp4723 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4724 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4725 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4724, i32 0, i32 4
%.tmp4726 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4725
%.tmp4727 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4723, %m1861$.Type.type* %.tmp4726)
%.tmp4728 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4729 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4728)
%.tmp4730 = load i8*, i8** %params_buff.4441
%.tmp4731 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4720, i8* %.tmp4722, i8* %.tmp4727, i8* %.tmp4729, i8* %.tmp4730)
%.tmp4732 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4732
br label %.if.end.4717
.if.false.4717:
br label %.if.end.4717
.if.end.4717:
%.tmp4733 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4734 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp4733)
%call_info.4735 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4734, %m1861$.AssignableInfo.type** %call_info.4735
%.tmp4736 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4737 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4735
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp4736, %m1861$.AssignableInfo.type* %.tmp4737)
%.tmp4738 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4735
%.tmp4739 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4738, i32 0, i32 4
%.tmp4740 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4741 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4740, i32 0, i32 4
%.tmp4742 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4741
%.tmp4743 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4742, i32 0, i32 3
%.tmp4744 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4743
%.tmp4745 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp4744)
store %m1861$.Type.type* %.tmp4745, %m1861$.Type.type** %.tmp4739
%.tmp4746 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4735
%.tmp4747 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4746, i32 0, i32 4
%.tmp4748 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4747
%.tmp4749 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp4748, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp4749
%.tmp4750 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4751 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4750, i32 0, i32 1
%.tmp4752 = load %m0$.File.type*, %m0$.File.type** %.tmp4751
%.tmp4754 = getelementptr [21 x i8], [21 x i8]*@.str4753, i32 0, i32 0
%.tmp4755 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4735
%.tmp4756 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4755)
%.tmp4757 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4758 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4759 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4758, i32 0, i32 4
%.tmp4760 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4759
%.tmp4761 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4757, %m1861$.Type.type* %.tmp4760)
%.tmp4762 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4414
%.tmp4763 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4762)
%.tmp4764 = load i8*, i8** %params_buff.4441
%.tmp4765 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4752, i8* %.tmp4754, i8* %.tmp4756, i8* %.tmp4761, i8* %.tmp4763, i8* %.tmp4764)
%.tmp4766 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %call_info.4735
%.tmp4767 = bitcast %m1861$.AssignableInfo.type* %.tmp4766 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp4767
}
define void @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.4768 = alloca i8*
store i8* null, i8** %err_msg.4768
%.tmp4769 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4770 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4769, i32 0, i32 0
%.tmp4771 = load i8*, i8** %.tmp4770
%expr_type.4772 = alloca i8*
store i8* %.tmp4771, i8** %expr_type.4772
%.tmp4773 = bitcast ptr null to %m1861$.AssignableInfo.type*
%info.4774 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4773, %m1861$.AssignableInfo.type** %info.4774
%assignable.4775 = alloca %m307$.Node.type*
store %m307$.Node.type* null, %m307$.Node.type** %assignable.4775
%.tmp4776 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.4777 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4776, %m1861$.AssignableInfo.type** %a_info.4777
%.tmp4778 = load i8*, i8** %expr_type.4772
%.tmp4780 = getelementptr [7 x i8], [7 x i8]*@.str4779, i32 0, i32 0
%.tmp4781 = call i32(i8*,i8*) @strcmp(i8* %.tmp4778, i8* %.tmp4780)
%.tmp4782 = icmp eq i32 %.tmp4781, 0
br i1 %.tmp4782, label %.if.true.4783, label %.if.false.4783
.if.true.4783:
%.tmp4784 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4785 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4784, i32 0, i32 6
%.tmp4786 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4785
%.tmp4787 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4786, i32 0, i32 7
%.tmp4788 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4787
%.tmp4789 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4788, i32 0, i32 0
%.tmp4790 = load i8*, i8** %.tmp4789
%.tmp4792 = getelementptr [3 x i8], [3 x i8]*@.str4791, i32 0, i32 0
%.tmp4793 = call i32(i8*,i8*) @strcmp(i8* %.tmp4790, i8* %.tmp4792)
%.tmp4794 = icmp ne i32 %.tmp4793, 0
br i1 %.tmp4794, label %.if.true.4795, label %.if.false.4795
.if.true.4795:
%.tmp4796 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4797 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4798 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4797, i32 0, i32 6
%.tmp4799 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4798
%.tmp4800 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4799, i32 0, i32 7
%.tmp4801 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4800
%.tmp4802 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4796, %m307$.Node.type* %.tmp4801)
store %m1861$.AssignableInfo.type* %.tmp4802, %m1861$.AssignableInfo.type** %info.4774
%.tmp4803 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4774
%.tmp4804 = icmp eq %m1861$.AssignableInfo.type* %.tmp4803, null
br i1 %.tmp4804, label %.if.true.4805, label %.if.false.4805
.if.true.4805:
ret void
br label %.if.end.4805
.if.false.4805:
br label %.if.end.4805
.if.end.4805:
%.tmp4806 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4807 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4806, i32 0, i32 1
%.tmp4808 = load %m0$.File.type*, %m0$.File.type** %.tmp4807
%.tmp4810 = getelementptr [11 x i8], [11 x i8]*@.str4809, i32 0, i32 0
%.tmp4811 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4812 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4774
%.tmp4813 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4812, i32 0, i32 4
%.tmp4814 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4813
%.tmp4815 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4811, %m1861$.Type.type* %.tmp4814)
%.tmp4816 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.4774
%.tmp4817 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4816)
%.tmp4818 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4808, i8* %.tmp4810, i8* %.tmp4815, i8* %.tmp4817)
br label %.if.end.4795
.if.false.4795:
%.tmp4819 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4820 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4819, i32 0, i32 1
%.tmp4821 = load %m0$.File.type*, %m0$.File.type** %.tmp4820
%.tmp4823 = getelementptr [10 x i8], [10 x i8]*@.str4822, i32 0, i32 0
%.tmp4824 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4821, i8* %.tmp4823)
br label %.if.end.4795
.if.end.4795:
br label %.if.end.4783
.if.false.4783:
%.tmp4825 = load i8*, i8** %expr_type.4772
%.tmp4827 = getelementptr [3 x i8], [3 x i8]*@.str4826, i32 0, i32 0
%.tmp4828 = call i32(i8*,i8*) @strcmp(i8* %.tmp4825, i8* %.tmp4827)
%.tmp4829 = icmp eq i32 %.tmp4828, 0
br i1 %.tmp4829, label %.if.true.4830, label %.if.false.4830
.if.true.4830:
br label %.if.end.4830
.if.false.4830:
%.tmp4831 = load i8*, i8** %expr_type.4772
%.tmp4833 = getelementptr [8 x i8], [8 x i8]*@.str4832, i32 0, i32 0
%.tmp4834 = call i32(i8*,i8*) @strcmp(i8* %.tmp4831, i8* %.tmp4833)
%.tmp4835 = icmp eq i32 %.tmp4834, 0
br i1 %.tmp4835, label %.if.true.4836, label %.if.false.4836
.if.true.4836:
%.tmp4837 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4838 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4839 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4838, i32 0, i32 6
%.tmp4840 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4839
%.tmp4841 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4837, %m307$.Node.type* %.tmp4840)
br label %.if.end.4836
.if.false.4836:
%.tmp4842 = load i8*, i8** %expr_type.4772
%.tmp4844 = getelementptr [12 x i8], [12 x i8]*@.str4843, i32 0, i32 0
%.tmp4845 = call i32(i8*,i8*) @strcmp(i8* %.tmp4842, i8* %.tmp4844)
%.tmp4846 = icmp eq i32 %.tmp4845, 0
br i1 %.tmp4846, label %.if.true.4847, label %.if.false.4847
.if.true.4847:
%.tmp4848 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4849 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4850 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4848, %m307$.Node.type* %.tmp4849)
br label %.if.end.4847
.if.false.4847:
%.tmp4851 = load i8*, i8** %expr_type.4772
%.tmp4853 = getelementptr [11 x i8], [11 x i8]*@.str4852, i32 0, i32 0
%.tmp4854 = call i32(i8*,i8*) @strcmp(i8* %.tmp4851, i8* %.tmp4853)
%.tmp4855 = icmp eq i32 %.tmp4854, 0
br i1 %.tmp4855, label %.if.true.4856, label %.if.false.4856
.if.true.4856:
%.tmp4857 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4858 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4857, i32 0, i32 6
%.tmp4859 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4858
%.tmp4861 = getelementptr [11 x i8], [11 x i8]*@.str4860, i32 0, i32 0
%.tmp4862 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp4859, i8* %.tmp4861)
store %m307$.Node.type* %.tmp4862, %m307$.Node.type** %assignable.4775
%.tmp4863 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4864 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4865 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4864, i32 0, i32 6
%.tmp4866 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4865
%.tmp4867 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4863, %m307$.Node.type* %.tmp4866)
%dest.4868 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp4867, %m1861$.AssignableInfo.type** %dest.4868
%.tmp4869 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4868
%.tmp4870 = icmp eq %m1861$.AssignableInfo.type* %.tmp4869, null
br i1 %.tmp4870, label %.if.true.4871, label %.if.false.4871
.if.true.4871:
ret void
br label %.if.end.4871
.if.false.4871:
br label %.if.end.4871
.if.end.4871:
%.tmp4872 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4873 = load %m307$.Node.type*, %m307$.Node.type** %assignable.4775
%.tmp4874 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4872, %m307$.Node.type* %.tmp4873)
store %m1861$.AssignableInfo.type* %.tmp4874, %m1861$.AssignableInfo.type** %a_info.4777
%.tmp4875 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4777
%.tmp4876 = icmp eq %m1861$.AssignableInfo.type* %.tmp4875, null
br i1 %.tmp4876, label %.if.true.4877, label %.if.false.4877
.if.true.4877:
ret void
br label %.if.end.4877
.if.false.4877:
br label %.if.end.4877
.if.end.4877:
%.tmp4878 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4879 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4868
%.tmp4880 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4879, i32 0, i32 4
%.tmp4881 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4880
%.tmp4882 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4878, %m1861$.Type.type* %.tmp4881)
%dest_tr.4883 = alloca i8*
store i8* %.tmp4882, i8** %dest_tr.4883
%.tmp4884 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4885 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4777
%.tmp4886 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp4885, i32 0, i32 4
%.tmp4887 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp4886
%.tmp4888 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp4884, %m1861$.Type.type* %.tmp4887)
%src_tr.4889 = alloca i8*
store i8* %.tmp4888, i8** %src_tr.4889
%.tmp4890 = load i8*, i8** %src_tr.4889
%.tmp4892 = getelementptr [4 x i8], [4 x i8]*@.str4891, i32 0, i32 0
%.tmp4893 = call i32(i8*,i8*) @strcmp(i8* %.tmp4890, i8* %.tmp4892)
%.tmp4894 = icmp eq i32 %.tmp4893, 0
br i1 %.tmp4894, label %.if.true.4895, label %.if.false.4895
.if.true.4895:
%.tmp4896 = load i8*, i8** %dest_tr.4883
store i8* %.tmp4896, i8** %src_tr.4889
br label %.if.end.4895
.if.false.4895:
br label %.if.end.4895
.if.end.4895:
%.tmp4897 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4898 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4897, i32 0, i32 1
%.tmp4899 = load %m0$.File.type*, %m0$.File.type** %.tmp4898
%.tmp4901 = getelementptr [21 x i8], [21 x i8]*@.str4900, i32 0, i32 0
%.tmp4902 = load i8*, i8** %src_tr.4889
%.tmp4903 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.4777
%.tmp4904 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4903)
%.tmp4905 = load i8*, i8** %dest_tr.4883
%.tmp4906 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %dest.4868
%.tmp4907 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp4906)
%.tmp4908 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4899, i8* %.tmp4901, i8* %.tmp4902, i8* %.tmp4904, i8* %.tmp4905, i8* %.tmp4907)
br label %.if.end.4856
.if.false.4856:
%.tmp4909 = load i8*, i8** %expr_type.4772
%.tmp4911 = getelementptr [9 x i8], [9 x i8]*@.str4910, i32 0, i32 0
%.tmp4912 = call i32(i8*,i8*) @strcmp(i8* %.tmp4909, i8* %.tmp4911)
%.tmp4913 = icmp eq i32 %.tmp4912, 0
br i1 %.tmp4913, label %.if.true.4914, label %.if.false.4914
.if.true.4914:
%.tmp4915 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4916 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4915, %m307$.Node.type* %.tmp4916)
br label %.if.end.4914
.if.false.4914:
%.tmp4917 = load i8*, i8** %expr_type.4772
%.tmp4919 = getelementptr [9 x i8], [9 x i8]*@.str4918, i32 0, i32 0
%.tmp4920 = call i32(i8*,i8*) @strcmp(i8* %.tmp4917, i8* %.tmp4919)
%.tmp4921 = icmp eq i32 %.tmp4920, 0
br i1 %.tmp4921, label %.if.true.4922, label %.if.false.4922
.if.true.4922:
%.tmp4923 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4924 = load %m307$.Node.type*, %m307$.Node.type** %stmt
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp4923, %m307$.Node.type* %.tmp4924)
br label %.if.end.4922
.if.false.4922:
%.tmp4925 = load i8*, i8** %expr_type.4772
%.tmp4927 = getelementptr [8 x i8], [8 x i8]*@.str4926, i32 0, i32 0
%.tmp4928 = call i32(i8*,i8*) @strcmp(i8* %.tmp4925, i8* %.tmp4927)
%.tmp4929 = icmp eq i32 %.tmp4928, 0
br i1 %.tmp4929, label %.if.true.4930, label %.if.false.4930
.if.true.4930:
%.tmp4931 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4932 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp4931)
%mod.4933 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp4932, %m1861$.ModuleLookup.type** %mod.4933
%.tmp4934 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.4933
%.tmp4935 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp4934, i32 0, i32 3
%.tmp4936 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4935
%s.4937 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp4936, %m1861$.Scope.type** %s.4937
%.tmp4938 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4939 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4938, i32 0, i32 6
%.tmp4940 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4939
%.tmp4941 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4940, i32 0, i32 1
%.tmp4942 = load i8*, i8** %.tmp4941
%.tmp4944 = getelementptr [6 x i8], [6 x i8]*@.str4943, i32 0, i32 0
%.tmp4945 = call i32(i8*,i8*) @strcmp(i8* %.tmp4942, i8* %.tmp4944)
%.tmp4946 = icmp eq i32 %.tmp4945, 0
br i1 %.tmp4946, label %.if.true.4947, label %.if.false.4947
.if.true.4947:
br label %.for.start.4948
.for.start.4948:
%.tmp4949 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4937
%.tmp4950 = icmp ne %m1861$.Scope.type* %.tmp4949, null
br i1 %.tmp4950, label %.for.continue.4948, label %.for.else.4948
.for.continue.4948:
%.tmp4951 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4937
%.tmp4952 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4951, i32 0, i32 2
%.tmp4953 = load i8*, i8** %.tmp4952
%.tmp4955 = getelementptr [4 x i8], [4 x i8]*@.str4954, i32 0, i32 0
%.tmp4956 = call i32(i8*,i8*) @strcmp(i8* %.tmp4953, i8* %.tmp4955)
%.tmp4957 = icmp eq i32 %.tmp4956, 0
br i1 %.tmp4957, label %.if.true.4958, label %.if.false.4958
.if.true.4958:
%.tmp4959 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4960 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4959, i32 0, i32 1
%.tmp4961 = load %m0$.File.type*, %m0$.File.type** %.tmp4960
%.tmp4963 = getelementptr [15 x i8], [15 x i8]*@.str4962, i32 0, i32 0
%.tmp4964 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4937
%.tmp4965 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4964, i32 0, i32 4
%.tmp4966 = load i8*, i8** %.tmp4965
%.tmp4967 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4961, i8* %.tmp4963, i8* %.tmp4966)
br label %.for.end.4948
br label %.if.end.4958
.if.false.4958:
br label %.if.end.4958
.if.end.4958:
%.tmp4968 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4937
%.tmp4969 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4968, i32 0, i32 5
%.tmp4970 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp4969
store %m1861$.Scope.type* %.tmp4970, %m1861$.Scope.type** %s.4937
br label %.for.start.4948
.for.else.4948:
%.tmp4971 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4972 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4974 = getelementptr [48 x i8], [48 x i8]*@.str4973, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp4971, %m307$.Node.type* %.tmp4972, i8* %.tmp4974)
br label %.for.end.4948
.for.end.4948:
br label %.if.end.4947
.if.false.4947:
%.tmp4975 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp4976 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4975, i32 0, i32 6
%.tmp4977 = load %m307$.Node.type*, %m307$.Node.type** %.tmp4976
%.tmp4978 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp4977, i32 0, i32 1
%.tmp4979 = load i8*, i8** %.tmp4978
%.tmp4981 = getelementptr [9 x i8], [9 x i8]*@.str4980, i32 0, i32 0
%.tmp4982 = call i32(i8*,i8*) @strcmp(i8* %.tmp4979, i8* %.tmp4981)
%.tmp4983 = icmp eq i32 %.tmp4982, 0
br i1 %.tmp4983, label %.if.true.4984, label %.if.false.4984
.if.true.4984:
br label %.for.start.4985
.for.start.4985:
%.tmp4986 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4937
%.tmp4987 = icmp ne %m1861$.Scope.type* %.tmp4986, null
br i1 %.tmp4987, label %.for.continue.4985, label %.for.else.4985
.for.continue.4985:
%.tmp4988 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4937
%.tmp4989 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp4988, i32 0, i32 2
%.tmp4990 = load i8*, i8** %.tmp4989
%.tmp4992 = getelementptr [4 x i8], [4 x i8]*@.str4991, i32 0, i32 0
%.tmp4993 = call i32(i8*,i8*) @strcmp(i8* %.tmp4990, i8* %.tmp4992)
%.tmp4994 = icmp eq i32 %.tmp4993, 0
br i1 %.tmp4994, label %.if.true.4995, label %.if.false.4995
.if.true.4995:
%.tmp4996 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp4997 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp4996, i32 0, i32 1
%.tmp4998 = load %m0$.File.type*, %m0$.File.type** %.tmp4997
%.tmp5000 = getelementptr [15 x i8], [15 x i8]*@.str4999, i32 0, i32 0
%.tmp5001 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4937
%.tmp5002 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5001, i32 0, i32 3
%.tmp5003 = load i8*, i8** %.tmp5002
%.tmp5004 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4998, i8* %.tmp5000, i8* %.tmp5003)
br label %.for.end.4985
br label %.if.end.4995
.if.false.4995:
br label %.if.end.4995
.if.end.4995:
%.tmp5005 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.4937
%.tmp5006 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5005, i32 0, i32 5
%.tmp5007 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5006
store %m1861$.Scope.type* %.tmp5007, %m1861$.Scope.type** %s.4937
br label %.for.start.4985
.for.else.4985:
%.tmp5008 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5009 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5011 = getelementptr [51 x i8], [51 x i8]*@.str5010, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5008, %m307$.Node.type* %.tmp5009, i8* %.tmp5011)
br label %.for.end.4985
.for.end.4985:
br label %.if.end.4984
.if.false.4984:
%.tmp5012 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5013 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5015 = getelementptr [40 x i8], [40 x i8]*@.str5014, i32 0, i32 0
%.tmp5016 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5012, %m307$.Node.type* %.tmp5013, i8* %.tmp5015)
%.tmp5017 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5018 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5017, i32 0, i32 6
%.tmp5019 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5018
%.tmp5020 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5019, i32 0, i32 1
%.tmp5021 = load i8*, i8** %.tmp5020
%.tmp5022 = call i32(i8*,...) @printf(i8* %.tmp5016, i8* %.tmp5021)
br label %.if.end.4984
.if.end.4984:
br label %.if.end.4947
.if.end.4947:
br label %.if.end.4930
.if.false.4930:
%.tmp5023 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5024 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5026 = getelementptr [34 x i8], [34 x i8]*@.str5025, i32 0, i32 0
%.tmp5027 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5023, %m307$.Node.type* %.tmp5024, i8* %.tmp5026)
%.tmp5028 = load i8*, i8** %expr_type.4772
%.tmp5029 = call i32(i8*,...) @printf(i8* %.tmp5027, i8* %.tmp5028)
br label %.if.end.4930
.if.end.4930:
br label %.if.end.4922
.if.end.4922:
br label %.if.end.4914
.if.end.4914:
br label %.if.end.4856
.if.end.4856:
br label %.if.end.4847
.if.end.4847:
br label %.if.end.4836
.if.end.4836:
br label %.if.end.4830
.if.end.4830:
br label %.if.end.4783
.if.end.4783:
ret void
}
define void @m1861$compile_for_loop.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5030 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5031 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5030)
%for_id.5032 = alloca i32
store i32 %.tmp5031, i32* %for_id.5032
%.tmp5033 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5034 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5033, i32 0, i32 6
%.tmp5035 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5034
%.tmp5036 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5035, i32 0, i32 7
%.tmp5037 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5036
%init_stmt.5038 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5037, %m307$.Node.type** %init_stmt.5038
%.tmp5039 = bitcast ptr null to i8*
%begin_lbl.5040 = alloca i8*
store i8* %.tmp5039, i8** %begin_lbl.5040
%.tmp5041 = bitcast ptr null to i8*
%end_lbl.5042 = alloca i8*
store i8* %.tmp5041, i8** %end_lbl.5042
%.tmp5043 = getelementptr i8*, i8** %begin_lbl.5040, i32 0
%.tmp5045 = getelementptr [14 x i8], [14 x i8]*@.str5044, i32 0, i32 0
%.tmp5046 = load i32, i32* %for_id.5032
%.tmp5047 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5043, i8* %.tmp5045, i32 %.tmp5046)
%.tmp5048 = getelementptr i8*, i8** %end_lbl.5042, i32 0
%.tmp5050 = getelementptr [12 x i8], [12 x i8]*@.str5049, i32 0, i32 0
%.tmp5051 = load i32, i32* %for_id.5032
%.tmp5052 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5048, i8* %.tmp5050, i32 %.tmp5051)
%.tmp5053 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5055 = getelementptr [4 x i8], [4 x i8]*@.str5054, i32 0, i32 0
%.tmp5056 = load i8*, i8** %begin_lbl.5040
%.tmp5057 = load i8*, i8** %end_lbl.5042
call void(%m1861$.CompilerCtx.type*,i8*,i8*,i8*) @m1861$push_scope.v.m1861$.CompilerCtx.typep.cp.cp.cp(%m1861$.CompilerCtx.type* %.tmp5053, i8* %.tmp5055, i8* %.tmp5056, i8* %.tmp5057)
%.tmp5058 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5038
%.tmp5059 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5058, i32 0, i32 0
%.tmp5060 = load i8*, i8** %.tmp5059
%.tmp5062 = getelementptr [12 x i8], [12 x i8]*@.str5061, i32 0, i32 0
%.tmp5063 = call i32(i8*,i8*) @strcmp(i8* %.tmp5060, i8* %.tmp5062)
%.tmp5064 = icmp eq i32 %.tmp5063, 0
br i1 %.tmp5064, label %.if.true.5065, label %.if.false.5065
.if.true.5065:
%.tmp5066 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5067 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5038
%.tmp5068 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5066, %m307$.Node.type* %.tmp5067)
br label %.if.end.5065
.if.false.5065:
%.tmp5069 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5038
%.tmp5070 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5069, i32 0, i32 0
%.tmp5071 = load i8*, i8** %.tmp5070
%.tmp5073 = getelementptr [11 x i8], [11 x i8]*@.str5072, i32 0, i32 0
%.tmp5074 = call i32(i8*,i8*) @strcmp(i8* %.tmp5071, i8* %.tmp5073)
%.tmp5075 = icmp eq i32 %.tmp5074, 0
br i1 %.tmp5075, label %.if.true.5076, label %.if.false.5076
.if.true.5076:
%.tmp5077 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5078 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5038
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5077, %m307$.Node.type* %.tmp5078)
br label %.if.end.5076
.if.false.5076:
%.tmp5079 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5038
%.tmp5080 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5079, i32 0, i32 0
%.tmp5081 = load i8*, i8** %.tmp5080
%.tmp5083 = getelementptr [9 x i8], [9 x i8]*@.str5082, i32 0, i32 0
%.tmp5084 = call i32(i8*,i8*) @strcmp(i8* %.tmp5081, i8* %.tmp5083)
%.tmp5085 = icmp eq i32 %.tmp5084, 0
br i1 %.tmp5085, label %.if.true.5086, label %.if.false.5086
.if.true.5086:
br label %.if.end.5086
.if.false.5086:
%.tmp5087 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5088 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5038
%.tmp5090 = getelementptr [66 x i8], [66 x i8]*@.str5089, i32 0, i32 0
%.tmp5091 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5087, %m307$.Node.type* %.tmp5088, i8* %.tmp5090)
%.tmp5092 = load %m307$.Node.type*, %m307$.Node.type** %init_stmt.5038
%.tmp5093 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5092, i32 0, i32 0
%.tmp5094 = load i8*, i8** %.tmp5093
%.tmp5095 = call i32(i8*,...) @printf(i8* %.tmp5091, i8* %.tmp5094)
%.tmp5096 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5096)
ret void
br label %.if.end.5086
.if.end.5086:
br label %.if.end.5076
.if.end.5076:
br label %.if.end.5065
.if.end.5065:
%.tmp5097 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5098 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5097, i32 0, i32 1
%.tmp5099 = load %m0$.File.type*, %m0$.File.type** %.tmp5098
%.tmp5101 = getelementptr [26 x i8], [26 x i8]*@.str5100, i32 0, i32 0
%.tmp5102 = load i32, i32* %for_id.5032
%.tmp5103 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5099, i8* %.tmp5101, i32 %.tmp5102)
%.tmp5104 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5105 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5104, i32 0, i32 1
%.tmp5106 = load %m0$.File.type*, %m0$.File.type** %.tmp5105
%.tmp5108 = getelementptr [16 x i8], [16 x i8]*@.str5107, i32 0, i32 0
%.tmp5109 = load i32, i32* %for_id.5032
%.tmp5110 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5106, i8* %.tmp5108, i32 %.tmp5109)
%.tmp5111 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5112 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5111, i32 0, i32 6
%.tmp5113 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5112
%.tmp5115 = getelementptr [9 x i8], [9 x i8]*@.str5114, i32 0, i32 0
%.tmp5116 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5113, i8* %.tmp5115)
%fst_colon.5117 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5116, %m307$.Node.type** %fst_colon.5117
%.tmp5118 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.5117
%.tmp5119 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5118, i32 0, i32 7
%.tmp5120 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5119
%condition.5121 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5120, %m307$.Node.type** %condition.5121
%.tmp5122 = load %m307$.Node.type*, %m307$.Node.type** %condition.5121
%.tmp5123 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5122, i32 0, i32 0
%.tmp5124 = load i8*, i8** %.tmp5123
%.tmp5126 = getelementptr [9 x i8], [9 x i8]*@.str5125, i32 0, i32 0
%.tmp5127 = call i32(i8*,i8*) @strcmp(i8* %.tmp5124, i8* %.tmp5126)
%.tmp5128 = icmp eq i32 %.tmp5127, 0
br i1 %.tmp5128, label %.if.true.5129, label %.if.false.5129
.if.true.5129:
%.tmp5130 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5131 = load %m307$.Node.type*, %m307$.Node.type** %condition.5121
%.tmp5133 = getelementptr [39 x i8], [39 x i8]*@.str5132, i32 0, i32 0
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5130, %m307$.Node.type* %.tmp5131, i8* %.tmp5133)
ret void
br label %.if.end.5129
.if.false.5129:
br label %.if.end.5129
.if.end.5129:
%.tmp5134 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5135 = load %m307$.Node.type*, %m307$.Node.type** %condition.5121
%.tmp5136 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5134, %m307$.Node.type* %.tmp5135)
%condition_info.5137 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5136, %m1861$.AssignableInfo.type** %condition_info.5137
%.tmp5138 = load %m307$.Node.type*, %m307$.Node.type** %fst_colon.5117
%.tmp5139 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5138, i32 0, i32 7
%.tmp5140 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5139
%.tmp5142 = getelementptr [9 x i8], [9 x i8]*@.str5141, i32 0, i32 0
%.tmp5143 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5140, i8* %.tmp5142)
%snd_colon.5144 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5143, %m307$.Node.type** %snd_colon.5144
%.tmp5145 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.5144
%.tmp5147 = getelementptr [6 x i8], [6 x i8]*@.str5146, i32 0, i32 0
%.tmp5148 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5145, i8* %.tmp5147)
%for_body.5149 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5148, %m307$.Node.type** %for_body.5149
%.tmp5150 = load %m307$.Node.type*, %m307$.Node.type** %for_body.5149
%.tmp5152 = getelementptr [11 x i8], [11 x i8]*@.str5151, i32 0, i32 0
%.tmp5153 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5150, i8* %.tmp5152)
%else_block.5154 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5153, %m307$.Node.type** %else_block.5154
%.tmp5155 = load i8*, i8** %end_lbl.5042
%on_end.5156 = alloca i8*
store i8* %.tmp5155, i8** %on_end.5156
%.tmp5157 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5154
%.tmp5158 = icmp ne %m307$.Node.type* %.tmp5157, null
br i1 %.tmp5158, label %.if.true.5159, label %.if.false.5159
.if.true.5159:
%.tmp5160 = getelementptr i8*, i8** %on_end.5156, i32 0
%.tmp5162 = getelementptr [13 x i8], [13 x i8]*@.str5161, i32 0, i32 0
%.tmp5163 = load i32, i32* %for_id.5032
%.tmp5164 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5160, i8* %.tmp5162, i32 %.tmp5163)
br label %.if.end.5159
.if.false.5159:
br label %.if.end.5159
.if.end.5159:
%.tmp5165 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5166 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5165, i32 0, i32 1
%.tmp5167 = load %m0$.File.type*, %m0$.File.type** %.tmp5166
%.tmp5169 = getelementptr [48 x i8], [48 x i8]*@.str5168, i32 0, i32 0
%.tmp5170 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5171 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.5137
%.tmp5172 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5171, i32 0, i32 4
%.tmp5173 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5172
%.tmp5174 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5170, %m1861$.Type.type* %.tmp5173)
%.tmp5175 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %condition_info.5137
%.tmp5176 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5175)
%.tmp5177 = load i32, i32* %for_id.5032
%.tmp5178 = load i8*, i8** %on_end.5156
%.tmp5179 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5167, i8* %.tmp5169, i8* %.tmp5174, i8* %.tmp5176, i32 %.tmp5177, i8* %.tmp5178)
%.tmp5180 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5181 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5180, i32 0, i32 1
%.tmp5182 = load %m0$.File.type*, %m0$.File.type** %.tmp5181
%.tmp5184 = getelementptr [19 x i8], [19 x i8]*@.str5183, i32 0, i32 0
%.tmp5185 = load i32, i32* %for_id.5032
%.tmp5186 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5182, i8* %.tmp5184, i32 %.tmp5185)
%.tmp5187 = load %m307$.Node.type*, %m307$.Node.type** %snd_colon.5144
%.tmp5188 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5187, i32 0, i32 7
%.tmp5189 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5188
%increment.5190 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5189, %m307$.Node.type** %increment.5190
%.tmp5191 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5192 = load %m307$.Node.type*, %m307$.Node.type** %for_body.5149
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5191, %m307$.Node.type* %.tmp5192)
%.tmp5193 = load %m307$.Node.type*, %m307$.Node.type** %increment.5190
%.tmp5194 = load %m307$.Node.type*, %m307$.Node.type** %for_body.5149
%.tmp5195 = icmp ne %m307$.Node.type* %.tmp5193, %.tmp5194
br i1 %.tmp5195, label %.if.true.5196, label %.if.false.5196
.if.true.5196:
%.tmp5197 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5198 = load %m307$.Node.type*, %m307$.Node.type** %increment.5190
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_expression.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5197, %m307$.Node.type* %.tmp5198)
br label %.if.end.5196
.if.false.5196:
br label %.if.end.5196
.if.end.5196:
%.tmp5199 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5200 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5199, i32 0, i32 1
%.tmp5201 = load %m0$.File.type*, %m0$.File.type** %.tmp5200
%.tmp5203 = getelementptr [15 x i8], [15 x i8]*@.str5202, i32 0, i32 0
%.tmp5204 = load i8*, i8** %begin_lbl.5040
%.tmp5205 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5201, i8* %.tmp5203, i8* %.tmp5204)
%.tmp5206 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5154
%.tmp5207 = icmp ne %m307$.Node.type* %.tmp5206, null
br i1 %.tmp5207, label %.if.true.5208, label %.if.false.5208
.if.true.5208:
%.tmp5209 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5210 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5209, i32 0, i32 1
%.tmp5211 = load %m0$.File.type*, %m0$.File.type** %.tmp5210
%.tmp5213 = getelementptr [15 x i8], [15 x i8]*@.str5212, i32 0, i32 0
%.tmp5214 = load i32, i32* %for_id.5032
%.tmp5215 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5211, i8* %.tmp5213, i32 %.tmp5214)
%.tmp5216 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5154
%.tmp5217 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5216, i32 0, i32 6
%.tmp5218 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5217
%.tmp5220 = getelementptr [6 x i8], [6 x i8]*@.str5219, i32 0, i32 0
%.tmp5221 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5218, i8* %.tmp5220)
%block.5222 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5221, %m307$.Node.type** %block.5222
%.tmp5223 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5224 = load %m307$.Node.type*, %m307$.Node.type** %block.5222
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5223, %m307$.Node.type* %.tmp5224)
%.tmp5225 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5226 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5225, i32 0, i32 1
%.tmp5227 = load %m0$.File.type*, %m0$.File.type** %.tmp5226
%.tmp5229 = getelementptr [15 x i8], [15 x i8]*@.str5228, i32 0, i32 0
%.tmp5230 = load i8*, i8** %end_lbl.5042
%.tmp5231 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5227, i8* %.tmp5229, i8* %.tmp5230)
br label %.if.end.5208
.if.false.5208:
br label %.if.end.5208
.if.end.5208:
%.tmp5232 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5233 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5232, i32 0, i32 1
%.tmp5234 = load %m0$.File.type*, %m0$.File.type** %.tmp5233
%.tmp5236 = getelementptr [5 x i8], [5 x i8]*@.str5235, i32 0, i32 0
%.tmp5237 = load i8*, i8** %end_lbl.5042
%.tmp5238 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5234, i8* %.tmp5236, i8* %.tmp5237)
%.tmp5239 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
call void(%m1861$.CompilerCtx.type*) @m1861$pop_scope.v.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5239)
ret void
}
define %m1861$.AssignableInfo.type* @m1861$compile_declaration.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5240 = bitcast ptr null to %m1861$.Type.type*
%decl_type.5241 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5240, %m1861$.Type.type** %decl_type.5241
%.tmp5242 = bitcast ptr null to %m1861$.AssignableInfo.type*
%a_info.5243 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5242, %m1861$.AssignableInfo.type** %a_info.5243
%.tmp5244 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5245 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5244, i32 0, i32 6
%.tmp5246 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5245
%.tmp5247 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5246, i32 0, i32 0
%.tmp5248 = load i8*, i8** %.tmp5247
%.tmp5250 = getelementptr [5 x i8], [5 x i8]*@.str5249, i32 0, i32 0
%.tmp5251 = call i32(i8*,i8*) @strcmp(i8* %.tmp5248, i8* %.tmp5250)
%.tmp5252 = icmp eq i32 %.tmp5251, 0
br i1 %.tmp5252, label %.if.true.5253, label %.if.false.5253
.if.true.5253:
%.tmp5254 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5255 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5256 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5255, i32 0, i32 6
%.tmp5257 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5256
%.tmp5258 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5257, i32 0, i32 6
%.tmp5259 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5258
%.tmp5260 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5254, %m307$.Node.type* %.tmp5259)
store %m1861$.Type.type* %.tmp5260, %m1861$.Type.type** %decl_type.5241
br label %.if.end.5253
.if.false.5253:
br label %.if.end.5253
.if.end.5253:
%.tmp5261 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5262 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5261, i32 0, i32 6
%.tmp5263 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5262
%.tmp5265 = getelementptr [11 x i8], [11 x i8]*@.str5264, i32 0, i32 0
%.tmp5266 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5263, i8* %.tmp5265)
%assignable.5267 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5266, %m307$.Node.type** %assignable.5267
%.tmp5268 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5267
%.tmp5269 = icmp ne %m307$.Node.type* %.tmp5268, null
br i1 %.tmp5269, label %.if.true.5270, label %.if.false.5270
.if.true.5270:
%.tmp5271 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5272 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5267
%.tmp5273 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5271, %m307$.Node.type* %.tmp5272)
store %m1861$.AssignableInfo.type* %.tmp5273, %m1861$.AssignableInfo.type** %a_info.5243
br label %.if.end.5270
.if.false.5270:
br label %.if.end.5270
.if.end.5270:
%.tmp5274 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5275 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5274)
%info.5276 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5275, %m1861$.AssignableInfo.type** %info.5276
%.tmp5277 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5276
%.tmp5278 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5277, i32 0, i32 3
%.tmp5280 = getelementptr [9 x i8], [9 x i8]*@.str5279, i32 0, i32 0
store i8* %.tmp5280, i8** %.tmp5278
%.tmp5281 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5282 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5281, i32 0, i32 6
%.tmp5283 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5282
%.tmp5285 = getelementptr [5 x i8], [5 x i8]*@.str5284, i32 0, i32 0
%.tmp5286 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5283, i8* %.tmp5285)
%var_name.5287 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5286, %m307$.Node.type** %var_name.5287
%.tmp5288 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5287
%.tmp5289 = icmp eq %m307$.Node.type* %.tmp5288, null
br i1 %.tmp5289, label %.if.true.5290, label %.if.false.5290
.if.true.5290:
%.tmp5291 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5292 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5294 = getelementptr [31 x i8], [31 x i8]*@.str5293, i32 0, i32 0
%.tmp5295 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5291, %m307$.Node.type* %.tmp5292, i8* %.tmp5294)
%.tmp5296 = call i32(i8*,...) @printf(i8* %.tmp5295)
%.tmp5297 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5297
br label %.if.end.5290
.if.false.5290:
br label %.if.end.5290
.if.end.5290:
%.tmp5298 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5299 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5298)
%mod.5300 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5299, %m1861$.ModuleLookup.type** %mod.5300
%.tmp5301 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5302 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5300
%.tmp5303 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5302, i32 0, i32 3
%.tmp5304 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5303
%.tmp5305 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5287
%.tmp5306 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5305, i32 0, i32 1
%.tmp5307 = load i8*, i8** %.tmp5306
%.tmp5308 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5301, %m1861$.Scope.type* %.tmp5304, i8* %.tmp5307)
%.tmp5309 = icmp ne %m1861$.ScopeItem.type* %.tmp5308, null
br i1 %.tmp5309, label %.if.true.5310, label %.if.false.5310
.if.true.5310:
%err_buf.5311 = alloca i8*
store i8* null, i8** %err_buf.5311
%.tmp5312 = getelementptr i8*, i8** %err_buf.5311, i32 0
%.tmp5314 = getelementptr [43 x i8], [43 x i8]*@.str5313, i32 0, i32 0
%.tmp5315 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5287
%.tmp5316 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5315, i32 0, i32 1
%.tmp5317 = load i8*, i8** %.tmp5316
%.tmp5318 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5312, i8* %.tmp5314, i8* %.tmp5317)
%.tmp5319 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5320 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5321 = load i8*, i8** %err_buf.5311
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5319, %m307$.Node.type* %.tmp5320, i8* %.tmp5321)
%.tmp5322 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5322
br label %.if.end.5310
.if.false.5310:
br label %.if.end.5310
.if.end.5310:
%var_id.5323 = alloca i8*
store i8* null, i8** %var_id.5323
%.tmp5324 = getelementptr i8*, i8** %var_id.5323, i32 0
%.tmp5326 = getelementptr [6 x i8], [6 x i8]*@.str5325, i32 0, i32 0
%.tmp5327 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5287
%.tmp5328 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5327, i32 0, i32 1
%.tmp5329 = load i8*, i8** %.tmp5328
%.tmp5330 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5331 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5330)
%.tmp5332 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5324, i8* %.tmp5326, i8* %.tmp5329, i32 %.tmp5331)
%.tmp5333 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5276
%.tmp5334 = load i8, i8* @SCOPE_LOCAL
%.tmp5335 = load i8*, i8** %var_id.5323
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp5333, i8 %.tmp5334, i8* %.tmp5335)
%.tmp5336 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.5241
%.tmp5337 = icmp ne %m1861$.Type.type* %.tmp5336, null
br i1 %.tmp5337, label %.if.true.5338, label %.if.false.5338
.if.true.5338:
%.tmp5339 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5276
%.tmp5340 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5339, i32 0, i32 4
%.tmp5341 = load %m1861$.Type.type*, %m1861$.Type.type** %decl_type.5241
store %m1861$.Type.type* %.tmp5341, %m1861$.Type.type** %.tmp5340
br label %.if.end.5338
.if.false.5338:
%.tmp5342 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5243
%.tmp5343 = icmp ne %m1861$.AssignableInfo.type* %.tmp5342, null
br i1 %.tmp5343, label %.if.true.5344, label %.if.false.5344
.if.true.5344:
%.tmp5345 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5276
%.tmp5346 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5345, i32 0, i32 4
%.tmp5347 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5243
%.tmp5348 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5347, i32 0, i32 4
%.tmp5349 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5348
store %m1861$.Type.type* %.tmp5349, %m1861$.Type.type** %.tmp5346
br label %.if.end.5344
.if.false.5344:
br label %.if.end.5344
.if.end.5344:
br label %.if.end.5338
.if.end.5338:
%.tmp5350 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5351 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5276
%.tmp5352 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5351, i32 0, i32 4
%.tmp5353 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5352
%.tmp5354 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5350, %m1861$.Type.type* %.tmp5353)
%var_type_repr.5355 = alloca i8*
store i8* %.tmp5354, i8** %var_type_repr.5355
%.tmp5356 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5243
%.tmp5357 = icmp ne %m1861$.AssignableInfo.type* %.tmp5356, null
br i1 %.tmp5357, label %.if.true.5358, label %.if.false.5358
.if.true.5358:
%.tmp5359 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5360 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5243
%.tmp5361 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5360, i32 0, i32 4
%.tmp5362 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5361
%.tmp5363 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5359, %m1861$.Type.type* %.tmp5362)
%a_type_repr.5364 = alloca i8*
store i8* %.tmp5363, i8** %a_type_repr.5364
%type_error.5365 = alloca i1
store i1 0, i1* %type_error.5365
%.tmp5366 = load i8*, i8** %a_type_repr.5364
%.tmp5367 = call i32(i8*) @strlen(i8* %.tmp5366)
%.tmp5368 = load i8*, i8** %var_type_repr.5355
%.tmp5369 = call i32(i8*) @strlen(i8* %.tmp5368)
%.tmp5370 = icmp ne i32 %.tmp5367, %.tmp5369
br i1 %.tmp5370, label %.if.true.5371, label %.if.false.5371
.if.true.5371:
store i1 1, i1* %type_error.5365
br label %.if.end.5371
.if.false.5371:
%.tmp5372 = load i8*, i8** %a_type_repr.5364
%.tmp5373 = load i8*, i8** %var_type_repr.5355
%.tmp5374 = call i32(i8*,i8*) @strcmp(i8* %.tmp5372, i8* %.tmp5373)
%.tmp5375 = icmp ne i32 %.tmp5374, 0
br i1 %.tmp5375, label %.if.true.5376, label %.if.false.5376
.if.true.5376:
store i1 1, i1* %type_error.5365
br label %.if.end.5376
.if.false.5376:
br label %.if.end.5376
.if.end.5376:
br label %.if.end.5371
.if.end.5371:
%.tmp5377 = load i1, i1* %type_error.5365
br i1 %.tmp5377, label %.if.true.5378, label %.if.false.5378
.if.true.5378:
%.tmp5379 = bitcast ptr null to i8*
%err_msg.5380 = alloca i8*
store i8* %.tmp5379, i8** %err_msg.5380
%.tmp5381 = getelementptr i8*, i8** %err_msg.5380, i32 0
%.tmp5383 = getelementptr [49 x i8], [49 x i8]*@.str5382, i32 0, i32 0
%.tmp5384 = load i8*, i8** %a_type_repr.5364
%.tmp5385 = load i8*, i8** %var_type_repr.5355
%.tmp5386 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5381, i8* %.tmp5383, i8* %.tmp5384, i8* %.tmp5385)
%.tmp5387 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5388 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5389 = load i8*, i8** %err_msg.5380
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5387, %m307$.Node.type* %.tmp5388, i8* %.tmp5389)
br label %.if.end.5378
.if.false.5378:
br label %.if.end.5378
.if.end.5378:
br label %.if.end.5358
.if.false.5358:
br label %.if.end.5358
.if.end.5358:
%.tmp5390 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5391 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5392 = load %m307$.Node.type*, %m307$.Node.type** %var_name.5287
%.tmp5393 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5392, i32 0, i32 1
%.tmp5394 = load i8*, i8** %.tmp5393
%.tmp5395 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5276
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5390, %m307$.Node.type* %.tmp5391, i8* %.tmp5394, %m1861$.AssignableInfo.type* %.tmp5395)
%.tmp5396 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5397 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5396, i32 0, i32 1
%.tmp5398 = load %m0$.File.type*, %m0$.File.type** %.tmp5397
%.tmp5400 = getelementptr [16 x i8], [16 x i8]*@.str5399, i32 0, i32 0
%.tmp5401 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5276
%.tmp5402 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5401)
%.tmp5403 = load i8*, i8** %var_type_repr.5355
%.tmp5404 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5398, i8* %.tmp5400, i8* %.tmp5402, i8* %.tmp5403)
%.tmp5405 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5243
%.tmp5406 = icmp ne %m1861$.AssignableInfo.type* %.tmp5405, null
br i1 %.tmp5406, label %.if.true.5407, label %.if.false.5407
.if.true.5407:
%.tmp5408 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5409 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5408, i32 0, i32 1
%.tmp5410 = load %m0$.File.type*, %m0$.File.type** %.tmp5409
%.tmp5412 = getelementptr [21 x i8], [21 x i8]*@.str5411, i32 0, i32 0
%.tmp5413 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5414 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5243
%.tmp5415 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5414, i32 0, i32 4
%.tmp5416 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5415
%.tmp5417 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5413, %m1861$.Type.type* %.tmp5416)
%.tmp5418 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5243
%.tmp5419 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5418)
%.tmp5420 = load i8*, i8** %var_type_repr.5355
%.tmp5421 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5276
%.tmp5422 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5421)
%.tmp5423 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5410, i8* %.tmp5412, i8* %.tmp5417, i8* %.tmp5419, i8* %.tmp5420, i8* %.tmp5422)
br label %.if.end.5407
.if.false.5407:
%.tmp5424 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5425 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5426 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5276
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5424, %m307$.Node.type* %.tmp5425, %m1861$.AssignableInfo.type* %.tmp5426)
br label %.if.end.5407
.if.end.5407:
%.tmp5427 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.5276
ret %m1861$.AssignableInfo.type* %.tmp5427
}
define void @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%.tmp5428 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5429 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5428, i32 0, i32 4
%.tmp5430 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5429
%.tmp5431 = icmp eq %m1861$.Type.type* %.tmp5430, null
br i1 %.tmp5431, label %.if.true.5432, label %.if.false.5432
.if.true.5432:
ret void
br label %.if.end.5432
.if.false.5432:
br label %.if.end.5432
.if.end.5432:
%.tmp5433 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5434 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5435 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5434, i32 0, i32 4
%.tmp5436 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5435
%.tmp5437 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5433, %m1861$.Type.type* %.tmp5436)
%t_repr.5438 = alloca i8*
store i8* %.tmp5437, i8** %t_repr.5438
%.tmp5439 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5440 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5439)
%id.5441 = alloca i8*
store i8* %.tmp5440, i8** %id.5441
%field_id.5442 = alloca i32
store i32 0, i32* %field_id.5442
%field.5443 = alloca %m1861$.Type.type*
store %m1861$.Type.type* null, %m1861$.Type.type** %field.5443
%field_info.5444 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* null, %m1861$.AssignableInfo.type** %field_info.5444
%.tmp5445 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5446 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5445, i32 0, i32 4
%.tmp5447 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5446
%t.5448 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5447, %m1861$.Type.type** %t.5448
%.tmp5449 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5448
%.tmp5450 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5449, i32 0, i32 0
%.tmp5451 = load i8*, i8** %.tmp5450
%.tmp5453 = getelementptr [4 x i8], [4 x i8]*@.str5452, i32 0, i32 0
%.tmp5454 = call i32(i8*,i8*) @strcmp(i8* %.tmp5451, i8* %.tmp5453)
%.tmp5455 = icmp eq i32 %.tmp5454, 0
%.tmp5456 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5448
%.tmp5457 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5456, i32 0, i32 0
%.tmp5458 = load i8*, i8** %.tmp5457
%.tmp5460 = getelementptr [4 x i8], [4 x i8]*@.str5459, i32 0, i32 0
%.tmp5461 = call i32(i8*,i8*) @strcmp(i8* %.tmp5458, i8* %.tmp5460)
%.tmp5462 = icmp eq i32 %.tmp5461, 0
%.tmp5463 = or i1 %.tmp5455, %.tmp5462
%.tmp5464 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5448
%.tmp5465 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5464, i32 0, i32 0
%.tmp5466 = load i8*, i8** %.tmp5465
%.tmp5468 = getelementptr [5 x i8], [5 x i8]*@.str5467, i32 0, i32 0
%.tmp5469 = call i32(i8*,i8*) @strcmp(i8* %.tmp5466, i8* %.tmp5468)
%.tmp5470 = icmp eq i32 %.tmp5469, 0
%.tmp5471 = or i1 %.tmp5463, %.tmp5470
br i1 %.tmp5471, label %.if.true.5472, label %.if.false.5472
.if.true.5472:
%.tmp5473 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5474 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5473, i32 0, i32 1
%.tmp5475 = load %m0$.File.type*, %m0$.File.type** %.tmp5474
%.tmp5477 = getelementptr [21 x i8], [21 x i8]*@.str5476, i32 0, i32 0
%.tmp5478 = load i8*, i8** %t_repr.5438
%.tmp5479 = load i8*, i8** %t_repr.5438
%.tmp5480 = load i8*, i8** %id.5441
%.tmp5481 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5475, i8* %.tmp5477, i8* %.tmp5478, i32 0, i8* %.tmp5479, i8* %.tmp5480)
br label %.if.end.5472
.if.false.5472:
%.tmp5482 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5448
%.tmp5483 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5482, i32 0, i32 0
%.tmp5484 = load i8*, i8** %.tmp5483
%.tmp5486 = getelementptr [4 x i8], [4 x i8]*@.str5485, i32 0, i32 0
%.tmp5487 = call i32(i8*,i8*) @strcmp(i8* %.tmp5484, i8* %.tmp5486)
%.tmp5488 = icmp eq i32 %.tmp5487, 0
br i1 %.tmp5488, label %.if.true.5489, label %.if.false.5489
.if.true.5489:
%.tmp5490 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5491 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5490, i32 0, i32 1
%.tmp5492 = load %m0$.File.type*, %m0$.File.type** %.tmp5491
%.tmp5494 = getelementptr [21 x i8], [21 x i8]*@.str5493, i32 0, i32 0
%.tmp5495 = load i8*, i8** %t_repr.5438
%.tmp5497 = getelementptr [5 x i8], [5 x i8]*@.str5496, i32 0, i32 0
%.tmp5498 = load i8*, i8** %t_repr.5438
%.tmp5499 = load i8*, i8** %id.5441
%.tmp5500 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5492, i8* %.tmp5494, i8* %.tmp5495, i8* %.tmp5497, i8* %.tmp5498, i8* %.tmp5499)
br label %.if.end.5489
.if.false.5489:
%.tmp5501 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5448
%.tmp5502 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5501, i32 0, i32 0
%.tmp5503 = load i8*, i8** %.tmp5502
%.tmp5505 = getelementptr [7 x i8], [7 x i8]*@.str5504, i32 0, i32 0
%.tmp5506 = call i32(i8*,i8*) @strcmp(i8* %.tmp5503, i8* %.tmp5505)
%.tmp5507 = icmp eq i32 %.tmp5506, 0
br i1 %.tmp5507, label %.if.true.5508, label %.if.false.5508
.if.true.5508:
%.tmp5510 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5448
%.tmp5511 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5510, i32 0, i32 3
%.tmp5512 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5511
store %m1861$.Type.type* %.tmp5512, %m1861$.Type.type** %field.5443
br label %.for.start.5509
.for.start.5509:
%.tmp5513 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5443
%.tmp5514 = icmp ne %m1861$.Type.type* %.tmp5513, null
br i1 %.tmp5514, label %.for.continue.5509, label %.for.end.5509
.for.continue.5509:
%.tmp5515 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5516 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5515)
store %m1861$.AssignableInfo.type* %.tmp5516, %m1861$.AssignableInfo.type** %field_info.5444
%.tmp5517 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5518 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5444
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5517, %m1861$.AssignableInfo.type* %.tmp5518)
%.tmp5519 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5444
%.tmp5520 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5519, i32 0, i32 4
%.tmp5521 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5443
store %m1861$.Type.type* %.tmp5521, %m1861$.Type.type** %.tmp5520
%.tmp5522 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5523 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5522, i32 0, i32 1
%.tmp5524 = load %m0$.File.type*, %m0$.File.type** %.tmp5523
%.tmp5526 = getelementptr [46 x i8], [46 x i8]*@.str5525, i32 0, i32 0
%.tmp5527 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5444
%.tmp5528 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5527)
%.tmp5529 = load i8*, i8** %t_repr.5438
%.tmp5530 = load i8*, i8** %t_repr.5438
%.tmp5531 = load i8*, i8** %id.5441
%.tmp5532 = load i32, i32* %field_id.5442
%.tmp5533 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5524, i8* %.tmp5526, i8* %.tmp5528, i8* %.tmp5529, i8* %.tmp5530, i8* %.tmp5531, i32 %.tmp5532)
%.tmp5534 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5535 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5536 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5444
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5534, %m307$.Node.type* %.tmp5535, %m1861$.AssignableInfo.type* %.tmp5536)
%.tmp5537 = load i32, i32* %field_id.5442
%.tmp5538 = add i32 %.tmp5537, 1
store i32 %.tmp5538, i32* %field_id.5442
%.tmp5539 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5443
%.tmp5540 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5539, i32 0, i32 4
%.tmp5541 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5540
store %m1861$.Type.type* %.tmp5541, %m1861$.Type.type** %field.5443
br label %.for.start.5509
.for.end.5509:
br label %.if.end.5508
.if.false.5508:
%.tmp5542 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5448
%.tmp5543 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5542, i32 0, i32 0
%.tmp5544 = load i8*, i8** %.tmp5543
%.tmp5546 = getelementptr [10 x i8], [10 x i8]*@.str5545, i32 0, i32 0
%.tmp5547 = call i32(i8*,i8*) @strcmp(i8* %.tmp5544, i8* %.tmp5546)
%.tmp5548 = icmp eq i32 %.tmp5547, 0
br i1 %.tmp5548, label %.if.true.5549, label %.if.false.5549
.if.true.5549:
%.tmp5551 = load %m1861$.Type.type*, %m1861$.Type.type** %t.5448
%.tmp5552 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5551, i32 0, i32 3
%.tmp5553 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5552
%.tmp5554 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5553, i32 0, i32 3
%.tmp5555 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5554
store %m1861$.Type.type* %.tmp5555, %m1861$.Type.type** %field.5443
br label %.for.start.5550
.for.start.5550:
%.tmp5556 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5443
%.tmp5557 = icmp ne %m1861$.Type.type* %.tmp5556, null
br i1 %.tmp5557, label %.for.continue.5550, label %.for.end.5550
.for.continue.5550:
%.tmp5558 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5559 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp5558)
store %m1861$.AssignableInfo.type* %.tmp5559, %m1861$.AssignableInfo.type** %field_info.5444
%.tmp5560 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5561 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5444
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5560, %m1861$.AssignableInfo.type* %.tmp5561)
%.tmp5562 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5444
%.tmp5563 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5562, i32 0, i32 4
%.tmp5564 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5443
store %m1861$.Type.type* %.tmp5564, %m1861$.Type.type** %.tmp5563
%.tmp5565 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5566 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5565, i32 0, i32 1
%.tmp5567 = load %m0$.File.type*, %m0$.File.type** %.tmp5566
%.tmp5569 = getelementptr [46 x i8], [46 x i8]*@.str5568, i32 0, i32 0
%.tmp5570 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5444
%.tmp5571 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5570)
%.tmp5572 = load i8*, i8** %t_repr.5438
%.tmp5573 = load i8*, i8** %t_repr.5438
%.tmp5574 = load i8*, i8** %id.5441
%.tmp5575 = load i32, i32* %field_id.5442
%.tmp5576 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5567, i8* %.tmp5569, i8* %.tmp5571, i8* %.tmp5572, i8* %.tmp5573, i8* %.tmp5574, i32 %.tmp5575)
%.tmp5577 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5578 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5579 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %field_info.5444
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$compile_zero_value.v.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp5577, %m307$.Node.type* %.tmp5578, %m1861$.AssignableInfo.type* %.tmp5579)
%.tmp5580 = load i32, i32* %field_id.5442
%.tmp5581 = add i32 %.tmp5580, 1
store i32 %.tmp5581, i32* %field_id.5442
%.tmp5582 = load %m1861$.Type.type*, %m1861$.Type.type** %field.5443
%.tmp5583 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5582, i32 0, i32 4
%.tmp5584 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5583
store %m1861$.Type.type* %.tmp5584, %m1861$.Type.type** %field.5443
br label %.for.start.5550
.for.end.5550:
br label %.if.end.5549
.if.false.5549:
%.tmp5585 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5586 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5588 = getelementptr [44 x i8], [44 x i8]*@.str5587, i32 0, i32 0
%.tmp5589 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5585, %m307$.Node.type* %.tmp5586, i8* %.tmp5588)
%.tmp5590 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5591 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5590, i32 0, i32 4
%.tmp5592 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5591
%.tmp5593 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp5592, i32 0, i32 0
%.tmp5594 = load i8*, i8** %.tmp5593
%.tmp5595 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5596 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5597 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5596, i32 0, i32 4
%.tmp5598 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5597
%.tmp5599 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5595, %m1861$.Type.type* %.tmp5598)
%.tmp5600 = call i32(i8*,...) @printf(i8* %.tmp5589, i8* %.tmp5594, i8* %.tmp5599)
ret void
br label %.if.end.5549
.if.end.5549:
br label %.if.end.5508
.if.end.5508:
br label %.if.end.5489
.if.end.5489:
br label %.if.end.5472
.if.end.5472:
ret void
}
define void @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp5601 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5602 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5601, i32 0, i32 6
%.tmp5603 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5602
%.tmp5605 = getelementptr [11 x i8], [11 x i8]*@.str5604, i32 0, i32 0
%.tmp5606 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5603, i8* %.tmp5605)
%assignable.5607 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5606, %m307$.Node.type** %assignable.5607
%.tmp5608 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5609 = load %m307$.Node.type*, %m307$.Node.type** %assignable.5607
%.tmp5610 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5608, %m307$.Node.type* %.tmp5609)
%a_info.5611 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5610, %m1861$.AssignableInfo.type** %a_info.5611
%.tmp5612 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5611
%.tmp5613 = icmp eq %m1861$.AssignableInfo.type* %.tmp5612, null
br i1 %.tmp5613, label %.if.true.5614, label %.if.false.5614
.if.true.5614:
ret void
br label %.if.end.5614
.if.false.5614:
br label %.if.end.5614
.if.end.5614:
%.tmp5615 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5616 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5615)
%if_id.5617 = alloca i32
store i32 %.tmp5616, i32* %if_id.5617
%.tmp5618 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5619 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5618, i32 0, i32 1
%.tmp5620 = load %m0$.File.type*, %m0$.File.type** %.tmp5619
%.tmp5622 = getelementptr [53 x i8], [53 x i8]*@.str5621, i32 0, i32 0
%.tmp5623 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5624 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5611
%.tmp5625 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5624, i32 0, i32 4
%.tmp5626 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5625
%.tmp5627 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp5623, %m1861$.Type.type* %.tmp5626)
%.tmp5628 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %a_info.5611
%.tmp5629 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp5628)
%.tmp5630 = load i32, i32* %if_id.5617
%.tmp5631 = load i32, i32* %if_id.5617
%.tmp5632 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5620, i8* %.tmp5622, i8* %.tmp5627, i8* %.tmp5629, i32 %.tmp5630, i32 %.tmp5631)
%.tmp5633 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5634 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5633, i32 0, i32 1
%.tmp5635 = load %m0$.File.type*, %m0$.File.type** %.tmp5634
%.tmp5637 = getelementptr [14 x i8], [14 x i8]*@.str5636, i32 0, i32 0
%.tmp5638 = load i32, i32* %if_id.5617
%.tmp5639 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5635, i8* %.tmp5637, i32 %.tmp5638)
%.tmp5640 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5641 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5640, i32 0, i32 6
%.tmp5642 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5641
%.tmp5644 = getelementptr [6 x i8], [6 x i8]*@.str5643, i32 0, i32 0
%.tmp5645 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5642, i8* %.tmp5644)
%block.5646 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5645, %m307$.Node.type** %block.5646
%.tmp5647 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5648 = load %m307$.Node.type*, %m307$.Node.type** %block.5646
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5647, %m307$.Node.type* %.tmp5648)
%.tmp5649 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5650 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5649, i32 0, i32 1
%.tmp5651 = load %m0$.File.type*, %m0$.File.type** %.tmp5650
%.tmp5653 = getelementptr [23 x i8], [23 x i8]*@.str5652, i32 0, i32 0
%.tmp5654 = load i32, i32* %if_id.5617
%.tmp5655 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5651, i8* %.tmp5653, i32 %.tmp5654)
%.tmp5656 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5657 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5656, i32 0, i32 1
%.tmp5658 = load %m0$.File.type*, %m0$.File.type** %.tmp5657
%.tmp5660 = getelementptr [15 x i8], [15 x i8]*@.str5659, i32 0, i32 0
%.tmp5661 = load i32, i32* %if_id.5617
%.tmp5662 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5658, i8* %.tmp5660, i32 %.tmp5661)
%.tmp5663 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5664 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5663, i32 0, i32 6
%.tmp5665 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5664
%.tmp5667 = getelementptr [11 x i8], [11 x i8]*@.str5666, i32 0, i32 0
%.tmp5668 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5665, i8* %.tmp5667)
%else_block.5669 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp5668, %m307$.Node.type** %else_block.5669
%.tmp5670 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5669
%.tmp5671 = icmp ne %m307$.Node.type* %.tmp5670, null
br i1 %.tmp5671, label %.if.true.5672, label %.if.false.5672
.if.true.5672:
%.tmp5673 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5669
%.tmp5674 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5673, i32 0, i32 6
%.tmp5675 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5674
%.tmp5676 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5675, i32 0, i32 0
%.tmp5677 = load i8*, i8** %.tmp5676
%.tmp5679 = getelementptr [11 x i8], [11 x i8]*@.str5678, i32 0, i32 0
%.tmp5680 = call i32(i8*,i8*) @strcmp(i8* %.tmp5677, i8* %.tmp5679)
%.tmp5681 = icmp eq i32 %.tmp5680, 0
br i1 %.tmp5681, label %.if.true.5682, label %.if.false.5682
.if.true.5682:
%.tmp5683 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5669
%.tmp5684 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5683, i32 0, i32 6
%.tmp5685 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5684
%.tmp5686 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5685, i32 0, i32 6
%.tmp5687 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5686
%.tmp5689 = getelementptr [6 x i8], [6 x i8]*@.str5688, i32 0, i32 0
%.tmp5690 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp5687, i8* %.tmp5689)
store %m307$.Node.type* %.tmp5690, %m307$.Node.type** %block.5646
%.tmp5691 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5692 = load %m307$.Node.type*, %m307$.Node.type** %block.5646
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5691, %m307$.Node.type* %.tmp5692)
br label %.if.end.5682
.if.false.5682:
%.tmp5693 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5694 = load %m307$.Node.type*, %m307$.Node.type** %else_block.5669
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_if_block.v.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5693, %m307$.Node.type* %.tmp5694)
br label %.if.end.5682
.if.end.5682:
br label %.if.end.5672
.if.false.5672:
br label %.if.end.5672
.if.end.5672:
%.tmp5695 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5696 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5695, i32 0, i32 1
%.tmp5697 = load %m0$.File.type*, %m0$.File.type** %.tmp5696
%.tmp5699 = getelementptr [23 x i8], [23 x i8]*@.str5698, i32 0, i32 0
%.tmp5700 = load i32, i32* %if_id.5617
%.tmp5701 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5697, i8* %.tmp5699, i32 %.tmp5700)
%.tmp5702 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5703 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5702, i32 0, i32 1
%.tmp5704 = load %m0$.File.type*, %m0$.File.type** %.tmp5703
%.tmp5706 = getelementptr [13 x i8], [13 x i8]*@.str5705, i32 0, i32 0
%.tmp5707 = load i32, i32* %if_id.5617
%.tmp5708 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5704, i8* %.tmp5706, i32 %.tmp5707)
ret void
}
define void @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp5709 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5710 = icmp ne %m307$.Node.type* %.tmp5709, null
br i1 %.tmp5710, label %.if.true.5711, label %.if.false.5711
.if.true.5711:
%.tmp5712 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5713 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5712, i32 0, i32 7
%.tmp5714 = load i8*, i8** %.tmp5713
%.tmp5715 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5716 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5715, i32 0, i32 3
%.tmp5717 = load i32, i32* %.tmp5716
%.tmp5718 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp5719 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5718, i32 0, i32 4
%.tmp5720 = load i32, i32* %.tmp5719
%.tmp5721 = load i8*, i8** %msg
%.tmp5722 = call %m751$.Error.type*(i8*,i32,i32,i8*) @m751$new.m751$.Error.typep.cp.i.i.cp(i8* %.tmp5714, i32 %.tmp5717, i32 %.tmp5720, i8* %.tmp5721)
%err.5723 = alloca %m751$.Error.type*
store %m751$.Error.type* %.tmp5722, %m751$.Error.type** %err.5723
%.tmp5724 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5725 = load %m751$.Error.type*, %m751$.Error.type** %err.5723
call void(%m1861$.CompilerCtx.type*,%m751$.Error.type*) @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.tmp5724, %m751$.Error.type* %.tmp5725)
br label %.if.end.5711
.if.false.5711:
%.tmp5727 = getelementptr [61 x i8], [61 x i8]*@.str5726, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp5727)
br label %.if.end.5711
.if.end.5711:
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
%.tmp5728 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5729 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*) @m1861$get_current_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp5728)
%mod.5730 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5729, %m1861$.ModuleLookup.type** %mod.5730
%.tmp5731 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5730
%.tmp5732 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5731, i32 0, i32 3
%.tmp5733 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5732
%.tmp5734 = icmp ne %m1861$.Scope.type* %.tmp5733, null
%.tmp5736 = getelementptr [82 x i8], [82 x i8]*@.str5735, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5734, i8* %.tmp5736)
%.tmp5737 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5730
%.tmp5738 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5737, i32 0, i32 3
%.tmp5739 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5738
%current_scope.5740 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5739, %m1861$.Scope.type** %current_scope.5740
%.tmp5741 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* null, i32 1
%.tmp5742 = ptrtoint %m1861$.ScopeItem.type* %.tmp5741 to i32
%.tmp5743 = call i8*(i32) @malloc(i32 %.tmp5742)
%.tmp5744 = bitcast i8* %.tmp5743 to %m1861$.ScopeItem.type*
%newitem.5745 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5744, %m1861$.ScopeItem.type** %newitem.5745
%.tmp5746 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5745
%.tmp5747 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5746, i32 0, i32 0
%.tmp5748 = load i8*, i8** %name
store i8* %.tmp5748, i8** %.tmp5747
%.tmp5749 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5745
%.tmp5750 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5749, i32 0, i32 1
%.tmp5751 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
store %m1861$.AssignableInfo.type* %.tmp5751, %m1861$.AssignableInfo.type** %.tmp5750
%.tmp5752 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5745
%.tmp5753 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5752, i32 0, i32 2
store %m1861$.ScopeItem.type* null, %m1861$.ScopeItem.type** %.tmp5753
%.tmp5754 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5755 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5754, i32 0, i32 2
%.tmp5756 = load i8*, i8** %name
store i8* %.tmp5756, i8** %.tmp5755
%.tmp5757 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5740
%.tmp5758 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5757, i32 0, i32 1
%.tmp5759 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5758
%.tmp5760 = icmp eq %m1861$.ScopeItem.type* %.tmp5759, null
br i1 %.tmp5760, label %.if.true.5761, label %.if.false.5761
.if.true.5761:
%.tmp5762 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5740
%.tmp5763 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5762, i32 0, i32 1
%.tmp5764 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5745
store %m1861$.ScopeItem.type* %.tmp5764, %m1861$.ScopeItem.type** %.tmp5763
ret void
br label %.if.end.5761
.if.false.5761:
br label %.if.end.5761
.if.end.5761:
%.tmp5765 = load %m1861$.Scope.type*, %m1861$.Scope.type** %current_scope.5740
%.tmp5766 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5765, i32 0, i32 1
%.tmp5767 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5766
%last_item.5768 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5767, %m1861$.ScopeItem.type** %last_item.5768
%.tmp5770 = getelementptr [1 x i8], [1 x i8]*@.str5769, i32 0, i32 0
%err_buf.5771 = alloca i8*
store i8* %.tmp5770, i8** %err_buf.5771
%.tmp5772 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5768
%.tmp5773 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5772, i32 0, i32 0
%.tmp5774 = load i8*, i8** %.tmp5773
%.tmp5775 = load i8*, i8** %name
%.tmp5776 = call i32(i8*,i8*) @strcmp(i8* %.tmp5774, i8* %.tmp5775)
%.tmp5777 = icmp eq i32 %.tmp5776, 0
br i1 %.tmp5777, label %.if.true.5778, label %.if.false.5778
.if.true.5778:
%.tmp5779 = getelementptr i8*, i8** %err_buf.5771, i32 0
%.tmp5781 = getelementptr [43 x i8], [43 x i8]*@.str5780, i32 0, i32 0
%.tmp5782 = load i8*, i8** %name
%.tmp5783 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5779, i8* %.tmp5781, i8* %.tmp5782)
%.tmp5784 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5785 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5786 = load i8*, i8** %err_buf.5771
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5784, %m307$.Node.type* %.tmp5785, i8* %.tmp5786)
br label %.if.end.5778
.if.false.5778:
br label %.if.end.5778
.if.end.5778:
br label %.for.start.5787
.for.start.5787:
%.tmp5788 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5768
%.tmp5789 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5788, i32 0, i32 2
%.tmp5790 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5789
%.tmp5791 = icmp ne %m1861$.ScopeItem.type* %.tmp5790, null
br i1 %.tmp5791, label %.for.continue.5787, label %.for.else.5787
.for.continue.5787:
%.tmp5792 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5768
%.tmp5793 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5792, i32 0, i32 0
%.tmp5794 = load i8*, i8** %.tmp5793
%.tmp5795 = load i8*, i8** %name
%.tmp5796 = call i32(i8*,i8*) @strcmp(i8* %.tmp5794, i8* %.tmp5795)
%.tmp5797 = icmp eq i32 %.tmp5796, 0
br i1 %.tmp5797, label %.if.true.5798, label %.if.false.5798
.if.true.5798:
%.tmp5799 = getelementptr i8*, i8** %err_buf.5771, i32 0
%.tmp5801 = getelementptr [43 x i8], [43 x i8]*@.str5800, i32 0, i32 0
%.tmp5802 = load i8*, i8** %name
%.tmp5803 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5799, i8* %.tmp5801, i8* %.tmp5802)
%.tmp5804 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5805 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp5806 = load i8*, i8** %err_buf.5771
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5804, %m307$.Node.type* %.tmp5805, i8* %.tmp5806)
br label %.for.end.5787
br label %.if.end.5798
.if.false.5798:
br label %.if.end.5798
.if.end.5798:
%.tmp5807 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5768
%.tmp5808 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5807, i32 0, i32 2
%.tmp5809 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5808
store %m1861$.ScopeItem.type* %.tmp5809, %m1861$.ScopeItem.type** %last_item.5768
br label %.for.start.5787
.for.else.5787:
%.tmp5810 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %last_item.5768
%.tmp5811 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5810, i32 0, i32 2
%.tmp5812 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %newitem.5745
store %m1861$.ScopeItem.type* %.tmp5812, %m1861$.ScopeItem.type** %.tmp5811
br label %.for.end.5787
.for.end.5787:
ret void
}
define %m1861$.ScopeItem.type* @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%err_buf.5813 = alloca i8*
store i8* null, i8** %err_buf.5813
%.tmp5814 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5815 = load i8*, i8** %module
%.tmp5816 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5817 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5816, i32 0, i32 1
%.tmp5818 = load i8*, i8** %.tmp5817
%.tmp5819 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp5814, i8* %.tmp5815, i8* %.tmp5818)
%found.5820 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5819, %m1861$.ScopeItem.type** %found.5820
%.tmp5821 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5820
%.tmp5822 = icmp eq %m1861$.ScopeItem.type* %.tmp5821, null
br i1 %.tmp5822, label %.if.true.5823, label %.if.false.5823
.if.true.5823:
%.tmp5824 = getelementptr i8*, i8** %err_buf.5813, i32 0
%.tmp5826 = getelementptr [31 x i8], [31 x i8]*@.str5825, i32 0, i32 0
%.tmp5827 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5828 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5827, i32 0, i32 1
%.tmp5829 = load i8*, i8** %.tmp5828
%.tmp5830 = load i8*, i8** %module
%.tmp5831 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5824, i8* %.tmp5826, i8* %.tmp5829, i8* %.tmp5830)
%.tmp5832 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5833 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5834 = load i8*, i8** %err_buf.5813
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5832, %m307$.Node.type* %.tmp5833, i8* %.tmp5834)
%.tmp5835 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5835
br label %.if.end.5823
.if.false.5823:
br label %.if.end.5823
.if.end.5823:
br label %.for.start.5836
.for.start.5836:
%.tmp5837 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5838 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5837, i32 0, i32 7
%.tmp5839 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5838
%.tmp5840 = icmp ne %m307$.Node.type* %.tmp5839, null
%.tmp5841 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5820
%.tmp5842 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5841, i32 0, i32 1
%.tmp5843 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5842
%.tmp5844 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5843, i32 0, i32 3
%.tmp5845 = load i8*, i8** %.tmp5844
%.tmp5847 = getelementptr [7 x i8], [7 x i8]*@.str5846, i32 0, i32 0
%.tmp5848 = call i32(i8*,i8*) @strcmp(i8* %.tmp5845, i8* %.tmp5847)
%.tmp5849 = icmp eq i32 %.tmp5848, 0
%.tmp5850 = and i1 %.tmp5840, %.tmp5849
br i1 %.tmp5850, label %.for.continue.5836, label %.for.end.5836
.for.continue.5836:
%.tmp5851 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5852 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5820
%.tmp5853 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5852, i32 0, i32 1
%.tmp5854 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp5853
%.tmp5855 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5854, i32 0, i32 0
%.tmp5856 = load i8*, i8** %.tmp5855
%.tmp5857 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5858 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5857, i32 0, i32 7
%.tmp5859 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5858
%.tmp5860 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5859, i32 0, i32 7
%.tmp5861 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5860
%.tmp5862 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5851, i8* %.tmp5856, %m307$.Node.type* %.tmp5861)
store %m1861$.ScopeItem.type* %.tmp5862, %m1861$.ScopeItem.type** %found.5820
%.tmp5863 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5820
%.tmp5864 = icmp eq %m1861$.ScopeItem.type* %.tmp5863, null
br i1 %.tmp5864, label %.if.true.5865, label %.if.false.5865
.if.true.5865:
%.tmp5866 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5866
br label %.if.end.5865
.if.false.5865:
br label %.if.end.5865
.if.end.5865:
br label %.for.start.5836
.for.end.5836:
%.tmp5867 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %found.5820
ret %m1861$.ScopeItem.type* %.tmp5867
}
define %m1861$.ScopeItem.type* @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%s = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.s.arg, %m1861$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp5868 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5869 = icmp eq %m1861$.Scope.type* %.tmp5868, null
br i1 %.tmp5869, label %.if.true.5870, label %.if.false.5870
.if.true.5870:
%.tmp5871 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5871
br label %.if.end.5870
.if.false.5870:
br label %.if.end.5870
.if.end.5870:
%.tmp5873 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s
%.tmp5874 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5873, i32 0, i32 1
%.tmp5875 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5874
%item.5876 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5875, %m1861$.ScopeItem.type** %item.5876
br label %.for.start.5872
.for.start.5872:
%.tmp5877 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5876
%.tmp5878 = icmp ne %m1861$.ScopeItem.type* %.tmp5877, null
br i1 %.tmp5878, label %.for.continue.5872, label %.for.end.5872
.for.continue.5872:
%.tmp5879 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5876
%.tmp5880 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5879, i32 0, i32 0
%.tmp5881 = load i8*, i8** %.tmp5880
%.tmp5882 = load i8*, i8** %name
%.tmp5883 = call i32(i8*,i8*) @strcmp(i8* %.tmp5881, i8* %.tmp5882)
%.tmp5884 = icmp eq i32 %.tmp5883, 0
br i1 %.tmp5884, label %.if.true.5885, label %.if.false.5885
.if.true.5885:
%.tmp5886 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5876
ret %m1861$.ScopeItem.type* %.tmp5886
br label %.if.end.5885
.if.false.5885:
br label %.if.end.5885
.if.end.5885:
%.tmp5887 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5876
%.tmp5888 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp5887, i32 0, i32 2
%.tmp5889 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %.tmp5888
store %m1861$.ScopeItem.type* %.tmp5889, %m1861$.ScopeItem.type** %item.5876
br label %.for.start.5872
.for.end.5872:
%.tmp5890 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5890
}
define %m1861$.ScopeItem.type* @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp5891 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5892 = load i8*, i8** %module
%.tmp5893 = call %m1861$.ModuleLookup.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$get_module.m1861$.ModuleLookup.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp5891, i8* %.tmp5892)
%mod.5894 = alloca %m1861$.ModuleLookup.type*
store %m1861$.ModuleLookup.type* %.tmp5893, %m1861$.ModuleLookup.type** %mod.5894
%.tmp5895 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5894
%.tmp5896 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5895, i32 0, i32 3
%.tmp5897 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5896
%.tmp5898 = icmp ne %m1861$.Scope.type* %.tmp5897, null
%.tmp5900 = getelementptr [77 x i8], [77 x i8]*@.str5899, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5898, i8* %.tmp5900)
%.tmp5902 = load %m1861$.ModuleLookup.type*, %m1861$.ModuleLookup.type** %mod.5894
%.tmp5903 = getelementptr %m1861$.ModuleLookup.type, %m1861$.ModuleLookup.type* %.tmp5902, i32 0, i32 3
%.tmp5904 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5903
%s.5905 = alloca %m1861$.Scope.type*
store %m1861$.Scope.type* %.tmp5904, %m1861$.Scope.type** %s.5905
br label %.for.start.5901
.for.start.5901:
%.tmp5906 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5905
%.tmp5907 = icmp ne %m1861$.Scope.type* %.tmp5906, null
br i1 %.tmp5907, label %.for.continue.5901, label %.for.end.5901
.for.continue.5901:
%.tmp5908 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5909 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5905
%.tmp5910 = load i8*, i8** %assignable_name
%.tmp5911 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m1861$.Scope.type*,i8*) @m1861$find_defined_here.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m1861$.Scope.typep.cp(%m1861$.CompilerCtx.type* %.tmp5908, %m1861$.Scope.type* %.tmp5909, i8* %.tmp5910)
%item.5912 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp5911, %m1861$.ScopeItem.type** %item.5912
%.tmp5913 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5912
%.tmp5914 = icmp ne %m1861$.ScopeItem.type* %.tmp5913, null
br i1 %.tmp5914, label %.if.true.5915, label %.if.false.5915
.if.true.5915:
%.tmp5916 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %item.5912
ret %m1861$.ScopeItem.type* %.tmp5916
br label %.if.end.5915
.if.false.5915:
br label %.if.end.5915
.if.end.5915:
%.tmp5917 = load %m1861$.Scope.type*, %m1861$.Scope.type** %s.5905
%.tmp5918 = getelementptr %m1861$.Scope.type, %m1861$.Scope.type* %.tmp5917, i32 0, i32 5
%.tmp5919 = load %m1861$.Scope.type*, %m1861$.Scope.type** %.tmp5918
store %m1861$.Scope.type* %.tmp5919, %m1861$.Scope.type** %s.5905
br label %.for.start.5901
.for.end.5901:
%.tmp5920 = bitcast ptr null to %m1861$.ScopeItem.type*
ret %m1861$.ScopeItem.type* %.tmp5920
}
define %m1861$.ScopeItem.type* @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dotted_name = alloca %m307$.Node.type*
store %m307$.Node.type* %.dotted_name.arg, %m307$.Node.type** %dotted_name
%.tmp5921 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5922 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5923 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp5922, i32 0, i32 7
%.tmp5924 = load i8*, i8** %.tmp5923
%.tmp5925 = load %m307$.Node.type*, %m307$.Node.type** %dotted_name
%.tmp5926 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5925, i32 0, i32 6
%.tmp5927 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5926
%.tmp5928 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,%m307$.Node.type*) @m1861$find_defined_in.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp5921, i8* %.tmp5924, %m307$.Node.type* %.tmp5927)
ret %m1861$.ScopeItem.type* %.tmp5928
}
define %m1861$.AssignableInfo.type* @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.dot_name_ptr.arg, %m1861$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m307$.Node.type*
store %m307$.Node.type* %.dot_name_ptr.arg, %m307$.Node.type** %dot_name_ptr
%info = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.info.arg, %m1861$.AssignableInfo.type** %info
%err_msg.5929 = alloca i8*
store i8* null, i8** %err_msg.5929
%buf.5930 = alloca i8*
store i8* null, i8** %buf.5930
%.tmp5931 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5932 = icmp eq %m1861$.AssignableInfo.type* %.tmp5931, null
br i1 %.tmp5932, label %.if.true.5933, label %.if.false.5933
.if.true.5933:
%.tmp5934 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5935 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5937 = getelementptr [54 x i8], [54 x i8]*@.str5936, i32 0, i32 0
%.tmp5938 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5934, %m307$.Node.type* %.tmp5935, i8* %.tmp5937)
%.tmp5939 = call i32(i8*,...) @printf(i8* %.tmp5938)
%.tmp5940 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5940
br label %.if.end.5933
.if.false.5933:
br label %.if.end.5933
.if.end.5933:
%.tmp5941 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5942 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5941, i32 0, i32 3
%.tmp5943 = load i8*, i8** %.tmp5942
%.tmp5945 = getelementptr [9 x i8], [9 x i8]*@.str5944, i32 0, i32 0
%.tmp5946 = call i32(i8*,i8*) @strcmp(i8* %.tmp5943, i8* %.tmp5945)
%.tmp5947 = icmp eq i32 %.tmp5946, 0
%.tmp5948 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5949 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5948, i32 0, i32 3
%.tmp5950 = load i8*, i8** %.tmp5949
%.tmp5952 = getelementptr [7 x i8], [7 x i8]*@.str5951, i32 0, i32 0
%.tmp5953 = call i32(i8*,i8*) @strcmp(i8* %.tmp5950, i8* %.tmp5952)
%.tmp5954 = icmp eq i32 %.tmp5953, 0
%.tmp5955 = or i1 %.tmp5947, %.tmp5954
br i1 %.tmp5955, label %.if.true.5956, label %.if.false.5956
.if.true.5956:
%.tmp5957 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5958 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5957, i32 0, i32 7
%.tmp5959 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5958
%.tmp5960 = icmp ne %m307$.Node.type* %.tmp5959, null
br i1 %.tmp5960, label %.if.true.5961, label %.if.false.5961
.if.true.5961:
%.tmp5962 = getelementptr i8*, i8** %err_msg.5929, i32 0
%.tmp5964 = getelementptr [46 x i8], [46 x i8]*@.str5963, i32 0, i32 0
%.tmp5965 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5966 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5965, i32 0, i32 7
%.tmp5967 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5966
%.tmp5968 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5967, i32 0, i32 7
%.tmp5969 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5968
%.tmp5970 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5969, i32 0, i32 1
%.tmp5971 = load i8*, i8** %.tmp5970
%.tmp5972 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5973 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5972, i32 0, i32 1
%.tmp5974 = load i8*, i8** %.tmp5973
%.tmp5975 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5962, i8* %.tmp5964, i8* %.tmp5971, i8* %.tmp5974)
%.tmp5976 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp5977 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5978 = load i8*, i8** %err_msg.5929
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp5976, %m307$.Node.type* %.tmp5977, i8* %.tmp5978)
%.tmp5979 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp5979
br label %.if.end.5961
.if.false.5961:
br label %.if.end.5961
.if.end.5961:
%.tmp5980 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp5980
br label %.if.end.5956
.if.false.5956:
%.tmp5981 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp5982 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5981, i32 0, i32 3
%.tmp5983 = load i8*, i8** %.tmp5982
%.tmp5985 = getelementptr [9 x i8], [9 x i8]*@.str5984, i32 0, i32 0
%.tmp5986 = call i32(i8*,i8*) @strcmp(i8* %.tmp5983, i8* %.tmp5985)
%.tmp5987 = icmp eq i32 %.tmp5986, 0
%.tmp5988 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp5989 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp5988, i32 0, i32 7
%.tmp5990 = load %m307$.Node.type*, %m307$.Node.type** %.tmp5989
%.tmp5991 = icmp ne %m307$.Node.type* %.tmp5990, null
%.tmp5992 = and i1 %.tmp5987, %.tmp5991
br i1 %.tmp5992, label %.if.true.5993, label %.if.false.5993
.if.true.5993:
%.tmp5994 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%base_var.5995 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp5994, %m1861$.AssignableInfo.type** %base_var.5995
%.tmp5996 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5995
%.tmp5997 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp5996, i32 0, i32 4
%.tmp5998 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp5997
%struct_info.5999 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp5998, %m1861$.Type.type** %struct_info.5999
br label %.for.start.6000
.for.start.6000:
%.tmp6001 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5995
%.tmp6002 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6001, i32 0, i32 4
%.tmp6003 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6002
%.tmp6004 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6003, i32 0, i32 0
%.tmp6005 = load i8*, i8** %.tmp6004
%.tmp6007 = getelementptr [4 x i8], [4 x i8]*@.str6006, i32 0, i32 0
%.tmp6008 = call i32(i8*,i8*) @strcmp(i8* %.tmp6005, i8* %.tmp6007)
%.tmp6009 = icmp eq i32 %.tmp6008, 0
br i1 %.tmp6009, label %.for.continue.6000, label %.for.end.6000
.for.continue.6000:
%.tmp6010 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6011 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6010)
%new_base.6012 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6011, %m1861$.AssignableInfo.type** %new_base.6012
%.tmp6013 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6014 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6012
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6013, %m1861$.AssignableInfo.type* %.tmp6014)
%.tmp6015 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6012
%.tmp6016 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6015, i32 0, i32 4
%.tmp6017 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5995
%.tmp6018 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6017, i32 0, i32 4
%.tmp6019 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6018
%.tmp6020 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6019, i32 0, i32 3
%.tmp6021 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6020
store %m1861$.Type.type* %.tmp6021, %m1861$.Type.type** %.tmp6016
%.tmp6022 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6023 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6022, i32 0, i32 1
%.tmp6024 = load %m0$.File.type*, %m0$.File.type** %.tmp6023
%.tmp6026 = getelementptr [23 x i8], [23 x i8]*@.str6025, i32 0, i32 0
%.tmp6027 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6012
%.tmp6028 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6027)
%.tmp6029 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6030 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6012
%.tmp6031 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6030, i32 0, i32 4
%.tmp6032 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6031
%.tmp6033 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6029, %m1861$.Type.type* %.tmp6032)
%.tmp6034 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6035 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5995
%.tmp6036 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6035, i32 0, i32 4
%.tmp6037 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6036
%.tmp6038 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6034, %m1861$.Type.type* %.tmp6037)
%.tmp6039 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5995
%.tmp6040 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6039)
%.tmp6041 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6024, i8* %.tmp6026, i8* %.tmp6028, i8* %.tmp6033, i8* %.tmp6038, i8* %.tmp6040)
%.tmp6042 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6012
store %m1861$.AssignableInfo.type* %.tmp6042, %m1861$.AssignableInfo.type** %base_var.5995
%.tmp6043 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5999
%.tmp6044 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6043, i32 0, i32 3
%.tmp6045 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6044
store %m1861$.Type.type* %.tmp6045, %m1861$.Type.type** %struct_info.5999
br label %.for.start.6000
.for.end.6000:
%.tmp6046 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5999
%.tmp6047 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6046, i32 0, i32 0
%.tmp6048 = load i8*, i8** %.tmp6047
%.tmp6050 = getelementptr [10 x i8], [10 x i8]*@.str6049, i32 0, i32 0
%.tmp6051 = call i32(i8*,i8*) @strcmp(i8* %.tmp6048, i8* %.tmp6050)
%.tmp6052 = icmp eq i32 %.tmp6051, 0
br i1 %.tmp6052, label %.if.true.6053, label %.if.false.6053
.if.true.6053:
%.tmp6054 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5999
%.tmp6055 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6054, i32 0, i32 3
%.tmp6056 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6055
store %m1861$.Type.type* %.tmp6056, %m1861$.Type.type** %struct_info.5999
br label %.if.end.6053
.if.false.6053:
br label %.if.end.6053
.if.end.6053:
%.tmp6057 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5999
%.tmp6058 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6057, i32 0, i32 0
%.tmp6059 = load i8*, i8** %.tmp6058
%.tmp6061 = getelementptr [7 x i8], [7 x i8]*@.str6060, i32 0, i32 0
%.tmp6062 = call i32(i8*,i8*) @strcmp(i8* %.tmp6059, i8* %.tmp6061)
%.tmp6063 = icmp ne i32 %.tmp6062, 0
br i1 %.tmp6063, label %.if.true.6064, label %.if.false.6064
.if.true.6064:
%.tmp6065 = getelementptr i8*, i8** %err_msg.5929, i32 0
%.tmp6067 = getelementptr [48 x i8], [48 x i8]*@.str6066, i32 0, i32 0
%.tmp6068 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6069 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6068, i32 0, i32 7
%.tmp6070 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6069
%.tmp6071 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6070, i32 0, i32 7
%.tmp6072 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6071
%.tmp6073 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6072, i32 0, i32 1
%.tmp6074 = load i8*, i8** %.tmp6073
%.tmp6075 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6076 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6075, i32 0, i32 1
%.tmp6077 = load i8*, i8** %.tmp6076
%.tmp6078 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6065, i8* %.tmp6067, i8* %.tmp6074, i8* %.tmp6077)
%.tmp6079 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6080 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6081 = load i8*, i8** %err_msg.5929
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6079, %m307$.Node.type* %.tmp6080, i8* %.tmp6081)
%.tmp6082 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6082
br label %.if.end.6064
.if.false.6064:
br label %.if.end.6064
.if.end.6064:
%.tmp6083 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6084 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6083, i32 0, i32 7
%.tmp6085 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6084
%.tmp6086 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6085, i32 0, i32 7
%.tmp6087 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6086
%.tmp6088 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6087, i32 0, i32 1
%.tmp6089 = load i8*, i8** %.tmp6088
%field_name.6090 = alloca i8*
store i8* %.tmp6089, i8** %field_name.6090
%field_id.6091 = alloca i32
store i32 0, i32* %field_id.6091
%.tmp6092 = bitcast ptr null to %m1861$.Type.type*
%found_field.6093 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6092, %m1861$.Type.type** %found_field.6093
%.tmp6095 = load %m1861$.Type.type*, %m1861$.Type.type** %struct_info.5999
%.tmp6096 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6095, i32 0, i32 3
%.tmp6097 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6096
%field.6098 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6097, %m1861$.Type.type** %field.6098
br label %.for.start.6094
.for.start.6094:
%.tmp6099 = load %m1861$.Type.type*, %m1861$.Type.type** %field.6098
%.tmp6100 = icmp ne %m1861$.Type.type* %.tmp6099, null
br i1 %.tmp6100, label %.for.continue.6094, label %.for.end.6094
.for.continue.6094:
%.tmp6101 = load %m1861$.Type.type*, %m1861$.Type.type** %field.6098
%.tmp6102 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6101, i32 0, i32 1
%.tmp6103 = load i8*, i8** %.tmp6102
%.tmp6104 = load i8*, i8** %field_name.6090
%.tmp6105 = call i32(i8*,i8*) @strcmp(i8* %.tmp6103, i8* %.tmp6104)
%.tmp6106 = icmp eq i32 %.tmp6105, 0
br i1 %.tmp6106, label %.if.true.6107, label %.if.false.6107
.if.true.6107:
%.tmp6108 = load %m1861$.Type.type*, %m1861$.Type.type** %field.6098
store %m1861$.Type.type* %.tmp6108, %m1861$.Type.type** %found_field.6093
br label %.for.end.6094
br label %.if.end.6107
.if.false.6107:
%.tmp6109 = load i32, i32* %field_id.6091
%.tmp6110 = add i32 %.tmp6109, 1
store i32 %.tmp6110, i32* %field_id.6091
br label %.if.end.6107
.if.end.6107:
%.tmp6111 = load %m1861$.Type.type*, %m1861$.Type.type** %field.6098
%.tmp6112 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6111, i32 0, i32 4
%.tmp6113 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6112
store %m1861$.Type.type* %.tmp6113, %m1861$.Type.type** %field.6098
br label %.for.start.6094
.for.end.6094:
%.tmp6114 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.6093
%.tmp6115 = icmp eq %m1861$.Type.type* %.tmp6114, null
br i1 %.tmp6115, label %.if.true.6116, label %.if.false.6116
.if.true.6116:
%.tmp6117 = getelementptr i8*, i8** %err_msg.5929, i32 0
%.tmp6119 = getelementptr [34 x i8], [34 x i8]*@.str6118, i32 0, i32 0
%.tmp6120 = load i8*, i8** %field_name.6090
%.tmp6121 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6122 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6121, i32 0, i32 1
%.tmp6123 = load i8*, i8** %.tmp6122
%.tmp6124 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6117, i8* %.tmp6119, i8* %.tmp6120, i8* %.tmp6123)
%.tmp6125 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6126 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6127 = load i8*, i8** %err_msg.5929
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6125, %m307$.Node.type* %.tmp6126, i8* %.tmp6127)
%.tmp6128 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6128
br label %.if.end.6116
.if.false.6116:
br label %.if.end.6116
.if.end.6116:
%.tmp6129 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6130 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6129)
%new_info.6131 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6130, %m1861$.AssignableInfo.type** %new_info.6131
%.tmp6132 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6131
%.tmp6133 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6132, i32 0, i32 4
%.tmp6134 = load %m1861$.Type.type*, %m1861$.Type.type** %found_field.6093
store %m1861$.Type.type* %.tmp6134, %m1861$.Type.type** %.tmp6133
%.tmp6135 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6136 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6131
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6135, %m1861$.AssignableInfo.type* %.tmp6136)
%.tmp6137 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6131
%.tmp6138 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6137, i32 0, i32 3
%.tmp6140 = getelementptr [9 x i8], [9 x i8]*@.str6139, i32 0, i32 0
store i8* %.tmp6140, i8** %.tmp6138
%.tmp6141 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6142 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5995
%.tmp6143 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6142, i32 0, i32 4
%.tmp6144 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6143
%.tmp6145 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6141, %m1861$.Type.type* %.tmp6144)
%info_tr.6146 = alloca i8*
store i8* %.tmp6145, i8** %info_tr.6146
%.tmp6147 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6148 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6147, i32 0, i32 1
%.tmp6149 = load %m0$.File.type*, %m0$.File.type** %.tmp6148
%.tmp6151 = getelementptr [46 x i8], [46 x i8]*@.str6150, i32 0, i32 0
%.tmp6152 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6131
%.tmp6153 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6152)
%.tmp6154 = load i8*, i8** %info_tr.6146
%.tmp6155 = load i8*, i8** %info_tr.6146
%.tmp6156 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base_var.5995
%.tmp6157 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6156)
%.tmp6158 = load i32, i32* %field_id.6091
%.tmp6159 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6149, i8* %.tmp6151, i8* %.tmp6153, i8* %.tmp6154, i8* %.tmp6155, i8* %.tmp6157, i32 %.tmp6158)
%.tmp6160 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6161 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6162 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6161, i32 0, i32 7
%.tmp6163 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6162
%.tmp6164 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6163, i32 0, i32 7
%.tmp6165 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6164
%.tmp6166 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_info.6131
%.tmp6167 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6160, %m307$.Node.type* %.tmp6165, %m1861$.AssignableInfo.type* %.tmp6166)
ret %m1861$.AssignableInfo.type* %.tmp6167
br label %.if.end.5993
.if.false.5993:
%.tmp6168 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp6169 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6168, i32 0, i32 3
%.tmp6170 = load i8*, i8** %.tmp6169
%.tmp6172 = getelementptr [9 x i8], [9 x i8]*@.str6171, i32 0, i32 0
%.tmp6173 = call i32(i8*,i8*) @strcmp(i8* %.tmp6170, i8* %.tmp6172)
%.tmp6174 = icmp eq i32 %.tmp6173, 0
br i1 %.tmp6174, label %.if.true.6175, label %.if.false.6175
.if.true.6175:
%.tmp6176 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
ret %m1861$.AssignableInfo.type* %.tmp6176
br label %.if.end.6175
.if.false.6175:
br label %.if.end.6175
.if.end.6175:
br label %.if.end.5993
.if.end.5993:
br label %.if.end.5956
.if.end.5956:
%.tmp6177 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6178 = load %m307$.Node.type*, %m307$.Node.type** %dot_name_ptr
%.tmp6180 = getelementptr [43 x i8], [43 x i8]*@.str6179, i32 0, i32 0
%.tmp6181 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6177, %m307$.Node.type* %.tmp6178, i8* %.tmp6180)
%.tmp6182 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
%.tmp6183 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6182, i32 0, i32 3
%.tmp6184 = load i8*, i8** %.tmp6183
%.tmp6185 = call i32(i8*,...) @printf(i8* %.tmp6181, i8* %.tmp6184)
%.tmp6186 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6186
}
define %m1861$.AssignableInfo.type* @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%err_msg.6187 = alloca i8*
store i8* null, i8** %err_msg.6187
%.tmp6188 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%curr_node.6189 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6188, %m307$.Node.type** %curr_node.6189
%.tmp6190 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6189
%.tmp6191 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6190, i32 0, i32 0
%.tmp6192 = load i8*, i8** %.tmp6191
%.tmp6194 = getelementptr [17 x i8], [17 x i8]*@.str6193, i32 0, i32 0
%.tmp6195 = call i32(i8*,i8*) @strcmp(i8* %.tmp6192, i8* %.tmp6194)
%.tmp6196 = icmp eq i32 %.tmp6195, 0
%.tmp6197 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6189
%.tmp6198 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6197, i32 0, i32 0
%.tmp6199 = load i8*, i8** %.tmp6198
%.tmp6201 = getelementptr [16 x i8], [16 x i8]*@.str6200, i32 0, i32 0
%.tmp6202 = call i32(i8*,i8*) @strcmp(i8* %.tmp6199, i8* %.tmp6201)
%.tmp6203 = icmp eq i32 %.tmp6202, 0
%.tmp6204 = or i1 %.tmp6196, %.tmp6203
%.tmp6205 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6189
%.tmp6206 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6205, i32 0, i32 0
%.tmp6207 = load i8*, i8** %.tmp6206
%.tmp6209 = getelementptr [11 x i8], [11 x i8]*@.str6208, i32 0, i32 0
%.tmp6210 = call i32(i8*,i8*) @strcmp(i8* %.tmp6207, i8* %.tmp6209)
%.tmp6211 = icmp eq i32 %.tmp6210, 0
%.tmp6212 = or i1 %.tmp6204, %.tmp6211
br i1 %.tmp6212, label %.if.true.6213, label %.if.false.6213
.if.true.6213:
%.tmp6214 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6215 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp6216 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6215, i32 0, i32 6
%.tmp6217 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6216
%.tmp6218 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6214, %m307$.Node.type* %.tmp6217)
ret %m1861$.AssignableInfo.type* %.tmp6218
br label %.if.end.6213
.if.false.6213:
br label %.if.end.6213
.if.end.6213:
%.tmp6219 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6189
%.tmp6220 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6219, i32 0, i32 0
%.tmp6221 = load i8*, i8** %.tmp6220
%.tmp6223 = getelementptr [12 x i8], [12 x i8]*@.str6222, i32 0, i32 0
%.tmp6224 = call i32(i8*,i8*) @strcmp(i8* %.tmp6221, i8* %.tmp6223)
%.tmp6225 = icmp ne i32 %.tmp6224, 0
br i1 %.tmp6225, label %.if.true.6226, label %.if.false.6226
.if.true.6226:
%.tmp6228 = getelementptr [92 x i8], [92 x i8]*@.str6227, i32 0, i32 0
%.tmp6229 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6189
%.tmp6230 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6229, i32 0, i32 0
%.tmp6231 = load i8*, i8** %.tmp6230
%.tmp6232 = call i32(i8*,...) @printf(i8* %.tmp6228, i8* %.tmp6231)
%.tmp6233 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp6234 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6233, i32 0, i32 6
%.tmp6235 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6234
store %m307$.Node.type* %.tmp6235, %m307$.Node.type** %curr_node.6189
br label %.if.end.6226
.if.false.6226:
br label %.if.end.6226
.if.end.6226:
%.tmp6236 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6189
%.tmp6237 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6236, i32 0, i32 6
%.tmp6238 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6237
%assignable_name.6239 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6238, %m307$.Node.type** %assignable_name.6239
%.tmp6240 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6241 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6242 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6241, i32 0, i32 7
%.tmp6243 = load i8*, i8** %.tmp6242
%.tmp6244 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6239
%.tmp6245 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6244, i32 0, i32 6
%.tmp6246 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6245
%.tmp6247 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6246, i32 0, i32 1
%.tmp6248 = load i8*, i8** %.tmp6247
%.tmp6249 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp6240, i8* %.tmp6243, i8* %.tmp6248)
%scope_info.6250 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp6249, %m1861$.ScopeItem.type** %scope_info.6250
%.tmp6251 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6250
%.tmp6252 = icmp eq %m1861$.ScopeItem.type* %.tmp6251, null
br i1 %.tmp6252, label %.if.true.6253, label %.if.false.6253
.if.true.6253:
%.tmp6254 = getelementptr i8*, i8** %err_msg.6187, i32 0
%.tmp6256 = getelementptr [41 x i8], [41 x i8]*@.str6255, i32 0, i32 0
%.tmp6257 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6239
%.tmp6258 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6257, i32 0, i32 6
%.tmp6259 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6258
%.tmp6260 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6259, i32 0, i32 1
%.tmp6261 = load i8*, i8** %.tmp6260
%.tmp6262 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6254, i8* %.tmp6256, i8* %.tmp6261)
%.tmp6263 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6264 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6239
%.tmp6265 = load i8*, i8** %err_msg.6187
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6263, %m307$.Node.type* %.tmp6264, i8* %.tmp6265)
%.tmp6266 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6266
br label %.if.end.6253
.if.false.6253:
br label %.if.end.6253
.if.end.6253:
%.tmp6267 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6250
%.tmp6268 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp6267, i32 0, i32 1
%.tmp6269 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp6268
%info.6270 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6269, %m1861$.AssignableInfo.type** %info.6270
%.tmp6271 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6270
%.tmp6272 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6271, i32 0, i32 3
%.tmp6273 = load i8*, i8** %.tmp6272
%.tmp6275 = getelementptr [7 x i8], [7 x i8]*@.str6274, i32 0, i32 0
%.tmp6276 = call i32(i8*,i8*) @strcmp(i8* %.tmp6273, i8* %.tmp6275)
%.tmp6277 = icmp eq i32 %.tmp6276, 0
br i1 %.tmp6277, label %.if.true.6278, label %.if.false.6278
.if.true.6278:
%.tmp6279 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6280 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6270
%.tmp6281 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6280)
%.tmp6282 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6239
%.tmp6283 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6282, i32 0, i32 6
%.tmp6284 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6283
%.tmp6285 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6284, i32 0, i32 7
%.tmp6286 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6285
%.tmp6287 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6286, i32 0, i32 7
%.tmp6288 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6287
%.tmp6289 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6288, i32 0, i32 1
%.tmp6290 = load i8*, i8** %.tmp6289
%.tmp6291 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,i8*,i8*) @m1861$find_defined_str.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.cp.cp(%m1861$.CompilerCtx.type* %.tmp6279, i8* %.tmp6281, i8* %.tmp6290)
store %m1861$.ScopeItem.type* %.tmp6291, %m1861$.ScopeItem.type** %scope_info.6250
%.tmp6292 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6250
%.tmp6293 = icmp eq %m1861$.ScopeItem.type* %.tmp6292, null
br i1 %.tmp6293, label %.if.true.6294, label %.if.false.6294
.if.true.6294:
%.tmp6295 = getelementptr i8*, i8** %err_msg.6187, i32 0
%.tmp6297 = getelementptr [31 x i8], [31 x i8]*@.str6296, i32 0, i32 0
%.tmp6298 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6239
%.tmp6299 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6298, i32 0, i32 6
%.tmp6300 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6299
%.tmp6301 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6300, i32 0, i32 7
%.tmp6302 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6301
%.tmp6303 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6302, i32 0, i32 7
%.tmp6304 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6303
%.tmp6305 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6304, i32 0, i32 1
%.tmp6306 = load i8*, i8** %.tmp6305
%.tmp6307 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6270
%.tmp6308 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6307)
%.tmp6309 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6295, i8* %.tmp6297, i8* %.tmp6306, i8* %.tmp6308)
%.tmp6310 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6311 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6189
%.tmp6312 = load i8*, i8** %err_msg.6187
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6310, %m307$.Node.type* %.tmp6311, i8* %.tmp6312)
%.tmp6313 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp6313
br label %.if.end.6294
.if.false.6294:
br label %.if.end.6294
.if.end.6294:
%.tmp6314 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %scope_info.6250
%.tmp6315 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp6314, i32 0, i32 1
%.tmp6316 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp6315
store %m1861$.AssignableInfo.type* %.tmp6316, %m1861$.AssignableInfo.type** %info.6270
%.tmp6317 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6239
%.tmp6318 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6317, i32 0, i32 6
%.tmp6319 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6318
%.tmp6320 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6319, i32 0, i32 7
%.tmp6321 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6320
%.tmp6322 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6321, i32 0, i32 7
%.tmp6323 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6322
store %m307$.Node.type* %.tmp6323, %m307$.Node.type** %assignable_name.6239
br label %.if.end.6278
.if.false.6278:
%.tmp6324 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6239
%.tmp6325 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6324, i32 0, i32 6
%.tmp6326 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6325
store %m307$.Node.type* %.tmp6326, %m307$.Node.type** %assignable_name.6239
br label %.if.end.6278
.if.end.6278:
%.tmp6327 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6328 = load %m307$.Node.type*, %m307$.Node.type** %assignable_name.6239
%.tmp6329 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6270
%.tmp6330 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,%m1861$.AssignableInfo.type*) @m1861$get_dotted_name.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6327, %m307$.Node.type* %.tmp6328, %m1861$.AssignableInfo.type* %.tmp6329)
%base.6331 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6330, %m1861$.AssignableInfo.type** %base.6331
%.tmp6333 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6189
%.tmp6334 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6333, i32 0, i32 6
%.tmp6335 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6334
%.tmp6336 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6335, i32 0, i32 7
%.tmp6337 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6336
%addr.6338 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6337, %m307$.Node.type** %addr.6338
br label %.for.start.6332
.for.start.6332:
%.tmp6339 = load %m307$.Node.type*, %m307$.Node.type** %addr.6338
%.tmp6340 = icmp ne %m307$.Node.type* %.tmp6339, null
br i1 %.tmp6340, label %.for.continue.6332, label %.for.end.6332
.for.continue.6332:
%.tmp6341 = load %m307$.Node.type*, %m307$.Node.type** %addr.6338
%.tmp6342 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6341, i32 0, i32 7
%.tmp6343 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6342
%index.6344 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6343, %m307$.Node.type** %index.6344
%.tmp6345 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6346 = load %m307$.Node.type*, %m307$.Node.type** %index.6344
%.tmp6347 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6345, %m307$.Node.type* %.tmp6346)
%index_info.6348 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6347, %m1861$.AssignableInfo.type** %index_info.6348
%.tmp6349 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6350 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6348
%.tmp6351 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6350, i32 0, i32 4
%.tmp6352 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6351
%.tmp6353 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6349, %m1861$.Type.type* %.tmp6352)
%index_type.6354 = alloca i8*
store i8* %.tmp6353, i8** %index_type.6354
%.tmp6355 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6331
%.tmp6356 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6355, i32 0, i32 4
%.tmp6357 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6356
%.tmp6358 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6357, i32 0, i32 1
%.tmp6359 = load i8*, i8** %.tmp6358
%.tmp6360 = icmp ne i8* %.tmp6359, null
br i1 %.tmp6360, label %.if.true.6361, label %.if.false.6361
.if.true.6361:
%.tmp6362 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6331
%.tmp6363 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6362, i32 0, i32 4
%.tmp6364 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6363
%.tmp6365 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6364, i32 0, i32 1
%.tmp6366 = load i8*, i8** %.tmp6365
%.tmp6368 = getelementptr [6 x i8], [6 x i8]*@.str6367, i32 0, i32 0
%.tmp6369 = call i32(i8*,i8*) @strcmp(i8* %.tmp6366, i8* %.tmp6368)
%.tmp6370 = icmp eq i32 %.tmp6369, 0
br i1 %.tmp6370, label %.if.true.6371, label %.if.false.6371
.if.true.6371:
%.tmp6372 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6189
%.tmp6373 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6372)
%new_base.6374 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6373, %m1861$.AssignableInfo.type** %new_base.6374
%.tmp6375 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6376 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6374
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6375, %m1861$.AssignableInfo.type* %.tmp6376)
%.tmp6377 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6378 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6377, i32 0, i32 1
%.tmp6379 = load %m0$.File.type*, %m0$.File.type** %.tmp6378
%.tmp6381 = getelementptr [45 x i8], [45 x i8]*@.str6380, i32 0, i32 0
%.tmp6382 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6374
%.tmp6383 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6382)
%.tmp6384 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6385 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6331
%.tmp6386 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6385, i32 0, i32 4
%.tmp6387 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6386
%.tmp6388 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6384, %m1861$.Type.type* %.tmp6387)
%.tmp6389 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6390 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6331
%.tmp6391 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6390, i32 0, i32 4
%.tmp6392 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6391
%.tmp6393 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6389, %m1861$.Type.type* %.tmp6392)
%.tmp6394 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6331
%.tmp6395 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6394)
%.tmp6396 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6379, i8* %.tmp6381, i8* %.tmp6383, i8* %.tmp6388, i8* %.tmp6393, i8* %.tmp6395)
%.tmp6397 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6374
%.tmp6398 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6397, i32 0, i32 4
%.tmp6399 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6331
%.tmp6400 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6399, i32 0, i32 4
%.tmp6401 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6400
%.tmp6402 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6401, i32 0, i32 3
%.tmp6403 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6402
%.tmp6404 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp6403)
store %m1861$.Type.type* %.tmp6404, %m1861$.Type.type** %.tmp6398
%.tmp6405 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6374
%.tmp6406 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6405, i32 0, i32 4
%.tmp6407 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6406
%.tmp6408 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6407, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp6408
%.tmp6409 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6374
store %m1861$.AssignableInfo.type* %.tmp6409, %m1861$.AssignableInfo.type** %base.6331
br label %.if.end.6371
.if.false.6371:
br label %.if.end.6371
.if.end.6371:
br label %.if.end.6361
.if.false.6361:
br label %.if.end.6361
.if.end.6361:
%.tmp6410 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6411 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6331
%.tmp6412 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6411, i32 0, i32 4
%.tmp6413 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6412
%.tmp6414 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6410, %m1861$.Type.type* %.tmp6413)
%base_type.6415 = alloca i8*
store i8* %.tmp6414, i8** %base_type.6415
%.tmp6416 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6417 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp6416)
%tmp_id.6418 = alloca i32
store i32 %.tmp6417, i32* %tmp_id.6418
%.tmp6419 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6420 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6419, i32 0, i32 1
%.tmp6421 = load %m0$.File.type*, %m0$.File.type** %.tmp6420
%.tmp6423 = getelementptr [28 x i8], [28 x i8]*@.str6422, i32 0, i32 0
%.tmp6424 = load i32, i32* %tmp_id.6418
%.tmp6425 = load i8*, i8** %base_type.6415
%.tmp6426 = load i8*, i8** %base_type.6415
%.tmp6427 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6331
%.tmp6428 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6427)
%.tmp6429 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6421, i8* %.tmp6423, i32 %.tmp6424, i8* %.tmp6425, i8* %.tmp6426, i8* %.tmp6428)
%.tmp6430 = load %m307$.Node.type*, %m307$.Node.type** %curr_node.6189
%.tmp6431 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6430)
%new_base.6432 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6431, %m1861$.AssignableInfo.type** %new_base.6432
%.tmp6433 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6434 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6432
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6433, %m1861$.AssignableInfo.type* %.tmp6434)
%.tmp6435 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6331
%.tmp6436 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6435, i32 0, i32 4
%.tmp6437 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6436
%.tmp6438 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6437, i32 0, i32 3
%.tmp6439 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6438
%.tmp6440 = icmp eq %m1861$.Type.type* %.tmp6439, null
br i1 %.tmp6440, label %.if.true.6441, label %.if.false.6441
.if.true.6441:
%.tmp6442 = getelementptr i8*, i8** %err_msg.6187, i32 0
%.tmp6444 = getelementptr [35 x i8], [35 x i8]*@.str6443, i32 0, i32 0
%.tmp6445 = load i8*, i8** %base_type.6415
%.tmp6446 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6442, i8* %.tmp6444, i8* %.tmp6445)
%.tmp6447 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6448 = load %m307$.Node.type*, %m307$.Node.type** %addr.6338
%.tmp6449 = load i8*, i8** %err_msg.6187
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6447, %m307$.Node.type* %.tmp6448, i8* %.tmp6449)
%.tmp6450 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6331
ret %m1861$.AssignableInfo.type* %.tmp6450
br label %.if.end.6441
.if.false.6441:
br label %.if.end.6441
.if.end.6441:
%.tmp6451 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6432
%.tmp6452 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6451, i32 0, i32 4
%.tmp6453 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6331
%.tmp6454 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6453, i32 0, i32 4
%.tmp6455 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6454
%.tmp6456 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6455, i32 0, i32 3
%.tmp6457 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6456
store %m1861$.Type.type* %.tmp6457, %m1861$.Type.type** %.tmp6452
%.tmp6458 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6459 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6432
%.tmp6460 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6459, i32 0, i32 4
%.tmp6461 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6460
%.tmp6462 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6458, %m1861$.Type.type* %.tmp6461)
%base_type_2.6463 = alloca i8*
store i8* %.tmp6462, i8** %base_type_2.6463
%.tmp6464 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6465 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6464, i32 0, i32 1
%.tmp6466 = load %m0$.File.type*, %m0$.File.type** %.tmp6465
%.tmp6468 = getelementptr [44 x i8], [44 x i8]*@.str6467, i32 0, i32 0
%.tmp6469 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6432
%.tmp6470 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6469)
%.tmp6471 = load i8*, i8** %base_type_2.6463
%.tmp6472 = load i8*, i8** %base_type_2.6463
%.tmp6473 = load i32, i32* %tmp_id.6418
%.tmp6474 = load i8*, i8** %index_type.6354
%.tmp6475 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %index_info.6348
%.tmp6476 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6475)
%.tmp6477 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6466, i8* %.tmp6468, i8* %.tmp6470, i8* %.tmp6471, i8* %.tmp6472, i32 %.tmp6473, i8* %.tmp6474, i8* %.tmp6476)
%.tmp6478 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %new_base.6432
store %m1861$.AssignableInfo.type* %.tmp6478, %m1861$.AssignableInfo.type** %base.6331
%.tmp6479 = load %m307$.Node.type*, %m307$.Node.type** %addr.6338
%.tmp6480 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6479, i32 0, i32 7
%.tmp6481 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6480
%.tmp6482 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6481, i32 0, i32 7
%.tmp6483 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6482
%.tmp6484 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6483, i32 0, i32 7
%.tmp6485 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6484
store %m307$.Node.type* %.tmp6485, %m307$.Node.type** %addr.6338
br label %.for.start.6332
.for.end.6332:
%.tmp6486 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %base.6331
ret %m1861$.AssignableInfo.type* %.tmp6486
}
%m1861$.StackHead.type = type {%m1988$.SYStack.type*}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6487 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6488 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6487, i32 0, i32 6
%.tmp6489 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6488
%.tmp6491 = getelementptr [16 x i8], [16 x i8]*@.str6490, i32 0, i32 0
%.tmp6492 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6489, i8* %.tmp6491)
%assignable_start.6493 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6492, %m307$.Node.type** %assignable_start.6493
%.tmp6494 = load %m307$.Node.type*, %m307$.Node.type** %assignable_start.6493
%.tmp6495 = call %m1988$.SYStack.type*(%m307$.Node.type*) @m1988$sy_algorithm.m1988$.SYStack.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6494)
%operator_stack.6496 = alloca %m1988$.SYStack.type*
store %m1988$.SYStack.type* %.tmp6495, %m1988$.SYStack.type** %operator_stack.6496
%.tmp6497 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* null, i32 1
%.tmp6498 = ptrtoint %m1861$.StackHead.type* %.tmp6497 to i32
%.tmp6499 = call i8*(i32) @malloc(i32 %.tmp6498)
%.tmp6500 = bitcast i8* %.tmp6499 to %m1861$.StackHead.type*
%stack.6501 = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.tmp6500, %m1861$.StackHead.type** %stack.6501
%.tmp6502 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6501
%.tmp6503 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6502, i32 0, i32 0
%.tmp6504 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %operator_stack.6496
store %m1988$.SYStack.type* %.tmp6504, %m1988$.SYStack.type** %.tmp6503
%.tmp6505 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6506 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack.6501
%.tmp6507 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6505, %m1861$.StackHead.type* %.tmp6506)
%info.6508 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6507, %m1861$.AssignableInfo.type** %info.6508
%.tmp6509 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6508
%.tmp6510 = icmp eq %m1861$.AssignableInfo.type* %.tmp6509, null
br i1 %.tmp6510, label %.if.true.6511, label %.if.false.6511
.if.true.6511:
%.tmp6512 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6508
ret %m1861$.AssignableInfo.type* %.tmp6512
br label %.if.end.6511
.if.false.6511:
br label %.if.end.6511
.if.end.6511:
%.tmp6513 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6514 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6513, i32 0, i32 6
%.tmp6515 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6514
%.tmp6517 = getelementptr [5 x i8], [5 x i8]*@.str6516, i32 0, i32 0
%.tmp6518 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6515, i8* %.tmp6517)
%cast.6519 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6518, %m307$.Node.type** %cast.6519
%.tmp6520 = load %m307$.Node.type*, %m307$.Node.type** %cast.6519
%.tmp6521 = icmp ne %m307$.Node.type* %.tmp6520, null
br i1 %.tmp6521, label %.if.true.6522, label %.if.false.6522
.if.true.6522:
%.tmp6523 = load %m307$.Node.type*, %m307$.Node.type** %cast.6519
%.tmp6524 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6523, i32 0, i32 6
%.tmp6525 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6524
%.tmp6527 = getelementptr [5 x i8], [5 x i8]*@.str6526, i32 0, i32 0
%.tmp6528 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp6525, i8* %.tmp6527)
%cast_type.6529 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6528, %m307$.Node.type** %cast_type.6529
%.tmp6530 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6531 = load %m307$.Node.type*, %m307$.Node.type** %cast_type.6529
%.tmp6532 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6531, i32 0, i32 6
%.tmp6533 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6532
%.tmp6534 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6530, %m307$.Node.type* %.tmp6533)
%type.6535 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6534, %m1861$.Type.type** %type.6535
%.tmp6536 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6508
%.tmp6537 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6536)
%prev_id.6538 = alloca i8*
store i8* %.tmp6537, i8** %prev_id.6538
%.tmp6539 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6540 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6508
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6539, %m1861$.AssignableInfo.type* %.tmp6540)
%.tmp6541 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6542 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6508
%.tmp6543 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6542, i32 0, i32 4
%.tmp6544 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6543
%.tmp6545 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6541, %m1861$.Type.type* %.tmp6544)
%from_type.6546 = alloca i8*
store i8* %.tmp6545, i8** %from_type.6546
%.tmp6547 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6548 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6535
%.tmp6549 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6547, %m1861$.Type.type* %.tmp6548)
%to_type.6550 = alloca i8*
store i8* %.tmp6549, i8** %to_type.6550
%.tmp6552 = getelementptr [8 x i8], [8 x i8]*@.str6551, i32 0, i32 0
%cast_fn.6553 = alloca i8*
store i8* %.tmp6552, i8** %cast_fn.6553
%.tmp6554 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6508
%.tmp6555 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6554, i32 0, i32 4
%.tmp6556 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6555
%.tmp6557 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6556, i32 0, i32 1
%.tmp6558 = load i8*, i8** %.tmp6557
%.tmp6559 = icmp ne i8* %.tmp6558, null
br i1 %.tmp6559, label %.if.true.6560, label %.if.false.6560
.if.true.6560:
%.tmp6561 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6508
%.tmp6562 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6561, i32 0, i32 4
%.tmp6563 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6562
%.tmp6564 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6563, i32 0, i32 1
%.tmp6565 = load i8*, i8** %.tmp6564
%.tmp6567 = getelementptr [6 x i8], [6 x i8]*@.str6566, i32 0, i32 0
%.tmp6568 = call i32(i8*,i8*) @strcmp(i8* %.tmp6565, i8* %.tmp6567)
%.tmp6569 = icmp eq i32 %.tmp6568, 0
br i1 %.tmp6569, label %.if.true.6570, label %.if.false.6570
.if.true.6570:
%.tmp6572 = getelementptr [48 x i8], [48 x i8]*@.str6571, i32 0, i32 0
%.tmp6573 = call i32(i8*,...) @printf(i8* %.tmp6572)
br label %.if.end.6570
.if.false.6570:
br label %.if.end.6570
.if.end.6570:
br label %.if.end.6560
.if.false.6560:
br label %.if.end.6560
.if.end.6560:
%.tmp6574 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6508
%.tmp6575 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6574, i32 0, i32 4
%.tmp6576 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6575
%.tmp6577 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6576, i32 0, i32 0
%.tmp6578 = load i8*, i8** %.tmp6577
%.tmp6580 = getelementptr [4 x i8], [4 x i8]*@.str6579, i32 0, i32 0
%.tmp6581 = call i32(i8*,i8*) @strcmp(i8* %.tmp6578, i8* %.tmp6580)
%.tmp6582 = icmp ne i32 %.tmp6581, 0
%.tmp6583 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6535
%.tmp6584 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6583, i32 0, i32 0
%.tmp6585 = load i8*, i8** %.tmp6584
%.tmp6587 = getelementptr [4 x i8], [4 x i8]*@.str6586, i32 0, i32 0
%.tmp6588 = call i32(i8*,i8*) @strcmp(i8* %.tmp6585, i8* %.tmp6587)
%.tmp6589 = icmp ne i32 %.tmp6588, 0
%.tmp6590 = and i1 %.tmp6582, %.tmp6589
br i1 %.tmp6590, label %.if.true.6591, label %.if.false.6591
.if.true.6591:
%.tmp6592 = load i8*, i8** %from_type.6546
%.tmp6593 = getelementptr i8, i8* %.tmp6592, i32 0
%.tmp6594 = load i8, i8* %.tmp6593
%.tmp6595 = icmp eq i8 %.tmp6594, 105
%.tmp6596 = load i8*, i8** %to_type.6550
%.tmp6597 = getelementptr i8, i8* %.tmp6596, i32 0
%.tmp6598 = load i8, i8* %.tmp6597
%.tmp6599 = icmp eq i8 %.tmp6598, 105
%.tmp6600 = and i1 %.tmp6595, %.tmp6599
br i1 %.tmp6600, label %.if.true.6601, label %.if.false.6601
.if.true.6601:
%from_size.6602 = alloca i32
store i32 0, i32* %from_size.6602
%to_size.6603 = alloca i32
store i32 0, i32* %to_size.6603
%.tmp6604 = load i8*, i8** %from_type.6546
%.tmp6606 = getelementptr [4 x i8], [4 x i8]*@.str6605, i32 0, i32 0
%.tmp6607 = getelementptr i32, i32* %from_size.6602, i32 0
%.tmp6608 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6604, i8* %.tmp6606, i32* %.tmp6607)
%.tmp6609 = load i8*, i8** %to_type.6550
%.tmp6611 = getelementptr [4 x i8], [4 x i8]*@.str6610, i32 0, i32 0
%.tmp6612 = getelementptr i32, i32* %to_size.6603, i32 0
%.tmp6613 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp6609, i8* %.tmp6611, i32* %.tmp6612)
%.tmp6614 = load i32, i32* %from_size.6602
%.tmp6615 = load i32, i32* %to_size.6603
%.tmp6616 = icmp slt i32 %.tmp6614, %.tmp6615
br i1 %.tmp6616, label %.if.true.6617, label %.if.false.6617
.if.true.6617:
%.tmp6619 = getelementptr [5 x i8], [5 x i8]*@.str6618, i32 0, i32 0
store i8* %.tmp6619, i8** %cast_fn.6553
br label %.if.end.6617
.if.false.6617:
%.tmp6621 = getelementptr [6 x i8], [6 x i8]*@.str6620, i32 0, i32 0
store i8* %.tmp6621, i8** %cast_fn.6553
br label %.if.end.6617
.if.end.6617:
br label %.if.end.6601
.if.false.6601:
br label %.if.end.6601
.if.end.6601:
br label %.if.end.6591
.if.false.6591:
br label %.if.end.6591
.if.end.6591:
%.tmp6622 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6623 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6622, i32 0, i32 1
%.tmp6624 = load %m0$.File.type*, %m0$.File.type** %.tmp6623
%.tmp6626 = getelementptr [21 x i8], [21 x i8]*@.str6625, i32 0, i32 0
%.tmp6627 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6508
%.tmp6628 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6627)
%.tmp6629 = load i8*, i8** %cast_fn.6553
%.tmp6630 = load i8*, i8** %from_type.6546
%.tmp6631 = load i8*, i8** %prev_id.6538
%.tmp6632 = load i8*, i8** %to_type.6550
%.tmp6633 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6624, i8* %.tmp6626, i8* %.tmp6628, i8* %.tmp6629, i8* %.tmp6630, i8* %.tmp6631, i8* %.tmp6632)
%.tmp6634 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6508
%.tmp6635 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6634, i32 0, i32 4
%.tmp6636 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6535
store %m1861$.Type.type* %.tmp6636, %m1861$.Type.type** %.tmp6635
br label %.if.end.6522
.if.false.6522:
br label %.if.end.6522
.if.end.6522:
%.tmp6637 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.6508
ret %m1861$.AssignableInfo.type* %.tmp6637
}
define %m1861$.AssignableInfo.type* @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stack = alloca %m1861$.StackHead.type*
store %m1861$.StackHead.type* %.stack.arg, %m1861$.StackHead.type** %stack
%.tmp6638 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6639 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6638, i32 0, i32 0
%.tmp6640 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6639
%.tmp6641 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6640, i32 0, i32 0
%.tmp6642 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6641
%.tmp6643 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6642, i32 0, i32 0
%.tmp6644 = load i8*, i8** %.tmp6643
%.tmp6646 = getelementptr [16 x i8], [16 x i8]*@.str6645, i32 0, i32 0
%.tmp6647 = call i32(i8*,i8*) @strcmp(i8* %.tmp6644, i8* %.tmp6646)
%.tmp6648 = icmp eq i32 %.tmp6647, 0
br i1 %.tmp6648, label %.if.true.6649, label %.if.false.6649
.if.true.6649:
%.tmp6650 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6651 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6652 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6651, i32 0, i32 0
%.tmp6653 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6652
%.tmp6654 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6653, i32 0, i32 0
%.tmp6655 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6654
%.tmp6656 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6650, %m307$.Node.type* %.tmp6655)
ret %m1861$.AssignableInfo.type* %.tmp6656
br label %.if.end.6649
.if.false.6649:
br label %.if.end.6649
.if.end.6649:
%.tmp6657 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6658 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6657, i32 0, i32 0
%.tmp6659 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6658
%.tmp6660 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6659, i32 0, i32 0
%.tmp6661 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6660
%.tmp6662 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6661, i32 0, i32 6
%.tmp6663 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6662
%operator.6664 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6663, %m307$.Node.type** %operator.6664
%.tmp6665 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6666 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6665, i32 0, i32 0
%.tmp6667 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6668 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6667, i32 0, i32 0
%.tmp6669 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6668
%.tmp6670 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6669, i32 0, i32 1
%.tmp6671 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6670
store %m1988$.SYStack.type* %.tmp6671, %m1988$.SYStack.type** %.tmp6666
%.tmp6672 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6673 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6674 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6672, %m1861$.StackHead.type* %.tmp6673)
%A.6675 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6674, %m1861$.AssignableInfo.type** %A.6675
%.tmp6676 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6675
%.tmp6677 = icmp eq %m1861$.AssignableInfo.type* %.tmp6676, null
br i1 %.tmp6677, label %.if.true.6678, label %.if.false.6678
.if.true.6678:
%.tmp6679 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6675
ret %m1861$.AssignableInfo.type* %.tmp6679
br label %.if.end.6678
.if.false.6678:
br label %.if.end.6678
.if.end.6678:
%.tmp6680 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6681 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6680, i32 0, i32 0
%.tmp6682 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6683 = getelementptr %m1861$.StackHead.type, %m1861$.StackHead.type* %.tmp6682, i32 0, i32 0
%.tmp6684 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6683
%.tmp6685 = getelementptr %m1988$.SYStack.type, %m1988$.SYStack.type* %.tmp6684, i32 0, i32 1
%.tmp6686 = load %m1988$.SYStack.type*, %m1988$.SYStack.type** %.tmp6685
store %m1988$.SYStack.type* %.tmp6686, %m1988$.SYStack.type** %.tmp6681
%.tmp6687 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6688 = load %m1861$.StackHead.type*, %m1861$.StackHead.type** %stack
%.tmp6689 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m1861$.StackHead.type*) @m1861$compile_assignable_stack.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m1861$.StackHead.typep(%m1861$.CompilerCtx.type* %.tmp6687, %m1861$.StackHead.type* %.tmp6688)
%B.6690 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6689, %m1861$.AssignableInfo.type** %B.6690
%.tmp6691 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6690
%.tmp6692 = icmp eq %m1861$.AssignableInfo.type* %.tmp6691, null
br i1 %.tmp6692, label %.if.true.6693, label %.if.false.6693
.if.true.6693:
%.tmp6694 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6690
ret %m1861$.AssignableInfo.type* %.tmp6694
br label %.if.end.6693
.if.false.6693:
br label %.if.end.6693
.if.end.6693:
%.tmp6695 = bitcast ptr null to %m307$.Node.type*
%.tmp6696 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6695)
%op_info.6697 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6696, %m1861$.AssignableInfo.type** %op_info.6697
%.tmp6698 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6697
%.tmp6699 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6698, i32 0, i32 4
%.tmp6700 = load %m307$.Node.type*, %m307$.Node.type** %operator.6664
%.tmp6701 = call %m1861$.Type.type*(%m307$.Node.type*) @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6700)
store %m1861$.Type.type* %.tmp6701, %m1861$.Type.type** %.tmp6699
%.tmp6702 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6703 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6697
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp6702, %m1861$.AssignableInfo.type* %.tmp6703)
%.tmp6704 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6705 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp6704, i32 0, i32 1
%.tmp6706 = load %m0$.File.type*, %m0$.File.type** %.tmp6705
%.tmp6708 = getelementptr [19 x i8], [19 x i8]*@.str6707, i32 0, i32 0
%.tmp6709 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6697
%.tmp6710 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6709)
%.tmp6711 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6712 = load %m307$.Node.type*, %m307$.Node.type** %operator.6664
%.tmp6713 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp6711, %m307$.Node.type* %.tmp6712)
%.tmp6714 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6715 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6675
%.tmp6716 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6715, i32 0, i32 4
%.tmp6717 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6716
%.tmp6718 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp6714, %m1861$.Type.type* %.tmp6717)
%.tmp6719 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %A.6675
%.tmp6720 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6719)
%.tmp6721 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %B.6690
%.tmp6722 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp6721)
%.tmp6723 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6706, i8* %.tmp6708, i8* %.tmp6710, i8* %.tmp6713, i8* %.tmp6718, i8* %.tmp6720, i8* %.tmp6722)
%.tmp6724 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %op_info.6697
ret %m1861$.AssignableInfo.type* %.tmp6724
}
define i8* @m1861$operator_op.cp.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.op.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6725 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6726 = icmp eq %m307$.Node.type* %.tmp6725, null
br i1 %.tmp6726, label %.if.true.6727, label %.if.false.6727
.if.true.6727:
%.tmp6728 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6729 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6731 = getelementptr [31 x i8], [31 x i8]*@.str6730, i32 0, i32 0
%.tmp6732 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6728, %m307$.Node.type* %.tmp6729, i8* %.tmp6731)
%.tmp6733 = call i32(i8*,...) @printf(i8* %.tmp6732)
br label %.if.end.6727
.if.false.6727:
br label %.if.end.6727
.if.end.6727:
%.tmp6734 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6735 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6734, i32 0, i32 1
%.tmp6736 = load i8*, i8** %.tmp6735
%.tmp6738 = getelementptr [2 x i8], [2 x i8]*@.str6737, i32 0, i32 0
%.tmp6739 = call i32(i8*,i8*) @strcmp(i8* %.tmp6736, i8* %.tmp6738)
%.tmp6740 = icmp eq i32 %.tmp6739, 0
br i1 %.tmp6740, label %.if.true.6741, label %.if.false.6741
.if.true.6741:
%.tmp6743 = getelementptr [4 x i8], [4 x i8]*@.str6742, i32 0, i32 0
ret i8* %.tmp6743
br label %.if.end.6741
.if.false.6741:
%.tmp6744 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6745 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6744, i32 0, i32 1
%.tmp6746 = load i8*, i8** %.tmp6745
%.tmp6748 = getelementptr [2 x i8], [2 x i8]*@.str6747, i32 0, i32 0
%.tmp6749 = call i32(i8*,i8*) @strcmp(i8* %.tmp6746, i8* %.tmp6748)
%.tmp6750 = icmp eq i32 %.tmp6749, 0
br i1 %.tmp6750, label %.if.true.6751, label %.if.false.6751
.if.true.6751:
%.tmp6753 = getelementptr [4 x i8], [4 x i8]*@.str6752, i32 0, i32 0
ret i8* %.tmp6753
br label %.if.end.6751
.if.false.6751:
%.tmp6754 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6755 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6754, i32 0, i32 1
%.tmp6756 = load i8*, i8** %.tmp6755
%.tmp6758 = getelementptr [2 x i8], [2 x i8]*@.str6757, i32 0, i32 0
%.tmp6759 = call i32(i8*,i8*) @strcmp(i8* %.tmp6756, i8* %.tmp6758)
%.tmp6760 = icmp eq i32 %.tmp6759, 0
br i1 %.tmp6760, label %.if.true.6761, label %.if.false.6761
.if.true.6761:
%.tmp6763 = getelementptr [4 x i8], [4 x i8]*@.str6762, i32 0, i32 0
ret i8* %.tmp6763
br label %.if.end.6761
.if.false.6761:
%.tmp6764 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6765 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6764, i32 0, i32 1
%.tmp6766 = load i8*, i8** %.tmp6765
%.tmp6768 = getelementptr [2 x i8], [2 x i8]*@.str6767, i32 0, i32 0
%.tmp6769 = call i32(i8*,i8*) @strcmp(i8* %.tmp6766, i8* %.tmp6768)
%.tmp6770 = icmp eq i32 %.tmp6769, 0
br i1 %.tmp6770, label %.if.true.6771, label %.if.false.6771
.if.true.6771:
%.tmp6773 = getelementptr [5 x i8], [5 x i8]*@.str6772, i32 0, i32 0
ret i8* %.tmp6773
br label %.if.end.6771
.if.false.6771:
%.tmp6774 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6775 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6774, i32 0, i32 1
%.tmp6776 = load i8*, i8** %.tmp6775
%.tmp6778 = getelementptr [3 x i8], [3 x i8]*@.str6777, i32 0, i32 0
%.tmp6779 = call i32(i8*,i8*) @strcmp(i8* %.tmp6776, i8* %.tmp6778)
%.tmp6780 = icmp eq i32 %.tmp6779, 0
br i1 %.tmp6780, label %.if.true.6781, label %.if.false.6781
.if.true.6781:
%.tmp6783 = getelementptr [8 x i8], [8 x i8]*@.str6782, i32 0, i32 0
ret i8* %.tmp6783
br label %.if.end.6781
.if.false.6781:
%.tmp6784 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6785 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6784, i32 0, i32 1
%.tmp6786 = load i8*, i8** %.tmp6785
%.tmp6788 = getelementptr [3 x i8], [3 x i8]*@.str6787, i32 0, i32 0
%.tmp6789 = call i32(i8*,i8*) @strcmp(i8* %.tmp6786, i8* %.tmp6788)
%.tmp6790 = icmp eq i32 %.tmp6789, 0
br i1 %.tmp6790, label %.if.true.6791, label %.if.false.6791
.if.true.6791:
%.tmp6793 = getelementptr [8 x i8], [8 x i8]*@.str6792, i32 0, i32 0
ret i8* %.tmp6793
br label %.if.end.6791
.if.false.6791:
%.tmp6794 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6795 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6794, i32 0, i32 1
%.tmp6796 = load i8*, i8** %.tmp6795
%.tmp6798 = getelementptr [2 x i8], [2 x i8]*@.str6797, i32 0, i32 0
%.tmp6799 = call i32(i8*,i8*) @strcmp(i8* %.tmp6796, i8* %.tmp6798)
%.tmp6800 = icmp eq i32 %.tmp6799, 0
br i1 %.tmp6800, label %.if.true.6801, label %.if.false.6801
.if.true.6801:
%.tmp6803 = getelementptr [9 x i8], [9 x i8]*@.str6802, i32 0, i32 0
ret i8* %.tmp6803
br label %.if.end.6801
.if.false.6801:
%.tmp6804 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6805 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6804, i32 0, i32 1
%.tmp6806 = load i8*, i8** %.tmp6805
%.tmp6808 = getelementptr [2 x i8], [2 x i8]*@.str6807, i32 0, i32 0
%.tmp6809 = call i32(i8*,i8*) @strcmp(i8* %.tmp6806, i8* %.tmp6808)
%.tmp6810 = icmp eq i32 %.tmp6809, 0
br i1 %.tmp6810, label %.if.true.6811, label %.if.false.6811
.if.true.6811:
%.tmp6813 = getelementptr [9 x i8], [9 x i8]*@.str6812, i32 0, i32 0
ret i8* %.tmp6813
br label %.if.end.6811
.if.false.6811:
%.tmp6814 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6815 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6814, i32 0, i32 1
%.tmp6816 = load i8*, i8** %.tmp6815
%.tmp6818 = getelementptr [2 x i8], [2 x i8]*@.str6817, i32 0, i32 0
%.tmp6819 = call i32(i8*,i8*) @strcmp(i8* %.tmp6816, i8* %.tmp6818)
%.tmp6820 = icmp eq i32 %.tmp6819, 0
br i1 %.tmp6820, label %.if.true.6821, label %.if.false.6821
.if.true.6821:
%.tmp6823 = getelementptr [4 x i8], [4 x i8]*@.str6822, i32 0, i32 0
ret i8* %.tmp6823
br label %.if.end.6821
.if.false.6821:
%.tmp6824 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6825 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6824, i32 0, i32 1
%.tmp6826 = load i8*, i8** %.tmp6825
%.tmp6828 = getelementptr [2 x i8], [2 x i8]*@.str6827, i32 0, i32 0
%.tmp6829 = call i32(i8*,i8*) @strcmp(i8* %.tmp6826, i8* %.tmp6828)
%.tmp6830 = icmp eq i32 %.tmp6829, 0
br i1 %.tmp6830, label %.if.true.6831, label %.if.false.6831
.if.true.6831:
%.tmp6833 = getelementptr [3 x i8], [3 x i8]*@.str6832, i32 0, i32 0
ret i8* %.tmp6833
br label %.if.end.6831
.if.false.6831:
%.tmp6834 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6835 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6834, i32 0, i32 1
%.tmp6836 = load i8*, i8** %.tmp6835
%.tmp6838 = getelementptr [3 x i8], [3 x i8]*@.str6837, i32 0, i32 0
%.tmp6839 = call i32(i8*,i8*) @strcmp(i8* %.tmp6836, i8* %.tmp6838)
%.tmp6840 = icmp eq i32 %.tmp6839, 0
br i1 %.tmp6840, label %.if.true.6841, label %.if.false.6841
.if.true.6841:
%.tmp6843 = getelementptr [9 x i8], [9 x i8]*@.str6842, i32 0, i32 0
ret i8* %.tmp6843
br label %.if.end.6841
.if.false.6841:
%.tmp6844 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6845 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6844, i32 0, i32 1
%.tmp6846 = load i8*, i8** %.tmp6845
%.tmp6848 = getelementptr [3 x i8], [3 x i8]*@.str6847, i32 0, i32 0
%.tmp6849 = call i32(i8*,i8*) @strcmp(i8* %.tmp6846, i8* %.tmp6848)
%.tmp6850 = icmp eq i32 %.tmp6849, 0
br i1 %.tmp6850, label %.if.true.6851, label %.if.false.6851
.if.true.6851:
%.tmp6853 = getelementptr [9 x i8], [9 x i8]*@.str6852, i32 0, i32 0
ret i8* %.tmp6853
br label %.if.end.6851
.if.false.6851:
%.tmp6854 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6855 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6854, i32 0, i32 1
%.tmp6856 = load i8*, i8** %.tmp6855
%.tmp6858 = getelementptr [2 x i8], [2 x i8]*@.str6857, i32 0, i32 0
%.tmp6859 = call i32(i8*,i8*) @strcmp(i8* %.tmp6856, i8* %.tmp6858)
%.tmp6860 = icmp eq i32 %.tmp6859, 0
br i1 %.tmp6860, label %.if.true.6861, label %.if.false.6861
.if.true.6861:
%.tmp6863 = getelementptr [5 x i8], [5 x i8]*@.str6862, i32 0, i32 0
ret i8* %.tmp6863
br label %.if.end.6861
.if.false.6861:
%.tmp6864 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp6865 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6867 = getelementptr [30 x i8], [30 x i8]*@.str6866, i32 0, i32 0
%.tmp6868 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp6864, %m307$.Node.type* %.tmp6865, i8* %.tmp6867)
%.tmp6869 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6870 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6869, i32 0, i32 1
%.tmp6871 = load i8*, i8** %.tmp6870
%.tmp6872 = call i32(i8*,...) @printf(i8* %.tmp6868, i8* %.tmp6871)
br label %.if.end.6861
.if.end.6861:
br label %.if.end.6851
.if.end.6851:
br label %.if.end.6841
.if.end.6841:
br label %.if.end.6831
.if.end.6831:
br label %.if.end.6821
.if.end.6821:
br label %.if.end.6811
.if.end.6811:
br label %.if.end.6801
.if.end.6801:
br label %.if.end.6791
.if.end.6791:
br label %.if.end.6781
.if.end.6781:
br label %.if.end.6771
.if.end.6771:
br label %.if.end.6761
.if.end.6761:
br label %.if.end.6751
.if.end.6751:
br label %.if.end.6741
.if.end.6741:
%.tmp6874 = getelementptr [4 x i8], [4 x i8]*@.str6873, i32 0, i32 0
ret i8* %.tmp6874
}
define %m1861$.Type.type* @m1861$operator_type.m1861$.Type.typep.m307$.Node.typep(%m307$.Node.type* %.op.arg) {
%op = alloca %m307$.Node.type*
store %m307$.Node.type* %.op.arg, %m307$.Node.type** %op
%.tmp6875 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.6876 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp6875, %m1861$.Type.type** %type.6876
%.tmp6877 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6878 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6877, i32 0, i32 1
%.tmp6879 = load i8*, i8** %.tmp6878
%.tmp6881 = getelementptr [3 x i8], [3 x i8]*@.str6880, i32 0, i32 0
%.tmp6882 = call i32(i8*,i8*) @strcmp(i8* %.tmp6879, i8* %.tmp6881)
%.tmp6883 = icmp eq i32 %.tmp6882, 0
%.tmp6884 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6885 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6884, i32 0, i32 1
%.tmp6886 = load i8*, i8** %.tmp6885
%.tmp6888 = getelementptr [3 x i8], [3 x i8]*@.str6887, i32 0, i32 0
%.tmp6889 = call i32(i8*,i8*) @strcmp(i8* %.tmp6886, i8* %.tmp6888)
%.tmp6890 = icmp eq i32 %.tmp6889, 0
%.tmp6891 = or i1 %.tmp6883, %.tmp6890
%.tmp6892 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6893 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6892, i32 0, i32 1
%.tmp6894 = load i8*, i8** %.tmp6893
%.tmp6896 = getelementptr [2 x i8], [2 x i8]*@.str6895, i32 0, i32 0
%.tmp6897 = call i32(i8*,i8*) @strcmp(i8* %.tmp6894, i8* %.tmp6896)
%.tmp6898 = icmp eq i32 %.tmp6897, 0
%.tmp6899 = or i1 %.tmp6891, %.tmp6898
%.tmp6900 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6901 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6900, i32 0, i32 1
%.tmp6902 = load i8*, i8** %.tmp6901
%.tmp6904 = getelementptr [2 x i8], [2 x i8]*@.str6903, i32 0, i32 0
%.tmp6905 = call i32(i8*,i8*) @strcmp(i8* %.tmp6902, i8* %.tmp6904)
%.tmp6906 = icmp eq i32 %.tmp6905, 0
%.tmp6907 = or i1 %.tmp6899, %.tmp6906
%.tmp6908 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6909 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6908, i32 0, i32 1
%.tmp6910 = load i8*, i8** %.tmp6909
%.tmp6912 = getelementptr [2 x i8], [2 x i8]*@.str6911, i32 0, i32 0
%.tmp6913 = call i32(i8*,i8*) @strcmp(i8* %.tmp6910, i8* %.tmp6912)
%.tmp6914 = icmp eq i32 %.tmp6913, 0
%.tmp6915 = or i1 %.tmp6907, %.tmp6914
%.tmp6916 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6917 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6916, i32 0, i32 1
%.tmp6918 = load i8*, i8** %.tmp6917
%.tmp6920 = getelementptr [2 x i8], [2 x i8]*@.str6919, i32 0, i32 0
%.tmp6921 = call i32(i8*,i8*) @strcmp(i8* %.tmp6918, i8* %.tmp6920)
%.tmp6922 = icmp eq i32 %.tmp6921, 0
%.tmp6923 = or i1 %.tmp6915, %.tmp6922
%.tmp6924 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6925 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6924, i32 0, i32 1
%.tmp6926 = load i8*, i8** %.tmp6925
%.tmp6928 = getelementptr [3 x i8], [3 x i8]*@.str6927, i32 0, i32 0
%.tmp6929 = call i32(i8*,i8*) @strcmp(i8* %.tmp6926, i8* %.tmp6928)
%.tmp6930 = icmp eq i32 %.tmp6929, 0
%.tmp6931 = or i1 %.tmp6923, %.tmp6930
%.tmp6932 = load %m307$.Node.type*, %m307$.Node.type** %op
%.tmp6933 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6932, i32 0, i32 1
%.tmp6934 = load i8*, i8** %.tmp6933
%.tmp6936 = getelementptr [3 x i8], [3 x i8]*@.str6935, i32 0, i32 0
%.tmp6937 = call i32(i8*,i8*) @strcmp(i8* %.tmp6934, i8* %.tmp6936)
%.tmp6938 = icmp eq i32 %.tmp6937, 0
%.tmp6939 = or i1 %.tmp6931, %.tmp6938
br i1 %.tmp6939, label %.if.true.6940, label %.if.false.6940
.if.true.6940:
%.tmp6941 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6876
%.tmp6942 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6941, i32 0, i32 0
%.tmp6944 = getelementptr [5 x i8], [5 x i8]*@.str6943, i32 0, i32 0
store i8* %.tmp6944, i8** %.tmp6942
br label %.if.end.6940
.if.false.6940:
%.tmp6945 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6876
%.tmp6946 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6945, i32 0, i32 0
%.tmp6948 = getelementptr [4 x i8], [4 x i8]*@.str6947, i32 0, i32 0
store i8* %.tmp6948, i8** %.tmp6946
br label %.if.end.6940
.if.end.6940:
%.tmp6949 = load %m1861$.Type.type*, %m1861$.Type.type** %type.6876
ret %m1861$.Type.type* %.tmp6949
}
define %m1861$.AssignableInfo.type* @m1861$compile_mono_assignable.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%curr_node = alloca %m307$.Node.type*
store %m307$.Node.type* %.curr_node.arg, %m307$.Node.type** %curr_node
%.tmp6950 = bitcast ptr null to %m1861$.AssignableInfo.type*
%assignable_info.6951 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp6950, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp6952 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%mono.6953 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp6952, %m307$.Node.type** %mono.6953
%err_buf.6954 = alloca i8*
store i8* null, i8** %err_buf.6954
%buf.6955 = alloca i8*
store i8* null, i8** %buf.6955
%.tmp6956 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp6957 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6956, i32 0, i32 6
%.tmp6958 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6957
%.tmp6959 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6958, i32 0, i32 0
%.tmp6960 = load i8*, i8** %.tmp6959
%.tmp6962 = getelementptr [7 x i8], [7 x i8]*@.str6961, i32 0, i32 0
%.tmp6963 = call i32(i8*,i8*) @strcmp(i8* %.tmp6960, i8* %.tmp6962)
%.tmp6964 = icmp eq i32 %.tmp6963, 0
br i1 %.tmp6964, label %.if.true.6965, label %.if.false.6965
.if.true.6965:
%.tmp6966 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp6967 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp6966)
store %m1861$.AssignableInfo.type* %.tmp6967, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp6968 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp6969 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6968, i32 0, i32 4
%.tmp6970 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp6970, %m1861$.Type.type** %.tmp6969
%.tmp6971 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp6972 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp6971, i32 0, i32 4
%.tmp6973 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp6972
%.tmp6974 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp6973, i32 0, i32 0
%.tmp6976 = getelementptr [4 x i8], [4 x i8]*@.str6975, i32 0, i32 0
store i8* %.tmp6976, i8** %.tmp6974
%.tmp6977 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp6978 = load i8, i8* @SCOPE_CONST
%.tmp6979 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp6980 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6979, i32 0, i32 6
%.tmp6981 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6980
%.tmp6982 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6981, i32 0, i32 1
%.tmp6983 = load i8*, i8** %.tmp6982
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp6977, i8 %.tmp6978, i8* %.tmp6983)
br label %.if.end.6965
.if.false.6965:
%.tmp6984 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp6985 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6984, i32 0, i32 6
%.tmp6986 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6985
%.tmp6987 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6986, i32 0, i32 0
%.tmp6988 = load i8*, i8** %.tmp6987
%.tmp6990 = getelementptr [5 x i8], [5 x i8]*@.str6989, i32 0, i32 0
%.tmp6991 = call i32(i8*,i8*) @strcmp(i8* %.tmp6988, i8* %.tmp6990)
%.tmp6992 = icmp eq i32 %.tmp6991, 0
br i1 %.tmp6992, label %.if.true.6993, label %.if.false.6993
.if.true.6993:
%.tmp6994 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp6995 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6994, i32 0, i32 6
%.tmp6996 = load %m307$.Node.type*, %m307$.Node.type** %.tmp6995
%.tmp6997 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp6996, i32 0, i32 1
%.tmp6998 = load i8*, i8** %.tmp6997
%.tmp7000 = getelementptr [5 x i8], [5 x i8]*@.str6999, i32 0, i32 0
%.tmp7001 = call i32(i8*,i8*) @strcmp(i8* %.tmp6998, i8* %.tmp7000)
%.tmp7002 = icmp ne i32 %.tmp7001, 0
br i1 %.tmp7002, label %.if.true.7003, label %.if.false.7003
.if.true.7003:
%.tmp7004 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7005 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7007 = getelementptr [42 x i8], [42 x i8]*@.str7006, i32 0, i32 0
%.tmp7008 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7004, %m307$.Node.type* %.tmp7005, i8* %.tmp7007)
%.tmp7009 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7010 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7009, i32 0, i32 6
%.tmp7011 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7010
%.tmp7012 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7011, i32 0, i32 1
%.tmp7013 = load i8*, i8** %.tmp7012
%.tmp7014 = call i32(i8*,...) @printf(i8* %.tmp7008, i8* %.tmp7013)
%.tmp7015 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7015
br label %.if.end.7003
.if.false.7003:
br label %.if.end.7003
.if.end.7003:
%.tmp7016 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7017 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7016)
store %m1861$.AssignableInfo.type* %.tmp7017, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7018 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7019 = load i8, i8* @SCOPE_CONST
%.tmp7021 = getelementptr [5 x i8], [5 x i8]*@.str7020, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7018, i8 %.tmp7019, i8* %.tmp7021)
%.tmp7022 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7023 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7022, i32 0, i32 4
%.tmp7024 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7024, %m1861$.Type.type** %.tmp7023
%.tmp7025 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7026 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7025, i32 0, i32 4
%.tmp7027 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7026
%.tmp7028 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7027, i32 0, i32 0
%.tmp7030 = getelementptr [8 x i8], [8 x i8]*@.str7029, i32 0, i32 0
store i8* %.tmp7030, i8** %.tmp7028
br label %.if.end.6993
.if.false.6993:
%.tmp7031 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7032 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7031, i32 0, i32 6
%.tmp7033 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7032
%.tmp7034 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7033, i32 0, i32 0
%.tmp7035 = load i8*, i8** %.tmp7034
%.tmp7037 = getelementptr [17 x i8], [17 x i8]*@.str7036, i32 0, i32 0
%.tmp7038 = call i32(i8*,i8*) @strcmp(i8* %.tmp7035, i8* %.tmp7037)
%.tmp7039 = icmp eq i32 %.tmp7038, 0
br i1 %.tmp7039, label %.if.true.7040, label %.if.false.7040
.if.true.7040:
%.tmp7041 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7042 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7041)
store %m1861$.AssignableInfo.type* %.tmp7042, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7043 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7044 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7043, i32 0, i32 6
%.tmp7045 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7044
%.tmp7046 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7045, i32 0, i32 6
%.tmp7047 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7046
%.tmp7049 = getelementptr [12 x i8], [12 x i8]*@.str7048, i32 0, i32 0
%.tmp7050 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp7047, i8* %.tmp7049)
%dest.7051 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7050, %m307$.Node.type** %dest.7051
%.tmp7052 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7053 = load %m307$.Node.type*, %m307$.Node.type** %dest.7051
%.tmp7054 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_addr.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7052, %m307$.Node.type* %.tmp7053)
%var_info.7055 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7054, %m1861$.AssignableInfo.type** %var_info.7055
%.tmp7056 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7055
%.tmp7057 = icmp eq %m1861$.AssignableInfo.type* %.tmp7056, null
br i1 %.tmp7057, label %.if.true.7058, label %.if.false.7058
.if.true.7058:
%.tmp7059 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
ret %m1861$.AssignableInfo.type* %.tmp7059
br label %.if.end.7058
.if.false.7058:
br label %.if.end.7058
.if.end.7058:
%.tmp7060 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7061 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7055
%.tmp7062 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7061, i32 0, i32 4
%.tmp7063 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7062
%.tmp7064 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7060, %m1861$.Type.type* %.tmp7063)
%var_type_repr.7065 = alloca i8*
store i8* %.tmp7064, i8** %var_type_repr.7065
%.tmp7066 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7067 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7066, %m1861$.AssignableInfo.type* %.tmp7067)
%.tmp7068 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7069 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7068, i32 0, i32 4
%.tmp7070 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7055
%.tmp7071 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7070, i32 0, i32 4
%.tmp7072 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7071
store %m1861$.Type.type* %.tmp7072, %m1861$.Type.type** %.tmp7069
%.tmp7074 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7075 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7074, i32 0, i32 6
%.tmp7076 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7075
%.tmp7077 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7076, i32 0, i32 6
%.tmp7078 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7077
%ptr.7079 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7078, %m307$.Node.type** %ptr.7079
br label %.for.start.7073
.for.start.7073:
%.tmp7080 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7079
%.tmp7081 = load %m307$.Node.type*, %m307$.Node.type** %dest.7051
%.tmp7082 = icmp ne %m307$.Node.type* %.tmp7080, %.tmp7081
br i1 %.tmp7082, label %.for.continue.7073, label %.for.end.7073
.for.continue.7073:
%.tmp7083 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%type.7084 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7083, %m1861$.Type.type** %type.7084
%.tmp7085 = load %m1861$.Type.type*, %m1861$.Type.type** %type.7084
%.tmp7086 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7085, i32 0, i32 3
%.tmp7087 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7088 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7087, i32 0, i32 4
%.tmp7089 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7088
store %m1861$.Type.type* %.tmp7089, %m1861$.Type.type** %.tmp7086
%.tmp7090 = load %m1861$.Type.type*, %m1861$.Type.type** %type.7084
%.tmp7091 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7090, i32 0, i32 0
%.tmp7093 = getelementptr [4 x i8], [4 x i8]*@.str7092, i32 0, i32 0
store i8* %.tmp7093, i8** %.tmp7091
%.tmp7094 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7095 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7094, i32 0, i32 4
%.tmp7096 = load %m1861$.Type.type*, %m1861$.Type.type** %type.7084
store %m1861$.Type.type* %.tmp7096, %m1861$.Type.type** %.tmp7095
%.tmp7097 = load %m307$.Node.type*, %m307$.Node.type** %ptr.7079
%.tmp7098 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7097, i32 0, i32 7
%.tmp7099 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7098
store %m307$.Node.type* %.tmp7099, %m307$.Node.type** %ptr.7079
br label %.for.start.7073
.for.end.7073:
%.tmp7100 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7101 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7100, i32 0, i32 6
%.tmp7102 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7101
%.tmp7103 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7102, i32 0, i32 6
%.tmp7104 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7103
%.tmp7105 = load %m307$.Node.type*, %m307$.Node.type** %dest.7051
%.tmp7106 = icmp ne %m307$.Node.type* %.tmp7104, %.tmp7105
br i1 %.tmp7106, label %.if.true.7107, label %.if.false.7107
.if.true.7107:
%.tmp7108 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7109 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7108, i32 0, i32 1
%.tmp7110 = load %m0$.File.type*, %m0$.File.type** %.tmp7109
%.tmp7112 = getelementptr [38 x i8], [38 x i8]*@.str7111, i32 0, i32 0
%.tmp7113 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7114 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7113)
%.tmp7115 = load i8*, i8** %var_type_repr.7065
%.tmp7116 = load i8*, i8** %var_type_repr.7065
%.tmp7117 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7055
%.tmp7118 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7117)
%.tmp7119 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7110, i8* %.tmp7112, i8* %.tmp7114, i8* %.tmp7115, i8* %.tmp7116, i8* %.tmp7118)
br label %.if.end.7107
.if.false.7107:
%.tmp7120 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7121 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7120, i32 0, i32 1
%.tmp7122 = load %m0$.File.type*, %m0$.File.type** %.tmp7121
%.tmp7124 = getelementptr [22 x i8], [22 x i8]*@.str7123, i32 0, i32 0
%.tmp7125 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7126 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7125)
%.tmp7127 = load i8*, i8** %var_type_repr.7065
%.tmp7128 = load i8*, i8** %var_type_repr.7065
%.tmp7129 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %var_info.7055
%.tmp7130 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7129)
%.tmp7131 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7122, i8* %.tmp7124, i8* %.tmp7126, i8* %.tmp7127, i8* %.tmp7128, i8* %.tmp7130)
br label %.if.end.7107
.if.end.7107:
br label %.if.end.7040
.if.false.7040:
%.tmp7132 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7133 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7132, i32 0, i32 6
%.tmp7134 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7133
%.tmp7135 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7134, i32 0, i32 0
%.tmp7136 = load i8*, i8** %.tmp7135
%.tmp7138 = getelementptr [8 x i8], [8 x i8]*@.str7137, i32 0, i32 0
%.tmp7139 = call i32(i8*,i8*) @strcmp(i8* %.tmp7136, i8* %.tmp7138)
%.tmp7140 = icmp eq i32 %.tmp7139, 0
br i1 %.tmp7140, label %.if.true.7141, label %.if.false.7141
.if.true.7141:
%.tmp7142 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7143 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7142)
store %m1861$.AssignableInfo.type* %.tmp7143, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7144 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7145 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7144, i32 0, i32 4
%.tmp7146 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7146, %m1861$.Type.type** %.tmp7145
%.tmp7147 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7148 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7147, i32 0, i32 4
%.tmp7149 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7148
%.tmp7150 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7149, i32 0, i32 0
%.tmp7152 = getelementptr [5 x i8], [5 x i8]*@.str7151, i32 0, i32 0
store i8* %.tmp7152, i8** %.tmp7150
%.tmp7153 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7154 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7153, i32 0, i32 6
%.tmp7155 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7154
%.tmp7156 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7155, i32 0, i32 6
%.tmp7157 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7156
%.tmp7158 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7157, i32 0, i32 1
%.tmp7159 = load i8*, i8** %.tmp7158
%.tmp7161 = getelementptr [6 x i8], [6 x i8]*@.str7160, i32 0, i32 0
%.tmp7162 = call i32(i8*,i8*) @strcmp(i8* %.tmp7159, i8* %.tmp7161)
%.tmp7163 = icmp eq i32 %.tmp7162, 0
br i1 %.tmp7163, label %.if.true.7164, label %.if.false.7164
.if.true.7164:
%.tmp7165 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7166 = load i8, i8* @SCOPE_CONST
%.tmp7168 = getelementptr [2 x i8], [2 x i8]*@.str7167, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7165, i8 %.tmp7166, i8* %.tmp7168)
br label %.if.end.7164
.if.false.7164:
%.tmp7169 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7170 = load i8, i8* @SCOPE_CONST
%.tmp7172 = getelementptr [2 x i8], [2 x i8]*@.str7171, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7169, i8 %.tmp7170, i8* %.tmp7172)
br label %.if.end.7164
.if.end.7164:
br label %.if.end.7141
.if.false.7141:
%.tmp7173 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7174 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7173, i32 0, i32 6
%.tmp7175 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7174
%.tmp7176 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7175, i32 0, i32 0
%.tmp7177 = load i8*, i8** %.tmp7176
%.tmp7179 = getelementptr [8 x i8], [8 x i8]*@.str7178, i32 0, i32 0
%.tmp7180 = call i32(i8*,i8*) @strcmp(i8* %.tmp7177, i8* %.tmp7179)
%.tmp7181 = icmp eq i32 %.tmp7180, 0
br i1 %.tmp7181, label %.if.true.7182, label %.if.false.7182
.if.true.7182:
%.tmp7183 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7184 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7185 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7184, i32 0, i32 6
%.tmp7186 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7185
%.tmp7187 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7186, i32 0, i32 6
%.tmp7188 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7187
%.tmp7189 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$compile_fn_call.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7183, %m307$.Node.type* %.tmp7188)
store %m1861$.AssignableInfo.type* %.tmp7189, %m1861$.AssignableInfo.type** %assignable_info.6951
br label %.if.end.7182
.if.false.7182:
%.tmp7190 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7191 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7190, i32 0, i32 6
%.tmp7192 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7191
%.tmp7193 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7192, i32 0, i32 0
%.tmp7194 = load i8*, i8** %.tmp7193
%.tmp7196 = getelementptr [7 x i8], [7 x i8]*@.str7195, i32 0, i32 0
%.tmp7197 = call i32(i8*,i8*) @strcmp(i8* %.tmp7194, i8* %.tmp7196)
%.tmp7198 = icmp eq i32 %.tmp7197, 0
br i1 %.tmp7198, label %.if.true.7199, label %.if.false.7199
.if.true.7199:
%.tmp7200 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7201 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7202 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7201, i32 0, i32 6
%.tmp7203 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7202
%.tmp7204 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7203, i32 0, i32 1
%.tmp7205 = load i8*, i8** %.tmp7204
%.tmp7206 = call %m1861$.AssignableInfo.type*(%m1861$.CompilerCtx.type*,i8*) @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.tmp7200, i8* %.tmp7205)
%string_info.7207 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7206, %m1861$.AssignableInfo.type** %string_info.7207
%.tmp7208 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7209 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7208)
store %m1861$.AssignableInfo.type* %.tmp7209, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7210 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7211 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
call void(%m1861$.CompilerCtx.type*,%m1861$.AssignableInfo.type*) @m1861$set_assignable_tmp_id.v.m1861$.CompilerCtx.typep.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7210, %m1861$.AssignableInfo.type* %.tmp7211)
%.tmp7212 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7213 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.7207
%.tmp7214 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7213, i32 0, i32 4
%.tmp7215 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7214
%.tmp7216 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7212, %m1861$.Type.type* %.tmp7215)
%str_tr.7217 = alloca i8*
store i8* %.tmp7216, i8** %str_tr.7217
%.tmp7218 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7219 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7218, i32 0, i32 1
%.tmp7220 = load %m0$.File.type*, %m0$.File.type** %.tmp7219
%.tmp7222 = getelementptr [44 x i8], [44 x i8]*@.str7221, i32 0, i32 0
%.tmp7223 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7224 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7223)
%.tmp7225 = load i8*, i8** %str_tr.7217
%.tmp7226 = load i8*, i8** %str_tr.7217
%.tmp7227 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %string_info.7207
%.tmp7228 = call i8*(%m1861$.AssignableInfo.type*) @m1861$repr_assignable_id.cp.m1861$.AssignableInfo.typep(%m1861$.AssignableInfo.type* %.tmp7227)
%.tmp7229 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7220, i8* %.tmp7222, i8* %.tmp7224, i8* %.tmp7225, i8* %.tmp7226, i8* %.tmp7228)
%.tmp7230 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7231 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7230, i32 0, i32 4
%.tmp7232 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7232, %m1861$.Type.type** %.tmp7231
%.tmp7233 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7234 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7233, i32 0, i32 4
%.tmp7235 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7234
%.tmp7236 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7235, i32 0, i32 0
%.tmp7238 = getelementptr [4 x i8], [4 x i8]*@.str7237, i32 0, i32 0
store i8* %.tmp7238, i8** %.tmp7236
%.tmp7239 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7240 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7239, i32 0, i32 4
%.tmp7241 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7240
%.tmp7242 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7241, i32 0, i32 3
%.tmp7243 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7243, %m1861$.Type.type** %.tmp7242
%.tmp7244 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7245 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7244, i32 0, i32 4
%.tmp7246 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7245
%.tmp7247 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7246, i32 0, i32 3
%.tmp7248 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7247
%.tmp7249 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7248, i32 0, i32 0
%.tmp7251 = getelementptr [4 x i8], [4 x i8]*@.str7250, i32 0, i32 0
store i8* %.tmp7251, i8** %.tmp7249
br label %.if.end.7199
.if.false.7199:
%.tmp7252 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7253 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7252, i32 0, i32 6
%.tmp7254 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7253
%.tmp7255 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7254, i32 0, i32 0
%.tmp7256 = load i8*, i8** %.tmp7255
%.tmp7258 = getelementptr [4 x i8], [4 x i8]*@.str7257, i32 0, i32 0
%.tmp7259 = call i32(i8*,i8*) @strcmp(i8* %.tmp7256, i8* %.tmp7258)
%.tmp7260 = icmp eq i32 %.tmp7259, 0
br i1 %.tmp7260, label %.if.true.7261, label %.if.false.7261
.if.true.7261:
%.tmp7262 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7263 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7262)
store %m1861$.AssignableInfo.type* %.tmp7263, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7264 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7265 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7264, i32 0, i32 6
%.tmp7266 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7265
%.tmp7267 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7266, i32 0, i32 1
%.tmp7268 = load i8*, i8** %.tmp7267
%.tmp7269 = call i32(i8*) @strlen(i8* %.tmp7268)
%chr_len.7270 = alloca i32
store i32 %.tmp7269, i32* %chr_len.7270
%.tmp7271 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7272 = load i8, i8* @SCOPE_CONST
%.tmp7274 = getelementptr [2 x i8], [2 x i8]*@.str7273, i32 0, i32 0
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7271, i8 %.tmp7272, i8* %.tmp7274)
%.tmp7275 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7276 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7275, i32 0, i32 0
%.tmp7277 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7278 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7277, i32 0, i32 6
%.tmp7279 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7278
%.tmp7280 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7279, i32 0, i32 1
%.tmp7281 = load i8*, i8** %.tmp7280
%.tmp7282 = call i8*(i8*) @m2233$chr_to_llvm.cp.cp(i8* %.tmp7281)
store i8* %.tmp7282, i8** %.tmp7276
%.tmp7283 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7284 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7283, i32 0, i32 0
%.tmp7285 = load i8*, i8** %.tmp7284
%.tmp7286 = icmp eq i8* %.tmp7285, null
br i1 %.tmp7286, label %.if.true.7287, label %.if.false.7287
.if.true.7287:
%.tmp7288 = getelementptr i8*, i8** %err_buf.6954, i32 0
%.tmp7290 = getelementptr [22 x i8], [22 x i8]*@.str7289, i32 0, i32 0
%.tmp7291 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7292 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7291, i32 0, i32 6
%.tmp7293 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7292
%.tmp7294 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7293, i32 0, i32 1
%.tmp7295 = load i8*, i8** %.tmp7294
%.tmp7296 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7288, i8* %.tmp7290, i8* %.tmp7295)
%.tmp7297 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7297
br label %.if.end.7287
.if.false.7287:
br label %.if.end.7287
.if.end.7287:
%.tmp7298 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7299 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7298, i32 0, i32 4
%.tmp7300 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7300, %m1861$.Type.type** %.tmp7299
%.tmp7301 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7302 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7301, i32 0, i32 4
%.tmp7303 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7302
%.tmp7304 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7303, i32 0, i32 0
%.tmp7306 = getelementptr [4 x i8], [4 x i8]*@.str7305, i32 0, i32 0
store i8* %.tmp7306, i8** %.tmp7304
br label %.if.end.7261
.if.false.7261:
%.tmp7307 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7308 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7310 = getelementptr [40 x i8], [40 x i8]*@.str7309, i32 0, i32 0
%.tmp7311 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp7307, %m307$.Node.type* %.tmp7308, i8* %.tmp7310)
%.tmp7312 = load %m307$.Node.type*, %m307$.Node.type** %mono.6953
%.tmp7313 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7312, i32 0, i32 6
%.tmp7314 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7313
%.tmp7315 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7314, i32 0, i32 0
%.tmp7316 = load i8*, i8** %.tmp7315
%.tmp7317 = call i32(i8*,...) @printf(i8* %.tmp7311, i8* %.tmp7316)
%.tmp7318 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7318
br label %.if.end.7261
.if.end.7261:
br label %.if.end.7199
.if.end.7199:
br label %.if.end.7182
.if.end.7182:
br label %.if.end.7141
.if.end.7141:
br label %.if.end.7040
.if.end.7040:
br label %.if.end.6993
.if.end.6993:
br label %.if.end.6965
.if.end.6965:
%.tmp7319 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7320 = icmp eq %m1861$.AssignableInfo.type* %.tmp7319, null
br i1 %.tmp7320, label %.if.true.7321, label %.if.false.7321
.if.true.7321:
%.tmp7322 = bitcast ptr null to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7322
br label %.if.end.7321
.if.false.7321:
br label %.if.end.7321
.if.end.7321:
%.tmp7323 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7324 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7323, i32 0, i32 5
%.tmp7325 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7326 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7325, i32 0, i32 3
%.tmp7327 = load i32, i32* %.tmp7326
store i32 %.tmp7327, i32* %.tmp7324
%.tmp7328 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7329 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7328, i32 0, i32 6
%.tmp7330 = load %m307$.Node.type*, %m307$.Node.type** %curr_node
%.tmp7331 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7330, i32 0, i32 4
%.tmp7332 = load i32, i32* %.tmp7331
store i32 %.tmp7332, i32* %.tmp7329
%.tmp7333 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %assignable_info.6951
%.tmp7334 = bitcast %m1861$.AssignableInfo.type* %.tmp7333 to %m1861$.AssignableInfo.type*
ret %m1861$.AssignableInfo.type* %.tmp7334
}
define i8* @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.type.arg) {
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp7335 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7336 = icmp ne %m1861$.Type.type* %.tmp7335, null
%.tmp7338 = getelementptr [22 x i8], [22 x i8]*@.str7337, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7336, i8* %.tmp7338)
%.tmp7339 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7340 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7339, i32 0, i32 0
%.tmp7341 = load i8*, i8** %.tmp7340
%.tmp7342 = icmp ne i8* %.tmp7341, null
%.tmp7344 = getelementptr [59 x i8], [59 x i8]*@.str7343, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7342, i8* %.tmp7344)
%.tmp7345 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7346 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7345, i32 0, i32 0
%.tmp7347 = load i8*, i8** %.tmp7346
%.tmp7349 = getelementptr [4 x i8], [4 x i8]*@.str7348, i32 0, i32 0
%.tmp7350 = call i32(i8*,i8*) @strcmp(i8* %.tmp7347, i8* %.tmp7349)
%.tmp7351 = icmp eq i32 %.tmp7350, 0
br i1 %.tmp7351, label %.if.true.7352, label %.if.false.7352
.if.true.7352:
%.tmp7354 = getelementptr [2 x i8], [2 x i8]*@.str7353, i32 0, i32 0
ret i8* %.tmp7354
br label %.if.end.7352
.if.false.7352:
%.tmp7355 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7356 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7355, i32 0, i32 0
%.tmp7357 = load i8*, i8** %.tmp7356
%.tmp7359 = getelementptr [5 x i8], [5 x i8]*@.str7358, i32 0, i32 0
%.tmp7360 = call i32(i8*,i8*) @strcmp(i8* %.tmp7357, i8* %.tmp7359)
%.tmp7361 = icmp eq i32 %.tmp7360, 0
br i1 %.tmp7361, label %.if.true.7362, label %.if.false.7362
.if.true.7362:
%.tmp7364 = getelementptr [2 x i8], [2 x i8]*@.str7363, i32 0, i32 0
ret i8* %.tmp7364
br label %.if.end.7362
.if.false.7362:
%.tmp7365 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7366 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7365, i32 0, i32 0
%.tmp7367 = load i8*, i8** %.tmp7366
%.tmp7369 = getelementptr [5 x i8], [5 x i8]*@.str7368, i32 0, i32 0
%.tmp7370 = call i32(i8*,i8*) @strcmp(i8* %.tmp7367, i8* %.tmp7369)
%.tmp7371 = icmp eq i32 %.tmp7370, 0
br i1 %.tmp7371, label %.if.true.7372, label %.if.false.7372
.if.true.7372:
%.tmp7374 = getelementptr [2 x i8], [2 x i8]*@.str7373, i32 0, i32 0
ret i8* %.tmp7374
br label %.if.end.7372
.if.false.7372:
%.tmp7375 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7376 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7375, i32 0, i32 0
%.tmp7377 = load i8*, i8** %.tmp7376
%.tmp7379 = getelementptr [4 x i8], [4 x i8]*@.str7378, i32 0, i32 0
%.tmp7380 = call i32(i8*,i8*) @strcmp(i8* %.tmp7377, i8* %.tmp7379)
%.tmp7381 = icmp eq i32 %.tmp7380, 0
br i1 %.tmp7381, label %.if.true.7382, label %.if.false.7382
.if.true.7382:
%.tmp7384 = getelementptr [2 x i8], [2 x i8]*@.str7383, i32 0, i32 0
ret i8* %.tmp7384
br label %.if.end.7382
.if.false.7382:
%.tmp7385 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7386 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7385, i32 0, i32 0
%.tmp7387 = load i8*, i8** %.tmp7386
%.tmp7389 = getelementptr [4 x i8], [4 x i8]*@.str7388, i32 0, i32 0
%.tmp7390 = call i32(i8*,i8*) @strcmp(i8* %.tmp7387, i8* %.tmp7389)
%.tmp7391 = icmp eq i32 %.tmp7390, 0
br i1 %.tmp7391, label %.if.true.7392, label %.if.false.7392
.if.true.7392:
%buf.7393 = alloca i8*
store i8* null, i8** %buf.7393
%.tmp7394 = getelementptr i8*, i8** %buf.7393, i32 0
%.tmp7396 = getelementptr [4 x i8], [4 x i8]*@.str7395, i32 0, i32 0
%.tmp7397 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7398 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7397, i32 0, i32 3
%.tmp7399 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7398
%.tmp7400 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp7399)
%.tmp7401 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7394, i8* %.tmp7396, i8* %.tmp7400)
%.tmp7402 = load i8*, i8** %buf.7393
ret i8* %.tmp7402
br label %.if.end.7392
.if.false.7392:
%.tmp7403 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7404 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7403, i32 0, i32 0
%.tmp7405 = load i8*, i8** %.tmp7404
%.tmp7407 = getelementptr [10 x i8], [10 x i8]*@.str7406, i32 0, i32 0
%.tmp7408 = call i32(i8*,i8*) @strcmp(i8* %.tmp7405, i8* %.tmp7407)
%.tmp7409 = icmp eq i32 %.tmp7408, 0
br i1 %.tmp7409, label %.if.true.7410, label %.if.false.7410
.if.true.7410:
%.tmp7411 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7412 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7411, i32 0, i32 2
%.tmp7413 = load i8*, i8** %.tmp7412
ret i8* %.tmp7413
br label %.if.end.7410
.if.false.7410:
%.tmp7414 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7415 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7414, i32 0, i32 0
%.tmp7416 = load i8*, i8** %.tmp7415
%.tmp7418 = getelementptr [7 x i8], [7 x i8]*@.str7417, i32 0, i32 0
%.tmp7419 = call i32(i8*,i8*) @strcmp(i8* %.tmp7416, i8* %.tmp7418)
%.tmp7420 = icmp eq i32 %.tmp7419, 0
br i1 %.tmp7420, label %.if.true.7421, label %.if.false.7421
.if.true.7421:
%.tmp7423 = getelementptr [2 x i8], [2 x i8]*@.str7422, i32 0, i32 0
%buf.7424 = alloca i8*
store i8* %.tmp7423, i8** %buf.7424
%.tmp7426 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7427 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7426, i32 0, i32 3
%.tmp7428 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7427
%t.7429 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7428, %m1861$.Type.type** %t.7429
br label %.for.start.7425
.for.start.7425:
%.tmp7430 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7429
%.tmp7431 = icmp ne %m1861$.Type.type* %.tmp7430, null
br i1 %.tmp7431, label %.for.continue.7425, label %.for.end.7425
.for.continue.7425:
%.tmp7432 = getelementptr i8*, i8** %buf.7424, i32 0
%.tmp7434 = getelementptr [5 x i8], [5 x i8]*@.str7433, i32 0, i32 0
%.tmp7435 = load i8*, i8** %buf.7424
%.tmp7436 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7429
%.tmp7437 = call i8*(%m1861$.Type.type*) @m1861$type_abbr.cp.m1861$.Type.typep(%m1861$.Type.type* %.tmp7436)
%.tmp7438 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7432, i8* %.tmp7434, i8* %.tmp7435, i8* %.tmp7437)
%.tmp7439 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7429
%.tmp7440 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7439, i32 0, i32 4
%.tmp7441 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7440
store %m1861$.Type.type* %.tmp7441, %m1861$.Type.type** %t.7429
br label %.for.start.7425
.for.end.7425:
%.tmp7442 = load i8*, i8** %buf.7424
ret i8* %.tmp7442
br label %.if.end.7421
.if.false.7421:
%.tmp7443 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7444 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7443, i32 0, i32 0
%.tmp7445 = load i8*, i8** %.tmp7444
%.tmp7447 = getelementptr [9 x i8], [9 x i8]*@.str7446, i32 0, i32 0
%.tmp7448 = call i32(i8*,i8*) @strcmp(i8* %.tmp7445, i8* %.tmp7447)
%.tmp7449 = icmp eq i32 %.tmp7448, 0
br i1 %.tmp7449, label %.if.true.7450, label %.if.false.7450
.if.true.7450:
%.tmp7452 = getelementptr [2 x i8], [2 x i8]*@.str7451, i32 0, i32 0
ret i8* %.tmp7452
br label %.if.end.7450
.if.false.7450:
%.tmp7453 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7454 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7453, i32 0, i32 0
%.tmp7455 = load i8*, i8** %.tmp7454
%.tmp7457 = getelementptr [6 x i8], [6 x i8]*@.str7456, i32 0, i32 0
%.tmp7458 = call i32(i8*,i8*) @strcmp(i8* %.tmp7455, i8* %.tmp7457)
%.tmp7459 = icmp eq i32 %.tmp7458, 0
br i1 %.tmp7459, label %.if.true.7460, label %.if.false.7460
.if.true.7460:
%.tmp7462 = getelementptr [2 x i8], [2 x i8]*@.str7461, i32 0, i32 0
ret i8* %.tmp7462
br label %.if.end.7460
.if.false.7460:
%.tmp7464 = getelementptr [45 x i8], [45 x i8]*@.str7463, i32 0, i32 0
%.tmp7465 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7466 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7465, i32 0, i32 0
%.tmp7467 = load i8*, i8** %.tmp7466
%.tmp7468 = call i32(i8*,...) @printf(i8* %.tmp7464, i8* %.tmp7467)
br label %.if.end.7460
.if.end.7460:
br label %.if.end.7450
.if.end.7450:
br label %.if.end.7421
.if.end.7421:
br label %.if.end.7410
.if.end.7410:
br label %.if.end.7392
.if.end.7392:
br label %.if.end.7382
.if.end.7382:
br label %.if.end.7372
.if.end.7372:
br label %.if.end.7362
.if.end.7362:
br label %.if.end.7352
.if.end.7352:
%.tmp7469 = bitcast ptr null to i8*
ret i8* %.tmp7469
}
define %m1861$.AssignableInfo.type* @m1861$define_string.m1861$.AssignableInfo.typep.m1861$.CompilerCtx.typep.cp(%m1861$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp7470 = bitcast ptr null to %m307$.Node.type*
%.tmp7471 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7470)
%info.7472 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7471, %m1861$.AssignableInfo.type** %info.7472
%tmp_buff.7473 = alloca i8*
store i8* null, i8** %tmp_buff.7473
%.tmp7474 = getelementptr i8*, i8** %tmp_buff.7473, i32 0
%.tmp7476 = getelementptr [7 x i8], [7 x i8]*@.str7475, i32 0, i32 0
%.tmp7477 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7478 = call i32(%m1861$.CompilerCtx.type*) @m1861$new_uid.i.m1861$.CompilerCtx.typep(%m1861$.CompilerCtx.type* %.tmp7477)
%.tmp7479 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7474, i8* %.tmp7476, i32 %.tmp7478)
%.tmp7480 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7472
%.tmp7481 = load i8, i8* @SCOPE_GLOBAL
%.tmp7482 = load i8*, i8** %tmp_buff.7473
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7480, i8 %.tmp7481, i8* %.tmp7482)
%.tmp7483 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7472
%.tmp7484 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7483, i32 0, i32 4
%.tmp7485 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7485, %m1861$.Type.type** %.tmp7484
%.tmp7486 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7472
%.tmp7487 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7486, i32 0, i32 4
%.tmp7488 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7487
%.tmp7489 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7488, i32 0, i32 0
%.tmp7491 = getelementptr [6 x i8], [6 x i8]*@.str7490, i32 0, i32 0
store i8* %.tmp7491, i8** %.tmp7489
%.tmp7492 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7472
%.tmp7493 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7492, i32 0, i32 4
%.tmp7494 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7493
%.tmp7495 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7494, i32 0, i32 3
%.tmp7496 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7496, %m1861$.Type.type** %.tmp7495
%.tmp7497 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7472
%.tmp7498 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7497, i32 0, i32 4
%.tmp7499 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7498
%.tmp7500 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7499, i32 0, i32 3
%.tmp7501 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7500
%.tmp7502 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7501, i32 0, i32 0
%.tmp7504 = getelementptr [4 x i8], [4 x i8]*@.str7503, i32 0, i32 0
store i8* %.tmp7504, i8** %.tmp7502
%.tmp7505 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7472
%.tmp7506 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7505, i32 0, i32 4
%.tmp7507 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7506
%.tmp7508 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7507, i32 0, i32 3
%.tmp7509 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7508
%.tmp7510 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7509, i32 0, i32 4
%.tmp7511 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp7511, %m1861$.Type.type** %.tmp7510
%.tmp7512 = load i8*, i8** %text
%.tmp7513 = call i8*(i8*) @m2233$string_to_llvm.cp.cp(i8* %.tmp7512)
%identifier.7514 = alloca i8*
store i8* %.tmp7513, i8** %identifier.7514
%.tmp7515 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7472
%.tmp7516 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7515, i32 0, i32 4
%.tmp7517 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7516
%.tmp7518 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7517, i32 0, i32 3
%.tmp7519 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7518
%.tmp7520 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7519, i32 0, i32 4
%.tmp7521 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7520
%.tmp7522 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7521, i32 0, i32 0
%.tmp7523 = getelementptr i8*, i8** %.tmp7522, i32 0
%.tmp7525 = getelementptr [3 x i8], [3 x i8]*@.str7524, i32 0, i32 0
%.tmp7526 = load i8*, i8** %identifier.7514
%.tmp7527 = call i32(i8*) @m2233$llvm_str_len.i.cp(i8* %.tmp7526)
%.tmp7528 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7523, i8* %.tmp7525, i32 %.tmp7527)
%.tmp7529 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7530 = load i8*, i8** %identifier.7514
%.tmp7532 = getelementptr [7 x i8], [7 x i8]*@.str7531, i32 0, i32 0
%.tmp7533 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7472
call void(%m1861$.CompilerCtx.type*,i8*,i8*,%m1861$.AssignableInfo.type*,i1,i1) @m1861$define_global.v.m1861$.CompilerCtx.typep.cp.cp.m1861$.AssignableInfo.typep.b.b(%m1861$.CompilerCtx.type* %.tmp7529, i8* %.tmp7530, i8* %.tmp7532, %m1861$.AssignableInfo.type* %.tmp7533, i1 0, i1 0)
%.tmp7534 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7472
ret %m1861$.AssignableInfo.type* %.tmp7534
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
%.tmp7535 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* null, i32 1
%.tmp7536 = ptrtoint %m1861$.GlobalName.type* %.tmp7535 to i32
%.tmp7537 = call i8*(i32) @malloc(i32 %.tmp7536)
%.tmp7538 = bitcast i8* %.tmp7537 to %m1861$.GlobalName.type*
%global.7539 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7538, %m1861$.GlobalName.type** %global.7539
%.tmp7540 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7539
%.tmp7541 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7540, i32 0, i32 0
%.tmp7542 = load i8*, i8** %id
store i8* %.tmp7542, i8** %.tmp7541
%.tmp7543 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7539
%.tmp7544 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7543, i32 0, i32 1
%.tmp7545 = load i8*, i8** %type
store i8* %.tmp7545, i8** %.tmp7544
%.tmp7546 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7539
%.tmp7547 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7546, i32 0, i32 4
%.tmp7548 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info
store %m1861$.AssignableInfo.type* %.tmp7548, %m1861$.AssignableInfo.type** %.tmp7547
%.tmp7549 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7539
%.tmp7550 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7549, i32 0, i32 2
%.tmp7551 = load i1, i1* %compiled
store i1 %.tmp7551, i1* %.tmp7550
%.tmp7552 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7539
%.tmp7553 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7552, i32 0, i32 5
store %m1861$.GlobalName.type* null, %m1861$.GlobalName.type** %.tmp7553
%.tmp7554 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7539
%.tmp7555 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7554, i32 0, i32 3
%.tmp7556 = load i1, i1* %weak
store i1 %.tmp7556, i1* %.tmp7555
%.tmp7557 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7558 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %global.7539
call void(%m1861$.CompilerCtx.type*,%m1861$.GlobalName.type*) @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.tmp7557, %m1861$.GlobalName.type* %.tmp7558)
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
%.tmp7559 = load %m307$.Node.type*, %m307$.Node.type** %mod
%.tmp7560 = call %m1861$.AssignableInfo.type*(%m307$.Node.type*) @m1861$new_assignable_info.m1861$.AssignableInfo.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7559)
%info.7561 = alloca %m1861$.AssignableInfo.type*
store %m1861$.AssignableInfo.type* %.tmp7560, %m1861$.AssignableInfo.type** %info.7561
%.tmp7562 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7561
%.tmp7563 = load i8, i8* @SCOPE_CONST
%.tmp7564 = load i8*, i8** %abspath
call void(%m1861$.AssignableInfo.type*,i8,i8*) @m1861$set_assignable_id.v.m1861$.AssignableInfo.typep.c.cp(%m1861$.AssignableInfo.type* %.tmp7562, i8 %.tmp7563, i8* %.tmp7564)
%.tmp7565 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7561
%.tmp7566 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7565, i32 0, i32 3
%.tmp7568 = getelementptr [7 x i8], [7 x i8]*@.str7567, i32 0, i32 0
store i8* %.tmp7568, i8** %.tmp7566
%.tmp7569 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7561
%.tmp7570 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7569, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7570
%.tmp7571 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7572 = load %m307$.Node.type*, %m307$.Node.type** %mod
%.tmp7573 = load i8*, i8** %as_name
%.tmp7574 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %info.7561
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*,%m1861$.AssignableInfo.type*) @m1861$define_assignable.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp.m1861$.AssignableInfo.typep(%m1861$.CompilerCtx.type* %.tmp7571, %m307$.Node.type* %.tmp7572, i8* %.tmp7573, %m1861$.AssignableInfo.type* %.tmp7574)
ret void
}
define void @m1861$append_global.v.m1861$.CompilerCtx.typep.m1861$.GlobalName.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%g = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.g.arg, %m1861$.GlobalName.type** %g
%.tmp7575 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7576 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7575, i32 0, i32 3
%.tmp7577 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7576
%.tmp7578 = icmp eq %m1861$.GlobalName.type* %.tmp7577, null
br i1 %.tmp7578, label %.if.true.7579, label %.if.false.7579
.if.true.7579:
%.tmp7580 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7581 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7580, i32 0, i32 3
%.tmp7582 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7582, %m1861$.GlobalName.type** %.tmp7581
ret void
br label %.if.end.7579
.if.false.7579:
br label %.if.end.7579
.if.end.7579:
%.tmp7583 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7584 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7583, i32 0, i32 3
%.tmp7585 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7584
%last_global.7586 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7585, %m1861$.GlobalName.type** %last_global.7586
%.tmp7588 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7589 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7588, i32 0, i32 3
%.tmp7590 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7589
%curr_global.7591 = alloca %m1861$.GlobalName.type*
store %m1861$.GlobalName.type* %.tmp7590, %m1861$.GlobalName.type** %curr_global.7591
br label %.for.start.7587
.for.start.7587:
%.tmp7592 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7591
%.tmp7593 = icmp ne %m1861$.GlobalName.type* %.tmp7592, null
br i1 %.tmp7593, label %.for.continue.7587, label %.for.end.7587
.for.continue.7587:
%.tmp7594 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7591
%.tmp7595 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7594, i32 0, i32 4
%.tmp7596 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7595
%.tmp7597 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7596, i32 0, i32 0
%.tmp7598 = load i8*, i8** %.tmp7597
%.tmp7599 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
%.tmp7600 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7599, i32 0, i32 4
%.tmp7601 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp7600
%.tmp7602 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp7601, i32 0, i32 0
%.tmp7603 = load i8*, i8** %.tmp7602
%.tmp7604 = call i32(i8*,i8*) @strcmp(i8* %.tmp7598, i8* %.tmp7603)
%.tmp7605 = icmp eq i32 %.tmp7604, 0
br i1 %.tmp7605, label %.if.true.7606, label %.if.false.7606
.if.true.7606:
ret void
br label %.if.end.7606
.if.false.7606:
br label %.if.end.7606
.if.end.7606:
%.tmp7607 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7591
store %m1861$.GlobalName.type* %.tmp7607, %m1861$.GlobalName.type** %last_global.7586
%.tmp7608 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %curr_global.7591
%.tmp7609 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7608, i32 0, i32 5
%.tmp7610 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %.tmp7609
store %m1861$.GlobalName.type* %.tmp7610, %m1861$.GlobalName.type** %curr_global.7591
br label %.for.start.7587
.for.end.7587:
%.tmp7611 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %last_global.7586
%.tmp7612 = getelementptr %m1861$.GlobalName.type, %m1861$.GlobalName.type* %.tmp7611, i32 0, i32 5
%.tmp7613 = load %m1861$.GlobalName.type*, %m1861$.GlobalName.type** %g
store %m1861$.GlobalName.type* %.tmp7613, %m1861$.GlobalName.type** %.tmp7612
ret void
}
define i8* @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.Type.type* %.type.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%type = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.type.arg, %m1861$.Type.type** %type
%.tmp7614 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7615 = icmp eq %m1861$.Type.type* %.tmp7614, null
br i1 %.tmp7615, label %.if.true.7616, label %.if.false.7616
.if.true.7616:
%.tmp7617 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp7617, label %.if.true.7618, label %.if.false.7618
.if.true.7618:
%.tmp7620 = getelementptr [44 x i8], [44 x i8]*@.str7619, i32 0, i32 0
%.tmp7621 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7622 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7621, i32 0, i32 7
%.tmp7623 = load i8*, i8** %.tmp7622
%.tmp7624 = call i32(i8*,...) @printf(i8* %.tmp7620, i8* %.tmp7623)
br label %.if.end.7618
.if.false.7618:
br label %.if.end.7618
.if.end.7618:
%.tmp7626 = getelementptr [2 x i8], [2 x i8]*@.str7625, i32 0, i32 0
ret i8* %.tmp7626
br label %.if.end.7616
.if.false.7616:
br label %.if.end.7616
.if.end.7616:
%.tmp7627 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7628 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7627, i32 0, i32 0
%.tmp7629 = load i8*, i8** %.tmp7628
%.tmp7630 = icmp ne i8* %.tmp7629, null
%.tmp7632 = getelementptr [59 x i8], [59 x i8]*@.str7631, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7630, i8* %.tmp7632)
%buf.7633 = alloca i8*
store i8* null, i8** %buf.7633
%.tmp7634 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7635 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7634, i32 0, i32 0
%.tmp7636 = load i8*, i8** %.tmp7635
%.tmp7638 = getelementptr [4 x i8], [4 x i8]*@.str7637, i32 0, i32 0
%.tmp7639 = call i32(i8*,i8*) @strcmp(i8* %.tmp7636, i8* %.tmp7638)
%.tmp7640 = icmp eq i32 %.tmp7639, 0
br i1 %.tmp7640, label %.if.true.7641, label %.if.false.7641
.if.true.7641:
%.tmp7643 = getelementptr [4 x i8], [4 x i8]*@.str7642, i32 0, i32 0
ret i8* %.tmp7643
br label %.if.end.7641
.if.false.7641:
%.tmp7644 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7645 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7644, i32 0, i32 0
%.tmp7646 = load i8*, i8** %.tmp7645
%.tmp7648 = getelementptr [5 x i8], [5 x i8]*@.str7647, i32 0, i32 0
%.tmp7649 = call i32(i8*,i8*) @strcmp(i8* %.tmp7646, i8* %.tmp7648)
%.tmp7650 = icmp eq i32 %.tmp7649, 0
br i1 %.tmp7650, label %.if.true.7651, label %.if.false.7651
.if.true.7651:
%.tmp7653 = getelementptr [5 x i8], [5 x i8]*@.str7652, i32 0, i32 0
ret i8* %.tmp7653
br label %.if.end.7651
.if.false.7651:
%.tmp7654 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7655 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7654, i32 0, i32 0
%.tmp7656 = load i8*, i8** %.tmp7655
%.tmp7658 = getelementptr [5 x i8], [5 x i8]*@.str7657, i32 0, i32 0
%.tmp7659 = call i32(i8*,i8*) @strcmp(i8* %.tmp7656, i8* %.tmp7658)
%.tmp7660 = icmp eq i32 %.tmp7659, 0
br i1 %.tmp7660, label %.if.true.7661, label %.if.false.7661
.if.true.7661:
%.tmp7663 = getelementptr [3 x i8], [3 x i8]*@.str7662, i32 0, i32 0
ret i8* %.tmp7663
br label %.if.end.7661
.if.false.7661:
%.tmp7664 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7665 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7664, i32 0, i32 0
%.tmp7666 = load i8*, i8** %.tmp7665
%.tmp7668 = getelementptr [8 x i8], [8 x i8]*@.str7667, i32 0, i32 0
%.tmp7669 = call i32(i8*,i8*) @strcmp(i8* %.tmp7666, i8* %.tmp7668)
%.tmp7670 = icmp eq i32 %.tmp7669, 0
br i1 %.tmp7670, label %.if.true.7671, label %.if.false.7671
.if.true.7671:
%.tmp7673 = getelementptr [4 x i8], [4 x i8]*@.str7672, i32 0, i32 0
ret i8* %.tmp7673
br label %.if.end.7671
.if.false.7671:
%.tmp7674 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7675 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7674, i32 0, i32 0
%.tmp7676 = load i8*, i8** %.tmp7675
%.tmp7678 = getelementptr [4 x i8], [4 x i8]*@.str7677, i32 0, i32 0
%.tmp7679 = call i32(i8*,i8*) @strcmp(i8* %.tmp7676, i8* %.tmp7678)
%.tmp7680 = icmp eq i32 %.tmp7679, 0
br i1 %.tmp7680, label %.if.true.7681, label %.if.false.7681
.if.true.7681:
%.tmp7683 = getelementptr [3 x i8], [3 x i8]*@.str7682, i32 0, i32 0
ret i8* %.tmp7683
br label %.if.end.7681
.if.false.7681:
%.tmp7684 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7685 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7684, i32 0, i32 0
%.tmp7686 = load i8*, i8** %.tmp7685
%.tmp7688 = getelementptr [9 x i8], [9 x i8]*@.str7687, i32 0, i32 0
%.tmp7689 = call i32(i8*,i8*) @strcmp(i8* %.tmp7686, i8* %.tmp7688)
%.tmp7690 = icmp eq i32 %.tmp7689, 0
br i1 %.tmp7690, label %.if.true.7691, label %.if.false.7691
.if.true.7691:
%.tmp7692 = getelementptr i8*, i8** %buf.7633, i32 0
%.tmp7694 = getelementptr [4 x i8], [4 x i8]*@.str7693, i32 0, i32 0
%.tmp7695 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7696 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7697 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7696, i32 0, i32 3
%.tmp7698 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7697
%.tmp7699 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7695, %m1861$.Type.type* %.tmp7698)
%.tmp7700 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7692, i8* %.tmp7694, i8* %.tmp7699)
%.tmp7702 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7703 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7702, i32 0, i32 3
%.tmp7704 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7703
%.tmp7705 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7704, i32 0, i32 4
%.tmp7706 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7705
%p.7707 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7706, %m1861$.Type.type** %p.7707
br label %.for.start.7701
.for.start.7701:
%.tmp7708 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7707
%.tmp7709 = icmp ne %m1861$.Type.type* %.tmp7708, null
br i1 %.tmp7709, label %.for.continue.7701, label %.for.end.7701
.for.continue.7701:
%.tmp7710 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7707
%.tmp7711 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7712 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7711, i32 0, i32 3
%.tmp7713 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7712
%.tmp7714 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7713, i32 0, i32 4
%.tmp7715 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7714
%.tmp7716 = icmp ne %m1861$.Type.type* %.tmp7710, %.tmp7715
br i1 %.tmp7716, label %.if.true.7717, label %.if.false.7717
.if.true.7717:
%.tmp7718 = getelementptr i8*, i8** %buf.7633, i32 0
%.tmp7720 = getelementptr [4 x i8], [4 x i8]*@.str7719, i32 0, i32 0
%.tmp7721 = load i8*, i8** %buf.7633
%.tmp7722 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7718, i8* %.tmp7720, i8* %.tmp7721)
br label %.if.end.7717
.if.false.7717:
br label %.if.end.7717
.if.end.7717:
%.tmp7723 = getelementptr i8*, i8** %buf.7633, i32 0
%.tmp7725 = getelementptr [5 x i8], [5 x i8]*@.str7724, i32 0, i32 0
%.tmp7726 = load i8*, i8** %buf.7633
%.tmp7727 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7728 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7707
%.tmp7729 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7727, %m1861$.Type.type* %.tmp7728)
%.tmp7730 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7723, i8* %.tmp7725, i8* %.tmp7726, i8* %.tmp7729)
%.tmp7731 = load %m1861$.Type.type*, %m1861$.Type.type** %p.7707
%.tmp7732 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7731, i32 0, i32 4
%.tmp7733 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7732
store %m1861$.Type.type* %.tmp7733, %m1861$.Type.type** %p.7707
br label %.for.start.7701
.for.end.7701:
%.tmp7734 = getelementptr i8*, i8** %buf.7633, i32 0
%.tmp7736 = getelementptr [4 x i8], [4 x i8]*@.str7735, i32 0, i32 0
%.tmp7737 = load i8*, i8** %buf.7633
%.tmp7738 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7734, i8* %.tmp7736, i8* %.tmp7737)
%.tmp7739 = load i8*, i8** %buf.7633
ret i8* %.tmp7739
br label %.if.end.7691
.if.false.7691:
%.tmp7740 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7741 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7740, i32 0, i32 0
%.tmp7742 = load i8*, i8** %.tmp7741
%.tmp7744 = getelementptr [4 x i8], [4 x i8]*@.str7743, i32 0, i32 0
%.tmp7745 = call i32(i8*,i8*) @strcmp(i8* %.tmp7742, i8* %.tmp7744)
%.tmp7746 = icmp eq i32 %.tmp7745, 0
br i1 %.tmp7746, label %.if.true.7747, label %.if.false.7747
.if.true.7747:
%.tmp7748 = getelementptr i8*, i8** %buf.7633, i32 0
%.tmp7750 = getelementptr [4 x i8], [4 x i8]*@.str7749, i32 0, i32 0
%.tmp7751 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7752 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7753 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7752, i32 0, i32 3
%.tmp7754 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7753
%.tmp7755 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7751, %m1861$.Type.type* %.tmp7754)
%.tmp7756 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7748, i8* %.tmp7750, i8* %.tmp7755)
%.tmp7757 = load i8*, i8** %buf.7633
ret i8* %.tmp7757
br label %.if.end.7747
.if.false.7747:
%.tmp7758 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7759 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7758, i32 0, i32 0
%.tmp7760 = load i8*, i8** %.tmp7759
%.tmp7762 = getelementptr [7 x i8], [7 x i8]*@.str7761, i32 0, i32 0
%.tmp7763 = call i32(i8*,i8*) @strcmp(i8* %.tmp7760, i8* %.tmp7762)
%.tmp7764 = icmp eq i32 %.tmp7763, 0
br i1 %.tmp7764, label %.if.true.7765, label %.if.false.7765
.if.true.7765:
%.tmp7766 = getelementptr i8*, i8** %buf.7633, i32 0
%.tmp7768 = getelementptr [2 x i8], [2 x i8]*@.str7767, i32 0, i32 0
%.tmp7769 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7766, i8* %.tmp7768)
%.tmp7771 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7772 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7771, i32 0, i32 3
%.tmp7773 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7772
%t.7774 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7773, %m1861$.Type.type** %t.7774
br label %.for.start.7770
.for.start.7770:
%.tmp7775 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7774
%.tmp7776 = icmp ne %m1861$.Type.type* %.tmp7775, null
br i1 %.tmp7776, label %.for.continue.7770, label %.for.end.7770
.for.continue.7770:
%.tmp7777 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7774
%.tmp7778 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7779 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7778, i32 0, i32 3
%.tmp7780 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7779
%.tmp7781 = icmp ne %m1861$.Type.type* %.tmp7777, %.tmp7780
br i1 %.tmp7781, label %.if.true.7782, label %.if.false.7782
.if.true.7782:
%.tmp7783 = getelementptr i8*, i8** %buf.7633, i32 0
%.tmp7785 = getelementptr [4 x i8], [4 x i8]*@.str7784, i32 0, i32 0
%.tmp7786 = load i8*, i8** %buf.7633
%.tmp7787 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7783, i8* %.tmp7785, i8* %.tmp7786)
br label %.if.end.7782
.if.false.7782:
br label %.if.end.7782
.if.end.7782:
%.tmp7788 = getelementptr i8*, i8** %buf.7633, i32 0
%.tmp7790 = getelementptr [5 x i8], [5 x i8]*@.str7789, i32 0, i32 0
%.tmp7791 = load i8*, i8** %buf.7633
%.tmp7792 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7793 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7774
%.tmp7794 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7792, %m1861$.Type.type* %.tmp7793)
%.tmp7795 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7788, i8* %.tmp7790, i8* %.tmp7791, i8* %.tmp7794)
%.tmp7796 = load %m1861$.Type.type*, %m1861$.Type.type** %t.7774
%.tmp7797 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7796, i32 0, i32 4
%.tmp7798 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7797
store %m1861$.Type.type* %.tmp7798, %m1861$.Type.type** %t.7774
br label %.for.start.7770
.for.end.7770:
%.tmp7799 = getelementptr i8*, i8** %buf.7633, i32 0
%.tmp7801 = getelementptr [4 x i8], [4 x i8]*@.str7800, i32 0, i32 0
%.tmp7802 = load i8*, i8** %buf.7633
%.tmp7803 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7799, i8* %.tmp7801, i8* %.tmp7802)
%.tmp7804 = load i8*, i8** %buf.7633
ret i8* %.tmp7804
br label %.if.end.7765
.if.false.7765:
%.tmp7805 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7806 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7805, i32 0, i32 0
%.tmp7807 = load i8*, i8** %.tmp7806
%.tmp7809 = getelementptr [6 x i8], [6 x i8]*@.str7808, i32 0, i32 0
%.tmp7810 = call i32(i8*,i8*) @strcmp(i8* %.tmp7807, i8* %.tmp7809)
%.tmp7811 = icmp eq i32 %.tmp7810, 0
br i1 %.tmp7811, label %.if.true.7812, label %.if.false.7812
.if.true.7812:
%.tmp7813 = getelementptr i8*, i8** %buf.7633, i32 0
%.tmp7815 = getelementptr [10 x i8], [10 x i8]*@.str7814, i32 0, i32 0
%.tmp7816 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7817 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7816, i32 0, i32 3
%.tmp7818 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7817
%.tmp7819 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7818, i32 0, i32 4
%.tmp7820 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7819
%.tmp7821 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7820, i32 0, i32 0
%.tmp7822 = load i8*, i8** %.tmp7821
%.tmp7823 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7824 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7825 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7824, i32 0, i32 3
%.tmp7826 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7825
%.tmp7827 = call i8*(%m1861$.CompilerCtx.type*,%m1861$.Type.type*) @m1861$type_repr.cp.m1861$.CompilerCtx.typep.m1861$.Type.typep(%m1861$.CompilerCtx.type* %.tmp7823, %m1861$.Type.type* %.tmp7826)
%.tmp7828 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7813, i8* %.tmp7815, i8* %.tmp7822, i8* %.tmp7827)
%.tmp7829 = load i8*, i8** %buf.7633
ret i8* %.tmp7829
br label %.if.end.7812
.if.false.7812:
%.tmp7830 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7831 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7830, i32 0, i32 0
%.tmp7832 = load i8*, i8** %.tmp7831
%.tmp7834 = getelementptr [10 x i8], [10 x i8]*@.str7833, i32 0, i32 0
%.tmp7835 = call i32(i8*,i8*) @strcmp(i8* %.tmp7832, i8* %.tmp7834)
%.tmp7836 = icmp eq i32 %.tmp7835, 0
br i1 %.tmp7836, label %.if.true.7837, label %.if.false.7837
.if.true.7837:
%.tmp7838 = getelementptr i8*, i8** %buf.7633, i32 0
%.tmp7840 = getelementptr [5 x i8], [5 x i8]*@.str7839, i32 0, i32 0
%.tmp7841 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7842 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7841, i32 0, i32 2
%.tmp7843 = load i8*, i8** %.tmp7842
%.tmp7844 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7838, i8* %.tmp7840, i8* %.tmp7843)
%.tmp7845 = load i8*, i8** %buf.7633
ret i8* %.tmp7845
br label %.if.end.7837
.if.false.7837:
%.tmp7846 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7847 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7846, i32 0, i32 0
%.tmp7848 = load i8*, i8** %.tmp7847
%.tmp7850 = getelementptr [7 x i8], [7 x i8]*@.str7849, i32 0, i32 0
%.tmp7851 = call i32(i8*,i8*) @strcmp(i8* %.tmp7848, i8* %.tmp7850)
%.tmp7852 = icmp eq i32 %.tmp7851, 0
br i1 %.tmp7852, label %.if.true.7853, label %.if.false.7853
.if.true.7853:
%.tmp7855 = getelementptr [4 x i8], [4 x i8]*@.str7854, i32 0, i32 0
ret i8* %.tmp7855
br label %.if.end.7853
.if.false.7853:
%.tmp7856 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7857 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7856, i32 0, i32 0
%.tmp7858 = load i8*, i8** %.tmp7857
%.tmp7860 = getelementptr [6 x i8], [6 x i8]*@.str7859, i32 0, i32 0
%.tmp7861 = call i32(i8*,i8*) @strcmp(i8* %.tmp7858, i8* %.tmp7860)
%.tmp7862 = icmp eq i32 %.tmp7861, 0
br i1 %.tmp7862, label %.if.true.7863, label %.if.false.7863
.if.true.7863:
br label %.if.end.7863
.if.false.7863:
%.tmp7865 = getelementptr [58 x i8], [58 x i8]*@.str7864, i32 0, i32 0
%.tmp7866 = load %m1861$.Type.type*, %m1861$.Type.type** %type
%.tmp7867 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7866, i32 0, i32 0
%.tmp7868 = load i8*, i8** %.tmp7867
%.tmp7869 = call i32(i8*,...) @printf(i8* %.tmp7865, i8* %.tmp7868)
br label %.if.end.7863
.if.end.7863:
br label %.if.end.7853
.if.end.7853:
br label %.if.end.7837
.if.end.7837:
br label %.if.end.7812
.if.end.7812:
br label %.if.end.7765
.if.end.7765:
br label %.if.end.7747
.if.end.7747:
br label %.if.end.7691
.if.end.7691:
br label %.if.end.7681
.if.end.7681:
br label %.if.end.7671
.if.end.7671:
br label %.if.end.7661
.if.end.7661:
br label %.if.end.7651
.if.end.7651:
br label %.if.end.7641
.if.end.7641:
%.tmp7870 = bitcast ptr null to i8*
ret i8* %.tmp7870
}
define void @m1861$append_error.v.m1861$.CompilerCtx.typep.m751$.Error.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m751$.Error.type* %.e.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%e = alloca %m751$.Error.type*
store %m751$.Error.type* %.e.arg, %m751$.Error.type** %e
%.tmp7871 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* null, i32 1
%.tmp7872 = ptrtoint %m1861$.ErrorList.type* %.tmp7871 to i32
%.tmp7873 = call i8*(i32) @malloc(i32 %.tmp7872)
%.tmp7874 = bitcast i8* %.tmp7873 to %m1861$.ErrorList.type*
%new_err.7875 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* %.tmp7874, %m1861$.ErrorList.type** %new_err.7875
%.tmp7876 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7875
%.tmp7877 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7876, i32 0, i32 2
store i1 0, i1* %.tmp7877
%.tmp7878 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7875
%.tmp7879 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7878, i32 0, i32 0
%.tmp7880 = load %m751$.Error.type*, %m751$.Error.type** %e
store %m751$.Error.type* %.tmp7880, %m751$.Error.type** %.tmp7879
%.tmp7881 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7875
%.tmp7882 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7881, i32 0, i32 1
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %.tmp7882
%.tmp7883 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7884 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7883, i32 0, i32 2
%.tmp7885 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7884
%.tmp7886 = icmp eq %m1861$.ErrorList.type* %.tmp7885, null
br i1 %.tmp7886, label %.if.true.7887, label %.if.false.7887
.if.true.7887:
%.tmp7888 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7889 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7888, i32 0, i32 2
%.tmp7890 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7875
store %m1861$.ErrorList.type* %.tmp7890, %m1861$.ErrorList.type** %.tmp7889
ret void
br label %.if.end.7887
.if.false.7887:
br label %.if.end.7887
.if.end.7887:
%last.7891 = alloca %m1861$.ErrorList.type*
store %m1861$.ErrorList.type* null, %m1861$.ErrorList.type** %last.7891
%.tmp7893 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7894 = getelementptr %m1861$.CompilerCtx.type, %m1861$.CompilerCtx.type* %.tmp7893, i32 0, i32 2
%.tmp7895 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7894
store %m1861$.ErrorList.type* %.tmp7895, %m1861$.ErrorList.type** %last.7891
br label %.for.start.7892
.for.start.7892:
%.tmp7896 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7891
%.tmp7897 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7896, i32 0, i32 1
%.tmp7898 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7897
%.tmp7899 = icmp ne %m1861$.ErrorList.type* %.tmp7898, null
br i1 %.tmp7899, label %.for.continue.7892, label %.for.end.7892
.for.continue.7892:
%.tmp7900 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7891
%.tmp7901 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7900, i32 0, i32 1
%.tmp7902 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %.tmp7901
store %m1861$.ErrorList.type* %.tmp7902, %m1861$.ErrorList.type** %last.7891
br label %.for.start.7892
.for.end.7892:
%.tmp7903 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %last.7891
%.tmp7904 = getelementptr %m1861$.ErrorList.type, %m1861$.ErrorList.type* %.tmp7903, i32 0, i32 1
%.tmp7905 = load %m1861$.ErrorList.type*, %m1861$.ErrorList.type** %new_err.7875
store %m1861$.ErrorList.type* %.tmp7905, %m1861$.ErrorList.type** %.tmp7904
ret void
}
define i8* @m1861$syn_function_name.cp.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7906 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7907 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7906, i32 0, i32 6
%.tmp7908 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7907
%.tmp7909 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7908, i32 0, i32 7
%.tmp7910 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7909
%.tmp7911 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7910, i32 0, i32 1
%.tmp7912 = load i8*, i8** %.tmp7911
ret i8* %.tmp7912
}
define %m307$.Node.type* @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m307$.Node.type*
store %m307$.Node.type* %.node.arg, %m307$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp7914 = load %m307$.Node.type*, %m307$.Node.type** %node
%n.7915 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7914, %m307$.Node.type** %n.7915
br label %.for.start.7913
.for.start.7913:
%.tmp7916 = load %m307$.Node.type*, %m307$.Node.type** %n.7915
%.tmp7917 = icmp ne %m307$.Node.type* %.tmp7916, null
br i1 %.tmp7917, label %.for.continue.7913, label %.for.end.7913
.for.continue.7913:
%.tmp7918 = load %m307$.Node.type*, %m307$.Node.type** %n.7915
%.tmp7919 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7918, i32 0, i32 0
%.tmp7920 = load i8*, i8** %.tmp7919
%.tmp7921 = load i8*, i8** %type
%.tmp7922 = call i32(i8*,i8*) @strcmp(i8* %.tmp7920, i8* %.tmp7921)
%.tmp7923 = icmp eq i32 %.tmp7922, 0
br i1 %.tmp7923, label %.if.true.7924, label %.if.false.7924
.if.true.7924:
%.tmp7925 = load %m307$.Node.type*, %m307$.Node.type** %n.7915
ret %m307$.Node.type* %.tmp7925
br label %.if.end.7924
.if.false.7924:
br label %.if.end.7924
.if.end.7924:
%.tmp7926 = load %m307$.Node.type*, %m307$.Node.type** %n.7915
%.tmp7927 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7926, i32 0, i32 7
%.tmp7928 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7927
store %m307$.Node.type* %.tmp7928, %m307$.Node.type** %n.7915
br label %.for.start.7913
.for.end.7913:
%.tmp7929 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp7929
}
define %m1861$.Type.type* @m1861$syn_function_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp7930 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%function_type.7931 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7930, %m1861$.Type.type** %function_type.7931
%.tmp7932 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7933 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7934 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7933, i32 0, i32 6
%.tmp7935 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7934
%.tmp7936 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7932, %m307$.Node.type* %.tmp7935)
%return_value_type.7937 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7936, %m1861$.Type.type** %return_value_type.7937
%.tmp7938 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7931
%.tmp7939 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7938, i32 0, i32 0
%.tmp7941 = getelementptr [9 x i8], [9 x i8]*@.str7940, i32 0, i32 0
store i8* %.tmp7941, i8** %.tmp7939
%.tmp7942 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7931
%.tmp7943 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7942, i32 0, i32 3
%.tmp7944 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7937
store %m1861$.Type.type* %.tmp7944, %m1861$.Type.type** %.tmp7943
%.tmp7945 = load %m1861$.Type.type*, %m1861$.Type.type** %return_value_type.7937
%last_type.7946 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7945, %m1861$.Type.type** %last_type.7946
%.tmp7947 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp7948 = call %m307$.Node.type*(%m307$.Node.type*) @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.tmp7947)
%params.7949 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7948, %m307$.Node.type** %params.7949
%.tmp7951 = load %m307$.Node.type*, %m307$.Node.type** %params.7949
%param_ptr.7952 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp7951, %m307$.Node.type** %param_ptr.7952
br label %.for.start.7950
.for.start.7950:
%.tmp7953 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7952
%.tmp7954 = icmp ne %m307$.Node.type* %.tmp7953, null
br i1 %.tmp7954, label %.for.continue.7950, label %.for.end.7950
.for.continue.7950:
%.tmp7955 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7952
%.tmp7956 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7955, i32 0, i32 0
%.tmp7957 = load i8*, i8** %.tmp7956
%.tmp7959 = getelementptr [5 x i8], [5 x i8]*@.str7958, i32 0, i32 0
%.tmp7960 = call i32(i8*,i8*) @strcmp(i8* %.tmp7957, i8* %.tmp7959)
%.tmp7961 = icmp eq i32 %.tmp7960, 0
br i1 %.tmp7961, label %.if.true.7962, label %.if.false.7962
.if.true.7962:
%.tmp7963 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7946
%.tmp7964 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7963, i32 0, i32 4
%.tmp7965 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7946
%.tmp7966 = call %m1861$.Type.type*(%m1861$.Type.type*) @m1861$type_clone.m1861$.Type.typep.m1861$.Type.typep(%m1861$.Type.type* %.tmp7965)
store %m1861$.Type.type* %.tmp7966, %m1861$.Type.type** %.tmp7964
%.tmp7967 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7946
%.tmp7968 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7967, i32 0, i32 4
%.tmp7969 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7968
%.tmp7970 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7969, i32 0, i32 4
store %m1861$.Type.type* null, %m1861$.Type.type** %.tmp7970
%.tmp7971 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7946
%.tmp7972 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7971, i32 0, i32 4
%.tmp7973 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp7972
store %m1861$.Type.type* %.tmp7973, %m1861$.Type.type** %last_type.7946
%.tmp7974 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7952
%.tmp7975 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7974, i32 0, i32 7
%.tmp7976 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7975
%.tmp7977 = icmp ne %m307$.Node.type* %.tmp7976, null
br i1 %.tmp7977, label %.if.true.7978, label %.if.false.7978
.if.true.7978:
%.tmp7979 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7952
%.tmp7980 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7979, i32 0, i32 7
%.tmp7981 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7980
store %m307$.Node.type* %.tmp7981, %m307$.Node.type** %param_ptr.7952
br label %.if.end.7978
.if.false.7978:
br label %.if.end.7978
.if.end.7978:
%.tmp7982 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7952
%.tmp7983 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7982, i32 0, i32 7
%.tmp7984 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7983
%.tmp7985 = icmp ne %m307$.Node.type* %.tmp7984, null
br i1 %.tmp7985, label %.if.true.7986, label %.if.false.7986
.if.true.7986:
%.tmp7987 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7952
%.tmp7988 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7987, i32 0, i32 7
%.tmp7989 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7988
store %m307$.Node.type* %.tmp7989, %m307$.Node.type** %param_ptr.7952
br label %.if.end.7986
.if.false.7986:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7952
br label %.if.end.7986
.if.end.7986:
br label %.if.end.7962
.if.false.7962:
%.tmp7990 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp7991 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7952
%.tmp7992 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp7991, i32 0, i32 6
%.tmp7993 = load %m307$.Node.type*, %m307$.Node.type** %.tmp7992
%.tmp7994 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp7990, %m307$.Node.type* %.tmp7993)
%param_type.7995 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp7994, %m1861$.Type.type** %param_type.7995
%.tmp7996 = load %m1861$.Type.type*, %m1861$.Type.type** %last_type.7946
%.tmp7997 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp7996, i32 0, i32 4
%.tmp7998 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7995
store %m1861$.Type.type* %.tmp7998, %m1861$.Type.type** %.tmp7997
%.tmp7999 = load %m1861$.Type.type*, %m1861$.Type.type** %param_type.7995
store %m1861$.Type.type* %.tmp7999, %m1861$.Type.type** %last_type.7946
%.tmp8000 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7952
%.tmp8001 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8000, i32 0, i32 7
%.tmp8002 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8001
store %m307$.Node.type* %.tmp8002, %m307$.Node.type** %param_ptr.7952
%.tmp8003 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7952
%.tmp8004 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8003, i32 0, i32 7
%.tmp8005 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8004
%.tmp8006 = icmp ne %m307$.Node.type* %.tmp8005, null
br i1 %.tmp8006, label %.if.true.8007, label %.if.false.8007
.if.true.8007:
%.tmp8008 = load %m307$.Node.type*, %m307$.Node.type** %param_ptr.7952
%.tmp8009 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8008, i32 0, i32 7
%.tmp8010 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8009
%.tmp8011 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8010, i32 0, i32 7
%.tmp8012 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8011
store %m307$.Node.type* %.tmp8012, %m307$.Node.type** %param_ptr.7952
br label %.if.end.8007
.if.false.8007:
store %m307$.Node.type* null, %m307$.Node.type** %param_ptr.7952
br label %.if.end.8007
.if.end.8007:
br label %.if.end.7962
.if.end.7962:
br label %.for.start.7950
.for.end.7950:
%.tmp8013 = load %m1861$.Type.type*, %m1861$.Type.type** %function_type.7931
ret %m1861$.Type.type* %.tmp8013
}
define %m307$.Node.type* @m1861$syn_function_params.m307$.Node.typep.m307$.Node.typep(%m307$.Node.type* %.stmt.arg) {
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp8014 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8016 = getelementptr [10 x i8], [10 x i8]*@.str8015, i32 0, i32 0
%.tmp8017 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp8014, i8* %.tmp8016)
%params.8018 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8017, %m307$.Node.type** %params.8018
%.tmp8019 = load %m307$.Node.type*, %m307$.Node.type** %params.8018
%.tmp8020 = icmp eq %m307$.Node.type* %.tmp8019, null
br i1 %.tmp8020, label %.if.true.8021, label %.if.false.8021
.if.true.8021:
%.tmp8022 = bitcast ptr null to %m307$.Node.type*
ret %m307$.Node.type* %.tmp8022
br label %.if.end.8021
.if.false.8021:
br label %.if.end.8021
.if.end.8021:
%.tmp8023 = load %m307$.Node.type*, %m307$.Node.type** %params.8018
%.tmp8024 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8023, i32 0, i32 6
%.tmp8025 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8024
ret %m307$.Node.type* %.tmp8025
}
define %m1861$.Type.type* @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.ctx.arg, %m307$.Node.type* %.stmt.arg) {
%ctx = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.ctx.arg, %m1861$.CompilerCtx.type** %ctx
%stmt = alloca %m307$.Node.type*
store %m307$.Node.type* %.stmt.arg, %m307$.Node.type** %stmt
%.tmp8026 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8027 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8026, i32 0, i32 0
%.tmp8028 = load i8*, i8** %.tmp8027
%.tmp8030 = getelementptr [11 x i8], [11 x i8]*@.str8029, i32 0, i32 0
%.tmp8031 = call i32(i8*,i8*) @strcmp(i8* %.tmp8028, i8* %.tmp8030)
%.tmp8032 = icmp eq i32 %.tmp8031, 0
br i1 %.tmp8032, label %.if.true.8033, label %.if.false.8033
.if.true.8033:
%.tmp8034 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8035 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8036 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8035, i32 0, i32 6
%.tmp8037 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8036
%.tmp8038 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8034, %m307$.Node.type* %.tmp8037)
%t.8039 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8038, %m1861$.Type.type** %t.8039
%.tmp8040 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8041 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8040, i32 0, i32 7
%.tmp8042 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8041
%.tmp8043 = icmp ne %m307$.Node.type* %.tmp8042, null
br i1 %.tmp8043, label %.if.true.8044, label %.if.false.8044
.if.true.8044:
%.tmp8045 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8046 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8045, i32 0, i32 7
%.tmp8047 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8046
%.tmp8048 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8047, i32 0, i32 0
%.tmp8049 = load i8*, i8** %.tmp8048
%.tmp8051 = getelementptr [13 x i8], [13 x i8]*@.str8050, i32 0, i32 0
%.tmp8052 = call i32(i8*,i8*) @strcmp(i8* %.tmp8049, i8* %.tmp8051)
%.tmp8053 = icmp eq i32 %.tmp8052, 0
br i1 %.tmp8053, label %.if.true.8054, label %.if.false.8054
.if.true.8054:
%.tmp8055 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%fn_type.8056 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8055, %m1861$.Type.type** %fn_type.8056
%.tmp8057 = load %m1861$.Type.type*, %m1861$.Type.type** %fn_type.8056
%.tmp8058 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8057, i32 0, i32 0
%.tmp8060 = getelementptr [9 x i8], [9 x i8]*@.str8059, i32 0, i32 0
store i8* %.tmp8060, i8** %.tmp8058
%.tmp8061 = load %m1861$.Type.type*, %m1861$.Type.type** %fn_type.8056
%.tmp8062 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8061, i32 0, i32 3
%.tmp8063 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8039
store %m1861$.Type.type* %.tmp8063, %m1861$.Type.type** %.tmp8062
%.tmp8064 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8065 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8064, i32 0, i32 7
%.tmp8066 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8065
%.tmp8067 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8066, i32 0, i32 6
%.tmp8068 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8067
%.tmp8069 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8068, i32 0, i32 7
%.tmp8070 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8069
%fst_operator.8071 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8070, %m307$.Node.type** %fst_operator.8071
%.tmp8072 = load %m307$.Node.type*, %m307$.Node.type** %fst_operator.8071
%.tmp8073 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8072, i32 0, i32 0
%.tmp8074 = load i8*, i8** %.tmp8073
%.tmp8076 = getelementptr [15 x i8], [15 x i8]*@.str8075, i32 0, i32 0
%.tmp8077 = call i32(i8*,i8*) @strcmp(i8* %.tmp8074, i8* %.tmp8076)
%.tmp8078 = icmp eq i32 %.tmp8077, 0
br i1 %.tmp8078, label %.if.true.8079, label %.if.false.8079
.if.true.8079:
%.tmp8080 = load %m1861$.Type.type*, %m1861$.Type.type** %fn_type.8056
%.tmp8081 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8080, i32 0, i32 3
%.tmp8082 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8081
%last_fn_value.8083 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8082, %m1861$.Type.type** %last_fn_value.8083
%.tmp8085 = load %m307$.Node.type*, %m307$.Node.type** %fst_operator.8071
%.tmp8086 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8085, i32 0, i32 6
%.tmp8087 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8086
%t.8088 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8087, %m307$.Node.type** %t.8088
br label %.for.start.8084
.for.start.8084:
%.tmp8089 = load %m307$.Node.type*, %m307$.Node.type** %t.8088
%.tmp8090 = icmp ne %m307$.Node.type* %.tmp8089, null
br i1 %.tmp8090, label %.for.continue.8084, label %.for.end.8084
.for.continue.8084:
%.tmp8091 = load %m1861$.Type.type*, %m1861$.Type.type** %last_fn_value.8083
%.tmp8092 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8091, i32 0, i32 4
%.tmp8093 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8094 = load %m307$.Node.type*, %m307$.Node.type** %t.8088
%.tmp8095 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8094, i32 0, i32 6
%.tmp8096 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8095
%.tmp8097 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8093, %m307$.Node.type* %.tmp8096)
store %m1861$.Type.type* %.tmp8097, %m1861$.Type.type** %.tmp8092
%.tmp8098 = load %m1861$.Type.type*, %m1861$.Type.type** %last_fn_value.8083
%.tmp8099 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8098, i32 0, i32 4
%.tmp8100 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8099
store %m1861$.Type.type* %.tmp8100, %m1861$.Type.type** %last_fn_value.8083
%.tmp8101 = load %m307$.Node.type*, %m307$.Node.type** %t.8088
%.tmp8102 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8101, i32 0, i32 7
%.tmp8103 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8102
store %m307$.Node.type* %.tmp8103, %m307$.Node.type** %t.8088
br label %.for.start.8084
.for.end.8084:
br label %.if.end.8079
.if.false.8079:
br label %.if.end.8079
.if.end.8079:
%.tmp8104 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%t_ptr.8105 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8104, %m1861$.Type.type** %t_ptr.8105
%.tmp8106 = load %m1861$.Type.type*, %m1861$.Type.type** %t_ptr.8105
%.tmp8107 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8106, i32 0, i32 0
%.tmp8109 = getelementptr [4 x i8], [4 x i8]*@.str8108, i32 0, i32 0
store i8* %.tmp8109, i8** %.tmp8107
%.tmp8110 = load %m1861$.Type.type*, %m1861$.Type.type** %t_ptr.8105
%.tmp8111 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8110, i32 0, i32 3
%.tmp8112 = load %m1861$.Type.type*, %m1861$.Type.type** %fn_type.8056
store %m1861$.Type.type* %.tmp8112, %m1861$.Type.type** %.tmp8111
%.tmp8113 = load %m1861$.Type.type*, %m1861$.Type.type** %t_ptr.8105
store %m1861$.Type.type* %.tmp8113, %m1861$.Type.type** %t.8039
br label %.if.end.8054
.if.false.8054:
br label %.if.end.8054
.if.end.8054:
br label %.if.end.8044
.if.false.8044:
br label %.if.end.8044
.if.end.8044:
%.tmp8114 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8039
ret %m1861$.Type.type* %.tmp8114
br label %.if.end.8033
.if.false.8033:
br label %.if.end.8033
.if.end.8033:
%.tmp8115 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%t.8116 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8115, %m1861$.Type.type** %t.8116
%.tmp8117 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8118 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8117, i32 0, i32 0
%.tmp8119 = load i8*, i8** %.tmp8118
%.tmp8121 = getelementptr [10 x i8], [10 x i8]*@.str8120, i32 0, i32 0
%.tmp8122 = call i32(i8*,i8*) @strcmp(i8* %.tmp8119, i8* %.tmp8121)
%.tmp8123 = icmp eq i32 %.tmp8122, 0
br i1 %.tmp8123, label %.if.true.8124, label %.if.false.8124
.if.true.8124:
%.tmp8125 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8126 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8125, i32 0, i32 0
%.tmp8128 = getelementptr [7 x i8], [7 x i8]*@.str8127, i32 0, i32 0
store i8* %.tmp8128, i8** %.tmp8126
%.tmp8129 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8130 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8129, i32 0, i32 1
store i8* null, i8** %.tmp8130
%.tmp8131 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8132 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8131, i32 0, i32 6
%.tmp8133 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8132
%.tmp8135 = getelementptr [5 x i8], [5 x i8]*@.str8134, i32 0, i32 0
%.tmp8136 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp8133, i8* %.tmp8135)
%curr_type.8137 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8136, %m307$.Node.type** %curr_type.8137
%.tmp8138 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8137
%.tmp8139 = icmp ne %m307$.Node.type* %.tmp8138, null
br i1 %.tmp8139, label %.if.true.8140, label %.if.false.8140
.if.true.8140:
%.tmp8141 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8142 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8141, i32 0, i32 3
%.tmp8143 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8144 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8137
%.tmp8145 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8144, i32 0, i32 6
%.tmp8146 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8145
%.tmp8147 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8143, %m307$.Node.type* %.tmp8146)
store %m1861$.Type.type* %.tmp8147, %m1861$.Type.type** %.tmp8142
%.tmp8148 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8149 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8148, i32 0, i32 3
%.tmp8150 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8149
%.tmp8151 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8150, i32 0, i32 1
%.tmp8152 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8137
%.tmp8153 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8152, i32 0, i32 7
%.tmp8154 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8153
%.tmp8155 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8154, i32 0, i32 1
%.tmp8156 = load i8*, i8** %.tmp8155
store i8* %.tmp8156, i8** %.tmp8151
%.tmp8157 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8158 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8157, i32 0, i32 3
%.tmp8159 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8158
%curr_t.8160 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8159, %m1861$.Type.type** %curr_t.8160
%.tmp8162 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8137
%.tmp8163 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8162, i32 0, i32 7
%.tmp8164 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8163
%.tmp8166 = getelementptr [5 x i8], [5 x i8]*@.str8165, i32 0, i32 0
%.tmp8167 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp8164, i8* %.tmp8166)
store %m307$.Node.type* %.tmp8167, %m307$.Node.type** %curr_type.8137
br label %.for.start.8161
.for.start.8161:
%.tmp8168 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8137
%.tmp8169 = icmp ne %m307$.Node.type* %.tmp8168, null
br i1 %.tmp8169, label %.for.continue.8161, label %.for.end.8161
.for.continue.8161:
%.tmp8170 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.8160
%.tmp8171 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8170, i32 0, i32 4
%.tmp8172 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8173 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8137
%.tmp8174 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8173, i32 0, i32 6
%.tmp8175 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8174
%.tmp8176 = call %m1861$.Type.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$node_to_type.m1861$.Type.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8172, %m307$.Node.type* %.tmp8175)
store %m1861$.Type.type* %.tmp8176, %m1861$.Type.type** %.tmp8171
%.tmp8177 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.8160
%.tmp8178 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8177, i32 0, i32 4
%.tmp8179 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8178
%.tmp8180 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8179, i32 0, i32 1
%.tmp8181 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8137
%.tmp8182 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8181, i32 0, i32 7
%.tmp8183 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8182
%.tmp8184 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8183, i32 0, i32 1
%.tmp8185 = load i8*, i8** %.tmp8184
store i8* %.tmp8185, i8** %.tmp8180
%.tmp8186 = load %m1861$.Type.type*, %m1861$.Type.type** %curr_t.8160
%.tmp8187 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8186, i32 0, i32 4
%.tmp8188 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8187
store %m1861$.Type.type* %.tmp8188, %m1861$.Type.type** %curr_t.8160
%.tmp8189 = load %m307$.Node.type*, %m307$.Node.type** %curr_type.8137
%.tmp8190 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8189, i32 0, i32 7
%.tmp8191 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8190
%.tmp8193 = getelementptr [5 x i8], [5 x i8]*@.str8192, i32 0, i32 0
%.tmp8194 = call %m307$.Node.type*(%m307$.Node.type*,i8*) @m1861$skip_to_type.m307$.Node.typep.m307$.Node.typep.cp(%m307$.Node.type* %.tmp8191, i8* %.tmp8193)
store %m307$.Node.type* %.tmp8194, %m307$.Node.type** %curr_type.8137
br label %.for.start.8161
.for.end.8161:
br label %.if.end.8140
.if.false.8140:
br label %.if.end.8140
.if.end.8140:
br label %.if.end.8124
.if.false.8124:
%.tmp8195 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8196 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8195, i32 0, i32 0
%.tmp8197 = load i8*, i8** %.tmp8196
%.tmp8199 = getelementptr [12 x i8], [12 x i8]*@.str8198, i32 0, i32 0
%.tmp8200 = call i32(i8*,i8*) @strcmp(i8* %.tmp8197, i8* %.tmp8199)
%.tmp8201 = icmp eq i32 %.tmp8200, 0
br i1 %.tmp8201, label %.if.true.8202, label %.if.false.8202
.if.true.8202:
%err_msg.8203 = alloca i8*
store i8* null, i8** %err_msg.8203
%.tmp8204 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8205 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8206 = call %m1861$.ScopeItem.type*(%m1861$.CompilerCtx.type*,%m307$.Node.type*) @m1861$find_defined.m1861$.ScopeItem.typep.m1861$.CompilerCtx.typep.m307$.Node.typep(%m1861$.CompilerCtx.type* %.tmp8204, %m307$.Node.type* %.tmp8205)
%base.8207 = alloca %m1861$.ScopeItem.type*
store %m1861$.ScopeItem.type* %.tmp8206, %m1861$.ScopeItem.type** %base.8207
%.tmp8208 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.8207
%.tmp8209 = icmp eq %m1861$.ScopeItem.type* %.tmp8208, null
br i1 %.tmp8209, label %.if.true.8210, label %.if.false.8210
.if.true.8210:
%.tmp8211 = getelementptr i8*, i8** %err_msg.8203, i32 0
%.tmp8213 = getelementptr [37 x i8], [37 x i8]*@.str8212, i32 0, i32 0
%.tmp8214 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8215 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8214, i32 0, i32 6
%.tmp8216 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8215
%.tmp8217 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8216, i32 0, i32 1
%.tmp8218 = load i8*, i8** %.tmp8217
%.tmp8219 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8211, i8* %.tmp8213, i8* %.tmp8218)
%.tmp8220 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8221 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8222 = load i8*, i8** %err_msg.8203
call void(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$new_error.v.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8220, %m307$.Node.type* %.tmp8221, i8* %.tmp8222)
%.tmp8223 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8224 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8223, i32 0, i32 0
%.tmp8226 = getelementptr [6 x i8], [6 x i8]*@.str8225, i32 0, i32 0
store i8* %.tmp8226, i8** %.tmp8224
%.tmp8227 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
ret %m1861$.Type.type* %.tmp8227
br label %.if.end.8210
.if.false.8210:
br label %.if.end.8210
.if.end.8210:
%.tmp8228 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8229 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8228, i32 0, i32 0
%.tmp8231 = getelementptr [10 x i8], [10 x i8]*@.str8230, i32 0, i32 0
store i8* %.tmp8231, i8** %.tmp8229
%.tmp8232 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8233 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8232, i32 0, i32 1
%.tmp8234 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.8207
%.tmp8235 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp8234, i32 0, i32 0
%.tmp8236 = load i8*, i8** %.tmp8235
store i8* %.tmp8236, i8** %.tmp8233
%.tmp8237 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8238 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8237, i32 0, i32 2
%.tmp8239 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.8207
%.tmp8240 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp8239, i32 0, i32 1
%.tmp8241 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp8240
%.tmp8242 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp8241, i32 0, i32 0
%.tmp8243 = load i8*, i8** %.tmp8242
store i8* %.tmp8243, i8** %.tmp8238
%.tmp8244 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8245 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8244, i32 0, i32 3
%.tmp8246 = load %m1861$.ScopeItem.type*, %m1861$.ScopeItem.type** %base.8207
%.tmp8247 = getelementptr %m1861$.ScopeItem.type, %m1861$.ScopeItem.type* %.tmp8246, i32 0, i32 1
%.tmp8248 = load %m1861$.AssignableInfo.type*, %m1861$.AssignableInfo.type** %.tmp8247
%.tmp8249 = getelementptr %m1861$.AssignableInfo.type, %m1861$.AssignableInfo.type* %.tmp8248, i32 0, i32 4
%.tmp8250 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8249
store %m1861$.Type.type* %.tmp8250, %m1861$.Type.type** %.tmp8245
br label %.if.end.8202
.if.false.8202:
%.tmp8251 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8252 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8251, i32 0, i32 1
%.tmp8253 = load i8*, i8** %.tmp8252
%.tmp8255 = getelementptr [4 x i8], [4 x i8]*@.str8254, i32 0, i32 0
%.tmp8256 = call i32(i8*,i8*) @strcmp(i8* %.tmp8253, i8* %.tmp8255)
%.tmp8257 = icmp eq i32 %.tmp8256, 0
br i1 %.tmp8257, label %.if.true.8258, label %.if.false.8258
.if.true.8258:
%.tmp8259 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8260 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8259, i32 0, i32 0
%.tmp8262 = getelementptr [4 x i8], [4 x i8]*@.str8261, i32 0, i32 0
store i8* %.tmp8262, i8** %.tmp8260
%.tmp8263 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8264 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8263, i32 0, i32 3
%.tmp8265 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
store %m1861$.Type.type* %.tmp8265, %m1861$.Type.type** %.tmp8264
%.tmp8266 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8267 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8266, i32 0, i32 3
%.tmp8268 = load %m1861$.Type.type*, %m1861$.Type.type** %.tmp8267
%.tmp8269 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8268, i32 0, i32 0
%.tmp8271 = getelementptr [4 x i8], [4 x i8]*@.str8270, i32 0, i32 0
store i8* %.tmp8271, i8** %.tmp8269
br label %.if.end.8258
.if.false.8258:
%.tmp8272 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8273 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8272, i32 0, i32 0
%.tmp8274 = load i8*, i8** %.tmp8273
%.tmp8276 = getelementptr [5 x i8], [5 x i8]*@.str8275, i32 0, i32 0
%.tmp8277 = call i32(i8*,i8*) @strcmp(i8* %.tmp8274, i8* %.tmp8276)
%.tmp8278 = icmp eq i32 %.tmp8277, 0
br i1 %.tmp8278, label %.if.true.8279, label %.if.false.8279
.if.true.8279:
%.tmp8280 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8281 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8280, i32 0, i32 0
%.tmp8282 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8283 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8282, i32 0, i32 1
%.tmp8284 = load i8*, i8** %.tmp8283
store i8* %.tmp8284, i8** %.tmp8281
br label %.if.end.8279
.if.false.8279:
%.tmp8285 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8286 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8285, i32 0, i32 1
%.tmp8287 = load i8*, i8** %.tmp8286
%.tmp8289 = getelementptr [4 x i8], [4 x i8]*@.str8288, i32 0, i32 0
%.tmp8290 = call i32(i8*,i8*) @strcmp(i8* %.tmp8287, i8* %.tmp8289)
%.tmp8291 = icmp eq i32 %.tmp8290, 0
br i1 %.tmp8291, label %.if.true.8292, label %.if.false.8292
.if.true.8292:
%.tmp8293 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
%.tmp8294 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8293, i32 0, i32 0
%.tmp8296 = getelementptr [7 x i8], [7 x i8]*@.str8295, i32 0, i32 0
store i8* %.tmp8296, i8** %.tmp8294
br label %.if.end.8292
.if.false.8292:
%.tmp8297 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8298 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8300 = getelementptr [54 x i8], [54 x i8]*@.str8299, i32 0, i32 0
%.tmp8301 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8297, %m307$.Node.type* %.tmp8298, i8* %.tmp8300)
%.tmp8302 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8303 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8302, i32 0, i32 0
%.tmp8304 = load i8*, i8** %.tmp8303
%.tmp8305 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8306 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8305, i32 0, i32 1
%.tmp8307 = load i8*, i8** %.tmp8306
%.tmp8308 = call i32(i8*,...) @printf(i8* %.tmp8301, i8* %.tmp8304, i8* %.tmp8307)
%.tmp8309 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp8309
br label %.if.end.8292
.if.end.8292:
br label %.if.end.8279
.if.end.8279:
br label %.if.end.8258
.if.end.8258:
br label %.if.end.8202
.if.end.8202:
br label %.if.end.8124
.if.end.8124:
%.tmp8311 = load %m307$.Node.type*, %m307$.Node.type** %stmt
%.tmp8312 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8311, i32 0, i32 7
%.tmp8313 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8312
%ptr.8314 = alloca %m307$.Node.type*
store %m307$.Node.type* %.tmp8313, %m307$.Node.type** %ptr.8314
br label %.for.start.8310
.for.start.8310:
%.tmp8315 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8314
%.tmp8316 = icmp ne %m307$.Node.type* %.tmp8315, null
br i1 %.tmp8316, label %.for.continue.8310, label %.for.end.8310
.for.continue.8310:
%.tmp8317 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8314
%.tmp8318 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8317, i32 0, i32 1
%.tmp8319 = load i8*, i8** %.tmp8318
%.tmp8321 = getelementptr [2 x i8], [2 x i8]*@.str8320, i32 0, i32 0
%.tmp8322 = call i32(i8*,i8*) @strcmp(i8* %.tmp8319, i8* %.tmp8321)
%.tmp8323 = icmp eq i32 %.tmp8322, 0
br i1 %.tmp8323, label %.if.true.8324, label %.if.false.8324
.if.true.8324:
%.tmp8325 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%pt.8326 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8325, %m1861$.Type.type** %pt.8326
%.tmp8327 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.8326
%.tmp8328 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8327, i32 0, i32 0
%.tmp8330 = getelementptr [4 x i8], [4 x i8]*@.str8329, i32 0, i32 0
store i8* %.tmp8330, i8** %.tmp8328
%.tmp8331 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.8326
%.tmp8332 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8331, i32 0, i32 3
%.tmp8333 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
store %m1861$.Type.type* %.tmp8333, %m1861$.Type.type** %.tmp8332
%.tmp8334 = load %m1861$.Type.type*, %m1861$.Type.type** %pt.8326
store %m1861$.Type.type* %.tmp8334, %m1861$.Type.type** %t.8116
br label %.if.end.8324
.if.false.8324:
%.tmp8335 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8314
%.tmp8336 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8335, i32 0, i32 1
%.tmp8337 = load i8*, i8** %.tmp8336
%.tmp8339 = getelementptr [2 x i8], [2 x i8]*@.str8338, i32 0, i32 0
%.tmp8340 = call i32(i8*,i8*) @strcmp(i8* %.tmp8337, i8* %.tmp8339)
%.tmp8341 = icmp eq i32 %.tmp8340, 0
br i1 %.tmp8341, label %.if.true.8342, label %.if.false.8342
.if.true.8342:
%.tmp8343 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8314
%.tmp8344 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8343, i32 0, i32 7
%.tmp8345 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8344
%.tmp8346 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8345, i32 0, i32 1
%.tmp8347 = load i8*, i8** %.tmp8346
%.tmp8349 = getelementptr [2 x i8], [2 x i8]*@.str8348, i32 0, i32 0
%.tmp8350 = call i32(i8*,i8*) @strcmp(i8* %.tmp8347, i8* %.tmp8349)
%.tmp8351 = icmp eq i32 %.tmp8350, 0
br i1 %.tmp8351, label %.if.true.8352, label %.if.false.8352
.if.true.8352:
%.tmp8353 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_type.8354 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8353, %m1861$.Type.type** %slice_type.8354
%.tmp8355 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8354
%.tmp8356 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8355, i32 0, i32 0
%.tmp8358 = getelementptr [7 x i8], [7 x i8]*@.str8357, i32 0, i32 0
store i8* %.tmp8358, i8** %.tmp8356
%.tmp8359 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8354
%.tmp8360 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8359, i32 0, i32 1
%.tmp8362 = getelementptr [6 x i8], [6 x i8]*@.str8361, i32 0, i32 0
store i8* %.tmp8362, i8** %.tmp8360
%.tmp8363 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_c_array.8364 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8363, %m1861$.Type.type** %slice_c_array.8364
%.tmp8365 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8364
%.tmp8366 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8365, i32 0, i32 0
%.tmp8368 = getelementptr [4 x i8], [4 x i8]*@.str8367, i32 0, i32 0
store i8* %.tmp8368, i8** %.tmp8366
%.tmp8369 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8364
%.tmp8370 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8369, i32 0, i32 1
%.tmp8372 = getelementptr [6 x i8], [6 x i8]*@.str8371, i32 0, i32 0
store i8* %.tmp8372, i8** %.tmp8370
%.tmp8373 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8364
%.tmp8374 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8373, i32 0, i32 3
%.tmp8375 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
store %m1861$.Type.type* %.tmp8375, %m1861$.Type.type** %.tmp8374
%.tmp8376 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8354
%.tmp8377 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8376, i32 0, i32 3
%.tmp8378 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8364
store %m1861$.Type.type* %.tmp8378, %m1861$.Type.type** %.tmp8377
%.tmp8379 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_len.8380 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8379, %m1861$.Type.type** %slice_len.8380
%.tmp8381 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8380
%.tmp8382 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8381, i32 0, i32 0
%.tmp8384 = getelementptr [4 x i8], [4 x i8]*@.str8383, i32 0, i32 0
store i8* %.tmp8384, i8** %.tmp8382
%.tmp8385 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8380
%.tmp8386 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8385, i32 0, i32 1
%.tmp8388 = getelementptr [4 x i8], [4 x i8]*@.str8387, i32 0, i32 0
store i8* %.tmp8388, i8** %.tmp8386
%.tmp8389 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_c_array.8364
%.tmp8390 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8389, i32 0, i32 4
%.tmp8391 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8380
store %m1861$.Type.type* %.tmp8391, %m1861$.Type.type** %.tmp8390
%.tmp8392 = call %m1861$.Type.type*() @m1861$new_type.m1861$.Type.typep()
%slice_cap.8393 = alloca %m1861$.Type.type*
store %m1861$.Type.type* %.tmp8392, %m1861$.Type.type** %slice_cap.8393
%.tmp8394 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.8393
%.tmp8395 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8394, i32 0, i32 0
%.tmp8397 = getelementptr [4 x i8], [4 x i8]*@.str8396, i32 0, i32 0
store i8* %.tmp8397, i8** %.tmp8395
%.tmp8398 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.8393
%.tmp8399 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8398, i32 0, i32 1
%.tmp8401 = getelementptr [4 x i8], [4 x i8]*@.str8400, i32 0, i32 0
store i8* %.tmp8401, i8** %.tmp8399
%.tmp8402 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_len.8380
%.tmp8403 = getelementptr %m1861$.Type.type, %m1861$.Type.type* %.tmp8402, i32 0, i32 4
%.tmp8404 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_cap.8393
store %m1861$.Type.type* %.tmp8404, %m1861$.Type.type** %.tmp8403
%.tmp8405 = load %m1861$.Type.type*, %m1861$.Type.type** %slice_type.8354
store %m1861$.Type.type* %.tmp8405, %m1861$.Type.type** %t.8116
%.tmp8406 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8314
%.tmp8407 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8406, i32 0, i32 7
%.tmp8408 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8407
store %m307$.Node.type* %.tmp8408, %m307$.Node.type** %ptr.8314
br label %.if.end.8352
.if.false.8352:
br label %.if.end.8352
.if.end.8352:
br label %.if.end.8342
.if.false.8342:
%.tmp8409 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %ctx
%.tmp8410 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8314
%.tmp8412 = getelementptr [49 x i8], [49 x i8]*@.str8411, i32 0, i32 0
%.tmp8413 = call i8*(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$err_tmpl.cp.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8409, %m307$.Node.type* %.tmp8410, i8* %.tmp8412)
%.tmp8414 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8314
%.tmp8415 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8414, i32 0, i32 1
%.tmp8416 = load i8*, i8** %.tmp8415
%.tmp8417 = call i32(i8*,...) @printf(i8* %.tmp8413, i8* %.tmp8416)
%.tmp8418 = bitcast ptr null to %m1861$.Type.type*
ret %m1861$.Type.type* %.tmp8418
br label %.if.end.8342
.if.end.8342:
br label %.if.end.8324
.if.end.8324:
%.tmp8419 = load %m307$.Node.type*, %m307$.Node.type** %ptr.8314
%.tmp8420 = getelementptr %m307$.Node.type, %m307$.Node.type* %.tmp8419, i32 0, i32 7
%.tmp8421 = load %m307$.Node.type*, %m307$.Node.type** %.tmp8420
store %m307$.Node.type* %.tmp8421, %m307$.Node.type** %ptr.8314
br label %.for.start.8310
.for.end.8310:
%.tmp8422 = load %m1861$.Type.type*, %m1861$.Type.type** %t.8116
ret %m1861$.Type.type* %.tmp8422
}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp8423 = load i32, i32* %argc
%.tmp8424 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp8423, i8** %.tmp8424)
%.tmp8425 = load i32, i32* @STDERR
%.tmp8427 = getelementptr [2 x i8], [2 x i8]*@.str8426, i32 0, i32 0
%.tmp8428 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp8425, i8* %.tmp8427)
%stderr.8429 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8428, %m0$.File.type** %stderr.8429
%.tmp8430 = load i8**, i8*** %argv
%.tmp8431 = getelementptr i8*, i8** %.tmp8430, i32 1
%.tmp8432 = load i8*, i8** %.tmp8431
%filename.8433 = alloca i8*
store i8* %.tmp8432, i8** %filename.8433
%.tmp8434 = call %m0$.File.type*() @tmpfile()
%llvm_code.8435 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8434, %m0$.File.type** %llvm_code.8435
%.tmp8436 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8435
%.tmp8437 = load i8*, i8** %filename.8433
%.tmp8438 = call %m1861$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1861$new_context.m1861$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp8436, i8* %.tmp8437)
%compiler_ctx.8439 = alloca %m1861$.CompilerCtx.type*
store %m1861$.CompilerCtx.type* %.tmp8438, %m1861$.CompilerCtx.type** %compiler_ctx.8439
%.tmp8440 = load %m1861$.CompilerCtx.type*, %m1861$.CompilerCtx.type** %compiler_ctx.8439
%.tmp8441 = bitcast ptr null to %m307$.Node.type*
%.tmp8442 = load i8*, i8** %filename.8433
%.tmp8443 = call i1(%m1861$.CompilerCtx.type*,%m307$.Node.type*,i8*) @m1861$compile_file.b.m1861$.CompilerCtx.typep.m307$.Node.typep.cp(%m1861$.CompilerCtx.type* %.tmp8440, %m307$.Node.type* %.tmp8441, i8* %.tmp8442)
br i1 %.tmp8443, label %.if.true.8444, label %.if.false.8444
.if.true.8444:
%.tmp8445 = load %m0$.File.type*, %m0$.File.type** %stderr.8429
%.tmp8447 = getelementptr [34 x i8], [34 x i8]*@.str8446, i32 0, i32 0
%.tmp8448 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8445, i8* %.tmp8447)
ret i32 1
br label %.if.end.8444
.if.false.8444:
br label %.if.end.8444
.if.end.8444:
%.tmp8449 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8435
%.tmp8450 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp8449)
%.tmp8451 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8435
%.tmp8452 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp8451)
%llvm_code_size.8453 = alloca i32
store i32 %.tmp8452, i32* %llvm_code_size.8453
%.tmp8454 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8435
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp8454)
%.tmp8456 = getelementptr [30 x i8], [30 x i8]*@.str8455, i32 0, i32 0
%.tmp8458 = getelementptr [2 x i8], [2 x i8]*@.str8457, i32 0, i32 0
%.tmp8459 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp8456, i8* %.tmp8458)
%proc.8460 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8459, %m0$.File.type** %proc.8460
%.tmp8461 = load %m0$.File.type*, %m0$.File.type** %proc.8460
%.tmp8462 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp8461)
%.tmp8463 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8435
%.tmp8464 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp8463)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp8462, i32 %.tmp8464)
%.tmp8465 = load %m0$.File.type*, %m0$.File.type** %proc.8460
%.tmp8466 = icmp eq %m0$.File.type* %.tmp8465, null
br i1 %.tmp8466, label %.if.true.8467, label %.if.false.8467
.if.true.8467:
%.tmp8468 = load %m0$.File.type*, %m0$.File.type** %stderr.8429
%.tmp8470 = getelementptr [28 x i8], [28 x i8]*@.str8469, i32 0, i32 0
%.tmp8471 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8468, i8* %.tmp8470)
ret i32 0
br label %.if.end.8467
.if.false.8467:
br label %.if.end.8467
.if.end.8467:
%.tmp8472 = load %m0$.File.type*, %m0$.File.type** %proc.8460
%.tmp8473 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp8472)
%.tmp8474 = icmp ne i32 %.tmp8473, 0
br i1 %.tmp8474, label %.if.true.8475, label %.if.false.8475
.if.true.8475:
%.tmp8476 = load %m0$.File.type*, %m0$.File.type** %stderr.8429
%.tmp8478 = getelementptr [24 x i8], [24 x i8]*@.str8477, i32 0, i32 0
%.tmp8479 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8476, i8* %.tmp8478)
ret i32 0
br label %.if.end.8475
.if.false.8475:
br label %.if.end.8475
.if.end.8475:
%.tmp8481 = getelementptr [16 x i8], [16 x i8]*@.str8480, i32 0, i32 0
%.tmp8483 = getelementptr [2 x i8], [2 x i8]*@.str8482, i32 0, i32 0
%.tmp8484 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp8481, i8* %.tmp8483)
%cc_proc.8485 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8484, %m0$.File.type** %cc_proc.8485
%.tmp8486 = load %m0$.File.type*, %m0$.File.type** %cc_proc.8485
%.tmp8487 = icmp eq %m0$.File.type* %.tmp8486, null
br i1 %.tmp8487, label %.if.true.8488, label %.if.false.8488
.if.true.8488:
%.tmp8489 = load %m0$.File.type*, %m0$.File.type** %stderr.8429
%.tmp8491 = getelementptr [28 x i8], [28 x i8]*@.str8490, i32 0, i32 0
%.tmp8492 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8489, i8* %.tmp8491)
ret i32 0
br label %.if.end.8488
.if.false.8488:
br label %.if.end.8488
.if.end.8488:
%.tmp8493 = load %m0$.File.type*, %m0$.File.type** %proc.8460
%.tmp8494 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp8493)
%.tmp8495 = icmp ne i32 %.tmp8494, 0
br i1 %.tmp8495, label %.if.true.8496, label %.if.false.8496
.if.true.8496:
%.tmp8497 = load %m0$.File.type*, %m0$.File.type** %stderr.8429
%.tmp8499 = getelementptr [22 x i8], [22 x i8]*@.str8498, i32 0, i32 0
%.tmp8500 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8497, i8* %.tmp8499)
br label %.if.end.8496
.if.false.8496:
%.tmp8502 = getelementptr [32 x i8], [32 x i8]*@.str8501, i32 0, i32 0
%.tmp8503 = load i8*, i8** %filename.8433
%.tmp8504 = call i32(i8*,...) @printf(i8* %.tmp8502, i8* %.tmp8503)
br label %.if.end.8496
.if.end.8496:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp8505 = load i32, i32* %argc
%.tmp8506 = icmp eq i32 %.tmp8505, 2
br i1 %.tmp8506, label %.if.true.8507, label %.if.false.8507
.if.true.8507:
ret void
br label %.if.end.8507
.if.false.8507:
br label %.if.end.8507
.if.end.8507:
%.tmp8509 = getelementptr [21 x i8], [21 x i8]*@.str8508, i32 0, i32 0
%tmpl.8510 = alloca i8*
store i8* %.tmp8509, i8** %tmpl.8510
%.tmp8511 = load i8**, i8*** %argv
%.tmp8512 = getelementptr i8*, i8** %.tmp8511, i32 0
%.tmp8513 = load i8*, i8** %.tmp8512
%.tmp8514 = call i32(i8*) @strlen(i8* %.tmp8513)
%.tmp8515 = load i8*, i8** %tmpl.8510
%.tmp8516 = call i32(i8*) @strlen(i8* %.tmp8515)
%.tmp8517 = add i32 %.tmp8514, %.tmp8516
%len_filename.8518 = alloca i32
store i32 %.tmp8517, i32* %len_filename.8518
%.tmp8519 = load i32, i32* %len_filename.8518
%.tmp8520 = call i8*(i32) @malloc(i32 %.tmp8519)
%buf.8521 = alloca i8*
store i8* %.tmp8520, i8** %buf.8521
%.tmp8522 = load i8*, i8** %buf.8521
%.tmp8523 = load i8*, i8** %tmpl.8510
%.tmp8524 = load i8**, i8*** %argv
%.tmp8525 = getelementptr i8*, i8** %.tmp8524, i32 0
%.tmp8526 = load i8*, i8** %.tmp8525
%.tmp8527 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp8522, i8* %.tmp8523, i8* %.tmp8526)
%.tmp8528 = load i8*, i8** %buf.8521
%.tmp8529 = call i32(i8*) @puts(i8* %.tmp8528)
%.tmp8530 = load i8*, i8** %buf.8521
call void(i8*) @free(i8* %.tmp8530)
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
@.str3660 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str3720 = constant [5 x i8] c"m%d$\00"
@.str3771 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3780 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3812 = constant [9 x i8] c"variable\00"
@.str3817 = constant [5 x i8] c"type\00"
@.str3849 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3862 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3874 = constant [6 x i8] c"block\00"
@.str3881 = constant [12 x i8] c"expressions\00"
@.str3912 = constant [7 x i8] c"struct\00"
@.str3917 = constant [7 x i8] c"WhAT!\0A\00"
@.str3957 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str3969 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str3995 = constant [7 x i8] c"struct\00"
@.str4000 = constant [7 x i8] c"WhAT!\0A\00"
@.str4031 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4043 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4068 = constant [7 x i8] c"sizeof\00"
@.str4074 = constant [8 x i8] c"fn_args\00"
@.str4081 = constant [11 x i8] c"assignable\00"
@.str4109 = constant [4 x i8] c"int\00"
@.str4122 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4131 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4142 = constant [7 x i8] c"append\00"
@.str4148 = constant [8 x i8] c"fn_args\00"
@.str4155 = constant [11 x i8] c"assignable\00"
@.str4162 = constant [11 x i8] c"assignable\00"
@.str4186 = constant [5 x i8] c".b%d\00"
@.str4220 = constant [8 x i8] c"realloc\00"
@.str4229 = constant [9 x i8] c"function\00"
@.str4242 = constant [4 x i8] c"ptr\00"
@.str4259 = constant [4 x i8] c"chr\00"
@.str4276 = constant [4 x i8] c"ptr\00"
@.str4297 = constant [4 x i8] c"chr\00"
@.str4318 = constant [4 x i8] c"int\00"
@.str4321 = constant [8 x i8] c"realloc\00"
@.str4323 = constant [7 x i8] c"extern\00"
@.str4330 = constant [4 x i8] c"len\00"
@.str4336 = constant [8 x i8] c"fn_args\00"
@.str4343 = constant [11 x i8] c"assignable\00"
@.str4351 = constant [1 x i8] c"\00"
@.str4367 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str4388 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str4394 = constant [1 x i8] c"\00"
@.str4400 = constant [6 x i8] c"%s.bn\00"
@.str4405 = constant [9 x i8] c"%s/%s.bn\00"
@.str4429 = constant [35 x i8] c"unable to compile function address\00"
@.str4435 = constant [8 x i8] c"fn_args\00"
@.str4439 = constant [1 x i8] c"\00"
@.str4448 = constant [4 x i8] c"ptr\00"
@.str4468 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str4492 = constant [11 x i8] c"assignable\00"
@.str4516 = constant [11 x i8] c"assignable\00"
@.str4528 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4546 = constant [5 x i8] c"%s, \00"
@.str4571 = constant [7 x i8] c"vararg\00"
@.str4584 = constant [1 x i8] c"\00"
@.str4588 = constant [52 x i8] c"Type for argument %d does not match: '%s', got '%s'\00"
@.str4605 = constant [8 x i8] c"%s%s %s\00"
@.str4622 = constant [7 x i8] c"vararg\00"
@.str4633 = constant [11 x i8] c"assignable\00"
@.str4642 = constant [7 x i8] c"vararg\00"
@.str4648 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4684 = constant [7 x i8] c"vararg\00"
@.str4695 = constant [42 x i8] c"Function '%s' takes %d arguments, 0 given\00"
@.str4713 = constant [5 x i8] c"void\00"
@.str4721 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4753 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4779 = constant [7 x i8] c"return\00"
@.str4791 = constant [3 x i8] c"NL\00"
@.str4809 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4822 = constant [10 x i8] c"ret void\0A\00"
@.str4826 = constant [3 x i8] c"NL\00"
@.str4832 = constant [8 x i8] c"fn_call\00"
@.str4843 = constant [12 x i8] c"declaration\00"
@.str4852 = constant [11 x i8] c"assignment\00"
@.str4860 = constant [11 x i8] c"assignable\00"
@.str4891 = constant [4 x i8] c"ptr\00"
@.str4900 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4910 = constant [9 x i8] c"if_block\00"
@.str4918 = constant [9 x i8] c"for_loop\00"
@.str4926 = constant [8 x i8] c"keyword\00"
@.str4943 = constant [6 x i8] c"break\00"
@.str4954 = constant [4 x i8] c"for\00"
@.str4962 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4973 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4980 = constant [9 x i8] c"continue\00"
@.str4991 = constant [4 x i8] c"for\00"
@.str4999 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5010 = constant [51 x i8] c"'continue' keyword used outside of 'for' statement\00"
@.str5014 = constant [40 x i8] c"Keyword '%s': behaviour not implemented\00"
@.str5025 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str5044 = constant [14 x i8] c".for.start.%d\00"
@.str5049 = constant [12 x i8] c".for.end.%d\00"
@.str5054 = constant [4 x i8] c"for\00"
@.str5061 = constant [12 x i8] c"declaration\00"
@.str5072 = constant [11 x i8] c"assignment\00"
@.str5082 = constant [9 x i8] c"OPERATOR\00"
@.str5089 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str5100 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str5107 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str5114 = constant [9 x i8] c"OPERATOR\00"
@.str5125 = constant [9 x i8] c"OPERATOR\00"
@.str5132 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str5141 = constant [9 x i8] c"OPERATOR\00"
@.str5146 = constant [6 x i8] c"block\00"
@.str5151 = constant [11 x i8] c"else_block\00"
@.str5161 = constant [13 x i8] c".for.else.%d\00"
@.str5168 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str5183 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str5202 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5212 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str5219 = constant [6 x i8] c"block\00"
@.str5228 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5235 = constant [5 x i8] c"%s:\0A\00"
@.str5249 = constant [5 x i8] c"type\00"
@.str5264 = constant [11 x i8] c"assignable\00"
@.str5279 = constant [9 x i8] c"variable\00"
@.str5284 = constant [5 x i8] c"WORD\00"
@.str5293 = constant [31 x i8] c"unable to get declaration name\00"
@.str5313 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5325 = constant [6 x i8] c"%s.%d\00"
@.str5382 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str5399 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str5411 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5452 = constant [4 x i8] c"int\00"
@.str5459 = constant [4 x i8] c"chr\00"
@.str5467 = constant [5 x i8] c"bool\00"
@.str5476 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str5485 = constant [4 x i8] c"ptr\00"
@.str5493 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5496 = constant [5 x i8] c"null\00"
@.str5504 = constant [7 x i8] c"struct\00"
@.str5525 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5545 = constant [10 x i8] c"typealias\00"
@.str5568 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5587 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str5604 = constant [11 x i8] c"assignable\00"
@.str5621 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str5636 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str5643 = constant [6 x i8] c"block\00"
@.str5652 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5659 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str5666 = constant [11 x i8] c"elif_block\00"
@.str5678 = constant [11 x i8] c"else_block\00"
@.str5688 = constant [6 x i8] c"block\00"
@.str5698 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str5705 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str5726 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str5735 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str5769 = constant [1 x i8] c"\00"
@.str5780 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5800 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5825 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str5846 = constant [7 x i8] c"module\00"
@.str5899 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str5936 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str5944 = constant [9 x i8] c"function\00"
@.str5951 = constant [7 x i8] c"extern\00"
@.str5963 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str5984 = constant [9 x i8] c"variable\00"
@.str6006 = constant [4 x i8] c"ptr\00"
@.str6025 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str6049 = constant [10 x i8] c"typealias\00"
@.str6060 = constant [7 x i8] c"struct\00"
@.str6066 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str6118 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str6139 = constant [9 x i8] c"variable\00"
@.str6150 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6171 = constant [9 x i8] c"variable\00"
@.str6179 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str6193 = constant [17 x i8] c"addr_destination\00"
@.str6200 = constant [16 x i8] c"mono_assignable\00"
@.str6208 = constant [11 x i8] c"assignable\00"
@.str6222 = constant [12 x i8] c"destination\00"
@.str6227 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str6255 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str6274 = constant [7 x i8] c"module\00"
@.str6296 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str6367 = constant [6 x i8] c"slice\00"
@.str6380 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str6422 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str6443 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str6467 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str6490 = constant [16 x i8] c"mono_assignable\00"
@.str6516 = constant [5 x i8] c"cast\00"
@.str6526 = constant [5 x i8] c"type\00"
@.str6551 = constant [8 x i8] c"bitcast\00"
@.str6566 = constant [6 x i8] c"slice\00"
@.str6571 = constant [48 x i8] c"Casting array to slices is not implemented yet\0A\00"
@.str6579 = constant [4 x i8] c"ptr\00"
@.str6586 = constant [4 x i8] c"ptr\00"
@.str6605 = constant [4 x i8] c"i%d\00"
@.str6610 = constant [4 x i8] c"i%d\00"
@.str6618 = constant [5 x i8] c"sext\00"
@.str6620 = constant [6 x i8] c"trunc\00"
@.str6625 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str6645 = constant [16 x i8] c"mono_assignable\00"
@.str6707 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str6730 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str6737 = constant [2 x i8] c"+\00"
@.str6742 = constant [4 x i8] c"add\00"
@.str6747 = constant [2 x i8] c"-\00"
@.str6752 = constant [4 x i8] c"sub\00"
@.str6757 = constant [2 x i8] c"*\00"
@.str6762 = constant [4 x i8] c"mul\00"
@.str6767 = constant [2 x i8] c"/\00"
@.str6772 = constant [5 x i8] c"sdiv\00"
@.str6777 = constant [3 x i8] c"==\00"
@.str6782 = constant [8 x i8] c"icmp eq\00"
@.str6787 = constant [3 x i8] c"!=\00"
@.str6792 = constant [8 x i8] c"icmp ne\00"
@.str6797 = constant [2 x i8] c">\00"
@.str6802 = constant [9 x i8] c"icmp sgt\00"
@.str6807 = constant [2 x i8] c"<\00"
@.str6812 = constant [9 x i8] c"icmp slt\00"
@.str6817 = constant [2 x i8] c"&\00"
@.str6822 = constant [4 x i8] c"and\00"
@.str6827 = constant [2 x i8] c"|\00"
@.str6832 = constant [3 x i8] c"or\00"
@.str6837 = constant [3 x i8] c">=\00"
@.str6842 = constant [9 x i8] c"icmp sge\00"
@.str6847 = constant [3 x i8] c"<=\00"
@.str6852 = constant [9 x i8] c"icmp sle\00"
@.str6857 = constant [2 x i8] c"%\00"
@.str6862 = constant [5 x i8] c"srem\00"
@.str6866 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str6873 = constant [4 x i8] c"add\00"
@.str6880 = constant [3 x i8] c"==\00"
@.str6887 = constant [3 x i8] c"!=\00"
@.str6895 = constant [2 x i8] c"|\00"
@.str6903 = constant [2 x i8] c"&\00"
@.str6911 = constant [2 x i8] c">\00"
@.str6919 = constant [2 x i8] c"<\00"
@.str6927 = constant [3 x i8] c">=\00"
@.str6935 = constant [3 x i8] c"<=\00"
@.str6943 = constant [5 x i8] c"bool\00"
@.str6947 = constant [4 x i8] c"int\00"
@.str6961 = constant [7 x i8] c"NUMBER\00"
@.str6975 = constant [4 x i8] c"int\00"
@.str6989 = constant [5 x i8] c"WORD\00"
@.str6999 = constant [5 x i8] c"null\00"
@.str7006 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str7020 = constant [5 x i8] c"null\00"
@.str7029 = constant [8 x i8] c"nullptr\00"
@.str7036 = constant [17 x i8] c"addr_destination\00"
@.str7048 = constant [12 x i8] c"destination\00"
@.str7092 = constant [4 x i8] c"ptr\00"
@.str7111 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str7123 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str7137 = constant [8 x i8] c"boolean\00"
@.str7151 = constant [5 x i8] c"bool\00"
@.str7160 = constant [6 x i8] c"false\00"
@.str7167 = constant [2 x i8] c"0\00"
@.str7171 = constant [2 x i8] c"1\00"
@.str7178 = constant [8 x i8] c"fn_call\00"
@.str7195 = constant [7 x i8] c"STRING\00"
@.str7221 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str7237 = constant [4 x i8] c"ptr\00"
@.str7250 = constant [4 x i8] c"chr\00"
@.str7257 = constant [4 x i8] c"CHR\00"
@.str7273 = constant [2 x i8] c"0\00"
@.str7289 = constant [22 x i8] c"Invalid character: %s\00"
@.str7305 = constant [4 x i8] c"chr\00"
@.str7309 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str7337 = constant [22 x i8] c"called 'abbr' on null\00"
@.str7343 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str7348 = constant [4 x i8] c"int\00"
@.str7353 = constant [2 x i8] c"i\00"
@.str7358 = constant [5 x i8] c"bool\00"
@.str7363 = constant [2 x i8] c"b\00"
@.str7368 = constant [5 x i8] c"void\00"
@.str7373 = constant [2 x i8] c"v\00"
@.str7378 = constant [4 x i8] c"chr\00"
@.str7383 = constant [2 x i8] c"c\00"
@.str7388 = constant [4 x i8] c"ptr\00"
@.str7395 = constant [4 x i8] c"%sp\00"
@.str7406 = constant [10 x i8] c"typealias\00"
@.str7417 = constant [7 x i8] c"struct\00"
@.str7422 = constant [2 x i8] c"s\00"
@.str7433 = constant [5 x i8] c"%s%s\00"
@.str7446 = constant [9 x i8] c"function\00"
@.str7451 = constant [2 x i8] c"f\00"
@.str7456 = constant [6 x i8] c"error\00"
@.str7461 = constant [2 x i8] c"?\00"
@.str7463 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str7475 = constant [7 x i8] c".str%d\00"
@.str7490 = constant [6 x i8] c"array\00"
@.str7503 = constant [4 x i8] c"chr\00"
@.str7524 = constant [3 x i8] c"%d\00"
@.str7531 = constant [7 x i8] c"string\00"
@.str7567 = constant [7 x i8] c"module\00"
@.str7619 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str7625 = constant [2 x i8] c"?\00"
@.str7631 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str7637 = constant [4 x i8] c"int\00"
@.str7642 = constant [4 x i8] c"i32\00"
@.str7647 = constant [5 x i8] c"void\00"
@.str7652 = constant [5 x i8] c"void\00"
@.str7657 = constant [5 x i8] c"bool\00"
@.str7662 = constant [3 x i8] c"i1\00"
@.str7667 = constant [8 x i8] c"nullptr\00"
@.str7672 = constant [4 x i8] c"ptr\00"
@.str7677 = constant [4 x i8] c"chr\00"
@.str7682 = constant [3 x i8] c"i8\00"
@.str7687 = constant [9 x i8] c"function\00"
@.str7693 = constant [4 x i8] c"%s(\00"
@.str7719 = constant [4 x i8] c"%s,\00"
@.str7724 = constant [5 x i8] c"%s%s\00"
@.str7735 = constant [4 x i8] c"%s)\00"
@.str7743 = constant [4 x i8] c"ptr\00"
@.str7749 = constant [4 x i8] c"%s*\00"
@.str7761 = constant [7 x i8] c"struct\00"
@.str7767 = constant [2 x i8] c"{\00"
@.str7784 = constant [4 x i8] c"%s,\00"
@.str7789 = constant [5 x i8] c"%s%s\00"
@.str7800 = constant [4 x i8] c"%s}\00"
@.str7808 = constant [6 x i8] c"array\00"
@.str7814 = constant [10 x i8] c"[%s x %s]\00"
@.str7833 = constant [10 x i8] c"typealias\00"
@.str7839 = constant [5 x i8] c"%%%s\00"
@.str7849 = constant [7 x i8] c"vararg\00"
@.str7854 = constant [4 x i8] c"...\00"
@.str7859 = constant [6 x i8] c"error\00"
@.str7864 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str7940 = constant [9 x i8] c"function\00"
@.str7958 = constant [5 x i8] c"WORD\00"
@.str8015 = constant [10 x i8] c"fn_params\00"
@.str8029 = constant [11 x i8] c"basic_type\00"
@.str8050 = constant [13 x i8] c"type_trailer\00"
@.str8059 = constant [9 x i8] c"function\00"
@.str8075 = constant [15 x i8] c"type_fn_params\00"
@.str8108 = constant [4 x i8] c"ptr\00"
@.str8120 = constant [10 x i8] c"structdef\00"
@.str8127 = constant [7 x i8] c"struct\00"
@.str8134 = constant [5 x i8] c"type\00"
@.str8165 = constant [5 x i8] c"type\00"
@.str8192 = constant [5 x i8] c"type\00"
@.str8198 = constant [12 x i8] c"dotted_name\00"
@.str8212 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str8225 = constant [6 x i8] c"error\00"
@.str8230 = constant [10 x i8] c"typealias\00"
@.str8254 = constant [4 x i8] c"str\00"
@.str8261 = constant [4 x i8] c"ptr\00"
@.str8270 = constant [4 x i8] c"chr\00"
@.str8275 = constant [5 x i8] c"WORD\00"
@.str8288 = constant [4 x i8] c"...\00"
@.str8295 = constant [7 x i8] c"vararg\00"
@.str8299 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str8320 = constant [2 x i8] c"*\00"
@.str8329 = constant [4 x i8] c"ptr\00"
@.str8338 = constant [2 x i8] c"[\00"
@.str8348 = constant [2 x i8] c"]\00"
@.str8357 = constant [7 x i8] c"struct\00"
@.str8361 = constant [6 x i8] c"slice\00"
@.str8367 = constant [4 x i8] c"ptr\00"
@.str8371 = constant [6 x i8] c"c_arr\00"
@.str8383 = constant [4 x i8] c"int\00"
@.str8387 = constant [4 x i8] c"len\00"
@.str8396 = constant [4 x i8] c"int\00"
@.str8400 = constant [4 x i8] c"cap\00"
@.str8411 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str8426 = constant [2 x i8] c"w\00"
@.str8446 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str8455 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str8457 = constant [2 x i8] c"w\00"
@.str8469 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8477 = constant [24 x i8] c"error on llc execution\0A\00"
@.str8480 = constant [16 x i8] c"cc out.s -o out\00"
@.str8482 = constant [2 x i8] c"w\00"
@.str8490 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8498 = constant [22 x i8] c"error on cc execution\00"
@.str8501 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str8508 = constant [21 x i8] c"Usage: %s <filename>\00"
