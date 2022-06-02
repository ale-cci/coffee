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
%m232$.PeekerInfo.type = type {i32,i32,i32,i32,i8,i1,i8*}
@EOF = constant i32 0
define i8 @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.p.arg) {
%p = alloca %m232$.PeekerInfo.type*
store %m232$.PeekerInfo.type* %.p.arg, %m232$.PeekerInfo.type** %p
%.tmp233 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp234 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp233, i32 0, i32 5
%.tmp235 = load i1, i1* %.tmp234
br i1 %.tmp235, label %.if.true.236, label %.if.false.236
.if.true.236:
ret i8 0
br label %.if.end.236
.if.false.236:
br label %.if.end.236
.if.end.236:
%.tmp237 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp238 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp237, i32 0, i32 4
%.tmp239 = load i8, i8* %.tmp238
%.tmp240 = icmp eq i8 %.tmp239, 10
br i1 %.tmp240, label %.if.true.241, label %.if.false.241
.if.true.241:
%.tmp242 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp243 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp242, i32 0, i32 2
%.tmp244 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp245 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp244, i32 0, i32 2
%.tmp246 = load i32, i32* %.tmp245
%.tmp247 = add i32 %.tmp246, 1
store i32 %.tmp247, i32* %.tmp243
%.tmp248 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp249 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp248, i32 0, i32 3
store i32 0, i32* %.tmp249
br label %.if.end.241
.if.false.241:
br label %.if.end.241
.if.end.241:
%.tmp250 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp251 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp250, i32 0, i32 1
%.tmp252 = load i32, i32* %.tmp251
%.tmp253 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp254 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp253, i32 0, i32 4
%.tmp255 = getelementptr i8, i8* %.tmp254, i32 0
%.tmp256 = call i32(i32,i8*,i32) @read(i32 %.tmp252, i8* %.tmp255, i32 1)
%.tmp257 = icmp eq i32 %.tmp256, 0
br i1 %.tmp257, label %.if.true.258, label %.if.false.258
.if.true.258:
%.tmp259 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp260 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp259, i32 0, i32 4
store i8 0, i8* %.tmp260
%.tmp261 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp262 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp261, i32 0, i32 5
store i1 1, i1* %.tmp262
%.tmp263 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp264 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp263, i32 0, i32 4
%.tmp265 = load i8, i8* %.tmp264
ret i8 %.tmp265
br label %.if.end.258
.if.false.258:
br label %.if.end.258
.if.end.258:
%.tmp266 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp267 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp266, i32 0, i32 3
%.tmp268 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp269 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp268, i32 0, i32 3
%.tmp270 = load i32, i32* %.tmp269
%.tmp271 = add i32 %.tmp270, 1
store i32 %.tmp271, i32* %.tmp267
%.tmp272 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp273 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp272, i32 0, i32 0
%.tmp274 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp275 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp274, i32 0, i32 0
%.tmp276 = load i32, i32* %.tmp275
%.tmp277 = add i32 %.tmp276, 1
store i32 %.tmp277, i32* %.tmp273
%.tmp278 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp279 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp278, i32 0, i32 4
%.tmp280 = load i8, i8* %.tmp279
ret i8 %.tmp280
}
define void @m232$seek.v.m232$.PeekerInfo.typep.i(%m232$.PeekerInfo.type* %.p.arg, i32 %.pos.arg) {
%p = alloca %m232$.PeekerInfo.type*
store %m232$.PeekerInfo.type* %.p.arg, %m232$.PeekerInfo.type** %p
%pos = alloca i32
store i32 %.pos.arg, i32* %pos
%.tmp281 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp282 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp281, i32 0, i32 1
%.tmp283 = load i32, i32* %.tmp282
%.tmp284 = load i32, i32* %pos
%.tmp285 = load i32, i32* @SEEK_SET
%.tmp286 = call i32(i32,i32,i32) @lseek(i32 %.tmp283, i32 %.tmp284, i32 %.tmp285)
ret void
}
define %m232$.PeekerInfo.type* @m232$new.m232$.PeekerInfo.typep.i(i32 %.fd.arg) {
%fd = alloca i32
store i32 %.fd.arg, i32* %fd
%.tmp287 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* null, i32 1
%.tmp288 = ptrtoint %m232$.PeekerInfo.type* %.tmp287 to i32
%.tmp289 = call i8*(i32) @malloc(i32 %.tmp288)
%.tmp290 = bitcast i8* %.tmp289 to %m232$.PeekerInfo.type*
%p.291 = alloca %m232$.PeekerInfo.type*
store %m232$.PeekerInfo.type* %.tmp290, %m232$.PeekerInfo.type** %p.291
%.tmp292 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p.291
%.tmp293 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp292, i32 0, i32 0
store i32 0, i32* %.tmp293
%.tmp294 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p.291
%.tmp295 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp294, i32 0, i32 2
store i32 1, i32* %.tmp295
%.tmp296 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p.291
%.tmp297 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp296, i32 0, i32 3
store i32 0, i32* %.tmp297
%.tmp298 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p.291
%.tmp299 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp298, i32 0, i32 1
%.tmp300 = load i32, i32* %fd
store i32 %.tmp300, i32* %.tmp299
%.tmp301 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p.291
%.tmp302 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp301, i32 0, i32 4
store i8 0, i8* %.tmp302
%.tmp303 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p.291
%.tmp304 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp303, i32 0, i32 5
store i1 0, i1* %.tmp304
%.tmp305 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p.291
%.tmp306 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp305, i32 0, i32 6
%.tmp308 = getelementptr [1 x i8], [1 x i8]*@.str307, i32 0, i32 0
store i8* %.tmp308, i8** %.tmp306
%.tmp309 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p.291
ret %m232$.PeekerInfo.type* %.tmp309
}
%m231$.Token.type = type {i8*,i8*,i32,i32,i8*,%m231$.Token.type*,%m231$.Token.type*}
%m231$.ParseCtx.type = type {i8*,i32,i32,%m231$.Token.type*,%m231$.Token.type*}
define %m231$.Token.type* @m231$push_token.m231$.Token.typep.m231$.ParseCtx.typep.cp.cp(%m231$.ParseCtx.type* %.c.arg, i8* %.type.arg, i8* %.value.arg) {
%c = alloca %m231$.ParseCtx.type*
store %m231$.ParseCtx.type* %.c.arg, %m231$.ParseCtx.type** %c
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp310 = getelementptr %m231$.Token.type, %m231$.Token.type* null, i32 1
%.tmp311 = ptrtoint %m231$.Token.type* %.tmp310 to i32
%.tmp312 = call i8*(i32) @malloc(i32 %.tmp311)
%.tmp313 = bitcast i8* %.tmp312 to %m231$.Token.type*
%root.314 = alloca %m231$.Token.type*
store %m231$.Token.type* %.tmp313, %m231$.Token.type** %root.314
%.tmp315 = load %m231$.Token.type*, %m231$.Token.type** %root.314
%.tmp316 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp315, i32 0, i32 0
%.tmp317 = load i8*, i8** %type
store i8* %.tmp317, i8** %.tmp316
%.tmp318 = load %m231$.Token.type*, %m231$.Token.type** %root.314
%.tmp319 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp318, i32 0, i32 1
%.tmp320 = load i8*, i8** %value
store i8* %.tmp320, i8** %.tmp319
%.tmp321 = load %m231$.Token.type*, %m231$.Token.type** %root.314
%.tmp322 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp321, i32 0, i32 4
%.tmp323 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %c
%.tmp324 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp323, i32 0, i32 0
%.tmp325 = load i8*, i8** %.tmp324
store i8* %.tmp325, i8** %.tmp322
%.tmp326 = load %m231$.Token.type*, %m231$.Token.type** %root.314
%.tmp327 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp326, i32 0, i32 2
%.tmp328 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %c
%.tmp329 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp328, i32 0, i32 1
%.tmp330 = load i32, i32* %.tmp329
store i32 %.tmp330, i32* %.tmp327
%.tmp331 = load %m231$.Token.type*, %m231$.Token.type** %root.314
%.tmp332 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp331, i32 0, i32 3
%.tmp333 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %c
%.tmp334 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp333, i32 0, i32 2
%.tmp335 = load i32, i32* %.tmp334
store i32 %.tmp335, i32* %.tmp332
%.tmp336 = load %m231$.Token.type*, %m231$.Token.type** %root.314
%.tmp337 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp336, i32 0, i32 6
%.tmp338 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %c
%.tmp339 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp338, i32 0, i32 4
%.tmp340 = load %m231$.Token.type*, %m231$.Token.type** %.tmp339
store %m231$.Token.type* %.tmp340, %m231$.Token.type** %.tmp337
%.tmp341 = load %m231$.Token.type*, %m231$.Token.type** %root.314
%.tmp342 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp341, i32 0, i32 5
store %m231$.Token.type* null, %m231$.Token.type** %.tmp342
%.tmp343 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %c
%.tmp344 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp343, i32 0, i32 4
%.tmp345 = load %m231$.Token.type*, %m231$.Token.type** %.tmp344
%.tmp346 = icmp ne %m231$.Token.type* %.tmp345, null
br i1 %.tmp346, label %.if.true.347, label %.if.false.347
.if.true.347:
%.tmp348 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %c
%.tmp349 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp348, i32 0, i32 4
%.tmp350 = load %m231$.Token.type*, %m231$.Token.type** %.tmp349
%.tmp351 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp350, i32 0, i32 5
%.tmp352 = load %m231$.Token.type*, %m231$.Token.type** %root.314
store %m231$.Token.type* %.tmp352, %m231$.Token.type** %.tmp351
br label %.if.end.347
.if.false.347:
br label %.if.end.347
.if.end.347:
%.tmp353 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %c
%.tmp354 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp353, i32 0, i32 4
%.tmp355 = load %m231$.Token.type*, %m231$.Token.type** %root.314
store %m231$.Token.type* %.tmp355, %m231$.Token.type** %.tmp354
%.tmp356 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %c
%.tmp357 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp356, i32 0, i32 3
%.tmp358 = load %m231$.Token.type*, %m231$.Token.type** %.tmp357
%.tmp359 = icmp eq %m231$.Token.type* %.tmp358, null
br i1 %.tmp359, label %.if.true.360, label %.if.false.360
.if.true.360:
%.tmp361 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %c
%.tmp362 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp361, i32 0, i32 3
%.tmp363 = load %m231$.Token.type*, %m231$.Token.type** %root.314
store %m231$.Token.type* %.tmp363, %m231$.Token.type** %.tmp362
br label %.if.end.360
.if.false.360:
br label %.if.end.360
.if.end.360:
%.tmp364 = load %m231$.Token.type*, %m231$.Token.type** %root.314
ret %m231$.Token.type* %.tmp364
}
define %m231$.Token.type* @m231$tokenize.m231$.Token.typep.m232$.PeekerInfo.typep.b(%m232$.PeekerInfo.type* %.p.arg, i1 %.keep_comments.arg) {
%p = alloca %m232$.PeekerInfo.type*
store %m232$.PeekerInfo.type* %.p.arg, %m232$.PeekerInfo.type** %p
%keep_comments = alloca i1
store i1 %.keep_comments.arg, i1* %keep_comments
%.tmp365 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* null, i32 1
%.tmp366 = ptrtoint %m231$.ParseCtx.type* %.tmp365 to i32
%.tmp367 = call i8*(i32) @malloc(i32 %.tmp366)
%.tmp368 = bitcast i8* %.tmp367 to %m231$.ParseCtx.type*
%ctx.369 = alloca %m231$.ParseCtx.type*
store %m231$.ParseCtx.type* %.tmp368, %m231$.ParseCtx.type** %ctx.369
%.tmp370 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp371 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp370, i32 0, i32 0
%.tmp372 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp373 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp372, i32 0, i32 6
%.tmp374 = load i8*, i8** %.tmp373
store i8* %.tmp374, i8** %.tmp371
%.tmp375 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp376 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp375, i32 0, i32 3
store %m231$.Token.type* null, %m231$.Token.type** %.tmp376
%.tmp377 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp378 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp377, i32 0, i32 4
store %m231$.Token.type* null, %m231$.Token.type** %.tmp378
%max_token_size.379 = alloca i32
store i32 128, i32* %max_token_size.379
%.tmp380 = bitcast ptr null to i8*
%buf.381 = alloca i8*
store i8* %.tmp380, i8** %buf.381
%idx.382 = alloca i32
store i32 0, i32* %idx.382
%.tmp383 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp384 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp383)
%c.385 = alloca i8
store i8 %.tmp384, i8* %c.385
br label %.for.start.386
.for.start.386:
%.tmp387 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp388 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp387, i32 0, i32 5
%.tmp389 = load i1, i1* %.tmp388
%.tmp390 = icmp eq i1 %.tmp389, 0
br i1 %.tmp390, label %.for.continue.386, label %.for.end.386
.for.continue.386:
%.tmp391 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp392 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp391, i32 0, i32 1
%.tmp393 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp394 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp393, i32 0, i32 2
%.tmp395 = load i32, i32* %.tmp394
store i32 %.tmp395, i32* %.tmp392
%.tmp396 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp397 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp396, i32 0, i32 2
%.tmp398 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp399 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp398, i32 0, i32 3
%.tmp400 = load i32, i32* %.tmp399
store i32 %.tmp400, i32* %.tmp397
%.tmp401 = load i8, i8* %c.385
%.tmp402 = icmp eq i8 %.tmp401, 0
br i1 %.tmp402, label %.if.true.403, label %.if.false.403
.if.true.403:
%.tmp404 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp405 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp404)
store i8 %.tmp405, i8* %c.385
br label %.if.end.403
.if.false.403:
%.tmp406 = load i8, i8* %c.385
%.tmp407 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp406)
br i1 %.tmp407, label %.if.true.408, label %.if.false.408
.if.true.408:
%.tmp409 = load i32, i32* %max_token_size.379
%.tmp410 = call i8*(i32) @malloc(i32 %.tmp409)
store i8* %.tmp410, i8** %buf.381
store i32 0, i32* %idx.382
br label %.for.start.411
.for.start.411:
%.tmp412 = load i8, i8* %c.385
%.tmp413 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp412)
br i1 %.tmp413, label %.for.continue.411, label %.for.end.411
.for.continue.411:
%.tmp414 = load i32, i32* %idx.382
%.tmp415 = load i8*, i8** %buf.381
%.tmp416 = getelementptr i8, i8* %.tmp415, i32 %.tmp414
%.tmp417 = load i8, i8* %c.385
store i8 %.tmp417, i8* %.tmp416
%.tmp418 = load i32, i32* %idx.382
%.tmp419 = add i32 %.tmp418, 1
store i32 %.tmp419, i32* %idx.382
%.tmp420 = load i32, i32* %idx.382
%.tmp421 = load i32, i32* %max_token_size.379
%.tmp422 = icmp slt i32 %.tmp420, %.tmp421
%.tmp424 = getelementptr [16 x i8], [16 x i8]*@.str423, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp422, i8* %.tmp424)
%.tmp425 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp426 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp425)
store i8 %.tmp426, i8* %c.385
br label %.for.start.411
.for.end.411:
%.tmp427 = load i32, i32* %idx.382
%.tmp428 = load i8*, i8** %buf.381
%.tmp429 = getelementptr i8, i8* %.tmp428, i32 %.tmp427
store i8 0, i8* %.tmp429
%.tmp430 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp432 = getelementptr [7 x i8], [7 x i8]*@.str431, i32 0, i32 0
%.tmp433 = load i8*, i8** %buf.381
%.tmp434 = call %m231$.Token.type*(%m231$.ParseCtx.type*,i8*,i8*) @m231$push_token.m231$.Token.typep.m231$.ParseCtx.typep.cp.cp(%m231$.ParseCtx.type* %.tmp430, i8* %.tmp432, i8* %.tmp433)
br label %.if.end.408
.if.false.408:
%.tmp435 = load i8, i8* %c.385
%.tmp436 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp435)
%.tmp437 = load i8, i8* %c.385
%.tmp438 = icmp eq i8 %.tmp437, 95
%.tmp439 = or i1 %.tmp436, %.tmp438
br i1 %.tmp439, label %.if.true.440, label %.if.false.440
.if.true.440:
%.tmp441 = load i32, i32* %max_token_size.379
%.tmp442 = call i8*(i32) @malloc(i32 %.tmp441)
store i8* %.tmp442, i8** %buf.381
store i32 0, i32* %idx.382
br label %.for.start.443
.for.start.443:
%.tmp444 = load i8, i8* %c.385
%.tmp445 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp444)
%.tmp446 = load i8, i8* %c.385
%.tmp447 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp446)
%.tmp448 = or i1 %.tmp445, %.tmp447
%.tmp449 = load i8, i8* %c.385
%.tmp450 = icmp eq i8 %.tmp449, 95
%.tmp451 = or i1 %.tmp448, %.tmp450
br i1 %.tmp451, label %.for.continue.443, label %.for.end.443
.for.continue.443:
%.tmp452 = load i32, i32* %idx.382
%.tmp453 = load i8*, i8** %buf.381
%.tmp454 = getelementptr i8, i8* %.tmp453, i32 %.tmp452
%.tmp455 = load i8, i8* %c.385
store i8 %.tmp455, i8* %.tmp454
%.tmp456 = load i32, i32* %idx.382
%.tmp457 = add i32 %.tmp456, 1
store i32 %.tmp457, i32* %idx.382
%.tmp458 = load i32, i32* %idx.382
%.tmp459 = load i32, i32* %max_token_size.379
%.tmp460 = icmp slt i32 %.tmp458, %.tmp459
%.tmp462 = getelementptr [15 x i8], [15 x i8]*@.str461, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp460, i8* %.tmp462)
%.tmp463 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp464 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp463)
store i8 %.tmp464, i8* %c.385
br label %.for.start.443
.for.end.443:
%.tmp465 = load i32, i32* %idx.382
%.tmp466 = load i8*, i8** %buf.381
%.tmp467 = getelementptr i8, i8* %.tmp466, i32 %.tmp465
store i8 0, i8* %.tmp467
%.tmp468 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp470 = getelementptr [5 x i8], [5 x i8]*@.str469, i32 0, i32 0
%.tmp471 = load i8*, i8** %buf.381
%.tmp472 = call %m231$.Token.type*(%m231$.ParseCtx.type*,i8*,i8*) @m231$push_token.m231$.Token.typep.m231$.ParseCtx.typep.cp.cp(%m231$.ParseCtx.type* %.tmp468, i8* %.tmp470, i8* %.tmp471)
br label %.if.end.440
.if.false.440:
%.tmp473 = load i8, i8* %c.385
%.tmp474 = call i1(i8) @m3$is_whitespace.b.c(i8 %.tmp473)
br i1 %.tmp474, label %.if.true.475, label %.if.false.475
.if.true.475:
%.tmp476 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp477 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp476)
store i8 %.tmp477, i8* %c.385
br label %.if.end.475
.if.false.475:
%.tmp478 = load i8, i8* %c.385
%.tmp479 = icmp eq i8 %.tmp478, 34
%.tmp480 = load i8, i8* %c.385
%.tmp481 = icmp eq i8 %.tmp480, 96
%.tmp482 = or i1 %.tmp479, %.tmp481
br i1 %.tmp482, label %.if.true.483, label %.if.false.483
.if.true.483:
%.tmp484 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp485 = load i8, i8* %c.385
%.tmp486 = call i8*(%m232$.PeekerInfo.type*,i8) @m231$read_string.cp.m232$.PeekerInfo.typep.c(%m232$.PeekerInfo.type* %.tmp484, i8 %.tmp485)
store i8* %.tmp486, i8** %buf.381
%.tmp487 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp488 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp487)
store i8 %.tmp488, i8* %c.385
%.tmp489 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp491 = getelementptr [7 x i8], [7 x i8]*@.str490, i32 0, i32 0
%.tmp492 = load i8*, i8** %buf.381
%.tmp493 = call %m231$.Token.type*(%m231$.ParseCtx.type*,i8*,i8*) @m231$push_token.m231$.Token.typep.m231$.ParseCtx.typep.cp.cp(%m231$.ParseCtx.type* %.tmp489, i8* %.tmp491, i8* %.tmp492)
br label %.if.end.483
.if.false.483:
%.tmp494 = load i8, i8* %c.385
%.tmp495 = icmp eq i8 %.tmp494, 39
br i1 %.tmp495, label %.if.true.496, label %.if.false.496
.if.true.496:
%.tmp497 = load i32, i32* %max_token_size.379
%.tmp498 = call i8*(i32) @malloc(i32 %.tmp497)
store i8* %.tmp498, i8** %buf.381
%.tmp499 = load i8*, i8** %buf.381
%.tmp500 = getelementptr i8, i8* %.tmp499, i32 0
%.tmp501 = load i8, i8* %c.385
store i8 %.tmp501, i8* %.tmp500
%.tmp502 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp503 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp502)
store i8 %.tmp503, i8* %c.385
store i32 1, i32* %idx.382
br label %.for.start.504
.for.start.504:
%.tmp505 = load i8, i8* %c.385
%.tmp506 = icmp ne i8 %.tmp505, 39
br i1 %.tmp506, label %.for.continue.504, label %.for.end.504
.for.continue.504:
%.tmp507 = load i32, i32* %idx.382
%.tmp508 = load i32, i32* %max_token_size.379
%.tmp509 = sub i32 %.tmp508, 2
%.tmp510 = icmp slt i32 %.tmp507, %.tmp509
%.tmp512 = getelementptr [15 x i8], [15 x i8]*@.str511, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp510, i8* %.tmp512)
%.tmp513 = load i32, i32* %idx.382
%.tmp514 = load i8*, i8** %buf.381
%.tmp515 = getelementptr i8, i8* %.tmp514, i32 %.tmp513
%.tmp516 = load i8, i8* %c.385
store i8 %.tmp516, i8* %.tmp515
%.tmp517 = load i32, i32* %idx.382
%.tmp518 = add i32 %.tmp517, 1
store i32 %.tmp518, i32* %idx.382
%.tmp519 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp520 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp519)
store i8 %.tmp520, i8* %c.385
br label %.for.start.504
.for.end.504:
%.tmp521 = load i32, i32* %idx.382
%.tmp522 = load i8*, i8** %buf.381
%.tmp523 = getelementptr i8, i8* %.tmp522, i32 %.tmp521
%.tmp524 = load i8, i8* %c.385
store i8 %.tmp524, i8* %.tmp523
%.tmp525 = load i32, i32* %idx.382
%.tmp526 = add i32 %.tmp525, 1
%.tmp527 = load i8*, i8** %buf.381
%.tmp528 = getelementptr i8, i8* %.tmp527, i32 %.tmp526
store i8 0, i8* %.tmp528
%.tmp529 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp530 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp529)
store i8 %.tmp530, i8* %c.385
%.tmp531 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp533 = getelementptr [4 x i8], [4 x i8]*@.str532, i32 0, i32 0
%.tmp534 = load i8*, i8** %buf.381
%.tmp535 = call %m231$.Token.type*(%m231$.ParseCtx.type*,i8*,i8*) @m231$push_token.m231$.Token.typep.m231$.ParseCtx.typep.cp.cp(%m231$.ParseCtx.type* %.tmp531, i8* %.tmp533, i8* %.tmp534)
br label %.if.end.496
.if.false.496:
%.tmp536 = load i8, i8* %c.385
%.tmp537 = icmp eq i8 %.tmp536, 10
br i1 %.tmp537, label %.if.true.538, label %.if.false.538
.if.true.538:
%.tmp539 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp541 = getelementptr [3 x i8], [3 x i8]*@.str540, i32 0, i32 0
%.tmp543 = getelementptr [2 x i8], [2 x i8]*@.str542, i32 0, i32 0
%.tmp544 = call %m231$.Token.type*(%m231$.ParseCtx.type*,i8*,i8*) @m231$push_token.m231$.Token.typep.m231$.ParseCtx.typep.cp.cp(%m231$.ParseCtx.type* %.tmp539, i8* %.tmp541, i8* %.tmp543)
%.tmp545 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp546 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp545)
store i8 %.tmp546, i8* %c.385
br label %.if.end.538
.if.false.538:
%.tmp547 = load i8, i8* %c.385
%.tmp548 = icmp eq i8 %.tmp547, 45
br i1 %.tmp548, label %.if.true.549, label %.if.false.549
.if.true.549:
%.tmp550 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp551 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp550)
store i8 %.tmp551, i8* %c.385
%.tmp552 = load i8, i8* %c.385
%.tmp553 = icmp ne i8 %.tmp552, 45
br i1 %.tmp553, label %.if.true.554, label %.if.false.554
.if.true.554:
%.tmp555 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp557 = getelementptr [9 x i8], [9 x i8]*@.str556, i32 0, i32 0
%.tmp559 = getelementptr [2 x i8], [2 x i8]*@.str558, i32 0, i32 0
%.tmp560 = call %m231$.Token.type*(%m231$.ParseCtx.type*,i8*,i8*) @m231$push_token.m231$.Token.typep.m231$.ParseCtx.typep.cp.cp(%m231$.ParseCtx.type* %.tmp555, i8* %.tmp557, i8* %.tmp559)
br label %.for.start.386
br label %.if.end.554
.if.false.554:
br label %.if.end.554
.if.end.554:
%.tmp561 = load i32, i32* %max_token_size.379
%.tmp562 = call i8*(i32) @malloc(i32 %.tmp561)
store i8* %.tmp562, i8** %buf.381
%.tmp563 = load i8*, i8** %buf.381
%.tmp564 = getelementptr i8, i8* %.tmp563, i32 0
store i8 45, i8* %.tmp564
store i32 1, i32* %idx.382
br label %.for.start.565
.for.start.565:
%.tmp566 = load i8, i8* %c.385
%.tmp567 = icmp ne i8 %.tmp566, 10
%.tmp568 = load i8, i8* %c.385
%.tmp569 = icmp ne i8 %.tmp568, 0
%.tmp570 = and i1 %.tmp567, %.tmp569
br i1 %.tmp570, label %.for.continue.565, label %.for.end.565
.for.continue.565:
%.tmp571 = load i32, i32* %idx.382
%.tmp572 = load i8*, i8** %buf.381
%.tmp573 = getelementptr i8, i8* %.tmp572, i32 %.tmp571
%.tmp574 = load i8, i8* %c.385
store i8 %.tmp574, i8* %.tmp573
%.tmp575 = load i32, i32* %idx.382
%.tmp576 = add i32 %.tmp575, 1
store i32 %.tmp576, i32* %idx.382
%.tmp577 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp578 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp577)
store i8 %.tmp578, i8* %c.385
br label %.for.start.565
.for.end.565:
%.tmp579 = load i32, i32* %idx.382
%.tmp580 = load i8*, i8** %buf.381
%.tmp581 = getelementptr i8, i8* %.tmp580, i32 %.tmp579
store i8 0, i8* %.tmp581
%.tmp582 = load i1, i1* %keep_comments
br i1 %.tmp582, label %.if.true.583, label %.if.false.583
.if.true.583:
%.tmp584 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp586 = getelementptr [8 x i8], [8 x i8]*@.str585, i32 0, i32 0
%.tmp587 = load i8*, i8** %buf.381
%.tmp588 = call %m231$.Token.type*(%m231$.ParseCtx.type*,i8*,i8*) @m231$push_token.m231$.Token.typep.m231$.ParseCtx.typep.cp.cp(%m231$.ParseCtx.type* %.tmp584, i8* %.tmp586, i8* %.tmp587)
br label %.if.end.583
.if.false.583:
%.tmp589 = load i8*, i8** %buf.381
%.tmp590 = bitcast i8* %.tmp589 to i8*
call void(i8*) @free(i8* %.tmp590)
br label %.if.end.583
.if.end.583:
br label %.if.end.549
.if.false.549:
%.tmp591 = load i8, i8* %c.385
%.tmp592 = icmp sgt i8 %.tmp591, 126
br i1 %.tmp592, label %.if.true.593, label %.if.false.593
.if.true.593:
%.tmp595 = getelementptr [47 x i8], [47 x i8]*@.str594, i32 0, i32 0
%.tmp596 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp597 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp596, i32 0, i32 1
%.tmp598 = load i32, i32* %.tmp597
%.tmp599 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp600 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp599, i32 0, i32 2
%.tmp601 = load i32, i32* %.tmp600
%.tmp602 = load i8, i8* %c.385
%.tmp603 = load i8, i8* %c.385
%.tmp604 = call i32(i8*,...) @printf(i8* %.tmp595, i32 %.tmp598, i32 %.tmp601, i8 %.tmp602, i8 %.tmp603)
call void(i32) @exit(i32 1)
br label %.if.end.593
.if.false.593:
br label %.if.end.593
.if.end.593:
%.tmp605 = load i8, i8* %c.385
%prev_c.606 = alloca i8
store i8 %.tmp605, i8* %prev_c.606
%.tmp607 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp608 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp607)
store i8 %.tmp608, i8* %c.385
%.tmp610 = getelementptr [9 x i8], [9 x i8]*@.str609, i32 0, i32 0
%type.611 = alloca i8*
store i8* %.tmp610, i8** %type.611
%.tmp612 = load i8, i8* %prev_c.606
%.tmp613 = icmp eq i8 %.tmp612, 61
%.tmp614 = load i8, i8* %c.385
%.tmp615 = icmp eq i8 %.tmp614, 61
%.tmp616 = and i1 %.tmp613, %.tmp615
br i1 %.tmp616, label %.if.true.617, label %.if.false.617
.if.true.617:
%.tmp618 = getelementptr i8*, i8** %buf.381, i32 0
%.tmp620 = getelementptr [3 x i8], [3 x i8]*@.str619, i32 0, i32 0
%.tmp621 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp618, i8* %.tmp620)
%.tmp622 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp623 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp622)
store i8 %.tmp623, i8* %c.385
br label %.if.end.617
.if.false.617:
%.tmp624 = load i8, i8* %prev_c.606
%.tmp625 = icmp eq i8 %.tmp624, 33
%.tmp626 = load i8, i8* %c.385
%.tmp627 = icmp eq i8 %.tmp626, 61
%.tmp628 = and i1 %.tmp625, %.tmp627
br i1 %.tmp628, label %.if.true.629, label %.if.false.629
.if.true.629:
%.tmp630 = getelementptr i8*, i8** %buf.381, i32 0
%.tmp632 = getelementptr [3 x i8], [3 x i8]*@.str631, i32 0, i32 0
%.tmp633 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp630, i8* %.tmp632)
%.tmp634 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp635 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp634)
store i8 %.tmp635, i8* %c.385
br label %.if.end.629
.if.false.629:
%.tmp636 = load i8, i8* %prev_c.606
%.tmp637 = icmp eq i8 %.tmp636, 62
%.tmp638 = load i8, i8* %c.385
%.tmp639 = icmp eq i8 %.tmp638, 61
%.tmp640 = and i1 %.tmp637, %.tmp639
br i1 %.tmp640, label %.if.true.641, label %.if.false.641
.if.true.641:
%.tmp642 = getelementptr i8*, i8** %buf.381, i32 0
%.tmp644 = getelementptr [3 x i8], [3 x i8]*@.str643, i32 0, i32 0
%.tmp645 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp642, i8* %.tmp644)
%.tmp646 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp647 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp646)
store i8 %.tmp647, i8* %c.385
br label %.if.end.641
.if.false.641:
%.tmp648 = load i8, i8* %prev_c.606
%.tmp649 = icmp eq i8 %.tmp648, 60
%.tmp650 = load i8, i8* %c.385
%.tmp651 = icmp eq i8 %.tmp650, 61
%.tmp652 = and i1 %.tmp649, %.tmp651
br i1 %.tmp652, label %.if.true.653, label %.if.false.653
.if.true.653:
%.tmp654 = getelementptr i8*, i8** %buf.381, i32 0
%.tmp656 = getelementptr [3 x i8], [3 x i8]*@.str655, i32 0, i32 0
%.tmp657 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp654, i8* %.tmp656)
%.tmp658 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp659 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp658)
store i8 %.tmp659, i8* %c.385
br label %.if.end.653
.if.false.653:
%.tmp660 = load i8, i8* %prev_c.606
%.tmp661 = icmp eq i8 %.tmp660, 46
%.tmp662 = load i8, i8* %c.385
%.tmp663 = icmp eq i8 %.tmp662, 46
%.tmp664 = and i1 %.tmp661, %.tmp663
br i1 %.tmp664, label %.if.true.665, label %.if.false.665
.if.true.665:
%.tmp666 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp667 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp666)
store i8 %.tmp667, i8* %c.385
%.tmp668 = load i8, i8* %c.385
%.tmp669 = icmp ne i8 %.tmp668, 46
br i1 %.tmp669, label %.if.true.670, label %.if.false.670
.if.true.670:
%.tmp672 = getelementptr [13 x i8], [13 x i8]*@.str671, i32 0, i32 0
%.tmp673 = call i32(i8*,...) @printf(i8* %.tmp672)
call void(i32) @exit(i32 1)
br label %.if.end.670
.if.false.670:
%.tmp674 = getelementptr i8*, i8** %buf.381, i32 0
%.tmp676 = getelementptr [4 x i8], [4 x i8]*@.str675, i32 0, i32 0
%.tmp677 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp674, i8* %.tmp676)
%.tmp679 = getelementptr [8 x i8], [8 x i8]*@.str678, i32 0, i32 0
store i8* %.tmp679, i8** %type.611
br label %.if.end.670
.if.end.670:
%.tmp680 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp681 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp680)
store i8 %.tmp681, i8* %c.385
br label %.if.end.665
.if.false.665:
%.tmp682 = call i8*(i32) @malloc(i32 2)
store i8* %.tmp682, i8** %buf.381
%.tmp683 = load i8*, i8** %buf.381
%.tmp684 = getelementptr i8, i8* %.tmp683, i32 0
%.tmp685 = load i8, i8* %prev_c.606
store i8 %.tmp685, i8* %.tmp684
%.tmp686 = load i8*, i8** %buf.381
%.tmp687 = getelementptr i8, i8* %.tmp686, i32 1
store i8 0, i8* %.tmp687
br label %.if.end.665
.if.end.665:
br label %.if.end.653
.if.end.653:
br label %.if.end.641
.if.end.641:
br label %.if.end.629
.if.end.629:
br label %.if.end.617
.if.end.617:
%.tmp688 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp689 = load i8*, i8** %type.611
%.tmp690 = load i8*, i8** %buf.381
%.tmp691 = call %m231$.Token.type*(%m231$.ParseCtx.type*,i8*,i8*) @m231$push_token.m231$.Token.typep.m231$.ParseCtx.typep.cp.cp(%m231$.ParseCtx.type* %.tmp688, i8* %.tmp689, i8* %.tmp690)
br label %.if.end.549
.if.end.549:
br label %.if.end.538
.if.end.538:
br label %.if.end.496
.if.end.496:
br label %.if.end.483
.if.end.483:
br label %.if.end.475
.if.end.475:
br label %.if.end.440
.if.end.440:
br label %.if.end.408
.if.end.408:
br label %.if.end.403
.if.end.403:
br label %.for.start.386
.for.end.386:
%.tmp692 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp694 = getelementptr [4 x i8], [4 x i8]*@.str693, i32 0, i32 0
%.tmp696 = getelementptr [1 x i8], [1 x i8]*@.str695, i32 0, i32 0
%.tmp697 = call %m231$.Token.type*(%m231$.ParseCtx.type*,i8*,i8*) @m231$push_token.m231$.Token.typep.m231$.ParseCtx.typep.cp.cp(%m231$.ParseCtx.type* %.tmp692, i8* %.tmp694, i8* %.tmp696)
%.tmp698 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp699 = getelementptr %m231$.ParseCtx.type, %m231$.ParseCtx.type* %.tmp698, i32 0, i32 3
%.tmp700 = load %m231$.Token.type*, %m231$.Token.type** %.tmp699
%root.701 = alloca %m231$.Token.type*
store %m231$.Token.type* %.tmp700, %m231$.Token.type** %root.701
%.tmp702 = load %m231$.ParseCtx.type*, %m231$.ParseCtx.type** %ctx.369
%.tmp703 = bitcast %m231$.ParseCtx.type* %.tmp702 to i8*
call void(i8*) @free(i8* %.tmp703)
%.tmp704 = load %m231$.Token.type*, %m231$.Token.type** %root.701
%.tmp705 = bitcast %m231$.Token.type* %.tmp704 to %m231$.Token.type*
ret %m231$.Token.type* %.tmp705
}
define i8* @m231$read_string.cp.m232$.PeekerInfo.typep.c(%m232$.PeekerInfo.type* %.p.arg, i8 %.delimeter.arg) {
%p = alloca %m232$.PeekerInfo.type*
store %m232$.PeekerInfo.type* %.p.arg, %m232$.PeekerInfo.type** %p
%delimeter = alloca i8
store i8 %.delimeter.arg, i8* %delimeter
%str_size.706 = alloca i32
store i32 64, i32* %str_size.706
%.tmp707 = load i32, i32* %str_size.706
%.tmp708 = call i8*(i32) @malloc(i32 %.tmp707)
%buf.709 = alloca i8*
store i8* %.tmp708, i8** %buf.709
%.tmp710 = load i8*, i8** %buf.709
%.tmp711 = getelementptr i8, i8* %.tmp710, i32 0
%.tmp712 = load i8, i8* %delimeter
store i8 %.tmp712, i8* %.tmp711
%.tmp713 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp714 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp713)
%c.715 = alloca i8
store i8 %.tmp714, i8* %c.715
%idx.716 = alloca i32
store i32 0, i32* %idx.716
store i32 1, i32* %idx.716
br label %.for.start.717
.for.start.717:
%.tmp718 = load i8, i8* %c.715
%.tmp719 = load i8, i8* %delimeter
%.tmp720 = icmp ne i8 %.tmp718, %.tmp719
br i1 %.tmp720, label %.for.continue.717, label %.for.end.717
.for.continue.717:
%.tmp721 = load i8, i8* %c.715
%.tmp722 = icmp ne i8 %.tmp721, 0
%.tmp724 = getelementptr [61 x i8], [61 x i8]*@.str723, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp722, i8* %.tmp724)
%.tmp725 = load i32, i32* %idx.716
%.tmp726 = load i32, i32* %str_size.706
%.tmp727 = sub i32 %.tmp726, 2
%.tmp728 = icmp eq i32 %.tmp725, %.tmp727
br i1 %.tmp728, label %.if.true.729, label %.if.false.729
.if.true.729:
%.tmp730 = load i32, i32* %str_size.706
%.tmp731 = mul i32 %.tmp730, 2
store i32 %.tmp731, i32* %str_size.706
%.tmp732 = load i8*, i8** %buf.709
%.tmp733 = load i32, i32* %str_size.706
%.tmp734 = call i8*(i8*,i32) @realloc(i8* %.tmp732, i32 %.tmp733)
store i8* %.tmp734, i8** %buf.709
br label %.if.end.729
.if.false.729:
br label %.if.end.729
.if.end.729:
%.tmp735 = load i32, i32* %idx.716
%.tmp736 = load i8*, i8** %buf.709
%.tmp737 = getelementptr i8, i8* %.tmp736, i32 %.tmp735
%.tmp738 = load i8, i8* %c.715
store i8 %.tmp738, i8* %.tmp737
%.tmp739 = load i32, i32* %idx.716
%.tmp740 = add i32 %.tmp739, 1
store i32 %.tmp740, i32* %idx.716
%.tmp741 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p
%.tmp742 = call i8(%m232$.PeekerInfo.type*) @m232$read.c.m232$.PeekerInfo.typep(%m232$.PeekerInfo.type* %.tmp741)
store i8 %.tmp742, i8* %c.715
br label %.for.start.717
.for.end.717:
%.tmp743 = load i32, i32* %idx.716
%.tmp744 = load i8*, i8** %buf.709
%.tmp745 = getelementptr i8, i8* %.tmp744, i32 %.tmp743
%.tmp746 = load i8, i8* %c.715
store i8 %.tmp746, i8* %.tmp745
%.tmp747 = load i32, i32* %idx.716
%.tmp748 = add i32 %.tmp747, 1
%.tmp749 = load i8*, i8** %buf.709
%.tmp750 = getelementptr i8, i8* %.tmp749, i32 %.tmp748
store i8 0, i8* %.tmp750
%.tmp751 = load i8*, i8** %buf.709
ret i8* %.tmp751
}
%m230$.Error.type = type {i32,i32,i8*,i8*}
@Error_size = constant i32 24
define %m230$.Error.type* @m230$from.m230$.Error.typep.m231$.Token.typep.cp(%m231$.Token.type* %.t.arg, i8* %.message.arg) {
%t = alloca %m231$.Token.type*
store %m231$.Token.type* %.t.arg, %m231$.Token.type** %t
%message = alloca i8*
store i8* %.message.arg, i8** %message
%.tmp752 = load %m231$.Token.type*, %m231$.Token.type** %t
%.tmp753 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp752, i32 0, i32 4
%.tmp754 = load i8*, i8** %.tmp753
%.tmp755 = bitcast i8* %.tmp754 to i8*
%.tmp756 = load %m231$.Token.type*, %m231$.Token.type** %t
%.tmp757 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp756, i32 0, i32 2
%.tmp758 = load i32, i32* %.tmp757
%.tmp759 = load %m231$.Token.type*, %m231$.Token.type** %t
%.tmp760 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp759, i32 0, i32 3
%.tmp761 = load i32, i32* %.tmp760
%.tmp762 = load i8*, i8** %message
%.tmp763 = call %m230$.Error.type*(i8*,i32,i32,i8*) @m230$new.m230$.Error.typep.cp.i.i.cp(i8* %.tmp755, i32 %.tmp758, i32 %.tmp761, i8* %.tmp762)
ret %m230$.Error.type* %.tmp763
}
define %m230$.Error.type* @m230$new.m230$.Error.typep.cp.i.i.cp(i8* %.filename.arg, i32 %.line.arg, i32 %.char_of_line.arg, i8* %.message.arg) {
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
%.tmp766 = bitcast i8* %.tmp765 to %m230$.Error.type*
%e.767 = alloca %m230$.Error.type*
store %m230$.Error.type* %.tmp766, %m230$.Error.type** %e.767
%.tmp768 = load %m230$.Error.type*, %m230$.Error.type** %e.767
%.tmp769 = getelementptr %m230$.Error.type, %m230$.Error.type* %.tmp768, i32 0, i32 0
%.tmp770 = load i32, i32* %line
store i32 %.tmp770, i32* %.tmp769
%.tmp771 = load %m230$.Error.type*, %m230$.Error.type** %e.767
%.tmp772 = getelementptr %m230$.Error.type, %m230$.Error.type* %.tmp771, i32 0, i32 1
%.tmp773 = load i32, i32* %char_of_line
store i32 %.tmp773, i32* %.tmp772
%.tmp774 = load %m230$.Error.type*, %m230$.Error.type** %e.767
%.tmp775 = getelementptr %m230$.Error.type, %m230$.Error.type* %.tmp774, i32 0, i32 3
%.tmp776 = load i8*, i8** %message
store i8* %.tmp776, i8** %.tmp775
%.tmp777 = load %m230$.Error.type*, %m230$.Error.type** %e.767
%.tmp778 = getelementptr %m230$.Error.type, %m230$.Error.type* %.tmp777, i32 0, i32 2
%.tmp779 = load i8*, i8** %filename
store i8* %.tmp779, i8** %.tmp778
%.tmp780 = load %m230$.Error.type*, %m230$.Error.type** %e.767
ret %m230$.Error.type* %.tmp780
}
define void @m230$report.v.m230$.Error.typep(%m230$.Error.type* %.e.arg) {
%e = alloca %m230$.Error.type*
store %m230$.Error.type* %.e.arg, %m230$.Error.type** %e
%.tmp782 = getelementptr [22 x i8], [22 x i8]*@.str781, i32 0, i32 0
%.tmp783 = load %m230$.Error.type*, %m230$.Error.type** %e
%.tmp784 = getelementptr %m230$.Error.type, %m230$.Error.type* %.tmp783, i32 0, i32 2
%.tmp785 = load i8*, i8** %.tmp784
%.tmp786 = load %m230$.Error.type*, %m230$.Error.type** %e
%.tmp787 = getelementptr %m230$.Error.type, %m230$.Error.type* %.tmp786, i32 0, i32 0
%.tmp788 = load i32, i32* %.tmp787
%.tmp789 = load %m230$.Error.type*, %m230$.Error.type** %e
%.tmp790 = getelementptr %m230$.Error.type, %m230$.Error.type* %.tmp789, i32 0, i32 1
%.tmp791 = load i32, i32* %.tmp790
%.tmp792 = load %m230$.Error.type*, %m230$.Error.type** %e
%.tmp793 = getelementptr %m230$.Error.type, %m230$.Error.type* %.tmp792, i32 0, i32 3
%.tmp794 = load i8*, i8** %.tmp793
%.tmp795 = call i32(i8*,...) @printf(i8* %.tmp782, i8* %.tmp785, i32 %.tmp788, i32 %.tmp791, i8* %.tmp794)
ret void
}
define void @m230$freport.v.m0$.File.typep.m230$.Error.typep(%m0$.File.type* %.fd.arg, %m230$.Error.type* %.e.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%e = alloca %m230$.Error.type*
store %m230$.Error.type* %.e.arg, %m230$.Error.type** %e
%.tmp796 = load %m0$.File.type*, %m0$.File.type** %fd
%.tmp798 = getelementptr [22 x i8], [22 x i8]*@.str797, i32 0, i32 0
%.tmp799 = load %m230$.Error.type*, %m230$.Error.type** %e
%.tmp800 = getelementptr %m230$.Error.type, %m230$.Error.type* %.tmp799, i32 0, i32 2
%.tmp801 = load i8*, i8** %.tmp800
%.tmp802 = load %m230$.Error.type*, %m230$.Error.type** %e
%.tmp803 = getelementptr %m230$.Error.type, %m230$.Error.type* %.tmp802, i32 0, i32 0
%.tmp804 = load i32, i32* %.tmp803
%.tmp805 = load %m230$.Error.type*, %m230$.Error.type** %e
%.tmp806 = getelementptr %m230$.Error.type, %m230$.Error.type* %.tmp805, i32 0, i32 1
%.tmp807 = load i32, i32* %.tmp806
%.tmp808 = load %m230$.Error.type*, %m230$.Error.type** %e
%.tmp809 = getelementptr %m230$.Error.type, %m230$.Error.type* %.tmp808, i32 0, i32 3
%.tmp810 = load i8*, i8** %.tmp809
%.tmp811 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp796, i8* %.tmp798, i8* %.tmp801, i32 %.tmp804, i32 %.tmp807, i8* %.tmp810)
ret void
}
%m812$.Query.type = type {i8,i8*,%m812$.Query.type*}
%m812$.Matcher.type = type {%m812$.Query.type*,i8,%m812$.Matcher.type*,%m812$.Matcher.type*}
%m812$.Rule.type = type {i8*,%m812$.Matcher.type*}
%m812$.ParsingContext.type = type {%m231$.Token.type*}
define %m812$.ParsingContext.type* @m812$new_context.m812$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.f.arg) {
%f = alloca %m0$.File.type*
store %m0$.File.type* %.f.arg, %m0$.File.type** %f
%.tmp813 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* null, i32 1
%.tmp814 = ptrtoint %m812$.ParsingContext.type* %.tmp813 to i32
%.tmp815 = call i8*(i32) @malloc(i32 %.tmp814)
%.tmp816 = bitcast i8* %.tmp815 to %m812$.ParsingContext.type*
%ctx.817 = alloca %m812$.ParsingContext.type*
store %m812$.ParsingContext.type* %.tmp816, %m812$.ParsingContext.type** %ctx.817
%.tmp818 = load %m0$.File.type*, %m0$.File.type** %f
%.tmp819 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp818)
%fd.820 = alloca i32
store i32 %.tmp819, i32* %fd.820
%.tmp821 = load i32, i32* %fd.820
%.tmp822 = call %m232$.PeekerInfo.type*(i32) @m232$new.m232$.PeekerInfo.typep.i(i32 %.tmp821)
%p.823 = alloca %m232$.PeekerInfo.type*
store %m232$.PeekerInfo.type* %.tmp822, %m232$.PeekerInfo.type** %p.823
%.tmp824 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p.823
%.tmp825 = call %m231$.Token.type*(%m232$.PeekerInfo.type*,i1) @m231$tokenize.m231$.Token.typep.m232$.PeekerInfo.typep.b(%m232$.PeekerInfo.type* %.tmp824, i1 0)
%token_list.826 = alloca %m231$.Token.type*
store %m231$.Token.type* %.tmp825, %m231$.Token.type** %token_list.826
%.tmp827 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p.823
%.tmp828 = bitcast %m232$.PeekerInfo.type* %.tmp827 to i8*
call void(i8*) @free(i8* %.tmp828)
%.tmp829 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx.817
%.tmp830 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp829, i32 0, i32 0
%.tmp831 = load %m231$.Token.type*, %m231$.Token.type** %token_list.826
store %m231$.Token.type* %.tmp831, %m231$.Token.type** %.tmp830
%.tmp832 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx.817
ret %m812$.ParsingContext.type* %.tmp832
}
define %m812$.Matcher.type* @m812$new_matcher.m812$.Matcher.typep() {
%.tmp833 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* null, i32 1
%.tmp834 = ptrtoint %m812$.Matcher.type* %.tmp833 to i32
%.tmp835 = call i8*(i32) @malloc(i32 %.tmp834)
%.tmp836 = bitcast i8* %.tmp835 to %m812$.Matcher.type*
%m.837 = alloca %m812$.Matcher.type*
store %m812$.Matcher.type* %.tmp836, %m812$.Matcher.type** %m.837
%.tmp838 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.837
%.tmp839 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp838, i32 0, i32 1
store i8 49, i8* %.tmp839
%.tmp840 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.837
%.tmp841 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp840, i32 0, i32 2
store %m812$.Matcher.type* null, %m812$.Matcher.type** %.tmp841
%.tmp842 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.837
%.tmp843 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp842, i32 0, i32 3
store %m812$.Matcher.type* null, %m812$.Matcher.type** %.tmp843
%.tmp844 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.837
%.tmp845 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp844, i32 0, i32 0
store %m812$.Query.type* null, %m812$.Query.type** %.tmp845
%.tmp846 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.837
ret %m812$.Matcher.type* %.tmp846
}
define %m812$.Matcher.type* @m812$parse_matcher.m812$.Matcher.typep.m812$.ParsingContext.typep(%m812$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m812$.ParsingContext.type*
store %m812$.ParsingContext.type* %.ctx.arg, %m812$.ParsingContext.type** %ctx
%m.847 = alloca %m812$.Matcher.type*
store %m812$.Matcher.type* null, %m812$.Matcher.type** %m.847
%.tmp848 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp849 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp848, i32 0, i32 0
%.tmp850 = load %m231$.Token.type*, %m231$.Token.type** %.tmp849
%.tmp851 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp850, i32 0, i32 1
%.tmp852 = load i8*, i8** %.tmp851
%.tmp854 = getelementptr [2 x i8], [2 x i8]*@.str853, i32 0, i32 0
%.tmp855 = call i32(i8*,i8*) @strcmp(i8* %.tmp852, i8* %.tmp854)
%.tmp856 = icmp eq i32 %.tmp855, 0
br i1 %.tmp856, label %.if.true.857, label %.if.false.857
.if.true.857:
%.tmp858 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp859 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp858, i32 0, i32 0
%.tmp860 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp861 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp860, i32 0, i32 0
%.tmp862 = load %m231$.Token.type*, %m231$.Token.type** %.tmp861
%.tmp863 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp862, i32 0, i32 5
%.tmp864 = load %m231$.Token.type*, %m231$.Token.type** %.tmp863
store %m231$.Token.type* %.tmp864, %m231$.Token.type** %.tmp859
%max_matchers.865 = alloca i32
store i32 10, i32* %max_matchers.865
%.tmp866 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp867 = call %m812$.Matcher.type*(%m812$.ParsingContext.type*) @m812$parse_matcher.m812$.Matcher.typep.m812$.ParsingContext.typep(%m812$.ParsingContext.type* %.tmp866)
store %m812$.Matcher.type* %.tmp867, %m812$.Matcher.type** %m.847
%.tmp868 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp869 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp868, i32 0, i32 0
%.tmp870 = load %m231$.Token.type*, %m231$.Token.type** %.tmp869
%.tmp871 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp870, i32 0, i32 1
%.tmp872 = load i8*, i8** %.tmp871
%.tmp874 = getelementptr [2 x i8], [2 x i8]*@.str873, i32 0, i32 0
%.tmp875 = call i32(i8*,i8*) @strcmp(i8* %.tmp872, i8* %.tmp874)
%.tmp876 = icmp eq i32 %.tmp875, 0
br i1 %.tmp876, label %.if.true.877, label %.if.false.877
.if.true.877:
%.tmp878 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp879 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp878, i32 0, i32 0
%.tmp880 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp881 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp880, i32 0, i32 0
%.tmp882 = load %m231$.Token.type*, %m231$.Token.type** %.tmp881
%.tmp883 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp882, i32 0, i32 5
%.tmp884 = load %m231$.Token.type*, %m231$.Token.type** %.tmp883
store %m231$.Token.type* %.tmp884, %m231$.Token.type** %.tmp879
%.tmp885 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.847
%last_matcher.886 = alloca %m812$.Matcher.type*
store %m812$.Matcher.type* %.tmp885, %m812$.Matcher.type** %last_matcher.886
br label %.for.start.887
.for.start.887:
%.tmp888 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp889 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp888, i32 0, i32 0
%.tmp890 = load %m231$.Token.type*, %m231$.Token.type** %.tmp889
%.tmp891 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp890, i32 0, i32 1
%.tmp892 = load i8*, i8** %.tmp891
%.tmp894 = getelementptr [2 x i8], [2 x i8]*@.str893, i32 0, i32 0
%.tmp895 = call i32(i8*,i8*) @strcmp(i8* %.tmp892, i8* %.tmp894)
%.tmp896 = icmp ne i32 %.tmp895, 0
%.tmp897 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp898 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp897, i32 0, i32 0
%.tmp899 = load %m231$.Token.type*, %m231$.Token.type** %.tmp898
%.tmp900 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp899, i32 0, i32 0
%.tmp901 = load i8*, i8** %.tmp900
%.tmp903 = getelementptr [4 x i8], [4 x i8]*@.str902, i32 0, i32 0
%.tmp904 = call i32(i8*,i8*) @strcmp(i8* %.tmp901, i8* %.tmp903)
%.tmp905 = icmp ne i32 %.tmp904, 0
%.tmp906 = and i1 %.tmp896, %.tmp905
br i1 %.tmp906, label %.for.continue.887, label %.for.end.887
.for.continue.887:
%.tmp907 = load %m812$.Matcher.type*, %m812$.Matcher.type** %last_matcher.886
%.tmp908 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp907, i32 0, i32 2
%.tmp909 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp910 = call %m812$.Matcher.type*(%m812$.ParsingContext.type*) @m812$parse_matcher.m812$.Matcher.typep.m812$.ParsingContext.typep(%m812$.ParsingContext.type* %.tmp909)
store %m812$.Matcher.type* %.tmp910, %m812$.Matcher.type** %.tmp908
%.tmp911 = load %m812$.Matcher.type*, %m812$.Matcher.type** %last_matcher.886
%.tmp912 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp911, i32 0, i32 2
%.tmp913 = load %m812$.Matcher.type*, %m812$.Matcher.type** %.tmp912
store %m812$.Matcher.type* %.tmp913, %m812$.Matcher.type** %last_matcher.886
%.tmp914 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp915 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp914, i32 0, i32 0
%.tmp916 = load %m231$.Token.type*, %m231$.Token.type** %.tmp915
%.tmp917 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp916, i32 0, i32 1
%.tmp918 = load i8*, i8** %.tmp917
%.tmp920 = getelementptr [2 x i8], [2 x i8]*@.str919, i32 0, i32 0
%.tmp921 = call i32(i8*,i8*) @strcmp(i8* %.tmp918, i8* %.tmp920)
%.tmp922 = icmp ne i32 %.tmp921, 0
%.tmp923 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp924 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp923, i32 0, i32 0
%.tmp925 = load %m231$.Token.type*, %m231$.Token.type** %.tmp924
%.tmp926 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp925, i32 0, i32 1
%.tmp927 = load i8*, i8** %.tmp926
%.tmp929 = getelementptr [2 x i8], [2 x i8]*@.str928, i32 0, i32 0
%.tmp930 = call i32(i8*,i8*) @strcmp(i8* %.tmp927, i8* %.tmp929)
%.tmp931 = icmp ne i32 %.tmp930, 0
%.tmp932 = and i1 %.tmp922, %.tmp931
br i1 %.tmp932, label %.if.true.933, label %.if.false.933
.if.true.933:
%.tmp935 = getelementptr [48 x i8], [48 x i8]*@.str934, i32 0, i32 0
%.tmp936 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp937 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp936, i32 0, i32 0
%.tmp938 = load %m231$.Token.type*, %m231$.Token.type** %.tmp937
%.tmp939 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp938, i32 0, i32 2
%.tmp940 = load i32, i32* %.tmp939
%.tmp941 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp942 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp941, i32 0, i32 0
%.tmp943 = load %m231$.Token.type*, %m231$.Token.type** %.tmp942
%.tmp944 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp943, i32 0, i32 3
%.tmp945 = load i32, i32* %.tmp944
%.tmp946 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp947 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp946, i32 0, i32 0
%.tmp948 = load %m231$.Token.type*, %m231$.Token.type** %.tmp947
%.tmp949 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp948, i32 0, i32 1
%.tmp950 = load i8*, i8** %.tmp949
%.tmp951 = call i32(i8*,...) @printf(i8* %.tmp935, i32 %.tmp940, i32 %.tmp945, i8* %.tmp950)
call void(i32) @exit(i32 1)
br label %.if.end.933
.if.false.933:
br label %.if.end.933
.if.end.933:
%.tmp952 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp953 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp952, i32 0, i32 0
%.tmp954 = load %m231$.Token.type*, %m231$.Token.type** %.tmp953
%.tmp955 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp954, i32 0, i32 1
%.tmp956 = load i8*, i8** %.tmp955
%.tmp958 = getelementptr [2 x i8], [2 x i8]*@.str957, i32 0, i32 0
%.tmp959 = call i32(i8*,i8*) @strcmp(i8* %.tmp956, i8* %.tmp958)
%.tmp960 = icmp eq i32 %.tmp959, 0
br i1 %.tmp960, label %.if.true.961, label %.if.false.961
.if.true.961:
%.tmp962 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp963 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp962, i32 0, i32 0
%.tmp964 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp965 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp964, i32 0, i32 0
%.tmp966 = load %m231$.Token.type*, %m231$.Token.type** %.tmp965
%.tmp967 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp966, i32 0, i32 5
%.tmp968 = load %m231$.Token.type*, %m231$.Token.type** %.tmp967
store %m231$.Token.type* %.tmp968, %m231$.Token.type** %.tmp963
br label %.if.end.961
.if.false.961:
br label %.if.end.961
.if.end.961:
br label %.for.start.887
.for.end.887:
br label %.if.end.877
.if.false.877:
br label %.if.end.877
.if.end.877:
%.tmp969 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp970 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp969, i32 0, i32 0
%.tmp971 = load %m231$.Token.type*, %m231$.Token.type** %.tmp970
%.tmp972 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp971, i32 0, i32 1
%.tmp973 = load i8*, i8** %.tmp972
%.tmp975 = getelementptr [2 x i8], [2 x i8]*@.str974, i32 0, i32 0
%.tmp976 = call i32(i8*,i8*) @strcmp(i8* %.tmp973, i8* %.tmp975)
%.tmp977 = icmp ne i32 %.tmp976, 0
br i1 %.tmp977, label %.if.true.978, label %.if.false.978
.if.true.978:
%.tmp979 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp981 = getelementptr [22 x i8], [22 x i8]*@.str980, i32 0, i32 0
call void(%m812$.ParsingContext.type*,i8*) @m812$parser_error.v.m812$.ParsingContext.typep.cp(%m812$.ParsingContext.type* %.tmp979, i8* %.tmp981)
br label %.if.end.978
.if.false.978:
br label %.if.end.978
.if.end.978:
%.tmp982 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp983 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp982, i32 0, i32 0
%.tmp984 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp985 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp984, i32 0, i32 0
%.tmp986 = load %m231$.Token.type*, %m231$.Token.type** %.tmp985
%.tmp987 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp986, i32 0, i32 5
%.tmp988 = load %m231$.Token.type*, %m231$.Token.type** %.tmp987
store %m231$.Token.type* %.tmp988, %m231$.Token.type** %.tmp983
%.tmp989 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp990 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp989, i32 0, i32 0
%.tmp991 = load %m231$.Token.type*, %m231$.Token.type** %.tmp990
%.tmp992 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp991, i32 0, i32 1
%.tmp993 = load i8*, i8** %.tmp992
%.tmp995 = getelementptr [2 x i8], [2 x i8]*@.str994, i32 0, i32 0
%.tmp996 = call i32(i8*,i8*) @strcmp(i8* %.tmp993, i8* %.tmp995)
%.tmp997 = icmp eq i32 %.tmp996, 0
br i1 %.tmp997, label %.if.true.998, label %.if.false.998
.if.true.998:
%.tmp999 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1000 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp999, i32 0, i32 0
%.tmp1001 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1002 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1001, i32 0, i32 0
%.tmp1003 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1002
%.tmp1004 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1003, i32 0, i32 5
%.tmp1005 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1004
store %m231$.Token.type* %.tmp1005, %m231$.Token.type** %.tmp1000
%.tmp1006 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.847
%.tmp1007 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1006, i32 0, i32 1
store i8 43, i8* %.tmp1007
br label %.if.end.998
.if.false.998:
%.tmp1008 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1009 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1008, i32 0, i32 0
%.tmp1010 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1009
%.tmp1011 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1010, i32 0, i32 1
%.tmp1012 = load i8*, i8** %.tmp1011
%.tmp1014 = getelementptr [2 x i8], [2 x i8]*@.str1013, i32 0, i32 0
%.tmp1015 = call i32(i8*,i8*) @strcmp(i8* %.tmp1012, i8* %.tmp1014)
%.tmp1016 = icmp eq i32 %.tmp1015, 0
br i1 %.tmp1016, label %.if.true.1017, label %.if.false.1017
.if.true.1017:
%.tmp1018 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1019 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1018, i32 0, i32 0
%.tmp1020 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1021 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1020, i32 0, i32 0
%.tmp1022 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1021
%.tmp1023 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1022, i32 0, i32 5
%.tmp1024 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1023
store %m231$.Token.type* %.tmp1024, %m231$.Token.type** %.tmp1019
%.tmp1025 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.847
%.tmp1026 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1025, i32 0, i32 1
store i8 42, i8* %.tmp1026
br label %.if.end.1017
.if.false.1017:
%.tmp1027 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1028 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1027, i32 0, i32 0
%.tmp1029 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1028
%.tmp1030 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1029, i32 0, i32 1
%.tmp1031 = load i8*, i8** %.tmp1030
%.tmp1033 = getelementptr [2 x i8], [2 x i8]*@.str1032, i32 0, i32 0
%.tmp1034 = call i32(i8*,i8*) @strcmp(i8* %.tmp1031, i8* %.tmp1033)
%.tmp1035 = icmp eq i32 %.tmp1034, 0
br i1 %.tmp1035, label %.if.true.1036, label %.if.false.1036
.if.true.1036:
%.tmp1037 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1038 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1037, i32 0, i32 0
%.tmp1039 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1040 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1039, i32 0, i32 0
%.tmp1041 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1040
%.tmp1042 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1041, i32 0, i32 5
%.tmp1043 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1042
store %m231$.Token.type* %.tmp1043, %m231$.Token.type** %.tmp1038
%.tmp1044 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.847
%.tmp1045 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1044, i32 0, i32 1
store i8 63, i8* %.tmp1045
br label %.if.end.1036
.if.false.1036:
br label %.if.end.1036
.if.end.1036:
br label %.if.end.1017
.if.end.1017:
br label %.if.end.998
.if.end.998:
br label %.if.end.857
.if.false.857:
%.tmp1046 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1047 = call %m812$.Matcher.type*(%m812$.ParsingContext.type*) @m812$parse_simple_matcher.m812$.Matcher.typep.m812$.ParsingContext.typep(%m812$.ParsingContext.type* %.tmp1046)
store %m812$.Matcher.type* %.tmp1047, %m812$.Matcher.type** %m.847
br label %.if.end.857
.if.end.857:
%.tmp1048 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1049 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1048, i32 0, i32 0
%.tmp1050 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1049
%.tmp1051 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1050, i32 0, i32 1
%.tmp1052 = load i8*, i8** %.tmp1051
%.tmp1054 = getelementptr [2 x i8], [2 x i8]*@.str1053, i32 0, i32 0
%.tmp1055 = call i32(i8*,i8*) @strcmp(i8* %.tmp1052, i8* %.tmp1054)
%.tmp1056 = icmp eq i32 %.tmp1055, 0
%.tmp1057 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1058 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1057, i32 0, i32 0
%.tmp1059 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1058
%.tmp1060 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1059, i32 0, i32 0
%.tmp1061 = load i8*, i8** %.tmp1060
%.tmp1063 = getelementptr [5 x i8], [5 x i8]*@.str1062, i32 0, i32 0
%.tmp1064 = call i32(i8*,i8*) @strcmp(i8* %.tmp1061, i8* %.tmp1063)
%.tmp1065 = icmp eq i32 %.tmp1064, 0
%.tmp1066 = or i1 %.tmp1056, %.tmp1065
br i1 %.tmp1066, label %.if.true.1067, label %.if.false.1067
.if.true.1067:
%.tmp1068 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.847
%.tmp1069 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1068, i32 0, i32 3
%.tmp1070 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1071 = call %m812$.Matcher.type*(%m812$.ParsingContext.type*) @m812$parse_matcher.m812$.Matcher.typep.m812$.ParsingContext.typep(%m812$.ParsingContext.type* %.tmp1070)
store %m812$.Matcher.type* %.tmp1071, %m812$.Matcher.type** %.tmp1069
br label %.if.end.1067
.if.false.1067:
br label %.if.end.1067
.if.end.1067:
%.tmp1072 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.847
ret %m812$.Matcher.type* %.tmp1072
}
define %m812$.Matcher.type* @m812$parse_simple_matcher.m812$.Matcher.typep.m812$.ParsingContext.typep(%m812$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m812$.ParsingContext.type*
store %m812$.ParsingContext.type* %.ctx.arg, %m812$.ParsingContext.type** %ctx
%.tmp1073 = call %m812$.Matcher.type*() @m812$new_matcher.m812$.Matcher.typep()
%m.1074 = alloca %m812$.Matcher.type*
store %m812$.Matcher.type* %.tmp1073, %m812$.Matcher.type** %m.1074
%count.1075 = alloca i32
store i32 0, i32* %count.1075
%.tmp1076 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1077 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1076, i32 0, i32 0
%.tmp1078 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1077
%ptr.1079 = alloca %m231$.Token.type*
store %m231$.Token.type* %.tmp1078, %m231$.Token.type** %ptr.1079
store i32 0, i32* %count.1075
br label %.for.start.1080
.for.start.1080:
%.tmp1081 = load %m231$.Token.type*, %m231$.Token.type** %ptr.1079
%.tmp1082 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1081, i32 0, i32 0
%.tmp1083 = load i8*, i8** %.tmp1082
%.tmp1085 = getelementptr [5 x i8], [5 x i8]*@.str1084, i32 0, i32 0
%.tmp1086 = call i32(i8*,i8*) @strcmp(i8* %.tmp1083, i8* %.tmp1085)
%.tmp1087 = icmp eq i32 %.tmp1086, 0
%.tmp1088 = load %m231$.Token.type*, %m231$.Token.type** %ptr.1079
%.tmp1089 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1088, i32 0, i32 0
%.tmp1090 = load i8*, i8** %.tmp1089
%.tmp1092 = getelementptr [7 x i8], [7 x i8]*@.str1091, i32 0, i32 0
%.tmp1093 = call i32(i8*,i8*) @strcmp(i8* %.tmp1090, i8* %.tmp1092)
%.tmp1094 = icmp eq i32 %.tmp1093, 0
%.tmp1095 = or i1 %.tmp1087, %.tmp1094
br i1 %.tmp1095, label %.for.continue.1080, label %.for.end.1080
.for.continue.1080:
%.tmp1096 = load i32, i32* %count.1075
%.tmp1097 = add i32 %.tmp1096, 1
store i32 %.tmp1097, i32* %count.1075
%.tmp1098 = load %m231$.Token.type*, %m231$.Token.type** %ptr.1079
%.tmp1099 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1098, i32 0, i32 5
%.tmp1100 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1099
store %m231$.Token.type* %.tmp1100, %m231$.Token.type** %ptr.1079
br label %.for.start.1080
.for.end.1080:
%.tmp1101 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.1074
%.tmp1102 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1101, i32 0, i32 0
%.tmp1103 = getelementptr %m812$.Query.type, %m812$.Query.type* null, i32 1
%.tmp1104 = ptrtoint %m812$.Query.type* %.tmp1103 to i32
%.tmp1105 = call i8*(i32) @malloc(i32 %.tmp1104)
%.tmp1106 = bitcast i8* %.tmp1105 to %m812$.Query.type*
store %m812$.Query.type* %.tmp1106, %m812$.Query.type** %.tmp1102
%.tmp1107 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.1074
%.tmp1108 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1107, i32 0, i32 0
%.tmp1109 = load %m812$.Query.type*, %m812$.Query.type** %.tmp1108
%q.1110 = alloca %m812$.Query.type*
store %m812$.Query.type* %.tmp1109, %m812$.Query.type** %q.1110
%i.1112 = alloca i32
store i32 0, i32* %i.1112
br label %.for.start.1111
.for.start.1111:
%.tmp1113 = load i32, i32* %i.1112
%.tmp1114 = load i32, i32* %count.1075
%.tmp1115 = icmp slt i32 %.tmp1113, %.tmp1114
br i1 %.tmp1115, label %.for.continue.1111, label %.for.end.1111
.for.continue.1111:
%.tmp1116 = load i32, i32* %i.1112
%.tmp1117 = icmp sgt i32 %.tmp1116, 0
br i1 %.tmp1117, label %.if.true.1118, label %.if.false.1118
.if.true.1118:
%.tmp1119 = load %m812$.Query.type*, %m812$.Query.type** %q.1110
%.tmp1120 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1119, i32 0, i32 2
%.tmp1121 = getelementptr %m812$.Query.type, %m812$.Query.type* null, i32 1
%.tmp1122 = ptrtoint %m812$.Query.type* %.tmp1121 to i32
%.tmp1123 = call i8*(i32) @malloc(i32 %.tmp1122)
%.tmp1124 = bitcast i8* %.tmp1123 to %m812$.Query.type*
store %m812$.Query.type* %.tmp1124, %m812$.Query.type** %.tmp1120
%.tmp1125 = load %m812$.Query.type*, %m812$.Query.type** %q.1110
%.tmp1126 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1125, i32 0, i32 2
%.tmp1127 = load %m812$.Query.type*, %m812$.Query.type** %.tmp1126
store %m812$.Query.type* %.tmp1127, %m812$.Query.type** %q.1110
br label %.if.end.1118
.if.false.1118:
br label %.if.end.1118
.if.end.1118:
%.tmp1128 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1129 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1128, i32 0, i32 0
%.tmp1130 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1129
%.tmp1131 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1130, i32 0, i32 0
%.tmp1132 = load i8*, i8** %.tmp1131
%.tmp1134 = getelementptr [7 x i8], [7 x i8]*@.str1133, i32 0, i32 0
%.tmp1135 = call i32(i8*,i8*) @strcmp(i8* %.tmp1132, i8* %.tmp1134)
%.tmp1136 = icmp eq i32 %.tmp1135, 0
br i1 %.tmp1136, label %.if.true.1137, label %.if.false.1137
.if.true.1137:
%.tmp1138 = load %m812$.Query.type*, %m812$.Query.type** %q.1110
%.tmp1139 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1138, i32 0, i32 0
store i8 118, i8* %.tmp1139
br label %.if.end.1137
.if.false.1137:
%.tmp1140 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1141 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1140, i32 0, i32 0
%.tmp1142 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1141
%.tmp1143 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1142, i32 0, i32 1
%.tmp1144 = load i8*, i8** %.tmp1143
%.tmp1145 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1144)
br i1 %.tmp1145, label %.if.true.1146, label %.if.false.1146
.if.true.1146:
%.tmp1147 = load %m812$.Query.type*, %m812$.Query.type** %q.1110
%.tmp1148 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1147, i32 0, i32 0
store i8 97, i8* %.tmp1148
br label %.if.end.1146
.if.false.1146:
%.tmp1149 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1150 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1149, i32 0, i32 0
%.tmp1151 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1150
%.tmp1152 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1151, i32 0, i32 1
%.tmp1153 = load i8*, i8** %.tmp1152
%.tmp1154 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1153)
br i1 %.tmp1154, label %.if.true.1155, label %.if.false.1155
.if.true.1155:
%.tmp1156 = load %m812$.Query.type*, %m812$.Query.type** %q.1110
%.tmp1157 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1156, i32 0, i32 0
store i8 116, i8* %.tmp1157
br label %.if.end.1155
.if.false.1155:
%.tmp1159 = getelementptr [17 x i8], [17 x i8]*@.str1158, i32 0, i32 0
%.tmp1160 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1161 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1160, i32 0, i32 0
%.tmp1162 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1161
%.tmp1163 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1162, i32 0, i32 1
%.tmp1164 = load i8*, i8** %.tmp1163
%.tmp1165 = call i32(i8*,...) @printf(i8* %.tmp1159, i8* %.tmp1164)
%.tmp1166 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1168 = getelementptr [50 x i8], [50 x i8]*@.str1167, i32 0, i32 0
call void(%m812$.ParsingContext.type*,i8*) @m812$parser_error.v.m812$.ParsingContext.typep.cp(%m812$.ParsingContext.type* %.tmp1166, i8* %.tmp1168)
br label %.if.end.1155
.if.end.1155:
br label %.if.end.1146
.if.end.1146:
br label %.if.end.1137
.if.end.1137:
%.tmp1169 = load %m812$.Query.type*, %m812$.Query.type** %q.1110
%.tmp1170 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1169, i32 0, i32 1
%.tmp1171 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1172 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1171, i32 0, i32 0
%.tmp1173 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1172
%.tmp1174 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1173, i32 0, i32 1
%.tmp1175 = load i8*, i8** %.tmp1174
store i8* %.tmp1175, i8** %.tmp1170
%.tmp1176 = load %m812$.Query.type*, %m812$.Query.type** %q.1110
%.tmp1177 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1176, i32 0, i32 2
store %m812$.Query.type* null, %m812$.Query.type** %.tmp1177
%.tmp1178 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1179 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1178, i32 0, i32 0
%.tmp1180 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1181 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1180, i32 0, i32 0
%.tmp1182 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1181
%.tmp1183 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1182, i32 0, i32 5
%.tmp1184 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1183
store %m231$.Token.type* %.tmp1184, %m231$.Token.type** %.tmp1179
%.tmp1185 = load i32, i32* %i.1112
%.tmp1186 = add i32 %.tmp1185, 1
store i32 %.tmp1186, i32* %i.1112
br label %.for.start.1111
.for.end.1111:
%.tmp1187 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m.1074
ret %m812$.Matcher.type* %.tmp1187
}
define %m812$.Rule.type* @m812$parse_rule.m812$.Rule.typep.m812$.ParsingContext.typep(%m812$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m812$.ParsingContext.type*
store %m812$.ParsingContext.type* %.ctx.arg, %m812$.ParsingContext.type** %ctx
%.tmp1188 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1189 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1188, i32 0, i32 0
%.tmp1190 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1189
%.tmp1191 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1190, i32 0, i32 1
%.tmp1192 = load i8*, i8** %.tmp1191
%rule_name.1193 = alloca i8*
store i8* %.tmp1192, i8** %rule_name.1193
%.tmp1194 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1195 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1194, i32 0, i32 0
%.tmp1196 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1195
%.tmp1197 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1196, i32 0, i32 0
%.tmp1198 = load i8*, i8** %.tmp1197
%.tmp1200 = getelementptr [5 x i8], [5 x i8]*@.str1199, i32 0, i32 0
%.tmp1201 = call i32(i8*,i8*) @strcmp(i8* %.tmp1198, i8* %.tmp1200)
%.tmp1202 = icmp ne i32 %.tmp1201, 0
br i1 %.tmp1202, label %.if.true.1203, label %.if.false.1203
.if.true.1203:
%.tmp1205 = getelementptr [37 x i8], [37 x i8]*@.str1204, i32 0, i32 0
%.tmp1206 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1207 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1206, i32 0, i32 0
%.tmp1208 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1207
%.tmp1209 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1208, i32 0, i32 0
%.tmp1210 = load i8*, i8** %.tmp1209
%.tmp1211 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1212 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1211, i32 0, i32 0
%.tmp1213 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1212
%.tmp1214 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1213, i32 0, i32 1
%.tmp1215 = load i8*, i8** %.tmp1214
%.tmp1216 = call i32(i8*,...) @printf(i8* %.tmp1205, i8* %.tmp1210, i8* %.tmp1215)
%.tmp1217 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1219 = getelementptr [31 x i8], [31 x i8]*@.str1218, i32 0, i32 0
call void(%m812$.ParsingContext.type*,i8*) @m812$parser_error.v.m812$.ParsingContext.typep.cp(%m812$.ParsingContext.type* %.tmp1217, i8* %.tmp1219)
br label %.if.end.1203
.if.false.1203:
br label %.if.end.1203
.if.end.1203:
%.tmp1220 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1221 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1220, i32 0, i32 0
%.tmp1222 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1223 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1222, i32 0, i32 0
%.tmp1224 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1223
%.tmp1225 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1224, i32 0, i32 5
%.tmp1226 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1225
store %m231$.Token.type* %.tmp1226, %m231$.Token.type** %.tmp1221
%.tmp1227 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1228 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1227, i32 0, i32 0
%.tmp1229 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1228
%.tmp1230 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1229, i32 0, i32 1
%.tmp1231 = load i8*, i8** %.tmp1230
%.tmp1233 = getelementptr [2 x i8], [2 x i8]*@.str1232, i32 0, i32 0
%.tmp1234 = call i32(i8*,i8*) @strcmp(i8* %.tmp1231, i8* %.tmp1233)
%.tmp1235 = icmp ne i32 %.tmp1234, 0
br i1 %.tmp1235, label %.if.true.1236, label %.if.false.1236
.if.true.1236:
%.tmp1237 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1238 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1237, i32 0, i32 0
%.tmp1239 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1238
%.tmp1240 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1239, i32 0, i32 1
%.tmp1241 = load i8*, i8** %.tmp1240
%.tmp1242 = call i32(i8*,...) @printf(i8* %.tmp1241)
%.tmp1243 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1245 = getelementptr [27 x i8], [27 x i8]*@.str1244, i32 0, i32 0
call void(%m812$.ParsingContext.type*,i8*) @m812$parser_error.v.m812$.ParsingContext.typep.cp(%m812$.ParsingContext.type* %.tmp1243, i8* %.tmp1245)
br label %.if.end.1236
.if.false.1236:
br label %.if.end.1236
.if.end.1236:
%.tmp1246 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1247 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1246, i32 0, i32 0
%.tmp1248 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1249 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1248, i32 0, i32 0
%.tmp1250 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1249
%.tmp1251 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1250, i32 0, i32 5
%.tmp1252 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1251
store %m231$.Token.type* %.tmp1252, %m231$.Token.type** %.tmp1247
%.tmp1253 = getelementptr %m812$.Rule.type, %m812$.Rule.type* null, i32 1
%.tmp1254 = ptrtoint %m812$.Rule.type* %.tmp1253 to i32
%.tmp1255 = call i8*(i32) @malloc(i32 %.tmp1254)
%.tmp1256 = bitcast i8* %.tmp1255 to %m812$.Rule.type*
%rule.1257 = alloca %m812$.Rule.type*
store %m812$.Rule.type* %.tmp1256, %m812$.Rule.type** %rule.1257
%.tmp1258 = load %m812$.Rule.type*, %m812$.Rule.type** %rule.1257
%.tmp1259 = getelementptr %m812$.Rule.type, %m812$.Rule.type* %.tmp1258, i32 0, i32 0
%.tmp1260 = load i8*, i8** %rule_name.1193
store i8* %.tmp1260, i8** %.tmp1259
%.tmp1261 = load %m812$.Rule.type*, %m812$.Rule.type** %rule.1257
%.tmp1262 = getelementptr %m812$.Rule.type, %m812$.Rule.type* %.tmp1261, i32 0, i32 1
%.tmp1263 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1264 = call %m812$.Matcher.type*(%m812$.ParsingContext.type*) @m812$parse_matcher.m812$.Matcher.typep.m812$.ParsingContext.typep(%m812$.ParsingContext.type* %.tmp1263)
store %m812$.Matcher.type* %.tmp1264, %m812$.Matcher.type** %.tmp1262
%.tmp1265 = load %m812$.Rule.type*, %m812$.Rule.type** %rule.1257
ret %m812$.Rule.type* %.tmp1265
}
define void @m812$parser_error.v.m812$.ParsingContext.typep.cp(%m812$.ParsingContext.type* %.ctx.arg, i8* %.error.arg) {
%ctx = alloca %m812$.ParsingContext.type*
store %m812$.ParsingContext.type* %.ctx.arg, %m812$.ParsingContext.type** %ctx
%error = alloca i8*
store i8* %.error.arg, i8** %error
%.tmp1266 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1267 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1266, i32 0, i32 0
%.tmp1268 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1267
%.tmp1269 = load i8*, i8** %error
%.tmp1270 = call %m230$.Error.type*(%m231$.Token.type*,i8*) @m230$from.m230$.Error.typep.m231$.Token.typep.cp(%m231$.Token.type* %.tmp1268, i8* %.tmp1269)
%e.1271 = alloca %m230$.Error.type*
store %m230$.Error.type* %.tmp1270, %m230$.Error.type** %e.1271
%.tmp1272 = load %m230$.Error.type*, %m230$.Error.type** %e.1271
call void(%m230$.Error.type*) @m230$report.v.m230$.Error.typep(%m230$.Error.type* %.tmp1272)
call void(i32) @exit(i32 1)
ret void
}
define %m812$.Rule.type** @m812$parse_grammar.m812$.Rule.typepp.m812$.ParsingContext.typep(%m812$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m812$.ParsingContext.type*
store %m812$.ParsingContext.type* %.ctx.arg, %m812$.ParsingContext.type** %ctx
%max_rules.1273 = alloca i32
store i32 40, i32* %max_rules.1273
%.tmp1274 = load i32, i32* @ptr_size
%.tmp1275 = load i32, i32* %max_rules.1273
%.tmp1276 = mul i32 %.tmp1274, %.tmp1275
%.tmp1277 = call i8*(i32) @malloc(i32 %.tmp1276)
%.tmp1278 = bitcast i8* %.tmp1277 to %m812$.Rule.type**
%grammar.1279 = alloca %m812$.Rule.type**
store %m812$.Rule.type** %.tmp1278, %m812$.Rule.type*** %grammar.1279
%i.1281 = alloca i32
store i32 0, i32* %i.1281
br label %.for.start.1280
.for.start.1280:
%.tmp1282 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1283 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1282, i32 0, i32 0
%.tmp1284 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1283
%.tmp1285 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1284, i32 0, i32 0
%.tmp1286 = load i8*, i8** %.tmp1285
%.tmp1288 = getelementptr [4 x i8], [4 x i8]*@.str1287, i32 0, i32 0
%.tmp1289 = call i32(i8*,i8*) @strcmp(i8* %.tmp1286, i8* %.tmp1288)
%.tmp1290 = icmp ne i32 %.tmp1289, 0
br i1 %.tmp1290, label %.for.continue.1280, label %.for.end.1280
.for.continue.1280:
%.tmp1291 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1292 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1291, i32 0, i32 0
%.tmp1293 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1292
%.tmp1294 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1293, i32 0, i32 0
%.tmp1295 = load i8*, i8** %.tmp1294
%.tmp1297 = getelementptr [3 x i8], [3 x i8]*@.str1296, i32 0, i32 0
%.tmp1298 = call i32(i8*,i8*) @strcmp(i8* %.tmp1295, i8* %.tmp1297)
%.tmp1299 = icmp ne i32 %.tmp1298, 0
br i1 %.tmp1299, label %.if.true.1300, label %.if.false.1300
.if.true.1300:
%.tmp1301 = load i32, i32* %i.1281
%.tmp1302 = load %m812$.Rule.type**, %m812$.Rule.type*** %grammar.1279
%.tmp1303 = getelementptr %m812$.Rule.type*, %m812$.Rule.type** %.tmp1302, i32 %.tmp1301
%.tmp1304 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1305 = call %m812$.Rule.type*(%m812$.ParsingContext.type*) @m812$parse_rule.m812$.Rule.typep.m812$.ParsingContext.typep(%m812$.ParsingContext.type* %.tmp1304)
store %m812$.Rule.type* %.tmp1305, %m812$.Rule.type** %.tmp1303
%.tmp1306 = load i32, i32* %i.1281
%.tmp1307 = add i32 %.tmp1306, 1
store i32 %.tmp1307, i32* %i.1281
br label %.if.end.1300
.if.false.1300:
%.tmp1308 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1309 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1308, i32 0, i32 0
%.tmp1310 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %ctx
%.tmp1311 = getelementptr %m812$.ParsingContext.type, %m812$.ParsingContext.type* %.tmp1310, i32 0, i32 0
%.tmp1312 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1311
%.tmp1313 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1312, i32 0, i32 5
%.tmp1314 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1313
store %m231$.Token.type* %.tmp1314, %m231$.Token.type** %.tmp1309
br label %.if.end.1300
.if.end.1300:
br label %.for.start.1280
.for.end.1280:
%.tmp1315 = load %m812$.Rule.type**, %m812$.Rule.type*** %grammar.1279
%.tmp1316 = bitcast %m812$.Rule.type** %.tmp1315 to %m812$.Rule.type**
ret %m812$.Rule.type** %.tmp1316
}
%m812$.Node.type = type {i8*,i8*,i8*,i32,i32,%m812$.Node.type*,%m812$.Node.type*,%m812$.Node.type*}
define %m812$.Node.type* @m812$new_node.m812$.Node.typep.m231$.Token.typep.cp.cp(%m231$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg) {
%t = alloca %m231$.Token.type*
store %m231$.Token.type* %.t.arg, %m231$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp1317 = getelementptr %m812$.Node.type, %m812$.Node.type* null, i32 1
%.tmp1318 = ptrtoint %m812$.Node.type* %.tmp1317 to i32
%.tmp1319 = call i8*(i32) @malloc(i32 %.tmp1318)
%.tmp1320 = bitcast i8* %.tmp1319 to %m812$.Node.type*
%node.1321 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp1320, %m812$.Node.type** %node.1321
%.tmp1322 = load %m812$.Node.type*, %m812$.Node.type** %node.1321
%.tmp1323 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1322, i32 0, i32 0
%.tmp1324 = load i8*, i8** %type
store i8* %.tmp1324, i8** %.tmp1323
%.tmp1325 = load %m812$.Node.type*, %m812$.Node.type** %node.1321
%.tmp1326 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1325, i32 0, i32 1
%.tmp1327 = load i8*, i8** %value
store i8* %.tmp1327, i8** %.tmp1326
%.tmp1328 = load %m812$.Node.type*, %m812$.Node.type** %node.1321
%.tmp1329 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1328, i32 0, i32 3
%.tmp1330 = load %m231$.Token.type*, %m231$.Token.type** %t
%.tmp1331 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1330, i32 0, i32 2
%.tmp1332 = load i32, i32* %.tmp1331
store i32 %.tmp1332, i32* %.tmp1329
%.tmp1333 = load %m812$.Node.type*, %m812$.Node.type** %node.1321
%.tmp1334 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1333, i32 0, i32 2
%.tmp1335 = load %m231$.Token.type*, %m231$.Token.type** %t
%.tmp1336 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1335, i32 0, i32 4
%.tmp1337 = load i8*, i8** %.tmp1336
store i8* %.tmp1337, i8** %.tmp1334
%.tmp1338 = load %m812$.Node.type*, %m812$.Node.type** %node.1321
%.tmp1339 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1338, i32 0, i32 4
%.tmp1340 = load %m231$.Token.type*, %m231$.Token.type** %t
%.tmp1341 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1340, i32 0, i32 3
%.tmp1342 = load i32, i32* %.tmp1341
store i32 %.tmp1342, i32* %.tmp1339
%.tmp1343 = load %m812$.Node.type*, %m812$.Node.type** %node.1321
%.tmp1344 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1343, i32 0, i32 5
store %m812$.Node.type* null, %m812$.Node.type** %.tmp1344
%.tmp1345 = load %m812$.Node.type*, %m812$.Node.type** %node.1321
%.tmp1346 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1345, i32 0, i32 7
store %m812$.Node.type* null, %m812$.Node.type** %.tmp1346
%.tmp1347 = load %m812$.Node.type*, %m812$.Node.type** %node.1321
%.tmp1348 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1347, i32 0, i32 6
store %m812$.Node.type* null, %m812$.Node.type** %.tmp1348
%.tmp1349 = load %m812$.Node.type*, %m812$.Node.type** %node.1321
ret %m812$.Node.type* %.tmp1349
}
define void @m812$child_append.v.m812$.Node.typep.m812$.Node.typep(%m812$.Node.type* %.parent.arg, %m812$.Node.type* %.child.arg) {
%parent = alloca %m812$.Node.type*
store %m812$.Node.type* %.parent.arg, %m812$.Node.type** %parent
%child = alloca %m812$.Node.type*
store %m812$.Node.type* %.child.arg, %m812$.Node.type** %child
%.tmp1350 = load %m812$.Node.type*, %m812$.Node.type** %parent
%.tmp1351 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1350, i32 0, i32 6
%.tmp1352 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1351
%.tmp1353 = icmp eq %m812$.Node.type* %.tmp1352, null
br i1 %.tmp1353, label %.if.true.1354, label %.if.false.1354
.if.true.1354:
%.tmp1355 = load %m812$.Node.type*, %m812$.Node.type** %parent
%.tmp1356 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1355, i32 0, i32 6
%.tmp1357 = load %m812$.Node.type*, %m812$.Node.type** %child
store %m812$.Node.type* %.tmp1357, %m812$.Node.type** %.tmp1356
br label %.if.end.1354
.if.false.1354:
%.tmp1358 = load %m812$.Node.type*, %m812$.Node.type** %parent
%.tmp1359 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1358, i32 0, i32 6
%.tmp1360 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1359
%c.1361 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp1360, %m812$.Node.type** %c.1361
br label %.for.start.1362
.for.start.1362:
%.tmp1363 = load %m812$.Node.type*, %m812$.Node.type** %c.1361
%.tmp1364 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1363, i32 0, i32 7
%.tmp1365 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1364
%.tmp1366 = icmp ne %m812$.Node.type* %.tmp1365, null
br i1 %.tmp1366, label %.for.continue.1362, label %.for.end.1362
.for.continue.1362:
%.tmp1367 = load %m812$.Node.type*, %m812$.Node.type** %c.1361
%.tmp1368 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1367, i32 0, i32 7
%.tmp1369 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1368
store %m812$.Node.type* %.tmp1369, %m812$.Node.type** %c.1361
br label %.for.start.1362
.for.end.1362:
%.tmp1370 = load %m812$.Node.type*, %m812$.Node.type** %c.1361
%.tmp1371 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1370, i32 0, i32 7
%.tmp1372 = load %m812$.Node.type*, %m812$.Node.type** %child
store %m812$.Node.type* %.tmp1372, %m812$.Node.type** %.tmp1371
br label %.if.end.1354
.if.end.1354:
%.tmp1373 = load %m812$.Node.type*, %m812$.Node.type** %child
%.tmp1374 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1373, i32 0, i32 7
store %m812$.Node.type* null, %m812$.Node.type** %.tmp1374
ret void
}
define void @m812$child_pop.v.m812$.Node.typep(%m812$.Node.type* %.parent.arg) {
%parent = alloca %m812$.Node.type*
store %m812$.Node.type* %.parent.arg, %m812$.Node.type** %parent
%.tmp1375 = load %m812$.Node.type*, %m812$.Node.type** %parent
%.tmp1376 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1375, i32 0, i32 6
%.tmp1377 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1376
%.tmp1378 = icmp eq %m812$.Node.type* %.tmp1377, null
br i1 %.tmp1378, label %.if.true.1379, label %.if.false.1379
.if.true.1379:
ret void
br label %.if.end.1379
.if.false.1379:
br label %.if.end.1379
.if.end.1379:
%.tmp1380 = load %m812$.Node.type*, %m812$.Node.type** %parent
%.tmp1381 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1380, i32 0, i32 6
%.tmp1382 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1381
%c.1383 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp1382, %m812$.Node.type** %c.1383
%.tmp1384 = load %m812$.Node.type*, %m812$.Node.type** %c.1383
%.tmp1385 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1384, i32 0, i32 7
%.tmp1386 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1385
%.tmp1387 = icmp eq %m812$.Node.type* %.tmp1386, null
br i1 %.tmp1387, label %.if.true.1388, label %.if.false.1388
.if.true.1388:
%.tmp1389 = load %m812$.Node.type*, %m812$.Node.type** %c.1383
%.tmp1390 = bitcast %m812$.Node.type* %.tmp1389 to i8*
call void(i8*) @free(i8* %.tmp1390)
%.tmp1391 = load %m812$.Node.type*, %m812$.Node.type** %parent
%.tmp1392 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1391, i32 0, i32 6
store %m812$.Node.type* null, %m812$.Node.type** %.tmp1392
ret void
br label %.if.end.1388
.if.false.1388:
br label %.if.end.1388
.if.end.1388:
br label %.for.start.1393
.for.start.1393:
%.tmp1394 = load %m812$.Node.type*, %m812$.Node.type** %c.1383
%.tmp1395 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1394, i32 0, i32 7
%.tmp1396 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1395
%.tmp1397 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1396, i32 0, i32 7
%.tmp1398 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1397
%.tmp1399 = icmp ne %m812$.Node.type* %.tmp1398, null
br i1 %.tmp1399, label %.for.continue.1393, label %.for.end.1393
.for.continue.1393:
%.tmp1400 = load %m812$.Node.type*, %m812$.Node.type** %c.1383
%.tmp1401 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1400, i32 0, i32 7
%.tmp1402 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1401
store %m812$.Node.type* %.tmp1402, %m812$.Node.type** %c.1383
br label %.for.start.1393
.for.end.1393:
%.tmp1403 = load %m812$.Node.type*, %m812$.Node.type** %c.1383
%.tmp1404 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1403, i32 0, i32 7
%.tmp1405 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1404
%.tmp1406 = bitcast %m812$.Node.type* %.tmp1405 to i8*
call void(i8*) @free(i8* %.tmp1406)
%.tmp1407 = load %m812$.Node.type*, %m812$.Node.type** %c.1383
%.tmp1408 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1407, i32 0, i32 7
store %m812$.Node.type* null, %m812$.Node.type** %.tmp1408
ret void
}
%m812$.AstContext.type = type {%m231$.Token.type*,%m812$.Rule.type**}
define %m812$.Rule.type* @m812$_find_rule.m812$.Rule.typep.m812$.Rule.typepp.cp(%m812$.Rule.type** %.grammar.arg, i8* %.rule_name.arg) {
%grammar = alloca %m812$.Rule.type**
store %m812$.Rule.type** %.grammar.arg, %m812$.Rule.type*** %grammar
%rule_name = alloca i8*
store i8* %.rule_name.arg, i8** %rule_name
%i.1410 = alloca i32
store i32 0, i32* %i.1410
br label %.for.start.1409
.for.start.1409:
br i1 1, label %.for.continue.1409, label %.for.end.1409
.for.continue.1409:
%.tmp1411 = load i32, i32* %i.1410
%.tmp1412 = load %m812$.Rule.type**, %m812$.Rule.type*** %grammar
%.tmp1413 = getelementptr %m812$.Rule.type*, %m812$.Rule.type** %.tmp1412, i32 %.tmp1411
%.tmp1414 = load %m812$.Rule.type*, %m812$.Rule.type** %.tmp1413
%rule.1415 = alloca %m812$.Rule.type*
store %m812$.Rule.type* %.tmp1414, %m812$.Rule.type** %rule.1415
%.tmp1416 = load %m812$.Rule.type*, %m812$.Rule.type** %rule.1415
%.tmp1417 = getelementptr %m812$.Rule.type, %m812$.Rule.type* %.tmp1416, i32 0, i32 0
%.tmp1418 = load i8*, i8** %.tmp1417
%.tmp1419 = load i8*, i8** %rule_name
%.tmp1420 = call i32(i8*,i8*) @strcmp(i8* %.tmp1418, i8* %.tmp1419)
%.tmp1421 = icmp eq i32 %.tmp1420, 0
br i1 %.tmp1421, label %.if.true.1422, label %.if.false.1422
.if.true.1422:
%.tmp1423 = load %m812$.Rule.type*, %m812$.Rule.type** %rule.1415
ret %m812$.Rule.type* %.tmp1423
br label %.if.end.1422
.if.false.1422:
br label %.if.end.1422
.if.end.1422:
%.tmp1424 = load i32, i32* %i.1410
%.tmp1425 = add i32 %.tmp1424, 1
store i32 %.tmp1425, i32* %i.1410
br label %.for.start.1409
.for.end.1409:
%.tmp1426 = bitcast ptr null to %m812$.Rule.type*
ret %m812$.Rule.type* %.tmp1426
}
%m812$.ParseResult.type = type {%m230$.Error.type*,%m812$.Node.type*}
define %m230$.Error.type* @m812$parse_query.m230$.Error.typep.m812$.AstContext.typep.m812$.Matcher.typep.m812$.Node.typep(%m812$.AstContext.type* %.c.arg, %m812$.Matcher.type* %.m.arg, %m812$.Node.type* %.base.arg) {
%c = alloca %m812$.AstContext.type*
store %m812$.AstContext.type* %.c.arg, %m812$.AstContext.type** %c
%m = alloca %m812$.Matcher.type*
store %m812$.Matcher.type* %.m.arg, %m812$.Matcher.type** %m
%base = alloca %m812$.Node.type*
store %m812$.Node.type* %.base.arg, %m812$.Node.type** %base
%child.1427 = alloca %m812$.Node.type*
store %m812$.Node.type* null, %m812$.Node.type** %child.1427
%.tmp1428 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1429 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1428, i32 0, i32 0
%.tmp1430 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1429
%start_token.1431 = alloca %m231$.Token.type*
store %m231$.Token.type* %.tmp1430, %m231$.Token.type** %start_token.1431
%new_children.1432 = alloca i32
store i32 0, i32* %new_children.1432
%.tmp1433 = bitcast ptr null to %m230$.Error.type*
%err.1434 = alloca %m230$.Error.type*
store %m230$.Error.type* %.tmp1433, %m230$.Error.type** %err.1434
%.tmp1436 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m
%.tmp1437 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1436, i32 0, i32 0
%.tmp1438 = load %m812$.Query.type*, %m812$.Query.type** %.tmp1437
%q.1439 = alloca %m812$.Query.type*
store %m812$.Query.type* %.tmp1438, %m812$.Query.type** %q.1439
br label %.for.start.1435
.for.start.1435:
%.tmp1440 = load %m812$.Query.type*, %m812$.Query.type** %q.1439
%.tmp1441 = icmp ne %m812$.Query.type* %.tmp1440, null
%.tmp1442 = load %m230$.Error.type*, %m230$.Error.type** %err.1434
%.tmp1443 = icmp eq %m230$.Error.type* %.tmp1442, null
%.tmp1444 = and i1 %.tmp1441, %.tmp1443
br i1 %.tmp1444, label %.for.continue.1435, label %.for.end.1435
.for.continue.1435:
%.tmp1445 = load %m812$.Query.type*, %m812$.Query.type** %q.1439
%.tmp1446 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1445, i32 0, i32 0
%.tmp1447 = load i8, i8* %.tmp1446
%.tmp1448 = icmp eq i8 %.tmp1447, 118
br i1 %.tmp1448, label %.if.true.1449, label %.if.false.1449
.if.true.1449:
%.tmp1450 = load %m812$.Query.type*, %m812$.Query.type** %q.1439
%.tmp1451 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1450, i32 0, i32 1
%.tmp1452 = load i8*, i8** %.tmp1451
%.tmp1453 = call i32(i8*) @strlen(i8* %.tmp1452)
%.tmp1454 = sub i32 %.tmp1453, 2
%qv_len.1455 = alloca i32
store i32 %.tmp1454, i32* %qv_len.1455
%.tmp1456 = load i32, i32* %qv_len.1455
%.tmp1457 = add i32 %.tmp1456, 1
%.tmp1458 = call i8*(i32) @malloc(i32 %.tmp1457)
%tmp_buff.1459 = alloca i8*
store i8* %.tmp1458, i8** %tmp_buff.1459
%.tmp1460 = load %m812$.Query.type*, %m812$.Query.type** %q.1439
%.tmp1461 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1460, i32 0, i32 1
%.tmp1462 = load i8*, i8** %.tmp1461
%.tmp1464 = getelementptr [8 x i8], [8 x i8]*@.str1463, i32 0, i32 0
%.tmp1465 = load i8*, i8** %tmp_buff.1459
%.tmp1466 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1462, i8* %.tmp1464, i8* %.tmp1465)
%.tmp1467 = load i8*, i8** %tmp_buff.1459
%.tmp1468 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1469 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1468, i32 0, i32 0
%.tmp1470 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1469
%.tmp1471 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1470, i32 0, i32 1
%.tmp1472 = load i8*, i8** %.tmp1471
%.tmp1473 = load i32, i32* %qv_len.1455
%.tmp1474 = call i32(i8*,i8*,i32) @strncmp(i8* %.tmp1467, i8* %.tmp1472, i32 %.tmp1473)
%.tmp1475 = icmp eq i32 %.tmp1474, 0
%.tmp1476 = load i32, i32* %qv_len.1455
%.tmp1477 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1478 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1477, i32 0, i32 0
%.tmp1479 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1478
%.tmp1480 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1479, i32 0, i32 1
%.tmp1481 = load i8*, i8** %.tmp1480
%.tmp1482 = call i32(i8*) @strlen(i8* %.tmp1481)
%.tmp1483 = icmp eq i32 %.tmp1476, %.tmp1482
%.tmp1484 = and i1 %.tmp1475, %.tmp1483
br i1 %.tmp1484, label %.if.true.1485, label %.if.false.1485
.if.true.1485:
%.tmp1486 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1487 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1486, i32 0, i32 0
%.tmp1488 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1487
%.tmp1489 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1490 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1489, i32 0, i32 0
%.tmp1491 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1490
%.tmp1492 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1491, i32 0, i32 0
%.tmp1493 = load i8*, i8** %.tmp1492
%.tmp1494 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1495 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1494, i32 0, i32 0
%.tmp1496 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1495
%.tmp1497 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1496, i32 0, i32 1
%.tmp1498 = load i8*, i8** %.tmp1497
%.tmp1499 = call %m812$.Node.type*(%m231$.Token.type*,i8*,i8*) @m812$new_node.m812$.Node.typep.m231$.Token.typep.cp.cp(%m231$.Token.type* %.tmp1488, i8* %.tmp1493, i8* %.tmp1498)
store %m812$.Node.type* %.tmp1499, %m812$.Node.type** %child.1427
%.tmp1500 = load %m812$.Node.type*, %m812$.Node.type** %base
%.tmp1501 = load %m812$.Node.type*, %m812$.Node.type** %child.1427
call void(%m812$.Node.type*,%m812$.Node.type*) @m812$child_append.v.m812$.Node.typep.m812$.Node.typep(%m812$.Node.type* %.tmp1500, %m812$.Node.type* %.tmp1501)
%.tmp1502 = load i32, i32* %new_children.1432
%.tmp1503 = add i32 %.tmp1502, 1
store i32 %.tmp1503, i32* %new_children.1432
%.tmp1504 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1505 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1504, i32 0, i32 0
%.tmp1506 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1507 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1506, i32 0, i32 0
%.tmp1508 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1507
%.tmp1509 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1508, i32 0, i32 5
%.tmp1510 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1509
store %m231$.Token.type* %.tmp1510, %m231$.Token.type** %.tmp1505
br label %.if.end.1485
.if.false.1485:
%.tmp1511 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1512 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1511, i32 0, i32 0
%.tmp1513 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1512
%.tmp1514 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1513, i32 0, i32 1
%.tmp1515 = load i8*, i8** %.tmp1514
%token_value.1516 = alloca i8*
store i8* %.tmp1515, i8** %token_value.1516
%.tmp1517 = load i8*, i8** %token_value.1516
%.tmp1518 = icmp eq i8* %.tmp1517, null
br i1 %.tmp1518, label %.if.true.1519, label %.if.false.1519
.if.true.1519:
%.tmp1521 = getelementptr [7 x i8], [7 x i8]*@.str1520, i32 0, i32 0
store i8* %.tmp1521, i8** %token_value.1516
br label %.if.end.1519
.if.false.1519:
br label %.if.end.1519
.if.end.1519:
%.tmp1523 = getelementptr [15 x i8], [15 x i8]*@.str1522, i32 0, i32 0
%err_fmt.1524 = alloca i8*
store i8* %.tmp1523, i8** %err_fmt.1524
%.tmp1526 = getelementptr [31 x i8], [31 x i8]*@.str1525, i32 0, i32 0
%err_msg.1527 = alloca i8*
store i8* %.tmp1526, i8** %err_msg.1527
%.tmp1528 = load i8*, i8** %err_msg.1527
%.tmp1529 = call i32(i8*) @strlen(i8* %.tmp1528)
%.tmp1530 = load i8*, i8** %tmp_buff.1459
%.tmp1531 = call i32(i8*) @strlen(i8* %.tmp1530)
%.tmp1532 = add i32 %.tmp1529, %.tmp1531
%.tmp1533 = load i8*, i8** %token_value.1516
%.tmp1534 = call i32(i8*) @strlen(i8* %.tmp1533)
%.tmp1535 = add i32 %.tmp1532, %.tmp1534
%.tmp1536 = load i8*, i8** %err_fmt.1524
%.tmp1537 = call i32(i8*) @strlen(i8* %.tmp1536)
%.tmp1538 = add i32 %.tmp1535, %.tmp1537
%.tmp1539 = mul i32 3, 2
%.tmp1540 = sub i32 %.tmp1538, %.tmp1539
%.tmp1541 = add i32 %.tmp1540, 1
%err_len.1542 = alloca i32
store i32 %.tmp1541, i32* %err_len.1542
%.tmp1543 = load i32, i32* %err_len.1542
%.tmp1544 = call i8*(i32) @malloc(i32 %.tmp1543)
%err_buf.1545 = alloca i8*
store i8* %.tmp1544, i8** %err_buf.1545
%.tmp1546 = load i8*, i8** %err_buf.1545
%.tmp1547 = load i32, i32* %err_len.1542
%.tmp1548 = load i8*, i8** %err_fmt.1524
%.tmp1549 = load i8*, i8** %err_msg.1527
%.tmp1550 = load i8*, i8** %tmp_buff.1459
%.tmp1551 = load i8*, i8** %token_value.1516
%.tmp1552 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1546, i32 %.tmp1547, i8* %.tmp1548, i8* %.tmp1549, i8* %.tmp1550, i8* %.tmp1551)
%.tmp1553 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1554 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1553, i32 0, i32 0
%.tmp1555 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1554
%.tmp1556 = load i8*, i8** %err_buf.1545
%.tmp1557 = call %m230$.Error.type*(%m231$.Token.type*,i8*) @m230$from.m230$.Error.typep.m231$.Token.typep.cp(%m231$.Token.type* %.tmp1555, i8* %.tmp1556)
store %m230$.Error.type* %.tmp1557, %m230$.Error.type** %err.1434
br label %.if.end.1485
.if.end.1485:
%.tmp1558 = load i8*, i8** %tmp_buff.1459
call void(i8*) @free(i8* %.tmp1558)
br label %.if.end.1449
.if.false.1449:
%.tmp1559 = load %m812$.Query.type*, %m812$.Query.type** %q.1439
%.tmp1560 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1559, i32 0, i32 0
%.tmp1561 = load i8, i8* %.tmp1560
%.tmp1562 = icmp eq i8 %.tmp1561, 116
br i1 %.tmp1562, label %.if.true.1563, label %.if.false.1563
.if.true.1563:
%.tmp1564 = load %m812$.Query.type*, %m812$.Query.type** %q.1439
%.tmp1565 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1564, i32 0, i32 1
%.tmp1566 = load i8*, i8** %.tmp1565
%.tmp1567 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1568 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1567, i32 0, i32 0
%.tmp1569 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1568
%.tmp1570 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1569, i32 0, i32 0
%.tmp1571 = load i8*, i8** %.tmp1570
%.tmp1572 = call i32(i8*,i8*) @strcmp(i8* %.tmp1566, i8* %.tmp1571)
%.tmp1573 = icmp eq i32 %.tmp1572, 0
br i1 %.tmp1573, label %.if.true.1574, label %.if.false.1574
.if.true.1574:
%.tmp1575 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1576 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1575, i32 0, i32 0
%.tmp1577 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1576
%.tmp1578 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1579 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1578, i32 0, i32 0
%.tmp1580 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1579
%.tmp1581 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1580, i32 0, i32 0
%.tmp1582 = load i8*, i8** %.tmp1581
%.tmp1583 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1584 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1583, i32 0, i32 0
%.tmp1585 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1584
%.tmp1586 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1585, i32 0, i32 1
%.tmp1587 = load i8*, i8** %.tmp1586
%.tmp1588 = call %m812$.Node.type*(%m231$.Token.type*,i8*,i8*) @m812$new_node.m812$.Node.typep.m231$.Token.typep.cp.cp(%m231$.Token.type* %.tmp1577, i8* %.tmp1582, i8* %.tmp1587)
store %m812$.Node.type* %.tmp1588, %m812$.Node.type** %child.1427
%.tmp1589 = load %m812$.Node.type*, %m812$.Node.type** %base
%.tmp1590 = load %m812$.Node.type*, %m812$.Node.type** %child.1427
call void(%m812$.Node.type*,%m812$.Node.type*) @m812$child_append.v.m812$.Node.typep.m812$.Node.typep(%m812$.Node.type* %.tmp1589, %m812$.Node.type* %.tmp1590)
%.tmp1591 = load i32, i32* %new_children.1432
%.tmp1592 = add i32 %.tmp1591, 1
store i32 %.tmp1592, i32* %new_children.1432
%.tmp1593 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1594 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1593, i32 0, i32 0
%.tmp1595 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1596 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1595, i32 0, i32 0
%.tmp1597 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1596
%.tmp1598 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1597, i32 0, i32 5
%.tmp1599 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1598
store %m231$.Token.type* %.tmp1599, %m231$.Token.type** %.tmp1594
br label %.if.end.1574
.if.false.1574:
%.tmp1601 = getelementptr [13 x i8], [13 x i8]*@.str1600, i32 0, i32 0
%err_fmt_t.1602 = alloca i8*
store i8* %.tmp1601, i8** %err_fmt_t.1602
%.tmp1604 = getelementptr [30 x i8], [30 x i8]*@.str1603, i32 0, i32 0
%err_msg_t.1605 = alloca i8*
store i8* %.tmp1604, i8** %err_msg_t.1605
%.tmp1606 = load i8*, i8** %err_fmt_t.1602
%.tmp1607 = call i32(i8*) @strlen(i8* %.tmp1606)
%.tmp1608 = load i8*, i8** %err_msg_t.1605
%.tmp1609 = call i32(i8*) @strlen(i8* %.tmp1608)
%.tmp1610 = add i32 %.tmp1607, %.tmp1609
%.tmp1611 = load %m812$.Query.type*, %m812$.Query.type** %q.1439
%.tmp1612 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1611, i32 0, i32 1
%.tmp1613 = load i8*, i8** %.tmp1612
%.tmp1614 = call i32(i8*) @strlen(i8* %.tmp1613)
%.tmp1615 = add i32 %.tmp1610, %.tmp1614
%.tmp1616 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1617 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1616, i32 0, i32 0
%.tmp1618 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1617
%.tmp1619 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1618, i32 0, i32 0
%.tmp1620 = load i8*, i8** %.tmp1619
%.tmp1621 = call i32(i8*) @strlen(i8* %.tmp1620)
%.tmp1622 = add i32 %.tmp1615, %.tmp1621
%err_len_t.1623 = alloca i32
store i32 %.tmp1622, i32* %err_len_t.1623
%.tmp1624 = load i32, i32* %err_len_t.1623
%.tmp1625 = call i8*(i32) @malloc(i32 %.tmp1624)
%err_buf_t.1626 = alloca i8*
store i8* %.tmp1625, i8** %err_buf_t.1626
%.tmp1627 = load i8*, i8** %err_buf_t.1626
%.tmp1628 = load i32, i32* %err_len_t.1623
%.tmp1629 = load i8*, i8** %err_fmt_t.1602
%.tmp1630 = load i8*, i8** %err_msg_t.1605
%.tmp1631 = load %m812$.Query.type*, %m812$.Query.type** %q.1439
%.tmp1632 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1631, i32 0, i32 1
%.tmp1633 = load i8*, i8** %.tmp1632
%.tmp1634 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1635 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1634, i32 0, i32 0
%.tmp1636 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1635
%.tmp1637 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1636, i32 0, i32 0
%.tmp1638 = load i8*, i8** %.tmp1637
%.tmp1639 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1627, i32 %.tmp1628, i8* %.tmp1629, i8* %.tmp1630, i8* %.tmp1633, i8* %.tmp1638)
%.tmp1640 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1641 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1640, i32 0, i32 0
%.tmp1642 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1641
%.tmp1643 = load i8*, i8** %err_buf_t.1626
%.tmp1644 = call %m230$.Error.type*(%m231$.Token.type*,i8*) @m230$from.m230$.Error.typep.m231$.Token.typep.cp(%m231$.Token.type* %.tmp1642, i8* %.tmp1643)
store %m230$.Error.type* %.tmp1644, %m230$.Error.type** %err.1434
br label %.if.end.1574
.if.end.1574:
br label %.if.end.1563
.if.false.1563:
%.tmp1645 = load %m812$.Query.type*, %m812$.Query.type** %q.1439
%.tmp1646 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1645, i32 0, i32 0
%.tmp1647 = load i8, i8* %.tmp1646
%.tmp1648 = icmp eq i8 %.tmp1647, 97
br i1 %.tmp1648, label %.if.true.1649, label %.if.false.1649
.if.true.1649:
%.tmp1650 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1651 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1650, i32 0, i32 1
%.tmp1652 = load %m812$.Rule.type**, %m812$.Rule.type*** %.tmp1651
%.tmp1653 = load %m812$.Query.type*, %m812$.Query.type** %q.1439
%.tmp1654 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1653, i32 0, i32 1
%.tmp1655 = load i8*, i8** %.tmp1654
%.tmp1656 = call %m812$.Rule.type*(%m812$.Rule.type**,i8*) @m812$_find_rule.m812$.Rule.typep.m812$.Rule.typepp.cp(%m812$.Rule.type** %.tmp1652, i8* %.tmp1655)
%alias_rule.1657 = alloca %m812$.Rule.type*
store %m812$.Rule.type* %.tmp1656, %m812$.Rule.type** %alias_rule.1657
%.tmp1658 = load %m812$.Rule.type*, %m812$.Rule.type** %alias_rule.1657
%.tmp1659 = icmp eq %m812$.Rule.type* %.tmp1658, null
br i1 %.tmp1659, label %.if.true.1660, label %.if.false.1660
.if.true.1660:
%.tmp1661 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1662 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1661, i32 0, i32 0
%.tmp1663 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1662
%.tmp1665 = getelementptr [30 x i8], [30 x i8]*@.str1664, i32 0, i32 0
%.tmp1666 = call %m230$.Error.type*(%m231$.Token.type*,i8*) @m230$from.m230$.Error.typep.m231$.Token.typep.cp(%m231$.Token.type* %.tmp1663, i8* %.tmp1665)
store %m230$.Error.type* %.tmp1666, %m230$.Error.type** %err.1434
br label %.if.end.1660
.if.false.1660:
%.tmp1667 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1668 = load %m812$.Rule.type*, %m812$.Rule.type** %alias_rule.1657
%.tmp1669 = call %m812$.ParseResult.type*(%m812$.AstContext.type*,%m812$.Rule.type*) @m812$parse_to_ast.m812$.ParseResult.typep.m812$.AstContext.typep.m812$.Rule.typep(%m812$.AstContext.type* %.tmp1667, %m812$.Rule.type* %.tmp1668)
%parse_result.1670 = alloca %m812$.ParseResult.type*
store %m812$.ParseResult.type* %.tmp1669, %m812$.ParseResult.type** %parse_result.1670
%.tmp1671 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %parse_result.1670
%.tmp1672 = getelementptr %m812$.ParseResult.type, %m812$.ParseResult.type* %.tmp1671, i32 0, i32 0
%.tmp1673 = load %m230$.Error.type*, %m230$.Error.type** %.tmp1672
%.tmp1674 = icmp ne %m230$.Error.type* %.tmp1673, null
br i1 %.tmp1674, label %.if.true.1675, label %.if.false.1675
.if.true.1675:
%.tmp1676 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %parse_result.1670
%.tmp1677 = getelementptr %m812$.ParseResult.type, %m812$.ParseResult.type* %.tmp1676, i32 0, i32 0
%.tmp1678 = load %m230$.Error.type*, %m230$.Error.type** %.tmp1677
store %m230$.Error.type* %.tmp1678, %m230$.Error.type** %err.1434
br label %.if.end.1675
.if.false.1675:
%.tmp1679 = load %m812$.Node.type*, %m812$.Node.type** %base
%.tmp1680 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %parse_result.1670
%.tmp1681 = getelementptr %m812$.ParseResult.type, %m812$.ParseResult.type* %.tmp1680, i32 0, i32 1
%.tmp1682 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1681
call void(%m812$.Node.type*,%m812$.Node.type*) @m812$child_append.v.m812$.Node.typep.m812$.Node.typep(%m812$.Node.type* %.tmp1679, %m812$.Node.type* %.tmp1682)
%.tmp1683 = load i32, i32* %new_children.1432
%.tmp1684 = add i32 %.tmp1683, 1
store i32 %.tmp1684, i32* %new_children.1432
br label %.if.end.1675
.if.end.1675:
%.tmp1685 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %parse_result.1670
%.tmp1686 = bitcast %m812$.ParseResult.type* %.tmp1685 to i8*
call void(i8*) @free(i8* %.tmp1686)
br label %.if.end.1660
.if.end.1660:
br label %.if.end.1649
.if.false.1649:
%.tmp1688 = getelementptr [41 x i8], [41 x i8]*@.str1687, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp1688)
br label %.if.end.1649
.if.end.1649:
br label %.if.end.1563
.if.end.1563:
br label %.if.end.1449
.if.end.1449:
%.tmp1689 = load %m812$.Query.type*, %m812$.Query.type** %q.1439
%.tmp1690 = getelementptr %m812$.Query.type, %m812$.Query.type* %.tmp1689, i32 0, i32 2
%.tmp1691 = load %m812$.Query.type*, %m812$.Query.type** %.tmp1690
store %m812$.Query.type* %.tmp1691, %m812$.Query.type** %q.1439
br label %.for.start.1435
.for.end.1435:
%.tmp1692 = load %m230$.Error.type*, %m230$.Error.type** %err.1434
%.tmp1693 = icmp ne %m230$.Error.type* %.tmp1692, null
br i1 %.tmp1693, label %.if.true.1694, label %.if.false.1694
.if.true.1694:
%.tmp1695 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1696 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1695, i32 0, i32 0
%.tmp1697 = load %m231$.Token.type*, %m231$.Token.type** %start_token.1431
store %m231$.Token.type* %.tmp1697, %m231$.Token.type** %.tmp1696
%i.1699 = alloca i32
store i32 0, i32* %i.1699
br label %.for.start.1698
.for.start.1698:
%.tmp1700 = load i32, i32* %i.1699
%.tmp1701 = load i32, i32* %new_children.1432
%.tmp1702 = icmp slt i32 %.tmp1700, %.tmp1701
br i1 %.tmp1702, label %.for.continue.1698, label %.for.end.1698
.for.continue.1698:
%.tmp1703 = load %m812$.Node.type*, %m812$.Node.type** %base
call void(%m812$.Node.type*) @m812$child_pop.v.m812$.Node.typep(%m812$.Node.type* %.tmp1703)
%.tmp1704 = load i32, i32* %i.1699
%.tmp1705 = add i32 %.tmp1704, 1
store i32 %.tmp1705, i32* %i.1699
br label %.for.start.1698
.for.end.1698:
br label %.if.end.1694
.if.false.1694:
br label %.if.end.1694
.if.end.1694:
%.tmp1706 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m
%.tmp1707 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1706, i32 0, i32 2
%.tmp1708 = load %m812$.Matcher.type*, %m812$.Matcher.type** %.tmp1707
%.tmp1709 = icmp ne %m812$.Matcher.type* %.tmp1708, null
%.tmp1710 = load %m230$.Error.type*, %m230$.Error.type** %err.1434
%.tmp1711 = icmp ne %m230$.Error.type* %.tmp1710, null
%.tmp1712 = and i1 %.tmp1709, %.tmp1711
br i1 %.tmp1712, label %.if.true.1713, label %.if.false.1713
.if.true.1713:
%.tmp1714 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1715 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m
%.tmp1716 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1715, i32 0, i32 2
%.tmp1717 = load %m812$.Matcher.type*, %m812$.Matcher.type** %.tmp1716
%.tmp1718 = load %m812$.Node.type*, %m812$.Node.type** %base
%.tmp1719 = call %m230$.Error.type*(%m812$.AstContext.type*,%m812$.Matcher.type*,%m812$.Node.type*) @m812$parse_query.m230$.Error.typep.m812$.AstContext.typep.m812$.Matcher.typep.m812$.Node.typep(%m812$.AstContext.type* %.tmp1714, %m812$.Matcher.type* %.tmp1717, %m812$.Node.type* %.tmp1718)
%new_err.1720 = alloca %m230$.Error.type*
store %m230$.Error.type* %.tmp1719, %m230$.Error.type** %new_err.1720
%.tmp1721 = load %m230$.Error.type*, %m230$.Error.type** %new_err.1720
%.tmp1722 = icmp eq %m230$.Error.type* %.tmp1721, null
br i1 %.tmp1722, label %.if.true.1723, label %.if.false.1723
.if.true.1723:
store %m230$.Error.type* null, %m230$.Error.type** %err.1434
br label %.if.end.1723
.if.false.1723:
%.tmp1724 = load %m230$.Error.type*, %m230$.Error.type** %new_err.1720
%.tmp1725 = bitcast %m230$.Error.type* %.tmp1724 to i8*
call void(i8*) @free(i8* %.tmp1725)
br label %.if.end.1723
.if.end.1723:
br label %.if.end.1713
.if.false.1713:
br label %.if.end.1713
.if.end.1713:
%.tmp1726 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m
%.tmp1727 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1726, i32 0, i32 1
%.tmp1728 = load i8, i8* %.tmp1727
%.tmp1729 = icmp eq i8 %.tmp1728, 49
br i1 %.tmp1729, label %.if.true.1730, label %.if.false.1730
.if.true.1730:
br label %.if.end.1730
.if.false.1730:
%.tmp1731 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m
%.tmp1732 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1731, i32 0, i32 1
%.tmp1733 = load i8, i8* %.tmp1732
%.tmp1734 = icmp eq i8 %.tmp1733, 43
%.tmp1735 = load %m230$.Error.type*, %m230$.Error.type** %err.1434
%.tmp1736 = icmp eq %m230$.Error.type* %.tmp1735, null
%.tmp1737 = and i1 %.tmp1734, %.tmp1736
br i1 %.tmp1737, label %.if.true.1738, label %.if.false.1738
.if.true.1738:
%.tmp1739 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1740 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m
%.tmp1741 = load %m812$.Node.type*, %m812$.Node.type** %base
%.tmp1742 = call %m230$.Error.type*(%m812$.AstContext.type*,%m812$.Matcher.type*,%m812$.Node.type*) @m812$parse_query.m230$.Error.typep.m812$.AstContext.typep.m812$.Matcher.typep.m812$.Node.typep(%m812$.AstContext.type* %.tmp1739, %m812$.Matcher.type* %.tmp1740, %m812$.Node.type* %.tmp1741)
store %m230$.Error.type* %.tmp1742, %m230$.Error.type** %err.1434
%.tmp1743 = load %m230$.Error.type*, %m230$.Error.type** %err.1434
%.tmp1744 = icmp ne %m230$.Error.type* %.tmp1743, null
br i1 %.tmp1744, label %.if.true.1745, label %.if.false.1745
.if.true.1745:
%.tmp1746 = load %m230$.Error.type*, %m230$.Error.type** %err.1434
%.tmp1747 = bitcast %m230$.Error.type* %.tmp1746 to i8*
call void(i8*) @free(i8* %.tmp1747)
store %m230$.Error.type* null, %m230$.Error.type** %err.1434
br label %.if.end.1745
.if.false.1745:
%.tmp1748 = bitcast ptr null to %m230$.Error.type*
ret %m230$.Error.type* %.tmp1748
br label %.if.end.1745
.if.end.1745:
br label %.if.end.1738
.if.false.1738:
%.tmp1749 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m
%.tmp1750 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1749, i32 0, i32 1
%.tmp1751 = load i8, i8* %.tmp1750
%.tmp1752 = icmp eq i8 %.tmp1751, 63
%.tmp1753 = load %m230$.Error.type*, %m230$.Error.type** %err.1434
%.tmp1754 = icmp ne %m230$.Error.type* %.tmp1753, null
%.tmp1755 = and i1 %.tmp1752, %.tmp1754
br i1 %.tmp1755, label %.if.true.1756, label %.if.false.1756
.if.true.1756:
%.tmp1757 = load %m230$.Error.type*, %m230$.Error.type** %err.1434
%.tmp1758 = bitcast %m230$.Error.type* %.tmp1757 to i8*
call void(i8*) @free(i8* %.tmp1758)
store %m230$.Error.type* null, %m230$.Error.type** %err.1434
br label %.if.end.1756
.if.false.1756:
%.tmp1759 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m
%.tmp1760 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1759, i32 0, i32 1
%.tmp1761 = load i8, i8* %.tmp1760
%.tmp1762 = icmp eq i8 %.tmp1761, 42
br i1 %.tmp1762, label %.if.true.1763, label %.if.false.1763
.if.true.1763:
%.tmp1764 = load %m230$.Error.type*, %m230$.Error.type** %err.1434
%.tmp1765 = icmp ne %m230$.Error.type* %.tmp1764, null
br i1 %.tmp1765, label %.if.true.1766, label %.if.false.1766
.if.true.1766:
%.tmp1767 = load %m230$.Error.type*, %m230$.Error.type** %err.1434
%.tmp1768 = bitcast %m230$.Error.type* %.tmp1767 to i8*
call void(i8*) @free(i8* %.tmp1768)
store %m230$.Error.type* null, %m230$.Error.type** %err.1434
br label %.if.end.1766
.if.false.1766:
%.tmp1769 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1770 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m
%.tmp1771 = load %m812$.Node.type*, %m812$.Node.type** %base
%.tmp1772 = call %m230$.Error.type*(%m812$.AstContext.type*,%m812$.Matcher.type*,%m812$.Node.type*) @m812$parse_query.m230$.Error.typep.m812$.AstContext.typep.m812$.Matcher.typep.m812$.Node.typep(%m812$.AstContext.type* %.tmp1769, %m812$.Matcher.type* %.tmp1770, %m812$.Node.type* %.tmp1771)
ret %m230$.Error.type* %.tmp1772
br label %.if.end.1766
.if.end.1766:
br label %.if.end.1763
.if.false.1763:
br label %.if.end.1763
.if.end.1763:
br label %.if.end.1756
.if.end.1756:
br label %.if.end.1738
.if.end.1738:
br label %.if.end.1730
.if.end.1730:
%.tmp1773 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m
%.tmp1774 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1773, i32 0, i32 3
%.tmp1775 = load %m812$.Matcher.type*, %m812$.Matcher.type** %.tmp1774
%.tmp1776 = icmp ne %m812$.Matcher.type* %.tmp1775, null
%.tmp1777 = load %m230$.Error.type*, %m230$.Error.type** %err.1434
%.tmp1778 = icmp eq %m230$.Error.type* %.tmp1777, null
%.tmp1779 = and i1 %.tmp1776, %.tmp1778
br i1 %.tmp1779, label %.if.true.1780, label %.if.false.1780
.if.true.1780:
%.tmp1781 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1782 = load %m812$.Matcher.type*, %m812$.Matcher.type** %m
%.tmp1783 = getelementptr %m812$.Matcher.type, %m812$.Matcher.type* %.tmp1782, i32 0, i32 3
%.tmp1784 = load %m812$.Matcher.type*, %m812$.Matcher.type** %.tmp1783
%.tmp1785 = load %m812$.Node.type*, %m812$.Node.type** %base
%.tmp1786 = call %m230$.Error.type*(%m812$.AstContext.type*,%m812$.Matcher.type*,%m812$.Node.type*) @m812$parse_query.m230$.Error.typep.m812$.AstContext.typep.m812$.Matcher.typep.m812$.Node.typep(%m812$.AstContext.type* %.tmp1781, %m812$.Matcher.type* %.tmp1784, %m812$.Node.type* %.tmp1785)
store %m230$.Error.type* %.tmp1786, %m230$.Error.type** %err.1434
br label %.if.end.1780
.if.false.1780:
br label %.if.end.1780
.if.end.1780:
%.tmp1787 = load %m230$.Error.type*, %m230$.Error.type** %err.1434
%.tmp1788 = bitcast %m230$.Error.type* %.tmp1787 to %m230$.Error.type*
ret %m230$.Error.type* %.tmp1788
}
define %m812$.ParseResult.type* @m812$parse_to_ast.m812$.ParseResult.typep.m812$.AstContext.typep.m812$.Rule.typep(%m812$.AstContext.type* %.c.arg, %m812$.Rule.type* %.rule.arg) {
%c = alloca %m812$.AstContext.type*
store %m812$.AstContext.type* %.c.arg, %m812$.AstContext.type** %c
%rule = alloca %m812$.Rule.type*
store %m812$.Rule.type* %.rule.arg, %m812$.Rule.type** %rule
%.tmp1789 = getelementptr %m812$.ParseResult.type, %m812$.ParseResult.type* null, i32 1
%.tmp1790 = ptrtoint %m812$.ParseResult.type* %.tmp1789 to i32
%.tmp1791 = call i8*(i32) @malloc(i32 %.tmp1790)
%.tmp1792 = bitcast i8* %.tmp1791 to %m812$.ParseResult.type*
%res.1793 = alloca %m812$.ParseResult.type*
store %m812$.ParseResult.type* %.tmp1792, %m812$.ParseResult.type** %res.1793
%.tmp1794 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %res.1793
%.tmp1795 = getelementptr %m812$.ParseResult.type, %m812$.ParseResult.type* %.tmp1794, i32 0, i32 0
store %m230$.Error.type* null, %m230$.Error.type** %.tmp1795
%.tmp1796 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %res.1793
%.tmp1797 = getelementptr %m812$.ParseResult.type, %m812$.ParseResult.type* %.tmp1796, i32 0, i32 1
%.tmp1798 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1799 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1798, i32 0, i32 0
%.tmp1800 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1799
%.tmp1801 = load %m812$.Rule.type*, %m812$.Rule.type** %rule
%.tmp1802 = getelementptr %m812$.Rule.type, %m812$.Rule.type* %.tmp1801, i32 0, i32 0
%.tmp1803 = load i8*, i8** %.tmp1802
%.tmp1804 = bitcast ptr null to i8*
%.tmp1805 = call %m812$.Node.type*(%m231$.Token.type*,i8*,i8*) @m812$new_node.m812$.Node.typep.m231$.Token.typep.cp.cp(%m231$.Token.type* %.tmp1800, i8* %.tmp1803, i8* %.tmp1804)
store %m812$.Node.type* %.tmp1805, %m812$.Node.type** %.tmp1797
%.tmp1806 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1807 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %.tmp1806, i32 0, i32 0
%.tmp1808 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1807
%start_match.1809 = alloca %m231$.Token.type*
store %m231$.Token.type* %.tmp1808, %m231$.Token.type** %start_match.1809
%.tmp1810 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %res.1793
%.tmp1811 = getelementptr %m812$.ParseResult.type, %m812$.ParseResult.type* %.tmp1810, i32 0, i32 0
%.tmp1812 = load %m812$.AstContext.type*, %m812$.AstContext.type** %c
%.tmp1813 = load %m812$.Rule.type*, %m812$.Rule.type** %rule
%.tmp1814 = getelementptr %m812$.Rule.type, %m812$.Rule.type* %.tmp1813, i32 0, i32 1
%.tmp1815 = load %m812$.Matcher.type*, %m812$.Matcher.type** %.tmp1814
%.tmp1816 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %res.1793
%.tmp1817 = getelementptr %m812$.ParseResult.type, %m812$.ParseResult.type* %.tmp1816, i32 0, i32 1
%.tmp1818 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1817
%.tmp1819 = call %m230$.Error.type*(%m812$.AstContext.type*,%m812$.Matcher.type*,%m812$.Node.type*) @m812$parse_query.m230$.Error.typep.m812$.AstContext.typep.m812$.Matcher.typep.m812$.Node.typep(%m812$.AstContext.type* %.tmp1812, %m812$.Matcher.type* %.tmp1815, %m812$.Node.type* %.tmp1818)
store %m230$.Error.type* %.tmp1819, %m230$.Error.type** %.tmp1811
%.tmp1820 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %res.1793
ret %m812$.ParseResult.type* %.tmp1820
}
define %m812$.ParseResult.type* @m812$ast.m812$.ParseResult.typep.m812$.Rule.typepp.cp.m231$.Token.typep(%m812$.Rule.type** %.grammar.arg, i8* %.start.arg, %m231$.Token.type* %.tokens.arg) {
%grammar = alloca %m812$.Rule.type**
store %m812$.Rule.type** %.grammar.arg, %m812$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m231$.Token.type*
store %m231$.Token.type* %.tokens.arg, %m231$.Token.type** %tokens
%.tmp1821 = load %m812$.Rule.type**, %m812$.Rule.type*** %grammar
%.tmp1822 = load i8*, i8** %start
%.tmp1823 = call %m812$.Rule.type*(%m812$.Rule.type**,i8*) @m812$_find_rule.m812$.Rule.typep.m812$.Rule.typepp.cp(%m812$.Rule.type** %.tmp1821, i8* %.tmp1822)
%start_matcher.1824 = alloca %m812$.Rule.type*
store %m812$.Rule.type* %.tmp1823, %m812$.Rule.type** %start_matcher.1824
%.tmp1825 = load %m812$.Rule.type*, %m812$.Rule.type** %start_matcher.1824
%.tmp1826 = icmp ne %m812$.Rule.type* %.tmp1825, null
%.tmp1828 = getelementptr [44 x i8], [44 x i8]*@.str1827, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp1826, i8* %.tmp1828)
%c.1829 = alloca %m812$.AstContext.type
%.tmp1830 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %c.1829, i32 0, i32 0
store %m231$.Token.type* null, %m231$.Token.type** %.tmp1830
%.tmp1831 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %c.1829, i32 0, i32 1
store %m812$.Rule.type** null, %m812$.Rule.type*** %.tmp1831
%.tmp1832 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %c.1829, i32 0, i32 0
%.tmp1833 = load %m231$.Token.type*, %m231$.Token.type** %tokens
store %m231$.Token.type* %.tmp1833, %m231$.Token.type** %.tmp1832
%.tmp1834 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %c.1829, i32 0, i32 1
%.tmp1835 = load %m812$.Rule.type**, %m812$.Rule.type*** %grammar
store %m812$.Rule.type** %.tmp1835, %m812$.Rule.type*** %.tmp1834
%.tmp1836 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %c.1829, i32 0
%.tmp1837 = load %m812$.Rule.type*, %m812$.Rule.type** %start_matcher.1824
%.tmp1838 = call %m812$.ParseResult.type*(%m812$.AstContext.type*,%m812$.Rule.type*) @m812$parse_to_ast.m812$.ParseResult.typep.m812$.AstContext.typep.m812$.Rule.typep(%m812$.AstContext.type* %.tmp1836, %m812$.Rule.type* %.tmp1837)
%res.1839 = alloca %m812$.ParseResult.type*
store %m812$.ParseResult.type* %.tmp1838, %m812$.ParseResult.type** %res.1839
%.tmp1840 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %c.1829, i32 0, i32 0
%.tmp1841 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1840
%.tmp1842 = getelementptr %m231$.Token.type, %m231$.Token.type* %.tmp1841, i32 0, i32 0
%.tmp1843 = load i8*, i8** %.tmp1842
%.tmp1845 = getelementptr [4 x i8], [4 x i8]*@.str1844, i32 0, i32 0
%.tmp1846 = call i32(i8*,i8*) @strcmp(i8* %.tmp1843, i8* %.tmp1845)
%.tmp1847 = icmp ne i32 %.tmp1846, 0
%.tmp1848 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %res.1839
%.tmp1849 = getelementptr %m812$.ParseResult.type, %m812$.ParseResult.type* %.tmp1848, i32 0, i32 0
%.tmp1850 = load %m230$.Error.type*, %m230$.Error.type** %.tmp1849
%.tmp1851 = icmp eq %m230$.Error.type* %.tmp1850, null
%.tmp1852 = and i1 %.tmp1847, %.tmp1851
br i1 %.tmp1852, label %.if.true.1853, label %.if.false.1853
.if.true.1853:
%.tmp1854 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %res.1839
%.tmp1855 = getelementptr %m812$.ParseResult.type, %m812$.ParseResult.type* %.tmp1854, i32 0, i32 0
%.tmp1856 = getelementptr %m812$.AstContext.type, %m812$.AstContext.type* %c.1829, i32 0, i32 0
%.tmp1857 = load %m231$.Token.type*, %m231$.Token.type** %.tmp1856
%.tmp1859 = getelementptr [26 x i8], [26 x i8]*@.str1858, i32 0, i32 0
%.tmp1860 = call %m230$.Error.type*(%m231$.Token.type*,i8*) @m230$from.m230$.Error.typep.m231$.Token.typep.cp(%m231$.Token.type* %.tmp1857, i8* %.tmp1859)
store %m230$.Error.type* %.tmp1860, %m230$.Error.type** %.tmp1855
br label %.if.end.1853
.if.false.1853:
br label %.if.end.1853
.if.end.1853:
%.tmp1861 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %res.1839
ret %m812$.ParseResult.type* %.tmp1861
}
define i8* @m1862$node_to_string.cp.m812$.Node.typep(%m812$.Node.type* %.n.arg) {
%n = alloca %m812$.Node.type*
store %m812$.Node.type* %.n.arg, %m812$.Node.type** %n
%.tmp1863 = call %m0$.File.type*() @tmpfile()
%tmp.1864 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp1863, %m0$.File.type** %tmp.1864
%.tmp1865 = load %m812$.Node.type*, %m812$.Node.type** %n
%.tmp1866 = load %m0$.File.type*, %m0$.File.type** %tmp.1864
call void(%m812$.Node.type*,%m0$.File.type*,i32) @m1862$_node_to_string.v.m812$.Node.typep.m0$.File.typep.i(%m812$.Node.type* %.tmp1865, %m0$.File.type* %.tmp1866, i32 1)
%.tmp1867 = load %m0$.File.type*, %m0$.File.type** %tmp.1864
%.tmp1868 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp1867)
%.tmp1869 = load %m0$.File.type*, %m0$.File.type** %tmp.1864
%.tmp1870 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp1869)
%str_len.1871 = alloca i32
store i32 %.tmp1870, i32* %str_len.1871
%.tmp1872 = load %m0$.File.type*, %m0$.File.type** %tmp.1864
%.tmp1873 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp1872)
%tmp_fd.1874 = alloca i32
store i32 %.tmp1873, i32* %tmp_fd.1874
%.tmp1875 = load i32, i32* %tmp_fd.1874
%.tmp1876 = load i32, i32* @SEEK_SET
%.tmp1877 = call i32(i32,i32,i32) @lseek(i32 %.tmp1875, i32 0, i32 %.tmp1876)
%.tmp1878 = load i32, i32* %str_len.1871
%.tmp1879 = call i8*(i32) @malloc(i32 %.tmp1878)
%buf.1880 = alloca i8*
store i8* %.tmp1879, i8** %buf.1880
%.tmp1881 = load i32, i32* %tmp_fd.1874
%.tmp1882 = load i8*, i8** %buf.1880
%.tmp1883 = load i32, i32* %str_len.1871
%.tmp1884 = call i32(i32,i8*,i32) @read(i32 %.tmp1881, i8* %.tmp1882, i32 %.tmp1883)
%read.1885 = alloca i32
store i32 %.tmp1884, i32* %read.1885
%.tmp1886 = load i32, i32* %read.1885
%.tmp1887 = load i32, i32* %str_len.1871
%.tmp1888 = icmp ne i32 %.tmp1886, %.tmp1887
br i1 %.tmp1888, label %.if.true.1889, label %.if.false.1889
.if.true.1889:
%.tmp1890 = load i8*, i8** %buf.1880
call void(i8*) @free(i8* %.tmp1890)
store i8* null, i8** %buf.1880
br label %.if.end.1889
.if.false.1889:
br label %.if.end.1889
.if.end.1889:
%.tmp1891 = load i8*, i8** %buf.1880
ret i8* %.tmp1891
}
define void @m1862$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1892 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1894 = getelementptr [2 x i8], [2 x i8]*@.str1893, i32 0, i32 0
%.tmp1895 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1892, i8* %.tmp1894)
%i.1897 = alloca i32
store i32 0, i32* %i.1897
br label %.for.start.1896
.for.start.1896:
%.tmp1898 = load i32, i32* %i.1897
%.tmp1899 = load i32, i32* %indent
%.tmp1900 = icmp slt i32 %.tmp1898, %.tmp1899
br i1 %.tmp1900, label %.for.continue.1896, label %.for.end.1896
.for.continue.1896:
%.tmp1901 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1903 = getelementptr [3 x i8], [3 x i8]*@.str1902, i32 0, i32 0
%.tmp1904 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1901, i8* %.tmp1903)
%.tmp1905 = load i32, i32* %i.1897
%.tmp1906 = add i32 %.tmp1905, 1
store i32 %.tmp1906, i32* %i.1897
br label %.for.start.1896
.for.end.1896:
ret void
}
define void @m1862$_node_to_string.v.m812$.Node.typep.m0$.File.typep.i(%m812$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m812$.Node.type*
store %m812$.Node.type* %.node.arg, %m812$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1907 = load %m812$.Node.type*, %m812$.Node.type** %node
%.tmp1908 = icmp eq %m812$.Node.type* %.tmp1907, null
br i1 %.tmp1908, label %.if.true.1909, label %.if.false.1909
.if.true.1909:
%.tmp1910 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1912 = getelementptr [7 x i8], [7 x i8]*@.str1911, i32 0, i32 0
%.tmp1913 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1910, i8* %.tmp1912)
ret void
br label %.if.end.1909
.if.false.1909:
br label %.if.end.1909
.if.end.1909:
%.tmp1914 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1916 = getelementptr [2 x i8], [2 x i8]*@.str1915, i32 0, i32 0
%.tmp1917 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1914, i8* %.tmp1916)
%.tmp1918 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1919 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1862$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1918, i32 %.tmp1919)
%.tmp1920 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1922 = getelementptr [13 x i8], [13 x i8]*@.str1921, i32 0, i32 0
%.tmp1923 = load %m812$.Node.type*, %m812$.Node.type** %node
%.tmp1924 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1923, i32 0, i32 0
%.tmp1925 = load i8*, i8** %.tmp1924
%.tmp1926 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1920, i8* %.tmp1922, i8* %.tmp1925)
%.tmp1927 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1928 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1862$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1927, i32 %.tmp1928)
%.tmp1929 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1931 = getelementptr [12 x i8], [12 x i8]*@.str1930, i32 0, i32 0
%.tmp1932 = load %m812$.Node.type*, %m812$.Node.type** %node
%.tmp1933 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1932, i32 0, i32 1
%.tmp1934 = load i8*, i8** %.tmp1933
%.tmp1935 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1929, i8* %.tmp1931, i8* %.tmp1934)
%.tmp1936 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1937 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1862$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1936, i32 %.tmp1937)
%.tmp1938 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1940 = getelementptr [11 x i8], [11 x i8]*@.str1939, i32 0, i32 0
%.tmp1941 = load %m812$.Node.type*, %m812$.Node.type** %node
%.tmp1942 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1941, i32 0, i32 3
%.tmp1943 = load i32, i32* %.tmp1942
%.tmp1944 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1938, i8* %.tmp1940, i32 %.tmp1943)
%.tmp1945 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1946 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1862$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1945, i32 %.tmp1946)
%.tmp1947 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1949 = getelementptr [19 x i8], [19 x i8]*@.str1948, i32 0, i32 0
%.tmp1950 = load %m812$.Node.type*, %m812$.Node.type** %node
%.tmp1951 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1950, i32 0, i32 4
%.tmp1952 = load i32, i32* %.tmp1951
%.tmp1953 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1947, i8* %.tmp1949, i32 %.tmp1952)
%.tmp1954 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1955 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1862$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1954, i32 %.tmp1955)
%.tmp1956 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1958 = getelementptr [9 x i8], [9 x i8]*@.str1957, i32 0, i32 0
%.tmp1959 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1956, i8* %.tmp1958)
%.tmp1960 = load %m812$.Node.type*, %m812$.Node.type** %node
%.tmp1961 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1960, i32 0, i32 7
%.tmp1962 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1961
%.tmp1963 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1964 = load i32, i32* %indent
%.tmp1965 = add i32 %.tmp1964, 1
call void(%m812$.Node.type*,%m0$.File.type*,i32) @m1862$_node_to_string.v.m812$.Node.typep.m0$.File.typep.i(%m812$.Node.type* %.tmp1962, %m0$.File.type* %.tmp1963, i32 %.tmp1965)
%.tmp1966 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1967 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1862$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1966, i32 %.tmp1967)
%.tmp1968 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1970 = getelementptr [13 x i8], [13 x i8]*@.str1969, i32 0, i32 0
%.tmp1971 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1968, i8* %.tmp1970)
%.tmp1972 = load %m812$.Node.type*, %m812$.Node.type** %node
%.tmp1973 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp1972, i32 0, i32 6
%.tmp1974 = load %m812$.Node.type*, %m812$.Node.type** %.tmp1973
%.tmp1975 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1976 = load i32, i32* %indent
%.tmp1977 = add i32 %.tmp1976, 1
call void(%m812$.Node.type*,%m0$.File.type*,i32) @m1862$_node_to_string.v.m812$.Node.typep.m0$.File.typep.i(%m812$.Node.type* %.tmp1974, %m0$.File.type* %.tmp1975, i32 %.tmp1977)
%.tmp1978 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1979 = load i32, i32* %indent
%.tmp1980 = sub i32 %.tmp1979, 1
call void(%m0$.File.type*,i32) @m1862$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1978, i32 %.tmp1980)
%.tmp1981 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1983 = getelementptr [2 x i8], [2 x i8]*@.str1982, i32 0, i32 0
%.tmp1984 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1981, i8* %.tmp1983)
ret void
}
define i8* @m1985$grammar.cp() {
%.tmp1987 = getelementptr [1847 x i8], [1847 x i8]*@.str1986, i32 0, i32 0
ret i8* %.tmp1987
}
define i8* @m1988$append_tmpl.cp() {
%.tmp1990 = getelementptr [1885 x i8], [1885 x i8]*@.str1989, i32 0, i32 0
ret i8* %.tmp1990
}
define i8* @m1991$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp1992 = load i8*, i8** %text
%.tmp1993 = call i32(i8*) @strlen(i8* %.tmp1992)
%str_len.1994 = alloca i32
store i32 %.tmp1993, i32* %str_len.1994
%.tmp1996 = getelementptr [1 x i8], [1 x i8]*@.str1995, i32 0, i32 0
%buf.1997 = alloca i8*
store i8* %.tmp1996, i8** %buf.1997
%i.1999 = alloca i32
store i32 1, i32* %i.1999
br label %.for.start.1998
.for.start.1998:
%.tmp2000 = load i32, i32* %i.1999
%.tmp2001 = load i32, i32* %str_len.1994
%.tmp2002 = sub i32 %.tmp2001, 1
%.tmp2003 = icmp slt i32 %.tmp2000, %.tmp2002
br i1 %.tmp2003, label %.for.continue.1998, label %.for.end.1998
.for.continue.1998:
%.tmp2004 = load i32, i32* %i.1999
%.tmp2005 = load i8*, i8** %text
%.tmp2006 = getelementptr i8, i8* %.tmp2005, i32 %.tmp2004
%.tmp2007 = load i8, i8* %.tmp2006
%.tmp2008 = icmp eq i8 %.tmp2007, 34
br i1 %.tmp2008, label %.if.true.2009, label %.if.false.2009
.if.true.2009:
%.tmp2010 = getelementptr i8*, i8** %buf.1997, i32 0
%.tmp2012 = getelementptr [6 x i8], [6 x i8]*@.str2011, i32 0, i32 0
%.tmp2013 = load i8*, i8** %buf.1997
%.tmp2014 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2010, i8* %.tmp2012, i8* %.tmp2013)
br label %.if.end.2009
.if.false.2009:
%.tmp2015 = load i32, i32* %i.1999
%.tmp2016 = load i8*, i8** %text
%.tmp2017 = getelementptr i8, i8* %.tmp2016, i32 %.tmp2015
%.tmp2018 = load i8, i8* %.tmp2017
%.tmp2019 = icmp eq i8 %.tmp2018, 92
br i1 %.tmp2019, label %.if.true.2020, label %.if.false.2020
.if.true.2020:
%.tmp2021 = load i32, i32* %i.1999
%.tmp2022 = add i32 %.tmp2021, 1
%.tmp2023 = load i8*, i8** %text
%.tmp2024 = getelementptr i8, i8* %.tmp2023, i32 %.tmp2022
%.tmp2025 = load i8, i8* %.tmp2024
%.tmp2026 = icmp eq i8 %.tmp2025, 110
%.tmp2027 = load i32, i32* %i.1999
%.tmp2028 = add i32 %.tmp2027, 1
%.tmp2029 = load i8*, i8** %text
%.tmp2030 = getelementptr i8, i8* %.tmp2029, i32 %.tmp2028
%.tmp2031 = load i8, i8* %.tmp2030
%.tmp2032 = icmp eq i8 %.tmp2031, 78
%.tmp2033 = or i1 %.tmp2026, %.tmp2032
br i1 %.tmp2033, label %.if.true.2034, label %.if.false.2034
.if.true.2034:
%.tmp2035 = getelementptr i8*, i8** %buf.1997, i32 0
%.tmp2037 = getelementptr [6 x i8], [6 x i8]*@.str2036, i32 0, i32 0
%.tmp2038 = load i8*, i8** %buf.1997
%.tmp2039 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2035, i8* %.tmp2037, i8* %.tmp2038)
%.tmp2040 = load i32, i32* %i.1999
%.tmp2041 = add i32 %.tmp2040, 1
store i32 %.tmp2041, i32* %i.1999
br label %.if.end.2034
.if.false.2034:
%.tmp2042 = load i32, i32* %i.1999
%.tmp2043 = add i32 %.tmp2042, 1
%.tmp2044 = load i8*, i8** %text
%.tmp2045 = getelementptr i8, i8* %.tmp2044, i32 %.tmp2043
%.tmp2046 = load i8, i8* %.tmp2045
%.tmp2047 = icmp eq i8 %.tmp2046, 92
br i1 %.tmp2047, label %.if.true.2048, label %.if.false.2048
.if.true.2048:
%.tmp2049 = getelementptr i8*, i8** %buf.1997, i32 0
%.tmp2051 = getelementptr [6 x i8], [6 x i8]*@.str2050, i32 0, i32 0
%.tmp2052 = load i8*, i8** %buf.1997
%.tmp2053 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2049, i8* %.tmp2051, i8* %.tmp2052)
%.tmp2054 = load i32, i32* %i.1999
%.tmp2055 = add i32 %.tmp2054, 1
store i32 %.tmp2055, i32* %i.1999
br label %.if.end.2048
.if.false.2048:
%.tmp2056 = load i32, i32* %i.1999
%.tmp2057 = add i32 %.tmp2056, 1
%.tmp2058 = load i8*, i8** %text
%.tmp2059 = getelementptr i8, i8* %.tmp2058, i32 %.tmp2057
%.tmp2060 = load i8, i8* %.tmp2059
%.tmp2061 = icmp eq i8 %.tmp2060, 120
br i1 %.tmp2061, label %.if.true.2062, label %.if.false.2062
.if.true.2062:
%.tmp2063 = load i32, i32* %i.1999
%.tmp2064 = add i32 %.tmp2063, 2
store i32 %.tmp2064, i32* %i.1999
%.tmp2065 = getelementptr i8*, i8** %buf.1997, i32 0
%.tmp2067 = getelementptr [8 x i8], [8 x i8]*@.str2066, i32 0, i32 0
%.tmp2068 = load i8*, i8** %buf.1997
%.tmp2069 = load i32, i32* %i.1999
%.tmp2070 = load i8*, i8** %text
%.tmp2071 = getelementptr i8, i8* %.tmp2070, i32 %.tmp2069
%.tmp2072 = load i8, i8* %.tmp2071
%.tmp2073 = call i8(i8) @toupper(i8 %.tmp2072)
%.tmp2074 = load i32, i32* %i.1999
%.tmp2075 = add i32 %.tmp2074, 1
%.tmp2076 = load i8*, i8** %text
%.tmp2077 = getelementptr i8, i8* %.tmp2076, i32 %.tmp2075
%.tmp2078 = load i8, i8* %.tmp2077
%.tmp2079 = call i8(i8) @toupper(i8 %.tmp2078)
%.tmp2080 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2065, i8* %.tmp2067, i8* %.tmp2068, i8 %.tmp2073, i8 %.tmp2079)
%.tmp2081 = load i32, i32* %i.1999
%.tmp2082 = add i32 %.tmp2081, 1
store i32 %.tmp2082, i32* %i.1999
br label %.if.end.2062
.if.false.2062:
%.tmp2083 = getelementptr i8*, i8** %buf.1997, i32 0
%.tmp2085 = getelementptr [5 x i8], [5 x i8]*@.str2084, i32 0, i32 0
%.tmp2086 = load i8*, i8** %buf.1997
%.tmp2087 = load i32, i32* %i.1999
%.tmp2088 = load i8*, i8** %text
%.tmp2089 = getelementptr i8, i8* %.tmp2088, i32 %.tmp2087
%.tmp2090 = load i8, i8* %.tmp2089
%.tmp2091 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2083, i8* %.tmp2085, i8* %.tmp2086, i8 %.tmp2090)
br label %.if.end.2062
.if.end.2062:
br label %.if.end.2048
.if.end.2048:
br label %.if.end.2034
.if.end.2034:
br label %.if.end.2020
.if.false.2020:
%.tmp2092 = getelementptr i8*, i8** %buf.1997, i32 0
%.tmp2094 = getelementptr [5 x i8], [5 x i8]*@.str2093, i32 0, i32 0
%.tmp2095 = load i8*, i8** %buf.1997
%.tmp2096 = load i32, i32* %i.1999
%.tmp2097 = load i8*, i8** %text
%.tmp2098 = getelementptr i8, i8* %.tmp2097, i32 %.tmp2096
%.tmp2099 = load i8, i8* %.tmp2098
%.tmp2100 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2092, i8* %.tmp2094, i8* %.tmp2095, i8 %.tmp2099)
br label %.if.end.2020
.if.end.2020:
br label %.if.end.2009
.if.end.2009:
%.tmp2101 = load i32, i32* %i.1999
%.tmp2102 = add i32 %.tmp2101, 1
store i32 %.tmp2102, i32* %i.1999
br label %.for.start.1998
.for.end.1998:
%.tmp2103 = getelementptr i8*, i8** %buf.1997, i32 0
%.tmp2105 = getelementptr [9 x i8], [9 x i8]*@.str2104, i32 0, i32 0
%.tmp2106 = load i8*, i8** %buf.1997
%.tmp2107 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2103, i8* %.tmp2105, i8* %.tmp2106)
%.tmp2108 = load i8*, i8** %buf.1997
ret i8* %.tmp2108
}
define i32 @m1991$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len.2109 = alloca i32
store i32 0, i32* %len.2109
%i.2111 = alloca i32
store i32 2, i32* %i.2111
br label %.for.start.2110
.for.start.2110:
%.tmp2112 = load i32, i32* %i.2111
%.tmp2113 = load i8*, i8** %text
%.tmp2114 = getelementptr i8, i8* %.tmp2113, i32 %.tmp2112
%.tmp2115 = load i8, i8* %.tmp2114
%.tmp2116 = icmp ne i8 %.tmp2115, 0
br i1 %.tmp2116, label %.for.continue.2110, label %.for.end.2110
.for.continue.2110:
%.tmp2117 = load i32, i32* %i.2111
%.tmp2118 = load i8*, i8** %text
%.tmp2119 = getelementptr i8, i8* %.tmp2118, i32 %.tmp2117
%.tmp2120 = load i8, i8* %.tmp2119
%.tmp2121 = icmp eq i8 %.tmp2120, 92
br i1 %.tmp2121, label %.if.true.2122, label %.if.false.2122
.if.true.2122:
%.tmp2123 = load i32, i32* %i.2111
%.tmp2124 = add i32 %.tmp2123, 2
store i32 %.tmp2124, i32* %i.2111
br label %.if.end.2122
.if.false.2122:
br label %.if.end.2122
.if.end.2122:
%.tmp2125 = load i32, i32* %len.2109
%.tmp2126 = add i32 %.tmp2125, 1
store i32 %.tmp2126, i32* %len.2109
%.tmp2127 = load i32, i32* %i.2111
%.tmp2128 = add i32 %.tmp2127, 1
store i32 %.tmp2128, i32* %i.2111
br label %.for.start.2110
.for.end.2110:
%.tmp2129 = load i32, i32* %len.2109
%.tmp2130 = sub i32 %.tmp2129, 1
ret i32 %.tmp2130
}
define i8* @m1991$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval.2131 = alloca i32
store i32 0, i32* %intval.2131
%buf.2132 = alloca i8*
store i8* null, i8** %buf.2132
%chrval.2133 = alloca i8
store i8 0, i8* %chrval.2133
%.tmp2134 = load i8*, i8** %chr_repr
%.tmp2135 = call i32(i8*) @strlen(i8* %.tmp2134)
%chr_len.2136 = alloca i32
store i32 %.tmp2135, i32* %chr_len.2136
%.tmp2137 = load i32, i32* %chr_len.2136
%.tmp2138 = icmp eq i32 %.tmp2137, 6
br i1 %.tmp2138, label %.if.true.2139, label %.if.false.2139
.if.true.2139:
%.tmp2140 = load i8*, i8** %chr_repr
%.tmp2142 = getelementptr [7 x i8], [7 x i8]*@.str2141, i32 0, i32 0
%.tmp2143 = getelementptr i32, i32* %intval.2131, i32 0
%.tmp2144 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2140, i8* %.tmp2142, i32* %.tmp2143)
%.tmp2145 = getelementptr i8*, i8** %buf.2132, i32 0
%.tmp2147 = getelementptr [3 x i8], [3 x i8]*@.str2146, i32 0, i32 0
%.tmp2148 = load i32, i32* %intval.2131
%.tmp2149 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2145, i8* %.tmp2147, i32 %.tmp2148)
br label %.if.end.2139
.if.false.2139:
%.tmp2150 = load i32, i32* %chr_len.2136
%.tmp2151 = icmp eq i32 %.tmp2150, 5
br i1 %.tmp2151, label %.if.true.2152, label %.if.false.2152
.if.true.2152:
%.tmp2153 = load i8*, i8** %chr_repr
%.tmp2155 = getelementptr [6 x i8], [6 x i8]*@.str2154, i32 0, i32 0
%.tmp2156 = getelementptr i32, i32* %intval.2131, i32 0
%.tmp2157 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2153, i8* %.tmp2155, i32* %.tmp2156)
%.tmp2158 = getelementptr i8*, i8** %buf.2132, i32 0
%.tmp2160 = getelementptr [3 x i8], [3 x i8]*@.str2159, i32 0, i32 0
%.tmp2161 = load i32, i32* %intval.2131
%.tmp2162 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2158, i8* %.tmp2160, i32 %.tmp2161)
br label %.if.end.2152
.if.false.2152:
%.tmp2163 = load i32, i32* %chr_len.2136
%.tmp2164 = icmp eq i32 %.tmp2163, 4
br i1 %.tmp2164, label %.if.true.2165, label %.if.false.2165
.if.true.2165:
%.tmp2166 = load i8*, i8** %chr_repr
%.tmp2168 = getelementptr [6 x i8], [6 x i8]*@.str2167, i32 0, i32 0
%.tmp2169 = getelementptr i8, i8* %chrval.2133, i32 0
%.tmp2170 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2166, i8* %.tmp2168, i8* %.tmp2169)
%.tmp2171 = load i8, i8* %chrval.2133
%.tmp2172 = icmp eq i8 %.tmp2171, 110
br i1 %.tmp2172, label %.if.true.2173, label %.if.false.2173
.if.true.2173:
%.tmp2175 = getelementptr [3 x i8], [3 x i8]*@.str2174, i32 0, i32 0
store i8* %.tmp2175, i8** %buf.2132
br label %.if.end.2173
.if.false.2173:
%.tmp2176 = bitcast ptr null to i8*
ret i8* %.tmp2176
br label %.if.end.2173
.if.end.2173:
br label %.if.end.2165
.if.false.2165:
%.tmp2177 = load i32, i32* %chr_len.2136
%.tmp2178 = icmp eq i32 %.tmp2177, 3
br i1 %.tmp2178, label %.if.true.2179, label %.if.false.2179
.if.true.2179:
%.tmp2180 = load i8*, i8** %chr_repr
%.tmp2182 = getelementptr [5 x i8], [5 x i8]*@.str2181, i32 0, i32 0
%.tmp2183 = getelementptr i32, i32* %intval.2131, i32 0
%.tmp2184 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2180, i8* %.tmp2182, i32* %.tmp2183)
%.tmp2185 = getelementptr i8*, i8** %buf.2132, i32 0
%.tmp2187 = getelementptr [3 x i8], [3 x i8]*@.str2186, i32 0, i32 0
%.tmp2188 = load i32, i32* %intval.2131
%.tmp2189 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2185, i8* %.tmp2187, i32 %.tmp2188)
br label %.if.end.2179
.if.false.2179:
%.tmp2190 = bitcast ptr null to i8*
ret i8* %.tmp2190
br label %.if.end.2179
.if.end.2179:
br label %.if.end.2165
.if.end.2165:
br label %.if.end.2152
.if.end.2152:
br label %.if.end.2139
.if.end.2139:
%.tmp2191 = load i8*, i8** %buf.2132
ret i8* %.tmp2191
}
%m2192$.SYStack.type = type {%m812$.Node.type*,%m2192$.SYStack.type*}
@SYStack_size = constant i32 16
define %m2192$.SYStack.type* @m2192$stack_new.m2192$.SYStack.typep() {
%.tmp2193 = load i32, i32* @SYStack_size
%.tmp2194 = call i8*(i32) @malloc(i32 %.tmp2193)
%.tmp2195 = bitcast i8* %.tmp2194 to %m2192$.SYStack.type*
%s.2196 = alloca %m2192$.SYStack.type*
store %m2192$.SYStack.type* %.tmp2195, %m2192$.SYStack.type** %s.2196
%.tmp2197 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %s.2196
%.tmp2198 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2197, i32 0, i32 0
store %m812$.Node.type* null, %m812$.Node.type** %.tmp2198
%.tmp2199 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %s.2196
%.tmp2200 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2199, i32 0, i32 1
store %m2192$.SYStack.type* null, %m2192$.SYStack.type** %.tmp2200
%.tmp2201 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %s.2196
ret %m2192$.SYStack.type* %.tmp2201
}
define %m2192$.SYStack.type* @m2192$sy_algorithm.m2192$.SYStack.typep.m812$.Node.typep(%m812$.Node.type* %.assignable.arg) {
%assignable = alloca %m812$.Node.type*
store %m812$.Node.type* %.assignable.arg, %m812$.Node.type** %assignable
%.tmp2202 = call %m2192$.SYStack.type*() @m2192$stack_new.m2192$.SYStack.typep()
%out_stack.2203 = alloca %m2192$.SYStack.type*
store %m2192$.SYStack.type* %.tmp2202, %m2192$.SYStack.type** %out_stack.2203
%.tmp2204 = call %m2192$.SYStack.type*() @m2192$stack_new.m2192$.SYStack.typep()
%op_stack.2205 = alloca %m2192$.SYStack.type*
store %m2192$.SYStack.type* %.tmp2204, %m2192$.SYStack.type** %op_stack.2205
%.tmp2206 = call %m2192$.SYStack.type*() @m2192$stack_new.m2192$.SYStack.typep()
%token_stack.2207 = alloca %m2192$.SYStack.type*
store %m2192$.SYStack.type* %.tmp2206, %m2192$.SYStack.type** %token_stack.2207
%ptr.2208 = alloca %m812$.Node.type*
store %m812$.Node.type* null, %m812$.Node.type** %ptr.2208
%.tmp2210 = load %m812$.Node.type*, %m812$.Node.type** %assignable
store %m812$.Node.type* %.tmp2210, %m812$.Node.type** %ptr.2208
br label %.for.start.2209
.for.start.2209:
%.tmp2211 = load %m812$.Node.type*, %m812$.Node.type** %ptr.2208
%.tmp2212 = icmp ne %m812$.Node.type* %.tmp2211, null
br i1 %.tmp2212, label %.for.continue.2209, label %.for.end.2209
.for.continue.2209:
%.tmp2213 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %token_stack.2207
%.tmp2214 = load %m812$.Node.type*, %m812$.Node.type** %ptr.2208
%.tmp2215 = call %m2192$.SYStack.type*(%m2192$.SYStack.type*,%m812$.Node.type*) @m2192$stack_push.m2192$.SYStack.typep.m2192$.SYStack.typep.m812$.Node.typep(%m2192$.SYStack.type* %.tmp2213, %m812$.Node.type* %.tmp2214)
store %m2192$.SYStack.type* %.tmp2215, %m2192$.SYStack.type** %token_stack.2207
%.tmp2216 = load %m812$.Node.type*, %m812$.Node.type** %ptr.2208
%.tmp2217 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2216, i32 0, i32 7
%.tmp2218 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2217
store %m812$.Node.type* %.tmp2218, %m812$.Node.type** %ptr.2208
br label %.for.start.2209
.for.end.2209:
%.tmp2220 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %token_stack.2207
%.tmp2221 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2220, i32 0, i32 0
%.tmp2222 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2221
store %m812$.Node.type* %.tmp2222, %m812$.Node.type** %ptr.2208
br label %.for.start.2219
.for.start.2219:
%.tmp2223 = load %m812$.Node.type*, %m812$.Node.type** %ptr.2208
%.tmp2224 = icmp ne %m812$.Node.type* %.tmp2223, null
br i1 %.tmp2224, label %.for.continue.2219, label %.for.end.2219
.for.continue.2219:
%.tmp2225 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %token_stack.2207
%cs.2226 = alloca %m2192$.SYStack.type*
store %m2192$.SYStack.type* %.tmp2225, %m2192$.SYStack.type** %cs.2226
%.tmp2227 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %token_stack.2207
%.tmp2228 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2227, i32 0, i32 1
%.tmp2229 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %.tmp2228
store %m2192$.SYStack.type* %.tmp2229, %m2192$.SYStack.type** %token_stack.2207
%.tmp2230 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %cs.2226
%.tmp2231 = bitcast %m2192$.SYStack.type* %.tmp2230 to i8*
call void(i8*) @free(i8* %.tmp2231)
%.tmp2232 = load %m812$.Node.type*, %m812$.Node.type** %ptr.2208
%.tmp2233 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2232, i32 0, i32 0
%.tmp2234 = load i8*, i8** %.tmp2233
%.tmp2236 = getelementptr [16 x i8], [16 x i8]*@.str2235, i32 0, i32 0
%.tmp2237 = call i32(i8*,i8*) @strcmp(i8* %.tmp2234, i8* %.tmp2236)
%.tmp2238 = icmp eq i32 %.tmp2237, 0
br i1 %.tmp2238, label %.if.true.2239, label %.if.false.2239
.if.true.2239:
%.tmp2240 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %out_stack.2203
%.tmp2241 = load %m812$.Node.type*, %m812$.Node.type** %ptr.2208
%.tmp2242 = call %m2192$.SYStack.type*(%m2192$.SYStack.type*,%m812$.Node.type*) @m2192$stack_push.m2192$.SYStack.typep.m2192$.SYStack.typep.m812$.Node.typep(%m2192$.SYStack.type* %.tmp2240, %m812$.Node.type* %.tmp2241)
store %m2192$.SYStack.type* %.tmp2242, %m2192$.SYStack.type** %out_stack.2203
br label %.if.end.2239
.if.false.2239:
%.tmp2243 = load %m812$.Node.type*, %m812$.Node.type** %ptr.2208
%.tmp2244 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2243, i32 0, i32 0
%.tmp2245 = load i8*, i8** %.tmp2244
%.tmp2247 = getelementptr [9 x i8], [9 x i8]*@.str2246, i32 0, i32 0
%.tmp2248 = call i32(i8*,i8*) @strcmp(i8* %.tmp2245, i8* %.tmp2247)
%.tmp2249 = icmp eq i32 %.tmp2248, 0
br i1 %.tmp2249, label %.if.true.2250, label %.if.false.2250
.if.true.2250:
%quit.2251 = alloca i1
store i1 0, i1* %quit.2251
br label %.for.start.2252
.for.start.2252:
%.tmp2253 = load i1, i1* %quit.2251
%.tmp2254 = icmp eq i1 %.tmp2253, 0
br i1 %.tmp2254, label %.for.continue.2252, label %.for.end.2252
.for.continue.2252:
%.tmp2255 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %op_stack.2205
%.tmp2256 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2255, i32 0, i32 0
%.tmp2257 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2256
%.tmp2258 = icmp eq %m812$.Node.type* %.tmp2257, null
br i1 %.tmp2258, label %.if.true.2259, label %.if.false.2259
.if.true.2259:
store i1 1, i1* %quit.2251
br label %.if.end.2259
.if.false.2259:
%.tmp2260 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %op_stack.2205
%.tmp2261 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2260, i32 0, i32 0
%.tmp2262 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2261
%.tmp2263 = call i32(%m812$.Node.type*) @m2192$op_precedence.i.m812$.Node.typep(%m812$.Node.type* %.tmp2262)
%.tmp2264 = load %m812$.Node.type*, %m812$.Node.type** %ptr.2208
%.tmp2265 = call i32(%m812$.Node.type*) @m2192$op_precedence.i.m812$.Node.typep(%m812$.Node.type* %.tmp2264)
%.tmp2266 = icmp slt i32 %.tmp2263, %.tmp2265
br i1 %.tmp2266, label %.if.true.2267, label %.if.false.2267
.if.true.2267:
%.tmp2268 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %op_stack.2205
%top.2269 = alloca %m2192$.SYStack.type*
store %m2192$.SYStack.type* %.tmp2268, %m2192$.SYStack.type** %top.2269
%.tmp2270 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %op_stack.2205
%.tmp2271 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2270, i32 0, i32 1
%.tmp2272 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %.tmp2271
store %m2192$.SYStack.type* %.tmp2272, %m2192$.SYStack.type** %op_stack.2205
%.tmp2273 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %out_stack.2203
%.tmp2274 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %top.2269
%.tmp2275 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2274, i32 0, i32 0
%.tmp2276 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2275
%.tmp2277 = call %m2192$.SYStack.type*(%m2192$.SYStack.type*,%m812$.Node.type*) @m2192$stack_push.m2192$.SYStack.typep.m2192$.SYStack.typep.m812$.Node.typep(%m2192$.SYStack.type* %.tmp2273, %m812$.Node.type* %.tmp2276)
store %m2192$.SYStack.type* %.tmp2277, %m2192$.SYStack.type** %out_stack.2203
%.tmp2278 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %top.2269
%.tmp2279 = bitcast %m2192$.SYStack.type* %.tmp2278 to i8*
call void(i8*) @free(i8* %.tmp2279)
br label %.if.end.2267
.if.false.2267:
store i1 1, i1* %quit.2251
br label %.if.end.2267
.if.end.2267:
br label %.if.end.2259
.if.end.2259:
br label %.for.start.2252
.for.end.2252:
%.tmp2280 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %op_stack.2205
%.tmp2281 = load %m812$.Node.type*, %m812$.Node.type** %ptr.2208
%.tmp2282 = call %m2192$.SYStack.type*(%m2192$.SYStack.type*,%m812$.Node.type*) @m2192$stack_push.m2192$.SYStack.typep.m2192$.SYStack.typep.m812$.Node.typep(%m2192$.SYStack.type* %.tmp2280, %m812$.Node.type* %.tmp2281)
store %m2192$.SYStack.type* %.tmp2282, %m2192$.SYStack.type** %op_stack.2205
br label %.if.end.2250
.if.false.2250:
%.tmp2284 = getelementptr [68 x i8], [68 x i8]*@.str2283, i32 0, i32 0
%.tmp2285 = load %m812$.Node.type*, %m812$.Node.type** %ptr.2208
%.tmp2286 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2285, i32 0, i32 0
%.tmp2287 = load i8*, i8** %.tmp2286
%.tmp2288 = call i32(i8*,...) @printf(i8* %.tmp2284, i8* %.tmp2287)
br label %.if.end.2250
.if.end.2250:
br label %.if.end.2239
.if.end.2239:
%.tmp2289 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %token_stack.2207
%.tmp2290 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2289, i32 0, i32 0
%.tmp2291 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2290
store %m812$.Node.type* %.tmp2291, %m812$.Node.type** %ptr.2208
br label %.for.start.2219
.for.end.2219:
br label %.for.start.2292
.for.start.2292:
%.tmp2293 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %op_stack.2205
%.tmp2294 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2293, i32 0, i32 0
%.tmp2295 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2294
%.tmp2296 = icmp ne %m812$.Node.type* %.tmp2295, null
br i1 %.tmp2296, label %.for.continue.2292, label %.for.end.2292
.for.continue.2292:
%.tmp2297 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %op_stack.2205
%.tmp2298 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2297, i32 0, i32 0
%.tmp2299 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2298
%node.2300 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp2299, %m812$.Node.type** %node.2300
%.tmp2301 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %op_stack.2205
%s.2302 = alloca %m2192$.SYStack.type*
store %m2192$.SYStack.type* %.tmp2301, %m2192$.SYStack.type** %s.2302
%.tmp2303 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %op_stack.2205
%.tmp2304 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2303, i32 0, i32 1
%.tmp2305 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %.tmp2304
store %m2192$.SYStack.type* %.tmp2305, %m2192$.SYStack.type** %op_stack.2205
%.tmp2306 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %s.2302
%.tmp2307 = bitcast %m2192$.SYStack.type* %.tmp2306 to i8*
call void(i8*) @free(i8* %.tmp2307)
%.tmp2308 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %out_stack.2203
%.tmp2309 = load %m812$.Node.type*, %m812$.Node.type** %node.2300
%.tmp2310 = call %m2192$.SYStack.type*(%m2192$.SYStack.type*,%m812$.Node.type*) @m2192$stack_push.m2192$.SYStack.typep.m2192$.SYStack.typep.m812$.Node.typep(%m2192$.SYStack.type* %.tmp2308, %m812$.Node.type* %.tmp2309)
store %m2192$.SYStack.type* %.tmp2310, %m2192$.SYStack.type** %out_stack.2203
br label %.for.start.2292
.for.end.2292:
%.tmp2311 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %out_stack.2203
ret %m2192$.SYStack.type* %.tmp2311
}
define %m2192$.SYStack.type* @m2192$stack_push.m2192$.SYStack.typep.m2192$.SYStack.typep.m812$.Node.typep(%m2192$.SYStack.type* %.curr_stack.arg, %m812$.Node.type* %.node.arg) {
%curr_stack = alloca %m2192$.SYStack.type*
store %m2192$.SYStack.type* %.curr_stack.arg, %m2192$.SYStack.type** %curr_stack
%node = alloca %m812$.Node.type*
store %m812$.Node.type* %.node.arg, %m812$.Node.type** %node
%.tmp2312 = load i32, i32* @SYStack_size
%.tmp2313 = call i8*(i32) @malloc(i32 %.tmp2312)
%.tmp2314 = bitcast i8* %.tmp2313 to %m2192$.SYStack.type*
%s.2315 = alloca %m2192$.SYStack.type*
store %m2192$.SYStack.type* %.tmp2314, %m2192$.SYStack.type** %s.2315
%.tmp2316 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %s.2315
%.tmp2317 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2316, i32 0, i32 0
%.tmp2318 = load %m812$.Node.type*, %m812$.Node.type** %node
store %m812$.Node.type* %.tmp2318, %m812$.Node.type** %.tmp2317
%.tmp2319 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %s.2315
%.tmp2320 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp2319, i32 0, i32 1
%.tmp2321 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %curr_stack
store %m2192$.SYStack.type* %.tmp2321, %m2192$.SYStack.type** %.tmp2320
%.tmp2322 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %s.2315
ret %m2192$.SYStack.type* %.tmp2322
}
define i32 @m2192$op_precedence.i.m812$.Node.typep(%m812$.Node.type* %.n.arg) {
%n = alloca %m812$.Node.type*
store %m812$.Node.type* %.n.arg, %m812$.Node.type** %n
%.tmp2323 = load %m812$.Node.type*, %m812$.Node.type** %n
%.tmp2324 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2323, i32 0, i32 6
%.tmp2325 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2324
%op.2326 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp2325, %m812$.Node.type** %op.2326
%.tmp2327 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2328 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2327, i32 0, i32 1
%.tmp2329 = load i8*, i8** %.tmp2328
%.tmp2331 = getelementptr [2 x i8], [2 x i8]*@.str2330, i32 0, i32 0
%.tmp2332 = call i32(i8*,i8*) @strcmp(i8* %.tmp2329, i8* %.tmp2331)
%.tmp2333 = icmp eq i32 %.tmp2332, 0
%.tmp2334 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2335 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2334, i32 0, i32 1
%.tmp2336 = load i8*, i8** %.tmp2335
%.tmp2338 = getelementptr [2 x i8], [2 x i8]*@.str2337, i32 0, i32 0
%.tmp2339 = call i32(i8*,i8*) @strcmp(i8* %.tmp2336, i8* %.tmp2338)
%.tmp2340 = icmp eq i32 %.tmp2339, 0
%.tmp2341 = or i1 %.tmp2333, %.tmp2340
br i1 %.tmp2341, label %.if.true.2342, label %.if.false.2342
.if.true.2342:
ret i32 4
br label %.if.end.2342
.if.false.2342:
%.tmp2343 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2344 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2343, i32 0, i32 1
%.tmp2345 = load i8*, i8** %.tmp2344
%.tmp2347 = getelementptr [2 x i8], [2 x i8]*@.str2346, i32 0, i32 0
%.tmp2348 = call i32(i8*,i8*) @strcmp(i8* %.tmp2345, i8* %.tmp2347)
%.tmp2349 = icmp eq i32 %.tmp2348, 0
%.tmp2350 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2351 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2350, i32 0, i32 1
%.tmp2352 = load i8*, i8** %.tmp2351
%.tmp2354 = getelementptr [2 x i8], [2 x i8]*@.str2353, i32 0, i32 0
%.tmp2355 = call i32(i8*,i8*) @strcmp(i8* %.tmp2352, i8* %.tmp2354)
%.tmp2356 = icmp eq i32 %.tmp2355, 0
%.tmp2357 = or i1 %.tmp2349, %.tmp2356
%.tmp2358 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2359 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2358, i32 0, i32 1
%.tmp2360 = load i8*, i8** %.tmp2359
%.tmp2362 = getelementptr [2 x i8], [2 x i8]*@.str2361, i32 0, i32 0
%.tmp2363 = call i32(i8*,i8*) @strcmp(i8* %.tmp2360, i8* %.tmp2362)
%.tmp2364 = icmp eq i32 %.tmp2363, 0
%.tmp2365 = or i1 %.tmp2357, %.tmp2364
br i1 %.tmp2365, label %.if.true.2366, label %.if.false.2366
.if.true.2366:
ret i32 3
br label %.if.end.2366
.if.false.2366:
%.tmp2367 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2368 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2367, i32 0, i32 1
%.tmp2369 = load i8*, i8** %.tmp2368
%.tmp2371 = getelementptr [3 x i8], [3 x i8]*@.str2370, i32 0, i32 0
%.tmp2372 = call i32(i8*,i8*) @strcmp(i8* %.tmp2369, i8* %.tmp2371)
%.tmp2373 = icmp eq i32 %.tmp2372, 0
%.tmp2374 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2375 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2374, i32 0, i32 1
%.tmp2376 = load i8*, i8** %.tmp2375
%.tmp2378 = getelementptr [3 x i8], [3 x i8]*@.str2377, i32 0, i32 0
%.tmp2379 = call i32(i8*,i8*) @strcmp(i8* %.tmp2376, i8* %.tmp2378)
%.tmp2380 = icmp eq i32 %.tmp2379, 0
%.tmp2381 = or i1 %.tmp2373, %.tmp2380
br i1 %.tmp2381, label %.if.true.2382, label %.if.false.2382
.if.true.2382:
ret i32 7
br label %.if.end.2382
.if.false.2382:
%.tmp2383 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2384 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2383, i32 0, i32 1
%.tmp2385 = load i8*, i8** %.tmp2384
%.tmp2387 = getelementptr [3 x i8], [3 x i8]*@.str2386, i32 0, i32 0
%.tmp2388 = call i32(i8*,i8*) @strcmp(i8* %.tmp2385, i8* %.tmp2387)
%.tmp2389 = icmp eq i32 %.tmp2388, 0
%.tmp2390 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2391 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2390, i32 0, i32 1
%.tmp2392 = load i8*, i8** %.tmp2391
%.tmp2394 = getelementptr [3 x i8], [3 x i8]*@.str2393, i32 0, i32 0
%.tmp2395 = call i32(i8*,i8*) @strcmp(i8* %.tmp2392, i8* %.tmp2394)
%.tmp2396 = icmp eq i32 %.tmp2395, 0
%.tmp2397 = or i1 %.tmp2389, %.tmp2396
br i1 %.tmp2397, label %.if.true.2398, label %.if.false.2398
.if.true.2398:
ret i32 6
br label %.if.end.2398
.if.false.2398:
%.tmp2399 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2400 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2399, i32 0, i32 1
%.tmp2401 = load i8*, i8** %.tmp2400
%.tmp2403 = getelementptr [2 x i8], [2 x i8]*@.str2402, i32 0, i32 0
%.tmp2404 = call i32(i8*,i8*) @strcmp(i8* %.tmp2401, i8* %.tmp2403)
%.tmp2405 = icmp eq i32 %.tmp2404, 0
%.tmp2406 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2407 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2406, i32 0, i32 1
%.tmp2408 = load i8*, i8** %.tmp2407
%.tmp2410 = getelementptr [2 x i8], [2 x i8]*@.str2409, i32 0, i32 0
%.tmp2411 = call i32(i8*,i8*) @strcmp(i8* %.tmp2408, i8* %.tmp2410)
%.tmp2412 = icmp eq i32 %.tmp2411, 0
%.tmp2413 = or i1 %.tmp2405, %.tmp2412
br i1 %.tmp2413, label %.if.true.2414, label %.if.false.2414
.if.true.2414:
ret i32 6
br label %.if.end.2414
.if.false.2414:
%.tmp2415 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2416 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2415, i32 0, i32 1
%.tmp2417 = load i8*, i8** %.tmp2416
%.tmp2419 = getelementptr [2 x i8], [2 x i8]*@.str2418, i32 0, i32 0
%.tmp2420 = call i32(i8*,i8*) @strcmp(i8* %.tmp2417, i8* %.tmp2419)
%.tmp2421 = icmp eq i32 %.tmp2420, 0
br i1 %.tmp2421, label %.if.true.2422, label %.if.false.2422
.if.true.2422:
ret i32 11
br label %.if.end.2422
.if.false.2422:
%.tmp2423 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2424 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2423, i32 0, i32 1
%.tmp2425 = load i8*, i8** %.tmp2424
%.tmp2427 = getelementptr [2 x i8], [2 x i8]*@.str2426, i32 0, i32 0
%.tmp2428 = call i32(i8*,i8*) @strcmp(i8* %.tmp2425, i8* %.tmp2427)
%.tmp2429 = icmp eq i32 %.tmp2428, 0
br i1 %.tmp2429, label %.if.true.2430, label %.if.false.2430
.if.true.2430:
ret i32 12
br label %.if.end.2430
.if.false.2430:
br label %.if.end.2430
.if.end.2430:
br label %.if.end.2422
.if.end.2422:
br label %.if.end.2414
.if.end.2414:
br label %.if.end.2398
.if.end.2398:
br label %.if.end.2382
.if.end.2382:
br label %.if.end.2366
.if.end.2366:
br label %.if.end.2342
.if.end.2342:
%.tmp2432 = getelementptr [65 x i8], [65 x i8]*@.str2431, i32 0, i32 0
%.tmp2433 = load %m812$.Node.type*, %m812$.Node.type** %op.2326
%.tmp2434 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2433, i32 0, i32 1
%.tmp2435 = load i8*, i8** %.tmp2434
%.tmp2436 = call i32(i8*,...) @printf(i8* %.tmp2432, i8* %.tmp2435)
ret i32 4
}
%m2437$.Type.type = type {i8*,i8*,i8*,%m2437$.Type.type*,%m2437$.Type.type*}
%m2437$.ErrorList.type = type {%m230$.Error.type*,%m2437$.ErrorList.type*,i1}
%m2437$.AssignableInfo.type = type {i8*,i8,i8*,i8*,%m2437$.Type.type*,i32,i32,i8*}
%m2437$.ScopeItem.type = type {i8*,%m2437$.AssignableInfo.type*,%m2437$.ScopeItem.type*}
%m2437$.Scope.type = type {i8*,%m2437$.ScopeItem.type*,i8*,i8*,i8*,%m2437$.Scope.type*}
%m2437$.GlobalName.type = type {i8*,i8*,i1,i1,%m2437$.AssignableInfo.type*,%m2437$.GlobalName.type*}
%m2437$.ModuleLookup.type = type {i8*,i8*,%m2437$.ModuleLookup.type*,%m2437$.Scope.type*}
%m2437$.AnonFn.type = type {i8*,%m2437$.AnonFn.type*}
%m2437$.CompilerCtx.type = type {%m812$.Node.type*,%m0$.File.type*,%m2437$.ErrorList.type*,%m2437$.GlobalName.type*,%m812$.Rule.type**,i32,%m2437$.ModuleLookup.type*,i8*,%m2437$.AnonFn.type*}
@DEBUG_INTERNALS = constant i1 0
define %m2437$.Type.type* @m229$type_clone.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.t.arg) {
%t = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.t.arg, %m2437$.Type.type** %t
%.tmp2438 = load %m2437$.Type.type*, %m2437$.Type.type** %t
%.tmp2439 = icmp eq %m2437$.Type.type* %.tmp2438, null
br i1 %.tmp2439, label %.if.true.2440, label %.if.false.2440
.if.true.2440:
%.tmp2441 = bitcast ptr null to %m2437$.Type.type*
ret %m2437$.Type.type* %.tmp2441
br label %.if.end.2440
.if.false.2440:
br label %.if.end.2440
.if.end.2440:
%.tmp2442 = getelementptr %m2437$.Type.type, %m2437$.Type.type* null, i32 1
%.tmp2443 = ptrtoint %m2437$.Type.type* %.tmp2442 to i32
%.tmp2444 = call i8*(i32) @malloc(i32 %.tmp2443)
%.tmp2445 = bitcast i8* %.tmp2444 to %m2437$.Type.type*
%clone.2446 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp2445, %m2437$.Type.type** %clone.2446
%.tmp2447 = load %m2437$.Type.type*, %m2437$.Type.type** %clone.2446
%.tmp2448 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2447, i32 0, i32 3
%.tmp2449 = load %m2437$.Type.type*, %m2437$.Type.type** %t
%.tmp2450 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2449, i32 0, i32 3
%.tmp2451 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp2450
store %m2437$.Type.type* %.tmp2451, %m2437$.Type.type** %.tmp2448
%.tmp2452 = load %m2437$.Type.type*, %m2437$.Type.type** %clone.2446
%.tmp2453 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2452, i32 0, i32 4
%.tmp2454 = load %m2437$.Type.type*, %m2437$.Type.type** %t
%.tmp2455 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2454, i32 0, i32 4
%.tmp2456 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp2455
%.tmp2457 = call %m2437$.Type.type*(%m2437$.Type.type*) @m229$type_clone.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.tmp2456)
store %m2437$.Type.type* %.tmp2457, %m2437$.Type.type** %.tmp2453
%.tmp2458 = load %m2437$.Type.type*, %m2437$.Type.type** %clone.2446
%.tmp2459 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2458, i32 0, i32 2
%.tmp2460 = load %m2437$.Type.type*, %m2437$.Type.type** %t
%.tmp2461 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2460, i32 0, i32 2
%.tmp2462 = load i8*, i8** %.tmp2461
store i8* %.tmp2462, i8** %.tmp2459
%.tmp2463 = load %m2437$.Type.type*, %m2437$.Type.type** %clone.2446
%.tmp2464 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2463, i32 0, i32 0
%.tmp2465 = load %m2437$.Type.type*, %m2437$.Type.type** %t
%.tmp2466 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2465, i32 0, i32 0
%.tmp2467 = load i8*, i8** %.tmp2466
store i8* %.tmp2467, i8** %.tmp2464
%.tmp2468 = load %m2437$.Type.type*, %m2437$.Type.type** %clone.2446
%.tmp2469 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2468, i32 0, i32 1
%.tmp2470 = load %m2437$.Type.type*, %m2437$.Type.type** %t
%.tmp2471 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2470, i32 0, i32 1
%.tmp2472 = load i8*, i8** %.tmp2471
store i8* %.tmp2472, i8** %.tmp2469
%.tmp2473 = load %m2437$.Type.type*, %m2437$.Type.type** %clone.2446
ret %m2437$.Type.type* %.tmp2473
}
define i8* @m229$get_root.cp() {
%.tmp2475 = getelementptr [12 x i8], [12 x i8]*@.str2474, i32 0, i32 0
%.tmp2476 = call i8*(i8*) @getenv(i8* %.tmp2475)
%project_root.2477 = alloca i8*
store i8* %.tmp2476, i8** %project_root.2477
%.tmp2478 = load i8*, i8** %project_root.2477
%.tmp2479 = icmp eq i8* %.tmp2478, null
br i1 %.tmp2479, label %.if.true.2480, label %.if.false.2480
.if.true.2480:
%.tmp2482 = getelementptr [5 x i8], [5 x i8]*@.str2481, i32 0, i32 0
%.tmp2483 = call i8*(i8*) @getenv(i8* %.tmp2482)
%home.2484 = alloca i8*
store i8* %.tmp2483, i8** %home.2484
%.tmp2485 = getelementptr i8*, i8** %project_root.2477, i32 0
%.tmp2487 = getelementptr [11 x i8], [11 x i8]*@.str2486, i32 0, i32 0
%.tmp2488 = load i8*, i8** %home.2484
%.tmp2489 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2485, i8* %.tmp2487, i8* %.tmp2488)
br label %.if.end.2480
.if.false.2480:
br label %.if.end.2480
.if.end.2480:
%.tmp2490 = load i8*, i8** %project_root.2477
ret i8* %.tmp2490
}
define %m2437$.Type.type* @m229$new_type.m2437$.Type.typep() {
%.tmp2491 = getelementptr %m2437$.Type.type, %m2437$.Type.type* null, i32 1
%.tmp2492 = ptrtoint %m2437$.Type.type* %.tmp2491 to i32
%.tmp2493 = call i8*(i32) @malloc(i32 %.tmp2492)
%.tmp2494 = bitcast i8* %.tmp2493 to %m2437$.Type.type*
%type.2495 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp2494, %m2437$.Type.type** %type.2495
%.tmp2496 = load %m2437$.Type.type*, %m2437$.Type.type** %type.2495
%.tmp2497 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2496, i32 0, i32 1
store i8* null, i8** %.tmp2497
%.tmp2498 = load %m2437$.Type.type*, %m2437$.Type.type** %type.2495
%.tmp2499 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2498, i32 0, i32 2
store i8* null, i8** %.tmp2499
%.tmp2500 = load %m2437$.Type.type*, %m2437$.Type.type** %type.2495
%.tmp2501 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2500, i32 0, i32 0
store i8* null, i8** %.tmp2501
%.tmp2502 = load %m2437$.Type.type*, %m2437$.Type.type** %type.2495
%.tmp2503 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2502, i32 0, i32 3
store %m2437$.Type.type* null, %m2437$.Type.type** %.tmp2503
%.tmp2504 = load %m2437$.Type.type*, %m2437$.Type.type** %type.2495
%.tmp2505 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2504, i32 0, i32 4
store %m2437$.Type.type* null, %m2437$.Type.type** %.tmp2505
%.tmp2506 = load %m2437$.Type.type*, %m2437$.Type.type** %type.2495
ret %m2437$.Type.type* %.tmp2506
}
define void @m229$copy_type.v.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.dest.arg, %m2437$.Type.type* %.src.arg) {
%dest = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.dest.arg, %m2437$.Type.type** %dest
%src = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.src.arg, %m2437$.Type.type** %src
%.tmp2507 = load %m2437$.Type.type*, %m2437$.Type.type** %dest
%.tmp2508 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2507, i32 0, i32 0
%.tmp2509 = load %m2437$.Type.type*, %m2437$.Type.type** %src
%.tmp2510 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2509, i32 0, i32 0
%.tmp2511 = load i8*, i8** %.tmp2510
store i8* %.tmp2511, i8** %.tmp2508
%.tmp2512 = load %m2437$.Type.type*, %m2437$.Type.type** %dest
%.tmp2513 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2512, i32 0, i32 1
%.tmp2514 = load %m2437$.Type.type*, %m2437$.Type.type** %src
%.tmp2515 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2514, i32 0, i32 1
%.tmp2516 = load i8*, i8** %.tmp2515
store i8* %.tmp2516, i8** %.tmp2513
%.tmp2517 = load %m2437$.Type.type*, %m2437$.Type.type** %dest
%.tmp2518 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2517, i32 0, i32 2
%.tmp2519 = load %m2437$.Type.type*, %m2437$.Type.type** %src
%.tmp2520 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2519, i32 0, i32 2
%.tmp2521 = load i8*, i8** %.tmp2520
store i8* %.tmp2521, i8** %.tmp2518
%.tmp2522 = load %m2437$.Type.type*, %m2437$.Type.type** %dest
%.tmp2523 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2522, i32 0, i32 3
%.tmp2524 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp2523
%.tmp2525 = load %m2437$.Type.type*, %m2437$.Type.type** %src
%.tmp2526 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2525, i32 0, i32 3
%.tmp2527 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp2526
%.tmp2528 = icmp ne %m2437$.Type.type* %.tmp2524, %.tmp2527
br i1 %.tmp2528, label %.if.true.2529, label %.if.false.2529
.if.true.2529:
%.tmp2530 = load %m2437$.Type.type*, %m2437$.Type.type** %dest
%.tmp2531 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2530, i32 0, i32 3
%.tmp2532 = load %m2437$.Type.type*, %m2437$.Type.type** %src
%.tmp2533 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2532, i32 0, i32 3
%.tmp2534 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp2533
store %m2437$.Type.type* %.tmp2534, %m2437$.Type.type** %.tmp2531
%.tmp2535 = load %m2437$.Type.type*, %m2437$.Type.type** %dest
%.tmp2536 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2535, i32 0, i32 3
%.tmp2537 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp2536
%.tmp2538 = load %m2437$.Type.type*, %m2437$.Type.type** %src
%.tmp2539 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2538, i32 0, i32 3
%.tmp2540 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp2539
call void(%m2437$.Type.type*,%m2437$.Type.type*) @m229$copy_type.v.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.tmp2537, %m2437$.Type.type* %.tmp2540)
br label %.if.end.2529
.if.false.2529:
br label %.if.end.2529
.if.end.2529:
%.tmp2541 = load %m2437$.Type.type*, %m2437$.Type.type** %dest
%.tmp2542 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2541, i32 0, i32 4
%.tmp2543 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp2542
%.tmp2544 = load %m2437$.Type.type*, %m2437$.Type.type** %src
%.tmp2545 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2544, i32 0, i32 4
%.tmp2546 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp2545
%.tmp2547 = icmp ne %m2437$.Type.type* %.tmp2543, %.tmp2546
br i1 %.tmp2547, label %.if.true.2548, label %.if.false.2548
.if.true.2548:
%.tmp2549 = load %m2437$.Type.type*, %m2437$.Type.type** %dest
%.tmp2550 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2549, i32 0, i32 4
%.tmp2551 = load %m2437$.Type.type*, %m2437$.Type.type** %src
%.tmp2552 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2551, i32 0, i32 4
%.tmp2553 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp2552
store %m2437$.Type.type* %.tmp2553, %m2437$.Type.type** %.tmp2550
%.tmp2554 = load %m2437$.Type.type*, %m2437$.Type.type** %dest
%.tmp2555 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2554, i32 0, i32 4
%.tmp2556 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp2555
%.tmp2557 = load %m2437$.Type.type*, %m2437$.Type.type** %src
%.tmp2558 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp2557, i32 0, i32 4
%.tmp2559 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp2558
call void(%m2437$.Type.type*,%m2437$.Type.type*) @m229$copy_type.v.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.tmp2556, %m2437$.Type.type* %.tmp2559)
br label %.if.end.2548
.if.false.2548:
br label %.if.end.2548
.if.end.2548:
ret void
}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m2437$.AssignableInfo.type* @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.node.arg) {
%node = alloca %m812$.Node.type*
store %m812$.Node.type* %.node.arg, %m812$.Node.type** %node
%.tmp2560 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* null, i32 1
%.tmp2561 = ptrtoint %m2437$.AssignableInfo.type* %.tmp2560 to i32
%.tmp2562 = call i8*(i32) @malloc(i32 %.tmp2561)
%.tmp2563 = bitcast i8* %.tmp2562 to %m2437$.AssignableInfo.type*
%ptr.2564 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp2563, %m2437$.AssignableInfo.type** %ptr.2564
%.tmp2565 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %ptr.2564
%.tmp2566 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2565, i32 0, i32 1
%.tmp2567 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2567, i8* %.tmp2566
%.tmp2568 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %ptr.2564
%.tmp2569 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2568, i32 0, i32 0
store i8* null, i8** %.tmp2569
%.tmp2570 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %ptr.2564
%.tmp2571 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2570, i32 0, i32 3
store i8* null, i8** %.tmp2571
%.tmp2572 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %ptr.2564
%.tmp2573 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2572, i32 0, i32 2
%.tmp2575 = getelementptr [1 x i8], [1 x i8]*@.str2574, i32 0, i32 0
store i8* %.tmp2575, i8** %.tmp2573
%.tmp2576 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %ptr.2564
%.tmp2577 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2576, i32 0, i32 4
store %m2437$.Type.type* null, %m2437$.Type.type** %.tmp2577
%.tmp2578 = load %m812$.Node.type*, %m812$.Node.type** %node
%.tmp2579 = icmp ne %m812$.Node.type* %.tmp2578, null
br i1 %.tmp2579, label %.if.true.2580, label %.if.false.2580
.if.true.2580:
%.tmp2581 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %ptr.2564
%.tmp2582 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2581, i32 0, i32 5
%.tmp2583 = load %m812$.Node.type*, %m812$.Node.type** %node
%.tmp2584 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2583, i32 0, i32 3
%.tmp2585 = load i32, i32* %.tmp2584
store i32 %.tmp2585, i32* %.tmp2582
%.tmp2586 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %ptr.2564
%.tmp2587 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2586, i32 0, i32 6
%.tmp2588 = load %m812$.Node.type*, %m812$.Node.type** %node
%.tmp2589 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2588, i32 0, i32 4
%.tmp2590 = load i32, i32* %.tmp2589
store i32 %.tmp2590, i32* %.tmp2587
%.tmp2591 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %ptr.2564
%.tmp2592 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2591, i32 0, i32 7
%.tmp2593 = load %m812$.Node.type*, %m812$.Node.type** %node
%.tmp2594 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2593, i32 0, i32 2
%.tmp2595 = load i8*, i8** %.tmp2594
store i8* %.tmp2595, i8** %.tmp2592
br label %.if.end.2580
.if.false.2580:
%.tmp2596 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %ptr.2564
%.tmp2597 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2596, i32 0, i32 5
store i32 0, i32* %.tmp2597
%.tmp2598 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %ptr.2564
%.tmp2599 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2598, i32 0, i32 6
store i32 0, i32* %.tmp2599
%.tmp2600 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %ptr.2564
%.tmp2601 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2600, i32 0, i32 7
store i8* null, i8** %.tmp2601
br label %.if.end.2580
.if.end.2580:
%.tmp2602 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %ptr.2564
ret %m2437$.AssignableInfo.type* %.tmp2602
}
define void @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.info.arg, %m2437$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2603 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp2604 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2603, i32 0, i32 0
%.tmp2605 = load i8*, i8** %id
store i8* %.tmp2605, i8** %.tmp2604
%.tmp2606 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp2607 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2606, i32 0, i32 1
%.tmp2608 = load i8, i8* %scope
store i8 %.tmp2608, i8* %.tmp2607
ret void
}
define i8* @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.info.arg) {
%info = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.info.arg, %m2437$.AssignableInfo.type** %info
%.tmp2609 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp2610 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2609, i32 0, i32 1
%.tmp2611 = load i8, i8* %.tmp2610
%.tmp2612 = load i8, i8* @SCOPE_CONST
%.tmp2613 = icmp eq i8 %.tmp2611, %.tmp2612
br i1 %.tmp2613, label %.if.true.2614, label %.if.false.2614
.if.true.2614:
%.tmp2615 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp2616 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2615, i32 0, i32 0
%.tmp2617 = load i8*, i8** %.tmp2616
ret i8* %.tmp2617
br label %.if.end.2614
.if.false.2614:
br label %.if.end.2614
.if.end.2614:
%buf.2618 = alloca i8*
store i8* null, i8** %buf.2618
%.tmp2619 = getelementptr i8*, i8** %buf.2618, i32 0
%.tmp2621 = getelementptr [5 x i8], [5 x i8]*@.str2620, i32 0, i32 0
%.tmp2622 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp2623 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2622, i32 0, i32 1
%.tmp2624 = load i8, i8* %.tmp2623
%.tmp2625 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp2626 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp2625, i32 0, i32 0
%.tmp2627 = load i8*, i8** %.tmp2626
%.tmp2628 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2619, i8* %.tmp2621, i8 %.tmp2624, i8* %.tmp2627)
%.tmp2629 = load i8*, i8** %buf.2618
ret i8* %.tmp2629
}
define i1 @m229$is_same_type.b.m2437$.CompilerCtx.typep.m2437$.Type.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.Type.type* %.a.arg, %m2437$.Type.type* %.b.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%a = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.a.arg, %m2437$.Type.type** %a
%b = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.b.arg, %m2437$.Type.type** %b
%.tmp2630 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2631 = load %m2437$.Type.type*, %m2437$.Type.type** %a
%.tmp2632 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp2630, %m2437$.Type.type* %.tmp2631)
%a_repr.2633 = alloca i8*
store i8* %.tmp2632, i8** %a_repr.2633
%.tmp2634 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2635 = load %m2437$.Type.type*, %m2437$.Type.type** %b
%.tmp2636 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp2634, %m2437$.Type.type* %.tmp2635)
%b_repr.2637 = alloca i8*
store i8* %.tmp2636, i8** %b_repr.2637
%.tmp2638 = load i8*, i8** %a_repr.2633
%.tmp2639 = load i8*, i8** %b_repr.2637
%.tmp2640 = call i32(i8*,i8*) @strcmp(i8* %.tmp2638, i8* %.tmp2639)
%.tmp2641 = icmp eq i32 %.tmp2640, 0
ret i1 %.tmp2641
}
define void @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%info = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.info.arg, %m2437$.AssignableInfo.type** %info
%tmp_buff.2642 = alloca i8*
store i8* null, i8** %tmp_buff.2642
%.tmp2643 = getelementptr i8*, i8** %tmp_buff.2642, i32 0
%.tmp2645 = getelementptr [7 x i8], [7 x i8]*@.str2644, i32 0, i32 0
%.tmp2646 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2647 = call i32(%m2437$.CompilerCtx.type*) @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp2646)
%.tmp2648 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2643, i8* %.tmp2645, i32 %.tmp2647)
%.tmp2649 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp2650 = load i8, i8* @SCOPE_LOCAL
%.tmp2651 = load i8*, i8** %tmp_buff.2642
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp2649, i8 %.tmp2650, i8* %.tmp2651)
ret void
}
define %m2437$.ModuleLookup.type* @m229$get_module.m2437$.ModuleLookup.typep.m2437$.CompilerCtx.typep.cp(%m2437$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2653 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2654 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2653, i32 0, i32 6
%.tmp2655 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %.tmp2654
%m.2656 = alloca %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* %.tmp2655, %m2437$.ModuleLookup.type** %m.2656
br label %.for.start.2652
.for.start.2652:
%.tmp2657 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.2656
%.tmp2658 = icmp ne %m2437$.ModuleLookup.type* %.tmp2657, null
br i1 %.tmp2658, label %.for.continue.2652, label %.for.end.2652
.for.continue.2652:
%.tmp2659 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.2656
%.tmp2660 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp2659, i32 0, i32 0
%.tmp2661 = load i8*, i8** %.tmp2660
%.tmp2662 = load i8*, i8** %filename
%.tmp2663 = call i32(i8*,i8*) @strcmp(i8* %.tmp2661, i8* %.tmp2662)
%.tmp2664 = icmp eq i32 %.tmp2663, 0
br i1 %.tmp2664, label %.if.true.2665, label %.if.false.2665
.if.true.2665:
%.tmp2666 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.2656
ret %m2437$.ModuleLookup.type* %.tmp2666
br label %.if.end.2665
.if.false.2665:
br label %.if.end.2665
.if.end.2665:
%.tmp2667 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.2656
%.tmp2668 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp2667, i32 0, i32 2
%.tmp2669 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %.tmp2668
store %m2437$.ModuleLookup.type* %.tmp2669, %m2437$.ModuleLookup.type** %m.2656
br label %.for.start.2652
.for.end.2652:
%.tmp2670 = bitcast ptr null to %m2437$.ModuleLookup.type*
ret %m2437$.ModuleLookup.type* %.tmp2670
}
define %m2437$.ModuleLookup.type* @m229$get_current_module.m2437$.ModuleLookup.typep.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%.tmp2671 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2672 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2673 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2672, i32 0, i32 7
%.tmp2674 = load i8*, i8** %.tmp2673
%.tmp2675 = call %m2437$.ModuleLookup.type*(%m2437$.CompilerCtx.type*,i8*) @m229$get_module.m2437$.ModuleLookup.typep.m2437$.CompilerCtx.typep.cp(%m2437$.CompilerCtx.type* %.tmp2671, i8* %.tmp2674)
ret %m2437$.ModuleLookup.type* %.tmp2675
}
define i32 @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%.tmp2676 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2677 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2676, i32 0, i32 5
%.tmp2678 = load i32, i32* %.tmp2677
%uid.2679 = alloca i32
store i32 %.tmp2678, i32* %uid.2679
%.tmp2680 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2681 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2680, i32 0, i32 5
%.tmp2682 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2683 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2682, i32 0, i32 5
%.tmp2684 = load i32, i32* %.tmp2683
%.tmp2685 = add i32 %.tmp2684, 1
store i32 %.tmp2685, i32* %.tmp2681
%.tmp2686 = load i32, i32* %uid.2679
ret i32 %.tmp2686
}
define %m2437$.CompilerCtx.type* @m229$new_context.m2437$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2687 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* null, i32 1
%.tmp2688 = ptrtoint %m2437$.CompilerCtx.type* %.tmp2687 to i32
%.tmp2689 = call i8*(i32) @malloc(i32 %.tmp2688)
%.tmp2690 = bitcast i8* %.tmp2689 to %m2437$.CompilerCtx.type*
%ctx.2691 = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.tmp2690, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2692 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2693 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2692, i32 0, i32 1
%.tmp2694 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2694, %m0$.File.type** %.tmp2693
%.tmp2695 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2696 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2695, i32 0, i32 0
%.tmp2697 = bitcast ptr null to %m812$.Node.type*
store %m812$.Node.type* %.tmp2697, %m812$.Node.type** %.tmp2696
%.tmp2698 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2699 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2698, i32 0, i32 2
store %m2437$.ErrorList.type* null, %m2437$.ErrorList.type** %.tmp2699
%.tmp2700 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2701 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2700, i32 0, i32 5
store i32 0, i32* %.tmp2701
%.tmp2702 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2703 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2702, i32 0, i32 3
store %m2437$.GlobalName.type* null, %m2437$.GlobalName.type** %.tmp2703
%.tmp2704 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2705 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2704, i32 0, i32 8
store %m2437$.AnonFn.type* null, %m2437$.AnonFn.type** %.tmp2705
%.tmp2706 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2707 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2706, i32 0, i32 7
%.tmp2708 = load i8*, i8** %filename
store i8* %.tmp2708, i8** %.tmp2707
%.tmp2709 = call i8*() @m1985$grammar.cp()
%.tmp2710 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2709)
%grammar_file.2711 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2710, %m0$.File.type** %grammar_file.2711
%.tmp2712 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2711
%.tmp2713 = icmp eq %m0$.File.type* %.tmp2712, null
br i1 %.tmp2713, label %.if.true.2714, label %.if.false.2714
.if.true.2714:
%.tmp2715 = bitcast ptr null to %m2437$.CompilerCtx.type*
ret %m2437$.CompilerCtx.type* %.tmp2715
br label %.if.end.2714
.if.false.2714:
br label %.if.end.2714
.if.end.2714:
%.tmp2716 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2711
%.tmp2717 = call %m812$.ParsingContext.type*(%m0$.File.type*) @m812$new_context.m812$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2716)
%grammar_ctx.2718 = alloca %m812$.ParsingContext.type*
store %m812$.ParsingContext.type* %.tmp2717, %m812$.ParsingContext.type** %grammar_ctx.2718
%.tmp2719 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2711
%.tmp2720 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp2719)
%.tmp2721 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2722 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2721, i32 0, i32 4
%.tmp2723 = load %m812$.ParsingContext.type*, %m812$.ParsingContext.type** %grammar_ctx.2718
%.tmp2724 = call %m812$.Rule.type**(%m812$.ParsingContext.type*) @m812$parse_grammar.m812$.Rule.typepp.m812$.ParsingContext.typep(%m812$.ParsingContext.type* %.tmp2723)
store %m812$.Rule.type** %.tmp2724, %m812$.Rule.type*** %.tmp2722
%.tmp2725 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2726 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2725, i32 0, i32 6
%.tmp2727 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* null, i32 1
%.tmp2728 = ptrtoint %m2437$.ModuleLookup.type* %.tmp2727 to i32
%.tmp2729 = call i8*(i32) @malloc(i32 %.tmp2728)
%.tmp2730 = bitcast i8* %.tmp2729 to %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* %.tmp2730, %m2437$.ModuleLookup.type** %.tmp2726
%.tmp2731 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2732 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2731, i32 0, i32 6
%.tmp2733 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %.tmp2732
%.tmp2734 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp2733, i32 0, i32 0
%.tmp2735 = load i8*, i8** %filename
store i8* %.tmp2735, i8** %.tmp2734
%.tmp2736 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2737 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2736, i32 0, i32 6
%.tmp2738 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %.tmp2737
%.tmp2739 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp2738, i32 0, i32 3
store %m2437$.Scope.type* null, %m2437$.Scope.type** %.tmp2739
%.tmp2740 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2741 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2740, i32 0, i32 6
%.tmp2742 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %.tmp2741
%.tmp2743 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp2742, i32 0, i32 1
%.tmp2745 = getelementptr [1 x i8], [1 x i8]*@.str2744, i32 0, i32 0
store i8* %.tmp2745, i8** %.tmp2743
%.tmp2746 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2747 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2746, i32 0, i32 6
%.tmp2748 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %.tmp2747
%.tmp2749 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp2748, i32 0, i32 2
store %m2437$.ModuleLookup.type* null, %m2437$.ModuleLookup.type** %.tmp2749
%.tmp2750 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx.2691
%.tmp2751 = bitcast %m2437$.CompilerCtx.type* %.tmp2750 to %m2437$.CompilerCtx.type*
ret %m2437$.CompilerCtx.type* %.tmp2751
}
define void @m229$push_scope.v.m2437$.CompilerCtx.typep.cp.cp.cp(%m2437$.CompilerCtx.type* %.ctx.arg, i8* %.type.arg, i8* %.begin_id.arg, i8* %.end_id.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%type = alloca i8*
store i8* %.type.arg, i8** %type
%begin_id = alloca i8*
store i8* %.begin_id.arg, i8** %begin_id
%end_id = alloca i8*
store i8* %.end_id.arg, i8** %end_id
%.tmp2752 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* null, i32 1
%.tmp2753 = ptrtoint %m2437$.Scope.type* %.tmp2752 to i32
%.tmp2754 = call i8*(i32) @malloc(i32 %.tmp2753)
%.tmp2755 = bitcast i8* %.tmp2754 to %m2437$.Scope.type*
%s.2756 = alloca %m2437$.Scope.type*
store %m2437$.Scope.type* %.tmp2755, %m2437$.Scope.type** %s.2756
%.tmp2757 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2758 = call %m2437$.ModuleLookup.type*(%m2437$.CompilerCtx.type*) @m229$get_current_module.m2437$.ModuleLookup.typep.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp2757)
%m.2759 = alloca %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* %.tmp2758, %m2437$.ModuleLookup.type** %m.2759
%.tmp2760 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.2756
%.tmp2761 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp2760, i32 0, i32 5
%.tmp2762 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.2759
%.tmp2763 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp2762, i32 0, i32 3
%.tmp2764 = load %m2437$.Scope.type*, %m2437$.Scope.type** %.tmp2763
store %m2437$.Scope.type* %.tmp2764, %m2437$.Scope.type** %.tmp2761
%.tmp2765 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.2756
%.tmp2766 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp2765, i32 0, i32 1
store %m2437$.ScopeItem.type* null, %m2437$.ScopeItem.type** %.tmp2766
%.tmp2767 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.2756
%.tmp2768 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp2767, i32 0, i32 2
%.tmp2769 = load i8*, i8** %type
store i8* %.tmp2769, i8** %.tmp2768
%.tmp2770 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.2756
%.tmp2771 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp2770, i32 0, i32 3
%.tmp2772 = load i8*, i8** %begin_id
store i8* %.tmp2772, i8** %.tmp2771
%.tmp2773 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.2756
%.tmp2774 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp2773, i32 0, i32 4
%.tmp2775 = load i8*, i8** %end_id
store i8* %.tmp2775, i8** %.tmp2774
%.tmp2776 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.2759
%.tmp2777 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp2776, i32 0, i32 3
%.tmp2778 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.2756
store %m2437$.Scope.type* %.tmp2778, %m2437$.Scope.type** %.tmp2777
ret void
}
define void @m229$pop_scope.v.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%.tmp2779 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2780 = call %m2437$.ModuleLookup.type*(%m2437$.CompilerCtx.type*) @m229$get_current_module.m2437$.ModuleLookup.typep.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp2779)
%m.2781 = alloca %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* %.tmp2780, %m2437$.ModuleLookup.type** %m.2781
%.tmp2782 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.2781
%.tmp2783 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp2782, i32 0, i32 3
%.tmp2784 = load %m2437$.Scope.type*, %m2437$.Scope.type** %.tmp2783
%.tmp2785 = icmp ne %m2437$.Scope.type* %.tmp2784, null
%.tmp2787 = getelementptr [61 x i8], [61 x i8]*@.str2786, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2785, i8* %.tmp2787)
%.tmp2788 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.2781
%.tmp2789 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp2788, i32 0, i32 3
%.tmp2790 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.2781
%.tmp2791 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp2790, i32 0, i32 3
%.tmp2792 = load %m2437$.Scope.type*, %m2437$.Scope.type** %.tmp2791
%.tmp2793 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp2792, i32 0, i32 5
%.tmp2794 = load %m2437$.Scope.type*, %m2437$.Scope.type** %.tmp2793
store %m2437$.Scope.type* %.tmp2794, %m2437$.Scope.type** %.tmp2789
ret void
}
define i1 @m229$compile_file.b.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2795 = call i8*() @m1985$grammar.cp()
%.tmp2796 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2795)
%grammar_file.2797 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2796, %m0$.File.type** %grammar_file.2797
%.tmp2798 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2797
%.tmp2799 = icmp eq %m0$.File.type* %.tmp2798, null
br i1 %.tmp2799, label %.if.true.2800, label %.if.false.2800
.if.true.2800:
ret i1 0
br label %.if.end.2800
.if.false.2800:
br label %.if.end.2800
.if.end.2800:
%.tmp2801 = load i8*, i8** %filepath
%.tmp2802 = load i32, i32* @O_RDONLY
%.tmp2803 = call i32(i8*,i32) @open(i8* %.tmp2801, i32 %.tmp2802)
%input_fd.2804 = alloca i32
store i32 %.tmp2803, i32* %input_fd.2804
%.tmp2805 = load i32, i32* %input_fd.2804
%.tmp2806 = icmp sle i32 %.tmp2805, 0
br i1 %.tmp2806, label %.if.true.2807, label %.if.false.2807
.if.true.2807:
%err_msg.2808 = alloca i8*
store i8* null, i8** %err_msg.2808
%.tmp2809 = getelementptr i8*, i8** %err_msg.2808, i32 0
%.tmp2811 = getelementptr [26 x i8], [26 x i8]*@.str2810, i32 0, i32 0
%.tmp2812 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp2813 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2809, i8* %.tmp2811, %m812$.Node.type* %.tmp2812)
%.tmp2814 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2815 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp2816 = load i8*, i8** %err_msg.2808
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp2814, %m812$.Node.type* %.tmp2815, i8* %.tmp2816)
ret i1 0
br label %.if.end.2807
.if.false.2807:
br label %.if.end.2807
.if.end.2807:
%.tmp2817 = load i32, i32* %input_fd.2804
%.tmp2818 = call %m232$.PeekerInfo.type*(i32) @m232$new.m232$.PeekerInfo.typep.i(i32 %.tmp2817)
%p.2819 = alloca %m232$.PeekerInfo.type*
store %m232$.PeekerInfo.type* %.tmp2818, %m232$.PeekerInfo.type** %p.2819
%.tmp2820 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p.2819
%.tmp2821 = getelementptr %m232$.PeekerInfo.type, %m232$.PeekerInfo.type* %.tmp2820, i32 0, i32 6
%.tmp2822 = load i8*, i8** %filepath
store i8* %.tmp2822, i8** %.tmp2821
%.tmp2823 = load %m232$.PeekerInfo.type*, %m232$.PeekerInfo.type** %p.2819
%.tmp2824 = call %m231$.Token.type*(%m232$.PeekerInfo.type*,i1) @m231$tokenize.m231$.Token.typep.m232$.PeekerInfo.typep.b(%m232$.PeekerInfo.type* %.tmp2823, i1 0)
%tokens.2825 = alloca %m231$.Token.type*
store %m231$.Token.type* %.tmp2824, %m231$.Token.type** %tokens.2825
%.tmp2826 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2827 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2826, i32 0, i32 4
%.tmp2828 = load %m812$.Rule.type**, %m812$.Rule.type*** %.tmp2827
%.tmp2830 = getelementptr [6 x i8], [6 x i8]*@.str2829, i32 0, i32 0
%.tmp2831 = load %m231$.Token.type*, %m231$.Token.type** %tokens.2825
%.tmp2832 = call %m812$.ParseResult.type*(%m812$.Rule.type**,i8*,%m231$.Token.type*) @m812$ast.m812$.ParseResult.typep.m812$.Rule.typepp.cp.m231$.Token.typep(%m812$.Rule.type** %.tmp2828, i8* %.tmp2830, %m231$.Token.type* %.tmp2831)
%ast.2833 = alloca %m812$.ParseResult.type*
store %m812$.ParseResult.type* %.tmp2832, %m812$.ParseResult.type** %ast.2833
%.tmp2834 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %ast.2833
%.tmp2835 = getelementptr %m812$.ParseResult.type, %m812$.ParseResult.type* %.tmp2834, i32 0, i32 0
%.tmp2836 = load %m230$.Error.type*, %m230$.Error.type** %.tmp2835
%.tmp2837 = icmp ne %m230$.Error.type* %.tmp2836, null
br i1 %.tmp2837, label %.if.true.2838, label %.if.false.2838
.if.true.2838:
%.tmp2839 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2840 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %ast.2833
%.tmp2841 = getelementptr %m812$.ParseResult.type, %m812$.ParseResult.type* %.tmp2840, i32 0, i32 0
%.tmp2842 = load %m230$.Error.type*, %m230$.Error.type** %.tmp2841
call void(%m2437$.CompilerCtx.type*,%m230$.Error.type*) @m229$append_error.v.m2437$.CompilerCtx.typep.m230$.Error.typep(%m2437$.CompilerCtx.type* %.tmp2839, %m230$.Error.type* %.tmp2842)
br label %.if.end.2838
.if.false.2838:
br label %.if.end.2838
.if.end.2838:
%.tmp2843 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2844 = load %m812$.ParseResult.type*, %m812$.ParseResult.type** %ast.2833
%.tmp2845 = getelementptr %m812$.ParseResult.type, %m812$.ParseResult.type* %.tmp2844, i32 0, i32 1
%.tmp2846 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2845
%.tmp2847 = call i1(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile.b.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp2843, %m812$.Node.type* %.tmp2846)
ret i1 %.tmp2847
}
define i1 @m229$compile.b.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.ast.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%ast = alloca %m812$.Node.type*
store %m812$.Node.type* %.ast.arg, %m812$.Node.type** %ast
%.tmp2848 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2849 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2848, i32 0, i32 2
%.tmp2850 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %.tmp2849
%.tmp2851 = icmp eq %m2437$.ErrorList.type* %.tmp2850, null
br i1 %.tmp2851, label %.if.true.2852, label %.if.false.2852
.if.true.2852:
%.tmp2853 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2854 = load %m812$.Node.type*, %m812$.Node.type** %ast
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_ast.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp2853, %m812$.Node.type* %.tmp2854)
br label %.if.end.2852
.if.false.2852:
br label %.if.end.2852
.if.end.2852:
%.tmp2855 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2856 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2855, i32 0, i32 2
%.tmp2857 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %.tmp2856
%.tmp2858 = icmp ne %m2437$.ErrorList.type* %.tmp2857, null
br i1 %.tmp2858, label %.if.true.2859, label %.if.false.2859
.if.true.2859:
%.tmp2861 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2862 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2861, i32 0, i32 2
%.tmp2863 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %.tmp2862
%err.2864 = alloca %m2437$.ErrorList.type*
store %m2437$.ErrorList.type* %.tmp2863, %m2437$.ErrorList.type** %err.2864
br label %.for.start.2860
.for.start.2860:
%.tmp2865 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %err.2864
%.tmp2866 = icmp ne %m2437$.ErrorList.type* %.tmp2865, null
br i1 %.tmp2866, label %.for.continue.2860, label %.for.end.2860
.for.continue.2860:
%.tmp2867 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %err.2864
%.tmp2868 = getelementptr %m2437$.ErrorList.type, %m2437$.ErrorList.type* %.tmp2867, i32 0, i32 2
%.tmp2869 = load i1, i1* %.tmp2868
%.tmp2870 = icmp eq i1 %.tmp2869, 0
br i1 %.tmp2870, label %.if.true.2871, label %.if.false.2871
.if.true.2871:
%.tmp2872 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %err.2864
%.tmp2873 = getelementptr %m2437$.ErrorList.type, %m2437$.ErrorList.type* %.tmp2872, i32 0, i32 0
%.tmp2874 = load %m230$.Error.type*, %m230$.Error.type** %.tmp2873
call void(%m230$.Error.type*) @m230$report.v.m230$.Error.typep(%m230$.Error.type* %.tmp2874)
%.tmp2875 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %err.2864
%.tmp2876 = getelementptr %m2437$.ErrorList.type, %m2437$.ErrorList.type* %.tmp2875, i32 0, i32 2
store i1 1, i1* %.tmp2876
br label %.if.end.2871
.if.false.2871:
br label %.if.end.2871
.if.end.2871:
%.tmp2877 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %err.2864
%.tmp2878 = getelementptr %m2437$.ErrorList.type, %m2437$.ErrorList.type* %.tmp2877, i32 0, i32 1
%.tmp2879 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %.tmp2878
store %m2437$.ErrorList.type* %.tmp2879, %m2437$.ErrorList.type** %err.2864
br label %.for.start.2860
.for.end.2860:
ret i1 1
br label %.if.end.2859
.if.false.2859:
br label %.if.end.2859
.if.end.2859:
ret i1 0
}
define void @m229$mark_weak_global.v.m2437$.CompilerCtx.typep.cp(%m2437$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2881 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2882 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2881, i32 0, i32 3
%.tmp2883 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %.tmp2882
%g.2884 = alloca %m2437$.GlobalName.type*
store %m2437$.GlobalName.type* %.tmp2883, %m2437$.GlobalName.type** %g.2884
br label %.for.start.2880
.for.start.2880:
%.tmp2885 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g.2884
%.tmp2886 = icmp ne %m2437$.GlobalName.type* %.tmp2885, null
br i1 %.tmp2886, label %.for.continue.2880, label %.for.end.2880
.for.continue.2880:
%.tmp2887 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g.2884
%.tmp2888 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp2887, i32 0, i32 3
%.tmp2889 = load i1, i1* %.tmp2888
%.tmp2890 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g.2884
%.tmp2891 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp2890, i32 0, i32 0
%.tmp2892 = load i8*, i8** %.tmp2891
%.tmp2893 = load i8*, i8** %id
%.tmp2894 = call i32(i8*,i8*) @strcmp(i8* %.tmp2892, i8* %.tmp2893)
%.tmp2895 = icmp eq i32 %.tmp2894, 0
%.tmp2896 = and i1 %.tmp2889, %.tmp2895
br i1 %.tmp2896, label %.if.true.2897, label %.if.false.2897
.if.true.2897:
%.tmp2898 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g.2884
%.tmp2899 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp2898, i32 0, i32 2
store i1 1, i1* %.tmp2899
br label %.for.end.2880
br label %.if.end.2897
.if.false.2897:
br label %.if.end.2897
.if.end.2897:
%.tmp2900 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g.2884
%.tmp2901 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp2900, i32 0, i32 5
%.tmp2902 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %.tmp2901
store %m2437$.GlobalName.type* %.tmp2902, %m2437$.GlobalName.type** %g.2884
br label %.for.start.2880
.for.end.2880:
ret void
}
define void @m229$compile_ast.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.ast.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%ast = alloca %m812$.Node.type*
store %m812$.Node.type* %.ast.arg, %m812$.Node.type** %ast
%.tmp2903 = load %m812$.Node.type*, %m812$.Node.type** %ast
%.tmp2904 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2903, i32 0, i32 0
%.tmp2905 = load i8*, i8** %.tmp2904
%.tmp2907 = getelementptr [6 x i8], [6 x i8]*@.str2906, i32 0, i32 0
%.tmp2908 = call i32(i8*,i8*) @strcmp(i8* %.tmp2905, i8* %.tmp2907)
%.tmp2909 = icmp ne i32 %.tmp2908, 0
br i1 %.tmp2909, label %.if.true.2910, label %.if.false.2910
.if.true.2910:
%.tmp2911 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2912 = load %m812$.Node.type*, %m812$.Node.type** %ast
%.tmp2914 = getelementptr [29 x i8], [29 x i8]*@.str2913, i32 0, i32 0
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp2911, %m812$.Node.type* %.tmp2912, i8* %.tmp2914)
ret void
br label %.if.end.2910
.if.false.2910:
br label %.if.end.2910
.if.end.2910:
%.tmp2915 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2917 = getelementptr [7 x i8], [7 x i8]*@.str2916, i32 0, i32 0
%.tmp2918 = bitcast ptr null to i8*
%.tmp2919 = bitcast ptr null to i8*
call void(%m2437$.CompilerCtx.type*,i8*,i8*,i8*) @m229$push_scope.v.m2437$.CompilerCtx.typep.cp.cp.cp(%m2437$.CompilerCtx.type* %.tmp2915, i8* %.tmp2917, i8* %.tmp2918, i8* %.tmp2919)
%.tmp2920 = load %m812$.Node.type*, %m812$.Node.type** %ast
%.tmp2921 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2920, i32 0, i32 6
%.tmp2922 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2921
%start.2923 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp2922, %m812$.Node.type** %start.2923
%.tmp2924 = load %m812$.Node.type*, %m812$.Node.type** %start.2923
%.tmp2925 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2924, i32 0, i32 0
%.tmp2926 = load i8*, i8** %.tmp2925
%.tmp2928 = getelementptr [13 x i8], [13 x i8]*@.str2927, i32 0, i32 0
%.tmp2929 = call i32(i8*,i8*) @strcmp(i8* %.tmp2926, i8* %.tmp2928)
%.tmp2930 = icmp eq i32 %.tmp2929, 0
br i1 %.tmp2930, label %.if.true.2931, label %.if.false.2931
.if.true.2931:
%.tmp2932 = load %m812$.Node.type*, %m812$.Node.type** %start.2923
%.tmp2933 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2932, i32 0, i32 7
%.tmp2934 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2933
store %m812$.Node.type* %.tmp2934, %m812$.Node.type** %start.2923
br label %.if.end.2931
.if.false.2931:
br label %.if.end.2931
.if.end.2931:
%.tmp2936 = load %m812$.Node.type*, %m812$.Node.type** %start.2923
%stmt.2937 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp2936, %m812$.Node.type** %stmt.2937
br label %.for.start.2935
.for.start.2935:
%.tmp2938 = load %m812$.Node.type*, %m812$.Node.type** %stmt.2937
%.tmp2939 = icmp ne %m812$.Node.type* %.tmp2938, null
br i1 %.tmp2939, label %.for.continue.2935, label %.for.end.2935
.for.continue.2935:
%.tmp2940 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2941 = load %m812$.Node.type*, %m812$.Node.type** %stmt.2937
%.tmp2942 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2941, i32 0, i32 6
%.tmp2943 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2942
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i1) @m229$compile_statement.v.m2437$.CompilerCtx.typep.m812$.Node.typep.b(%m2437$.CompilerCtx.type* %.tmp2940, %m812$.Node.type* %.tmp2943, i1 1)
%.tmp2944 = load %m812$.Node.type*, %m812$.Node.type** %stmt.2937
%.tmp2945 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2944, i32 0, i32 7
%.tmp2946 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2945
store %m812$.Node.type* %.tmp2946, %m812$.Node.type** %stmt.2937
br label %.for.start.2935
.for.end.2935:
%.tmp2948 = load %m812$.Node.type*, %m812$.Node.type** %start.2923
%s.2949 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp2948, %m812$.Node.type** %s.2949
br label %.for.start.2947
.for.start.2947:
%.tmp2950 = load %m812$.Node.type*, %m812$.Node.type** %s.2949
%.tmp2951 = icmp ne %m812$.Node.type* %.tmp2950, null
br i1 %.tmp2951, label %.for.continue.2947, label %.for.end.2947
.for.continue.2947:
%.tmp2952 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2953 = load %m812$.Node.type*, %m812$.Node.type** %s.2949
%.tmp2954 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2953, i32 0, i32 6
%.tmp2955 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2954
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i1) @m229$compile_statement.v.m2437$.CompilerCtx.typep.m812$.Node.typep.b(%m2437$.CompilerCtx.type* %.tmp2952, %m812$.Node.type* %.tmp2955, i1 0)
%.tmp2956 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
call void(%m2437$.CompilerCtx.type*) @m229$compile_anon_fn.v.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp2956)
%.tmp2957 = load %m812$.Node.type*, %m812$.Node.type** %s.2949
%.tmp2958 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp2957, i32 0, i32 7
%.tmp2959 = load %m812$.Node.type*, %m812$.Node.type** %.tmp2958
store %m812$.Node.type* %.tmp2959, %m812$.Node.type** %s.2949
br label %.for.start.2947
.for.end.2947:
%.tmp2960 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2961 = call %m2437$.ModuleLookup.type*(%m2437$.CompilerCtx.type*) @m229$get_current_module.m2437$.ModuleLookup.typep.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp2960)
%mod.2962 = alloca %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* %.tmp2961, %m2437$.ModuleLookup.type** %mod.2962
%.tmp2963 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.2962
%.tmp2964 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp2963, i32 0, i32 1
%.tmp2965 = load i8*, i8** %.tmp2964
%.tmp2967 = getelementptr [1 x i8], [1 x i8]*@.str2966, i32 0, i32 0
%.tmp2968 = call i32(i8*,i8*) @strcmp(i8* %.tmp2965, i8* %.tmp2967)
%.tmp2969 = icmp eq i32 %.tmp2968, 0
br i1 %.tmp2969, label %.if.true.2970, label %.if.false.2970
.if.true.2970:
%.tmp2972 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2973 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2972, i32 0, i32 3
%.tmp2974 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %.tmp2973
%g.2975 = alloca %m2437$.GlobalName.type*
store %m2437$.GlobalName.type* %.tmp2974, %m2437$.GlobalName.type** %g.2975
br label %.for.start.2971
.for.start.2971:
%.tmp2976 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g.2975
%.tmp2977 = icmp ne %m2437$.GlobalName.type* %.tmp2976, null
br i1 %.tmp2977, label %.for.continue.2971, label %.for.end.2971
.for.continue.2971:
%.tmp2978 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2979 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g.2975
call void(%m2437$.CompilerCtx.type*,%m2437$.GlobalName.type*) @m229$compile_global.v.m2437$.CompilerCtx.typep.m2437$.GlobalName.typep(%m2437$.CompilerCtx.type* %.tmp2978, %m2437$.GlobalName.type* %.tmp2979)
%.tmp2980 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g.2975
%.tmp2981 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp2980, i32 0, i32 5
%.tmp2982 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %.tmp2981
store %m2437$.GlobalName.type* %.tmp2982, %m2437$.GlobalName.type** %g.2975
br label %.for.start.2971
.for.end.2971:
br label %.if.end.2970
.if.false.2970:
br label %.if.end.2970
.if.end.2970:
ret void
}
define void @m229$compile_global.v.m2437$.CompilerCtx.typep.m2437$.GlobalName.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%g = alloca %m2437$.GlobalName.type*
store %m2437$.GlobalName.type* %.g.arg, %m2437$.GlobalName.type** %g
%.tmp2983 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g
%.tmp2984 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp2983, i32 0, i32 2
%.tmp2985 = load i1, i1* %.tmp2984
br i1 %.tmp2985, label %.if.true.2986, label %.if.false.2986
.if.true.2986:
ret void
br label %.if.end.2986
.if.false.2986:
br label %.if.end.2986
.if.end.2986:
%.tmp2987 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g
%.tmp2988 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp2987, i32 0, i32 1
%.tmp2989 = load i8*, i8** %.tmp2988
%.tmp2991 = getelementptr [7 x i8], [7 x i8]*@.str2990, i32 0, i32 0
%.tmp2992 = call i32(i8*,i8*) @strcmp(i8* %.tmp2989, i8* %.tmp2991)
%.tmp2993 = icmp eq i32 %.tmp2992, 0
br i1 %.tmp2993, label %.if.true.2994, label %.if.false.2994
.if.true.2994:
%.tmp2995 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp2996 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp2995, i32 0, i32 1
%.tmp2997 = load %m0$.File.type*, %m0$.File.type** %.tmp2996
%.tmp2999 = getelementptr [21 x i8], [21 x i8]*@.str2998, i32 0, i32 0
%.tmp3000 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g
%.tmp3001 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp3000, i32 0, i32 4
%.tmp3002 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %.tmp3001
%.tmp3003 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp3002)
%.tmp3004 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3005 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g
%.tmp3006 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp3005, i32 0, i32 4
%.tmp3007 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %.tmp3006
%.tmp3008 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3007, i32 0, i32 4
%.tmp3009 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3008
%.tmp3010 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3004, %m2437$.Type.type* %.tmp3009)
%.tmp3011 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g
%.tmp3012 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp3011, i32 0, i32 0
%.tmp3013 = load i8*, i8** %.tmp3012
%.tmp3014 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2997, i8* %.tmp2999, i8* %.tmp3003, i8* %.tmp3010, i8* %.tmp3013)
br label %.if.end.2994
.if.false.2994:
%.tmp3015 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g
%.tmp3016 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp3015, i32 0, i32 1
%.tmp3017 = load i8*, i8** %.tmp3016
%.tmp3019 = getelementptr [7 x i8], [7 x i8]*@.str3018, i32 0, i32 0
%.tmp3020 = call i32(i8*,i8*) @strcmp(i8* %.tmp3017, i8* %.tmp3019)
%.tmp3021 = icmp eq i32 %.tmp3020, 0
br i1 %.tmp3021, label %.if.true.3022, label %.if.false.3022
.if.true.3022:
%.tmp3023 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3024 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g
%.tmp3025 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp3024, i32 0, i32 4
%.tmp3026 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %.tmp3025
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$compile_extern.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp3023, %m2437$.AssignableInfo.type* %.tmp3026)
br label %.if.end.3022
.if.false.3022:
br label %.if.end.3022
.if.end.3022:
br label %.if.end.2994
.if.end.2994:
%.tmp3027 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g
%.tmp3028 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp3027, i32 0, i32 2
store i1 1, i1* %.tmp3028
ret void
}
define void @m229$compile_extern.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%info = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.info.arg, %m2437$.AssignableInfo.type** %info
%.tmp3029 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3030 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3029, i32 0, i32 1
%.tmp3031 = load %m0$.File.type*, %m0$.File.type** %.tmp3030
%.tmp3033 = getelementptr [15 x i8], [15 x i8]*@.str3032, i32 0, i32 0
%.tmp3034 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3035 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp3036 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3035, i32 0, i32 4
%.tmp3037 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3036
%.tmp3038 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3037, i32 0, i32 3
%.tmp3039 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3038
%.tmp3040 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3034, %m2437$.Type.type* %.tmp3039)
%.tmp3041 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp3042 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp3041)
%.tmp3043 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3031, i8* %.tmp3033, i8* %.tmp3040, i8* %.tmp3042)
%.tmp3045 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp3046 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3045, i32 0, i32 4
%.tmp3047 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3046
%.tmp3048 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3047, i32 0, i32 3
%.tmp3049 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3048
%.tmp3050 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3049, i32 0, i32 4
%.tmp3051 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3050
%pt.3052 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp3051, %m2437$.Type.type** %pt.3052
br label %.for.start.3044
.for.start.3044:
%.tmp3053 = load %m2437$.Type.type*, %m2437$.Type.type** %pt.3052
%.tmp3054 = icmp ne %m2437$.Type.type* %.tmp3053, null
br i1 %.tmp3054, label %.for.continue.3044, label %.for.end.3044
.for.continue.3044:
%.tmp3055 = load %m2437$.Type.type*, %m2437$.Type.type** %pt.3052
%.tmp3056 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp3057 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3056, i32 0, i32 4
%.tmp3058 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3057
%.tmp3059 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3058, i32 0, i32 3
%.tmp3060 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3059
%.tmp3061 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3060, i32 0, i32 4
%.tmp3062 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3061
%.tmp3063 = icmp ne %m2437$.Type.type* %.tmp3055, %.tmp3062
br i1 %.tmp3063, label %.if.true.3064, label %.if.false.3064
.if.true.3064:
%.tmp3065 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3066 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3065, i32 0, i32 1
%.tmp3067 = load %m0$.File.type*, %m0$.File.type** %.tmp3066
%.tmp3069 = getelementptr [3 x i8], [3 x i8]*@.str3068, i32 0, i32 0
%.tmp3070 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3067, i8* %.tmp3069)
br label %.if.end.3064
.if.false.3064:
br label %.if.end.3064
.if.end.3064:
%.tmp3071 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3072 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3071, i32 0, i32 1
%.tmp3073 = load %m0$.File.type*, %m0$.File.type** %.tmp3072
%.tmp3075 = getelementptr [3 x i8], [3 x i8]*@.str3074, i32 0, i32 0
%.tmp3076 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3077 = load %m2437$.Type.type*, %m2437$.Type.type** %pt.3052
%.tmp3078 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3076, %m2437$.Type.type* %.tmp3077)
%.tmp3079 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3073, i8* %.tmp3075, i8* %.tmp3078)
%.tmp3080 = load %m2437$.Type.type*, %m2437$.Type.type** %pt.3052
%.tmp3081 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3080, i32 0, i32 4
%.tmp3082 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3081
store %m2437$.Type.type* %.tmp3082, %m2437$.Type.type** %pt.3052
br label %.for.start.3044
.for.end.3044:
%.tmp3083 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3084 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3083, i32 0, i32 1
%.tmp3085 = load %m0$.File.type*, %m0$.File.type** %.tmp3084
%.tmp3087 = getelementptr [3 x i8], [3 x i8]*@.str3086, i32 0, i32 0
%.tmp3088 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3085, i8* %.tmp3087)
ret void
}
define i8* @m229$get_mod_prefix.cp.m2437$.CompilerCtx.typep.cp(%m2437$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3089 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3090 = call %m2437$.ModuleLookup.type*(%m2437$.CompilerCtx.type*) @m229$get_current_module.m2437$.ModuleLookup.typep.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp3089)
%m.3091 = alloca %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* %.tmp3090, %m2437$.ModuleLookup.type** %m.3091
%.tmp3092 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.3091
%.tmp3093 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3092, i32 0, i32 1
%.tmp3094 = load i8*, i8** %.tmp3093
ret i8* %.tmp3094
}
define i8* @m229$name_mangle.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.fn.arg, i8* %.original_name.arg, %m2437$.Type.type* %.type.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%fn = alloca %m812$.Node.type*
store %m812$.Node.type* %.fn.arg, %m812$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.type.arg, %m2437$.Type.type** %type
%mangled_name.3095 = alloca i8*
store i8* null, i8** %mangled_name.3095
%.tmp3096 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3097 = load %m812$.Node.type*, %m812$.Node.type** %fn
%.tmp3098 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3097, i32 0, i32 2
%.tmp3099 = load i8*, i8** %.tmp3098
%.tmp3100 = call i8*(%m2437$.CompilerCtx.type*,i8*) @m229$get_mod_prefix.cp.m2437$.CompilerCtx.typep.cp(%m2437$.CompilerCtx.type* %.tmp3096, i8* %.tmp3099)
%prefix.3101 = alloca i8*
store i8* %.tmp3100, i8** %prefix.3101
%.tmp3102 = getelementptr i8*, i8** %mangled_name.3095, i32 0
%.tmp3104 = getelementptr [5 x i8], [5 x i8]*@.str3103, i32 0, i32 0
%.tmp3105 = load i8*, i8** %prefix.3101
%.tmp3106 = load i8*, i8** %original_name
%.tmp3107 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3102, i8* %.tmp3104, i8* %.tmp3105, i8* %.tmp3106)
%.tmp3108 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp3109 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3108, i32 0, i32 0
%.tmp3110 = load i8*, i8** %.tmp3109
%.tmp3112 = getelementptr [9 x i8], [9 x i8]*@.str3111, i32 0, i32 0
%.tmp3113 = call i32(i8*,i8*) @strcmp(i8* %.tmp3110, i8* %.tmp3112)
%.tmp3114 = icmp eq i32 %.tmp3113, 0
br i1 %.tmp3114, label %.if.true.3115, label %.if.false.3115
.if.true.3115:
%.tmp3116 = load i8*, i8** %mangled_name.3095
%.tmp3118 = getelementptr [5 x i8], [5 x i8]*@.str3117, i32 0, i32 0
%.tmp3119 = call i32(i8*,i8*) @strcmp(i8* %.tmp3116, i8* %.tmp3118)
%.tmp3120 = icmp ne i32 %.tmp3119, 0
br i1 %.tmp3120, label %.if.true.3121, label %.if.false.3121
.if.true.3121:
%tmp_buff.3122 = alloca i8*
store i8* null, i8** %tmp_buff.3122
%swap_var.3123 = alloca i8*
store i8* null, i8** %swap_var.3123
%.tmp3125 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp3126 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3125, i32 0, i32 3
%.tmp3127 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3126
%tp.3128 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp3127, %m2437$.Type.type** %tp.3128
br label %.for.start.3124
.for.start.3124:
%.tmp3129 = load %m2437$.Type.type*, %m2437$.Type.type** %tp.3128
%.tmp3130 = icmp ne %m2437$.Type.type* %.tmp3129, null
br i1 %.tmp3130, label %.for.continue.3124, label %.for.end.3124
.for.continue.3124:
%.tmp3131 = getelementptr i8*, i8** %tmp_buff.3122, i32 0
%.tmp3133 = getelementptr [6 x i8], [6 x i8]*@.str3132, i32 0, i32 0
%.tmp3134 = load i8*, i8** %mangled_name.3095
%.tmp3135 = load %m2437$.Type.type*, %m2437$.Type.type** %tp.3128
%.tmp3136 = call i8*(%m2437$.Type.type*) @m229$type_abbr.cp.m2437$.Type.typep(%m2437$.Type.type* %.tmp3135)
%.tmp3137 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3131, i8* %.tmp3133, i8* %.tmp3134, i8* %.tmp3136)
%.tmp3138 = load i8*, i8** %tmp_buff.3122
store i8* %.tmp3138, i8** %swap_var.3123
%.tmp3139 = load i8*, i8** %mangled_name.3095
store i8* %.tmp3139, i8** %tmp_buff.3122
%.tmp3140 = load i8*, i8** %swap_var.3123
store i8* %.tmp3140, i8** %mangled_name.3095
%.tmp3141 = load i8*, i8** %tmp_buff.3122
call void(i8*) @free(i8* %.tmp3141)
%.tmp3142 = load %m2437$.Type.type*, %m2437$.Type.type** %tp.3128
%.tmp3143 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3142, i32 0, i32 4
%.tmp3144 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3143
store %m2437$.Type.type* %.tmp3144, %m2437$.Type.type** %tp.3128
br label %.for.start.3124
.for.end.3124:
br label %.if.end.3121
.if.false.3121:
br label %.if.end.3121
.if.end.3121:
br label %.if.end.3115
.if.false.3115:
br label %.if.end.3115
.if.end.3115:
%.tmp3145 = load i8*, i8** %mangled_name.3095
ret i8* %.tmp3145
}
define void @m229$compile_statement.v.m2437$.CompilerCtx.typep.m812$.Node.typep.b(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3146 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* null, %m2437$.AssignableInfo.type** %info.3146
%return_type.3147 = alloca %m2437$.Type.type*
store %m2437$.Type.type* null, %m2437$.Type.type** %return_type.3147
%err_buf.3148 = alloca i8*
store i8* null, i8** %err_buf.3148
%tmp_buff.3149 = alloca i8*
store i8* null, i8** %tmp_buff.3149
%.tmp3150 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3151 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3150, i32 0, i32 0
%.tmp3152 = load i8*, i8** %.tmp3151
%.tmp3154 = getelementptr [3 x i8], [3 x i8]*@.str3153, i32 0, i32 0
%.tmp3155 = call i32(i8*,i8*) @strcmp(i8* %.tmp3152, i8* %.tmp3154)
%.tmp3156 = icmp eq i32 %.tmp3155, 0
br i1 %.tmp3156, label %.if.true.3157, label %.if.false.3157
.if.true.3157:
ret void
br label %.if.end.3157
.if.false.3157:
%.tmp3158 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3159 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3158, i32 0, i32 0
%.tmp3160 = load i8*, i8** %.tmp3159
%.tmp3162 = getelementptr [7 x i8], [7 x i8]*@.str3161, i32 0, i32 0
%.tmp3163 = call i32(i8*,i8*) @strcmp(i8* %.tmp3160, i8* %.tmp3162)
%.tmp3164 = icmp eq i32 %.tmp3163, 0
br i1 %.tmp3164, label %.if.true.3165, label %.if.false.3165
.if.true.3165:
%.tmp3166 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3167 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3166, i32 0, i32 6
%.tmp3168 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3167
%.tmp3170 = getelementptr [11 x i8], [11 x i8]*@.str3169, i32 0, i32 0
%.tmp3171 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp3168, i8* %.tmp3170)
%assignable.3172 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp3171, %m812$.Node.type** %assignable.3172
%.tmp3173 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3174 = load %m812$.Node.type*, %m812$.Node.type** %assignable.3172
%.tmp3175 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_assignable.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp3173, %m812$.Node.type* %.tmp3174)
%a_info.3176 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp3175, %m2437$.AssignableInfo.type** %a_info.3176
%.tmp3177 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.3176
%.tmp3178 = icmp eq %m2437$.AssignableInfo.type* %.tmp3177, null
br i1 %.tmp3178, label %.if.true.3179, label %.if.false.3179
.if.true.3179:
ret void
br label %.if.end.3179
.if.false.3179:
br label %.if.end.3179
.if.end.3179:
%.tmp3180 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3181 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp3180)
store %m2437$.AssignableInfo.type* %.tmp3181, %m2437$.AssignableInfo.type** %info.3146
%.tmp3182 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3183 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3182, i32 0, i32 6
%.tmp3184 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3183
%.tmp3185 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3184, i32 0, i32 7
%.tmp3186 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3185
%.tmp3187 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3186, i32 0, i32 1
%.tmp3188 = load i8*, i8** %.tmp3187
%global_name.3189 = alloca i8*
store i8* %.tmp3188, i8** %global_name.3189
%.tmp3190 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3191 = load i8, i8* @SCOPE_GLOBAL
%.tmp3192 = load i8*, i8** %global_name.3189
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp3190, i8 %.tmp3191, i8* %.tmp3192)
%.tmp3193 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3194 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3193, i32 0, i32 4
%.tmp3195 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.3176
%.tmp3196 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3195, i32 0, i32 4
%.tmp3197 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3196
store %m2437$.Type.type* %.tmp3197, %m2437$.Type.type** %.tmp3194
%.tmp3198 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3199 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3198, i32 0, i32 3
%.tmp3201 = getelementptr [9 x i8], [9 x i8]*@.str3200, i32 0, i32 0
store i8* %.tmp3201, i8** %.tmp3199
%.tmp3202 = load i1, i1* %shallow
%.tmp3203 = icmp eq i1 %.tmp3202, 1
br i1 %.tmp3203, label %.if.true.3204, label %.if.false.3204
.if.true.3204:
%.tmp3205 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3206 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3207 = load i8*, i8** %global_name.3189
%.tmp3208 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*,%m2437$.AssignableInfo.type*) @m229$define_assignable.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp3205, %m812$.Node.type* %.tmp3206, i8* %.tmp3207, %m2437$.AssignableInfo.type* %.tmp3208)
br label %.if.end.3204
.if.false.3204:
%.tmp3209 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3210 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3209, i32 0, i32 1
%.tmp3211 = load %m0$.File.type*, %m0$.File.type** %.tmp3210
%.tmp3213 = getelementptr [21 x i8], [21 x i8]*@.str3212, i32 0, i32 0
%.tmp3214 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3215 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp3214)
%.tmp3216 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3217 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3218 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3217, i32 0, i32 4
%.tmp3219 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3218
%.tmp3220 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3216, %m2437$.Type.type* %.tmp3219)
%.tmp3221 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.3176
%.tmp3222 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp3221)
%.tmp3223 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3211, i8* %.tmp3213, i8* %.tmp3215, i8* %.tmp3220, i8* %.tmp3222)
br label %.if.end.3204
.if.end.3204:
br label %.if.end.3165
.if.false.3165:
%.tmp3224 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3225 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3224, i32 0, i32 0
%.tmp3226 = load i8*, i8** %.tmp3225
%.tmp3228 = getelementptr [10 x i8], [10 x i8]*@.str3227, i32 0, i32 0
%.tmp3229 = call i32(i8*,i8*) @strcmp(i8* %.tmp3226, i8* %.tmp3228)
%.tmp3230 = icmp eq i32 %.tmp3229, 0
br i1 %.tmp3230, label %.if.true.3231, label %.if.false.3231
.if.true.3231:
%.tmp3232 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3233 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3232, i32 0, i32 6
%.tmp3234 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3233
%.tmp3235 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3234, i32 0, i32 7
%.tmp3236 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3235
%.tmp3237 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3236, i32 0, i32 1
%.tmp3238 = load i8*, i8** %.tmp3237
%type_name.3239 = alloca i8*
store i8* %.tmp3238, i8** %type_name.3239
%.tmp3240 = load i1, i1* %shallow
%.tmp3241 = icmp eq i1 %.tmp3240, 1
br i1 %.tmp3241, label %.if.true.3242, label %.if.false.3242
.if.true.3242:
%.tmp3243 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3244 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp3243)
store %m2437$.AssignableInfo.type* %.tmp3244, %m2437$.AssignableInfo.type** %info.3146
%.tmp3245 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3246 = call %m2437$.ModuleLookup.type*(%m2437$.CompilerCtx.type*) @m229$get_current_module.m2437$.ModuleLookup.typep.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp3245)
%mod_from.3247 = alloca %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* %.tmp3246, %m2437$.ModuleLookup.type** %mod_from.3247
%.tmp3248 = getelementptr i8*, i8** %tmp_buff.3149, i32 0
%.tmp3250 = getelementptr [11 x i8], [11 x i8]*@.str3249, i32 0, i32 0
%.tmp3251 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod_from.3247
%.tmp3252 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3251, i32 0, i32 1
%.tmp3253 = load i8*, i8** %.tmp3252
%.tmp3254 = load i8*, i8** %type_name.3239
%.tmp3255 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3248, i8* %.tmp3250, i8* %.tmp3253, i8* %.tmp3254)
%.tmp3256 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3257 = load i8, i8* @SCOPE_LOCAL
%.tmp3258 = load i8*, i8** %tmp_buff.3149
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp3256, i8 %.tmp3257, i8* %.tmp3258)
%.tmp3259 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3260 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3259, i32 0, i32 3
%.tmp3262 = getelementptr [10 x i8], [10 x i8]*@.str3261, i32 0, i32 0
store i8* %.tmp3262, i8** %.tmp3260
%.tmp3263 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3264 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3263, i32 0, i32 5
%.tmp3265 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3266 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3265, i32 0, i32 3
%.tmp3267 = load i32, i32* %.tmp3266
store i32 %.tmp3267, i32* %.tmp3264
%.tmp3268 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3269 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3268, i32 0, i32 6
%.tmp3270 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3271 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3270, i32 0, i32 4
%.tmp3272 = load i32, i32* %.tmp3271
store i32 %.tmp3272, i32* %.tmp3269
%.tmp3273 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3274 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3273, i32 0, i32 4
%.tmp3275 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp3275, %m2437$.Type.type** %.tmp3274
%.tmp3276 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3277 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3278 = load i8*, i8** %type_name.3239
%.tmp3279 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*,%m2437$.AssignableInfo.type*) @m229$define_assignable.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp3276, %m812$.Node.type* %.tmp3277, i8* %.tmp3278, %m2437$.AssignableInfo.type* %.tmp3279)
%.tmp3280 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3281 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3280, i32 0, i32 6
%.tmp3282 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3281
%.tmp3284 = getelementptr [5 x i8], [5 x i8]*@.str3283, i32 0, i32 0
%.tmp3285 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp3282, i8* %.tmp3284)
%type_decl.3286 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp3285, %m812$.Node.type** %type_decl.3286
%.tmp3287 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3288 = load %m812$.Node.type*, %m812$.Node.type** %type_decl.3286
%.tmp3289 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3288, i32 0, i32 6
%.tmp3290 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3289
%.tmp3291 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$node_to_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp3287, %m812$.Node.type* %.tmp3290)
%type_struct.3292 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp3291, %m2437$.Type.type** %type_struct.3292
%.tmp3293 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3294 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3293, i32 0, i32 4
%.tmp3295 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3294
%.tmp3296 = load %m2437$.Type.type*, %m2437$.Type.type** %type_struct.3292
call void(%m2437$.Type.type*,%m2437$.Type.type*) @m229$copy_type.v.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.tmp3295, %m2437$.Type.type* %.tmp3296)
%.tmp3297 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3298 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3297, i32 0, i32 4
%.tmp3299 = load %m2437$.Type.type*, %m2437$.Type.type** %type_struct.3292
store %m2437$.Type.type* %.tmp3299, %m2437$.Type.type** %.tmp3298
br label %.if.end.3242
.if.false.3242:
%.tmp3300 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3301 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3302 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3301, i32 0, i32 7
%.tmp3303 = load i8*, i8** %.tmp3302
%.tmp3304 = load i8*, i8** %type_name.3239
%.tmp3305 = call %m2437$.ScopeItem.type*(%m2437$.CompilerCtx.type*,i8*,i8*) @m229$find_defined_str.m2437$.ScopeItem.typep.m2437$.CompilerCtx.typep.cp.cp(%m2437$.CompilerCtx.type* %.tmp3300, i8* %.tmp3303, i8* %.tmp3304)
%scope.3306 = alloca %m2437$.ScopeItem.type*
store %m2437$.ScopeItem.type* %.tmp3305, %m2437$.ScopeItem.type** %scope.3306
%.tmp3307 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %scope.3306
%.tmp3308 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp3307, i32 0, i32 1
%.tmp3309 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %.tmp3308
store %m2437$.AssignableInfo.type* %.tmp3309, %m2437$.AssignableInfo.type** %info.3146
%.tmp3310 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3311 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3310, i32 0, i32 1
%.tmp3312 = load %m0$.File.type*, %m0$.File.type** %.tmp3311
%.tmp3314 = getelementptr [14 x i8], [14 x i8]*@.str3313, i32 0, i32 0
%.tmp3315 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3316 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp3315)
%.tmp3317 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3318 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3319 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3318, i32 0, i32 4
%.tmp3320 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3319
%.tmp3321 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3317, %m2437$.Type.type* %.tmp3320)
%.tmp3322 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3312, i8* %.tmp3314, i8* %.tmp3316, i8* %.tmp3321)
br label %.if.end.3242
.if.end.3242:
br label %.if.end.3231
.if.false.3231:
%.tmp3323 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3324 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3323, i32 0, i32 0
%.tmp3325 = load i8*, i8** %.tmp3324
%.tmp3327 = getelementptr [7 x i8], [7 x i8]*@.str3326, i32 0, i32 0
%.tmp3328 = call i32(i8*,i8*) @strcmp(i8* %.tmp3325, i8* %.tmp3327)
%.tmp3329 = icmp eq i32 %.tmp3328, 0
br i1 %.tmp3329, label %.if.true.3330, label %.if.false.3330
.if.true.3330:
%.tmp3331 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3332 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp3331)
store %m2437$.AssignableInfo.type* %.tmp3332, %m2437$.AssignableInfo.type** %info.3146
%.tmp3333 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3334 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3333, i32 0, i32 4
%.tmp3335 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3336 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3337 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3336, i32 0, i32 6
%.tmp3338 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3337
%.tmp3339 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3338, i32 0, i32 7
%.tmp3340 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3339
%.tmp3341 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$syn_function_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp3335, %m812$.Node.type* %.tmp3340)
store %m2437$.Type.type* %.tmp3341, %m2437$.Type.type** %.tmp3334
%.tmp3342 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3343 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3342, i32 0, i32 3
%.tmp3345 = getelementptr [7 x i8], [7 x i8]*@.str3344, i32 0, i32 0
store i8* %.tmp3345, i8** %.tmp3343
%.tmp3346 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3347 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3346, i32 0, i32 6
%.tmp3348 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3347
%.tmp3349 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3348, i32 0, i32 7
%.tmp3350 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3349
%.tmp3351 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3350, i32 0, i32 7
%.tmp3352 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3351
%.tmp3353 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3352, i32 0, i32 1
%.tmp3354 = load i8*, i8** %.tmp3353
%fn_name.3355 = alloca i8*
store i8* %.tmp3354, i8** %fn_name.3355
%.tmp3356 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3357 = load i8, i8* @SCOPE_GLOBAL
%.tmp3358 = load i8*, i8** %fn_name.3355
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp3356, i8 %.tmp3357, i8* %.tmp3358)
%.tmp3359 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp3359, %m2437$.Type.type** %return_type.3147
%.tmp3360 = load %m2437$.Type.type*, %m2437$.Type.type** %return_type.3147
%.tmp3361 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3360, i32 0, i32 0
%.tmp3362 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3363 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3362, i32 0, i32 4
%.tmp3364 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3363
%.tmp3365 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3364, i32 0, i32 3
%.tmp3366 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3365
%.tmp3367 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3366, i32 0, i32 0
%.tmp3368 = load i8*, i8** %.tmp3367
store i8* %.tmp3368, i8** %.tmp3361
%.tmp3369 = load %m2437$.Type.type*, %m2437$.Type.type** %return_type.3147
%.tmp3370 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3369, i32 0, i32 3
%.tmp3371 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3372 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3371, i32 0, i32 4
%.tmp3373 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3372
%.tmp3374 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3373, i32 0, i32 3
%.tmp3375 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3374
%.tmp3376 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3375, i32 0, i32 3
%.tmp3377 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3376
store %m2437$.Type.type* %.tmp3377, %m2437$.Type.type** %.tmp3370
%.tmp3378 = load i1, i1* %shallow
%.tmp3379 = icmp eq i1 %.tmp3378, 0
br i1 %.tmp3379, label %.if.true.3380, label %.if.false.3380
.if.true.3380:
%.tmp3381 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3382 = load i8*, i8** %fn_name.3355
call void(%m2437$.CompilerCtx.type*,i8*) @m229$mark_weak_global.v.m2437$.CompilerCtx.typep.cp(%m2437$.CompilerCtx.type* %.tmp3381, i8* %.tmp3382)
%.tmp3383 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3384 = load i8*, i8** %fn_name.3355
%.tmp3386 = getelementptr [7 x i8], [7 x i8]*@.str3385, i32 0, i32 0
%.tmp3387 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
call void(%m2437$.CompilerCtx.type*,i8*,i8*,%m2437$.AssignableInfo.type*,i1,i1) @m229$define_global.v.m2437$.CompilerCtx.typep.cp.cp.m2437$.AssignableInfo.typep.b.b(%m2437$.CompilerCtx.type* %.tmp3383, i8* %.tmp3384, i8* %.tmp3386, %m2437$.AssignableInfo.type* %.tmp3387, i1 1, i1 1)
%.tmp3388 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3389 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$compile_extern.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp3388, %m2437$.AssignableInfo.type* %.tmp3389)
br label %.if.end.3380
.if.false.3380:
%.tmp3390 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3391 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3392 = load i8*, i8** %fn_name.3355
%.tmp3393 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*,%m2437$.AssignableInfo.type*) @m229$define_assignable.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp3390, %m812$.Node.type* %.tmp3391, i8* %.tmp3392, %m2437$.AssignableInfo.type* %.tmp3393)
br label %.if.end.3380
.if.end.3380:
br label %.if.end.3330
.if.false.3330:
%.tmp3394 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3395 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3394, i32 0, i32 0
%.tmp3396 = load i8*, i8** %.tmp3395
%.tmp3398 = getelementptr [9 x i8], [9 x i8]*@.str3397, i32 0, i32 0
%.tmp3399 = call i32(i8*,i8*) @strcmp(i8* %.tmp3396, i8* %.tmp3398)
%.tmp3400 = icmp eq i32 %.tmp3399, 0
br i1 %.tmp3400, label %.if.true.3401, label %.if.false.3401
.if.true.3401:
%.tmp3402 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3403 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp3402)
store %m2437$.AssignableInfo.type* %.tmp3403, %m2437$.AssignableInfo.type** %info.3146
%.tmp3404 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3405 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3404, i32 0, i32 3
%.tmp3407 = getelementptr [9 x i8], [9 x i8]*@.str3406, i32 0, i32 0
store i8* %.tmp3407, i8** %.tmp3405
%.tmp3408 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3409 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3408, i32 0, i32 4
%.tmp3410 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3411 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3412 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3411, i32 0, i32 6
%.tmp3413 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3412
%.tmp3414 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$syn_function_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp3410, %m812$.Node.type* %.tmp3413)
store %m2437$.Type.type* %.tmp3414, %m2437$.Type.type** %.tmp3409
%.tmp3415 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3416 = call i8*(%m812$.Node.type*) @m229$syn_function_name.cp.m812$.Node.typep(%m812$.Node.type* %.tmp3415)
%name.3417 = alloca i8*
store i8* %.tmp3416, i8** %name.3417
%.tmp3418 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3419 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3420 = load i8*, i8** %name.3417
%.tmp3421 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3422 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3421, i32 0, i32 4
%.tmp3423 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3422
%.tmp3424 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*,%m2437$.Type.type*) @m229$name_mangle.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3418, %m812$.Node.type* %.tmp3419, i8* %.tmp3420, %m2437$.Type.type* %.tmp3423)
store i8* %.tmp3424, i8** %tmp_buff.3149
%.tmp3425 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3426 = load i8, i8* @SCOPE_GLOBAL
%.tmp3427 = load i8*, i8** %tmp_buff.3149
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp3425, i8 %.tmp3426, i8* %.tmp3427)
%.tmp3428 = load i1, i1* %shallow
%.tmp3429 = icmp eq i1 %.tmp3428, 1
br i1 %.tmp3429, label %.if.true.3430, label %.if.false.3430
.if.true.3430:
%.tmp3431 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3432 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3433 = load i8*, i8** %name.3417
%.tmp3434 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*,%m2437$.AssignableInfo.type*) @m229$define_assignable.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp3431, %m812$.Node.type* %.tmp3432, i8* %.tmp3433, %m2437$.AssignableInfo.type* %.tmp3434)
br label %.if.end.3430
.if.false.3430:
%.tmp3435 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp3435, %m2437$.Type.type** %return_type.3147
%.tmp3436 = load %m2437$.Type.type*, %m2437$.Type.type** %return_type.3147
%.tmp3437 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3438 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3437, i32 0, i32 4
%.tmp3439 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3438
%.tmp3440 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3439, i32 0, i32 3
%.tmp3441 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3440
call void(%m2437$.Type.type*,%m2437$.Type.type*) @m229$copy_type.v.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.tmp3436, %m2437$.Type.type* %.tmp3441)
%.tmp3442 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3443 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3442, i32 0, i32 1
%.tmp3444 = load %m0$.File.type*, %m0$.File.type** %.tmp3443
%.tmp3446 = getelementptr [14 x i8], [14 x i8]*@.str3445, i32 0, i32 0
%.tmp3447 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3448 = load %m2437$.Type.type*, %m2437$.Type.type** %return_type.3147
%.tmp3449 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3447, %m2437$.Type.type* %.tmp3448)
%.tmp3450 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3146
%.tmp3451 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp3450)
%.tmp3452 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3444, i8* %.tmp3446, i8* %.tmp3449, i8* %.tmp3451)
%.tmp3453 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3454 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3453, i32 0, i32 6
%.tmp3455 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3454
%.tmp3456 = call %m812$.Node.type*(%m812$.Node.type*) @m229$syn_function_params.m812$.Node.typep.m812$.Node.typep(%m812$.Node.type* %.tmp3455)
%params.3457 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp3456, %m812$.Node.type** %params.3457
%param_type.3458 = alloca %m2437$.Type.type*
store %m2437$.Type.type* null, %m2437$.Type.type** %param_type.3458
%.tmp3460 = load %m812$.Node.type*, %m812$.Node.type** %params.3457
%param_ptr.3461 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp3460, %m812$.Node.type** %param_ptr.3461
br label %.for.start.3459
.for.start.3459:
%.tmp3462 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3461
%.tmp3463 = icmp ne %m812$.Node.type* %.tmp3462, null
br i1 %.tmp3463, label %.for.continue.3459, label %.for.end.3459
.for.continue.3459:
%.tmp3464 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3461
%.tmp3465 = load %m812$.Node.type*, %m812$.Node.type** %params.3457
%.tmp3466 = icmp ne %m812$.Node.type* %.tmp3464, %.tmp3465
br i1 %.tmp3466, label %.if.true.3467, label %.if.false.3467
.if.true.3467:
%.tmp3468 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3461
%.tmp3469 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3468, i32 0, i32 7
%.tmp3470 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3469
store %m812$.Node.type* %.tmp3470, %m812$.Node.type** %param_ptr.3461
%.tmp3471 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3472 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3471, i32 0, i32 1
%.tmp3473 = load %m0$.File.type*, %m0$.File.type** %.tmp3472
%.tmp3475 = getelementptr [3 x i8], [3 x i8]*@.str3474, i32 0, i32 0
%.tmp3476 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3473, i8* %.tmp3475)
br label %.if.end.3467
.if.false.3467:
br label %.if.end.3467
.if.end.3467:
%.tmp3477 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3461
%.tmp3478 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3477, i32 0, i32 0
%.tmp3479 = load i8*, i8** %.tmp3478
%.tmp3481 = getelementptr [5 x i8], [5 x i8]*@.str3480, i32 0, i32 0
%.tmp3482 = call i32(i8*,i8*) @strcmp(i8* %.tmp3479, i8* %.tmp3481)
%.tmp3483 = icmp eq i32 %.tmp3482, 0
br i1 %.tmp3483, label %.if.true.3484, label %.if.false.3484
.if.true.3484:
%.tmp3485 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3486 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3461
%.tmp3487 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3486, i32 0, i32 6
%.tmp3488 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3487
%.tmp3489 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$node_to_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp3485, %m812$.Node.type* %.tmp3488)
store %m2437$.Type.type* %.tmp3489, %m2437$.Type.type** %param_type.3458
%.tmp3490 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3461
%.tmp3491 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3490, i32 0, i32 7
%.tmp3492 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3491
store %m812$.Node.type* %.tmp3492, %m812$.Node.type** %param_ptr.3461
br label %.if.end.3484
.if.false.3484:
br label %.if.end.3484
.if.end.3484:
%.tmp3493 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3494 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3493, i32 0, i32 1
%.tmp3495 = load %m0$.File.type*, %m0$.File.type** %.tmp3494
%.tmp3497 = getelementptr [13 x i8], [13 x i8]*@.str3496, i32 0, i32 0
%.tmp3498 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3499 = load %m2437$.Type.type*, %m2437$.Type.type** %param_type.3458
%.tmp3500 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3498, %m2437$.Type.type* %.tmp3499)
%.tmp3501 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3461
%.tmp3502 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3501, i32 0, i32 1
%.tmp3503 = load i8*, i8** %.tmp3502
%.tmp3504 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3495, i8* %.tmp3497, i8* %.tmp3500, i8* %.tmp3503)
%.tmp3505 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3461
%.tmp3506 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3505, i32 0, i32 7
%.tmp3507 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3506
store %m812$.Node.type* %.tmp3507, %m812$.Node.type** %param_ptr.3461
br label %.for.start.3459
.for.end.3459:
%.tmp3508 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3509 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3508, i32 0, i32 1
%.tmp3510 = load %m0$.File.type*, %m0$.File.type** %.tmp3509
%.tmp3512 = getelementptr [5 x i8], [5 x i8]*@.str3511, i32 0, i32 0
%.tmp3513 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3510, i8* %.tmp3512)
%.tmp3514 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3516 = getelementptr [9 x i8], [9 x i8]*@.str3515, i32 0, i32 0
%.tmp3517 = bitcast ptr null to i8*
%.tmp3518 = bitcast ptr null to i8*
call void(%m2437$.CompilerCtx.type*,i8*,i8*,i8*) @m229$push_scope.v.m2437$.CompilerCtx.typep.cp.cp.cp(%m2437$.CompilerCtx.type* %.tmp3514, i8* %.tmp3516, i8* %.tmp3517, i8* %.tmp3518)
%.tmp3519 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3520 = load %m812$.Node.type*, %m812$.Node.type** %params.3457
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_fn_params.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp3519, %m812$.Node.type* %.tmp3520)
%.tmp3521 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3522 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3521, i32 0, i32 6
%.tmp3523 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3522
%.tmp3525 = getelementptr [6 x i8], [6 x i8]*@.str3524, i32 0, i32 0
%.tmp3526 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp3523, i8* %.tmp3525)
%fn_block.3527 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp3526, %m812$.Node.type** %fn_block.3527
%.tmp3528 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3529 = load %m812$.Node.type*, %m812$.Node.type** %fn_block.3527
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_block.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp3528, %m812$.Node.type* %.tmp3529)
%.tmp3530 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
call void(%m2437$.CompilerCtx.type*) @m229$pop_scope.v.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp3530)
%.tmp3531 = bitcast ptr null to %m812$.Node.type*
%last_valid_instruction.3532 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp3531, %m812$.Node.type** %last_valid_instruction.3532
%.tmp3533 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3534 = load %m812$.Node.type*, %m812$.Node.type** %fn_block.3527
%.tmp3535 = load %m2437$.Type.type*, %m2437$.Type.type** %return_type.3147
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,%m2437$.Type.type*) @m229$check_n_add_implicit_return.v.m2437$.CompilerCtx.typep.m812$.Node.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3533, %m812$.Node.type* %.tmp3534, %m2437$.Type.type* %.tmp3535)
%.tmp3536 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3537 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3536, i32 0, i32 1
%.tmp3538 = load %m0$.File.type*, %m0$.File.type** %.tmp3537
%.tmp3540 = getelementptr [3 x i8], [3 x i8]*@.str3539, i32 0, i32 0
%.tmp3541 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3538, i8* %.tmp3540)
br label %.if.end.3430
.if.end.3430:
br label %.if.end.3401
.if.false.3401:
%.tmp3542 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3543 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3542, i32 0, i32 0
%.tmp3544 = load i8*, i8** %.tmp3543
%.tmp3546 = getelementptr [7 x i8], [7 x i8]*@.str3545, i32 0, i32 0
%.tmp3547 = call i32(i8*,i8*) @strcmp(i8* %.tmp3544, i8* %.tmp3546)
%.tmp3548 = icmp eq i32 %.tmp3547, 0
br i1 %.tmp3548, label %.if.true.3549, label %.if.false.3549
.if.true.3549:
%.tmp3550 = load i1, i1* %shallow
%.tmp3551 = icmp eq i1 %.tmp3550, 1
br i1 %.tmp3551, label %.if.true.3552, label %.if.false.3552
.if.true.3552:
%.tmp3553 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3554 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3553, i32 0, i32 6
%.tmp3555 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3554
%.tmp3556 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3555, i32 0, i32 7
%.tmp3557 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3556
%.tmp3558 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3557, i32 0, i32 1
%.tmp3559 = load i8*, i8** %.tmp3558
%mod_name.3560 = alloca i8*
store i8* %.tmp3559, i8** %mod_name.3560
%.tmp3561 = load i8*, i8** %mod_name.3560
%.tmp3562 = call i32(i8*) @strlen(i8* %.tmp3561)
%mod_name_len.3563 = alloca i32
store i32 %.tmp3562, i32* %mod_name_len.3563
%.tmp3564 = load i32, i32* %mod_name_len.3563
%.tmp3565 = sub i32 %.tmp3564, 1
%.tmp3566 = call i8*(i32) @malloc(i32 %.tmp3565)
%trimmed_path.3567 = alloca i8*
store i8* %.tmp3566, i8** %trimmed_path.3567
%i.3569 = alloca i32
store i32 1, i32* %i.3569
br label %.for.start.3568
.for.start.3568:
%.tmp3570 = load i32, i32* %i.3569
%.tmp3571 = load i32, i32* %mod_name_len.3563
%.tmp3572 = sub i32 %.tmp3571, 1
%.tmp3573 = icmp slt i32 %.tmp3570, %.tmp3572
br i1 %.tmp3573, label %.for.continue.3568, label %.for.end.3568
.for.continue.3568:
%.tmp3574 = load i32, i32* %i.3569
%.tmp3575 = sub i32 %.tmp3574, 1
%.tmp3576 = load i8*, i8** %trimmed_path.3567
%.tmp3577 = getelementptr i8, i8* %.tmp3576, i32 %.tmp3575
%.tmp3578 = load i32, i32* %i.3569
%.tmp3579 = load i8*, i8** %mod_name.3560
%.tmp3580 = getelementptr i8, i8* %.tmp3579, i32 %.tmp3578
%.tmp3581 = load i8, i8* %.tmp3580
store i8 %.tmp3581, i8* %.tmp3577
%.tmp3582 = load i32, i32* %i.3569
%.tmp3583 = add i32 %.tmp3582, 1
store i32 %.tmp3583, i32* %i.3569
br label %.for.start.3568
.for.end.3568:
%.tmp3584 = load i32, i32* %mod_name_len.3563
%.tmp3585 = sub i32 %.tmp3584, 2
%.tmp3586 = load i8*, i8** %trimmed_path.3567
%.tmp3587 = getelementptr i8, i8* %.tmp3586, i32 %.tmp3585
store i8 0, i8* %.tmp3587
%.tmp3588 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3589 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3590 = load i8*, i8** %trimmed_path.3567
%.tmp3591 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$resolve_import_path.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp3588, %m812$.Node.type* %.tmp3589, i8* %.tmp3590)
%mod_abspath.3592 = alloca i8*
store i8* %.tmp3591, i8** %mod_abspath.3592
%.tmp3593 = load i8*, i8** %mod_abspath.3592
%.tmp3594 = call i8*(i32) @malloc(i32 4096)
%.tmp3595 = call i8*(i8*,i8*) @realpath(i8* %.tmp3593, i8* %.tmp3594)
%relpath.3596 = alloca i8*
store i8* %.tmp3595, i8** %relpath.3596
%.tmp3597 = load i8*, i8** %relpath.3596
%.tmp3598 = icmp eq i8* %.tmp3597, null
br i1 %.tmp3598, label %.if.true.3599, label %.if.false.3599
.if.true.3599:
%.tmp3600 = getelementptr i8*, i8** %err_buf.3148, i32 0
%.tmp3602 = getelementptr [54 x i8], [54 x i8]*@.str3601, i32 0, i32 0
%.tmp3603 = load i8*, i8** %mod_name.3560
%.tmp3604 = load i8*, i8** %mod_abspath.3592
%.tmp3605 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3600, i8* %.tmp3602, i8* %.tmp3603, i8* %.tmp3604)
%.tmp3606 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3607 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3608 = load i8*, i8** %err_buf.3148
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp3606, %m812$.Node.type* %.tmp3607, i8* %.tmp3608)
ret void
br label %.if.end.3599
.if.false.3599:
br label %.if.end.3599
.if.end.3599:
%.tmp3609 = load i8*, i8** %relpath.3596
store i8* %.tmp3609, i8** %mod_abspath.3592
%m.3610 = alloca %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* null, %m2437$.ModuleLookup.type** %m.3610
%.tmp3611 = bitcast ptr null to %m2437$.ModuleLookup.type*
%mod.3612 = alloca %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* %.tmp3611, %m2437$.ModuleLookup.type** %mod.3612
%.tmp3614 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3615 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3614, i32 0, i32 6
%.tmp3616 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %.tmp3615
store %m2437$.ModuleLookup.type* %.tmp3616, %m2437$.ModuleLookup.type** %m.3610
br label %.for.start.3613
.for.start.3613:
%.tmp3617 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.3610
%.tmp3618 = icmp ne %m2437$.ModuleLookup.type* %.tmp3617, null
%.tmp3619 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.3612
%.tmp3620 = icmp eq %m2437$.ModuleLookup.type* %.tmp3619, null
%.tmp3621 = and i1 %.tmp3618, %.tmp3620
br i1 %.tmp3621, label %.for.continue.3613, label %.for.end.3613
.for.continue.3613:
%.tmp3622 = load i8*, i8** %mod_abspath.3592
%.tmp3623 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.3610
%.tmp3624 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3623, i32 0, i32 0
%.tmp3625 = load i8*, i8** %.tmp3624
%.tmp3626 = call i32(i8*,i8*) @strcmp(i8* %.tmp3622, i8* %.tmp3625)
%.tmp3627 = icmp eq i32 %.tmp3626, 0
br i1 %.tmp3627, label %.if.true.3628, label %.if.false.3628
.if.true.3628:
%.tmp3629 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.3610
store %m2437$.ModuleLookup.type* %.tmp3629, %m2437$.ModuleLookup.type** %mod.3612
br label %.if.end.3628
.if.false.3628:
br label %.if.end.3628
.if.end.3628:
%.tmp3630 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.3610
%.tmp3631 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3630, i32 0, i32 2
%.tmp3632 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %.tmp3631
store %m2437$.ModuleLookup.type* %.tmp3632, %m2437$.ModuleLookup.type** %m.3610
br label %.for.start.3613
.for.end.3613:
%.tmp3633 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3634 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3633, i32 0, i32 6
%.tmp3635 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3634
%.tmp3636 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3635, i32 0, i32 7
%.tmp3637 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3636
%.tmp3638 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3637, i32 0, i32 7
%.tmp3639 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3638
%.tmp3640 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3639, i32 0, i32 7
%.tmp3641 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3640
%.tmp3642 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3641, i32 0, i32 1
%.tmp3643 = load i8*, i8** %.tmp3642
%asname.3644 = alloca i8*
store i8* %.tmp3643, i8** %asname.3644
%.tmp3645 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.3612
%.tmp3646 = icmp eq %m2437$.ModuleLookup.type* %.tmp3645, null
br i1 %.tmp3646, label %.if.true.3647, label %.if.false.3647
.if.true.3647:
%.tmp3648 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* null, i32 1
%.tmp3649 = ptrtoint %m2437$.ModuleLookup.type* %.tmp3648 to i32
%.tmp3650 = call i8*(i32) @malloc(i32 %.tmp3649)
%.tmp3651 = bitcast i8* %.tmp3650 to %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* %.tmp3651, %m2437$.ModuleLookup.type** %mod.3612
%.tmp3652 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.3612
%.tmp3653 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3652, i32 0, i32 0
%.tmp3654 = load i8*, i8** %mod_abspath.3592
store i8* %.tmp3654, i8** %.tmp3653
%.tmp3655 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.3612
%.tmp3656 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3655, i32 0, i32 2
store %m2437$.ModuleLookup.type* null, %m2437$.ModuleLookup.type** %.tmp3656
%.tmp3657 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.3612
%.tmp3658 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3657, i32 0, i32 3
store %m2437$.Scope.type* null, %m2437$.Scope.type** %.tmp3658
%.tmp3659 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.3612
%.tmp3660 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3659, i32 0, i32 1
%.tmp3661 = getelementptr i8*, i8** %.tmp3660, i32 0
%.tmp3663 = getelementptr [5 x i8], [5 x i8]*@.str3662, i32 0, i32 0
%.tmp3664 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3665 = call i32(%m2437$.CompilerCtx.type*) @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp3664)
%.tmp3666 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3661, i8* %.tmp3663, i32 %.tmp3665)
%.tmp3668 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3669 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3668, i32 0, i32 6
%.tmp3670 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %.tmp3669
store %m2437$.ModuleLookup.type* %.tmp3670, %m2437$.ModuleLookup.type** %m.3610
br label %.for.start.3667
.for.start.3667:
%.tmp3671 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.3610
%.tmp3672 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3671, i32 0, i32 2
%.tmp3673 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %.tmp3672
%.tmp3674 = icmp ne %m2437$.ModuleLookup.type* %.tmp3673, null
br i1 %.tmp3674, label %.for.continue.3667, label %.for.end.3667
.for.continue.3667:
%.tmp3675 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.3610
%.tmp3676 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3675, i32 0, i32 2
%.tmp3677 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %.tmp3676
store %m2437$.ModuleLookup.type* %.tmp3677, %m2437$.ModuleLookup.type** %m.3610
br label %.for.start.3667
.for.end.3667:
%.tmp3678 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %m.3610
%.tmp3679 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3678, i32 0, i32 2
%.tmp3680 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.3612
store %m2437$.ModuleLookup.type* %.tmp3680, %m2437$.ModuleLookup.type** %.tmp3679
%.tmp3681 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3682 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3683 = load i8*, i8** %asname.3644
%.tmp3684 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.3612
%.tmp3685 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3684, i32 0, i32 0
%.tmp3686 = load i8*, i8** %.tmp3685
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*,i8*) @m229$define_module.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.cp(%m2437$.CompilerCtx.type* %.tmp3681, %m812$.Node.type* %.tmp3682, i8* %.tmp3683, i8* %.tmp3686)
%.tmp3687 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3688 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3687, i32 0, i32 7
%.tmp3689 = load i8*, i8** %.tmp3688
%curr_mod.3690 = alloca i8*
store i8* %.tmp3689, i8** %curr_mod.3690
%.tmp3691 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3692 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3691, i32 0, i32 7
%.tmp3693 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.3612
%.tmp3694 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3693, i32 0, i32 0
%.tmp3695 = load i8*, i8** %.tmp3694
store i8* %.tmp3695, i8** %.tmp3692
%.tmp3696 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3697 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3698 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.3612
%.tmp3699 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3698, i32 0, i32 0
%.tmp3700 = load i8*, i8** %.tmp3699
%.tmp3701 = call i1(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$compile_file.b.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp3696, %m812$.Node.type* %.tmp3697, i8* %.tmp3700)
%.tmp3702 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3703 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3702, i32 0, i32 7
%.tmp3704 = load i8*, i8** %curr_mod.3690
store i8* %.tmp3704, i8** %.tmp3703
br label %.if.end.3647
.if.false.3647:
%.tmp3705 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3706 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3707 = load i8*, i8** %asname.3644
%.tmp3708 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.3612
%.tmp3709 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp3708, i32 0, i32 0
%.tmp3710 = load i8*, i8** %.tmp3709
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*,i8*) @m229$define_module.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.cp(%m2437$.CompilerCtx.type* %.tmp3705, %m812$.Node.type* %.tmp3706, i8* %.tmp3707, i8* %.tmp3710)
br label %.if.end.3647
.if.end.3647:
br label %.if.end.3552
.if.false.3552:
br label %.if.end.3552
.if.end.3552:
br label %.if.end.3549
.if.false.3549:
%.tmp3711 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3712 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3714 = getelementptr [40 x i8], [40 x i8]*@.str3713, i32 0, i32 0
%.tmp3715 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp3711, %m812$.Node.type* %.tmp3712, i8* %.tmp3714)
%.tmp3716 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3717 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3716, i32 0, i32 0
%.tmp3718 = load i8*, i8** %.tmp3717
%.tmp3719 = call i32(i8*,...) @printf(i8* %.tmp3715, i8* %.tmp3718)
br label %.if.end.3549
.if.end.3549:
br label %.if.end.3401
.if.end.3401:
br label %.if.end.3330
.if.end.3330:
br label %.if.end.3231
.if.end.3231:
br label %.if.end.3165
.if.end.3165:
br label %.if.end.3157
.if.end.3157:
ret void
}
define i8* @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf.3720 = alloca i8*
store i8* null, i8** %buf.3720
%.tmp3721 = getelementptr i8*, i8** %buf.3720, i32 0
%.tmp3723 = getelementptr [31 x i8], [31 x i8]*@.str3722, i32 0, i32 0
%.tmp3724 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3725 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3724, i32 0, i32 7
%.tmp3726 = load i8*, i8** %.tmp3725
%.tmp3727 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3728 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3727, i32 0, i32 3
%.tmp3729 = load i32, i32* %.tmp3728
%.tmp3730 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3731 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3730, i32 0, i32 4
%.tmp3732 = load i32, i32* %.tmp3731
%.tmp3733 = load i8*, i8** %msg
%.tmp3734 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3721, i8* %.tmp3723, i8* %.tmp3726, i32 %.tmp3729, i32 %.tmp3732, i8* %.tmp3733)
%.tmp3735 = load i8*, i8** %buf.3720
ret i8* %.tmp3735
}
define void @m229$compile_fn_params.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.fn_params.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%fn_params = alloca %m812$.Node.type*
store %m812$.Node.type* %.fn_params.arg, %m812$.Node.type** %fn_params
%param_type.3736 = alloca %m2437$.Type.type*
store %m2437$.Type.type* null, %m2437$.Type.type** %param_type.3736
%.tmp3738 = load %m812$.Node.type*, %m812$.Node.type** %fn_params
%param_ptr.3739 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp3738, %m812$.Node.type** %param_ptr.3739
br label %.for.start.3737
.for.start.3737:
%.tmp3740 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3739
%.tmp3741 = icmp ne %m812$.Node.type* %.tmp3740, null
br i1 %.tmp3741, label %.for.continue.3737, label %.for.end.3737
.for.continue.3737:
%.tmp3742 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3739
%.tmp3743 = load %m812$.Node.type*, %m812$.Node.type** %fn_params
%.tmp3744 = icmp ne %m812$.Node.type* %.tmp3742, %.tmp3743
br i1 %.tmp3744, label %.if.true.3745, label %.if.false.3745
.if.true.3745:
%.tmp3746 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3739
%.tmp3747 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3746, i32 0, i32 7
%.tmp3748 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3747
store %m812$.Node.type* %.tmp3748, %m812$.Node.type** %param_ptr.3739
br label %.if.end.3745
.if.false.3745:
br label %.if.end.3745
.if.end.3745:
%.tmp3749 = load %m812$.Node.type*, %m812$.Node.type** %fn_params
%.tmp3750 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp3749)
%param_info.3751 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp3750, %m2437$.AssignableInfo.type** %param_info.3751
%.tmp3752 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %param_info.3751
%.tmp3753 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3752, i32 0, i32 3
%.tmp3755 = getelementptr [9 x i8], [9 x i8]*@.str3754, i32 0, i32 0
store i8* %.tmp3755, i8** %.tmp3753
%.tmp3756 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3739
%.tmp3757 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3756, i32 0, i32 0
%.tmp3758 = load i8*, i8** %.tmp3757
%.tmp3760 = getelementptr [5 x i8], [5 x i8]*@.str3759, i32 0, i32 0
%.tmp3761 = call i32(i8*,i8*) @strcmp(i8* %.tmp3758, i8* %.tmp3760)
%.tmp3762 = icmp eq i32 %.tmp3761, 0
br i1 %.tmp3762, label %.if.true.3763, label %.if.false.3763
.if.true.3763:
%.tmp3764 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3765 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3739
%.tmp3766 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3765, i32 0, i32 6
%.tmp3767 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3766
%.tmp3768 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$node_to_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp3764, %m812$.Node.type* %.tmp3767)
store %m2437$.Type.type* %.tmp3768, %m2437$.Type.type** %param_type.3736
%.tmp3769 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3739
%.tmp3770 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3769, i32 0, i32 7
%.tmp3771 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3770
store %m812$.Node.type* %.tmp3771, %m812$.Node.type** %param_ptr.3739
br label %.if.end.3763
.if.false.3763:
br label %.if.end.3763
.if.end.3763:
%.tmp3772 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %param_info.3751
%.tmp3773 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3772, i32 0, i32 4
%.tmp3774 = load %m2437$.Type.type*, %m2437$.Type.type** %param_type.3736
store %m2437$.Type.type* %.tmp3774, %m2437$.Type.type** %.tmp3773
%.tmp3775 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3739
%.tmp3776 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3775, i32 0, i32 1
%.tmp3777 = load i8*, i8** %.tmp3776
%var_name.3778 = alloca i8*
store i8* %.tmp3777, i8** %var_name.3778
%.tmp3779 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %param_info.3751
%.tmp3780 = load i8, i8* @SCOPE_LOCAL
%.tmp3781 = load i8*, i8** %var_name.3778
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp3779, i8 %.tmp3780, i8* %.tmp3781)
%.tmp3782 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3783 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %param_info.3751
%.tmp3784 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3783, i32 0, i32 4
%.tmp3785 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3784
%.tmp3786 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3782, %m2437$.Type.type* %.tmp3785)
%param_info_tr.3787 = alloca i8*
store i8* %.tmp3786, i8** %param_info_tr.3787
%.tmp3788 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3789 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3788, i32 0, i32 1
%.tmp3790 = load %m0$.File.type*, %m0$.File.type** %.tmp3789
%.tmp3792 = getelementptr [16 x i8], [16 x i8]*@.str3791, i32 0, i32 0
%.tmp3793 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %param_info.3751
%.tmp3794 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp3793)
%.tmp3795 = load i8*, i8** %param_info_tr.3787
%.tmp3796 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3790, i8* %.tmp3792, i8* %.tmp3794, i8* %.tmp3795)
%.tmp3797 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3798 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3739
%.tmp3799 = load i8*, i8** %var_name.3778
%.tmp3800 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %param_info.3751
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*,%m2437$.AssignableInfo.type*) @m229$define_assignable.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp3797, %m812$.Node.type* %.tmp3798, i8* %.tmp3799, %m2437$.AssignableInfo.type* %.tmp3800)
%.tmp3801 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3802 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3801, i32 0, i32 1
%.tmp3803 = load %m0$.File.type*, %m0$.File.type** %.tmp3802
%.tmp3805 = getelementptr [28 x i8], [28 x i8]*@.str3804, i32 0, i32 0
%.tmp3806 = load i8*, i8** %param_info_tr.3787
%.tmp3807 = load i8*, i8** %var_name.3778
%.tmp3808 = load i8*, i8** %param_info_tr.3787
%.tmp3809 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %param_info.3751
%.tmp3810 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp3809)
%.tmp3811 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3803, i8* %.tmp3805, i8* %.tmp3806, i8* %.tmp3807, i8* %.tmp3808, i8* %.tmp3810)
%.tmp3812 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.3739
%.tmp3813 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3812, i32 0, i32 7
%.tmp3814 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3813
store %m812$.Node.type* %.tmp3814, %m812$.Node.type** %param_ptr.3739
br label %.for.start.3737
.for.end.3737:
ret void
}
define void @m229$compile_block.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%.tmp3815 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3817 = getelementptr [6 x i8], [6 x i8]*@.str3816, i32 0, i32 0
%.tmp3818 = bitcast ptr null to i8*
%.tmp3819 = bitcast ptr null to i8*
call void(%m2437$.CompilerCtx.type*,i8*,i8*,i8*) @m229$push_scope.v.m2437$.CompilerCtx.typep.cp.cp.cp(%m2437$.CompilerCtx.type* %.tmp3815, i8* %.tmp3817, i8* %.tmp3818, i8* %.tmp3819)
%.tmp3820 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3821 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3820, i32 0, i32 6
%.tmp3822 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3821
%.tmp3824 = getelementptr [12 x i8], [12 x i8]*@.str3823, i32 0, i32 0
%.tmp3825 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp3822, i8* %.tmp3824)
%exprs.3826 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp3825, %m812$.Node.type** %exprs.3826
%.tmp3827 = load %m812$.Node.type*, %m812$.Node.type** %exprs.3826
%.tmp3828 = icmp ne %m812$.Node.type* %.tmp3827, null
br i1 %.tmp3828, label %.if.true.3829, label %.if.false.3829
.if.true.3829:
%.tmp3831 = load %m812$.Node.type*, %m812$.Node.type** %exprs.3826
%.tmp3832 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3831, i32 0, i32 6
%.tmp3833 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3832
%b.3834 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp3833, %m812$.Node.type** %b.3834
br label %.for.start.3830
.for.start.3830:
%.tmp3835 = load %m812$.Node.type*, %m812$.Node.type** %b.3834
%.tmp3836 = icmp ne %m812$.Node.type* %.tmp3835, null
br i1 %.tmp3836, label %.for.continue.3830, label %.for.end.3830
.for.continue.3830:
%.tmp3837 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3838 = load %m812$.Node.type*, %m812$.Node.type** %b.3834
%.tmp3839 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3838, i32 0, i32 6
%.tmp3840 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3839
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_expression.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp3837, %m812$.Node.type* %.tmp3840)
%.tmp3841 = load %m812$.Node.type*, %m812$.Node.type** %b.3834
%.tmp3842 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3841, i32 0, i32 7
%.tmp3843 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3842
store %m812$.Node.type* %.tmp3843, %m812$.Node.type** %b.3834
br label %.for.start.3830
.for.end.3830:
br label %.if.end.3829
.if.false.3829:
br label %.if.end.3829
.if.end.3829:
%.tmp3844 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
call void(%m2437$.CompilerCtx.type*) @m229$pop_scope.v.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp3844)
ret void
}
define %m2437$.AssignableInfo.type* @m229$get_struct_attr.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep.i(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp3845 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3846 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3847 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_addr.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp3845, %m812$.Node.type* %.tmp3846)
%val.3848 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp3847, %m2437$.AssignableInfo.type** %val.3848
%.tmp3849 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %val.3848
%.tmp3850 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3849, i32 0, i32 4
%.tmp3851 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3850
%.tmp3852 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3851, i32 0, i32 0
%.tmp3853 = load i8*, i8** %.tmp3852
%.tmp3855 = getelementptr [7 x i8], [7 x i8]*@.str3854, i32 0, i32 0
%.tmp3856 = call i32(i8*,i8*) @strcmp(i8* %.tmp3853, i8* %.tmp3855)
%.tmp3857 = icmp ne i32 %.tmp3856, 0
br i1 %.tmp3857, label %.if.true.3858, label %.if.false.3858
.if.true.3858:
%.tmp3860 = getelementptr [7 x i8], [7 x i8]*@.str3859, i32 0, i32 0
%.tmp3861 = call i32(i8*,...) @printf(i8* %.tmp3860)
%.tmp3862 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp3862
br label %.if.end.3858
.if.false.3858:
br label %.if.end.3858
.if.end.3858:
%.tmp3863 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %val.3848
%.tmp3864 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3863, i32 0, i32 4
%.tmp3865 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3864
%.tmp3866 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3865, i32 0, i32 3
%.tmp3867 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3866
%node_type.3868 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp3867, %m2437$.Type.type** %node_type.3868
%i.3870 = alloca i32
store i32 0, i32* %i.3870
br label %.for.start.3869
.for.start.3869:
%.tmp3871 = load i32, i32* %i.3870
%.tmp3872 = load i32, i32* %attr_id
%.tmp3873 = icmp slt i32 %.tmp3871, %.tmp3872
br i1 %.tmp3873, label %.for.continue.3869, label %.for.end.3869
.for.continue.3869:
%.tmp3874 = load %m2437$.Type.type*, %m2437$.Type.type** %node_type.3868
%.tmp3875 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3874, i32 0, i32 4
%.tmp3876 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3875
store %m2437$.Type.type* %.tmp3876, %m2437$.Type.type** %node_type.3868
%.tmp3877 = load i32, i32* %i.3870
%.tmp3878 = add i32 %.tmp3877, 1
store i32 %.tmp3878, i32* %i.3870
br label %.for.start.3869
.for.end.3869:
%.tmp3879 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3880 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp3879)
%info.3881 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp3880, %m2437$.AssignableInfo.type** %info.3881
%.tmp3882 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3881
%.tmp3883 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3882, i32 0, i32 4
%.tmp3884 = load %m2437$.Type.type*, %m2437$.Type.type** %node_type.3868
store %m2437$.Type.type* %.tmp3884, %m2437$.Type.type** %.tmp3883
%.tmp3885 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3886 = call i32(%m2437$.CompilerCtx.type*) @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp3885)
%tmp_id.3887 = alloca i32
store i32 %.tmp3886, i32* %tmp_id.3887
%.tmp3888 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3889 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %val.3848
%.tmp3890 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3889, i32 0, i32 4
%.tmp3891 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3890
%.tmp3892 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3888, %m2437$.Type.type* %.tmp3891)
%type_as_str.3893 = alloca i8*
store i8* %.tmp3892, i8** %type_as_str.3893
%.tmp3894 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3895 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3881
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp3894, %m2437$.AssignableInfo.type* %.tmp3895)
%.tmp3896 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3897 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3896, i32 0, i32 1
%.tmp3898 = load %m0$.File.type*, %m0$.File.type** %.tmp3897
%.tmp3900 = getelementptr [52 x i8], [52 x i8]*@.str3899, i32 0, i32 0
%.tmp3901 = load i32, i32* %tmp_id.3887
%.tmp3902 = load i8*, i8** %type_as_str.3893
%.tmp3903 = load i8*, i8** %type_as_str.3893
%.tmp3904 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %val.3848
%.tmp3905 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp3904)
%.tmp3906 = load i32, i32* %attr_id
%.tmp3907 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3898, i8* %.tmp3900, i32 %.tmp3901, i8* %.tmp3902, i8* %.tmp3903, i8* %.tmp3905, i32 %.tmp3906)
%.tmp3908 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3909 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3908, i32 0, i32 1
%.tmp3910 = load %m0$.File.type*, %m0$.File.type** %.tmp3909
%.tmp3912 = getelementptr [28 x i8], [28 x i8]*@.str3911, i32 0, i32 0
%.tmp3913 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3881
%.tmp3914 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp3913)
%.tmp3915 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3916 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3881
%.tmp3917 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3916, i32 0, i32 4
%.tmp3918 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3917
%.tmp3919 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3915, %m2437$.Type.type* %.tmp3918)
%.tmp3920 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3921 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3881
%.tmp3922 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3921, i32 0, i32 4
%.tmp3923 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3922
%.tmp3924 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3920, %m2437$.Type.type* %.tmp3923)
%.tmp3925 = load i32, i32* %tmp_id.3887
%.tmp3926 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3910, i8* %.tmp3912, i8* %.tmp3914, i8* %.tmp3919, i8* %.tmp3924, i32 %.tmp3925)
%.tmp3927 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.3881
ret %m2437$.AssignableInfo.type* %.tmp3927
}
define void @m229$set_struct_attr.v.m2437$.CompilerCtx.typep.m812$.Node.typep.i.cp(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg, i32 %.attr_id.arg, i8* %.attr.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%attr = alloca i8*
store i8* %.attr.arg, i8** %attr
%.tmp3928 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3929 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3930 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_addr.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp3928, %m812$.Node.type* %.tmp3929)
%val.3931 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp3930, %m2437$.AssignableInfo.type** %val.3931
%.tmp3932 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %val.3931
%.tmp3933 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3932, i32 0, i32 4
%.tmp3934 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3933
%.tmp3935 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3934, i32 0, i32 0
%.tmp3936 = load i8*, i8** %.tmp3935
%.tmp3938 = getelementptr [7 x i8], [7 x i8]*@.str3937, i32 0, i32 0
%.tmp3939 = call i32(i8*,i8*) @strcmp(i8* %.tmp3936, i8* %.tmp3938)
%.tmp3940 = icmp ne i32 %.tmp3939, 0
br i1 %.tmp3940, label %.if.true.3941, label %.if.false.3941
.if.true.3941:
%.tmp3943 = getelementptr [7 x i8], [7 x i8]*@.str3942, i32 0, i32 0
%.tmp3944 = call i32(i8*,...) @printf(i8* %.tmp3943)
ret void
br label %.if.end.3941
.if.false.3941:
br label %.if.end.3941
.if.end.3941:
%.tmp3945 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %val.3931
%.tmp3946 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3945, i32 0, i32 4
%.tmp3947 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3946
%.tmp3948 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3947, i32 0, i32 3
%.tmp3949 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3948
%node_type.3950 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp3949, %m2437$.Type.type** %node_type.3950
%i.3952 = alloca i32
store i32 0, i32* %i.3952
br label %.for.start.3951
.for.start.3951:
%.tmp3953 = load i32, i32* %i.3952
%.tmp3954 = load i32, i32* %attr_id
%.tmp3955 = icmp slt i32 %.tmp3953, %.tmp3954
br i1 %.tmp3955, label %.for.continue.3951, label %.for.end.3951
.for.continue.3951:
%.tmp3956 = load %m2437$.Type.type*, %m2437$.Type.type** %node_type.3950
%.tmp3957 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp3956, i32 0, i32 4
%.tmp3958 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3957
store %m2437$.Type.type* %.tmp3958, %m2437$.Type.type** %node_type.3950
%.tmp3959 = load i32, i32* %i.3952
%.tmp3960 = add i32 %.tmp3959, 1
store i32 %.tmp3960, i32* %i.3952
br label %.for.start.3951
.for.end.3951:
%.tmp3961 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3962 = call i32(%m2437$.CompilerCtx.type*) @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp3961)
%tmp_id.3963 = alloca i32
store i32 %.tmp3962, i32* %tmp_id.3963
%.tmp3964 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3965 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %val.3931
%.tmp3966 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp3965, i32 0, i32 4
%.tmp3967 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp3966
%.tmp3968 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3964, %m2437$.Type.type* %.tmp3967)
%type_as_str.3969 = alloca i8*
store i8* %.tmp3968, i8** %type_as_str.3969
%.tmp3970 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3971 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3970, i32 0, i32 1
%.tmp3972 = load %m0$.File.type*, %m0$.File.type** %.tmp3971
%.tmp3974 = getelementptr [52 x i8], [52 x i8]*@.str3973, i32 0, i32 0
%.tmp3975 = load i32, i32* %tmp_id.3963
%.tmp3976 = load i8*, i8** %type_as_str.3969
%.tmp3977 = load i8*, i8** %type_as_str.3969
%.tmp3978 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %val.3931
%.tmp3979 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp3978)
%.tmp3980 = load i32, i32* %attr_id
%.tmp3981 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3972, i8* %.tmp3974, i32 %.tmp3975, i8* %.tmp3976, i8* %.tmp3977, i8* %.tmp3979, i32 %.tmp3980)
%.tmp3982 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3983 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp3982, i32 0, i32 1
%.tmp3984 = load %m0$.File.type*, %m0$.File.type** %.tmp3983
%.tmp3986 = getelementptr [18 x i8], [18 x i8]*@.str3985, i32 0, i32 0
%.tmp3987 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3988 = load %m2437$.Type.type*, %m2437$.Type.type** %node_type.3950
%.tmp3989 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3987, %m2437$.Type.type* %.tmp3988)
%.tmp3990 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp3991 = load %m2437$.Type.type*, %m2437$.Type.type** %node_type.3950
%.tmp3992 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp3990, %m2437$.Type.type* %.tmp3991)
%.tmp3993 = load i8*, i8** %attr
%.tmp3994 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3984, i8* %.tmp3986, i8* %.tmp3989, i8* %.tmp3992, i8* %.tmp3993)
ret void
}
define %m2437$.AssignableInfo.type* @m229$compile_builtin.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%.tmp3995 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp3996 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3995, i32 0, i32 6
%.tmp3997 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3996
%.tmp3998 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp3997, i32 0, i32 6
%.tmp3999 = load %m812$.Node.type*, %m812$.Node.type** %.tmp3998
%dotted.4000 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp3999, %m812$.Node.type** %dotted.4000
%.tmp4001 = load %m812$.Node.type*, %m812$.Node.type** %dotted.4000
%.tmp4002 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4001, i32 0, i32 7
%.tmp4003 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4002
%.tmp4004 = icmp ne %m812$.Node.type* %.tmp4003, null
br i1 %.tmp4004, label %.if.true.4005, label %.if.false.4005
.if.true.4005:
%.tmp4006 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp4006
br label %.if.end.4005
.if.false.4005:
br label %.if.end.4005
.if.end.4005:
%.tmp4007 = load %m812$.Node.type*, %m812$.Node.type** %dotted.4000
%.tmp4008 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4007, i32 0, i32 1
%.tmp4009 = load i8*, i8** %.tmp4008
%.tmp4011 = getelementptr [7 x i8], [7 x i8]*@.str4010, i32 0, i32 0
%.tmp4012 = call i32(i8*,i8*) @strcmp(i8* %.tmp4009, i8* %.tmp4011)
%.tmp4013 = icmp eq i32 %.tmp4012, 0
br i1 %.tmp4013, label %.if.true.4014, label %.if.false.4014
.if.true.4014:
%.tmp4015 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4017 = getelementptr [8 x i8], [8 x i8]*@.str4016, i32 0, i32 0
%.tmp4018 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp4015, i8* %.tmp4017)
%args.4019 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp4018, %m812$.Node.type** %args.4019
%.tmp4020 = load %m812$.Node.type*, %m812$.Node.type** %args.4019
%.tmp4021 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4020, i32 0, i32 6
%.tmp4022 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4021
%.tmp4024 = getelementptr [11 x i8], [11 x i8]*@.str4023, i32 0, i32 0
%.tmp4025 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp4022, i8* %.tmp4024)
%value.4026 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp4025, %m812$.Node.type** %value.4026
%.tmp4027 = load %m812$.Node.type*, %m812$.Node.type** %value.4026
%.tmp4028 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4027, i32 0, i32 6
%.tmp4029 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4028
%.tmp4030 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4029, i32 0, i32 6
%.tmp4031 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4030
%.tmp4032 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4031, i32 0, i32 6
%.tmp4033 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4032
%.tmp4034 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4033, i32 0, i32 6
%.tmp4035 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4034
store %m812$.Node.type* %.tmp4035, %m812$.Node.type** %value.4026
%.tmp4036 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4037 = call i32(%m2437$.CompilerCtx.type*) @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp4036)
%tmp_id.4038 = alloca i32
store i32 %.tmp4037, i32* %tmp_id.4038
%.tmp4039 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4040 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp4039)
%info.4041 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp4040, %m2437$.AssignableInfo.type** %info.4041
%.tmp4042 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4043 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4041
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp4042, %m2437$.AssignableInfo.type* %.tmp4043)
%.tmp4044 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4041
%.tmp4045 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4044, i32 0, i32 4
%.tmp4046 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp4046, %m2437$.Type.type** %.tmp4045
%.tmp4047 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4041
%.tmp4048 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4047, i32 0, i32 4
%.tmp4049 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4048
%.tmp4050 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4049, i32 0, i32 0
%.tmp4052 = getelementptr [4 x i8], [4 x i8]*@.str4051, i32 0, i32 0
store i8* %.tmp4052, i8** %.tmp4050
%.tmp4053 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4054 = load %m812$.Node.type*, %m812$.Node.type** %value.4026
%.tmp4055 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$node_to_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4053, %m812$.Node.type* %.tmp4054)
%inspected_type.4056 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp4055, %m2437$.Type.type** %inspected_type.4056
%.tmp4057 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4058 = load %m2437$.Type.type*, %m2437$.Type.type** %inspected_type.4056
%.tmp4059 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4057, %m2437$.Type.type* %.tmp4058)
%type_as_str.4060 = alloca i8*
store i8* %.tmp4059, i8** %type_as_str.4060
%.tmp4061 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4062 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp4061, i32 0, i32 1
%.tmp4063 = load %m0$.File.type*, %m0$.File.type** %.tmp4062
%.tmp4065 = getelementptr [46 x i8], [46 x i8]*@.str4064, i32 0, i32 0
%.tmp4066 = load i32, i32* %tmp_id.4038
%.tmp4067 = load i8*, i8** %type_as_str.4060
%.tmp4068 = load i8*, i8** %type_as_str.4060
%.tmp4069 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4063, i8* %.tmp4065, i32 %.tmp4066, i8* %.tmp4067, i8* %.tmp4068)
%.tmp4070 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4071 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp4070, i32 0, i32 1
%.tmp4072 = load %m0$.File.type*, %m0$.File.type** %.tmp4071
%.tmp4074 = getelementptr [35 x i8], [35 x i8]*@.str4073, i32 0, i32 0
%.tmp4075 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4041
%.tmp4076 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp4075)
%.tmp4077 = load i8*, i8** %type_as_str.4060
%.tmp4078 = load i32, i32* %tmp_id.4038
%.tmp4079 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4072, i8* %.tmp4074, i8* %.tmp4076, i8* %.tmp4077, i32 %.tmp4078)
%.tmp4080 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4041
ret %m2437$.AssignableInfo.type* %.tmp4080
br label %.if.end.4014
.if.false.4014:
%.tmp4081 = load %m812$.Node.type*, %m812$.Node.type** %dotted.4000
%.tmp4082 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4081, i32 0, i32 1
%.tmp4083 = load i8*, i8** %.tmp4082
%.tmp4085 = getelementptr [7 x i8], [7 x i8]*@.str4084, i32 0, i32 0
%.tmp4086 = call i32(i8*,i8*) @strcmp(i8* %.tmp4083, i8* %.tmp4085)
%.tmp4087 = icmp eq i32 %.tmp4086, 0
br i1 %.tmp4087, label %.if.true.4088, label %.if.false.4088
.if.true.4088:
%.tmp4089 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4091 = getelementptr [8 x i8], [8 x i8]*@.str4090, i32 0, i32 0
%.tmp4092 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp4089, i8* %.tmp4091)
%args.4093 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp4092, %m812$.Node.type** %args.4093
%.tmp4094 = load %m812$.Node.type*, %m812$.Node.type** %args.4093
%.tmp4095 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4094, i32 0, i32 6
%.tmp4096 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4095
%.tmp4098 = getelementptr [11 x i8], [11 x i8]*@.str4097, i32 0, i32 0
%.tmp4099 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp4096, i8* %.tmp4098)
%array.4100 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp4099, %m812$.Node.type** %array.4100
%.tmp4101 = load %m812$.Node.type*, %m812$.Node.type** %array.4100
%.tmp4102 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4101, i32 0, i32 7
%.tmp4103 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4102
%.tmp4105 = getelementptr [11 x i8], [11 x i8]*@.str4104, i32 0, i32 0
%.tmp4106 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp4103, i8* %.tmp4105)
%value.4107 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp4106, %m812$.Node.type** %value.4107
%.tmp4108 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4109 = load %m812$.Node.type*, %m812$.Node.type** %value.4107
%.tmp4110 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_assignable.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4108, %m812$.Node.type* %.tmp4109)
%value_info.4111 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp4110, %m2437$.AssignableInfo.type** %value_info.4111
%.tmp4112 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4113 = load %m812$.Node.type*, %m812$.Node.type** %array.4100
%.tmp4114 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_addr.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4112, %m812$.Node.type* %.tmp4113)
%array_info.4115 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp4114, %m2437$.AssignableInfo.type** %array_info.4115
%.tmp4116 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4117 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp4116)
%info.4118 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp4117, %m2437$.AssignableInfo.type** %info.4118
%.tmp4119 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4120 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4118
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp4119, %m2437$.AssignableInfo.type* %.tmp4120)
%.tmp4121 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4118
%.tmp4122 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4121, i32 0, i32 4
%.tmp4123 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %array_info.4115
%.tmp4124 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4123, i32 0, i32 4
%.tmp4125 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4124
store %m2437$.Type.type* %.tmp4125, %m2437$.Type.type** %.tmp4122
%builtin_prefix.4126 = alloca i8*
store i8* null, i8** %builtin_prefix.4126
%.tmp4127 = getelementptr i8*, i8** %builtin_prefix.4126, i32 0
%.tmp4129 = getelementptr [5 x i8], [5 x i8]*@.str4128, i32 0, i32 0
%.tmp4130 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4131 = call i32(%m2437$.CompilerCtx.type*) @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp4130)
%.tmp4132 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4127, i8* %.tmp4129, i32 %.tmp4131)
%.tmp4133 = call i8*() @m1988$append_tmpl.cp()
%tmpl.4134 = alloca i8*
store i8* %.tmp4133, i8** %tmpl.4134
%.tmp4135 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4136 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp4135, i32 0, i32 1
%.tmp4137 = load %m0$.File.type*, %m0$.File.type** %.tmp4136
%.tmp4138 = load i8*, i8** %tmpl.4134
%.tmp4139 = load i8*, i8** %builtin_prefix.4126
%.tmp4140 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4141 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %array_info.4115
%.tmp4142 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4141, i32 0, i32 4
%.tmp4143 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4142
%.tmp4144 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4140, %m2437$.Type.type* %.tmp4143)
%.tmp4145 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %array_info.4115
%.tmp4146 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp4145)
%.tmp4147 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4148 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %value_info.4111
%.tmp4149 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4148, i32 0, i32 4
%.tmp4150 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4149
%.tmp4151 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4147, %m2437$.Type.type* %.tmp4150)
%.tmp4152 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %value_info.4111
%.tmp4153 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp4152)
%.tmp4154 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4118
%.tmp4155 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp4154)
%.tmp4156 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4137, i8* %.tmp4138, i8* %.tmp4139, i8* %.tmp4144, i8* %.tmp4146, i8* %.tmp4151, i8* %.tmp4153, i8* %.tmp4155)
%.tmp4157 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4158 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp4157)
%info_g.4159 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp4158, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4160 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4161 = load i8, i8* @SCOPE_GLOBAL
%.tmp4163 = getelementptr [8 x i8], [8 x i8]*@.str4162, i32 0, i32 0
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp4160, i8 %.tmp4161, i8* %.tmp4163)
%.tmp4164 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4165 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4164, i32 0, i32 4
%.tmp4166 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp4166, %m2437$.Type.type** %.tmp4165
%.tmp4167 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4168 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4167, i32 0, i32 4
%.tmp4169 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4168
%.tmp4170 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4169, i32 0, i32 0
%.tmp4172 = getelementptr [9 x i8], [9 x i8]*@.str4171, i32 0, i32 0
store i8* %.tmp4172, i8** %.tmp4170
%.tmp4173 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4174 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4173, i32 0, i32 4
%.tmp4175 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4174
%.tmp4176 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4175, i32 0, i32 3
%.tmp4177 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp4177, %m2437$.Type.type** %.tmp4176
%.tmp4178 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4179 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4178, i32 0, i32 4
%.tmp4180 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4179
%.tmp4181 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4180, i32 0, i32 3
%.tmp4182 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4181
%.tmp4183 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4182, i32 0, i32 0
%.tmp4185 = getelementptr [4 x i8], [4 x i8]*@.str4184, i32 0, i32 0
store i8* %.tmp4185, i8** %.tmp4183
%.tmp4186 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4187 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4186, i32 0, i32 4
%.tmp4188 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4187
%.tmp4189 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4188, i32 0, i32 3
%.tmp4190 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4189
%.tmp4191 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4190, i32 0, i32 3
%.tmp4192 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp4192, %m2437$.Type.type** %.tmp4191
%.tmp4193 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4194 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4193, i32 0, i32 4
%.tmp4195 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4194
%.tmp4196 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4195, i32 0, i32 3
%.tmp4197 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4196
%.tmp4198 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4197, i32 0, i32 3
%.tmp4199 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4198
%.tmp4200 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4199, i32 0, i32 0
%.tmp4202 = getelementptr [4 x i8], [4 x i8]*@.str4201, i32 0, i32 0
store i8* %.tmp4202, i8** %.tmp4200
%.tmp4203 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4204 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4203, i32 0, i32 4
%.tmp4205 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4204
%.tmp4206 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4205, i32 0, i32 3
%.tmp4207 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4206
%.tmp4208 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4207, i32 0, i32 4
%.tmp4209 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp4209, %m2437$.Type.type** %.tmp4208
%.tmp4210 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4211 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4210, i32 0, i32 4
%.tmp4212 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4211
%.tmp4213 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4212, i32 0, i32 3
%.tmp4214 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4213
%.tmp4215 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4214, i32 0, i32 4
%.tmp4216 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4215
%.tmp4217 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4216, i32 0, i32 0
%.tmp4219 = getelementptr [4 x i8], [4 x i8]*@.str4218, i32 0, i32 0
store i8* %.tmp4219, i8** %.tmp4217
%.tmp4220 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4221 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4220, i32 0, i32 4
%.tmp4222 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4221
%.tmp4223 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4222, i32 0, i32 3
%.tmp4224 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4223
%.tmp4225 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4224, i32 0, i32 4
%.tmp4226 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4225
%.tmp4227 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4226, i32 0, i32 3
%.tmp4228 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp4228, %m2437$.Type.type** %.tmp4227
%.tmp4229 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4230 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4229, i32 0, i32 4
%.tmp4231 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4230
%.tmp4232 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4231, i32 0, i32 3
%.tmp4233 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4232
%.tmp4234 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4233, i32 0, i32 4
%.tmp4235 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4234
%.tmp4236 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4235, i32 0, i32 3
%.tmp4237 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4236
%.tmp4238 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4237, i32 0, i32 0
%.tmp4240 = getelementptr [4 x i8], [4 x i8]*@.str4239, i32 0, i32 0
store i8* %.tmp4240, i8** %.tmp4238
%.tmp4241 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4242 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4241, i32 0, i32 4
%.tmp4243 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4242
%.tmp4244 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4243, i32 0, i32 3
%.tmp4245 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4244
%.tmp4246 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4245, i32 0, i32 4
%.tmp4247 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4246
%.tmp4248 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4247, i32 0, i32 4
%.tmp4249 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp4249, %m2437$.Type.type** %.tmp4248
%.tmp4250 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
%.tmp4251 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4250, i32 0, i32 4
%.tmp4252 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4251
%.tmp4253 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4252, i32 0, i32 3
%.tmp4254 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4253
%.tmp4255 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4254, i32 0, i32 4
%.tmp4256 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4255
%.tmp4257 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4256, i32 0, i32 4
%.tmp4258 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4257
%.tmp4259 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4258, i32 0, i32 0
%.tmp4261 = getelementptr [4 x i8], [4 x i8]*@.str4260, i32 0, i32 0
store i8* %.tmp4261, i8** %.tmp4259
%.tmp4262 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4264 = getelementptr [8 x i8], [8 x i8]*@.str4263, i32 0, i32 0
%.tmp4266 = getelementptr [7 x i8], [7 x i8]*@.str4265, i32 0, i32 0
%.tmp4267 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_g.4159
call void(%m2437$.CompilerCtx.type*,i8*,i8*,%m2437$.AssignableInfo.type*,i1,i1) @m229$define_global.v.m2437$.CompilerCtx.typep.cp.cp.m2437$.AssignableInfo.typep.b.b(%m2437$.CompilerCtx.type* %.tmp4262, i8* %.tmp4264, i8* %.tmp4266, %m2437$.AssignableInfo.type* %.tmp4267, i1 1, i1 0)
%.tmp4268 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4118
ret %m2437$.AssignableInfo.type* %.tmp4268
br label %.if.end.4088
.if.false.4088:
%.tmp4269 = load %m812$.Node.type*, %m812$.Node.type** %dotted.4000
%.tmp4270 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4269, i32 0, i32 1
%.tmp4271 = load i8*, i8** %.tmp4270
%.tmp4273 = getelementptr [4 x i8], [4 x i8]*@.str4272, i32 0, i32 0
%.tmp4274 = call i32(i8*,i8*) @strcmp(i8* %.tmp4271, i8* %.tmp4273)
%.tmp4275 = icmp eq i32 %.tmp4274, 0
br i1 %.tmp4275, label %.if.true.4276, label %.if.false.4276
.if.true.4276:
%.tmp4277 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4279 = getelementptr [8 x i8], [8 x i8]*@.str4278, i32 0, i32 0
%.tmp4280 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp4277, i8* %.tmp4279)
%args.4281 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp4280, %m812$.Node.type** %args.4281
%.tmp4282 = load %m812$.Node.type*, %m812$.Node.type** %args.4281
%.tmp4283 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4282, i32 0, i32 6
%.tmp4284 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4283
%.tmp4286 = getelementptr [11 x i8], [11 x i8]*@.str4285, i32 0, i32 0
%.tmp4287 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp4284, i8* %.tmp4286)
%value.4288 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp4287, %m812$.Node.type** %value.4288
%.tmp4289 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4290 = load %m812$.Node.type*, %m812$.Node.type** %value.4288
%.tmp4291 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i32) @m229$get_struct_attr.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep.i(%m2437$.CompilerCtx.type* %.tmp4289, %m812$.Node.type* %.tmp4290, i32 1)
ret %m2437$.AssignableInfo.type* %.tmp4291
br label %.if.end.4276
.if.false.4276:
br label %.if.end.4276
.if.end.4276:
br label %.if.end.4088
.if.end.4088:
br label %.if.end.4014
.if.end.4014:
%.tmp4292 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp4292
}
define i8* @m229$resolve_import_path.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp4294 = getelementptr [1 x i8], [1 x i8]*@.str4293, i32 0, i32 0
%err_buf.4295 = alloca i8*
store i8* %.tmp4294, i8** %err_buf.4295
%.tmp4296 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4297 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp4296, i32 0, i32 7
%.tmp4298 = load i8*, i8** %.tmp4297
%mod_abspath.4299 = alloca i8*
store i8* %.tmp4298, i8** %mod_abspath.4299
%.tmp4300 = load i8*, i8** %mod_abspath.4299
%.tmp4301 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp4300)
%dirname.4302 = alloca i8*
store i8* %.tmp4301, i8** %dirname.4302
%.tmp4303 = load i8*, i8** %import_str
%.tmp4304 = getelementptr i8, i8* %.tmp4303, i32 0
%.tmp4305 = load i8, i8* %.tmp4304
%.tmp4306 = icmp eq i8 %.tmp4305, 47
br i1 %.tmp4306, label %.if.true.4307, label %.if.false.4307
.if.true.4307:
%.tmp4308 = getelementptr i8*, i8** %err_buf.4295, i32 0
%.tmp4310 = getelementptr [46 x i8], [46 x i8]*@.str4309, i32 0, i32 0
%.tmp4311 = load i8*, i8** %import_str
%.tmp4312 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4308, i8* %.tmp4310, i8* %.tmp4311)
%.tmp4313 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4314 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4315 = load i8*, i8** %err_buf.4295
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp4313, %m812$.Node.type* %.tmp4314, i8* %.tmp4315)
%.tmp4316 = bitcast ptr null to i8*
ret i8* %.tmp4316
br label %.if.end.4307
.if.false.4307:
br label %.if.end.4307
.if.end.4307:
%.tmp4317 = load i8*, i8** %import_str
%.tmp4318 = getelementptr i8, i8* %.tmp4317, i32 0
%.tmp4319 = load i8, i8* %.tmp4318
%.tmp4320 = icmp ne i8 %.tmp4319, 46
%.tmp4321 = load i8*, i8** %import_str
%.tmp4322 = getelementptr i8, i8* %.tmp4321, i32 1
%.tmp4323 = load i8, i8* %.tmp4322
%.tmp4324 = icmp ne i8 %.tmp4323, 47
%.tmp4325 = and i1 %.tmp4320, %.tmp4324
br i1 %.tmp4325, label %.if.true.4326, label %.if.false.4326
.if.true.4326:
%.tmp4327 = call i8*() @m229$get_root.cp()
%root.4328 = alloca i8*
store i8* %.tmp4327, i8** %root.4328
%.tmp4329 = getelementptr i8*, i8** %mod_abspath.4299, i32 0
%.tmp4331 = getelementptr [13 x i8], [13 x i8]*@.str4330, i32 0, i32 0
%.tmp4332 = load i8*, i8** %root.4328
%.tmp4333 = load i8*, i8** %import_str
%.tmp4334 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4329, i8* %.tmp4331, i8* %.tmp4332, i8* %.tmp4333)
br label %.if.end.4326
.if.false.4326:
%.tmp4335 = load i8*, i8** %dirname.4302
%.tmp4337 = getelementptr [1 x i8], [1 x i8]*@.str4336, i32 0, i32 0
%.tmp4338 = call i32(i8*,i8*) @strcmp(i8* %.tmp4335, i8* %.tmp4337)
%.tmp4339 = icmp eq i32 %.tmp4338, 0
br i1 %.tmp4339, label %.if.true.4340, label %.if.false.4340
.if.true.4340:
%.tmp4341 = getelementptr i8*, i8** %mod_abspath.4299, i32 0
%.tmp4343 = getelementptr [6 x i8], [6 x i8]*@.str4342, i32 0, i32 0
%.tmp4344 = load i8*, i8** %import_str
%.tmp4345 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4341, i8* %.tmp4343, i8* %.tmp4344)
br label %.if.end.4340
.if.false.4340:
%.tmp4346 = getelementptr i8*, i8** %mod_abspath.4299, i32 0
%.tmp4348 = getelementptr [9 x i8], [9 x i8]*@.str4347, i32 0, i32 0
%.tmp4349 = load i8*, i8** %dirname.4302
%.tmp4350 = load i8*, i8** %import_str
%.tmp4351 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4346, i8* %.tmp4348, i8* %.tmp4349, i8* %.tmp4350)
br label %.if.end.4340
.if.end.4340:
br label %.if.end.4326
.if.end.4326:
%.tmp4352 = load i8*, i8** %mod_abspath.4299
ret i8* %.tmp4352
}
define %m2437$.AssignableInfo.type* @m229$compile_fn_call.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%.tmp4353 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4354 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4355 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_builtin.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4353, %m812$.Node.type* %.tmp4354)
%info.4356 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp4355, %m2437$.AssignableInfo.type** %info.4356
%.tmp4357 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4358 = icmp ne %m2437$.AssignableInfo.type* %.tmp4357, null
br i1 %.tmp4358, label %.if.true.4359, label %.if.false.4359
.if.true.4359:
%.tmp4360 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
ret %m2437$.AssignableInfo.type* %.tmp4360
br label %.if.end.4359
.if.false.4359:
br label %.if.end.4359
.if.end.4359:
%.tmp4361 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4362 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4363 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_addr.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4361, %m812$.Node.type* %.tmp4362)
store %m2437$.AssignableInfo.type* %.tmp4363, %m2437$.AssignableInfo.type** %info.4356
%.tmp4364 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4365 = icmp eq %m2437$.AssignableInfo.type* %.tmp4364, null
br i1 %.tmp4365, label %.if.true.4366, label %.if.false.4366
.if.true.4366:
%.tmp4367 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4367, label %.if.true.4368, label %.if.false.4368
.if.true.4368:
%.tmp4369 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4370 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4372 = getelementptr [35 x i8], [35 x i8]*@.str4371, i32 0, i32 0
%.tmp4373 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp4369, %m812$.Node.type* %.tmp4370, i8* %.tmp4372)
%.tmp4374 = call i32(i8*,...) @printf(i8* %.tmp4373)
br label %.if.end.4368
.if.false.4368:
br label %.if.end.4368
.if.end.4368:
%.tmp4375 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp4375
br label %.if.end.4366
.if.false.4366:
br label %.if.end.4366
.if.end.4366:
%.tmp4376 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4378 = getelementptr [8 x i8], [8 x i8]*@.str4377, i32 0, i32 0
%.tmp4379 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp4376, i8* %.tmp4378)
%args.4380 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp4379, %m812$.Node.type** %args.4380
%.tmp4382 = getelementptr [1 x i8], [1 x i8]*@.str4381, i32 0, i32 0
%params_buff.4383 = alloca i8*
store i8* %.tmp4382, i8** %params_buff.4383
%tmp.4384 = alloca i8*
store i8* null, i8** %tmp.4384
%.tmp4385 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4386 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4385, i32 0, i32 4
%.tmp4387 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4386
%.tmp4388 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4387, i32 0, i32 0
%.tmp4389 = load i8*, i8** %.tmp4388
%.tmp4391 = getelementptr [4 x i8], [4 x i8]*@.str4390, i32 0, i32 0
%.tmp4392 = call i32(i8*,i8*) @strcmp(i8* %.tmp4389, i8* %.tmp4391)
%.tmp4393 = icmp eq i32 %.tmp4392, 0
br i1 %.tmp4393, label %.if.true.4394, label %.if.false.4394
.if.true.4394:
%.tmp4395 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4396 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp4395)
%new_info.4397 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp4396, %m2437$.AssignableInfo.type** %new_info.4397
%.tmp4398 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4399 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_info.4397
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp4398, %m2437$.AssignableInfo.type* %.tmp4399)
%.tmp4400 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_info.4397
%.tmp4401 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4400, i32 0, i32 4
%.tmp4402 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4403 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4402, i32 0, i32 4
%.tmp4404 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4403
%.tmp4405 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4404, i32 0, i32 3
%.tmp4406 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4405
store %m2437$.Type.type* %.tmp4406, %m2437$.Type.type** %.tmp4401
%.tmp4407 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4408 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp4407, i32 0, i32 1
%.tmp4409 = load %m0$.File.type*, %m0$.File.type** %.tmp4408
%.tmp4411 = getelementptr [22 x i8], [22 x i8]*@.str4410, i32 0, i32 0
%.tmp4412 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_info.4397
%.tmp4413 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp4412)
%.tmp4414 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4415 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4416 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4415, i32 0, i32 4
%.tmp4417 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4416
%.tmp4418 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4414, %m2437$.Type.type* %.tmp4417)
%.tmp4419 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4420 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4421 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4420, i32 0, i32 4
%.tmp4422 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4421
%.tmp4423 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4419, %m2437$.Type.type* %.tmp4422)
%.tmp4424 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4425 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp4424)
%.tmp4426 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4409, i8* %.tmp4411, i8* %.tmp4413, i8* %.tmp4418, i8* %.tmp4423, i8* %.tmp4425)
%.tmp4427 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_info.4397
store %m2437$.AssignableInfo.type* %.tmp4427, %m2437$.AssignableInfo.type** %info.4356
br label %.if.end.4394
.if.false.4394:
br label %.if.end.4394
.if.end.4394:
%.tmp4428 = load %m812$.Node.type*, %m812$.Node.type** %args.4380
%.tmp4429 = icmp ne %m812$.Node.type* %.tmp4428, null
br i1 %.tmp4429, label %.if.true.4430, label %.if.false.4430
.if.true.4430:
%.tmp4431 = load %m812$.Node.type*, %m812$.Node.type** %args.4380
%.tmp4432 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4431, i32 0, i32 6
%.tmp4433 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4432
%.tmp4435 = getelementptr [11 x i8], [11 x i8]*@.str4434, i32 0, i32 0
%.tmp4436 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp4433, i8* %.tmp4435)
%start.4437 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp4436, %m812$.Node.type** %start.4437
%argno.4438 = alloca i32
store i32 1, i32* %argno.4438
%.tmp4439 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4440 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4439, i32 0, i32 4
%.tmp4441 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4440
%.tmp4442 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4441, i32 0, i32 3
%.tmp4443 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4442
%.tmp4444 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4443, i32 0, i32 4
%.tmp4445 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4444
%expect_type.4446 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp4445, %m2437$.Type.type** %expect_type.4446
%provided_args.4447 = alloca i32
store i32 0, i32* %provided_args.4447
%.tmp4449 = load %m812$.Node.type*, %m812$.Node.type** %start.4437
%pp.4450 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp4449, %m812$.Node.type** %pp.4450
br label %.for.start.4448
.for.start.4448:
%.tmp4451 = load %m812$.Node.type*, %m812$.Node.type** %pp.4450
%.tmp4452 = icmp ne %m812$.Node.type* %.tmp4451, null
br i1 %.tmp4452, label %.for.continue.4448, label %.for.end.4448
.for.continue.4448:
%.tmp4453 = load i32, i32* %provided_args.4447
%.tmp4454 = add i32 %.tmp4453, 1
store i32 %.tmp4454, i32* %provided_args.4447
%.tmp4455 = load %m812$.Node.type*, %m812$.Node.type** %pp.4450
%.tmp4456 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4455, i32 0, i32 7
%.tmp4457 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4456
%.tmp4459 = getelementptr [11 x i8], [11 x i8]*@.str4458, i32 0, i32 0
%.tmp4460 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp4457, i8* %.tmp4459)
store %m812$.Node.type* %.tmp4460, %m812$.Node.type** %pp.4450
br label %.for.start.4448
.for.end.4448:
%.tmp4462 = load %m812$.Node.type*, %m812$.Node.type** %start.4437
%pp.4463 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp4462, %m812$.Node.type** %pp.4463
br label %.for.start.4461
.for.start.4461:
%.tmp4464 = load %m812$.Node.type*, %m812$.Node.type** %pp.4463
%.tmp4465 = icmp ne %m812$.Node.type* %.tmp4464, null
br i1 %.tmp4465, label %.for.continue.4461, label %.for.end.4461
.for.continue.4461:
%.tmp4466 = load %m2437$.Type.type*, %m2437$.Type.type** %expect_type.4446
%.tmp4467 = icmp eq %m2437$.Type.type* %.tmp4466, null
br i1 %.tmp4467, label %.if.true.4468, label %.if.false.4468
.if.true.4468:
%.tmp4469 = getelementptr i8*, i8** %tmp.4384, i32 0
%.tmp4471 = getelementptr [43 x i8], [43 x i8]*@.str4470, i32 0, i32 0
%.tmp4472 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4473 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4472, i32 0, i32 2
%.tmp4474 = load i8*, i8** %.tmp4473
%.tmp4475 = load i32, i32* %argno.4438
%.tmp4476 = sub i32 %.tmp4475, 1
%.tmp4477 = load i32, i32* %provided_args.4447
%.tmp4478 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4469, i8* %.tmp4471, i8* %.tmp4474, i32 %.tmp4476, i32 %.tmp4477)
%.tmp4479 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4480 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4481 = load i8*, i8** %tmp.4384
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp4479, %m812$.Node.type* %.tmp4480, i8* %.tmp4481)
%.tmp4482 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp4482
br label %.if.end.4468
.if.false.4468:
br label %.if.end.4468
.if.end.4468:
%.tmp4483 = load %m812$.Node.type*, %m812$.Node.type** %pp.4463
%.tmp4484 = load %m812$.Node.type*, %m812$.Node.type** %start.4437
%.tmp4485 = icmp ne %m812$.Node.type* %.tmp4483, %.tmp4484
br i1 %.tmp4485, label %.if.true.4486, label %.if.false.4486
.if.true.4486:
%.tmp4487 = getelementptr i8*, i8** %tmp.4384, i32 0
%.tmp4489 = getelementptr [5 x i8], [5 x i8]*@.str4488, i32 0, i32 0
%.tmp4490 = load i8*, i8** %params_buff.4383
%.tmp4491 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4487, i8* %.tmp4489, i8* %.tmp4490)
%.tmp4492 = load i8*, i8** %params_buff.4383
%tmp_buff.4493 = alloca i8*
store i8* %.tmp4492, i8** %tmp_buff.4493
%.tmp4494 = load i8*, i8** %tmp.4384
store i8* %.tmp4494, i8** %params_buff.4383
%.tmp4495 = load i8*, i8** %tmp_buff.4493
store i8* %.tmp4495, i8** %tmp.4384
%.tmp4496 = load i8*, i8** %tmp.4384
call void(i8*) @free(i8* %.tmp4496)
br label %.if.end.4486
.if.false.4486:
br label %.if.end.4486
.if.end.4486:
%.tmp4497 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4498 = load %m812$.Node.type*, %m812$.Node.type** %pp.4463
%.tmp4499 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_assignable.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4497, %m812$.Node.type* %.tmp4498)
%a_info.4500 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp4499, %m2437$.AssignableInfo.type** %a_info.4500
%.tmp4501 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.4500
%.tmp4502 = icmp eq %m2437$.AssignableInfo.type* %.tmp4501, null
br i1 %.tmp4502, label %.if.true.4503, label %.if.false.4503
.if.true.4503:
%.tmp4504 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp4504
br label %.if.end.4503
.if.false.4503:
br label %.if.end.4503
.if.end.4503:
%.tmp4505 = load %m2437$.Type.type*, %m2437$.Type.type** %expect_type.4446
%.tmp4506 = call %m2437$.Type.type*(%m2437$.Type.type*) @m229$type_clone.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.tmp4505)
%exp.4507 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp4506, %m2437$.Type.type** %exp.4507
%.tmp4508 = load %m2437$.Type.type*, %m2437$.Type.type** %exp.4507
%.tmp4509 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4508, i32 0, i32 4
store %m2437$.Type.type* null, %m2437$.Type.type** %.tmp4509
%.tmp4510 = load %m2437$.Type.type*, %m2437$.Type.type** %expect_type.4446
%.tmp4511 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4510, i32 0, i32 0
%.tmp4512 = load i8*, i8** %.tmp4511
%.tmp4514 = getelementptr [7 x i8], [7 x i8]*@.str4513, i32 0, i32 0
%.tmp4515 = call i32(i8*,i8*) @strcmp(i8* %.tmp4512, i8* %.tmp4514)
%.tmp4516 = icmp ne i32 %.tmp4515, 0
%.tmp4517 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4518 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.4500
%.tmp4519 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4518, i32 0, i32 4
%.tmp4520 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4519
%.tmp4521 = load %m2437$.Type.type*, %m2437$.Type.type** %exp.4507
%.tmp4522 = call i1(%m2437$.CompilerCtx.type*,%m2437$.Type.type*,%m2437$.Type.type*) @m229$is_same_type.b.m2437$.CompilerCtx.typep.m2437$.Type.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4517, %m2437$.Type.type* %.tmp4520, %m2437$.Type.type* %.tmp4521)
%.tmp4523 = icmp eq i1 %.tmp4522, 0
%.tmp4524 = and i1 %.tmp4516, %.tmp4523
br i1 %.tmp4524, label %.if.true.4525, label %.if.false.4525
.if.true.4525:
%.tmp4527 = getelementptr [1 x i8], [1 x i8]*@.str4526, i32 0, i32 0
%err_buf.4528 = alloca i8*
store i8* %.tmp4527, i8** %err_buf.4528
%.tmp4529 = getelementptr i8*, i8** %err_buf.4528, i32 0
%.tmp4531 = getelementptr [58 x i8], [58 x i8]*@.str4530, i32 0, i32 0
%.tmp4532 = load i32, i32* %argno.4438
%.tmp4533 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4534 = load %m2437$.Type.type*, %m2437$.Type.type** %exp.4507
%.tmp4535 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4533, %m2437$.Type.type* %.tmp4534)
%.tmp4536 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4537 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.4500
%.tmp4538 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4537, i32 0, i32 4
%.tmp4539 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4538
%.tmp4540 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4536, %m2437$.Type.type* %.tmp4539)
%.tmp4541 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4529, i8* %.tmp4531, i32 %.tmp4532, i8* %.tmp4535, i8* %.tmp4540)
%.tmp4542 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4543 = load %m812$.Node.type*, %m812$.Node.type** %pp.4463
%.tmp4544 = load i8*, i8** %err_buf.4528
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp4542, %m812$.Node.type* %.tmp4543, i8* %.tmp4544)
%.tmp4545 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp4545
br label %.if.end.4525
.if.false.4525:
br label %.if.end.4525
.if.end.4525:
%.tmp4546 = getelementptr i8*, i8** %params_buff.4383, i32 0
%.tmp4548 = getelementptr [8 x i8], [8 x i8]*@.str4547, i32 0, i32 0
%.tmp4549 = load i8*, i8** %params_buff.4383
%.tmp4550 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4551 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.4500
%.tmp4552 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4551, i32 0, i32 4
%.tmp4553 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4552
%.tmp4554 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4550, %m2437$.Type.type* %.tmp4553)
%.tmp4555 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.4500
%.tmp4556 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp4555)
%.tmp4557 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4546, i8* %.tmp4548, i8* %.tmp4549, i8* %.tmp4554, i8* %.tmp4556)
%.tmp4558 = load %m812$.Node.type*, %m812$.Node.type** %pp.4463
%.tmp4559 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4558, i32 0, i32 7
%.tmp4560 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4559
store %m812$.Node.type* %.tmp4560, %m812$.Node.type** %pp.4463
%.tmp4561 = load %m2437$.Type.type*, %m2437$.Type.type** %expect_type.4446
%.tmp4562 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4561, i32 0, i32 0
%.tmp4563 = load i8*, i8** %.tmp4562
%.tmp4565 = getelementptr [7 x i8], [7 x i8]*@.str4564, i32 0, i32 0
%.tmp4566 = call i32(i8*,i8*) @strcmp(i8* %.tmp4563, i8* %.tmp4565)
%.tmp4567 = icmp ne i32 %.tmp4566, 0
br i1 %.tmp4567, label %.if.true.4568, label %.if.false.4568
.if.true.4568:
%.tmp4569 = load %m2437$.Type.type*, %m2437$.Type.type** %expect_type.4446
%.tmp4570 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4569, i32 0, i32 4
%.tmp4571 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4570
store %m2437$.Type.type* %.tmp4571, %m2437$.Type.type** %expect_type.4446
br label %.if.end.4568
.if.false.4568:
br label %.if.end.4568
.if.end.4568:
%.tmp4572 = load i32, i32* %argno.4438
%.tmp4573 = add i32 %.tmp4572, 1
store i32 %.tmp4573, i32* %argno.4438
%.tmp4574 = load %m812$.Node.type*, %m812$.Node.type** %pp.4463
%.tmp4576 = getelementptr [11 x i8], [11 x i8]*@.str4575, i32 0, i32 0
%.tmp4577 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp4574, i8* %.tmp4576)
store %m812$.Node.type* %.tmp4577, %m812$.Node.type** %pp.4463
br label %.for.start.4461
.for.end.4461:
%.tmp4578 = load %m2437$.Type.type*, %m2437$.Type.type** %expect_type.4446
%.tmp4579 = icmp ne %m2437$.Type.type* %.tmp4578, null
br i1 %.tmp4579, label %.if.true.4580, label %.if.false.4580
.if.true.4580:
%.tmp4581 = load %m2437$.Type.type*, %m2437$.Type.type** %expect_type.4446
%.tmp4582 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4581, i32 0, i32 0
%.tmp4583 = load i8*, i8** %.tmp4582
%.tmp4585 = getelementptr [7 x i8], [7 x i8]*@.str4584, i32 0, i32 0
%.tmp4586 = call i32(i8*,i8*) @strcmp(i8* %.tmp4583, i8* %.tmp4585)
%.tmp4587 = icmp ne i32 %.tmp4586, 0
br i1 %.tmp4587, label %.if.true.4588, label %.if.false.4588
.if.true.4588:
%.tmp4589 = getelementptr i8*, i8** %tmp.4384, i32 0
%.tmp4591 = getelementptr [43 x i8], [43 x i8]*@.str4590, i32 0, i32 0
%.tmp4592 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4593 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4592, i32 0, i32 2
%.tmp4594 = load i8*, i8** %.tmp4593
%.tmp4595 = load i32, i32* %argno.4438
%.tmp4596 = load i32, i32* %provided_args.4447
%.tmp4597 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4589, i8* %.tmp4591, i8* %.tmp4594, i32 %.tmp4595, i32 %.tmp4596)
%.tmp4598 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4599 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4600 = load i8*, i8** %tmp.4384
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp4598, %m812$.Node.type* %.tmp4599, i8* %.tmp4600)
%.tmp4601 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp4601
br label %.if.end.4588
.if.false.4588:
br label %.if.end.4588
.if.end.4588:
br label %.if.end.4580
.if.false.4580:
br label %.if.end.4580
.if.end.4580:
br label %.if.end.4430
.if.false.4430:
%.tmp4602 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4603 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4602, i32 0, i32 4
%.tmp4604 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4603
%.tmp4605 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4604, i32 0, i32 3
%.tmp4606 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4605
%.tmp4607 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4606, i32 0, i32 4
%.tmp4608 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4607
%.tmp4609 = icmp ne %m2437$.Type.type* %.tmp4608, null
br i1 %.tmp4609, label %.if.true.4610, label %.if.false.4610
.if.true.4610:
%args_required.4611 = alloca i32
store i32 0, i32* %args_required.4611
%.tmp4613 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4614 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4613, i32 0, i32 4
%.tmp4615 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4614
%.tmp4616 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4615, i32 0, i32 3
%.tmp4617 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4616
%.tmp4618 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4617, i32 0, i32 4
%.tmp4619 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4618
%pp.4620 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp4619, %m2437$.Type.type** %pp.4620
br label %.for.start.4612
.for.start.4612:
%.tmp4621 = load %m2437$.Type.type*, %m2437$.Type.type** %pp.4620
%.tmp4622 = icmp ne %m2437$.Type.type* %.tmp4621, null
br i1 %.tmp4622, label %.for.continue.4612, label %.for.else.4612
.for.continue.4612:
%.tmp4623 = load %m2437$.Type.type*, %m2437$.Type.type** %pp.4620
%.tmp4624 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4623, i32 0, i32 0
%.tmp4625 = load i8*, i8** %.tmp4624
%.tmp4627 = getelementptr [7 x i8], [7 x i8]*@.str4626, i32 0, i32 0
%.tmp4628 = call i32(i8*,i8*) @strcmp(i8* %.tmp4625, i8* %.tmp4627)
%.tmp4629 = icmp eq i32 %.tmp4628, 0
br i1 %.tmp4629, label %.if.true.4630, label %.if.false.4630
.if.true.4630:
br label %.for.end.4612
br label %.if.end.4630
.if.false.4630:
br label %.if.end.4630
.if.end.4630:
%.tmp4631 = load i32, i32* %args_required.4611
%.tmp4632 = add i32 %.tmp4631, 1
store i32 %.tmp4632, i32* %args_required.4611
%.tmp4633 = load %m2437$.Type.type*, %m2437$.Type.type** %pp.4620
%.tmp4634 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4633, i32 0, i32 4
%.tmp4635 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4634
store %m2437$.Type.type* %.tmp4635, %m2437$.Type.type** %pp.4620
br label %.for.start.4612
.for.else.4612:
%.tmp4636 = getelementptr i8*, i8** %tmp.4384, i32 0
%.tmp4638 = getelementptr [42 x i8], [42 x i8]*@.str4637, i32 0, i32 0
%.tmp4639 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4640 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4639, i32 0, i32 2
%.tmp4641 = load i8*, i8** %.tmp4640
%.tmp4642 = load i32, i32* %args_required.4611
%.tmp4643 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4636, i8* %.tmp4638, i8* %.tmp4641, i32 %.tmp4642)
%.tmp4644 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4645 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4646 = load i8*, i8** %tmp.4384
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp4644, %m812$.Node.type* %.tmp4645, i8* %.tmp4646)
%.tmp4647 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp4647
br label %.for.end.4612
.for.end.4612:
br label %.if.end.4610
.if.false.4610:
br label %.if.end.4610
.if.end.4610:
br label %.if.end.4430
.if.end.4430:
%.tmp4648 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4649 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4650 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4649, i32 0, i32 4
%.tmp4651 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4650
%.tmp4652 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4651, i32 0, i32 3
%.tmp4653 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4652
%.tmp4654 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4648, %m2437$.Type.type* %.tmp4653)
%.tmp4656 = getelementptr [5 x i8], [5 x i8]*@.str4655, i32 0, i32 0
%.tmp4657 = call i32(i8*,i8*) @strcmp(i8* %.tmp4654, i8* %.tmp4656)
%.tmp4658 = icmp eq i32 %.tmp4657, 0
br i1 %.tmp4658, label %.if.true.4659, label %.if.false.4659
.if.true.4659:
%.tmp4660 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4661 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp4660, i32 0, i32 1
%.tmp4662 = load %m0$.File.type*, %m0$.File.type** %.tmp4661
%.tmp4664 = getelementptr [16 x i8], [16 x i8]*@.str4663, i32 0, i32 0
%.tmp4665 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4666 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4667 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4666, i32 0, i32 4
%.tmp4668 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4667
%.tmp4669 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4665, %m2437$.Type.type* %.tmp4668)
%.tmp4670 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4671 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp4670)
%.tmp4672 = load i8*, i8** %params_buff.4383
%.tmp4673 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4662, i8* %.tmp4664, i8* %.tmp4669, i8* %.tmp4671, i8* %.tmp4672)
%.tmp4674 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp4674
br label %.if.end.4659
.if.false.4659:
br label %.if.end.4659
.if.end.4659:
%.tmp4675 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4676 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp4675)
%call_info.4677 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp4676, %m2437$.AssignableInfo.type** %call_info.4677
%.tmp4678 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4679 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %call_info.4677
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp4678, %m2437$.AssignableInfo.type* %.tmp4679)
%.tmp4680 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %call_info.4677
%.tmp4681 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4680, i32 0, i32 4
%.tmp4682 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4683 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4682, i32 0, i32 4
%.tmp4684 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4683
%.tmp4685 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4684, i32 0, i32 3
%.tmp4686 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4685
%.tmp4687 = call %m2437$.Type.type*(%m2437$.Type.type*) @m229$type_clone.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.tmp4686)
store %m2437$.Type.type* %.tmp4687, %m2437$.Type.type** %.tmp4681
%.tmp4688 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %call_info.4677
%.tmp4689 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4688, i32 0, i32 4
%.tmp4690 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4689
%.tmp4691 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4690, i32 0, i32 4
store %m2437$.Type.type* null, %m2437$.Type.type** %.tmp4691
%.tmp4692 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4693 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp4692, i32 0, i32 1
%.tmp4694 = load %m0$.File.type*, %m0$.File.type** %.tmp4693
%.tmp4696 = getelementptr [21 x i8], [21 x i8]*@.str4695, i32 0, i32 0
%.tmp4697 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %call_info.4677
%.tmp4698 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp4697)
%.tmp4699 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4700 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4701 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4700, i32 0, i32 4
%.tmp4702 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4701
%.tmp4703 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4699, %m2437$.Type.type* %.tmp4702)
%.tmp4704 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4356
%.tmp4705 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp4704)
%.tmp4706 = load i8*, i8** %params_buff.4383
%.tmp4707 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4694, i8* %.tmp4696, i8* %.tmp4698, i8* %.tmp4703, i8* %.tmp4705, i8* %.tmp4706)
%.tmp4708 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %call_info.4677
%.tmp4709 = bitcast %m2437$.AssignableInfo.type* %.tmp4708 to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp4709
}
define void @m229$compile_expression.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%err_msg.4710 = alloca i8*
store i8* null, i8** %err_msg.4710
%.tmp4711 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4712 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4711, i32 0, i32 0
%.tmp4713 = load i8*, i8** %.tmp4712
%expr_type.4714 = alloca i8*
store i8* %.tmp4713, i8** %expr_type.4714
%.tmp4715 = bitcast ptr null to %m2437$.AssignableInfo.type*
%info.4716 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp4715, %m2437$.AssignableInfo.type** %info.4716
%assignable.4717 = alloca %m812$.Node.type*
store %m812$.Node.type* null, %m812$.Node.type** %assignable.4717
%.tmp4718 = bitcast ptr null to %m2437$.AssignableInfo.type*
%a_info.4719 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp4718, %m2437$.AssignableInfo.type** %a_info.4719
%.tmp4720 = load i8*, i8** %expr_type.4714
%.tmp4722 = getelementptr [7 x i8], [7 x i8]*@.str4721, i32 0, i32 0
%.tmp4723 = call i32(i8*,i8*) @strcmp(i8* %.tmp4720, i8* %.tmp4722)
%.tmp4724 = icmp eq i32 %.tmp4723, 0
br i1 %.tmp4724, label %.if.true.4725, label %.if.false.4725
.if.true.4725:
%.tmp4726 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4727 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4726, i32 0, i32 6
%.tmp4728 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4727
%.tmp4729 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4728, i32 0, i32 7
%.tmp4730 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4729
%.tmp4731 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4730, i32 0, i32 0
%.tmp4732 = load i8*, i8** %.tmp4731
%.tmp4734 = getelementptr [3 x i8], [3 x i8]*@.str4733, i32 0, i32 0
%.tmp4735 = call i32(i8*,i8*) @strcmp(i8* %.tmp4732, i8* %.tmp4734)
%.tmp4736 = icmp ne i32 %.tmp4735, 0
br i1 %.tmp4736, label %.if.true.4737, label %.if.false.4737
.if.true.4737:
%.tmp4738 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4739 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4740 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4739, i32 0, i32 6
%.tmp4741 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4740
%.tmp4742 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4741, i32 0, i32 7
%.tmp4743 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4742
%.tmp4744 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_assignable.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4738, %m812$.Node.type* %.tmp4743)
store %m2437$.AssignableInfo.type* %.tmp4744, %m2437$.AssignableInfo.type** %info.4716
%.tmp4745 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4716
%.tmp4746 = icmp eq %m2437$.AssignableInfo.type* %.tmp4745, null
br i1 %.tmp4746, label %.if.true.4747, label %.if.false.4747
.if.true.4747:
ret void
br label %.if.end.4747
.if.false.4747:
br label %.if.end.4747
.if.end.4747:
%.tmp4748 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4749 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp4748, i32 0, i32 1
%.tmp4750 = load %m0$.File.type*, %m0$.File.type** %.tmp4749
%.tmp4752 = getelementptr [11 x i8], [11 x i8]*@.str4751, i32 0, i32 0
%.tmp4753 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4754 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4716
%.tmp4755 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4754, i32 0, i32 4
%.tmp4756 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4755
%.tmp4757 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4753, %m2437$.Type.type* %.tmp4756)
%.tmp4758 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.4716
%.tmp4759 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp4758)
%.tmp4760 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4750, i8* %.tmp4752, i8* %.tmp4757, i8* %.tmp4759)
br label %.if.end.4737
.if.false.4737:
%.tmp4761 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4762 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp4761, i32 0, i32 1
%.tmp4763 = load %m0$.File.type*, %m0$.File.type** %.tmp4762
%.tmp4765 = getelementptr [10 x i8], [10 x i8]*@.str4764, i32 0, i32 0
%.tmp4766 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4763, i8* %.tmp4765)
br label %.if.end.4737
.if.end.4737:
br label %.if.end.4725
.if.false.4725:
%.tmp4767 = load i8*, i8** %expr_type.4714
%.tmp4769 = getelementptr [3 x i8], [3 x i8]*@.str4768, i32 0, i32 0
%.tmp4770 = call i32(i8*,i8*) @strcmp(i8* %.tmp4767, i8* %.tmp4769)
%.tmp4771 = icmp eq i32 %.tmp4770, 0
br i1 %.tmp4771, label %.if.true.4772, label %.if.false.4772
.if.true.4772:
br label %.if.end.4772
.if.false.4772:
%.tmp4773 = load i8*, i8** %expr_type.4714
%.tmp4775 = getelementptr [8 x i8], [8 x i8]*@.str4774, i32 0, i32 0
%.tmp4776 = call i32(i8*,i8*) @strcmp(i8* %.tmp4773, i8* %.tmp4775)
%.tmp4777 = icmp eq i32 %.tmp4776, 0
br i1 %.tmp4777, label %.if.true.4778, label %.if.false.4778
.if.true.4778:
%.tmp4779 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4780 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4781 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4780, i32 0, i32 6
%.tmp4782 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4781
%.tmp4783 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_fn_call.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4779, %m812$.Node.type* %.tmp4782)
br label %.if.end.4778
.if.false.4778:
%.tmp4784 = load i8*, i8** %expr_type.4714
%.tmp4786 = getelementptr [12 x i8], [12 x i8]*@.str4785, i32 0, i32 0
%.tmp4787 = call i32(i8*,i8*) @strcmp(i8* %.tmp4784, i8* %.tmp4786)
%.tmp4788 = icmp eq i32 %.tmp4787, 0
br i1 %.tmp4788, label %.if.true.4789, label %.if.false.4789
.if.true.4789:
%.tmp4790 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4791 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4792 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_declaration.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4790, %m812$.Node.type* %.tmp4791)
br label %.if.end.4789
.if.false.4789:
%.tmp4793 = load i8*, i8** %expr_type.4714
%.tmp4795 = getelementptr [11 x i8], [11 x i8]*@.str4794, i32 0, i32 0
%.tmp4796 = call i32(i8*,i8*) @strcmp(i8* %.tmp4793, i8* %.tmp4795)
%.tmp4797 = icmp eq i32 %.tmp4796, 0
br i1 %.tmp4797, label %.if.true.4798, label %.if.false.4798
.if.true.4798:
%.tmp4799 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4800 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4799, i32 0, i32 6
%.tmp4801 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4800
%.tmp4803 = getelementptr [11 x i8], [11 x i8]*@.str4802, i32 0, i32 0
%.tmp4804 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp4801, i8* %.tmp4803)
store %m812$.Node.type* %.tmp4804, %m812$.Node.type** %assignable.4717
%.tmp4805 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4806 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4807 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4806, i32 0, i32 6
%.tmp4808 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4807
%.tmp4809 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_addr.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4805, %m812$.Node.type* %.tmp4808)
%dest.4810 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp4809, %m2437$.AssignableInfo.type** %dest.4810
%.tmp4811 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %dest.4810
%.tmp4812 = icmp eq %m2437$.AssignableInfo.type* %.tmp4811, null
br i1 %.tmp4812, label %.if.true.4813, label %.if.false.4813
.if.true.4813:
ret void
br label %.if.end.4813
.if.false.4813:
br label %.if.end.4813
.if.end.4813:
%.tmp4814 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4815 = load %m812$.Node.type*, %m812$.Node.type** %assignable.4717
%.tmp4816 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_assignable.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4814, %m812$.Node.type* %.tmp4815)
store %m2437$.AssignableInfo.type* %.tmp4816, %m2437$.AssignableInfo.type** %a_info.4719
%.tmp4817 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.4719
%.tmp4818 = icmp eq %m2437$.AssignableInfo.type* %.tmp4817, null
br i1 %.tmp4818, label %.if.true.4819, label %.if.false.4819
.if.true.4819:
ret void
br label %.if.end.4819
.if.false.4819:
br label %.if.end.4819
.if.end.4819:
%.tmp4820 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4821 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %dest.4810
%.tmp4822 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4821, i32 0, i32 4
%.tmp4823 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4822
%.tmp4824 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4820, %m2437$.Type.type* %.tmp4823)
%dest_tr.4825 = alloca i8*
store i8* %.tmp4824, i8** %dest_tr.4825
%.tmp4826 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4827 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.4719
%.tmp4828 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp4827, i32 0, i32 4
%.tmp4829 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4828
%.tmp4830 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp4826, %m2437$.Type.type* %.tmp4829)
%src_tr.4831 = alloca i8*
store i8* %.tmp4830, i8** %src_tr.4831
%.tmp4832 = load i8*, i8** %src_tr.4831
%.tmp4834 = getelementptr [4 x i8], [4 x i8]*@.str4833, i32 0, i32 0
%.tmp4835 = call i32(i8*,i8*) @strcmp(i8* %.tmp4832, i8* %.tmp4834)
%.tmp4836 = icmp eq i32 %.tmp4835, 0
br i1 %.tmp4836, label %.if.true.4837, label %.if.false.4837
.if.true.4837:
%.tmp4838 = load i8*, i8** %dest_tr.4825
store i8* %.tmp4838, i8** %src_tr.4831
br label %.if.end.4837
.if.false.4837:
br label %.if.end.4837
.if.end.4837:
%.tmp4839 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4840 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp4839, i32 0, i32 1
%.tmp4841 = load %m0$.File.type*, %m0$.File.type** %.tmp4840
%.tmp4843 = getelementptr [21 x i8], [21 x i8]*@.str4842, i32 0, i32 0
%.tmp4844 = load i8*, i8** %src_tr.4831
%.tmp4845 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.4719
%.tmp4846 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp4845)
%.tmp4847 = load i8*, i8** %dest_tr.4825
%.tmp4848 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %dest.4810
%.tmp4849 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp4848)
%.tmp4850 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4841, i8* %.tmp4843, i8* %.tmp4844, i8* %.tmp4846, i8* %.tmp4847, i8* %.tmp4849)
br label %.if.end.4798
.if.false.4798:
%.tmp4851 = load i8*, i8** %expr_type.4714
%.tmp4853 = getelementptr [9 x i8], [9 x i8]*@.str4852, i32 0, i32 0
%.tmp4854 = call i32(i8*,i8*) @strcmp(i8* %.tmp4851, i8* %.tmp4853)
%.tmp4855 = icmp eq i32 %.tmp4854, 0
br i1 %.tmp4855, label %.if.true.4856, label %.if.false.4856
.if.true.4856:
%.tmp4857 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4858 = load %m812$.Node.type*, %m812$.Node.type** %stmt
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_if_block.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4857, %m812$.Node.type* %.tmp4858)
br label %.if.end.4856
.if.false.4856:
%.tmp4859 = load i8*, i8** %expr_type.4714
%.tmp4861 = getelementptr [9 x i8], [9 x i8]*@.str4860, i32 0, i32 0
%.tmp4862 = call i32(i8*,i8*) @strcmp(i8* %.tmp4859, i8* %.tmp4861)
%.tmp4863 = icmp eq i32 %.tmp4862, 0
br i1 %.tmp4863, label %.if.true.4864, label %.if.false.4864
.if.true.4864:
%.tmp4865 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4866 = load %m812$.Node.type*, %m812$.Node.type** %stmt
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_for_loop.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4865, %m812$.Node.type* %.tmp4866)
br label %.if.end.4864
.if.false.4864:
%.tmp4867 = load i8*, i8** %expr_type.4714
%.tmp4869 = getelementptr [8 x i8], [8 x i8]*@.str4868, i32 0, i32 0
%.tmp4870 = call i32(i8*,i8*) @strcmp(i8* %.tmp4867, i8* %.tmp4869)
%.tmp4871 = icmp eq i32 %.tmp4870, 0
br i1 %.tmp4871, label %.if.true.4872, label %.if.false.4872
.if.true.4872:
%.tmp4873 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4874 = call %m2437$.ModuleLookup.type*(%m2437$.CompilerCtx.type*) @m229$get_current_module.m2437$.ModuleLookup.typep.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp4873)
%mod.4875 = alloca %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* %.tmp4874, %m2437$.ModuleLookup.type** %mod.4875
%.tmp4876 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.4875
%.tmp4877 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp4876, i32 0, i32 3
%.tmp4878 = load %m2437$.Scope.type*, %m2437$.Scope.type** %.tmp4877
%s.4879 = alloca %m2437$.Scope.type*
store %m2437$.Scope.type* %.tmp4878, %m2437$.Scope.type** %s.4879
%.tmp4880 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4881 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4880, i32 0, i32 6
%.tmp4882 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4881
%.tmp4883 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4882, i32 0, i32 1
%.tmp4884 = load i8*, i8** %.tmp4883
%.tmp4886 = getelementptr [6 x i8], [6 x i8]*@.str4885, i32 0, i32 0
%.tmp4887 = call i32(i8*,i8*) @strcmp(i8* %.tmp4884, i8* %.tmp4886)
%.tmp4888 = icmp eq i32 %.tmp4887, 0
br i1 %.tmp4888, label %.if.true.4889, label %.if.false.4889
.if.true.4889:
br label %.for.start.4890
.for.start.4890:
%.tmp4891 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.4879
%.tmp4892 = icmp ne %m2437$.Scope.type* %.tmp4891, null
br i1 %.tmp4892, label %.for.continue.4890, label %.for.else.4890
.for.continue.4890:
%.tmp4893 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.4879
%.tmp4894 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp4893, i32 0, i32 2
%.tmp4895 = load i8*, i8** %.tmp4894
%.tmp4897 = getelementptr [4 x i8], [4 x i8]*@.str4896, i32 0, i32 0
%.tmp4898 = call i32(i8*,i8*) @strcmp(i8* %.tmp4895, i8* %.tmp4897)
%.tmp4899 = icmp eq i32 %.tmp4898, 0
br i1 %.tmp4899, label %.if.true.4900, label %.if.false.4900
.if.true.4900:
%.tmp4901 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4902 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp4901, i32 0, i32 1
%.tmp4903 = load %m0$.File.type*, %m0$.File.type** %.tmp4902
%.tmp4905 = getelementptr [15 x i8], [15 x i8]*@.str4904, i32 0, i32 0
%.tmp4906 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.4879
%.tmp4907 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp4906, i32 0, i32 4
%.tmp4908 = load i8*, i8** %.tmp4907
%.tmp4909 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4903, i8* %.tmp4905, i8* %.tmp4908)
br label %.for.end.4890
br label %.if.end.4900
.if.false.4900:
br label %.if.end.4900
.if.end.4900:
%.tmp4910 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.4879
%.tmp4911 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp4910, i32 0, i32 5
%.tmp4912 = load %m2437$.Scope.type*, %m2437$.Scope.type** %.tmp4911
store %m2437$.Scope.type* %.tmp4912, %m2437$.Scope.type** %s.4879
br label %.for.start.4890
.for.else.4890:
%.tmp4913 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4914 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4916 = getelementptr [48 x i8], [48 x i8]*@.str4915, i32 0, i32 0
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp4913, %m812$.Node.type* %.tmp4914, i8* %.tmp4916)
br label %.for.end.4890
.for.end.4890:
br label %.if.end.4889
.if.false.4889:
%.tmp4917 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4918 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4917, i32 0, i32 6
%.tmp4919 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4918
%.tmp4920 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4919, i32 0, i32 1
%.tmp4921 = load i8*, i8** %.tmp4920
%.tmp4923 = getelementptr [9 x i8], [9 x i8]*@.str4922, i32 0, i32 0
%.tmp4924 = call i32(i8*,i8*) @strcmp(i8* %.tmp4921, i8* %.tmp4923)
%.tmp4925 = icmp eq i32 %.tmp4924, 0
br i1 %.tmp4925, label %.if.true.4926, label %.if.false.4926
.if.true.4926:
br label %.for.start.4927
.for.start.4927:
%.tmp4928 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.4879
%.tmp4929 = icmp ne %m2437$.Scope.type* %.tmp4928, null
br i1 %.tmp4929, label %.for.continue.4927, label %.for.else.4927
.for.continue.4927:
%.tmp4930 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.4879
%.tmp4931 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp4930, i32 0, i32 2
%.tmp4932 = load i8*, i8** %.tmp4931
%.tmp4934 = getelementptr [4 x i8], [4 x i8]*@.str4933, i32 0, i32 0
%.tmp4935 = call i32(i8*,i8*) @strcmp(i8* %.tmp4932, i8* %.tmp4934)
%.tmp4936 = icmp eq i32 %.tmp4935, 0
br i1 %.tmp4936, label %.if.true.4937, label %.if.false.4937
.if.true.4937:
%.tmp4938 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4939 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp4938, i32 0, i32 1
%.tmp4940 = load %m0$.File.type*, %m0$.File.type** %.tmp4939
%.tmp4942 = getelementptr [15 x i8], [15 x i8]*@.str4941, i32 0, i32 0
%.tmp4943 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.4879
%.tmp4944 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp4943, i32 0, i32 3
%.tmp4945 = load i8*, i8** %.tmp4944
%.tmp4946 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4940, i8* %.tmp4942, i8* %.tmp4945)
br label %.for.end.4927
br label %.if.end.4937
.if.false.4937:
br label %.if.end.4937
.if.end.4937:
%.tmp4947 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.4879
%.tmp4948 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp4947, i32 0, i32 5
%.tmp4949 = load %m2437$.Scope.type*, %m2437$.Scope.type** %.tmp4948
store %m2437$.Scope.type* %.tmp4949, %m2437$.Scope.type** %s.4879
br label %.for.start.4927
.for.else.4927:
%.tmp4950 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4951 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4953 = getelementptr [51 x i8], [51 x i8]*@.str4952, i32 0, i32 0
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp4950, %m812$.Node.type* %.tmp4951, i8* %.tmp4953)
br label %.for.end.4927
.for.end.4927:
br label %.if.end.4926
.if.false.4926:
%.tmp4954 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4955 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4957 = getelementptr [40 x i8], [40 x i8]*@.str4956, i32 0, i32 0
%.tmp4958 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp4954, %m812$.Node.type* %.tmp4955, i8* %.tmp4957)
%.tmp4959 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4960 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4959, i32 0, i32 6
%.tmp4961 = load %m812$.Node.type*, %m812$.Node.type** %.tmp4960
%.tmp4962 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp4961, i32 0, i32 1
%.tmp4963 = load i8*, i8** %.tmp4962
%.tmp4964 = call i32(i8*,...) @printf(i8* %.tmp4958, i8* %.tmp4963)
br label %.if.end.4926
.if.end.4926:
br label %.if.end.4889
.if.end.4889:
br label %.if.end.4872
.if.false.4872:
%.tmp4965 = load i8*, i8** %expr_type.4714
%.tmp4967 = getelementptr [9 x i8], [9 x i8]*@.str4966, i32 0, i32 0
%.tmp4968 = call i32(i8*,i8*) @strcmp(i8* %.tmp4965, i8* %.tmp4967)
%.tmp4969 = icmp eq i32 %.tmp4968, 0
br i1 %.tmp4969, label %.if.true.4970, label %.if.false.4970
.if.true.4970:
%.tmp4971 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4972 = load %m812$.Node.type*, %m812$.Node.type** %stmt
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_closure.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp4971, %m812$.Node.type* %.tmp4972)
br label %.if.end.4970
.if.false.4970:
%.tmp4973 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4974 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp4976 = getelementptr [34 x i8], [34 x i8]*@.str4975, i32 0, i32 0
%.tmp4977 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp4973, %m812$.Node.type* %.tmp4974, i8* %.tmp4976)
%.tmp4978 = load i8*, i8** %expr_type.4714
%.tmp4979 = call i32(i8*,...) @printf(i8* %.tmp4977, i8* %.tmp4978)
br label %.if.end.4970
.if.end.4970:
br label %.if.end.4872
.if.end.4872:
br label %.if.end.4864
.if.end.4864:
br label %.if.end.4856
.if.end.4856:
br label %.if.end.4798
.if.end.4798:
br label %.if.end.4789
.if.end.4789:
br label %.if.end.4778
.if.end.4778:
br label %.if.end.4772
.if.end.4772:
br label %.if.end.4725
.if.end.4725:
ret void
}
define %m2437$.Type.type* @m229$type_ptr_of_chr.m2437$.Type.typep() {
%.tmp4980 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
%t.4981 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp4980, %m2437$.Type.type** %t.4981
%.tmp4982 = load %m2437$.Type.type*, %m2437$.Type.type** %t.4981
%.tmp4983 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4982, i32 0, i32 0
%.tmp4985 = getelementptr [4 x i8], [4 x i8]*@.str4984, i32 0, i32 0
store i8* %.tmp4985, i8** %.tmp4983
%.tmp4986 = load %m2437$.Type.type*, %m2437$.Type.type** %t.4981
%.tmp4987 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4986, i32 0, i32 3
%.tmp4988 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp4988, %m2437$.Type.type** %.tmp4987
%.tmp4989 = load %m2437$.Type.type*, %m2437$.Type.type** %t.4981
%.tmp4990 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4989, i32 0, i32 3
%.tmp4991 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp4990
%.tmp4992 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp4991, i32 0, i32 0
%.tmp4994 = getelementptr [4 x i8], [4 x i8]*@.str4993, i32 0, i32 0
store i8* %.tmp4994, i8** %.tmp4992
%.tmp4995 = load %m2437$.Type.type*, %m2437$.Type.type** %t.4981
ret %m2437$.Type.type* %.tmp4995
}
define void @m229$compile_closure.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%.tmp4996 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp4997 = call i32(%m2437$.CompilerCtx.type*) @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp4996)
%cj_id.4998 = alloca i32
store i32 %.tmp4997, i32* %cj_id.4998
%.tmp4999 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5000 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp4999)
%info_lit.5001 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp5000, %m2437$.AssignableInfo.type** %info_lit.5001
%.tmp5002 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lit.5001
%.tmp5003 = load i8, i8* @SCOPE_GLOBAL
%.tmp5005 = getelementptr [21 x i8], [21 x i8]*@.str5004, i32 0, i32 0
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp5002, i8 %.tmp5003, i8* %.tmp5005)
%.tmp5006 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lit.5001
%.tmp5007 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5006, i32 0, i32 4
%.tmp5008 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5008, %m2437$.Type.type** %.tmp5007
%.tmp5009 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lit.5001
%.tmp5010 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5009, i32 0, i32 4
%.tmp5011 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5010
%.tmp5012 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5011, i32 0, i32 0
%.tmp5014 = getelementptr [9 x i8], [9 x i8]*@.str5013, i32 0, i32 0
store i8* %.tmp5014, i8** %.tmp5012
%.tmp5015 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lit.5001
%.tmp5016 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5015, i32 0, i32 4
%.tmp5017 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5016
%.tmp5018 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5017, i32 0, i32 3
%.tmp5019 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5019, %m2437$.Type.type** %.tmp5018
%.tmp5020 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lit.5001
%.tmp5021 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5020, i32 0, i32 4
%.tmp5022 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5021
%.tmp5023 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5022, i32 0, i32 3
%.tmp5024 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5023
%.tmp5025 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5024, i32 0, i32 0
%.tmp5027 = getelementptr [5 x i8], [5 x i8]*@.str5026, i32 0, i32 0
store i8* %.tmp5027, i8** %.tmp5025
%.tmp5028 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lit.5001
%.tmp5029 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5028, i32 0, i32 4
%.tmp5030 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5029
%.tmp5031 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5030, i32 0, i32 3
%.tmp5032 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5031
%.tmp5033 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5032, i32 0, i32 4
%.tmp5034 = call %m2437$.Type.type*() @m229$type_ptr_of_chr.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5034, %m2437$.Type.type** %.tmp5033
%.tmp5035 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lit.5001
%.tmp5036 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5035, i32 0, i32 4
%.tmp5037 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5036
%.tmp5038 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5037, i32 0, i32 3
%.tmp5039 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5038
%.tmp5040 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5039, i32 0, i32 4
%.tmp5041 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5040
%.tmp5042 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5041, i32 0, i32 4
%.tmp5043 = call %m2437$.Type.type*() @m229$type_ptr_of_chr.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5043, %m2437$.Type.type** %.tmp5042
%.tmp5044 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lit.5001
%.tmp5045 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5044, i32 0, i32 4
%.tmp5046 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5045
%.tmp5047 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5046, i32 0, i32 3
%.tmp5048 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5047
%.tmp5049 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5048, i32 0, i32 4
%.tmp5050 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5049
%.tmp5051 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5050, i32 0, i32 4
%.tmp5052 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5051
%.tmp5053 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5052, i32 0, i32 4
%.tmp5054 = call %m2437$.Type.type*() @m229$type_ptr_of_chr.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5054, %m2437$.Type.type** %.tmp5053
%.tmp5055 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5057 = getelementptr [21 x i8], [21 x i8]*@.str5056, i32 0, i32 0
%.tmp5059 = getelementptr [7 x i8], [7 x i8]*@.str5058, i32 0, i32 0
%.tmp5060 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lit.5001
call void(%m2437$.CompilerCtx.type*,i8*,i8*,%m2437$.AssignableInfo.type*,i1,i1) @m229$define_global.v.m2437$.CompilerCtx.typep.cp.cp.m2437$.AssignableInfo.typep.b.b(%m2437$.CompilerCtx.type* %.tmp5055, i8* %.tmp5057, i8* %.tmp5059, %m2437$.AssignableInfo.type* %.tmp5060, i1 1, i1 0)
%.tmp5061 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5062 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp5061)
%info_lat.5063 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp5062, %m2437$.AssignableInfo.type** %info_lat.5063
%.tmp5064 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lat.5063
%.tmp5065 = load i8, i8* @SCOPE_GLOBAL
%.tmp5067 = getelementptr [23 x i8], [23 x i8]*@.str5066, i32 0, i32 0
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp5064, i8 %.tmp5065, i8* %.tmp5067)
%.tmp5068 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lat.5063
%.tmp5069 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5068, i32 0, i32 4
%.tmp5070 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5070, %m2437$.Type.type** %.tmp5069
%.tmp5071 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lat.5063
%.tmp5072 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5071, i32 0, i32 4
%.tmp5073 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5072
%.tmp5074 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5073, i32 0, i32 0
%.tmp5076 = getelementptr [9 x i8], [9 x i8]*@.str5075, i32 0, i32 0
store i8* %.tmp5076, i8** %.tmp5074
%.tmp5077 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lat.5063
%.tmp5078 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5077, i32 0, i32 4
%.tmp5079 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5078
%.tmp5080 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5079, i32 0, i32 3
%.tmp5081 = call %m2437$.Type.type*() @m229$type_ptr_of_chr.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5081, %m2437$.Type.type** %.tmp5080
%.tmp5082 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lat.5063
%.tmp5083 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5082, i32 0, i32 4
%.tmp5084 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5083
%.tmp5085 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5084, i32 0, i32 3
%.tmp5086 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5085
%.tmp5087 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5086, i32 0, i32 4
%.tmp5088 = call %m2437$.Type.type*() @m229$type_ptr_of_chr.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5088, %m2437$.Type.type** %.tmp5087
%.tmp5089 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5091 = getelementptr [23 x i8], [23 x i8]*@.str5090, i32 0, i32 0
%.tmp5093 = getelementptr [7 x i8], [7 x i8]*@.str5092, i32 0, i32 0
%.tmp5094 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_lat.5063
call void(%m2437$.CompilerCtx.type*,i8*,i8*,%m2437$.AssignableInfo.type*,i1,i1) @m229$define_global.v.m2437$.CompilerCtx.typep.cp.cp.m2437$.AssignableInfo.typep.b.b(%m2437$.CompilerCtx.type* %.tmp5089, i8* %.tmp5091, i8* %.tmp5093, %m2437$.AssignableInfo.type* %.tmp5094, i1 1, i1 0)
%.tmp5095 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5096 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp5095)
%info_mmap.5097 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp5096, %m2437$.AssignableInfo.type** %info_mmap.5097
%.tmp5098 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_mmap.5097
%.tmp5099 = load i8, i8* @SCOPE_GLOBAL
%.tmp5101 = getelementptr [5 x i8], [5 x i8]*@.str5100, i32 0, i32 0
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp5098, i8 %.tmp5099, i8* %.tmp5101)
%.tmp5102 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_mmap.5097
%.tmp5103 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5102, i32 0, i32 4
%.tmp5104 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5104, %m2437$.Type.type** %.tmp5103
%.tmp5105 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_mmap.5097
%.tmp5106 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5105, i32 0, i32 4
%.tmp5107 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5106
%.tmp5108 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5107, i32 0, i32 0
%.tmp5110 = getelementptr [9 x i8], [9 x i8]*@.str5109, i32 0, i32 0
store i8* %.tmp5110, i8** %.tmp5108
%.tmp5111 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_mmap.5097
%.tmp5112 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5111, i32 0, i32 4
%.tmp5113 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5112
%.tmp5114 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5113, i32 0, i32 3
%.tmp5115 = call %m2437$.Type.type*() @m229$type_ptr_of_chr.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5115, %m2437$.Type.type** %.tmp5114
%.tmp5116 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_mmap.5097
%.tmp5117 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5116, i32 0, i32 4
%.tmp5118 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5117
%.tmp5119 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5118, i32 0, i32 3
%.tmp5120 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5119
%lt.5121 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp5120, %m2437$.Type.type** %lt.5121
%.tmp5122 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5123 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5122, i32 0, i32 4
%.tmp5124 = call %m2437$.Type.type*() @m229$type_ptr_of_chr.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5124, %m2437$.Type.type** %.tmp5123
%.tmp5125 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5126 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5125, i32 0, i32 4
%.tmp5127 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5126
store %m2437$.Type.type* %.tmp5127, %m2437$.Type.type** %lt.5121
%.tmp5128 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5129 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5128, i32 0, i32 4
%.tmp5130 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5130, %m2437$.Type.type** %.tmp5129
%.tmp5131 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5132 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5131, i32 0, i32 4
%.tmp5133 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5132
%.tmp5134 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5133, i32 0, i32 0
%.tmp5136 = getelementptr [4 x i8], [4 x i8]*@.str5135, i32 0, i32 0
store i8* %.tmp5136, i8** %.tmp5134
%.tmp5137 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5138 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5137, i32 0, i32 4
%.tmp5139 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5138
store %m2437$.Type.type* %.tmp5139, %m2437$.Type.type** %lt.5121
%.tmp5140 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5141 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5140, i32 0, i32 4
%.tmp5142 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5142, %m2437$.Type.type** %.tmp5141
%.tmp5143 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5144 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5143, i32 0, i32 4
%.tmp5145 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5144
%.tmp5146 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5145, i32 0, i32 0
%.tmp5148 = getelementptr [4 x i8], [4 x i8]*@.str5147, i32 0, i32 0
store i8* %.tmp5148, i8** %.tmp5146
%.tmp5149 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5150 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5149, i32 0, i32 4
%.tmp5151 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5150
store %m2437$.Type.type* %.tmp5151, %m2437$.Type.type** %lt.5121
%.tmp5152 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5153 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5152, i32 0, i32 4
%.tmp5154 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5154, %m2437$.Type.type** %.tmp5153
%.tmp5155 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5156 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5155, i32 0, i32 4
%.tmp5157 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5156
%.tmp5158 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5157, i32 0, i32 0
%.tmp5160 = getelementptr [4 x i8], [4 x i8]*@.str5159, i32 0, i32 0
store i8* %.tmp5160, i8** %.tmp5158
%.tmp5161 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5162 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5161, i32 0, i32 4
%.tmp5163 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5162
store %m2437$.Type.type* %.tmp5163, %m2437$.Type.type** %lt.5121
%.tmp5164 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5165 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5164, i32 0, i32 4
%.tmp5166 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5166, %m2437$.Type.type** %.tmp5165
%.tmp5167 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5168 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5167, i32 0, i32 4
%.tmp5169 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5168
%.tmp5170 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5169, i32 0, i32 0
%.tmp5172 = getelementptr [4 x i8], [4 x i8]*@.str5171, i32 0, i32 0
store i8* %.tmp5172, i8** %.tmp5170
%.tmp5173 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5174 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5173, i32 0, i32 4
%.tmp5175 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5174
store %m2437$.Type.type* %.tmp5175, %m2437$.Type.type** %lt.5121
%.tmp5176 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5177 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5176, i32 0, i32 4
%.tmp5178 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5178, %m2437$.Type.type** %.tmp5177
%.tmp5179 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5180 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5179, i32 0, i32 4
%.tmp5181 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5180
%.tmp5182 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5181, i32 0, i32 0
%.tmp5184 = getelementptr [4 x i8], [4 x i8]*@.str5183, i32 0, i32 0
store i8* %.tmp5184, i8** %.tmp5182
%.tmp5185 = load %m2437$.Type.type*, %m2437$.Type.type** %lt.5121
%.tmp5186 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5185, i32 0, i32 4
%.tmp5187 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5186
store %m2437$.Type.type* %.tmp5187, %m2437$.Type.type** %lt.5121
%.tmp5188 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5190 = getelementptr [5 x i8], [5 x i8]*@.str5189, i32 0, i32 0
%.tmp5192 = getelementptr [7 x i8], [7 x i8]*@.str5191, i32 0, i32 0
%.tmp5193 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info_mmap.5097
call void(%m2437$.CompilerCtx.type*,i8*,i8*,%m2437$.AssignableInfo.type*,i1,i1) @m229$define_global.v.m2437$.CompilerCtx.typep.cp.cp.m2437$.AssignableInfo.typep.b.b(%m2437$.CompilerCtx.type* %.tmp5188, i8* %.tmp5190, i8* %.tmp5192, %m2437$.AssignableInfo.type* %.tmp5193, i1 1, i1 0)
%.tmp5194 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5195 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5194, i32 0, i32 6
%.tmp5196 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5195
%.tmp5198 = getelementptr [5 x i8], [5 x i8]*@.str5197, i32 0, i32 0
%.tmp5199 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp5196, i8* %.tmp5198)
%fn_name_node.5200 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5199, %m812$.Node.type** %fn_name_node.5200
%.tmp5201 = load %m812$.Node.type*, %m812$.Node.type** %fn_name_node.5200
%.tmp5202 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5201, i32 0, i32 1
%.tmp5203 = load i8*, i8** %.tmp5202
%fn_name.5204 = alloca i8*
store i8* %.tmp5203, i8** %fn_name.5204
%.tmp5205 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5206 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp5205)
%info.5207 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp5206, %m2437$.AssignableInfo.type** %info.5207
%.tmp5208 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5207
%.tmp5209 = load i8, i8* @SCOPE_LOCAL
%.tmp5210 = load i8*, i8** %fn_name.5204
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp5208, i8 %.tmp5209, i8* %.tmp5210)
%.tmp5211 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5207
%.tmp5212 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5211, i32 0, i32 4
%.tmp5213 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5214 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5215 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5214, i32 0, i32 6
%.tmp5216 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5215
%.tmp5217 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$syn_function_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp5213, %m812$.Node.type* %.tmp5216)
store %m2437$.Type.type* %.tmp5217, %m2437$.Type.type** %.tmp5212
%.tmp5218 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5207
%.tmp5219 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5218, i32 0, i32 3
%.tmp5221 = getelementptr [9 x i8], [9 x i8]*@.str5220, i32 0, i32 0
store i8* %.tmp5221, i8** %.tmp5219
%.tmp5222 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5223 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5224 = load i8*, i8** %fn_name.5204
%.tmp5225 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5207
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*,%m2437$.AssignableInfo.type*) @m229$define_assignable.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp5222, %m812$.Node.type* %.tmp5223, i8* %.tmp5224, %m2437$.AssignableInfo.type* %.tmp5225)
%.tmp5226 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5227 = call i32(%m2437$.CompilerCtx.type*) @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp5226)
%closure_id.5228 = alloca i32
store i32 %.tmp5227, i32* %closure_id.5228
%.tmp5229 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5207
%.tmp5230 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5229, i32 0, i32 4
%.tmp5231 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5230
%.tmp5232 = call %m2437$.Type.type*(%m2437$.Type.type*) @m229$type_clone.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.tmp5231)
%closure_type.5233 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp5232, %m2437$.Type.type** %closure_type.5233
%.tmp5234 = load %m2437$.Type.type*, %m2437$.Type.type** %closure_type.5233
%.tmp5235 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5234, i32 0, i32 3
%.tmp5236 = load %m2437$.Type.type*, %m2437$.Type.type** %closure_type.5233
%.tmp5237 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5236, i32 0, i32 3
%.tmp5238 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5237
%.tmp5239 = call %m2437$.Type.type*(%m2437$.Type.type*) @m229$type_clone.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.tmp5238)
store %m2437$.Type.type* %.tmp5239, %m2437$.Type.type** %.tmp5235
%.tmp5240 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
%ctx_param.5241 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp5240, %m2437$.Type.type** %ctx_param.5241
%.tmp5242 = load %m2437$.Type.type*, %m2437$.Type.type** %ctx_param.5241
%.tmp5243 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5242, i32 0, i32 0
%.tmp5245 = getelementptr [4 x i8], [4 x i8]*@.str5244, i32 0, i32 0
store i8* %.tmp5245, i8** %.tmp5243
%.tmp5246 = load %m2437$.Type.type*, %m2437$.Type.type** %ctx_param.5241
%.tmp5247 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5246, i32 0, i32 3
%.tmp5248 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp5248, %m2437$.Type.type** %.tmp5247
%.tmp5249 = load %m2437$.Type.type*, %m2437$.Type.type** %ctx_param.5241
%.tmp5250 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5249, i32 0, i32 3
%.tmp5251 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5250
%.tmp5252 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5251, i32 0, i32 0
%.tmp5254 = getelementptr [7 x i8], [7 x i8]*@.str5253, i32 0, i32 0
store i8* %.tmp5254, i8** %.tmp5252
%.tmp5255 = load %m2437$.Type.type*, %m2437$.Type.type** %ctx_param.5241
%.tmp5256 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5255, i32 0, i32 4
%.tmp5257 = load %m2437$.Type.type*, %m2437$.Type.type** %closure_type.5233
%.tmp5258 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5257, i32 0, i32 3
%.tmp5259 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5258
%.tmp5260 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5259, i32 0, i32 4
%.tmp5261 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5260
store %m2437$.Type.type* %.tmp5261, %m2437$.Type.type** %.tmp5256
%.tmp5262 = load %m2437$.Type.type*, %m2437$.Type.type** %closure_type.5233
%.tmp5263 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5262, i32 0, i32 3
%.tmp5264 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5263
%.tmp5265 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5264, i32 0, i32 4
%.tmp5266 = load %m2437$.Type.type*, %m2437$.Type.type** %ctx_param.5241
store %m2437$.Type.type* %.tmp5266, %m2437$.Type.type** %.tmp5265
%.tmp5268 = getelementptr [1 x i8], [1 x i8]*@.str5267, i32 0, i32 0
%closure_name.5269 = alloca i8*
store i8* %.tmp5268, i8** %closure_name.5269
%.tmp5270 = getelementptr i8*, i8** %closure_name.5269, i32 0
%.tmp5272 = getelementptr [5 x i8], [5 x i8]*@.str5271, i32 0, i32 0
%.tmp5273 = load i32, i32* %closure_id.5228
%.tmp5274 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5270, i8* %.tmp5272, i32 %.tmp5273)
%.tmp5275 = load %m2437$.Type.type*, %m2437$.Type.type** %closure_type.5233
%.tmp5276 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5275, i32 0, i32 3
%.tmp5277 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5276
%.tmp5278 = call %m2437$.Type.type*(%m2437$.Type.type*) @m229$type_clone.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.tmp5277)
%ret_type.5279 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp5278, %m2437$.Type.type** %ret_type.5279
%.tmp5280 = load %m2437$.Type.type*, %m2437$.Type.type** %ret_type.5279
%.tmp5281 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5280, i32 0, i32 3
store %m2437$.Type.type* null, %m2437$.Type.type** %.tmp5281
%.tmp5282 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5283 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5282, i32 0, i32 1
%.tmp5284 = load %m0$.File.type*, %m0$.File.type** %.tmp5283
%.tmp5286 = getelementptr [101 x i8], [101 x i8]*@.str5285, i32 0, i32 0
%.tmp5287 = load i32, i32* %closure_id.5228
%.tmp5288 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5284, i8* %.tmp5286, i32 %.tmp5287)
%.tmp5289 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5290 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5289, i32 0, i32 1
%.tmp5291 = load %m0$.File.type*, %m0$.File.type** %.tmp5290
%.tmp5293 = getelementptr [100 x i8], [100 x i8]*@.str5292, i32 0, i32 0
%.tmp5294 = load i32, i32* %closure_id.5228
%.tmp5295 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5296 = load %m2437$.Type.type*, %m2437$.Type.type** %closure_type.5233
%.tmp5297 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp5295, %m2437$.Type.type* %.tmp5296)
%.tmp5298 = load i8*, i8** %closure_name.5269
%.tmp5299 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5291, i8* %.tmp5293, i32 %.tmp5294, i8* %.tmp5297, i8* %.tmp5298)
%.tmp5300 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5301 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5300, i32 0, i32 1
%.tmp5302 = load %m0$.File.type*, %m0$.File.type** %.tmp5301
%.tmp5304 = getelementptr [66 x i8], [66 x i8]*@.str5303, i32 0, i32 0
%.tmp5305 = load i32, i32* %closure_id.5228
%.tmp5306 = load i32, i32* %closure_id.5228
%.tmp5307 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5302, i8* %.tmp5304, i32 %.tmp5305, i32 %.tmp5306)
%.tmp5308 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5309 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5308, i32 0, i32 1
%.tmp5310 = load %m0$.File.type*, %m0$.File.type** %.tmp5309
%.tmp5312 = getelementptr [35 x i8], [35 x i8]*@.str5311, i32 0, i32 0
%.tmp5313 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5207
%.tmp5314 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp5313)
%.tmp5315 = load i32, i32* %closure_id.5228
%.tmp5316 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5317 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5207
%.tmp5318 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5317, i32 0, i32 4
%.tmp5319 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5318
%.tmp5320 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp5316, %m2437$.Type.type* %.tmp5319)
%.tmp5321 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5310, i8* %.tmp5312, i8* %.tmp5314, i32 %.tmp5315, i8* %.tmp5320)
%.tmp5322 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5323 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5322, i32 0, i32 1
%.tmp5324 = load %m0$.File.type*, %m0$.File.type** %.tmp5323
%bkp_ctx.5325 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp5324, %m0$.File.type** %bkp_ctx.5325
%.tmp5326 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5327 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5326, i32 0, i32 1
%.tmp5328 = call %m0$.File.type*() @tmpfile()
store %m0$.File.type* %.tmp5328, %m0$.File.type** %.tmp5327
%.tmp5329 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5330 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5329, i32 0, i32 1
%.tmp5331 = load %m0$.File.type*, %m0$.File.type** %.tmp5330
%.tmp5333 = getelementptr [14 x i8], [14 x i8]*@.str5332, i32 0, i32 0
%.tmp5334 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5335 = load %m2437$.Type.type*, %m2437$.Type.type** %ret_type.5279
%.tmp5336 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp5334, %m2437$.Type.type* %.tmp5335)
%.tmp5337 = load i8*, i8** %closure_name.5269
%.tmp5338 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5331, i8* %.tmp5333, i8* %.tmp5336, i8* %.tmp5337)
%.tmp5339 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5340 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5339, i32 0, i32 1
%.tmp5341 = load %m0$.File.type*, %m0$.File.type** %.tmp5340
%.tmp5343 = getelementptr [13 x i8], [13 x i8]*@.str5342, i32 0, i32 0
%.tmp5344 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5345 = load %m2437$.Type.type*, %m2437$.Type.type** %ctx_param.5241
%.tmp5346 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp5344, %m2437$.Type.type* %.tmp5345)
%.tmp5347 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5341, i8* %.tmp5343, i8* %.tmp5346)
%.tmp5348 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5349 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5348, i32 0, i32 1
%.tmp5350 = load %m0$.File.type*, %m0$.File.type** %.tmp5349
%.tmp5352 = getelementptr [5 x i8], [5 x i8]*@.str5351, i32 0, i32 0
%.tmp5353 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5350, i8* %.tmp5352)
%.tmp5354 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5355 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5354, i32 0, i32 6
%.tmp5356 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5355
%.tmp5358 = getelementptr [6 x i8], [6 x i8]*@.str5357, i32 0, i32 0
%.tmp5359 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp5356, i8* %.tmp5358)
%block.5360 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5359, %m812$.Node.type** %block.5360
%.tmp5361 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5362 = load %m812$.Node.type*, %m812$.Node.type** %block.5360
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_block.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp5361, %m812$.Node.type* %.tmp5362)
%.tmp5363 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5364 = load %m812$.Node.type*, %m812$.Node.type** %block.5360
%.tmp5365 = load %m2437$.Type.type*, %m2437$.Type.type** %ret_type.5279
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,%m2437$.Type.type*) @m229$check_n_add_implicit_return.v.m2437$.CompilerCtx.typep.m812$.Node.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp5363, %m812$.Node.type* %.tmp5364, %m2437$.Type.type* %.tmp5365)
%.tmp5366 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5367 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5366, i32 0, i32 1
%.tmp5368 = load %m0$.File.type*, %m0$.File.type** %.tmp5367
%.tmp5370 = getelementptr [3 x i8], [3 x i8]*@.str5369, i32 0, i32 0
%.tmp5371 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5368, i8* %.tmp5370)
%.tmp5372 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5373 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5372, i32 0, i32 1
%.tmp5374 = load %m0$.File.type*, %m0$.File.type** %.tmp5373
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp5374)
%.tmp5375 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5376 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5375, i32 0, i32 1
%.tmp5377 = load %m0$.File.type*, %m0$.File.type** %.tmp5376
%.tmp5378 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp5377)
%.tmp5379 = call i8*(i32) @m1$readall.cp.i(i32 %.tmp5378)
%code.5380 = alloca i8*
store i8* %.tmp5379, i8** %code.5380
%.tmp5381 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5382 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5381, i32 0, i32 1
%.tmp5383 = load %m0$.File.type*, %m0$.File.type** %.tmp5382
%.tmp5384 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp5383)
%.tmp5385 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5386 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5385, i32 0, i32 1
%.tmp5387 = load %m0$.File.type*, %m0$.File.type** %bkp_ctx.5325
store %m0$.File.type* %.tmp5387, %m0$.File.type** %.tmp5386
%.tmp5388 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5389 = load i8*, i8** %code.5380
call void(%m2437$.CompilerCtx.type*,i8*) @m229$append_anon_fn.v.m2437$.CompilerCtx.typep.cp(%m2437$.CompilerCtx.type* %.tmp5388, i8* %.tmp5389)
ret void
}
define void @m229$check_n_add_implicit_return.v.m2437$.CompilerCtx.typep.m812$.Node.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg, %m2437$.Type.type* %.return_type.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%return_type = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.return_type.arg, %m2437$.Type.type** %return_type
%.tmp5390 = bitcast ptr null to %m812$.Node.type*
%li.5391 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5390, %m812$.Node.type** %li.5391
%.tmp5392 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5393 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5392, i32 0, i32 6
%.tmp5394 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5393
%.tmp5396 = getelementptr [12 x i8], [12 x i8]*@.str5395, i32 0, i32 0
%.tmp5397 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp5394, i8* %.tmp5396)
%exprs.5398 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5397, %m812$.Node.type** %exprs.5398
%.tmp5400 = load %m812$.Node.type*, %m812$.Node.type** %exprs.5398
%.tmp5401 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5400, i32 0, i32 6
%.tmp5402 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5401
%ci.5403 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5402, %m812$.Node.type** %ci.5403
br label %.for.start.5399
.for.start.5399:
%.tmp5404 = load %m812$.Node.type*, %m812$.Node.type** %ci.5403
%.tmp5405 = icmp ne %m812$.Node.type* %.tmp5404, null
br i1 %.tmp5405, label %.for.continue.5399, label %.for.end.5399
.for.continue.5399:
%.tmp5406 = load %m812$.Node.type*, %m812$.Node.type** %ci.5403
%.tmp5407 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5406, i32 0, i32 0
%.tmp5408 = load i8*, i8** %.tmp5407
%.tmp5410 = getelementptr [3 x i8], [3 x i8]*@.str5409, i32 0, i32 0
%.tmp5411 = call i32(i8*,i8*) @strcmp(i8* %.tmp5408, i8* %.tmp5410)
%.tmp5412 = icmp ne i32 %.tmp5411, 0
br i1 %.tmp5412, label %.if.true.5413, label %.if.false.5413
.if.true.5413:
%.tmp5414 = load %m812$.Node.type*, %m812$.Node.type** %ci.5403
store %m812$.Node.type* %.tmp5414, %m812$.Node.type** %li.5391
br label %.if.end.5413
.if.false.5413:
br label %.if.end.5413
.if.end.5413:
%.tmp5415 = load %m812$.Node.type*, %m812$.Node.type** %ci.5403
%.tmp5416 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5415, i32 0, i32 7
%.tmp5417 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5416
store %m812$.Node.type* %.tmp5417, %m812$.Node.type** %ci.5403
br label %.for.start.5399
.for.end.5399:
%.tmp5418 = load %m812$.Node.type*, %m812$.Node.type** %li.5391
%.tmp5419 = icmp ne %m812$.Node.type* %.tmp5418, null
br i1 %.tmp5419, label %.if.true.5420, label %.if.false.5420
.if.true.5420:
%.tmp5421 = load %m812$.Node.type*, %m812$.Node.type** %li.5391
%.tmp5422 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5421, i32 0, i32 6
%.tmp5423 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5422
%.tmp5424 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5423, i32 0, i32 0
%.tmp5425 = load i8*, i8** %.tmp5424
%.tmp5427 = getelementptr [7 x i8], [7 x i8]*@.str5426, i32 0, i32 0
%.tmp5428 = call i32(i8*,i8*) @strcmp(i8* %.tmp5425, i8* %.tmp5427)
%.tmp5429 = icmp eq i32 %.tmp5428, 0
br i1 %.tmp5429, label %.if.true.5430, label %.if.false.5430
.if.true.5430:
ret void
br label %.if.end.5430
.if.false.5430:
br label %.if.end.5430
.if.end.5430:
br label %.if.end.5420
.if.false.5420:
br label %.if.end.5420
.if.end.5420:
%.tmp5431 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5432 = load %m2437$.Type.type*, %m2437$.Type.type** %return_type
%.tmp5433 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp5431, %m2437$.Type.type* %.tmp5432)
%.tmp5435 = getelementptr [5 x i8], [5 x i8]*@.str5434, i32 0, i32 0
%.tmp5436 = call i32(i8*,i8*) @strcmp(i8* %.tmp5433, i8* %.tmp5435)
%.tmp5437 = icmp ne i32 %.tmp5436, 0
br i1 %.tmp5437, label %.if.true.5438, label %.if.false.5438
.if.true.5438:
%.tmp5439 = load %m812$.Node.type*, %m812$.Node.type** %li.5391
%.tmp5440 = icmp ne %m812$.Node.type* %.tmp5439, null
br i1 %.tmp5440, label %.if.true.5441, label %.if.false.5441
.if.true.5441:
%.tmp5442 = load %m812$.Node.type*, %m812$.Node.type** %li.5391
store %m812$.Node.type* %.tmp5442, %m812$.Node.type** %stmt
br label %.if.end.5441
.if.false.5441:
br label %.if.end.5441
.if.end.5441:
%.tmp5443 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5444 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5446 = getelementptr [21 x i8], [21 x i8]*@.str5445, i32 0, i32 0
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp5443, %m812$.Node.type* %.tmp5444, i8* %.tmp5446)
br label %.if.end.5438
.if.false.5438:
%.tmp5447 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5448 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5447, i32 0, i32 1
%.tmp5449 = load %m0$.File.type*, %m0$.File.type** %.tmp5448
%.tmp5451 = getelementptr [10 x i8], [10 x i8]*@.str5450, i32 0, i32 0
%.tmp5452 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5449, i8* %.tmp5451)
br label %.if.end.5438
.if.end.5438:
ret void
}
define void @m229$compile_for_loop.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%.tmp5453 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5454 = call i32(%m2437$.CompilerCtx.type*) @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp5453)
%for_id.5455 = alloca i32
store i32 %.tmp5454, i32* %for_id.5455
%.tmp5456 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5457 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5456, i32 0, i32 6
%.tmp5458 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5457
%.tmp5459 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5458, i32 0, i32 7
%.tmp5460 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5459
%init_stmt.5461 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5460, %m812$.Node.type** %init_stmt.5461
%.tmp5462 = bitcast ptr null to i8*
%begin_lbl.5463 = alloca i8*
store i8* %.tmp5462, i8** %begin_lbl.5463
%.tmp5464 = bitcast ptr null to i8*
%end_lbl.5465 = alloca i8*
store i8* %.tmp5464, i8** %end_lbl.5465
%.tmp5466 = getelementptr i8*, i8** %begin_lbl.5463, i32 0
%.tmp5468 = getelementptr [14 x i8], [14 x i8]*@.str5467, i32 0, i32 0
%.tmp5469 = load i32, i32* %for_id.5455
%.tmp5470 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5466, i8* %.tmp5468, i32 %.tmp5469)
%.tmp5471 = getelementptr i8*, i8** %end_lbl.5465, i32 0
%.tmp5473 = getelementptr [12 x i8], [12 x i8]*@.str5472, i32 0, i32 0
%.tmp5474 = load i32, i32* %for_id.5455
%.tmp5475 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5471, i8* %.tmp5473, i32 %.tmp5474)
%.tmp5476 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5478 = getelementptr [4 x i8], [4 x i8]*@.str5477, i32 0, i32 0
%.tmp5479 = load i8*, i8** %begin_lbl.5463
%.tmp5480 = load i8*, i8** %end_lbl.5465
call void(%m2437$.CompilerCtx.type*,i8*,i8*,i8*) @m229$push_scope.v.m2437$.CompilerCtx.typep.cp.cp.cp(%m2437$.CompilerCtx.type* %.tmp5476, i8* %.tmp5478, i8* %.tmp5479, i8* %.tmp5480)
%.tmp5481 = load %m812$.Node.type*, %m812$.Node.type** %init_stmt.5461
%.tmp5482 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5481, i32 0, i32 0
%.tmp5483 = load i8*, i8** %.tmp5482
%.tmp5485 = getelementptr [12 x i8], [12 x i8]*@.str5484, i32 0, i32 0
%.tmp5486 = call i32(i8*,i8*) @strcmp(i8* %.tmp5483, i8* %.tmp5485)
%.tmp5487 = icmp eq i32 %.tmp5486, 0
br i1 %.tmp5487, label %.if.true.5488, label %.if.false.5488
.if.true.5488:
%.tmp5489 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5490 = load %m812$.Node.type*, %m812$.Node.type** %init_stmt.5461
%.tmp5491 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_declaration.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp5489, %m812$.Node.type* %.tmp5490)
br label %.if.end.5488
.if.false.5488:
%.tmp5492 = load %m812$.Node.type*, %m812$.Node.type** %init_stmt.5461
%.tmp5493 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5492, i32 0, i32 0
%.tmp5494 = load i8*, i8** %.tmp5493
%.tmp5496 = getelementptr [11 x i8], [11 x i8]*@.str5495, i32 0, i32 0
%.tmp5497 = call i32(i8*,i8*) @strcmp(i8* %.tmp5494, i8* %.tmp5496)
%.tmp5498 = icmp eq i32 %.tmp5497, 0
br i1 %.tmp5498, label %.if.true.5499, label %.if.false.5499
.if.true.5499:
%.tmp5500 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5501 = load %m812$.Node.type*, %m812$.Node.type** %init_stmt.5461
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_expression.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp5500, %m812$.Node.type* %.tmp5501)
br label %.if.end.5499
.if.false.5499:
%.tmp5502 = load %m812$.Node.type*, %m812$.Node.type** %init_stmt.5461
%.tmp5503 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5502, i32 0, i32 0
%.tmp5504 = load i8*, i8** %.tmp5503
%.tmp5506 = getelementptr [9 x i8], [9 x i8]*@.str5505, i32 0, i32 0
%.tmp5507 = call i32(i8*,i8*) @strcmp(i8* %.tmp5504, i8* %.tmp5506)
%.tmp5508 = icmp eq i32 %.tmp5507, 0
br i1 %.tmp5508, label %.if.true.5509, label %.if.false.5509
.if.true.5509:
br label %.if.end.5509
.if.false.5509:
%.tmp5510 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5511 = load %m812$.Node.type*, %m812$.Node.type** %init_stmt.5461
%.tmp5513 = getelementptr [66 x i8], [66 x i8]*@.str5512, i32 0, i32 0
%.tmp5514 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp5510, %m812$.Node.type* %.tmp5511, i8* %.tmp5513)
%.tmp5515 = load %m812$.Node.type*, %m812$.Node.type** %init_stmt.5461
%.tmp5516 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5515, i32 0, i32 0
%.tmp5517 = load i8*, i8** %.tmp5516
%.tmp5518 = call i32(i8*,...) @printf(i8* %.tmp5514, i8* %.tmp5517)
%.tmp5519 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
call void(%m2437$.CompilerCtx.type*) @m229$pop_scope.v.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp5519)
ret void
br label %.if.end.5509
.if.end.5509:
br label %.if.end.5499
.if.end.5499:
br label %.if.end.5488
.if.end.5488:
%.tmp5520 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5521 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5520, i32 0, i32 1
%.tmp5522 = load %m0$.File.type*, %m0$.File.type** %.tmp5521
%.tmp5524 = getelementptr [26 x i8], [26 x i8]*@.str5523, i32 0, i32 0
%.tmp5525 = load i32, i32* %for_id.5455
%.tmp5526 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5522, i8* %.tmp5524, i32 %.tmp5525)
%.tmp5527 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5528 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5527, i32 0, i32 1
%.tmp5529 = load %m0$.File.type*, %m0$.File.type** %.tmp5528
%.tmp5531 = getelementptr [16 x i8], [16 x i8]*@.str5530, i32 0, i32 0
%.tmp5532 = load i32, i32* %for_id.5455
%.tmp5533 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5529, i8* %.tmp5531, i32 %.tmp5532)
%.tmp5534 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5535 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5534, i32 0, i32 6
%.tmp5536 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5535
%.tmp5538 = getelementptr [9 x i8], [9 x i8]*@.str5537, i32 0, i32 0
%.tmp5539 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp5536, i8* %.tmp5538)
%fst_colon.5540 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5539, %m812$.Node.type** %fst_colon.5540
%.tmp5541 = load %m812$.Node.type*, %m812$.Node.type** %fst_colon.5540
%.tmp5542 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5541, i32 0, i32 7
%.tmp5543 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5542
%condition.5544 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5543, %m812$.Node.type** %condition.5544
%.tmp5545 = load %m812$.Node.type*, %m812$.Node.type** %condition.5544
%.tmp5546 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5545, i32 0, i32 0
%.tmp5547 = load i8*, i8** %.tmp5546
%.tmp5549 = getelementptr [9 x i8], [9 x i8]*@.str5548, i32 0, i32 0
%.tmp5550 = call i32(i8*,i8*) @strcmp(i8* %.tmp5547, i8* %.tmp5549)
%.tmp5551 = icmp eq i32 %.tmp5550, 0
br i1 %.tmp5551, label %.if.true.5552, label %.if.false.5552
.if.true.5552:
%.tmp5553 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5554 = load %m812$.Node.type*, %m812$.Node.type** %condition.5544
%.tmp5556 = getelementptr [39 x i8], [39 x i8]*@.str5555, i32 0, i32 0
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp5553, %m812$.Node.type* %.tmp5554, i8* %.tmp5556)
ret void
br label %.if.end.5552
.if.false.5552:
br label %.if.end.5552
.if.end.5552:
%.tmp5557 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5558 = load %m812$.Node.type*, %m812$.Node.type** %condition.5544
%.tmp5559 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_assignable.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp5557, %m812$.Node.type* %.tmp5558)
%condition_info.5560 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp5559, %m2437$.AssignableInfo.type** %condition_info.5560
%.tmp5561 = load %m812$.Node.type*, %m812$.Node.type** %fst_colon.5540
%.tmp5562 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5561, i32 0, i32 7
%.tmp5563 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5562
%.tmp5565 = getelementptr [9 x i8], [9 x i8]*@.str5564, i32 0, i32 0
%.tmp5566 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp5563, i8* %.tmp5565)
%snd_colon.5567 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5566, %m812$.Node.type** %snd_colon.5567
%.tmp5568 = load %m812$.Node.type*, %m812$.Node.type** %snd_colon.5567
%.tmp5570 = getelementptr [6 x i8], [6 x i8]*@.str5569, i32 0, i32 0
%.tmp5571 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp5568, i8* %.tmp5570)
%for_body.5572 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5571, %m812$.Node.type** %for_body.5572
%.tmp5573 = load %m812$.Node.type*, %m812$.Node.type** %for_body.5572
%.tmp5575 = getelementptr [11 x i8], [11 x i8]*@.str5574, i32 0, i32 0
%.tmp5576 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp5573, i8* %.tmp5575)
%else_block.5577 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5576, %m812$.Node.type** %else_block.5577
%.tmp5578 = load i8*, i8** %end_lbl.5465
%on_end.5579 = alloca i8*
store i8* %.tmp5578, i8** %on_end.5579
%.tmp5580 = load %m812$.Node.type*, %m812$.Node.type** %else_block.5577
%.tmp5581 = icmp ne %m812$.Node.type* %.tmp5580, null
br i1 %.tmp5581, label %.if.true.5582, label %.if.false.5582
.if.true.5582:
%.tmp5583 = getelementptr i8*, i8** %on_end.5579, i32 0
%.tmp5585 = getelementptr [13 x i8], [13 x i8]*@.str5584, i32 0, i32 0
%.tmp5586 = load i32, i32* %for_id.5455
%.tmp5587 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5583, i8* %.tmp5585, i32 %.tmp5586)
br label %.if.end.5582
.if.false.5582:
br label %.if.end.5582
.if.end.5582:
%.tmp5588 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5589 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5588, i32 0, i32 1
%.tmp5590 = load %m0$.File.type*, %m0$.File.type** %.tmp5589
%.tmp5592 = getelementptr [48 x i8], [48 x i8]*@.str5591, i32 0, i32 0
%.tmp5593 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5594 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %condition_info.5560
%.tmp5595 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5594, i32 0, i32 4
%.tmp5596 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5595
%.tmp5597 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp5593, %m2437$.Type.type* %.tmp5596)
%.tmp5598 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %condition_info.5560
%.tmp5599 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp5598)
%.tmp5600 = load i32, i32* %for_id.5455
%.tmp5601 = load i8*, i8** %on_end.5579
%.tmp5602 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5590, i8* %.tmp5592, i8* %.tmp5597, i8* %.tmp5599, i32 %.tmp5600, i8* %.tmp5601)
%.tmp5603 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5604 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5603, i32 0, i32 1
%.tmp5605 = load %m0$.File.type*, %m0$.File.type** %.tmp5604
%.tmp5607 = getelementptr [19 x i8], [19 x i8]*@.str5606, i32 0, i32 0
%.tmp5608 = load i32, i32* %for_id.5455
%.tmp5609 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5605, i8* %.tmp5607, i32 %.tmp5608)
%.tmp5610 = load %m812$.Node.type*, %m812$.Node.type** %snd_colon.5567
%.tmp5611 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5610, i32 0, i32 7
%.tmp5612 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5611
%increment.5613 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5612, %m812$.Node.type** %increment.5613
%.tmp5614 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5615 = load %m812$.Node.type*, %m812$.Node.type** %for_body.5572
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_block.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp5614, %m812$.Node.type* %.tmp5615)
%.tmp5616 = load %m812$.Node.type*, %m812$.Node.type** %increment.5613
%.tmp5617 = load %m812$.Node.type*, %m812$.Node.type** %for_body.5572
%.tmp5618 = icmp ne %m812$.Node.type* %.tmp5616, %.tmp5617
br i1 %.tmp5618, label %.if.true.5619, label %.if.false.5619
.if.true.5619:
%.tmp5620 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5621 = load %m812$.Node.type*, %m812$.Node.type** %increment.5613
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_expression.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp5620, %m812$.Node.type* %.tmp5621)
br label %.if.end.5619
.if.false.5619:
br label %.if.end.5619
.if.end.5619:
%.tmp5622 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5623 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5622, i32 0, i32 1
%.tmp5624 = load %m0$.File.type*, %m0$.File.type** %.tmp5623
%.tmp5626 = getelementptr [15 x i8], [15 x i8]*@.str5625, i32 0, i32 0
%.tmp5627 = load i8*, i8** %begin_lbl.5463
%.tmp5628 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5624, i8* %.tmp5626, i8* %.tmp5627)
%.tmp5629 = load %m812$.Node.type*, %m812$.Node.type** %else_block.5577
%.tmp5630 = icmp ne %m812$.Node.type* %.tmp5629, null
br i1 %.tmp5630, label %.if.true.5631, label %.if.false.5631
.if.true.5631:
%.tmp5632 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5633 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5632, i32 0, i32 1
%.tmp5634 = load %m0$.File.type*, %m0$.File.type** %.tmp5633
%.tmp5636 = getelementptr [15 x i8], [15 x i8]*@.str5635, i32 0, i32 0
%.tmp5637 = load i32, i32* %for_id.5455
%.tmp5638 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5634, i8* %.tmp5636, i32 %.tmp5637)
%.tmp5639 = load %m812$.Node.type*, %m812$.Node.type** %else_block.5577
%.tmp5640 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5639, i32 0, i32 6
%.tmp5641 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5640
%.tmp5643 = getelementptr [6 x i8], [6 x i8]*@.str5642, i32 0, i32 0
%.tmp5644 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp5641, i8* %.tmp5643)
%block.5645 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5644, %m812$.Node.type** %block.5645
%.tmp5646 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5647 = load %m812$.Node.type*, %m812$.Node.type** %block.5645
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_block.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp5646, %m812$.Node.type* %.tmp5647)
%.tmp5648 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5649 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5648, i32 0, i32 1
%.tmp5650 = load %m0$.File.type*, %m0$.File.type** %.tmp5649
%.tmp5652 = getelementptr [15 x i8], [15 x i8]*@.str5651, i32 0, i32 0
%.tmp5653 = load i8*, i8** %end_lbl.5465
%.tmp5654 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5650, i8* %.tmp5652, i8* %.tmp5653)
br label %.if.end.5631
.if.false.5631:
br label %.if.end.5631
.if.end.5631:
%.tmp5655 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5656 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5655, i32 0, i32 1
%.tmp5657 = load %m0$.File.type*, %m0$.File.type** %.tmp5656
%.tmp5659 = getelementptr [5 x i8], [5 x i8]*@.str5658, i32 0, i32 0
%.tmp5660 = load i8*, i8** %end_lbl.5465
%.tmp5661 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5657, i8* %.tmp5659, i8* %.tmp5660)
%.tmp5662 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
call void(%m2437$.CompilerCtx.type*) @m229$pop_scope.v.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp5662)
ret void
}
define %m2437$.AssignableInfo.type* @m229$compile_declaration.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%.tmp5663 = bitcast ptr null to %m2437$.Type.type*
%decl_type.5664 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp5663, %m2437$.Type.type** %decl_type.5664
%.tmp5665 = bitcast ptr null to %m2437$.AssignableInfo.type*
%a_info.5666 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp5665, %m2437$.AssignableInfo.type** %a_info.5666
%.tmp5667 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5668 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5667, i32 0, i32 6
%.tmp5669 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5668
%.tmp5670 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5669, i32 0, i32 0
%.tmp5671 = load i8*, i8** %.tmp5670
%.tmp5673 = getelementptr [5 x i8], [5 x i8]*@.str5672, i32 0, i32 0
%.tmp5674 = call i32(i8*,i8*) @strcmp(i8* %.tmp5671, i8* %.tmp5673)
%.tmp5675 = icmp eq i32 %.tmp5674, 0
br i1 %.tmp5675, label %.if.true.5676, label %.if.false.5676
.if.true.5676:
%.tmp5677 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5678 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5679 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5678, i32 0, i32 6
%.tmp5680 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5679
%.tmp5681 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5680, i32 0, i32 6
%.tmp5682 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5681
%.tmp5683 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$node_to_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp5677, %m812$.Node.type* %.tmp5682)
store %m2437$.Type.type* %.tmp5683, %m2437$.Type.type** %decl_type.5664
br label %.if.end.5676
.if.false.5676:
br label %.if.end.5676
.if.end.5676:
%.tmp5684 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5685 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5684, i32 0, i32 6
%.tmp5686 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5685
%.tmp5688 = getelementptr [11 x i8], [11 x i8]*@.str5687, i32 0, i32 0
%.tmp5689 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp5686, i8* %.tmp5688)
%assignable.5690 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5689, %m812$.Node.type** %assignable.5690
%.tmp5691 = load %m812$.Node.type*, %m812$.Node.type** %assignable.5690
%.tmp5692 = icmp ne %m812$.Node.type* %.tmp5691, null
br i1 %.tmp5692, label %.if.true.5693, label %.if.false.5693
.if.true.5693:
%.tmp5694 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5695 = load %m812$.Node.type*, %m812$.Node.type** %assignable.5690
%.tmp5696 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_assignable.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp5694, %m812$.Node.type* %.tmp5695)
store %m2437$.AssignableInfo.type* %.tmp5696, %m2437$.AssignableInfo.type** %a_info.5666
br label %.if.end.5693
.if.false.5693:
br label %.if.end.5693
.if.end.5693:
%.tmp5697 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5698 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp5697)
%info.5699 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp5698, %m2437$.AssignableInfo.type** %info.5699
%.tmp5700 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5699
%.tmp5701 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5700, i32 0, i32 3
%.tmp5703 = getelementptr [9 x i8], [9 x i8]*@.str5702, i32 0, i32 0
store i8* %.tmp5703, i8** %.tmp5701
%.tmp5704 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5705 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5704, i32 0, i32 6
%.tmp5706 = load %m812$.Node.type*, %m812$.Node.type** %.tmp5705
%.tmp5708 = getelementptr [5 x i8], [5 x i8]*@.str5707, i32 0, i32 0
%.tmp5709 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp5706, i8* %.tmp5708)
%var_name.5710 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp5709, %m812$.Node.type** %var_name.5710
%.tmp5711 = load %m812$.Node.type*, %m812$.Node.type** %var_name.5710
%.tmp5712 = icmp eq %m812$.Node.type* %.tmp5711, null
br i1 %.tmp5712, label %.if.true.5713, label %.if.false.5713
.if.true.5713:
%.tmp5714 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5715 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5717 = getelementptr [31 x i8], [31 x i8]*@.str5716, i32 0, i32 0
%.tmp5718 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp5714, %m812$.Node.type* %.tmp5715, i8* %.tmp5717)
%.tmp5719 = call i32(i8*,...) @printf(i8* %.tmp5718)
%.tmp5720 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp5720
br label %.if.end.5713
.if.false.5713:
br label %.if.end.5713
.if.end.5713:
%.tmp5721 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5722 = call %m2437$.ModuleLookup.type*(%m2437$.CompilerCtx.type*) @m229$get_current_module.m2437$.ModuleLookup.typep.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp5721)
%mod.5723 = alloca %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* %.tmp5722, %m2437$.ModuleLookup.type** %mod.5723
%.tmp5724 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5725 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.5723
%.tmp5726 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp5725, i32 0, i32 3
%.tmp5727 = load %m2437$.Scope.type*, %m2437$.Scope.type** %.tmp5726
%.tmp5728 = load %m812$.Node.type*, %m812$.Node.type** %var_name.5710
%.tmp5729 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5728, i32 0, i32 1
%.tmp5730 = load i8*, i8** %.tmp5729
%.tmp5731 = call %m2437$.ScopeItem.type*(%m2437$.CompilerCtx.type*,%m2437$.Scope.type*,i8*) @m229$find_defined_here.m2437$.ScopeItem.typep.m2437$.CompilerCtx.typep.m2437$.Scope.typep.cp(%m2437$.CompilerCtx.type* %.tmp5724, %m2437$.Scope.type* %.tmp5727, i8* %.tmp5730)
%.tmp5732 = icmp ne %m2437$.ScopeItem.type* %.tmp5731, null
br i1 %.tmp5732, label %.if.true.5733, label %.if.false.5733
.if.true.5733:
%err_buf.5734 = alloca i8*
store i8* null, i8** %err_buf.5734
%.tmp5735 = getelementptr i8*, i8** %err_buf.5734, i32 0
%.tmp5737 = getelementptr [43 x i8], [43 x i8]*@.str5736, i32 0, i32 0
%.tmp5738 = load %m812$.Node.type*, %m812$.Node.type** %var_name.5710
%.tmp5739 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5738, i32 0, i32 1
%.tmp5740 = load i8*, i8** %.tmp5739
%.tmp5741 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5735, i8* %.tmp5737, i8* %.tmp5740)
%.tmp5742 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5743 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5744 = load i8*, i8** %err_buf.5734
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp5742, %m812$.Node.type* %.tmp5743, i8* %.tmp5744)
%.tmp5745 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp5745
br label %.if.end.5733
.if.false.5733:
br label %.if.end.5733
.if.end.5733:
%var_id.5746 = alloca i8*
store i8* null, i8** %var_id.5746
%.tmp5747 = getelementptr i8*, i8** %var_id.5746, i32 0
%.tmp5749 = getelementptr [6 x i8], [6 x i8]*@.str5748, i32 0, i32 0
%.tmp5750 = load %m812$.Node.type*, %m812$.Node.type** %var_name.5710
%.tmp5751 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5750, i32 0, i32 1
%.tmp5752 = load i8*, i8** %.tmp5751
%.tmp5753 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5754 = call i32(%m2437$.CompilerCtx.type*) @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp5753)
%.tmp5755 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5747, i8* %.tmp5749, i8* %.tmp5752, i32 %.tmp5754)
%.tmp5756 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5699
%.tmp5757 = load i8, i8* @SCOPE_LOCAL
%.tmp5758 = load i8*, i8** %var_id.5746
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp5756, i8 %.tmp5757, i8* %.tmp5758)
%.tmp5759 = load %m2437$.Type.type*, %m2437$.Type.type** %decl_type.5664
%.tmp5760 = icmp ne %m2437$.Type.type* %.tmp5759, null
br i1 %.tmp5760, label %.if.true.5761, label %.if.false.5761
.if.true.5761:
%.tmp5762 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5699
%.tmp5763 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5762, i32 0, i32 4
%.tmp5764 = load %m2437$.Type.type*, %m2437$.Type.type** %decl_type.5664
store %m2437$.Type.type* %.tmp5764, %m2437$.Type.type** %.tmp5763
br label %.if.end.5761
.if.false.5761:
%.tmp5765 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.5666
%.tmp5766 = icmp ne %m2437$.AssignableInfo.type* %.tmp5765, null
br i1 %.tmp5766, label %.if.true.5767, label %.if.false.5767
.if.true.5767:
%.tmp5768 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5699
%.tmp5769 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5768, i32 0, i32 4
%.tmp5770 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.5666
%.tmp5771 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5770, i32 0, i32 4
%.tmp5772 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5771
store %m2437$.Type.type* %.tmp5772, %m2437$.Type.type** %.tmp5769
br label %.if.end.5767
.if.false.5767:
br label %.if.end.5767
.if.end.5767:
br label %.if.end.5761
.if.end.5761:
%.tmp5773 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5774 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5699
%.tmp5775 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5774, i32 0, i32 4
%.tmp5776 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5775
%.tmp5777 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp5773, %m2437$.Type.type* %.tmp5776)
%var_type_repr.5778 = alloca i8*
store i8* %.tmp5777, i8** %var_type_repr.5778
%.tmp5779 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.5666
%.tmp5780 = icmp ne %m2437$.AssignableInfo.type* %.tmp5779, null
br i1 %.tmp5780, label %.if.true.5781, label %.if.false.5781
.if.true.5781:
%.tmp5782 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5783 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.5666
%.tmp5784 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5783, i32 0, i32 4
%.tmp5785 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5784
%.tmp5786 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp5782, %m2437$.Type.type* %.tmp5785)
%a_type_repr.5787 = alloca i8*
store i8* %.tmp5786, i8** %a_type_repr.5787
%type_error.5788 = alloca i1
store i1 0, i1* %type_error.5788
%.tmp5789 = load i8*, i8** %a_type_repr.5787
%.tmp5790 = call i32(i8*) @strlen(i8* %.tmp5789)
%.tmp5791 = load i8*, i8** %var_type_repr.5778
%.tmp5792 = call i32(i8*) @strlen(i8* %.tmp5791)
%.tmp5793 = icmp ne i32 %.tmp5790, %.tmp5792
br i1 %.tmp5793, label %.if.true.5794, label %.if.false.5794
.if.true.5794:
store i1 1, i1* %type_error.5788
br label %.if.end.5794
.if.false.5794:
%.tmp5795 = load i8*, i8** %a_type_repr.5787
%.tmp5796 = load i8*, i8** %var_type_repr.5778
%.tmp5797 = call i32(i8*,i8*) @strcmp(i8* %.tmp5795, i8* %.tmp5796)
%.tmp5798 = icmp ne i32 %.tmp5797, 0
br i1 %.tmp5798, label %.if.true.5799, label %.if.false.5799
.if.true.5799:
store i1 1, i1* %type_error.5788
br label %.if.end.5799
.if.false.5799:
br label %.if.end.5799
.if.end.5799:
br label %.if.end.5794
.if.end.5794:
%.tmp5800 = load i1, i1* %type_error.5788
br i1 %.tmp5800, label %.if.true.5801, label %.if.false.5801
.if.true.5801:
%.tmp5802 = bitcast ptr null to i8*
%err_msg.5803 = alloca i8*
store i8* %.tmp5802, i8** %err_msg.5803
%.tmp5804 = getelementptr i8*, i8** %err_msg.5803, i32 0
%.tmp5806 = getelementptr [49 x i8], [49 x i8]*@.str5805, i32 0, i32 0
%.tmp5807 = load i8*, i8** %a_type_repr.5787
%.tmp5808 = load i8*, i8** %var_type_repr.5778
%.tmp5809 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5804, i8* %.tmp5806, i8* %.tmp5807, i8* %.tmp5808)
%.tmp5810 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5811 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5812 = load i8*, i8** %err_msg.5803
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp5810, %m812$.Node.type* %.tmp5811, i8* %.tmp5812)
br label %.if.end.5801
.if.false.5801:
br label %.if.end.5801
.if.end.5801:
br label %.if.end.5781
.if.false.5781:
br label %.if.end.5781
.if.end.5781:
%.tmp5813 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5814 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5815 = load %m812$.Node.type*, %m812$.Node.type** %var_name.5710
%.tmp5816 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp5815, i32 0, i32 1
%.tmp5817 = load i8*, i8** %.tmp5816
%.tmp5818 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5699
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*,%m2437$.AssignableInfo.type*) @m229$define_assignable.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp5813, %m812$.Node.type* %.tmp5814, i8* %.tmp5817, %m2437$.AssignableInfo.type* %.tmp5818)
%.tmp5819 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5820 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5819, i32 0, i32 1
%.tmp5821 = load %m0$.File.type*, %m0$.File.type** %.tmp5820
%.tmp5823 = getelementptr [16 x i8], [16 x i8]*@.str5822, i32 0, i32 0
%.tmp5824 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5699
%.tmp5825 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp5824)
%.tmp5826 = load i8*, i8** %var_type_repr.5778
%.tmp5827 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5821, i8* %.tmp5823, i8* %.tmp5825, i8* %.tmp5826)
%.tmp5828 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.5666
%.tmp5829 = icmp ne %m2437$.AssignableInfo.type* %.tmp5828, null
br i1 %.tmp5829, label %.if.true.5830, label %.if.false.5830
.if.true.5830:
%.tmp5831 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5832 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5831, i32 0, i32 1
%.tmp5833 = load %m0$.File.type*, %m0$.File.type** %.tmp5832
%.tmp5835 = getelementptr [21 x i8], [21 x i8]*@.str5834, i32 0, i32 0
%.tmp5836 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5837 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.5666
%.tmp5838 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5837, i32 0, i32 4
%.tmp5839 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5838
%.tmp5840 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp5836, %m2437$.Type.type* %.tmp5839)
%.tmp5841 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.5666
%.tmp5842 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp5841)
%.tmp5843 = load i8*, i8** %var_type_repr.5778
%.tmp5844 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5699
%.tmp5845 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp5844)
%.tmp5846 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5833, i8* %.tmp5835, i8* %.tmp5840, i8* %.tmp5842, i8* %.tmp5843, i8* %.tmp5845)
br label %.if.end.5830
.if.false.5830:
%.tmp5847 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5848 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5849 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5699
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,%m2437$.AssignableInfo.type*) @m229$compile_zero_value.v.m2437$.CompilerCtx.typep.m812$.Node.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp5847, %m812$.Node.type* %.tmp5848, %m2437$.AssignableInfo.type* %.tmp5849)
br label %.if.end.5830
.if.end.5830:
%.tmp5850 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.5699
ret %m2437$.AssignableInfo.type* %.tmp5850
}
define void @m229$compile_zero_value.v.m2437$.CompilerCtx.typep.m812$.Node.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg, %m2437$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%info = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.info.arg, %m2437$.AssignableInfo.type** %info
%.tmp5851 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp5852 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5851, i32 0, i32 4
%.tmp5853 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5852
%.tmp5854 = icmp eq %m2437$.Type.type* %.tmp5853, null
br i1 %.tmp5854, label %.if.true.5855, label %.if.false.5855
.if.true.5855:
ret void
br label %.if.end.5855
.if.false.5855:
br label %.if.end.5855
.if.end.5855:
%.tmp5856 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5857 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp5858 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5857, i32 0, i32 4
%.tmp5859 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5858
%.tmp5860 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp5856, %m2437$.Type.type* %.tmp5859)
%t_repr.5861 = alloca i8*
store i8* %.tmp5860, i8** %t_repr.5861
%.tmp5862 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp5863 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp5862)
%id.5864 = alloca i8*
store i8* %.tmp5863, i8** %id.5864
%field_id.5865 = alloca i32
store i32 0, i32* %field_id.5865
%field.5866 = alloca %m2437$.Type.type*
store %m2437$.Type.type* null, %m2437$.Type.type** %field.5866
%field_info.5867 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* null, %m2437$.AssignableInfo.type** %field_info.5867
%.tmp5868 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp5869 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5868, i32 0, i32 4
%.tmp5870 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5869
%t.5871 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp5870, %m2437$.Type.type** %t.5871
%.tmp5872 = load %m2437$.Type.type*, %m2437$.Type.type** %t.5871
%.tmp5873 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5872, i32 0, i32 0
%.tmp5874 = load i8*, i8** %.tmp5873
%.tmp5876 = getelementptr [4 x i8], [4 x i8]*@.str5875, i32 0, i32 0
%.tmp5877 = call i32(i8*,i8*) @strcmp(i8* %.tmp5874, i8* %.tmp5876)
%.tmp5878 = icmp eq i32 %.tmp5877, 0
%.tmp5879 = load %m2437$.Type.type*, %m2437$.Type.type** %t.5871
%.tmp5880 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5879, i32 0, i32 0
%.tmp5881 = load i8*, i8** %.tmp5880
%.tmp5883 = getelementptr [4 x i8], [4 x i8]*@.str5882, i32 0, i32 0
%.tmp5884 = call i32(i8*,i8*) @strcmp(i8* %.tmp5881, i8* %.tmp5883)
%.tmp5885 = icmp eq i32 %.tmp5884, 0
%.tmp5886 = or i1 %.tmp5878, %.tmp5885
%.tmp5887 = load %m2437$.Type.type*, %m2437$.Type.type** %t.5871
%.tmp5888 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5887, i32 0, i32 0
%.tmp5889 = load i8*, i8** %.tmp5888
%.tmp5891 = getelementptr [5 x i8], [5 x i8]*@.str5890, i32 0, i32 0
%.tmp5892 = call i32(i8*,i8*) @strcmp(i8* %.tmp5889, i8* %.tmp5891)
%.tmp5893 = icmp eq i32 %.tmp5892, 0
%.tmp5894 = or i1 %.tmp5886, %.tmp5893
br i1 %.tmp5894, label %.if.true.5895, label %.if.false.5895
.if.true.5895:
%.tmp5896 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5897 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5896, i32 0, i32 1
%.tmp5898 = load %m0$.File.type*, %m0$.File.type** %.tmp5897
%.tmp5900 = getelementptr [21 x i8], [21 x i8]*@.str5899, i32 0, i32 0
%.tmp5901 = load i8*, i8** %t_repr.5861
%.tmp5902 = load i8*, i8** %t_repr.5861
%.tmp5903 = load i8*, i8** %id.5864
%.tmp5904 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5898, i8* %.tmp5900, i8* %.tmp5901, i32 0, i8* %.tmp5902, i8* %.tmp5903)
br label %.if.end.5895
.if.false.5895:
%.tmp5905 = load %m2437$.Type.type*, %m2437$.Type.type** %t.5871
%.tmp5906 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5905, i32 0, i32 0
%.tmp5907 = load i8*, i8** %.tmp5906
%.tmp5909 = getelementptr [4 x i8], [4 x i8]*@.str5908, i32 0, i32 0
%.tmp5910 = call i32(i8*,i8*) @strcmp(i8* %.tmp5907, i8* %.tmp5909)
%.tmp5911 = icmp eq i32 %.tmp5910, 0
br i1 %.tmp5911, label %.if.true.5912, label %.if.false.5912
.if.true.5912:
%.tmp5913 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5914 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5913, i32 0, i32 1
%.tmp5915 = load %m0$.File.type*, %m0$.File.type** %.tmp5914
%.tmp5917 = getelementptr [21 x i8], [21 x i8]*@.str5916, i32 0, i32 0
%.tmp5918 = load i8*, i8** %t_repr.5861
%.tmp5920 = getelementptr [5 x i8], [5 x i8]*@.str5919, i32 0, i32 0
%.tmp5921 = load i8*, i8** %t_repr.5861
%.tmp5922 = load i8*, i8** %id.5864
%.tmp5923 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5915, i8* %.tmp5917, i8* %.tmp5918, i8* %.tmp5920, i8* %.tmp5921, i8* %.tmp5922)
br label %.if.end.5912
.if.false.5912:
%.tmp5924 = load %m2437$.Type.type*, %m2437$.Type.type** %t.5871
%.tmp5925 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5924, i32 0, i32 0
%.tmp5926 = load i8*, i8** %.tmp5925
%.tmp5928 = getelementptr [7 x i8], [7 x i8]*@.str5927, i32 0, i32 0
%.tmp5929 = call i32(i8*,i8*) @strcmp(i8* %.tmp5926, i8* %.tmp5928)
%.tmp5930 = icmp eq i32 %.tmp5929, 0
br i1 %.tmp5930, label %.if.true.5931, label %.if.false.5931
.if.true.5931:
%.tmp5933 = load %m2437$.Type.type*, %m2437$.Type.type** %t.5871
%.tmp5934 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5933, i32 0, i32 3
%.tmp5935 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5934
store %m2437$.Type.type* %.tmp5935, %m2437$.Type.type** %field.5866
br label %.for.start.5932
.for.start.5932:
%.tmp5936 = load %m2437$.Type.type*, %m2437$.Type.type** %field.5866
%.tmp5937 = icmp ne %m2437$.Type.type* %.tmp5936, null
br i1 %.tmp5937, label %.for.continue.5932, label %.for.end.5932
.for.continue.5932:
%.tmp5938 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5939 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp5938)
store %m2437$.AssignableInfo.type* %.tmp5939, %m2437$.AssignableInfo.type** %field_info.5867
%.tmp5940 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5941 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %field_info.5867
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp5940, %m2437$.AssignableInfo.type* %.tmp5941)
%.tmp5942 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %field_info.5867
%.tmp5943 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5942, i32 0, i32 4
%.tmp5944 = load %m2437$.Type.type*, %m2437$.Type.type** %field.5866
store %m2437$.Type.type* %.tmp5944, %m2437$.Type.type** %.tmp5943
%.tmp5945 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5946 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5945, i32 0, i32 1
%.tmp5947 = load %m0$.File.type*, %m0$.File.type** %.tmp5946
%.tmp5949 = getelementptr [46 x i8], [46 x i8]*@.str5948, i32 0, i32 0
%.tmp5950 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %field_info.5867
%.tmp5951 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp5950)
%.tmp5952 = load i8*, i8** %t_repr.5861
%.tmp5953 = load i8*, i8** %t_repr.5861
%.tmp5954 = load i8*, i8** %id.5864
%.tmp5955 = load i32, i32* %field_id.5865
%.tmp5956 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5947, i8* %.tmp5949, i8* %.tmp5951, i8* %.tmp5952, i8* %.tmp5953, i8* %.tmp5954, i32 %.tmp5955)
%.tmp5957 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5958 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5959 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %field_info.5867
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,%m2437$.AssignableInfo.type*) @m229$compile_zero_value.v.m2437$.CompilerCtx.typep.m812$.Node.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp5957, %m812$.Node.type* %.tmp5958, %m2437$.AssignableInfo.type* %.tmp5959)
%.tmp5960 = load i32, i32* %field_id.5865
%.tmp5961 = add i32 %.tmp5960, 1
store i32 %.tmp5961, i32* %field_id.5865
%.tmp5962 = load %m2437$.Type.type*, %m2437$.Type.type** %field.5866
%.tmp5963 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5962, i32 0, i32 4
%.tmp5964 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5963
store %m2437$.Type.type* %.tmp5964, %m2437$.Type.type** %field.5866
br label %.for.start.5932
.for.end.5932:
br label %.if.end.5931
.if.false.5931:
%.tmp5965 = load %m2437$.Type.type*, %m2437$.Type.type** %t.5871
%.tmp5966 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5965, i32 0, i32 0
%.tmp5967 = load i8*, i8** %.tmp5966
%.tmp5969 = getelementptr [10 x i8], [10 x i8]*@.str5968, i32 0, i32 0
%.tmp5970 = call i32(i8*,i8*) @strcmp(i8* %.tmp5967, i8* %.tmp5969)
%.tmp5971 = icmp eq i32 %.tmp5970, 0
br i1 %.tmp5971, label %.if.true.5972, label %.if.false.5972
.if.true.5972:
%.tmp5974 = load %m2437$.Type.type*, %m2437$.Type.type** %t.5871
%.tmp5975 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5974, i32 0, i32 3
%.tmp5976 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5975
%.tmp5977 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp5976, i32 0, i32 3
%.tmp5978 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp5977
store %m2437$.Type.type* %.tmp5978, %m2437$.Type.type** %field.5866
br label %.for.start.5973
.for.start.5973:
%.tmp5979 = load %m2437$.Type.type*, %m2437$.Type.type** %field.5866
%.tmp5980 = icmp ne %m2437$.Type.type* %.tmp5979, null
br i1 %.tmp5980, label %.for.continue.5973, label %.for.end.5973
.for.continue.5973:
%.tmp5981 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp5982 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp5981)
store %m2437$.AssignableInfo.type* %.tmp5982, %m2437$.AssignableInfo.type** %field_info.5867
%.tmp5983 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5984 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %field_info.5867
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp5983, %m2437$.AssignableInfo.type* %.tmp5984)
%.tmp5985 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %field_info.5867
%.tmp5986 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp5985, i32 0, i32 4
%.tmp5987 = load %m2437$.Type.type*, %m2437$.Type.type** %field.5866
store %m2437$.Type.type* %.tmp5987, %m2437$.Type.type** %.tmp5986
%.tmp5988 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp5989 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp5988, i32 0, i32 1
%.tmp5990 = load %m0$.File.type*, %m0$.File.type** %.tmp5989
%.tmp5992 = getelementptr [46 x i8], [46 x i8]*@.str5991, i32 0, i32 0
%.tmp5993 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %field_info.5867
%.tmp5994 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp5993)
%.tmp5995 = load i8*, i8** %t_repr.5861
%.tmp5996 = load i8*, i8** %t_repr.5861
%.tmp5997 = load i8*, i8** %id.5864
%.tmp5998 = load i32, i32* %field_id.5865
%.tmp5999 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5990, i8* %.tmp5992, i8* %.tmp5994, i8* %.tmp5995, i8* %.tmp5996, i8* %.tmp5997, i32 %.tmp5998)
%.tmp6000 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6001 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp6002 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %field_info.5867
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,%m2437$.AssignableInfo.type*) @m229$compile_zero_value.v.m2437$.CompilerCtx.typep.m812$.Node.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp6000, %m812$.Node.type* %.tmp6001, %m2437$.AssignableInfo.type* %.tmp6002)
%.tmp6003 = load i32, i32* %field_id.5865
%.tmp6004 = add i32 %.tmp6003, 1
store i32 %.tmp6004, i32* %field_id.5865
%.tmp6005 = load %m2437$.Type.type*, %m2437$.Type.type** %field.5866
%.tmp6006 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6005, i32 0, i32 4
%.tmp6007 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6006
store %m2437$.Type.type* %.tmp6007, %m2437$.Type.type** %field.5866
br label %.for.start.5973
.for.end.5973:
br label %.if.end.5972
.if.false.5972:
%.tmp6008 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6009 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp6011 = getelementptr [44 x i8], [44 x i8]*@.str6010, i32 0, i32 0
%.tmp6012 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp6008, %m812$.Node.type* %.tmp6009, i8* %.tmp6011)
%.tmp6013 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp6014 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6013, i32 0, i32 4
%.tmp6015 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6014
%.tmp6016 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6015, i32 0, i32 0
%.tmp6017 = load i8*, i8** %.tmp6016
%.tmp6018 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6019 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp6020 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6019, i32 0, i32 4
%.tmp6021 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6020
%.tmp6022 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp6018, %m2437$.Type.type* %.tmp6021)
%.tmp6023 = call i32(i8*,...) @printf(i8* %.tmp6012, i8* %.tmp6017, i8* %.tmp6022)
ret void
br label %.if.end.5972
.if.end.5972:
br label %.if.end.5931
.if.end.5931:
br label %.if.end.5912
.if.end.5912:
br label %.if.end.5895
.if.end.5895:
ret void
}
define void @m229$compile_if_block.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%.tmp6024 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp6025 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6024, i32 0, i32 6
%.tmp6026 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6025
%.tmp6028 = getelementptr [11 x i8], [11 x i8]*@.str6027, i32 0, i32 0
%.tmp6029 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp6026, i8* %.tmp6028)
%assignable.6030 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp6029, %m812$.Node.type** %assignable.6030
%.tmp6031 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6032 = load %m812$.Node.type*, %m812$.Node.type** %assignable.6030
%.tmp6033 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_assignable.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp6031, %m812$.Node.type* %.tmp6032)
%a_info.6034 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp6033, %m2437$.AssignableInfo.type** %a_info.6034
%.tmp6035 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.6034
%.tmp6036 = icmp eq %m2437$.AssignableInfo.type* %.tmp6035, null
br i1 %.tmp6036, label %.if.true.6037, label %.if.false.6037
.if.true.6037:
ret void
br label %.if.end.6037
.if.false.6037:
br label %.if.end.6037
.if.end.6037:
%.tmp6038 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6039 = call i32(%m2437$.CompilerCtx.type*) @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp6038)
%if_id.6040 = alloca i32
store i32 %.tmp6039, i32* %if_id.6040
%.tmp6041 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6042 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6041, i32 0, i32 1
%.tmp6043 = load %m0$.File.type*, %m0$.File.type** %.tmp6042
%.tmp6045 = getelementptr [53 x i8], [53 x i8]*@.str6044, i32 0, i32 0
%.tmp6046 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6047 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.6034
%.tmp6048 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6047, i32 0, i32 4
%.tmp6049 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6048
%.tmp6050 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp6046, %m2437$.Type.type* %.tmp6049)
%.tmp6051 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %a_info.6034
%.tmp6052 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp6051)
%.tmp6053 = load i32, i32* %if_id.6040
%.tmp6054 = load i32, i32* %if_id.6040
%.tmp6055 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6043, i8* %.tmp6045, i8* %.tmp6050, i8* %.tmp6052, i32 %.tmp6053, i32 %.tmp6054)
%.tmp6056 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6057 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6056, i32 0, i32 1
%.tmp6058 = load %m0$.File.type*, %m0$.File.type** %.tmp6057
%.tmp6060 = getelementptr [14 x i8], [14 x i8]*@.str6059, i32 0, i32 0
%.tmp6061 = load i32, i32* %if_id.6040
%.tmp6062 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6058, i8* %.tmp6060, i32 %.tmp6061)
%.tmp6063 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp6064 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6063, i32 0, i32 6
%.tmp6065 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6064
%.tmp6067 = getelementptr [6 x i8], [6 x i8]*@.str6066, i32 0, i32 0
%.tmp6068 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp6065, i8* %.tmp6067)
%block.6069 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp6068, %m812$.Node.type** %block.6069
%.tmp6070 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6071 = load %m812$.Node.type*, %m812$.Node.type** %block.6069
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_block.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp6070, %m812$.Node.type* %.tmp6071)
%.tmp6072 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6073 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6072, i32 0, i32 1
%.tmp6074 = load %m0$.File.type*, %m0$.File.type** %.tmp6073
%.tmp6076 = getelementptr [23 x i8], [23 x i8]*@.str6075, i32 0, i32 0
%.tmp6077 = load i32, i32* %if_id.6040
%.tmp6078 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6074, i8* %.tmp6076, i32 %.tmp6077)
%.tmp6079 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6080 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6079, i32 0, i32 1
%.tmp6081 = load %m0$.File.type*, %m0$.File.type** %.tmp6080
%.tmp6083 = getelementptr [15 x i8], [15 x i8]*@.str6082, i32 0, i32 0
%.tmp6084 = load i32, i32* %if_id.6040
%.tmp6085 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6081, i8* %.tmp6083, i32 %.tmp6084)
%.tmp6086 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp6087 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6086, i32 0, i32 6
%.tmp6088 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6087
%.tmp6090 = getelementptr [11 x i8], [11 x i8]*@.str6089, i32 0, i32 0
%.tmp6091 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp6088, i8* %.tmp6090)
%else_block.6092 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp6091, %m812$.Node.type** %else_block.6092
%.tmp6093 = load %m812$.Node.type*, %m812$.Node.type** %else_block.6092
%.tmp6094 = icmp ne %m812$.Node.type* %.tmp6093, null
br i1 %.tmp6094, label %.if.true.6095, label %.if.false.6095
.if.true.6095:
%.tmp6096 = load %m812$.Node.type*, %m812$.Node.type** %else_block.6092
%.tmp6097 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6096, i32 0, i32 6
%.tmp6098 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6097
%.tmp6099 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6098, i32 0, i32 0
%.tmp6100 = load i8*, i8** %.tmp6099
%.tmp6102 = getelementptr [11 x i8], [11 x i8]*@.str6101, i32 0, i32 0
%.tmp6103 = call i32(i8*,i8*) @strcmp(i8* %.tmp6100, i8* %.tmp6102)
%.tmp6104 = icmp eq i32 %.tmp6103, 0
br i1 %.tmp6104, label %.if.true.6105, label %.if.false.6105
.if.true.6105:
%.tmp6106 = load %m812$.Node.type*, %m812$.Node.type** %else_block.6092
%.tmp6107 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6106, i32 0, i32 6
%.tmp6108 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6107
%.tmp6109 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6108, i32 0, i32 6
%.tmp6110 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6109
%.tmp6112 = getelementptr [6 x i8], [6 x i8]*@.str6111, i32 0, i32 0
%.tmp6113 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp6110, i8* %.tmp6112)
store %m812$.Node.type* %.tmp6113, %m812$.Node.type** %block.6069
%.tmp6114 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6115 = load %m812$.Node.type*, %m812$.Node.type** %block.6069
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_block.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp6114, %m812$.Node.type* %.tmp6115)
br label %.if.end.6105
.if.false.6105:
%.tmp6116 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6117 = load %m812$.Node.type*, %m812$.Node.type** %else_block.6092
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_if_block.v.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp6116, %m812$.Node.type* %.tmp6117)
br label %.if.end.6105
.if.end.6105:
br label %.if.end.6095
.if.false.6095:
br label %.if.end.6095
.if.end.6095:
%.tmp6118 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6119 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6118, i32 0, i32 1
%.tmp6120 = load %m0$.File.type*, %m0$.File.type** %.tmp6119
%.tmp6122 = getelementptr [23 x i8], [23 x i8]*@.str6121, i32 0, i32 0
%.tmp6123 = load i32, i32* %if_id.6040
%.tmp6124 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6120, i8* %.tmp6122, i32 %.tmp6123)
%.tmp6125 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6126 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6125, i32 0, i32 1
%.tmp6127 = load %m0$.File.type*, %m0$.File.type** %.tmp6126
%.tmp6129 = getelementptr [13 x i8], [13 x i8]*@.str6128, i32 0, i32 0
%.tmp6130 = load i32, i32* %if_id.6040
%.tmp6131 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6127, i8* %.tmp6129, i32 %.tmp6130)
ret void
}
define void @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%curr_node = alloca %m812$.Node.type*
store %m812$.Node.type* %.curr_node.arg, %m812$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp6132 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp6133 = icmp ne %m812$.Node.type* %.tmp6132, null
br i1 %.tmp6133, label %.if.true.6134, label %.if.false.6134
.if.true.6134:
%.tmp6135 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6136 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6135, i32 0, i32 7
%.tmp6137 = load i8*, i8** %.tmp6136
%.tmp6138 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp6139 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6138, i32 0, i32 3
%.tmp6140 = load i32, i32* %.tmp6139
%.tmp6141 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp6142 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6141, i32 0, i32 4
%.tmp6143 = load i32, i32* %.tmp6142
%.tmp6144 = load i8*, i8** %msg
%.tmp6145 = call %m230$.Error.type*(i8*,i32,i32,i8*) @m230$new.m230$.Error.typep.cp.i.i.cp(i8* %.tmp6137, i32 %.tmp6140, i32 %.tmp6143, i8* %.tmp6144)
%err.6146 = alloca %m230$.Error.type*
store %m230$.Error.type* %.tmp6145, %m230$.Error.type** %err.6146
%.tmp6147 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6148 = load %m230$.Error.type*, %m230$.Error.type** %err.6146
call void(%m2437$.CompilerCtx.type*,%m230$.Error.type*) @m229$append_error.v.m2437$.CompilerCtx.typep.m230$.Error.typep(%m2437$.CompilerCtx.type* %.tmp6147, %m230$.Error.type* %.tmp6148)
br label %.if.end.6134
.if.false.6134:
%.tmp6150 = getelementptr [61 x i8], [61 x i8]*@.str6149, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp6150)
br label %.if.end.6134
.if.end.6134:
ret void
}
define void @m229$define_assignable.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg, i8* %.name.arg, %m2437$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.info.arg, %m2437$.AssignableInfo.type** %info
%.tmp6151 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6152 = call %m2437$.ModuleLookup.type*(%m2437$.CompilerCtx.type*) @m229$get_current_module.m2437$.ModuleLookup.typep.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp6151)
%mod.6153 = alloca %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* %.tmp6152, %m2437$.ModuleLookup.type** %mod.6153
%.tmp6154 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.6153
%.tmp6155 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp6154, i32 0, i32 3
%.tmp6156 = load %m2437$.Scope.type*, %m2437$.Scope.type** %.tmp6155
%.tmp6157 = icmp ne %m2437$.Scope.type* %.tmp6156, null
%.tmp6159 = getelementptr [82 x i8], [82 x i8]*@.str6158, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6157, i8* %.tmp6159)
%.tmp6160 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.6153
%.tmp6161 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp6160, i32 0, i32 3
%.tmp6162 = load %m2437$.Scope.type*, %m2437$.Scope.type** %.tmp6161
%current_scope.6163 = alloca %m2437$.Scope.type*
store %m2437$.Scope.type* %.tmp6162, %m2437$.Scope.type** %current_scope.6163
%.tmp6164 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* null, i32 1
%.tmp6165 = ptrtoint %m2437$.ScopeItem.type* %.tmp6164 to i32
%.tmp6166 = call i8*(i32) @malloc(i32 %.tmp6165)
%.tmp6167 = bitcast i8* %.tmp6166 to %m2437$.ScopeItem.type*
%newitem.6168 = alloca %m2437$.ScopeItem.type*
store %m2437$.ScopeItem.type* %.tmp6167, %m2437$.ScopeItem.type** %newitem.6168
%.tmp6169 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %newitem.6168
%.tmp6170 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6169, i32 0, i32 0
%.tmp6171 = load i8*, i8** %name
store i8* %.tmp6171, i8** %.tmp6170
%.tmp6172 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %newitem.6168
%.tmp6173 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6172, i32 0, i32 1
%.tmp6174 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
store %m2437$.AssignableInfo.type* %.tmp6174, %m2437$.AssignableInfo.type** %.tmp6173
%.tmp6175 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %newitem.6168
%.tmp6176 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6175, i32 0, i32 2
store %m2437$.ScopeItem.type* null, %m2437$.ScopeItem.type** %.tmp6176
%.tmp6177 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp6178 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6177, i32 0, i32 2
%.tmp6179 = load i8*, i8** %name
store i8* %.tmp6179, i8** %.tmp6178
%.tmp6180 = load %m2437$.Scope.type*, %m2437$.Scope.type** %current_scope.6163
%.tmp6181 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp6180, i32 0, i32 1
%.tmp6182 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %.tmp6181
%.tmp6183 = icmp eq %m2437$.ScopeItem.type* %.tmp6182, null
br i1 %.tmp6183, label %.if.true.6184, label %.if.false.6184
.if.true.6184:
%.tmp6185 = load %m2437$.Scope.type*, %m2437$.Scope.type** %current_scope.6163
%.tmp6186 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp6185, i32 0, i32 1
%.tmp6187 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %newitem.6168
store %m2437$.ScopeItem.type* %.tmp6187, %m2437$.ScopeItem.type** %.tmp6186
ret void
br label %.if.end.6184
.if.false.6184:
br label %.if.end.6184
.if.end.6184:
%.tmp6188 = load %m2437$.Scope.type*, %m2437$.Scope.type** %current_scope.6163
%.tmp6189 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp6188, i32 0, i32 1
%.tmp6190 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %.tmp6189
%last_item.6191 = alloca %m2437$.ScopeItem.type*
store %m2437$.ScopeItem.type* %.tmp6190, %m2437$.ScopeItem.type** %last_item.6191
%.tmp6193 = getelementptr [1 x i8], [1 x i8]*@.str6192, i32 0, i32 0
%err_buf.6194 = alloca i8*
store i8* %.tmp6193, i8** %err_buf.6194
%.tmp6195 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %last_item.6191
%.tmp6196 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6195, i32 0, i32 0
%.tmp6197 = load i8*, i8** %.tmp6196
%.tmp6198 = load i8*, i8** %name
%.tmp6199 = call i32(i8*,i8*) @strcmp(i8* %.tmp6197, i8* %.tmp6198)
%.tmp6200 = icmp eq i32 %.tmp6199, 0
br i1 %.tmp6200, label %.if.true.6201, label %.if.false.6201
.if.true.6201:
%.tmp6202 = getelementptr i8*, i8** %err_buf.6194, i32 0
%.tmp6204 = getelementptr [43 x i8], [43 x i8]*@.str6203, i32 0, i32 0
%.tmp6205 = load i8*, i8** %name
%.tmp6206 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6202, i8* %.tmp6204, i8* %.tmp6205)
%.tmp6207 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6208 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp6209 = load i8*, i8** %err_buf.6194
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp6207, %m812$.Node.type* %.tmp6208, i8* %.tmp6209)
br label %.if.end.6201
.if.false.6201:
br label %.if.end.6201
.if.end.6201:
br label %.for.start.6210
.for.start.6210:
%.tmp6211 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %last_item.6191
%.tmp6212 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6211, i32 0, i32 2
%.tmp6213 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %.tmp6212
%.tmp6214 = icmp ne %m2437$.ScopeItem.type* %.tmp6213, null
br i1 %.tmp6214, label %.for.continue.6210, label %.for.else.6210
.for.continue.6210:
%.tmp6215 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %last_item.6191
%.tmp6216 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6215, i32 0, i32 0
%.tmp6217 = load i8*, i8** %.tmp6216
%.tmp6218 = load i8*, i8** %name
%.tmp6219 = call i32(i8*,i8*) @strcmp(i8* %.tmp6217, i8* %.tmp6218)
%.tmp6220 = icmp eq i32 %.tmp6219, 0
br i1 %.tmp6220, label %.if.true.6221, label %.if.false.6221
.if.true.6221:
%.tmp6222 = getelementptr i8*, i8** %err_buf.6194, i32 0
%.tmp6224 = getelementptr [43 x i8], [43 x i8]*@.str6223, i32 0, i32 0
%.tmp6225 = load i8*, i8** %name
%.tmp6226 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6222, i8* %.tmp6224, i8* %.tmp6225)
%.tmp6227 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6228 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp6229 = load i8*, i8** %err_buf.6194
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp6227, %m812$.Node.type* %.tmp6228, i8* %.tmp6229)
br label %.for.end.6210
br label %.if.end.6221
.if.false.6221:
br label %.if.end.6221
.if.end.6221:
%.tmp6230 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %last_item.6191
%.tmp6231 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6230, i32 0, i32 2
%.tmp6232 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %.tmp6231
store %m2437$.ScopeItem.type* %.tmp6232, %m2437$.ScopeItem.type** %last_item.6191
br label %.for.start.6210
.for.else.6210:
%.tmp6233 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %last_item.6191
%.tmp6234 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6233, i32 0, i32 2
%.tmp6235 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %newitem.6168
store %m2437$.ScopeItem.type* %.tmp6235, %m2437$.ScopeItem.type** %.tmp6234
br label %.for.end.6210
.for.end.6210:
ret void
}
define %m2437$.ScopeItem.type* @m229$find_defined_in.m2437$.ScopeItem.typep.m2437$.CompilerCtx.typep.cp.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m812$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m812$.Node.type*
store %m812$.Node.type* %.dotted_name.arg, %m812$.Node.type** %dotted_name
%err_buf.6236 = alloca i8*
store i8* null, i8** %err_buf.6236
%.tmp6237 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6238 = load i8*, i8** %module
%.tmp6239 = load %m812$.Node.type*, %m812$.Node.type** %dotted_name
%.tmp6240 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6239, i32 0, i32 1
%.tmp6241 = load i8*, i8** %.tmp6240
%.tmp6242 = call %m2437$.ScopeItem.type*(%m2437$.CompilerCtx.type*,i8*,i8*) @m229$find_defined_str.m2437$.ScopeItem.typep.m2437$.CompilerCtx.typep.cp.cp(%m2437$.CompilerCtx.type* %.tmp6237, i8* %.tmp6238, i8* %.tmp6241)
%found.6243 = alloca %m2437$.ScopeItem.type*
store %m2437$.ScopeItem.type* %.tmp6242, %m2437$.ScopeItem.type** %found.6243
%.tmp6244 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %found.6243
%.tmp6245 = icmp eq %m2437$.ScopeItem.type* %.tmp6244, null
br i1 %.tmp6245, label %.if.true.6246, label %.if.false.6246
.if.true.6246:
%.tmp6247 = getelementptr i8*, i8** %err_buf.6236, i32 0
%.tmp6249 = getelementptr [31 x i8], [31 x i8]*@.str6248, i32 0, i32 0
%.tmp6250 = load %m812$.Node.type*, %m812$.Node.type** %dotted_name
%.tmp6251 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6250, i32 0, i32 1
%.tmp6252 = load i8*, i8** %.tmp6251
%.tmp6253 = load i8*, i8** %module
%.tmp6254 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6247, i8* %.tmp6249, i8* %.tmp6252, i8* %.tmp6253)
%.tmp6255 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6256 = load %m812$.Node.type*, %m812$.Node.type** %dotted_name
%.tmp6257 = load i8*, i8** %err_buf.6236
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp6255, %m812$.Node.type* %.tmp6256, i8* %.tmp6257)
%.tmp6258 = bitcast ptr null to %m2437$.ScopeItem.type*
ret %m2437$.ScopeItem.type* %.tmp6258
br label %.if.end.6246
.if.false.6246:
br label %.if.end.6246
.if.end.6246:
br label %.for.start.6259
.for.start.6259:
%.tmp6260 = load %m812$.Node.type*, %m812$.Node.type** %dotted_name
%.tmp6261 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6260, i32 0, i32 7
%.tmp6262 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6261
%.tmp6263 = icmp ne %m812$.Node.type* %.tmp6262, null
%.tmp6264 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %found.6243
%.tmp6265 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6264, i32 0, i32 1
%.tmp6266 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %.tmp6265
%.tmp6267 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6266, i32 0, i32 3
%.tmp6268 = load i8*, i8** %.tmp6267
%.tmp6270 = getelementptr [7 x i8], [7 x i8]*@.str6269, i32 0, i32 0
%.tmp6271 = call i32(i8*,i8*) @strcmp(i8* %.tmp6268, i8* %.tmp6270)
%.tmp6272 = icmp eq i32 %.tmp6271, 0
%.tmp6273 = and i1 %.tmp6263, %.tmp6272
br i1 %.tmp6273, label %.for.continue.6259, label %.for.end.6259
.for.continue.6259:
%.tmp6274 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6275 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %found.6243
%.tmp6276 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6275, i32 0, i32 1
%.tmp6277 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %.tmp6276
%.tmp6278 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6277, i32 0, i32 0
%.tmp6279 = load i8*, i8** %.tmp6278
%.tmp6280 = load %m812$.Node.type*, %m812$.Node.type** %dotted_name
%.tmp6281 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6280, i32 0, i32 7
%.tmp6282 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6281
%.tmp6283 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6282, i32 0, i32 7
%.tmp6284 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6283
%.tmp6285 = call %m2437$.ScopeItem.type*(%m2437$.CompilerCtx.type*,i8*,%m812$.Node.type*) @m229$find_defined_in.m2437$.ScopeItem.typep.m2437$.CompilerCtx.typep.cp.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp6274, i8* %.tmp6279, %m812$.Node.type* %.tmp6284)
store %m2437$.ScopeItem.type* %.tmp6285, %m2437$.ScopeItem.type** %found.6243
%.tmp6286 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %found.6243
%.tmp6287 = icmp eq %m2437$.ScopeItem.type* %.tmp6286, null
br i1 %.tmp6287, label %.if.true.6288, label %.if.false.6288
.if.true.6288:
%.tmp6289 = bitcast ptr null to %m2437$.ScopeItem.type*
ret %m2437$.ScopeItem.type* %.tmp6289
br label %.if.end.6288
.if.false.6288:
br label %.if.end.6288
.if.end.6288:
br label %.for.start.6259
.for.end.6259:
%.tmp6290 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %found.6243
ret %m2437$.ScopeItem.type* %.tmp6290
}
define %m2437$.ScopeItem.type* @m229$find_defined_here.m2437$.ScopeItem.typep.m2437$.CompilerCtx.typep.m2437$.Scope.typep.cp(%m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%s = alloca %m2437$.Scope.type*
store %m2437$.Scope.type* %.s.arg, %m2437$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp6291 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s
%.tmp6292 = icmp eq %m2437$.Scope.type* %.tmp6291, null
br i1 %.tmp6292, label %.if.true.6293, label %.if.false.6293
.if.true.6293:
%.tmp6294 = bitcast ptr null to %m2437$.ScopeItem.type*
ret %m2437$.ScopeItem.type* %.tmp6294
br label %.if.end.6293
.if.false.6293:
br label %.if.end.6293
.if.end.6293:
%.tmp6296 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s
%.tmp6297 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp6296, i32 0, i32 1
%.tmp6298 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %.tmp6297
%item.6299 = alloca %m2437$.ScopeItem.type*
store %m2437$.ScopeItem.type* %.tmp6298, %m2437$.ScopeItem.type** %item.6299
br label %.for.start.6295
.for.start.6295:
%.tmp6300 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %item.6299
%.tmp6301 = icmp ne %m2437$.ScopeItem.type* %.tmp6300, null
br i1 %.tmp6301, label %.for.continue.6295, label %.for.end.6295
.for.continue.6295:
%.tmp6302 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %item.6299
%.tmp6303 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6302, i32 0, i32 0
%.tmp6304 = load i8*, i8** %.tmp6303
%.tmp6305 = load i8*, i8** %name
%.tmp6306 = call i32(i8*,i8*) @strcmp(i8* %.tmp6304, i8* %.tmp6305)
%.tmp6307 = icmp eq i32 %.tmp6306, 0
br i1 %.tmp6307, label %.if.true.6308, label %.if.false.6308
.if.true.6308:
%.tmp6309 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %item.6299
ret %m2437$.ScopeItem.type* %.tmp6309
br label %.if.end.6308
.if.false.6308:
br label %.if.end.6308
.if.end.6308:
%.tmp6310 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %item.6299
%.tmp6311 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6310, i32 0, i32 2
%.tmp6312 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %.tmp6311
store %m2437$.ScopeItem.type* %.tmp6312, %m2437$.ScopeItem.type** %item.6299
br label %.for.start.6295
.for.end.6295:
%.tmp6313 = bitcast ptr null to %m2437$.ScopeItem.type*
ret %m2437$.ScopeItem.type* %.tmp6313
}
define %m2437$.ScopeItem.type* @m229$find_defined_str.m2437$.ScopeItem.typep.m2437$.CompilerCtx.typep.cp.cp(%m2437$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp6314 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6315 = load i8*, i8** %module
%.tmp6316 = call %m2437$.ModuleLookup.type*(%m2437$.CompilerCtx.type*,i8*) @m229$get_module.m2437$.ModuleLookup.typep.m2437$.CompilerCtx.typep.cp(%m2437$.CompilerCtx.type* %.tmp6314, i8* %.tmp6315)
%mod.6317 = alloca %m2437$.ModuleLookup.type*
store %m2437$.ModuleLookup.type* %.tmp6316, %m2437$.ModuleLookup.type** %mod.6317
%.tmp6318 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.6317
%.tmp6319 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp6318, i32 0, i32 3
%.tmp6320 = load %m2437$.Scope.type*, %m2437$.Scope.type** %.tmp6319
%.tmp6321 = icmp ne %m2437$.Scope.type* %.tmp6320, null
%.tmp6323 = getelementptr [77 x i8], [77 x i8]*@.str6322, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6321, i8* %.tmp6323)
%.tmp6325 = load %m2437$.ModuleLookup.type*, %m2437$.ModuleLookup.type** %mod.6317
%.tmp6326 = getelementptr %m2437$.ModuleLookup.type, %m2437$.ModuleLookup.type* %.tmp6325, i32 0, i32 3
%.tmp6327 = load %m2437$.Scope.type*, %m2437$.Scope.type** %.tmp6326
%s.6328 = alloca %m2437$.Scope.type*
store %m2437$.Scope.type* %.tmp6327, %m2437$.Scope.type** %s.6328
br label %.for.start.6324
.for.start.6324:
%.tmp6329 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.6328
%.tmp6330 = icmp ne %m2437$.Scope.type* %.tmp6329, null
br i1 %.tmp6330, label %.for.continue.6324, label %.for.end.6324
.for.continue.6324:
%.tmp6331 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6332 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.6328
%.tmp6333 = load i8*, i8** %assignable_name
%.tmp6334 = call %m2437$.ScopeItem.type*(%m2437$.CompilerCtx.type*,%m2437$.Scope.type*,i8*) @m229$find_defined_here.m2437$.ScopeItem.typep.m2437$.CompilerCtx.typep.m2437$.Scope.typep.cp(%m2437$.CompilerCtx.type* %.tmp6331, %m2437$.Scope.type* %.tmp6332, i8* %.tmp6333)
%item.6335 = alloca %m2437$.ScopeItem.type*
store %m2437$.ScopeItem.type* %.tmp6334, %m2437$.ScopeItem.type** %item.6335
%.tmp6336 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %item.6335
%.tmp6337 = icmp ne %m2437$.ScopeItem.type* %.tmp6336, null
br i1 %.tmp6337, label %.if.true.6338, label %.if.false.6338
.if.true.6338:
%.tmp6339 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %item.6335
ret %m2437$.ScopeItem.type* %.tmp6339
br label %.if.end.6338
.if.false.6338:
br label %.if.end.6338
.if.end.6338:
%.tmp6340 = load %m2437$.Scope.type*, %m2437$.Scope.type** %s.6328
%.tmp6341 = getelementptr %m2437$.Scope.type, %m2437$.Scope.type* %.tmp6340, i32 0, i32 5
%.tmp6342 = load %m2437$.Scope.type*, %m2437$.Scope.type** %.tmp6341
store %m2437$.Scope.type* %.tmp6342, %m2437$.Scope.type** %s.6328
br label %.for.start.6324
.for.end.6324:
%.tmp6343 = bitcast ptr null to %m2437$.ScopeItem.type*
ret %m2437$.ScopeItem.type* %.tmp6343
}
define %m2437$.ScopeItem.type* @m229$find_defined.m2437$.ScopeItem.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%dotted_name = alloca %m812$.Node.type*
store %m812$.Node.type* %.dotted_name.arg, %m812$.Node.type** %dotted_name
%.tmp6344 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6345 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6346 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6345, i32 0, i32 7
%.tmp6347 = load i8*, i8** %.tmp6346
%.tmp6348 = load %m812$.Node.type*, %m812$.Node.type** %dotted_name
%.tmp6349 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6348, i32 0, i32 6
%.tmp6350 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6349
%.tmp6351 = call %m2437$.ScopeItem.type*(%m2437$.CompilerCtx.type*,i8*,%m812$.Node.type*) @m229$find_defined_in.m2437$.ScopeItem.typep.m2437$.CompilerCtx.typep.cp.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp6344, i8* %.tmp6347, %m812$.Node.type* %.tmp6350)
ret %m2437$.ScopeItem.type* %.tmp6351
}
define %m2437$.AssignableInfo.type* @m229$get_dotted_name.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.dot_name_ptr.arg, %m2437$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m812$.Node.type*
store %m812$.Node.type* %.dot_name_ptr.arg, %m812$.Node.type** %dot_name_ptr
%info = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.info.arg, %m2437$.AssignableInfo.type** %info
%err_msg.6352 = alloca i8*
store i8* null, i8** %err_msg.6352
%buf.6353 = alloca i8*
store i8* null, i8** %buf.6353
%.tmp6354 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp6355 = icmp eq %m2437$.AssignableInfo.type* %.tmp6354, null
br i1 %.tmp6355, label %.if.true.6356, label %.if.false.6356
.if.true.6356:
%.tmp6357 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6358 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6360 = getelementptr [54 x i8], [54 x i8]*@.str6359, i32 0, i32 0
%.tmp6361 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp6357, %m812$.Node.type* %.tmp6358, i8* %.tmp6360)
%.tmp6362 = call i32(i8*,...) @printf(i8* %.tmp6361)
%.tmp6363 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp6363
br label %.if.end.6356
.if.false.6356:
br label %.if.end.6356
.if.end.6356:
%.tmp6364 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp6365 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6364, i32 0, i32 3
%.tmp6366 = load i8*, i8** %.tmp6365
%.tmp6368 = getelementptr [9 x i8], [9 x i8]*@.str6367, i32 0, i32 0
%.tmp6369 = call i32(i8*,i8*) @strcmp(i8* %.tmp6366, i8* %.tmp6368)
%.tmp6370 = icmp eq i32 %.tmp6369, 0
%.tmp6371 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp6372 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6371, i32 0, i32 3
%.tmp6373 = load i8*, i8** %.tmp6372
%.tmp6375 = getelementptr [7 x i8], [7 x i8]*@.str6374, i32 0, i32 0
%.tmp6376 = call i32(i8*,i8*) @strcmp(i8* %.tmp6373, i8* %.tmp6375)
%.tmp6377 = icmp eq i32 %.tmp6376, 0
%.tmp6378 = or i1 %.tmp6370, %.tmp6377
br i1 %.tmp6378, label %.if.true.6379, label %.if.false.6379
.if.true.6379:
%.tmp6380 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6381 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6380, i32 0, i32 7
%.tmp6382 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6381
%.tmp6383 = icmp ne %m812$.Node.type* %.tmp6382, null
br i1 %.tmp6383, label %.if.true.6384, label %.if.false.6384
.if.true.6384:
%.tmp6385 = getelementptr i8*, i8** %err_msg.6352, i32 0
%.tmp6387 = getelementptr [46 x i8], [46 x i8]*@.str6386, i32 0, i32 0
%.tmp6388 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6389 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6388, i32 0, i32 7
%.tmp6390 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6389
%.tmp6391 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6390, i32 0, i32 7
%.tmp6392 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6391
%.tmp6393 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6392, i32 0, i32 1
%.tmp6394 = load i8*, i8** %.tmp6393
%.tmp6395 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6396 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6395, i32 0, i32 1
%.tmp6397 = load i8*, i8** %.tmp6396
%.tmp6398 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6385, i8* %.tmp6387, i8* %.tmp6394, i8* %.tmp6397)
%.tmp6399 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6400 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6401 = load i8*, i8** %err_msg.6352
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp6399, %m812$.Node.type* %.tmp6400, i8* %.tmp6401)
%.tmp6402 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp6402
br label %.if.end.6384
.if.false.6384:
br label %.if.end.6384
.if.end.6384:
%.tmp6403 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
ret %m2437$.AssignableInfo.type* %.tmp6403
br label %.if.end.6379
.if.false.6379:
%.tmp6404 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp6405 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6404, i32 0, i32 3
%.tmp6406 = load i8*, i8** %.tmp6405
%.tmp6408 = getelementptr [9 x i8], [9 x i8]*@.str6407, i32 0, i32 0
%.tmp6409 = call i32(i8*,i8*) @strcmp(i8* %.tmp6406, i8* %.tmp6408)
%.tmp6410 = icmp eq i32 %.tmp6409, 0
%.tmp6411 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6412 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6411, i32 0, i32 7
%.tmp6413 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6412
%.tmp6414 = icmp ne %m812$.Node.type* %.tmp6413, null
%.tmp6415 = and i1 %.tmp6410, %.tmp6414
br i1 %.tmp6415, label %.if.true.6416, label %.if.false.6416
.if.true.6416:
%.tmp6417 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%base_var.6418 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp6417, %m2437$.AssignableInfo.type** %base_var.6418
%.tmp6419 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base_var.6418
%.tmp6420 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6419, i32 0, i32 4
%.tmp6421 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6420
%struct_info.6422 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp6421, %m2437$.Type.type** %struct_info.6422
br label %.for.start.6423
.for.start.6423:
%.tmp6424 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base_var.6418
%.tmp6425 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6424, i32 0, i32 4
%.tmp6426 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6425
%.tmp6427 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6426, i32 0, i32 0
%.tmp6428 = load i8*, i8** %.tmp6427
%.tmp6430 = getelementptr [4 x i8], [4 x i8]*@.str6429, i32 0, i32 0
%.tmp6431 = call i32(i8*,i8*) @strcmp(i8* %.tmp6428, i8* %.tmp6430)
%.tmp6432 = icmp eq i32 %.tmp6431, 0
br i1 %.tmp6432, label %.for.continue.6423, label %.for.end.6423
.for.continue.6423:
%.tmp6433 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6434 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp6433)
%new_base.6435 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp6434, %m2437$.AssignableInfo.type** %new_base.6435
%.tmp6436 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6437 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6435
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp6436, %m2437$.AssignableInfo.type* %.tmp6437)
%.tmp6438 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6435
%.tmp6439 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6438, i32 0, i32 4
%.tmp6440 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base_var.6418
%.tmp6441 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6440, i32 0, i32 4
%.tmp6442 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6441
%.tmp6443 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6442, i32 0, i32 3
%.tmp6444 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6443
store %m2437$.Type.type* %.tmp6444, %m2437$.Type.type** %.tmp6439
%.tmp6445 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6446 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6445, i32 0, i32 1
%.tmp6447 = load %m0$.File.type*, %m0$.File.type** %.tmp6446
%.tmp6449 = getelementptr [23 x i8], [23 x i8]*@.str6448, i32 0, i32 0
%.tmp6450 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6435
%.tmp6451 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp6450)
%.tmp6452 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6453 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6435
%.tmp6454 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6453, i32 0, i32 4
%.tmp6455 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6454
%.tmp6456 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp6452, %m2437$.Type.type* %.tmp6455)
%.tmp6457 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6458 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base_var.6418
%.tmp6459 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6458, i32 0, i32 4
%.tmp6460 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6459
%.tmp6461 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp6457, %m2437$.Type.type* %.tmp6460)
%.tmp6462 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base_var.6418
%.tmp6463 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp6462)
%.tmp6464 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6447, i8* %.tmp6449, i8* %.tmp6451, i8* %.tmp6456, i8* %.tmp6461, i8* %.tmp6463)
%.tmp6465 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6435
store %m2437$.AssignableInfo.type* %.tmp6465, %m2437$.AssignableInfo.type** %base_var.6418
%.tmp6466 = load %m2437$.Type.type*, %m2437$.Type.type** %struct_info.6422
%.tmp6467 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6466, i32 0, i32 3
%.tmp6468 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6467
store %m2437$.Type.type* %.tmp6468, %m2437$.Type.type** %struct_info.6422
br label %.for.start.6423
.for.end.6423:
%.tmp6469 = load %m2437$.Type.type*, %m2437$.Type.type** %struct_info.6422
%.tmp6470 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6469, i32 0, i32 0
%.tmp6471 = load i8*, i8** %.tmp6470
%.tmp6473 = getelementptr [10 x i8], [10 x i8]*@.str6472, i32 0, i32 0
%.tmp6474 = call i32(i8*,i8*) @strcmp(i8* %.tmp6471, i8* %.tmp6473)
%.tmp6475 = icmp eq i32 %.tmp6474, 0
br i1 %.tmp6475, label %.if.true.6476, label %.if.false.6476
.if.true.6476:
%.tmp6477 = load %m2437$.Type.type*, %m2437$.Type.type** %struct_info.6422
%.tmp6478 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6477, i32 0, i32 3
%.tmp6479 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6478
store %m2437$.Type.type* %.tmp6479, %m2437$.Type.type** %struct_info.6422
br label %.if.end.6476
.if.false.6476:
br label %.if.end.6476
.if.end.6476:
%.tmp6480 = load %m2437$.Type.type*, %m2437$.Type.type** %struct_info.6422
%.tmp6481 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6480, i32 0, i32 0
%.tmp6482 = load i8*, i8** %.tmp6481
%.tmp6484 = getelementptr [7 x i8], [7 x i8]*@.str6483, i32 0, i32 0
%.tmp6485 = call i32(i8*,i8*) @strcmp(i8* %.tmp6482, i8* %.tmp6484)
%.tmp6486 = icmp ne i32 %.tmp6485, 0
br i1 %.tmp6486, label %.if.true.6487, label %.if.false.6487
.if.true.6487:
%.tmp6488 = getelementptr i8*, i8** %err_msg.6352, i32 0
%.tmp6490 = getelementptr [48 x i8], [48 x i8]*@.str6489, i32 0, i32 0
%.tmp6491 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6492 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6491, i32 0, i32 7
%.tmp6493 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6492
%.tmp6494 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6493, i32 0, i32 7
%.tmp6495 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6494
%.tmp6496 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6495, i32 0, i32 1
%.tmp6497 = load i8*, i8** %.tmp6496
%.tmp6498 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6499 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6498, i32 0, i32 1
%.tmp6500 = load i8*, i8** %.tmp6499
%.tmp6501 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6488, i8* %.tmp6490, i8* %.tmp6497, i8* %.tmp6500)
%.tmp6502 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6503 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6504 = load i8*, i8** %err_msg.6352
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp6502, %m812$.Node.type* %.tmp6503, i8* %.tmp6504)
%.tmp6505 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp6505
br label %.if.end.6487
.if.false.6487:
br label %.if.end.6487
.if.end.6487:
%.tmp6506 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6507 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6506, i32 0, i32 7
%.tmp6508 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6507
%.tmp6509 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6508, i32 0, i32 7
%.tmp6510 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6509
%.tmp6511 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6510, i32 0, i32 1
%.tmp6512 = load i8*, i8** %.tmp6511
%field_name.6513 = alloca i8*
store i8* %.tmp6512, i8** %field_name.6513
%field_id.6514 = alloca i32
store i32 0, i32* %field_id.6514
%.tmp6515 = bitcast ptr null to %m2437$.Type.type*
%found_field.6516 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp6515, %m2437$.Type.type** %found_field.6516
%.tmp6518 = load %m2437$.Type.type*, %m2437$.Type.type** %struct_info.6422
%.tmp6519 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6518, i32 0, i32 3
%.tmp6520 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6519
%field.6521 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp6520, %m2437$.Type.type** %field.6521
br label %.for.start.6517
.for.start.6517:
%.tmp6522 = load %m2437$.Type.type*, %m2437$.Type.type** %field.6521
%.tmp6523 = icmp ne %m2437$.Type.type* %.tmp6522, null
br i1 %.tmp6523, label %.for.continue.6517, label %.for.end.6517
.for.continue.6517:
%.tmp6524 = load %m2437$.Type.type*, %m2437$.Type.type** %field.6521
%.tmp6525 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6524, i32 0, i32 1
%.tmp6526 = load i8*, i8** %.tmp6525
%.tmp6527 = load i8*, i8** %field_name.6513
%.tmp6528 = call i32(i8*,i8*) @strcmp(i8* %.tmp6526, i8* %.tmp6527)
%.tmp6529 = icmp eq i32 %.tmp6528, 0
br i1 %.tmp6529, label %.if.true.6530, label %.if.false.6530
.if.true.6530:
%.tmp6531 = load %m2437$.Type.type*, %m2437$.Type.type** %field.6521
store %m2437$.Type.type* %.tmp6531, %m2437$.Type.type** %found_field.6516
br label %.for.end.6517
br label %.if.end.6530
.if.false.6530:
%.tmp6532 = load i32, i32* %field_id.6514
%.tmp6533 = add i32 %.tmp6532, 1
store i32 %.tmp6533, i32* %field_id.6514
br label %.if.end.6530
.if.end.6530:
%.tmp6534 = load %m2437$.Type.type*, %m2437$.Type.type** %field.6521
%.tmp6535 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6534, i32 0, i32 4
%.tmp6536 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6535
store %m2437$.Type.type* %.tmp6536, %m2437$.Type.type** %field.6521
br label %.for.start.6517
.for.end.6517:
%.tmp6537 = load %m2437$.Type.type*, %m2437$.Type.type** %found_field.6516
%.tmp6538 = icmp eq %m2437$.Type.type* %.tmp6537, null
br i1 %.tmp6538, label %.if.true.6539, label %.if.false.6539
.if.true.6539:
%.tmp6540 = getelementptr i8*, i8** %err_msg.6352, i32 0
%.tmp6542 = getelementptr [34 x i8], [34 x i8]*@.str6541, i32 0, i32 0
%.tmp6543 = load i8*, i8** %field_name.6513
%.tmp6544 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6545 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6544, i32 0, i32 1
%.tmp6546 = load i8*, i8** %.tmp6545
%.tmp6547 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6540, i8* %.tmp6542, i8* %.tmp6543, i8* %.tmp6546)
%.tmp6548 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6549 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6550 = load i8*, i8** %err_msg.6352
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp6548, %m812$.Node.type* %.tmp6549, i8* %.tmp6550)
%.tmp6551 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp6551
br label %.if.end.6539
.if.false.6539:
br label %.if.end.6539
.if.end.6539:
%.tmp6552 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6553 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp6552)
%new_info.6554 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp6553, %m2437$.AssignableInfo.type** %new_info.6554
%.tmp6555 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_info.6554
%.tmp6556 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6555, i32 0, i32 4
%.tmp6557 = load %m2437$.Type.type*, %m2437$.Type.type** %found_field.6516
store %m2437$.Type.type* %.tmp6557, %m2437$.Type.type** %.tmp6556
%.tmp6558 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6559 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_info.6554
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp6558, %m2437$.AssignableInfo.type* %.tmp6559)
%.tmp6560 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_info.6554
%.tmp6561 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6560, i32 0, i32 3
%.tmp6563 = getelementptr [9 x i8], [9 x i8]*@.str6562, i32 0, i32 0
store i8* %.tmp6563, i8** %.tmp6561
%.tmp6564 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6565 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base_var.6418
%.tmp6566 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6565, i32 0, i32 4
%.tmp6567 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6566
%.tmp6568 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp6564, %m2437$.Type.type* %.tmp6567)
%info_tr.6569 = alloca i8*
store i8* %.tmp6568, i8** %info_tr.6569
%.tmp6570 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6571 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6570, i32 0, i32 1
%.tmp6572 = load %m0$.File.type*, %m0$.File.type** %.tmp6571
%.tmp6574 = getelementptr [46 x i8], [46 x i8]*@.str6573, i32 0, i32 0
%.tmp6575 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_info.6554
%.tmp6576 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp6575)
%.tmp6577 = load i8*, i8** %info_tr.6569
%.tmp6578 = load i8*, i8** %info_tr.6569
%.tmp6579 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base_var.6418
%.tmp6580 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp6579)
%.tmp6581 = load i32, i32* %field_id.6514
%.tmp6582 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6572, i8* %.tmp6574, i8* %.tmp6576, i8* %.tmp6577, i8* %.tmp6578, i8* %.tmp6580, i32 %.tmp6581)
%.tmp6583 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6584 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6585 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6584, i32 0, i32 7
%.tmp6586 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6585
%.tmp6587 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6586, i32 0, i32 7
%.tmp6588 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6587
%.tmp6589 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_info.6554
%.tmp6590 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,%m2437$.AssignableInfo.type*) @m229$get_dotted_name.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp6583, %m812$.Node.type* %.tmp6588, %m2437$.AssignableInfo.type* %.tmp6589)
ret %m2437$.AssignableInfo.type* %.tmp6590
br label %.if.end.6416
.if.false.6416:
%.tmp6591 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp6592 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6591, i32 0, i32 3
%.tmp6593 = load i8*, i8** %.tmp6592
%.tmp6595 = getelementptr [9 x i8], [9 x i8]*@.str6594, i32 0, i32 0
%.tmp6596 = call i32(i8*,i8*) @strcmp(i8* %.tmp6593, i8* %.tmp6595)
%.tmp6597 = icmp eq i32 %.tmp6596, 0
br i1 %.tmp6597, label %.if.true.6598, label %.if.false.6598
.if.true.6598:
%.tmp6599 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
ret %m2437$.AssignableInfo.type* %.tmp6599
br label %.if.end.6598
.if.false.6598:
br label %.if.end.6598
.if.end.6598:
br label %.if.end.6416
.if.end.6416:
br label %.if.end.6379
.if.end.6379:
%.tmp6600 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6601 = load %m812$.Node.type*, %m812$.Node.type** %dot_name_ptr
%.tmp6603 = getelementptr [43 x i8], [43 x i8]*@.str6602, i32 0, i32 0
%.tmp6604 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp6600, %m812$.Node.type* %.tmp6601, i8* %.tmp6603)
%.tmp6605 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
%.tmp6606 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6605, i32 0, i32 3
%.tmp6607 = load i8*, i8** %.tmp6606
%.tmp6608 = call i32(i8*,...) @printf(i8* %.tmp6604, i8* %.tmp6607)
%.tmp6609 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp6609
}
define %m2437$.AssignableInfo.type* @m229$compile_addr.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%err_msg.6610 = alloca i8*
store i8* null, i8** %err_msg.6610
%.tmp6611 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%curr_node.6612 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp6611, %m812$.Node.type** %curr_node.6612
%.tmp6613 = load %m812$.Node.type*, %m812$.Node.type** %curr_node.6612
%.tmp6614 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6613, i32 0, i32 0
%.tmp6615 = load i8*, i8** %.tmp6614
%.tmp6617 = getelementptr [17 x i8], [17 x i8]*@.str6616, i32 0, i32 0
%.tmp6618 = call i32(i8*,i8*) @strcmp(i8* %.tmp6615, i8* %.tmp6617)
%.tmp6619 = icmp eq i32 %.tmp6618, 0
%.tmp6620 = load %m812$.Node.type*, %m812$.Node.type** %curr_node.6612
%.tmp6621 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6620, i32 0, i32 0
%.tmp6622 = load i8*, i8** %.tmp6621
%.tmp6624 = getelementptr [16 x i8], [16 x i8]*@.str6623, i32 0, i32 0
%.tmp6625 = call i32(i8*,i8*) @strcmp(i8* %.tmp6622, i8* %.tmp6624)
%.tmp6626 = icmp eq i32 %.tmp6625, 0
%.tmp6627 = or i1 %.tmp6619, %.tmp6626
%.tmp6628 = load %m812$.Node.type*, %m812$.Node.type** %curr_node.6612
%.tmp6629 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6628, i32 0, i32 0
%.tmp6630 = load i8*, i8** %.tmp6629
%.tmp6632 = getelementptr [11 x i8], [11 x i8]*@.str6631, i32 0, i32 0
%.tmp6633 = call i32(i8*,i8*) @strcmp(i8* %.tmp6630, i8* %.tmp6632)
%.tmp6634 = icmp eq i32 %.tmp6633, 0
%.tmp6635 = or i1 %.tmp6627, %.tmp6634
br i1 %.tmp6635, label %.if.true.6636, label %.if.false.6636
.if.true.6636:
%.tmp6637 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6638 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp6639 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6638, i32 0, i32 6
%.tmp6640 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6639
%.tmp6641 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_addr.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp6637, %m812$.Node.type* %.tmp6640)
ret %m2437$.AssignableInfo.type* %.tmp6641
br label %.if.end.6636
.if.false.6636:
br label %.if.end.6636
.if.end.6636:
%.tmp6642 = load %m812$.Node.type*, %m812$.Node.type** %curr_node.6612
%.tmp6643 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6642, i32 0, i32 0
%.tmp6644 = load i8*, i8** %.tmp6643
%.tmp6646 = getelementptr [12 x i8], [12 x i8]*@.str6645, i32 0, i32 0
%.tmp6647 = call i32(i8*,i8*) @strcmp(i8* %.tmp6644, i8* %.tmp6646)
%.tmp6648 = icmp ne i32 %.tmp6647, 0
br i1 %.tmp6648, label %.if.true.6649, label %.if.false.6649
.if.true.6649:
%.tmp6651 = getelementptr [92 x i8], [92 x i8]*@.str6650, i32 0, i32 0
%.tmp6652 = load %m812$.Node.type*, %m812$.Node.type** %curr_node.6612
%.tmp6653 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6652, i32 0, i32 0
%.tmp6654 = load i8*, i8** %.tmp6653
%.tmp6655 = call i32(i8*,...) @printf(i8* %.tmp6651, i8* %.tmp6654)
%.tmp6656 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp6657 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6656, i32 0, i32 6
%.tmp6658 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6657
store %m812$.Node.type* %.tmp6658, %m812$.Node.type** %curr_node.6612
br label %.if.end.6649
.if.false.6649:
br label %.if.end.6649
.if.end.6649:
%.tmp6659 = load %m812$.Node.type*, %m812$.Node.type** %curr_node.6612
%.tmp6660 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6659, i32 0, i32 6
%.tmp6661 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6660
%assignable_name.6662 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp6661, %m812$.Node.type** %assignable_name.6662
%.tmp6663 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6664 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6665 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6664, i32 0, i32 7
%.tmp6666 = load i8*, i8** %.tmp6665
%.tmp6667 = load %m812$.Node.type*, %m812$.Node.type** %assignable_name.6662
%.tmp6668 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6667, i32 0, i32 6
%.tmp6669 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6668
%.tmp6670 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6669, i32 0, i32 1
%.tmp6671 = load i8*, i8** %.tmp6670
%.tmp6672 = call %m2437$.ScopeItem.type*(%m2437$.CompilerCtx.type*,i8*,i8*) @m229$find_defined_str.m2437$.ScopeItem.typep.m2437$.CompilerCtx.typep.cp.cp(%m2437$.CompilerCtx.type* %.tmp6663, i8* %.tmp6666, i8* %.tmp6671)
%scope_info.6673 = alloca %m2437$.ScopeItem.type*
store %m2437$.ScopeItem.type* %.tmp6672, %m2437$.ScopeItem.type** %scope_info.6673
%.tmp6674 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %scope_info.6673
%.tmp6675 = icmp eq %m2437$.ScopeItem.type* %.tmp6674, null
br i1 %.tmp6675, label %.if.true.6676, label %.if.false.6676
.if.true.6676:
%.tmp6677 = getelementptr i8*, i8** %err_msg.6610, i32 0
%.tmp6679 = getelementptr [41 x i8], [41 x i8]*@.str6678, i32 0, i32 0
%.tmp6680 = load %m812$.Node.type*, %m812$.Node.type** %assignable_name.6662
%.tmp6681 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6680, i32 0, i32 6
%.tmp6682 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6681
%.tmp6683 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6682, i32 0, i32 1
%.tmp6684 = load i8*, i8** %.tmp6683
%.tmp6685 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6677, i8* %.tmp6679, i8* %.tmp6684)
%.tmp6686 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6687 = load %m812$.Node.type*, %m812$.Node.type** %assignable_name.6662
%.tmp6688 = load i8*, i8** %err_msg.6610
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp6686, %m812$.Node.type* %.tmp6687, i8* %.tmp6688)
%.tmp6689 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp6689
br label %.if.end.6676
.if.false.6676:
br label %.if.end.6676
.if.end.6676:
%.tmp6690 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %scope_info.6673
%.tmp6691 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6690, i32 0, i32 1
%.tmp6692 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %.tmp6691
%info.6693 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp6692, %m2437$.AssignableInfo.type** %info.6693
%.tmp6694 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6693
%.tmp6695 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6694, i32 0, i32 3
%.tmp6696 = load i8*, i8** %.tmp6695
%.tmp6698 = getelementptr [7 x i8], [7 x i8]*@.str6697, i32 0, i32 0
%.tmp6699 = call i32(i8*,i8*) @strcmp(i8* %.tmp6696, i8* %.tmp6698)
%.tmp6700 = icmp eq i32 %.tmp6699, 0
br i1 %.tmp6700, label %.if.true.6701, label %.if.false.6701
.if.true.6701:
%.tmp6702 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6703 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6693
%.tmp6704 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp6703)
%.tmp6705 = load %m812$.Node.type*, %m812$.Node.type** %assignable_name.6662
%.tmp6706 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6705, i32 0, i32 6
%.tmp6707 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6706
%.tmp6708 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6707, i32 0, i32 7
%.tmp6709 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6708
%.tmp6710 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6709, i32 0, i32 7
%.tmp6711 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6710
%.tmp6712 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6711, i32 0, i32 1
%.tmp6713 = load i8*, i8** %.tmp6712
%.tmp6714 = call %m2437$.ScopeItem.type*(%m2437$.CompilerCtx.type*,i8*,i8*) @m229$find_defined_str.m2437$.ScopeItem.typep.m2437$.CompilerCtx.typep.cp.cp(%m2437$.CompilerCtx.type* %.tmp6702, i8* %.tmp6704, i8* %.tmp6713)
store %m2437$.ScopeItem.type* %.tmp6714, %m2437$.ScopeItem.type** %scope_info.6673
%.tmp6715 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %scope_info.6673
%.tmp6716 = icmp eq %m2437$.ScopeItem.type* %.tmp6715, null
br i1 %.tmp6716, label %.if.true.6717, label %.if.false.6717
.if.true.6717:
%.tmp6718 = getelementptr i8*, i8** %err_msg.6610, i32 0
%.tmp6720 = getelementptr [31 x i8], [31 x i8]*@.str6719, i32 0, i32 0
%.tmp6721 = load %m812$.Node.type*, %m812$.Node.type** %assignable_name.6662
%.tmp6722 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6721, i32 0, i32 6
%.tmp6723 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6722
%.tmp6724 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6723, i32 0, i32 7
%.tmp6725 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6724
%.tmp6726 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6725, i32 0, i32 7
%.tmp6727 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6726
%.tmp6728 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6727, i32 0, i32 1
%.tmp6729 = load i8*, i8** %.tmp6728
%.tmp6730 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6693
%.tmp6731 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp6730)
%.tmp6732 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6718, i8* %.tmp6720, i8* %.tmp6729, i8* %.tmp6731)
%.tmp6733 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6734 = load %m812$.Node.type*, %m812$.Node.type** %curr_node.6612
%.tmp6735 = load i8*, i8** %err_msg.6610
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp6733, %m812$.Node.type* %.tmp6734, i8* %.tmp6735)
%.tmp6736 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp6736
br label %.if.end.6717
.if.false.6717:
br label %.if.end.6717
.if.end.6717:
%.tmp6737 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %scope_info.6673
%.tmp6738 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp6737, i32 0, i32 1
%.tmp6739 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %.tmp6738
store %m2437$.AssignableInfo.type* %.tmp6739, %m2437$.AssignableInfo.type** %info.6693
%.tmp6740 = load %m812$.Node.type*, %m812$.Node.type** %assignable_name.6662
%.tmp6741 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6740, i32 0, i32 6
%.tmp6742 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6741
%.tmp6743 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6742, i32 0, i32 7
%.tmp6744 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6743
%.tmp6745 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6744, i32 0, i32 7
%.tmp6746 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6745
store %m812$.Node.type* %.tmp6746, %m812$.Node.type** %assignable_name.6662
br label %.if.end.6701
.if.false.6701:
%.tmp6747 = load %m812$.Node.type*, %m812$.Node.type** %assignable_name.6662
%.tmp6748 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6747, i32 0, i32 6
%.tmp6749 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6748
store %m812$.Node.type* %.tmp6749, %m812$.Node.type** %assignable_name.6662
br label %.if.end.6701
.if.end.6701:
%.tmp6750 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6751 = load %m812$.Node.type*, %m812$.Node.type** %assignable_name.6662
%.tmp6752 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6693
%.tmp6753 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,%m2437$.AssignableInfo.type*) @m229$get_dotted_name.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp6750, %m812$.Node.type* %.tmp6751, %m2437$.AssignableInfo.type* %.tmp6752)
%base.6754 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp6753, %m2437$.AssignableInfo.type** %base.6754
%.tmp6756 = load %m812$.Node.type*, %m812$.Node.type** %curr_node.6612
%.tmp6757 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6756, i32 0, i32 6
%.tmp6758 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6757
%.tmp6759 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6758, i32 0, i32 7
%.tmp6760 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6759
%addr.6761 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp6760, %m812$.Node.type** %addr.6761
br label %.for.start.6755
.for.start.6755:
%.tmp6762 = load %m812$.Node.type*, %m812$.Node.type** %addr.6761
%.tmp6763 = icmp ne %m812$.Node.type* %.tmp6762, null
br i1 %.tmp6763, label %.for.continue.6755, label %.for.end.6755
.for.continue.6755:
%.tmp6764 = load %m812$.Node.type*, %m812$.Node.type** %addr.6761
%.tmp6765 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6764, i32 0, i32 7
%.tmp6766 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6765
%index.6767 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp6766, %m812$.Node.type** %index.6767
%.tmp6768 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6769 = load %m812$.Node.type*, %m812$.Node.type** %index.6767
%.tmp6770 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_assignable.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp6768, %m812$.Node.type* %.tmp6769)
%index_info.6771 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp6770, %m2437$.AssignableInfo.type** %index_info.6771
%.tmp6772 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6773 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %index_info.6771
%.tmp6774 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6773, i32 0, i32 4
%.tmp6775 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6774
%.tmp6776 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp6772, %m2437$.Type.type* %.tmp6775)
%index_type.6777 = alloca i8*
store i8* %.tmp6776, i8** %index_type.6777
%.tmp6778 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base.6754
%.tmp6779 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6778, i32 0, i32 4
%.tmp6780 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6779
%.tmp6781 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6780, i32 0, i32 1
%.tmp6782 = load i8*, i8** %.tmp6781
%.tmp6783 = icmp ne i8* %.tmp6782, null
br i1 %.tmp6783, label %.if.true.6784, label %.if.false.6784
.if.true.6784:
%.tmp6785 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base.6754
%.tmp6786 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6785, i32 0, i32 4
%.tmp6787 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6786
%.tmp6788 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6787, i32 0, i32 1
%.tmp6789 = load i8*, i8** %.tmp6788
%.tmp6791 = getelementptr [6 x i8], [6 x i8]*@.str6790, i32 0, i32 0
%.tmp6792 = call i32(i8*,i8*) @strcmp(i8* %.tmp6789, i8* %.tmp6791)
%.tmp6793 = icmp eq i32 %.tmp6792, 0
br i1 %.tmp6793, label %.if.true.6794, label %.if.false.6794
.if.true.6794:
%.tmp6795 = load %m812$.Node.type*, %m812$.Node.type** %curr_node.6612
%.tmp6796 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp6795)
%new_base.6797 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp6796, %m2437$.AssignableInfo.type** %new_base.6797
%.tmp6798 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6799 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6797
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp6798, %m2437$.AssignableInfo.type* %.tmp6799)
%.tmp6800 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6801 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6800, i32 0, i32 1
%.tmp6802 = load %m0$.File.type*, %m0$.File.type** %.tmp6801
%.tmp6804 = getelementptr [45 x i8], [45 x i8]*@.str6803, i32 0, i32 0
%.tmp6805 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6797
%.tmp6806 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp6805)
%.tmp6807 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6808 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base.6754
%.tmp6809 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6808, i32 0, i32 4
%.tmp6810 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6809
%.tmp6811 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp6807, %m2437$.Type.type* %.tmp6810)
%.tmp6812 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6813 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base.6754
%.tmp6814 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6813, i32 0, i32 4
%.tmp6815 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6814
%.tmp6816 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp6812, %m2437$.Type.type* %.tmp6815)
%.tmp6817 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base.6754
%.tmp6818 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp6817)
%.tmp6819 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6802, i8* %.tmp6804, i8* %.tmp6806, i8* %.tmp6811, i8* %.tmp6816, i8* %.tmp6818)
%.tmp6820 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6797
%.tmp6821 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6820, i32 0, i32 4
%.tmp6822 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base.6754
%.tmp6823 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6822, i32 0, i32 4
%.tmp6824 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6823
%.tmp6825 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6824, i32 0, i32 3
%.tmp6826 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6825
%.tmp6827 = call %m2437$.Type.type*(%m2437$.Type.type*) @m229$type_clone.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.tmp6826)
store %m2437$.Type.type* %.tmp6827, %m2437$.Type.type** %.tmp6821
%.tmp6828 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6797
%.tmp6829 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6828, i32 0, i32 4
%.tmp6830 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6829
%.tmp6831 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6830, i32 0, i32 4
store %m2437$.Type.type* null, %m2437$.Type.type** %.tmp6831
%.tmp6832 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6797
store %m2437$.AssignableInfo.type* %.tmp6832, %m2437$.AssignableInfo.type** %base.6754
br label %.if.end.6794
.if.false.6794:
br label %.if.end.6794
.if.end.6794:
br label %.if.end.6784
.if.false.6784:
br label %.if.end.6784
.if.end.6784:
%.tmp6833 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6834 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base.6754
%.tmp6835 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6834, i32 0, i32 4
%.tmp6836 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6835
%.tmp6837 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp6833, %m2437$.Type.type* %.tmp6836)
%base_type.6838 = alloca i8*
store i8* %.tmp6837, i8** %base_type.6838
%.tmp6839 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6840 = call i32(%m2437$.CompilerCtx.type*) @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp6839)
%tmp_id.6841 = alloca i32
store i32 %.tmp6840, i32* %tmp_id.6841
%.tmp6842 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6843 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6842, i32 0, i32 1
%.tmp6844 = load %m0$.File.type*, %m0$.File.type** %.tmp6843
%.tmp6846 = getelementptr [28 x i8], [28 x i8]*@.str6845, i32 0, i32 0
%.tmp6847 = load i32, i32* %tmp_id.6841
%.tmp6848 = load i8*, i8** %base_type.6838
%.tmp6849 = load i8*, i8** %base_type.6838
%.tmp6850 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base.6754
%.tmp6851 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp6850)
%.tmp6852 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6844, i8* %.tmp6846, i32 %.tmp6847, i8* %.tmp6848, i8* %.tmp6849, i8* %.tmp6851)
%.tmp6853 = load %m812$.Node.type*, %m812$.Node.type** %curr_node.6612
%.tmp6854 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp6853)
%new_base.6855 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp6854, %m2437$.AssignableInfo.type** %new_base.6855
%.tmp6856 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6857 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6855
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp6856, %m2437$.AssignableInfo.type* %.tmp6857)
%.tmp6858 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base.6754
%.tmp6859 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6858, i32 0, i32 4
%.tmp6860 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6859
%.tmp6861 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6860, i32 0, i32 3
%.tmp6862 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6861
%.tmp6863 = icmp eq %m2437$.Type.type* %.tmp6862, null
br i1 %.tmp6863, label %.if.true.6864, label %.if.false.6864
.if.true.6864:
%.tmp6865 = getelementptr i8*, i8** %err_msg.6610, i32 0
%.tmp6867 = getelementptr [35 x i8], [35 x i8]*@.str6866, i32 0, i32 0
%.tmp6868 = load i8*, i8** %base_type.6838
%.tmp6869 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6865, i8* %.tmp6867, i8* %.tmp6868)
%.tmp6870 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6871 = load %m812$.Node.type*, %m812$.Node.type** %addr.6761
%.tmp6872 = load i8*, i8** %err_msg.6610
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp6870, %m812$.Node.type* %.tmp6871, i8* %.tmp6872)
%.tmp6873 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base.6754
ret %m2437$.AssignableInfo.type* %.tmp6873
br label %.if.end.6864
.if.false.6864:
br label %.if.end.6864
.if.end.6864:
%.tmp6874 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6855
%.tmp6875 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6874, i32 0, i32 4
%.tmp6876 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base.6754
%.tmp6877 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6876, i32 0, i32 4
%.tmp6878 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6877
%.tmp6879 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6878, i32 0, i32 3
%.tmp6880 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6879
store %m2437$.Type.type* %.tmp6880, %m2437$.Type.type** %.tmp6875
%.tmp6881 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6882 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6855
%.tmp6883 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6882, i32 0, i32 4
%.tmp6884 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6883
%.tmp6885 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp6881, %m2437$.Type.type* %.tmp6884)
%base_type_2.6886 = alloca i8*
store i8* %.tmp6885, i8** %base_type_2.6886
%.tmp6887 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6888 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp6887, i32 0, i32 1
%.tmp6889 = load %m0$.File.type*, %m0$.File.type** %.tmp6888
%.tmp6891 = getelementptr [44 x i8], [44 x i8]*@.str6890, i32 0, i32 0
%.tmp6892 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6855
%.tmp6893 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp6892)
%.tmp6894 = load i8*, i8** %base_type_2.6886
%.tmp6895 = load i8*, i8** %base_type_2.6886
%.tmp6896 = load i32, i32* %tmp_id.6841
%.tmp6897 = load i8*, i8** %index_type.6777
%.tmp6898 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %index_info.6771
%.tmp6899 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp6898)
%.tmp6900 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6889, i8* %.tmp6891, i8* %.tmp6893, i8* %.tmp6894, i8* %.tmp6895, i32 %.tmp6896, i8* %.tmp6897, i8* %.tmp6899)
%.tmp6901 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %new_base.6855
store %m2437$.AssignableInfo.type* %.tmp6901, %m2437$.AssignableInfo.type** %base.6754
%.tmp6902 = load %m812$.Node.type*, %m812$.Node.type** %addr.6761
%.tmp6903 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6902, i32 0, i32 7
%.tmp6904 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6903
%.tmp6905 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6904, i32 0, i32 7
%.tmp6906 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6905
%.tmp6907 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6906, i32 0, i32 7
%.tmp6908 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6907
store %m812$.Node.type* %.tmp6908, %m812$.Node.type** %addr.6761
br label %.for.start.6755
.for.end.6755:
%.tmp6909 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %base.6754
ret %m2437$.AssignableInfo.type* %.tmp6909
}
%m229$.StackHead.type = type {%m2192$.SYStack.type*}
define %m2437$.AssignableInfo.type* @m229$compile_assignable.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%curr_node = alloca %m812$.Node.type*
store %m812$.Node.type* %.curr_node.arg, %m812$.Node.type** %curr_node
%.tmp6910 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp6911 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6910, i32 0, i32 6
%.tmp6912 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6911
%.tmp6914 = getelementptr [16 x i8], [16 x i8]*@.str6913, i32 0, i32 0
%.tmp6915 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp6912, i8* %.tmp6914)
%assignable_start.6916 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp6915, %m812$.Node.type** %assignable_start.6916
%.tmp6917 = load %m812$.Node.type*, %m812$.Node.type** %assignable_start.6916
%.tmp6918 = call %m2192$.SYStack.type*(%m812$.Node.type*) @m2192$sy_algorithm.m2192$.SYStack.typep.m812$.Node.typep(%m812$.Node.type* %.tmp6917)
%operator_stack.6919 = alloca %m2192$.SYStack.type*
store %m2192$.SYStack.type* %.tmp6918, %m2192$.SYStack.type** %operator_stack.6919
%.tmp6920 = getelementptr %m229$.StackHead.type, %m229$.StackHead.type* null, i32 1
%.tmp6921 = ptrtoint %m229$.StackHead.type* %.tmp6920 to i32
%.tmp6922 = call i8*(i32) @malloc(i32 %.tmp6921)
%.tmp6923 = bitcast i8* %.tmp6922 to %m229$.StackHead.type*
%stack.6924 = alloca %m229$.StackHead.type*
store %m229$.StackHead.type* %.tmp6923, %m229$.StackHead.type** %stack.6924
%.tmp6925 = load %m229$.StackHead.type*, %m229$.StackHead.type** %stack.6924
%.tmp6926 = getelementptr %m229$.StackHead.type, %m229$.StackHead.type* %.tmp6925, i32 0, i32 0
%.tmp6927 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %operator_stack.6919
store %m2192$.SYStack.type* %.tmp6927, %m2192$.SYStack.type** %.tmp6926
%.tmp6928 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6929 = load %m229$.StackHead.type*, %m229$.StackHead.type** %stack.6924
%.tmp6930 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m229$.StackHead.type*) @m229$compile_assignable_stack.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m229$.StackHead.typep(%m2437$.CompilerCtx.type* %.tmp6928, %m229$.StackHead.type* %.tmp6929)
%info.6931 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp6930, %m2437$.AssignableInfo.type** %info.6931
%.tmp6932 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6931
%.tmp6933 = icmp eq %m2437$.AssignableInfo.type* %.tmp6932, null
br i1 %.tmp6933, label %.if.true.6934, label %.if.false.6934
.if.true.6934:
%.tmp6935 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6931
ret %m2437$.AssignableInfo.type* %.tmp6935
br label %.if.end.6934
.if.false.6934:
br label %.if.end.6934
.if.end.6934:
%.tmp6936 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp6937 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6936, i32 0, i32 6
%.tmp6938 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6937
%.tmp6940 = getelementptr [5 x i8], [5 x i8]*@.str6939, i32 0, i32 0
%.tmp6941 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp6938, i8* %.tmp6940)
%cast.6942 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp6941, %m812$.Node.type** %cast.6942
%.tmp6943 = load %m812$.Node.type*, %m812$.Node.type** %cast.6942
%.tmp6944 = icmp ne %m812$.Node.type* %.tmp6943, null
br i1 %.tmp6944, label %.if.true.6945, label %.if.false.6945
.if.true.6945:
%.tmp6946 = load %m812$.Node.type*, %m812$.Node.type** %cast.6942
%.tmp6947 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6946, i32 0, i32 6
%.tmp6948 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6947
%.tmp6950 = getelementptr [5 x i8], [5 x i8]*@.str6949, i32 0, i32 0
%.tmp6951 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp6948, i8* %.tmp6950)
%cast_type.6952 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp6951, %m812$.Node.type** %cast_type.6952
%.tmp6953 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6954 = load %m812$.Node.type*, %m812$.Node.type** %cast_type.6952
%.tmp6955 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp6954, i32 0, i32 6
%.tmp6956 = load %m812$.Node.type*, %m812$.Node.type** %.tmp6955
%.tmp6957 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$node_to_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp6953, %m812$.Node.type* %.tmp6956)
%type.6958 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp6957, %m2437$.Type.type** %type.6958
%.tmp6959 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6931
%.tmp6960 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp6959)
%prev_id.6961 = alloca i8*
store i8* %.tmp6960, i8** %prev_id.6961
%.tmp6962 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6963 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6931
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp6962, %m2437$.AssignableInfo.type* %.tmp6963)
%.tmp6964 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6965 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6931
%.tmp6966 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6965, i32 0, i32 4
%.tmp6967 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6966
%.tmp6968 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp6964, %m2437$.Type.type* %.tmp6967)
%from_type.6969 = alloca i8*
store i8* %.tmp6968, i8** %from_type.6969
%.tmp6970 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp6971 = load %m2437$.Type.type*, %m2437$.Type.type** %type.6958
%.tmp6972 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp6970, %m2437$.Type.type* %.tmp6971)
%to_type.6973 = alloca i8*
store i8* %.tmp6972, i8** %to_type.6973
%.tmp6975 = getelementptr [8 x i8], [8 x i8]*@.str6974, i32 0, i32 0
%cast_fn.6976 = alloca i8*
store i8* %.tmp6975, i8** %cast_fn.6976
%.tmp6977 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6931
%.tmp6978 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6977, i32 0, i32 4
%.tmp6979 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6978
%.tmp6980 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6979, i32 0, i32 1
%.tmp6981 = load i8*, i8** %.tmp6980
%.tmp6982 = icmp ne i8* %.tmp6981, null
br i1 %.tmp6982, label %.if.true.6983, label %.if.false.6983
.if.true.6983:
%.tmp6984 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6931
%.tmp6985 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6984, i32 0, i32 4
%.tmp6986 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6985
%.tmp6987 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6986, i32 0, i32 1
%.tmp6988 = load i8*, i8** %.tmp6987
%.tmp6990 = getelementptr [6 x i8], [6 x i8]*@.str6989, i32 0, i32 0
%.tmp6991 = call i32(i8*,i8*) @strcmp(i8* %.tmp6988, i8* %.tmp6990)
%.tmp6992 = icmp eq i32 %.tmp6991, 0
br i1 %.tmp6992, label %.if.true.6993, label %.if.false.6993
.if.true.6993:
%.tmp6995 = getelementptr [48 x i8], [48 x i8]*@.str6994, i32 0, i32 0
%.tmp6996 = call i32(i8*,...) @printf(i8* %.tmp6995)
br label %.if.end.6993
.if.false.6993:
br label %.if.end.6993
.if.end.6993:
br label %.if.end.6983
.if.false.6983:
br label %.if.end.6983
.if.end.6983:
%.tmp6997 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6931
%.tmp6998 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp6997, i32 0, i32 4
%.tmp6999 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp6998
%.tmp7000 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp6999, i32 0, i32 0
%.tmp7001 = load i8*, i8** %.tmp7000
%.tmp7003 = getelementptr [4 x i8], [4 x i8]*@.str7002, i32 0, i32 0
%.tmp7004 = call i32(i8*,i8*) @strcmp(i8* %.tmp7001, i8* %.tmp7003)
%.tmp7005 = icmp ne i32 %.tmp7004, 0
%.tmp7006 = load %m2437$.Type.type*, %m2437$.Type.type** %type.6958
%.tmp7007 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7006, i32 0, i32 0
%.tmp7008 = load i8*, i8** %.tmp7007
%.tmp7010 = getelementptr [4 x i8], [4 x i8]*@.str7009, i32 0, i32 0
%.tmp7011 = call i32(i8*,i8*) @strcmp(i8* %.tmp7008, i8* %.tmp7010)
%.tmp7012 = icmp ne i32 %.tmp7011, 0
%.tmp7013 = and i1 %.tmp7005, %.tmp7012
br i1 %.tmp7013, label %.if.true.7014, label %.if.false.7014
.if.true.7014:
%.tmp7015 = load i8*, i8** %from_type.6969
%.tmp7016 = getelementptr i8, i8* %.tmp7015, i32 0
%.tmp7017 = load i8, i8* %.tmp7016
%.tmp7018 = icmp eq i8 %.tmp7017, 105
%.tmp7019 = load i8*, i8** %to_type.6973
%.tmp7020 = getelementptr i8, i8* %.tmp7019, i32 0
%.tmp7021 = load i8, i8* %.tmp7020
%.tmp7022 = icmp eq i8 %.tmp7021, 105
%.tmp7023 = and i1 %.tmp7018, %.tmp7022
br i1 %.tmp7023, label %.if.true.7024, label %.if.false.7024
.if.true.7024:
%from_size.7025 = alloca i32
store i32 0, i32* %from_size.7025
%to_size.7026 = alloca i32
store i32 0, i32* %to_size.7026
%.tmp7027 = load i8*, i8** %from_type.6969
%.tmp7029 = getelementptr [4 x i8], [4 x i8]*@.str7028, i32 0, i32 0
%.tmp7030 = getelementptr i32, i32* %from_size.7025, i32 0
%.tmp7031 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7027, i8* %.tmp7029, i32* %.tmp7030)
%.tmp7032 = load i8*, i8** %to_type.6973
%.tmp7034 = getelementptr [4 x i8], [4 x i8]*@.str7033, i32 0, i32 0
%.tmp7035 = getelementptr i32, i32* %to_size.7026, i32 0
%.tmp7036 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7032, i8* %.tmp7034, i32* %.tmp7035)
%.tmp7037 = load i32, i32* %from_size.7025
%.tmp7038 = load i32, i32* %to_size.7026
%.tmp7039 = icmp slt i32 %.tmp7037, %.tmp7038
br i1 %.tmp7039, label %.if.true.7040, label %.if.false.7040
.if.true.7040:
%.tmp7042 = getelementptr [5 x i8], [5 x i8]*@.str7041, i32 0, i32 0
store i8* %.tmp7042, i8** %cast_fn.6976
br label %.if.end.7040
.if.false.7040:
%.tmp7044 = getelementptr [6 x i8], [6 x i8]*@.str7043, i32 0, i32 0
store i8* %.tmp7044, i8** %cast_fn.6976
br label %.if.end.7040
.if.end.7040:
br label %.if.end.7024
.if.false.7024:
br label %.if.end.7024
.if.end.7024:
br label %.if.end.7014
.if.false.7014:
br label %.if.end.7014
.if.end.7014:
%.tmp7045 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7046 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp7045, i32 0, i32 1
%.tmp7047 = load %m0$.File.type*, %m0$.File.type** %.tmp7046
%.tmp7049 = getelementptr [21 x i8], [21 x i8]*@.str7048, i32 0, i32 0
%.tmp7050 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6931
%.tmp7051 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp7050)
%.tmp7052 = load i8*, i8** %cast_fn.6976
%.tmp7053 = load i8*, i8** %from_type.6969
%.tmp7054 = load i8*, i8** %prev_id.6961
%.tmp7055 = load i8*, i8** %to_type.6973
%.tmp7056 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7047, i8* %.tmp7049, i8* %.tmp7051, i8* %.tmp7052, i8* %.tmp7053, i8* %.tmp7054, i8* %.tmp7055)
%.tmp7057 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6931
%.tmp7058 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7057, i32 0, i32 4
%.tmp7059 = load %m2437$.Type.type*, %m2437$.Type.type** %type.6958
store %m2437$.Type.type* %.tmp7059, %m2437$.Type.type** %.tmp7058
br label %.if.end.6945
.if.false.6945:
br label %.if.end.6945
.if.end.6945:
%.tmp7060 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.6931
ret %m2437$.AssignableInfo.type* %.tmp7060
}
define %m2437$.AssignableInfo.type* @m229$compile_assignable_stack.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m229$.StackHead.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m229$.StackHead.type* %.stack.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stack = alloca %m229$.StackHead.type*
store %m229$.StackHead.type* %.stack.arg, %m229$.StackHead.type** %stack
%.tmp7061 = load %m229$.StackHead.type*, %m229$.StackHead.type** %stack
%.tmp7062 = getelementptr %m229$.StackHead.type, %m229$.StackHead.type* %.tmp7061, i32 0, i32 0
%.tmp7063 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %.tmp7062
%.tmp7064 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp7063, i32 0, i32 0
%.tmp7065 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7064
%.tmp7066 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7065, i32 0, i32 0
%.tmp7067 = load i8*, i8** %.tmp7066
%.tmp7069 = getelementptr [16 x i8], [16 x i8]*@.str7068, i32 0, i32 0
%.tmp7070 = call i32(i8*,i8*) @strcmp(i8* %.tmp7067, i8* %.tmp7069)
%.tmp7071 = icmp eq i32 %.tmp7070, 0
br i1 %.tmp7071, label %.if.true.7072, label %.if.false.7072
.if.true.7072:
%.tmp7073 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7074 = load %m229$.StackHead.type*, %m229$.StackHead.type** %stack
%.tmp7075 = getelementptr %m229$.StackHead.type, %m229$.StackHead.type* %.tmp7074, i32 0, i32 0
%.tmp7076 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %.tmp7075
%.tmp7077 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp7076, i32 0, i32 0
%.tmp7078 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7077
%.tmp7079 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_mono_assignable.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp7073, %m812$.Node.type* %.tmp7078)
ret %m2437$.AssignableInfo.type* %.tmp7079
br label %.if.end.7072
.if.false.7072:
br label %.if.end.7072
.if.end.7072:
%.tmp7080 = load %m229$.StackHead.type*, %m229$.StackHead.type** %stack
%.tmp7081 = getelementptr %m229$.StackHead.type, %m229$.StackHead.type* %.tmp7080, i32 0, i32 0
%.tmp7082 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %.tmp7081
%.tmp7083 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp7082, i32 0, i32 0
%.tmp7084 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7083
%.tmp7085 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7084, i32 0, i32 6
%.tmp7086 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7085
%operator.7087 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp7086, %m812$.Node.type** %operator.7087
%.tmp7088 = load %m229$.StackHead.type*, %m229$.StackHead.type** %stack
%.tmp7089 = getelementptr %m229$.StackHead.type, %m229$.StackHead.type* %.tmp7088, i32 0, i32 0
%.tmp7090 = load %m229$.StackHead.type*, %m229$.StackHead.type** %stack
%.tmp7091 = getelementptr %m229$.StackHead.type, %m229$.StackHead.type* %.tmp7090, i32 0, i32 0
%.tmp7092 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %.tmp7091
%.tmp7093 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp7092, i32 0, i32 1
%.tmp7094 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %.tmp7093
store %m2192$.SYStack.type* %.tmp7094, %m2192$.SYStack.type** %.tmp7089
%.tmp7095 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7096 = load %m229$.StackHead.type*, %m229$.StackHead.type** %stack
%.tmp7097 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m229$.StackHead.type*) @m229$compile_assignable_stack.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m229$.StackHead.typep(%m2437$.CompilerCtx.type* %.tmp7095, %m229$.StackHead.type* %.tmp7096)
%A.7098 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp7097, %m2437$.AssignableInfo.type** %A.7098
%.tmp7099 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %A.7098
%.tmp7100 = icmp eq %m2437$.AssignableInfo.type* %.tmp7099, null
br i1 %.tmp7100, label %.if.true.7101, label %.if.false.7101
.if.true.7101:
%.tmp7102 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %A.7098
ret %m2437$.AssignableInfo.type* %.tmp7102
br label %.if.end.7101
.if.false.7101:
br label %.if.end.7101
.if.end.7101:
%.tmp7103 = load %m229$.StackHead.type*, %m229$.StackHead.type** %stack
%.tmp7104 = getelementptr %m229$.StackHead.type, %m229$.StackHead.type* %.tmp7103, i32 0, i32 0
%.tmp7105 = load %m229$.StackHead.type*, %m229$.StackHead.type** %stack
%.tmp7106 = getelementptr %m229$.StackHead.type, %m229$.StackHead.type* %.tmp7105, i32 0, i32 0
%.tmp7107 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %.tmp7106
%.tmp7108 = getelementptr %m2192$.SYStack.type, %m2192$.SYStack.type* %.tmp7107, i32 0, i32 1
%.tmp7109 = load %m2192$.SYStack.type*, %m2192$.SYStack.type** %.tmp7108
store %m2192$.SYStack.type* %.tmp7109, %m2192$.SYStack.type** %.tmp7104
%.tmp7110 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7111 = load %m229$.StackHead.type*, %m229$.StackHead.type** %stack
%.tmp7112 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m229$.StackHead.type*) @m229$compile_assignable_stack.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m229$.StackHead.typep(%m2437$.CompilerCtx.type* %.tmp7110, %m229$.StackHead.type* %.tmp7111)
%B.7113 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp7112, %m2437$.AssignableInfo.type** %B.7113
%.tmp7114 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %B.7113
%.tmp7115 = icmp eq %m2437$.AssignableInfo.type* %.tmp7114, null
br i1 %.tmp7115, label %.if.true.7116, label %.if.false.7116
.if.true.7116:
%.tmp7117 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %B.7113
ret %m2437$.AssignableInfo.type* %.tmp7117
br label %.if.end.7116
.if.false.7116:
br label %.if.end.7116
.if.end.7116:
%.tmp7118 = bitcast ptr null to %m812$.Node.type*
%.tmp7119 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp7118)
%op_info.7120 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp7119, %m2437$.AssignableInfo.type** %op_info.7120
%.tmp7121 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %op_info.7120
%.tmp7122 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7121, i32 0, i32 4
%.tmp7123 = load %m812$.Node.type*, %m812$.Node.type** %operator.7087
%.tmp7124 = call %m2437$.Type.type*(%m812$.Node.type*) @m229$operator_type.m2437$.Type.typep.m812$.Node.typep(%m812$.Node.type* %.tmp7123)
store %m2437$.Type.type* %.tmp7124, %m2437$.Type.type** %.tmp7122
%.tmp7125 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7126 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %op_info.7120
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp7125, %m2437$.AssignableInfo.type* %.tmp7126)
%.tmp7127 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7128 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp7127, i32 0, i32 1
%.tmp7129 = load %m0$.File.type*, %m0$.File.type** %.tmp7128
%.tmp7131 = getelementptr [19 x i8], [19 x i8]*@.str7130, i32 0, i32 0
%.tmp7132 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %op_info.7120
%.tmp7133 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp7132)
%.tmp7134 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7135 = load %m812$.Node.type*, %m812$.Node.type** %operator.7087
%.tmp7136 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$operator_op.cp.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp7134, %m812$.Node.type* %.tmp7135)
%.tmp7137 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7138 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %A.7098
%.tmp7139 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7138, i32 0, i32 4
%.tmp7140 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7139
%.tmp7141 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp7137, %m2437$.Type.type* %.tmp7140)
%.tmp7142 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %A.7098
%.tmp7143 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp7142)
%.tmp7144 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %B.7113
%.tmp7145 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp7144)
%.tmp7146 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7129, i8* %.tmp7131, i8* %.tmp7133, i8* %.tmp7136, i8* %.tmp7141, i8* %.tmp7143, i8* %.tmp7145)
%.tmp7147 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %op_info.7120
ret %m2437$.AssignableInfo.type* %.tmp7147
}
define i8* @m229$operator_op.cp.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.op.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%op = alloca %m812$.Node.type*
store %m812$.Node.type* %.op.arg, %m812$.Node.type** %op
%.tmp7148 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7149 = icmp eq %m812$.Node.type* %.tmp7148, null
br i1 %.tmp7149, label %.if.true.7150, label %.if.false.7150
.if.true.7150:
%.tmp7151 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7152 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7154 = getelementptr [31 x i8], [31 x i8]*@.str7153, i32 0, i32 0
%.tmp7155 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp7151, %m812$.Node.type* %.tmp7152, i8* %.tmp7154)
%.tmp7156 = call i32(i8*,...) @printf(i8* %.tmp7155)
br label %.if.end.7150
.if.false.7150:
br label %.if.end.7150
.if.end.7150:
%.tmp7157 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7158 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7157, i32 0, i32 1
%.tmp7159 = load i8*, i8** %.tmp7158
%.tmp7161 = getelementptr [2 x i8], [2 x i8]*@.str7160, i32 0, i32 0
%.tmp7162 = call i32(i8*,i8*) @strcmp(i8* %.tmp7159, i8* %.tmp7161)
%.tmp7163 = icmp eq i32 %.tmp7162, 0
br i1 %.tmp7163, label %.if.true.7164, label %.if.false.7164
.if.true.7164:
%.tmp7166 = getelementptr [4 x i8], [4 x i8]*@.str7165, i32 0, i32 0
ret i8* %.tmp7166
br label %.if.end.7164
.if.false.7164:
%.tmp7167 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7168 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7167, i32 0, i32 1
%.tmp7169 = load i8*, i8** %.tmp7168
%.tmp7171 = getelementptr [2 x i8], [2 x i8]*@.str7170, i32 0, i32 0
%.tmp7172 = call i32(i8*,i8*) @strcmp(i8* %.tmp7169, i8* %.tmp7171)
%.tmp7173 = icmp eq i32 %.tmp7172, 0
br i1 %.tmp7173, label %.if.true.7174, label %.if.false.7174
.if.true.7174:
%.tmp7176 = getelementptr [4 x i8], [4 x i8]*@.str7175, i32 0, i32 0
ret i8* %.tmp7176
br label %.if.end.7174
.if.false.7174:
%.tmp7177 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7178 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7177, i32 0, i32 1
%.tmp7179 = load i8*, i8** %.tmp7178
%.tmp7181 = getelementptr [2 x i8], [2 x i8]*@.str7180, i32 0, i32 0
%.tmp7182 = call i32(i8*,i8*) @strcmp(i8* %.tmp7179, i8* %.tmp7181)
%.tmp7183 = icmp eq i32 %.tmp7182, 0
br i1 %.tmp7183, label %.if.true.7184, label %.if.false.7184
.if.true.7184:
%.tmp7186 = getelementptr [4 x i8], [4 x i8]*@.str7185, i32 0, i32 0
ret i8* %.tmp7186
br label %.if.end.7184
.if.false.7184:
%.tmp7187 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7188 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7187, i32 0, i32 1
%.tmp7189 = load i8*, i8** %.tmp7188
%.tmp7191 = getelementptr [2 x i8], [2 x i8]*@.str7190, i32 0, i32 0
%.tmp7192 = call i32(i8*,i8*) @strcmp(i8* %.tmp7189, i8* %.tmp7191)
%.tmp7193 = icmp eq i32 %.tmp7192, 0
br i1 %.tmp7193, label %.if.true.7194, label %.if.false.7194
.if.true.7194:
%.tmp7196 = getelementptr [5 x i8], [5 x i8]*@.str7195, i32 0, i32 0
ret i8* %.tmp7196
br label %.if.end.7194
.if.false.7194:
%.tmp7197 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7198 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7197, i32 0, i32 1
%.tmp7199 = load i8*, i8** %.tmp7198
%.tmp7201 = getelementptr [3 x i8], [3 x i8]*@.str7200, i32 0, i32 0
%.tmp7202 = call i32(i8*,i8*) @strcmp(i8* %.tmp7199, i8* %.tmp7201)
%.tmp7203 = icmp eq i32 %.tmp7202, 0
br i1 %.tmp7203, label %.if.true.7204, label %.if.false.7204
.if.true.7204:
%.tmp7206 = getelementptr [8 x i8], [8 x i8]*@.str7205, i32 0, i32 0
ret i8* %.tmp7206
br label %.if.end.7204
.if.false.7204:
%.tmp7207 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7208 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7207, i32 0, i32 1
%.tmp7209 = load i8*, i8** %.tmp7208
%.tmp7211 = getelementptr [3 x i8], [3 x i8]*@.str7210, i32 0, i32 0
%.tmp7212 = call i32(i8*,i8*) @strcmp(i8* %.tmp7209, i8* %.tmp7211)
%.tmp7213 = icmp eq i32 %.tmp7212, 0
br i1 %.tmp7213, label %.if.true.7214, label %.if.false.7214
.if.true.7214:
%.tmp7216 = getelementptr [8 x i8], [8 x i8]*@.str7215, i32 0, i32 0
ret i8* %.tmp7216
br label %.if.end.7214
.if.false.7214:
%.tmp7217 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7218 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7217, i32 0, i32 1
%.tmp7219 = load i8*, i8** %.tmp7218
%.tmp7221 = getelementptr [2 x i8], [2 x i8]*@.str7220, i32 0, i32 0
%.tmp7222 = call i32(i8*,i8*) @strcmp(i8* %.tmp7219, i8* %.tmp7221)
%.tmp7223 = icmp eq i32 %.tmp7222, 0
br i1 %.tmp7223, label %.if.true.7224, label %.if.false.7224
.if.true.7224:
%.tmp7226 = getelementptr [9 x i8], [9 x i8]*@.str7225, i32 0, i32 0
ret i8* %.tmp7226
br label %.if.end.7224
.if.false.7224:
%.tmp7227 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7228 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7227, i32 0, i32 1
%.tmp7229 = load i8*, i8** %.tmp7228
%.tmp7231 = getelementptr [2 x i8], [2 x i8]*@.str7230, i32 0, i32 0
%.tmp7232 = call i32(i8*,i8*) @strcmp(i8* %.tmp7229, i8* %.tmp7231)
%.tmp7233 = icmp eq i32 %.tmp7232, 0
br i1 %.tmp7233, label %.if.true.7234, label %.if.false.7234
.if.true.7234:
%.tmp7236 = getelementptr [9 x i8], [9 x i8]*@.str7235, i32 0, i32 0
ret i8* %.tmp7236
br label %.if.end.7234
.if.false.7234:
%.tmp7237 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7238 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7237, i32 0, i32 1
%.tmp7239 = load i8*, i8** %.tmp7238
%.tmp7241 = getelementptr [2 x i8], [2 x i8]*@.str7240, i32 0, i32 0
%.tmp7242 = call i32(i8*,i8*) @strcmp(i8* %.tmp7239, i8* %.tmp7241)
%.tmp7243 = icmp eq i32 %.tmp7242, 0
br i1 %.tmp7243, label %.if.true.7244, label %.if.false.7244
.if.true.7244:
%.tmp7246 = getelementptr [4 x i8], [4 x i8]*@.str7245, i32 0, i32 0
ret i8* %.tmp7246
br label %.if.end.7244
.if.false.7244:
%.tmp7247 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7248 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7247, i32 0, i32 1
%.tmp7249 = load i8*, i8** %.tmp7248
%.tmp7251 = getelementptr [2 x i8], [2 x i8]*@.str7250, i32 0, i32 0
%.tmp7252 = call i32(i8*,i8*) @strcmp(i8* %.tmp7249, i8* %.tmp7251)
%.tmp7253 = icmp eq i32 %.tmp7252, 0
br i1 %.tmp7253, label %.if.true.7254, label %.if.false.7254
.if.true.7254:
%.tmp7256 = getelementptr [3 x i8], [3 x i8]*@.str7255, i32 0, i32 0
ret i8* %.tmp7256
br label %.if.end.7254
.if.false.7254:
%.tmp7257 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7258 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7257, i32 0, i32 1
%.tmp7259 = load i8*, i8** %.tmp7258
%.tmp7261 = getelementptr [3 x i8], [3 x i8]*@.str7260, i32 0, i32 0
%.tmp7262 = call i32(i8*,i8*) @strcmp(i8* %.tmp7259, i8* %.tmp7261)
%.tmp7263 = icmp eq i32 %.tmp7262, 0
br i1 %.tmp7263, label %.if.true.7264, label %.if.false.7264
.if.true.7264:
%.tmp7266 = getelementptr [9 x i8], [9 x i8]*@.str7265, i32 0, i32 0
ret i8* %.tmp7266
br label %.if.end.7264
.if.false.7264:
%.tmp7267 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7268 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7267, i32 0, i32 1
%.tmp7269 = load i8*, i8** %.tmp7268
%.tmp7271 = getelementptr [3 x i8], [3 x i8]*@.str7270, i32 0, i32 0
%.tmp7272 = call i32(i8*,i8*) @strcmp(i8* %.tmp7269, i8* %.tmp7271)
%.tmp7273 = icmp eq i32 %.tmp7272, 0
br i1 %.tmp7273, label %.if.true.7274, label %.if.false.7274
.if.true.7274:
%.tmp7276 = getelementptr [9 x i8], [9 x i8]*@.str7275, i32 0, i32 0
ret i8* %.tmp7276
br label %.if.end.7274
.if.false.7274:
%.tmp7277 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7278 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7277, i32 0, i32 1
%.tmp7279 = load i8*, i8** %.tmp7278
%.tmp7281 = getelementptr [2 x i8], [2 x i8]*@.str7280, i32 0, i32 0
%.tmp7282 = call i32(i8*,i8*) @strcmp(i8* %.tmp7279, i8* %.tmp7281)
%.tmp7283 = icmp eq i32 %.tmp7282, 0
br i1 %.tmp7283, label %.if.true.7284, label %.if.false.7284
.if.true.7284:
%.tmp7286 = getelementptr [5 x i8], [5 x i8]*@.str7285, i32 0, i32 0
ret i8* %.tmp7286
br label %.if.end.7284
.if.false.7284:
%.tmp7287 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7288 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7290 = getelementptr [30 x i8], [30 x i8]*@.str7289, i32 0, i32 0
%.tmp7291 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp7287, %m812$.Node.type* %.tmp7288, i8* %.tmp7290)
%.tmp7292 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7293 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7292, i32 0, i32 1
%.tmp7294 = load i8*, i8** %.tmp7293
%.tmp7295 = call i32(i8*,...) @printf(i8* %.tmp7291, i8* %.tmp7294)
br label %.if.end.7284
.if.end.7284:
br label %.if.end.7274
.if.end.7274:
br label %.if.end.7264
.if.end.7264:
br label %.if.end.7254
.if.end.7254:
br label %.if.end.7244
.if.end.7244:
br label %.if.end.7234
.if.end.7234:
br label %.if.end.7224
.if.end.7224:
br label %.if.end.7214
.if.end.7214:
br label %.if.end.7204
.if.end.7204:
br label %.if.end.7194
.if.end.7194:
br label %.if.end.7184
.if.end.7184:
br label %.if.end.7174
.if.end.7174:
br label %.if.end.7164
.if.end.7164:
%.tmp7297 = getelementptr [4 x i8], [4 x i8]*@.str7296, i32 0, i32 0
ret i8* %.tmp7297
}
define %m2437$.Type.type* @m229$operator_type.m2437$.Type.typep.m812$.Node.typep(%m812$.Node.type* %.op.arg) {
%op = alloca %m812$.Node.type*
store %m812$.Node.type* %.op.arg, %m812$.Node.type** %op
%.tmp7298 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
%type.7299 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp7298, %m2437$.Type.type** %type.7299
%.tmp7300 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7301 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7300, i32 0, i32 1
%.tmp7302 = load i8*, i8** %.tmp7301
%.tmp7304 = getelementptr [3 x i8], [3 x i8]*@.str7303, i32 0, i32 0
%.tmp7305 = call i32(i8*,i8*) @strcmp(i8* %.tmp7302, i8* %.tmp7304)
%.tmp7306 = icmp eq i32 %.tmp7305, 0
%.tmp7307 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7308 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7307, i32 0, i32 1
%.tmp7309 = load i8*, i8** %.tmp7308
%.tmp7311 = getelementptr [3 x i8], [3 x i8]*@.str7310, i32 0, i32 0
%.tmp7312 = call i32(i8*,i8*) @strcmp(i8* %.tmp7309, i8* %.tmp7311)
%.tmp7313 = icmp eq i32 %.tmp7312, 0
%.tmp7314 = or i1 %.tmp7306, %.tmp7313
%.tmp7315 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7316 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7315, i32 0, i32 1
%.tmp7317 = load i8*, i8** %.tmp7316
%.tmp7319 = getelementptr [2 x i8], [2 x i8]*@.str7318, i32 0, i32 0
%.tmp7320 = call i32(i8*,i8*) @strcmp(i8* %.tmp7317, i8* %.tmp7319)
%.tmp7321 = icmp eq i32 %.tmp7320, 0
%.tmp7322 = or i1 %.tmp7314, %.tmp7321
%.tmp7323 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7324 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7323, i32 0, i32 1
%.tmp7325 = load i8*, i8** %.tmp7324
%.tmp7327 = getelementptr [2 x i8], [2 x i8]*@.str7326, i32 0, i32 0
%.tmp7328 = call i32(i8*,i8*) @strcmp(i8* %.tmp7325, i8* %.tmp7327)
%.tmp7329 = icmp eq i32 %.tmp7328, 0
%.tmp7330 = or i1 %.tmp7322, %.tmp7329
%.tmp7331 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7332 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7331, i32 0, i32 1
%.tmp7333 = load i8*, i8** %.tmp7332
%.tmp7335 = getelementptr [2 x i8], [2 x i8]*@.str7334, i32 0, i32 0
%.tmp7336 = call i32(i8*,i8*) @strcmp(i8* %.tmp7333, i8* %.tmp7335)
%.tmp7337 = icmp eq i32 %.tmp7336, 0
%.tmp7338 = or i1 %.tmp7330, %.tmp7337
%.tmp7339 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7340 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7339, i32 0, i32 1
%.tmp7341 = load i8*, i8** %.tmp7340
%.tmp7343 = getelementptr [2 x i8], [2 x i8]*@.str7342, i32 0, i32 0
%.tmp7344 = call i32(i8*,i8*) @strcmp(i8* %.tmp7341, i8* %.tmp7343)
%.tmp7345 = icmp eq i32 %.tmp7344, 0
%.tmp7346 = or i1 %.tmp7338, %.tmp7345
%.tmp7347 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7348 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7347, i32 0, i32 1
%.tmp7349 = load i8*, i8** %.tmp7348
%.tmp7351 = getelementptr [3 x i8], [3 x i8]*@.str7350, i32 0, i32 0
%.tmp7352 = call i32(i8*,i8*) @strcmp(i8* %.tmp7349, i8* %.tmp7351)
%.tmp7353 = icmp eq i32 %.tmp7352, 0
%.tmp7354 = or i1 %.tmp7346, %.tmp7353
%.tmp7355 = load %m812$.Node.type*, %m812$.Node.type** %op
%.tmp7356 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7355, i32 0, i32 1
%.tmp7357 = load i8*, i8** %.tmp7356
%.tmp7359 = getelementptr [3 x i8], [3 x i8]*@.str7358, i32 0, i32 0
%.tmp7360 = call i32(i8*,i8*) @strcmp(i8* %.tmp7357, i8* %.tmp7359)
%.tmp7361 = icmp eq i32 %.tmp7360, 0
%.tmp7362 = or i1 %.tmp7354, %.tmp7361
br i1 %.tmp7362, label %.if.true.7363, label %.if.false.7363
.if.true.7363:
%.tmp7364 = load %m2437$.Type.type*, %m2437$.Type.type** %type.7299
%.tmp7365 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7364, i32 0, i32 0
%.tmp7367 = getelementptr [5 x i8], [5 x i8]*@.str7366, i32 0, i32 0
store i8* %.tmp7367, i8** %.tmp7365
br label %.if.end.7363
.if.false.7363:
%.tmp7368 = load %m2437$.Type.type*, %m2437$.Type.type** %type.7299
%.tmp7369 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7368, i32 0, i32 0
%.tmp7371 = getelementptr [4 x i8], [4 x i8]*@.str7370, i32 0, i32 0
store i8* %.tmp7371, i8** %.tmp7369
br label %.if.end.7363
.if.end.7363:
%.tmp7372 = load %m2437$.Type.type*, %m2437$.Type.type** %type.7299
ret %m2437$.Type.type* %.tmp7372
}
define %m2437$.AssignableInfo.type* @m229$compile_mono_assignable.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%curr_node = alloca %m812$.Node.type*
store %m812$.Node.type* %.curr_node.arg, %m812$.Node.type** %curr_node
%.tmp7373 = bitcast ptr null to %m2437$.AssignableInfo.type*
%assignable_info.7374 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp7373, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7375 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%mono.7376 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp7375, %m812$.Node.type** %mono.7376
%err_buf.7377 = alloca i8*
store i8* null, i8** %err_buf.7377
%buf.7378 = alloca i8*
store i8* null, i8** %buf.7378
%.tmp7379 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7380 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7379, i32 0, i32 6
%.tmp7381 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7380
%.tmp7382 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7381, i32 0, i32 0
%.tmp7383 = load i8*, i8** %.tmp7382
%.tmp7385 = getelementptr [7 x i8], [7 x i8]*@.str7384, i32 0, i32 0
%.tmp7386 = call i32(i8*,i8*) @strcmp(i8* %.tmp7383, i8* %.tmp7385)
%.tmp7387 = icmp eq i32 %.tmp7386, 0
br i1 %.tmp7387, label %.if.true.7388, label %.if.false.7388
.if.true.7388:
%.tmp7389 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp7390 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp7389)
store %m2437$.AssignableInfo.type* %.tmp7390, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7391 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7392 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7391, i32 0, i32 4
%.tmp7393 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp7393, %m2437$.Type.type** %.tmp7392
%.tmp7394 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7395 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7394, i32 0, i32 4
%.tmp7396 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7395
%.tmp7397 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7396, i32 0, i32 0
%.tmp7399 = getelementptr [4 x i8], [4 x i8]*@.str7398, i32 0, i32 0
store i8* %.tmp7399, i8** %.tmp7397
%.tmp7400 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7401 = load i8, i8* @SCOPE_CONST
%.tmp7402 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7403 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7402, i32 0, i32 6
%.tmp7404 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7403
%.tmp7405 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7404, i32 0, i32 1
%.tmp7406 = load i8*, i8** %.tmp7405
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp7400, i8 %.tmp7401, i8* %.tmp7406)
br label %.if.end.7388
.if.false.7388:
%.tmp7407 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7408 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7407, i32 0, i32 6
%.tmp7409 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7408
%.tmp7410 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7409, i32 0, i32 0
%.tmp7411 = load i8*, i8** %.tmp7410
%.tmp7413 = getelementptr [5 x i8], [5 x i8]*@.str7412, i32 0, i32 0
%.tmp7414 = call i32(i8*,i8*) @strcmp(i8* %.tmp7411, i8* %.tmp7413)
%.tmp7415 = icmp eq i32 %.tmp7414, 0
br i1 %.tmp7415, label %.if.true.7416, label %.if.false.7416
.if.true.7416:
%.tmp7417 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7418 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7417, i32 0, i32 6
%.tmp7419 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7418
%.tmp7420 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7419, i32 0, i32 1
%.tmp7421 = load i8*, i8** %.tmp7420
%.tmp7423 = getelementptr [5 x i8], [5 x i8]*@.str7422, i32 0, i32 0
%.tmp7424 = call i32(i8*,i8*) @strcmp(i8* %.tmp7421, i8* %.tmp7423)
%.tmp7425 = icmp ne i32 %.tmp7424, 0
br i1 %.tmp7425, label %.if.true.7426, label %.if.false.7426
.if.true.7426:
%.tmp7427 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7428 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp7430 = getelementptr [42 x i8], [42 x i8]*@.str7429, i32 0, i32 0
%.tmp7431 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp7427, %m812$.Node.type* %.tmp7428, i8* %.tmp7430)
%.tmp7432 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7433 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7432, i32 0, i32 6
%.tmp7434 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7433
%.tmp7435 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7434, i32 0, i32 1
%.tmp7436 = load i8*, i8** %.tmp7435
%.tmp7437 = call i32(i8*,...) @printf(i8* %.tmp7431, i8* %.tmp7436)
%.tmp7438 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp7438
br label %.if.end.7426
.if.false.7426:
br label %.if.end.7426
.if.end.7426:
%.tmp7439 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp7440 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp7439)
store %m2437$.AssignableInfo.type* %.tmp7440, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7441 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7442 = load i8, i8* @SCOPE_CONST
%.tmp7444 = getelementptr [5 x i8], [5 x i8]*@.str7443, i32 0, i32 0
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp7441, i8 %.tmp7442, i8* %.tmp7444)
%.tmp7445 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7446 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7445, i32 0, i32 4
%.tmp7447 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp7447, %m2437$.Type.type** %.tmp7446
%.tmp7448 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7449 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7448, i32 0, i32 4
%.tmp7450 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7449
%.tmp7451 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7450, i32 0, i32 0
%.tmp7453 = getelementptr [8 x i8], [8 x i8]*@.str7452, i32 0, i32 0
store i8* %.tmp7453, i8** %.tmp7451
br label %.if.end.7416
.if.false.7416:
%.tmp7454 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7455 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7454, i32 0, i32 6
%.tmp7456 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7455
%.tmp7457 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7456, i32 0, i32 0
%.tmp7458 = load i8*, i8** %.tmp7457
%.tmp7460 = getelementptr [17 x i8], [17 x i8]*@.str7459, i32 0, i32 0
%.tmp7461 = call i32(i8*,i8*) @strcmp(i8* %.tmp7458, i8* %.tmp7460)
%.tmp7462 = icmp eq i32 %.tmp7461, 0
br i1 %.tmp7462, label %.if.true.7463, label %.if.false.7463
.if.true.7463:
%.tmp7464 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp7465 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp7464)
store %m2437$.AssignableInfo.type* %.tmp7465, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7466 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7467 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7466, i32 0, i32 6
%.tmp7468 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7467
%.tmp7469 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7468, i32 0, i32 6
%.tmp7470 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7469
%.tmp7472 = getelementptr [12 x i8], [12 x i8]*@.str7471, i32 0, i32 0
%.tmp7473 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp7470, i8* %.tmp7472)
%dest.7474 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp7473, %m812$.Node.type** %dest.7474
%.tmp7475 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7476 = load %m812$.Node.type*, %m812$.Node.type** %dest.7474
%.tmp7477 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_addr.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp7475, %m812$.Node.type* %.tmp7476)
%var_info.7478 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp7477, %m2437$.AssignableInfo.type** %var_info.7478
%.tmp7479 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %var_info.7478
%.tmp7480 = icmp eq %m2437$.AssignableInfo.type* %.tmp7479, null
br i1 %.tmp7480, label %.if.true.7481, label %.if.false.7481
.if.true.7481:
%.tmp7482 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
ret %m2437$.AssignableInfo.type* %.tmp7482
br label %.if.end.7481
.if.false.7481:
br label %.if.end.7481
.if.end.7481:
%.tmp7483 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7484 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %var_info.7478
%.tmp7485 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7484, i32 0, i32 4
%.tmp7486 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7485
%.tmp7487 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp7483, %m2437$.Type.type* %.tmp7486)
%var_type_repr.7488 = alloca i8*
store i8* %.tmp7487, i8** %var_type_repr.7488
%.tmp7489 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7490 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp7489, %m2437$.AssignableInfo.type* %.tmp7490)
%.tmp7491 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7492 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7491, i32 0, i32 4
%.tmp7493 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %var_info.7478
%.tmp7494 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7493, i32 0, i32 4
%.tmp7495 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7494
store %m2437$.Type.type* %.tmp7495, %m2437$.Type.type** %.tmp7492
%.tmp7497 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7498 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7497, i32 0, i32 6
%.tmp7499 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7498
%.tmp7500 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7499, i32 0, i32 6
%.tmp7501 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7500
%ptr.7502 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp7501, %m812$.Node.type** %ptr.7502
br label %.for.start.7496
.for.start.7496:
%.tmp7503 = load %m812$.Node.type*, %m812$.Node.type** %ptr.7502
%.tmp7504 = load %m812$.Node.type*, %m812$.Node.type** %dest.7474
%.tmp7505 = icmp ne %m812$.Node.type* %.tmp7503, %.tmp7504
br i1 %.tmp7505, label %.for.continue.7496, label %.for.end.7496
.for.continue.7496:
%.tmp7506 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
%type.7507 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp7506, %m2437$.Type.type** %type.7507
%.tmp7508 = load %m2437$.Type.type*, %m2437$.Type.type** %type.7507
%.tmp7509 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7508, i32 0, i32 3
%.tmp7510 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7511 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7510, i32 0, i32 4
%.tmp7512 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7511
store %m2437$.Type.type* %.tmp7512, %m2437$.Type.type** %.tmp7509
%.tmp7513 = load %m2437$.Type.type*, %m2437$.Type.type** %type.7507
%.tmp7514 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7513, i32 0, i32 0
%.tmp7516 = getelementptr [4 x i8], [4 x i8]*@.str7515, i32 0, i32 0
store i8* %.tmp7516, i8** %.tmp7514
%.tmp7517 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7518 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7517, i32 0, i32 4
%.tmp7519 = load %m2437$.Type.type*, %m2437$.Type.type** %type.7507
store %m2437$.Type.type* %.tmp7519, %m2437$.Type.type** %.tmp7518
%.tmp7520 = load %m812$.Node.type*, %m812$.Node.type** %ptr.7502
%.tmp7521 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7520, i32 0, i32 7
%.tmp7522 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7521
store %m812$.Node.type* %.tmp7522, %m812$.Node.type** %ptr.7502
br label %.for.start.7496
.for.end.7496:
%.tmp7523 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7524 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7523, i32 0, i32 6
%.tmp7525 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7524
%.tmp7526 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7525, i32 0, i32 6
%.tmp7527 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7526
%.tmp7528 = load %m812$.Node.type*, %m812$.Node.type** %dest.7474
%.tmp7529 = icmp ne %m812$.Node.type* %.tmp7527, %.tmp7528
br i1 %.tmp7529, label %.if.true.7530, label %.if.false.7530
.if.true.7530:
%.tmp7531 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7532 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp7531, i32 0, i32 1
%.tmp7533 = load %m0$.File.type*, %m0$.File.type** %.tmp7532
%.tmp7535 = getelementptr [38 x i8], [38 x i8]*@.str7534, i32 0, i32 0
%.tmp7536 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7537 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp7536)
%.tmp7538 = load i8*, i8** %var_type_repr.7488
%.tmp7539 = load i8*, i8** %var_type_repr.7488
%.tmp7540 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %var_info.7478
%.tmp7541 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp7540)
%.tmp7542 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7533, i8* %.tmp7535, i8* %.tmp7537, i8* %.tmp7538, i8* %.tmp7539, i8* %.tmp7541)
br label %.if.end.7530
.if.false.7530:
%.tmp7543 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7544 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp7543, i32 0, i32 1
%.tmp7545 = load %m0$.File.type*, %m0$.File.type** %.tmp7544
%.tmp7547 = getelementptr [22 x i8], [22 x i8]*@.str7546, i32 0, i32 0
%.tmp7548 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7549 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp7548)
%.tmp7550 = load i8*, i8** %var_type_repr.7488
%.tmp7551 = load i8*, i8** %var_type_repr.7488
%.tmp7552 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %var_info.7478
%.tmp7553 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp7552)
%.tmp7554 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7545, i8* %.tmp7547, i8* %.tmp7549, i8* %.tmp7550, i8* %.tmp7551, i8* %.tmp7553)
br label %.if.end.7530
.if.end.7530:
br label %.if.end.7463
.if.false.7463:
%.tmp7555 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7556 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7555, i32 0, i32 6
%.tmp7557 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7556
%.tmp7558 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7557, i32 0, i32 0
%.tmp7559 = load i8*, i8** %.tmp7558
%.tmp7561 = getelementptr [8 x i8], [8 x i8]*@.str7560, i32 0, i32 0
%.tmp7562 = call i32(i8*,i8*) @strcmp(i8* %.tmp7559, i8* %.tmp7561)
%.tmp7563 = icmp eq i32 %.tmp7562, 0
br i1 %.tmp7563, label %.if.true.7564, label %.if.false.7564
.if.true.7564:
%.tmp7565 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp7566 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp7565)
store %m2437$.AssignableInfo.type* %.tmp7566, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7567 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7568 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7567, i32 0, i32 4
%.tmp7569 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp7569, %m2437$.Type.type** %.tmp7568
%.tmp7570 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7571 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7570, i32 0, i32 4
%.tmp7572 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7571
%.tmp7573 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7572, i32 0, i32 0
%.tmp7575 = getelementptr [5 x i8], [5 x i8]*@.str7574, i32 0, i32 0
store i8* %.tmp7575, i8** %.tmp7573
%.tmp7576 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7577 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7576, i32 0, i32 6
%.tmp7578 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7577
%.tmp7579 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7578, i32 0, i32 6
%.tmp7580 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7579
%.tmp7581 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7580, i32 0, i32 1
%.tmp7582 = load i8*, i8** %.tmp7581
%.tmp7584 = getelementptr [6 x i8], [6 x i8]*@.str7583, i32 0, i32 0
%.tmp7585 = call i32(i8*,i8*) @strcmp(i8* %.tmp7582, i8* %.tmp7584)
%.tmp7586 = icmp eq i32 %.tmp7585, 0
br i1 %.tmp7586, label %.if.true.7587, label %.if.false.7587
.if.true.7587:
%.tmp7588 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7589 = load i8, i8* @SCOPE_CONST
%.tmp7591 = getelementptr [2 x i8], [2 x i8]*@.str7590, i32 0, i32 0
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp7588, i8 %.tmp7589, i8* %.tmp7591)
br label %.if.end.7587
.if.false.7587:
%.tmp7592 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7593 = load i8, i8* @SCOPE_CONST
%.tmp7595 = getelementptr [2 x i8], [2 x i8]*@.str7594, i32 0, i32 0
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp7592, i8 %.tmp7593, i8* %.tmp7595)
br label %.if.end.7587
.if.end.7587:
br label %.if.end.7564
.if.false.7564:
%.tmp7596 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7597 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7596, i32 0, i32 6
%.tmp7598 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7597
%.tmp7599 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7598, i32 0, i32 0
%.tmp7600 = load i8*, i8** %.tmp7599
%.tmp7602 = getelementptr [8 x i8], [8 x i8]*@.str7601, i32 0, i32 0
%.tmp7603 = call i32(i8*,i8*) @strcmp(i8* %.tmp7600, i8* %.tmp7602)
%.tmp7604 = icmp eq i32 %.tmp7603, 0
br i1 %.tmp7604, label %.if.true.7605, label %.if.false.7605
.if.true.7605:
%.tmp7606 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7607 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7608 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7607, i32 0, i32 6
%.tmp7609 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7608
%.tmp7610 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7609, i32 0, i32 6
%.tmp7611 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7610
%.tmp7612 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$compile_fn_call.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp7606, %m812$.Node.type* %.tmp7611)
store %m2437$.AssignableInfo.type* %.tmp7612, %m2437$.AssignableInfo.type** %assignable_info.7374
br label %.if.end.7605
.if.false.7605:
%.tmp7613 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7614 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7613, i32 0, i32 6
%.tmp7615 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7614
%.tmp7616 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7615, i32 0, i32 0
%.tmp7617 = load i8*, i8** %.tmp7616
%.tmp7619 = getelementptr [7 x i8], [7 x i8]*@.str7618, i32 0, i32 0
%.tmp7620 = call i32(i8*,i8*) @strcmp(i8* %.tmp7617, i8* %.tmp7619)
%.tmp7621 = icmp eq i32 %.tmp7620, 0
br i1 %.tmp7621, label %.if.true.7622, label %.if.false.7622
.if.true.7622:
%.tmp7623 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7624 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7625 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7624, i32 0, i32 6
%.tmp7626 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7625
%.tmp7627 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7626, i32 0, i32 1
%.tmp7628 = load i8*, i8** %.tmp7627
%.tmp7629 = call %m2437$.AssignableInfo.type*(%m2437$.CompilerCtx.type*,i8*) @m229$define_string.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.cp(%m2437$.CompilerCtx.type* %.tmp7623, i8* %.tmp7628)
%string_info.7630 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp7629, %m2437$.AssignableInfo.type** %string_info.7630
%.tmp7631 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp7632 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp7631)
store %m2437$.AssignableInfo.type* %.tmp7632, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7633 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7634 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
call void(%m2437$.CompilerCtx.type*,%m2437$.AssignableInfo.type*) @m229$set_assignable_tmp_id.v.m2437$.CompilerCtx.typep.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp7633, %m2437$.AssignableInfo.type* %.tmp7634)
%.tmp7635 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7636 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %string_info.7630
%.tmp7637 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7636, i32 0, i32 4
%.tmp7638 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7637
%.tmp7639 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp7635, %m2437$.Type.type* %.tmp7638)
%str_tr.7640 = alloca i8*
store i8* %.tmp7639, i8** %str_tr.7640
%.tmp7641 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7642 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp7641, i32 0, i32 1
%.tmp7643 = load %m0$.File.type*, %m0$.File.type** %.tmp7642
%.tmp7645 = getelementptr [44 x i8], [44 x i8]*@.str7644, i32 0, i32 0
%.tmp7646 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7647 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp7646)
%.tmp7648 = load i8*, i8** %str_tr.7640
%.tmp7649 = load i8*, i8** %str_tr.7640
%.tmp7650 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %string_info.7630
%.tmp7651 = call i8*(%m2437$.AssignableInfo.type*) @m229$repr_assignable_id.cp.m2437$.AssignableInfo.typep(%m2437$.AssignableInfo.type* %.tmp7650)
%.tmp7652 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7643, i8* %.tmp7645, i8* %.tmp7647, i8* %.tmp7648, i8* %.tmp7649, i8* %.tmp7651)
%.tmp7653 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7654 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7653, i32 0, i32 4
%.tmp7655 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp7655, %m2437$.Type.type** %.tmp7654
%.tmp7656 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7657 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7656, i32 0, i32 4
%.tmp7658 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7657
%.tmp7659 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7658, i32 0, i32 0
%.tmp7661 = getelementptr [4 x i8], [4 x i8]*@.str7660, i32 0, i32 0
store i8* %.tmp7661, i8** %.tmp7659
%.tmp7662 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7663 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7662, i32 0, i32 4
%.tmp7664 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7663
%.tmp7665 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7664, i32 0, i32 3
%.tmp7666 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp7666, %m2437$.Type.type** %.tmp7665
%.tmp7667 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7668 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7667, i32 0, i32 4
%.tmp7669 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7668
%.tmp7670 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7669, i32 0, i32 3
%.tmp7671 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7670
%.tmp7672 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7671, i32 0, i32 0
%.tmp7674 = getelementptr [4 x i8], [4 x i8]*@.str7673, i32 0, i32 0
store i8* %.tmp7674, i8** %.tmp7672
br label %.if.end.7622
.if.false.7622:
%.tmp7675 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7676 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7675, i32 0, i32 6
%.tmp7677 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7676
%.tmp7678 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7677, i32 0, i32 0
%.tmp7679 = load i8*, i8** %.tmp7678
%.tmp7681 = getelementptr [4 x i8], [4 x i8]*@.str7680, i32 0, i32 0
%.tmp7682 = call i32(i8*,i8*) @strcmp(i8* %.tmp7679, i8* %.tmp7681)
%.tmp7683 = icmp eq i32 %.tmp7682, 0
br i1 %.tmp7683, label %.if.true.7684, label %.if.false.7684
.if.true.7684:
%.tmp7685 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp7686 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp7685)
store %m2437$.AssignableInfo.type* %.tmp7686, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7687 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7688 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7687, i32 0, i32 6
%.tmp7689 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7688
%.tmp7690 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7689, i32 0, i32 1
%.tmp7691 = load i8*, i8** %.tmp7690
%.tmp7692 = call i32(i8*) @strlen(i8* %.tmp7691)
%chr_len.7693 = alloca i32
store i32 %.tmp7692, i32* %chr_len.7693
%.tmp7694 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7695 = load i8, i8* @SCOPE_CONST
%.tmp7697 = getelementptr [2 x i8], [2 x i8]*@.str7696, i32 0, i32 0
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp7694, i8 %.tmp7695, i8* %.tmp7697)
%.tmp7698 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7699 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7698, i32 0, i32 0
%.tmp7700 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7701 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7700, i32 0, i32 6
%.tmp7702 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7701
%.tmp7703 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7702, i32 0, i32 1
%.tmp7704 = load i8*, i8** %.tmp7703
%.tmp7705 = call i8*(i8*) @m1991$chr_to_llvm.cp.cp(i8* %.tmp7704)
store i8* %.tmp7705, i8** %.tmp7699
%.tmp7706 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7707 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7706, i32 0, i32 0
%.tmp7708 = load i8*, i8** %.tmp7707
%.tmp7709 = icmp eq i8* %.tmp7708, null
br i1 %.tmp7709, label %.if.true.7710, label %.if.false.7710
.if.true.7710:
%.tmp7711 = getelementptr i8*, i8** %err_buf.7377, i32 0
%.tmp7713 = getelementptr [22 x i8], [22 x i8]*@.str7712, i32 0, i32 0
%.tmp7714 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7715 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7714, i32 0, i32 6
%.tmp7716 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7715
%.tmp7717 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7716, i32 0, i32 1
%.tmp7718 = load i8*, i8** %.tmp7717
%.tmp7719 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7711, i8* %.tmp7713, i8* %.tmp7718)
%.tmp7720 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp7720
br label %.if.end.7710
.if.false.7710:
br label %.if.end.7710
.if.end.7710:
%.tmp7721 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7722 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7721, i32 0, i32 4
%.tmp7723 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp7723, %m2437$.Type.type** %.tmp7722
%.tmp7724 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7725 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7724, i32 0, i32 4
%.tmp7726 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7725
%.tmp7727 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7726, i32 0, i32 0
%.tmp7729 = getelementptr [4 x i8], [4 x i8]*@.str7728, i32 0, i32 0
store i8* %.tmp7729, i8** %.tmp7727
br label %.if.end.7684
.if.false.7684:
%.tmp7730 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7731 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7733 = getelementptr [40 x i8], [40 x i8]*@.str7732, i32 0, i32 0
%.tmp7734 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp7730, %m812$.Node.type* %.tmp7731, i8* %.tmp7733)
%.tmp7735 = load %m812$.Node.type*, %m812$.Node.type** %mono.7376
%.tmp7736 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7735, i32 0, i32 6
%.tmp7737 = load %m812$.Node.type*, %m812$.Node.type** %.tmp7736
%.tmp7738 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7737, i32 0, i32 0
%.tmp7739 = load i8*, i8** %.tmp7738
%.tmp7740 = call i32(i8*,...) @printf(i8* %.tmp7734, i8* %.tmp7739)
%.tmp7741 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp7741
br label %.if.end.7684
.if.end.7684:
br label %.if.end.7622
.if.end.7622:
br label %.if.end.7605
.if.end.7605:
br label %.if.end.7564
.if.end.7564:
br label %.if.end.7463
.if.end.7463:
br label %.if.end.7416
.if.end.7416:
br label %.if.end.7388
.if.end.7388:
%.tmp7742 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7743 = icmp eq %m2437$.AssignableInfo.type* %.tmp7742, null
br i1 %.tmp7743, label %.if.true.7744, label %.if.false.7744
.if.true.7744:
%.tmp7745 = bitcast ptr null to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp7745
br label %.if.end.7744
.if.false.7744:
br label %.if.end.7744
.if.end.7744:
%.tmp7746 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7747 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7746, i32 0, i32 5
%.tmp7748 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp7749 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7748, i32 0, i32 3
%.tmp7750 = load i32, i32* %.tmp7749
store i32 %.tmp7750, i32* %.tmp7747
%.tmp7751 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7752 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7751, i32 0, i32 6
%.tmp7753 = load %m812$.Node.type*, %m812$.Node.type** %curr_node
%.tmp7754 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp7753, i32 0, i32 4
%.tmp7755 = load i32, i32* %.tmp7754
store i32 %.tmp7755, i32* %.tmp7752
%.tmp7756 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %assignable_info.7374
%.tmp7757 = bitcast %m2437$.AssignableInfo.type* %.tmp7756 to %m2437$.AssignableInfo.type*
ret %m2437$.AssignableInfo.type* %.tmp7757
}
define i8* @m229$type_abbr.cp.m2437$.Type.typep(%m2437$.Type.type* %.type.arg) {
%type = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.type.arg, %m2437$.Type.type** %type
%.tmp7758 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7759 = icmp ne %m2437$.Type.type* %.tmp7758, null
%.tmp7761 = getelementptr [22 x i8], [22 x i8]*@.str7760, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7759, i8* %.tmp7761)
%.tmp7762 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7763 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7762, i32 0, i32 0
%.tmp7764 = load i8*, i8** %.tmp7763
%.tmp7765 = icmp ne i8* %.tmp7764, null
%.tmp7767 = getelementptr [59 x i8], [59 x i8]*@.str7766, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7765, i8* %.tmp7767)
%.tmp7768 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7769 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7768, i32 0, i32 0
%.tmp7770 = load i8*, i8** %.tmp7769
%.tmp7772 = getelementptr [4 x i8], [4 x i8]*@.str7771, i32 0, i32 0
%.tmp7773 = call i32(i8*,i8*) @strcmp(i8* %.tmp7770, i8* %.tmp7772)
%.tmp7774 = icmp eq i32 %.tmp7773, 0
br i1 %.tmp7774, label %.if.true.7775, label %.if.false.7775
.if.true.7775:
%.tmp7777 = getelementptr [2 x i8], [2 x i8]*@.str7776, i32 0, i32 0
ret i8* %.tmp7777
br label %.if.end.7775
.if.false.7775:
%.tmp7778 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7779 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7778, i32 0, i32 0
%.tmp7780 = load i8*, i8** %.tmp7779
%.tmp7782 = getelementptr [5 x i8], [5 x i8]*@.str7781, i32 0, i32 0
%.tmp7783 = call i32(i8*,i8*) @strcmp(i8* %.tmp7780, i8* %.tmp7782)
%.tmp7784 = icmp eq i32 %.tmp7783, 0
br i1 %.tmp7784, label %.if.true.7785, label %.if.false.7785
.if.true.7785:
%.tmp7787 = getelementptr [2 x i8], [2 x i8]*@.str7786, i32 0, i32 0
ret i8* %.tmp7787
br label %.if.end.7785
.if.false.7785:
%.tmp7788 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7789 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7788, i32 0, i32 0
%.tmp7790 = load i8*, i8** %.tmp7789
%.tmp7792 = getelementptr [5 x i8], [5 x i8]*@.str7791, i32 0, i32 0
%.tmp7793 = call i32(i8*,i8*) @strcmp(i8* %.tmp7790, i8* %.tmp7792)
%.tmp7794 = icmp eq i32 %.tmp7793, 0
br i1 %.tmp7794, label %.if.true.7795, label %.if.false.7795
.if.true.7795:
%.tmp7797 = getelementptr [2 x i8], [2 x i8]*@.str7796, i32 0, i32 0
ret i8* %.tmp7797
br label %.if.end.7795
.if.false.7795:
%.tmp7798 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7799 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7798, i32 0, i32 0
%.tmp7800 = load i8*, i8** %.tmp7799
%.tmp7802 = getelementptr [4 x i8], [4 x i8]*@.str7801, i32 0, i32 0
%.tmp7803 = call i32(i8*,i8*) @strcmp(i8* %.tmp7800, i8* %.tmp7802)
%.tmp7804 = icmp eq i32 %.tmp7803, 0
br i1 %.tmp7804, label %.if.true.7805, label %.if.false.7805
.if.true.7805:
%.tmp7807 = getelementptr [2 x i8], [2 x i8]*@.str7806, i32 0, i32 0
ret i8* %.tmp7807
br label %.if.end.7805
.if.false.7805:
%.tmp7808 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7809 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7808, i32 0, i32 0
%.tmp7810 = load i8*, i8** %.tmp7809
%.tmp7812 = getelementptr [4 x i8], [4 x i8]*@.str7811, i32 0, i32 0
%.tmp7813 = call i32(i8*,i8*) @strcmp(i8* %.tmp7810, i8* %.tmp7812)
%.tmp7814 = icmp eq i32 %.tmp7813, 0
br i1 %.tmp7814, label %.if.true.7815, label %.if.false.7815
.if.true.7815:
%buf.7816 = alloca i8*
store i8* null, i8** %buf.7816
%.tmp7817 = getelementptr i8*, i8** %buf.7816, i32 0
%.tmp7819 = getelementptr [4 x i8], [4 x i8]*@.str7818, i32 0, i32 0
%.tmp7820 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7821 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7820, i32 0, i32 3
%.tmp7822 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7821
%.tmp7823 = call i8*(%m2437$.Type.type*) @m229$type_abbr.cp.m2437$.Type.typep(%m2437$.Type.type* %.tmp7822)
%.tmp7824 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7817, i8* %.tmp7819, i8* %.tmp7823)
%.tmp7825 = load i8*, i8** %buf.7816
ret i8* %.tmp7825
br label %.if.end.7815
.if.false.7815:
%.tmp7826 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7827 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7826, i32 0, i32 0
%.tmp7828 = load i8*, i8** %.tmp7827
%.tmp7830 = getelementptr [10 x i8], [10 x i8]*@.str7829, i32 0, i32 0
%.tmp7831 = call i32(i8*,i8*) @strcmp(i8* %.tmp7828, i8* %.tmp7830)
%.tmp7832 = icmp eq i32 %.tmp7831, 0
br i1 %.tmp7832, label %.if.true.7833, label %.if.false.7833
.if.true.7833:
%.tmp7834 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7835 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7834, i32 0, i32 2
%.tmp7836 = load i8*, i8** %.tmp7835
ret i8* %.tmp7836
br label %.if.end.7833
.if.false.7833:
%.tmp7837 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7838 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7837, i32 0, i32 0
%.tmp7839 = load i8*, i8** %.tmp7838
%.tmp7841 = getelementptr [7 x i8], [7 x i8]*@.str7840, i32 0, i32 0
%.tmp7842 = call i32(i8*,i8*) @strcmp(i8* %.tmp7839, i8* %.tmp7841)
%.tmp7843 = icmp eq i32 %.tmp7842, 0
br i1 %.tmp7843, label %.if.true.7844, label %.if.false.7844
.if.true.7844:
%.tmp7846 = getelementptr [2 x i8], [2 x i8]*@.str7845, i32 0, i32 0
%buf.7847 = alloca i8*
store i8* %.tmp7846, i8** %buf.7847
%.tmp7849 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7850 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7849, i32 0, i32 3
%.tmp7851 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7850
%t.7852 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp7851, %m2437$.Type.type** %t.7852
br label %.for.start.7848
.for.start.7848:
%.tmp7853 = load %m2437$.Type.type*, %m2437$.Type.type** %t.7852
%.tmp7854 = icmp ne %m2437$.Type.type* %.tmp7853, null
br i1 %.tmp7854, label %.for.continue.7848, label %.for.end.7848
.for.continue.7848:
%.tmp7855 = getelementptr i8*, i8** %buf.7847, i32 0
%.tmp7857 = getelementptr [5 x i8], [5 x i8]*@.str7856, i32 0, i32 0
%.tmp7858 = load i8*, i8** %buf.7847
%.tmp7859 = load %m2437$.Type.type*, %m2437$.Type.type** %t.7852
%.tmp7860 = call i8*(%m2437$.Type.type*) @m229$type_abbr.cp.m2437$.Type.typep(%m2437$.Type.type* %.tmp7859)
%.tmp7861 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7855, i8* %.tmp7857, i8* %.tmp7858, i8* %.tmp7860)
%.tmp7862 = load %m2437$.Type.type*, %m2437$.Type.type** %t.7852
%.tmp7863 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7862, i32 0, i32 4
%.tmp7864 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7863
store %m2437$.Type.type* %.tmp7864, %m2437$.Type.type** %t.7852
br label %.for.start.7848
.for.end.7848:
%.tmp7865 = load i8*, i8** %buf.7847
ret i8* %.tmp7865
br label %.if.end.7844
.if.false.7844:
%.tmp7866 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7867 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7866, i32 0, i32 0
%.tmp7868 = load i8*, i8** %.tmp7867
%.tmp7870 = getelementptr [9 x i8], [9 x i8]*@.str7869, i32 0, i32 0
%.tmp7871 = call i32(i8*,i8*) @strcmp(i8* %.tmp7868, i8* %.tmp7870)
%.tmp7872 = icmp eq i32 %.tmp7871, 0
br i1 %.tmp7872, label %.if.true.7873, label %.if.false.7873
.if.true.7873:
%.tmp7875 = getelementptr [2 x i8], [2 x i8]*@.str7874, i32 0, i32 0
ret i8* %.tmp7875
br label %.if.end.7873
.if.false.7873:
%.tmp7876 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7877 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7876, i32 0, i32 0
%.tmp7878 = load i8*, i8** %.tmp7877
%.tmp7880 = getelementptr [6 x i8], [6 x i8]*@.str7879, i32 0, i32 0
%.tmp7881 = call i32(i8*,i8*) @strcmp(i8* %.tmp7878, i8* %.tmp7880)
%.tmp7882 = icmp eq i32 %.tmp7881, 0
br i1 %.tmp7882, label %.if.true.7883, label %.if.false.7883
.if.true.7883:
%.tmp7885 = getelementptr [2 x i8], [2 x i8]*@.str7884, i32 0, i32 0
ret i8* %.tmp7885
br label %.if.end.7883
.if.false.7883:
%.tmp7887 = getelementptr [45 x i8], [45 x i8]*@.str7886, i32 0, i32 0
%.tmp7888 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp7889 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7888, i32 0, i32 0
%.tmp7890 = load i8*, i8** %.tmp7889
%.tmp7891 = call i32(i8*,...) @printf(i8* %.tmp7887, i8* %.tmp7890)
br label %.if.end.7883
.if.end.7883:
br label %.if.end.7873
.if.end.7873:
br label %.if.end.7844
.if.end.7844:
br label %.if.end.7833
.if.end.7833:
br label %.if.end.7815
.if.end.7815:
br label %.if.end.7805
.if.end.7805:
br label %.if.end.7795
.if.end.7795:
br label %.if.end.7785
.if.end.7785:
br label %.if.end.7775
.if.end.7775:
%.tmp7892 = bitcast ptr null to i8*
ret i8* %.tmp7892
}
define %m2437$.AssignableInfo.type* @m229$define_string.m2437$.AssignableInfo.typep.m2437$.CompilerCtx.typep.cp(%m2437$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp7893 = bitcast ptr null to %m812$.Node.type*
%.tmp7894 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp7893)
%info.7895 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp7894, %m2437$.AssignableInfo.type** %info.7895
%tmp_buff.7896 = alloca i8*
store i8* null, i8** %tmp_buff.7896
%.tmp7897 = getelementptr i8*, i8** %tmp_buff.7896, i32 0
%.tmp7899 = getelementptr [7 x i8], [7 x i8]*@.str7898, i32 0, i32 0
%.tmp7900 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7901 = call i32(%m2437$.CompilerCtx.type*) @m229$new_uid.i.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.tmp7900)
%.tmp7902 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7897, i8* %.tmp7899, i32 %.tmp7901)
%.tmp7903 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.7895
%.tmp7904 = load i8, i8* @SCOPE_GLOBAL
%.tmp7905 = load i8*, i8** %tmp_buff.7896
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp7903, i8 %.tmp7904, i8* %.tmp7905)
%.tmp7906 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.7895
%.tmp7907 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7906, i32 0, i32 4
%.tmp7908 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp7908, %m2437$.Type.type** %.tmp7907
%.tmp7909 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.7895
%.tmp7910 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7909, i32 0, i32 4
%.tmp7911 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7910
%.tmp7912 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7911, i32 0, i32 0
%.tmp7914 = getelementptr [6 x i8], [6 x i8]*@.str7913, i32 0, i32 0
store i8* %.tmp7914, i8** %.tmp7912
%.tmp7915 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.7895
%.tmp7916 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7915, i32 0, i32 4
%.tmp7917 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7916
%.tmp7918 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7917, i32 0, i32 3
%.tmp7919 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp7919, %m2437$.Type.type** %.tmp7918
%.tmp7920 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.7895
%.tmp7921 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7920, i32 0, i32 4
%.tmp7922 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7921
%.tmp7923 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7922, i32 0, i32 3
%.tmp7924 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7923
%.tmp7925 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7924, i32 0, i32 0
%.tmp7927 = getelementptr [4 x i8], [4 x i8]*@.str7926, i32 0, i32 0
store i8* %.tmp7927, i8** %.tmp7925
%.tmp7928 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.7895
%.tmp7929 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7928, i32 0, i32 4
%.tmp7930 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7929
%.tmp7931 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7930, i32 0, i32 3
%.tmp7932 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7931
%.tmp7933 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7932, i32 0, i32 4
%.tmp7934 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp7934, %m2437$.Type.type** %.tmp7933
%.tmp7935 = load i8*, i8** %text
%.tmp7936 = call i8*(i8*) @m1991$string_to_llvm.cp.cp(i8* %.tmp7935)
%identifier.7937 = alloca i8*
store i8* %.tmp7936, i8** %identifier.7937
%.tmp7938 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.7895
%.tmp7939 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7938, i32 0, i32 4
%.tmp7940 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7939
%.tmp7941 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7940, i32 0, i32 3
%.tmp7942 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7941
%.tmp7943 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7942, i32 0, i32 4
%.tmp7944 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp7943
%.tmp7945 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp7944, i32 0, i32 0
%.tmp7946 = getelementptr i8*, i8** %.tmp7945, i32 0
%.tmp7948 = getelementptr [3 x i8], [3 x i8]*@.str7947, i32 0, i32 0
%.tmp7949 = load i8*, i8** %identifier.7937
%.tmp7950 = call i32(i8*) @m1991$llvm_str_len.i.cp(i8* %.tmp7949)
%.tmp7951 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7946, i8* %.tmp7948, i32 %.tmp7950)
%.tmp7952 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7953 = load i8*, i8** %identifier.7937
%.tmp7955 = getelementptr [7 x i8], [7 x i8]*@.str7954, i32 0, i32 0
%.tmp7956 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.7895
call void(%m2437$.CompilerCtx.type*,i8*,i8*,%m2437$.AssignableInfo.type*,i1,i1) @m229$define_global.v.m2437$.CompilerCtx.typep.cp.cp.m2437$.AssignableInfo.typep.b.b(%m2437$.CompilerCtx.type* %.tmp7952, i8* %.tmp7953, i8* %.tmp7955, %m2437$.AssignableInfo.type* %.tmp7956, i1 0, i1 0)
%.tmp7957 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.7895
ret %m2437$.AssignableInfo.type* %.tmp7957
}
define void @m229$define_global.v.m2437$.CompilerCtx.typep.cp.cp.m2437$.AssignableInfo.typep.b.b(%m2437$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg, i8* %.type.arg, %m2437$.AssignableInfo.type* %.info.arg, i1 %.weak.arg, i1 %.compiled.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%type = alloca i8*
store i8* %.type.arg, i8** %type
%info = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.info.arg, %m2437$.AssignableInfo.type** %info
%weak = alloca i1
store i1 %.weak.arg, i1* %weak
%compiled = alloca i1
store i1 %.compiled.arg, i1* %compiled
%.tmp7958 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* null, i32 1
%.tmp7959 = ptrtoint %m2437$.GlobalName.type* %.tmp7958 to i32
%.tmp7960 = call i8*(i32) @malloc(i32 %.tmp7959)
%.tmp7961 = bitcast i8* %.tmp7960 to %m2437$.GlobalName.type*
%global.7962 = alloca %m2437$.GlobalName.type*
store %m2437$.GlobalName.type* %.tmp7961, %m2437$.GlobalName.type** %global.7962
%.tmp7963 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %global.7962
%.tmp7964 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp7963, i32 0, i32 0
%.tmp7965 = load i8*, i8** %id
store i8* %.tmp7965, i8** %.tmp7964
%.tmp7966 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %global.7962
%.tmp7967 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp7966, i32 0, i32 1
%.tmp7968 = load i8*, i8** %type
store i8* %.tmp7968, i8** %.tmp7967
%.tmp7969 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %global.7962
%.tmp7970 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp7969, i32 0, i32 4
%.tmp7971 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info
store %m2437$.AssignableInfo.type* %.tmp7971, %m2437$.AssignableInfo.type** %.tmp7970
%.tmp7972 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %global.7962
%.tmp7973 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp7972, i32 0, i32 2
%.tmp7974 = load i1, i1* %compiled
store i1 %.tmp7974, i1* %.tmp7973
%.tmp7975 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %global.7962
%.tmp7976 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp7975, i32 0, i32 5
store %m2437$.GlobalName.type* null, %m2437$.GlobalName.type** %.tmp7976
%.tmp7977 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %global.7962
%.tmp7978 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp7977, i32 0, i32 3
%.tmp7979 = load i1, i1* %weak
store i1 %.tmp7979, i1* %.tmp7978
%.tmp7980 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7981 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %global.7962
call void(%m2437$.CompilerCtx.type*,%m2437$.GlobalName.type*) @m229$append_global.v.m2437$.CompilerCtx.typep.m2437$.GlobalName.typep(%m2437$.CompilerCtx.type* %.tmp7980, %m2437$.GlobalName.type* %.tmp7981)
ret void
}
define void @m229$define_module.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.cp(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%mod = alloca %m812$.Node.type*
store %m812$.Node.type* %.mod.arg, %m812$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp7982 = load %m812$.Node.type*, %m812$.Node.type** %mod
%.tmp7983 = call %m2437$.AssignableInfo.type*(%m812$.Node.type*) @m229$new_assignable_info.m2437$.AssignableInfo.typep.m812$.Node.typep(%m812$.Node.type* %.tmp7982)
%info.7984 = alloca %m2437$.AssignableInfo.type*
store %m2437$.AssignableInfo.type* %.tmp7983, %m2437$.AssignableInfo.type** %info.7984
%.tmp7985 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.7984
%.tmp7986 = load i8, i8* @SCOPE_CONST
%.tmp7987 = load i8*, i8** %abspath
call void(%m2437$.AssignableInfo.type*,i8,i8*) @m229$set_assignable_id.v.m2437$.AssignableInfo.typep.c.cp(%m2437$.AssignableInfo.type* %.tmp7985, i8 %.tmp7986, i8* %.tmp7987)
%.tmp7988 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.7984
%.tmp7989 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7988, i32 0, i32 3
%.tmp7991 = getelementptr [7 x i8], [7 x i8]*@.str7990, i32 0, i32 0
store i8* %.tmp7991, i8** %.tmp7989
%.tmp7992 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.7984
%.tmp7993 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp7992, i32 0, i32 4
store %m2437$.Type.type* null, %m2437$.Type.type** %.tmp7993
%.tmp7994 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp7995 = load %m812$.Node.type*, %m812$.Node.type** %mod
%.tmp7996 = load i8*, i8** %as_name
%.tmp7997 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %info.7984
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*,%m2437$.AssignableInfo.type*) @m229$define_assignable.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp.m2437$.AssignableInfo.typep(%m2437$.CompilerCtx.type* %.tmp7994, %m812$.Node.type* %.tmp7995, i8* %.tmp7996, %m2437$.AssignableInfo.type* %.tmp7997)
ret void
}
define void @m229$append_anon_fn.v.m2437$.CompilerCtx.typep.cp(%m2437$.CompilerCtx.type* %.ctx.arg, i8* %.code.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%code = alloca i8*
store i8* %.code.arg, i8** %code
%.tmp7998 = getelementptr %m2437$.AnonFn.type, %m2437$.AnonFn.type* null, i32 1
%.tmp7999 = ptrtoint %m2437$.AnonFn.type* %.tmp7998 to i32
%.tmp8000 = call i8*(i32) @malloc(i32 %.tmp7999)
%.tmp8001 = bitcast i8* %.tmp8000 to %m2437$.AnonFn.type*
%fn.8002 = alloca %m2437$.AnonFn.type*
store %m2437$.AnonFn.type* %.tmp8001, %m2437$.AnonFn.type** %fn.8002
%.tmp8003 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %fn.8002
%.tmp8004 = getelementptr %m2437$.AnonFn.type, %m2437$.AnonFn.type* %.tmp8003, i32 0, i32 0
%.tmp8005 = load i8*, i8** %code
store i8* %.tmp8005, i8** %.tmp8004
%.tmp8006 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8007 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8006, i32 0, i32 8
%.tmp8008 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %.tmp8007
%.tmp8009 = icmp eq %m2437$.AnonFn.type* %.tmp8008, null
br i1 %.tmp8009, label %.if.true.8010, label %.if.false.8010
.if.true.8010:
%.tmp8011 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8012 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8011, i32 0, i32 8
%.tmp8013 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %fn.8002
store %m2437$.AnonFn.type* %.tmp8013, %m2437$.AnonFn.type** %.tmp8012
%.tmp8014 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %fn.8002
%.tmp8015 = getelementptr %m2437$.AnonFn.type, %m2437$.AnonFn.type* %.tmp8014, i32 0, i32 1
store %m2437$.AnonFn.type* null, %m2437$.AnonFn.type** %.tmp8015
br label %.if.end.8010
.if.false.8010:
%.tmp8016 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8017 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8016, i32 0, i32 8
%.tmp8018 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %.tmp8017
%last.8019 = alloca %m2437$.AnonFn.type*
store %m2437$.AnonFn.type* %.tmp8018, %m2437$.AnonFn.type** %last.8019
br label %.for.start.8020
.for.start.8020:
%.tmp8021 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %last.8019
%.tmp8022 = getelementptr %m2437$.AnonFn.type, %m2437$.AnonFn.type* %.tmp8021, i32 0, i32 1
%.tmp8023 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %.tmp8022
%.tmp8024 = icmp ne %m2437$.AnonFn.type* %.tmp8023, null
br i1 %.tmp8024, label %.for.continue.8020, label %.for.end.8020
.for.continue.8020:
%.tmp8025 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %last.8019
%.tmp8026 = getelementptr %m2437$.AnonFn.type, %m2437$.AnonFn.type* %.tmp8025, i32 0, i32 1
%.tmp8027 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %.tmp8026
store %m2437$.AnonFn.type* %.tmp8027, %m2437$.AnonFn.type** %last.8019
br label %.for.start.8020
.for.end.8020:
%.tmp8028 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %last.8019
%.tmp8029 = getelementptr %m2437$.AnonFn.type, %m2437$.AnonFn.type* %.tmp8028, i32 0, i32 1
%.tmp8030 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %fn.8002
store %m2437$.AnonFn.type* %.tmp8030, %m2437$.AnonFn.type** %.tmp8029
br label %.if.end.8010
.if.end.8010:
ret void
}
define void @m229$compile_anon_fn.v.m2437$.CompilerCtx.typep(%m2437$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%.tmp8032 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8033 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8032, i32 0, i32 8
%.tmp8034 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %.tmp8033
%fn.8035 = alloca %m2437$.AnonFn.type*
store %m2437$.AnonFn.type* %.tmp8034, %m2437$.AnonFn.type** %fn.8035
br label %.for.start.8031
.for.start.8031:
%.tmp8036 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %fn.8035
%.tmp8037 = icmp ne %m2437$.AnonFn.type* %.tmp8036, null
br i1 %.tmp8037, label %.for.continue.8031, label %.for.end.8031
.for.continue.8031:
%.tmp8038 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8039 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8038, i32 0, i32 1
%.tmp8040 = load %m0$.File.type*, %m0$.File.type** %.tmp8039
%.tmp8042 = getelementptr [4 x i8], [4 x i8]*@.str8041, i32 0, i32 0
%.tmp8043 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %fn.8035
%.tmp8044 = getelementptr %m2437$.AnonFn.type, %m2437$.AnonFn.type* %.tmp8043, i32 0, i32 0
%.tmp8045 = load i8*, i8** %.tmp8044
%.tmp8046 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8040, i8* %.tmp8042, i8* %.tmp8045)
%.tmp8047 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %fn.8035
%.tmp8048 = getelementptr %m2437$.AnonFn.type, %m2437$.AnonFn.type* %.tmp8047, i32 0, i32 1
%.tmp8049 = load %m2437$.AnonFn.type*, %m2437$.AnonFn.type** %.tmp8048
store %m2437$.AnonFn.type* %.tmp8049, %m2437$.AnonFn.type** %fn.8035
br label %.for.start.8031
.for.end.8031:
%.tmp8050 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8051 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8050, i32 0, i32 8
store %m2437$.AnonFn.type* null, %m2437$.AnonFn.type** %.tmp8051
ret void
}
define void @m229$append_global.v.m2437$.CompilerCtx.typep.m2437$.GlobalName.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%g = alloca %m2437$.GlobalName.type*
store %m2437$.GlobalName.type* %.g.arg, %m2437$.GlobalName.type** %g
%.tmp8052 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8053 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8052, i32 0, i32 3
%.tmp8054 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %.tmp8053
%.tmp8055 = icmp eq %m2437$.GlobalName.type* %.tmp8054, null
br i1 %.tmp8055, label %.if.true.8056, label %.if.false.8056
.if.true.8056:
%.tmp8057 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8058 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8057, i32 0, i32 3
%.tmp8059 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g
store %m2437$.GlobalName.type* %.tmp8059, %m2437$.GlobalName.type** %.tmp8058
ret void
br label %.if.end.8056
.if.false.8056:
br label %.if.end.8056
.if.end.8056:
%.tmp8060 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8061 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8060, i32 0, i32 3
%.tmp8062 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %.tmp8061
%last_global.8063 = alloca %m2437$.GlobalName.type*
store %m2437$.GlobalName.type* %.tmp8062, %m2437$.GlobalName.type** %last_global.8063
%.tmp8065 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8066 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8065, i32 0, i32 3
%.tmp8067 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %.tmp8066
%curr_global.8068 = alloca %m2437$.GlobalName.type*
store %m2437$.GlobalName.type* %.tmp8067, %m2437$.GlobalName.type** %curr_global.8068
br label %.for.start.8064
.for.start.8064:
%.tmp8069 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %curr_global.8068
%.tmp8070 = icmp ne %m2437$.GlobalName.type* %.tmp8069, null
br i1 %.tmp8070, label %.for.continue.8064, label %.for.end.8064
.for.continue.8064:
%.tmp8071 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %curr_global.8068
%.tmp8072 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp8071, i32 0, i32 4
%.tmp8073 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %.tmp8072
%.tmp8074 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp8073, i32 0, i32 0
%.tmp8075 = load i8*, i8** %.tmp8074
%.tmp8076 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g
%.tmp8077 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp8076, i32 0, i32 4
%.tmp8078 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %.tmp8077
%.tmp8079 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp8078, i32 0, i32 0
%.tmp8080 = load i8*, i8** %.tmp8079
%.tmp8081 = call i32(i8*,i8*) @strcmp(i8* %.tmp8075, i8* %.tmp8080)
%.tmp8082 = icmp eq i32 %.tmp8081, 0
br i1 %.tmp8082, label %.if.true.8083, label %.if.false.8083
.if.true.8083:
ret void
br label %.if.end.8083
.if.false.8083:
br label %.if.end.8083
.if.end.8083:
%.tmp8084 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %curr_global.8068
store %m2437$.GlobalName.type* %.tmp8084, %m2437$.GlobalName.type** %last_global.8063
%.tmp8085 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %curr_global.8068
%.tmp8086 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp8085, i32 0, i32 5
%.tmp8087 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %.tmp8086
store %m2437$.GlobalName.type* %.tmp8087, %m2437$.GlobalName.type** %curr_global.8068
br label %.for.start.8064
.for.end.8064:
%.tmp8088 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %last_global.8063
%.tmp8089 = getelementptr %m2437$.GlobalName.type, %m2437$.GlobalName.type* %.tmp8088, i32 0, i32 5
%.tmp8090 = load %m2437$.GlobalName.type*, %m2437$.GlobalName.type** %g
store %m2437$.GlobalName.type* %.tmp8090, %m2437$.GlobalName.type** %.tmp8089
ret void
}
define i8* @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.Type.type* %.type.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%type = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.type.arg, %m2437$.Type.type** %type
%.tmp8091 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8092 = icmp eq %m2437$.Type.type* %.tmp8091, null
br i1 %.tmp8092, label %.if.true.8093, label %.if.false.8093
.if.true.8093:
%.tmp8094 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp8094, label %.if.true.8095, label %.if.false.8095
.if.true.8095:
%.tmp8097 = getelementptr [44 x i8], [44 x i8]*@.str8096, i32 0, i32 0
%.tmp8098 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8099 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8098, i32 0, i32 7
%.tmp8100 = load i8*, i8** %.tmp8099
%.tmp8101 = call i32(i8*,...) @printf(i8* %.tmp8097, i8* %.tmp8100)
br label %.if.end.8095
.if.false.8095:
br label %.if.end.8095
.if.end.8095:
%.tmp8103 = getelementptr [2 x i8], [2 x i8]*@.str8102, i32 0, i32 0
ret i8* %.tmp8103
br label %.if.end.8093
.if.false.8093:
br label %.if.end.8093
.if.end.8093:
%.tmp8104 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8105 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8104, i32 0, i32 0
%.tmp8106 = load i8*, i8** %.tmp8105
%.tmp8107 = icmp ne i8* %.tmp8106, null
%.tmp8109 = getelementptr [59 x i8], [59 x i8]*@.str8108, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8107, i8* %.tmp8109)
%buf.8110 = alloca i8*
store i8* null, i8** %buf.8110
%.tmp8111 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8112 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8111, i32 0, i32 0
%.tmp8113 = load i8*, i8** %.tmp8112
%.tmp8115 = getelementptr [4 x i8], [4 x i8]*@.str8114, i32 0, i32 0
%.tmp8116 = call i32(i8*,i8*) @strcmp(i8* %.tmp8113, i8* %.tmp8115)
%.tmp8117 = icmp eq i32 %.tmp8116, 0
br i1 %.tmp8117, label %.if.true.8118, label %.if.false.8118
.if.true.8118:
%.tmp8120 = getelementptr [4 x i8], [4 x i8]*@.str8119, i32 0, i32 0
ret i8* %.tmp8120
br label %.if.end.8118
.if.false.8118:
%.tmp8121 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8122 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8121, i32 0, i32 0
%.tmp8123 = load i8*, i8** %.tmp8122
%.tmp8125 = getelementptr [5 x i8], [5 x i8]*@.str8124, i32 0, i32 0
%.tmp8126 = call i32(i8*,i8*) @strcmp(i8* %.tmp8123, i8* %.tmp8125)
%.tmp8127 = icmp eq i32 %.tmp8126, 0
br i1 %.tmp8127, label %.if.true.8128, label %.if.false.8128
.if.true.8128:
%.tmp8130 = getelementptr [5 x i8], [5 x i8]*@.str8129, i32 0, i32 0
ret i8* %.tmp8130
br label %.if.end.8128
.if.false.8128:
%.tmp8131 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8132 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8131, i32 0, i32 0
%.tmp8133 = load i8*, i8** %.tmp8132
%.tmp8135 = getelementptr [5 x i8], [5 x i8]*@.str8134, i32 0, i32 0
%.tmp8136 = call i32(i8*,i8*) @strcmp(i8* %.tmp8133, i8* %.tmp8135)
%.tmp8137 = icmp eq i32 %.tmp8136, 0
br i1 %.tmp8137, label %.if.true.8138, label %.if.false.8138
.if.true.8138:
%.tmp8140 = getelementptr [3 x i8], [3 x i8]*@.str8139, i32 0, i32 0
ret i8* %.tmp8140
br label %.if.end.8138
.if.false.8138:
%.tmp8141 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8142 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8141, i32 0, i32 0
%.tmp8143 = load i8*, i8** %.tmp8142
%.tmp8145 = getelementptr [8 x i8], [8 x i8]*@.str8144, i32 0, i32 0
%.tmp8146 = call i32(i8*,i8*) @strcmp(i8* %.tmp8143, i8* %.tmp8145)
%.tmp8147 = icmp eq i32 %.tmp8146, 0
br i1 %.tmp8147, label %.if.true.8148, label %.if.false.8148
.if.true.8148:
%.tmp8150 = getelementptr [4 x i8], [4 x i8]*@.str8149, i32 0, i32 0
ret i8* %.tmp8150
br label %.if.end.8148
.if.false.8148:
%.tmp8151 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8152 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8151, i32 0, i32 0
%.tmp8153 = load i8*, i8** %.tmp8152
%.tmp8155 = getelementptr [4 x i8], [4 x i8]*@.str8154, i32 0, i32 0
%.tmp8156 = call i32(i8*,i8*) @strcmp(i8* %.tmp8153, i8* %.tmp8155)
%.tmp8157 = icmp eq i32 %.tmp8156, 0
br i1 %.tmp8157, label %.if.true.8158, label %.if.false.8158
.if.true.8158:
%.tmp8160 = getelementptr [3 x i8], [3 x i8]*@.str8159, i32 0, i32 0
ret i8* %.tmp8160
br label %.if.end.8158
.if.false.8158:
%.tmp8161 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8162 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8161, i32 0, i32 0
%.tmp8163 = load i8*, i8** %.tmp8162
%.tmp8165 = getelementptr [9 x i8], [9 x i8]*@.str8164, i32 0, i32 0
%.tmp8166 = call i32(i8*,i8*) @strcmp(i8* %.tmp8163, i8* %.tmp8165)
%.tmp8167 = icmp eq i32 %.tmp8166, 0
br i1 %.tmp8167, label %.if.true.8168, label %.if.false.8168
.if.true.8168:
%.tmp8169 = getelementptr i8*, i8** %buf.8110, i32 0
%.tmp8171 = getelementptr [4 x i8], [4 x i8]*@.str8170, i32 0, i32 0
%.tmp8172 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8173 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8174 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8173, i32 0, i32 3
%.tmp8175 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8174
%.tmp8176 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp8172, %m2437$.Type.type* %.tmp8175)
%.tmp8177 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8169, i8* %.tmp8171, i8* %.tmp8176)
%.tmp8179 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8180 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8179, i32 0, i32 3
%.tmp8181 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8180
%.tmp8182 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8181, i32 0, i32 4
%.tmp8183 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8182
%p.8184 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8183, %m2437$.Type.type** %p.8184
br label %.for.start.8178
.for.start.8178:
%.tmp8185 = load %m2437$.Type.type*, %m2437$.Type.type** %p.8184
%.tmp8186 = icmp ne %m2437$.Type.type* %.tmp8185, null
br i1 %.tmp8186, label %.for.continue.8178, label %.for.end.8178
.for.continue.8178:
%.tmp8187 = load %m2437$.Type.type*, %m2437$.Type.type** %p.8184
%.tmp8188 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8189 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8188, i32 0, i32 3
%.tmp8190 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8189
%.tmp8191 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8190, i32 0, i32 4
%.tmp8192 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8191
%.tmp8193 = icmp ne %m2437$.Type.type* %.tmp8187, %.tmp8192
br i1 %.tmp8193, label %.if.true.8194, label %.if.false.8194
.if.true.8194:
%.tmp8195 = getelementptr i8*, i8** %buf.8110, i32 0
%.tmp8197 = getelementptr [4 x i8], [4 x i8]*@.str8196, i32 0, i32 0
%.tmp8198 = load i8*, i8** %buf.8110
%.tmp8199 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8195, i8* %.tmp8197, i8* %.tmp8198)
br label %.if.end.8194
.if.false.8194:
br label %.if.end.8194
.if.end.8194:
%.tmp8200 = getelementptr i8*, i8** %buf.8110, i32 0
%.tmp8202 = getelementptr [5 x i8], [5 x i8]*@.str8201, i32 0, i32 0
%.tmp8203 = load i8*, i8** %buf.8110
%.tmp8204 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8205 = load %m2437$.Type.type*, %m2437$.Type.type** %p.8184
%.tmp8206 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp8204, %m2437$.Type.type* %.tmp8205)
%.tmp8207 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8200, i8* %.tmp8202, i8* %.tmp8203, i8* %.tmp8206)
%.tmp8208 = load %m2437$.Type.type*, %m2437$.Type.type** %p.8184
%.tmp8209 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8208, i32 0, i32 4
%.tmp8210 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8209
store %m2437$.Type.type* %.tmp8210, %m2437$.Type.type** %p.8184
br label %.for.start.8178
.for.end.8178:
%.tmp8211 = getelementptr i8*, i8** %buf.8110, i32 0
%.tmp8213 = getelementptr [4 x i8], [4 x i8]*@.str8212, i32 0, i32 0
%.tmp8214 = load i8*, i8** %buf.8110
%.tmp8215 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8211, i8* %.tmp8213, i8* %.tmp8214)
%.tmp8216 = load i8*, i8** %buf.8110
ret i8* %.tmp8216
br label %.if.end.8168
.if.false.8168:
%.tmp8217 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8218 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8217, i32 0, i32 0
%.tmp8219 = load i8*, i8** %.tmp8218
%.tmp8221 = getelementptr [4 x i8], [4 x i8]*@.str8220, i32 0, i32 0
%.tmp8222 = call i32(i8*,i8*) @strcmp(i8* %.tmp8219, i8* %.tmp8221)
%.tmp8223 = icmp eq i32 %.tmp8222, 0
br i1 %.tmp8223, label %.if.true.8224, label %.if.false.8224
.if.true.8224:
%.tmp8225 = getelementptr i8*, i8** %buf.8110, i32 0
%.tmp8227 = getelementptr [4 x i8], [4 x i8]*@.str8226, i32 0, i32 0
%.tmp8228 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8229 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8230 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8229, i32 0, i32 3
%.tmp8231 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8230
%.tmp8232 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp8228, %m2437$.Type.type* %.tmp8231)
%.tmp8233 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8225, i8* %.tmp8227, i8* %.tmp8232)
%.tmp8234 = load i8*, i8** %buf.8110
ret i8* %.tmp8234
br label %.if.end.8224
.if.false.8224:
%.tmp8235 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8236 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8235, i32 0, i32 0
%.tmp8237 = load i8*, i8** %.tmp8236
%.tmp8239 = getelementptr [7 x i8], [7 x i8]*@.str8238, i32 0, i32 0
%.tmp8240 = call i32(i8*,i8*) @strcmp(i8* %.tmp8237, i8* %.tmp8239)
%.tmp8241 = icmp eq i32 %.tmp8240, 0
br i1 %.tmp8241, label %.if.true.8242, label %.if.false.8242
.if.true.8242:
%.tmp8243 = getelementptr i8*, i8** %buf.8110, i32 0
%.tmp8245 = getelementptr [2 x i8], [2 x i8]*@.str8244, i32 0, i32 0
%.tmp8246 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8243, i8* %.tmp8245)
%.tmp8248 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8249 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8248, i32 0, i32 3
%.tmp8250 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8249
%t.8251 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8250, %m2437$.Type.type** %t.8251
br label %.for.start.8247
.for.start.8247:
%.tmp8252 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8251
%.tmp8253 = icmp ne %m2437$.Type.type* %.tmp8252, null
br i1 %.tmp8253, label %.for.continue.8247, label %.for.end.8247
.for.continue.8247:
%.tmp8254 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8251
%.tmp8255 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8256 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8255, i32 0, i32 3
%.tmp8257 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8256
%.tmp8258 = icmp ne %m2437$.Type.type* %.tmp8254, %.tmp8257
br i1 %.tmp8258, label %.if.true.8259, label %.if.false.8259
.if.true.8259:
%.tmp8260 = getelementptr i8*, i8** %buf.8110, i32 0
%.tmp8262 = getelementptr [4 x i8], [4 x i8]*@.str8261, i32 0, i32 0
%.tmp8263 = load i8*, i8** %buf.8110
%.tmp8264 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8260, i8* %.tmp8262, i8* %.tmp8263)
br label %.if.end.8259
.if.false.8259:
br label %.if.end.8259
.if.end.8259:
%.tmp8265 = getelementptr i8*, i8** %buf.8110, i32 0
%.tmp8267 = getelementptr [5 x i8], [5 x i8]*@.str8266, i32 0, i32 0
%.tmp8268 = load i8*, i8** %buf.8110
%.tmp8269 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8270 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8251
%.tmp8271 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp8269, %m2437$.Type.type* %.tmp8270)
%.tmp8272 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8265, i8* %.tmp8267, i8* %.tmp8268, i8* %.tmp8271)
%.tmp8273 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8251
%.tmp8274 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8273, i32 0, i32 4
%.tmp8275 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8274
store %m2437$.Type.type* %.tmp8275, %m2437$.Type.type** %t.8251
br label %.for.start.8247
.for.end.8247:
%.tmp8276 = getelementptr i8*, i8** %buf.8110, i32 0
%.tmp8278 = getelementptr [4 x i8], [4 x i8]*@.str8277, i32 0, i32 0
%.tmp8279 = load i8*, i8** %buf.8110
%.tmp8280 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8276, i8* %.tmp8278, i8* %.tmp8279)
%.tmp8281 = load i8*, i8** %buf.8110
ret i8* %.tmp8281
br label %.if.end.8242
.if.false.8242:
%.tmp8282 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8283 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8282, i32 0, i32 0
%.tmp8284 = load i8*, i8** %.tmp8283
%.tmp8286 = getelementptr [6 x i8], [6 x i8]*@.str8285, i32 0, i32 0
%.tmp8287 = call i32(i8*,i8*) @strcmp(i8* %.tmp8284, i8* %.tmp8286)
%.tmp8288 = icmp eq i32 %.tmp8287, 0
br i1 %.tmp8288, label %.if.true.8289, label %.if.false.8289
.if.true.8289:
%.tmp8290 = getelementptr i8*, i8** %buf.8110, i32 0
%.tmp8292 = getelementptr [10 x i8], [10 x i8]*@.str8291, i32 0, i32 0
%.tmp8293 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8294 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8293, i32 0, i32 3
%.tmp8295 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8294
%.tmp8296 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8295, i32 0, i32 4
%.tmp8297 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8296
%.tmp8298 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8297, i32 0, i32 0
%.tmp8299 = load i8*, i8** %.tmp8298
%.tmp8300 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8301 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8302 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8301, i32 0, i32 3
%.tmp8303 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8302
%.tmp8304 = call i8*(%m2437$.CompilerCtx.type*,%m2437$.Type.type*) @m229$type_repr.cp.m2437$.CompilerCtx.typep.m2437$.Type.typep(%m2437$.CompilerCtx.type* %.tmp8300, %m2437$.Type.type* %.tmp8303)
%.tmp8305 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8290, i8* %.tmp8292, i8* %.tmp8299, i8* %.tmp8304)
%.tmp8306 = load i8*, i8** %buf.8110
ret i8* %.tmp8306
br label %.if.end.8289
.if.false.8289:
%.tmp8307 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8308 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8307, i32 0, i32 0
%.tmp8309 = load i8*, i8** %.tmp8308
%.tmp8311 = getelementptr [10 x i8], [10 x i8]*@.str8310, i32 0, i32 0
%.tmp8312 = call i32(i8*,i8*) @strcmp(i8* %.tmp8309, i8* %.tmp8311)
%.tmp8313 = icmp eq i32 %.tmp8312, 0
br i1 %.tmp8313, label %.if.true.8314, label %.if.false.8314
.if.true.8314:
%.tmp8315 = getelementptr i8*, i8** %buf.8110, i32 0
%.tmp8317 = getelementptr [5 x i8], [5 x i8]*@.str8316, i32 0, i32 0
%.tmp8318 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8319 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8318, i32 0, i32 2
%.tmp8320 = load i8*, i8** %.tmp8319
%.tmp8321 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8315, i8* %.tmp8317, i8* %.tmp8320)
%.tmp8322 = load i8*, i8** %buf.8110
ret i8* %.tmp8322
br label %.if.end.8314
.if.false.8314:
%.tmp8323 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8324 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8323, i32 0, i32 0
%.tmp8325 = load i8*, i8** %.tmp8324
%.tmp8327 = getelementptr [7 x i8], [7 x i8]*@.str8326, i32 0, i32 0
%.tmp8328 = call i32(i8*,i8*) @strcmp(i8* %.tmp8325, i8* %.tmp8327)
%.tmp8329 = icmp eq i32 %.tmp8328, 0
br i1 %.tmp8329, label %.if.true.8330, label %.if.false.8330
.if.true.8330:
%.tmp8332 = getelementptr [4 x i8], [4 x i8]*@.str8331, i32 0, i32 0
ret i8* %.tmp8332
br label %.if.end.8330
.if.false.8330:
%.tmp8333 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8334 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8333, i32 0, i32 0
%.tmp8335 = load i8*, i8** %.tmp8334
%.tmp8337 = getelementptr [6 x i8], [6 x i8]*@.str8336, i32 0, i32 0
%.tmp8338 = call i32(i8*,i8*) @strcmp(i8* %.tmp8335, i8* %.tmp8337)
%.tmp8339 = icmp eq i32 %.tmp8338, 0
br i1 %.tmp8339, label %.if.true.8340, label %.if.false.8340
.if.true.8340:
br label %.if.end.8340
.if.false.8340:
%.tmp8342 = getelementptr [58 x i8], [58 x i8]*@.str8341, i32 0, i32 0
%.tmp8343 = load %m2437$.Type.type*, %m2437$.Type.type** %type
%.tmp8344 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8343, i32 0, i32 0
%.tmp8345 = load i8*, i8** %.tmp8344
%.tmp8346 = call i32(i8*,...) @printf(i8* %.tmp8342, i8* %.tmp8345)
br label %.if.end.8340
.if.end.8340:
br label %.if.end.8330
.if.end.8330:
br label %.if.end.8314
.if.end.8314:
br label %.if.end.8289
.if.end.8289:
br label %.if.end.8242
.if.end.8242:
br label %.if.end.8224
.if.end.8224:
br label %.if.end.8168
.if.end.8168:
br label %.if.end.8158
.if.end.8158:
br label %.if.end.8148
.if.end.8148:
br label %.if.end.8138
.if.end.8138:
br label %.if.end.8128
.if.end.8128:
br label %.if.end.8118
.if.end.8118:
%.tmp8347 = bitcast ptr null to i8*
ret i8* %.tmp8347
}
define void @m229$append_error.v.m2437$.CompilerCtx.typep.m230$.Error.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m230$.Error.type* %.e.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%e = alloca %m230$.Error.type*
store %m230$.Error.type* %.e.arg, %m230$.Error.type** %e
%.tmp8348 = getelementptr %m2437$.ErrorList.type, %m2437$.ErrorList.type* null, i32 1
%.tmp8349 = ptrtoint %m2437$.ErrorList.type* %.tmp8348 to i32
%.tmp8350 = call i8*(i32) @malloc(i32 %.tmp8349)
%.tmp8351 = bitcast i8* %.tmp8350 to %m2437$.ErrorList.type*
%new_err.8352 = alloca %m2437$.ErrorList.type*
store %m2437$.ErrorList.type* %.tmp8351, %m2437$.ErrorList.type** %new_err.8352
%.tmp8353 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %new_err.8352
%.tmp8354 = getelementptr %m2437$.ErrorList.type, %m2437$.ErrorList.type* %.tmp8353, i32 0, i32 2
store i1 0, i1* %.tmp8354
%.tmp8355 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %new_err.8352
%.tmp8356 = getelementptr %m2437$.ErrorList.type, %m2437$.ErrorList.type* %.tmp8355, i32 0, i32 0
%.tmp8357 = load %m230$.Error.type*, %m230$.Error.type** %e
store %m230$.Error.type* %.tmp8357, %m230$.Error.type** %.tmp8356
%.tmp8358 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %new_err.8352
%.tmp8359 = getelementptr %m2437$.ErrorList.type, %m2437$.ErrorList.type* %.tmp8358, i32 0, i32 1
store %m2437$.ErrorList.type* null, %m2437$.ErrorList.type** %.tmp8359
%.tmp8360 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8361 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8360, i32 0, i32 2
%.tmp8362 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %.tmp8361
%.tmp8363 = icmp eq %m2437$.ErrorList.type* %.tmp8362, null
br i1 %.tmp8363, label %.if.true.8364, label %.if.false.8364
.if.true.8364:
%.tmp8365 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8366 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8365, i32 0, i32 2
%.tmp8367 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %new_err.8352
store %m2437$.ErrorList.type* %.tmp8367, %m2437$.ErrorList.type** %.tmp8366
ret void
br label %.if.end.8364
.if.false.8364:
br label %.if.end.8364
.if.end.8364:
%last.8368 = alloca %m2437$.ErrorList.type*
store %m2437$.ErrorList.type* null, %m2437$.ErrorList.type** %last.8368
%.tmp8370 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8371 = getelementptr %m2437$.CompilerCtx.type, %m2437$.CompilerCtx.type* %.tmp8370, i32 0, i32 2
%.tmp8372 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %.tmp8371
store %m2437$.ErrorList.type* %.tmp8372, %m2437$.ErrorList.type** %last.8368
br label %.for.start.8369
.for.start.8369:
%.tmp8373 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %last.8368
%.tmp8374 = getelementptr %m2437$.ErrorList.type, %m2437$.ErrorList.type* %.tmp8373, i32 0, i32 1
%.tmp8375 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %.tmp8374
%.tmp8376 = icmp ne %m2437$.ErrorList.type* %.tmp8375, null
br i1 %.tmp8376, label %.for.continue.8369, label %.for.end.8369
.for.continue.8369:
%.tmp8377 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %last.8368
%.tmp8378 = getelementptr %m2437$.ErrorList.type, %m2437$.ErrorList.type* %.tmp8377, i32 0, i32 1
%.tmp8379 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %.tmp8378
store %m2437$.ErrorList.type* %.tmp8379, %m2437$.ErrorList.type** %last.8368
br label %.for.start.8369
.for.end.8369:
%.tmp8380 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %last.8368
%.tmp8381 = getelementptr %m2437$.ErrorList.type, %m2437$.ErrorList.type* %.tmp8380, i32 0, i32 1
%.tmp8382 = load %m2437$.ErrorList.type*, %m2437$.ErrorList.type** %new_err.8352
store %m2437$.ErrorList.type* %.tmp8382, %m2437$.ErrorList.type** %.tmp8381
ret void
}
define i8* @m229$syn_function_name.cp.m812$.Node.typep(%m812$.Node.type* %.stmt.arg) {
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%.tmp8383 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8384 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8383, i32 0, i32 6
%.tmp8385 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8384
%.tmp8386 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8385, i32 0, i32 7
%.tmp8387 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8386
%.tmp8388 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8387, i32 0, i32 1
%.tmp8389 = load i8*, i8** %.tmp8388
ret i8* %.tmp8389
}
define %m812$.Node.type* @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m812$.Node.type*
store %m812$.Node.type* %.node.arg, %m812$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp8391 = load %m812$.Node.type*, %m812$.Node.type** %node
%n.8392 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp8391, %m812$.Node.type** %n.8392
br label %.for.start.8390
.for.start.8390:
%.tmp8393 = load %m812$.Node.type*, %m812$.Node.type** %n.8392
%.tmp8394 = icmp ne %m812$.Node.type* %.tmp8393, null
br i1 %.tmp8394, label %.for.continue.8390, label %.for.end.8390
.for.continue.8390:
%.tmp8395 = load %m812$.Node.type*, %m812$.Node.type** %n.8392
%.tmp8396 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8395, i32 0, i32 0
%.tmp8397 = load i8*, i8** %.tmp8396
%.tmp8398 = load i8*, i8** %type
%.tmp8399 = call i32(i8*,i8*) @strcmp(i8* %.tmp8397, i8* %.tmp8398)
%.tmp8400 = icmp eq i32 %.tmp8399, 0
br i1 %.tmp8400, label %.if.true.8401, label %.if.false.8401
.if.true.8401:
%.tmp8402 = load %m812$.Node.type*, %m812$.Node.type** %n.8392
ret %m812$.Node.type* %.tmp8402
br label %.if.end.8401
.if.false.8401:
br label %.if.end.8401
.if.end.8401:
%.tmp8403 = load %m812$.Node.type*, %m812$.Node.type** %n.8392
%.tmp8404 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8403, i32 0, i32 7
%.tmp8405 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8404
store %m812$.Node.type* %.tmp8405, %m812$.Node.type** %n.8392
br label %.for.start.8390
.for.end.8390:
%.tmp8406 = bitcast ptr null to %m812$.Node.type*
ret %m812$.Node.type* %.tmp8406
}
define %m2437$.Type.type* @m229$syn_function_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%.tmp8407 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
%function_type.8408 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8407, %m2437$.Type.type** %function_type.8408
%.tmp8409 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8410 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8411 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8410, i32 0, i32 6
%.tmp8412 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8411
%.tmp8413 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$node_to_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp8409, %m812$.Node.type* %.tmp8412)
%return_value_type.8414 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8413, %m2437$.Type.type** %return_value_type.8414
%.tmp8415 = load %m2437$.Type.type*, %m2437$.Type.type** %function_type.8408
%.tmp8416 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8415, i32 0, i32 0
%.tmp8418 = getelementptr [9 x i8], [9 x i8]*@.str8417, i32 0, i32 0
store i8* %.tmp8418, i8** %.tmp8416
%.tmp8419 = load %m2437$.Type.type*, %m2437$.Type.type** %function_type.8408
%.tmp8420 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8419, i32 0, i32 3
%.tmp8421 = load %m2437$.Type.type*, %m2437$.Type.type** %return_value_type.8414
store %m2437$.Type.type* %.tmp8421, %m2437$.Type.type** %.tmp8420
%.tmp8422 = load %m2437$.Type.type*, %m2437$.Type.type** %return_value_type.8414
%last_type.8423 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8422, %m2437$.Type.type** %last_type.8423
%.tmp8424 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8425 = call %m812$.Node.type*(%m812$.Node.type*) @m229$syn_function_params.m812$.Node.typep.m812$.Node.typep(%m812$.Node.type* %.tmp8424)
%params.8426 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp8425, %m812$.Node.type** %params.8426
%.tmp8428 = load %m812$.Node.type*, %m812$.Node.type** %params.8426
%param_ptr.8429 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp8428, %m812$.Node.type** %param_ptr.8429
br label %.for.start.8427
.for.start.8427:
%.tmp8430 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.8429
%.tmp8431 = icmp ne %m812$.Node.type* %.tmp8430, null
br i1 %.tmp8431, label %.for.continue.8427, label %.for.end.8427
.for.continue.8427:
%.tmp8432 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.8429
%.tmp8433 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8432, i32 0, i32 0
%.tmp8434 = load i8*, i8** %.tmp8433
%.tmp8436 = getelementptr [5 x i8], [5 x i8]*@.str8435, i32 0, i32 0
%.tmp8437 = call i32(i8*,i8*) @strcmp(i8* %.tmp8434, i8* %.tmp8436)
%.tmp8438 = icmp eq i32 %.tmp8437, 0
br i1 %.tmp8438, label %.if.true.8439, label %.if.false.8439
.if.true.8439:
%.tmp8440 = load %m2437$.Type.type*, %m2437$.Type.type** %last_type.8423
%.tmp8441 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8440, i32 0, i32 4
%.tmp8442 = load %m2437$.Type.type*, %m2437$.Type.type** %last_type.8423
%.tmp8443 = call %m2437$.Type.type*(%m2437$.Type.type*) @m229$type_clone.m2437$.Type.typep.m2437$.Type.typep(%m2437$.Type.type* %.tmp8442)
store %m2437$.Type.type* %.tmp8443, %m2437$.Type.type** %.tmp8441
%.tmp8444 = load %m2437$.Type.type*, %m2437$.Type.type** %last_type.8423
%.tmp8445 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8444, i32 0, i32 4
%.tmp8446 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8445
%.tmp8447 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8446, i32 0, i32 4
store %m2437$.Type.type* null, %m2437$.Type.type** %.tmp8447
%.tmp8448 = load %m2437$.Type.type*, %m2437$.Type.type** %last_type.8423
%.tmp8449 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8448, i32 0, i32 4
%.tmp8450 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8449
store %m2437$.Type.type* %.tmp8450, %m2437$.Type.type** %last_type.8423
%.tmp8451 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.8429
%.tmp8452 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8451, i32 0, i32 7
%.tmp8453 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8452
%.tmp8454 = icmp ne %m812$.Node.type* %.tmp8453, null
br i1 %.tmp8454, label %.if.true.8455, label %.if.false.8455
.if.true.8455:
%.tmp8456 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.8429
%.tmp8457 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8456, i32 0, i32 7
%.tmp8458 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8457
store %m812$.Node.type* %.tmp8458, %m812$.Node.type** %param_ptr.8429
br label %.if.end.8455
.if.false.8455:
br label %.if.end.8455
.if.end.8455:
%.tmp8459 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.8429
%.tmp8460 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8459, i32 0, i32 7
%.tmp8461 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8460
%.tmp8462 = icmp ne %m812$.Node.type* %.tmp8461, null
br i1 %.tmp8462, label %.if.true.8463, label %.if.false.8463
.if.true.8463:
%.tmp8464 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.8429
%.tmp8465 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8464, i32 0, i32 7
%.tmp8466 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8465
store %m812$.Node.type* %.tmp8466, %m812$.Node.type** %param_ptr.8429
br label %.if.end.8463
.if.false.8463:
store %m812$.Node.type* null, %m812$.Node.type** %param_ptr.8429
br label %.if.end.8463
.if.end.8463:
br label %.if.end.8439
.if.false.8439:
%.tmp8467 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8468 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.8429
%.tmp8469 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8468, i32 0, i32 6
%.tmp8470 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8469
%.tmp8471 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$node_to_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp8467, %m812$.Node.type* %.tmp8470)
%param_type.8472 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8471, %m2437$.Type.type** %param_type.8472
%.tmp8473 = load %m2437$.Type.type*, %m2437$.Type.type** %last_type.8423
%.tmp8474 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8473, i32 0, i32 4
%.tmp8475 = load %m2437$.Type.type*, %m2437$.Type.type** %param_type.8472
store %m2437$.Type.type* %.tmp8475, %m2437$.Type.type** %.tmp8474
%.tmp8476 = load %m2437$.Type.type*, %m2437$.Type.type** %param_type.8472
store %m2437$.Type.type* %.tmp8476, %m2437$.Type.type** %last_type.8423
%.tmp8477 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.8429
%.tmp8478 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8477, i32 0, i32 7
%.tmp8479 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8478
store %m812$.Node.type* %.tmp8479, %m812$.Node.type** %param_ptr.8429
%.tmp8480 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.8429
%.tmp8481 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8480, i32 0, i32 7
%.tmp8482 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8481
%.tmp8483 = icmp ne %m812$.Node.type* %.tmp8482, null
br i1 %.tmp8483, label %.if.true.8484, label %.if.false.8484
.if.true.8484:
%.tmp8485 = load %m812$.Node.type*, %m812$.Node.type** %param_ptr.8429
%.tmp8486 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8485, i32 0, i32 7
%.tmp8487 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8486
%.tmp8488 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8487, i32 0, i32 7
%.tmp8489 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8488
store %m812$.Node.type* %.tmp8489, %m812$.Node.type** %param_ptr.8429
br label %.if.end.8484
.if.false.8484:
store %m812$.Node.type* null, %m812$.Node.type** %param_ptr.8429
br label %.if.end.8484
.if.end.8484:
br label %.if.end.8439
.if.end.8439:
br label %.for.start.8427
.for.end.8427:
%.tmp8490 = load %m2437$.Type.type*, %m2437$.Type.type** %function_type.8408
ret %m2437$.Type.type* %.tmp8490
}
define %m812$.Node.type* @m229$syn_function_params.m812$.Node.typep.m812$.Node.typep(%m812$.Node.type* %.stmt.arg) {
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%.tmp8491 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8493 = getelementptr [10 x i8], [10 x i8]*@.str8492, i32 0, i32 0
%.tmp8494 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp8491, i8* %.tmp8493)
%params.8495 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp8494, %m812$.Node.type** %params.8495
%.tmp8496 = load %m812$.Node.type*, %m812$.Node.type** %params.8495
%.tmp8497 = icmp eq %m812$.Node.type* %.tmp8496, null
br i1 %.tmp8497, label %.if.true.8498, label %.if.false.8498
.if.true.8498:
%.tmp8499 = bitcast ptr null to %m812$.Node.type*
ret %m812$.Node.type* %.tmp8499
br label %.if.end.8498
.if.false.8498:
br label %.if.end.8498
.if.end.8498:
%.tmp8500 = load %m812$.Node.type*, %m812$.Node.type** %params.8495
%.tmp8501 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8500, i32 0, i32 6
%.tmp8502 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8501
ret %m812$.Node.type* %.tmp8502
}
define %m2437$.Type.type* @m229$node_to_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.ctx.arg, %m812$.Node.type* %.stmt.arg) {
%ctx = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.ctx.arg, %m2437$.CompilerCtx.type** %ctx
%stmt = alloca %m812$.Node.type*
store %m812$.Node.type* %.stmt.arg, %m812$.Node.type** %stmt
%.tmp8503 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8504 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8503, i32 0, i32 0
%.tmp8505 = load i8*, i8** %.tmp8504
%.tmp8507 = getelementptr [11 x i8], [11 x i8]*@.str8506, i32 0, i32 0
%.tmp8508 = call i32(i8*,i8*) @strcmp(i8* %.tmp8505, i8* %.tmp8507)
%.tmp8509 = icmp eq i32 %.tmp8508, 0
br i1 %.tmp8509, label %.if.true.8510, label %.if.false.8510
.if.true.8510:
%.tmp8511 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8512 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8513 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8512, i32 0, i32 6
%.tmp8514 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8513
%.tmp8515 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$node_to_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp8511, %m812$.Node.type* %.tmp8514)
%t.8516 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8515, %m2437$.Type.type** %t.8516
%.tmp8517 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8518 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8517, i32 0, i32 7
%.tmp8519 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8518
%.tmp8520 = icmp ne %m812$.Node.type* %.tmp8519, null
br i1 %.tmp8520, label %.if.true.8521, label %.if.false.8521
.if.true.8521:
%.tmp8522 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8523 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8522, i32 0, i32 7
%.tmp8524 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8523
%.tmp8525 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8524, i32 0, i32 0
%.tmp8526 = load i8*, i8** %.tmp8525
%.tmp8528 = getelementptr [13 x i8], [13 x i8]*@.str8527, i32 0, i32 0
%.tmp8529 = call i32(i8*,i8*) @strcmp(i8* %.tmp8526, i8* %.tmp8528)
%.tmp8530 = icmp eq i32 %.tmp8529, 0
br i1 %.tmp8530, label %.if.true.8531, label %.if.false.8531
.if.true.8531:
%.tmp8532 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
%fn_type.8533 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8532, %m2437$.Type.type** %fn_type.8533
%.tmp8534 = load %m2437$.Type.type*, %m2437$.Type.type** %fn_type.8533
%.tmp8535 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8534, i32 0, i32 0
%.tmp8537 = getelementptr [9 x i8], [9 x i8]*@.str8536, i32 0, i32 0
store i8* %.tmp8537, i8** %.tmp8535
%.tmp8538 = load %m2437$.Type.type*, %m2437$.Type.type** %fn_type.8533
%.tmp8539 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8538, i32 0, i32 3
%.tmp8540 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8516
store %m2437$.Type.type* %.tmp8540, %m2437$.Type.type** %.tmp8539
%.tmp8541 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8542 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8541, i32 0, i32 7
%.tmp8543 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8542
%.tmp8544 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8543, i32 0, i32 6
%.tmp8545 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8544
%.tmp8546 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8545, i32 0, i32 7
%.tmp8547 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8546
%fst_operator.8548 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp8547, %m812$.Node.type** %fst_operator.8548
%.tmp8549 = load %m812$.Node.type*, %m812$.Node.type** %fst_operator.8548
%.tmp8550 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8549, i32 0, i32 0
%.tmp8551 = load i8*, i8** %.tmp8550
%.tmp8553 = getelementptr [15 x i8], [15 x i8]*@.str8552, i32 0, i32 0
%.tmp8554 = call i32(i8*,i8*) @strcmp(i8* %.tmp8551, i8* %.tmp8553)
%.tmp8555 = icmp eq i32 %.tmp8554, 0
br i1 %.tmp8555, label %.if.true.8556, label %.if.false.8556
.if.true.8556:
%.tmp8557 = load %m2437$.Type.type*, %m2437$.Type.type** %fn_type.8533
%.tmp8558 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8557, i32 0, i32 3
%.tmp8559 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8558
%last_fn_value.8560 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8559, %m2437$.Type.type** %last_fn_value.8560
%.tmp8562 = load %m812$.Node.type*, %m812$.Node.type** %fst_operator.8548
%.tmp8563 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8562, i32 0, i32 6
%.tmp8564 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8563
%t.8565 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp8564, %m812$.Node.type** %t.8565
br label %.for.start.8561
.for.start.8561:
%.tmp8566 = load %m812$.Node.type*, %m812$.Node.type** %t.8565
%.tmp8567 = icmp ne %m812$.Node.type* %.tmp8566, null
br i1 %.tmp8567, label %.for.continue.8561, label %.for.end.8561
.for.continue.8561:
%.tmp8568 = load %m2437$.Type.type*, %m2437$.Type.type** %last_fn_value.8560
%.tmp8569 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8568, i32 0, i32 4
%.tmp8570 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8571 = load %m812$.Node.type*, %m812$.Node.type** %t.8565
%.tmp8572 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8571, i32 0, i32 6
%.tmp8573 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8572
%.tmp8574 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$node_to_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp8570, %m812$.Node.type* %.tmp8573)
store %m2437$.Type.type* %.tmp8574, %m2437$.Type.type** %.tmp8569
%.tmp8575 = load %m2437$.Type.type*, %m2437$.Type.type** %last_fn_value.8560
%.tmp8576 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8575, i32 0, i32 4
%.tmp8577 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8576
store %m2437$.Type.type* %.tmp8577, %m2437$.Type.type** %last_fn_value.8560
%.tmp8578 = load %m812$.Node.type*, %m812$.Node.type** %t.8565
%.tmp8579 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8578, i32 0, i32 7
%.tmp8580 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8579
store %m812$.Node.type* %.tmp8580, %m812$.Node.type** %t.8565
br label %.for.start.8561
.for.end.8561:
br label %.if.end.8556
.if.false.8556:
br label %.if.end.8556
.if.end.8556:
%.tmp8581 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
%t_ptr.8582 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8581, %m2437$.Type.type** %t_ptr.8582
%.tmp8583 = load %m2437$.Type.type*, %m2437$.Type.type** %t_ptr.8582
%.tmp8584 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8583, i32 0, i32 0
%.tmp8586 = getelementptr [4 x i8], [4 x i8]*@.str8585, i32 0, i32 0
store i8* %.tmp8586, i8** %.tmp8584
%.tmp8587 = load %m2437$.Type.type*, %m2437$.Type.type** %t_ptr.8582
%.tmp8588 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8587, i32 0, i32 3
%.tmp8589 = load %m2437$.Type.type*, %m2437$.Type.type** %fn_type.8533
store %m2437$.Type.type* %.tmp8589, %m2437$.Type.type** %.tmp8588
%.tmp8590 = load %m2437$.Type.type*, %m2437$.Type.type** %t_ptr.8582
store %m2437$.Type.type* %.tmp8590, %m2437$.Type.type** %t.8516
br label %.if.end.8531
.if.false.8531:
br label %.if.end.8531
.if.end.8531:
br label %.if.end.8521
.if.false.8521:
br label %.if.end.8521
.if.end.8521:
%.tmp8591 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8516
ret %m2437$.Type.type* %.tmp8591
br label %.if.end.8510
.if.false.8510:
br label %.if.end.8510
.if.end.8510:
%.tmp8592 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
%t.8593 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8592, %m2437$.Type.type** %t.8593
%.tmp8594 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8595 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8594, i32 0, i32 0
%.tmp8596 = load i8*, i8** %.tmp8595
%.tmp8598 = getelementptr [10 x i8], [10 x i8]*@.str8597, i32 0, i32 0
%.tmp8599 = call i32(i8*,i8*) @strcmp(i8* %.tmp8596, i8* %.tmp8598)
%.tmp8600 = icmp eq i32 %.tmp8599, 0
br i1 %.tmp8600, label %.if.true.8601, label %.if.false.8601
.if.true.8601:
%.tmp8602 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8603 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8602, i32 0, i32 0
%.tmp8605 = getelementptr [7 x i8], [7 x i8]*@.str8604, i32 0, i32 0
store i8* %.tmp8605, i8** %.tmp8603
%.tmp8606 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8607 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8606, i32 0, i32 1
store i8* null, i8** %.tmp8607
%.tmp8608 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8609 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8608, i32 0, i32 6
%.tmp8610 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8609
%.tmp8612 = getelementptr [5 x i8], [5 x i8]*@.str8611, i32 0, i32 0
%.tmp8613 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp8610, i8* %.tmp8612)
%curr_type.8614 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp8613, %m812$.Node.type** %curr_type.8614
%.tmp8615 = load %m812$.Node.type*, %m812$.Node.type** %curr_type.8614
%.tmp8616 = icmp ne %m812$.Node.type* %.tmp8615, null
br i1 %.tmp8616, label %.if.true.8617, label %.if.false.8617
.if.true.8617:
%.tmp8618 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8619 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8618, i32 0, i32 3
%.tmp8620 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8621 = load %m812$.Node.type*, %m812$.Node.type** %curr_type.8614
%.tmp8622 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8621, i32 0, i32 6
%.tmp8623 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8622
%.tmp8624 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$node_to_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp8620, %m812$.Node.type* %.tmp8623)
store %m2437$.Type.type* %.tmp8624, %m2437$.Type.type** %.tmp8619
%.tmp8625 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8626 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8625, i32 0, i32 3
%.tmp8627 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8626
%.tmp8628 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8627, i32 0, i32 1
%.tmp8629 = load %m812$.Node.type*, %m812$.Node.type** %curr_type.8614
%.tmp8630 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8629, i32 0, i32 7
%.tmp8631 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8630
%.tmp8632 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8631, i32 0, i32 1
%.tmp8633 = load i8*, i8** %.tmp8632
store i8* %.tmp8633, i8** %.tmp8628
%.tmp8634 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8635 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8634, i32 0, i32 3
%.tmp8636 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8635
%curr_t.8637 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8636, %m2437$.Type.type** %curr_t.8637
%.tmp8639 = load %m812$.Node.type*, %m812$.Node.type** %curr_type.8614
%.tmp8640 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8639, i32 0, i32 7
%.tmp8641 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8640
%.tmp8643 = getelementptr [5 x i8], [5 x i8]*@.str8642, i32 0, i32 0
%.tmp8644 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp8641, i8* %.tmp8643)
store %m812$.Node.type* %.tmp8644, %m812$.Node.type** %curr_type.8614
br label %.for.start.8638
.for.start.8638:
%.tmp8645 = load %m812$.Node.type*, %m812$.Node.type** %curr_type.8614
%.tmp8646 = icmp ne %m812$.Node.type* %.tmp8645, null
br i1 %.tmp8646, label %.for.continue.8638, label %.for.end.8638
.for.continue.8638:
%.tmp8647 = load %m2437$.Type.type*, %m2437$.Type.type** %curr_t.8637
%.tmp8648 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8647, i32 0, i32 4
%.tmp8649 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8650 = load %m812$.Node.type*, %m812$.Node.type** %curr_type.8614
%.tmp8651 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8650, i32 0, i32 6
%.tmp8652 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8651
%.tmp8653 = call %m2437$.Type.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$node_to_type.m2437$.Type.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp8649, %m812$.Node.type* %.tmp8652)
store %m2437$.Type.type* %.tmp8653, %m2437$.Type.type** %.tmp8648
%.tmp8654 = load %m2437$.Type.type*, %m2437$.Type.type** %curr_t.8637
%.tmp8655 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8654, i32 0, i32 4
%.tmp8656 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8655
%.tmp8657 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8656, i32 0, i32 1
%.tmp8658 = load %m812$.Node.type*, %m812$.Node.type** %curr_type.8614
%.tmp8659 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8658, i32 0, i32 7
%.tmp8660 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8659
%.tmp8661 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8660, i32 0, i32 1
%.tmp8662 = load i8*, i8** %.tmp8661
store i8* %.tmp8662, i8** %.tmp8657
%.tmp8663 = load %m2437$.Type.type*, %m2437$.Type.type** %curr_t.8637
%.tmp8664 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8663, i32 0, i32 4
%.tmp8665 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8664
store %m2437$.Type.type* %.tmp8665, %m2437$.Type.type** %curr_t.8637
%.tmp8666 = load %m812$.Node.type*, %m812$.Node.type** %curr_type.8614
%.tmp8667 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8666, i32 0, i32 7
%.tmp8668 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8667
%.tmp8670 = getelementptr [5 x i8], [5 x i8]*@.str8669, i32 0, i32 0
%.tmp8671 = call %m812$.Node.type*(%m812$.Node.type*,i8*) @m229$skip_to_type.m812$.Node.typep.m812$.Node.typep.cp(%m812$.Node.type* %.tmp8668, i8* %.tmp8670)
store %m812$.Node.type* %.tmp8671, %m812$.Node.type** %curr_type.8614
br label %.for.start.8638
.for.end.8638:
br label %.if.end.8617
.if.false.8617:
br label %.if.end.8617
.if.end.8617:
br label %.if.end.8601
.if.false.8601:
%.tmp8672 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8673 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8672, i32 0, i32 0
%.tmp8674 = load i8*, i8** %.tmp8673
%.tmp8676 = getelementptr [12 x i8], [12 x i8]*@.str8675, i32 0, i32 0
%.tmp8677 = call i32(i8*,i8*) @strcmp(i8* %.tmp8674, i8* %.tmp8676)
%.tmp8678 = icmp eq i32 %.tmp8677, 0
br i1 %.tmp8678, label %.if.true.8679, label %.if.false.8679
.if.true.8679:
%err_msg.8680 = alloca i8*
store i8* null, i8** %err_msg.8680
%.tmp8681 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8682 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8683 = call %m2437$.ScopeItem.type*(%m2437$.CompilerCtx.type*,%m812$.Node.type*) @m229$find_defined.m2437$.ScopeItem.typep.m2437$.CompilerCtx.typep.m812$.Node.typep(%m2437$.CompilerCtx.type* %.tmp8681, %m812$.Node.type* %.tmp8682)
%base.8684 = alloca %m2437$.ScopeItem.type*
store %m2437$.ScopeItem.type* %.tmp8683, %m2437$.ScopeItem.type** %base.8684
%.tmp8685 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %base.8684
%.tmp8686 = icmp eq %m2437$.ScopeItem.type* %.tmp8685, null
br i1 %.tmp8686, label %.if.true.8687, label %.if.false.8687
.if.true.8687:
%.tmp8688 = getelementptr i8*, i8** %err_msg.8680, i32 0
%.tmp8690 = getelementptr [37 x i8], [37 x i8]*@.str8689, i32 0, i32 0
%.tmp8691 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8692 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8691, i32 0, i32 6
%.tmp8693 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8692
%.tmp8694 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8693, i32 0, i32 1
%.tmp8695 = load i8*, i8** %.tmp8694
%.tmp8696 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8688, i8* %.tmp8690, i8* %.tmp8695)
%.tmp8697 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8698 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8699 = load i8*, i8** %err_msg.8680
call void(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$new_error.v.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp8697, %m812$.Node.type* %.tmp8698, i8* %.tmp8699)
%.tmp8700 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8701 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8700, i32 0, i32 0
%.tmp8703 = getelementptr [6 x i8], [6 x i8]*@.str8702, i32 0, i32 0
store i8* %.tmp8703, i8** %.tmp8701
%.tmp8704 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
ret %m2437$.Type.type* %.tmp8704
br label %.if.end.8687
.if.false.8687:
br label %.if.end.8687
.if.end.8687:
%.tmp8705 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8706 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8705, i32 0, i32 0
%.tmp8708 = getelementptr [10 x i8], [10 x i8]*@.str8707, i32 0, i32 0
store i8* %.tmp8708, i8** %.tmp8706
%.tmp8709 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8710 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8709, i32 0, i32 1
%.tmp8711 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %base.8684
%.tmp8712 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp8711, i32 0, i32 0
%.tmp8713 = load i8*, i8** %.tmp8712
store i8* %.tmp8713, i8** %.tmp8710
%.tmp8714 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8715 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8714, i32 0, i32 2
%.tmp8716 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %base.8684
%.tmp8717 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp8716, i32 0, i32 1
%.tmp8718 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %.tmp8717
%.tmp8719 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp8718, i32 0, i32 0
%.tmp8720 = load i8*, i8** %.tmp8719
store i8* %.tmp8720, i8** %.tmp8715
%.tmp8721 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8722 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8721, i32 0, i32 3
%.tmp8723 = load %m2437$.ScopeItem.type*, %m2437$.ScopeItem.type** %base.8684
%.tmp8724 = getelementptr %m2437$.ScopeItem.type, %m2437$.ScopeItem.type* %.tmp8723, i32 0, i32 1
%.tmp8725 = load %m2437$.AssignableInfo.type*, %m2437$.AssignableInfo.type** %.tmp8724
%.tmp8726 = getelementptr %m2437$.AssignableInfo.type, %m2437$.AssignableInfo.type* %.tmp8725, i32 0, i32 4
%.tmp8727 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8726
store %m2437$.Type.type* %.tmp8727, %m2437$.Type.type** %.tmp8722
br label %.if.end.8679
.if.false.8679:
%.tmp8728 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8729 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8728, i32 0, i32 1
%.tmp8730 = load i8*, i8** %.tmp8729
%.tmp8732 = getelementptr [4 x i8], [4 x i8]*@.str8731, i32 0, i32 0
%.tmp8733 = call i32(i8*,i8*) @strcmp(i8* %.tmp8730, i8* %.tmp8732)
%.tmp8734 = icmp eq i32 %.tmp8733, 0
br i1 %.tmp8734, label %.if.true.8735, label %.if.false.8735
.if.true.8735:
%.tmp8736 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8737 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8736, i32 0, i32 0
%.tmp8739 = getelementptr [4 x i8], [4 x i8]*@.str8738, i32 0, i32 0
store i8* %.tmp8739, i8** %.tmp8737
%.tmp8740 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8741 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8740, i32 0, i32 3
%.tmp8742 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
store %m2437$.Type.type* %.tmp8742, %m2437$.Type.type** %.tmp8741
%.tmp8743 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8744 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8743, i32 0, i32 3
%.tmp8745 = load %m2437$.Type.type*, %m2437$.Type.type** %.tmp8744
%.tmp8746 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8745, i32 0, i32 0
%.tmp8748 = getelementptr [4 x i8], [4 x i8]*@.str8747, i32 0, i32 0
store i8* %.tmp8748, i8** %.tmp8746
br label %.if.end.8735
.if.false.8735:
%.tmp8749 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8750 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8749, i32 0, i32 0
%.tmp8751 = load i8*, i8** %.tmp8750
%.tmp8753 = getelementptr [5 x i8], [5 x i8]*@.str8752, i32 0, i32 0
%.tmp8754 = call i32(i8*,i8*) @strcmp(i8* %.tmp8751, i8* %.tmp8753)
%.tmp8755 = icmp eq i32 %.tmp8754, 0
br i1 %.tmp8755, label %.if.true.8756, label %.if.false.8756
.if.true.8756:
%.tmp8757 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8758 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8757, i32 0, i32 0
%.tmp8759 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8760 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8759, i32 0, i32 1
%.tmp8761 = load i8*, i8** %.tmp8760
store i8* %.tmp8761, i8** %.tmp8758
br label %.if.end.8756
.if.false.8756:
%.tmp8762 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8763 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8762, i32 0, i32 1
%.tmp8764 = load i8*, i8** %.tmp8763
%.tmp8766 = getelementptr [4 x i8], [4 x i8]*@.str8765, i32 0, i32 0
%.tmp8767 = call i32(i8*,i8*) @strcmp(i8* %.tmp8764, i8* %.tmp8766)
%.tmp8768 = icmp eq i32 %.tmp8767, 0
br i1 %.tmp8768, label %.if.true.8769, label %.if.false.8769
.if.true.8769:
%.tmp8770 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
%.tmp8771 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8770, i32 0, i32 0
%.tmp8773 = getelementptr [7 x i8], [7 x i8]*@.str8772, i32 0, i32 0
store i8* %.tmp8773, i8** %.tmp8771
br label %.if.end.8769
.if.false.8769:
%.tmp8774 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8775 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8777 = getelementptr [54 x i8], [54 x i8]*@.str8776, i32 0, i32 0
%.tmp8778 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp8774, %m812$.Node.type* %.tmp8775, i8* %.tmp8777)
%.tmp8779 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8780 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8779, i32 0, i32 0
%.tmp8781 = load i8*, i8** %.tmp8780
%.tmp8782 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8783 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8782, i32 0, i32 1
%.tmp8784 = load i8*, i8** %.tmp8783
%.tmp8785 = call i32(i8*,...) @printf(i8* %.tmp8778, i8* %.tmp8781, i8* %.tmp8784)
%.tmp8786 = bitcast ptr null to %m2437$.Type.type*
ret %m2437$.Type.type* %.tmp8786
br label %.if.end.8769
.if.end.8769:
br label %.if.end.8756
.if.end.8756:
br label %.if.end.8735
.if.end.8735:
br label %.if.end.8679
.if.end.8679:
br label %.if.end.8601
.if.end.8601:
%.tmp8788 = load %m812$.Node.type*, %m812$.Node.type** %stmt
%.tmp8789 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8788, i32 0, i32 7
%.tmp8790 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8789
%ptr.8791 = alloca %m812$.Node.type*
store %m812$.Node.type* %.tmp8790, %m812$.Node.type** %ptr.8791
br label %.for.start.8787
.for.start.8787:
%.tmp8792 = load %m812$.Node.type*, %m812$.Node.type** %ptr.8791
%.tmp8793 = icmp ne %m812$.Node.type* %.tmp8792, null
br i1 %.tmp8793, label %.for.continue.8787, label %.for.end.8787
.for.continue.8787:
%.tmp8794 = load %m812$.Node.type*, %m812$.Node.type** %ptr.8791
%.tmp8795 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8794, i32 0, i32 1
%.tmp8796 = load i8*, i8** %.tmp8795
%.tmp8798 = getelementptr [2 x i8], [2 x i8]*@.str8797, i32 0, i32 0
%.tmp8799 = call i32(i8*,i8*) @strcmp(i8* %.tmp8796, i8* %.tmp8798)
%.tmp8800 = icmp eq i32 %.tmp8799, 0
br i1 %.tmp8800, label %.if.true.8801, label %.if.false.8801
.if.true.8801:
%.tmp8802 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
%pt.8803 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8802, %m2437$.Type.type** %pt.8803
%.tmp8804 = load %m2437$.Type.type*, %m2437$.Type.type** %pt.8803
%.tmp8805 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8804, i32 0, i32 0
%.tmp8807 = getelementptr [4 x i8], [4 x i8]*@.str8806, i32 0, i32 0
store i8* %.tmp8807, i8** %.tmp8805
%.tmp8808 = load %m2437$.Type.type*, %m2437$.Type.type** %pt.8803
%.tmp8809 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8808, i32 0, i32 3
%.tmp8810 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
store %m2437$.Type.type* %.tmp8810, %m2437$.Type.type** %.tmp8809
%.tmp8811 = load %m2437$.Type.type*, %m2437$.Type.type** %pt.8803
store %m2437$.Type.type* %.tmp8811, %m2437$.Type.type** %t.8593
br label %.if.end.8801
.if.false.8801:
%.tmp8812 = load %m812$.Node.type*, %m812$.Node.type** %ptr.8791
%.tmp8813 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8812, i32 0, i32 1
%.tmp8814 = load i8*, i8** %.tmp8813
%.tmp8816 = getelementptr [2 x i8], [2 x i8]*@.str8815, i32 0, i32 0
%.tmp8817 = call i32(i8*,i8*) @strcmp(i8* %.tmp8814, i8* %.tmp8816)
%.tmp8818 = icmp eq i32 %.tmp8817, 0
br i1 %.tmp8818, label %.if.true.8819, label %.if.false.8819
.if.true.8819:
%.tmp8820 = load %m812$.Node.type*, %m812$.Node.type** %ptr.8791
%.tmp8821 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8820, i32 0, i32 7
%.tmp8822 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8821
%.tmp8823 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8822, i32 0, i32 1
%.tmp8824 = load i8*, i8** %.tmp8823
%.tmp8826 = getelementptr [2 x i8], [2 x i8]*@.str8825, i32 0, i32 0
%.tmp8827 = call i32(i8*,i8*) @strcmp(i8* %.tmp8824, i8* %.tmp8826)
%.tmp8828 = icmp eq i32 %.tmp8827, 0
br i1 %.tmp8828, label %.if.true.8829, label %.if.false.8829
.if.true.8829:
%.tmp8830 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
%slice_type.8831 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8830, %m2437$.Type.type** %slice_type.8831
%.tmp8832 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_type.8831
%.tmp8833 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8832, i32 0, i32 0
%.tmp8835 = getelementptr [7 x i8], [7 x i8]*@.str8834, i32 0, i32 0
store i8* %.tmp8835, i8** %.tmp8833
%.tmp8836 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_type.8831
%.tmp8837 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8836, i32 0, i32 1
%.tmp8839 = getelementptr [6 x i8], [6 x i8]*@.str8838, i32 0, i32 0
store i8* %.tmp8839, i8** %.tmp8837
%.tmp8840 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
%slice_c_array.8841 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8840, %m2437$.Type.type** %slice_c_array.8841
%.tmp8842 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_c_array.8841
%.tmp8843 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8842, i32 0, i32 0
%.tmp8845 = getelementptr [4 x i8], [4 x i8]*@.str8844, i32 0, i32 0
store i8* %.tmp8845, i8** %.tmp8843
%.tmp8846 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_c_array.8841
%.tmp8847 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8846, i32 0, i32 1
%.tmp8849 = getelementptr [6 x i8], [6 x i8]*@.str8848, i32 0, i32 0
store i8* %.tmp8849, i8** %.tmp8847
%.tmp8850 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_c_array.8841
%.tmp8851 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8850, i32 0, i32 3
%.tmp8852 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
store %m2437$.Type.type* %.tmp8852, %m2437$.Type.type** %.tmp8851
%.tmp8853 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_type.8831
%.tmp8854 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8853, i32 0, i32 3
%.tmp8855 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_c_array.8841
store %m2437$.Type.type* %.tmp8855, %m2437$.Type.type** %.tmp8854
%.tmp8856 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
%slice_len.8857 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8856, %m2437$.Type.type** %slice_len.8857
%.tmp8858 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_len.8857
%.tmp8859 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8858, i32 0, i32 0
%.tmp8861 = getelementptr [4 x i8], [4 x i8]*@.str8860, i32 0, i32 0
store i8* %.tmp8861, i8** %.tmp8859
%.tmp8862 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_len.8857
%.tmp8863 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8862, i32 0, i32 1
%.tmp8865 = getelementptr [4 x i8], [4 x i8]*@.str8864, i32 0, i32 0
store i8* %.tmp8865, i8** %.tmp8863
%.tmp8866 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_c_array.8841
%.tmp8867 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8866, i32 0, i32 4
%.tmp8868 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_len.8857
store %m2437$.Type.type* %.tmp8868, %m2437$.Type.type** %.tmp8867
%.tmp8869 = call %m2437$.Type.type*() @m229$new_type.m2437$.Type.typep()
%slice_cap.8870 = alloca %m2437$.Type.type*
store %m2437$.Type.type* %.tmp8869, %m2437$.Type.type** %slice_cap.8870
%.tmp8871 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_cap.8870
%.tmp8872 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8871, i32 0, i32 0
%.tmp8874 = getelementptr [4 x i8], [4 x i8]*@.str8873, i32 0, i32 0
store i8* %.tmp8874, i8** %.tmp8872
%.tmp8875 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_cap.8870
%.tmp8876 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8875, i32 0, i32 1
%.tmp8878 = getelementptr [4 x i8], [4 x i8]*@.str8877, i32 0, i32 0
store i8* %.tmp8878, i8** %.tmp8876
%.tmp8879 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_len.8857
%.tmp8880 = getelementptr %m2437$.Type.type, %m2437$.Type.type* %.tmp8879, i32 0, i32 4
%.tmp8881 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_cap.8870
store %m2437$.Type.type* %.tmp8881, %m2437$.Type.type** %.tmp8880
%.tmp8882 = load %m2437$.Type.type*, %m2437$.Type.type** %slice_type.8831
store %m2437$.Type.type* %.tmp8882, %m2437$.Type.type** %t.8593
%.tmp8883 = load %m812$.Node.type*, %m812$.Node.type** %ptr.8791
%.tmp8884 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8883, i32 0, i32 7
%.tmp8885 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8884
store %m812$.Node.type* %.tmp8885, %m812$.Node.type** %ptr.8791
br label %.if.end.8829
.if.false.8829:
br label %.if.end.8829
.if.end.8829:
br label %.if.end.8819
.if.false.8819:
%.tmp8886 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %ctx
%.tmp8887 = load %m812$.Node.type*, %m812$.Node.type** %ptr.8791
%.tmp8889 = getelementptr [49 x i8], [49 x i8]*@.str8888, i32 0, i32 0
%.tmp8890 = call i8*(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$err_tmpl.cp.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp8886, %m812$.Node.type* %.tmp8887, i8* %.tmp8889)
%.tmp8891 = load %m812$.Node.type*, %m812$.Node.type** %ptr.8791
%.tmp8892 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8891, i32 0, i32 1
%.tmp8893 = load i8*, i8** %.tmp8892
%.tmp8894 = call i32(i8*,...) @printf(i8* %.tmp8890, i8* %.tmp8893)
%.tmp8895 = bitcast ptr null to %m2437$.Type.type*
ret %m2437$.Type.type* %.tmp8895
br label %.if.end.8819
.if.end.8819:
br label %.if.end.8801
.if.end.8801:
%.tmp8896 = load %m812$.Node.type*, %m812$.Node.type** %ptr.8791
%.tmp8897 = getelementptr %m812$.Node.type, %m812$.Node.type* %.tmp8896, i32 0, i32 7
%.tmp8898 = load %m812$.Node.type*, %m812$.Node.type** %.tmp8897
store %m812$.Node.type* %.tmp8898, %m812$.Node.type** %ptr.8791
br label %.for.start.8787
.for.end.8787:
%.tmp8899 = load %m2437$.Type.type*, %m2437$.Type.type** %t.8593
ret %m2437$.Type.type* %.tmp8899
}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp8900 = load i32, i32* %argc
%.tmp8901 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp8900, i8** %.tmp8901)
%.tmp8902 = load i32, i32* @STDERR
%.tmp8904 = getelementptr [2 x i8], [2 x i8]*@.str8903, i32 0, i32 0
%.tmp8905 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp8902, i8* %.tmp8904)
%stderr.8906 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8905, %m0$.File.type** %stderr.8906
%.tmp8907 = load i8**, i8*** %argv
%.tmp8908 = getelementptr i8*, i8** %.tmp8907, i32 1
%.tmp8909 = load i8*, i8** %.tmp8908
%filename.8910 = alloca i8*
store i8* %.tmp8909, i8** %filename.8910
%.tmp8911 = call %m0$.File.type*() @tmpfile()
%llvm_code.8912 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8911, %m0$.File.type** %llvm_code.8912
%.tmp8913 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8912
%.tmp8914 = load i8*, i8** %filename.8910
%.tmp8915 = call %m2437$.CompilerCtx.type*(%m0$.File.type*,i8*) @m229$new_context.m2437$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp8913, i8* %.tmp8914)
%compiler_ctx.8916 = alloca %m2437$.CompilerCtx.type*
store %m2437$.CompilerCtx.type* %.tmp8915, %m2437$.CompilerCtx.type** %compiler_ctx.8916
%.tmp8917 = load %m2437$.CompilerCtx.type*, %m2437$.CompilerCtx.type** %compiler_ctx.8916
%.tmp8918 = bitcast ptr null to %m812$.Node.type*
%.tmp8919 = load i8*, i8** %filename.8910
%.tmp8920 = call i1(%m2437$.CompilerCtx.type*,%m812$.Node.type*,i8*) @m229$compile_file.b.m2437$.CompilerCtx.typep.m812$.Node.typep.cp(%m2437$.CompilerCtx.type* %.tmp8917, %m812$.Node.type* %.tmp8918, i8* %.tmp8919)
br i1 %.tmp8920, label %.if.true.8921, label %.if.false.8921
.if.true.8921:
%.tmp8922 = load %m0$.File.type*, %m0$.File.type** %stderr.8906
%.tmp8924 = getelementptr [34 x i8], [34 x i8]*@.str8923, i32 0, i32 0
%.tmp8925 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8922, i8* %.tmp8924)
ret i32 1
br label %.if.end.8921
.if.false.8921:
br label %.if.end.8921
.if.end.8921:
%.tmp8926 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8912
%.tmp8927 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp8926)
%.tmp8928 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8912
%.tmp8929 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp8928)
%llvm_code_size.8930 = alloca i32
store i32 %.tmp8929, i32* %llvm_code_size.8930
%.tmp8931 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8912
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp8931)
%.tmp8933 = getelementptr [30 x i8], [30 x i8]*@.str8932, i32 0, i32 0
%.tmp8935 = getelementptr [2 x i8], [2 x i8]*@.str8934, i32 0, i32 0
%.tmp8936 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp8933, i8* %.tmp8935)
%proc.8937 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8936, %m0$.File.type** %proc.8937
%.tmp8938 = load %m0$.File.type*, %m0$.File.type** %proc.8937
%.tmp8939 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp8938)
%.tmp8940 = load %m0$.File.type*, %m0$.File.type** %llvm_code.8912
%.tmp8941 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp8940)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp8939, i32 %.tmp8941)
%.tmp8942 = load %m0$.File.type*, %m0$.File.type** %proc.8937
%.tmp8943 = icmp eq %m0$.File.type* %.tmp8942, null
br i1 %.tmp8943, label %.if.true.8944, label %.if.false.8944
.if.true.8944:
%.tmp8945 = load %m0$.File.type*, %m0$.File.type** %stderr.8906
%.tmp8947 = getelementptr [28 x i8], [28 x i8]*@.str8946, i32 0, i32 0
%.tmp8948 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8945, i8* %.tmp8947)
ret i32 0
br label %.if.end.8944
.if.false.8944:
br label %.if.end.8944
.if.end.8944:
%.tmp8949 = load %m0$.File.type*, %m0$.File.type** %proc.8937
%.tmp8950 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp8949)
%.tmp8951 = icmp ne i32 %.tmp8950, 0
br i1 %.tmp8951, label %.if.true.8952, label %.if.false.8952
.if.true.8952:
%.tmp8953 = load %m0$.File.type*, %m0$.File.type** %stderr.8906
%.tmp8955 = getelementptr [24 x i8], [24 x i8]*@.str8954, i32 0, i32 0
%.tmp8956 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8953, i8* %.tmp8955)
ret i32 0
br label %.if.end.8952
.if.false.8952:
br label %.if.end.8952
.if.end.8952:
%.tmp8958 = getelementptr [16 x i8], [16 x i8]*@.str8957, i32 0, i32 0
%.tmp8960 = getelementptr [2 x i8], [2 x i8]*@.str8959, i32 0, i32 0
%.tmp8961 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp8958, i8* %.tmp8960)
%cc_proc.8962 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp8961, %m0$.File.type** %cc_proc.8962
%.tmp8963 = load %m0$.File.type*, %m0$.File.type** %cc_proc.8962
%.tmp8964 = icmp eq %m0$.File.type* %.tmp8963, null
br i1 %.tmp8964, label %.if.true.8965, label %.if.false.8965
.if.true.8965:
%.tmp8966 = load %m0$.File.type*, %m0$.File.type** %stderr.8906
%.tmp8968 = getelementptr [28 x i8], [28 x i8]*@.str8967, i32 0, i32 0
%.tmp8969 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8966, i8* %.tmp8968)
ret i32 0
br label %.if.end.8965
.if.false.8965:
br label %.if.end.8965
.if.end.8965:
%.tmp8970 = load %m0$.File.type*, %m0$.File.type** %proc.8937
%.tmp8971 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp8970)
%.tmp8972 = icmp ne i32 %.tmp8971, 0
br i1 %.tmp8972, label %.if.true.8973, label %.if.false.8973
.if.true.8973:
%.tmp8974 = load %m0$.File.type*, %m0$.File.type** %stderr.8906
%.tmp8976 = getelementptr [22 x i8], [22 x i8]*@.str8975, i32 0, i32 0
%.tmp8977 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8974, i8* %.tmp8976)
br label %.if.end.8973
.if.false.8973:
%.tmp8979 = getelementptr [32 x i8], [32 x i8]*@.str8978, i32 0, i32 0
%.tmp8980 = load i8*, i8** %filename.8910
%.tmp8981 = call i32(i8*,...) @printf(i8* %.tmp8979, i8* %.tmp8980)
br label %.if.end.8973
.if.end.8973:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp8982 = load i32, i32* %argc
%.tmp8983 = icmp eq i32 %.tmp8982, 2
br i1 %.tmp8983, label %.if.true.8984, label %.if.false.8984
.if.true.8984:
ret void
br label %.if.end.8984
.if.false.8984:
br label %.if.end.8984
.if.end.8984:
%.tmp8986 = getelementptr [21 x i8], [21 x i8]*@.str8985, i32 0, i32 0
%tmpl.8987 = alloca i8*
store i8* %.tmp8986, i8** %tmpl.8987
%.tmp8988 = load i8**, i8*** %argv
%.tmp8989 = getelementptr i8*, i8** %.tmp8988, i32 0
%.tmp8990 = load i8*, i8** %.tmp8989
%.tmp8991 = call i32(i8*) @strlen(i8* %.tmp8990)
%.tmp8992 = load i8*, i8** %tmpl.8987
%.tmp8993 = call i32(i8*) @strlen(i8* %.tmp8992)
%.tmp8994 = add i32 %.tmp8991, %.tmp8993
%len_filename.8995 = alloca i32
store i32 %.tmp8994, i32* %len_filename.8995
%.tmp8996 = load i32, i32* %len_filename.8995
%.tmp8997 = call i8*(i32) @malloc(i32 %.tmp8996)
%buf.8998 = alloca i8*
store i8* %.tmp8997, i8** %buf.8998
%.tmp8999 = load i8*, i8** %buf.8998
%.tmp9000 = load i8*, i8** %tmpl.8987
%.tmp9001 = load i8**, i8*** %argv
%.tmp9002 = getelementptr i8*, i8** %.tmp9001, i32 0
%.tmp9003 = load i8*, i8** %.tmp9002
%.tmp9004 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp8999, i8* %.tmp9000, i8* %.tmp9003)
%.tmp9005 = load i8*, i8** %buf.8998
%.tmp9006 = call i32(i8*) @puts(i8* %.tmp9005)
%.tmp9007 = load i8*, i8** %buf.8998
call void(i8*) @free(i8* %.tmp9007)
call void(i32) @exit(i32 1)
ret void
}
@.str226 = constant [2 x i8] c"r\00"
@.str307 = constant [1 x i8] c"\00"
@.str423 = constant [16 x i8] c"digit too large\00"
@.str431 = constant [7 x i8] c"NUMBER\00"
@.str461 = constant [15 x i8] c"WORD too large\00"
@.str469 = constant [5 x i8] c"WORD\00"
@.str490 = constant [7 x i8] c"STRING\00"
@.str511 = constant [15 x i8] c"char too large\00"
@.str532 = constant [4 x i8] c"CHR\00"
@.str540 = constant [3 x i8] c"NL\00"
@.str542 = constant [2 x i8] c"\0A\00"
@.str556 = constant [9 x i8] c"OPERATOR\00"
@.str558 = constant [2 x i8] c"-\00"
@.str585 = constant [8 x i8] c"COMMENT\00"
@.str594 = constant [47 x i8] c"%d:%d error: found non ascii token: '%c' (%d)\0A\00"
@.str609 = constant [9 x i8] c"OPERATOR\00"
@.str619 = constant [3 x i8] c"==\00"
@.str631 = constant [3 x i8] c"!=\00"
@.str643 = constant [3 x i8] c">=\00"
@.str655 = constant [3 x i8] c"<=\00"
@.str671 = constant [13 x i8] c"error on ..\0A\00"
@.str675 = constant [4 x i8] c"...\00"
@.str678 = constant [8 x i8] c"KEYWORD\00"
@.str693 = constant [4 x i8] c"EOF\00"
@.str695 = constant [1 x i8] c"\00"
@.str723 = constant [61 x i8] c"lexer: reached end of file while scanning for 'STRING' token\00"
@.str781 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
@.str797 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
@.str853 = constant [2 x i8] c"(\00"
@.str873 = constant [2 x i8] c"|\00"
@.str893 = constant [2 x i8] c")\00"
@.str902 = constant [4 x i8] c"EOF\00"
@.str919 = constant [2 x i8] c"|\00"
@.str928 = constant [2 x i8] c")\00"
@.str934 = constant [48 x i8] c"[%d:%d] malformed grammar, expected | got '%s'\0A\00"
@.str957 = constant [2 x i8] c"|\00"
@.str974 = constant [2 x i8] c")\00"
@.str980 = constant [22 x i8] c"open brace not closed\00"
@.str994 = constant [2 x i8] c"+\00"
@.str1013 = constant [2 x i8] c"*\00"
@.str1032 = constant [2 x i8] c"?\00"
@.str1053 = constant [2 x i8] c"(\00"
@.str1062 = constant [5 x i8] c"WORD\00"
@.str1084 = constant [5 x i8] c"WORD\00"
@.str1091 = constant [7 x i8] c"STRING\00"
@.str1133 = constant [7 x i8] c"STRING\00"
@.str1158 = constant [17 x i8] c"rule name: '%s'\0A\00"
@.str1167 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1199 = constant [5 x i8] c"WORD\00"
@.str1204 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1218 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1232 = constant [2 x i8] c":\00"
@.str1244 = constant [27 x i8] c"expected : after rule name\00"
@.str1287 = constant [4 x i8] c"EOF\00"
@.str1296 = constant [3 x i8] c"NL\00"
@.str1463 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1520 = constant [7 x i8] c"(null)\00"
@.str1522 = constant [15 x i8] c"%s: %s != \22%s\22\00"
@.str1525 = constant [31 x i8] c"unable to match token by value\00"
@.str1600 = constant [13 x i8] c"%s: %s != %s\00"
@.str1603 = constant [30 x i8] c"unable to match token by type\00"
@.str1664 = constant [30 x i8] c"unable to retrieve alias rule\00"
@.str1687 = constant [41 x i8] c"parser.bn: query matcher not implemented\00"
@.str1827 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str1844 = constant [4 x i8] c"EOF\00"
@.str1858 = constant [26 x i8] c"syntax parsing ended here\00"
@.str1893 = constant [2 x i8] c"\0A\00"
@.str1902 = constant [3 x i8] c"  \00"
@.str1911 = constant [7 x i8] c"(null)\00"
@.str1915 = constant [2 x i8] c"{\00"
@.str1921 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str1930 = constant [12 x i8] c"\22value\22: %s\00"
@.str1939 = constant [11 x i8] c"\22line\22: %d\00"
@.str1948 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str1957 = constant [9 x i8] c"\22next\22: \00"
@.str1969 = constant [13 x i8] c"\22children\22: \00"
@.str1982 = constant [2 x i8] c"}\00"
@.str1986 = constant [1847 x i8] c"
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

expression: ( if_block | return | keyword | for_loop | function | assignment | fn_call | declaration | NL )

expressions: (expression)*

block: \22{\22 NL expressions (\22}\22)

for_loop: \22for\22 (declaration | assignment)? (\22;\22) (assignable)? (\22;\22) (assignment)? block (else_block)?
\00"
@.str1989 = constant [1885 x i8] c"%%%1$s.tmp0 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
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
@.str1995 = constant [1 x i8] c"\00"
@.str2011 = constant [6 x i8] c"%s\5C22\00"
@.str2036 = constant [6 x i8] c"%s\5C0A\00"
@.str2050 = constant [6 x i8] c"%s\5C5C\00"
@.str2066 = constant [8 x i8] c"%s\5C%c%c\00"
@.str2084 = constant [5 x i8] c"%s%c\00"
@.str2093 = constant [5 x i8] c"%s%c\00"
@.str2104 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2141 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2146 = constant [3 x i8] c"%d\00"
@.str2154 = constant [6 x i8] c"'\5C%x'\00"
@.str2159 = constant [3 x i8] c"%d\00"
@.str2167 = constant [6 x i8] c"'\5C%c'\00"
@.str2174 = constant [3 x i8] c"10\00"
@.str2181 = constant [5 x i8] c"'%c'\00"
@.str2186 = constant [3 x i8] c"%d\00"
@.str2235 = constant [16 x i8] c"mono_assignable\00"
@.str2246 = constant [9 x i8] c"operator\00"
@.str2283 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2330 = constant [2 x i8] c"+\00"
@.str2337 = constant [2 x i8] c"-\00"
@.str2346 = constant [2 x i8] c"*\00"
@.str2353 = constant [2 x i8] c"/\00"
@.str2361 = constant [2 x i8] c"%\00"
@.str2370 = constant [3 x i8] c"==\00"
@.str2377 = constant [3 x i8] c"!=\00"
@.str2386 = constant [3 x i8] c">=\00"
@.str2393 = constant [3 x i8] c"<=\00"
@.str2402 = constant [2 x i8] c">\00"
@.str2409 = constant [2 x i8] c"<\00"
@.str2418 = constant [2 x i8] c"&\00"
@.str2426 = constant [2 x i8] c"|\00"
@.str2431 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
@.str2474 = constant [12 x i8] c"COFFEE_ROOT\00"
@.str2481 = constant [5 x i8] c"HOME\00"
@.str2486 = constant [11 x i8] c"%s/.coffee\00"
@.str2574 = constant [1 x i8] c"\00"
@.str2620 = constant [5 x i8] c"%c%s\00"
@.str2644 = constant [7 x i8] c".tmp%d\00"
@.str2744 = constant [1 x i8] c"\00"
@.str2786 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2810 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str2829 = constant [6 x i8] c"start\00"
@.str2906 = constant [6 x i8] c"start\00"
@.str2913 = constant [29 x i8] c"Expecting 'start' expression\00"
@.str2916 = constant [7 x i8] c"global\00"
@.str2927 = constant [13 x i8] c"head_comment\00"
@.str2966 = constant [1 x i8] c"\00"
@.str2990 = constant [7 x i8] c"string\00"
@.str2998 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3018 = constant [7 x i8] c"extern\00"
@.str3032 = constant [15 x i8] c"declare %s %s(\00"
@.str3068 = constant [3 x i8] c", \00"
@.str3074 = constant [3 x i8] c"%s\00"
@.str3086 = constant [3 x i8] c")\0A\00"
@.str3103 = constant [5 x i8] c"%s%s\00"
@.str3111 = constant [9 x i8] c"function\00"
@.str3117 = constant [5 x i8] c"main\00"
@.str3132 = constant [6 x i8] c"%s.%s\00"
@.str3153 = constant [3 x i8] c"NL\00"
@.str3161 = constant [7 x i8] c"global\00"
@.str3169 = constant [11 x i8] c"assignable\00"
@.str3200 = constant [9 x i8] c"variable\00"
@.str3212 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3227 = constant [10 x i8] c"typealias\00"
@.str3249 = constant [11 x i8] c"%s.%s.type\00"
@.str3261 = constant [10 x i8] c"typealias\00"
@.str3283 = constant [5 x i8] c"type\00"
@.str3313 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3326 = constant [7 x i8] c"extern\00"
@.str3344 = constant [7 x i8] c"extern\00"
@.str3385 = constant [7 x i8] c"extern\00"
@.str3397 = constant [9 x i8] c"function\00"
@.str3406 = constant [9 x i8] c"function\00"
@.str3445 = constant [14 x i8] c"define %s %s(\00"
@.str3474 = constant [3 x i8] c", \00"
@.str3480 = constant [5 x i8] c"type\00"
@.str3496 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3511 = constant [5 x i8] c") {\0A\00"
@.str3515 = constant [9 x i8] c"function\00"
@.str3524 = constant [6 x i8] c"block\00"
@.str3539 = constant [3 x i8] c"}\0A\00"
@.str3545 = constant [7 x i8] c"import\00"
@.str3601 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str3662 = constant [5 x i8] c"m%d$\00"
@.str3713 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3722 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3754 = constant [9 x i8] c"variable\00"
@.str3759 = constant [5 x i8] c"type\00"
@.str3791 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3804 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3816 = constant [6 x i8] c"block\00"
@.str3823 = constant [12 x i8] c"expressions\00"
@.str3854 = constant [7 x i8] c"struct\00"
@.str3859 = constant [7 x i8] c"WhAT!\0A\00"
@.str3899 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str3911 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str3937 = constant [7 x i8] c"struct\00"
@.str3942 = constant [7 x i8] c"WhAT!\0A\00"
@.str3973 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str3985 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4010 = constant [7 x i8] c"sizeof\00"
@.str4016 = constant [8 x i8] c"fn_args\00"
@.str4023 = constant [11 x i8] c"assignable\00"
@.str4051 = constant [4 x i8] c"int\00"
@.str4064 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4073 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4084 = constant [7 x i8] c"append\00"
@.str4090 = constant [8 x i8] c"fn_args\00"
@.str4097 = constant [11 x i8] c"assignable\00"
@.str4104 = constant [11 x i8] c"assignable\00"
@.str4128 = constant [5 x i8] c".b%d\00"
@.str4162 = constant [8 x i8] c"realloc\00"
@.str4171 = constant [9 x i8] c"function\00"
@.str4184 = constant [4 x i8] c"ptr\00"
@.str4201 = constant [4 x i8] c"chr\00"
@.str4218 = constant [4 x i8] c"ptr\00"
@.str4239 = constant [4 x i8] c"chr\00"
@.str4260 = constant [4 x i8] c"int\00"
@.str4263 = constant [8 x i8] c"realloc\00"
@.str4265 = constant [7 x i8] c"extern\00"
@.str4272 = constant [4 x i8] c"len\00"
@.str4278 = constant [8 x i8] c"fn_args\00"
@.str4285 = constant [11 x i8] c"assignable\00"
@.str4293 = constant [1 x i8] c"\00"
@.str4309 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str4330 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str4336 = constant [1 x i8] c"\00"
@.str4342 = constant [6 x i8] c"%s.bn\00"
@.str4347 = constant [9 x i8] c"%s/%s.bn\00"
@.str4371 = constant [35 x i8] c"unable to compile function address\00"
@.str4377 = constant [8 x i8] c"fn_args\00"
@.str4381 = constant [1 x i8] c"\00"
@.str4390 = constant [4 x i8] c"ptr\00"
@.str4410 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str4434 = constant [11 x i8] c"assignable\00"
@.str4458 = constant [11 x i8] c"assignable\00"
@.str4470 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4488 = constant [5 x i8] c"%s, \00"
@.str4513 = constant [7 x i8] c"vararg\00"
@.str4526 = constant [1 x i8] c"\00"
@.str4530 = constant [58 x i8] c"types.Type for argument %d does not match: '%s', got '%s'\00"
@.str4547 = constant [8 x i8] c"%s%s %s\00"
@.str4564 = constant [7 x i8] c"vararg\00"
@.str4575 = constant [11 x i8] c"assignable\00"
@.str4584 = constant [7 x i8] c"vararg\00"
@.str4590 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4626 = constant [7 x i8] c"vararg\00"
@.str4637 = constant [42 x i8] c"Function '%s' takes %d arguments, 0 given\00"
@.str4655 = constant [5 x i8] c"void\00"
@.str4663 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4695 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4721 = constant [7 x i8] c"return\00"
@.str4733 = constant [3 x i8] c"NL\00"
@.str4751 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4764 = constant [10 x i8] c"ret void\0A\00"
@.str4768 = constant [3 x i8] c"NL\00"
@.str4774 = constant [8 x i8] c"fn_call\00"
@.str4785 = constant [12 x i8] c"declaration\00"
@.str4794 = constant [11 x i8] c"assignment\00"
@.str4802 = constant [11 x i8] c"assignable\00"
@.str4833 = constant [4 x i8] c"ptr\00"
@.str4842 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4852 = constant [9 x i8] c"if_block\00"
@.str4860 = constant [9 x i8] c"for_loop\00"
@.str4868 = constant [8 x i8] c"keyword\00"
@.str4885 = constant [6 x i8] c"break\00"
@.str4896 = constant [4 x i8] c"for\00"
@.str4904 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4915 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4922 = constant [9 x i8] c"continue\00"
@.str4933 = constant [4 x i8] c"for\00"
@.str4941 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4952 = constant [51 x i8] c"'continue' keyword used outside of 'for' statement\00"
@.str4956 = constant [40 x i8] c"Keyword '%s': behaviour not implemented\00"
@.str4966 = constant [9 x i8] c"function\00"
@.str4975 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str4984 = constant [4 x i8] c"ptr\00"
@.str4993 = constant [4 x i8] c"chr\00"
@.str5004 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5013 = constant [9 x i8] c"function\00"
@.str5026 = constant [5 x i8] c"void\00"
@.str5056 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5058 = constant [7 x i8] c"extern\00"
@.str5066 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5075 = constant [9 x i8] c"function\00"
@.str5090 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5092 = constant [7 x i8] c"extern\00"
@.str5100 = constant [5 x i8] c"mmap\00"
@.str5109 = constant [9 x i8] c"function\00"
@.str5135 = constant [4 x i8] c"int\00"
@.str5147 = constant [4 x i8] c"int\00"
@.str5159 = constant [4 x i8] c"int\00"
@.str5171 = constant [4 x i8] c"int\00"
@.str5183 = constant [4 x i8] c"int\00"
@.str5189 = constant [5 x i8] c"mmap\00"
@.str5191 = constant [7 x i8] c"extern\00"
@.str5197 = constant [5 x i8] c"WORD\00"
@.str5220 = constant [9 x i8] c"function\00"
@.str5244 = constant [4 x i8] c"ptr\00"
@.str5253 = constant [7 x i8] c"struct\00"
@.str5267 = constant [1 x i8] c"\00"
@.str5271 = constant [5 x i8] c"@.%d\00"
@.str5285 = constant [101 x i8] c"%%.tmem%d = call i8*(i8*,i32,i32,i32,i32,i32) @mmap(i8* null, i32 72, i32 7, i32 34, i32 -1, i32 0)\0A\00"
@.str5292 = constant [100 x i8] c"call void(i8*,i8*,i8*) @llvm.init.trampoline(i8* %%.tmem%d, i8* bitcast (%s* %s to i8*), i8* null)\0A\00"
@.str5303 = constant [66 x i8] c"%%.trmp%d = call i8*(i8*) @llvm.adjust.trampoline(i8* %%.tmem%d)\0A\00"
@.str5311 = constant [35 x i8] c"%s = bitcast i8* %%.trmp%d to %s*\0A\00"
@.str5332 = constant [14 x i8] c"define %s %s(\00"
@.str5342 = constant [13 x i8] c"%s nest %%.0\00"
@.str5351 = constant [5 x i8] c") {\0A\00"
@.str5357 = constant [6 x i8] c"block\00"
@.str5369 = constant [3 x i8] c"}\0A\00"
@.str5395 = constant [12 x i8] c"expressions\00"
@.str5409 = constant [3 x i8] c"NL\00"
@.str5426 = constant [7 x i8] c"return\00"
@.str5434 = constant [5 x i8] c"void\00"
@.str5445 = constant [21 x i8] c"Missing return value\00"
@.str5450 = constant [10 x i8] c"ret void\0A\00"
@.str5467 = constant [14 x i8] c".for.start.%d\00"
@.str5472 = constant [12 x i8] c".for.end.%d\00"
@.str5477 = constant [4 x i8] c"for\00"
@.str5484 = constant [12 x i8] c"declaration\00"
@.str5495 = constant [11 x i8] c"assignment\00"
@.str5505 = constant [9 x i8] c"OPERATOR\00"
@.str5512 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str5523 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str5530 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str5537 = constant [9 x i8] c"OPERATOR\00"
@.str5548 = constant [9 x i8] c"OPERATOR\00"
@.str5555 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str5564 = constant [9 x i8] c"OPERATOR\00"
@.str5569 = constant [6 x i8] c"block\00"
@.str5574 = constant [11 x i8] c"else_block\00"
@.str5584 = constant [13 x i8] c".for.else.%d\00"
@.str5591 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str5606 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str5625 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5635 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str5642 = constant [6 x i8] c"block\00"
@.str5651 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5658 = constant [5 x i8] c"%s:\0A\00"
@.str5672 = constant [5 x i8] c"type\00"
@.str5687 = constant [11 x i8] c"assignable\00"
@.str5702 = constant [9 x i8] c"variable\00"
@.str5707 = constant [5 x i8] c"WORD\00"
@.str5716 = constant [31 x i8] c"unable to get declaration name\00"
@.str5736 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5748 = constant [6 x i8] c"%s.%d\00"
@.str5805 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str5822 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str5834 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5875 = constant [4 x i8] c"int\00"
@.str5882 = constant [4 x i8] c"chr\00"
@.str5890 = constant [5 x i8] c"bool\00"
@.str5899 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str5908 = constant [4 x i8] c"ptr\00"
@.str5916 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5919 = constant [5 x i8] c"null\00"
@.str5927 = constant [7 x i8] c"struct\00"
@.str5948 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str5968 = constant [10 x i8] c"typealias\00"
@.str5991 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6010 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str6027 = constant [11 x i8] c"assignable\00"
@.str6044 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str6059 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str6066 = constant [6 x i8] c"block\00"
@.str6075 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6082 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str6089 = constant [11 x i8] c"elif_block\00"
@.str6101 = constant [11 x i8] c"else_block\00"
@.str6111 = constant [6 x i8] c"block\00"
@.str6121 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6128 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str6149 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str6158 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str6192 = constant [1 x i8] c"\00"
@.str6203 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6223 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6248 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str6269 = constant [7 x i8] c"module\00"
@.str6322 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str6359 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str6367 = constant [9 x i8] c"function\00"
@.str6374 = constant [7 x i8] c"extern\00"
@.str6386 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str6407 = constant [9 x i8] c"variable\00"
@.str6429 = constant [4 x i8] c"ptr\00"
@.str6448 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str6472 = constant [10 x i8] c"typealias\00"
@.str6483 = constant [7 x i8] c"struct\00"
@.str6489 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str6541 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str6562 = constant [9 x i8] c"variable\00"
@.str6573 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6594 = constant [9 x i8] c"variable\00"
@.str6602 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str6616 = constant [17 x i8] c"addr_destination\00"
@.str6623 = constant [16 x i8] c"mono_assignable\00"
@.str6631 = constant [11 x i8] c"assignable\00"
@.str6645 = constant [12 x i8] c"destination\00"
@.str6650 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str6678 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str6697 = constant [7 x i8] c"module\00"
@.str6719 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str6790 = constant [6 x i8] c"slice\00"
@.str6803 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str6845 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str6866 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str6890 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str6913 = constant [16 x i8] c"mono_assignable\00"
@.str6939 = constant [5 x i8] c"cast\00"
@.str6949 = constant [5 x i8] c"type\00"
@.str6974 = constant [8 x i8] c"bitcast\00"
@.str6989 = constant [6 x i8] c"slice\00"
@.str6994 = constant [48 x i8] c"Casting array to slices is not implemented yet\0A\00"
@.str7002 = constant [4 x i8] c"ptr\00"
@.str7009 = constant [4 x i8] c"ptr\00"
@.str7028 = constant [4 x i8] c"i%d\00"
@.str7033 = constant [4 x i8] c"i%d\00"
@.str7041 = constant [5 x i8] c"sext\00"
@.str7043 = constant [6 x i8] c"trunc\00"
@.str7048 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str7068 = constant [16 x i8] c"mono_assignable\00"
@.str7130 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str7153 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str7160 = constant [2 x i8] c"+\00"
@.str7165 = constant [4 x i8] c"add\00"
@.str7170 = constant [2 x i8] c"-\00"
@.str7175 = constant [4 x i8] c"sub\00"
@.str7180 = constant [2 x i8] c"*\00"
@.str7185 = constant [4 x i8] c"mul\00"
@.str7190 = constant [2 x i8] c"/\00"
@.str7195 = constant [5 x i8] c"sdiv\00"
@.str7200 = constant [3 x i8] c"==\00"
@.str7205 = constant [8 x i8] c"icmp eq\00"
@.str7210 = constant [3 x i8] c"!=\00"
@.str7215 = constant [8 x i8] c"icmp ne\00"
@.str7220 = constant [2 x i8] c">\00"
@.str7225 = constant [9 x i8] c"icmp sgt\00"
@.str7230 = constant [2 x i8] c"<\00"
@.str7235 = constant [9 x i8] c"icmp slt\00"
@.str7240 = constant [2 x i8] c"&\00"
@.str7245 = constant [4 x i8] c"and\00"
@.str7250 = constant [2 x i8] c"|\00"
@.str7255 = constant [3 x i8] c"or\00"
@.str7260 = constant [3 x i8] c">=\00"
@.str7265 = constant [9 x i8] c"icmp sge\00"
@.str7270 = constant [3 x i8] c"<=\00"
@.str7275 = constant [9 x i8] c"icmp sle\00"
@.str7280 = constant [2 x i8] c"%\00"
@.str7285 = constant [5 x i8] c"srem\00"
@.str7289 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str7296 = constant [4 x i8] c"add\00"
@.str7303 = constant [3 x i8] c"==\00"
@.str7310 = constant [3 x i8] c"!=\00"
@.str7318 = constant [2 x i8] c"|\00"
@.str7326 = constant [2 x i8] c"&\00"
@.str7334 = constant [2 x i8] c">\00"
@.str7342 = constant [2 x i8] c"<\00"
@.str7350 = constant [3 x i8] c">=\00"
@.str7358 = constant [3 x i8] c"<=\00"
@.str7366 = constant [5 x i8] c"bool\00"
@.str7370 = constant [4 x i8] c"int\00"
@.str7384 = constant [7 x i8] c"NUMBER\00"
@.str7398 = constant [4 x i8] c"int\00"
@.str7412 = constant [5 x i8] c"WORD\00"
@.str7422 = constant [5 x i8] c"null\00"
@.str7429 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str7443 = constant [5 x i8] c"null\00"
@.str7452 = constant [8 x i8] c"nullptr\00"
@.str7459 = constant [17 x i8] c"addr_destination\00"
@.str7471 = constant [12 x i8] c"destination\00"
@.str7515 = constant [4 x i8] c"ptr\00"
@.str7534 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str7546 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str7560 = constant [8 x i8] c"boolean\00"
@.str7574 = constant [5 x i8] c"bool\00"
@.str7583 = constant [6 x i8] c"false\00"
@.str7590 = constant [2 x i8] c"0\00"
@.str7594 = constant [2 x i8] c"1\00"
@.str7601 = constant [8 x i8] c"fn_call\00"
@.str7618 = constant [7 x i8] c"STRING\00"
@.str7644 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str7660 = constant [4 x i8] c"ptr\00"
@.str7673 = constant [4 x i8] c"chr\00"
@.str7680 = constant [4 x i8] c"CHR\00"
@.str7696 = constant [2 x i8] c"0\00"
@.str7712 = constant [22 x i8] c"Invalid character: %s\00"
@.str7728 = constant [4 x i8] c"chr\00"
@.str7732 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str7760 = constant [22 x i8] c"called 'abbr' on null\00"
@.str7766 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str7771 = constant [4 x i8] c"int\00"
@.str7776 = constant [2 x i8] c"i\00"
@.str7781 = constant [5 x i8] c"bool\00"
@.str7786 = constant [2 x i8] c"b\00"
@.str7791 = constant [5 x i8] c"void\00"
@.str7796 = constant [2 x i8] c"v\00"
@.str7801 = constant [4 x i8] c"chr\00"
@.str7806 = constant [2 x i8] c"c\00"
@.str7811 = constant [4 x i8] c"ptr\00"
@.str7818 = constant [4 x i8] c"%sp\00"
@.str7829 = constant [10 x i8] c"typealias\00"
@.str7840 = constant [7 x i8] c"struct\00"
@.str7845 = constant [2 x i8] c"s\00"
@.str7856 = constant [5 x i8] c"%s%s\00"
@.str7869 = constant [9 x i8] c"function\00"
@.str7874 = constant [2 x i8] c"f\00"
@.str7879 = constant [6 x i8] c"error\00"
@.str7884 = constant [2 x i8] c"?\00"
@.str7886 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str7898 = constant [7 x i8] c".str%d\00"
@.str7913 = constant [6 x i8] c"array\00"
@.str7926 = constant [4 x i8] c"chr\00"
@.str7947 = constant [3 x i8] c"%d\00"
@.str7954 = constant [7 x i8] c"string\00"
@.str7990 = constant [7 x i8] c"module\00"
@.str8041 = constant [4 x i8] c"%s\0A\00"
@.str8096 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str8102 = constant [2 x i8] c"?\00"
@.str8108 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str8114 = constant [4 x i8] c"int\00"
@.str8119 = constant [4 x i8] c"i32\00"
@.str8124 = constant [5 x i8] c"void\00"
@.str8129 = constant [5 x i8] c"void\00"
@.str8134 = constant [5 x i8] c"bool\00"
@.str8139 = constant [3 x i8] c"i1\00"
@.str8144 = constant [8 x i8] c"nullptr\00"
@.str8149 = constant [4 x i8] c"ptr\00"
@.str8154 = constant [4 x i8] c"chr\00"
@.str8159 = constant [3 x i8] c"i8\00"
@.str8164 = constant [9 x i8] c"function\00"
@.str8170 = constant [4 x i8] c"%s(\00"
@.str8196 = constant [4 x i8] c"%s,\00"
@.str8201 = constant [5 x i8] c"%s%s\00"
@.str8212 = constant [4 x i8] c"%s)\00"
@.str8220 = constant [4 x i8] c"ptr\00"
@.str8226 = constant [4 x i8] c"%s*\00"
@.str8238 = constant [7 x i8] c"struct\00"
@.str8244 = constant [2 x i8] c"{\00"
@.str8261 = constant [4 x i8] c"%s,\00"
@.str8266 = constant [5 x i8] c"%s%s\00"
@.str8277 = constant [4 x i8] c"%s}\00"
@.str8285 = constant [6 x i8] c"array\00"
@.str8291 = constant [10 x i8] c"[%s x %s]\00"
@.str8310 = constant [10 x i8] c"typealias\00"
@.str8316 = constant [5 x i8] c"%%%s\00"
@.str8326 = constant [7 x i8] c"vararg\00"
@.str8331 = constant [4 x i8] c"...\00"
@.str8336 = constant [6 x i8] c"error\00"
@.str8341 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str8417 = constant [9 x i8] c"function\00"
@.str8435 = constant [5 x i8] c"WORD\00"
@.str8492 = constant [10 x i8] c"fn_params\00"
@.str8506 = constant [11 x i8] c"basic_type\00"
@.str8527 = constant [13 x i8] c"type_trailer\00"
@.str8536 = constant [9 x i8] c"function\00"
@.str8552 = constant [15 x i8] c"type_fn_params\00"
@.str8585 = constant [4 x i8] c"ptr\00"
@.str8597 = constant [10 x i8] c"structdef\00"
@.str8604 = constant [7 x i8] c"struct\00"
@.str8611 = constant [5 x i8] c"type\00"
@.str8642 = constant [5 x i8] c"type\00"
@.str8669 = constant [5 x i8] c"type\00"
@.str8675 = constant [12 x i8] c"dotted_name\00"
@.str8689 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str8702 = constant [6 x i8] c"error\00"
@.str8707 = constant [10 x i8] c"typealias\00"
@.str8731 = constant [4 x i8] c"str\00"
@.str8738 = constant [4 x i8] c"ptr\00"
@.str8747 = constant [4 x i8] c"chr\00"
@.str8752 = constant [5 x i8] c"WORD\00"
@.str8765 = constant [4 x i8] c"...\00"
@.str8772 = constant [7 x i8] c"vararg\00"
@.str8776 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str8797 = constant [2 x i8] c"*\00"
@.str8806 = constant [4 x i8] c"ptr\00"
@.str8815 = constant [2 x i8] c"[\00"
@.str8825 = constant [2 x i8] c"]\00"
@.str8834 = constant [7 x i8] c"struct\00"
@.str8838 = constant [6 x i8] c"slice\00"
@.str8844 = constant [4 x i8] c"ptr\00"
@.str8848 = constant [6 x i8] c"c_arr\00"
@.str8860 = constant [4 x i8] c"int\00"
@.str8864 = constant [4 x i8] c"len\00"
@.str8873 = constant [4 x i8] c"int\00"
@.str8877 = constant [4 x i8] c"cap\00"
@.str8888 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str8903 = constant [2 x i8] c"w\00"
@.str8923 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str8932 = constant [30 x i8] c"tee debug.ll | llc - -o out.s\00"
@.str8934 = constant [2 x i8] c"w\00"
@.str8946 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8954 = constant [24 x i8] c"error on llc execution\0A\00"
@.str8957 = constant [16 x i8] c"cc out.s -o out\00"
@.str8959 = constant [2 x i8] c"w\00"
@.str8967 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str8975 = constant [22 x i8] c"error on cc execution\00"
@.str8978 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str8985 = constant [21 x i8] c"Usage: %s <filename>\00"
