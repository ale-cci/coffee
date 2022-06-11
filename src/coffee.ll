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
declare i32 @execvp(i8*, i8**)
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
define {i8*,i8*} @m2$splitext.scpcp.cp(i8* %.path.arg) {
%path = alloca i8*
store i8* %.path.arg, i8** %path
%S.138 = alloca {i8*,i8*}
%.tmp139 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.138, i32 0, i32 0
store i8* null, i8** %.tmp139
%.tmp140 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.138, i32 0, i32 1
store i8* null, i8** %.tmp140
%.tmp141 = load i8*, i8** %path
%.tmp142 = call i32(i8*) @strlen(i8* %.tmp141)
%str_length.143 = alloca i32
store i32 %.tmp142, i32* %str_length.143
%.tmp144 = load i32, i32* %str_length.143
%ext_pos.145 = alloca i32
store i32 %.tmp144, i32* %ext_pos.145
%.tmp147 = load i32, i32* %str_length.143
%.tmp148 = sub i32 %.tmp147, 1
%i.149 = alloca i32
store i32 %.tmp148, i32* %i.149
br label %.for.start.146
.for.start.146:
%.tmp150 = load i32, i32* %i.149
%.tmp151 = icmp sgt i32 %.tmp150, 0
br i1 %.tmp151, label %.for.continue.146, label %.for.end.146
.for.continue.146:
%.tmp152 = load i32, i32* %i.149
%.tmp153 = load i8*, i8** %path
%.tmp154 = getelementptr i8, i8* %.tmp153, i32 %.tmp152
%.tmp155 = load i8, i8* %.tmp154
%.tmp156 = icmp eq i8 %.tmp155, 46
br i1 %.tmp156, label %.if.true.157, label %.if.false.157
.if.true.157:
%.tmp158 = load i32, i32* %i.149
store i32 %.tmp158, i32* %ext_pos.145
br label %.for.end.146
br label %.if.end.157
.if.false.157:
%.tmp159 = load i32, i32* %i.149
%.tmp160 = load i8*, i8** %path
%.tmp161 = getelementptr i8, i8* %.tmp160, i32 %.tmp159
%.tmp162 = load i8, i8* %.tmp161
%.tmp163 = icmp eq i8 %.tmp162, 47
br i1 %.tmp163, label %.if.true.164, label %.if.false.164
.if.true.164:
br label %.for.end.146
br label %.if.end.164
.if.false.164:
br label %.if.end.164
.if.end.164:
br label %.if.end.157
.if.end.157:
%.tmp165 = load i32, i32* %i.149
%.tmp166 = sub i32 %.tmp165, 1
store i32 %.tmp166, i32* %i.149
br label %.for.start.146
.for.end.146:
%.tmp167 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.138, i32 0, i32 0
%.tmp168 = load i32, i32* %ext_pos.145
%.tmp169 = add i32 %.tmp168, 1
%.tmp170 = call i8*(i32) @malloc(i32 %.tmp169)
store i8* %.tmp170, i8** %.tmp167
%.tmp171 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.138, i32 0, i32 0
%.tmp172 = load i8*, i8** %.tmp171
%.tmp173 = load i8*, i8** %path
%.tmp174 = load i32, i32* %ext_pos.145
%.tmp175 = call i8*(i8*,i8*,i32) @strncpy(i8* %.tmp172, i8* %.tmp173, i32 %.tmp174)
%.tmp176 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.138, i32 0, i32 0
%.tmp177 = load i32, i32* %ext_pos.145
%.tmp178 = load i8*, i8** %.tmp176
%.tmp179 = getelementptr i8, i8* %.tmp178, i32 %.tmp177
store i8 0, i8* %.tmp179
%.tmp180 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.138, i32 0, i32 1
%.tmp181 = load i32, i32* %str_length.143
%.tmp182 = load i32, i32* %ext_pos.145
%.tmp183 = sub i32 %.tmp181, %.tmp182
%.tmp184 = call i8*(i32) @malloc(i32 %.tmp183)
store i8* %.tmp184, i8** %.tmp180
%.tmp186 = load i32, i32* %ext_pos.145
%i.187 = alloca i32
store i32 %.tmp186, i32* %i.187
br label %.for.start.185
.for.start.185:
%.tmp188 = load i32, i32* %i.187
%.tmp189 = load i32, i32* %str_length.143
%.tmp190 = icmp slt i32 %.tmp188, %.tmp189
br i1 %.tmp190, label %.for.continue.185, label %.for.end.185
.for.continue.185:
%.tmp191 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.138, i32 0, i32 1
%.tmp192 = load i32, i32* %i.187
%.tmp193 = load i32, i32* %ext_pos.145
%.tmp194 = sub i32 %.tmp192, %.tmp193
%.tmp195 = load i8*, i8** %.tmp191
%.tmp196 = getelementptr i8, i8* %.tmp195, i32 %.tmp194
%.tmp197 = load i32, i32* %i.187
%.tmp198 = load i8*, i8** %path
%.tmp199 = getelementptr i8, i8* %.tmp198, i32 %.tmp197
%.tmp200 = load i8, i8* %.tmp199
store i8 %.tmp200, i8* %.tmp196
%.tmp201 = load i32, i32* %i.187
%.tmp202 = add i32 %.tmp201, 1
store i32 %.tmp202, i32* %i.187
br label %.for.start.185
.for.end.185:
%.tmp203 = load {i8*,i8*}, {i8*,i8*}* %S.138
ret {i8*,i8*} %.tmp203
}
define i8* @m1$readall.cp.i(i32 %.fd.arg) {
%fd = alloca i32
store i32 %.fd.arg, i32* %fd
%buf_len.204 = alloca i32
store i32 1024, i32* %buf_len.204
%.tmp205 = load i32, i32* %buf_len.204
%.tmp206 = call i8*(i32) @malloc(i32 %.tmp205)
%buf.207 = alloca i8*
store i8* %.tmp206, i8** %buf.207
%content_len.208 = alloca i32
store i32 0, i32* %content_len.208
%.tmp209 = call i8*(i32) @malloc(i32 1)
%content.210 = alloca i8*
store i8* %.tmp209, i8** %content.210
%.tmp211 = load i8*, i8** %content.210
%.tmp212 = getelementptr i8, i8* %.tmp211, i32 0
store i8 0, i8* %.tmp212
%.tmp213 = load i32, i32* %fd
%.tmp214 = load i8*, i8** %buf.207
%.tmp215 = load i32, i32* %buf_len.204
%.tmp216 = call i32(i32,i8*,i32) @read(i32 %.tmp213, i8* %.tmp214, i32 %.tmp215)
%read_bytes.217 = alloca i32
store i32 %.tmp216, i32* %read_bytes.217
br label %.for.start.218
.for.start.218:
%.tmp219 = load i32, i32* %read_bytes.217
%.tmp220 = icmp sgt i32 %.tmp219, 0
br i1 %.tmp220, label %.for.continue.218, label %.for.end.218
.for.continue.218:
%.tmp221 = load i8*, i8** %content.210
%.tmp222 = load i32, i32* %content_len.208
%.tmp223 = load i32, i32* %read_bytes.217
%.tmp224 = add i32 %.tmp222, %.tmp223
%.tmp225 = call i8*(i8*,i32) @realloc(i8* %.tmp221, i32 %.tmp224)
store i8* %.tmp225, i8** %content.210
%i.227 = alloca i32
store i32 0, i32* %i.227
br label %.for.start.226
.for.start.226:
%.tmp228 = load i32, i32* %i.227
%.tmp229 = load i32, i32* %read_bytes.217
%.tmp230 = icmp slt i32 %.tmp228, %.tmp229
br i1 %.tmp230, label %.for.continue.226, label %.for.end.226
.for.continue.226:
%.tmp231 = load i32, i32* %i.227
%.tmp232 = load i32, i32* %content_len.208
%.tmp233 = add i32 %.tmp231, %.tmp232
%.tmp234 = load i8*, i8** %content.210
%.tmp235 = getelementptr i8, i8* %.tmp234, i32 %.tmp233
%.tmp236 = load i32, i32* %i.227
%.tmp237 = load i8*, i8** %buf.207
%.tmp238 = getelementptr i8, i8* %.tmp237, i32 %.tmp236
%.tmp239 = load i8, i8* %.tmp238
store i8 %.tmp239, i8* %.tmp235
%.tmp240 = load i32, i32* %i.227
%.tmp241 = add i32 %.tmp240, 1
store i32 %.tmp241, i32* %i.227
br label %.for.start.226
.for.end.226:
%.tmp242 = load i32, i32* %content_len.208
%.tmp243 = load i32, i32* %read_bytes.217
%.tmp244 = add i32 %.tmp242, %.tmp243
store i32 %.tmp244, i32* %content_len.208
%.tmp245 = load i32, i32* %fd
%.tmp246 = load i8*, i8** %buf.207
%.tmp247 = load i32, i32* %buf_len.204
%.tmp248 = call i32(i32,i8*,i32) @read(i32 %.tmp245, i8* %.tmp246, i32 %.tmp247)
store i32 %.tmp248, i32* %read_bytes.217
br label %.for.start.218
.for.end.218:
%.tmp249 = load i32, i32* %content_len.208
%.tmp250 = sub i32 %.tmp249, 1
%.tmp251 = load i8*, i8** %content.210
%.tmp252 = getelementptr i8, i8* %.tmp251, i32 %.tmp250
store i8 0, i8* %.tmp252
%.tmp253 = load i8*, i8** %buf.207
call void(i8*) @free(i8* %.tmp253)
%.tmp254 = load i8*, i8** %content.210
ret i8* %.tmp254
}
define void @m1$copy.v.i.i(i32 %.dest.arg, i32 %.src.arg) {
%dest = alloca i32
store i32 %.dest.arg, i32* %dest
%src = alloca i32
store i32 %.src.arg, i32* %src
%buf_size.255 = alloca i32
store i32 4096, i32* %buf_size.255
%.tmp256 = call i8*(i32) @malloc(i32 4096)
%buf.257 = alloca i8*
store i8* %.tmp256, i8** %buf.257
%to_write.258 = alloca i32
store i32 1, i32* %to_write.258
br label %.for.start.259
.for.start.259:
%.tmp260 = load i32, i32* %to_write.258
%.tmp261 = icmp sgt i32 %.tmp260, 0
br i1 %.tmp261, label %.for.continue.259, label %.for.end.259
.for.continue.259:
%.tmp262 = load i32, i32* %src
%.tmp263 = load i8*, i8** %buf.257
%.tmp264 = load i32, i32* %buf_size.255
%.tmp265 = call i32(i32,i8*,i32) @read(i32 %.tmp262, i8* %.tmp263, i32 %.tmp264)
store i32 %.tmp265, i32* %to_write.258
%.tmp266 = load i32, i32* %dest
%.tmp267 = load i8*, i8** %buf.257
%.tmp268 = load i32, i32* %to_write.258
%.tmp269 = call i32(i32,i8*,i32) @write(i32 %.tmp266, i8* %.tmp267, i32 %.tmp268)
br label %.for.start.259
.for.end.259:
ret void
}
define %m0$.File.type* @m1$str_as_file.m0$.File.typep.cp(i8* %.file_content.arg) {
%file_content = alloca i8*
store i8* %.file_content.arg, i8** %file_content
%.tmp270 = call i8*(i32) @malloc(i32 16)
%.tmp271 = bitcast i8* %.tmp270 to i32*
%pp.272 = alloca i32*
store i32* %.tmp271, i32** %pp.272
%.tmp273 = load i32*, i32** %pp.272
%.tmp274 = call i32(i32*) @pipe(i32* %.tmp273)
%.tmp275 = load i32, i32* @STDOUT
%.tmp276 = load i32*, i32** %pp.272
%.tmp277 = getelementptr i32, i32* %.tmp276, i32 %.tmp275
%.tmp278 = load i32, i32* %.tmp277
%.tmp279 = load i8*, i8** %file_content
%.tmp280 = load i8*, i8** %file_content
%.tmp281 = call i32(i8*) @strlen(i8* %.tmp280)
%.tmp282 = call i32(i32,i8*,i32) @write(i32 %.tmp278, i8* %.tmp279, i32 %.tmp281)
%.tmp283 = load i32, i32* @STDOUT
%.tmp284 = load i32*, i32** %pp.272
%.tmp285 = getelementptr i32, i32* %.tmp284, i32 %.tmp283
%.tmp286 = load i32, i32* %.tmp285
%.tmp287 = call i32(i32) @close(i32 %.tmp286)
%.tmp288 = load i32, i32* @STDIN
%.tmp289 = load i32*, i32** %pp.272
%.tmp290 = getelementptr i32, i32* %.tmp289, i32 %.tmp288
%.tmp291 = load i32, i32* %.tmp290
%.tmp293 = getelementptr [2 x i8], [2 x i8]*@.str292, i32 0, i32 0
%.tmp294 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp291, i8* %.tmp293)
ret %m0$.File.type* %.tmp294
}
%m298$.PeekerInfo.type = type {i32,i32,i32,i32,i8,i1,i8*}
@EOF = constant i32 0
define i8 @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.p.arg) {
%p = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.p.arg, %m298$.PeekerInfo.type** %p
%.tmp299 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp300 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp299, i32 0, i32 5
%.tmp301 = load i1, i1* %.tmp300
br i1 %.tmp301, label %.if.true.302, label %.if.false.302
.if.true.302:
ret i8 0
br label %.if.end.302
.if.false.302:
br label %.if.end.302
.if.end.302:
%.tmp303 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp304 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp303, i32 0, i32 4
%.tmp305 = load i8, i8* %.tmp304
%.tmp306 = icmp eq i8 %.tmp305, 10
br i1 %.tmp306, label %.if.true.307, label %.if.false.307
.if.true.307:
%.tmp308 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp309 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp308, i32 0, i32 2
%.tmp310 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp311 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp310, i32 0, i32 2
%.tmp312 = load i32, i32* %.tmp311
%.tmp313 = add i32 %.tmp312, 1
store i32 %.tmp313, i32* %.tmp309
%.tmp314 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp315 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp314, i32 0, i32 3
store i32 0, i32* %.tmp315
br label %.if.end.307
.if.false.307:
br label %.if.end.307
.if.end.307:
%.tmp316 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp317 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp316, i32 0, i32 1
%.tmp318 = load i32, i32* %.tmp317
%.tmp319 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp320 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp319, i32 0, i32 4
%.tmp321 = getelementptr i8, i8* %.tmp320, i32 0
%.tmp322 = call i32(i32,i8*,i32) @read(i32 %.tmp318, i8* %.tmp321, i32 1)
%.tmp323 = icmp eq i32 %.tmp322, 0
br i1 %.tmp323, label %.if.true.324, label %.if.false.324
.if.true.324:
%.tmp325 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp326 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp325, i32 0, i32 4
store i8 0, i8* %.tmp326
%.tmp327 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp328 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp327, i32 0, i32 5
store i1 1, i1* %.tmp328
%.tmp329 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp330 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp329, i32 0, i32 4
%.tmp331 = load i8, i8* %.tmp330
ret i8 %.tmp331
br label %.if.end.324
.if.false.324:
br label %.if.end.324
.if.end.324:
%.tmp332 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp333 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp332, i32 0, i32 3
%.tmp334 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp335 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp334, i32 0, i32 3
%.tmp336 = load i32, i32* %.tmp335
%.tmp337 = add i32 %.tmp336, 1
store i32 %.tmp337, i32* %.tmp333
%.tmp338 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp339 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp338, i32 0, i32 0
%.tmp340 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp341 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp340, i32 0, i32 0
%.tmp342 = load i32, i32* %.tmp341
%.tmp343 = add i32 %.tmp342, 1
store i32 %.tmp343, i32* %.tmp339
%.tmp344 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp345 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp344, i32 0, i32 4
%.tmp346 = load i8, i8* %.tmp345
ret i8 %.tmp346
}
define void @m298$seek.v.m298$.PeekerInfo.typep.i(%m298$.PeekerInfo.type* %.p.arg, i32 %.pos.arg) {
%p = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.p.arg, %m298$.PeekerInfo.type** %p
%pos = alloca i32
store i32 %.pos.arg, i32* %pos
%.tmp347 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp348 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp347, i32 0, i32 1
%.tmp349 = load i32, i32* %.tmp348
%.tmp350 = load i32, i32* %pos
%.tmp351 = load i32, i32* @SEEK_SET
%.tmp352 = call i32(i32,i32,i32) @lseek(i32 %.tmp349, i32 %.tmp350, i32 %.tmp351)
ret void
}
define %m298$.PeekerInfo.type* @m298$new.m298$.PeekerInfo.typep.i(i32 %.fd.arg) {
%fd = alloca i32
store i32 %.fd.arg, i32* %fd
%.tmp353 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* null, i32 1
%.tmp354 = ptrtoint %m298$.PeekerInfo.type* %.tmp353 to i32
%.tmp355 = call i8*(i32) @malloc(i32 %.tmp354)
%.tmp356 = bitcast i8* %.tmp355 to %m298$.PeekerInfo.type*
%p.357 = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.tmp356, %m298$.PeekerInfo.type** %p.357
%.tmp358 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.357
%.tmp359 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp358, i32 0, i32 0
store i32 0, i32* %.tmp359
%.tmp360 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.357
%.tmp361 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp360, i32 0, i32 2
store i32 1, i32* %.tmp361
%.tmp362 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.357
%.tmp363 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp362, i32 0, i32 3
store i32 0, i32* %.tmp363
%.tmp364 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.357
%.tmp365 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp364, i32 0, i32 1
%.tmp366 = load i32, i32* %fd
store i32 %.tmp366, i32* %.tmp365
%.tmp367 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.357
%.tmp368 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp367, i32 0, i32 4
store i8 0, i8* %.tmp368
%.tmp369 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.357
%.tmp370 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp369, i32 0, i32 5
store i1 0, i1* %.tmp370
%.tmp371 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.357
%.tmp372 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp371, i32 0, i32 6
%.tmp374 = getelementptr [1 x i8], [1 x i8]*@.str373, i32 0, i32 0
store i8* %.tmp374, i8** %.tmp372
%.tmp375 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.357
ret %m298$.PeekerInfo.type* %.tmp375
}
%m297$.Token.type = type {i8*,i8*,i32,i32,i8*,%m297$.Token.type*,%m297$.Token.type*}
%m297$.ParseCtx.type = type {i8*,i32,i32,%m297$.Token.type*,%m297$.Token.type*}
define %m297$.Token.type* @m297$push_token.m297$.Token.typep.m297$.ParseCtx.typep.cp.cp(%m297$.ParseCtx.type* %.c.arg, i8* %.type.arg, i8* %.value.arg) {
%c = alloca %m297$.ParseCtx.type*
store %m297$.ParseCtx.type* %.c.arg, %m297$.ParseCtx.type** %c
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp376 = getelementptr %m297$.Token.type, %m297$.Token.type* null, i32 1
%.tmp377 = ptrtoint %m297$.Token.type* %.tmp376 to i32
%.tmp378 = call i8*(i32) @malloc(i32 %.tmp377)
%.tmp379 = bitcast i8* %.tmp378 to %m297$.Token.type*
%root.380 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp379, %m297$.Token.type** %root.380
%.tmp381 = load %m297$.Token.type*, %m297$.Token.type** %root.380
%.tmp382 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp381, i32 0, i32 0
%.tmp383 = load i8*, i8** %type
store i8* %.tmp383, i8** %.tmp382
%.tmp384 = load %m297$.Token.type*, %m297$.Token.type** %root.380
%.tmp385 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp384, i32 0, i32 1
%.tmp386 = load i8*, i8** %value
store i8* %.tmp386, i8** %.tmp385
%.tmp387 = load %m297$.Token.type*, %m297$.Token.type** %root.380
%.tmp388 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp387, i32 0, i32 4
%.tmp389 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %c
%.tmp390 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp389, i32 0, i32 0
%.tmp391 = load i8*, i8** %.tmp390
store i8* %.tmp391, i8** %.tmp388
%.tmp392 = load %m297$.Token.type*, %m297$.Token.type** %root.380
%.tmp393 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp392, i32 0, i32 2
%.tmp394 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %c
%.tmp395 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp394, i32 0, i32 1
%.tmp396 = load i32, i32* %.tmp395
store i32 %.tmp396, i32* %.tmp393
%.tmp397 = load %m297$.Token.type*, %m297$.Token.type** %root.380
%.tmp398 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp397, i32 0, i32 3
%.tmp399 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %c
%.tmp400 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp399, i32 0, i32 2
%.tmp401 = load i32, i32* %.tmp400
store i32 %.tmp401, i32* %.tmp398
%.tmp402 = load %m297$.Token.type*, %m297$.Token.type** %root.380
%.tmp403 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp402, i32 0, i32 6
%.tmp404 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %c
%.tmp405 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp404, i32 0, i32 4
%.tmp406 = load %m297$.Token.type*, %m297$.Token.type** %.tmp405
store %m297$.Token.type* %.tmp406, %m297$.Token.type** %.tmp403
%.tmp407 = load %m297$.Token.type*, %m297$.Token.type** %root.380
%.tmp408 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp407, i32 0, i32 5
store %m297$.Token.type* null, %m297$.Token.type** %.tmp408
%.tmp409 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %c
%.tmp410 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp409, i32 0, i32 4
%.tmp411 = load %m297$.Token.type*, %m297$.Token.type** %.tmp410
%.tmp412 = icmp ne %m297$.Token.type* %.tmp411, null
br i1 %.tmp412, label %.if.true.413, label %.if.false.413
.if.true.413:
%.tmp414 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %c
%.tmp415 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp414, i32 0, i32 4
%.tmp416 = load %m297$.Token.type*, %m297$.Token.type** %.tmp415
%.tmp417 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp416, i32 0, i32 5
%.tmp418 = load %m297$.Token.type*, %m297$.Token.type** %root.380
store %m297$.Token.type* %.tmp418, %m297$.Token.type** %.tmp417
br label %.if.end.413
.if.false.413:
br label %.if.end.413
.if.end.413:
%.tmp419 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %c
%.tmp420 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp419, i32 0, i32 4
%.tmp421 = load %m297$.Token.type*, %m297$.Token.type** %root.380
store %m297$.Token.type* %.tmp421, %m297$.Token.type** %.tmp420
%.tmp422 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %c
%.tmp423 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp422, i32 0, i32 3
%.tmp424 = load %m297$.Token.type*, %m297$.Token.type** %.tmp423
%.tmp425 = icmp eq %m297$.Token.type* %.tmp424, null
br i1 %.tmp425, label %.if.true.426, label %.if.false.426
.if.true.426:
%.tmp427 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %c
%.tmp428 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp427, i32 0, i32 3
%.tmp429 = load %m297$.Token.type*, %m297$.Token.type** %root.380
store %m297$.Token.type* %.tmp429, %m297$.Token.type** %.tmp428
br label %.if.end.426
.if.false.426:
br label %.if.end.426
.if.end.426:
%.tmp430 = load %m297$.Token.type*, %m297$.Token.type** %root.380
ret %m297$.Token.type* %.tmp430
}
define %m297$.Token.type* @m297$tokenize.m297$.Token.typep.m298$.PeekerInfo.typep.b(%m298$.PeekerInfo.type* %.p.arg, i1 %.keep_comments.arg) {
%p = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.p.arg, %m298$.PeekerInfo.type** %p
%keep_comments = alloca i1
store i1 %.keep_comments.arg, i1* %keep_comments
%.tmp431 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* null, i32 1
%.tmp432 = ptrtoint %m297$.ParseCtx.type* %.tmp431 to i32
%.tmp433 = call i8*(i32) @malloc(i32 %.tmp432)
%.tmp434 = bitcast i8* %.tmp433 to %m297$.ParseCtx.type*
%ctx.435 = alloca %m297$.ParseCtx.type*
store %m297$.ParseCtx.type* %.tmp434, %m297$.ParseCtx.type** %ctx.435
%.tmp436 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp437 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp436, i32 0, i32 0
%.tmp438 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp439 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp438, i32 0, i32 6
%.tmp440 = load i8*, i8** %.tmp439
store i8* %.tmp440, i8** %.tmp437
%.tmp441 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp442 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp441, i32 0, i32 3
store %m297$.Token.type* null, %m297$.Token.type** %.tmp442
%.tmp443 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp444 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp443, i32 0, i32 4
store %m297$.Token.type* null, %m297$.Token.type** %.tmp444
%max_token_size.445 = alloca i32
store i32 128, i32* %max_token_size.445
%.tmp446 = bitcast ptr null to i8*
%buf.447 = alloca i8*
store i8* %.tmp446, i8** %buf.447
%idx.448 = alloca i32
store i32 0, i32* %idx.448
%.tmp449 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp450 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp449)
%c.451 = alloca i8
store i8 %.tmp450, i8* %c.451
br label %.for.start.452
.for.start.452:
%.tmp453 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp454 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp453, i32 0, i32 5
%.tmp455 = load i1, i1* %.tmp454
%.tmp456 = icmp eq i1 %.tmp455, 0
br i1 %.tmp456, label %.for.continue.452, label %.for.end.452
.for.continue.452:
%.tmp457 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp458 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp457, i32 0, i32 1
%.tmp459 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp460 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp459, i32 0, i32 2
%.tmp461 = load i32, i32* %.tmp460
store i32 %.tmp461, i32* %.tmp458
%.tmp462 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp463 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp462, i32 0, i32 2
%.tmp464 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp465 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp464, i32 0, i32 3
%.tmp466 = load i32, i32* %.tmp465
store i32 %.tmp466, i32* %.tmp463
%.tmp467 = load i8, i8* %c.451
%.tmp468 = icmp eq i8 %.tmp467, 0
br i1 %.tmp468, label %.if.true.469, label %.if.false.469
.if.true.469:
%.tmp470 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp471 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp470)
store i8 %.tmp471, i8* %c.451
br label %.if.end.469
.if.false.469:
%.tmp472 = load i8, i8* %c.451
%.tmp473 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp472)
br i1 %.tmp473, label %.if.true.474, label %.if.false.474
.if.true.474:
%.tmp475 = load i32, i32* %max_token_size.445
%.tmp476 = call i8*(i32) @malloc(i32 %.tmp475)
store i8* %.tmp476, i8** %buf.447
store i32 0, i32* %idx.448
br label %.for.start.477
.for.start.477:
%.tmp478 = load i8, i8* %c.451
%.tmp479 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp478)
br i1 %.tmp479, label %.for.continue.477, label %.for.end.477
.for.continue.477:
%.tmp480 = load i32, i32* %idx.448
%.tmp481 = load i8*, i8** %buf.447
%.tmp482 = getelementptr i8, i8* %.tmp481, i32 %.tmp480
%.tmp483 = load i8, i8* %c.451
store i8 %.tmp483, i8* %.tmp482
%.tmp484 = load i32, i32* %idx.448
%.tmp485 = add i32 %.tmp484, 1
store i32 %.tmp485, i32* %idx.448
%.tmp486 = load i32, i32* %idx.448
%.tmp487 = load i32, i32* %max_token_size.445
%.tmp488 = icmp slt i32 %.tmp486, %.tmp487
%.tmp490 = getelementptr [16 x i8], [16 x i8]*@.str489, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp488, i8* %.tmp490)
%.tmp491 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp492 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp491)
store i8 %.tmp492, i8* %c.451
br label %.for.start.477
.for.end.477:
%.tmp493 = load i32, i32* %idx.448
%.tmp494 = load i8*, i8** %buf.447
%.tmp495 = getelementptr i8, i8* %.tmp494, i32 %.tmp493
store i8 0, i8* %.tmp495
%.tmp496 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp498 = getelementptr [7 x i8], [7 x i8]*@.str497, i32 0, i32 0
%.tmp499 = load i8*, i8** %buf.447
%.tmp500 = call %m297$.Token.type*(%m297$.ParseCtx.type*,i8*,i8*) @m297$push_token.m297$.Token.typep.m297$.ParseCtx.typep.cp.cp(%m297$.ParseCtx.type* %.tmp496, i8* %.tmp498, i8* %.tmp499)
br label %.if.end.474
.if.false.474:
%.tmp501 = load i8, i8* %c.451
%.tmp502 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp501)
%.tmp503 = load i8, i8* %c.451
%.tmp504 = icmp eq i8 %.tmp503, 95
%.tmp505 = or i1 %.tmp502, %.tmp504
br i1 %.tmp505, label %.if.true.506, label %.if.false.506
.if.true.506:
%.tmp507 = load i32, i32* %max_token_size.445
%.tmp508 = call i8*(i32) @malloc(i32 %.tmp507)
store i8* %.tmp508, i8** %buf.447
store i32 0, i32* %idx.448
br label %.for.start.509
.for.start.509:
%.tmp510 = load i8, i8* %c.451
%.tmp511 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp510)
%.tmp512 = load i8, i8* %c.451
%.tmp513 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp512)
%.tmp514 = or i1 %.tmp511, %.tmp513
%.tmp515 = load i8, i8* %c.451
%.tmp516 = icmp eq i8 %.tmp515, 95
%.tmp517 = or i1 %.tmp514, %.tmp516
br i1 %.tmp517, label %.for.continue.509, label %.for.end.509
.for.continue.509:
%.tmp518 = load i32, i32* %idx.448
%.tmp519 = load i8*, i8** %buf.447
%.tmp520 = getelementptr i8, i8* %.tmp519, i32 %.tmp518
%.tmp521 = load i8, i8* %c.451
store i8 %.tmp521, i8* %.tmp520
%.tmp522 = load i32, i32* %idx.448
%.tmp523 = add i32 %.tmp522, 1
store i32 %.tmp523, i32* %idx.448
%.tmp524 = load i32, i32* %idx.448
%.tmp525 = load i32, i32* %max_token_size.445
%.tmp526 = icmp slt i32 %.tmp524, %.tmp525
%.tmp528 = getelementptr [15 x i8], [15 x i8]*@.str527, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp526, i8* %.tmp528)
%.tmp529 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp530 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp529)
store i8 %.tmp530, i8* %c.451
br label %.for.start.509
.for.end.509:
%.tmp531 = load i32, i32* %idx.448
%.tmp532 = load i8*, i8** %buf.447
%.tmp533 = getelementptr i8, i8* %.tmp532, i32 %.tmp531
store i8 0, i8* %.tmp533
%.tmp534 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp536 = getelementptr [5 x i8], [5 x i8]*@.str535, i32 0, i32 0
%.tmp537 = load i8*, i8** %buf.447
%.tmp538 = call %m297$.Token.type*(%m297$.ParseCtx.type*,i8*,i8*) @m297$push_token.m297$.Token.typep.m297$.ParseCtx.typep.cp.cp(%m297$.ParseCtx.type* %.tmp534, i8* %.tmp536, i8* %.tmp537)
br label %.if.end.506
.if.false.506:
%.tmp539 = load i8, i8* %c.451
%.tmp540 = call i1(i8) @m3$is_whitespace.b.c(i8 %.tmp539)
br i1 %.tmp540, label %.if.true.541, label %.if.false.541
.if.true.541:
%.tmp542 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp543 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp542)
store i8 %.tmp543, i8* %c.451
br label %.if.end.541
.if.false.541:
%.tmp544 = load i8, i8* %c.451
%.tmp545 = icmp eq i8 %.tmp544, 34
%.tmp546 = load i8, i8* %c.451
%.tmp547 = icmp eq i8 %.tmp546, 96
%.tmp548 = or i1 %.tmp545, %.tmp547
br i1 %.tmp548, label %.if.true.549, label %.if.false.549
.if.true.549:
%.tmp550 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp551 = load i8, i8* %c.451
%.tmp552 = call i8*(%m298$.PeekerInfo.type*,i8) @m297$read_string.cp.m298$.PeekerInfo.typep.c(%m298$.PeekerInfo.type* %.tmp550, i8 %.tmp551)
store i8* %.tmp552, i8** %buf.447
%.tmp553 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp554 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp553)
store i8 %.tmp554, i8* %c.451
%.tmp555 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp557 = getelementptr [7 x i8], [7 x i8]*@.str556, i32 0, i32 0
%.tmp558 = load i8*, i8** %buf.447
%.tmp559 = call %m297$.Token.type*(%m297$.ParseCtx.type*,i8*,i8*) @m297$push_token.m297$.Token.typep.m297$.ParseCtx.typep.cp.cp(%m297$.ParseCtx.type* %.tmp555, i8* %.tmp557, i8* %.tmp558)
br label %.if.end.549
.if.false.549:
%.tmp560 = load i8, i8* %c.451
%.tmp561 = icmp eq i8 %.tmp560, 39
br i1 %.tmp561, label %.if.true.562, label %.if.false.562
.if.true.562:
%.tmp563 = load i32, i32* %max_token_size.445
%.tmp564 = call i8*(i32) @malloc(i32 %.tmp563)
store i8* %.tmp564, i8** %buf.447
%.tmp565 = load i8*, i8** %buf.447
%.tmp566 = getelementptr i8, i8* %.tmp565, i32 0
%.tmp567 = load i8, i8* %c.451
store i8 %.tmp567, i8* %.tmp566
%.tmp568 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp569 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp568)
store i8 %.tmp569, i8* %c.451
store i32 1, i32* %idx.448
br label %.for.start.570
.for.start.570:
%.tmp571 = load i8, i8* %c.451
%.tmp572 = icmp ne i8 %.tmp571, 39
br i1 %.tmp572, label %.for.continue.570, label %.for.end.570
.for.continue.570:
%.tmp573 = load i32, i32* %idx.448
%.tmp574 = load i32, i32* %max_token_size.445
%.tmp575 = sub i32 %.tmp574, 2
%.tmp576 = icmp slt i32 %.tmp573, %.tmp575
%.tmp578 = getelementptr [15 x i8], [15 x i8]*@.str577, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp576, i8* %.tmp578)
%.tmp579 = load i32, i32* %idx.448
%.tmp580 = load i8*, i8** %buf.447
%.tmp581 = getelementptr i8, i8* %.tmp580, i32 %.tmp579
%.tmp582 = load i8, i8* %c.451
store i8 %.tmp582, i8* %.tmp581
%.tmp583 = load i32, i32* %idx.448
%.tmp584 = add i32 %.tmp583, 1
store i32 %.tmp584, i32* %idx.448
%.tmp585 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp586 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp585)
store i8 %.tmp586, i8* %c.451
br label %.for.start.570
.for.end.570:
%.tmp587 = load i32, i32* %idx.448
%.tmp588 = load i8*, i8** %buf.447
%.tmp589 = getelementptr i8, i8* %.tmp588, i32 %.tmp587
%.tmp590 = load i8, i8* %c.451
store i8 %.tmp590, i8* %.tmp589
%.tmp591 = load i32, i32* %idx.448
%.tmp592 = add i32 %.tmp591, 1
%.tmp593 = load i8*, i8** %buf.447
%.tmp594 = getelementptr i8, i8* %.tmp593, i32 %.tmp592
store i8 0, i8* %.tmp594
%.tmp595 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp596 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp595)
store i8 %.tmp596, i8* %c.451
%.tmp597 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp599 = getelementptr [4 x i8], [4 x i8]*@.str598, i32 0, i32 0
%.tmp600 = load i8*, i8** %buf.447
%.tmp601 = call %m297$.Token.type*(%m297$.ParseCtx.type*,i8*,i8*) @m297$push_token.m297$.Token.typep.m297$.ParseCtx.typep.cp.cp(%m297$.ParseCtx.type* %.tmp597, i8* %.tmp599, i8* %.tmp600)
br label %.if.end.562
.if.false.562:
%.tmp602 = load i8, i8* %c.451
%.tmp603 = icmp eq i8 %.tmp602, 10
br i1 %.tmp603, label %.if.true.604, label %.if.false.604
.if.true.604:
%.tmp605 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp607 = getelementptr [3 x i8], [3 x i8]*@.str606, i32 0, i32 0
%.tmp609 = getelementptr [2 x i8], [2 x i8]*@.str608, i32 0, i32 0
%.tmp610 = call %m297$.Token.type*(%m297$.ParseCtx.type*,i8*,i8*) @m297$push_token.m297$.Token.typep.m297$.ParseCtx.typep.cp.cp(%m297$.ParseCtx.type* %.tmp605, i8* %.tmp607, i8* %.tmp609)
%.tmp611 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp612 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp611)
store i8 %.tmp612, i8* %c.451
br label %.if.end.604
.if.false.604:
%.tmp613 = load i8, i8* %c.451
%.tmp614 = icmp eq i8 %.tmp613, 45
br i1 %.tmp614, label %.if.true.615, label %.if.false.615
.if.true.615:
%.tmp616 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp617 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp616)
store i8 %.tmp617, i8* %c.451
%.tmp618 = load i8, i8* %c.451
%.tmp619 = icmp ne i8 %.tmp618, 45
br i1 %.tmp619, label %.if.true.620, label %.if.false.620
.if.true.620:
%.tmp621 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp623 = getelementptr [9 x i8], [9 x i8]*@.str622, i32 0, i32 0
%.tmp625 = getelementptr [2 x i8], [2 x i8]*@.str624, i32 0, i32 0
%.tmp626 = call %m297$.Token.type*(%m297$.ParseCtx.type*,i8*,i8*) @m297$push_token.m297$.Token.typep.m297$.ParseCtx.typep.cp.cp(%m297$.ParseCtx.type* %.tmp621, i8* %.tmp623, i8* %.tmp625)
br label %.for.start.452
br label %.if.end.620
.if.false.620:
br label %.if.end.620
.if.end.620:
%.tmp627 = load i32, i32* %max_token_size.445
%.tmp628 = call i8*(i32) @malloc(i32 %.tmp627)
store i8* %.tmp628, i8** %buf.447
%.tmp629 = load i8*, i8** %buf.447
%.tmp630 = getelementptr i8, i8* %.tmp629, i32 0
store i8 45, i8* %.tmp630
store i32 1, i32* %idx.448
br label %.for.start.631
.for.start.631:
%.tmp632 = load i8, i8* %c.451
%.tmp633 = icmp ne i8 %.tmp632, 10
%.tmp634 = load i8, i8* %c.451
%.tmp635 = icmp ne i8 %.tmp634, 0
%.tmp636 = and i1 %.tmp633, %.tmp635
br i1 %.tmp636, label %.for.continue.631, label %.for.end.631
.for.continue.631:
%.tmp637 = load i32, i32* %idx.448
%.tmp638 = load i8*, i8** %buf.447
%.tmp639 = getelementptr i8, i8* %.tmp638, i32 %.tmp637
%.tmp640 = load i8, i8* %c.451
store i8 %.tmp640, i8* %.tmp639
%.tmp641 = load i32, i32* %idx.448
%.tmp642 = add i32 %.tmp641, 1
store i32 %.tmp642, i32* %idx.448
%.tmp643 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp644 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp643)
store i8 %.tmp644, i8* %c.451
br label %.for.start.631
.for.end.631:
%.tmp645 = load i32, i32* %idx.448
%.tmp646 = load i8*, i8** %buf.447
%.tmp647 = getelementptr i8, i8* %.tmp646, i32 %.tmp645
store i8 0, i8* %.tmp647
%.tmp648 = load i1, i1* %keep_comments
br i1 %.tmp648, label %.if.true.649, label %.if.false.649
.if.true.649:
%.tmp650 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp652 = getelementptr [8 x i8], [8 x i8]*@.str651, i32 0, i32 0
%.tmp653 = load i8*, i8** %buf.447
%.tmp654 = call %m297$.Token.type*(%m297$.ParseCtx.type*,i8*,i8*) @m297$push_token.m297$.Token.typep.m297$.ParseCtx.typep.cp.cp(%m297$.ParseCtx.type* %.tmp650, i8* %.tmp652, i8* %.tmp653)
br label %.if.end.649
.if.false.649:
%.tmp655 = load i8*, i8** %buf.447
%.tmp656 = bitcast i8* %.tmp655 to i8*
call void(i8*) @free(i8* %.tmp656)
br label %.if.end.649
.if.end.649:
br label %.if.end.615
.if.false.615:
%.tmp657 = load i8, i8* %c.451
%.tmp658 = icmp sgt i8 %.tmp657, 126
br i1 %.tmp658, label %.if.true.659, label %.if.false.659
.if.true.659:
%.tmp661 = getelementptr [47 x i8], [47 x i8]*@.str660, i32 0, i32 0
%.tmp662 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp663 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp662, i32 0, i32 1
%.tmp664 = load i32, i32* %.tmp663
%.tmp665 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp666 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp665, i32 0, i32 2
%.tmp667 = load i32, i32* %.tmp666
%.tmp668 = load i8, i8* %c.451
%.tmp669 = load i8, i8* %c.451
%.tmp670 = call i32(i8*,...) @printf(i8* %.tmp661, i32 %.tmp664, i32 %.tmp667, i8 %.tmp668, i8 %.tmp669)
call void(i32) @exit(i32 1)
br label %.if.end.659
.if.false.659:
br label %.if.end.659
.if.end.659:
%.tmp671 = load i8, i8* %c.451
%prev_c.672 = alloca i8
store i8 %.tmp671, i8* %prev_c.672
%.tmp673 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp674 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp673)
store i8 %.tmp674, i8* %c.451
%.tmp676 = getelementptr [9 x i8], [9 x i8]*@.str675, i32 0, i32 0
%type.677 = alloca i8*
store i8* %.tmp676, i8** %type.677
%.tmp678 = load i8, i8* %prev_c.672
%.tmp679 = icmp eq i8 %.tmp678, 61
%.tmp680 = load i8, i8* %c.451
%.tmp681 = icmp eq i8 %.tmp680, 61
%.tmp682 = and i1 %.tmp679, %.tmp681
br i1 %.tmp682, label %.if.true.683, label %.if.false.683
.if.true.683:
%.tmp684 = getelementptr i8*, i8** %buf.447, i32 0
%.tmp686 = getelementptr [3 x i8], [3 x i8]*@.str685, i32 0, i32 0
%.tmp687 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp684, i8* %.tmp686)
%.tmp688 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp689 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp688)
store i8 %.tmp689, i8* %c.451
br label %.if.end.683
.if.false.683:
%.tmp690 = load i8, i8* %prev_c.672
%.tmp691 = icmp eq i8 %.tmp690, 33
%.tmp692 = load i8, i8* %c.451
%.tmp693 = icmp eq i8 %.tmp692, 61
%.tmp694 = and i1 %.tmp691, %.tmp693
br i1 %.tmp694, label %.if.true.695, label %.if.false.695
.if.true.695:
%.tmp696 = getelementptr i8*, i8** %buf.447, i32 0
%.tmp698 = getelementptr [3 x i8], [3 x i8]*@.str697, i32 0, i32 0
%.tmp699 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp696, i8* %.tmp698)
%.tmp700 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp701 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp700)
store i8 %.tmp701, i8* %c.451
br label %.if.end.695
.if.false.695:
%.tmp702 = load i8, i8* %prev_c.672
%.tmp703 = icmp eq i8 %.tmp702, 62
%.tmp704 = load i8, i8* %c.451
%.tmp705 = icmp eq i8 %.tmp704, 61
%.tmp706 = and i1 %.tmp703, %.tmp705
br i1 %.tmp706, label %.if.true.707, label %.if.false.707
.if.true.707:
%.tmp708 = getelementptr i8*, i8** %buf.447, i32 0
%.tmp710 = getelementptr [3 x i8], [3 x i8]*@.str709, i32 0, i32 0
%.tmp711 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp708, i8* %.tmp710)
%.tmp712 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp713 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp712)
store i8 %.tmp713, i8* %c.451
br label %.if.end.707
.if.false.707:
%.tmp714 = load i8, i8* %prev_c.672
%.tmp715 = icmp eq i8 %.tmp714, 60
%.tmp716 = load i8, i8* %c.451
%.tmp717 = icmp eq i8 %.tmp716, 61
%.tmp718 = and i1 %.tmp715, %.tmp717
br i1 %.tmp718, label %.if.true.719, label %.if.false.719
.if.true.719:
%.tmp720 = getelementptr i8*, i8** %buf.447, i32 0
%.tmp722 = getelementptr [3 x i8], [3 x i8]*@.str721, i32 0, i32 0
%.tmp723 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp720, i8* %.tmp722)
%.tmp724 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp725 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp724)
store i8 %.tmp725, i8* %c.451
br label %.if.end.719
.if.false.719:
%.tmp726 = load i8, i8* %prev_c.672
%.tmp727 = icmp eq i8 %.tmp726, 46
%.tmp728 = load i8, i8* %c.451
%.tmp729 = icmp eq i8 %.tmp728, 46
%.tmp730 = and i1 %.tmp727, %.tmp729
br i1 %.tmp730, label %.if.true.731, label %.if.false.731
.if.true.731:
%.tmp732 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp733 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp732)
store i8 %.tmp733, i8* %c.451
%.tmp734 = load i8, i8* %c.451
%.tmp735 = icmp ne i8 %.tmp734, 46
br i1 %.tmp735, label %.if.true.736, label %.if.false.736
.if.true.736:
%.tmp738 = getelementptr [13 x i8], [13 x i8]*@.str737, i32 0, i32 0
%.tmp739 = call i32(i8*,...) @printf(i8* %.tmp738)
call void(i32) @exit(i32 1)
br label %.if.end.736
.if.false.736:
%.tmp740 = getelementptr i8*, i8** %buf.447, i32 0
%.tmp742 = getelementptr [4 x i8], [4 x i8]*@.str741, i32 0, i32 0
%.tmp743 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp740, i8* %.tmp742)
%.tmp745 = getelementptr [8 x i8], [8 x i8]*@.str744, i32 0, i32 0
store i8* %.tmp745, i8** %type.677
br label %.if.end.736
.if.end.736:
%.tmp746 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp747 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp746)
store i8 %.tmp747, i8* %c.451
br label %.if.end.731
.if.false.731:
%.tmp748 = call i8*(i32) @malloc(i32 2)
store i8* %.tmp748, i8** %buf.447
%.tmp749 = load i8*, i8** %buf.447
%.tmp750 = getelementptr i8, i8* %.tmp749, i32 0
%.tmp751 = load i8, i8* %prev_c.672
store i8 %.tmp751, i8* %.tmp750
%.tmp752 = load i8*, i8** %buf.447
%.tmp753 = getelementptr i8, i8* %.tmp752, i32 1
store i8 0, i8* %.tmp753
br label %.if.end.731
.if.end.731:
br label %.if.end.719
.if.end.719:
br label %.if.end.707
.if.end.707:
br label %.if.end.695
.if.end.695:
br label %.if.end.683
.if.end.683:
%.tmp754 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp755 = load i8*, i8** %type.677
%.tmp756 = load i8*, i8** %buf.447
%.tmp757 = call %m297$.Token.type*(%m297$.ParseCtx.type*,i8*,i8*) @m297$push_token.m297$.Token.typep.m297$.ParseCtx.typep.cp.cp(%m297$.ParseCtx.type* %.tmp754, i8* %.tmp755, i8* %.tmp756)
br label %.if.end.615
.if.end.615:
br label %.if.end.604
.if.end.604:
br label %.if.end.562
.if.end.562:
br label %.if.end.549
.if.end.549:
br label %.if.end.541
.if.end.541:
br label %.if.end.506
.if.end.506:
br label %.if.end.474
.if.end.474:
br label %.if.end.469
.if.end.469:
br label %.for.start.452
.for.end.452:
%.tmp758 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp760 = getelementptr [4 x i8], [4 x i8]*@.str759, i32 0, i32 0
%.tmp762 = getelementptr [1 x i8], [1 x i8]*@.str761, i32 0, i32 0
%.tmp763 = call %m297$.Token.type*(%m297$.ParseCtx.type*,i8*,i8*) @m297$push_token.m297$.Token.typep.m297$.ParseCtx.typep.cp.cp(%m297$.ParseCtx.type* %.tmp758, i8* %.tmp760, i8* %.tmp762)
%.tmp764 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp765 = getelementptr %m297$.ParseCtx.type, %m297$.ParseCtx.type* %.tmp764, i32 0, i32 3
%.tmp766 = load %m297$.Token.type*, %m297$.Token.type** %.tmp765
%root.767 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp766, %m297$.Token.type** %root.767
%.tmp768 = load %m297$.ParseCtx.type*, %m297$.ParseCtx.type** %ctx.435
%.tmp769 = bitcast %m297$.ParseCtx.type* %.tmp768 to i8*
call void(i8*) @free(i8* %.tmp769)
%.tmp770 = load %m297$.Token.type*, %m297$.Token.type** %root.767
%.tmp771 = bitcast %m297$.Token.type* %.tmp770 to %m297$.Token.type*
ret %m297$.Token.type* %.tmp771
}
define i8* @m297$read_string.cp.m298$.PeekerInfo.typep.c(%m298$.PeekerInfo.type* %.p.arg, i8 %.delimeter.arg) {
%p = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.p.arg, %m298$.PeekerInfo.type** %p
%delimeter = alloca i8
store i8 %.delimeter.arg, i8* %delimeter
%str_size.772 = alloca i32
store i32 64, i32* %str_size.772
%.tmp773 = load i32, i32* %str_size.772
%.tmp774 = call i8*(i32) @malloc(i32 %.tmp773)
%buf.775 = alloca i8*
store i8* %.tmp774, i8** %buf.775
%.tmp776 = load i8*, i8** %buf.775
%.tmp777 = getelementptr i8, i8* %.tmp776, i32 0
%.tmp778 = load i8, i8* %delimeter
store i8 %.tmp778, i8* %.tmp777
%.tmp779 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp780 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp779)
%c.781 = alloca i8
store i8 %.tmp780, i8* %c.781
%idx.782 = alloca i32
store i32 0, i32* %idx.782
store i32 1, i32* %idx.782
br label %.for.start.783
.for.start.783:
%.tmp784 = load i8, i8* %c.781
%.tmp785 = load i8, i8* %delimeter
%.tmp786 = icmp ne i8 %.tmp784, %.tmp785
br i1 %.tmp786, label %.for.continue.783, label %.for.end.783
.for.continue.783:
%.tmp787 = load i8, i8* %c.781
%.tmp788 = icmp ne i8 %.tmp787, 0
%.tmp790 = getelementptr [61 x i8], [61 x i8]*@.str789, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp788, i8* %.tmp790)
%.tmp791 = load i32, i32* %idx.782
%.tmp792 = load i32, i32* %str_size.772
%.tmp793 = sub i32 %.tmp792, 2
%.tmp794 = icmp eq i32 %.tmp791, %.tmp793
br i1 %.tmp794, label %.if.true.795, label %.if.false.795
.if.true.795:
%.tmp796 = load i32, i32* %str_size.772
%.tmp797 = mul i32 %.tmp796, 2
store i32 %.tmp797, i32* %str_size.772
%.tmp798 = load i8*, i8** %buf.775
%.tmp799 = load i32, i32* %str_size.772
%.tmp800 = call i8*(i8*,i32) @realloc(i8* %.tmp798, i32 %.tmp799)
store i8* %.tmp800, i8** %buf.775
br label %.if.end.795
.if.false.795:
br label %.if.end.795
.if.end.795:
%.tmp801 = load i32, i32* %idx.782
%.tmp802 = load i8*, i8** %buf.775
%.tmp803 = getelementptr i8, i8* %.tmp802, i32 %.tmp801
%.tmp804 = load i8, i8* %c.781
store i8 %.tmp804, i8* %.tmp803
%.tmp805 = load i32, i32* %idx.782
%.tmp806 = add i32 %.tmp805, 1
store i32 %.tmp806, i32* %idx.782
%.tmp807 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p
%.tmp808 = call i8(%m298$.PeekerInfo.type*) @m298$read.c.m298$.PeekerInfo.typep(%m298$.PeekerInfo.type* %.tmp807)
store i8 %.tmp808, i8* %c.781
br label %.for.start.783
.for.end.783:
%.tmp809 = load i32, i32* %idx.782
%.tmp810 = load i8*, i8** %buf.775
%.tmp811 = getelementptr i8, i8* %.tmp810, i32 %.tmp809
%.tmp812 = load i8, i8* %c.781
store i8 %.tmp812, i8* %.tmp811
%.tmp813 = load i32, i32* %idx.782
%.tmp814 = add i32 %.tmp813, 1
%.tmp815 = load i8*, i8** %buf.775
%.tmp816 = getelementptr i8, i8* %.tmp815, i32 %.tmp814
store i8 0, i8* %.tmp816
%.tmp817 = load i8*, i8** %buf.775
ret i8* %.tmp817
}
%m296$.Error.type = type {i32,i32,i8*,i8*}
@Error_size = constant i32 24
define %m296$.Error.type* @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.t.arg, i8* %.message.arg) {
%t = alloca %m297$.Token.type*
store %m297$.Token.type* %.t.arg, %m297$.Token.type** %t
%message = alloca i8*
store i8* %.message.arg, i8** %message
%.tmp818 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp819 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp818, i32 0, i32 4
%.tmp820 = load i8*, i8** %.tmp819
%.tmp821 = bitcast i8* %.tmp820 to i8*
%.tmp822 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp823 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp822, i32 0, i32 2
%.tmp824 = load i32, i32* %.tmp823
%.tmp825 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp826 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp825, i32 0, i32 3
%.tmp827 = load i32, i32* %.tmp826
%.tmp828 = load i8*, i8** %message
%.tmp829 = call %m296$.Error.type*(i8*,i32,i32,i8*) @m296$new.m296$.Error.typep.cp.i.i.cp(i8* %.tmp821, i32 %.tmp824, i32 %.tmp827, i8* %.tmp828)
ret %m296$.Error.type* %.tmp829
}
define %m296$.Error.type* @m296$new.m296$.Error.typep.cp.i.i.cp(i8* %.filename.arg, i32 %.line.arg, i32 %.char_of_line.arg, i8* %.message.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%line = alloca i32
store i32 %.line.arg, i32* %line
%char_of_line = alloca i32
store i32 %.char_of_line.arg, i32* %char_of_line
%message = alloca i8*
store i8* %.message.arg, i8** %message
%.tmp830 = load i32, i32* @Error_size
%.tmp831 = call i8*(i32) @malloc(i32 %.tmp830)
%.tmp832 = bitcast i8* %.tmp831 to %m296$.Error.type*
%e.833 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp832, %m296$.Error.type** %e.833
%.tmp834 = load %m296$.Error.type*, %m296$.Error.type** %e.833
%.tmp835 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp834, i32 0, i32 0
%.tmp836 = load i32, i32* %line
store i32 %.tmp836, i32* %.tmp835
%.tmp837 = load %m296$.Error.type*, %m296$.Error.type** %e.833
%.tmp838 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp837, i32 0, i32 1
%.tmp839 = load i32, i32* %char_of_line
store i32 %.tmp839, i32* %.tmp838
%.tmp840 = load %m296$.Error.type*, %m296$.Error.type** %e.833
%.tmp841 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp840, i32 0, i32 3
%.tmp842 = load i8*, i8** %message
store i8* %.tmp842, i8** %.tmp841
%.tmp843 = load %m296$.Error.type*, %m296$.Error.type** %e.833
%.tmp844 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp843, i32 0, i32 2
%.tmp845 = load i8*, i8** %filename
store i8* %.tmp845, i8** %.tmp844
%.tmp846 = load %m296$.Error.type*, %m296$.Error.type** %e.833
ret %m296$.Error.type* %.tmp846
}
define void @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.e.arg) {
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp848 = getelementptr [22 x i8], [22 x i8]*@.str847, i32 0, i32 0
%.tmp849 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp850 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp849, i32 0, i32 2
%.tmp851 = load i8*, i8** %.tmp850
%.tmp852 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp853 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp852, i32 0, i32 0
%.tmp854 = load i32, i32* %.tmp853
%.tmp855 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp856 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp855, i32 0, i32 1
%.tmp857 = load i32, i32* %.tmp856
%.tmp858 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp859 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp858, i32 0, i32 3
%.tmp860 = load i8*, i8** %.tmp859
%.tmp861 = call i32(i8*,...) @printf(i8* %.tmp848, i8* %.tmp851, i32 %.tmp854, i32 %.tmp857, i8* %.tmp860)
ret void
}
define void @m296$freport.v.m0$.File.typep.m296$.Error.typep(%m0$.File.type* %.fd.arg, %m296$.Error.type* %.e.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp862 = load %m0$.File.type*, %m0$.File.type** %fd
%.tmp864 = getelementptr [22 x i8], [22 x i8]*@.str863, i32 0, i32 0
%.tmp865 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp866 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp865, i32 0, i32 2
%.tmp867 = load i8*, i8** %.tmp866
%.tmp868 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp869 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp868, i32 0, i32 0
%.tmp870 = load i32, i32* %.tmp869
%.tmp871 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp872 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp871, i32 0, i32 1
%.tmp873 = load i32, i32* %.tmp872
%.tmp874 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp875 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp874, i32 0, i32 3
%.tmp876 = load i8*, i8** %.tmp875
%.tmp877 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp862, i8* %.tmp864, i8* %.tmp867, i32 %.tmp870, i32 %.tmp873, i8* %.tmp876)
ret void
}
%m878$.Query.type = type {i8,i8*,%m878$.Query.type*}
%m878$.Matcher.type = type {%m878$.Query.type*,i8,%m878$.Matcher.type*,%m878$.Matcher.type*}
%m878$.Rule.type = type {i8*,%m878$.Matcher.type*}
%m878$.ParsingContext.type = type {%m297$.Token.type*}
define %m878$.ParsingContext.type* @m878$new_context.m878$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.f.arg) {
%f = alloca %m0$.File.type*
store %m0$.File.type* %.f.arg, %m0$.File.type** %f
%.tmp879 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* null, i32 1
%.tmp880 = ptrtoint %m878$.ParsingContext.type* %.tmp879 to i32
%.tmp881 = call i8*(i32) @malloc(i32 %.tmp880)
%.tmp882 = bitcast i8* %.tmp881 to %m878$.ParsingContext.type*
%ctx.883 = alloca %m878$.ParsingContext.type*
store %m878$.ParsingContext.type* %.tmp882, %m878$.ParsingContext.type** %ctx.883
%.tmp884 = load %m0$.File.type*, %m0$.File.type** %f
%.tmp885 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp884)
%fd.886 = alloca i32
store i32 %.tmp885, i32* %fd.886
%.tmp887 = load i32, i32* %fd.886
%.tmp888 = call %m298$.PeekerInfo.type*(i32) @m298$new.m298$.PeekerInfo.typep.i(i32 %.tmp887)
%p.889 = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.tmp888, %m298$.PeekerInfo.type** %p.889
%.tmp890 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.889
%.tmp891 = call %m297$.Token.type*(%m298$.PeekerInfo.type*,i1) @m297$tokenize.m297$.Token.typep.m298$.PeekerInfo.typep.b(%m298$.PeekerInfo.type* %.tmp890, i1 0)
%token_list.892 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp891, %m297$.Token.type** %token_list.892
%.tmp893 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.889
%.tmp894 = bitcast %m298$.PeekerInfo.type* %.tmp893 to i8*
call void(i8*) @free(i8* %.tmp894)
%.tmp895 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx.883
%.tmp896 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp895, i32 0, i32 0
%.tmp897 = load %m297$.Token.type*, %m297$.Token.type** %token_list.892
store %m297$.Token.type* %.tmp897, %m297$.Token.type** %.tmp896
%.tmp898 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx.883
ret %m878$.ParsingContext.type* %.tmp898
}
define %m878$.Matcher.type* @m878$new_matcher.m878$.Matcher.typep() {
%.tmp899 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* null, i32 1
%.tmp900 = ptrtoint %m878$.Matcher.type* %.tmp899 to i32
%.tmp901 = call i8*(i32) @malloc(i32 %.tmp900)
%.tmp902 = bitcast i8* %.tmp901 to %m878$.Matcher.type*
%m.903 = alloca %m878$.Matcher.type*
store %m878$.Matcher.type* %.tmp902, %m878$.Matcher.type** %m.903
%.tmp904 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.903
%.tmp905 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp904, i32 0, i32 1
store i8 49, i8* %.tmp905
%.tmp906 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.903
%.tmp907 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp906, i32 0, i32 2
store %m878$.Matcher.type* null, %m878$.Matcher.type** %.tmp907
%.tmp908 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.903
%.tmp909 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp908, i32 0, i32 3
store %m878$.Matcher.type* null, %m878$.Matcher.type** %.tmp909
%.tmp910 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.903
%.tmp911 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp910, i32 0, i32 0
store %m878$.Query.type* null, %m878$.Query.type** %.tmp911
%.tmp912 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.903
ret %m878$.Matcher.type* %.tmp912
}
define %m878$.Matcher.type* @m878$parse_matcher.m878$.Matcher.typep.m878$.ParsingContext.typep(%m878$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m878$.ParsingContext.type*
store %m878$.ParsingContext.type* %.ctx.arg, %m878$.ParsingContext.type** %ctx
%m.913 = alloca %m878$.Matcher.type*
store %m878$.Matcher.type* null, %m878$.Matcher.type** %m.913
%.tmp914 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp915 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp914, i32 0, i32 0
%.tmp916 = load %m297$.Token.type*, %m297$.Token.type** %.tmp915
%.tmp917 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp916, i32 0, i32 1
%.tmp918 = load i8*, i8** %.tmp917
%.tmp920 = getelementptr [2 x i8], [2 x i8]*@.str919, i32 0, i32 0
%.tmp921 = call i32(i8*,i8*) @strcmp(i8* %.tmp918, i8* %.tmp920)
%.tmp922 = icmp eq i32 %.tmp921, 0
br i1 %.tmp922, label %.if.true.923, label %.if.false.923
.if.true.923:
%.tmp924 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp925 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp924, i32 0, i32 0
%.tmp926 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp927 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp926, i32 0, i32 0
%.tmp928 = load %m297$.Token.type*, %m297$.Token.type** %.tmp927
%.tmp929 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp928, i32 0, i32 5
%.tmp930 = load %m297$.Token.type*, %m297$.Token.type** %.tmp929
store %m297$.Token.type* %.tmp930, %m297$.Token.type** %.tmp925
%max_matchers.931 = alloca i32
store i32 10, i32* %max_matchers.931
%.tmp932 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp933 = call %m878$.Matcher.type*(%m878$.ParsingContext.type*) @m878$parse_matcher.m878$.Matcher.typep.m878$.ParsingContext.typep(%m878$.ParsingContext.type* %.tmp932)
store %m878$.Matcher.type* %.tmp933, %m878$.Matcher.type** %m.913
%.tmp934 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp935 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp934, i32 0, i32 0
%.tmp936 = load %m297$.Token.type*, %m297$.Token.type** %.tmp935
%.tmp937 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp936, i32 0, i32 1
%.tmp938 = load i8*, i8** %.tmp937
%.tmp940 = getelementptr [2 x i8], [2 x i8]*@.str939, i32 0, i32 0
%.tmp941 = call i32(i8*,i8*) @strcmp(i8* %.tmp938, i8* %.tmp940)
%.tmp942 = icmp eq i32 %.tmp941, 0
br i1 %.tmp942, label %.if.true.943, label %.if.false.943
.if.true.943:
%.tmp944 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp945 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp944, i32 0, i32 0
%.tmp946 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp947 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp946, i32 0, i32 0
%.tmp948 = load %m297$.Token.type*, %m297$.Token.type** %.tmp947
%.tmp949 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp948, i32 0, i32 5
%.tmp950 = load %m297$.Token.type*, %m297$.Token.type** %.tmp949
store %m297$.Token.type* %.tmp950, %m297$.Token.type** %.tmp945
%.tmp951 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.913
%last_matcher.952 = alloca %m878$.Matcher.type*
store %m878$.Matcher.type* %.tmp951, %m878$.Matcher.type** %last_matcher.952
br label %.for.start.953
.for.start.953:
%.tmp954 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp955 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp954, i32 0, i32 0
%.tmp956 = load %m297$.Token.type*, %m297$.Token.type** %.tmp955
%.tmp957 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp956, i32 0, i32 1
%.tmp958 = load i8*, i8** %.tmp957
%.tmp960 = getelementptr [2 x i8], [2 x i8]*@.str959, i32 0, i32 0
%.tmp961 = call i32(i8*,i8*) @strcmp(i8* %.tmp958, i8* %.tmp960)
%.tmp962 = icmp ne i32 %.tmp961, 0
%.tmp963 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp964 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp963, i32 0, i32 0
%.tmp965 = load %m297$.Token.type*, %m297$.Token.type** %.tmp964
%.tmp966 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp965, i32 0, i32 0
%.tmp967 = load i8*, i8** %.tmp966
%.tmp969 = getelementptr [4 x i8], [4 x i8]*@.str968, i32 0, i32 0
%.tmp970 = call i32(i8*,i8*) @strcmp(i8* %.tmp967, i8* %.tmp969)
%.tmp971 = icmp ne i32 %.tmp970, 0
%.tmp972 = and i1 %.tmp962, %.tmp971
br i1 %.tmp972, label %.for.continue.953, label %.for.end.953
.for.continue.953:
%.tmp973 = load %m878$.Matcher.type*, %m878$.Matcher.type** %last_matcher.952
%.tmp974 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp973, i32 0, i32 2
%.tmp975 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp976 = call %m878$.Matcher.type*(%m878$.ParsingContext.type*) @m878$parse_matcher.m878$.Matcher.typep.m878$.ParsingContext.typep(%m878$.ParsingContext.type* %.tmp975)
store %m878$.Matcher.type* %.tmp976, %m878$.Matcher.type** %.tmp974
%.tmp977 = load %m878$.Matcher.type*, %m878$.Matcher.type** %last_matcher.952
%.tmp978 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp977, i32 0, i32 2
%.tmp979 = load %m878$.Matcher.type*, %m878$.Matcher.type** %.tmp978
store %m878$.Matcher.type* %.tmp979, %m878$.Matcher.type** %last_matcher.952
%.tmp980 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp981 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp980, i32 0, i32 0
%.tmp982 = load %m297$.Token.type*, %m297$.Token.type** %.tmp981
%.tmp983 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp982, i32 0, i32 1
%.tmp984 = load i8*, i8** %.tmp983
%.tmp986 = getelementptr [2 x i8], [2 x i8]*@.str985, i32 0, i32 0
%.tmp987 = call i32(i8*,i8*) @strcmp(i8* %.tmp984, i8* %.tmp986)
%.tmp988 = icmp ne i32 %.tmp987, 0
%.tmp989 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp990 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp989, i32 0, i32 0
%.tmp991 = load %m297$.Token.type*, %m297$.Token.type** %.tmp990
%.tmp992 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp991, i32 0, i32 1
%.tmp993 = load i8*, i8** %.tmp992
%.tmp995 = getelementptr [2 x i8], [2 x i8]*@.str994, i32 0, i32 0
%.tmp996 = call i32(i8*,i8*) @strcmp(i8* %.tmp993, i8* %.tmp995)
%.tmp997 = icmp ne i32 %.tmp996, 0
%.tmp998 = and i1 %.tmp988, %.tmp997
br i1 %.tmp998, label %.if.true.999, label %.if.false.999
.if.true.999:
%.tmp1001 = getelementptr [48 x i8], [48 x i8]*@.str1000, i32 0, i32 0
%.tmp1002 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1003 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1002, i32 0, i32 0
%.tmp1004 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1003
%.tmp1005 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1004, i32 0, i32 2
%.tmp1006 = load i32, i32* %.tmp1005
%.tmp1007 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1008 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1007, i32 0, i32 0
%.tmp1009 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1008
%.tmp1010 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1009, i32 0, i32 3
%.tmp1011 = load i32, i32* %.tmp1010
%.tmp1012 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1013 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1012, i32 0, i32 0
%.tmp1014 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1013
%.tmp1015 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1014, i32 0, i32 1
%.tmp1016 = load i8*, i8** %.tmp1015
%.tmp1017 = call i32(i8*,...) @printf(i8* %.tmp1001, i32 %.tmp1006, i32 %.tmp1011, i8* %.tmp1016)
call void(i32) @exit(i32 1)
br label %.if.end.999
.if.false.999:
br label %.if.end.999
.if.end.999:
%.tmp1018 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1019 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1018, i32 0, i32 0
%.tmp1020 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1019
%.tmp1021 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1020, i32 0, i32 1
%.tmp1022 = load i8*, i8** %.tmp1021
%.tmp1024 = getelementptr [2 x i8], [2 x i8]*@.str1023, i32 0, i32 0
%.tmp1025 = call i32(i8*,i8*) @strcmp(i8* %.tmp1022, i8* %.tmp1024)
%.tmp1026 = icmp eq i32 %.tmp1025, 0
br i1 %.tmp1026, label %.if.true.1027, label %.if.false.1027
.if.true.1027:
%.tmp1028 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1029 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1028, i32 0, i32 0
%.tmp1030 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1031 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1030, i32 0, i32 0
%.tmp1032 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1031
%.tmp1033 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1032, i32 0, i32 5
%.tmp1034 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1033
store %m297$.Token.type* %.tmp1034, %m297$.Token.type** %.tmp1029
br label %.if.end.1027
.if.false.1027:
br label %.if.end.1027
.if.end.1027:
br label %.for.start.953
.for.end.953:
br label %.if.end.943
.if.false.943:
br label %.if.end.943
.if.end.943:
%.tmp1035 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1036 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1035, i32 0, i32 0
%.tmp1037 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1036
%.tmp1038 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1037, i32 0, i32 1
%.tmp1039 = load i8*, i8** %.tmp1038
%.tmp1041 = getelementptr [2 x i8], [2 x i8]*@.str1040, i32 0, i32 0
%.tmp1042 = call i32(i8*,i8*) @strcmp(i8* %.tmp1039, i8* %.tmp1041)
%.tmp1043 = icmp ne i32 %.tmp1042, 0
br i1 %.tmp1043, label %.if.true.1044, label %.if.false.1044
.if.true.1044:
%.tmp1045 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1047 = getelementptr [22 x i8], [22 x i8]*@.str1046, i32 0, i32 0
call void(%m878$.ParsingContext.type*,i8*) @m878$parser_error.v.m878$.ParsingContext.typep.cp(%m878$.ParsingContext.type* %.tmp1045, i8* %.tmp1047)
br label %.if.end.1044
.if.false.1044:
br label %.if.end.1044
.if.end.1044:
%.tmp1048 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1049 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1048, i32 0, i32 0
%.tmp1050 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1051 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1050, i32 0, i32 0
%.tmp1052 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1051
%.tmp1053 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1052, i32 0, i32 5
%.tmp1054 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1053
store %m297$.Token.type* %.tmp1054, %m297$.Token.type** %.tmp1049
%.tmp1055 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1056 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1055, i32 0, i32 0
%.tmp1057 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1056
%.tmp1058 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1057, i32 0, i32 1
%.tmp1059 = load i8*, i8** %.tmp1058
%.tmp1061 = getelementptr [2 x i8], [2 x i8]*@.str1060, i32 0, i32 0
%.tmp1062 = call i32(i8*,i8*) @strcmp(i8* %.tmp1059, i8* %.tmp1061)
%.tmp1063 = icmp eq i32 %.tmp1062, 0
br i1 %.tmp1063, label %.if.true.1064, label %.if.false.1064
.if.true.1064:
%.tmp1065 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1066 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1065, i32 0, i32 0
%.tmp1067 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1068 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1067, i32 0, i32 0
%.tmp1069 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1068
%.tmp1070 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1069, i32 0, i32 5
%.tmp1071 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1070
store %m297$.Token.type* %.tmp1071, %m297$.Token.type** %.tmp1066
%.tmp1072 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.913
%.tmp1073 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1072, i32 0, i32 1
store i8 43, i8* %.tmp1073
br label %.if.end.1064
.if.false.1064:
%.tmp1074 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1075 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1074, i32 0, i32 0
%.tmp1076 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1075
%.tmp1077 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1076, i32 0, i32 1
%.tmp1078 = load i8*, i8** %.tmp1077
%.tmp1080 = getelementptr [2 x i8], [2 x i8]*@.str1079, i32 0, i32 0
%.tmp1081 = call i32(i8*,i8*) @strcmp(i8* %.tmp1078, i8* %.tmp1080)
%.tmp1082 = icmp eq i32 %.tmp1081, 0
br i1 %.tmp1082, label %.if.true.1083, label %.if.false.1083
.if.true.1083:
%.tmp1084 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1085 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1084, i32 0, i32 0
%.tmp1086 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1087 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1086, i32 0, i32 0
%.tmp1088 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1087
%.tmp1089 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1088, i32 0, i32 5
%.tmp1090 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1089
store %m297$.Token.type* %.tmp1090, %m297$.Token.type** %.tmp1085
%.tmp1091 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.913
%.tmp1092 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1091, i32 0, i32 1
store i8 42, i8* %.tmp1092
br label %.if.end.1083
.if.false.1083:
%.tmp1093 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1094 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1093, i32 0, i32 0
%.tmp1095 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1094
%.tmp1096 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1095, i32 0, i32 1
%.tmp1097 = load i8*, i8** %.tmp1096
%.tmp1099 = getelementptr [2 x i8], [2 x i8]*@.str1098, i32 0, i32 0
%.tmp1100 = call i32(i8*,i8*) @strcmp(i8* %.tmp1097, i8* %.tmp1099)
%.tmp1101 = icmp eq i32 %.tmp1100, 0
br i1 %.tmp1101, label %.if.true.1102, label %.if.false.1102
.if.true.1102:
%.tmp1103 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1104 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1103, i32 0, i32 0
%.tmp1105 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1106 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1105, i32 0, i32 0
%.tmp1107 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1106
%.tmp1108 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1107, i32 0, i32 5
%.tmp1109 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1108
store %m297$.Token.type* %.tmp1109, %m297$.Token.type** %.tmp1104
%.tmp1110 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.913
%.tmp1111 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1110, i32 0, i32 1
store i8 63, i8* %.tmp1111
br label %.if.end.1102
.if.false.1102:
br label %.if.end.1102
.if.end.1102:
br label %.if.end.1083
.if.end.1083:
br label %.if.end.1064
.if.end.1064:
br label %.if.end.923
.if.false.923:
%.tmp1112 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1113 = call %m878$.Matcher.type*(%m878$.ParsingContext.type*) @m878$parse_simple_matcher.m878$.Matcher.typep.m878$.ParsingContext.typep(%m878$.ParsingContext.type* %.tmp1112)
store %m878$.Matcher.type* %.tmp1113, %m878$.Matcher.type** %m.913
br label %.if.end.923
.if.end.923:
%.tmp1114 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1115 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1114, i32 0, i32 0
%.tmp1116 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1115
%.tmp1117 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1116, i32 0, i32 1
%.tmp1118 = load i8*, i8** %.tmp1117
%.tmp1120 = getelementptr [2 x i8], [2 x i8]*@.str1119, i32 0, i32 0
%.tmp1121 = call i32(i8*,i8*) @strcmp(i8* %.tmp1118, i8* %.tmp1120)
%.tmp1122 = icmp eq i32 %.tmp1121, 0
%.tmp1123 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1124 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1123, i32 0, i32 0
%.tmp1125 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1124
%.tmp1126 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1125, i32 0, i32 0
%.tmp1127 = load i8*, i8** %.tmp1126
%.tmp1129 = getelementptr [5 x i8], [5 x i8]*@.str1128, i32 0, i32 0
%.tmp1130 = call i32(i8*,i8*) @strcmp(i8* %.tmp1127, i8* %.tmp1129)
%.tmp1131 = icmp eq i32 %.tmp1130, 0
%.tmp1132 = or i1 %.tmp1122, %.tmp1131
br i1 %.tmp1132, label %.if.true.1133, label %.if.false.1133
.if.true.1133:
%.tmp1134 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.913
%.tmp1135 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1134, i32 0, i32 3
%.tmp1136 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1137 = call %m878$.Matcher.type*(%m878$.ParsingContext.type*) @m878$parse_matcher.m878$.Matcher.typep.m878$.ParsingContext.typep(%m878$.ParsingContext.type* %.tmp1136)
store %m878$.Matcher.type* %.tmp1137, %m878$.Matcher.type** %.tmp1135
br label %.if.end.1133
.if.false.1133:
br label %.if.end.1133
.if.end.1133:
%.tmp1138 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.913
ret %m878$.Matcher.type* %.tmp1138
}
define %m878$.Matcher.type* @m878$parse_simple_matcher.m878$.Matcher.typep.m878$.ParsingContext.typep(%m878$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m878$.ParsingContext.type*
store %m878$.ParsingContext.type* %.ctx.arg, %m878$.ParsingContext.type** %ctx
%.tmp1139 = call %m878$.Matcher.type*() @m878$new_matcher.m878$.Matcher.typep()
%m.1140 = alloca %m878$.Matcher.type*
store %m878$.Matcher.type* %.tmp1139, %m878$.Matcher.type** %m.1140
%count.1141 = alloca i32
store i32 0, i32* %count.1141
%.tmp1142 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1143 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1142, i32 0, i32 0
%.tmp1144 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1143
%ptr.1145 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1144, %m297$.Token.type** %ptr.1145
store i32 0, i32* %count.1141
br label %.for.start.1146
.for.start.1146:
%.tmp1147 = load %m297$.Token.type*, %m297$.Token.type** %ptr.1145
%.tmp1148 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1147, i32 0, i32 0
%.tmp1149 = load i8*, i8** %.tmp1148
%.tmp1151 = getelementptr [5 x i8], [5 x i8]*@.str1150, i32 0, i32 0
%.tmp1152 = call i32(i8*,i8*) @strcmp(i8* %.tmp1149, i8* %.tmp1151)
%.tmp1153 = icmp eq i32 %.tmp1152, 0
%.tmp1154 = load %m297$.Token.type*, %m297$.Token.type** %ptr.1145
%.tmp1155 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1154, i32 0, i32 0
%.tmp1156 = load i8*, i8** %.tmp1155
%.tmp1158 = getelementptr [7 x i8], [7 x i8]*@.str1157, i32 0, i32 0
%.tmp1159 = call i32(i8*,i8*) @strcmp(i8* %.tmp1156, i8* %.tmp1158)
%.tmp1160 = icmp eq i32 %.tmp1159, 0
%.tmp1161 = or i1 %.tmp1153, %.tmp1160
br i1 %.tmp1161, label %.for.continue.1146, label %.for.end.1146
.for.continue.1146:
%.tmp1162 = load i32, i32* %count.1141
%.tmp1163 = add i32 %.tmp1162, 1
store i32 %.tmp1163, i32* %count.1141
%.tmp1164 = load %m297$.Token.type*, %m297$.Token.type** %ptr.1145
%.tmp1165 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1164, i32 0, i32 5
%.tmp1166 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1165
store %m297$.Token.type* %.tmp1166, %m297$.Token.type** %ptr.1145
br label %.for.start.1146
.for.end.1146:
%.tmp1167 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.1140
%.tmp1168 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1167, i32 0, i32 0
%.tmp1169 = getelementptr %m878$.Query.type, %m878$.Query.type* null, i32 1
%.tmp1170 = ptrtoint %m878$.Query.type* %.tmp1169 to i32
%.tmp1171 = call i8*(i32) @malloc(i32 %.tmp1170)
%.tmp1172 = bitcast i8* %.tmp1171 to %m878$.Query.type*
store %m878$.Query.type* %.tmp1172, %m878$.Query.type** %.tmp1168
%.tmp1173 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.1140
%.tmp1174 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1173, i32 0, i32 0
%.tmp1175 = load %m878$.Query.type*, %m878$.Query.type** %.tmp1174
%q.1176 = alloca %m878$.Query.type*
store %m878$.Query.type* %.tmp1175, %m878$.Query.type** %q.1176
%i.1178 = alloca i32
store i32 0, i32* %i.1178
br label %.for.start.1177
.for.start.1177:
%.tmp1179 = load i32, i32* %i.1178
%.tmp1180 = load i32, i32* %count.1141
%.tmp1181 = icmp slt i32 %.tmp1179, %.tmp1180
br i1 %.tmp1181, label %.for.continue.1177, label %.for.end.1177
.for.continue.1177:
%.tmp1182 = load i32, i32* %i.1178
%.tmp1183 = icmp sgt i32 %.tmp1182, 0
br i1 %.tmp1183, label %.if.true.1184, label %.if.false.1184
.if.true.1184:
%.tmp1185 = load %m878$.Query.type*, %m878$.Query.type** %q.1176
%.tmp1186 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1185, i32 0, i32 2
%.tmp1187 = getelementptr %m878$.Query.type, %m878$.Query.type* null, i32 1
%.tmp1188 = ptrtoint %m878$.Query.type* %.tmp1187 to i32
%.tmp1189 = call i8*(i32) @malloc(i32 %.tmp1188)
%.tmp1190 = bitcast i8* %.tmp1189 to %m878$.Query.type*
store %m878$.Query.type* %.tmp1190, %m878$.Query.type** %.tmp1186
%.tmp1191 = load %m878$.Query.type*, %m878$.Query.type** %q.1176
%.tmp1192 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1191, i32 0, i32 2
%.tmp1193 = load %m878$.Query.type*, %m878$.Query.type** %.tmp1192
store %m878$.Query.type* %.tmp1193, %m878$.Query.type** %q.1176
br label %.if.end.1184
.if.false.1184:
br label %.if.end.1184
.if.end.1184:
%.tmp1194 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1195 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1194, i32 0, i32 0
%.tmp1196 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1195
%.tmp1197 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1196, i32 0, i32 0
%.tmp1198 = load i8*, i8** %.tmp1197
%.tmp1200 = getelementptr [7 x i8], [7 x i8]*@.str1199, i32 0, i32 0
%.tmp1201 = call i32(i8*,i8*) @strcmp(i8* %.tmp1198, i8* %.tmp1200)
%.tmp1202 = icmp eq i32 %.tmp1201, 0
br i1 %.tmp1202, label %.if.true.1203, label %.if.false.1203
.if.true.1203:
%.tmp1204 = load %m878$.Query.type*, %m878$.Query.type** %q.1176
%.tmp1205 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1204, i32 0, i32 0
store i8 118, i8* %.tmp1205
br label %.if.end.1203
.if.false.1203:
%.tmp1206 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1207 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1206, i32 0, i32 0
%.tmp1208 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1207
%.tmp1209 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1208, i32 0, i32 1
%.tmp1210 = load i8*, i8** %.tmp1209
%.tmp1211 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1210)
br i1 %.tmp1211, label %.if.true.1212, label %.if.false.1212
.if.true.1212:
%.tmp1213 = load %m878$.Query.type*, %m878$.Query.type** %q.1176
%.tmp1214 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1213, i32 0, i32 0
store i8 97, i8* %.tmp1214
br label %.if.end.1212
.if.false.1212:
%.tmp1215 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1216 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1215, i32 0, i32 0
%.tmp1217 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1216
%.tmp1218 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1217, i32 0, i32 1
%.tmp1219 = load i8*, i8** %.tmp1218
%.tmp1220 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1219)
br i1 %.tmp1220, label %.if.true.1221, label %.if.false.1221
.if.true.1221:
%.tmp1222 = load %m878$.Query.type*, %m878$.Query.type** %q.1176
%.tmp1223 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1222, i32 0, i32 0
store i8 116, i8* %.tmp1223
br label %.if.end.1221
.if.false.1221:
%.tmp1225 = getelementptr [17 x i8], [17 x i8]*@.str1224, i32 0, i32 0
%.tmp1226 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1227 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1226, i32 0, i32 0
%.tmp1228 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1227
%.tmp1229 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1228, i32 0, i32 1
%.tmp1230 = load i8*, i8** %.tmp1229
%.tmp1231 = call i32(i8*,...) @printf(i8* %.tmp1225, i8* %.tmp1230)
%.tmp1232 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1234 = getelementptr [50 x i8], [50 x i8]*@.str1233, i32 0, i32 0
call void(%m878$.ParsingContext.type*,i8*) @m878$parser_error.v.m878$.ParsingContext.typep.cp(%m878$.ParsingContext.type* %.tmp1232, i8* %.tmp1234)
br label %.if.end.1221
.if.end.1221:
br label %.if.end.1212
.if.end.1212:
br label %.if.end.1203
.if.end.1203:
%.tmp1235 = load %m878$.Query.type*, %m878$.Query.type** %q.1176
%.tmp1236 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1235, i32 0, i32 1
%.tmp1237 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1238 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1237, i32 0, i32 0
%.tmp1239 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1238
%.tmp1240 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1239, i32 0, i32 1
%.tmp1241 = load i8*, i8** %.tmp1240
store i8* %.tmp1241, i8** %.tmp1236
%.tmp1242 = load %m878$.Query.type*, %m878$.Query.type** %q.1176
%.tmp1243 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1242, i32 0, i32 2
store %m878$.Query.type* null, %m878$.Query.type** %.tmp1243
%.tmp1244 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1245 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1244, i32 0, i32 0
%.tmp1246 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1247 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1246, i32 0, i32 0
%.tmp1248 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1247
%.tmp1249 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1248, i32 0, i32 5
%.tmp1250 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1249
store %m297$.Token.type* %.tmp1250, %m297$.Token.type** %.tmp1245
%.tmp1251 = load i32, i32* %i.1178
%.tmp1252 = add i32 %.tmp1251, 1
store i32 %.tmp1252, i32* %i.1178
br label %.for.start.1177
.for.end.1177:
%.tmp1253 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m.1140
ret %m878$.Matcher.type* %.tmp1253
}
define %m878$.Rule.type* @m878$parse_rule.m878$.Rule.typep.m878$.ParsingContext.typep(%m878$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m878$.ParsingContext.type*
store %m878$.ParsingContext.type* %.ctx.arg, %m878$.ParsingContext.type** %ctx
%.tmp1254 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1255 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1254, i32 0, i32 0
%.tmp1256 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1255
%.tmp1257 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1256, i32 0, i32 1
%.tmp1258 = load i8*, i8** %.tmp1257
%rule_name.1259 = alloca i8*
store i8* %.tmp1258, i8** %rule_name.1259
%.tmp1260 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1261 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1260, i32 0, i32 0
%.tmp1262 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1261
%.tmp1263 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1262, i32 0, i32 0
%.tmp1264 = load i8*, i8** %.tmp1263
%.tmp1266 = getelementptr [5 x i8], [5 x i8]*@.str1265, i32 0, i32 0
%.tmp1267 = call i32(i8*,i8*) @strcmp(i8* %.tmp1264, i8* %.tmp1266)
%.tmp1268 = icmp ne i32 %.tmp1267, 0
br i1 %.tmp1268, label %.if.true.1269, label %.if.false.1269
.if.true.1269:
%.tmp1271 = getelementptr [37 x i8], [37 x i8]*@.str1270, i32 0, i32 0
%.tmp1272 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1273 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1272, i32 0, i32 0
%.tmp1274 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1273
%.tmp1275 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1274, i32 0, i32 0
%.tmp1276 = load i8*, i8** %.tmp1275
%.tmp1277 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1278 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1277, i32 0, i32 0
%.tmp1279 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1278
%.tmp1280 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1279, i32 0, i32 1
%.tmp1281 = load i8*, i8** %.tmp1280
%.tmp1282 = call i32(i8*,...) @printf(i8* %.tmp1271, i8* %.tmp1276, i8* %.tmp1281)
%.tmp1283 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1285 = getelementptr [31 x i8], [31 x i8]*@.str1284, i32 0, i32 0
call void(%m878$.ParsingContext.type*,i8*) @m878$parser_error.v.m878$.ParsingContext.typep.cp(%m878$.ParsingContext.type* %.tmp1283, i8* %.tmp1285)
br label %.if.end.1269
.if.false.1269:
br label %.if.end.1269
.if.end.1269:
%.tmp1286 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1287 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1286, i32 0, i32 0
%.tmp1288 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1289 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1288, i32 0, i32 0
%.tmp1290 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1289
%.tmp1291 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1290, i32 0, i32 5
%.tmp1292 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1291
store %m297$.Token.type* %.tmp1292, %m297$.Token.type** %.tmp1287
%.tmp1293 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1294 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1293, i32 0, i32 0
%.tmp1295 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1294
%.tmp1296 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1295, i32 0, i32 1
%.tmp1297 = load i8*, i8** %.tmp1296
%.tmp1299 = getelementptr [2 x i8], [2 x i8]*@.str1298, i32 0, i32 0
%.tmp1300 = call i32(i8*,i8*) @strcmp(i8* %.tmp1297, i8* %.tmp1299)
%.tmp1301 = icmp ne i32 %.tmp1300, 0
br i1 %.tmp1301, label %.if.true.1302, label %.if.false.1302
.if.true.1302:
%.tmp1303 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1304 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1303, i32 0, i32 0
%.tmp1305 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1304
%.tmp1306 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1305, i32 0, i32 1
%.tmp1307 = load i8*, i8** %.tmp1306
%.tmp1308 = call i32(i8*,...) @printf(i8* %.tmp1307)
%.tmp1309 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1311 = getelementptr [27 x i8], [27 x i8]*@.str1310, i32 0, i32 0
call void(%m878$.ParsingContext.type*,i8*) @m878$parser_error.v.m878$.ParsingContext.typep.cp(%m878$.ParsingContext.type* %.tmp1309, i8* %.tmp1311)
br label %.if.end.1302
.if.false.1302:
br label %.if.end.1302
.if.end.1302:
%.tmp1312 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1313 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1312, i32 0, i32 0
%.tmp1314 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1315 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1314, i32 0, i32 0
%.tmp1316 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1315
%.tmp1317 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1316, i32 0, i32 5
%.tmp1318 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1317
store %m297$.Token.type* %.tmp1318, %m297$.Token.type** %.tmp1313
%.tmp1319 = getelementptr %m878$.Rule.type, %m878$.Rule.type* null, i32 1
%.tmp1320 = ptrtoint %m878$.Rule.type* %.tmp1319 to i32
%.tmp1321 = call i8*(i32) @malloc(i32 %.tmp1320)
%.tmp1322 = bitcast i8* %.tmp1321 to %m878$.Rule.type*
%rule.1323 = alloca %m878$.Rule.type*
store %m878$.Rule.type* %.tmp1322, %m878$.Rule.type** %rule.1323
%.tmp1324 = load %m878$.Rule.type*, %m878$.Rule.type** %rule.1323
%.tmp1325 = getelementptr %m878$.Rule.type, %m878$.Rule.type* %.tmp1324, i32 0, i32 0
%.tmp1326 = load i8*, i8** %rule_name.1259
store i8* %.tmp1326, i8** %.tmp1325
%.tmp1327 = load %m878$.Rule.type*, %m878$.Rule.type** %rule.1323
%.tmp1328 = getelementptr %m878$.Rule.type, %m878$.Rule.type* %.tmp1327, i32 0, i32 1
%.tmp1329 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1330 = call %m878$.Matcher.type*(%m878$.ParsingContext.type*) @m878$parse_matcher.m878$.Matcher.typep.m878$.ParsingContext.typep(%m878$.ParsingContext.type* %.tmp1329)
store %m878$.Matcher.type* %.tmp1330, %m878$.Matcher.type** %.tmp1328
%.tmp1331 = load %m878$.Rule.type*, %m878$.Rule.type** %rule.1323
ret %m878$.Rule.type* %.tmp1331
}
define void @m878$parser_error.v.m878$.ParsingContext.typep.cp(%m878$.ParsingContext.type* %.ctx.arg, i8* %.error.arg) {
%ctx = alloca %m878$.ParsingContext.type*
store %m878$.ParsingContext.type* %.ctx.arg, %m878$.ParsingContext.type** %ctx
%error = alloca i8*
store i8* %.error.arg, i8** %error
%.tmp1332 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1333 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1332, i32 0, i32 0
%.tmp1334 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1333
%.tmp1335 = load i8*, i8** %error
%.tmp1336 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1334, i8* %.tmp1335)
%e.1337 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1336, %m296$.Error.type** %e.1337
%.tmp1338 = load %m296$.Error.type*, %m296$.Error.type** %e.1337
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp1338)
call void(i32) @exit(i32 1)
ret void
}
define %m878$.Rule.type** @m878$parse_grammar.m878$.Rule.typepp.m878$.ParsingContext.typep(%m878$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m878$.ParsingContext.type*
store %m878$.ParsingContext.type* %.ctx.arg, %m878$.ParsingContext.type** %ctx
%max_rules.1339 = alloca i32
store i32 40, i32* %max_rules.1339
%.tmp1340 = load i32, i32* @ptr_size
%.tmp1341 = load i32, i32* %max_rules.1339
%.tmp1342 = mul i32 %.tmp1340, %.tmp1341
%.tmp1343 = call i8*(i32) @malloc(i32 %.tmp1342)
%.tmp1344 = bitcast i8* %.tmp1343 to %m878$.Rule.type**
%grammar.1345 = alloca %m878$.Rule.type**
store %m878$.Rule.type** %.tmp1344, %m878$.Rule.type*** %grammar.1345
%i.1347 = alloca i32
store i32 0, i32* %i.1347
br label %.for.start.1346
.for.start.1346:
%.tmp1348 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1349 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1348, i32 0, i32 0
%.tmp1350 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1349
%.tmp1351 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1350, i32 0, i32 0
%.tmp1352 = load i8*, i8** %.tmp1351
%.tmp1354 = getelementptr [4 x i8], [4 x i8]*@.str1353, i32 0, i32 0
%.tmp1355 = call i32(i8*,i8*) @strcmp(i8* %.tmp1352, i8* %.tmp1354)
%.tmp1356 = icmp ne i32 %.tmp1355, 0
br i1 %.tmp1356, label %.for.continue.1346, label %.for.end.1346
.for.continue.1346:
%.tmp1357 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1358 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1357, i32 0, i32 0
%.tmp1359 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1358
%.tmp1360 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1359, i32 0, i32 0
%.tmp1361 = load i8*, i8** %.tmp1360
%.tmp1363 = getelementptr [3 x i8], [3 x i8]*@.str1362, i32 0, i32 0
%.tmp1364 = call i32(i8*,i8*) @strcmp(i8* %.tmp1361, i8* %.tmp1363)
%.tmp1365 = icmp ne i32 %.tmp1364, 0
br i1 %.tmp1365, label %.if.true.1366, label %.if.false.1366
.if.true.1366:
%.tmp1367 = load i32, i32* %i.1347
%.tmp1368 = load %m878$.Rule.type**, %m878$.Rule.type*** %grammar.1345
%.tmp1369 = getelementptr %m878$.Rule.type*, %m878$.Rule.type** %.tmp1368, i32 %.tmp1367
%.tmp1370 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1371 = call %m878$.Rule.type*(%m878$.ParsingContext.type*) @m878$parse_rule.m878$.Rule.typep.m878$.ParsingContext.typep(%m878$.ParsingContext.type* %.tmp1370)
store %m878$.Rule.type* %.tmp1371, %m878$.Rule.type** %.tmp1369
%.tmp1372 = load i32, i32* %i.1347
%.tmp1373 = add i32 %.tmp1372, 1
store i32 %.tmp1373, i32* %i.1347
br label %.if.end.1366
.if.false.1366:
%.tmp1374 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1375 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1374, i32 0, i32 0
%.tmp1376 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %ctx
%.tmp1377 = getelementptr %m878$.ParsingContext.type, %m878$.ParsingContext.type* %.tmp1376, i32 0, i32 0
%.tmp1378 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1377
%.tmp1379 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1378, i32 0, i32 5
%.tmp1380 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1379
store %m297$.Token.type* %.tmp1380, %m297$.Token.type** %.tmp1375
br label %.if.end.1366
.if.end.1366:
br label %.for.start.1346
.for.end.1346:
%.tmp1381 = load %m878$.Rule.type**, %m878$.Rule.type*** %grammar.1345
%.tmp1382 = bitcast %m878$.Rule.type** %.tmp1381 to %m878$.Rule.type**
ret %m878$.Rule.type** %.tmp1382
}
%m878$.Node.type = type {i8*,i8*,i8*,i32,i32,%m878$.Node.type*,%m878$.Node.type*,%m878$.Node.type*}
define %m878$.Node.type* @m878$new_node.m878$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg) {
%t = alloca %m297$.Token.type*
store %m297$.Token.type* %.t.arg, %m297$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp1383 = getelementptr %m878$.Node.type, %m878$.Node.type* null, i32 1
%.tmp1384 = ptrtoint %m878$.Node.type* %.tmp1383 to i32
%.tmp1385 = call i8*(i32) @malloc(i32 %.tmp1384)
%.tmp1386 = bitcast i8* %.tmp1385 to %m878$.Node.type*
%node.1387 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp1386, %m878$.Node.type** %node.1387
%.tmp1388 = load %m878$.Node.type*, %m878$.Node.type** %node.1387
%.tmp1389 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1388, i32 0, i32 0
%.tmp1390 = load i8*, i8** %type
store i8* %.tmp1390, i8** %.tmp1389
%.tmp1391 = load %m878$.Node.type*, %m878$.Node.type** %node.1387
%.tmp1392 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1391, i32 0, i32 1
%.tmp1393 = load i8*, i8** %value
store i8* %.tmp1393, i8** %.tmp1392
%.tmp1394 = load %m878$.Node.type*, %m878$.Node.type** %node.1387
%.tmp1395 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1394, i32 0, i32 3
%.tmp1396 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1397 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1396, i32 0, i32 2
%.tmp1398 = load i32, i32* %.tmp1397
store i32 %.tmp1398, i32* %.tmp1395
%.tmp1399 = load %m878$.Node.type*, %m878$.Node.type** %node.1387
%.tmp1400 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1399, i32 0, i32 2
%.tmp1401 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1402 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1401, i32 0, i32 4
%.tmp1403 = load i8*, i8** %.tmp1402
store i8* %.tmp1403, i8** %.tmp1400
%.tmp1404 = load %m878$.Node.type*, %m878$.Node.type** %node.1387
%.tmp1405 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1404, i32 0, i32 4
%.tmp1406 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1407 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1406, i32 0, i32 3
%.tmp1408 = load i32, i32* %.tmp1407
store i32 %.tmp1408, i32* %.tmp1405
%.tmp1409 = load %m878$.Node.type*, %m878$.Node.type** %node.1387
%.tmp1410 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1409, i32 0, i32 5
store %m878$.Node.type* null, %m878$.Node.type** %.tmp1410
%.tmp1411 = load %m878$.Node.type*, %m878$.Node.type** %node.1387
%.tmp1412 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1411, i32 0, i32 7
store %m878$.Node.type* null, %m878$.Node.type** %.tmp1412
%.tmp1413 = load %m878$.Node.type*, %m878$.Node.type** %node.1387
%.tmp1414 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1413, i32 0, i32 6
store %m878$.Node.type* null, %m878$.Node.type** %.tmp1414
%.tmp1415 = load %m878$.Node.type*, %m878$.Node.type** %node.1387
ret %m878$.Node.type* %.tmp1415
}
define void @m878$child_append.v.m878$.Node.typep.m878$.Node.typep(%m878$.Node.type* %.parent.arg, %m878$.Node.type* %.child.arg) {
%parent = alloca %m878$.Node.type*
store %m878$.Node.type* %.parent.arg, %m878$.Node.type** %parent
%child = alloca %m878$.Node.type*
store %m878$.Node.type* %.child.arg, %m878$.Node.type** %child
%.tmp1416 = load %m878$.Node.type*, %m878$.Node.type** %parent
%.tmp1417 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1416, i32 0, i32 6
%.tmp1418 = load %m878$.Node.type*, %m878$.Node.type** %.tmp1417
%.tmp1419 = icmp eq %m878$.Node.type* %.tmp1418, null
br i1 %.tmp1419, label %.if.true.1420, label %.if.false.1420
.if.true.1420:
%.tmp1421 = load %m878$.Node.type*, %m878$.Node.type** %parent
%.tmp1422 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1421, i32 0, i32 6
%.tmp1423 = load %m878$.Node.type*, %m878$.Node.type** %child
store %m878$.Node.type* %.tmp1423, %m878$.Node.type** %.tmp1422
br label %.if.end.1420
.if.false.1420:
%.tmp1424 = load %m878$.Node.type*, %m878$.Node.type** %parent
%.tmp1425 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1424, i32 0, i32 6
%.tmp1426 = load %m878$.Node.type*, %m878$.Node.type** %.tmp1425
%c.1427 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp1426, %m878$.Node.type** %c.1427
br label %.for.start.1428
.for.start.1428:
%.tmp1429 = load %m878$.Node.type*, %m878$.Node.type** %c.1427
%.tmp1430 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1429, i32 0, i32 7
%.tmp1431 = load %m878$.Node.type*, %m878$.Node.type** %.tmp1430
%.tmp1432 = icmp ne %m878$.Node.type* %.tmp1431, null
br i1 %.tmp1432, label %.for.continue.1428, label %.for.end.1428
.for.continue.1428:
%.tmp1433 = load %m878$.Node.type*, %m878$.Node.type** %c.1427
%.tmp1434 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1433, i32 0, i32 7
%.tmp1435 = load %m878$.Node.type*, %m878$.Node.type** %.tmp1434
store %m878$.Node.type* %.tmp1435, %m878$.Node.type** %c.1427
br label %.for.start.1428
.for.end.1428:
%.tmp1436 = load %m878$.Node.type*, %m878$.Node.type** %c.1427
%.tmp1437 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1436, i32 0, i32 7
%.tmp1438 = load %m878$.Node.type*, %m878$.Node.type** %child
store %m878$.Node.type* %.tmp1438, %m878$.Node.type** %.tmp1437
br label %.if.end.1420
.if.end.1420:
%.tmp1439 = load %m878$.Node.type*, %m878$.Node.type** %child
%.tmp1440 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1439, i32 0, i32 7
store %m878$.Node.type* null, %m878$.Node.type** %.tmp1440
ret void
}
define void @m878$child_pop.v.m878$.Node.typep(%m878$.Node.type* %.parent.arg) {
%parent = alloca %m878$.Node.type*
store %m878$.Node.type* %.parent.arg, %m878$.Node.type** %parent
%.tmp1441 = load %m878$.Node.type*, %m878$.Node.type** %parent
%.tmp1442 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1441, i32 0, i32 6
%.tmp1443 = load %m878$.Node.type*, %m878$.Node.type** %.tmp1442
%.tmp1444 = icmp eq %m878$.Node.type* %.tmp1443, null
br i1 %.tmp1444, label %.if.true.1445, label %.if.false.1445
.if.true.1445:
ret void
br label %.if.end.1445
.if.false.1445:
br label %.if.end.1445
.if.end.1445:
%.tmp1446 = load %m878$.Node.type*, %m878$.Node.type** %parent
%.tmp1447 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1446, i32 0, i32 6
%.tmp1448 = load %m878$.Node.type*, %m878$.Node.type** %.tmp1447
%c.1449 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp1448, %m878$.Node.type** %c.1449
%.tmp1450 = load %m878$.Node.type*, %m878$.Node.type** %c.1449
%.tmp1451 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1450, i32 0, i32 7
%.tmp1452 = load %m878$.Node.type*, %m878$.Node.type** %.tmp1451
%.tmp1453 = icmp eq %m878$.Node.type* %.tmp1452, null
br i1 %.tmp1453, label %.if.true.1454, label %.if.false.1454
.if.true.1454:
%.tmp1455 = load %m878$.Node.type*, %m878$.Node.type** %c.1449
%.tmp1456 = bitcast %m878$.Node.type* %.tmp1455 to i8*
call void(i8*) @free(i8* %.tmp1456)
%.tmp1457 = load %m878$.Node.type*, %m878$.Node.type** %parent
%.tmp1458 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1457, i32 0, i32 6
store %m878$.Node.type* null, %m878$.Node.type** %.tmp1458
ret void
br label %.if.end.1454
.if.false.1454:
br label %.if.end.1454
.if.end.1454:
br label %.for.start.1459
.for.start.1459:
%.tmp1460 = load %m878$.Node.type*, %m878$.Node.type** %c.1449
%.tmp1461 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1460, i32 0, i32 7
%.tmp1462 = load %m878$.Node.type*, %m878$.Node.type** %.tmp1461
%.tmp1463 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1462, i32 0, i32 7
%.tmp1464 = load %m878$.Node.type*, %m878$.Node.type** %.tmp1463
%.tmp1465 = icmp ne %m878$.Node.type* %.tmp1464, null
br i1 %.tmp1465, label %.for.continue.1459, label %.for.end.1459
.for.continue.1459:
%.tmp1466 = load %m878$.Node.type*, %m878$.Node.type** %c.1449
%.tmp1467 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1466, i32 0, i32 7
%.tmp1468 = load %m878$.Node.type*, %m878$.Node.type** %.tmp1467
store %m878$.Node.type* %.tmp1468, %m878$.Node.type** %c.1449
br label %.for.start.1459
.for.end.1459:
%.tmp1469 = load %m878$.Node.type*, %m878$.Node.type** %c.1449
%.tmp1470 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1469, i32 0, i32 7
%.tmp1471 = load %m878$.Node.type*, %m878$.Node.type** %.tmp1470
%.tmp1472 = bitcast %m878$.Node.type* %.tmp1471 to i8*
call void(i8*) @free(i8* %.tmp1472)
%.tmp1473 = load %m878$.Node.type*, %m878$.Node.type** %c.1449
%.tmp1474 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1473, i32 0, i32 7
store %m878$.Node.type* null, %m878$.Node.type** %.tmp1474
ret void
}
%m878$.AstContext.type = type {%m297$.Token.type*,%m878$.Rule.type**}
define %m878$.Rule.type* @m878$_find_rule.m878$.Rule.typep.m878$.Rule.typepp.cp(%m878$.Rule.type** %.grammar.arg, i8* %.rule_name.arg) {
%grammar = alloca %m878$.Rule.type**
store %m878$.Rule.type** %.grammar.arg, %m878$.Rule.type*** %grammar
%rule_name = alloca i8*
store i8* %.rule_name.arg, i8** %rule_name
%i.1476 = alloca i32
store i32 0, i32* %i.1476
br label %.for.start.1475
.for.start.1475:
br i1 1, label %.for.continue.1475, label %.for.end.1475
.for.continue.1475:
%.tmp1477 = load i32, i32* %i.1476
%.tmp1478 = load %m878$.Rule.type**, %m878$.Rule.type*** %grammar
%.tmp1479 = getelementptr %m878$.Rule.type*, %m878$.Rule.type** %.tmp1478, i32 %.tmp1477
%.tmp1480 = load %m878$.Rule.type*, %m878$.Rule.type** %.tmp1479
%rule.1481 = alloca %m878$.Rule.type*
store %m878$.Rule.type* %.tmp1480, %m878$.Rule.type** %rule.1481
%.tmp1482 = load %m878$.Rule.type*, %m878$.Rule.type** %rule.1481
%.tmp1483 = getelementptr %m878$.Rule.type, %m878$.Rule.type* %.tmp1482, i32 0, i32 0
%.tmp1484 = load i8*, i8** %.tmp1483
%.tmp1485 = load i8*, i8** %rule_name
%.tmp1486 = call i32(i8*,i8*) @strcmp(i8* %.tmp1484, i8* %.tmp1485)
%.tmp1487 = icmp eq i32 %.tmp1486, 0
br i1 %.tmp1487, label %.if.true.1488, label %.if.false.1488
.if.true.1488:
%.tmp1489 = load %m878$.Rule.type*, %m878$.Rule.type** %rule.1481
ret %m878$.Rule.type* %.tmp1489
br label %.if.end.1488
.if.false.1488:
br label %.if.end.1488
.if.end.1488:
%.tmp1490 = load i32, i32* %i.1476
%.tmp1491 = add i32 %.tmp1490, 1
store i32 %.tmp1491, i32* %i.1476
br label %.for.start.1475
.for.end.1475:
%.tmp1492 = bitcast ptr null to %m878$.Rule.type*
ret %m878$.Rule.type* %.tmp1492
}
%m878$.ParseResult.type = type {%m296$.Error.type*,%m878$.Node.type*}
define %m296$.Error.type* @m878$parse_query.m296$.Error.typep.m878$.AstContext.typep.m878$.Matcher.typep.m878$.Node.typep(%m878$.AstContext.type* %.c.arg, %m878$.Matcher.type* %.m.arg, %m878$.Node.type* %.base.arg) {
%c = alloca %m878$.AstContext.type*
store %m878$.AstContext.type* %.c.arg, %m878$.AstContext.type** %c
%m = alloca %m878$.Matcher.type*
store %m878$.Matcher.type* %.m.arg, %m878$.Matcher.type** %m
%base = alloca %m878$.Node.type*
store %m878$.Node.type* %.base.arg, %m878$.Node.type** %base
%child.1493 = alloca %m878$.Node.type*
store %m878$.Node.type* null, %m878$.Node.type** %child.1493
%.tmp1494 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1495 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1494, i32 0, i32 0
%.tmp1496 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1495
%start_token.1497 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1496, %m297$.Token.type** %start_token.1497
%new_children.1498 = alloca i32
store i32 0, i32* %new_children.1498
%.tmp1499 = bitcast ptr null to %m296$.Error.type*
%err.1500 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1499, %m296$.Error.type** %err.1500
%.tmp1502 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m
%.tmp1503 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1502, i32 0, i32 0
%.tmp1504 = load %m878$.Query.type*, %m878$.Query.type** %.tmp1503
%q.1505 = alloca %m878$.Query.type*
store %m878$.Query.type* %.tmp1504, %m878$.Query.type** %q.1505
br label %.for.start.1501
.for.start.1501:
%.tmp1506 = load %m878$.Query.type*, %m878$.Query.type** %q.1505
%.tmp1507 = icmp ne %m878$.Query.type* %.tmp1506, null
%.tmp1508 = load %m296$.Error.type*, %m296$.Error.type** %err.1500
%.tmp1509 = icmp eq %m296$.Error.type* %.tmp1508, null
%.tmp1510 = and i1 %.tmp1507, %.tmp1509
br i1 %.tmp1510, label %.for.continue.1501, label %.for.end.1501
.for.continue.1501:
%.tmp1511 = load %m878$.Query.type*, %m878$.Query.type** %q.1505
%.tmp1512 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1511, i32 0, i32 0
%.tmp1513 = load i8, i8* %.tmp1512
%.tmp1514 = icmp eq i8 %.tmp1513, 118
br i1 %.tmp1514, label %.if.true.1515, label %.if.false.1515
.if.true.1515:
%.tmp1516 = load %m878$.Query.type*, %m878$.Query.type** %q.1505
%.tmp1517 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1516, i32 0, i32 1
%.tmp1518 = load i8*, i8** %.tmp1517
%.tmp1519 = call i32(i8*) @strlen(i8* %.tmp1518)
%.tmp1520 = sub i32 %.tmp1519, 2
%qv_len.1521 = alloca i32
store i32 %.tmp1520, i32* %qv_len.1521
%.tmp1522 = load i32, i32* %qv_len.1521
%.tmp1523 = add i32 %.tmp1522, 1
%.tmp1524 = call i8*(i32) @malloc(i32 %.tmp1523)
%tmp_buff.1525 = alloca i8*
store i8* %.tmp1524, i8** %tmp_buff.1525
%.tmp1526 = load %m878$.Query.type*, %m878$.Query.type** %q.1505
%.tmp1527 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1526, i32 0, i32 1
%.tmp1528 = load i8*, i8** %.tmp1527
%.tmp1530 = getelementptr [8 x i8], [8 x i8]*@.str1529, i32 0, i32 0
%.tmp1531 = load i8*, i8** %tmp_buff.1525
%.tmp1532 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1528, i8* %.tmp1530, i8* %.tmp1531)
%.tmp1533 = load i8*, i8** %tmp_buff.1525
%.tmp1534 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1535 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1534, i32 0, i32 0
%.tmp1536 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1535
%.tmp1537 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1536, i32 0, i32 1
%.tmp1538 = load i8*, i8** %.tmp1537
%.tmp1539 = load i32, i32* %qv_len.1521
%.tmp1540 = call i32(i8*,i8*,i32) @strncmp(i8* %.tmp1533, i8* %.tmp1538, i32 %.tmp1539)
%.tmp1541 = icmp eq i32 %.tmp1540, 0
%.tmp1542 = load i32, i32* %qv_len.1521
%.tmp1543 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1544 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1543, i32 0, i32 0
%.tmp1545 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1544
%.tmp1546 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1545, i32 0, i32 1
%.tmp1547 = load i8*, i8** %.tmp1546
%.tmp1548 = call i32(i8*) @strlen(i8* %.tmp1547)
%.tmp1549 = icmp eq i32 %.tmp1542, %.tmp1548
%.tmp1550 = and i1 %.tmp1541, %.tmp1549
br i1 %.tmp1550, label %.if.true.1551, label %.if.false.1551
.if.true.1551:
%.tmp1552 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1553 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1552, i32 0, i32 0
%.tmp1554 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1553
%.tmp1555 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1556 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1555, i32 0, i32 0
%.tmp1557 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1556
%.tmp1558 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1557, i32 0, i32 0
%.tmp1559 = load i8*, i8** %.tmp1558
%.tmp1560 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1561 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1560, i32 0, i32 0
%.tmp1562 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1561
%.tmp1563 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1562, i32 0, i32 1
%.tmp1564 = load i8*, i8** %.tmp1563
%.tmp1565 = call %m878$.Node.type*(%m297$.Token.type*,i8*,i8*) @m878$new_node.m878$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1554, i8* %.tmp1559, i8* %.tmp1564)
store %m878$.Node.type* %.tmp1565, %m878$.Node.type** %child.1493
%.tmp1566 = load %m878$.Node.type*, %m878$.Node.type** %base
%.tmp1567 = load %m878$.Node.type*, %m878$.Node.type** %child.1493
call void(%m878$.Node.type*,%m878$.Node.type*) @m878$child_append.v.m878$.Node.typep.m878$.Node.typep(%m878$.Node.type* %.tmp1566, %m878$.Node.type* %.tmp1567)
%.tmp1568 = load i32, i32* %new_children.1498
%.tmp1569 = add i32 %.tmp1568, 1
store i32 %.tmp1569, i32* %new_children.1498
%.tmp1570 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1571 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1570, i32 0, i32 0
%.tmp1572 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1573 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1572, i32 0, i32 0
%.tmp1574 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1573
%.tmp1575 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1574, i32 0, i32 5
%.tmp1576 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1575
store %m297$.Token.type* %.tmp1576, %m297$.Token.type** %.tmp1571
br label %.if.end.1551
.if.false.1551:
%.tmp1577 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1578 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1577, i32 0, i32 0
%.tmp1579 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1578
%.tmp1580 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1579, i32 0, i32 1
%.tmp1581 = load i8*, i8** %.tmp1580
%token_value.1582 = alloca i8*
store i8* %.tmp1581, i8** %token_value.1582
%.tmp1583 = load i8*, i8** %token_value.1582
%.tmp1584 = icmp eq i8* %.tmp1583, null
br i1 %.tmp1584, label %.if.true.1585, label %.if.false.1585
.if.true.1585:
%.tmp1587 = getelementptr [7 x i8], [7 x i8]*@.str1586, i32 0, i32 0
store i8* %.tmp1587, i8** %token_value.1582
br label %.if.end.1585
.if.false.1585:
br label %.if.end.1585
.if.end.1585:
%.tmp1589 = getelementptr [15 x i8], [15 x i8]*@.str1588, i32 0, i32 0
%err_fmt.1590 = alloca i8*
store i8* %.tmp1589, i8** %err_fmt.1590
%.tmp1592 = getelementptr [31 x i8], [31 x i8]*@.str1591, i32 0, i32 0
%err_msg.1593 = alloca i8*
store i8* %.tmp1592, i8** %err_msg.1593
%.tmp1594 = load i8*, i8** %err_msg.1593
%.tmp1595 = call i32(i8*) @strlen(i8* %.tmp1594)
%.tmp1596 = load i8*, i8** %tmp_buff.1525
%.tmp1597 = call i32(i8*) @strlen(i8* %.tmp1596)
%.tmp1598 = add i32 %.tmp1595, %.tmp1597
%.tmp1599 = load i8*, i8** %token_value.1582
%.tmp1600 = call i32(i8*) @strlen(i8* %.tmp1599)
%.tmp1601 = add i32 %.tmp1598, %.tmp1600
%.tmp1602 = load i8*, i8** %err_fmt.1590
%.tmp1603 = call i32(i8*) @strlen(i8* %.tmp1602)
%.tmp1604 = add i32 %.tmp1601, %.tmp1603
%.tmp1605 = mul i32 3, 2
%.tmp1606 = sub i32 %.tmp1604, %.tmp1605
%.tmp1607 = add i32 %.tmp1606, 1
%err_len.1608 = alloca i32
store i32 %.tmp1607, i32* %err_len.1608
%.tmp1609 = load i32, i32* %err_len.1608
%.tmp1610 = call i8*(i32) @malloc(i32 %.tmp1609)
%err_buf.1611 = alloca i8*
store i8* %.tmp1610, i8** %err_buf.1611
%.tmp1612 = load i8*, i8** %err_buf.1611
%.tmp1613 = load i32, i32* %err_len.1608
%.tmp1614 = load i8*, i8** %err_fmt.1590
%.tmp1615 = load i8*, i8** %err_msg.1593
%.tmp1616 = load i8*, i8** %tmp_buff.1525
%.tmp1617 = load i8*, i8** %token_value.1582
%.tmp1618 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1612, i32 %.tmp1613, i8* %.tmp1614, i8* %.tmp1615, i8* %.tmp1616, i8* %.tmp1617)
%.tmp1619 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1620 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1619, i32 0, i32 0
%.tmp1621 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1620
%.tmp1622 = load i8*, i8** %err_buf.1611
%.tmp1623 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1621, i8* %.tmp1622)
store %m296$.Error.type* %.tmp1623, %m296$.Error.type** %err.1500
br label %.if.end.1551
.if.end.1551:
%.tmp1624 = load i8*, i8** %tmp_buff.1525
call void(i8*) @free(i8* %.tmp1624)
br label %.if.end.1515
.if.false.1515:
%.tmp1625 = load %m878$.Query.type*, %m878$.Query.type** %q.1505
%.tmp1626 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1625, i32 0, i32 0
%.tmp1627 = load i8, i8* %.tmp1626
%.tmp1628 = icmp eq i8 %.tmp1627, 116
br i1 %.tmp1628, label %.if.true.1629, label %.if.false.1629
.if.true.1629:
%.tmp1630 = load %m878$.Query.type*, %m878$.Query.type** %q.1505
%.tmp1631 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1630, i32 0, i32 1
%.tmp1632 = load i8*, i8** %.tmp1631
%.tmp1633 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1634 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1633, i32 0, i32 0
%.tmp1635 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1634
%.tmp1636 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1635, i32 0, i32 0
%.tmp1637 = load i8*, i8** %.tmp1636
%.tmp1638 = call i32(i8*,i8*) @strcmp(i8* %.tmp1632, i8* %.tmp1637)
%.tmp1639 = icmp eq i32 %.tmp1638, 0
br i1 %.tmp1639, label %.if.true.1640, label %.if.false.1640
.if.true.1640:
%.tmp1641 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1642 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1641, i32 0, i32 0
%.tmp1643 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1642
%.tmp1644 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1645 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1644, i32 0, i32 0
%.tmp1646 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1645
%.tmp1647 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1646, i32 0, i32 0
%.tmp1648 = load i8*, i8** %.tmp1647
%.tmp1649 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1650 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1649, i32 0, i32 0
%.tmp1651 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1650
%.tmp1652 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1651, i32 0, i32 1
%.tmp1653 = load i8*, i8** %.tmp1652
%.tmp1654 = call %m878$.Node.type*(%m297$.Token.type*,i8*,i8*) @m878$new_node.m878$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1643, i8* %.tmp1648, i8* %.tmp1653)
store %m878$.Node.type* %.tmp1654, %m878$.Node.type** %child.1493
%.tmp1655 = load %m878$.Node.type*, %m878$.Node.type** %base
%.tmp1656 = load %m878$.Node.type*, %m878$.Node.type** %child.1493
call void(%m878$.Node.type*,%m878$.Node.type*) @m878$child_append.v.m878$.Node.typep.m878$.Node.typep(%m878$.Node.type* %.tmp1655, %m878$.Node.type* %.tmp1656)
%.tmp1657 = load i32, i32* %new_children.1498
%.tmp1658 = add i32 %.tmp1657, 1
store i32 %.tmp1658, i32* %new_children.1498
%.tmp1659 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1660 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1659, i32 0, i32 0
%.tmp1661 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1662 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1661, i32 0, i32 0
%.tmp1663 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1662
%.tmp1664 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1663, i32 0, i32 5
%.tmp1665 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1664
store %m297$.Token.type* %.tmp1665, %m297$.Token.type** %.tmp1660
br label %.if.end.1640
.if.false.1640:
%.tmp1667 = getelementptr [13 x i8], [13 x i8]*@.str1666, i32 0, i32 0
%err_fmt_t.1668 = alloca i8*
store i8* %.tmp1667, i8** %err_fmt_t.1668
%.tmp1670 = getelementptr [30 x i8], [30 x i8]*@.str1669, i32 0, i32 0
%err_msg_t.1671 = alloca i8*
store i8* %.tmp1670, i8** %err_msg_t.1671
%.tmp1672 = load i8*, i8** %err_fmt_t.1668
%.tmp1673 = call i32(i8*) @strlen(i8* %.tmp1672)
%.tmp1674 = load i8*, i8** %err_msg_t.1671
%.tmp1675 = call i32(i8*) @strlen(i8* %.tmp1674)
%.tmp1676 = add i32 %.tmp1673, %.tmp1675
%.tmp1677 = load %m878$.Query.type*, %m878$.Query.type** %q.1505
%.tmp1678 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1677, i32 0, i32 1
%.tmp1679 = load i8*, i8** %.tmp1678
%.tmp1680 = call i32(i8*) @strlen(i8* %.tmp1679)
%.tmp1681 = add i32 %.tmp1676, %.tmp1680
%.tmp1682 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1683 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1682, i32 0, i32 0
%.tmp1684 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1683
%.tmp1685 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1684, i32 0, i32 0
%.tmp1686 = load i8*, i8** %.tmp1685
%.tmp1687 = call i32(i8*) @strlen(i8* %.tmp1686)
%.tmp1688 = add i32 %.tmp1681, %.tmp1687
%err_len_t.1689 = alloca i32
store i32 %.tmp1688, i32* %err_len_t.1689
%.tmp1690 = load i32, i32* %err_len_t.1689
%.tmp1691 = call i8*(i32) @malloc(i32 %.tmp1690)
%err_buf_t.1692 = alloca i8*
store i8* %.tmp1691, i8** %err_buf_t.1692
%.tmp1693 = load i8*, i8** %err_buf_t.1692
%.tmp1694 = load i32, i32* %err_len_t.1689
%.tmp1695 = load i8*, i8** %err_fmt_t.1668
%.tmp1696 = load i8*, i8** %err_msg_t.1671
%.tmp1697 = load %m878$.Query.type*, %m878$.Query.type** %q.1505
%.tmp1698 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1697, i32 0, i32 1
%.tmp1699 = load i8*, i8** %.tmp1698
%.tmp1700 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1701 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1700, i32 0, i32 0
%.tmp1702 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1701
%.tmp1703 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1702, i32 0, i32 0
%.tmp1704 = load i8*, i8** %.tmp1703
%.tmp1705 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1693, i32 %.tmp1694, i8* %.tmp1695, i8* %.tmp1696, i8* %.tmp1699, i8* %.tmp1704)
%.tmp1706 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1707 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1706, i32 0, i32 0
%.tmp1708 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1707
%.tmp1709 = load i8*, i8** %err_buf_t.1692
%.tmp1710 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1708, i8* %.tmp1709)
store %m296$.Error.type* %.tmp1710, %m296$.Error.type** %err.1500
br label %.if.end.1640
.if.end.1640:
br label %.if.end.1629
.if.false.1629:
%.tmp1711 = load %m878$.Query.type*, %m878$.Query.type** %q.1505
%.tmp1712 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1711, i32 0, i32 0
%.tmp1713 = load i8, i8* %.tmp1712
%.tmp1714 = icmp eq i8 %.tmp1713, 97
br i1 %.tmp1714, label %.if.true.1715, label %.if.false.1715
.if.true.1715:
%.tmp1716 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1717 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1716, i32 0, i32 1
%.tmp1718 = load %m878$.Rule.type**, %m878$.Rule.type*** %.tmp1717
%.tmp1719 = load %m878$.Query.type*, %m878$.Query.type** %q.1505
%.tmp1720 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1719, i32 0, i32 1
%.tmp1721 = load i8*, i8** %.tmp1720
%.tmp1722 = call %m878$.Rule.type*(%m878$.Rule.type**,i8*) @m878$_find_rule.m878$.Rule.typep.m878$.Rule.typepp.cp(%m878$.Rule.type** %.tmp1718, i8* %.tmp1721)
%alias_rule.1723 = alloca %m878$.Rule.type*
store %m878$.Rule.type* %.tmp1722, %m878$.Rule.type** %alias_rule.1723
%.tmp1724 = load %m878$.Rule.type*, %m878$.Rule.type** %alias_rule.1723
%.tmp1725 = icmp eq %m878$.Rule.type* %.tmp1724, null
br i1 %.tmp1725, label %.if.true.1726, label %.if.false.1726
.if.true.1726:
%.tmp1727 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1728 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1727, i32 0, i32 0
%.tmp1729 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1728
%.tmp1731 = getelementptr [30 x i8], [30 x i8]*@.str1730, i32 0, i32 0
%.tmp1732 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1729, i8* %.tmp1731)
store %m296$.Error.type* %.tmp1732, %m296$.Error.type** %err.1500
br label %.if.end.1726
.if.false.1726:
%.tmp1733 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1734 = load %m878$.Rule.type*, %m878$.Rule.type** %alias_rule.1723
%.tmp1735 = call %m878$.ParseResult.type*(%m878$.AstContext.type*,%m878$.Rule.type*) @m878$parse_to_ast.m878$.ParseResult.typep.m878$.AstContext.typep.m878$.Rule.typep(%m878$.AstContext.type* %.tmp1733, %m878$.Rule.type* %.tmp1734)
%parse_result.1736 = alloca %m878$.ParseResult.type*
store %m878$.ParseResult.type* %.tmp1735, %m878$.ParseResult.type** %parse_result.1736
%.tmp1737 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %parse_result.1736
%.tmp1738 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp1737, i32 0, i32 0
%.tmp1739 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1738
%.tmp1740 = icmp ne %m296$.Error.type* %.tmp1739, null
br i1 %.tmp1740, label %.if.true.1741, label %.if.false.1741
.if.true.1741:
%.tmp1742 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %parse_result.1736
%.tmp1743 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp1742, i32 0, i32 0
%.tmp1744 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1743
store %m296$.Error.type* %.tmp1744, %m296$.Error.type** %err.1500
br label %.if.end.1741
.if.false.1741:
%.tmp1745 = load %m878$.Node.type*, %m878$.Node.type** %base
%.tmp1746 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %parse_result.1736
%.tmp1747 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp1746, i32 0, i32 1
%.tmp1748 = load %m878$.Node.type*, %m878$.Node.type** %.tmp1747
call void(%m878$.Node.type*,%m878$.Node.type*) @m878$child_append.v.m878$.Node.typep.m878$.Node.typep(%m878$.Node.type* %.tmp1745, %m878$.Node.type* %.tmp1748)
%.tmp1749 = load i32, i32* %new_children.1498
%.tmp1750 = add i32 %.tmp1749, 1
store i32 %.tmp1750, i32* %new_children.1498
br label %.if.end.1741
.if.end.1741:
%.tmp1751 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %parse_result.1736
%.tmp1752 = bitcast %m878$.ParseResult.type* %.tmp1751 to i8*
call void(i8*) @free(i8* %.tmp1752)
br label %.if.end.1726
.if.end.1726:
br label %.if.end.1715
.if.false.1715:
%.tmp1754 = getelementptr [41 x i8], [41 x i8]*@.str1753, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp1754)
br label %.if.end.1715
.if.end.1715:
br label %.if.end.1629
.if.end.1629:
br label %.if.end.1515
.if.end.1515:
%.tmp1755 = load %m878$.Query.type*, %m878$.Query.type** %q.1505
%.tmp1756 = getelementptr %m878$.Query.type, %m878$.Query.type* %.tmp1755, i32 0, i32 2
%.tmp1757 = load %m878$.Query.type*, %m878$.Query.type** %.tmp1756
store %m878$.Query.type* %.tmp1757, %m878$.Query.type** %q.1505
br label %.for.start.1501
.for.end.1501:
%.tmp1758 = load %m296$.Error.type*, %m296$.Error.type** %err.1500
%.tmp1759 = icmp ne %m296$.Error.type* %.tmp1758, null
br i1 %.tmp1759, label %.if.true.1760, label %.if.false.1760
.if.true.1760:
%.tmp1761 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1762 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1761, i32 0, i32 0
%.tmp1763 = load %m297$.Token.type*, %m297$.Token.type** %start_token.1497
store %m297$.Token.type* %.tmp1763, %m297$.Token.type** %.tmp1762
%i.1765 = alloca i32
store i32 0, i32* %i.1765
br label %.for.start.1764
.for.start.1764:
%.tmp1766 = load i32, i32* %i.1765
%.tmp1767 = load i32, i32* %new_children.1498
%.tmp1768 = icmp slt i32 %.tmp1766, %.tmp1767
br i1 %.tmp1768, label %.for.continue.1764, label %.for.end.1764
.for.continue.1764:
%.tmp1769 = load %m878$.Node.type*, %m878$.Node.type** %base
call void(%m878$.Node.type*) @m878$child_pop.v.m878$.Node.typep(%m878$.Node.type* %.tmp1769)
%.tmp1770 = load i32, i32* %i.1765
%.tmp1771 = add i32 %.tmp1770, 1
store i32 %.tmp1771, i32* %i.1765
br label %.for.start.1764
.for.end.1764:
br label %.if.end.1760
.if.false.1760:
br label %.if.end.1760
.if.end.1760:
%.tmp1772 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m
%.tmp1773 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1772, i32 0, i32 2
%.tmp1774 = load %m878$.Matcher.type*, %m878$.Matcher.type** %.tmp1773
%.tmp1775 = icmp ne %m878$.Matcher.type* %.tmp1774, null
%.tmp1776 = load %m296$.Error.type*, %m296$.Error.type** %err.1500
%.tmp1777 = icmp ne %m296$.Error.type* %.tmp1776, null
%.tmp1778 = and i1 %.tmp1775, %.tmp1777
br i1 %.tmp1778, label %.if.true.1779, label %.if.false.1779
.if.true.1779:
%.tmp1780 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1781 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m
%.tmp1782 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1781, i32 0, i32 2
%.tmp1783 = load %m878$.Matcher.type*, %m878$.Matcher.type** %.tmp1782
%.tmp1784 = load %m878$.Node.type*, %m878$.Node.type** %base
%.tmp1785 = call %m296$.Error.type*(%m878$.AstContext.type*,%m878$.Matcher.type*,%m878$.Node.type*) @m878$parse_query.m296$.Error.typep.m878$.AstContext.typep.m878$.Matcher.typep.m878$.Node.typep(%m878$.AstContext.type* %.tmp1780, %m878$.Matcher.type* %.tmp1783, %m878$.Node.type* %.tmp1784)
%new_err.1786 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1785, %m296$.Error.type** %new_err.1786
%.tmp1787 = load %m296$.Error.type*, %m296$.Error.type** %new_err.1786
%.tmp1788 = icmp eq %m296$.Error.type* %.tmp1787, null
br i1 %.tmp1788, label %.if.true.1789, label %.if.false.1789
.if.true.1789:
store %m296$.Error.type* null, %m296$.Error.type** %err.1500
br label %.if.end.1789
.if.false.1789:
%.tmp1790 = load %m296$.Error.type*, %m296$.Error.type** %new_err.1786
%.tmp1791 = bitcast %m296$.Error.type* %.tmp1790 to i8*
call void(i8*) @free(i8* %.tmp1791)
br label %.if.end.1789
.if.end.1789:
br label %.if.end.1779
.if.false.1779:
br label %.if.end.1779
.if.end.1779:
%.tmp1792 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m
%.tmp1793 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1792, i32 0, i32 1
%.tmp1794 = load i8, i8* %.tmp1793
%.tmp1795 = icmp eq i8 %.tmp1794, 49
br i1 %.tmp1795, label %.if.true.1796, label %.if.false.1796
.if.true.1796:
br label %.if.end.1796
.if.false.1796:
%.tmp1797 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m
%.tmp1798 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1797, i32 0, i32 1
%.tmp1799 = load i8, i8* %.tmp1798
%.tmp1800 = icmp eq i8 %.tmp1799, 43
%.tmp1801 = load %m296$.Error.type*, %m296$.Error.type** %err.1500
%.tmp1802 = icmp eq %m296$.Error.type* %.tmp1801, null
%.tmp1803 = and i1 %.tmp1800, %.tmp1802
br i1 %.tmp1803, label %.if.true.1804, label %.if.false.1804
.if.true.1804:
%.tmp1805 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1806 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m
%.tmp1807 = load %m878$.Node.type*, %m878$.Node.type** %base
%.tmp1808 = call %m296$.Error.type*(%m878$.AstContext.type*,%m878$.Matcher.type*,%m878$.Node.type*) @m878$parse_query.m296$.Error.typep.m878$.AstContext.typep.m878$.Matcher.typep.m878$.Node.typep(%m878$.AstContext.type* %.tmp1805, %m878$.Matcher.type* %.tmp1806, %m878$.Node.type* %.tmp1807)
store %m296$.Error.type* %.tmp1808, %m296$.Error.type** %err.1500
%.tmp1809 = load %m296$.Error.type*, %m296$.Error.type** %err.1500
%.tmp1810 = icmp ne %m296$.Error.type* %.tmp1809, null
br i1 %.tmp1810, label %.if.true.1811, label %.if.false.1811
.if.true.1811:
%.tmp1812 = load %m296$.Error.type*, %m296$.Error.type** %err.1500
%.tmp1813 = bitcast %m296$.Error.type* %.tmp1812 to i8*
call void(i8*) @free(i8* %.tmp1813)
store %m296$.Error.type* null, %m296$.Error.type** %err.1500
br label %.if.end.1811
.if.false.1811:
%.tmp1814 = bitcast ptr null to %m296$.Error.type*
ret %m296$.Error.type* %.tmp1814
br label %.if.end.1811
.if.end.1811:
br label %.if.end.1804
.if.false.1804:
%.tmp1815 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m
%.tmp1816 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1815, i32 0, i32 1
%.tmp1817 = load i8, i8* %.tmp1816
%.tmp1818 = icmp eq i8 %.tmp1817, 63
%.tmp1819 = load %m296$.Error.type*, %m296$.Error.type** %err.1500
%.tmp1820 = icmp ne %m296$.Error.type* %.tmp1819, null
%.tmp1821 = and i1 %.tmp1818, %.tmp1820
br i1 %.tmp1821, label %.if.true.1822, label %.if.false.1822
.if.true.1822:
%.tmp1823 = load %m296$.Error.type*, %m296$.Error.type** %err.1500
%.tmp1824 = bitcast %m296$.Error.type* %.tmp1823 to i8*
call void(i8*) @free(i8* %.tmp1824)
store %m296$.Error.type* null, %m296$.Error.type** %err.1500
br label %.if.end.1822
.if.false.1822:
%.tmp1825 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m
%.tmp1826 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1825, i32 0, i32 1
%.tmp1827 = load i8, i8* %.tmp1826
%.tmp1828 = icmp eq i8 %.tmp1827, 42
br i1 %.tmp1828, label %.if.true.1829, label %.if.false.1829
.if.true.1829:
%.tmp1830 = load %m296$.Error.type*, %m296$.Error.type** %err.1500
%.tmp1831 = icmp ne %m296$.Error.type* %.tmp1830, null
br i1 %.tmp1831, label %.if.true.1832, label %.if.false.1832
.if.true.1832:
%.tmp1833 = load %m296$.Error.type*, %m296$.Error.type** %err.1500
%.tmp1834 = bitcast %m296$.Error.type* %.tmp1833 to i8*
call void(i8*) @free(i8* %.tmp1834)
store %m296$.Error.type* null, %m296$.Error.type** %err.1500
br label %.if.end.1832
.if.false.1832:
%.tmp1835 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1836 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m
%.tmp1837 = load %m878$.Node.type*, %m878$.Node.type** %base
%.tmp1838 = call %m296$.Error.type*(%m878$.AstContext.type*,%m878$.Matcher.type*,%m878$.Node.type*) @m878$parse_query.m296$.Error.typep.m878$.AstContext.typep.m878$.Matcher.typep.m878$.Node.typep(%m878$.AstContext.type* %.tmp1835, %m878$.Matcher.type* %.tmp1836, %m878$.Node.type* %.tmp1837)
ret %m296$.Error.type* %.tmp1838
br label %.if.end.1832
.if.end.1832:
br label %.if.end.1829
.if.false.1829:
br label %.if.end.1829
.if.end.1829:
br label %.if.end.1822
.if.end.1822:
br label %.if.end.1804
.if.end.1804:
br label %.if.end.1796
.if.end.1796:
%.tmp1839 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m
%.tmp1840 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1839, i32 0, i32 3
%.tmp1841 = load %m878$.Matcher.type*, %m878$.Matcher.type** %.tmp1840
%.tmp1842 = icmp ne %m878$.Matcher.type* %.tmp1841, null
%.tmp1843 = load %m296$.Error.type*, %m296$.Error.type** %err.1500
%.tmp1844 = icmp eq %m296$.Error.type* %.tmp1843, null
%.tmp1845 = and i1 %.tmp1842, %.tmp1844
br i1 %.tmp1845, label %.if.true.1846, label %.if.false.1846
.if.true.1846:
%.tmp1847 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1848 = load %m878$.Matcher.type*, %m878$.Matcher.type** %m
%.tmp1849 = getelementptr %m878$.Matcher.type, %m878$.Matcher.type* %.tmp1848, i32 0, i32 3
%.tmp1850 = load %m878$.Matcher.type*, %m878$.Matcher.type** %.tmp1849
%.tmp1851 = load %m878$.Node.type*, %m878$.Node.type** %base
%.tmp1852 = call %m296$.Error.type*(%m878$.AstContext.type*,%m878$.Matcher.type*,%m878$.Node.type*) @m878$parse_query.m296$.Error.typep.m878$.AstContext.typep.m878$.Matcher.typep.m878$.Node.typep(%m878$.AstContext.type* %.tmp1847, %m878$.Matcher.type* %.tmp1850, %m878$.Node.type* %.tmp1851)
store %m296$.Error.type* %.tmp1852, %m296$.Error.type** %err.1500
br label %.if.end.1846
.if.false.1846:
br label %.if.end.1846
.if.end.1846:
%.tmp1853 = load %m296$.Error.type*, %m296$.Error.type** %err.1500
%.tmp1854 = bitcast %m296$.Error.type* %.tmp1853 to %m296$.Error.type*
ret %m296$.Error.type* %.tmp1854
}
define %m878$.ParseResult.type* @m878$parse_to_ast.m878$.ParseResult.typep.m878$.AstContext.typep.m878$.Rule.typep(%m878$.AstContext.type* %.c.arg, %m878$.Rule.type* %.rule.arg) {
%c = alloca %m878$.AstContext.type*
store %m878$.AstContext.type* %.c.arg, %m878$.AstContext.type** %c
%rule = alloca %m878$.Rule.type*
store %m878$.Rule.type* %.rule.arg, %m878$.Rule.type** %rule
%.tmp1855 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* null, i32 1
%.tmp1856 = ptrtoint %m878$.ParseResult.type* %.tmp1855 to i32
%.tmp1857 = call i8*(i32) @malloc(i32 %.tmp1856)
%.tmp1858 = bitcast i8* %.tmp1857 to %m878$.ParseResult.type*
%res.1859 = alloca %m878$.ParseResult.type*
store %m878$.ParseResult.type* %.tmp1858, %m878$.ParseResult.type** %res.1859
%.tmp1860 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %res.1859
%.tmp1861 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp1860, i32 0, i32 0
store %m296$.Error.type* null, %m296$.Error.type** %.tmp1861
%.tmp1862 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %res.1859
%.tmp1863 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp1862, i32 0, i32 1
%.tmp1864 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1865 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1864, i32 0, i32 0
%.tmp1866 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1865
%.tmp1867 = load %m878$.Rule.type*, %m878$.Rule.type** %rule
%.tmp1868 = getelementptr %m878$.Rule.type, %m878$.Rule.type* %.tmp1867, i32 0, i32 0
%.tmp1869 = load i8*, i8** %.tmp1868
%.tmp1870 = bitcast ptr null to i8*
%.tmp1871 = call %m878$.Node.type*(%m297$.Token.type*,i8*,i8*) @m878$new_node.m878$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1866, i8* %.tmp1869, i8* %.tmp1870)
store %m878$.Node.type* %.tmp1871, %m878$.Node.type** %.tmp1863
%.tmp1872 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1873 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %.tmp1872, i32 0, i32 0
%.tmp1874 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1873
%start_match.1875 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1874, %m297$.Token.type** %start_match.1875
%.tmp1876 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %res.1859
%.tmp1877 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp1876, i32 0, i32 0
%.tmp1878 = load %m878$.AstContext.type*, %m878$.AstContext.type** %c
%.tmp1879 = load %m878$.Rule.type*, %m878$.Rule.type** %rule
%.tmp1880 = getelementptr %m878$.Rule.type, %m878$.Rule.type* %.tmp1879, i32 0, i32 1
%.tmp1881 = load %m878$.Matcher.type*, %m878$.Matcher.type** %.tmp1880
%.tmp1882 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %res.1859
%.tmp1883 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp1882, i32 0, i32 1
%.tmp1884 = load %m878$.Node.type*, %m878$.Node.type** %.tmp1883
%.tmp1885 = call %m296$.Error.type*(%m878$.AstContext.type*,%m878$.Matcher.type*,%m878$.Node.type*) @m878$parse_query.m296$.Error.typep.m878$.AstContext.typep.m878$.Matcher.typep.m878$.Node.typep(%m878$.AstContext.type* %.tmp1878, %m878$.Matcher.type* %.tmp1881, %m878$.Node.type* %.tmp1884)
store %m296$.Error.type* %.tmp1885, %m296$.Error.type** %.tmp1877
%.tmp1886 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %res.1859
ret %m878$.ParseResult.type* %.tmp1886
}
define %m878$.ParseResult.type* @m878$ast.m878$.ParseResult.typep.m878$.Rule.typepp.cp.m297$.Token.typep(%m878$.Rule.type** %.grammar.arg, i8* %.start.arg, %m297$.Token.type* %.tokens.arg) {
%grammar = alloca %m878$.Rule.type**
store %m878$.Rule.type** %.grammar.arg, %m878$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m297$.Token.type*
store %m297$.Token.type* %.tokens.arg, %m297$.Token.type** %tokens
%.tmp1887 = load %m878$.Rule.type**, %m878$.Rule.type*** %grammar
%.tmp1888 = load i8*, i8** %start
%.tmp1889 = call %m878$.Rule.type*(%m878$.Rule.type**,i8*) @m878$_find_rule.m878$.Rule.typep.m878$.Rule.typepp.cp(%m878$.Rule.type** %.tmp1887, i8* %.tmp1888)
%start_matcher.1890 = alloca %m878$.Rule.type*
store %m878$.Rule.type* %.tmp1889, %m878$.Rule.type** %start_matcher.1890
%.tmp1891 = load %m878$.Rule.type*, %m878$.Rule.type** %start_matcher.1890
%.tmp1892 = icmp ne %m878$.Rule.type* %.tmp1891, null
%.tmp1894 = getelementptr [44 x i8], [44 x i8]*@.str1893, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp1892, i8* %.tmp1894)
%c.1895 = alloca %m878$.AstContext.type
%.tmp1896 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %c.1895, i32 0, i32 0
store %m297$.Token.type* null, %m297$.Token.type** %.tmp1896
%.tmp1897 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %c.1895, i32 0, i32 1
store %m878$.Rule.type** null, %m878$.Rule.type*** %.tmp1897
%.tmp1898 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %c.1895, i32 0, i32 0
%.tmp1899 = load %m297$.Token.type*, %m297$.Token.type** %tokens
store %m297$.Token.type* %.tmp1899, %m297$.Token.type** %.tmp1898
%.tmp1900 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %c.1895, i32 0, i32 1
%.tmp1901 = load %m878$.Rule.type**, %m878$.Rule.type*** %grammar
store %m878$.Rule.type** %.tmp1901, %m878$.Rule.type*** %.tmp1900
%.tmp1902 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %c.1895, i32 0
%.tmp1903 = load %m878$.Rule.type*, %m878$.Rule.type** %start_matcher.1890
%.tmp1904 = call %m878$.ParseResult.type*(%m878$.AstContext.type*,%m878$.Rule.type*) @m878$parse_to_ast.m878$.ParseResult.typep.m878$.AstContext.typep.m878$.Rule.typep(%m878$.AstContext.type* %.tmp1902, %m878$.Rule.type* %.tmp1903)
%res.1905 = alloca %m878$.ParseResult.type*
store %m878$.ParseResult.type* %.tmp1904, %m878$.ParseResult.type** %res.1905
%.tmp1906 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %c.1895, i32 0, i32 0
%.tmp1907 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1906
%.tmp1908 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1907, i32 0, i32 0
%.tmp1909 = load i8*, i8** %.tmp1908
%.tmp1911 = getelementptr [4 x i8], [4 x i8]*@.str1910, i32 0, i32 0
%.tmp1912 = call i32(i8*,i8*) @strcmp(i8* %.tmp1909, i8* %.tmp1911)
%.tmp1913 = icmp ne i32 %.tmp1912, 0
%.tmp1914 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %res.1905
%.tmp1915 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp1914, i32 0, i32 0
%.tmp1916 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1915
%.tmp1917 = icmp eq %m296$.Error.type* %.tmp1916, null
%.tmp1918 = and i1 %.tmp1913, %.tmp1917
br i1 %.tmp1918, label %.if.true.1919, label %.if.false.1919
.if.true.1919:
%.tmp1920 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %res.1905
%.tmp1921 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp1920, i32 0, i32 0
%.tmp1922 = getelementptr %m878$.AstContext.type, %m878$.AstContext.type* %c.1895, i32 0, i32 0
%.tmp1923 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1922
%.tmp1925 = getelementptr [26 x i8], [26 x i8]*@.str1924, i32 0, i32 0
%.tmp1926 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1923, i8* %.tmp1925)
store %m296$.Error.type* %.tmp1926, %m296$.Error.type** %.tmp1921
br label %.if.end.1919
.if.false.1919:
br label %.if.end.1919
.if.end.1919:
%.tmp1927 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %res.1905
ret %m878$.ParseResult.type* %.tmp1927
}
define i8* @m1928$node_to_string.cp.m878$.Node.typep(%m878$.Node.type* %.n.arg) {
%n = alloca %m878$.Node.type*
store %m878$.Node.type* %.n.arg, %m878$.Node.type** %n
%.tmp1929 = call %m0$.File.type*() @tmpfile()
%tmp.1930 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp1929, %m0$.File.type** %tmp.1930
%.tmp1931 = load %m878$.Node.type*, %m878$.Node.type** %n
%.tmp1932 = load %m0$.File.type*, %m0$.File.type** %tmp.1930
call void(%m878$.Node.type*,%m0$.File.type*,i32) @m1928$_node_to_string.v.m878$.Node.typep.m0$.File.typep.i(%m878$.Node.type* %.tmp1931, %m0$.File.type* %.tmp1932, i32 1)
%.tmp1933 = load %m0$.File.type*, %m0$.File.type** %tmp.1930
%.tmp1934 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp1933)
%.tmp1935 = load %m0$.File.type*, %m0$.File.type** %tmp.1930
%.tmp1936 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp1935)
%str_len.1937 = alloca i32
store i32 %.tmp1936, i32* %str_len.1937
%.tmp1938 = load %m0$.File.type*, %m0$.File.type** %tmp.1930
%.tmp1939 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp1938)
%tmp_fd.1940 = alloca i32
store i32 %.tmp1939, i32* %tmp_fd.1940
%.tmp1941 = load i32, i32* %tmp_fd.1940
%.tmp1942 = load i32, i32* @SEEK_SET
%.tmp1943 = call i32(i32,i32,i32) @lseek(i32 %.tmp1941, i32 0, i32 %.tmp1942)
%.tmp1944 = load i32, i32* %str_len.1937
%.tmp1945 = call i8*(i32) @malloc(i32 %.tmp1944)
%buf.1946 = alloca i8*
store i8* %.tmp1945, i8** %buf.1946
%.tmp1947 = load i32, i32* %tmp_fd.1940
%.tmp1948 = load i8*, i8** %buf.1946
%.tmp1949 = load i32, i32* %str_len.1937
%.tmp1950 = call i32(i32,i8*,i32) @read(i32 %.tmp1947, i8* %.tmp1948, i32 %.tmp1949)
%read.1951 = alloca i32
store i32 %.tmp1950, i32* %read.1951
%.tmp1952 = load i32, i32* %read.1951
%.tmp1953 = load i32, i32* %str_len.1937
%.tmp1954 = icmp ne i32 %.tmp1952, %.tmp1953
br i1 %.tmp1954, label %.if.true.1955, label %.if.false.1955
.if.true.1955:
%.tmp1956 = load i8*, i8** %buf.1946
call void(i8*) @free(i8* %.tmp1956)
store i8* null, i8** %buf.1946
br label %.if.end.1955
.if.false.1955:
br label %.if.end.1955
.if.end.1955:
%.tmp1957 = load i8*, i8** %buf.1946
ret i8* %.tmp1957
}
define void @m1928$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1958 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1960 = getelementptr [2 x i8], [2 x i8]*@.str1959, i32 0, i32 0
%.tmp1961 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1958, i8* %.tmp1960)
%i.1963 = alloca i32
store i32 0, i32* %i.1963
br label %.for.start.1962
.for.start.1962:
%.tmp1964 = load i32, i32* %i.1963
%.tmp1965 = load i32, i32* %indent
%.tmp1966 = icmp slt i32 %.tmp1964, %.tmp1965
br i1 %.tmp1966, label %.for.continue.1962, label %.for.end.1962
.for.continue.1962:
%.tmp1967 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1969 = getelementptr [3 x i8], [3 x i8]*@.str1968, i32 0, i32 0
%.tmp1970 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1967, i8* %.tmp1969)
%.tmp1971 = load i32, i32* %i.1963
%.tmp1972 = add i32 %.tmp1971, 1
store i32 %.tmp1972, i32* %i.1963
br label %.for.start.1962
.for.end.1962:
ret void
}
define void @m1928$_node_to_string.v.m878$.Node.typep.m0$.File.typep.i(%m878$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m878$.Node.type*
store %m878$.Node.type* %.node.arg, %m878$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1973 = load %m878$.Node.type*, %m878$.Node.type** %node
%.tmp1974 = icmp eq %m878$.Node.type* %.tmp1973, null
br i1 %.tmp1974, label %.if.true.1975, label %.if.false.1975
.if.true.1975:
%.tmp1976 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1978 = getelementptr [7 x i8], [7 x i8]*@.str1977, i32 0, i32 0
%.tmp1979 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1976, i8* %.tmp1978)
ret void
br label %.if.end.1975
.if.false.1975:
br label %.if.end.1975
.if.end.1975:
%.tmp1980 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1982 = getelementptr [2 x i8], [2 x i8]*@.str1981, i32 0, i32 0
%.tmp1983 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1980, i8* %.tmp1982)
%.tmp1984 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1985 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1928$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1984, i32 %.tmp1985)
%.tmp1986 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1988 = getelementptr [13 x i8], [13 x i8]*@.str1987, i32 0, i32 0
%.tmp1989 = load %m878$.Node.type*, %m878$.Node.type** %node
%.tmp1990 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1989, i32 0, i32 0
%.tmp1991 = load i8*, i8** %.tmp1990
%.tmp1992 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1986, i8* %.tmp1988, i8* %.tmp1991)
%.tmp1993 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1994 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1928$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1993, i32 %.tmp1994)
%.tmp1995 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1997 = getelementptr [12 x i8], [12 x i8]*@.str1996, i32 0, i32 0
%.tmp1998 = load %m878$.Node.type*, %m878$.Node.type** %node
%.tmp1999 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp1998, i32 0, i32 1
%.tmp2000 = load i8*, i8** %.tmp1999
%.tmp2001 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1995, i8* %.tmp1997, i8* %.tmp2000)
%.tmp2002 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2003 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1928$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2002, i32 %.tmp2003)
%.tmp2004 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2006 = getelementptr [11 x i8], [11 x i8]*@.str2005, i32 0, i32 0
%.tmp2007 = load %m878$.Node.type*, %m878$.Node.type** %node
%.tmp2008 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2007, i32 0, i32 3
%.tmp2009 = load i32, i32* %.tmp2008
%.tmp2010 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2004, i8* %.tmp2006, i32 %.tmp2009)
%.tmp2011 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2012 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1928$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2011, i32 %.tmp2012)
%.tmp2013 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2015 = getelementptr [19 x i8], [19 x i8]*@.str2014, i32 0, i32 0
%.tmp2016 = load %m878$.Node.type*, %m878$.Node.type** %node
%.tmp2017 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2016, i32 0, i32 4
%.tmp2018 = load i32, i32* %.tmp2017
%.tmp2019 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2013, i8* %.tmp2015, i32 %.tmp2018)
%.tmp2020 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2021 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1928$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2020, i32 %.tmp2021)
%.tmp2022 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2024 = getelementptr [9 x i8], [9 x i8]*@.str2023, i32 0, i32 0
%.tmp2025 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2022, i8* %.tmp2024)
%.tmp2026 = load %m878$.Node.type*, %m878$.Node.type** %node
%.tmp2027 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2026, i32 0, i32 7
%.tmp2028 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2027
%.tmp2029 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2030 = load i32, i32* %indent
%.tmp2031 = add i32 %.tmp2030, 1
call void(%m878$.Node.type*,%m0$.File.type*,i32) @m1928$_node_to_string.v.m878$.Node.typep.m0$.File.typep.i(%m878$.Node.type* %.tmp2028, %m0$.File.type* %.tmp2029, i32 %.tmp2031)
%.tmp2032 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2033 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1928$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2032, i32 %.tmp2033)
%.tmp2034 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2036 = getelementptr [13 x i8], [13 x i8]*@.str2035, i32 0, i32 0
%.tmp2037 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2034, i8* %.tmp2036)
%.tmp2038 = load %m878$.Node.type*, %m878$.Node.type** %node
%.tmp2039 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2038, i32 0, i32 6
%.tmp2040 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2039
%.tmp2041 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2042 = load i32, i32* %indent
%.tmp2043 = add i32 %.tmp2042, 1
call void(%m878$.Node.type*,%m0$.File.type*,i32) @m1928$_node_to_string.v.m878$.Node.typep.m0$.File.typep.i(%m878$.Node.type* %.tmp2040, %m0$.File.type* %.tmp2041, i32 %.tmp2043)
%.tmp2044 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2045 = load i32, i32* %indent
%.tmp2046 = sub i32 %.tmp2045, 1
call void(%m0$.File.type*,i32) @m1928$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2044, i32 %.tmp2046)
%.tmp2047 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2049 = getelementptr [2 x i8], [2 x i8]*@.str2048, i32 0, i32 0
%.tmp2050 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2047, i8* %.tmp2049)
ret void
}
define i8* @m2051$grammar.cp() {
%.tmp2053 = getelementptr [1847 x i8], [1847 x i8]*@.str2052, i32 0, i32 0
ret i8* %.tmp2053
}
define i8* @m2054$append_tmpl.cp() {
%.tmp2056 = getelementptr [1885 x i8], [1885 x i8]*@.str2055, i32 0, i32 0
ret i8* %.tmp2056
}
define i8* @m2057$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2058 = load i8*, i8** %text
%.tmp2059 = call i32(i8*) @strlen(i8* %.tmp2058)
%str_len.2060 = alloca i32
store i32 %.tmp2059, i32* %str_len.2060
%.tmp2062 = getelementptr [1 x i8], [1 x i8]*@.str2061, i32 0, i32 0
%buf.2063 = alloca i8*
store i8* %.tmp2062, i8** %buf.2063
%i.2065 = alloca i32
store i32 1, i32* %i.2065
br label %.for.start.2064
.for.start.2064:
%.tmp2066 = load i32, i32* %i.2065
%.tmp2067 = load i32, i32* %str_len.2060
%.tmp2068 = sub i32 %.tmp2067, 1
%.tmp2069 = icmp slt i32 %.tmp2066, %.tmp2068
br i1 %.tmp2069, label %.for.continue.2064, label %.for.end.2064
.for.continue.2064:
%.tmp2070 = load i32, i32* %i.2065
%.tmp2071 = load i8*, i8** %text
%.tmp2072 = getelementptr i8, i8* %.tmp2071, i32 %.tmp2070
%.tmp2073 = load i8, i8* %.tmp2072
%.tmp2074 = icmp eq i8 %.tmp2073, 34
br i1 %.tmp2074, label %.if.true.2075, label %.if.false.2075
.if.true.2075:
%.tmp2076 = getelementptr i8*, i8** %buf.2063, i32 0
%.tmp2078 = getelementptr [6 x i8], [6 x i8]*@.str2077, i32 0, i32 0
%.tmp2079 = load i8*, i8** %buf.2063
%.tmp2080 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2076, i8* %.tmp2078, i8* %.tmp2079)
br label %.if.end.2075
.if.false.2075:
%.tmp2081 = load i32, i32* %i.2065
%.tmp2082 = load i8*, i8** %text
%.tmp2083 = getelementptr i8, i8* %.tmp2082, i32 %.tmp2081
%.tmp2084 = load i8, i8* %.tmp2083
%.tmp2085 = icmp eq i8 %.tmp2084, 92
br i1 %.tmp2085, label %.if.true.2086, label %.if.false.2086
.if.true.2086:
%.tmp2087 = load i32, i32* %i.2065
%.tmp2088 = add i32 %.tmp2087, 1
%.tmp2089 = load i8*, i8** %text
%.tmp2090 = getelementptr i8, i8* %.tmp2089, i32 %.tmp2088
%.tmp2091 = load i8, i8* %.tmp2090
%.tmp2092 = icmp eq i8 %.tmp2091, 110
%.tmp2093 = load i32, i32* %i.2065
%.tmp2094 = add i32 %.tmp2093, 1
%.tmp2095 = load i8*, i8** %text
%.tmp2096 = getelementptr i8, i8* %.tmp2095, i32 %.tmp2094
%.tmp2097 = load i8, i8* %.tmp2096
%.tmp2098 = icmp eq i8 %.tmp2097, 78
%.tmp2099 = or i1 %.tmp2092, %.tmp2098
br i1 %.tmp2099, label %.if.true.2100, label %.if.false.2100
.if.true.2100:
%.tmp2101 = getelementptr i8*, i8** %buf.2063, i32 0
%.tmp2103 = getelementptr [6 x i8], [6 x i8]*@.str2102, i32 0, i32 0
%.tmp2104 = load i8*, i8** %buf.2063
%.tmp2105 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2101, i8* %.tmp2103, i8* %.tmp2104)
%.tmp2106 = load i32, i32* %i.2065
%.tmp2107 = add i32 %.tmp2106, 1
store i32 %.tmp2107, i32* %i.2065
br label %.if.end.2100
.if.false.2100:
%.tmp2108 = load i32, i32* %i.2065
%.tmp2109 = add i32 %.tmp2108, 1
%.tmp2110 = load i8*, i8** %text
%.tmp2111 = getelementptr i8, i8* %.tmp2110, i32 %.tmp2109
%.tmp2112 = load i8, i8* %.tmp2111
%.tmp2113 = icmp eq i8 %.tmp2112, 92
br i1 %.tmp2113, label %.if.true.2114, label %.if.false.2114
.if.true.2114:
%.tmp2115 = getelementptr i8*, i8** %buf.2063, i32 0
%.tmp2117 = getelementptr [6 x i8], [6 x i8]*@.str2116, i32 0, i32 0
%.tmp2118 = load i8*, i8** %buf.2063
%.tmp2119 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2115, i8* %.tmp2117, i8* %.tmp2118)
%.tmp2120 = load i32, i32* %i.2065
%.tmp2121 = add i32 %.tmp2120, 1
store i32 %.tmp2121, i32* %i.2065
br label %.if.end.2114
.if.false.2114:
%.tmp2122 = load i32, i32* %i.2065
%.tmp2123 = add i32 %.tmp2122, 1
%.tmp2124 = load i8*, i8** %text
%.tmp2125 = getelementptr i8, i8* %.tmp2124, i32 %.tmp2123
%.tmp2126 = load i8, i8* %.tmp2125
%.tmp2127 = icmp eq i8 %.tmp2126, 120
br i1 %.tmp2127, label %.if.true.2128, label %.if.false.2128
.if.true.2128:
%.tmp2129 = load i32, i32* %i.2065
%.tmp2130 = add i32 %.tmp2129, 2
store i32 %.tmp2130, i32* %i.2065
%.tmp2131 = getelementptr i8*, i8** %buf.2063, i32 0
%.tmp2133 = getelementptr [8 x i8], [8 x i8]*@.str2132, i32 0, i32 0
%.tmp2134 = load i8*, i8** %buf.2063
%.tmp2135 = load i32, i32* %i.2065
%.tmp2136 = load i8*, i8** %text
%.tmp2137 = getelementptr i8, i8* %.tmp2136, i32 %.tmp2135
%.tmp2138 = load i8, i8* %.tmp2137
%.tmp2139 = call i8(i8) @toupper(i8 %.tmp2138)
%.tmp2140 = load i32, i32* %i.2065
%.tmp2141 = add i32 %.tmp2140, 1
%.tmp2142 = load i8*, i8** %text
%.tmp2143 = getelementptr i8, i8* %.tmp2142, i32 %.tmp2141
%.tmp2144 = load i8, i8* %.tmp2143
%.tmp2145 = call i8(i8) @toupper(i8 %.tmp2144)
%.tmp2146 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2131, i8* %.tmp2133, i8* %.tmp2134, i8 %.tmp2139, i8 %.tmp2145)
%.tmp2147 = load i32, i32* %i.2065
%.tmp2148 = add i32 %.tmp2147, 1
store i32 %.tmp2148, i32* %i.2065
br label %.if.end.2128
.if.false.2128:
%.tmp2149 = getelementptr i8*, i8** %buf.2063, i32 0
%.tmp2151 = getelementptr [5 x i8], [5 x i8]*@.str2150, i32 0, i32 0
%.tmp2152 = load i8*, i8** %buf.2063
%.tmp2153 = load i32, i32* %i.2065
%.tmp2154 = load i8*, i8** %text
%.tmp2155 = getelementptr i8, i8* %.tmp2154, i32 %.tmp2153
%.tmp2156 = load i8, i8* %.tmp2155
%.tmp2157 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2149, i8* %.tmp2151, i8* %.tmp2152, i8 %.tmp2156)
br label %.if.end.2128
.if.end.2128:
br label %.if.end.2114
.if.end.2114:
br label %.if.end.2100
.if.end.2100:
br label %.if.end.2086
.if.false.2086:
%.tmp2158 = getelementptr i8*, i8** %buf.2063, i32 0
%.tmp2160 = getelementptr [5 x i8], [5 x i8]*@.str2159, i32 0, i32 0
%.tmp2161 = load i8*, i8** %buf.2063
%.tmp2162 = load i32, i32* %i.2065
%.tmp2163 = load i8*, i8** %text
%.tmp2164 = getelementptr i8, i8* %.tmp2163, i32 %.tmp2162
%.tmp2165 = load i8, i8* %.tmp2164
%.tmp2166 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2158, i8* %.tmp2160, i8* %.tmp2161, i8 %.tmp2165)
br label %.if.end.2086
.if.end.2086:
br label %.if.end.2075
.if.end.2075:
%.tmp2167 = load i32, i32* %i.2065
%.tmp2168 = add i32 %.tmp2167, 1
store i32 %.tmp2168, i32* %i.2065
br label %.for.start.2064
.for.end.2064:
%.tmp2169 = getelementptr i8*, i8** %buf.2063, i32 0
%.tmp2171 = getelementptr [9 x i8], [9 x i8]*@.str2170, i32 0, i32 0
%.tmp2172 = load i8*, i8** %buf.2063
%.tmp2173 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2169, i8* %.tmp2171, i8* %.tmp2172)
%.tmp2174 = load i8*, i8** %buf.2063
ret i8* %.tmp2174
}
define i32 @m2057$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len.2175 = alloca i32
store i32 0, i32* %len.2175
%i.2177 = alloca i32
store i32 2, i32* %i.2177
br label %.for.start.2176
.for.start.2176:
%.tmp2178 = load i32, i32* %i.2177
%.tmp2179 = load i8*, i8** %text
%.tmp2180 = getelementptr i8, i8* %.tmp2179, i32 %.tmp2178
%.tmp2181 = load i8, i8* %.tmp2180
%.tmp2182 = icmp ne i8 %.tmp2181, 0
br i1 %.tmp2182, label %.for.continue.2176, label %.for.end.2176
.for.continue.2176:
%.tmp2183 = load i32, i32* %i.2177
%.tmp2184 = load i8*, i8** %text
%.tmp2185 = getelementptr i8, i8* %.tmp2184, i32 %.tmp2183
%.tmp2186 = load i8, i8* %.tmp2185
%.tmp2187 = icmp eq i8 %.tmp2186, 92
br i1 %.tmp2187, label %.if.true.2188, label %.if.false.2188
.if.true.2188:
%.tmp2189 = load i32, i32* %i.2177
%.tmp2190 = add i32 %.tmp2189, 2
store i32 %.tmp2190, i32* %i.2177
br label %.if.end.2188
.if.false.2188:
br label %.if.end.2188
.if.end.2188:
%.tmp2191 = load i32, i32* %len.2175
%.tmp2192 = add i32 %.tmp2191, 1
store i32 %.tmp2192, i32* %len.2175
%.tmp2193 = load i32, i32* %i.2177
%.tmp2194 = add i32 %.tmp2193, 1
store i32 %.tmp2194, i32* %i.2177
br label %.for.start.2176
.for.end.2176:
%.tmp2195 = load i32, i32* %len.2175
%.tmp2196 = sub i32 %.tmp2195, 1
ret i32 %.tmp2196
}
define i8* @m2057$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval.2197 = alloca i32
store i32 0, i32* %intval.2197
%buf.2198 = alloca i8*
store i8* null, i8** %buf.2198
%chrval.2199 = alloca i8
store i8 0, i8* %chrval.2199
%.tmp2200 = load i8*, i8** %chr_repr
%.tmp2201 = call i32(i8*) @strlen(i8* %.tmp2200)
%chr_len.2202 = alloca i32
store i32 %.tmp2201, i32* %chr_len.2202
%.tmp2203 = load i32, i32* %chr_len.2202
%.tmp2204 = icmp eq i32 %.tmp2203, 6
br i1 %.tmp2204, label %.if.true.2205, label %.if.false.2205
.if.true.2205:
%.tmp2206 = load i8*, i8** %chr_repr
%.tmp2208 = getelementptr [7 x i8], [7 x i8]*@.str2207, i32 0, i32 0
%.tmp2209 = getelementptr i32, i32* %intval.2197, i32 0
%.tmp2210 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2206, i8* %.tmp2208, i32* %.tmp2209)
%.tmp2211 = getelementptr i8*, i8** %buf.2198, i32 0
%.tmp2213 = getelementptr [3 x i8], [3 x i8]*@.str2212, i32 0, i32 0
%.tmp2214 = load i32, i32* %intval.2197
%.tmp2215 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2211, i8* %.tmp2213, i32 %.tmp2214)
br label %.if.end.2205
.if.false.2205:
%.tmp2216 = load i32, i32* %chr_len.2202
%.tmp2217 = icmp eq i32 %.tmp2216, 5
br i1 %.tmp2217, label %.if.true.2218, label %.if.false.2218
.if.true.2218:
%.tmp2219 = load i8*, i8** %chr_repr
%.tmp2221 = getelementptr [6 x i8], [6 x i8]*@.str2220, i32 0, i32 0
%.tmp2222 = getelementptr i32, i32* %intval.2197, i32 0
%.tmp2223 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2219, i8* %.tmp2221, i32* %.tmp2222)
%.tmp2224 = getelementptr i8*, i8** %buf.2198, i32 0
%.tmp2226 = getelementptr [3 x i8], [3 x i8]*@.str2225, i32 0, i32 0
%.tmp2227 = load i32, i32* %intval.2197
%.tmp2228 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2224, i8* %.tmp2226, i32 %.tmp2227)
br label %.if.end.2218
.if.false.2218:
%.tmp2229 = load i32, i32* %chr_len.2202
%.tmp2230 = icmp eq i32 %.tmp2229, 4
br i1 %.tmp2230, label %.if.true.2231, label %.if.false.2231
.if.true.2231:
%.tmp2232 = load i8*, i8** %chr_repr
%.tmp2234 = getelementptr [6 x i8], [6 x i8]*@.str2233, i32 0, i32 0
%.tmp2235 = getelementptr i8, i8* %chrval.2199, i32 0
%.tmp2236 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2232, i8* %.tmp2234, i8* %.tmp2235)
%.tmp2237 = load i8, i8* %chrval.2199
%.tmp2238 = icmp eq i8 %.tmp2237, 110
br i1 %.tmp2238, label %.if.true.2239, label %.if.false.2239
.if.true.2239:
%.tmp2241 = getelementptr [3 x i8], [3 x i8]*@.str2240, i32 0, i32 0
store i8* %.tmp2241, i8** %buf.2198
br label %.if.end.2239
.if.false.2239:
%.tmp2242 = bitcast ptr null to i8*
ret i8* %.tmp2242
br label %.if.end.2239
.if.end.2239:
br label %.if.end.2231
.if.false.2231:
%.tmp2243 = load i32, i32* %chr_len.2202
%.tmp2244 = icmp eq i32 %.tmp2243, 3
br i1 %.tmp2244, label %.if.true.2245, label %.if.false.2245
.if.true.2245:
%.tmp2246 = load i8*, i8** %chr_repr
%.tmp2248 = getelementptr [5 x i8], [5 x i8]*@.str2247, i32 0, i32 0
%.tmp2249 = getelementptr i32, i32* %intval.2197, i32 0
%.tmp2250 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2246, i8* %.tmp2248, i32* %.tmp2249)
%.tmp2251 = getelementptr i8*, i8** %buf.2198, i32 0
%.tmp2253 = getelementptr [3 x i8], [3 x i8]*@.str2252, i32 0, i32 0
%.tmp2254 = load i32, i32* %intval.2197
%.tmp2255 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2251, i8* %.tmp2253, i32 %.tmp2254)
br label %.if.end.2245
.if.false.2245:
%.tmp2256 = bitcast ptr null to i8*
ret i8* %.tmp2256
br label %.if.end.2245
.if.end.2245:
br label %.if.end.2231
.if.end.2231:
br label %.if.end.2218
.if.end.2218:
br label %.if.end.2205
.if.end.2205:
%.tmp2257 = load i8*, i8** %buf.2198
ret i8* %.tmp2257
}
%m2258$.SYStack.type = type {%m878$.Node.type*,%m2258$.SYStack.type*}
@SYStack_size = constant i32 16
define %m2258$.SYStack.type* @m2258$stack_new.m2258$.SYStack.typep() {
%.tmp2259 = load i32, i32* @SYStack_size
%.tmp2260 = call i8*(i32) @malloc(i32 %.tmp2259)
%.tmp2261 = bitcast i8* %.tmp2260 to %m2258$.SYStack.type*
%s.2262 = alloca %m2258$.SYStack.type*
store %m2258$.SYStack.type* %.tmp2261, %m2258$.SYStack.type** %s.2262
%.tmp2263 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %s.2262
%.tmp2264 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2263, i32 0, i32 0
store %m878$.Node.type* null, %m878$.Node.type** %.tmp2264
%.tmp2265 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %s.2262
%.tmp2266 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2265, i32 0, i32 1
store %m2258$.SYStack.type* null, %m2258$.SYStack.type** %.tmp2266
%.tmp2267 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %s.2262
ret %m2258$.SYStack.type* %.tmp2267
}
define %m2258$.SYStack.type* @m2258$sy_algorithm.m2258$.SYStack.typep.m878$.Node.typep(%m878$.Node.type* %.assignable.arg) {
%assignable = alloca %m878$.Node.type*
store %m878$.Node.type* %.assignable.arg, %m878$.Node.type** %assignable
%.tmp2268 = call %m2258$.SYStack.type*() @m2258$stack_new.m2258$.SYStack.typep()
%out_stack.2269 = alloca %m2258$.SYStack.type*
store %m2258$.SYStack.type* %.tmp2268, %m2258$.SYStack.type** %out_stack.2269
%.tmp2270 = call %m2258$.SYStack.type*() @m2258$stack_new.m2258$.SYStack.typep()
%op_stack.2271 = alloca %m2258$.SYStack.type*
store %m2258$.SYStack.type* %.tmp2270, %m2258$.SYStack.type** %op_stack.2271
%.tmp2272 = call %m2258$.SYStack.type*() @m2258$stack_new.m2258$.SYStack.typep()
%token_stack.2273 = alloca %m2258$.SYStack.type*
store %m2258$.SYStack.type* %.tmp2272, %m2258$.SYStack.type** %token_stack.2273
%ptr.2274 = alloca %m878$.Node.type*
store %m878$.Node.type* null, %m878$.Node.type** %ptr.2274
%.tmp2276 = load %m878$.Node.type*, %m878$.Node.type** %assignable
store %m878$.Node.type* %.tmp2276, %m878$.Node.type** %ptr.2274
br label %.for.start.2275
.for.start.2275:
%.tmp2277 = load %m878$.Node.type*, %m878$.Node.type** %ptr.2274
%.tmp2278 = icmp ne %m878$.Node.type* %.tmp2277, null
br i1 %.tmp2278, label %.for.continue.2275, label %.for.end.2275
.for.continue.2275:
%.tmp2279 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %token_stack.2273
%.tmp2280 = load %m878$.Node.type*, %m878$.Node.type** %ptr.2274
%.tmp2281 = call %m2258$.SYStack.type*(%m2258$.SYStack.type*,%m878$.Node.type*) @m2258$stack_push.m2258$.SYStack.typep.m2258$.SYStack.typep.m878$.Node.typep(%m2258$.SYStack.type* %.tmp2279, %m878$.Node.type* %.tmp2280)
store %m2258$.SYStack.type* %.tmp2281, %m2258$.SYStack.type** %token_stack.2273
%.tmp2282 = load %m878$.Node.type*, %m878$.Node.type** %ptr.2274
%.tmp2283 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2282, i32 0, i32 7
%.tmp2284 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2283
store %m878$.Node.type* %.tmp2284, %m878$.Node.type** %ptr.2274
br label %.for.start.2275
.for.end.2275:
%.tmp2286 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %token_stack.2273
%.tmp2287 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2286, i32 0, i32 0
%.tmp2288 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2287
store %m878$.Node.type* %.tmp2288, %m878$.Node.type** %ptr.2274
br label %.for.start.2285
.for.start.2285:
%.tmp2289 = load %m878$.Node.type*, %m878$.Node.type** %ptr.2274
%.tmp2290 = icmp ne %m878$.Node.type* %.tmp2289, null
br i1 %.tmp2290, label %.for.continue.2285, label %.for.end.2285
.for.continue.2285:
%.tmp2291 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %token_stack.2273
%cs.2292 = alloca %m2258$.SYStack.type*
store %m2258$.SYStack.type* %.tmp2291, %m2258$.SYStack.type** %cs.2292
%.tmp2293 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %token_stack.2273
%.tmp2294 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2293, i32 0, i32 1
%.tmp2295 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp2294
store %m2258$.SYStack.type* %.tmp2295, %m2258$.SYStack.type** %token_stack.2273
%.tmp2296 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %cs.2292
%.tmp2297 = bitcast %m2258$.SYStack.type* %.tmp2296 to i8*
call void(i8*) @free(i8* %.tmp2297)
%.tmp2298 = load %m878$.Node.type*, %m878$.Node.type** %ptr.2274
%.tmp2299 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2298, i32 0, i32 0
%.tmp2300 = load i8*, i8** %.tmp2299
%.tmp2302 = getelementptr [16 x i8], [16 x i8]*@.str2301, i32 0, i32 0
%.tmp2303 = call i32(i8*,i8*) @strcmp(i8* %.tmp2300, i8* %.tmp2302)
%.tmp2304 = icmp eq i32 %.tmp2303, 0
br i1 %.tmp2304, label %.if.true.2305, label %.if.false.2305
.if.true.2305:
%.tmp2306 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %out_stack.2269
%.tmp2307 = load %m878$.Node.type*, %m878$.Node.type** %ptr.2274
%.tmp2308 = call %m2258$.SYStack.type*(%m2258$.SYStack.type*,%m878$.Node.type*) @m2258$stack_push.m2258$.SYStack.typep.m2258$.SYStack.typep.m878$.Node.typep(%m2258$.SYStack.type* %.tmp2306, %m878$.Node.type* %.tmp2307)
store %m2258$.SYStack.type* %.tmp2308, %m2258$.SYStack.type** %out_stack.2269
br label %.if.end.2305
.if.false.2305:
%.tmp2309 = load %m878$.Node.type*, %m878$.Node.type** %ptr.2274
%.tmp2310 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2309, i32 0, i32 0
%.tmp2311 = load i8*, i8** %.tmp2310
%.tmp2313 = getelementptr [9 x i8], [9 x i8]*@.str2312, i32 0, i32 0
%.tmp2314 = call i32(i8*,i8*) @strcmp(i8* %.tmp2311, i8* %.tmp2313)
%.tmp2315 = icmp eq i32 %.tmp2314, 0
br i1 %.tmp2315, label %.if.true.2316, label %.if.false.2316
.if.true.2316:
%quit.2317 = alloca i1
store i1 0, i1* %quit.2317
br label %.for.start.2318
.for.start.2318:
%.tmp2319 = load i1, i1* %quit.2317
%.tmp2320 = icmp eq i1 %.tmp2319, 0
br i1 %.tmp2320, label %.for.continue.2318, label %.for.end.2318
.for.continue.2318:
%.tmp2321 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %op_stack.2271
%.tmp2322 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2321, i32 0, i32 0
%.tmp2323 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2322
%.tmp2324 = icmp eq %m878$.Node.type* %.tmp2323, null
br i1 %.tmp2324, label %.if.true.2325, label %.if.false.2325
.if.true.2325:
store i1 1, i1* %quit.2317
br label %.if.end.2325
.if.false.2325:
%.tmp2326 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %op_stack.2271
%.tmp2327 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2326, i32 0, i32 0
%.tmp2328 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2327
%.tmp2329 = call i32(%m878$.Node.type*) @m2258$op_precedence.i.m878$.Node.typep(%m878$.Node.type* %.tmp2328)
%.tmp2330 = load %m878$.Node.type*, %m878$.Node.type** %ptr.2274
%.tmp2331 = call i32(%m878$.Node.type*) @m2258$op_precedence.i.m878$.Node.typep(%m878$.Node.type* %.tmp2330)
%.tmp2332 = icmp slt i32 %.tmp2329, %.tmp2331
br i1 %.tmp2332, label %.if.true.2333, label %.if.false.2333
.if.true.2333:
%.tmp2334 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %op_stack.2271
%top.2335 = alloca %m2258$.SYStack.type*
store %m2258$.SYStack.type* %.tmp2334, %m2258$.SYStack.type** %top.2335
%.tmp2336 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %op_stack.2271
%.tmp2337 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2336, i32 0, i32 1
%.tmp2338 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp2337
store %m2258$.SYStack.type* %.tmp2338, %m2258$.SYStack.type** %op_stack.2271
%.tmp2339 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %out_stack.2269
%.tmp2340 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %top.2335
%.tmp2341 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2340, i32 0, i32 0
%.tmp2342 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2341
%.tmp2343 = call %m2258$.SYStack.type*(%m2258$.SYStack.type*,%m878$.Node.type*) @m2258$stack_push.m2258$.SYStack.typep.m2258$.SYStack.typep.m878$.Node.typep(%m2258$.SYStack.type* %.tmp2339, %m878$.Node.type* %.tmp2342)
store %m2258$.SYStack.type* %.tmp2343, %m2258$.SYStack.type** %out_stack.2269
%.tmp2344 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %top.2335
%.tmp2345 = bitcast %m2258$.SYStack.type* %.tmp2344 to i8*
call void(i8*) @free(i8* %.tmp2345)
br label %.if.end.2333
.if.false.2333:
store i1 1, i1* %quit.2317
br label %.if.end.2333
.if.end.2333:
br label %.if.end.2325
.if.end.2325:
br label %.for.start.2318
.for.end.2318:
%.tmp2346 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %op_stack.2271
%.tmp2347 = load %m878$.Node.type*, %m878$.Node.type** %ptr.2274
%.tmp2348 = call %m2258$.SYStack.type*(%m2258$.SYStack.type*,%m878$.Node.type*) @m2258$stack_push.m2258$.SYStack.typep.m2258$.SYStack.typep.m878$.Node.typep(%m2258$.SYStack.type* %.tmp2346, %m878$.Node.type* %.tmp2347)
store %m2258$.SYStack.type* %.tmp2348, %m2258$.SYStack.type** %op_stack.2271
br label %.if.end.2316
.if.false.2316:
%.tmp2350 = getelementptr [68 x i8], [68 x i8]*@.str2349, i32 0, i32 0
%.tmp2351 = load %m878$.Node.type*, %m878$.Node.type** %ptr.2274
%.tmp2352 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2351, i32 0, i32 0
%.tmp2353 = load i8*, i8** %.tmp2352
%.tmp2354 = call i32(i8*,...) @printf(i8* %.tmp2350, i8* %.tmp2353)
br label %.if.end.2316
.if.end.2316:
br label %.if.end.2305
.if.end.2305:
%.tmp2355 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %token_stack.2273
%.tmp2356 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2355, i32 0, i32 0
%.tmp2357 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2356
store %m878$.Node.type* %.tmp2357, %m878$.Node.type** %ptr.2274
br label %.for.start.2285
.for.end.2285:
br label %.for.start.2358
.for.start.2358:
%.tmp2359 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %op_stack.2271
%.tmp2360 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2359, i32 0, i32 0
%.tmp2361 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2360
%.tmp2362 = icmp ne %m878$.Node.type* %.tmp2361, null
br i1 %.tmp2362, label %.for.continue.2358, label %.for.end.2358
.for.continue.2358:
%.tmp2363 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %op_stack.2271
%.tmp2364 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2363, i32 0, i32 0
%.tmp2365 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2364
%node.2366 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp2365, %m878$.Node.type** %node.2366
%.tmp2367 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %op_stack.2271
%s.2368 = alloca %m2258$.SYStack.type*
store %m2258$.SYStack.type* %.tmp2367, %m2258$.SYStack.type** %s.2368
%.tmp2369 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %op_stack.2271
%.tmp2370 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2369, i32 0, i32 1
%.tmp2371 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp2370
store %m2258$.SYStack.type* %.tmp2371, %m2258$.SYStack.type** %op_stack.2271
%.tmp2372 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %s.2368
%.tmp2373 = bitcast %m2258$.SYStack.type* %.tmp2372 to i8*
call void(i8*) @free(i8* %.tmp2373)
%.tmp2374 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %out_stack.2269
%.tmp2375 = load %m878$.Node.type*, %m878$.Node.type** %node.2366
%.tmp2376 = call %m2258$.SYStack.type*(%m2258$.SYStack.type*,%m878$.Node.type*) @m2258$stack_push.m2258$.SYStack.typep.m2258$.SYStack.typep.m878$.Node.typep(%m2258$.SYStack.type* %.tmp2374, %m878$.Node.type* %.tmp2375)
store %m2258$.SYStack.type* %.tmp2376, %m2258$.SYStack.type** %out_stack.2269
br label %.for.start.2358
.for.end.2358:
%.tmp2377 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %out_stack.2269
ret %m2258$.SYStack.type* %.tmp2377
}
define %m2258$.SYStack.type* @m2258$stack_push.m2258$.SYStack.typep.m2258$.SYStack.typep.m878$.Node.typep(%m2258$.SYStack.type* %.curr_stack.arg, %m878$.Node.type* %.node.arg) {
%curr_stack = alloca %m2258$.SYStack.type*
store %m2258$.SYStack.type* %.curr_stack.arg, %m2258$.SYStack.type** %curr_stack
%node = alloca %m878$.Node.type*
store %m878$.Node.type* %.node.arg, %m878$.Node.type** %node
%.tmp2378 = load i32, i32* @SYStack_size
%.tmp2379 = call i8*(i32) @malloc(i32 %.tmp2378)
%.tmp2380 = bitcast i8* %.tmp2379 to %m2258$.SYStack.type*
%s.2381 = alloca %m2258$.SYStack.type*
store %m2258$.SYStack.type* %.tmp2380, %m2258$.SYStack.type** %s.2381
%.tmp2382 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %s.2381
%.tmp2383 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2382, i32 0, i32 0
%.tmp2384 = load %m878$.Node.type*, %m878$.Node.type** %node
store %m878$.Node.type* %.tmp2384, %m878$.Node.type** %.tmp2383
%.tmp2385 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %s.2381
%.tmp2386 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp2385, i32 0, i32 1
%.tmp2387 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %curr_stack
store %m2258$.SYStack.type* %.tmp2387, %m2258$.SYStack.type** %.tmp2386
%.tmp2388 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %s.2381
ret %m2258$.SYStack.type* %.tmp2388
}
define i32 @m2258$op_precedence.i.m878$.Node.typep(%m878$.Node.type* %.n.arg) {
%n = alloca %m878$.Node.type*
store %m878$.Node.type* %.n.arg, %m878$.Node.type** %n
%.tmp2389 = load %m878$.Node.type*, %m878$.Node.type** %n
%.tmp2390 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2389, i32 0, i32 6
%.tmp2391 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2390
%op.2392 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp2391, %m878$.Node.type** %op.2392
%.tmp2393 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2394 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2393, i32 0, i32 1
%.tmp2395 = load i8*, i8** %.tmp2394
%.tmp2397 = getelementptr [2 x i8], [2 x i8]*@.str2396, i32 0, i32 0
%.tmp2398 = call i32(i8*,i8*) @strcmp(i8* %.tmp2395, i8* %.tmp2397)
%.tmp2399 = icmp eq i32 %.tmp2398, 0
%.tmp2400 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2401 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2400, i32 0, i32 1
%.tmp2402 = load i8*, i8** %.tmp2401
%.tmp2404 = getelementptr [2 x i8], [2 x i8]*@.str2403, i32 0, i32 0
%.tmp2405 = call i32(i8*,i8*) @strcmp(i8* %.tmp2402, i8* %.tmp2404)
%.tmp2406 = icmp eq i32 %.tmp2405, 0
%.tmp2407 = or i1 %.tmp2399, %.tmp2406
br i1 %.tmp2407, label %.if.true.2408, label %.if.false.2408
.if.true.2408:
ret i32 4
br label %.if.end.2408
.if.false.2408:
%.tmp2409 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2410 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2409, i32 0, i32 1
%.tmp2411 = load i8*, i8** %.tmp2410
%.tmp2413 = getelementptr [2 x i8], [2 x i8]*@.str2412, i32 0, i32 0
%.tmp2414 = call i32(i8*,i8*) @strcmp(i8* %.tmp2411, i8* %.tmp2413)
%.tmp2415 = icmp eq i32 %.tmp2414, 0
%.tmp2416 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2417 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2416, i32 0, i32 1
%.tmp2418 = load i8*, i8** %.tmp2417
%.tmp2420 = getelementptr [2 x i8], [2 x i8]*@.str2419, i32 0, i32 0
%.tmp2421 = call i32(i8*,i8*) @strcmp(i8* %.tmp2418, i8* %.tmp2420)
%.tmp2422 = icmp eq i32 %.tmp2421, 0
%.tmp2423 = or i1 %.tmp2415, %.tmp2422
%.tmp2424 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2425 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2424, i32 0, i32 1
%.tmp2426 = load i8*, i8** %.tmp2425
%.tmp2428 = getelementptr [2 x i8], [2 x i8]*@.str2427, i32 0, i32 0
%.tmp2429 = call i32(i8*,i8*) @strcmp(i8* %.tmp2426, i8* %.tmp2428)
%.tmp2430 = icmp eq i32 %.tmp2429, 0
%.tmp2431 = or i1 %.tmp2423, %.tmp2430
br i1 %.tmp2431, label %.if.true.2432, label %.if.false.2432
.if.true.2432:
ret i32 3
br label %.if.end.2432
.if.false.2432:
%.tmp2433 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2434 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2433, i32 0, i32 1
%.tmp2435 = load i8*, i8** %.tmp2434
%.tmp2437 = getelementptr [3 x i8], [3 x i8]*@.str2436, i32 0, i32 0
%.tmp2438 = call i32(i8*,i8*) @strcmp(i8* %.tmp2435, i8* %.tmp2437)
%.tmp2439 = icmp eq i32 %.tmp2438, 0
%.tmp2440 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2441 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2440, i32 0, i32 1
%.tmp2442 = load i8*, i8** %.tmp2441
%.tmp2444 = getelementptr [3 x i8], [3 x i8]*@.str2443, i32 0, i32 0
%.tmp2445 = call i32(i8*,i8*) @strcmp(i8* %.tmp2442, i8* %.tmp2444)
%.tmp2446 = icmp eq i32 %.tmp2445, 0
%.tmp2447 = or i1 %.tmp2439, %.tmp2446
br i1 %.tmp2447, label %.if.true.2448, label %.if.false.2448
.if.true.2448:
ret i32 7
br label %.if.end.2448
.if.false.2448:
%.tmp2449 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2450 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2449, i32 0, i32 1
%.tmp2451 = load i8*, i8** %.tmp2450
%.tmp2453 = getelementptr [3 x i8], [3 x i8]*@.str2452, i32 0, i32 0
%.tmp2454 = call i32(i8*,i8*) @strcmp(i8* %.tmp2451, i8* %.tmp2453)
%.tmp2455 = icmp eq i32 %.tmp2454, 0
%.tmp2456 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2457 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2456, i32 0, i32 1
%.tmp2458 = load i8*, i8** %.tmp2457
%.tmp2460 = getelementptr [3 x i8], [3 x i8]*@.str2459, i32 0, i32 0
%.tmp2461 = call i32(i8*,i8*) @strcmp(i8* %.tmp2458, i8* %.tmp2460)
%.tmp2462 = icmp eq i32 %.tmp2461, 0
%.tmp2463 = or i1 %.tmp2455, %.tmp2462
br i1 %.tmp2463, label %.if.true.2464, label %.if.false.2464
.if.true.2464:
ret i32 6
br label %.if.end.2464
.if.false.2464:
%.tmp2465 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2466 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2465, i32 0, i32 1
%.tmp2467 = load i8*, i8** %.tmp2466
%.tmp2469 = getelementptr [2 x i8], [2 x i8]*@.str2468, i32 0, i32 0
%.tmp2470 = call i32(i8*,i8*) @strcmp(i8* %.tmp2467, i8* %.tmp2469)
%.tmp2471 = icmp eq i32 %.tmp2470, 0
%.tmp2472 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2473 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2472, i32 0, i32 1
%.tmp2474 = load i8*, i8** %.tmp2473
%.tmp2476 = getelementptr [2 x i8], [2 x i8]*@.str2475, i32 0, i32 0
%.tmp2477 = call i32(i8*,i8*) @strcmp(i8* %.tmp2474, i8* %.tmp2476)
%.tmp2478 = icmp eq i32 %.tmp2477, 0
%.tmp2479 = or i1 %.tmp2471, %.tmp2478
br i1 %.tmp2479, label %.if.true.2480, label %.if.false.2480
.if.true.2480:
ret i32 6
br label %.if.end.2480
.if.false.2480:
%.tmp2481 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2482 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2481, i32 0, i32 1
%.tmp2483 = load i8*, i8** %.tmp2482
%.tmp2485 = getelementptr [2 x i8], [2 x i8]*@.str2484, i32 0, i32 0
%.tmp2486 = call i32(i8*,i8*) @strcmp(i8* %.tmp2483, i8* %.tmp2485)
%.tmp2487 = icmp eq i32 %.tmp2486, 0
br i1 %.tmp2487, label %.if.true.2488, label %.if.false.2488
.if.true.2488:
ret i32 11
br label %.if.end.2488
.if.false.2488:
%.tmp2489 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2490 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2489, i32 0, i32 1
%.tmp2491 = load i8*, i8** %.tmp2490
%.tmp2493 = getelementptr [2 x i8], [2 x i8]*@.str2492, i32 0, i32 0
%.tmp2494 = call i32(i8*,i8*) @strcmp(i8* %.tmp2491, i8* %.tmp2493)
%.tmp2495 = icmp eq i32 %.tmp2494, 0
br i1 %.tmp2495, label %.if.true.2496, label %.if.false.2496
.if.true.2496:
ret i32 12
br label %.if.end.2496
.if.false.2496:
br label %.if.end.2496
.if.end.2496:
br label %.if.end.2488
.if.end.2488:
br label %.if.end.2480
.if.end.2480:
br label %.if.end.2464
.if.end.2464:
br label %.if.end.2448
.if.end.2448:
br label %.if.end.2432
.if.end.2432:
br label %.if.end.2408
.if.end.2408:
%.tmp2498 = getelementptr [65 x i8], [65 x i8]*@.str2497, i32 0, i32 0
%.tmp2499 = load %m878$.Node.type*, %m878$.Node.type** %op.2392
%.tmp2500 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2499, i32 0, i32 1
%.tmp2501 = load i8*, i8** %.tmp2500
%.tmp2502 = call i32(i8*,...) @printf(i8* %.tmp2498, i8* %.tmp2501)
ret i32 4
}
%m2503$.Type.type = type {i8*,i8*,i8*,%m2503$.Type.type*,%m2503$.Type.type*}
%m2503$.ErrorList.type = type {%m296$.Error.type*,%m2503$.ErrorList.type*,i1}
%m2503$.AssignableInfo.type = type {i8*,i8,i8*,i8*,%m2503$.Type.type*,i32,i32,i8*}
%m2503$.ScopeItem.type = type {i8*,%m2503$.AssignableInfo.type*,%m2503$.ScopeItem.type*}
%m2503$.Scope.type = type {i8*,%m2503$.ScopeItem.type*,i8*,i8*,i8*,%m2503$.Scope.type*}
%m2503$.GlobalName.type = type {i8*,i8*,i1,i1,%m2503$.AssignableInfo.type*,%m2503$.GlobalName.type*}
%m2503$.ModuleLookup.type = type {i8*,i8*,%m2503$.ModuleLookup.type*,%m2503$.Scope.type*}
%m2503$.AnonFn.type = type {i8*,%m2503$.AnonFn.type*}
%m2503$.CompilerCtx.type = type {%m878$.Node.type*,%m0$.File.type*,%m2503$.ErrorList.type*,%m2503$.GlobalName.type*,%m878$.Rule.type**,i32,%m2503$.ModuleLookup.type*,i8*,%m2503$.AnonFn.type*}
@DEBUG_INTERNALS = constant i1 0
define %m2503$.Type.type* @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.t.arg) {
%t = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.t.arg, %m2503$.Type.type** %t
%.tmp2504 = load %m2503$.Type.type*, %m2503$.Type.type** %t
%.tmp2505 = icmp eq %m2503$.Type.type* %.tmp2504, null
br i1 %.tmp2505, label %.if.true.2506, label %.if.false.2506
.if.true.2506:
%.tmp2507 = bitcast ptr null to %m2503$.Type.type*
ret %m2503$.Type.type* %.tmp2507
br label %.if.end.2506
.if.false.2506:
br label %.if.end.2506
.if.end.2506:
%.tmp2508 = getelementptr %m2503$.Type.type, %m2503$.Type.type* null, i32 1
%.tmp2509 = ptrtoint %m2503$.Type.type* %.tmp2508 to i32
%.tmp2510 = call i8*(i32) @malloc(i32 %.tmp2509)
%.tmp2511 = bitcast i8* %.tmp2510 to %m2503$.Type.type*
%clone.2512 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp2511, %m2503$.Type.type** %clone.2512
%.tmp2513 = load %m2503$.Type.type*, %m2503$.Type.type** %clone.2512
%.tmp2514 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2513, i32 0, i32 3
%.tmp2515 = load %m2503$.Type.type*, %m2503$.Type.type** %t
%.tmp2516 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2515, i32 0, i32 3
%.tmp2517 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp2516
store %m2503$.Type.type* %.tmp2517, %m2503$.Type.type** %.tmp2514
%.tmp2518 = load %m2503$.Type.type*, %m2503$.Type.type** %clone.2512
%.tmp2519 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2518, i32 0, i32 4
%.tmp2520 = load %m2503$.Type.type*, %m2503$.Type.type** %t
%.tmp2521 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2520, i32 0, i32 4
%.tmp2522 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp2521
%.tmp2523 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp2522)
store %m2503$.Type.type* %.tmp2523, %m2503$.Type.type** %.tmp2519
%.tmp2524 = load %m2503$.Type.type*, %m2503$.Type.type** %clone.2512
%.tmp2525 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2524, i32 0, i32 2
%.tmp2526 = load %m2503$.Type.type*, %m2503$.Type.type** %t
%.tmp2527 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2526, i32 0, i32 2
%.tmp2528 = load i8*, i8** %.tmp2527
store i8* %.tmp2528, i8** %.tmp2525
%.tmp2529 = load %m2503$.Type.type*, %m2503$.Type.type** %clone.2512
%.tmp2530 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2529, i32 0, i32 0
%.tmp2531 = load %m2503$.Type.type*, %m2503$.Type.type** %t
%.tmp2532 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2531, i32 0, i32 0
%.tmp2533 = load i8*, i8** %.tmp2532
store i8* %.tmp2533, i8** %.tmp2530
%.tmp2534 = load %m2503$.Type.type*, %m2503$.Type.type** %clone.2512
%.tmp2535 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2534, i32 0, i32 1
%.tmp2536 = load %m2503$.Type.type*, %m2503$.Type.type** %t
%.tmp2537 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2536, i32 0, i32 1
%.tmp2538 = load i8*, i8** %.tmp2537
store i8* %.tmp2538, i8** %.tmp2535
%.tmp2539 = load %m2503$.Type.type*, %m2503$.Type.type** %clone.2512
ret %m2503$.Type.type* %.tmp2539
}
define i8* @m295$get_root.cp() {
%.tmp2541 = getelementptr [12 x i8], [12 x i8]*@.str2540, i32 0, i32 0
%.tmp2542 = call i8*(i8*) @getenv(i8* %.tmp2541)
%project_root.2543 = alloca i8*
store i8* %.tmp2542, i8** %project_root.2543
%.tmp2544 = load i8*, i8** %project_root.2543
%.tmp2545 = icmp eq i8* %.tmp2544, null
br i1 %.tmp2545, label %.if.true.2546, label %.if.false.2546
.if.true.2546:
%.tmp2548 = getelementptr [5 x i8], [5 x i8]*@.str2547, i32 0, i32 0
%.tmp2549 = call i8*(i8*) @getenv(i8* %.tmp2548)
%home.2550 = alloca i8*
store i8* %.tmp2549, i8** %home.2550
%.tmp2551 = getelementptr i8*, i8** %project_root.2543, i32 0
%.tmp2553 = getelementptr [11 x i8], [11 x i8]*@.str2552, i32 0, i32 0
%.tmp2554 = load i8*, i8** %home.2550
%.tmp2555 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2551, i8* %.tmp2553, i8* %.tmp2554)
br label %.if.end.2546
.if.false.2546:
br label %.if.end.2546
.if.end.2546:
%.tmp2556 = load i8*, i8** %project_root.2543
ret i8* %.tmp2556
}
define %m2503$.Type.type* @m295$new_type.m2503$.Type.typep() {
%.tmp2557 = getelementptr %m2503$.Type.type, %m2503$.Type.type* null, i32 1
%.tmp2558 = ptrtoint %m2503$.Type.type* %.tmp2557 to i32
%.tmp2559 = call i8*(i32) @malloc(i32 %.tmp2558)
%.tmp2560 = bitcast i8* %.tmp2559 to %m2503$.Type.type*
%type.2561 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp2560, %m2503$.Type.type** %type.2561
%.tmp2562 = load %m2503$.Type.type*, %m2503$.Type.type** %type.2561
%.tmp2563 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2562, i32 0, i32 1
store i8* null, i8** %.tmp2563
%.tmp2564 = load %m2503$.Type.type*, %m2503$.Type.type** %type.2561
%.tmp2565 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2564, i32 0, i32 2
store i8* null, i8** %.tmp2565
%.tmp2566 = load %m2503$.Type.type*, %m2503$.Type.type** %type.2561
%.tmp2567 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2566, i32 0, i32 0
store i8* null, i8** %.tmp2567
%.tmp2568 = load %m2503$.Type.type*, %m2503$.Type.type** %type.2561
%.tmp2569 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2568, i32 0, i32 3
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp2569
%.tmp2570 = load %m2503$.Type.type*, %m2503$.Type.type** %type.2561
%.tmp2571 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2570, i32 0, i32 4
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp2571
%.tmp2572 = load %m2503$.Type.type*, %m2503$.Type.type** %type.2561
ret %m2503$.Type.type* %.tmp2572
}
define void @m295$copy_type.v.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.dest.arg, %m2503$.Type.type* %.src.arg) {
%dest = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.dest.arg, %m2503$.Type.type** %dest
%src = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.src.arg, %m2503$.Type.type** %src
%.tmp2573 = load %m2503$.Type.type*, %m2503$.Type.type** %dest
%.tmp2574 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2573, i32 0, i32 0
%.tmp2575 = load %m2503$.Type.type*, %m2503$.Type.type** %src
%.tmp2576 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2575, i32 0, i32 0
%.tmp2577 = load i8*, i8** %.tmp2576
store i8* %.tmp2577, i8** %.tmp2574
%.tmp2578 = load %m2503$.Type.type*, %m2503$.Type.type** %dest
%.tmp2579 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2578, i32 0, i32 1
%.tmp2580 = load %m2503$.Type.type*, %m2503$.Type.type** %src
%.tmp2581 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2580, i32 0, i32 1
%.tmp2582 = load i8*, i8** %.tmp2581
store i8* %.tmp2582, i8** %.tmp2579
%.tmp2583 = load %m2503$.Type.type*, %m2503$.Type.type** %dest
%.tmp2584 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2583, i32 0, i32 2
%.tmp2585 = load %m2503$.Type.type*, %m2503$.Type.type** %src
%.tmp2586 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2585, i32 0, i32 2
%.tmp2587 = load i8*, i8** %.tmp2586
store i8* %.tmp2587, i8** %.tmp2584
%.tmp2588 = load %m2503$.Type.type*, %m2503$.Type.type** %dest
%.tmp2589 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2588, i32 0, i32 3
%.tmp2590 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp2589
%.tmp2591 = load %m2503$.Type.type*, %m2503$.Type.type** %src
%.tmp2592 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2591, i32 0, i32 3
%.tmp2593 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp2592
%.tmp2594 = icmp ne %m2503$.Type.type* %.tmp2590, %.tmp2593
br i1 %.tmp2594, label %.if.true.2595, label %.if.false.2595
.if.true.2595:
%.tmp2596 = load %m2503$.Type.type*, %m2503$.Type.type** %dest
%.tmp2597 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2596, i32 0, i32 3
%.tmp2598 = load %m2503$.Type.type*, %m2503$.Type.type** %src
%.tmp2599 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2598, i32 0, i32 3
%.tmp2600 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp2599
store %m2503$.Type.type* %.tmp2600, %m2503$.Type.type** %.tmp2597
%.tmp2601 = load %m2503$.Type.type*, %m2503$.Type.type** %dest
%.tmp2602 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2601, i32 0, i32 3
%.tmp2603 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp2602
%.tmp2604 = load %m2503$.Type.type*, %m2503$.Type.type** %src
%.tmp2605 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2604, i32 0, i32 3
%.tmp2606 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp2605
call void(%m2503$.Type.type*,%m2503$.Type.type*) @m295$copy_type.v.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp2603, %m2503$.Type.type* %.tmp2606)
br label %.if.end.2595
.if.false.2595:
br label %.if.end.2595
.if.end.2595:
%.tmp2607 = load %m2503$.Type.type*, %m2503$.Type.type** %dest
%.tmp2608 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2607, i32 0, i32 4
%.tmp2609 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp2608
%.tmp2610 = load %m2503$.Type.type*, %m2503$.Type.type** %src
%.tmp2611 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2610, i32 0, i32 4
%.tmp2612 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp2611
%.tmp2613 = icmp ne %m2503$.Type.type* %.tmp2609, %.tmp2612
br i1 %.tmp2613, label %.if.true.2614, label %.if.false.2614
.if.true.2614:
%.tmp2615 = load %m2503$.Type.type*, %m2503$.Type.type** %dest
%.tmp2616 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2615, i32 0, i32 4
%.tmp2617 = load %m2503$.Type.type*, %m2503$.Type.type** %src
%.tmp2618 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2617, i32 0, i32 4
%.tmp2619 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp2618
store %m2503$.Type.type* %.tmp2619, %m2503$.Type.type** %.tmp2616
%.tmp2620 = load %m2503$.Type.type*, %m2503$.Type.type** %dest
%.tmp2621 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2620, i32 0, i32 4
%.tmp2622 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp2621
%.tmp2623 = load %m2503$.Type.type*, %m2503$.Type.type** %src
%.tmp2624 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2623, i32 0, i32 4
%.tmp2625 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp2624
call void(%m2503$.Type.type*,%m2503$.Type.type*) @m295$copy_type.v.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp2622, %m2503$.Type.type* %.tmp2625)
br label %.if.end.2614
.if.false.2614:
br label %.if.end.2614
.if.end.2614:
ret void
}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m2503$.AssignableInfo.type* @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.node.arg) {
%node = alloca %m878$.Node.type*
store %m878$.Node.type* %.node.arg, %m878$.Node.type** %node
%.tmp2626 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* null, i32 1
%.tmp2627 = ptrtoint %m2503$.AssignableInfo.type* %.tmp2626 to i32
%.tmp2628 = call i8*(i32) @malloc(i32 %.tmp2627)
%.tmp2629 = bitcast i8* %.tmp2628 to %m2503$.AssignableInfo.type*
%ptr.2630 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp2629, %m2503$.AssignableInfo.type** %ptr.2630
%.tmp2631 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %ptr.2630
%.tmp2632 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2631, i32 0, i32 1
%.tmp2633 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2633, i8* %.tmp2632
%.tmp2634 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %ptr.2630
%.tmp2635 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2634, i32 0, i32 0
store i8* null, i8** %.tmp2635
%.tmp2636 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %ptr.2630
%.tmp2637 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2636, i32 0, i32 3
store i8* null, i8** %.tmp2637
%.tmp2638 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %ptr.2630
%.tmp2639 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2638, i32 0, i32 2
%.tmp2641 = getelementptr [1 x i8], [1 x i8]*@.str2640, i32 0, i32 0
store i8* %.tmp2641, i8** %.tmp2639
%.tmp2642 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %ptr.2630
%.tmp2643 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2642, i32 0, i32 4
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp2643
%.tmp2644 = load %m878$.Node.type*, %m878$.Node.type** %node
%.tmp2645 = icmp ne %m878$.Node.type* %.tmp2644, null
br i1 %.tmp2645, label %.if.true.2646, label %.if.false.2646
.if.true.2646:
%.tmp2647 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %ptr.2630
%.tmp2648 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2647, i32 0, i32 5
%.tmp2649 = load %m878$.Node.type*, %m878$.Node.type** %node
%.tmp2650 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2649, i32 0, i32 3
%.tmp2651 = load i32, i32* %.tmp2650
store i32 %.tmp2651, i32* %.tmp2648
%.tmp2652 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %ptr.2630
%.tmp2653 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2652, i32 0, i32 6
%.tmp2654 = load %m878$.Node.type*, %m878$.Node.type** %node
%.tmp2655 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2654, i32 0, i32 4
%.tmp2656 = load i32, i32* %.tmp2655
store i32 %.tmp2656, i32* %.tmp2653
%.tmp2657 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %ptr.2630
%.tmp2658 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2657, i32 0, i32 7
%.tmp2659 = load %m878$.Node.type*, %m878$.Node.type** %node
%.tmp2660 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2659, i32 0, i32 2
%.tmp2661 = load i8*, i8** %.tmp2660
store i8* %.tmp2661, i8** %.tmp2658
br label %.if.end.2646
.if.false.2646:
%.tmp2662 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %ptr.2630
%.tmp2663 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2662, i32 0, i32 5
store i32 0, i32* %.tmp2663
%.tmp2664 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %ptr.2630
%.tmp2665 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2664, i32 0, i32 6
store i32 0, i32* %.tmp2665
%.tmp2666 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %ptr.2630
%.tmp2667 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2666, i32 0, i32 7
store i8* null, i8** %.tmp2667
br label %.if.end.2646
.if.end.2646:
%.tmp2668 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %ptr.2630
ret %m2503$.AssignableInfo.type* %.tmp2668
}
define void @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.info.arg, %m2503$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2669 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp2670 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2669, i32 0, i32 0
%.tmp2671 = load i8*, i8** %id
store i8* %.tmp2671, i8** %.tmp2670
%.tmp2672 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp2673 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2672, i32 0, i32 1
%.tmp2674 = load i8, i8* %scope
store i8 %.tmp2674, i8* %.tmp2673
ret void
}
define i8* @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.info.arg) {
%info = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.info.arg, %m2503$.AssignableInfo.type** %info
%.tmp2675 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp2676 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2675, i32 0, i32 1
%.tmp2677 = load i8, i8* %.tmp2676
%.tmp2678 = load i8, i8* @SCOPE_CONST
%.tmp2679 = icmp eq i8 %.tmp2677, %.tmp2678
br i1 %.tmp2679, label %.if.true.2680, label %.if.false.2680
.if.true.2680:
%.tmp2681 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp2682 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2681, i32 0, i32 0
%.tmp2683 = load i8*, i8** %.tmp2682
ret i8* %.tmp2683
br label %.if.end.2680
.if.false.2680:
br label %.if.end.2680
.if.end.2680:
%buf.2684 = alloca i8*
store i8* null, i8** %buf.2684
%.tmp2685 = getelementptr i8*, i8** %buf.2684, i32 0
%.tmp2687 = getelementptr [5 x i8], [5 x i8]*@.str2686, i32 0, i32 0
%.tmp2688 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp2689 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2688, i32 0, i32 1
%.tmp2690 = load i8, i8* %.tmp2689
%.tmp2691 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp2692 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp2691, i32 0, i32 0
%.tmp2693 = load i8*, i8** %.tmp2692
%.tmp2694 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2685, i8* %.tmp2687, i8 %.tmp2690, i8* %.tmp2693)
%.tmp2695 = load i8*, i8** %buf.2684
ret i8* %.tmp2695
}
define i1 @m295$is_same_type.b.m2503$.CompilerCtx.typep.m2503$.Type.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.Type.type* %.a.arg, %m2503$.Type.type* %.b.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%a = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.a.arg, %m2503$.Type.type** %a
%b = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.b.arg, %m2503$.Type.type** %b
%.tmp2696 = load %m2503$.Type.type*, %m2503$.Type.type** %a
%.tmp2697 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2696, i32 0, i32 0
%.tmp2698 = load i8*, i8** %.tmp2697
%.tmp2700 = getelementptr [8 x i8], [8 x i8]*@.str2699, i32 0, i32 0
%.tmp2701 = call i32(i8*,i8*) @strcmp(i8* %.tmp2698, i8* %.tmp2700)
%.tmp2702 = icmp eq i32 %.tmp2701, 0
%.tmp2703 = load %m2503$.Type.type*, %m2503$.Type.type** %b
%.tmp2704 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2703, i32 0, i32 0
%.tmp2705 = load i8*, i8** %.tmp2704
%.tmp2707 = getelementptr [8 x i8], [8 x i8]*@.str2706, i32 0, i32 0
%.tmp2708 = call i32(i8*,i8*) @strcmp(i8* %.tmp2705, i8* %.tmp2707)
%.tmp2709 = icmp eq i32 %.tmp2708, 0
%.tmp2710 = or i1 %.tmp2702, %.tmp2709
br i1 %.tmp2710, label %.if.true.2711, label %.if.false.2711
.if.true.2711:
%.tmp2712 = load %m2503$.Type.type*, %m2503$.Type.type** %a
%.tmp2713 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2712, i32 0, i32 0
%.tmp2714 = load i8*, i8** %.tmp2713
%.tmp2716 = getelementptr [4 x i8], [4 x i8]*@.str2715, i32 0, i32 0
%.tmp2717 = call i32(i8*,i8*) @strcmp(i8* %.tmp2714, i8* %.tmp2716)
%.tmp2718 = icmp eq i32 %.tmp2717, 0
%.tmp2719 = load %m2503$.Type.type*, %m2503$.Type.type** %b
%.tmp2720 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp2719, i32 0, i32 0
%.tmp2721 = load i8*, i8** %.tmp2720
%.tmp2723 = getelementptr [4 x i8], [4 x i8]*@.str2722, i32 0, i32 0
%.tmp2724 = call i32(i8*,i8*) @strcmp(i8* %.tmp2721, i8* %.tmp2723)
%.tmp2725 = icmp eq i32 %.tmp2724, 0
%.tmp2726 = or i1 %.tmp2718, %.tmp2725
ret i1 %.tmp2726
br label %.if.end.2711
.if.false.2711:
br label %.if.end.2711
.if.end.2711:
%.tmp2727 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2728 = load %m2503$.Type.type*, %m2503$.Type.type** %a
%.tmp2729 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp2727, %m2503$.Type.type* %.tmp2728)
%a_repr.2730 = alloca i8*
store i8* %.tmp2729, i8** %a_repr.2730
%.tmp2731 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2732 = load %m2503$.Type.type*, %m2503$.Type.type** %b
%.tmp2733 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp2731, %m2503$.Type.type* %.tmp2732)
%b_repr.2734 = alloca i8*
store i8* %.tmp2733, i8** %b_repr.2734
%.tmp2735 = load i8*, i8** %a_repr.2730
%.tmp2736 = load i8*, i8** %b_repr.2734
%.tmp2737 = call i32(i8*,i8*) @strcmp(i8* %.tmp2735, i8* %.tmp2736)
%.tmp2738 = icmp eq i32 %.tmp2737, 0
ret i1 %.tmp2738
}
define void @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%info = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.info.arg, %m2503$.AssignableInfo.type** %info
%tmp_buff.2739 = alloca i8*
store i8* null, i8** %tmp_buff.2739
%.tmp2740 = getelementptr i8*, i8** %tmp_buff.2739, i32 0
%.tmp2742 = getelementptr [7 x i8], [7 x i8]*@.str2741, i32 0, i32 0
%.tmp2743 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2744 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp2743)
%.tmp2745 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2740, i8* %.tmp2742, i32 %.tmp2744)
%.tmp2746 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp2747 = load i8, i8* @SCOPE_LOCAL
%.tmp2748 = load i8*, i8** %tmp_buff.2739
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp2746, i8 %.tmp2747, i8* %.tmp2748)
ret void
}
define %m2503$.ModuleLookup.type* @m295$get_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2750 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2751 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2750, i32 0, i32 6
%.tmp2752 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp2751
%m.2753 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp2752, %m2503$.ModuleLookup.type** %m.2753
br label %.for.start.2749
.for.start.2749:
%.tmp2754 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2753
%.tmp2755 = icmp ne %m2503$.ModuleLookup.type* %.tmp2754, null
br i1 %.tmp2755, label %.for.continue.2749, label %.for.end.2749
.for.continue.2749:
%.tmp2756 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2753
%.tmp2757 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2756, i32 0, i32 0
%.tmp2758 = load i8*, i8** %.tmp2757
%.tmp2759 = load i8*, i8** %filename
%.tmp2760 = call i32(i8*,i8*) @strcmp(i8* %.tmp2758, i8* %.tmp2759)
%.tmp2761 = icmp eq i32 %.tmp2760, 0
br i1 %.tmp2761, label %.if.true.2762, label %.if.false.2762
.if.true.2762:
%.tmp2763 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2753
ret %m2503$.ModuleLookup.type* %.tmp2763
br label %.if.end.2762
.if.false.2762:
br label %.if.end.2762
.if.end.2762:
%.tmp2764 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2753
%.tmp2765 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2764, i32 0, i32 2
%.tmp2766 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp2765
store %m2503$.ModuleLookup.type* %.tmp2766, %m2503$.ModuleLookup.type** %m.2753
br label %.for.start.2749
.for.end.2749:
%.tmp2767 = bitcast ptr null to %m2503$.ModuleLookup.type*
ret %m2503$.ModuleLookup.type* %.tmp2767
}
define %m2503$.ModuleLookup.type* @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%.tmp2768 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2769 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2770 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2769, i32 0, i32 7
%.tmp2771 = load i8*, i8** %.tmp2770
%.tmp2772 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*,i8*) @m295$get_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.tmp2768, i8* %.tmp2771)
ret %m2503$.ModuleLookup.type* %.tmp2772
}
define i32 @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%.tmp2773 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2774 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2773, i32 0, i32 5
%.tmp2775 = load i32, i32* %.tmp2774
%uid.2776 = alloca i32
store i32 %.tmp2775, i32* %uid.2776
%.tmp2777 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2778 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2777, i32 0, i32 5
%.tmp2779 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2780 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2779, i32 0, i32 5
%.tmp2781 = load i32, i32* %.tmp2780
%.tmp2782 = add i32 %.tmp2781, 1
store i32 %.tmp2782, i32* %.tmp2778
%.tmp2783 = load i32, i32* %uid.2776
ret i32 %.tmp2783
}
define %m2503$.CompilerCtx.type* @m295$new_context.m2503$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2784 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* null, i32 1
%.tmp2785 = ptrtoint %m2503$.CompilerCtx.type* %.tmp2784 to i32
%.tmp2786 = call i8*(i32) @malloc(i32 %.tmp2785)
%.tmp2787 = bitcast i8* %.tmp2786 to %m2503$.CompilerCtx.type*
%ctx.2788 = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.tmp2787, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2789 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2790 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2789, i32 0, i32 1
%.tmp2791 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2791, %m0$.File.type** %.tmp2790
%.tmp2792 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2793 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2792, i32 0, i32 0
%.tmp2794 = bitcast ptr null to %m878$.Node.type*
store %m878$.Node.type* %.tmp2794, %m878$.Node.type** %.tmp2793
%.tmp2795 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2796 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2795, i32 0, i32 2
store %m2503$.ErrorList.type* null, %m2503$.ErrorList.type** %.tmp2796
%.tmp2797 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2798 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2797, i32 0, i32 5
store i32 0, i32* %.tmp2798
%.tmp2799 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2800 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2799, i32 0, i32 3
store %m2503$.GlobalName.type* null, %m2503$.GlobalName.type** %.tmp2800
%.tmp2801 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2802 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2801, i32 0, i32 8
store %m2503$.AnonFn.type* null, %m2503$.AnonFn.type** %.tmp2802
%.tmp2803 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2804 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2803, i32 0, i32 7
%.tmp2805 = load i8*, i8** %filename
store i8* %.tmp2805, i8** %.tmp2804
%.tmp2806 = call i8*() @m2051$grammar.cp()
%.tmp2807 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2806)
%grammar_file.2808 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2807, %m0$.File.type** %grammar_file.2808
%.tmp2809 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2808
%.tmp2810 = icmp eq %m0$.File.type* %.tmp2809, null
br i1 %.tmp2810, label %.if.true.2811, label %.if.false.2811
.if.true.2811:
%.tmp2812 = bitcast ptr null to %m2503$.CompilerCtx.type*
ret %m2503$.CompilerCtx.type* %.tmp2812
br label %.if.end.2811
.if.false.2811:
br label %.if.end.2811
.if.end.2811:
%.tmp2813 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2808
%.tmp2814 = call %m878$.ParsingContext.type*(%m0$.File.type*) @m878$new_context.m878$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2813)
%grammar_ctx.2815 = alloca %m878$.ParsingContext.type*
store %m878$.ParsingContext.type* %.tmp2814, %m878$.ParsingContext.type** %grammar_ctx.2815
%.tmp2816 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2808
%.tmp2817 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp2816)
%.tmp2818 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2819 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2818, i32 0, i32 4
%.tmp2820 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %grammar_ctx.2815
%.tmp2821 = call %m878$.Rule.type**(%m878$.ParsingContext.type*) @m878$parse_grammar.m878$.Rule.typepp.m878$.ParsingContext.typep(%m878$.ParsingContext.type* %.tmp2820)
store %m878$.Rule.type** %.tmp2821, %m878$.Rule.type*** %.tmp2819
%.tmp2822 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2823 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2822, i32 0, i32 6
%.tmp2824 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* null, i32 1
%.tmp2825 = ptrtoint %m2503$.ModuleLookup.type* %.tmp2824 to i32
%.tmp2826 = call i8*(i32) @malloc(i32 %.tmp2825)
%.tmp2827 = bitcast i8* %.tmp2826 to %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp2827, %m2503$.ModuleLookup.type** %.tmp2823
%.tmp2828 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2829 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2828, i32 0, i32 6
%.tmp2830 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp2829
%.tmp2831 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2830, i32 0, i32 0
%.tmp2832 = load i8*, i8** %filename
store i8* %.tmp2832, i8** %.tmp2831
%.tmp2833 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2834 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2833, i32 0, i32 6
%.tmp2835 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp2834
%.tmp2836 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2835, i32 0, i32 3
store %m2503$.Scope.type* null, %m2503$.Scope.type** %.tmp2836
%.tmp2837 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2838 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2837, i32 0, i32 6
%.tmp2839 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp2838
%.tmp2840 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2839, i32 0, i32 1
%.tmp2842 = getelementptr [1 x i8], [1 x i8]*@.str2841, i32 0, i32 0
store i8* %.tmp2842, i8** %.tmp2840
%.tmp2843 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2844 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2843, i32 0, i32 6
%.tmp2845 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp2844
%.tmp2846 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2845, i32 0, i32 2
store %m2503$.ModuleLookup.type* null, %m2503$.ModuleLookup.type** %.tmp2846
%.tmp2847 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2788
%.tmp2848 = bitcast %m2503$.CompilerCtx.type* %.tmp2847 to %m2503$.CompilerCtx.type*
ret %m2503$.CompilerCtx.type* %.tmp2848
}
define void @m295$push_scope.v.m2503$.CompilerCtx.typep.cp.cp.cp(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.type.arg, i8* %.begin_id.arg, i8* %.end_id.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%type = alloca i8*
store i8* %.type.arg, i8** %type
%begin_id = alloca i8*
store i8* %.begin_id.arg, i8** %begin_id
%end_id = alloca i8*
store i8* %.end_id.arg, i8** %end_id
%.tmp2849 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* null, i32 1
%.tmp2850 = ptrtoint %m2503$.Scope.type* %.tmp2849 to i32
%.tmp2851 = call i8*(i32) @malloc(i32 %.tmp2850)
%.tmp2852 = bitcast i8* %.tmp2851 to %m2503$.Scope.type*
%s.2853 = alloca %m2503$.Scope.type*
store %m2503$.Scope.type* %.tmp2852, %m2503$.Scope.type** %s.2853
%.tmp2854 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2855 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp2854)
%m.2856 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp2855, %m2503$.ModuleLookup.type** %m.2856
%.tmp2857 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.2853
%.tmp2858 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp2857, i32 0, i32 5
%.tmp2859 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2856
%.tmp2860 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2859, i32 0, i32 3
%.tmp2861 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp2860
store %m2503$.Scope.type* %.tmp2861, %m2503$.Scope.type** %.tmp2858
%.tmp2862 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.2853
%.tmp2863 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp2862, i32 0, i32 1
store %m2503$.ScopeItem.type* null, %m2503$.ScopeItem.type** %.tmp2863
%.tmp2864 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.2853
%.tmp2865 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp2864, i32 0, i32 2
%.tmp2866 = load i8*, i8** %type
store i8* %.tmp2866, i8** %.tmp2865
%.tmp2867 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.2853
%.tmp2868 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp2867, i32 0, i32 3
%.tmp2869 = load i8*, i8** %begin_id
store i8* %.tmp2869, i8** %.tmp2868
%.tmp2870 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.2853
%.tmp2871 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp2870, i32 0, i32 4
%.tmp2872 = load i8*, i8** %end_id
store i8* %.tmp2872, i8** %.tmp2871
%.tmp2873 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2856
%.tmp2874 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2873, i32 0, i32 3
%.tmp2875 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.2853
store %m2503$.Scope.type* %.tmp2875, %m2503$.Scope.type** %.tmp2874
ret void
}
define void @m295$pop_scope.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%.tmp2876 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2877 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp2876)
%m.2878 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp2877, %m2503$.ModuleLookup.type** %m.2878
%.tmp2879 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2878
%.tmp2880 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2879, i32 0, i32 3
%.tmp2881 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp2880
%.tmp2882 = icmp ne %m2503$.Scope.type* %.tmp2881, null
%.tmp2884 = getelementptr [61 x i8], [61 x i8]*@.str2883, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2882, i8* %.tmp2884)
%.tmp2885 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2878
%.tmp2886 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2885, i32 0, i32 3
%.tmp2887 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2878
%.tmp2888 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2887, i32 0, i32 3
%.tmp2889 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp2888
%.tmp2890 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp2889, i32 0, i32 5
%.tmp2891 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp2890
store %m2503$.Scope.type* %.tmp2891, %m2503$.Scope.type** %.tmp2886
ret void
}
define i1 @m295$compile_file.b.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2892 = load i8*, i8** %filepath
%.tmp2893 = load i32, i32* @O_RDONLY
%.tmp2894 = call i32(i8*,i32) @open(i8* %.tmp2892, i32 %.tmp2893)
%input_fd.2895 = alloca i32
store i32 %.tmp2894, i32* %input_fd.2895
%.tmp2896 = load i32, i32* %input_fd.2895
%.tmp2897 = icmp sle i32 %.tmp2896, 0
br i1 %.tmp2897, label %.if.true.2898, label %.if.false.2898
.if.true.2898:
%err_msg.2899 = alloca i8*
store i8* null, i8** %err_msg.2899
%.tmp2900 = getelementptr i8*, i8** %err_msg.2899, i32 0
%.tmp2902 = getelementptr [26 x i8], [26 x i8]*@.str2901, i32 0, i32 0
%.tmp2903 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp2904 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2900, i8* %.tmp2902, %m878$.Node.type* %.tmp2903)
%.tmp2905 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2906 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp2907 = load i8*, i8** %err_msg.2899
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp2905, %m878$.Node.type* %.tmp2906, i8* %.tmp2907)
ret i1 0
br label %.if.end.2898
.if.false.2898:
br label %.if.end.2898
.if.end.2898:
%.tmp2908 = load i32, i32* %input_fd.2895
%.tmp2909 = call %m298$.PeekerInfo.type*(i32) @m298$new.m298$.PeekerInfo.typep.i(i32 %.tmp2908)
%p.2910 = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.tmp2909, %m298$.PeekerInfo.type** %p.2910
%.tmp2911 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.2910
%.tmp2912 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp2911, i32 0, i32 6
%.tmp2913 = load i8*, i8** %filepath
store i8* %.tmp2913, i8** %.tmp2912
%.tmp2914 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.2910
%.tmp2915 = call %m297$.Token.type*(%m298$.PeekerInfo.type*,i1) @m297$tokenize.m297$.Token.typep.m298$.PeekerInfo.typep.b(%m298$.PeekerInfo.type* %.tmp2914, i1 0)
%tokens.2916 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp2915, %m297$.Token.type** %tokens.2916
%.tmp2917 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2918 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2917, i32 0, i32 4
%.tmp2919 = load %m878$.Rule.type**, %m878$.Rule.type*** %.tmp2918
%.tmp2921 = getelementptr [6 x i8], [6 x i8]*@.str2920, i32 0, i32 0
%.tmp2922 = load %m297$.Token.type*, %m297$.Token.type** %tokens.2916
%.tmp2923 = call %m878$.ParseResult.type*(%m878$.Rule.type**,i8*,%m297$.Token.type*) @m878$ast.m878$.ParseResult.typep.m878$.Rule.typepp.cp.m297$.Token.typep(%m878$.Rule.type** %.tmp2919, i8* %.tmp2921, %m297$.Token.type* %.tmp2922)
%ast.2924 = alloca %m878$.ParseResult.type*
store %m878$.ParseResult.type* %.tmp2923, %m878$.ParseResult.type** %ast.2924
%.tmp2925 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %ast.2924
%.tmp2926 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp2925, i32 0, i32 0
%.tmp2927 = load %m296$.Error.type*, %m296$.Error.type** %.tmp2926
%.tmp2928 = icmp ne %m296$.Error.type* %.tmp2927, null
br i1 %.tmp2928, label %.if.true.2929, label %.if.false.2929
.if.true.2929:
%.tmp2930 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2931 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %ast.2924
%.tmp2932 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp2931, i32 0, i32 0
%.tmp2933 = load %m296$.Error.type*, %m296$.Error.type** %.tmp2932
call void(%m2503$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2503$.CompilerCtx.typep.m296$.Error.typep(%m2503$.CompilerCtx.type* %.tmp2930, %m296$.Error.type* %.tmp2933)
br label %.if.end.2929
.if.false.2929:
br label %.if.end.2929
.if.end.2929:
%.tmp2934 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2935 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %ast.2924
%.tmp2936 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp2935, i32 0, i32 1
%.tmp2937 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2936
%.tmp2938 = call i1(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile.b.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp2934, %m878$.Node.type* %.tmp2937)
ret i1 %.tmp2938
}
define i1 @m295$compile.b.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.ast.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%ast = alloca %m878$.Node.type*
store %m878$.Node.type* %.ast.arg, %m878$.Node.type** %ast
%.tmp2939 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2940 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2939, i32 0, i32 2
%.tmp2941 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp2940
%.tmp2942 = icmp eq %m2503$.ErrorList.type* %.tmp2941, null
br i1 %.tmp2942, label %.if.true.2943, label %.if.false.2943
.if.true.2943:
%.tmp2944 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2945 = load %m878$.Node.type*, %m878$.Node.type** %ast
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_ast.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp2944, %m878$.Node.type* %.tmp2945)
br label %.if.end.2943
.if.false.2943:
br label %.if.end.2943
.if.end.2943:
%.tmp2946 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2947 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2946, i32 0, i32 2
%.tmp2948 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp2947
%.tmp2949 = icmp ne %m2503$.ErrorList.type* %.tmp2948, null
br i1 %.tmp2949, label %.if.true.2950, label %.if.false.2950
.if.true.2950:
%.tmp2952 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2953 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2952, i32 0, i32 2
%.tmp2954 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp2953
%err.2955 = alloca %m2503$.ErrorList.type*
store %m2503$.ErrorList.type* %.tmp2954, %m2503$.ErrorList.type** %err.2955
br label %.for.start.2951
.for.start.2951:
%.tmp2956 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %err.2955
%.tmp2957 = icmp ne %m2503$.ErrorList.type* %.tmp2956, null
br i1 %.tmp2957, label %.for.continue.2951, label %.for.end.2951
.for.continue.2951:
%.tmp2958 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %err.2955
%.tmp2959 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp2958, i32 0, i32 2
%.tmp2960 = load i1, i1* %.tmp2959
%.tmp2961 = icmp eq i1 %.tmp2960, 0
br i1 %.tmp2961, label %.if.true.2962, label %.if.false.2962
.if.true.2962:
%.tmp2963 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %err.2955
%.tmp2964 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp2963, i32 0, i32 0
%.tmp2965 = load %m296$.Error.type*, %m296$.Error.type** %.tmp2964
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp2965)
%.tmp2966 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %err.2955
%.tmp2967 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp2966, i32 0, i32 2
store i1 1, i1* %.tmp2967
br label %.if.end.2962
.if.false.2962:
br label %.if.end.2962
.if.end.2962:
%.tmp2968 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %err.2955
%.tmp2969 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp2968, i32 0, i32 1
%.tmp2970 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp2969
store %m2503$.ErrorList.type* %.tmp2970, %m2503$.ErrorList.type** %err.2955
br label %.for.start.2951
.for.end.2951:
ret i1 1
br label %.if.end.2950
.if.false.2950:
br label %.if.end.2950
.if.end.2950:
ret i1 0
}
define void @m295$mark_weak_global.v.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2972 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2973 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2972, i32 0, i32 3
%.tmp2974 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp2973
%g.2975 = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.tmp2974, %m2503$.GlobalName.type** %g.2975
br label %.for.start.2971
.for.start.2971:
%.tmp2976 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.2975
%.tmp2977 = icmp ne %m2503$.GlobalName.type* %.tmp2976, null
br i1 %.tmp2977, label %.for.continue.2971, label %.for.end.2971
.for.continue.2971:
%.tmp2978 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.2975
%.tmp2979 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp2978, i32 0, i32 3
%.tmp2980 = load i1, i1* %.tmp2979
%.tmp2981 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.2975
%.tmp2982 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp2981, i32 0, i32 0
%.tmp2983 = load i8*, i8** %.tmp2982
%.tmp2984 = load i8*, i8** %id
%.tmp2985 = call i32(i8*,i8*) @strcmp(i8* %.tmp2983, i8* %.tmp2984)
%.tmp2986 = icmp eq i32 %.tmp2985, 0
%.tmp2987 = and i1 %.tmp2980, %.tmp2986
br i1 %.tmp2987, label %.if.true.2988, label %.if.false.2988
.if.true.2988:
%.tmp2989 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.2975
%.tmp2990 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp2989, i32 0, i32 2
store i1 1, i1* %.tmp2990
br label %.for.end.2971
br label %.if.end.2988
.if.false.2988:
br label %.if.end.2988
.if.end.2988:
%.tmp2991 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.2975
%.tmp2992 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp2991, i32 0, i32 5
%.tmp2993 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp2992
store %m2503$.GlobalName.type* %.tmp2993, %m2503$.GlobalName.type** %g.2975
br label %.for.start.2971
.for.end.2971:
ret void
}
define void @m295$compile_ast.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.ast.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%ast = alloca %m878$.Node.type*
store %m878$.Node.type* %.ast.arg, %m878$.Node.type** %ast
%.tmp2994 = load %m878$.Node.type*, %m878$.Node.type** %ast
%.tmp2995 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2994, i32 0, i32 0
%.tmp2996 = load i8*, i8** %.tmp2995
%.tmp2998 = getelementptr [6 x i8], [6 x i8]*@.str2997, i32 0, i32 0
%.tmp2999 = call i32(i8*,i8*) @strcmp(i8* %.tmp2996, i8* %.tmp2998)
%.tmp3000 = icmp ne i32 %.tmp2999, 0
br i1 %.tmp3000, label %.if.true.3001, label %.if.false.3001
.if.true.3001:
%.tmp3002 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3003 = load %m878$.Node.type*, %m878$.Node.type** %ast
%.tmp3005 = getelementptr [29 x i8], [29 x i8]*@.str3004, i32 0, i32 0
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp3002, %m878$.Node.type* %.tmp3003, i8* %.tmp3005)
ret void
br label %.if.end.3001
.if.false.3001:
br label %.if.end.3001
.if.end.3001:
%.tmp3006 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3008 = getelementptr [7 x i8], [7 x i8]*@.str3007, i32 0, i32 0
%.tmp3009 = bitcast ptr null to i8*
%.tmp3010 = bitcast ptr null to i8*
call void(%m2503$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2503$.CompilerCtx.typep.cp.cp.cp(%m2503$.CompilerCtx.type* %.tmp3006, i8* %.tmp3008, i8* %.tmp3009, i8* %.tmp3010)
%.tmp3011 = load %m878$.Node.type*, %m878$.Node.type** %ast
%.tmp3012 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3011, i32 0, i32 6
%.tmp3013 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3012
%start.3014 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3013, %m878$.Node.type** %start.3014
%.tmp3015 = load %m878$.Node.type*, %m878$.Node.type** %start.3014
%.tmp3016 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3015, i32 0, i32 0
%.tmp3017 = load i8*, i8** %.tmp3016
%.tmp3019 = getelementptr [13 x i8], [13 x i8]*@.str3018, i32 0, i32 0
%.tmp3020 = call i32(i8*,i8*) @strcmp(i8* %.tmp3017, i8* %.tmp3019)
%.tmp3021 = icmp eq i32 %.tmp3020, 0
br i1 %.tmp3021, label %.if.true.3022, label %.if.false.3022
.if.true.3022:
%.tmp3023 = load %m878$.Node.type*, %m878$.Node.type** %start.3014
%.tmp3024 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3023, i32 0, i32 7
%.tmp3025 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3024
store %m878$.Node.type* %.tmp3025, %m878$.Node.type** %start.3014
br label %.if.end.3022
.if.false.3022:
br label %.if.end.3022
.if.end.3022:
%.tmp3027 = load %m878$.Node.type*, %m878$.Node.type** %start.3014
%stmt.3028 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3027, %m878$.Node.type** %stmt.3028
br label %.for.start.3026
.for.start.3026:
%.tmp3029 = load %m878$.Node.type*, %m878$.Node.type** %stmt.3028
%.tmp3030 = icmp ne %m878$.Node.type* %.tmp3029, null
br i1 %.tmp3030, label %.for.continue.3026, label %.for.end.3026
.for.continue.3026:
%.tmp3031 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3032 = load %m878$.Node.type*, %m878$.Node.type** %stmt.3028
%.tmp3033 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3032, i32 0, i32 6
%.tmp3034 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3033
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i1) @m295$compile_statement.v.m2503$.CompilerCtx.typep.m878$.Node.typep.b(%m2503$.CompilerCtx.type* %.tmp3031, %m878$.Node.type* %.tmp3034, i1 1)
%.tmp3035 = load %m878$.Node.type*, %m878$.Node.type** %stmt.3028
%.tmp3036 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3035, i32 0, i32 7
%.tmp3037 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3036
store %m878$.Node.type* %.tmp3037, %m878$.Node.type** %stmt.3028
br label %.for.start.3026
.for.end.3026:
%.tmp3039 = load %m878$.Node.type*, %m878$.Node.type** %start.3014
%s.3040 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3039, %m878$.Node.type** %s.3040
br label %.for.start.3038
.for.start.3038:
%.tmp3041 = load %m878$.Node.type*, %m878$.Node.type** %s.3040
%.tmp3042 = icmp ne %m878$.Node.type* %.tmp3041, null
br i1 %.tmp3042, label %.for.continue.3038, label %.for.end.3038
.for.continue.3038:
%.tmp3043 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3044 = load %m878$.Node.type*, %m878$.Node.type** %s.3040
%.tmp3045 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3044, i32 0, i32 6
%.tmp3046 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3045
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i1) @m295$compile_statement.v.m2503$.CompilerCtx.typep.m878$.Node.typep.b(%m2503$.CompilerCtx.type* %.tmp3043, %m878$.Node.type* %.tmp3046, i1 0)
%.tmp3047 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
call void(%m2503$.CompilerCtx.type*) @m295$compile_anon_fn.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3047)
%.tmp3048 = load %m878$.Node.type*, %m878$.Node.type** %s.3040
%.tmp3049 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3048, i32 0, i32 7
%.tmp3050 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3049
store %m878$.Node.type* %.tmp3050, %m878$.Node.type** %s.3040
br label %.for.start.3038
.for.end.3038:
%.tmp3051 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3052 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3051)
%mod.3053 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp3052, %m2503$.ModuleLookup.type** %mod.3053
%.tmp3054 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3053
%.tmp3055 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3054, i32 0, i32 1
%.tmp3056 = load i8*, i8** %.tmp3055
%.tmp3058 = getelementptr [1 x i8], [1 x i8]*@.str3057, i32 0, i32 0
%.tmp3059 = call i32(i8*,i8*) @strcmp(i8* %.tmp3056, i8* %.tmp3058)
%.tmp3060 = icmp eq i32 %.tmp3059, 0
br i1 %.tmp3060, label %.if.true.3061, label %.if.false.3061
.if.true.3061:
%.tmp3063 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3064 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3063, i32 0, i32 3
%.tmp3065 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp3064
%g.3066 = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.tmp3065, %m2503$.GlobalName.type** %g.3066
br label %.for.start.3062
.for.start.3062:
%.tmp3067 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.3066
%.tmp3068 = icmp ne %m2503$.GlobalName.type* %.tmp3067, null
br i1 %.tmp3068, label %.for.continue.3062, label %.for.end.3062
.for.continue.3062:
%.tmp3069 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3070 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.3066
call void(%m2503$.CompilerCtx.type*,%m2503$.GlobalName.type*) @m295$compile_global.v.m2503$.CompilerCtx.typep.m2503$.GlobalName.typep(%m2503$.CompilerCtx.type* %.tmp3069, %m2503$.GlobalName.type* %.tmp3070)
%.tmp3071 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.3066
%.tmp3072 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3071, i32 0, i32 5
%.tmp3073 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp3072
store %m2503$.GlobalName.type* %.tmp3073, %m2503$.GlobalName.type** %g.3066
br label %.for.start.3062
.for.end.3062:
br label %.if.end.3061
.if.false.3061:
br label %.if.end.3061
.if.end.3061:
ret void
}
define void @m295$compile_global.v.m2503$.CompilerCtx.typep.m2503$.GlobalName.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%g = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.g.arg, %m2503$.GlobalName.type** %g
%.tmp3074 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3075 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3074, i32 0, i32 2
%.tmp3076 = load i1, i1* %.tmp3075
br i1 %.tmp3076, label %.if.true.3077, label %.if.false.3077
.if.true.3077:
ret void
br label %.if.end.3077
.if.false.3077:
br label %.if.end.3077
.if.end.3077:
%.tmp3078 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3079 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3078, i32 0, i32 1
%.tmp3080 = load i8*, i8** %.tmp3079
%.tmp3082 = getelementptr [7 x i8], [7 x i8]*@.str3081, i32 0, i32 0
%.tmp3083 = call i32(i8*,i8*) @strcmp(i8* %.tmp3080, i8* %.tmp3082)
%.tmp3084 = icmp eq i32 %.tmp3083, 0
br i1 %.tmp3084, label %.if.true.3085, label %.if.false.3085
.if.true.3085:
%.tmp3086 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3087 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3086, i32 0, i32 1
%.tmp3088 = load %m0$.File.type*, %m0$.File.type** %.tmp3087
%.tmp3090 = getelementptr [21 x i8], [21 x i8]*@.str3089, i32 0, i32 0
%.tmp3091 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3092 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3091, i32 0, i32 4
%.tmp3093 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp3092
%.tmp3094 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3093)
%.tmp3095 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3096 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3097 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3096, i32 0, i32 4
%.tmp3098 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp3097
%.tmp3099 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3098, i32 0, i32 4
%.tmp3100 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3099
%.tmp3101 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3095, %m2503$.Type.type* %.tmp3100)
%.tmp3102 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3103 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3102, i32 0, i32 0
%.tmp3104 = load i8*, i8** %.tmp3103
%.tmp3105 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3088, i8* %.tmp3090, i8* %.tmp3094, i8* %.tmp3101, i8* %.tmp3104)
br label %.if.end.3085
.if.false.3085:
%.tmp3106 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3107 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3106, i32 0, i32 1
%.tmp3108 = load i8*, i8** %.tmp3107
%.tmp3110 = getelementptr [7 x i8], [7 x i8]*@.str3109, i32 0, i32 0
%.tmp3111 = call i32(i8*,i8*) @strcmp(i8* %.tmp3108, i8* %.tmp3110)
%.tmp3112 = icmp eq i32 %.tmp3111, 0
br i1 %.tmp3112, label %.if.true.3113, label %.if.false.3113
.if.true.3113:
%.tmp3114 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3115 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3116 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3115, i32 0, i32 4
%.tmp3117 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp3116
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$compile_extern.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3114, %m2503$.AssignableInfo.type* %.tmp3117)
br label %.if.end.3113
.if.false.3113:
br label %.if.end.3113
.if.end.3113:
br label %.if.end.3085
.if.end.3085:
%.tmp3118 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3119 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3118, i32 0, i32 2
store i1 1, i1* %.tmp3119
ret void
}
define void @m295$compile_extern.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%info = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.info.arg, %m2503$.AssignableInfo.type** %info
%.tmp3120 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3121 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3120, i32 0, i32 1
%.tmp3122 = load %m0$.File.type*, %m0$.File.type** %.tmp3121
%.tmp3124 = getelementptr [15 x i8], [15 x i8]*@.str3123, i32 0, i32 0
%.tmp3125 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3126 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp3127 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3126, i32 0, i32 4
%.tmp3128 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3127
%.tmp3129 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3128, i32 0, i32 3
%.tmp3130 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3129
%.tmp3131 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3125, %m2503$.Type.type* %.tmp3130)
%.tmp3132 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp3133 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3132)
%.tmp3134 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3122, i8* %.tmp3124, i8* %.tmp3131, i8* %.tmp3133)
%.tmp3136 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp3137 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3136, i32 0, i32 4
%.tmp3138 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3137
%.tmp3139 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3138, i32 0, i32 3
%.tmp3140 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3139
%.tmp3141 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3140, i32 0, i32 4
%.tmp3142 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3141
%pt.3143 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp3142, %m2503$.Type.type** %pt.3143
br label %.for.start.3135
.for.start.3135:
%.tmp3144 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.3143
%.tmp3145 = icmp ne %m2503$.Type.type* %.tmp3144, null
br i1 %.tmp3145, label %.for.continue.3135, label %.for.end.3135
.for.continue.3135:
%.tmp3146 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.3143
%.tmp3147 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp3148 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3147, i32 0, i32 4
%.tmp3149 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3148
%.tmp3150 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3149, i32 0, i32 3
%.tmp3151 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3150
%.tmp3152 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3151, i32 0, i32 4
%.tmp3153 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3152
%.tmp3154 = icmp ne %m2503$.Type.type* %.tmp3146, %.tmp3153
br i1 %.tmp3154, label %.if.true.3155, label %.if.false.3155
.if.true.3155:
%.tmp3156 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3157 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3156, i32 0, i32 1
%.tmp3158 = load %m0$.File.type*, %m0$.File.type** %.tmp3157
%.tmp3160 = getelementptr [3 x i8], [3 x i8]*@.str3159, i32 0, i32 0
%.tmp3161 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3158, i8* %.tmp3160)
br label %.if.end.3155
.if.false.3155:
br label %.if.end.3155
.if.end.3155:
%.tmp3162 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3163 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3162, i32 0, i32 1
%.tmp3164 = load %m0$.File.type*, %m0$.File.type** %.tmp3163
%.tmp3166 = getelementptr [3 x i8], [3 x i8]*@.str3165, i32 0, i32 0
%.tmp3167 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3168 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.3143
%.tmp3169 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3167, %m2503$.Type.type* %.tmp3168)
%.tmp3170 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3164, i8* %.tmp3166, i8* %.tmp3169)
%.tmp3171 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.3143
%.tmp3172 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3171, i32 0, i32 4
%.tmp3173 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3172
store %m2503$.Type.type* %.tmp3173, %m2503$.Type.type** %pt.3143
br label %.for.start.3135
.for.end.3135:
%.tmp3174 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3175 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3174, i32 0, i32 1
%.tmp3176 = load %m0$.File.type*, %m0$.File.type** %.tmp3175
%.tmp3178 = getelementptr [3 x i8], [3 x i8]*@.str3177, i32 0, i32 0
%.tmp3179 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3176, i8* %.tmp3178)
ret void
}
define i8* @m295$get_mod_prefix.cp.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3180 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3181 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3180)
%m.3182 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp3181, %m2503$.ModuleLookup.type** %m.3182
%.tmp3183 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3182
%.tmp3184 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3183, i32 0, i32 1
%.tmp3185 = load i8*, i8** %.tmp3184
ret i8* %.tmp3185
}
define i8* @m295$name_mangle.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.fn.arg, i8* %.original_name.arg, %m2503$.Type.type* %.type.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%fn = alloca %m878$.Node.type*
store %m878$.Node.type* %.fn.arg, %m878$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.type.arg, %m2503$.Type.type** %type
%mangled_name.3186 = alloca i8*
store i8* null, i8** %mangled_name.3186
%.tmp3187 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3188 = load %m878$.Node.type*, %m878$.Node.type** %fn
%.tmp3189 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3188, i32 0, i32 2
%.tmp3190 = load i8*, i8** %.tmp3189
%.tmp3191 = call i8*(%m2503$.CompilerCtx.type*,i8*) @m295$get_mod_prefix.cp.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.tmp3187, i8* %.tmp3190)
%prefix.3192 = alloca i8*
store i8* %.tmp3191, i8** %prefix.3192
%.tmp3193 = getelementptr i8*, i8** %mangled_name.3186, i32 0
%.tmp3195 = getelementptr [5 x i8], [5 x i8]*@.str3194, i32 0, i32 0
%.tmp3196 = load i8*, i8** %prefix.3192
%.tmp3197 = load i8*, i8** %original_name
%.tmp3198 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3193, i8* %.tmp3195, i8* %.tmp3196, i8* %.tmp3197)
%.tmp3199 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp3200 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3199, i32 0, i32 0
%.tmp3201 = load i8*, i8** %.tmp3200
%.tmp3203 = getelementptr [9 x i8], [9 x i8]*@.str3202, i32 0, i32 0
%.tmp3204 = call i32(i8*,i8*) @strcmp(i8* %.tmp3201, i8* %.tmp3203)
%.tmp3205 = icmp eq i32 %.tmp3204, 0
br i1 %.tmp3205, label %.if.true.3206, label %.if.false.3206
.if.true.3206:
%.tmp3207 = load i8*, i8** %mangled_name.3186
%.tmp3209 = getelementptr [5 x i8], [5 x i8]*@.str3208, i32 0, i32 0
%.tmp3210 = call i32(i8*,i8*) @strcmp(i8* %.tmp3207, i8* %.tmp3209)
%.tmp3211 = icmp ne i32 %.tmp3210, 0
br i1 %.tmp3211, label %.if.true.3212, label %.if.false.3212
.if.true.3212:
%tmp_buff.3213 = alloca i8*
store i8* null, i8** %tmp_buff.3213
%swap_var.3214 = alloca i8*
store i8* null, i8** %swap_var.3214
%.tmp3216 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp3217 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3216, i32 0, i32 3
%.tmp3218 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3217
%tp.3219 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp3218, %m2503$.Type.type** %tp.3219
br label %.for.start.3215
.for.start.3215:
%.tmp3220 = load %m2503$.Type.type*, %m2503$.Type.type** %tp.3219
%.tmp3221 = icmp ne %m2503$.Type.type* %.tmp3220, null
br i1 %.tmp3221, label %.for.continue.3215, label %.for.end.3215
.for.continue.3215:
%.tmp3222 = getelementptr i8*, i8** %tmp_buff.3213, i32 0
%.tmp3224 = getelementptr [6 x i8], [6 x i8]*@.str3223, i32 0, i32 0
%.tmp3225 = load i8*, i8** %mangled_name.3186
%.tmp3226 = load %m2503$.Type.type*, %m2503$.Type.type** %tp.3219
%.tmp3227 = call i8*(%m2503$.Type.type*) @m295$type_abbr.cp.m2503$.Type.typep(%m2503$.Type.type* %.tmp3226)
%.tmp3228 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3222, i8* %.tmp3224, i8* %.tmp3225, i8* %.tmp3227)
%.tmp3229 = load i8*, i8** %tmp_buff.3213
store i8* %.tmp3229, i8** %swap_var.3214
%.tmp3230 = load i8*, i8** %mangled_name.3186
store i8* %.tmp3230, i8** %tmp_buff.3213
%.tmp3231 = load i8*, i8** %swap_var.3214
store i8* %.tmp3231, i8** %mangled_name.3186
%.tmp3232 = load i8*, i8** %tmp_buff.3213
call void(i8*) @free(i8* %.tmp3232)
%.tmp3233 = load %m2503$.Type.type*, %m2503$.Type.type** %tp.3219
%.tmp3234 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3233, i32 0, i32 4
%.tmp3235 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3234
store %m2503$.Type.type* %.tmp3235, %m2503$.Type.type** %tp.3219
br label %.for.start.3215
.for.end.3215:
br label %.if.end.3212
.if.false.3212:
br label %.if.end.3212
.if.end.3212:
br label %.if.end.3206
.if.false.3206:
br label %.if.end.3206
.if.end.3206:
%.tmp3236 = load i8*, i8** %mangled_name.3186
ret i8* %.tmp3236
}
define void @m295$compile_statement.v.m2503$.CompilerCtx.typep.m878$.Node.typep.b(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3237 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* null, %m2503$.AssignableInfo.type** %info.3237
%return_type.3238 = alloca %m2503$.Type.type*
store %m2503$.Type.type* null, %m2503$.Type.type** %return_type.3238
%err_buf.3239 = alloca i8*
store i8* null, i8** %err_buf.3239
%tmp_buff.3240 = alloca i8*
store i8* null, i8** %tmp_buff.3240
%.tmp3241 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3242 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3241, i32 0, i32 0
%.tmp3243 = load i8*, i8** %.tmp3242
%.tmp3245 = getelementptr [3 x i8], [3 x i8]*@.str3244, i32 0, i32 0
%.tmp3246 = call i32(i8*,i8*) @strcmp(i8* %.tmp3243, i8* %.tmp3245)
%.tmp3247 = icmp eq i32 %.tmp3246, 0
br i1 %.tmp3247, label %.if.true.3248, label %.if.false.3248
.if.true.3248:
ret void
br label %.if.end.3248
.if.false.3248:
%.tmp3249 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3250 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3249, i32 0, i32 0
%.tmp3251 = load i8*, i8** %.tmp3250
%.tmp3253 = getelementptr [7 x i8], [7 x i8]*@.str3252, i32 0, i32 0
%.tmp3254 = call i32(i8*,i8*) @strcmp(i8* %.tmp3251, i8* %.tmp3253)
%.tmp3255 = icmp eq i32 %.tmp3254, 0
br i1 %.tmp3255, label %.if.true.3256, label %.if.false.3256
.if.true.3256:
%.tmp3257 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3258 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3257, i32 0, i32 6
%.tmp3259 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3258
%.tmp3261 = getelementptr [11 x i8], [11 x i8]*@.str3260, i32 0, i32 0
%.tmp3262 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp3259, i8* %.tmp3261)
%assignable.3263 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3262, %m878$.Node.type** %assignable.3263
%.tmp3264 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3265 = load %m878$.Node.type*, %m878$.Node.type** %assignable.3263
%.tmp3266 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3264, %m878$.Node.type* %.tmp3265)
%a_info.3267 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp3266, %m2503$.AssignableInfo.type** %a_info.3267
%.tmp3268 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.3267
%.tmp3269 = icmp eq %m2503$.AssignableInfo.type* %.tmp3268, null
br i1 %.tmp3269, label %.if.true.3270, label %.if.false.3270
.if.true.3270:
ret void
br label %.if.end.3270
.if.false.3270:
br label %.if.end.3270
.if.end.3270:
%.tmp3271 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3272 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3271)
store %m2503$.AssignableInfo.type* %.tmp3272, %m2503$.AssignableInfo.type** %info.3237
%.tmp3273 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3274 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3273, i32 0, i32 6
%.tmp3275 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3274
%.tmp3276 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3275, i32 0, i32 7
%.tmp3277 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3276
%.tmp3278 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3277, i32 0, i32 1
%.tmp3279 = load i8*, i8** %.tmp3278
%global_name.3280 = alloca i8*
store i8* %.tmp3279, i8** %global_name.3280
%.tmp3281 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3282 = load i8, i8* @SCOPE_GLOBAL
%.tmp3283 = load i8*, i8** %global_name.3280
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp3281, i8 %.tmp3282, i8* %.tmp3283)
%.tmp3284 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3285 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3284, i32 0, i32 4
%.tmp3286 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.3267
%.tmp3287 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3286, i32 0, i32 4
%.tmp3288 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3287
store %m2503$.Type.type* %.tmp3288, %m2503$.Type.type** %.tmp3285
%.tmp3289 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3290 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3289, i32 0, i32 3
%.tmp3292 = getelementptr [9 x i8], [9 x i8]*@.str3291, i32 0, i32 0
store i8* %.tmp3292, i8** %.tmp3290
%.tmp3293 = load i1, i1* %shallow
%.tmp3294 = icmp eq i1 %.tmp3293, 1
br i1 %.tmp3294, label %.if.true.3295, label %.if.false.3295
.if.true.3295:
%.tmp3296 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3297 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3298 = load i8*, i8** %global_name.3280
%.tmp3299 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3296, %m878$.Node.type* %.tmp3297, i8* %.tmp3298, %m2503$.AssignableInfo.type* %.tmp3299)
br label %.if.end.3295
.if.false.3295:
%.tmp3300 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3301 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3300, i32 0, i32 1
%.tmp3302 = load %m0$.File.type*, %m0$.File.type** %.tmp3301
%.tmp3304 = getelementptr [21 x i8], [21 x i8]*@.str3303, i32 0, i32 0
%.tmp3305 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3306 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3305)
%.tmp3307 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3308 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3309 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3308, i32 0, i32 4
%.tmp3310 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3309
%.tmp3311 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3307, %m2503$.Type.type* %.tmp3310)
%.tmp3312 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.3267
%.tmp3313 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3312)
%.tmp3314 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3302, i8* %.tmp3304, i8* %.tmp3306, i8* %.tmp3311, i8* %.tmp3313)
br label %.if.end.3295
.if.end.3295:
br label %.if.end.3256
.if.false.3256:
%.tmp3315 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3316 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3315, i32 0, i32 0
%.tmp3317 = load i8*, i8** %.tmp3316
%.tmp3319 = getelementptr [10 x i8], [10 x i8]*@.str3318, i32 0, i32 0
%.tmp3320 = call i32(i8*,i8*) @strcmp(i8* %.tmp3317, i8* %.tmp3319)
%.tmp3321 = icmp eq i32 %.tmp3320, 0
br i1 %.tmp3321, label %.if.true.3322, label %.if.false.3322
.if.true.3322:
%.tmp3323 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3324 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3323, i32 0, i32 6
%.tmp3325 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3324
%.tmp3326 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3325, i32 0, i32 7
%.tmp3327 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3326
%.tmp3328 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3327, i32 0, i32 1
%.tmp3329 = load i8*, i8** %.tmp3328
%type_name.3330 = alloca i8*
store i8* %.tmp3329, i8** %type_name.3330
%.tmp3331 = load i1, i1* %shallow
%.tmp3332 = icmp eq i1 %.tmp3331, 1
br i1 %.tmp3332, label %.if.true.3333, label %.if.false.3333
.if.true.3333:
%.tmp3334 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3335 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3334)
store %m2503$.AssignableInfo.type* %.tmp3335, %m2503$.AssignableInfo.type** %info.3237
%.tmp3336 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3337 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3336)
%mod_from.3338 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp3337, %m2503$.ModuleLookup.type** %mod_from.3338
%.tmp3339 = getelementptr i8*, i8** %tmp_buff.3240, i32 0
%.tmp3341 = getelementptr [11 x i8], [11 x i8]*@.str3340, i32 0, i32 0
%.tmp3342 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod_from.3338
%.tmp3343 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3342, i32 0, i32 1
%.tmp3344 = load i8*, i8** %.tmp3343
%.tmp3345 = load i8*, i8** %type_name.3330
%.tmp3346 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3339, i8* %.tmp3341, i8* %.tmp3344, i8* %.tmp3345)
%.tmp3347 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3348 = load i8, i8* @SCOPE_LOCAL
%.tmp3349 = load i8*, i8** %tmp_buff.3240
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp3347, i8 %.tmp3348, i8* %.tmp3349)
%.tmp3350 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3351 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3350, i32 0, i32 3
%.tmp3353 = getelementptr [10 x i8], [10 x i8]*@.str3352, i32 0, i32 0
store i8* %.tmp3353, i8** %.tmp3351
%.tmp3354 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3355 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3354, i32 0, i32 5
%.tmp3356 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3357 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3356, i32 0, i32 3
%.tmp3358 = load i32, i32* %.tmp3357
store i32 %.tmp3358, i32* %.tmp3355
%.tmp3359 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3360 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3359, i32 0, i32 6
%.tmp3361 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3362 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3361, i32 0, i32 4
%.tmp3363 = load i32, i32* %.tmp3362
store i32 %.tmp3363, i32* %.tmp3360
%.tmp3364 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3365 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3364, i32 0, i32 4
%.tmp3366 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp3366, %m2503$.Type.type** %.tmp3365
%.tmp3367 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3368 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3369 = load i8*, i8** %type_name.3330
%.tmp3370 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3367, %m878$.Node.type* %.tmp3368, i8* %.tmp3369, %m2503$.AssignableInfo.type* %.tmp3370)
%.tmp3371 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3372 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3371, i32 0, i32 6
%.tmp3373 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3372
%.tmp3375 = getelementptr [5 x i8], [5 x i8]*@.str3374, i32 0, i32 0
%.tmp3376 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp3373, i8* %.tmp3375)
%type_decl.3377 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3376, %m878$.Node.type** %type_decl.3377
%.tmp3378 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3379 = load %m878$.Node.type*, %m878$.Node.type** %type_decl.3377
%.tmp3380 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3379, i32 0, i32 6
%.tmp3381 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3380
%.tmp3382 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3378, %m878$.Node.type* %.tmp3381)
%type_struct.3383 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp3382, %m2503$.Type.type** %type_struct.3383
%.tmp3384 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3385 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3384, i32 0, i32 4
%.tmp3386 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3385
%.tmp3387 = load %m2503$.Type.type*, %m2503$.Type.type** %type_struct.3383
call void(%m2503$.Type.type*,%m2503$.Type.type*) @m295$copy_type.v.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp3386, %m2503$.Type.type* %.tmp3387)
%.tmp3388 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3389 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3388, i32 0, i32 4
%.tmp3390 = load %m2503$.Type.type*, %m2503$.Type.type** %type_struct.3383
store %m2503$.Type.type* %.tmp3390, %m2503$.Type.type** %.tmp3389
br label %.if.end.3333
.if.false.3333:
%.tmp3391 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3392 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3393 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3392, i32 0, i32 7
%.tmp3394 = load i8*, i8** %.tmp3393
%.tmp3395 = load i8*, i8** %type_name.3330
%.tmp3396 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.cp(%m2503$.CompilerCtx.type* %.tmp3391, i8* %.tmp3394, i8* %.tmp3395)
%scope.3397 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp3396, %m2503$.ScopeItem.type** %scope.3397
%.tmp3398 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %scope.3397
%.tmp3399 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp3398, i32 0, i32 1
%.tmp3400 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp3399
store %m2503$.AssignableInfo.type* %.tmp3400, %m2503$.AssignableInfo.type** %info.3237
%.tmp3401 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3402 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3401, i32 0, i32 1
%.tmp3403 = load %m0$.File.type*, %m0$.File.type** %.tmp3402
%.tmp3405 = getelementptr [14 x i8], [14 x i8]*@.str3404, i32 0, i32 0
%.tmp3406 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3407 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3406)
%.tmp3408 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3409 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3410 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3409, i32 0, i32 4
%.tmp3411 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3410
%.tmp3412 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3408, %m2503$.Type.type* %.tmp3411)
%.tmp3413 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3403, i8* %.tmp3405, i8* %.tmp3407, i8* %.tmp3412)
br label %.if.end.3333
.if.end.3333:
br label %.if.end.3322
.if.false.3322:
%.tmp3414 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3415 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3414, i32 0, i32 0
%.tmp3416 = load i8*, i8** %.tmp3415
%.tmp3418 = getelementptr [7 x i8], [7 x i8]*@.str3417, i32 0, i32 0
%.tmp3419 = call i32(i8*,i8*) @strcmp(i8* %.tmp3416, i8* %.tmp3418)
%.tmp3420 = icmp eq i32 %.tmp3419, 0
br i1 %.tmp3420, label %.if.true.3421, label %.if.false.3421
.if.true.3421:
%.tmp3422 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3423 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3422)
store %m2503$.AssignableInfo.type* %.tmp3423, %m2503$.AssignableInfo.type** %info.3237
%.tmp3424 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3425 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3424, i32 0, i32 4
%.tmp3426 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3427 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3428 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3427, i32 0, i32 6
%.tmp3429 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3428
%.tmp3430 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3429, i32 0, i32 7
%.tmp3431 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3430
%.tmp3432 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$syn_function_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3426, %m878$.Node.type* %.tmp3431)
store %m2503$.Type.type* %.tmp3432, %m2503$.Type.type** %.tmp3425
%.tmp3433 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3434 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3433, i32 0, i32 3
%.tmp3436 = getelementptr [7 x i8], [7 x i8]*@.str3435, i32 0, i32 0
store i8* %.tmp3436, i8** %.tmp3434
%.tmp3437 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3438 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3437, i32 0, i32 6
%.tmp3439 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3438
%.tmp3440 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3439, i32 0, i32 7
%.tmp3441 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3440
%.tmp3442 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3441, i32 0, i32 7
%.tmp3443 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3442
%.tmp3444 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3443, i32 0, i32 1
%.tmp3445 = load i8*, i8** %.tmp3444
%fn_name.3446 = alloca i8*
store i8* %.tmp3445, i8** %fn_name.3446
%.tmp3447 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3448 = load i8, i8* @SCOPE_GLOBAL
%.tmp3449 = load i8*, i8** %fn_name.3446
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp3447, i8 %.tmp3448, i8* %.tmp3449)
%.tmp3450 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp3450, %m2503$.Type.type** %return_type.3238
%.tmp3451 = load %m2503$.Type.type*, %m2503$.Type.type** %return_type.3238
%.tmp3452 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3451, i32 0, i32 0
%.tmp3453 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3454 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3453, i32 0, i32 4
%.tmp3455 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3454
%.tmp3456 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3455, i32 0, i32 3
%.tmp3457 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3456
%.tmp3458 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3457, i32 0, i32 0
%.tmp3459 = load i8*, i8** %.tmp3458
store i8* %.tmp3459, i8** %.tmp3452
%.tmp3460 = load %m2503$.Type.type*, %m2503$.Type.type** %return_type.3238
%.tmp3461 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3460, i32 0, i32 3
%.tmp3462 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3463 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3462, i32 0, i32 4
%.tmp3464 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3463
%.tmp3465 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3464, i32 0, i32 3
%.tmp3466 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3465
%.tmp3467 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3466, i32 0, i32 3
%.tmp3468 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3467
store %m2503$.Type.type* %.tmp3468, %m2503$.Type.type** %.tmp3461
%.tmp3469 = load i1, i1* %shallow
%.tmp3470 = icmp eq i1 %.tmp3469, 0
br i1 %.tmp3470, label %.if.true.3471, label %.if.false.3471
.if.true.3471:
%.tmp3472 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3473 = load i8*, i8** %fn_name.3446
call void(%m2503$.CompilerCtx.type*,i8*) @m295$mark_weak_global.v.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.tmp3472, i8* %.tmp3473)
%.tmp3474 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3475 = load i8*, i8** %fn_name.3446
%.tmp3477 = getelementptr [7 x i8], [7 x i8]*@.str3476, i32 0, i32 0
%.tmp3478 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
call void(%m2503$.CompilerCtx.type*,i8*,i8*,%m2503$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2503$.CompilerCtx.typep.cp.cp.m2503$.AssignableInfo.typep.b.b(%m2503$.CompilerCtx.type* %.tmp3474, i8* %.tmp3475, i8* %.tmp3477, %m2503$.AssignableInfo.type* %.tmp3478, i1 1, i1 1)
%.tmp3479 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3480 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$compile_extern.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3479, %m2503$.AssignableInfo.type* %.tmp3480)
br label %.if.end.3471
.if.false.3471:
%.tmp3481 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3482 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3483 = load i8*, i8** %fn_name.3446
%.tmp3484 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3481, %m878$.Node.type* %.tmp3482, i8* %.tmp3483, %m2503$.AssignableInfo.type* %.tmp3484)
br label %.if.end.3471
.if.end.3471:
br label %.if.end.3421
.if.false.3421:
%.tmp3485 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3486 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3485, i32 0, i32 0
%.tmp3487 = load i8*, i8** %.tmp3486
%.tmp3489 = getelementptr [9 x i8], [9 x i8]*@.str3488, i32 0, i32 0
%.tmp3490 = call i32(i8*,i8*) @strcmp(i8* %.tmp3487, i8* %.tmp3489)
%.tmp3491 = icmp eq i32 %.tmp3490, 0
br i1 %.tmp3491, label %.if.true.3492, label %.if.false.3492
.if.true.3492:
%.tmp3493 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3494 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3493)
store %m2503$.AssignableInfo.type* %.tmp3494, %m2503$.AssignableInfo.type** %info.3237
%.tmp3495 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3496 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3495, i32 0, i32 3
%.tmp3498 = getelementptr [9 x i8], [9 x i8]*@.str3497, i32 0, i32 0
store i8* %.tmp3498, i8** %.tmp3496
%.tmp3499 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3500 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3499, i32 0, i32 4
%.tmp3501 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3502 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3503 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3502, i32 0, i32 6
%.tmp3504 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3503
%.tmp3505 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$syn_function_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3501, %m878$.Node.type* %.tmp3504)
store %m2503$.Type.type* %.tmp3505, %m2503$.Type.type** %.tmp3500
%.tmp3506 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3507 = call i8*(%m878$.Node.type*) @m295$syn_function_name.cp.m878$.Node.typep(%m878$.Node.type* %.tmp3506)
%name.3508 = alloca i8*
store i8* %.tmp3507, i8** %name.3508
%.tmp3509 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3510 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3511 = load i8*, i8** %name.3508
%.tmp3512 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3513 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3512, i32 0, i32 4
%.tmp3514 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3513
%.tmp3515 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.Type.type*) @m295$name_mangle.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3509, %m878$.Node.type* %.tmp3510, i8* %.tmp3511, %m2503$.Type.type* %.tmp3514)
store i8* %.tmp3515, i8** %tmp_buff.3240
%.tmp3516 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3517 = load i8, i8* @SCOPE_GLOBAL
%.tmp3518 = load i8*, i8** %tmp_buff.3240
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp3516, i8 %.tmp3517, i8* %.tmp3518)
%.tmp3519 = load i1, i1* %shallow
%.tmp3520 = icmp eq i1 %.tmp3519, 1
br i1 %.tmp3520, label %.if.true.3521, label %.if.false.3521
.if.true.3521:
%.tmp3522 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3523 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3524 = load i8*, i8** %name.3508
%.tmp3525 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3522, %m878$.Node.type* %.tmp3523, i8* %.tmp3524, %m2503$.AssignableInfo.type* %.tmp3525)
br label %.if.end.3521
.if.false.3521:
%.tmp3526 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp3526, %m2503$.Type.type** %return_type.3238
%.tmp3527 = load %m2503$.Type.type*, %m2503$.Type.type** %return_type.3238
%.tmp3528 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3529 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3528, i32 0, i32 4
%.tmp3530 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3529
%.tmp3531 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3530, i32 0, i32 3
%.tmp3532 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3531
call void(%m2503$.Type.type*,%m2503$.Type.type*) @m295$copy_type.v.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp3527, %m2503$.Type.type* %.tmp3532)
%.tmp3533 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3534 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3533, i32 0, i32 1
%.tmp3535 = load %m0$.File.type*, %m0$.File.type** %.tmp3534
%.tmp3537 = getelementptr [14 x i8], [14 x i8]*@.str3536, i32 0, i32 0
%.tmp3538 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3539 = load %m2503$.Type.type*, %m2503$.Type.type** %return_type.3238
%.tmp3540 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3538, %m2503$.Type.type* %.tmp3539)
%.tmp3541 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3237
%.tmp3542 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3541)
%.tmp3543 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3535, i8* %.tmp3537, i8* %.tmp3540, i8* %.tmp3542)
%.tmp3544 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3545 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3544, i32 0, i32 6
%.tmp3546 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3545
%.tmp3547 = call %m878$.Node.type*(%m878$.Node.type*) @m295$syn_function_params.m878$.Node.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3546)
%params.3548 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3547, %m878$.Node.type** %params.3548
%param_type.3549 = alloca %m2503$.Type.type*
store %m2503$.Type.type* null, %m2503$.Type.type** %param_type.3549
%.tmp3551 = load %m878$.Node.type*, %m878$.Node.type** %params.3548
%param_ptr.3552 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3551, %m878$.Node.type** %param_ptr.3552
br label %.for.start.3550
.for.start.3550:
%.tmp3553 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3552
%.tmp3554 = icmp ne %m878$.Node.type* %.tmp3553, null
br i1 %.tmp3554, label %.for.continue.3550, label %.for.end.3550
.for.continue.3550:
%.tmp3555 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3552
%.tmp3556 = load %m878$.Node.type*, %m878$.Node.type** %params.3548
%.tmp3557 = icmp ne %m878$.Node.type* %.tmp3555, %.tmp3556
br i1 %.tmp3557, label %.if.true.3558, label %.if.false.3558
.if.true.3558:
%.tmp3559 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3552
%.tmp3560 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3559, i32 0, i32 7
%.tmp3561 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3560
store %m878$.Node.type* %.tmp3561, %m878$.Node.type** %param_ptr.3552
%.tmp3562 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3563 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3562, i32 0, i32 1
%.tmp3564 = load %m0$.File.type*, %m0$.File.type** %.tmp3563
%.tmp3566 = getelementptr [3 x i8], [3 x i8]*@.str3565, i32 0, i32 0
%.tmp3567 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3564, i8* %.tmp3566)
br label %.if.end.3558
.if.false.3558:
br label %.if.end.3558
.if.end.3558:
%.tmp3568 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3552
%.tmp3569 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3568, i32 0, i32 0
%.tmp3570 = load i8*, i8** %.tmp3569
%.tmp3572 = getelementptr [5 x i8], [5 x i8]*@.str3571, i32 0, i32 0
%.tmp3573 = call i32(i8*,i8*) @strcmp(i8* %.tmp3570, i8* %.tmp3572)
%.tmp3574 = icmp eq i32 %.tmp3573, 0
br i1 %.tmp3574, label %.if.true.3575, label %.if.false.3575
.if.true.3575:
%.tmp3576 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3577 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3552
%.tmp3578 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3577, i32 0, i32 6
%.tmp3579 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3578
%.tmp3580 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3576, %m878$.Node.type* %.tmp3579)
store %m2503$.Type.type* %.tmp3580, %m2503$.Type.type** %param_type.3549
%.tmp3581 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3552
%.tmp3582 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3581, i32 0, i32 7
%.tmp3583 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3582
store %m878$.Node.type* %.tmp3583, %m878$.Node.type** %param_ptr.3552
br label %.if.end.3575
.if.false.3575:
br label %.if.end.3575
.if.end.3575:
%.tmp3584 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3585 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3584, i32 0, i32 1
%.tmp3586 = load %m0$.File.type*, %m0$.File.type** %.tmp3585
%.tmp3588 = getelementptr [13 x i8], [13 x i8]*@.str3587, i32 0, i32 0
%.tmp3589 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3590 = load %m2503$.Type.type*, %m2503$.Type.type** %param_type.3549
%.tmp3591 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3589, %m2503$.Type.type* %.tmp3590)
%.tmp3592 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3552
%.tmp3593 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3592, i32 0, i32 1
%.tmp3594 = load i8*, i8** %.tmp3593
%.tmp3595 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3586, i8* %.tmp3588, i8* %.tmp3591, i8* %.tmp3594)
%.tmp3596 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3552
%.tmp3597 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3596, i32 0, i32 7
%.tmp3598 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3597
store %m878$.Node.type* %.tmp3598, %m878$.Node.type** %param_ptr.3552
br label %.for.start.3550
.for.end.3550:
%.tmp3599 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3600 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3599, i32 0, i32 1
%.tmp3601 = load %m0$.File.type*, %m0$.File.type** %.tmp3600
%.tmp3603 = getelementptr [5 x i8], [5 x i8]*@.str3602, i32 0, i32 0
%.tmp3604 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3601, i8* %.tmp3603)
%.tmp3605 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3607 = getelementptr [9 x i8], [9 x i8]*@.str3606, i32 0, i32 0
%.tmp3608 = bitcast ptr null to i8*
%.tmp3609 = bitcast ptr null to i8*
call void(%m2503$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2503$.CompilerCtx.typep.cp.cp.cp(%m2503$.CompilerCtx.type* %.tmp3605, i8* %.tmp3607, i8* %.tmp3608, i8* %.tmp3609)
%.tmp3610 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3611 = load %m878$.Node.type*, %m878$.Node.type** %params.3548
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_fn_params.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3610, %m878$.Node.type* %.tmp3611)
%.tmp3612 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3613 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3612, i32 0, i32 6
%.tmp3614 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3613
%.tmp3616 = getelementptr [6 x i8], [6 x i8]*@.str3615, i32 0, i32 0
%.tmp3617 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp3614, i8* %.tmp3616)
%fn_block.3618 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3617, %m878$.Node.type** %fn_block.3618
%.tmp3619 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3620 = load %m878$.Node.type*, %m878$.Node.type** %fn_block.3618
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3619, %m878$.Node.type* %.tmp3620)
%.tmp3621 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
call void(%m2503$.CompilerCtx.type*) @m295$pop_scope.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3621)
%.tmp3622 = bitcast ptr null to %m878$.Node.type*
%last_valid_instruction.3623 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3622, %m878$.Node.type** %last_valid_instruction.3623
%.tmp3624 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3625 = load %m878$.Node.type*, %m878$.Node.type** %fn_block.3618
%.tmp3626 = load %m2503$.Type.type*, %m2503$.Type.type** %return_type.3238
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.Type.type*) @m295$check_n_add_implicit_return.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3624, %m878$.Node.type* %.tmp3625, %m2503$.Type.type* %.tmp3626)
%.tmp3627 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3628 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3627, i32 0, i32 1
%.tmp3629 = load %m0$.File.type*, %m0$.File.type** %.tmp3628
%.tmp3631 = getelementptr [3 x i8], [3 x i8]*@.str3630, i32 0, i32 0
%.tmp3632 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3629, i8* %.tmp3631)
br label %.if.end.3521
.if.end.3521:
br label %.if.end.3492
.if.false.3492:
%.tmp3633 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3634 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3633, i32 0, i32 0
%.tmp3635 = load i8*, i8** %.tmp3634
%.tmp3637 = getelementptr [7 x i8], [7 x i8]*@.str3636, i32 0, i32 0
%.tmp3638 = call i32(i8*,i8*) @strcmp(i8* %.tmp3635, i8* %.tmp3637)
%.tmp3639 = icmp eq i32 %.tmp3638, 0
br i1 %.tmp3639, label %.if.true.3640, label %.if.false.3640
.if.true.3640:
%.tmp3641 = load i1, i1* %shallow
%.tmp3642 = icmp eq i1 %.tmp3641, 1
br i1 %.tmp3642, label %.if.true.3643, label %.if.false.3643
.if.true.3643:
%.tmp3644 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3645 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3644, i32 0, i32 6
%.tmp3646 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3645
%.tmp3647 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3646, i32 0, i32 7
%.tmp3648 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3647
%.tmp3649 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3648, i32 0, i32 1
%.tmp3650 = load i8*, i8** %.tmp3649
%mod_name.3651 = alloca i8*
store i8* %.tmp3650, i8** %mod_name.3651
%.tmp3652 = load i8*, i8** %mod_name.3651
%.tmp3653 = call i32(i8*) @strlen(i8* %.tmp3652)
%mod_name_len.3654 = alloca i32
store i32 %.tmp3653, i32* %mod_name_len.3654
%.tmp3655 = load i32, i32* %mod_name_len.3654
%.tmp3656 = sub i32 %.tmp3655, 1
%.tmp3657 = call i8*(i32) @malloc(i32 %.tmp3656)
%trimmed_path.3658 = alloca i8*
store i8* %.tmp3657, i8** %trimmed_path.3658
%i.3660 = alloca i32
store i32 1, i32* %i.3660
br label %.for.start.3659
.for.start.3659:
%.tmp3661 = load i32, i32* %i.3660
%.tmp3662 = load i32, i32* %mod_name_len.3654
%.tmp3663 = sub i32 %.tmp3662, 1
%.tmp3664 = icmp slt i32 %.tmp3661, %.tmp3663
br i1 %.tmp3664, label %.for.continue.3659, label %.for.end.3659
.for.continue.3659:
%.tmp3665 = load i32, i32* %i.3660
%.tmp3666 = sub i32 %.tmp3665, 1
%.tmp3667 = load i8*, i8** %trimmed_path.3658
%.tmp3668 = getelementptr i8, i8* %.tmp3667, i32 %.tmp3666
%.tmp3669 = load i32, i32* %i.3660
%.tmp3670 = load i8*, i8** %mod_name.3651
%.tmp3671 = getelementptr i8, i8* %.tmp3670, i32 %.tmp3669
%.tmp3672 = load i8, i8* %.tmp3671
store i8 %.tmp3672, i8* %.tmp3668
%.tmp3673 = load i32, i32* %i.3660
%.tmp3674 = add i32 %.tmp3673, 1
store i32 %.tmp3674, i32* %i.3660
br label %.for.start.3659
.for.end.3659:
%.tmp3675 = load i32, i32* %mod_name_len.3654
%.tmp3676 = sub i32 %.tmp3675, 2
%.tmp3677 = load i8*, i8** %trimmed_path.3658
%.tmp3678 = getelementptr i8, i8* %.tmp3677, i32 %.tmp3676
store i8 0, i8* %.tmp3678
%.tmp3679 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3680 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3681 = load i8*, i8** %trimmed_path.3658
%.tmp3682 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$resolve_import_path.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp3679, %m878$.Node.type* %.tmp3680, i8* %.tmp3681)
%mod_abspath.3683 = alloca i8*
store i8* %.tmp3682, i8** %mod_abspath.3683
%.tmp3684 = load i8*, i8** %mod_abspath.3683
%.tmp3685 = call i8*(i32) @malloc(i32 4096)
%.tmp3686 = call i8*(i8*,i8*) @realpath(i8* %.tmp3684, i8* %.tmp3685)
%relpath.3687 = alloca i8*
store i8* %.tmp3686, i8** %relpath.3687
%.tmp3688 = load i8*, i8** %relpath.3687
%.tmp3689 = icmp eq i8* %.tmp3688, null
br i1 %.tmp3689, label %.if.true.3690, label %.if.false.3690
.if.true.3690:
%.tmp3691 = getelementptr i8*, i8** %err_buf.3239, i32 0
%.tmp3693 = getelementptr [54 x i8], [54 x i8]*@.str3692, i32 0, i32 0
%.tmp3694 = load i8*, i8** %mod_name.3651
%.tmp3695 = load i8*, i8** %mod_abspath.3683
%.tmp3696 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3691, i8* %.tmp3693, i8* %.tmp3694, i8* %.tmp3695)
%.tmp3697 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3698 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3699 = load i8*, i8** %err_buf.3239
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp3697, %m878$.Node.type* %.tmp3698, i8* %.tmp3699)
ret void
br label %.if.end.3690
.if.false.3690:
br label %.if.end.3690
.if.end.3690:
%.tmp3700 = load i8*, i8** %relpath.3687
store i8* %.tmp3700, i8** %mod_abspath.3683
%m.3701 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* null, %m2503$.ModuleLookup.type** %m.3701
%.tmp3702 = bitcast ptr null to %m2503$.ModuleLookup.type*
%mod.3703 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp3702, %m2503$.ModuleLookup.type** %mod.3703
%.tmp3705 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3706 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3705, i32 0, i32 6
%.tmp3707 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp3706
store %m2503$.ModuleLookup.type* %.tmp3707, %m2503$.ModuleLookup.type** %m.3701
br label %.for.start.3704
.for.start.3704:
%.tmp3708 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3701
%.tmp3709 = icmp ne %m2503$.ModuleLookup.type* %.tmp3708, null
%.tmp3710 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3703
%.tmp3711 = icmp eq %m2503$.ModuleLookup.type* %.tmp3710, null
%.tmp3712 = and i1 %.tmp3709, %.tmp3711
br i1 %.tmp3712, label %.for.continue.3704, label %.for.end.3704
.for.continue.3704:
%.tmp3713 = load i8*, i8** %mod_abspath.3683
%.tmp3714 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3701
%.tmp3715 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3714, i32 0, i32 0
%.tmp3716 = load i8*, i8** %.tmp3715
%.tmp3717 = call i32(i8*,i8*) @strcmp(i8* %.tmp3713, i8* %.tmp3716)
%.tmp3718 = icmp eq i32 %.tmp3717, 0
br i1 %.tmp3718, label %.if.true.3719, label %.if.false.3719
.if.true.3719:
%.tmp3720 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3701
store %m2503$.ModuleLookup.type* %.tmp3720, %m2503$.ModuleLookup.type** %mod.3703
br label %.if.end.3719
.if.false.3719:
br label %.if.end.3719
.if.end.3719:
%.tmp3721 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3701
%.tmp3722 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3721, i32 0, i32 2
%.tmp3723 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp3722
store %m2503$.ModuleLookup.type* %.tmp3723, %m2503$.ModuleLookup.type** %m.3701
br label %.for.start.3704
.for.end.3704:
%.tmp3724 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3725 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3724, i32 0, i32 6
%.tmp3726 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3725
%.tmp3727 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3726, i32 0, i32 7
%.tmp3728 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3727
%.tmp3729 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3728, i32 0, i32 7
%.tmp3730 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3729
%.tmp3731 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3730, i32 0, i32 7
%.tmp3732 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3731
%.tmp3733 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3732, i32 0, i32 1
%.tmp3734 = load i8*, i8** %.tmp3733
%asname.3735 = alloca i8*
store i8* %.tmp3734, i8** %asname.3735
%.tmp3736 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3703
%.tmp3737 = icmp eq %m2503$.ModuleLookup.type* %.tmp3736, null
br i1 %.tmp3737, label %.if.true.3738, label %.if.false.3738
.if.true.3738:
%.tmp3739 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* null, i32 1
%.tmp3740 = ptrtoint %m2503$.ModuleLookup.type* %.tmp3739 to i32
%.tmp3741 = call i8*(i32) @malloc(i32 %.tmp3740)
%.tmp3742 = bitcast i8* %.tmp3741 to %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp3742, %m2503$.ModuleLookup.type** %mod.3703
%.tmp3743 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3703
%.tmp3744 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3743, i32 0, i32 0
%.tmp3745 = load i8*, i8** %mod_abspath.3683
store i8* %.tmp3745, i8** %.tmp3744
%.tmp3746 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3703
%.tmp3747 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3746, i32 0, i32 2
store %m2503$.ModuleLookup.type* null, %m2503$.ModuleLookup.type** %.tmp3747
%.tmp3748 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3703
%.tmp3749 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3748, i32 0, i32 3
store %m2503$.Scope.type* null, %m2503$.Scope.type** %.tmp3749
%.tmp3750 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3703
%.tmp3751 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3750, i32 0, i32 1
%.tmp3752 = getelementptr i8*, i8** %.tmp3751, i32 0
%.tmp3754 = getelementptr [5 x i8], [5 x i8]*@.str3753, i32 0, i32 0
%.tmp3755 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3756 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3755)
%.tmp3757 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3752, i8* %.tmp3754, i32 %.tmp3756)
%.tmp3759 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3760 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3759, i32 0, i32 6
%.tmp3761 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp3760
store %m2503$.ModuleLookup.type* %.tmp3761, %m2503$.ModuleLookup.type** %m.3701
br label %.for.start.3758
.for.start.3758:
%.tmp3762 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3701
%.tmp3763 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3762, i32 0, i32 2
%.tmp3764 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp3763
%.tmp3765 = icmp ne %m2503$.ModuleLookup.type* %.tmp3764, null
br i1 %.tmp3765, label %.for.continue.3758, label %.for.end.3758
.for.continue.3758:
%.tmp3766 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3701
%.tmp3767 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3766, i32 0, i32 2
%.tmp3768 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp3767
store %m2503$.ModuleLookup.type* %.tmp3768, %m2503$.ModuleLookup.type** %m.3701
br label %.for.start.3758
.for.end.3758:
%.tmp3769 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3701
%.tmp3770 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3769, i32 0, i32 2
%.tmp3771 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3703
store %m2503$.ModuleLookup.type* %.tmp3771, %m2503$.ModuleLookup.type** %.tmp3770
%.tmp3772 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3773 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3774 = load i8*, i8** %asname.3735
%.tmp3775 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3703
%.tmp3776 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3775, i32 0, i32 0
%.tmp3777 = load i8*, i8** %.tmp3776
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,i8*) @m295$define_module.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.cp(%m2503$.CompilerCtx.type* %.tmp3772, %m878$.Node.type* %.tmp3773, i8* %.tmp3774, i8* %.tmp3777)
%.tmp3778 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3779 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3778, i32 0, i32 7
%.tmp3780 = load i8*, i8** %.tmp3779
%curr_mod.3781 = alloca i8*
store i8* %.tmp3780, i8** %curr_mod.3781
%.tmp3782 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3783 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3782, i32 0, i32 7
%.tmp3784 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3703
%.tmp3785 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3784, i32 0, i32 0
%.tmp3786 = load i8*, i8** %.tmp3785
store i8* %.tmp3786, i8** %.tmp3783
%.tmp3787 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3788 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3789 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3703
%.tmp3790 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3789, i32 0, i32 0
%.tmp3791 = load i8*, i8** %.tmp3790
%.tmp3792 = call i1(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$compile_file.b.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp3787, %m878$.Node.type* %.tmp3788, i8* %.tmp3791)
%.tmp3793 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3794 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3793, i32 0, i32 7
%.tmp3795 = load i8*, i8** %curr_mod.3781
store i8* %.tmp3795, i8** %.tmp3794
br label %.if.end.3738
.if.false.3738:
%.tmp3796 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3797 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3798 = load i8*, i8** %asname.3735
%.tmp3799 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3703
%.tmp3800 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3799, i32 0, i32 0
%.tmp3801 = load i8*, i8** %.tmp3800
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,i8*) @m295$define_module.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.cp(%m2503$.CompilerCtx.type* %.tmp3796, %m878$.Node.type* %.tmp3797, i8* %.tmp3798, i8* %.tmp3801)
br label %.if.end.3738
.if.end.3738:
br label %.if.end.3643
.if.false.3643:
br label %.if.end.3643
.if.end.3643:
br label %.if.end.3640
.if.false.3640:
%.tmp3802 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3803 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3805 = getelementptr [40 x i8], [40 x i8]*@.str3804, i32 0, i32 0
%.tmp3806 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp3802, %m878$.Node.type* %.tmp3803, i8* %.tmp3805)
%.tmp3807 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3808 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3807, i32 0, i32 0
%.tmp3809 = load i8*, i8** %.tmp3808
%.tmp3810 = call i32(i8*,...) @printf(i8* %.tmp3806, i8* %.tmp3809)
br label %.if.end.3640
.if.end.3640:
br label %.if.end.3492
.if.end.3492:
br label %.if.end.3421
.if.end.3421:
br label %.if.end.3322
.if.end.3322:
br label %.if.end.3256
.if.end.3256:
br label %.if.end.3248
.if.end.3248:
ret void
}
define i8* @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf.3811 = alloca i8*
store i8* null, i8** %buf.3811
%.tmp3812 = getelementptr i8*, i8** %buf.3811, i32 0
%.tmp3814 = getelementptr [31 x i8], [31 x i8]*@.str3813, i32 0, i32 0
%.tmp3815 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3816 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3815, i32 0, i32 7
%.tmp3817 = load i8*, i8** %.tmp3816
%.tmp3818 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3819 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3818, i32 0, i32 3
%.tmp3820 = load i32, i32* %.tmp3819
%.tmp3821 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3822 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3821, i32 0, i32 4
%.tmp3823 = load i32, i32* %.tmp3822
%.tmp3824 = load i8*, i8** %msg
%.tmp3825 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3812, i8* %.tmp3814, i8* %.tmp3817, i32 %.tmp3820, i32 %.tmp3823, i8* %.tmp3824)
%.tmp3826 = load i8*, i8** %buf.3811
ret i8* %.tmp3826
}
define void @m295$compile_fn_params.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.fn_params.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%fn_params = alloca %m878$.Node.type*
store %m878$.Node.type* %.fn_params.arg, %m878$.Node.type** %fn_params
%param_type.3827 = alloca %m2503$.Type.type*
store %m2503$.Type.type* null, %m2503$.Type.type** %param_type.3827
%.tmp3829 = load %m878$.Node.type*, %m878$.Node.type** %fn_params
%param_ptr.3830 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3829, %m878$.Node.type** %param_ptr.3830
br label %.for.start.3828
.for.start.3828:
%.tmp3831 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3830
%.tmp3832 = icmp ne %m878$.Node.type* %.tmp3831, null
br i1 %.tmp3832, label %.for.continue.3828, label %.for.end.3828
.for.continue.3828:
%.tmp3833 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3830
%.tmp3834 = load %m878$.Node.type*, %m878$.Node.type** %fn_params
%.tmp3835 = icmp ne %m878$.Node.type* %.tmp3833, %.tmp3834
br i1 %.tmp3835, label %.if.true.3836, label %.if.false.3836
.if.true.3836:
%.tmp3837 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3830
%.tmp3838 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3837, i32 0, i32 7
%.tmp3839 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3838
store %m878$.Node.type* %.tmp3839, %m878$.Node.type** %param_ptr.3830
br label %.if.end.3836
.if.false.3836:
br label %.if.end.3836
.if.end.3836:
%.tmp3840 = load %m878$.Node.type*, %m878$.Node.type** %fn_params
%.tmp3841 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3840)
%param_info.3842 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp3841, %m2503$.AssignableInfo.type** %param_info.3842
%.tmp3843 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3842
%.tmp3844 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3843, i32 0, i32 3
%.tmp3846 = getelementptr [9 x i8], [9 x i8]*@.str3845, i32 0, i32 0
store i8* %.tmp3846, i8** %.tmp3844
%.tmp3847 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3830
%.tmp3848 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3847, i32 0, i32 0
%.tmp3849 = load i8*, i8** %.tmp3848
%.tmp3851 = getelementptr [5 x i8], [5 x i8]*@.str3850, i32 0, i32 0
%.tmp3852 = call i32(i8*,i8*) @strcmp(i8* %.tmp3849, i8* %.tmp3851)
%.tmp3853 = icmp eq i32 %.tmp3852, 0
br i1 %.tmp3853, label %.if.true.3854, label %.if.false.3854
.if.true.3854:
%.tmp3855 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3856 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3830
%.tmp3857 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3856, i32 0, i32 6
%.tmp3858 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3857
%.tmp3859 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3855, %m878$.Node.type* %.tmp3858)
store %m2503$.Type.type* %.tmp3859, %m2503$.Type.type** %param_type.3827
%.tmp3860 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3830
%.tmp3861 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3860, i32 0, i32 7
%.tmp3862 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3861
store %m878$.Node.type* %.tmp3862, %m878$.Node.type** %param_ptr.3830
br label %.if.end.3854
.if.false.3854:
br label %.if.end.3854
.if.end.3854:
%.tmp3863 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3842
%.tmp3864 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3863, i32 0, i32 4
%.tmp3865 = load %m2503$.Type.type*, %m2503$.Type.type** %param_type.3827
store %m2503$.Type.type* %.tmp3865, %m2503$.Type.type** %.tmp3864
%.tmp3866 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3830
%.tmp3867 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3866, i32 0, i32 1
%.tmp3868 = load i8*, i8** %.tmp3867
%var_name.3869 = alloca i8*
store i8* %.tmp3868, i8** %var_name.3869
%.tmp3870 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3842
%.tmp3871 = load i8, i8* @SCOPE_LOCAL
%.tmp3872 = load i8*, i8** %var_name.3869
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp3870, i8 %.tmp3871, i8* %.tmp3872)
%.tmp3873 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3874 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3842
%.tmp3875 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3874, i32 0, i32 4
%.tmp3876 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3875
%.tmp3877 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3873, %m2503$.Type.type* %.tmp3876)
%param_info_tr.3878 = alloca i8*
store i8* %.tmp3877, i8** %param_info_tr.3878
%.tmp3879 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3880 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3879, i32 0, i32 1
%.tmp3881 = load %m0$.File.type*, %m0$.File.type** %.tmp3880
%.tmp3883 = getelementptr [16 x i8], [16 x i8]*@.str3882, i32 0, i32 0
%.tmp3884 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3842
%.tmp3885 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3884)
%.tmp3886 = load i8*, i8** %param_info_tr.3878
%.tmp3887 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3881, i8* %.tmp3883, i8* %.tmp3885, i8* %.tmp3886)
%.tmp3888 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3889 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3830
%.tmp3890 = load i8*, i8** %var_name.3869
%.tmp3891 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3842
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3888, %m878$.Node.type* %.tmp3889, i8* %.tmp3890, %m2503$.AssignableInfo.type* %.tmp3891)
%.tmp3892 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3893 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3892, i32 0, i32 1
%.tmp3894 = load %m0$.File.type*, %m0$.File.type** %.tmp3893
%.tmp3896 = getelementptr [28 x i8], [28 x i8]*@.str3895, i32 0, i32 0
%.tmp3897 = load i8*, i8** %param_info_tr.3878
%.tmp3898 = load i8*, i8** %var_name.3869
%.tmp3899 = load i8*, i8** %param_info_tr.3878
%.tmp3900 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3842
%.tmp3901 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3900)
%.tmp3902 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3894, i8* %.tmp3896, i8* %.tmp3897, i8* %.tmp3898, i8* %.tmp3899, i8* %.tmp3901)
%.tmp3903 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3830
%.tmp3904 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3903, i32 0, i32 7
%.tmp3905 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3904
store %m878$.Node.type* %.tmp3905, %m878$.Node.type** %param_ptr.3830
br label %.for.start.3828
.for.end.3828:
ret void
}
define void @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp3906 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3908 = getelementptr [6 x i8], [6 x i8]*@.str3907, i32 0, i32 0
%.tmp3909 = bitcast ptr null to i8*
%.tmp3910 = bitcast ptr null to i8*
call void(%m2503$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2503$.CompilerCtx.typep.cp.cp.cp(%m2503$.CompilerCtx.type* %.tmp3906, i8* %.tmp3908, i8* %.tmp3909, i8* %.tmp3910)
%.tmp3911 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3912 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3911, i32 0, i32 6
%.tmp3913 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3912
%.tmp3915 = getelementptr [12 x i8], [12 x i8]*@.str3914, i32 0, i32 0
%.tmp3916 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp3913, i8* %.tmp3915)
%exprs.3917 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3916, %m878$.Node.type** %exprs.3917
%.tmp3918 = load %m878$.Node.type*, %m878$.Node.type** %exprs.3917
%.tmp3919 = icmp ne %m878$.Node.type* %.tmp3918, null
br i1 %.tmp3919, label %.if.true.3920, label %.if.false.3920
.if.true.3920:
%.tmp3922 = load %m878$.Node.type*, %m878$.Node.type** %exprs.3917
%.tmp3923 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3922, i32 0, i32 6
%.tmp3924 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3923
%b.3925 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3924, %m878$.Node.type** %b.3925
br label %.for.start.3921
.for.start.3921:
%.tmp3926 = load %m878$.Node.type*, %m878$.Node.type** %b.3925
%.tmp3927 = icmp ne %m878$.Node.type* %.tmp3926, null
br i1 %.tmp3927, label %.for.continue.3921, label %.for.end.3921
.for.continue.3921:
%.tmp3928 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3929 = load %m878$.Node.type*, %m878$.Node.type** %b.3925
%.tmp3930 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3929, i32 0, i32 6
%.tmp3931 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3930
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_expression.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3928, %m878$.Node.type* %.tmp3931)
%.tmp3932 = load %m878$.Node.type*, %m878$.Node.type** %b.3925
%.tmp3933 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3932, i32 0, i32 7
%.tmp3934 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3933
store %m878$.Node.type* %.tmp3934, %m878$.Node.type** %b.3925
br label %.for.start.3921
.for.end.3921:
br label %.if.end.3920
.if.false.3920:
br label %.if.end.3920
.if.end.3920:
%.tmp3935 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
call void(%m2503$.CompilerCtx.type*) @m295$pop_scope.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3935)
ret void
}
define %m2503$.AssignableInfo.type* @m295$get_struct_attr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep.i(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp3936 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3937 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3938 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3936, %m878$.Node.type* %.tmp3937)
%val.3939 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp3938, %m2503$.AssignableInfo.type** %val.3939
%.tmp3940 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.3939
%.tmp3941 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3940, i32 0, i32 4
%.tmp3942 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3941
%.tmp3943 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3942, i32 0, i32 0
%.tmp3944 = load i8*, i8** %.tmp3943
%.tmp3946 = getelementptr [7 x i8], [7 x i8]*@.str3945, i32 0, i32 0
%.tmp3947 = call i32(i8*,i8*) @strcmp(i8* %.tmp3944, i8* %.tmp3946)
%.tmp3948 = icmp ne i32 %.tmp3947, 0
br i1 %.tmp3948, label %.if.true.3949, label %.if.false.3949
.if.true.3949:
%.tmp3951 = getelementptr [7 x i8], [7 x i8]*@.str3950, i32 0, i32 0
%.tmp3952 = call i32(i8*,...) @printf(i8* %.tmp3951)
%.tmp3953 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp3953
br label %.if.end.3949
.if.false.3949:
br label %.if.end.3949
.if.end.3949:
%.tmp3954 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.3939
%.tmp3955 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3954, i32 0, i32 4
%.tmp3956 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3955
%.tmp3957 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3956, i32 0, i32 3
%.tmp3958 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3957
%node_type.3959 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp3958, %m2503$.Type.type** %node_type.3959
%i.3961 = alloca i32
store i32 0, i32* %i.3961
br label %.for.start.3960
.for.start.3960:
%.tmp3962 = load i32, i32* %i.3961
%.tmp3963 = load i32, i32* %attr_id
%.tmp3964 = icmp slt i32 %.tmp3962, %.tmp3963
br i1 %.tmp3964, label %.for.continue.3960, label %.for.end.3960
.for.continue.3960:
%.tmp3965 = load %m2503$.Type.type*, %m2503$.Type.type** %node_type.3959
%.tmp3966 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3965, i32 0, i32 4
%.tmp3967 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3966
store %m2503$.Type.type* %.tmp3967, %m2503$.Type.type** %node_type.3959
%.tmp3968 = load i32, i32* %i.3961
%.tmp3969 = add i32 %.tmp3968, 1
store i32 %.tmp3969, i32* %i.3961
br label %.for.start.3960
.for.end.3960:
%.tmp3970 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3971 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3970)
%info.3972 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp3971, %m2503$.AssignableInfo.type** %info.3972
%.tmp3973 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3972
%.tmp3974 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3973, i32 0, i32 4
%.tmp3975 = load %m2503$.Type.type*, %m2503$.Type.type** %node_type.3959
store %m2503$.Type.type* %.tmp3975, %m2503$.Type.type** %.tmp3974
%.tmp3976 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3977 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3976)
%tmp_id.3978 = alloca i32
store i32 %.tmp3977, i32* %tmp_id.3978
%.tmp3979 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3980 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.3939
%.tmp3981 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3980, i32 0, i32 4
%.tmp3982 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3981
%.tmp3983 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3979, %m2503$.Type.type* %.tmp3982)
%type_as_str.3984 = alloca i8*
store i8* %.tmp3983, i8** %type_as_str.3984
%.tmp3985 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3986 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3972
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3985, %m2503$.AssignableInfo.type* %.tmp3986)
%.tmp3987 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3988 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3987, i32 0, i32 1
%.tmp3989 = load %m0$.File.type*, %m0$.File.type** %.tmp3988
%.tmp3991 = getelementptr [52 x i8], [52 x i8]*@.str3990, i32 0, i32 0
%.tmp3992 = load i32, i32* %tmp_id.3978
%.tmp3993 = load i8*, i8** %type_as_str.3984
%.tmp3994 = load i8*, i8** %type_as_str.3984
%.tmp3995 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.3939
%.tmp3996 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3995)
%.tmp3997 = load i32, i32* %attr_id
%.tmp3998 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3989, i8* %.tmp3991, i32 %.tmp3992, i8* %.tmp3993, i8* %.tmp3994, i8* %.tmp3996, i32 %.tmp3997)
%.tmp3999 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4000 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3999, i32 0, i32 1
%.tmp4001 = load %m0$.File.type*, %m0$.File.type** %.tmp4000
%.tmp4003 = getelementptr [28 x i8], [28 x i8]*@.str4002, i32 0, i32 0
%.tmp4004 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3972
%.tmp4005 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4004)
%.tmp4006 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4007 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3972
%.tmp4008 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4007, i32 0, i32 4
%.tmp4009 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4008
%.tmp4010 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4006, %m2503$.Type.type* %.tmp4009)
%.tmp4011 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4012 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3972
%.tmp4013 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4012, i32 0, i32 4
%.tmp4014 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4013
%.tmp4015 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4011, %m2503$.Type.type* %.tmp4014)
%.tmp4016 = load i32, i32* %tmp_id.3978
%.tmp4017 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4001, i8* %.tmp4003, i8* %.tmp4005, i8* %.tmp4010, i8* %.tmp4015, i32 %.tmp4016)
%.tmp4018 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3972
ret %m2503$.AssignableInfo.type* %.tmp4018
}
define void @m295$set_struct_attr.v.m2503$.CompilerCtx.typep.m878$.Node.typep.i.cp(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, i32 %.attr_id.arg, i8* %.attr.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%attr = alloca i8*
store i8* %.attr.arg, i8** %attr
%.tmp4019 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4020 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4021 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4019, %m878$.Node.type* %.tmp4020)
%val.4022 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4021, %m2503$.AssignableInfo.type** %val.4022
%.tmp4023 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.4022
%.tmp4024 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4023, i32 0, i32 4
%.tmp4025 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4024
%.tmp4026 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4025, i32 0, i32 0
%.tmp4027 = load i8*, i8** %.tmp4026
%.tmp4029 = getelementptr [7 x i8], [7 x i8]*@.str4028, i32 0, i32 0
%.tmp4030 = call i32(i8*,i8*) @strcmp(i8* %.tmp4027, i8* %.tmp4029)
%.tmp4031 = icmp ne i32 %.tmp4030, 0
br i1 %.tmp4031, label %.if.true.4032, label %.if.false.4032
.if.true.4032:
%.tmp4034 = getelementptr [7 x i8], [7 x i8]*@.str4033, i32 0, i32 0
%.tmp4035 = call i32(i8*,...) @printf(i8* %.tmp4034)
ret void
br label %.if.end.4032
.if.false.4032:
br label %.if.end.4032
.if.end.4032:
%.tmp4036 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.4022
%.tmp4037 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4036, i32 0, i32 4
%.tmp4038 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4037
%.tmp4039 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4038, i32 0, i32 3
%.tmp4040 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4039
%node_type.4041 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp4040, %m2503$.Type.type** %node_type.4041
%i.4043 = alloca i32
store i32 0, i32* %i.4043
br label %.for.start.4042
.for.start.4042:
%.tmp4044 = load i32, i32* %i.4043
%.tmp4045 = load i32, i32* %attr_id
%.tmp4046 = icmp slt i32 %.tmp4044, %.tmp4045
br i1 %.tmp4046, label %.for.continue.4042, label %.for.end.4042
.for.continue.4042:
%.tmp4047 = load %m2503$.Type.type*, %m2503$.Type.type** %node_type.4041
%.tmp4048 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4047, i32 0, i32 4
%.tmp4049 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4048
store %m2503$.Type.type* %.tmp4049, %m2503$.Type.type** %node_type.4041
%.tmp4050 = load i32, i32* %i.4043
%.tmp4051 = add i32 %.tmp4050, 1
store i32 %.tmp4051, i32* %i.4043
br label %.for.start.4042
.for.end.4042:
%.tmp4052 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4053 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp4052)
%tmp_id.4054 = alloca i32
store i32 %.tmp4053, i32* %tmp_id.4054
%.tmp4055 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4056 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.4022
%.tmp4057 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4056, i32 0, i32 4
%.tmp4058 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4057
%.tmp4059 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4055, %m2503$.Type.type* %.tmp4058)
%type_as_str.4060 = alloca i8*
store i8* %.tmp4059, i8** %type_as_str.4060
%.tmp4061 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4062 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4061, i32 0, i32 1
%.tmp4063 = load %m0$.File.type*, %m0$.File.type** %.tmp4062
%.tmp4065 = getelementptr [52 x i8], [52 x i8]*@.str4064, i32 0, i32 0
%.tmp4066 = load i32, i32* %tmp_id.4054
%.tmp4067 = load i8*, i8** %type_as_str.4060
%.tmp4068 = load i8*, i8** %type_as_str.4060
%.tmp4069 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.4022
%.tmp4070 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4069)
%.tmp4071 = load i32, i32* %attr_id
%.tmp4072 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4063, i8* %.tmp4065, i32 %.tmp4066, i8* %.tmp4067, i8* %.tmp4068, i8* %.tmp4070, i32 %.tmp4071)
%.tmp4073 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4074 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4073, i32 0, i32 1
%.tmp4075 = load %m0$.File.type*, %m0$.File.type** %.tmp4074
%.tmp4077 = getelementptr [18 x i8], [18 x i8]*@.str4076, i32 0, i32 0
%.tmp4078 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4079 = load %m2503$.Type.type*, %m2503$.Type.type** %node_type.4041
%.tmp4080 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4078, %m2503$.Type.type* %.tmp4079)
%.tmp4081 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4082 = load %m2503$.Type.type*, %m2503$.Type.type** %node_type.4041
%.tmp4083 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4081, %m2503$.Type.type* %.tmp4082)
%.tmp4084 = load i8*, i8** %attr
%.tmp4085 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4075, i8* %.tmp4077, i8* %.tmp4080, i8* %.tmp4083, i8* %.tmp4084)
ret void
}
define %m2503$.AssignableInfo.type* @m295$compile_builtin.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp4086 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4087 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4086, i32 0, i32 6
%.tmp4088 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4087
%.tmp4089 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4088, i32 0, i32 6
%.tmp4090 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4089
%dotted.4091 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4090, %m878$.Node.type** %dotted.4091
%.tmp4092 = load %m878$.Node.type*, %m878$.Node.type** %dotted.4091
%.tmp4093 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4092, i32 0, i32 7
%.tmp4094 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4093
%.tmp4095 = icmp ne %m878$.Node.type* %.tmp4094, null
br i1 %.tmp4095, label %.if.true.4096, label %.if.false.4096
.if.true.4096:
%.tmp4097 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4097
br label %.if.end.4096
.if.false.4096:
br label %.if.end.4096
.if.end.4096:
%.tmp4098 = load %m878$.Node.type*, %m878$.Node.type** %dotted.4091
%.tmp4099 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4098, i32 0, i32 1
%.tmp4100 = load i8*, i8** %.tmp4099
%.tmp4102 = getelementptr [7 x i8], [7 x i8]*@.str4101, i32 0, i32 0
%.tmp4103 = call i32(i8*,i8*) @strcmp(i8* %.tmp4100, i8* %.tmp4102)
%.tmp4104 = icmp eq i32 %.tmp4103, 0
br i1 %.tmp4104, label %.if.true.4105, label %.if.false.4105
.if.true.4105:
%.tmp4106 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4108 = getelementptr [8 x i8], [8 x i8]*@.str4107, i32 0, i32 0
%.tmp4109 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4106, i8* %.tmp4108)
%args.4110 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4109, %m878$.Node.type** %args.4110
%.tmp4111 = load %m878$.Node.type*, %m878$.Node.type** %args.4110
%.tmp4112 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4111, i32 0, i32 6
%.tmp4113 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4112
%.tmp4115 = getelementptr [11 x i8], [11 x i8]*@.str4114, i32 0, i32 0
%.tmp4116 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4113, i8* %.tmp4115)
%value.4117 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4116, %m878$.Node.type** %value.4117
%.tmp4118 = load %m878$.Node.type*, %m878$.Node.type** %value.4117
%.tmp4119 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4118, i32 0, i32 6
%.tmp4120 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4119
%.tmp4121 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4120, i32 0, i32 6
%.tmp4122 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4121
%.tmp4123 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4122, i32 0, i32 6
%.tmp4124 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4123
%.tmp4125 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4124, i32 0, i32 6
%.tmp4126 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4125
store %m878$.Node.type* %.tmp4126, %m878$.Node.type** %value.4117
%.tmp4127 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4128 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp4127)
%tmp_id.4129 = alloca i32
store i32 %.tmp4128, i32* %tmp_id.4129
%.tmp4130 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4131 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp4130)
%info.4132 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4131, %m2503$.AssignableInfo.type** %info.4132
%.tmp4133 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4134 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4132
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp4133, %m2503$.AssignableInfo.type* %.tmp4134)
%.tmp4135 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4132
%.tmp4136 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4135, i32 0, i32 4
%.tmp4137 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4137, %m2503$.Type.type** %.tmp4136
%.tmp4138 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4132
%.tmp4139 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4138, i32 0, i32 4
%.tmp4140 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4139
%.tmp4141 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4140, i32 0, i32 0
%.tmp4143 = getelementptr [4 x i8], [4 x i8]*@.str4142, i32 0, i32 0
store i8* %.tmp4143, i8** %.tmp4141
%.tmp4144 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4145 = load %m878$.Node.type*, %m878$.Node.type** %value.4117
%.tmp4146 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4144, %m878$.Node.type* %.tmp4145)
%inspected_type.4147 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp4146, %m2503$.Type.type** %inspected_type.4147
%.tmp4148 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4149 = load %m2503$.Type.type*, %m2503$.Type.type** %inspected_type.4147
%.tmp4150 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4148, %m2503$.Type.type* %.tmp4149)
%type_as_str.4151 = alloca i8*
store i8* %.tmp4150, i8** %type_as_str.4151
%.tmp4152 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4153 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4152, i32 0, i32 1
%.tmp4154 = load %m0$.File.type*, %m0$.File.type** %.tmp4153
%.tmp4156 = getelementptr [46 x i8], [46 x i8]*@.str4155, i32 0, i32 0
%.tmp4157 = load i32, i32* %tmp_id.4129
%.tmp4158 = load i8*, i8** %type_as_str.4151
%.tmp4159 = load i8*, i8** %type_as_str.4151
%.tmp4160 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4154, i8* %.tmp4156, i32 %.tmp4157, i8* %.tmp4158, i8* %.tmp4159)
%.tmp4161 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4162 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4161, i32 0, i32 1
%.tmp4163 = load %m0$.File.type*, %m0$.File.type** %.tmp4162
%.tmp4165 = getelementptr [35 x i8], [35 x i8]*@.str4164, i32 0, i32 0
%.tmp4166 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4132
%.tmp4167 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4166)
%.tmp4168 = load i8*, i8** %type_as_str.4151
%.tmp4169 = load i32, i32* %tmp_id.4129
%.tmp4170 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4163, i8* %.tmp4165, i8* %.tmp4167, i8* %.tmp4168, i32 %.tmp4169)
%.tmp4171 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4132
ret %m2503$.AssignableInfo.type* %.tmp4171
br label %.if.end.4105
.if.false.4105:
%.tmp4172 = load %m878$.Node.type*, %m878$.Node.type** %dotted.4091
%.tmp4173 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4172, i32 0, i32 1
%.tmp4174 = load i8*, i8** %.tmp4173
%.tmp4176 = getelementptr [7 x i8], [7 x i8]*@.str4175, i32 0, i32 0
%.tmp4177 = call i32(i8*,i8*) @strcmp(i8* %.tmp4174, i8* %.tmp4176)
%.tmp4178 = icmp eq i32 %.tmp4177, 0
br i1 %.tmp4178, label %.if.true.4179, label %.if.false.4179
.if.true.4179:
%.tmp4180 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4182 = getelementptr [8 x i8], [8 x i8]*@.str4181, i32 0, i32 0
%.tmp4183 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4180, i8* %.tmp4182)
%args.4184 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4183, %m878$.Node.type** %args.4184
%.tmp4185 = load %m878$.Node.type*, %m878$.Node.type** %args.4184
%.tmp4186 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4185, i32 0, i32 6
%.tmp4187 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4186
%.tmp4189 = getelementptr [11 x i8], [11 x i8]*@.str4188, i32 0, i32 0
%.tmp4190 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4187, i8* %.tmp4189)
%array.4191 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4190, %m878$.Node.type** %array.4191
%.tmp4192 = load %m878$.Node.type*, %m878$.Node.type** %array.4191
%.tmp4193 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4192, i32 0, i32 7
%.tmp4194 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4193
%.tmp4196 = getelementptr [11 x i8], [11 x i8]*@.str4195, i32 0, i32 0
%.tmp4197 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4194, i8* %.tmp4196)
%value.4198 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4197, %m878$.Node.type** %value.4198
%.tmp4199 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4200 = load %m878$.Node.type*, %m878$.Node.type** %value.4198
%.tmp4201 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4199, %m878$.Node.type* %.tmp4200)
%value_info.4202 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4201, %m2503$.AssignableInfo.type** %value_info.4202
%.tmp4203 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4204 = load %m878$.Node.type*, %m878$.Node.type** %array.4191
%.tmp4205 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4203, %m878$.Node.type* %.tmp4204)
%array_info.4206 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4205, %m2503$.AssignableInfo.type** %array_info.4206
%.tmp4207 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4208 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp4207)
%info.4209 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4208, %m2503$.AssignableInfo.type** %info.4209
%.tmp4210 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4211 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4209
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp4210, %m2503$.AssignableInfo.type* %.tmp4211)
%.tmp4212 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4209
%.tmp4213 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4212, i32 0, i32 4
%.tmp4214 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %array_info.4206
%.tmp4215 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4214, i32 0, i32 4
%.tmp4216 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4215
store %m2503$.Type.type* %.tmp4216, %m2503$.Type.type** %.tmp4213
%builtin_prefix.4217 = alloca i8*
store i8* null, i8** %builtin_prefix.4217
%.tmp4218 = getelementptr i8*, i8** %builtin_prefix.4217, i32 0
%.tmp4220 = getelementptr [5 x i8], [5 x i8]*@.str4219, i32 0, i32 0
%.tmp4221 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4222 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp4221)
%.tmp4223 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4218, i8* %.tmp4220, i32 %.tmp4222)
%.tmp4224 = call i8*() @m2054$append_tmpl.cp()
%tmpl.4225 = alloca i8*
store i8* %.tmp4224, i8** %tmpl.4225
%.tmp4226 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4227 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4226, i32 0, i32 1
%.tmp4228 = load %m0$.File.type*, %m0$.File.type** %.tmp4227
%.tmp4229 = load i8*, i8** %tmpl.4225
%.tmp4230 = load i8*, i8** %builtin_prefix.4217
%.tmp4231 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4232 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %array_info.4206
%.tmp4233 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4232, i32 0, i32 4
%.tmp4234 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4233
%.tmp4235 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4231, %m2503$.Type.type* %.tmp4234)
%.tmp4236 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %array_info.4206
%.tmp4237 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4236)
%.tmp4238 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4239 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %value_info.4202
%.tmp4240 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4239, i32 0, i32 4
%.tmp4241 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4240
%.tmp4242 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4238, %m2503$.Type.type* %.tmp4241)
%.tmp4243 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %value_info.4202
%.tmp4244 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4243)
%.tmp4245 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4209
%.tmp4246 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4245)
%.tmp4247 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4228, i8* %.tmp4229, i8* %.tmp4230, i8* %.tmp4235, i8* %.tmp4237, i8* %.tmp4242, i8* %.tmp4244, i8* %.tmp4246)
%.tmp4248 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4249 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp4248)
%info_g.4250 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4249, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4251 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4252 = load i8, i8* @SCOPE_GLOBAL
%.tmp4254 = getelementptr [8 x i8], [8 x i8]*@.str4253, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp4251, i8 %.tmp4252, i8* %.tmp4254)
%.tmp4255 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4256 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4255, i32 0, i32 4
%.tmp4257 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4257, %m2503$.Type.type** %.tmp4256
%.tmp4258 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4259 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4258, i32 0, i32 4
%.tmp4260 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4259
%.tmp4261 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4260, i32 0, i32 0
%.tmp4263 = getelementptr [9 x i8], [9 x i8]*@.str4262, i32 0, i32 0
store i8* %.tmp4263, i8** %.tmp4261
%.tmp4264 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4265 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4264, i32 0, i32 4
%.tmp4266 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4265
%.tmp4267 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4266, i32 0, i32 3
%.tmp4268 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4268, %m2503$.Type.type** %.tmp4267
%.tmp4269 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4270 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4269, i32 0, i32 4
%.tmp4271 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4270
%.tmp4272 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4271, i32 0, i32 3
%.tmp4273 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4272
%.tmp4274 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4273, i32 0, i32 0
%.tmp4276 = getelementptr [4 x i8], [4 x i8]*@.str4275, i32 0, i32 0
store i8* %.tmp4276, i8** %.tmp4274
%.tmp4277 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4278 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4277, i32 0, i32 4
%.tmp4279 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4278
%.tmp4280 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4279, i32 0, i32 3
%.tmp4281 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4280
%.tmp4282 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4281, i32 0, i32 3
%.tmp4283 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4283, %m2503$.Type.type** %.tmp4282
%.tmp4284 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4285 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4284, i32 0, i32 4
%.tmp4286 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4285
%.tmp4287 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4286, i32 0, i32 3
%.tmp4288 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4287
%.tmp4289 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4288, i32 0, i32 3
%.tmp4290 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4289
%.tmp4291 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4290, i32 0, i32 0
%.tmp4293 = getelementptr [4 x i8], [4 x i8]*@.str4292, i32 0, i32 0
store i8* %.tmp4293, i8** %.tmp4291
%.tmp4294 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4295 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4294, i32 0, i32 4
%.tmp4296 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4295
%.tmp4297 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4296, i32 0, i32 3
%.tmp4298 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4297
%.tmp4299 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4298, i32 0, i32 4
%.tmp4300 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4300, %m2503$.Type.type** %.tmp4299
%.tmp4301 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4302 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4301, i32 0, i32 4
%.tmp4303 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4302
%.tmp4304 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4303, i32 0, i32 3
%.tmp4305 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4304
%.tmp4306 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4305, i32 0, i32 4
%.tmp4307 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4306
%.tmp4308 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4307, i32 0, i32 0
%.tmp4310 = getelementptr [4 x i8], [4 x i8]*@.str4309, i32 0, i32 0
store i8* %.tmp4310, i8** %.tmp4308
%.tmp4311 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4312 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4311, i32 0, i32 4
%.tmp4313 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4312
%.tmp4314 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4313, i32 0, i32 3
%.tmp4315 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4314
%.tmp4316 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4315, i32 0, i32 4
%.tmp4317 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4316
%.tmp4318 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4317, i32 0, i32 3
%.tmp4319 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4319, %m2503$.Type.type** %.tmp4318
%.tmp4320 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4321 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4320, i32 0, i32 4
%.tmp4322 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4321
%.tmp4323 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4322, i32 0, i32 3
%.tmp4324 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4323
%.tmp4325 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4324, i32 0, i32 4
%.tmp4326 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4325
%.tmp4327 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4326, i32 0, i32 3
%.tmp4328 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4327
%.tmp4329 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4328, i32 0, i32 0
%.tmp4331 = getelementptr [4 x i8], [4 x i8]*@.str4330, i32 0, i32 0
store i8* %.tmp4331, i8** %.tmp4329
%.tmp4332 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4333 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4332, i32 0, i32 4
%.tmp4334 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4333
%.tmp4335 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4334, i32 0, i32 3
%.tmp4336 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4335
%.tmp4337 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4336, i32 0, i32 4
%.tmp4338 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4337
%.tmp4339 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4338, i32 0, i32 4
%.tmp4340 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4340, %m2503$.Type.type** %.tmp4339
%.tmp4341 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
%.tmp4342 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4341, i32 0, i32 4
%.tmp4343 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4342
%.tmp4344 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4343, i32 0, i32 3
%.tmp4345 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4344
%.tmp4346 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4345, i32 0, i32 4
%.tmp4347 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4346
%.tmp4348 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4347, i32 0, i32 4
%.tmp4349 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4348
%.tmp4350 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4349, i32 0, i32 0
%.tmp4352 = getelementptr [4 x i8], [4 x i8]*@.str4351, i32 0, i32 0
store i8* %.tmp4352, i8** %.tmp4350
%.tmp4353 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4355 = getelementptr [8 x i8], [8 x i8]*@.str4354, i32 0, i32 0
%.tmp4357 = getelementptr [7 x i8], [7 x i8]*@.str4356, i32 0, i32 0
%.tmp4358 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4250
call void(%m2503$.CompilerCtx.type*,i8*,i8*,%m2503$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2503$.CompilerCtx.typep.cp.cp.m2503$.AssignableInfo.typep.b.b(%m2503$.CompilerCtx.type* %.tmp4353, i8* %.tmp4355, i8* %.tmp4357, %m2503$.AssignableInfo.type* %.tmp4358, i1 1, i1 0)
%.tmp4359 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4209
ret %m2503$.AssignableInfo.type* %.tmp4359
br label %.if.end.4179
.if.false.4179:
%.tmp4360 = load %m878$.Node.type*, %m878$.Node.type** %dotted.4091
%.tmp4361 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4360, i32 0, i32 1
%.tmp4362 = load i8*, i8** %.tmp4361
%.tmp4364 = getelementptr [4 x i8], [4 x i8]*@.str4363, i32 0, i32 0
%.tmp4365 = call i32(i8*,i8*) @strcmp(i8* %.tmp4362, i8* %.tmp4364)
%.tmp4366 = icmp eq i32 %.tmp4365, 0
br i1 %.tmp4366, label %.if.true.4367, label %.if.false.4367
.if.true.4367:
%.tmp4368 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4370 = getelementptr [8 x i8], [8 x i8]*@.str4369, i32 0, i32 0
%.tmp4371 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4368, i8* %.tmp4370)
%args.4372 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4371, %m878$.Node.type** %args.4372
%.tmp4373 = load %m878$.Node.type*, %m878$.Node.type** %args.4372
%.tmp4374 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4373, i32 0, i32 6
%.tmp4375 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4374
%.tmp4377 = getelementptr [11 x i8], [11 x i8]*@.str4376, i32 0, i32 0
%.tmp4378 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4375, i8* %.tmp4377)
%value.4379 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4378, %m878$.Node.type** %value.4379
%.tmp4380 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4381 = load %m878$.Node.type*, %m878$.Node.type** %value.4379
%.tmp4382 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i32) @m295$get_struct_attr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep.i(%m2503$.CompilerCtx.type* %.tmp4380, %m878$.Node.type* %.tmp4381, i32 1)
ret %m2503$.AssignableInfo.type* %.tmp4382
br label %.if.end.4367
.if.false.4367:
br label %.if.end.4367
.if.end.4367:
br label %.if.end.4179
.if.end.4179:
br label %.if.end.4105
.if.end.4105:
%.tmp4383 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4383
}
define i8* @m295$resolve_import_path.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp4385 = getelementptr [1 x i8], [1 x i8]*@.str4384, i32 0, i32 0
%err_buf.4386 = alloca i8*
store i8* %.tmp4385, i8** %err_buf.4386
%.tmp4387 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4388 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4387, i32 0, i32 7
%.tmp4389 = load i8*, i8** %.tmp4388
%mod_abspath.4390 = alloca i8*
store i8* %.tmp4389, i8** %mod_abspath.4390
%.tmp4391 = load i8*, i8** %mod_abspath.4390
%.tmp4392 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp4391)
%dirname.4393 = alloca i8*
store i8* %.tmp4392, i8** %dirname.4393
%.tmp4394 = load i8*, i8** %import_str
%.tmp4395 = getelementptr i8, i8* %.tmp4394, i32 0
%.tmp4396 = load i8, i8* %.tmp4395
%.tmp4397 = icmp eq i8 %.tmp4396, 47
br i1 %.tmp4397, label %.if.true.4398, label %.if.false.4398
.if.true.4398:
%.tmp4399 = getelementptr i8*, i8** %err_buf.4386, i32 0
%.tmp4401 = getelementptr [46 x i8], [46 x i8]*@.str4400, i32 0, i32 0
%.tmp4402 = load i8*, i8** %import_str
%.tmp4403 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4399, i8* %.tmp4401, i8* %.tmp4402)
%.tmp4404 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4405 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4406 = load i8*, i8** %err_buf.4386
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4404, %m878$.Node.type* %.tmp4405, i8* %.tmp4406)
%.tmp4407 = bitcast ptr null to i8*
ret i8* %.tmp4407
br label %.if.end.4398
.if.false.4398:
br label %.if.end.4398
.if.end.4398:
%.tmp4408 = load i8*, i8** %import_str
%.tmp4409 = getelementptr i8, i8* %.tmp4408, i32 0
%.tmp4410 = load i8, i8* %.tmp4409
%.tmp4411 = icmp ne i8 %.tmp4410, 46
%.tmp4412 = load i8*, i8** %import_str
%.tmp4413 = getelementptr i8, i8* %.tmp4412, i32 1
%.tmp4414 = load i8, i8* %.tmp4413
%.tmp4415 = icmp ne i8 %.tmp4414, 47
%.tmp4416 = and i1 %.tmp4411, %.tmp4415
br i1 %.tmp4416, label %.if.true.4417, label %.if.false.4417
.if.true.4417:
%.tmp4418 = call i8*() @m295$get_root.cp()
%root.4419 = alloca i8*
store i8* %.tmp4418, i8** %root.4419
%.tmp4420 = getelementptr i8*, i8** %mod_abspath.4390, i32 0
%.tmp4422 = getelementptr [13 x i8], [13 x i8]*@.str4421, i32 0, i32 0
%.tmp4423 = load i8*, i8** %root.4419
%.tmp4424 = load i8*, i8** %import_str
%.tmp4425 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4420, i8* %.tmp4422, i8* %.tmp4423, i8* %.tmp4424)
br label %.if.end.4417
.if.false.4417:
%.tmp4426 = load i8*, i8** %dirname.4393
%.tmp4428 = getelementptr [1 x i8], [1 x i8]*@.str4427, i32 0, i32 0
%.tmp4429 = call i32(i8*,i8*) @strcmp(i8* %.tmp4426, i8* %.tmp4428)
%.tmp4430 = icmp eq i32 %.tmp4429, 0
br i1 %.tmp4430, label %.if.true.4431, label %.if.false.4431
.if.true.4431:
%.tmp4432 = getelementptr i8*, i8** %mod_abspath.4390, i32 0
%.tmp4434 = getelementptr [6 x i8], [6 x i8]*@.str4433, i32 0, i32 0
%.tmp4435 = load i8*, i8** %import_str
%.tmp4436 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4432, i8* %.tmp4434, i8* %.tmp4435)
br label %.if.end.4431
.if.false.4431:
%.tmp4437 = getelementptr i8*, i8** %mod_abspath.4390, i32 0
%.tmp4439 = getelementptr [9 x i8], [9 x i8]*@.str4438, i32 0, i32 0
%.tmp4440 = load i8*, i8** %dirname.4393
%.tmp4441 = load i8*, i8** %import_str
%.tmp4442 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4437, i8* %.tmp4439, i8* %.tmp4440, i8* %.tmp4441)
br label %.if.end.4431
.if.end.4431:
br label %.if.end.4417
.if.end.4417:
%.tmp4443 = load i8*, i8** %mod_abspath.4390
ret i8* %.tmp4443
}
define %m2503$.AssignableInfo.type* @m295$compile_fn_call.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp4444 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4445 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4446 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_builtin.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4444, %m878$.Node.type* %.tmp4445)
%info.4447 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4446, %m2503$.AssignableInfo.type** %info.4447
%.tmp4448 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4449 = icmp ne %m2503$.AssignableInfo.type* %.tmp4448, null
br i1 %.tmp4449, label %.if.true.4450, label %.if.false.4450
.if.true.4450:
%.tmp4451 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
ret %m2503$.AssignableInfo.type* %.tmp4451
br label %.if.end.4450
.if.false.4450:
br label %.if.end.4450
.if.end.4450:
%.tmp4452 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4453 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4454 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4452, %m878$.Node.type* %.tmp4453)
store %m2503$.AssignableInfo.type* %.tmp4454, %m2503$.AssignableInfo.type** %info.4447
%.tmp4455 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4456 = icmp eq %m2503$.AssignableInfo.type* %.tmp4455, null
br i1 %.tmp4456, label %.if.true.4457, label %.if.false.4457
.if.true.4457:
%.tmp4458 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4458, label %.if.true.4459, label %.if.false.4459
.if.true.4459:
%.tmp4460 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4461 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4463 = getelementptr [35 x i8], [35 x i8]*@.str4462, i32 0, i32 0
%.tmp4464 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4460, %m878$.Node.type* %.tmp4461, i8* %.tmp4463)
%.tmp4465 = call i32(i8*,...) @printf(i8* %.tmp4464)
br label %.if.end.4459
.if.false.4459:
br label %.if.end.4459
.if.end.4459:
%.tmp4466 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4466
br label %.if.end.4457
.if.false.4457:
br label %.if.end.4457
.if.end.4457:
%.tmp4467 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4469 = getelementptr [8 x i8], [8 x i8]*@.str4468, i32 0, i32 0
%.tmp4470 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4467, i8* %.tmp4469)
%args.4471 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4470, %m878$.Node.type** %args.4471
%.tmp4473 = getelementptr [1 x i8], [1 x i8]*@.str4472, i32 0, i32 0
%params_buff.4474 = alloca i8*
store i8* %.tmp4473, i8** %params_buff.4474
%tmp.4475 = alloca i8*
store i8* null, i8** %tmp.4475
%.tmp4476 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4477 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4476, i32 0, i32 4
%.tmp4478 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4477
%.tmp4479 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4478, i32 0, i32 0
%.tmp4480 = load i8*, i8** %.tmp4479
%.tmp4482 = getelementptr [4 x i8], [4 x i8]*@.str4481, i32 0, i32 0
%.tmp4483 = call i32(i8*,i8*) @strcmp(i8* %.tmp4480, i8* %.tmp4482)
%.tmp4484 = icmp eq i32 %.tmp4483, 0
br i1 %.tmp4484, label %.if.true.4485, label %.if.false.4485
.if.true.4485:
%.tmp4486 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4487 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp4486)
%new_info.4488 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4487, %m2503$.AssignableInfo.type** %new_info.4488
%.tmp4489 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4490 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.4488
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp4489, %m2503$.AssignableInfo.type* %.tmp4490)
%.tmp4491 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.4488
%.tmp4492 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4491, i32 0, i32 4
%.tmp4493 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4494 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4493, i32 0, i32 4
%.tmp4495 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4494
%.tmp4496 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4495, i32 0, i32 3
%.tmp4497 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4496
store %m2503$.Type.type* %.tmp4497, %m2503$.Type.type** %.tmp4492
%.tmp4498 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4499 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4498, i32 0, i32 1
%.tmp4500 = load %m0$.File.type*, %m0$.File.type** %.tmp4499
%.tmp4502 = getelementptr [22 x i8], [22 x i8]*@.str4501, i32 0, i32 0
%.tmp4503 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.4488
%.tmp4504 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4503)
%.tmp4505 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4506 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4507 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4506, i32 0, i32 4
%.tmp4508 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4507
%.tmp4509 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4505, %m2503$.Type.type* %.tmp4508)
%.tmp4510 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4511 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4512 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4511, i32 0, i32 4
%.tmp4513 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4512
%.tmp4514 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4510, %m2503$.Type.type* %.tmp4513)
%.tmp4515 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4516 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4515)
%.tmp4517 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4500, i8* %.tmp4502, i8* %.tmp4504, i8* %.tmp4509, i8* %.tmp4514, i8* %.tmp4516)
%.tmp4518 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.4488
store %m2503$.AssignableInfo.type* %.tmp4518, %m2503$.AssignableInfo.type** %info.4447
br label %.if.end.4485
.if.false.4485:
br label %.if.end.4485
.if.end.4485:
%.tmp4519 = load %m878$.Node.type*, %m878$.Node.type** %args.4471
%.tmp4520 = icmp ne %m878$.Node.type* %.tmp4519, null
br i1 %.tmp4520, label %.if.true.4521, label %.if.false.4521
.if.true.4521:
%.tmp4522 = load %m878$.Node.type*, %m878$.Node.type** %args.4471
%.tmp4523 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4522, i32 0, i32 6
%.tmp4524 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4523
%.tmp4526 = getelementptr [11 x i8], [11 x i8]*@.str4525, i32 0, i32 0
%.tmp4527 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4524, i8* %.tmp4526)
%start.4528 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4527, %m878$.Node.type** %start.4528
%argno.4529 = alloca i32
store i32 1, i32* %argno.4529
%.tmp4530 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4531 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4530, i32 0, i32 4
%.tmp4532 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4531
%.tmp4533 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4532, i32 0, i32 3
%.tmp4534 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4533
%.tmp4535 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4534, i32 0, i32 4
%.tmp4536 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4535
%expect_type.4537 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp4536, %m2503$.Type.type** %expect_type.4537
%provided_args.4538 = alloca i32
store i32 0, i32* %provided_args.4538
%.tmp4540 = load %m878$.Node.type*, %m878$.Node.type** %start.4528
%pp.4541 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4540, %m878$.Node.type** %pp.4541
br label %.for.start.4539
.for.start.4539:
%.tmp4542 = load %m878$.Node.type*, %m878$.Node.type** %pp.4541
%.tmp4543 = icmp ne %m878$.Node.type* %.tmp4542, null
br i1 %.tmp4543, label %.for.continue.4539, label %.for.end.4539
.for.continue.4539:
%.tmp4544 = load i32, i32* %provided_args.4538
%.tmp4545 = add i32 %.tmp4544, 1
store i32 %.tmp4545, i32* %provided_args.4538
%.tmp4546 = load %m878$.Node.type*, %m878$.Node.type** %pp.4541
%.tmp4547 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4546, i32 0, i32 7
%.tmp4548 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4547
%.tmp4550 = getelementptr [11 x i8], [11 x i8]*@.str4549, i32 0, i32 0
%.tmp4551 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4548, i8* %.tmp4550)
store %m878$.Node.type* %.tmp4551, %m878$.Node.type** %pp.4541
br label %.for.start.4539
.for.end.4539:
%.tmp4553 = load %m878$.Node.type*, %m878$.Node.type** %start.4528
%pp.4554 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4553, %m878$.Node.type** %pp.4554
br label %.for.start.4552
.for.start.4552:
%.tmp4555 = load %m878$.Node.type*, %m878$.Node.type** %pp.4554
%.tmp4556 = icmp ne %m878$.Node.type* %.tmp4555, null
br i1 %.tmp4556, label %.for.continue.4552, label %.for.end.4552
.for.continue.4552:
%.tmp4557 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4537
%.tmp4558 = icmp eq %m2503$.Type.type* %.tmp4557, null
br i1 %.tmp4558, label %.if.true.4559, label %.if.false.4559
.if.true.4559:
%.tmp4560 = getelementptr i8*, i8** %tmp.4475, i32 0
%.tmp4562 = getelementptr [43 x i8], [43 x i8]*@.str4561, i32 0, i32 0
%.tmp4563 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4564 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4563, i32 0, i32 2
%.tmp4565 = load i8*, i8** %.tmp4564
%.tmp4566 = load i32, i32* %argno.4529
%.tmp4567 = sub i32 %.tmp4566, 1
%.tmp4568 = load i32, i32* %provided_args.4538
%.tmp4569 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4560, i8* %.tmp4562, i8* %.tmp4565, i32 %.tmp4567, i32 %.tmp4568)
%.tmp4570 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4571 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4572 = load i8*, i8** %tmp.4475
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4570, %m878$.Node.type* %.tmp4571, i8* %.tmp4572)
%.tmp4573 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4573
br label %.if.end.4559
.if.false.4559:
br label %.if.end.4559
.if.end.4559:
%.tmp4574 = load %m878$.Node.type*, %m878$.Node.type** %pp.4554
%.tmp4575 = load %m878$.Node.type*, %m878$.Node.type** %start.4528
%.tmp4576 = icmp ne %m878$.Node.type* %.tmp4574, %.tmp4575
br i1 %.tmp4576, label %.if.true.4577, label %.if.false.4577
.if.true.4577:
%.tmp4578 = getelementptr i8*, i8** %tmp.4475, i32 0
%.tmp4580 = getelementptr [5 x i8], [5 x i8]*@.str4579, i32 0, i32 0
%.tmp4581 = load i8*, i8** %params_buff.4474
%.tmp4582 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4578, i8* %.tmp4580, i8* %.tmp4581)
%.tmp4583 = load i8*, i8** %params_buff.4474
%tmp_buff.4584 = alloca i8*
store i8* %.tmp4583, i8** %tmp_buff.4584
%.tmp4585 = load i8*, i8** %tmp.4475
store i8* %.tmp4585, i8** %params_buff.4474
%.tmp4586 = load i8*, i8** %tmp_buff.4584
store i8* %.tmp4586, i8** %tmp.4475
%.tmp4587 = load i8*, i8** %tmp.4475
call void(i8*) @free(i8* %.tmp4587)
br label %.if.end.4577
.if.false.4577:
br label %.if.end.4577
.if.end.4577:
%.tmp4588 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4589 = load %m878$.Node.type*, %m878$.Node.type** %pp.4554
%.tmp4590 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4588, %m878$.Node.type* %.tmp4589)
%a_info.4591 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4590, %m2503$.AssignableInfo.type** %a_info.4591
%.tmp4592 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4591
%.tmp4593 = icmp eq %m2503$.AssignableInfo.type* %.tmp4592, null
br i1 %.tmp4593, label %.if.true.4594, label %.if.false.4594
.if.true.4594:
%.tmp4595 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4595
br label %.if.end.4594
.if.false.4594:
br label %.if.end.4594
.if.end.4594:
%.tmp4596 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4537
%.tmp4597 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp4596)
%exp.4598 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp4597, %m2503$.Type.type** %exp.4598
%.tmp4599 = load %m2503$.Type.type*, %m2503$.Type.type** %exp.4598
%.tmp4600 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4599, i32 0, i32 4
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp4600
%.tmp4601 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4537
%.tmp4602 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4601, i32 0, i32 0
%.tmp4603 = load i8*, i8** %.tmp4602
%.tmp4605 = getelementptr [7 x i8], [7 x i8]*@.str4604, i32 0, i32 0
%.tmp4606 = call i32(i8*,i8*) @strcmp(i8* %.tmp4603, i8* %.tmp4605)
%.tmp4607 = icmp ne i32 %.tmp4606, 0
%.tmp4608 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4609 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4591
%.tmp4610 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4609, i32 0, i32 4
%.tmp4611 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4610
%.tmp4612 = load %m2503$.Type.type*, %m2503$.Type.type** %exp.4598
%.tmp4613 = call i1(%m2503$.CompilerCtx.type*,%m2503$.Type.type*,%m2503$.Type.type*) @m295$is_same_type.b.m2503$.CompilerCtx.typep.m2503$.Type.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4608, %m2503$.Type.type* %.tmp4611, %m2503$.Type.type* %.tmp4612)
%.tmp4614 = icmp eq i1 %.tmp4613, 0
%.tmp4615 = and i1 %.tmp4607, %.tmp4614
br i1 %.tmp4615, label %.if.true.4616, label %.if.false.4616
.if.true.4616:
%.tmp4618 = getelementptr [1 x i8], [1 x i8]*@.str4617, i32 0, i32 0
%err_buf.4619 = alloca i8*
store i8* %.tmp4618, i8** %err_buf.4619
%.tmp4620 = getelementptr i8*, i8** %err_buf.4619, i32 0
%.tmp4622 = getelementptr [58 x i8], [58 x i8]*@.str4621, i32 0, i32 0
%.tmp4623 = load i32, i32* %argno.4529
%.tmp4624 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4625 = load %m2503$.Type.type*, %m2503$.Type.type** %exp.4598
%.tmp4626 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4624, %m2503$.Type.type* %.tmp4625)
%.tmp4627 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4628 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4591
%.tmp4629 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4628, i32 0, i32 4
%.tmp4630 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4629
%.tmp4631 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4627, %m2503$.Type.type* %.tmp4630)
%.tmp4632 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4620, i8* %.tmp4622, i32 %.tmp4623, i8* %.tmp4626, i8* %.tmp4631)
%.tmp4633 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4634 = load %m878$.Node.type*, %m878$.Node.type** %pp.4554
%.tmp4635 = load i8*, i8** %err_buf.4619
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4633, %m878$.Node.type* %.tmp4634, i8* %.tmp4635)
%.tmp4636 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4636
br label %.if.end.4616
.if.false.4616:
br label %.if.end.4616
.if.end.4616:
%.tmp4637 = getelementptr i8*, i8** %params_buff.4474, i32 0
%.tmp4639 = getelementptr [8 x i8], [8 x i8]*@.str4638, i32 0, i32 0
%.tmp4640 = load i8*, i8** %params_buff.4474
%.tmp4641 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4642 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4591
%.tmp4643 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4642, i32 0, i32 4
%.tmp4644 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4643
%.tmp4645 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4641, %m2503$.Type.type* %.tmp4644)
%.tmp4646 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4591
%.tmp4647 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4646)
%.tmp4648 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4637, i8* %.tmp4639, i8* %.tmp4640, i8* %.tmp4645, i8* %.tmp4647)
%.tmp4649 = load %m878$.Node.type*, %m878$.Node.type** %pp.4554
%.tmp4650 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4649, i32 0, i32 7
%.tmp4651 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4650
store %m878$.Node.type* %.tmp4651, %m878$.Node.type** %pp.4554
%.tmp4652 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4537
%.tmp4653 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4652, i32 0, i32 0
%.tmp4654 = load i8*, i8** %.tmp4653
%.tmp4656 = getelementptr [7 x i8], [7 x i8]*@.str4655, i32 0, i32 0
%.tmp4657 = call i32(i8*,i8*) @strcmp(i8* %.tmp4654, i8* %.tmp4656)
%.tmp4658 = icmp ne i32 %.tmp4657, 0
br i1 %.tmp4658, label %.if.true.4659, label %.if.false.4659
.if.true.4659:
%.tmp4660 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4537
%.tmp4661 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4660, i32 0, i32 4
%.tmp4662 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4661
store %m2503$.Type.type* %.tmp4662, %m2503$.Type.type** %expect_type.4537
br label %.if.end.4659
.if.false.4659:
br label %.if.end.4659
.if.end.4659:
%.tmp4663 = load i32, i32* %argno.4529
%.tmp4664 = add i32 %.tmp4663, 1
store i32 %.tmp4664, i32* %argno.4529
%.tmp4665 = load %m878$.Node.type*, %m878$.Node.type** %pp.4554
%.tmp4667 = getelementptr [11 x i8], [11 x i8]*@.str4666, i32 0, i32 0
%.tmp4668 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4665, i8* %.tmp4667)
store %m878$.Node.type* %.tmp4668, %m878$.Node.type** %pp.4554
br label %.for.start.4552
.for.end.4552:
%.tmp4669 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4537
%.tmp4670 = icmp ne %m2503$.Type.type* %.tmp4669, null
br i1 %.tmp4670, label %.if.true.4671, label %.if.false.4671
.if.true.4671:
%.tmp4672 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4537
%.tmp4673 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4672, i32 0, i32 0
%.tmp4674 = load i8*, i8** %.tmp4673
%.tmp4676 = getelementptr [7 x i8], [7 x i8]*@.str4675, i32 0, i32 0
%.tmp4677 = call i32(i8*,i8*) @strcmp(i8* %.tmp4674, i8* %.tmp4676)
%.tmp4678 = icmp ne i32 %.tmp4677, 0
br i1 %.tmp4678, label %.if.true.4679, label %.if.false.4679
.if.true.4679:
%.tmp4680 = getelementptr i8*, i8** %tmp.4475, i32 0
%.tmp4682 = getelementptr [43 x i8], [43 x i8]*@.str4681, i32 0, i32 0
%.tmp4683 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4684 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4683, i32 0, i32 2
%.tmp4685 = load i8*, i8** %.tmp4684
%.tmp4686 = load i32, i32* %argno.4529
%.tmp4687 = load i32, i32* %provided_args.4538
%.tmp4688 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4680, i8* %.tmp4682, i8* %.tmp4685, i32 %.tmp4686, i32 %.tmp4687)
%.tmp4689 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4690 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4691 = load i8*, i8** %tmp.4475
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4689, %m878$.Node.type* %.tmp4690, i8* %.tmp4691)
%.tmp4692 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4692
br label %.if.end.4679
.if.false.4679:
br label %.if.end.4679
.if.end.4679:
br label %.if.end.4671
.if.false.4671:
br label %.if.end.4671
.if.end.4671:
br label %.if.end.4521
.if.false.4521:
%.tmp4693 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4694 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4693, i32 0, i32 4
%.tmp4695 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4694
%.tmp4696 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4695, i32 0, i32 3
%.tmp4697 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4696
%.tmp4698 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4697, i32 0, i32 4
%.tmp4699 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4698
%.tmp4700 = icmp ne %m2503$.Type.type* %.tmp4699, null
br i1 %.tmp4700, label %.if.true.4701, label %.if.false.4701
.if.true.4701:
%args_required.4702 = alloca i32
store i32 0, i32* %args_required.4702
%.tmp4704 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4705 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4704, i32 0, i32 4
%.tmp4706 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4705
%.tmp4707 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4706, i32 0, i32 3
%.tmp4708 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4707
%.tmp4709 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4708, i32 0, i32 4
%.tmp4710 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4709
%pp.4711 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp4710, %m2503$.Type.type** %pp.4711
br label %.for.start.4703
.for.start.4703:
%.tmp4712 = load %m2503$.Type.type*, %m2503$.Type.type** %pp.4711
%.tmp4713 = icmp ne %m2503$.Type.type* %.tmp4712, null
br i1 %.tmp4713, label %.for.continue.4703, label %.for.else.4703
.for.continue.4703:
%.tmp4714 = load %m2503$.Type.type*, %m2503$.Type.type** %pp.4711
%.tmp4715 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4714, i32 0, i32 0
%.tmp4716 = load i8*, i8** %.tmp4715
%.tmp4718 = getelementptr [7 x i8], [7 x i8]*@.str4717, i32 0, i32 0
%.tmp4719 = call i32(i8*,i8*) @strcmp(i8* %.tmp4716, i8* %.tmp4718)
%.tmp4720 = icmp eq i32 %.tmp4719, 0
br i1 %.tmp4720, label %.if.true.4721, label %.if.false.4721
.if.true.4721:
br label %.for.end.4703
br label %.if.end.4721
.if.false.4721:
br label %.if.end.4721
.if.end.4721:
%.tmp4722 = load i32, i32* %args_required.4702
%.tmp4723 = add i32 %.tmp4722, 1
store i32 %.tmp4723, i32* %args_required.4702
%.tmp4724 = load %m2503$.Type.type*, %m2503$.Type.type** %pp.4711
%.tmp4725 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4724, i32 0, i32 4
%.tmp4726 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4725
store %m2503$.Type.type* %.tmp4726, %m2503$.Type.type** %pp.4711
br label %.for.start.4703
.for.else.4703:
%.tmp4727 = getelementptr i8*, i8** %tmp.4475, i32 0
%.tmp4729 = getelementptr [42 x i8], [42 x i8]*@.str4728, i32 0, i32 0
%.tmp4730 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4731 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4730, i32 0, i32 2
%.tmp4732 = load i8*, i8** %.tmp4731
%.tmp4733 = load i32, i32* %args_required.4702
%.tmp4734 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4727, i8* %.tmp4729, i8* %.tmp4732, i32 %.tmp4733)
%.tmp4735 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4736 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4737 = load i8*, i8** %tmp.4475
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4735, %m878$.Node.type* %.tmp4736, i8* %.tmp4737)
%.tmp4738 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4738
br label %.for.end.4703
.for.end.4703:
br label %.if.end.4701
.if.false.4701:
br label %.if.end.4701
.if.end.4701:
br label %.if.end.4521
.if.end.4521:
%.tmp4739 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4740 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4741 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4740, i32 0, i32 4
%.tmp4742 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4741
%.tmp4743 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4742, i32 0, i32 3
%.tmp4744 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4743
%.tmp4745 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4739, %m2503$.Type.type* %.tmp4744)
%.tmp4747 = getelementptr [5 x i8], [5 x i8]*@.str4746, i32 0, i32 0
%.tmp4748 = call i32(i8*,i8*) @strcmp(i8* %.tmp4745, i8* %.tmp4747)
%.tmp4749 = icmp eq i32 %.tmp4748, 0
br i1 %.tmp4749, label %.if.true.4750, label %.if.false.4750
.if.true.4750:
%.tmp4751 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4752 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4751, i32 0, i32 1
%.tmp4753 = load %m0$.File.type*, %m0$.File.type** %.tmp4752
%.tmp4755 = getelementptr [16 x i8], [16 x i8]*@.str4754, i32 0, i32 0
%.tmp4756 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4757 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4758 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4757, i32 0, i32 4
%.tmp4759 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4758
%.tmp4760 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4756, %m2503$.Type.type* %.tmp4759)
%.tmp4761 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4762 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4761)
%.tmp4763 = load i8*, i8** %params_buff.4474
%.tmp4764 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4753, i8* %.tmp4755, i8* %.tmp4760, i8* %.tmp4762, i8* %.tmp4763)
%.tmp4765 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4765
br label %.if.end.4750
.if.false.4750:
br label %.if.end.4750
.if.end.4750:
%.tmp4766 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4767 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp4766)
%call_info.4768 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4767, %m2503$.AssignableInfo.type** %call_info.4768
%.tmp4769 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4770 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %call_info.4768
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp4769, %m2503$.AssignableInfo.type* %.tmp4770)
%.tmp4771 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %call_info.4768
%.tmp4772 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4771, i32 0, i32 4
%.tmp4773 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4774 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4773, i32 0, i32 4
%.tmp4775 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4774
%.tmp4776 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4775, i32 0, i32 3
%.tmp4777 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4776
%.tmp4778 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp4777)
store %m2503$.Type.type* %.tmp4778, %m2503$.Type.type** %.tmp4772
%.tmp4779 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %call_info.4768
%.tmp4780 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4779, i32 0, i32 4
%.tmp4781 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4780
%.tmp4782 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4781, i32 0, i32 4
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp4782
%.tmp4783 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4784 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4783, i32 0, i32 1
%.tmp4785 = load %m0$.File.type*, %m0$.File.type** %.tmp4784
%.tmp4787 = getelementptr [21 x i8], [21 x i8]*@.str4786, i32 0, i32 0
%.tmp4788 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %call_info.4768
%.tmp4789 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4788)
%.tmp4790 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4791 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4792 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4791, i32 0, i32 4
%.tmp4793 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4792
%.tmp4794 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4790, %m2503$.Type.type* %.tmp4793)
%.tmp4795 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4447
%.tmp4796 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4795)
%.tmp4797 = load i8*, i8** %params_buff.4474
%.tmp4798 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4785, i8* %.tmp4787, i8* %.tmp4789, i8* %.tmp4794, i8* %.tmp4796, i8* %.tmp4797)
%.tmp4799 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %call_info.4768
%.tmp4800 = bitcast %m2503$.AssignableInfo.type* %.tmp4799 to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4800
}
define void @m295$compile_expression.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%err_msg.4801 = alloca i8*
store i8* null, i8** %err_msg.4801
%.tmp4802 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4803 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4802, i32 0, i32 0
%.tmp4804 = load i8*, i8** %.tmp4803
%expr_type.4805 = alloca i8*
store i8* %.tmp4804, i8** %expr_type.4805
%.tmp4806 = bitcast ptr null to %m2503$.AssignableInfo.type*
%info.4807 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4806, %m2503$.AssignableInfo.type** %info.4807
%assignable.4808 = alloca %m878$.Node.type*
store %m878$.Node.type* null, %m878$.Node.type** %assignable.4808
%.tmp4809 = bitcast ptr null to %m2503$.AssignableInfo.type*
%a_info.4810 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4809, %m2503$.AssignableInfo.type** %a_info.4810
%.tmp4811 = load i8*, i8** %expr_type.4805
%.tmp4813 = getelementptr [7 x i8], [7 x i8]*@.str4812, i32 0, i32 0
%.tmp4814 = call i32(i8*,i8*) @strcmp(i8* %.tmp4811, i8* %.tmp4813)
%.tmp4815 = icmp eq i32 %.tmp4814, 0
br i1 %.tmp4815, label %.if.true.4816, label %.if.false.4816
.if.true.4816:
%.tmp4817 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4818 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4817, i32 0, i32 6
%.tmp4819 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4818
%.tmp4820 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4819, i32 0, i32 7
%.tmp4821 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4820
%.tmp4822 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4821, i32 0, i32 0
%.tmp4823 = load i8*, i8** %.tmp4822
%.tmp4825 = getelementptr [3 x i8], [3 x i8]*@.str4824, i32 0, i32 0
%.tmp4826 = call i32(i8*,i8*) @strcmp(i8* %.tmp4823, i8* %.tmp4825)
%.tmp4827 = icmp ne i32 %.tmp4826, 0
br i1 %.tmp4827, label %.if.true.4828, label %.if.false.4828
.if.true.4828:
%.tmp4829 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4830 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4831 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4830, i32 0, i32 6
%.tmp4832 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4831
%.tmp4833 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4832, i32 0, i32 7
%.tmp4834 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4833
%.tmp4835 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4829, %m878$.Node.type* %.tmp4834)
store %m2503$.AssignableInfo.type* %.tmp4835, %m2503$.AssignableInfo.type** %info.4807
%.tmp4836 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4807
%.tmp4837 = icmp eq %m2503$.AssignableInfo.type* %.tmp4836, null
br i1 %.tmp4837, label %.if.true.4838, label %.if.false.4838
.if.true.4838:
ret void
br label %.if.end.4838
.if.false.4838:
br label %.if.end.4838
.if.end.4838:
%.tmp4839 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4840 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4839, i32 0, i32 1
%.tmp4841 = load %m0$.File.type*, %m0$.File.type** %.tmp4840
%.tmp4843 = getelementptr [11 x i8], [11 x i8]*@.str4842, i32 0, i32 0
%.tmp4844 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4845 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4807
%.tmp4846 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4845, i32 0, i32 4
%.tmp4847 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4846
%.tmp4848 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4844, %m2503$.Type.type* %.tmp4847)
%.tmp4849 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4807
%.tmp4850 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4849)
%.tmp4851 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4841, i8* %.tmp4843, i8* %.tmp4848, i8* %.tmp4850)
br label %.if.end.4828
.if.false.4828:
%.tmp4852 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4853 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4852, i32 0, i32 1
%.tmp4854 = load %m0$.File.type*, %m0$.File.type** %.tmp4853
%.tmp4856 = getelementptr [10 x i8], [10 x i8]*@.str4855, i32 0, i32 0
%.tmp4857 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4854, i8* %.tmp4856)
br label %.if.end.4828
.if.end.4828:
br label %.if.end.4816
.if.false.4816:
%.tmp4858 = load i8*, i8** %expr_type.4805
%.tmp4860 = getelementptr [3 x i8], [3 x i8]*@.str4859, i32 0, i32 0
%.tmp4861 = call i32(i8*,i8*) @strcmp(i8* %.tmp4858, i8* %.tmp4860)
%.tmp4862 = icmp eq i32 %.tmp4861, 0
br i1 %.tmp4862, label %.if.true.4863, label %.if.false.4863
.if.true.4863:
br label %.if.end.4863
.if.false.4863:
%.tmp4864 = load i8*, i8** %expr_type.4805
%.tmp4866 = getelementptr [8 x i8], [8 x i8]*@.str4865, i32 0, i32 0
%.tmp4867 = call i32(i8*,i8*) @strcmp(i8* %.tmp4864, i8* %.tmp4866)
%.tmp4868 = icmp eq i32 %.tmp4867, 0
br i1 %.tmp4868, label %.if.true.4869, label %.if.false.4869
.if.true.4869:
%.tmp4870 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4871 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4872 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4871, i32 0, i32 6
%.tmp4873 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4872
%.tmp4874 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_fn_call.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4870, %m878$.Node.type* %.tmp4873)
br label %.if.end.4869
.if.false.4869:
%.tmp4875 = load i8*, i8** %expr_type.4805
%.tmp4877 = getelementptr [12 x i8], [12 x i8]*@.str4876, i32 0, i32 0
%.tmp4878 = call i32(i8*,i8*) @strcmp(i8* %.tmp4875, i8* %.tmp4877)
%.tmp4879 = icmp eq i32 %.tmp4878, 0
br i1 %.tmp4879, label %.if.true.4880, label %.if.false.4880
.if.true.4880:
%.tmp4881 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4882 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4883 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_declaration.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4881, %m878$.Node.type* %.tmp4882)
br label %.if.end.4880
.if.false.4880:
%.tmp4884 = load i8*, i8** %expr_type.4805
%.tmp4886 = getelementptr [11 x i8], [11 x i8]*@.str4885, i32 0, i32 0
%.tmp4887 = call i32(i8*,i8*) @strcmp(i8* %.tmp4884, i8* %.tmp4886)
%.tmp4888 = icmp eq i32 %.tmp4887, 0
br i1 %.tmp4888, label %.if.true.4889, label %.if.false.4889
.if.true.4889:
%.tmp4890 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4891 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4890, i32 0, i32 6
%.tmp4892 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4891
%.tmp4894 = getelementptr [11 x i8], [11 x i8]*@.str4893, i32 0, i32 0
%.tmp4895 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4892, i8* %.tmp4894)
store %m878$.Node.type* %.tmp4895, %m878$.Node.type** %assignable.4808
%.tmp4896 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4897 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4898 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4897, i32 0, i32 6
%.tmp4899 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4898
%.tmp4900 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4896, %m878$.Node.type* %.tmp4899)
%dest.4901 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4900, %m2503$.AssignableInfo.type** %dest.4901
%.tmp4902 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %dest.4901
%.tmp4903 = icmp eq %m2503$.AssignableInfo.type* %.tmp4902, null
br i1 %.tmp4903, label %.if.true.4904, label %.if.false.4904
.if.true.4904:
ret void
br label %.if.end.4904
.if.false.4904:
br label %.if.end.4904
.if.end.4904:
%.tmp4905 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4906 = load %m878$.Node.type*, %m878$.Node.type** %assignable.4808
%.tmp4907 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4905, %m878$.Node.type* %.tmp4906)
store %m2503$.AssignableInfo.type* %.tmp4907, %m2503$.AssignableInfo.type** %a_info.4810
%.tmp4908 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4810
%.tmp4909 = icmp eq %m2503$.AssignableInfo.type* %.tmp4908, null
br i1 %.tmp4909, label %.if.true.4910, label %.if.false.4910
.if.true.4910:
ret void
br label %.if.end.4910
.if.false.4910:
br label %.if.end.4910
.if.end.4910:
%.tmp4911 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4912 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4810
%.tmp4913 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4912, i32 0, i32 4
%.tmp4914 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4913
%.tmp4915 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %dest.4901
%.tmp4916 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4915, i32 0, i32 4
%.tmp4917 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4916
%.tmp4918 = call i1(%m2503$.CompilerCtx.type*,%m2503$.Type.type*,%m2503$.Type.type*) @m295$is_same_type.b.m2503$.CompilerCtx.typep.m2503$.Type.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4911, %m2503$.Type.type* %.tmp4914, %m2503$.Type.type* %.tmp4917)
%.tmp4919 = icmp eq i1 %.tmp4918, 0
br i1 %.tmp4919, label %.if.true.4920, label %.if.false.4920
.if.true.4920:
%.tmp4922 = getelementptr [1 x i8], [1 x i8]*@.str4921, i32 0, i32 0
%err_buf.4923 = alloca i8*
store i8* %.tmp4922, i8** %err_buf.4923
%.tmp4924 = getelementptr i8*, i8** %err_buf.4923, i32 0
%.tmp4926 = getelementptr [37 x i8], [37 x i8]*@.str4925, i32 0, i32 0
%.tmp4927 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4928 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4810
%.tmp4929 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4928, i32 0, i32 4
%.tmp4930 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4929
%.tmp4931 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4927, %m2503$.Type.type* %.tmp4930)
%.tmp4932 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4933 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %dest.4901
%.tmp4934 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4933, i32 0, i32 4
%.tmp4935 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4934
%.tmp4936 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4932, %m2503$.Type.type* %.tmp4935)
%.tmp4937 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4924, i8* %.tmp4926, i8* %.tmp4931, i8* %.tmp4936)
%.tmp4938 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4939 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4940 = load i8*, i8** %err_buf.4923
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4938, %m878$.Node.type* %.tmp4939, i8* %.tmp4940)
br label %.if.end.4920
.if.false.4920:
br label %.if.end.4920
.if.end.4920:
%.tmp4941 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4942 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %dest.4901
%.tmp4943 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4942, i32 0, i32 4
%.tmp4944 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4943
%.tmp4945 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4941, %m2503$.Type.type* %.tmp4944)
%dest_tr.4946 = alloca i8*
store i8* %.tmp4945, i8** %dest_tr.4946
%.tmp4947 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4948 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4810
%.tmp4949 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4948, i32 0, i32 4
%.tmp4950 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4949
%.tmp4951 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4947, %m2503$.Type.type* %.tmp4950)
%src_tr.4952 = alloca i8*
store i8* %.tmp4951, i8** %src_tr.4952
%.tmp4953 = load i8*, i8** %src_tr.4952
%.tmp4955 = getelementptr [4 x i8], [4 x i8]*@.str4954, i32 0, i32 0
%.tmp4956 = call i32(i8*,i8*) @strcmp(i8* %.tmp4953, i8* %.tmp4955)
%.tmp4957 = icmp eq i32 %.tmp4956, 0
br i1 %.tmp4957, label %.if.true.4958, label %.if.false.4958
.if.true.4958:
%.tmp4959 = load i8*, i8** %dest_tr.4946
store i8* %.tmp4959, i8** %src_tr.4952
br label %.if.end.4958
.if.false.4958:
br label %.if.end.4958
.if.end.4958:
%.tmp4960 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4961 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4960, i32 0, i32 1
%.tmp4962 = load %m0$.File.type*, %m0$.File.type** %.tmp4961
%.tmp4964 = getelementptr [21 x i8], [21 x i8]*@.str4963, i32 0, i32 0
%.tmp4965 = load i8*, i8** %src_tr.4952
%.tmp4966 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4810
%.tmp4967 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4966)
%.tmp4968 = load i8*, i8** %dest_tr.4946
%.tmp4969 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %dest.4901
%.tmp4970 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4969)
%.tmp4971 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4962, i8* %.tmp4964, i8* %.tmp4965, i8* %.tmp4967, i8* %.tmp4968, i8* %.tmp4970)
br label %.if.end.4889
.if.false.4889:
%.tmp4972 = load i8*, i8** %expr_type.4805
%.tmp4974 = getelementptr [9 x i8], [9 x i8]*@.str4973, i32 0, i32 0
%.tmp4975 = call i32(i8*,i8*) @strcmp(i8* %.tmp4972, i8* %.tmp4974)
%.tmp4976 = icmp eq i32 %.tmp4975, 0
br i1 %.tmp4976, label %.if.true.4977, label %.if.false.4977
.if.true.4977:
%.tmp4978 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4979 = load %m878$.Node.type*, %m878$.Node.type** %stmt
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_if_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4978, %m878$.Node.type* %.tmp4979)
br label %.if.end.4977
.if.false.4977:
%.tmp4980 = load i8*, i8** %expr_type.4805
%.tmp4982 = getelementptr [9 x i8], [9 x i8]*@.str4981, i32 0, i32 0
%.tmp4983 = call i32(i8*,i8*) @strcmp(i8* %.tmp4980, i8* %.tmp4982)
%.tmp4984 = icmp eq i32 %.tmp4983, 0
br i1 %.tmp4984, label %.if.true.4985, label %.if.false.4985
.if.true.4985:
%.tmp4986 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4987 = load %m878$.Node.type*, %m878$.Node.type** %stmt
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_for_loop.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4986, %m878$.Node.type* %.tmp4987)
br label %.if.end.4985
.if.false.4985:
%.tmp4988 = load i8*, i8** %expr_type.4805
%.tmp4990 = getelementptr [8 x i8], [8 x i8]*@.str4989, i32 0, i32 0
%.tmp4991 = call i32(i8*,i8*) @strcmp(i8* %.tmp4988, i8* %.tmp4990)
%.tmp4992 = icmp eq i32 %.tmp4991, 0
br i1 %.tmp4992, label %.if.true.4993, label %.if.false.4993
.if.true.4993:
%.tmp4994 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4995 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp4994)
%mod.4996 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp4995, %m2503$.ModuleLookup.type** %mod.4996
%.tmp4997 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.4996
%.tmp4998 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp4997, i32 0, i32 3
%.tmp4999 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp4998
%s.5000 = alloca %m2503$.Scope.type*
store %m2503$.Scope.type* %.tmp4999, %m2503$.Scope.type** %s.5000
%.tmp5001 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5002 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5001, i32 0, i32 6
%.tmp5003 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5002
%.tmp5004 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5003, i32 0, i32 1
%.tmp5005 = load i8*, i8** %.tmp5004
%.tmp5007 = getelementptr [6 x i8], [6 x i8]*@.str5006, i32 0, i32 0
%.tmp5008 = call i32(i8*,i8*) @strcmp(i8* %.tmp5005, i8* %.tmp5007)
%.tmp5009 = icmp eq i32 %.tmp5008, 0
br i1 %.tmp5009, label %.if.true.5010, label %.if.false.5010
.if.true.5010:
br label %.for.start.5011
.for.start.5011:
%.tmp5012 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.5000
%.tmp5013 = icmp ne %m2503$.Scope.type* %.tmp5012, null
br i1 %.tmp5013, label %.for.continue.5011, label %.for.else.5011
.for.continue.5011:
%.tmp5014 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.5000
%.tmp5015 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp5014, i32 0, i32 2
%.tmp5016 = load i8*, i8** %.tmp5015
%.tmp5018 = getelementptr [4 x i8], [4 x i8]*@.str5017, i32 0, i32 0
%.tmp5019 = call i32(i8*,i8*) @strcmp(i8* %.tmp5016, i8* %.tmp5018)
%.tmp5020 = icmp eq i32 %.tmp5019, 0
br i1 %.tmp5020, label %.if.true.5021, label %.if.false.5021
.if.true.5021:
%.tmp5022 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5023 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5022, i32 0, i32 1
%.tmp5024 = load %m0$.File.type*, %m0$.File.type** %.tmp5023
%.tmp5026 = getelementptr [15 x i8], [15 x i8]*@.str5025, i32 0, i32 0
%.tmp5027 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.5000
%.tmp5028 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp5027, i32 0, i32 4
%.tmp5029 = load i8*, i8** %.tmp5028
%.tmp5030 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5024, i8* %.tmp5026, i8* %.tmp5029)
br label %.for.end.5011
br label %.if.end.5021
.if.false.5021:
br label %.if.end.5021
.if.end.5021:
%.tmp5031 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.5000
%.tmp5032 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp5031, i32 0, i32 5
%.tmp5033 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp5032
store %m2503$.Scope.type* %.tmp5033, %m2503$.Scope.type** %s.5000
br label %.for.start.5011
.for.else.5011:
%.tmp5034 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5035 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5037 = getelementptr [48 x i8], [48 x i8]*@.str5036, i32 0, i32 0
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5034, %m878$.Node.type* %.tmp5035, i8* %.tmp5037)
br label %.for.end.5011
.for.end.5011:
br label %.if.end.5010
.if.false.5010:
%.tmp5038 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5039 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5038, i32 0, i32 6
%.tmp5040 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5039
%.tmp5041 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5040, i32 0, i32 1
%.tmp5042 = load i8*, i8** %.tmp5041
%.tmp5044 = getelementptr [9 x i8], [9 x i8]*@.str5043, i32 0, i32 0
%.tmp5045 = call i32(i8*,i8*) @strcmp(i8* %.tmp5042, i8* %.tmp5044)
%.tmp5046 = icmp eq i32 %.tmp5045, 0
br i1 %.tmp5046, label %.if.true.5047, label %.if.false.5047
.if.true.5047:
br label %.for.start.5048
.for.start.5048:
%.tmp5049 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.5000
%.tmp5050 = icmp ne %m2503$.Scope.type* %.tmp5049, null
br i1 %.tmp5050, label %.for.continue.5048, label %.for.else.5048
.for.continue.5048:
%.tmp5051 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.5000
%.tmp5052 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp5051, i32 0, i32 2
%.tmp5053 = load i8*, i8** %.tmp5052
%.tmp5055 = getelementptr [4 x i8], [4 x i8]*@.str5054, i32 0, i32 0
%.tmp5056 = call i32(i8*,i8*) @strcmp(i8* %.tmp5053, i8* %.tmp5055)
%.tmp5057 = icmp eq i32 %.tmp5056, 0
br i1 %.tmp5057, label %.if.true.5058, label %.if.false.5058
.if.true.5058:
%.tmp5059 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5060 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5059, i32 0, i32 1
%.tmp5061 = load %m0$.File.type*, %m0$.File.type** %.tmp5060
%.tmp5063 = getelementptr [15 x i8], [15 x i8]*@.str5062, i32 0, i32 0
%.tmp5064 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.5000
%.tmp5065 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp5064, i32 0, i32 3
%.tmp5066 = load i8*, i8** %.tmp5065
%.tmp5067 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5061, i8* %.tmp5063, i8* %.tmp5066)
br label %.for.end.5048
br label %.if.end.5058
.if.false.5058:
br label %.if.end.5058
.if.end.5058:
%.tmp5068 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.5000
%.tmp5069 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp5068, i32 0, i32 5
%.tmp5070 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp5069
store %m2503$.Scope.type* %.tmp5070, %m2503$.Scope.type** %s.5000
br label %.for.start.5048
.for.else.5048:
%.tmp5071 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5072 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5074 = getelementptr [51 x i8], [51 x i8]*@.str5073, i32 0, i32 0
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5071, %m878$.Node.type* %.tmp5072, i8* %.tmp5074)
br label %.for.end.5048
.for.end.5048:
br label %.if.end.5047
.if.false.5047:
%.tmp5075 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5076 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5078 = getelementptr [40 x i8], [40 x i8]*@.str5077, i32 0, i32 0
%.tmp5079 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5075, %m878$.Node.type* %.tmp5076, i8* %.tmp5078)
%.tmp5080 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5081 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5080, i32 0, i32 6
%.tmp5082 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5081
%.tmp5083 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5082, i32 0, i32 1
%.tmp5084 = load i8*, i8** %.tmp5083
%.tmp5085 = call i32(i8*,...) @printf(i8* %.tmp5079, i8* %.tmp5084)
br label %.if.end.5047
.if.end.5047:
br label %.if.end.5010
.if.end.5010:
br label %.if.end.4993
.if.false.4993:
%.tmp5086 = load i8*, i8** %expr_type.4805
%.tmp5088 = getelementptr [9 x i8], [9 x i8]*@.str5087, i32 0, i32 0
%.tmp5089 = call i32(i8*,i8*) @strcmp(i8* %.tmp5086, i8* %.tmp5088)
%.tmp5090 = icmp eq i32 %.tmp5089, 0
br i1 %.tmp5090, label %.if.true.5091, label %.if.false.5091
.if.true.5091:
%.tmp5092 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5093 = load %m878$.Node.type*, %m878$.Node.type** %stmt
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_closure.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5092, %m878$.Node.type* %.tmp5093)
br label %.if.end.5091
.if.false.5091:
%.tmp5094 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5095 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5097 = getelementptr [34 x i8], [34 x i8]*@.str5096, i32 0, i32 0
%.tmp5098 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5094, %m878$.Node.type* %.tmp5095, i8* %.tmp5097)
%.tmp5099 = load i8*, i8** %expr_type.4805
%.tmp5100 = call i32(i8*,...) @printf(i8* %.tmp5098, i8* %.tmp5099)
br label %.if.end.5091
.if.end.5091:
br label %.if.end.4993
.if.end.4993:
br label %.if.end.4985
.if.end.4985:
br label %.if.end.4977
.if.end.4977:
br label %.if.end.4889
.if.end.4889:
br label %.if.end.4880
.if.end.4880:
br label %.if.end.4869
.if.end.4869:
br label %.if.end.4863
.if.end.4863:
br label %.if.end.4816
.if.end.4816:
ret void
}
define %m2503$.Type.type* @m295$type_ptr_of_chr.m2503$.Type.typep() {
%.tmp5101 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%t.5102 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp5101, %m2503$.Type.type** %t.5102
%.tmp5103 = load %m2503$.Type.type*, %m2503$.Type.type** %t.5102
%.tmp5104 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5103, i32 0, i32 0
%.tmp5106 = getelementptr [4 x i8], [4 x i8]*@.str5105, i32 0, i32 0
store i8* %.tmp5106, i8** %.tmp5104
%.tmp5107 = load %m2503$.Type.type*, %m2503$.Type.type** %t.5102
%.tmp5108 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5107, i32 0, i32 3
%.tmp5109 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5109, %m2503$.Type.type** %.tmp5108
%.tmp5110 = load %m2503$.Type.type*, %m2503$.Type.type** %t.5102
%.tmp5111 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5110, i32 0, i32 3
%.tmp5112 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5111
%.tmp5113 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5112, i32 0, i32 0
%.tmp5115 = getelementptr [4 x i8], [4 x i8]*@.str5114, i32 0, i32 0
store i8* %.tmp5115, i8** %.tmp5113
%.tmp5116 = load %m2503$.Type.type*, %m2503$.Type.type** %t.5102
ret %m2503$.Type.type* %.tmp5116
}
define void @m295$compile_closure.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp5117 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5118 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5117)
%cj_id.5119 = alloca i32
store i32 %.tmp5118, i32* %cj_id.5119
%.tmp5120 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5121 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp5120)
%info_lit.5122 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5121, %m2503$.AssignableInfo.type** %info_lit.5122
%.tmp5123 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5122
%.tmp5124 = load i8, i8* @SCOPE_GLOBAL
%.tmp5126 = getelementptr [21 x i8], [21 x i8]*@.str5125, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp5123, i8 %.tmp5124, i8* %.tmp5126)
%.tmp5127 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5122
%.tmp5128 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5127, i32 0, i32 4
%.tmp5129 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5129, %m2503$.Type.type** %.tmp5128
%.tmp5130 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5122
%.tmp5131 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5130, i32 0, i32 4
%.tmp5132 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5131
%.tmp5133 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5132, i32 0, i32 0
%.tmp5135 = getelementptr [9 x i8], [9 x i8]*@.str5134, i32 0, i32 0
store i8* %.tmp5135, i8** %.tmp5133
%.tmp5136 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5122
%.tmp5137 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5136, i32 0, i32 4
%.tmp5138 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5137
%.tmp5139 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5138, i32 0, i32 3
%.tmp5140 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5140, %m2503$.Type.type** %.tmp5139
%.tmp5141 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5122
%.tmp5142 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5141, i32 0, i32 4
%.tmp5143 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5142
%.tmp5144 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5143, i32 0, i32 3
%.tmp5145 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5144
%.tmp5146 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5145, i32 0, i32 0
%.tmp5148 = getelementptr [5 x i8], [5 x i8]*@.str5147, i32 0, i32 0
store i8* %.tmp5148, i8** %.tmp5146
%.tmp5149 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5122
%.tmp5150 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5149, i32 0, i32 4
%.tmp5151 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5150
%.tmp5152 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5151, i32 0, i32 3
%.tmp5153 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5152
%.tmp5154 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5153, i32 0, i32 4
%.tmp5155 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5155, %m2503$.Type.type** %.tmp5154
%.tmp5156 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5122
%.tmp5157 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5156, i32 0, i32 4
%.tmp5158 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5157
%.tmp5159 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5158, i32 0, i32 3
%.tmp5160 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5159
%.tmp5161 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5160, i32 0, i32 4
%.tmp5162 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5161
%.tmp5163 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5162, i32 0, i32 4
%.tmp5164 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5164, %m2503$.Type.type** %.tmp5163
%.tmp5165 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5122
%.tmp5166 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5165, i32 0, i32 4
%.tmp5167 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5166
%.tmp5168 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5167, i32 0, i32 3
%.tmp5169 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5168
%.tmp5170 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5169, i32 0, i32 4
%.tmp5171 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5170
%.tmp5172 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5171, i32 0, i32 4
%.tmp5173 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5172
%.tmp5174 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5173, i32 0, i32 4
%.tmp5175 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5175, %m2503$.Type.type** %.tmp5174
%.tmp5176 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5178 = getelementptr [21 x i8], [21 x i8]*@.str5177, i32 0, i32 0
%.tmp5180 = getelementptr [7 x i8], [7 x i8]*@.str5179, i32 0, i32 0
%.tmp5181 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5122
call void(%m2503$.CompilerCtx.type*,i8*,i8*,%m2503$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2503$.CompilerCtx.typep.cp.cp.m2503$.AssignableInfo.typep.b.b(%m2503$.CompilerCtx.type* %.tmp5176, i8* %.tmp5178, i8* %.tmp5180, %m2503$.AssignableInfo.type* %.tmp5181, i1 1, i1 0)
%.tmp5182 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5183 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp5182)
%info_lat.5184 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5183, %m2503$.AssignableInfo.type** %info_lat.5184
%.tmp5185 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lat.5184
%.tmp5186 = load i8, i8* @SCOPE_GLOBAL
%.tmp5188 = getelementptr [23 x i8], [23 x i8]*@.str5187, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp5185, i8 %.tmp5186, i8* %.tmp5188)
%.tmp5189 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lat.5184
%.tmp5190 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5189, i32 0, i32 4
%.tmp5191 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5191, %m2503$.Type.type** %.tmp5190
%.tmp5192 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lat.5184
%.tmp5193 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5192, i32 0, i32 4
%.tmp5194 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5193
%.tmp5195 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5194, i32 0, i32 0
%.tmp5197 = getelementptr [9 x i8], [9 x i8]*@.str5196, i32 0, i32 0
store i8* %.tmp5197, i8** %.tmp5195
%.tmp5198 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lat.5184
%.tmp5199 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5198, i32 0, i32 4
%.tmp5200 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5199
%.tmp5201 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5200, i32 0, i32 3
%.tmp5202 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5202, %m2503$.Type.type** %.tmp5201
%.tmp5203 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lat.5184
%.tmp5204 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5203, i32 0, i32 4
%.tmp5205 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5204
%.tmp5206 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5205, i32 0, i32 3
%.tmp5207 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5206
%.tmp5208 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5207, i32 0, i32 4
%.tmp5209 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5209, %m2503$.Type.type** %.tmp5208
%.tmp5210 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5212 = getelementptr [23 x i8], [23 x i8]*@.str5211, i32 0, i32 0
%.tmp5214 = getelementptr [7 x i8], [7 x i8]*@.str5213, i32 0, i32 0
%.tmp5215 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lat.5184
call void(%m2503$.CompilerCtx.type*,i8*,i8*,%m2503$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2503$.CompilerCtx.typep.cp.cp.m2503$.AssignableInfo.typep.b.b(%m2503$.CompilerCtx.type* %.tmp5210, i8* %.tmp5212, i8* %.tmp5214, %m2503$.AssignableInfo.type* %.tmp5215, i1 1, i1 0)
%.tmp5216 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5217 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp5216)
%info_mmap.5218 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5217, %m2503$.AssignableInfo.type** %info_mmap.5218
%.tmp5219 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_mmap.5218
%.tmp5220 = load i8, i8* @SCOPE_GLOBAL
%.tmp5222 = getelementptr [5 x i8], [5 x i8]*@.str5221, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp5219, i8 %.tmp5220, i8* %.tmp5222)
%.tmp5223 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_mmap.5218
%.tmp5224 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5223, i32 0, i32 4
%.tmp5225 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5225, %m2503$.Type.type** %.tmp5224
%.tmp5226 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_mmap.5218
%.tmp5227 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5226, i32 0, i32 4
%.tmp5228 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5227
%.tmp5229 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5228, i32 0, i32 0
%.tmp5231 = getelementptr [9 x i8], [9 x i8]*@.str5230, i32 0, i32 0
store i8* %.tmp5231, i8** %.tmp5229
%.tmp5232 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_mmap.5218
%.tmp5233 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5232, i32 0, i32 4
%.tmp5234 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5233
%.tmp5235 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5234, i32 0, i32 3
%.tmp5236 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5236, %m2503$.Type.type** %.tmp5235
%.tmp5237 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_mmap.5218
%.tmp5238 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5237, i32 0, i32 4
%.tmp5239 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5238
%.tmp5240 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5239, i32 0, i32 3
%.tmp5241 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5240
%lt.5242 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp5241, %m2503$.Type.type** %lt.5242
%.tmp5243 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5244 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5243, i32 0, i32 4
%.tmp5245 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5245, %m2503$.Type.type** %.tmp5244
%.tmp5246 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5247 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5246, i32 0, i32 4
%.tmp5248 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5247
store %m2503$.Type.type* %.tmp5248, %m2503$.Type.type** %lt.5242
%.tmp5249 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5250 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5249, i32 0, i32 4
%.tmp5251 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5251, %m2503$.Type.type** %.tmp5250
%.tmp5252 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5253 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5252, i32 0, i32 4
%.tmp5254 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5253
%.tmp5255 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5254, i32 0, i32 0
%.tmp5257 = getelementptr [4 x i8], [4 x i8]*@.str5256, i32 0, i32 0
store i8* %.tmp5257, i8** %.tmp5255
%.tmp5258 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5259 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5258, i32 0, i32 4
%.tmp5260 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5259
store %m2503$.Type.type* %.tmp5260, %m2503$.Type.type** %lt.5242
%.tmp5261 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5262 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5261, i32 0, i32 4
%.tmp5263 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5263, %m2503$.Type.type** %.tmp5262
%.tmp5264 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5265 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5264, i32 0, i32 4
%.tmp5266 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5265
%.tmp5267 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5266, i32 0, i32 0
%.tmp5269 = getelementptr [4 x i8], [4 x i8]*@.str5268, i32 0, i32 0
store i8* %.tmp5269, i8** %.tmp5267
%.tmp5270 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5271 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5270, i32 0, i32 4
%.tmp5272 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5271
store %m2503$.Type.type* %.tmp5272, %m2503$.Type.type** %lt.5242
%.tmp5273 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5274 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5273, i32 0, i32 4
%.tmp5275 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5275, %m2503$.Type.type** %.tmp5274
%.tmp5276 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5277 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5276, i32 0, i32 4
%.tmp5278 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5277
%.tmp5279 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5278, i32 0, i32 0
%.tmp5281 = getelementptr [4 x i8], [4 x i8]*@.str5280, i32 0, i32 0
store i8* %.tmp5281, i8** %.tmp5279
%.tmp5282 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5283 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5282, i32 0, i32 4
%.tmp5284 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5283
store %m2503$.Type.type* %.tmp5284, %m2503$.Type.type** %lt.5242
%.tmp5285 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5286 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5285, i32 0, i32 4
%.tmp5287 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5287, %m2503$.Type.type** %.tmp5286
%.tmp5288 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5289 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5288, i32 0, i32 4
%.tmp5290 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5289
%.tmp5291 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5290, i32 0, i32 0
%.tmp5293 = getelementptr [4 x i8], [4 x i8]*@.str5292, i32 0, i32 0
store i8* %.tmp5293, i8** %.tmp5291
%.tmp5294 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5295 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5294, i32 0, i32 4
%.tmp5296 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5295
store %m2503$.Type.type* %.tmp5296, %m2503$.Type.type** %lt.5242
%.tmp5297 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5298 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5297, i32 0, i32 4
%.tmp5299 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5299, %m2503$.Type.type** %.tmp5298
%.tmp5300 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5301 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5300, i32 0, i32 4
%.tmp5302 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5301
%.tmp5303 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5302, i32 0, i32 0
%.tmp5305 = getelementptr [4 x i8], [4 x i8]*@.str5304, i32 0, i32 0
store i8* %.tmp5305, i8** %.tmp5303
%.tmp5306 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5242
%.tmp5307 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5306, i32 0, i32 4
%.tmp5308 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5307
store %m2503$.Type.type* %.tmp5308, %m2503$.Type.type** %lt.5242
%.tmp5309 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5311 = getelementptr [5 x i8], [5 x i8]*@.str5310, i32 0, i32 0
%.tmp5313 = getelementptr [7 x i8], [7 x i8]*@.str5312, i32 0, i32 0
%.tmp5314 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_mmap.5218
call void(%m2503$.CompilerCtx.type*,i8*,i8*,%m2503$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2503$.CompilerCtx.typep.cp.cp.m2503$.AssignableInfo.typep.b.b(%m2503$.CompilerCtx.type* %.tmp5309, i8* %.tmp5311, i8* %.tmp5313, %m2503$.AssignableInfo.type* %.tmp5314, i1 1, i1 0)
%.tmp5315 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5316 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5315, i32 0, i32 6
%.tmp5317 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5316
%.tmp5319 = getelementptr [5 x i8], [5 x i8]*@.str5318, i32 0, i32 0
%.tmp5320 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5317, i8* %.tmp5319)
%fn_name_node.5321 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5320, %m878$.Node.type** %fn_name_node.5321
%.tmp5322 = load %m878$.Node.type*, %m878$.Node.type** %fn_name_node.5321
%.tmp5323 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5322, i32 0, i32 1
%.tmp5324 = load i8*, i8** %.tmp5323
%fn_name.5325 = alloca i8*
store i8* %.tmp5324, i8** %fn_name.5325
%.tmp5326 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5327 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp5326)
%info.5328 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5327, %m2503$.AssignableInfo.type** %info.5328
%.tmp5329 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5328
%.tmp5330 = load i8, i8* @SCOPE_LOCAL
%.tmp5331 = load i8*, i8** %fn_name.5325
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp5329, i8 %.tmp5330, i8* %.tmp5331)
%.tmp5332 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5328
%.tmp5333 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5332, i32 0, i32 4
%.tmp5334 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5335 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5336 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5335, i32 0, i32 6
%.tmp5337 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5336
%.tmp5338 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$syn_function_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5334, %m878$.Node.type* %.tmp5337)
store %m2503$.Type.type* %.tmp5338, %m2503$.Type.type** %.tmp5333
%.tmp5339 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5328
%.tmp5340 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5339, i32 0, i32 3
%.tmp5342 = getelementptr [9 x i8], [9 x i8]*@.str5341, i32 0, i32 0
store i8* %.tmp5342, i8** %.tmp5340
%.tmp5343 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5344 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5345 = load i8*, i8** %fn_name.5325
%.tmp5346 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5328
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp5343, %m878$.Node.type* %.tmp5344, i8* %.tmp5345, %m2503$.AssignableInfo.type* %.tmp5346)
%.tmp5347 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5348 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5347)
%closure_id.5349 = alloca i32
store i32 %.tmp5348, i32* %closure_id.5349
%.tmp5350 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5328
%.tmp5351 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5350, i32 0, i32 4
%.tmp5352 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5351
%.tmp5353 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp5352)
%closure_type.5354 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp5353, %m2503$.Type.type** %closure_type.5354
%.tmp5355 = load %m2503$.Type.type*, %m2503$.Type.type** %closure_type.5354
%.tmp5356 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5355, i32 0, i32 3
%.tmp5357 = load %m2503$.Type.type*, %m2503$.Type.type** %closure_type.5354
%.tmp5358 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5357, i32 0, i32 3
%.tmp5359 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5358
%.tmp5360 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp5359)
store %m2503$.Type.type* %.tmp5360, %m2503$.Type.type** %.tmp5356
%.tmp5361 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%ctx_param.5362 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp5361, %m2503$.Type.type** %ctx_param.5362
%.tmp5363 = load %m2503$.Type.type*, %m2503$.Type.type** %ctx_param.5362
%.tmp5364 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5363, i32 0, i32 0
%.tmp5366 = getelementptr [4 x i8], [4 x i8]*@.str5365, i32 0, i32 0
store i8* %.tmp5366, i8** %.tmp5364
%.tmp5367 = load %m2503$.Type.type*, %m2503$.Type.type** %ctx_param.5362
%.tmp5368 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5367, i32 0, i32 3
%.tmp5369 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5369, %m2503$.Type.type** %.tmp5368
%.tmp5370 = load %m2503$.Type.type*, %m2503$.Type.type** %ctx_param.5362
%.tmp5371 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5370, i32 0, i32 3
%.tmp5372 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5371
%.tmp5373 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5372, i32 0, i32 0
%.tmp5375 = getelementptr [7 x i8], [7 x i8]*@.str5374, i32 0, i32 0
store i8* %.tmp5375, i8** %.tmp5373
%.tmp5376 = load %m2503$.Type.type*, %m2503$.Type.type** %ctx_param.5362
%.tmp5377 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5376, i32 0, i32 4
%.tmp5378 = load %m2503$.Type.type*, %m2503$.Type.type** %closure_type.5354
%.tmp5379 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5378, i32 0, i32 3
%.tmp5380 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5379
%.tmp5381 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5380, i32 0, i32 4
%.tmp5382 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5381
store %m2503$.Type.type* %.tmp5382, %m2503$.Type.type** %.tmp5377
%.tmp5383 = load %m2503$.Type.type*, %m2503$.Type.type** %closure_type.5354
%.tmp5384 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5383, i32 0, i32 3
%.tmp5385 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5384
%.tmp5386 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5385, i32 0, i32 4
%.tmp5387 = load %m2503$.Type.type*, %m2503$.Type.type** %ctx_param.5362
store %m2503$.Type.type* %.tmp5387, %m2503$.Type.type** %.tmp5386
%.tmp5389 = getelementptr [1 x i8], [1 x i8]*@.str5388, i32 0, i32 0
%closure_name.5390 = alloca i8*
store i8* %.tmp5389, i8** %closure_name.5390
%.tmp5391 = getelementptr i8*, i8** %closure_name.5390, i32 0
%.tmp5393 = getelementptr [5 x i8], [5 x i8]*@.str5392, i32 0, i32 0
%.tmp5394 = load i32, i32* %closure_id.5349
%.tmp5395 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5391, i8* %.tmp5393, i32 %.tmp5394)
%.tmp5396 = load %m2503$.Type.type*, %m2503$.Type.type** %closure_type.5354
%.tmp5397 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5396, i32 0, i32 3
%.tmp5398 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5397
%.tmp5399 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp5398)
%ret_type.5400 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp5399, %m2503$.Type.type** %ret_type.5400
%.tmp5401 = load %m2503$.Type.type*, %m2503$.Type.type** %ret_type.5400
%.tmp5402 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5401, i32 0, i32 3
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp5402
%.tmp5403 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5404 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5403, i32 0, i32 1
%.tmp5405 = load %m0$.File.type*, %m0$.File.type** %.tmp5404
%.tmp5407 = getelementptr [101 x i8], [101 x i8]*@.str5406, i32 0, i32 0
%.tmp5408 = load i32, i32* %closure_id.5349
%.tmp5409 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5405, i8* %.tmp5407, i32 %.tmp5408)
%.tmp5410 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5411 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5410, i32 0, i32 1
%.tmp5412 = load %m0$.File.type*, %m0$.File.type** %.tmp5411
%.tmp5414 = getelementptr [100 x i8], [100 x i8]*@.str5413, i32 0, i32 0
%.tmp5415 = load i32, i32* %closure_id.5349
%.tmp5416 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5417 = load %m2503$.Type.type*, %m2503$.Type.type** %closure_type.5354
%.tmp5418 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5416, %m2503$.Type.type* %.tmp5417)
%.tmp5419 = load i8*, i8** %closure_name.5390
%.tmp5420 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5412, i8* %.tmp5414, i32 %.tmp5415, i8* %.tmp5418, i8* %.tmp5419)
%.tmp5421 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5422 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5421, i32 0, i32 1
%.tmp5423 = load %m0$.File.type*, %m0$.File.type** %.tmp5422
%.tmp5425 = getelementptr [66 x i8], [66 x i8]*@.str5424, i32 0, i32 0
%.tmp5426 = load i32, i32* %closure_id.5349
%.tmp5427 = load i32, i32* %closure_id.5349
%.tmp5428 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5423, i8* %.tmp5425, i32 %.tmp5426, i32 %.tmp5427)
%.tmp5429 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5430 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5429, i32 0, i32 1
%.tmp5431 = load %m0$.File.type*, %m0$.File.type** %.tmp5430
%.tmp5433 = getelementptr [35 x i8], [35 x i8]*@.str5432, i32 0, i32 0
%.tmp5434 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5328
%.tmp5435 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp5434)
%.tmp5436 = load i32, i32* %closure_id.5349
%.tmp5437 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5438 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5328
%.tmp5439 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5438, i32 0, i32 4
%.tmp5440 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5439
%.tmp5441 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5437, %m2503$.Type.type* %.tmp5440)
%.tmp5442 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5431, i8* %.tmp5433, i8* %.tmp5435, i32 %.tmp5436, i8* %.tmp5441)
%.tmp5443 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5444 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5443, i32 0, i32 1
%.tmp5445 = load %m0$.File.type*, %m0$.File.type** %.tmp5444
%bkp_ctx.5446 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp5445, %m0$.File.type** %bkp_ctx.5446
%.tmp5447 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5448 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5447, i32 0, i32 1
%.tmp5449 = call %m0$.File.type*() @tmpfile()
store %m0$.File.type* %.tmp5449, %m0$.File.type** %.tmp5448
%.tmp5450 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5451 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5450, i32 0, i32 1
%.tmp5452 = load %m0$.File.type*, %m0$.File.type** %.tmp5451
%.tmp5454 = getelementptr [14 x i8], [14 x i8]*@.str5453, i32 0, i32 0
%.tmp5455 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5456 = load %m2503$.Type.type*, %m2503$.Type.type** %ret_type.5400
%.tmp5457 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5455, %m2503$.Type.type* %.tmp5456)
%.tmp5458 = load i8*, i8** %closure_name.5390
%.tmp5459 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5452, i8* %.tmp5454, i8* %.tmp5457, i8* %.tmp5458)
%.tmp5460 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5462 = getelementptr [9 x i8], [9 x i8]*@.str5461, i32 0, i32 0
%.tmp5463 = bitcast ptr null to i8*
%.tmp5464 = bitcast ptr null to i8*
call void(%m2503$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2503$.CompilerCtx.typep.cp.cp.cp(%m2503$.CompilerCtx.type* %.tmp5460, i8* %.tmp5462, i8* %.tmp5463, i8* %.tmp5464)
%.tmp5465 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5466 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5465, i32 0, i32 1
%.tmp5467 = load %m0$.File.type*, %m0$.File.type** %.tmp5466
%.tmp5469 = getelementptr [13 x i8], [13 x i8]*@.str5468, i32 0, i32 0
%.tmp5470 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5471 = load %m2503$.Type.type*, %m2503$.Type.type** %ctx_param.5362
%.tmp5472 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5470, %m2503$.Type.type* %.tmp5471)
%.tmp5473 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5467, i8* %.tmp5469, i8* %.tmp5472)
%.tmp5474 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5475 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5474, i32 0, i32 6
%.tmp5476 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5475
%.tmp5477 = call %m878$.Node.type*(%m878$.Node.type*) @m295$syn_function_params.m878$.Node.typep.m878$.Node.typep(%m878$.Node.type* %.tmp5476)
%params.5478 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5477, %m878$.Node.type** %params.5478
%param_type.5479 = alloca %m2503$.Type.type*
store %m2503$.Type.type* null, %m2503$.Type.type** %param_type.5479
%.tmp5481 = load %m878$.Node.type*, %m878$.Node.type** %params.5478
%param_ptr.5482 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5481, %m878$.Node.type** %param_ptr.5482
br label %.for.start.5480
.for.start.5480:
%.tmp5483 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5482
%.tmp5484 = icmp ne %m878$.Node.type* %.tmp5483, null
br i1 %.tmp5484, label %.for.continue.5480, label %.for.end.5480
.for.continue.5480:
%.tmp5485 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5482
%.tmp5486 = load %m878$.Node.type*, %m878$.Node.type** %params.5478
%.tmp5487 = icmp ne %m878$.Node.type* %.tmp5485, %.tmp5486
br i1 %.tmp5487, label %.if.true.5488, label %.if.false.5488
.if.true.5488:
%.tmp5489 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5482
%.tmp5490 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5489, i32 0, i32 7
%.tmp5491 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5490
store %m878$.Node.type* %.tmp5491, %m878$.Node.type** %param_ptr.5482
br label %.if.end.5488
.if.false.5488:
br label %.if.end.5488
.if.end.5488:
%.tmp5492 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5493 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5492, i32 0, i32 1
%.tmp5494 = load %m0$.File.type*, %m0$.File.type** %.tmp5493
%.tmp5496 = getelementptr [3 x i8], [3 x i8]*@.str5495, i32 0, i32 0
%.tmp5497 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5494, i8* %.tmp5496)
%.tmp5498 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5482
%.tmp5499 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5498, i32 0, i32 0
%.tmp5500 = load i8*, i8** %.tmp5499
%.tmp5502 = getelementptr [5 x i8], [5 x i8]*@.str5501, i32 0, i32 0
%.tmp5503 = call i32(i8*,i8*) @strcmp(i8* %.tmp5500, i8* %.tmp5502)
%.tmp5504 = icmp eq i32 %.tmp5503, 0
br i1 %.tmp5504, label %.if.true.5505, label %.if.false.5505
.if.true.5505:
%.tmp5506 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5507 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5482
%.tmp5508 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5507, i32 0, i32 6
%.tmp5509 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5508
%.tmp5510 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5506, %m878$.Node.type* %.tmp5509)
store %m2503$.Type.type* %.tmp5510, %m2503$.Type.type** %param_type.5479
%.tmp5511 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5482
%.tmp5512 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5511, i32 0, i32 7
%.tmp5513 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5512
store %m878$.Node.type* %.tmp5513, %m878$.Node.type** %param_ptr.5482
br label %.if.end.5505
.if.false.5505:
br label %.if.end.5505
.if.end.5505:
%.tmp5514 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5515 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5514, i32 0, i32 1
%.tmp5516 = load %m0$.File.type*, %m0$.File.type** %.tmp5515
%.tmp5518 = getelementptr [13 x i8], [13 x i8]*@.str5517, i32 0, i32 0
%.tmp5519 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5520 = load %m2503$.Type.type*, %m2503$.Type.type** %param_type.5479
%.tmp5521 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5519, %m2503$.Type.type* %.tmp5520)
%.tmp5522 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5482
%.tmp5523 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5522, i32 0, i32 1
%.tmp5524 = load i8*, i8** %.tmp5523
%.tmp5525 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5516, i8* %.tmp5518, i8* %.tmp5521, i8* %.tmp5524)
%.tmp5526 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5482
%.tmp5527 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5526, i32 0, i32 7
%.tmp5528 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5527
store %m878$.Node.type* %.tmp5528, %m878$.Node.type** %param_ptr.5482
br label %.for.start.5480
.for.end.5480:
%.tmp5529 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5530 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5529, i32 0, i32 1
%.tmp5531 = load %m0$.File.type*, %m0$.File.type** %.tmp5530
%.tmp5533 = getelementptr [5 x i8], [5 x i8]*@.str5532, i32 0, i32 0
%.tmp5534 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5531, i8* %.tmp5533)
%.tmp5535 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5536 = load %m878$.Node.type*, %m878$.Node.type** %params.5478
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_fn_params.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5535, %m878$.Node.type* %.tmp5536)
%.tmp5537 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5538 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5537, i32 0, i32 6
%.tmp5539 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5538
%.tmp5541 = getelementptr [6 x i8], [6 x i8]*@.str5540, i32 0, i32 0
%.tmp5542 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5539, i8* %.tmp5541)
%block.5543 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5542, %m878$.Node.type** %block.5543
%.tmp5544 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5545 = load %m878$.Node.type*, %m878$.Node.type** %block.5543
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5544, %m878$.Node.type* %.tmp5545)
%.tmp5546 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5547 = load %m878$.Node.type*, %m878$.Node.type** %block.5543
%.tmp5548 = load %m2503$.Type.type*, %m2503$.Type.type** %ret_type.5400
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.Type.type*) @m295$check_n_add_implicit_return.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5546, %m878$.Node.type* %.tmp5547, %m2503$.Type.type* %.tmp5548)
%.tmp5549 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
call void(%m2503$.CompilerCtx.type*) @m295$pop_scope.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5549)
%.tmp5550 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5551 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5550, i32 0, i32 1
%.tmp5552 = load %m0$.File.type*, %m0$.File.type** %.tmp5551
%.tmp5554 = getelementptr [3 x i8], [3 x i8]*@.str5553, i32 0, i32 0
%.tmp5555 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5552, i8* %.tmp5554)
%.tmp5556 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5557 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5556, i32 0, i32 1
%.tmp5558 = load %m0$.File.type*, %m0$.File.type** %.tmp5557
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp5558)
%.tmp5559 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5560 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5559, i32 0, i32 1
%.tmp5561 = load %m0$.File.type*, %m0$.File.type** %.tmp5560
%.tmp5562 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp5561)
%.tmp5563 = call i8*(i32) @m1$readall.cp.i(i32 %.tmp5562)
%code.5564 = alloca i8*
store i8* %.tmp5563, i8** %code.5564
%.tmp5565 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5566 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5565, i32 0, i32 1
%.tmp5567 = load %m0$.File.type*, %m0$.File.type** %.tmp5566
%.tmp5568 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp5567)
%.tmp5569 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5570 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5569, i32 0, i32 1
%.tmp5571 = load %m0$.File.type*, %m0$.File.type** %bkp_ctx.5446
store %m0$.File.type* %.tmp5571, %m0$.File.type** %.tmp5570
%.tmp5572 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5573 = load i8*, i8** %code.5564
call void(%m2503$.CompilerCtx.type*,i8*) @m295$append_anon_fn.v.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.tmp5572, i8* %.tmp5573)
ret void
}
define void @m295$check_n_add_implicit_return.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, %m2503$.Type.type* %.return_type.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%return_type = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.return_type.arg, %m2503$.Type.type** %return_type
%.tmp5574 = bitcast ptr null to %m878$.Node.type*
%li.5575 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5574, %m878$.Node.type** %li.5575
%.tmp5576 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5577 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5576, i32 0, i32 6
%.tmp5578 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5577
%.tmp5580 = getelementptr [12 x i8], [12 x i8]*@.str5579, i32 0, i32 0
%.tmp5581 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5578, i8* %.tmp5580)
%exprs.5582 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5581, %m878$.Node.type** %exprs.5582
%.tmp5584 = load %m878$.Node.type*, %m878$.Node.type** %exprs.5582
%.tmp5585 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5584, i32 0, i32 6
%.tmp5586 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5585
%ci.5587 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5586, %m878$.Node.type** %ci.5587
br label %.for.start.5583
.for.start.5583:
%.tmp5588 = load %m878$.Node.type*, %m878$.Node.type** %ci.5587
%.tmp5589 = icmp ne %m878$.Node.type* %.tmp5588, null
br i1 %.tmp5589, label %.for.continue.5583, label %.for.end.5583
.for.continue.5583:
%.tmp5590 = load %m878$.Node.type*, %m878$.Node.type** %ci.5587
%.tmp5591 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5590, i32 0, i32 0
%.tmp5592 = load i8*, i8** %.tmp5591
%.tmp5594 = getelementptr [3 x i8], [3 x i8]*@.str5593, i32 0, i32 0
%.tmp5595 = call i32(i8*,i8*) @strcmp(i8* %.tmp5592, i8* %.tmp5594)
%.tmp5596 = icmp ne i32 %.tmp5595, 0
br i1 %.tmp5596, label %.if.true.5597, label %.if.false.5597
.if.true.5597:
%.tmp5598 = load %m878$.Node.type*, %m878$.Node.type** %ci.5587
store %m878$.Node.type* %.tmp5598, %m878$.Node.type** %li.5575
br label %.if.end.5597
.if.false.5597:
br label %.if.end.5597
.if.end.5597:
%.tmp5599 = load %m878$.Node.type*, %m878$.Node.type** %ci.5587
%.tmp5600 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5599, i32 0, i32 7
%.tmp5601 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5600
store %m878$.Node.type* %.tmp5601, %m878$.Node.type** %ci.5587
br label %.for.start.5583
.for.end.5583:
%.tmp5602 = load %m878$.Node.type*, %m878$.Node.type** %li.5575
%.tmp5603 = icmp ne %m878$.Node.type* %.tmp5602, null
br i1 %.tmp5603, label %.if.true.5604, label %.if.false.5604
.if.true.5604:
%.tmp5605 = load %m878$.Node.type*, %m878$.Node.type** %li.5575
%.tmp5606 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5605, i32 0, i32 6
%.tmp5607 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5606
%.tmp5608 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5607, i32 0, i32 0
%.tmp5609 = load i8*, i8** %.tmp5608
%.tmp5611 = getelementptr [7 x i8], [7 x i8]*@.str5610, i32 0, i32 0
%.tmp5612 = call i32(i8*,i8*) @strcmp(i8* %.tmp5609, i8* %.tmp5611)
%.tmp5613 = icmp eq i32 %.tmp5612, 0
br i1 %.tmp5613, label %.if.true.5614, label %.if.false.5614
.if.true.5614:
ret void
br label %.if.end.5614
.if.false.5614:
br label %.if.end.5614
.if.end.5614:
br label %.if.end.5604
.if.false.5604:
br label %.if.end.5604
.if.end.5604:
%.tmp5615 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5616 = load %m2503$.Type.type*, %m2503$.Type.type** %return_type
%.tmp5617 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5615, %m2503$.Type.type* %.tmp5616)
%.tmp5619 = getelementptr [5 x i8], [5 x i8]*@.str5618, i32 0, i32 0
%.tmp5620 = call i32(i8*,i8*) @strcmp(i8* %.tmp5617, i8* %.tmp5619)
%.tmp5621 = icmp ne i32 %.tmp5620, 0
br i1 %.tmp5621, label %.if.true.5622, label %.if.false.5622
.if.true.5622:
%.tmp5623 = load %m878$.Node.type*, %m878$.Node.type** %li.5575
%.tmp5624 = icmp ne %m878$.Node.type* %.tmp5623, null
br i1 %.tmp5624, label %.if.true.5625, label %.if.false.5625
.if.true.5625:
%.tmp5626 = load %m878$.Node.type*, %m878$.Node.type** %li.5575
store %m878$.Node.type* %.tmp5626, %m878$.Node.type** %stmt
br label %.if.end.5625
.if.false.5625:
br label %.if.end.5625
.if.end.5625:
%.tmp5627 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5628 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5630 = getelementptr [21 x i8], [21 x i8]*@.str5629, i32 0, i32 0
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5627, %m878$.Node.type* %.tmp5628, i8* %.tmp5630)
br label %.if.end.5622
.if.false.5622:
%.tmp5631 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5632 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5631, i32 0, i32 1
%.tmp5633 = load %m0$.File.type*, %m0$.File.type** %.tmp5632
%.tmp5635 = getelementptr [10 x i8], [10 x i8]*@.str5634, i32 0, i32 0
%.tmp5636 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5633, i8* %.tmp5635)
br label %.if.end.5622
.if.end.5622:
ret void
}
define void @m295$compile_for_loop.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp5637 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5638 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5637)
%for_id.5639 = alloca i32
store i32 %.tmp5638, i32* %for_id.5639
%.tmp5640 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5641 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5640, i32 0, i32 6
%.tmp5642 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5641
%.tmp5643 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5642, i32 0, i32 7
%.tmp5644 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5643
%init_stmt.5645 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5644, %m878$.Node.type** %init_stmt.5645
%.tmp5646 = bitcast ptr null to i8*
%begin_lbl.5647 = alloca i8*
store i8* %.tmp5646, i8** %begin_lbl.5647
%.tmp5648 = bitcast ptr null to i8*
%end_lbl.5649 = alloca i8*
store i8* %.tmp5648, i8** %end_lbl.5649
%.tmp5650 = getelementptr i8*, i8** %begin_lbl.5647, i32 0
%.tmp5652 = getelementptr [14 x i8], [14 x i8]*@.str5651, i32 0, i32 0
%.tmp5653 = load i32, i32* %for_id.5639
%.tmp5654 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5650, i8* %.tmp5652, i32 %.tmp5653)
%.tmp5655 = getelementptr i8*, i8** %end_lbl.5649, i32 0
%.tmp5657 = getelementptr [12 x i8], [12 x i8]*@.str5656, i32 0, i32 0
%.tmp5658 = load i32, i32* %for_id.5639
%.tmp5659 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5655, i8* %.tmp5657, i32 %.tmp5658)
%.tmp5660 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5662 = getelementptr [4 x i8], [4 x i8]*@.str5661, i32 0, i32 0
%.tmp5663 = load i8*, i8** %begin_lbl.5647
%.tmp5664 = load i8*, i8** %end_lbl.5649
call void(%m2503$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2503$.CompilerCtx.typep.cp.cp.cp(%m2503$.CompilerCtx.type* %.tmp5660, i8* %.tmp5662, i8* %.tmp5663, i8* %.tmp5664)
%.tmp5665 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5645
%.tmp5666 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5665, i32 0, i32 0
%.tmp5667 = load i8*, i8** %.tmp5666
%.tmp5669 = getelementptr [12 x i8], [12 x i8]*@.str5668, i32 0, i32 0
%.tmp5670 = call i32(i8*,i8*) @strcmp(i8* %.tmp5667, i8* %.tmp5669)
%.tmp5671 = icmp eq i32 %.tmp5670, 0
br i1 %.tmp5671, label %.if.true.5672, label %.if.false.5672
.if.true.5672:
%.tmp5673 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5674 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5645
%.tmp5675 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_declaration.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5673, %m878$.Node.type* %.tmp5674)
br label %.if.end.5672
.if.false.5672:
%.tmp5676 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5645
%.tmp5677 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5676, i32 0, i32 0
%.tmp5678 = load i8*, i8** %.tmp5677
%.tmp5680 = getelementptr [11 x i8], [11 x i8]*@.str5679, i32 0, i32 0
%.tmp5681 = call i32(i8*,i8*) @strcmp(i8* %.tmp5678, i8* %.tmp5680)
%.tmp5682 = icmp eq i32 %.tmp5681, 0
br i1 %.tmp5682, label %.if.true.5683, label %.if.false.5683
.if.true.5683:
%.tmp5684 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5685 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5645
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_expression.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5684, %m878$.Node.type* %.tmp5685)
br label %.if.end.5683
.if.false.5683:
%.tmp5686 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5645
%.tmp5687 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5686, i32 0, i32 0
%.tmp5688 = load i8*, i8** %.tmp5687
%.tmp5690 = getelementptr [9 x i8], [9 x i8]*@.str5689, i32 0, i32 0
%.tmp5691 = call i32(i8*,i8*) @strcmp(i8* %.tmp5688, i8* %.tmp5690)
%.tmp5692 = icmp eq i32 %.tmp5691, 0
br i1 %.tmp5692, label %.if.true.5693, label %.if.false.5693
.if.true.5693:
br label %.if.end.5693
.if.false.5693:
%.tmp5694 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5695 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5645
%.tmp5697 = getelementptr [66 x i8], [66 x i8]*@.str5696, i32 0, i32 0
%.tmp5698 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5694, %m878$.Node.type* %.tmp5695, i8* %.tmp5697)
%.tmp5699 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5645
%.tmp5700 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5699, i32 0, i32 0
%.tmp5701 = load i8*, i8** %.tmp5700
%.tmp5702 = call i32(i8*,...) @printf(i8* %.tmp5698, i8* %.tmp5701)
%.tmp5703 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
call void(%m2503$.CompilerCtx.type*) @m295$pop_scope.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5703)
ret void
br label %.if.end.5693
.if.end.5693:
br label %.if.end.5683
.if.end.5683:
br label %.if.end.5672
.if.end.5672:
%.tmp5704 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5705 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5704, i32 0, i32 1
%.tmp5706 = load %m0$.File.type*, %m0$.File.type** %.tmp5705
%.tmp5708 = getelementptr [26 x i8], [26 x i8]*@.str5707, i32 0, i32 0
%.tmp5709 = load i32, i32* %for_id.5639
%.tmp5710 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5706, i8* %.tmp5708, i32 %.tmp5709)
%.tmp5711 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5712 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5711, i32 0, i32 1
%.tmp5713 = load %m0$.File.type*, %m0$.File.type** %.tmp5712
%.tmp5715 = getelementptr [16 x i8], [16 x i8]*@.str5714, i32 0, i32 0
%.tmp5716 = load i32, i32* %for_id.5639
%.tmp5717 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5713, i8* %.tmp5715, i32 %.tmp5716)
%.tmp5718 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5719 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5718, i32 0, i32 6
%.tmp5720 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5719
%.tmp5722 = getelementptr [9 x i8], [9 x i8]*@.str5721, i32 0, i32 0
%.tmp5723 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5720, i8* %.tmp5722)
%fst_colon.5724 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5723, %m878$.Node.type** %fst_colon.5724
%.tmp5725 = load %m878$.Node.type*, %m878$.Node.type** %fst_colon.5724
%.tmp5726 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5725, i32 0, i32 7
%.tmp5727 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5726
%condition.5728 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5727, %m878$.Node.type** %condition.5728
%.tmp5729 = load %m878$.Node.type*, %m878$.Node.type** %condition.5728
%.tmp5730 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5729, i32 0, i32 0
%.tmp5731 = load i8*, i8** %.tmp5730
%.tmp5733 = getelementptr [9 x i8], [9 x i8]*@.str5732, i32 0, i32 0
%.tmp5734 = call i32(i8*,i8*) @strcmp(i8* %.tmp5731, i8* %.tmp5733)
%.tmp5735 = icmp eq i32 %.tmp5734, 0
br i1 %.tmp5735, label %.if.true.5736, label %.if.false.5736
.if.true.5736:
%.tmp5737 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5738 = load %m878$.Node.type*, %m878$.Node.type** %condition.5728
%.tmp5740 = getelementptr [39 x i8], [39 x i8]*@.str5739, i32 0, i32 0
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5737, %m878$.Node.type* %.tmp5738, i8* %.tmp5740)
ret void
br label %.if.end.5736
.if.false.5736:
br label %.if.end.5736
.if.end.5736:
%.tmp5741 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5742 = load %m878$.Node.type*, %m878$.Node.type** %condition.5728
%.tmp5743 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5741, %m878$.Node.type* %.tmp5742)
%condition_info.5744 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5743, %m2503$.AssignableInfo.type** %condition_info.5744
%.tmp5745 = load %m878$.Node.type*, %m878$.Node.type** %fst_colon.5724
%.tmp5746 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5745, i32 0, i32 7
%.tmp5747 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5746
%.tmp5749 = getelementptr [9 x i8], [9 x i8]*@.str5748, i32 0, i32 0
%.tmp5750 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5747, i8* %.tmp5749)
%snd_colon.5751 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5750, %m878$.Node.type** %snd_colon.5751
%.tmp5752 = load %m878$.Node.type*, %m878$.Node.type** %snd_colon.5751
%.tmp5754 = getelementptr [6 x i8], [6 x i8]*@.str5753, i32 0, i32 0
%.tmp5755 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5752, i8* %.tmp5754)
%for_body.5756 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5755, %m878$.Node.type** %for_body.5756
%.tmp5757 = load %m878$.Node.type*, %m878$.Node.type** %for_body.5756
%.tmp5759 = getelementptr [11 x i8], [11 x i8]*@.str5758, i32 0, i32 0
%.tmp5760 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5757, i8* %.tmp5759)
%else_block.5761 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5760, %m878$.Node.type** %else_block.5761
%.tmp5762 = load i8*, i8** %end_lbl.5649
%on_end.5763 = alloca i8*
store i8* %.tmp5762, i8** %on_end.5763
%.tmp5764 = load %m878$.Node.type*, %m878$.Node.type** %else_block.5761
%.tmp5765 = icmp ne %m878$.Node.type* %.tmp5764, null
br i1 %.tmp5765, label %.if.true.5766, label %.if.false.5766
.if.true.5766:
%.tmp5767 = getelementptr i8*, i8** %on_end.5763, i32 0
%.tmp5769 = getelementptr [13 x i8], [13 x i8]*@.str5768, i32 0, i32 0
%.tmp5770 = load i32, i32* %for_id.5639
%.tmp5771 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5767, i8* %.tmp5769, i32 %.tmp5770)
br label %.if.end.5766
.if.false.5766:
br label %.if.end.5766
.if.end.5766:
%.tmp5772 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5773 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5772, i32 0, i32 1
%.tmp5774 = load %m0$.File.type*, %m0$.File.type** %.tmp5773
%.tmp5776 = getelementptr [48 x i8], [48 x i8]*@.str5775, i32 0, i32 0
%.tmp5777 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5778 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %condition_info.5744
%.tmp5779 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5778, i32 0, i32 4
%.tmp5780 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5779
%.tmp5781 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5777, %m2503$.Type.type* %.tmp5780)
%.tmp5782 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %condition_info.5744
%.tmp5783 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp5782)
%.tmp5784 = load i32, i32* %for_id.5639
%.tmp5785 = load i8*, i8** %on_end.5763
%.tmp5786 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5774, i8* %.tmp5776, i8* %.tmp5781, i8* %.tmp5783, i32 %.tmp5784, i8* %.tmp5785)
%.tmp5787 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5788 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5787, i32 0, i32 1
%.tmp5789 = load %m0$.File.type*, %m0$.File.type** %.tmp5788
%.tmp5791 = getelementptr [19 x i8], [19 x i8]*@.str5790, i32 0, i32 0
%.tmp5792 = load i32, i32* %for_id.5639
%.tmp5793 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5789, i8* %.tmp5791, i32 %.tmp5792)
%.tmp5794 = load %m878$.Node.type*, %m878$.Node.type** %snd_colon.5751
%.tmp5795 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5794, i32 0, i32 7
%.tmp5796 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5795
%increment.5797 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5796, %m878$.Node.type** %increment.5797
%.tmp5798 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5799 = load %m878$.Node.type*, %m878$.Node.type** %for_body.5756
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5798, %m878$.Node.type* %.tmp5799)
%.tmp5800 = load %m878$.Node.type*, %m878$.Node.type** %increment.5797
%.tmp5801 = load %m878$.Node.type*, %m878$.Node.type** %for_body.5756
%.tmp5802 = icmp ne %m878$.Node.type* %.tmp5800, %.tmp5801
br i1 %.tmp5802, label %.if.true.5803, label %.if.false.5803
.if.true.5803:
%.tmp5804 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5805 = load %m878$.Node.type*, %m878$.Node.type** %increment.5797
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_expression.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5804, %m878$.Node.type* %.tmp5805)
br label %.if.end.5803
.if.false.5803:
br label %.if.end.5803
.if.end.5803:
%.tmp5806 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5807 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5806, i32 0, i32 1
%.tmp5808 = load %m0$.File.type*, %m0$.File.type** %.tmp5807
%.tmp5810 = getelementptr [15 x i8], [15 x i8]*@.str5809, i32 0, i32 0
%.tmp5811 = load i8*, i8** %begin_lbl.5647
%.tmp5812 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5808, i8* %.tmp5810, i8* %.tmp5811)
%.tmp5813 = load %m878$.Node.type*, %m878$.Node.type** %else_block.5761
%.tmp5814 = icmp ne %m878$.Node.type* %.tmp5813, null
br i1 %.tmp5814, label %.if.true.5815, label %.if.false.5815
.if.true.5815:
%.tmp5816 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5817 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5816, i32 0, i32 1
%.tmp5818 = load %m0$.File.type*, %m0$.File.type** %.tmp5817
%.tmp5820 = getelementptr [15 x i8], [15 x i8]*@.str5819, i32 0, i32 0
%.tmp5821 = load i32, i32* %for_id.5639
%.tmp5822 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5818, i8* %.tmp5820, i32 %.tmp5821)
%.tmp5823 = load %m878$.Node.type*, %m878$.Node.type** %else_block.5761
%.tmp5824 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5823, i32 0, i32 6
%.tmp5825 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5824
%.tmp5827 = getelementptr [6 x i8], [6 x i8]*@.str5826, i32 0, i32 0
%.tmp5828 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5825, i8* %.tmp5827)
%block.5829 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5828, %m878$.Node.type** %block.5829
%.tmp5830 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5831 = load %m878$.Node.type*, %m878$.Node.type** %block.5829
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5830, %m878$.Node.type* %.tmp5831)
%.tmp5832 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5833 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5832, i32 0, i32 1
%.tmp5834 = load %m0$.File.type*, %m0$.File.type** %.tmp5833
%.tmp5836 = getelementptr [15 x i8], [15 x i8]*@.str5835, i32 0, i32 0
%.tmp5837 = load i8*, i8** %end_lbl.5649
%.tmp5838 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5834, i8* %.tmp5836, i8* %.tmp5837)
br label %.if.end.5815
.if.false.5815:
br label %.if.end.5815
.if.end.5815:
%.tmp5839 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5840 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5839, i32 0, i32 1
%.tmp5841 = load %m0$.File.type*, %m0$.File.type** %.tmp5840
%.tmp5843 = getelementptr [5 x i8], [5 x i8]*@.str5842, i32 0, i32 0
%.tmp5844 = load i8*, i8** %end_lbl.5649
%.tmp5845 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5841, i8* %.tmp5843, i8* %.tmp5844)
%.tmp5846 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
call void(%m2503$.CompilerCtx.type*) @m295$pop_scope.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5846)
ret void
}
define %m2503$.AssignableInfo.type* @m295$compile_declaration.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp5847 = bitcast ptr null to %m2503$.Type.type*
%decl_type.5848 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp5847, %m2503$.Type.type** %decl_type.5848
%.tmp5849 = bitcast ptr null to %m2503$.AssignableInfo.type*
%a_info.5850 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5849, %m2503$.AssignableInfo.type** %a_info.5850
%.tmp5851 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5852 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5851, i32 0, i32 6
%.tmp5853 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5852
%.tmp5854 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5853, i32 0, i32 0
%.tmp5855 = load i8*, i8** %.tmp5854
%.tmp5857 = getelementptr [5 x i8], [5 x i8]*@.str5856, i32 0, i32 0
%.tmp5858 = call i32(i8*,i8*) @strcmp(i8* %.tmp5855, i8* %.tmp5857)
%.tmp5859 = icmp eq i32 %.tmp5858, 0
br i1 %.tmp5859, label %.if.true.5860, label %.if.false.5860
.if.true.5860:
%.tmp5861 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5862 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5863 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5862, i32 0, i32 6
%.tmp5864 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5863
%.tmp5865 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5864, i32 0, i32 6
%.tmp5866 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5865
%.tmp5867 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5861, %m878$.Node.type* %.tmp5866)
store %m2503$.Type.type* %.tmp5867, %m2503$.Type.type** %decl_type.5848
br label %.if.end.5860
.if.false.5860:
br label %.if.end.5860
.if.end.5860:
%.tmp5868 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5869 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5868, i32 0, i32 6
%.tmp5870 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5869
%.tmp5872 = getelementptr [11 x i8], [11 x i8]*@.str5871, i32 0, i32 0
%.tmp5873 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5870, i8* %.tmp5872)
%assignable.5874 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5873, %m878$.Node.type** %assignable.5874
%.tmp5875 = load %m878$.Node.type*, %m878$.Node.type** %assignable.5874
%.tmp5876 = icmp ne %m878$.Node.type* %.tmp5875, null
br i1 %.tmp5876, label %.if.true.5877, label %.if.false.5877
.if.true.5877:
%.tmp5878 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5879 = load %m878$.Node.type*, %m878$.Node.type** %assignable.5874
%.tmp5880 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5878, %m878$.Node.type* %.tmp5879)
store %m2503$.AssignableInfo.type* %.tmp5880, %m2503$.AssignableInfo.type** %a_info.5850
br label %.if.end.5877
.if.false.5877:
br label %.if.end.5877
.if.end.5877:
%.tmp5881 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5882 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp5881)
%info.5883 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5882, %m2503$.AssignableInfo.type** %info.5883
%.tmp5884 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5883
%.tmp5885 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5884, i32 0, i32 3
%.tmp5887 = getelementptr [9 x i8], [9 x i8]*@.str5886, i32 0, i32 0
store i8* %.tmp5887, i8** %.tmp5885
%.tmp5888 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5889 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5888, i32 0, i32 6
%.tmp5890 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5889
%.tmp5892 = getelementptr [5 x i8], [5 x i8]*@.str5891, i32 0, i32 0
%.tmp5893 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5890, i8* %.tmp5892)
%var_name.5894 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5893, %m878$.Node.type** %var_name.5894
%.tmp5895 = load %m878$.Node.type*, %m878$.Node.type** %var_name.5894
%.tmp5896 = icmp eq %m878$.Node.type* %.tmp5895, null
br i1 %.tmp5896, label %.if.true.5897, label %.if.false.5897
.if.true.5897:
%.tmp5898 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5899 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5901 = getelementptr [31 x i8], [31 x i8]*@.str5900, i32 0, i32 0
%.tmp5902 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5898, %m878$.Node.type* %.tmp5899, i8* %.tmp5901)
%.tmp5903 = call i32(i8*,...) @printf(i8* %.tmp5902)
%.tmp5904 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp5904
br label %.if.end.5897
.if.false.5897:
br label %.if.end.5897
.if.end.5897:
%.tmp5905 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5906 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5905)
%mod.5907 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp5906, %m2503$.ModuleLookup.type** %mod.5907
%.tmp5908 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5909 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.5907
%.tmp5910 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp5909, i32 0, i32 3
%.tmp5911 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp5910
%.tmp5912 = load %m878$.Node.type*, %m878$.Node.type** %var_name.5894
%.tmp5913 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5912, i32 0, i32 1
%.tmp5914 = load i8*, i8** %.tmp5913
%.tmp5915 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,%m2503$.Scope.type*,i8*) @m295$find_defined_here.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.m2503$.Scope.typep.cp(%m2503$.CompilerCtx.type* %.tmp5908, %m2503$.Scope.type* %.tmp5911, i8* %.tmp5914)
%.tmp5916 = icmp ne %m2503$.ScopeItem.type* %.tmp5915, null
br i1 %.tmp5916, label %.if.true.5917, label %.if.false.5917
.if.true.5917:
%err_buf.5918 = alloca i8*
store i8* null, i8** %err_buf.5918
%.tmp5919 = getelementptr i8*, i8** %err_buf.5918, i32 0
%.tmp5921 = getelementptr [43 x i8], [43 x i8]*@.str5920, i32 0, i32 0
%.tmp5922 = load %m878$.Node.type*, %m878$.Node.type** %var_name.5894
%.tmp5923 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5922, i32 0, i32 1
%.tmp5924 = load i8*, i8** %.tmp5923
%.tmp5925 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5919, i8* %.tmp5921, i8* %.tmp5924)
%.tmp5926 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5927 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5928 = load i8*, i8** %err_buf.5918
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5926, %m878$.Node.type* %.tmp5927, i8* %.tmp5928)
%.tmp5929 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp5929
br label %.if.end.5917
.if.false.5917:
br label %.if.end.5917
.if.end.5917:
%var_id.5930 = alloca i8*
store i8* null, i8** %var_id.5930
%.tmp5931 = getelementptr i8*, i8** %var_id.5930, i32 0
%.tmp5933 = getelementptr [6 x i8], [6 x i8]*@.str5932, i32 0, i32 0
%.tmp5934 = load %m878$.Node.type*, %m878$.Node.type** %var_name.5894
%.tmp5935 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5934, i32 0, i32 1
%.tmp5936 = load i8*, i8** %.tmp5935
%.tmp5937 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5938 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5937)
%.tmp5939 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5931, i8* %.tmp5933, i8* %.tmp5936, i32 %.tmp5938)
%.tmp5940 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5883
%.tmp5941 = load i8, i8* @SCOPE_LOCAL
%.tmp5942 = load i8*, i8** %var_id.5930
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp5940, i8 %.tmp5941, i8* %.tmp5942)
%.tmp5943 = load %m2503$.Type.type*, %m2503$.Type.type** %decl_type.5848
%.tmp5944 = icmp ne %m2503$.Type.type* %.tmp5943, null
br i1 %.tmp5944, label %.if.true.5945, label %.if.false.5945
.if.true.5945:
%.tmp5946 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5883
%.tmp5947 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5946, i32 0, i32 4
%.tmp5948 = load %m2503$.Type.type*, %m2503$.Type.type** %decl_type.5848
store %m2503$.Type.type* %.tmp5948, %m2503$.Type.type** %.tmp5947
br label %.if.end.5945
.if.false.5945:
%.tmp5949 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5850
%.tmp5950 = icmp ne %m2503$.AssignableInfo.type* %.tmp5949, null
br i1 %.tmp5950, label %.if.true.5951, label %.if.false.5951
.if.true.5951:
%.tmp5952 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5883
%.tmp5953 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5952, i32 0, i32 4
%.tmp5954 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5850
%.tmp5955 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5954, i32 0, i32 4
%.tmp5956 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5955
store %m2503$.Type.type* %.tmp5956, %m2503$.Type.type** %.tmp5953
br label %.if.end.5951
.if.false.5951:
br label %.if.end.5951
.if.end.5951:
br label %.if.end.5945
.if.end.5945:
%.tmp5957 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5958 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5883
%.tmp5959 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5958, i32 0, i32 4
%.tmp5960 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5959
%.tmp5961 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5957, %m2503$.Type.type* %.tmp5960)
%var_type_repr.5962 = alloca i8*
store i8* %.tmp5961, i8** %var_type_repr.5962
%.tmp5963 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5850
%.tmp5964 = icmp ne %m2503$.AssignableInfo.type* %.tmp5963, null
br i1 %.tmp5964, label %.if.true.5965, label %.if.false.5965
.if.true.5965:
%.tmp5966 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5967 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5850
%.tmp5968 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5967, i32 0, i32 4
%.tmp5969 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5968
%.tmp5970 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5966, %m2503$.Type.type* %.tmp5969)
%a_type_repr.5971 = alloca i8*
store i8* %.tmp5970, i8** %a_type_repr.5971
%type_error.5972 = alloca i1
store i1 0, i1* %type_error.5972
%.tmp5973 = load i8*, i8** %a_type_repr.5971
%.tmp5974 = call i32(i8*) @strlen(i8* %.tmp5973)
%.tmp5975 = load i8*, i8** %var_type_repr.5962
%.tmp5976 = call i32(i8*) @strlen(i8* %.tmp5975)
%.tmp5977 = icmp ne i32 %.tmp5974, %.tmp5976
br i1 %.tmp5977, label %.if.true.5978, label %.if.false.5978
.if.true.5978:
store i1 1, i1* %type_error.5972
br label %.if.end.5978
.if.false.5978:
%.tmp5979 = load i8*, i8** %a_type_repr.5971
%.tmp5980 = load i8*, i8** %var_type_repr.5962
%.tmp5981 = call i32(i8*,i8*) @strcmp(i8* %.tmp5979, i8* %.tmp5980)
%.tmp5982 = icmp ne i32 %.tmp5981, 0
br i1 %.tmp5982, label %.if.true.5983, label %.if.false.5983
.if.true.5983:
store i1 1, i1* %type_error.5972
br label %.if.end.5983
.if.false.5983:
br label %.if.end.5983
.if.end.5983:
br label %.if.end.5978
.if.end.5978:
%.tmp5984 = load i1, i1* %type_error.5972
br i1 %.tmp5984, label %.if.true.5985, label %.if.false.5985
.if.true.5985:
%.tmp5986 = bitcast ptr null to i8*
%err_msg.5987 = alloca i8*
store i8* %.tmp5986, i8** %err_msg.5987
%.tmp5988 = getelementptr i8*, i8** %err_msg.5987, i32 0
%.tmp5990 = getelementptr [49 x i8], [49 x i8]*@.str5989, i32 0, i32 0
%.tmp5991 = load i8*, i8** %a_type_repr.5971
%.tmp5992 = load i8*, i8** %var_type_repr.5962
%.tmp5993 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5988, i8* %.tmp5990, i8* %.tmp5991, i8* %.tmp5992)
%.tmp5994 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5995 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5996 = load i8*, i8** %err_msg.5987
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5994, %m878$.Node.type* %.tmp5995, i8* %.tmp5996)
br label %.if.end.5985
.if.false.5985:
br label %.if.end.5985
.if.end.5985:
br label %.if.end.5965
.if.false.5965:
br label %.if.end.5965
.if.end.5965:
%.tmp5997 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5998 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5999 = load %m878$.Node.type*, %m878$.Node.type** %var_name.5894
%.tmp6000 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5999, i32 0, i32 1
%.tmp6001 = load i8*, i8** %.tmp6000
%.tmp6002 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5883
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp5997, %m878$.Node.type* %.tmp5998, i8* %.tmp6001, %m2503$.AssignableInfo.type* %.tmp6002)
%.tmp6003 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6004 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6003, i32 0, i32 1
%.tmp6005 = load %m0$.File.type*, %m0$.File.type** %.tmp6004
%.tmp6007 = getelementptr [16 x i8], [16 x i8]*@.str6006, i32 0, i32 0
%.tmp6008 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5883
%.tmp6009 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6008)
%.tmp6010 = load i8*, i8** %var_type_repr.5962
%.tmp6011 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6005, i8* %.tmp6007, i8* %.tmp6009, i8* %.tmp6010)
%.tmp6012 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5850
%.tmp6013 = icmp ne %m2503$.AssignableInfo.type* %.tmp6012, null
br i1 %.tmp6013, label %.if.true.6014, label %.if.false.6014
.if.true.6014:
%.tmp6015 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6016 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6015, i32 0, i32 1
%.tmp6017 = load %m0$.File.type*, %m0$.File.type** %.tmp6016
%.tmp6019 = getelementptr [21 x i8], [21 x i8]*@.str6018, i32 0, i32 0
%.tmp6020 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6021 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5850
%.tmp6022 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6021, i32 0, i32 4
%.tmp6023 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6022
%.tmp6024 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6020, %m2503$.Type.type* %.tmp6023)
%.tmp6025 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5850
%.tmp6026 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6025)
%.tmp6027 = load i8*, i8** %var_type_repr.5962
%.tmp6028 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5883
%.tmp6029 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6028)
%.tmp6030 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6017, i8* %.tmp6019, i8* %.tmp6024, i8* %.tmp6026, i8* %.tmp6027, i8* %.tmp6029)
br label %.if.end.6014
.if.false.6014:
%.tmp6031 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6032 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6033 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5883
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.AssignableInfo.type*) @m295$compile_zero_value.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6031, %m878$.Node.type* %.tmp6032, %m2503$.AssignableInfo.type* %.tmp6033)
br label %.if.end.6014
.if.end.6014:
%.tmp6034 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5883
ret %m2503$.AssignableInfo.type* %.tmp6034
}
define void @m295$compile_zero_value.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, %m2503$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%info = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.info.arg, %m2503$.AssignableInfo.type** %info
%.tmp6035 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6036 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6035, i32 0, i32 4
%.tmp6037 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6036
%.tmp6038 = icmp eq %m2503$.Type.type* %.tmp6037, null
br i1 %.tmp6038, label %.if.true.6039, label %.if.false.6039
.if.true.6039:
ret void
br label %.if.end.6039
.if.false.6039:
br label %.if.end.6039
.if.end.6039:
%.tmp6040 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6041 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6042 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6041, i32 0, i32 4
%.tmp6043 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6042
%.tmp6044 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6040, %m2503$.Type.type* %.tmp6043)
%t_repr.6045 = alloca i8*
store i8* %.tmp6044, i8** %t_repr.6045
%.tmp6046 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6047 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6046)
%id.6048 = alloca i8*
store i8* %.tmp6047, i8** %id.6048
%field_id.6049 = alloca i32
store i32 0, i32* %field_id.6049
%field.6050 = alloca %m2503$.Type.type*
store %m2503$.Type.type* null, %m2503$.Type.type** %field.6050
%field_info.6051 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* null, %m2503$.AssignableInfo.type** %field_info.6051
%.tmp6052 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6053 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6052, i32 0, i32 4
%.tmp6054 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6053
%t.6055 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp6054, %m2503$.Type.type** %t.6055
%.tmp6056 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6055
%.tmp6057 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6056, i32 0, i32 0
%.tmp6058 = load i8*, i8** %.tmp6057
%.tmp6060 = getelementptr [4 x i8], [4 x i8]*@.str6059, i32 0, i32 0
%.tmp6061 = call i32(i8*,i8*) @strcmp(i8* %.tmp6058, i8* %.tmp6060)
%.tmp6062 = icmp eq i32 %.tmp6061, 0
%.tmp6063 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6055
%.tmp6064 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6063, i32 0, i32 0
%.tmp6065 = load i8*, i8** %.tmp6064
%.tmp6067 = getelementptr [4 x i8], [4 x i8]*@.str6066, i32 0, i32 0
%.tmp6068 = call i32(i8*,i8*) @strcmp(i8* %.tmp6065, i8* %.tmp6067)
%.tmp6069 = icmp eq i32 %.tmp6068, 0
%.tmp6070 = or i1 %.tmp6062, %.tmp6069
%.tmp6071 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6055
%.tmp6072 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6071, i32 0, i32 0
%.tmp6073 = load i8*, i8** %.tmp6072
%.tmp6075 = getelementptr [5 x i8], [5 x i8]*@.str6074, i32 0, i32 0
%.tmp6076 = call i32(i8*,i8*) @strcmp(i8* %.tmp6073, i8* %.tmp6075)
%.tmp6077 = icmp eq i32 %.tmp6076, 0
%.tmp6078 = or i1 %.tmp6070, %.tmp6077
br i1 %.tmp6078, label %.if.true.6079, label %.if.false.6079
.if.true.6079:
%.tmp6080 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6081 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6080, i32 0, i32 1
%.tmp6082 = load %m0$.File.type*, %m0$.File.type** %.tmp6081
%.tmp6084 = getelementptr [21 x i8], [21 x i8]*@.str6083, i32 0, i32 0
%.tmp6085 = load i8*, i8** %t_repr.6045
%.tmp6086 = load i8*, i8** %t_repr.6045
%.tmp6087 = load i8*, i8** %id.6048
%.tmp6088 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6082, i8* %.tmp6084, i8* %.tmp6085, i32 0, i8* %.tmp6086, i8* %.tmp6087)
br label %.if.end.6079
.if.false.6079:
%.tmp6089 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6055
%.tmp6090 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6089, i32 0, i32 0
%.tmp6091 = load i8*, i8** %.tmp6090
%.tmp6093 = getelementptr [4 x i8], [4 x i8]*@.str6092, i32 0, i32 0
%.tmp6094 = call i32(i8*,i8*) @strcmp(i8* %.tmp6091, i8* %.tmp6093)
%.tmp6095 = icmp eq i32 %.tmp6094, 0
br i1 %.tmp6095, label %.if.true.6096, label %.if.false.6096
.if.true.6096:
%.tmp6097 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6098 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6097, i32 0, i32 1
%.tmp6099 = load %m0$.File.type*, %m0$.File.type** %.tmp6098
%.tmp6101 = getelementptr [21 x i8], [21 x i8]*@.str6100, i32 0, i32 0
%.tmp6102 = load i8*, i8** %t_repr.6045
%.tmp6104 = getelementptr [5 x i8], [5 x i8]*@.str6103, i32 0, i32 0
%.tmp6105 = load i8*, i8** %t_repr.6045
%.tmp6106 = load i8*, i8** %id.6048
%.tmp6107 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6099, i8* %.tmp6101, i8* %.tmp6102, i8* %.tmp6104, i8* %.tmp6105, i8* %.tmp6106)
br label %.if.end.6096
.if.false.6096:
%.tmp6108 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6055
%.tmp6109 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6108, i32 0, i32 0
%.tmp6110 = load i8*, i8** %.tmp6109
%.tmp6112 = getelementptr [7 x i8], [7 x i8]*@.str6111, i32 0, i32 0
%.tmp6113 = call i32(i8*,i8*) @strcmp(i8* %.tmp6110, i8* %.tmp6112)
%.tmp6114 = icmp eq i32 %.tmp6113, 0
br i1 %.tmp6114, label %.if.true.6115, label %.if.false.6115
.if.true.6115:
%.tmp6117 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6055
%.tmp6118 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6117, i32 0, i32 3
%.tmp6119 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6118
store %m2503$.Type.type* %.tmp6119, %m2503$.Type.type** %field.6050
br label %.for.start.6116
.for.start.6116:
%.tmp6120 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6050
%.tmp6121 = icmp ne %m2503$.Type.type* %.tmp6120, null
br i1 %.tmp6121, label %.for.continue.6116, label %.for.end.6116
.for.continue.6116:
%.tmp6122 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6123 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp6122)
store %m2503$.AssignableInfo.type* %.tmp6123, %m2503$.AssignableInfo.type** %field_info.6051
%.tmp6124 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6125 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.6051
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6124, %m2503$.AssignableInfo.type* %.tmp6125)
%.tmp6126 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.6051
%.tmp6127 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6126, i32 0, i32 4
%.tmp6128 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6050
store %m2503$.Type.type* %.tmp6128, %m2503$.Type.type** %.tmp6127
%.tmp6129 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6130 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6129, i32 0, i32 1
%.tmp6131 = load %m0$.File.type*, %m0$.File.type** %.tmp6130
%.tmp6133 = getelementptr [46 x i8], [46 x i8]*@.str6132, i32 0, i32 0
%.tmp6134 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.6051
%.tmp6135 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6134)
%.tmp6136 = load i8*, i8** %t_repr.6045
%.tmp6137 = load i8*, i8** %t_repr.6045
%.tmp6138 = load i8*, i8** %id.6048
%.tmp6139 = load i32, i32* %field_id.6049
%.tmp6140 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6131, i8* %.tmp6133, i8* %.tmp6135, i8* %.tmp6136, i8* %.tmp6137, i8* %.tmp6138, i32 %.tmp6139)
%.tmp6141 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6142 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6143 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.6051
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.AssignableInfo.type*) @m295$compile_zero_value.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6141, %m878$.Node.type* %.tmp6142, %m2503$.AssignableInfo.type* %.tmp6143)
%.tmp6144 = load i32, i32* %field_id.6049
%.tmp6145 = add i32 %.tmp6144, 1
store i32 %.tmp6145, i32* %field_id.6049
%.tmp6146 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6050
%.tmp6147 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6146, i32 0, i32 4
%.tmp6148 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6147
store %m2503$.Type.type* %.tmp6148, %m2503$.Type.type** %field.6050
br label %.for.start.6116
.for.end.6116:
br label %.if.end.6115
.if.false.6115:
%.tmp6149 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6055
%.tmp6150 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6149, i32 0, i32 0
%.tmp6151 = load i8*, i8** %.tmp6150
%.tmp6153 = getelementptr [10 x i8], [10 x i8]*@.str6152, i32 0, i32 0
%.tmp6154 = call i32(i8*,i8*) @strcmp(i8* %.tmp6151, i8* %.tmp6153)
%.tmp6155 = icmp eq i32 %.tmp6154, 0
br i1 %.tmp6155, label %.if.true.6156, label %.if.false.6156
.if.true.6156:
%.tmp6158 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6055
%.tmp6159 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6158, i32 0, i32 3
%.tmp6160 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6159
%.tmp6161 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6160, i32 0, i32 3
%.tmp6162 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6161
store %m2503$.Type.type* %.tmp6162, %m2503$.Type.type** %field.6050
br label %.for.start.6157
.for.start.6157:
%.tmp6163 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6050
%.tmp6164 = icmp ne %m2503$.Type.type* %.tmp6163, null
br i1 %.tmp6164, label %.for.continue.6157, label %.for.end.6157
.for.continue.6157:
%.tmp6165 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6166 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp6165)
store %m2503$.AssignableInfo.type* %.tmp6166, %m2503$.AssignableInfo.type** %field_info.6051
%.tmp6167 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6168 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.6051
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6167, %m2503$.AssignableInfo.type* %.tmp6168)
%.tmp6169 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.6051
%.tmp6170 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6169, i32 0, i32 4
%.tmp6171 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6050
store %m2503$.Type.type* %.tmp6171, %m2503$.Type.type** %.tmp6170
%.tmp6172 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6173 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6172, i32 0, i32 1
%.tmp6174 = load %m0$.File.type*, %m0$.File.type** %.tmp6173
%.tmp6176 = getelementptr [46 x i8], [46 x i8]*@.str6175, i32 0, i32 0
%.tmp6177 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.6051
%.tmp6178 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6177)
%.tmp6179 = load i8*, i8** %t_repr.6045
%.tmp6180 = load i8*, i8** %t_repr.6045
%.tmp6181 = load i8*, i8** %id.6048
%.tmp6182 = load i32, i32* %field_id.6049
%.tmp6183 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6174, i8* %.tmp6176, i8* %.tmp6178, i8* %.tmp6179, i8* %.tmp6180, i8* %.tmp6181, i32 %.tmp6182)
%.tmp6184 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6185 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6186 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.6051
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.AssignableInfo.type*) @m295$compile_zero_value.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6184, %m878$.Node.type* %.tmp6185, %m2503$.AssignableInfo.type* %.tmp6186)
%.tmp6187 = load i32, i32* %field_id.6049
%.tmp6188 = add i32 %.tmp6187, 1
store i32 %.tmp6188, i32* %field_id.6049
%.tmp6189 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6050
%.tmp6190 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6189, i32 0, i32 4
%.tmp6191 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6190
store %m2503$.Type.type* %.tmp6191, %m2503$.Type.type** %field.6050
br label %.for.start.6157
.for.end.6157:
br label %.if.end.6156
.if.false.6156:
%.tmp6192 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6193 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6195 = getelementptr [44 x i8], [44 x i8]*@.str6194, i32 0, i32 0
%.tmp6196 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6192, %m878$.Node.type* %.tmp6193, i8* %.tmp6195)
%.tmp6197 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6198 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6197, i32 0, i32 4
%.tmp6199 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6198
%.tmp6200 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6199, i32 0, i32 0
%.tmp6201 = load i8*, i8** %.tmp6200
%.tmp6202 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6203 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6204 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6203, i32 0, i32 4
%.tmp6205 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6204
%.tmp6206 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6202, %m2503$.Type.type* %.tmp6205)
%.tmp6207 = call i32(i8*,...) @printf(i8* %.tmp6196, i8* %.tmp6201, i8* %.tmp6206)
ret void
br label %.if.end.6156
.if.end.6156:
br label %.if.end.6115
.if.end.6115:
br label %.if.end.6096
.if.end.6096:
br label %.if.end.6079
.if.end.6079:
ret void
}
define void @m295$compile_if_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp6208 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6209 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6208, i32 0, i32 6
%.tmp6210 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6209
%.tmp6212 = getelementptr [11 x i8], [11 x i8]*@.str6211, i32 0, i32 0
%.tmp6213 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp6210, i8* %.tmp6212)
%assignable.6214 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6213, %m878$.Node.type** %assignable.6214
%.tmp6215 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6216 = load %m878$.Node.type*, %m878$.Node.type** %assignable.6214
%.tmp6217 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6215, %m878$.Node.type* %.tmp6216)
%a_info.6218 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6217, %m2503$.AssignableInfo.type** %a_info.6218
%.tmp6219 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.6218
%.tmp6220 = icmp eq %m2503$.AssignableInfo.type* %.tmp6219, null
br i1 %.tmp6220, label %.if.true.6221, label %.if.false.6221
.if.true.6221:
ret void
br label %.if.end.6221
.if.false.6221:
br label %.if.end.6221
.if.end.6221:
%.tmp6222 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6223 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp6222)
%if_id.6224 = alloca i32
store i32 %.tmp6223, i32* %if_id.6224
%.tmp6225 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6226 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6225, i32 0, i32 1
%.tmp6227 = load %m0$.File.type*, %m0$.File.type** %.tmp6226
%.tmp6229 = getelementptr [53 x i8], [53 x i8]*@.str6228, i32 0, i32 0
%.tmp6230 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6231 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.6218
%.tmp6232 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6231, i32 0, i32 4
%.tmp6233 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6232
%.tmp6234 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6230, %m2503$.Type.type* %.tmp6233)
%.tmp6235 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.6218
%.tmp6236 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6235)
%.tmp6237 = load i32, i32* %if_id.6224
%.tmp6238 = load i32, i32* %if_id.6224
%.tmp6239 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6227, i8* %.tmp6229, i8* %.tmp6234, i8* %.tmp6236, i32 %.tmp6237, i32 %.tmp6238)
%.tmp6240 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6241 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6240, i32 0, i32 1
%.tmp6242 = load %m0$.File.type*, %m0$.File.type** %.tmp6241
%.tmp6244 = getelementptr [14 x i8], [14 x i8]*@.str6243, i32 0, i32 0
%.tmp6245 = load i32, i32* %if_id.6224
%.tmp6246 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6242, i8* %.tmp6244, i32 %.tmp6245)
%.tmp6247 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6248 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6247, i32 0, i32 6
%.tmp6249 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6248
%.tmp6251 = getelementptr [6 x i8], [6 x i8]*@.str6250, i32 0, i32 0
%.tmp6252 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp6249, i8* %.tmp6251)
%block.6253 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6252, %m878$.Node.type** %block.6253
%.tmp6254 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6255 = load %m878$.Node.type*, %m878$.Node.type** %block.6253
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6254, %m878$.Node.type* %.tmp6255)
%.tmp6256 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6257 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6256, i32 0, i32 1
%.tmp6258 = load %m0$.File.type*, %m0$.File.type** %.tmp6257
%.tmp6260 = getelementptr [23 x i8], [23 x i8]*@.str6259, i32 0, i32 0
%.tmp6261 = load i32, i32* %if_id.6224
%.tmp6262 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6258, i8* %.tmp6260, i32 %.tmp6261)
%.tmp6263 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6264 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6263, i32 0, i32 1
%.tmp6265 = load %m0$.File.type*, %m0$.File.type** %.tmp6264
%.tmp6267 = getelementptr [15 x i8], [15 x i8]*@.str6266, i32 0, i32 0
%.tmp6268 = load i32, i32* %if_id.6224
%.tmp6269 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6265, i8* %.tmp6267, i32 %.tmp6268)
%.tmp6270 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6271 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6270, i32 0, i32 6
%.tmp6272 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6271
%.tmp6274 = getelementptr [11 x i8], [11 x i8]*@.str6273, i32 0, i32 0
%.tmp6275 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp6272, i8* %.tmp6274)
%else_block.6276 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6275, %m878$.Node.type** %else_block.6276
%.tmp6277 = load %m878$.Node.type*, %m878$.Node.type** %else_block.6276
%.tmp6278 = icmp ne %m878$.Node.type* %.tmp6277, null
br i1 %.tmp6278, label %.if.true.6279, label %.if.false.6279
.if.true.6279:
%.tmp6280 = load %m878$.Node.type*, %m878$.Node.type** %else_block.6276
%.tmp6281 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6280, i32 0, i32 6
%.tmp6282 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6281
%.tmp6283 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6282, i32 0, i32 0
%.tmp6284 = load i8*, i8** %.tmp6283
%.tmp6286 = getelementptr [11 x i8], [11 x i8]*@.str6285, i32 0, i32 0
%.tmp6287 = call i32(i8*,i8*) @strcmp(i8* %.tmp6284, i8* %.tmp6286)
%.tmp6288 = icmp eq i32 %.tmp6287, 0
br i1 %.tmp6288, label %.if.true.6289, label %.if.false.6289
.if.true.6289:
%.tmp6290 = load %m878$.Node.type*, %m878$.Node.type** %else_block.6276
%.tmp6291 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6290, i32 0, i32 6
%.tmp6292 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6291
%.tmp6293 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6292, i32 0, i32 6
%.tmp6294 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6293
%.tmp6296 = getelementptr [6 x i8], [6 x i8]*@.str6295, i32 0, i32 0
%.tmp6297 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp6294, i8* %.tmp6296)
store %m878$.Node.type* %.tmp6297, %m878$.Node.type** %block.6253
%.tmp6298 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6299 = load %m878$.Node.type*, %m878$.Node.type** %block.6253
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6298, %m878$.Node.type* %.tmp6299)
br label %.if.end.6289
.if.false.6289:
%.tmp6300 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6301 = load %m878$.Node.type*, %m878$.Node.type** %else_block.6276
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_if_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6300, %m878$.Node.type* %.tmp6301)
br label %.if.end.6289
.if.end.6289:
br label %.if.end.6279
.if.false.6279:
br label %.if.end.6279
.if.end.6279:
%.tmp6302 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6303 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6302, i32 0, i32 1
%.tmp6304 = load %m0$.File.type*, %m0$.File.type** %.tmp6303
%.tmp6306 = getelementptr [23 x i8], [23 x i8]*@.str6305, i32 0, i32 0
%.tmp6307 = load i32, i32* %if_id.6224
%.tmp6308 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6304, i8* %.tmp6306, i32 %.tmp6307)
%.tmp6309 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6310 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6309, i32 0, i32 1
%.tmp6311 = load %m0$.File.type*, %m0$.File.type** %.tmp6310
%.tmp6313 = getelementptr [13 x i8], [13 x i8]*@.str6312, i32 0, i32 0
%.tmp6314 = load i32, i32* %if_id.6224
%.tmp6315 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6311, i8* %.tmp6313, i32 %.tmp6314)
ret void
}
define void @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%curr_node = alloca %m878$.Node.type*
store %m878$.Node.type* %.curr_node.arg, %m878$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp6316 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp6317 = icmp ne %m878$.Node.type* %.tmp6316, null
br i1 %.tmp6317, label %.if.true.6318, label %.if.false.6318
.if.true.6318:
%.tmp6319 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6320 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6319, i32 0, i32 7
%.tmp6321 = load i8*, i8** %.tmp6320
%.tmp6322 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp6323 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6322, i32 0, i32 3
%.tmp6324 = load i32, i32* %.tmp6323
%.tmp6325 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp6326 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6325, i32 0, i32 4
%.tmp6327 = load i32, i32* %.tmp6326
%.tmp6328 = load i8*, i8** %msg
%.tmp6329 = call %m296$.Error.type*(i8*,i32,i32,i8*) @m296$new.m296$.Error.typep.cp.i.i.cp(i8* %.tmp6321, i32 %.tmp6324, i32 %.tmp6327, i8* %.tmp6328)
%err.6330 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp6329, %m296$.Error.type** %err.6330
%.tmp6331 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6332 = load %m296$.Error.type*, %m296$.Error.type** %err.6330
call void(%m2503$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2503$.CompilerCtx.typep.m296$.Error.typep(%m2503$.CompilerCtx.type* %.tmp6331, %m296$.Error.type* %.tmp6332)
br label %.if.end.6318
.if.false.6318:
%.tmp6334 = getelementptr [61 x i8], [61 x i8]*@.str6333, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp6334)
br label %.if.end.6318
.if.end.6318:
ret void
}
define void @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, i8* %.name.arg, %m2503$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.info.arg, %m2503$.AssignableInfo.type** %info
%.tmp6335 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6336 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp6335)
%mod.6337 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp6336, %m2503$.ModuleLookup.type** %mod.6337
%.tmp6338 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.6337
%.tmp6339 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp6338, i32 0, i32 3
%.tmp6340 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp6339
%.tmp6341 = icmp ne %m2503$.Scope.type* %.tmp6340, null
%.tmp6343 = getelementptr [82 x i8], [82 x i8]*@.str6342, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6341, i8* %.tmp6343)
%.tmp6344 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.6337
%.tmp6345 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp6344, i32 0, i32 3
%.tmp6346 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp6345
%current_scope.6347 = alloca %m2503$.Scope.type*
store %m2503$.Scope.type* %.tmp6346, %m2503$.Scope.type** %current_scope.6347
%.tmp6348 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* null, i32 1
%.tmp6349 = ptrtoint %m2503$.ScopeItem.type* %.tmp6348 to i32
%.tmp6350 = call i8*(i32) @malloc(i32 %.tmp6349)
%.tmp6351 = bitcast i8* %.tmp6350 to %m2503$.ScopeItem.type*
%newitem.6352 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp6351, %m2503$.ScopeItem.type** %newitem.6352
%.tmp6353 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %newitem.6352
%.tmp6354 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6353, i32 0, i32 0
%.tmp6355 = load i8*, i8** %name
store i8* %.tmp6355, i8** %.tmp6354
%.tmp6356 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %newitem.6352
%.tmp6357 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6356, i32 0, i32 1
%.tmp6358 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
store %m2503$.AssignableInfo.type* %.tmp6358, %m2503$.AssignableInfo.type** %.tmp6357
%.tmp6359 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %newitem.6352
%.tmp6360 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6359, i32 0, i32 2
store %m2503$.ScopeItem.type* null, %m2503$.ScopeItem.type** %.tmp6360
%.tmp6361 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6362 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6361, i32 0, i32 2
%.tmp6363 = load i8*, i8** %name
store i8* %.tmp6363, i8** %.tmp6362
%.tmp6364 = load %m2503$.Scope.type*, %m2503$.Scope.type** %current_scope.6347
%.tmp6365 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp6364, i32 0, i32 1
%.tmp6366 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %.tmp6365
%.tmp6367 = icmp eq %m2503$.ScopeItem.type* %.tmp6366, null
br i1 %.tmp6367, label %.if.true.6368, label %.if.false.6368
.if.true.6368:
%.tmp6369 = load %m2503$.Scope.type*, %m2503$.Scope.type** %current_scope.6347
%.tmp6370 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp6369, i32 0, i32 1
%.tmp6371 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %newitem.6352
store %m2503$.ScopeItem.type* %.tmp6371, %m2503$.ScopeItem.type** %.tmp6370
ret void
br label %.if.end.6368
.if.false.6368:
br label %.if.end.6368
.if.end.6368:
%.tmp6372 = load %m2503$.Scope.type*, %m2503$.Scope.type** %current_scope.6347
%.tmp6373 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp6372, i32 0, i32 1
%.tmp6374 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %.tmp6373
%last_item.6375 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp6374, %m2503$.ScopeItem.type** %last_item.6375
%.tmp6377 = getelementptr [1 x i8], [1 x i8]*@.str6376, i32 0, i32 0
%err_buf.6378 = alloca i8*
store i8* %.tmp6377, i8** %err_buf.6378
%.tmp6379 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %last_item.6375
%.tmp6380 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6379, i32 0, i32 0
%.tmp6381 = load i8*, i8** %.tmp6380
%.tmp6382 = load i8*, i8** %name
%.tmp6383 = call i32(i8*,i8*) @strcmp(i8* %.tmp6381, i8* %.tmp6382)
%.tmp6384 = icmp eq i32 %.tmp6383, 0
br i1 %.tmp6384, label %.if.true.6385, label %.if.false.6385
.if.true.6385:
%.tmp6386 = getelementptr i8*, i8** %err_buf.6378, i32 0
%.tmp6388 = getelementptr [43 x i8], [43 x i8]*@.str6387, i32 0, i32 0
%.tmp6389 = load i8*, i8** %name
%.tmp6390 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6386, i8* %.tmp6388, i8* %.tmp6389)
%.tmp6391 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6392 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6393 = load i8*, i8** %err_buf.6378
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6391, %m878$.Node.type* %.tmp6392, i8* %.tmp6393)
br label %.if.end.6385
.if.false.6385:
br label %.if.end.6385
.if.end.6385:
br label %.for.start.6394
.for.start.6394:
%.tmp6395 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %last_item.6375
%.tmp6396 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6395, i32 0, i32 2
%.tmp6397 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %.tmp6396
%.tmp6398 = icmp ne %m2503$.ScopeItem.type* %.tmp6397, null
br i1 %.tmp6398, label %.for.continue.6394, label %.for.else.6394
.for.continue.6394:
%.tmp6399 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %last_item.6375
%.tmp6400 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6399, i32 0, i32 0
%.tmp6401 = load i8*, i8** %.tmp6400
%.tmp6402 = load i8*, i8** %name
%.tmp6403 = call i32(i8*,i8*) @strcmp(i8* %.tmp6401, i8* %.tmp6402)
%.tmp6404 = icmp eq i32 %.tmp6403, 0
br i1 %.tmp6404, label %.if.true.6405, label %.if.false.6405
.if.true.6405:
%.tmp6406 = getelementptr i8*, i8** %err_buf.6378, i32 0
%.tmp6408 = getelementptr [43 x i8], [43 x i8]*@.str6407, i32 0, i32 0
%.tmp6409 = load i8*, i8** %name
%.tmp6410 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6406, i8* %.tmp6408, i8* %.tmp6409)
%.tmp6411 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6412 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6413 = load i8*, i8** %err_buf.6378
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6411, %m878$.Node.type* %.tmp6412, i8* %.tmp6413)
br label %.for.end.6394
br label %.if.end.6405
.if.false.6405:
br label %.if.end.6405
.if.end.6405:
%.tmp6414 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %last_item.6375
%.tmp6415 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6414, i32 0, i32 2
%.tmp6416 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %.tmp6415
store %m2503$.ScopeItem.type* %.tmp6416, %m2503$.ScopeItem.type** %last_item.6375
br label %.for.start.6394
.for.else.6394:
%.tmp6417 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %last_item.6375
%.tmp6418 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6417, i32 0, i32 2
%.tmp6419 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %newitem.6352
store %m2503$.ScopeItem.type* %.tmp6419, %m2503$.ScopeItem.type** %.tmp6418
br label %.for.end.6394
.for.end.6394:
ret void
}
define %m2503$.ScopeItem.type* @m295$find_defined_in.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m878$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m878$.Node.type*
store %m878$.Node.type* %.dotted_name.arg, %m878$.Node.type** %dotted_name
%err_buf.6420 = alloca i8*
store i8* null, i8** %err_buf.6420
%.tmp6421 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6422 = load i8*, i8** %module
%.tmp6423 = load %m878$.Node.type*, %m878$.Node.type** %dotted_name
%.tmp6424 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6423, i32 0, i32 1
%.tmp6425 = load i8*, i8** %.tmp6424
%.tmp6426 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.cp(%m2503$.CompilerCtx.type* %.tmp6421, i8* %.tmp6422, i8* %.tmp6425)
%found.6427 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp6426, %m2503$.ScopeItem.type** %found.6427
%.tmp6428 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %found.6427
%.tmp6429 = icmp eq %m2503$.ScopeItem.type* %.tmp6428, null
br i1 %.tmp6429, label %.if.true.6430, label %.if.false.6430
.if.true.6430:
%.tmp6431 = getelementptr i8*, i8** %err_buf.6420, i32 0
%.tmp6433 = getelementptr [31 x i8], [31 x i8]*@.str6432, i32 0, i32 0
%.tmp6434 = load %m878$.Node.type*, %m878$.Node.type** %dotted_name
%.tmp6435 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6434, i32 0, i32 1
%.tmp6436 = load i8*, i8** %.tmp6435
%.tmp6437 = load i8*, i8** %module
%.tmp6438 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6431, i8* %.tmp6433, i8* %.tmp6436, i8* %.tmp6437)
%.tmp6439 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6440 = load %m878$.Node.type*, %m878$.Node.type** %dotted_name
%.tmp6441 = load i8*, i8** %err_buf.6420
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6439, %m878$.Node.type* %.tmp6440, i8* %.tmp6441)
%.tmp6442 = bitcast ptr null to %m2503$.ScopeItem.type*
ret %m2503$.ScopeItem.type* %.tmp6442
br label %.if.end.6430
.if.false.6430:
br label %.if.end.6430
.if.end.6430:
br label %.for.start.6443
.for.start.6443:
%.tmp6444 = load %m878$.Node.type*, %m878$.Node.type** %dotted_name
%.tmp6445 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6444, i32 0, i32 7
%.tmp6446 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6445
%.tmp6447 = icmp ne %m878$.Node.type* %.tmp6446, null
%.tmp6448 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %found.6427
%.tmp6449 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6448, i32 0, i32 1
%.tmp6450 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp6449
%.tmp6451 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6450, i32 0, i32 3
%.tmp6452 = load i8*, i8** %.tmp6451
%.tmp6454 = getelementptr [7 x i8], [7 x i8]*@.str6453, i32 0, i32 0
%.tmp6455 = call i32(i8*,i8*) @strcmp(i8* %.tmp6452, i8* %.tmp6454)
%.tmp6456 = icmp eq i32 %.tmp6455, 0
%.tmp6457 = and i1 %.tmp6447, %.tmp6456
br i1 %.tmp6457, label %.for.continue.6443, label %.for.end.6443
.for.continue.6443:
%.tmp6458 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6459 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %found.6427
%.tmp6460 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6459, i32 0, i32 1
%.tmp6461 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp6460
%.tmp6462 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6461, i32 0, i32 0
%.tmp6463 = load i8*, i8** %.tmp6462
%.tmp6464 = load %m878$.Node.type*, %m878$.Node.type** %dotted_name
%.tmp6465 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6464, i32 0, i32 7
%.tmp6466 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6465
%.tmp6467 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6466, i32 0, i32 7
%.tmp6468 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6467
%.tmp6469 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,i8*,%m878$.Node.type*) @m295$find_defined_in.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6458, i8* %.tmp6463, %m878$.Node.type* %.tmp6468)
store %m2503$.ScopeItem.type* %.tmp6469, %m2503$.ScopeItem.type** %found.6427
%.tmp6470 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %found.6427
%.tmp6471 = icmp eq %m2503$.ScopeItem.type* %.tmp6470, null
br i1 %.tmp6471, label %.if.true.6472, label %.if.false.6472
.if.true.6472:
%.tmp6473 = bitcast ptr null to %m2503$.ScopeItem.type*
ret %m2503$.ScopeItem.type* %.tmp6473
br label %.if.end.6472
.if.false.6472:
br label %.if.end.6472
.if.end.6472:
br label %.for.start.6443
.for.end.6443:
%.tmp6474 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %found.6427
ret %m2503$.ScopeItem.type* %.tmp6474
}
define %m2503$.ScopeItem.type* @m295$find_defined_here.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.m2503$.Scope.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%s = alloca %m2503$.Scope.type*
store %m2503$.Scope.type* %.s.arg, %m2503$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp6475 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s
%.tmp6476 = icmp eq %m2503$.Scope.type* %.tmp6475, null
br i1 %.tmp6476, label %.if.true.6477, label %.if.false.6477
.if.true.6477:
%.tmp6478 = bitcast ptr null to %m2503$.ScopeItem.type*
ret %m2503$.ScopeItem.type* %.tmp6478
br label %.if.end.6477
.if.false.6477:
br label %.if.end.6477
.if.end.6477:
%.tmp6480 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s
%.tmp6481 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp6480, i32 0, i32 1
%.tmp6482 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %.tmp6481
%item.6483 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp6482, %m2503$.ScopeItem.type** %item.6483
br label %.for.start.6479
.for.start.6479:
%.tmp6484 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %item.6483
%.tmp6485 = icmp ne %m2503$.ScopeItem.type* %.tmp6484, null
br i1 %.tmp6485, label %.for.continue.6479, label %.for.end.6479
.for.continue.6479:
%.tmp6486 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %item.6483
%.tmp6487 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6486, i32 0, i32 0
%.tmp6488 = load i8*, i8** %.tmp6487
%.tmp6489 = load i8*, i8** %name
%.tmp6490 = call i32(i8*,i8*) @strcmp(i8* %.tmp6488, i8* %.tmp6489)
%.tmp6491 = icmp eq i32 %.tmp6490, 0
br i1 %.tmp6491, label %.if.true.6492, label %.if.false.6492
.if.true.6492:
%.tmp6493 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %item.6483
ret %m2503$.ScopeItem.type* %.tmp6493
br label %.if.end.6492
.if.false.6492:
br label %.if.end.6492
.if.end.6492:
%.tmp6494 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %item.6483
%.tmp6495 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6494, i32 0, i32 2
%.tmp6496 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %.tmp6495
store %m2503$.ScopeItem.type* %.tmp6496, %m2503$.ScopeItem.type** %item.6483
br label %.for.start.6479
.for.end.6479:
%.tmp6497 = bitcast ptr null to %m2503$.ScopeItem.type*
ret %m2503$.ScopeItem.type* %.tmp6497
}
define %m2503$.ScopeItem.type* @m295$find_defined_str.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.cp(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp6498 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6499 = load i8*, i8** %module
%.tmp6500 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*,i8*) @m295$get_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.tmp6498, i8* %.tmp6499)
%mod.6501 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp6500, %m2503$.ModuleLookup.type** %mod.6501
%.tmp6502 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.6501
%.tmp6503 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp6502, i32 0, i32 3
%.tmp6504 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp6503
%.tmp6505 = icmp ne %m2503$.Scope.type* %.tmp6504, null
%.tmp6507 = getelementptr [77 x i8], [77 x i8]*@.str6506, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6505, i8* %.tmp6507)
%.tmp6509 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.6501
%.tmp6510 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp6509, i32 0, i32 3
%.tmp6511 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp6510
%s.6512 = alloca %m2503$.Scope.type*
store %m2503$.Scope.type* %.tmp6511, %m2503$.Scope.type** %s.6512
br label %.for.start.6508
.for.start.6508:
%.tmp6513 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.6512
%.tmp6514 = icmp ne %m2503$.Scope.type* %.tmp6513, null
br i1 %.tmp6514, label %.for.continue.6508, label %.for.end.6508
.for.continue.6508:
%.tmp6515 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6516 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.6512
%.tmp6517 = load i8*, i8** %assignable_name
%.tmp6518 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,%m2503$.Scope.type*,i8*) @m295$find_defined_here.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.m2503$.Scope.typep.cp(%m2503$.CompilerCtx.type* %.tmp6515, %m2503$.Scope.type* %.tmp6516, i8* %.tmp6517)
%item.6519 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp6518, %m2503$.ScopeItem.type** %item.6519
%.tmp6520 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %item.6519
%.tmp6521 = icmp ne %m2503$.ScopeItem.type* %.tmp6520, null
br i1 %.tmp6521, label %.if.true.6522, label %.if.false.6522
.if.true.6522:
%.tmp6523 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %item.6519
ret %m2503$.ScopeItem.type* %.tmp6523
br label %.if.end.6522
.if.false.6522:
br label %.if.end.6522
.if.end.6522:
%.tmp6524 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.6512
%.tmp6525 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp6524, i32 0, i32 5
%.tmp6526 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp6525
store %m2503$.Scope.type* %.tmp6526, %m2503$.Scope.type** %s.6512
br label %.for.start.6508
.for.end.6508:
%.tmp6527 = bitcast ptr null to %m2503$.ScopeItem.type*
ret %m2503$.ScopeItem.type* %.tmp6527
}
define %m2503$.ScopeItem.type* @m295$find_defined.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%dotted_name = alloca %m878$.Node.type*
store %m878$.Node.type* %.dotted_name.arg, %m878$.Node.type** %dotted_name
%.tmp6528 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6529 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6530 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6529, i32 0, i32 7
%.tmp6531 = load i8*, i8** %.tmp6530
%.tmp6532 = load %m878$.Node.type*, %m878$.Node.type** %dotted_name
%.tmp6533 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6532, i32 0, i32 6
%.tmp6534 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6533
%.tmp6535 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,i8*,%m878$.Node.type*) @m295$find_defined_in.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6528, i8* %.tmp6531, %m878$.Node.type* %.tmp6534)
ret %m2503$.ScopeItem.type* %.tmp6535
}
define %m2503$.AssignableInfo.type* @m295$get_dotted_name.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.dot_name_ptr.arg, %m2503$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m878$.Node.type*
store %m878$.Node.type* %.dot_name_ptr.arg, %m878$.Node.type** %dot_name_ptr
%info = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.info.arg, %m2503$.AssignableInfo.type** %info
%err_msg.6536 = alloca i8*
store i8* null, i8** %err_msg.6536
%buf.6537 = alloca i8*
store i8* null, i8** %buf.6537
%.tmp6538 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6539 = icmp eq %m2503$.AssignableInfo.type* %.tmp6538, null
br i1 %.tmp6539, label %.if.true.6540, label %.if.false.6540
.if.true.6540:
%.tmp6541 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6542 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6544 = getelementptr [54 x i8], [54 x i8]*@.str6543, i32 0, i32 0
%.tmp6545 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6541, %m878$.Node.type* %.tmp6542, i8* %.tmp6544)
%.tmp6546 = call i32(i8*,...) @printf(i8* %.tmp6545)
%.tmp6547 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6547
br label %.if.end.6540
.if.false.6540:
br label %.if.end.6540
.if.end.6540:
%.tmp6548 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6549 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6548, i32 0, i32 3
%.tmp6550 = load i8*, i8** %.tmp6549
%.tmp6552 = getelementptr [9 x i8], [9 x i8]*@.str6551, i32 0, i32 0
%.tmp6553 = call i32(i8*,i8*) @strcmp(i8* %.tmp6550, i8* %.tmp6552)
%.tmp6554 = icmp eq i32 %.tmp6553, 0
%.tmp6555 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6556 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6555, i32 0, i32 3
%.tmp6557 = load i8*, i8** %.tmp6556
%.tmp6559 = getelementptr [7 x i8], [7 x i8]*@.str6558, i32 0, i32 0
%.tmp6560 = call i32(i8*,i8*) @strcmp(i8* %.tmp6557, i8* %.tmp6559)
%.tmp6561 = icmp eq i32 %.tmp6560, 0
%.tmp6562 = or i1 %.tmp6554, %.tmp6561
br i1 %.tmp6562, label %.if.true.6563, label %.if.false.6563
.if.true.6563:
%.tmp6564 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6565 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6564, i32 0, i32 7
%.tmp6566 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6565
%.tmp6567 = icmp ne %m878$.Node.type* %.tmp6566, null
br i1 %.tmp6567, label %.if.true.6568, label %.if.false.6568
.if.true.6568:
%.tmp6569 = getelementptr i8*, i8** %err_msg.6536, i32 0
%.tmp6571 = getelementptr [46 x i8], [46 x i8]*@.str6570, i32 0, i32 0
%.tmp6572 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6573 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6572, i32 0, i32 7
%.tmp6574 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6573
%.tmp6575 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6574, i32 0, i32 7
%.tmp6576 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6575
%.tmp6577 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6576, i32 0, i32 1
%.tmp6578 = load i8*, i8** %.tmp6577
%.tmp6579 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6580 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6579, i32 0, i32 1
%.tmp6581 = load i8*, i8** %.tmp6580
%.tmp6582 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6569, i8* %.tmp6571, i8* %.tmp6578, i8* %.tmp6581)
%.tmp6583 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6584 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6585 = load i8*, i8** %err_msg.6536
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6583, %m878$.Node.type* %.tmp6584, i8* %.tmp6585)
%.tmp6586 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6586
br label %.if.end.6568
.if.false.6568:
br label %.if.end.6568
.if.end.6568:
%.tmp6587 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
ret %m2503$.AssignableInfo.type* %.tmp6587
br label %.if.end.6563
.if.false.6563:
%.tmp6588 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6589 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6588, i32 0, i32 3
%.tmp6590 = load i8*, i8** %.tmp6589
%.tmp6592 = getelementptr [9 x i8], [9 x i8]*@.str6591, i32 0, i32 0
%.tmp6593 = call i32(i8*,i8*) @strcmp(i8* %.tmp6590, i8* %.tmp6592)
%.tmp6594 = icmp eq i32 %.tmp6593, 0
%.tmp6595 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6596 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6595, i32 0, i32 7
%.tmp6597 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6596
%.tmp6598 = icmp ne %m878$.Node.type* %.tmp6597, null
%.tmp6599 = and i1 %.tmp6594, %.tmp6598
br i1 %.tmp6599, label %.if.true.6600, label %.if.false.6600
.if.true.6600:
%.tmp6601 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%base_var.6602 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6601, %m2503$.AssignableInfo.type** %base_var.6602
%.tmp6603 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6602
%.tmp6604 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6603, i32 0, i32 4
%.tmp6605 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6604
%struct_info.6606 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp6605, %m2503$.Type.type** %struct_info.6606
br label %.for.start.6607
.for.start.6607:
%.tmp6608 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6602
%.tmp6609 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6608, i32 0, i32 4
%.tmp6610 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6609
%.tmp6611 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6610, i32 0, i32 0
%.tmp6612 = load i8*, i8** %.tmp6611
%.tmp6614 = getelementptr [4 x i8], [4 x i8]*@.str6613, i32 0, i32 0
%.tmp6615 = call i32(i8*,i8*) @strcmp(i8* %.tmp6612, i8* %.tmp6614)
%.tmp6616 = icmp eq i32 %.tmp6615, 0
br i1 %.tmp6616, label %.for.continue.6607, label %.for.end.6607
.for.continue.6607:
%.tmp6617 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6618 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp6617)
%new_base.6619 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6618, %m2503$.AssignableInfo.type** %new_base.6619
%.tmp6620 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6621 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6619
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6620, %m2503$.AssignableInfo.type* %.tmp6621)
%.tmp6622 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6619
%.tmp6623 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6622, i32 0, i32 4
%.tmp6624 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6602
%.tmp6625 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6624, i32 0, i32 4
%.tmp6626 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6625
%.tmp6627 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6626, i32 0, i32 3
%.tmp6628 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6627
store %m2503$.Type.type* %.tmp6628, %m2503$.Type.type** %.tmp6623
%.tmp6629 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6630 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6629, i32 0, i32 1
%.tmp6631 = load %m0$.File.type*, %m0$.File.type** %.tmp6630
%.tmp6633 = getelementptr [23 x i8], [23 x i8]*@.str6632, i32 0, i32 0
%.tmp6634 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6619
%.tmp6635 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6634)
%.tmp6636 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6637 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6619
%.tmp6638 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6637, i32 0, i32 4
%.tmp6639 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6638
%.tmp6640 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6636, %m2503$.Type.type* %.tmp6639)
%.tmp6641 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6642 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6602
%.tmp6643 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6642, i32 0, i32 4
%.tmp6644 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6643
%.tmp6645 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6641, %m2503$.Type.type* %.tmp6644)
%.tmp6646 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6602
%.tmp6647 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6646)
%.tmp6648 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6631, i8* %.tmp6633, i8* %.tmp6635, i8* %.tmp6640, i8* %.tmp6645, i8* %.tmp6647)
%.tmp6649 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6619
store %m2503$.AssignableInfo.type* %.tmp6649, %m2503$.AssignableInfo.type** %base_var.6602
%.tmp6650 = load %m2503$.Type.type*, %m2503$.Type.type** %struct_info.6606
%.tmp6651 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6650, i32 0, i32 3
%.tmp6652 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6651
store %m2503$.Type.type* %.tmp6652, %m2503$.Type.type** %struct_info.6606
br label %.for.start.6607
.for.end.6607:
%.tmp6653 = load %m2503$.Type.type*, %m2503$.Type.type** %struct_info.6606
%.tmp6654 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6653, i32 0, i32 0
%.tmp6655 = load i8*, i8** %.tmp6654
%.tmp6657 = getelementptr [10 x i8], [10 x i8]*@.str6656, i32 0, i32 0
%.tmp6658 = call i32(i8*,i8*) @strcmp(i8* %.tmp6655, i8* %.tmp6657)
%.tmp6659 = icmp eq i32 %.tmp6658, 0
br i1 %.tmp6659, label %.if.true.6660, label %.if.false.6660
.if.true.6660:
%.tmp6661 = load %m2503$.Type.type*, %m2503$.Type.type** %struct_info.6606
%.tmp6662 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6661, i32 0, i32 3
%.tmp6663 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6662
store %m2503$.Type.type* %.tmp6663, %m2503$.Type.type** %struct_info.6606
br label %.if.end.6660
.if.false.6660:
br label %.if.end.6660
.if.end.6660:
%.tmp6664 = load %m2503$.Type.type*, %m2503$.Type.type** %struct_info.6606
%.tmp6665 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6664, i32 0, i32 0
%.tmp6666 = load i8*, i8** %.tmp6665
%.tmp6668 = getelementptr [7 x i8], [7 x i8]*@.str6667, i32 0, i32 0
%.tmp6669 = call i32(i8*,i8*) @strcmp(i8* %.tmp6666, i8* %.tmp6668)
%.tmp6670 = icmp ne i32 %.tmp6669, 0
br i1 %.tmp6670, label %.if.true.6671, label %.if.false.6671
.if.true.6671:
%.tmp6672 = getelementptr i8*, i8** %err_msg.6536, i32 0
%.tmp6674 = getelementptr [48 x i8], [48 x i8]*@.str6673, i32 0, i32 0
%.tmp6675 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6676 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6675, i32 0, i32 7
%.tmp6677 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6676
%.tmp6678 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6677, i32 0, i32 7
%.tmp6679 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6678
%.tmp6680 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6679, i32 0, i32 1
%.tmp6681 = load i8*, i8** %.tmp6680
%.tmp6682 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6683 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6682, i32 0, i32 1
%.tmp6684 = load i8*, i8** %.tmp6683
%.tmp6685 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6672, i8* %.tmp6674, i8* %.tmp6681, i8* %.tmp6684)
%.tmp6686 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6687 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6688 = load i8*, i8** %err_msg.6536
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6686, %m878$.Node.type* %.tmp6687, i8* %.tmp6688)
%.tmp6689 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6689
br label %.if.end.6671
.if.false.6671:
br label %.if.end.6671
.if.end.6671:
%.tmp6690 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6691 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6690, i32 0, i32 7
%.tmp6692 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6691
%.tmp6693 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6692, i32 0, i32 7
%.tmp6694 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6693
%.tmp6695 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6694, i32 0, i32 1
%.tmp6696 = load i8*, i8** %.tmp6695
%field_name.6697 = alloca i8*
store i8* %.tmp6696, i8** %field_name.6697
%field_id.6698 = alloca i32
store i32 0, i32* %field_id.6698
%.tmp6699 = bitcast ptr null to %m2503$.Type.type*
%found_field.6700 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp6699, %m2503$.Type.type** %found_field.6700
%.tmp6702 = load %m2503$.Type.type*, %m2503$.Type.type** %struct_info.6606
%.tmp6703 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6702, i32 0, i32 3
%.tmp6704 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6703
%field.6705 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp6704, %m2503$.Type.type** %field.6705
br label %.for.start.6701
.for.start.6701:
%.tmp6706 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6705
%.tmp6707 = icmp ne %m2503$.Type.type* %.tmp6706, null
br i1 %.tmp6707, label %.for.continue.6701, label %.for.end.6701
.for.continue.6701:
%.tmp6708 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6705
%.tmp6709 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6708, i32 0, i32 1
%.tmp6710 = load i8*, i8** %.tmp6709
%.tmp6711 = load i8*, i8** %field_name.6697
%.tmp6712 = call i32(i8*,i8*) @strcmp(i8* %.tmp6710, i8* %.tmp6711)
%.tmp6713 = icmp eq i32 %.tmp6712, 0
br i1 %.tmp6713, label %.if.true.6714, label %.if.false.6714
.if.true.6714:
%.tmp6715 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6705
store %m2503$.Type.type* %.tmp6715, %m2503$.Type.type** %found_field.6700
br label %.for.end.6701
br label %.if.end.6714
.if.false.6714:
%.tmp6716 = load i32, i32* %field_id.6698
%.tmp6717 = add i32 %.tmp6716, 1
store i32 %.tmp6717, i32* %field_id.6698
br label %.if.end.6714
.if.end.6714:
%.tmp6718 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6705
%.tmp6719 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6718, i32 0, i32 4
%.tmp6720 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6719
store %m2503$.Type.type* %.tmp6720, %m2503$.Type.type** %field.6705
br label %.for.start.6701
.for.end.6701:
%.tmp6721 = load %m2503$.Type.type*, %m2503$.Type.type** %found_field.6700
%.tmp6722 = icmp eq %m2503$.Type.type* %.tmp6721, null
br i1 %.tmp6722, label %.if.true.6723, label %.if.false.6723
.if.true.6723:
%.tmp6724 = getelementptr i8*, i8** %err_msg.6536, i32 0
%.tmp6726 = getelementptr [34 x i8], [34 x i8]*@.str6725, i32 0, i32 0
%.tmp6727 = load i8*, i8** %field_name.6697
%.tmp6728 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6729 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6728, i32 0, i32 1
%.tmp6730 = load i8*, i8** %.tmp6729
%.tmp6731 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6724, i8* %.tmp6726, i8* %.tmp6727, i8* %.tmp6730)
%.tmp6732 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6733 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6734 = load i8*, i8** %err_msg.6536
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6732, %m878$.Node.type* %.tmp6733, i8* %.tmp6734)
%.tmp6735 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6735
br label %.if.end.6723
.if.false.6723:
br label %.if.end.6723
.if.end.6723:
%.tmp6736 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6737 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp6736)
%new_info.6738 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6737, %m2503$.AssignableInfo.type** %new_info.6738
%.tmp6739 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.6738
%.tmp6740 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6739, i32 0, i32 4
%.tmp6741 = load %m2503$.Type.type*, %m2503$.Type.type** %found_field.6700
store %m2503$.Type.type* %.tmp6741, %m2503$.Type.type** %.tmp6740
%.tmp6742 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6743 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.6738
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6742, %m2503$.AssignableInfo.type* %.tmp6743)
%.tmp6744 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.6738
%.tmp6745 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6744, i32 0, i32 3
%.tmp6747 = getelementptr [9 x i8], [9 x i8]*@.str6746, i32 0, i32 0
store i8* %.tmp6747, i8** %.tmp6745
%.tmp6748 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6749 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6602
%.tmp6750 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6749, i32 0, i32 4
%.tmp6751 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6750
%.tmp6752 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6748, %m2503$.Type.type* %.tmp6751)
%info_tr.6753 = alloca i8*
store i8* %.tmp6752, i8** %info_tr.6753
%.tmp6754 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6755 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6754, i32 0, i32 1
%.tmp6756 = load %m0$.File.type*, %m0$.File.type** %.tmp6755
%.tmp6758 = getelementptr [46 x i8], [46 x i8]*@.str6757, i32 0, i32 0
%.tmp6759 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.6738
%.tmp6760 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6759)
%.tmp6761 = load i8*, i8** %info_tr.6753
%.tmp6762 = load i8*, i8** %info_tr.6753
%.tmp6763 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6602
%.tmp6764 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6763)
%.tmp6765 = load i32, i32* %field_id.6698
%.tmp6766 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6756, i8* %.tmp6758, i8* %.tmp6760, i8* %.tmp6761, i8* %.tmp6762, i8* %.tmp6764, i32 %.tmp6765)
%.tmp6767 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6768 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6769 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6768, i32 0, i32 7
%.tmp6770 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6769
%.tmp6771 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6770, i32 0, i32 7
%.tmp6772 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6771
%.tmp6773 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.6738
%.tmp6774 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.AssignableInfo.type*) @m295$get_dotted_name.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6767, %m878$.Node.type* %.tmp6772, %m2503$.AssignableInfo.type* %.tmp6773)
ret %m2503$.AssignableInfo.type* %.tmp6774
br label %.if.end.6600
.if.false.6600:
%.tmp6775 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6776 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6775, i32 0, i32 3
%.tmp6777 = load i8*, i8** %.tmp6776
%.tmp6779 = getelementptr [9 x i8], [9 x i8]*@.str6778, i32 0, i32 0
%.tmp6780 = call i32(i8*,i8*) @strcmp(i8* %.tmp6777, i8* %.tmp6779)
%.tmp6781 = icmp eq i32 %.tmp6780, 0
br i1 %.tmp6781, label %.if.true.6782, label %.if.false.6782
.if.true.6782:
%.tmp6783 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
ret %m2503$.AssignableInfo.type* %.tmp6783
br label %.if.end.6782
.if.false.6782:
br label %.if.end.6782
.if.end.6782:
br label %.if.end.6600
.if.end.6600:
br label %.if.end.6563
.if.end.6563:
%.tmp6784 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6785 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6787 = getelementptr [43 x i8], [43 x i8]*@.str6786, i32 0, i32 0
%.tmp6788 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6784, %m878$.Node.type* %.tmp6785, i8* %.tmp6787)
%.tmp6789 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6790 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6789, i32 0, i32 3
%.tmp6791 = load i8*, i8** %.tmp6790
%.tmp6792 = call i32(i8*,...) @printf(i8* %.tmp6788, i8* %.tmp6791)
%.tmp6793 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6793
}
define %m2503$.AssignableInfo.type* @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%err_msg.6794 = alloca i8*
store i8* null, i8** %err_msg.6794
%.tmp6795 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%curr_node.6796 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6795, %m878$.Node.type** %curr_node.6796
%.tmp6797 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6796
%.tmp6798 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6797, i32 0, i32 0
%.tmp6799 = load i8*, i8** %.tmp6798
%.tmp6801 = getelementptr [17 x i8], [17 x i8]*@.str6800, i32 0, i32 0
%.tmp6802 = call i32(i8*,i8*) @strcmp(i8* %.tmp6799, i8* %.tmp6801)
%.tmp6803 = icmp eq i32 %.tmp6802, 0
%.tmp6804 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6796
%.tmp6805 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6804, i32 0, i32 0
%.tmp6806 = load i8*, i8** %.tmp6805
%.tmp6808 = getelementptr [16 x i8], [16 x i8]*@.str6807, i32 0, i32 0
%.tmp6809 = call i32(i8*,i8*) @strcmp(i8* %.tmp6806, i8* %.tmp6808)
%.tmp6810 = icmp eq i32 %.tmp6809, 0
%.tmp6811 = or i1 %.tmp6803, %.tmp6810
%.tmp6812 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6796
%.tmp6813 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6812, i32 0, i32 0
%.tmp6814 = load i8*, i8** %.tmp6813
%.tmp6816 = getelementptr [11 x i8], [11 x i8]*@.str6815, i32 0, i32 0
%.tmp6817 = call i32(i8*,i8*) @strcmp(i8* %.tmp6814, i8* %.tmp6816)
%.tmp6818 = icmp eq i32 %.tmp6817, 0
%.tmp6819 = or i1 %.tmp6811, %.tmp6818
br i1 %.tmp6819, label %.if.true.6820, label %.if.false.6820
.if.true.6820:
%.tmp6821 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6822 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6823 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6822, i32 0, i32 6
%.tmp6824 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6823
%.tmp6825 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6821, %m878$.Node.type* %.tmp6824)
ret %m2503$.AssignableInfo.type* %.tmp6825
br label %.if.end.6820
.if.false.6820:
br label %.if.end.6820
.if.end.6820:
%.tmp6826 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6796
%.tmp6827 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6826, i32 0, i32 0
%.tmp6828 = load i8*, i8** %.tmp6827
%.tmp6830 = getelementptr [12 x i8], [12 x i8]*@.str6829, i32 0, i32 0
%.tmp6831 = call i32(i8*,i8*) @strcmp(i8* %.tmp6828, i8* %.tmp6830)
%.tmp6832 = icmp ne i32 %.tmp6831, 0
br i1 %.tmp6832, label %.if.true.6833, label %.if.false.6833
.if.true.6833:
%.tmp6835 = getelementptr [92 x i8], [92 x i8]*@.str6834, i32 0, i32 0
%.tmp6836 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6796
%.tmp6837 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6836, i32 0, i32 0
%.tmp6838 = load i8*, i8** %.tmp6837
%.tmp6839 = call i32(i8*,...) @printf(i8* %.tmp6835, i8* %.tmp6838)
%.tmp6840 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6841 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6840, i32 0, i32 6
%.tmp6842 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6841
store %m878$.Node.type* %.tmp6842, %m878$.Node.type** %curr_node.6796
br label %.if.end.6833
.if.false.6833:
br label %.if.end.6833
.if.end.6833:
%.tmp6843 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6796
%.tmp6844 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6843, i32 0, i32 6
%.tmp6845 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6844
%assignable_name.6846 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6845, %m878$.Node.type** %assignable_name.6846
%.tmp6847 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6848 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6849 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6848, i32 0, i32 7
%.tmp6850 = load i8*, i8** %.tmp6849
%.tmp6851 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6846
%.tmp6852 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6851, i32 0, i32 6
%.tmp6853 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6852
%.tmp6854 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6853, i32 0, i32 1
%.tmp6855 = load i8*, i8** %.tmp6854
%.tmp6856 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.cp(%m2503$.CompilerCtx.type* %.tmp6847, i8* %.tmp6850, i8* %.tmp6855)
%scope_info.6857 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp6856, %m2503$.ScopeItem.type** %scope_info.6857
%.tmp6858 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %scope_info.6857
%.tmp6859 = icmp eq %m2503$.ScopeItem.type* %.tmp6858, null
br i1 %.tmp6859, label %.if.true.6860, label %.if.false.6860
.if.true.6860:
%.tmp6861 = getelementptr i8*, i8** %err_msg.6794, i32 0
%.tmp6863 = getelementptr [41 x i8], [41 x i8]*@.str6862, i32 0, i32 0
%.tmp6864 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6846
%.tmp6865 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6864, i32 0, i32 6
%.tmp6866 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6865
%.tmp6867 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6866, i32 0, i32 1
%.tmp6868 = load i8*, i8** %.tmp6867
%.tmp6869 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6861, i8* %.tmp6863, i8* %.tmp6868)
%.tmp6870 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6871 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6846
%.tmp6872 = load i8*, i8** %err_msg.6794
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6870, %m878$.Node.type* %.tmp6871, i8* %.tmp6872)
%.tmp6873 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6873
br label %.if.end.6860
.if.false.6860:
br label %.if.end.6860
.if.end.6860:
%.tmp6874 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %scope_info.6857
%.tmp6875 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6874, i32 0, i32 1
%.tmp6876 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp6875
%info.6877 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6876, %m2503$.AssignableInfo.type** %info.6877
%.tmp6878 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.6877
%.tmp6879 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6878, i32 0, i32 3
%.tmp6880 = load i8*, i8** %.tmp6879
%.tmp6882 = getelementptr [7 x i8], [7 x i8]*@.str6881, i32 0, i32 0
%.tmp6883 = call i32(i8*,i8*) @strcmp(i8* %.tmp6880, i8* %.tmp6882)
%.tmp6884 = icmp eq i32 %.tmp6883, 0
br i1 %.tmp6884, label %.if.true.6885, label %.if.false.6885
.if.true.6885:
%.tmp6886 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6887 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.6877
%.tmp6888 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6887)
%.tmp6889 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6846
%.tmp6890 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6889, i32 0, i32 6
%.tmp6891 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6890
%.tmp6892 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6891, i32 0, i32 7
%.tmp6893 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6892
%.tmp6894 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6893, i32 0, i32 7
%.tmp6895 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6894
%.tmp6896 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6895, i32 0, i32 1
%.tmp6897 = load i8*, i8** %.tmp6896
%.tmp6898 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.cp(%m2503$.CompilerCtx.type* %.tmp6886, i8* %.tmp6888, i8* %.tmp6897)
store %m2503$.ScopeItem.type* %.tmp6898, %m2503$.ScopeItem.type** %scope_info.6857
%.tmp6899 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %scope_info.6857
%.tmp6900 = icmp eq %m2503$.ScopeItem.type* %.tmp6899, null
br i1 %.tmp6900, label %.if.true.6901, label %.if.false.6901
.if.true.6901:
%.tmp6902 = getelementptr i8*, i8** %err_msg.6794, i32 0
%.tmp6904 = getelementptr [31 x i8], [31 x i8]*@.str6903, i32 0, i32 0
%.tmp6905 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6846
%.tmp6906 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6905, i32 0, i32 6
%.tmp6907 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6906
%.tmp6908 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6907, i32 0, i32 7
%.tmp6909 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6908
%.tmp6910 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6909, i32 0, i32 7
%.tmp6911 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6910
%.tmp6912 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6911, i32 0, i32 1
%.tmp6913 = load i8*, i8** %.tmp6912
%.tmp6914 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.6877
%.tmp6915 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6914)
%.tmp6916 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6902, i8* %.tmp6904, i8* %.tmp6913, i8* %.tmp6915)
%.tmp6917 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6918 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6796
%.tmp6919 = load i8*, i8** %err_msg.6794
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6917, %m878$.Node.type* %.tmp6918, i8* %.tmp6919)
%.tmp6920 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6920
br label %.if.end.6901
.if.false.6901:
br label %.if.end.6901
.if.end.6901:
%.tmp6921 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %scope_info.6857
%.tmp6922 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6921, i32 0, i32 1
%.tmp6923 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp6922
store %m2503$.AssignableInfo.type* %.tmp6923, %m2503$.AssignableInfo.type** %info.6877
%.tmp6924 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6846
%.tmp6925 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6924, i32 0, i32 6
%.tmp6926 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6925
%.tmp6927 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6926, i32 0, i32 7
%.tmp6928 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6927
%.tmp6929 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6928, i32 0, i32 7
%.tmp6930 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6929
store %m878$.Node.type* %.tmp6930, %m878$.Node.type** %assignable_name.6846
br label %.if.end.6885
.if.false.6885:
%.tmp6931 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6846
%.tmp6932 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6931, i32 0, i32 6
%.tmp6933 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6932
store %m878$.Node.type* %.tmp6933, %m878$.Node.type** %assignable_name.6846
br label %.if.end.6885
.if.end.6885:
%.tmp6934 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6935 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6846
%.tmp6936 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.6877
%.tmp6937 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.AssignableInfo.type*) @m295$get_dotted_name.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6934, %m878$.Node.type* %.tmp6935, %m2503$.AssignableInfo.type* %.tmp6936)
%base.6938 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6937, %m2503$.AssignableInfo.type** %base.6938
%.tmp6940 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6796
%.tmp6941 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6940, i32 0, i32 6
%.tmp6942 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6941
%.tmp6943 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6942, i32 0, i32 7
%.tmp6944 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6943
%addr.6945 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6944, %m878$.Node.type** %addr.6945
br label %.for.start.6939
.for.start.6939:
%.tmp6946 = load %m878$.Node.type*, %m878$.Node.type** %addr.6945
%.tmp6947 = icmp ne %m878$.Node.type* %.tmp6946, null
br i1 %.tmp6947, label %.for.continue.6939, label %.for.end.6939
.for.continue.6939:
%.tmp6948 = load %m878$.Node.type*, %m878$.Node.type** %addr.6945
%.tmp6949 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6948, i32 0, i32 7
%.tmp6950 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6949
%index.6951 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6950, %m878$.Node.type** %index.6951
%.tmp6952 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6953 = load %m878$.Node.type*, %m878$.Node.type** %index.6951
%.tmp6954 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6952, %m878$.Node.type* %.tmp6953)
%index_info.6955 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6954, %m2503$.AssignableInfo.type** %index_info.6955
%.tmp6956 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6957 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %index_info.6955
%.tmp6958 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6957, i32 0, i32 4
%.tmp6959 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6958
%.tmp6960 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6956, %m2503$.Type.type* %.tmp6959)
%index_type.6961 = alloca i8*
store i8* %.tmp6960, i8** %index_type.6961
%.tmp6962 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6938
%.tmp6963 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6962, i32 0, i32 4
%.tmp6964 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6963
%.tmp6965 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6964, i32 0, i32 1
%.tmp6966 = load i8*, i8** %.tmp6965
%.tmp6967 = icmp ne i8* %.tmp6966, null
br i1 %.tmp6967, label %.if.true.6968, label %.if.false.6968
.if.true.6968:
%.tmp6969 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6938
%.tmp6970 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6969, i32 0, i32 4
%.tmp6971 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6970
%.tmp6972 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6971, i32 0, i32 1
%.tmp6973 = load i8*, i8** %.tmp6972
%.tmp6975 = getelementptr [6 x i8], [6 x i8]*@.str6974, i32 0, i32 0
%.tmp6976 = call i32(i8*,i8*) @strcmp(i8* %.tmp6973, i8* %.tmp6975)
%.tmp6977 = icmp eq i32 %.tmp6976, 0
br i1 %.tmp6977, label %.if.true.6978, label %.if.false.6978
.if.true.6978:
%.tmp6979 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6796
%.tmp6980 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp6979)
%new_base.6981 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6980, %m2503$.AssignableInfo.type** %new_base.6981
%.tmp6982 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6983 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6981
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6982, %m2503$.AssignableInfo.type* %.tmp6983)
%.tmp6984 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6985 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6984, i32 0, i32 1
%.tmp6986 = load %m0$.File.type*, %m0$.File.type** %.tmp6985
%.tmp6988 = getelementptr [45 x i8], [45 x i8]*@.str6987, i32 0, i32 0
%.tmp6989 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6981
%.tmp6990 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6989)
%.tmp6991 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6992 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6938
%.tmp6993 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6992, i32 0, i32 4
%.tmp6994 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6993
%.tmp6995 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6991, %m2503$.Type.type* %.tmp6994)
%.tmp6996 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6997 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6938
%.tmp6998 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6997, i32 0, i32 4
%.tmp6999 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6998
%.tmp7000 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6996, %m2503$.Type.type* %.tmp6999)
%.tmp7001 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6938
%.tmp7002 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7001)
%.tmp7003 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6986, i8* %.tmp6988, i8* %.tmp6990, i8* %.tmp6995, i8* %.tmp7000, i8* %.tmp7002)
%.tmp7004 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6981
%.tmp7005 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7004, i32 0, i32 4
%.tmp7006 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6938
%.tmp7007 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7006, i32 0, i32 4
%.tmp7008 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7007
%.tmp7009 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7008, i32 0, i32 3
%.tmp7010 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7009
%.tmp7011 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp7010)
store %m2503$.Type.type* %.tmp7011, %m2503$.Type.type** %.tmp7005
%.tmp7012 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6981
%.tmp7013 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7012, i32 0, i32 4
%.tmp7014 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7013
%.tmp7015 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7014, i32 0, i32 4
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp7015
%.tmp7016 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6981
store %m2503$.AssignableInfo.type* %.tmp7016, %m2503$.AssignableInfo.type** %base.6938
br label %.if.end.6978
.if.false.6978:
br label %.if.end.6978
.if.end.6978:
br label %.if.end.6968
.if.false.6968:
br label %.if.end.6968
.if.end.6968:
%.tmp7017 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7018 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6938
%.tmp7019 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7018, i32 0, i32 4
%.tmp7020 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7019
%.tmp7021 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp7017, %m2503$.Type.type* %.tmp7020)
%base_type.7022 = alloca i8*
store i8* %.tmp7021, i8** %base_type.7022
%.tmp7023 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7024 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp7023)
%tmp_id.7025 = alloca i32
store i32 %.tmp7024, i32* %tmp_id.7025
%.tmp7026 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7027 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp7026, i32 0, i32 1
%.tmp7028 = load %m0$.File.type*, %m0$.File.type** %.tmp7027
%.tmp7030 = getelementptr [28 x i8], [28 x i8]*@.str7029, i32 0, i32 0
%.tmp7031 = load i32, i32* %tmp_id.7025
%.tmp7032 = load i8*, i8** %base_type.7022
%.tmp7033 = load i8*, i8** %base_type.7022
%.tmp7034 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6938
%.tmp7035 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7034)
%.tmp7036 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7028, i8* %.tmp7030, i32 %.tmp7031, i8* %.tmp7032, i8* %.tmp7033, i8* %.tmp7035)
%.tmp7037 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6796
%.tmp7038 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7037)
%new_base.7039 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7038, %m2503$.AssignableInfo.type** %new_base.7039
%.tmp7040 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7041 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.7039
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp7040, %m2503$.AssignableInfo.type* %.tmp7041)
%.tmp7042 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6938
%.tmp7043 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7042, i32 0, i32 4
%.tmp7044 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7043
%.tmp7045 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7044, i32 0, i32 3
%.tmp7046 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7045
%.tmp7047 = icmp eq %m2503$.Type.type* %.tmp7046, null
br i1 %.tmp7047, label %.if.true.7048, label %.if.false.7048
.if.true.7048:
%.tmp7049 = getelementptr i8*, i8** %err_msg.6794, i32 0
%.tmp7051 = getelementptr [35 x i8], [35 x i8]*@.str7050, i32 0, i32 0
%.tmp7052 = load i8*, i8** %base_type.7022
%.tmp7053 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7049, i8* %.tmp7051, i8* %.tmp7052)
%.tmp7054 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7055 = load %m878$.Node.type*, %m878$.Node.type** %addr.6945
%.tmp7056 = load i8*, i8** %err_msg.6794
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp7054, %m878$.Node.type* %.tmp7055, i8* %.tmp7056)
%.tmp7057 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6938
ret %m2503$.AssignableInfo.type* %.tmp7057
br label %.if.end.7048
.if.false.7048:
br label %.if.end.7048
.if.end.7048:
%.tmp7058 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.7039
%.tmp7059 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7058, i32 0, i32 4
%.tmp7060 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6938
%.tmp7061 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7060, i32 0, i32 4
%.tmp7062 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7061
%.tmp7063 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7062, i32 0, i32 3
%.tmp7064 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7063
store %m2503$.Type.type* %.tmp7064, %m2503$.Type.type** %.tmp7059
%.tmp7065 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7066 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.7039
%.tmp7067 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7066, i32 0, i32 4
%.tmp7068 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7067
%.tmp7069 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp7065, %m2503$.Type.type* %.tmp7068)
%base_type_2.7070 = alloca i8*
store i8* %.tmp7069, i8** %base_type_2.7070
%.tmp7071 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7072 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp7071, i32 0, i32 1
%.tmp7073 = load %m0$.File.type*, %m0$.File.type** %.tmp7072
%.tmp7075 = getelementptr [44 x i8], [44 x i8]*@.str7074, i32 0, i32 0
%.tmp7076 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.7039
%.tmp7077 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7076)
%.tmp7078 = load i8*, i8** %base_type_2.7070
%.tmp7079 = load i8*, i8** %base_type_2.7070
%.tmp7080 = load i32, i32* %tmp_id.7025
%.tmp7081 = load i8*, i8** %index_type.6961
%.tmp7082 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %index_info.6955
%.tmp7083 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7082)
%.tmp7084 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7073, i8* %.tmp7075, i8* %.tmp7077, i8* %.tmp7078, i8* %.tmp7079, i32 %.tmp7080, i8* %.tmp7081, i8* %.tmp7083)
%.tmp7085 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.7039
store %m2503$.AssignableInfo.type* %.tmp7085, %m2503$.AssignableInfo.type** %base.6938
%.tmp7086 = load %m878$.Node.type*, %m878$.Node.type** %addr.6945
%.tmp7087 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7086, i32 0, i32 7
%.tmp7088 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7087
%.tmp7089 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7088, i32 0, i32 7
%.tmp7090 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7089
%.tmp7091 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7090, i32 0, i32 7
%.tmp7092 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7091
store %m878$.Node.type* %.tmp7092, %m878$.Node.type** %addr.6945
br label %.for.start.6939
.for.end.6939:
%.tmp7093 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6938
ret %m2503$.AssignableInfo.type* %.tmp7093
}
%m295$.StackHead.type = type {%m2258$.SYStack.type*}
define %m2503$.AssignableInfo.type* @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%curr_node = alloca %m878$.Node.type*
store %m878$.Node.type* %.curr_node.arg, %m878$.Node.type** %curr_node
%.tmp7094 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7095 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7094, i32 0, i32 6
%.tmp7096 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7095
%.tmp7098 = getelementptr [16 x i8], [16 x i8]*@.str7097, i32 0, i32 0
%.tmp7099 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp7096, i8* %.tmp7098)
%assignable_start.7100 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7099, %m878$.Node.type** %assignable_start.7100
%.tmp7101 = load %m878$.Node.type*, %m878$.Node.type** %assignable_start.7100
%.tmp7102 = call %m2258$.SYStack.type*(%m878$.Node.type*) @m2258$sy_algorithm.m2258$.SYStack.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7101)
%operator_stack.7103 = alloca %m2258$.SYStack.type*
store %m2258$.SYStack.type* %.tmp7102, %m2258$.SYStack.type** %operator_stack.7103
%.tmp7104 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* null, i32 1
%.tmp7105 = ptrtoint %m295$.StackHead.type* %.tmp7104 to i32
%.tmp7106 = call i8*(i32) @malloc(i32 %.tmp7105)
%.tmp7107 = bitcast i8* %.tmp7106 to %m295$.StackHead.type*
%stack.7108 = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.tmp7107, %m295$.StackHead.type** %stack.7108
%.tmp7109 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7108
%.tmp7110 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7109, i32 0, i32 0
%.tmp7111 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %operator_stack.7103
store %m2258$.SYStack.type* %.tmp7111, %m2258$.SYStack.type** %.tmp7110
%.tmp7112 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7113 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7108
%.tmp7114 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m295$.StackHead.typep(%m2503$.CompilerCtx.type* %.tmp7112, %m295$.StackHead.type* %.tmp7113)
%info.7115 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7114, %m2503$.AssignableInfo.type** %info.7115
%.tmp7116 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7115
%.tmp7117 = icmp eq %m2503$.AssignableInfo.type* %.tmp7116, null
br i1 %.tmp7117, label %.if.true.7118, label %.if.false.7118
.if.true.7118:
%.tmp7119 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7115
ret %m2503$.AssignableInfo.type* %.tmp7119
br label %.if.end.7118
.if.false.7118:
br label %.if.end.7118
.if.end.7118:
%.tmp7120 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7121 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7120, i32 0, i32 6
%.tmp7122 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7121
%.tmp7124 = getelementptr [5 x i8], [5 x i8]*@.str7123, i32 0, i32 0
%.tmp7125 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp7122, i8* %.tmp7124)
%cast.7126 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7125, %m878$.Node.type** %cast.7126
%.tmp7127 = load %m878$.Node.type*, %m878$.Node.type** %cast.7126
%.tmp7128 = icmp ne %m878$.Node.type* %.tmp7127, null
br i1 %.tmp7128, label %.if.true.7129, label %.if.false.7129
.if.true.7129:
%.tmp7130 = load %m878$.Node.type*, %m878$.Node.type** %cast.7126
%.tmp7131 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7130, i32 0, i32 6
%.tmp7132 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7131
%.tmp7134 = getelementptr [5 x i8], [5 x i8]*@.str7133, i32 0, i32 0
%.tmp7135 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp7132, i8* %.tmp7134)
%cast_type.7136 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7135, %m878$.Node.type** %cast_type.7136
%.tmp7137 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7138 = load %m878$.Node.type*, %m878$.Node.type** %cast_type.7136
%.tmp7139 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7138, i32 0, i32 6
%.tmp7140 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7139
%.tmp7141 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp7137, %m878$.Node.type* %.tmp7140)
%type.7142 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp7141, %m2503$.Type.type** %type.7142
%.tmp7143 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7115
%.tmp7144 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7143)
%prev_id.7145 = alloca i8*
store i8* %.tmp7144, i8** %prev_id.7145
%.tmp7146 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7147 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7115
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp7146, %m2503$.AssignableInfo.type* %.tmp7147)
%.tmp7148 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7149 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7115
%.tmp7150 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7149, i32 0, i32 4
%.tmp7151 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7150
%.tmp7152 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp7148, %m2503$.Type.type* %.tmp7151)
%from_type.7153 = alloca i8*
store i8* %.tmp7152, i8** %from_type.7153
%.tmp7154 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7155 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7142
%.tmp7156 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp7154, %m2503$.Type.type* %.tmp7155)
%to_type.7157 = alloca i8*
store i8* %.tmp7156, i8** %to_type.7157
%.tmp7159 = getelementptr [8 x i8], [8 x i8]*@.str7158, i32 0, i32 0
%cast_fn.7160 = alloca i8*
store i8* %.tmp7159, i8** %cast_fn.7160
%.tmp7161 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7115
%.tmp7162 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7161, i32 0, i32 4
%.tmp7163 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7162
%.tmp7164 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7163, i32 0, i32 1
%.tmp7165 = load i8*, i8** %.tmp7164
%.tmp7166 = icmp ne i8* %.tmp7165, null
br i1 %.tmp7166, label %.if.true.7167, label %.if.false.7167
.if.true.7167:
%.tmp7168 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7115
%.tmp7169 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7168, i32 0, i32 4
%.tmp7170 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7169
%.tmp7171 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7170, i32 0, i32 1
%.tmp7172 = load i8*, i8** %.tmp7171
%.tmp7174 = getelementptr [6 x i8], [6 x i8]*@.str7173, i32 0, i32 0
%.tmp7175 = call i32(i8*,i8*) @strcmp(i8* %.tmp7172, i8* %.tmp7174)
%.tmp7176 = icmp eq i32 %.tmp7175, 0
br i1 %.tmp7176, label %.if.true.7177, label %.if.false.7177
.if.true.7177:
%.tmp7179 = getelementptr [48 x i8], [48 x i8]*@.str7178, i32 0, i32 0
%.tmp7180 = call i32(i8*,...) @printf(i8* %.tmp7179)
br label %.if.end.7177
.if.false.7177:
br label %.if.end.7177
.if.end.7177:
br label %.if.end.7167
.if.false.7167:
br label %.if.end.7167
.if.end.7167:
%.tmp7181 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7115
%.tmp7182 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7181, i32 0, i32 4
%.tmp7183 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7182
%.tmp7184 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7183, i32 0, i32 0
%.tmp7185 = load i8*, i8** %.tmp7184
%.tmp7187 = getelementptr [4 x i8], [4 x i8]*@.str7186, i32 0, i32 0
%.tmp7188 = call i32(i8*,i8*) @strcmp(i8* %.tmp7185, i8* %.tmp7187)
%.tmp7189 = icmp ne i32 %.tmp7188, 0
%.tmp7190 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7142
%.tmp7191 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7190, i32 0, i32 0
%.tmp7192 = load i8*, i8** %.tmp7191
%.tmp7194 = getelementptr [4 x i8], [4 x i8]*@.str7193, i32 0, i32 0
%.tmp7195 = call i32(i8*,i8*) @strcmp(i8* %.tmp7192, i8* %.tmp7194)
%.tmp7196 = icmp ne i32 %.tmp7195, 0
%.tmp7197 = and i1 %.tmp7189, %.tmp7196
br i1 %.tmp7197, label %.if.true.7198, label %.if.false.7198
.if.true.7198:
%.tmp7199 = load i8*, i8** %from_type.7153
%.tmp7200 = getelementptr i8, i8* %.tmp7199, i32 0
%.tmp7201 = load i8, i8* %.tmp7200
%.tmp7202 = icmp eq i8 %.tmp7201, 105
%.tmp7203 = load i8*, i8** %to_type.7157
%.tmp7204 = getelementptr i8, i8* %.tmp7203, i32 0
%.tmp7205 = load i8, i8* %.tmp7204
%.tmp7206 = icmp eq i8 %.tmp7205, 105
%.tmp7207 = and i1 %.tmp7202, %.tmp7206
br i1 %.tmp7207, label %.if.true.7208, label %.if.false.7208
.if.true.7208:
%from_size.7209 = alloca i32
store i32 0, i32* %from_size.7209
%to_size.7210 = alloca i32
store i32 0, i32* %to_size.7210
%.tmp7211 = load i8*, i8** %from_type.7153
%.tmp7213 = getelementptr [4 x i8], [4 x i8]*@.str7212, i32 0, i32 0
%.tmp7214 = getelementptr i32, i32* %from_size.7209, i32 0
%.tmp7215 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7211, i8* %.tmp7213, i32* %.tmp7214)
%.tmp7216 = load i8*, i8** %to_type.7157
%.tmp7218 = getelementptr [4 x i8], [4 x i8]*@.str7217, i32 0, i32 0
%.tmp7219 = getelementptr i32, i32* %to_size.7210, i32 0
%.tmp7220 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7216, i8* %.tmp7218, i32* %.tmp7219)
%.tmp7221 = load i32, i32* %from_size.7209
%.tmp7222 = load i32, i32* %to_size.7210
%.tmp7223 = icmp slt i32 %.tmp7221, %.tmp7222
br i1 %.tmp7223, label %.if.true.7224, label %.if.false.7224
.if.true.7224:
%.tmp7226 = getelementptr [5 x i8], [5 x i8]*@.str7225, i32 0, i32 0
store i8* %.tmp7226, i8** %cast_fn.7160
br label %.if.end.7224
.if.false.7224:
%.tmp7228 = getelementptr [6 x i8], [6 x i8]*@.str7227, i32 0, i32 0
store i8* %.tmp7228, i8** %cast_fn.7160
br label %.if.end.7224
.if.end.7224:
br label %.if.end.7208
.if.false.7208:
br label %.if.end.7208
.if.end.7208:
br label %.if.end.7198
.if.false.7198:
br label %.if.end.7198
.if.end.7198:
%.tmp7229 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7230 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp7229, i32 0, i32 1
%.tmp7231 = load %m0$.File.type*, %m0$.File.type** %.tmp7230
%.tmp7233 = getelementptr [21 x i8], [21 x i8]*@.str7232, i32 0, i32 0
%.tmp7234 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7115
%.tmp7235 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7234)
%.tmp7236 = load i8*, i8** %cast_fn.7160
%.tmp7237 = load i8*, i8** %from_type.7153
%.tmp7238 = load i8*, i8** %prev_id.7145
%.tmp7239 = load i8*, i8** %to_type.7157
%.tmp7240 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7231, i8* %.tmp7233, i8* %.tmp7235, i8* %.tmp7236, i8* %.tmp7237, i8* %.tmp7238, i8* %.tmp7239)
%.tmp7241 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7115
%.tmp7242 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7241, i32 0, i32 4
%.tmp7243 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7142
store %m2503$.Type.type* %.tmp7243, %m2503$.Type.type** %.tmp7242
br label %.if.end.7129
.if.false.7129:
br label %.if.end.7129
.if.end.7129:
%.tmp7244 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7115
ret %m2503$.AssignableInfo.type* %.tmp7244
}
define %m2503$.AssignableInfo.type* @m295$compile_assignable_stack.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m295$.StackHead.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m295$.StackHead.type* %.stack.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stack = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.stack.arg, %m295$.StackHead.type** %stack
%.tmp7245 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7246 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7245, i32 0, i32 0
%.tmp7247 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7246
%.tmp7248 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp7247, i32 0, i32 0
%.tmp7249 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7248
%.tmp7250 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7249, i32 0, i32 0
%.tmp7251 = load i8*, i8** %.tmp7250
%.tmp7253 = getelementptr [16 x i8], [16 x i8]*@.str7252, i32 0, i32 0
%.tmp7254 = call i32(i8*,i8*) @strcmp(i8* %.tmp7251, i8* %.tmp7253)
%.tmp7255 = icmp eq i32 %.tmp7254, 0
br i1 %.tmp7255, label %.if.true.7256, label %.if.false.7256
.if.true.7256:
%.tmp7257 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7258 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7259 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7258, i32 0, i32 0
%.tmp7260 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7259
%.tmp7261 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp7260, i32 0, i32 0
%.tmp7262 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7261
%.tmp7263 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_mono_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp7257, %m878$.Node.type* %.tmp7262)
ret %m2503$.AssignableInfo.type* %.tmp7263
br label %.if.end.7256
.if.false.7256:
br label %.if.end.7256
.if.end.7256:
%.tmp7264 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7265 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7264, i32 0, i32 0
%.tmp7266 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7265
%.tmp7267 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp7266, i32 0, i32 0
%.tmp7268 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7267
%.tmp7269 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7268, i32 0, i32 6
%.tmp7270 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7269
%operator.7271 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7270, %m878$.Node.type** %operator.7271
%.tmp7272 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7273 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7272, i32 0, i32 0
%.tmp7274 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7275 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7274, i32 0, i32 0
%.tmp7276 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7275
%.tmp7277 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp7276, i32 0, i32 1
%.tmp7278 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7277
store %m2258$.SYStack.type* %.tmp7278, %m2258$.SYStack.type** %.tmp7273
%.tmp7279 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7280 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7281 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m295$.StackHead.typep(%m2503$.CompilerCtx.type* %.tmp7279, %m295$.StackHead.type* %.tmp7280)
%A.7282 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7281, %m2503$.AssignableInfo.type** %A.7282
%.tmp7283 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %A.7282
%.tmp7284 = icmp eq %m2503$.AssignableInfo.type* %.tmp7283, null
br i1 %.tmp7284, label %.if.true.7285, label %.if.false.7285
.if.true.7285:
%.tmp7286 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %A.7282
ret %m2503$.AssignableInfo.type* %.tmp7286
br label %.if.end.7285
.if.false.7285:
br label %.if.end.7285
.if.end.7285:
%.tmp7287 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7288 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7287, i32 0, i32 0
%.tmp7289 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7290 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7289, i32 0, i32 0
%.tmp7291 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7290
%.tmp7292 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp7291, i32 0, i32 1
%.tmp7293 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7292
store %m2258$.SYStack.type* %.tmp7293, %m2258$.SYStack.type** %.tmp7288
%.tmp7294 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7295 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7296 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m295$.StackHead.typep(%m2503$.CompilerCtx.type* %.tmp7294, %m295$.StackHead.type* %.tmp7295)
%B.7297 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7296, %m2503$.AssignableInfo.type** %B.7297
%.tmp7298 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %B.7297
%.tmp7299 = icmp eq %m2503$.AssignableInfo.type* %.tmp7298, null
br i1 %.tmp7299, label %.if.true.7300, label %.if.false.7300
.if.true.7300:
%.tmp7301 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %B.7297
ret %m2503$.AssignableInfo.type* %.tmp7301
br label %.if.end.7300
.if.false.7300:
br label %.if.end.7300
.if.end.7300:
%.tmp7302 = bitcast ptr null to %m878$.Node.type*
%.tmp7303 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7302)
%op_info.7304 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7303, %m2503$.AssignableInfo.type** %op_info.7304
%.tmp7305 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %op_info.7304
%.tmp7306 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7305, i32 0, i32 4
%.tmp7307 = load %m878$.Node.type*, %m878$.Node.type** %operator.7271
%.tmp7308 = call %m2503$.Type.type*(%m878$.Node.type*) @m295$operator_type.m2503$.Type.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7307)
store %m2503$.Type.type* %.tmp7308, %m2503$.Type.type** %.tmp7306
%.tmp7309 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7310 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %op_info.7304
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp7309, %m2503$.AssignableInfo.type* %.tmp7310)
%.tmp7311 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7312 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp7311, i32 0, i32 1
%.tmp7313 = load %m0$.File.type*, %m0$.File.type** %.tmp7312
%.tmp7315 = getelementptr [19 x i8], [19 x i8]*@.str7314, i32 0, i32 0
%.tmp7316 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %op_info.7304
%.tmp7317 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7316)
%.tmp7318 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7319 = load %m878$.Node.type*, %m878$.Node.type** %operator.7271
%.tmp7320 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$operator_op.cp.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp7318, %m878$.Node.type* %.tmp7319)
%.tmp7321 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7322 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %A.7282
%.tmp7323 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7322, i32 0, i32 4
%.tmp7324 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7323
%.tmp7325 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp7321, %m2503$.Type.type* %.tmp7324)
%.tmp7326 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %A.7282
%.tmp7327 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7326)
%.tmp7328 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %B.7297
%.tmp7329 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7328)
%.tmp7330 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7313, i8* %.tmp7315, i8* %.tmp7317, i8* %.tmp7320, i8* %.tmp7325, i8* %.tmp7327, i8* %.tmp7329)
%.tmp7331 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %op_info.7304
ret %m2503$.AssignableInfo.type* %.tmp7331
}
define i8* @m295$operator_op.cp.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.op.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%op = alloca %m878$.Node.type*
store %m878$.Node.type* %.op.arg, %m878$.Node.type** %op
%.tmp7332 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7333 = icmp eq %m878$.Node.type* %.tmp7332, null
br i1 %.tmp7333, label %.if.true.7334, label %.if.false.7334
.if.true.7334:
%.tmp7335 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7336 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7338 = getelementptr [31 x i8], [31 x i8]*@.str7337, i32 0, i32 0
%.tmp7339 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp7335, %m878$.Node.type* %.tmp7336, i8* %.tmp7338)
%.tmp7340 = call i32(i8*,...) @printf(i8* %.tmp7339)
br label %.if.end.7334
.if.false.7334:
br label %.if.end.7334
.if.end.7334:
%.tmp7341 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7342 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7341, i32 0, i32 1
%.tmp7343 = load i8*, i8** %.tmp7342
%.tmp7345 = getelementptr [2 x i8], [2 x i8]*@.str7344, i32 0, i32 0
%.tmp7346 = call i32(i8*,i8*) @strcmp(i8* %.tmp7343, i8* %.tmp7345)
%.tmp7347 = icmp eq i32 %.tmp7346, 0
br i1 %.tmp7347, label %.if.true.7348, label %.if.false.7348
.if.true.7348:
%.tmp7350 = getelementptr [4 x i8], [4 x i8]*@.str7349, i32 0, i32 0
ret i8* %.tmp7350
br label %.if.end.7348
.if.false.7348:
%.tmp7351 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7352 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7351, i32 0, i32 1
%.tmp7353 = load i8*, i8** %.tmp7352
%.tmp7355 = getelementptr [2 x i8], [2 x i8]*@.str7354, i32 0, i32 0
%.tmp7356 = call i32(i8*,i8*) @strcmp(i8* %.tmp7353, i8* %.tmp7355)
%.tmp7357 = icmp eq i32 %.tmp7356, 0
br i1 %.tmp7357, label %.if.true.7358, label %.if.false.7358
.if.true.7358:
%.tmp7360 = getelementptr [4 x i8], [4 x i8]*@.str7359, i32 0, i32 0
ret i8* %.tmp7360
br label %.if.end.7358
.if.false.7358:
%.tmp7361 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7362 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7361, i32 0, i32 1
%.tmp7363 = load i8*, i8** %.tmp7362
%.tmp7365 = getelementptr [2 x i8], [2 x i8]*@.str7364, i32 0, i32 0
%.tmp7366 = call i32(i8*,i8*) @strcmp(i8* %.tmp7363, i8* %.tmp7365)
%.tmp7367 = icmp eq i32 %.tmp7366, 0
br i1 %.tmp7367, label %.if.true.7368, label %.if.false.7368
.if.true.7368:
%.tmp7370 = getelementptr [4 x i8], [4 x i8]*@.str7369, i32 0, i32 0
ret i8* %.tmp7370
br label %.if.end.7368
.if.false.7368:
%.tmp7371 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7372 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7371, i32 0, i32 1
%.tmp7373 = load i8*, i8** %.tmp7372
%.tmp7375 = getelementptr [2 x i8], [2 x i8]*@.str7374, i32 0, i32 0
%.tmp7376 = call i32(i8*,i8*) @strcmp(i8* %.tmp7373, i8* %.tmp7375)
%.tmp7377 = icmp eq i32 %.tmp7376, 0
br i1 %.tmp7377, label %.if.true.7378, label %.if.false.7378
.if.true.7378:
%.tmp7380 = getelementptr [5 x i8], [5 x i8]*@.str7379, i32 0, i32 0
ret i8* %.tmp7380
br label %.if.end.7378
.if.false.7378:
%.tmp7381 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7382 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7381, i32 0, i32 1
%.tmp7383 = load i8*, i8** %.tmp7382
%.tmp7385 = getelementptr [3 x i8], [3 x i8]*@.str7384, i32 0, i32 0
%.tmp7386 = call i32(i8*,i8*) @strcmp(i8* %.tmp7383, i8* %.tmp7385)
%.tmp7387 = icmp eq i32 %.tmp7386, 0
br i1 %.tmp7387, label %.if.true.7388, label %.if.false.7388
.if.true.7388:
%.tmp7390 = getelementptr [8 x i8], [8 x i8]*@.str7389, i32 0, i32 0
ret i8* %.tmp7390
br label %.if.end.7388
.if.false.7388:
%.tmp7391 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7392 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7391, i32 0, i32 1
%.tmp7393 = load i8*, i8** %.tmp7392
%.tmp7395 = getelementptr [3 x i8], [3 x i8]*@.str7394, i32 0, i32 0
%.tmp7396 = call i32(i8*,i8*) @strcmp(i8* %.tmp7393, i8* %.tmp7395)
%.tmp7397 = icmp eq i32 %.tmp7396, 0
br i1 %.tmp7397, label %.if.true.7398, label %.if.false.7398
.if.true.7398:
%.tmp7400 = getelementptr [8 x i8], [8 x i8]*@.str7399, i32 0, i32 0
ret i8* %.tmp7400
br label %.if.end.7398
.if.false.7398:
%.tmp7401 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7402 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7401, i32 0, i32 1
%.tmp7403 = load i8*, i8** %.tmp7402
%.tmp7405 = getelementptr [2 x i8], [2 x i8]*@.str7404, i32 0, i32 0
%.tmp7406 = call i32(i8*,i8*) @strcmp(i8* %.tmp7403, i8* %.tmp7405)
%.tmp7407 = icmp eq i32 %.tmp7406, 0
br i1 %.tmp7407, label %.if.true.7408, label %.if.false.7408
.if.true.7408:
%.tmp7410 = getelementptr [9 x i8], [9 x i8]*@.str7409, i32 0, i32 0
ret i8* %.tmp7410
br label %.if.end.7408
.if.false.7408:
%.tmp7411 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7412 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7411, i32 0, i32 1
%.tmp7413 = load i8*, i8** %.tmp7412
%.tmp7415 = getelementptr [2 x i8], [2 x i8]*@.str7414, i32 0, i32 0
%.tmp7416 = call i32(i8*,i8*) @strcmp(i8* %.tmp7413, i8* %.tmp7415)
%.tmp7417 = icmp eq i32 %.tmp7416, 0
br i1 %.tmp7417, label %.if.true.7418, label %.if.false.7418
.if.true.7418:
%.tmp7420 = getelementptr [9 x i8], [9 x i8]*@.str7419, i32 0, i32 0
ret i8* %.tmp7420
br label %.if.end.7418
.if.false.7418:
%.tmp7421 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7422 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7421, i32 0, i32 1
%.tmp7423 = load i8*, i8** %.tmp7422
%.tmp7425 = getelementptr [2 x i8], [2 x i8]*@.str7424, i32 0, i32 0
%.tmp7426 = call i32(i8*,i8*) @strcmp(i8* %.tmp7423, i8* %.tmp7425)
%.tmp7427 = icmp eq i32 %.tmp7426, 0
br i1 %.tmp7427, label %.if.true.7428, label %.if.false.7428
.if.true.7428:
%.tmp7430 = getelementptr [4 x i8], [4 x i8]*@.str7429, i32 0, i32 0
ret i8* %.tmp7430
br label %.if.end.7428
.if.false.7428:
%.tmp7431 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7432 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7431, i32 0, i32 1
%.tmp7433 = load i8*, i8** %.tmp7432
%.tmp7435 = getelementptr [2 x i8], [2 x i8]*@.str7434, i32 0, i32 0
%.tmp7436 = call i32(i8*,i8*) @strcmp(i8* %.tmp7433, i8* %.tmp7435)
%.tmp7437 = icmp eq i32 %.tmp7436, 0
br i1 %.tmp7437, label %.if.true.7438, label %.if.false.7438
.if.true.7438:
%.tmp7440 = getelementptr [3 x i8], [3 x i8]*@.str7439, i32 0, i32 0
ret i8* %.tmp7440
br label %.if.end.7438
.if.false.7438:
%.tmp7441 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7442 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7441, i32 0, i32 1
%.tmp7443 = load i8*, i8** %.tmp7442
%.tmp7445 = getelementptr [3 x i8], [3 x i8]*@.str7444, i32 0, i32 0
%.tmp7446 = call i32(i8*,i8*) @strcmp(i8* %.tmp7443, i8* %.tmp7445)
%.tmp7447 = icmp eq i32 %.tmp7446, 0
br i1 %.tmp7447, label %.if.true.7448, label %.if.false.7448
.if.true.7448:
%.tmp7450 = getelementptr [9 x i8], [9 x i8]*@.str7449, i32 0, i32 0
ret i8* %.tmp7450
br label %.if.end.7448
.if.false.7448:
%.tmp7451 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7452 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7451, i32 0, i32 1
%.tmp7453 = load i8*, i8** %.tmp7452
%.tmp7455 = getelementptr [3 x i8], [3 x i8]*@.str7454, i32 0, i32 0
%.tmp7456 = call i32(i8*,i8*) @strcmp(i8* %.tmp7453, i8* %.tmp7455)
%.tmp7457 = icmp eq i32 %.tmp7456, 0
br i1 %.tmp7457, label %.if.true.7458, label %.if.false.7458
.if.true.7458:
%.tmp7460 = getelementptr [9 x i8], [9 x i8]*@.str7459, i32 0, i32 0
ret i8* %.tmp7460
br label %.if.end.7458
.if.false.7458:
%.tmp7461 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7462 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7461, i32 0, i32 1
%.tmp7463 = load i8*, i8** %.tmp7462
%.tmp7465 = getelementptr [2 x i8], [2 x i8]*@.str7464, i32 0, i32 0
%.tmp7466 = call i32(i8*,i8*) @strcmp(i8* %.tmp7463, i8* %.tmp7465)
%.tmp7467 = icmp eq i32 %.tmp7466, 0
br i1 %.tmp7467, label %.if.true.7468, label %.if.false.7468
.if.true.7468:
%.tmp7470 = getelementptr [5 x i8], [5 x i8]*@.str7469, i32 0, i32 0
ret i8* %.tmp7470
br label %.if.end.7468
.if.false.7468:
%.tmp7471 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7472 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7474 = getelementptr [30 x i8], [30 x i8]*@.str7473, i32 0, i32 0
%.tmp7475 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp7471, %m878$.Node.type* %.tmp7472, i8* %.tmp7474)
%.tmp7476 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7477 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7476, i32 0, i32 1
%.tmp7478 = load i8*, i8** %.tmp7477
%.tmp7479 = call i32(i8*,...) @printf(i8* %.tmp7475, i8* %.tmp7478)
br label %.if.end.7468
.if.end.7468:
br label %.if.end.7458
.if.end.7458:
br label %.if.end.7448
.if.end.7448:
br label %.if.end.7438
.if.end.7438:
br label %.if.end.7428
.if.end.7428:
br label %.if.end.7418
.if.end.7418:
br label %.if.end.7408
.if.end.7408:
br label %.if.end.7398
.if.end.7398:
br label %.if.end.7388
.if.end.7388:
br label %.if.end.7378
.if.end.7378:
br label %.if.end.7368
.if.end.7368:
br label %.if.end.7358
.if.end.7358:
br label %.if.end.7348
.if.end.7348:
%.tmp7481 = getelementptr [4 x i8], [4 x i8]*@.str7480, i32 0, i32 0
ret i8* %.tmp7481
}
define %m2503$.Type.type* @m295$operator_type.m2503$.Type.typep.m878$.Node.typep(%m878$.Node.type* %.op.arg) {
%op = alloca %m878$.Node.type*
store %m878$.Node.type* %.op.arg, %m878$.Node.type** %op
%.tmp7482 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%type.7483 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp7482, %m2503$.Type.type** %type.7483
%.tmp7484 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7485 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7484, i32 0, i32 1
%.tmp7486 = load i8*, i8** %.tmp7485
%.tmp7488 = getelementptr [3 x i8], [3 x i8]*@.str7487, i32 0, i32 0
%.tmp7489 = call i32(i8*,i8*) @strcmp(i8* %.tmp7486, i8* %.tmp7488)
%.tmp7490 = icmp eq i32 %.tmp7489, 0
%.tmp7491 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7492 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7491, i32 0, i32 1
%.tmp7493 = load i8*, i8** %.tmp7492
%.tmp7495 = getelementptr [3 x i8], [3 x i8]*@.str7494, i32 0, i32 0
%.tmp7496 = call i32(i8*,i8*) @strcmp(i8* %.tmp7493, i8* %.tmp7495)
%.tmp7497 = icmp eq i32 %.tmp7496, 0
%.tmp7498 = or i1 %.tmp7490, %.tmp7497
%.tmp7499 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7500 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7499, i32 0, i32 1
%.tmp7501 = load i8*, i8** %.tmp7500
%.tmp7503 = getelementptr [2 x i8], [2 x i8]*@.str7502, i32 0, i32 0
%.tmp7504 = call i32(i8*,i8*) @strcmp(i8* %.tmp7501, i8* %.tmp7503)
%.tmp7505 = icmp eq i32 %.tmp7504, 0
%.tmp7506 = or i1 %.tmp7498, %.tmp7505
%.tmp7507 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7508 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7507, i32 0, i32 1
%.tmp7509 = load i8*, i8** %.tmp7508
%.tmp7511 = getelementptr [2 x i8], [2 x i8]*@.str7510, i32 0, i32 0
%.tmp7512 = call i32(i8*,i8*) @strcmp(i8* %.tmp7509, i8* %.tmp7511)
%.tmp7513 = icmp eq i32 %.tmp7512, 0
%.tmp7514 = or i1 %.tmp7506, %.tmp7513
%.tmp7515 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7516 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7515, i32 0, i32 1
%.tmp7517 = load i8*, i8** %.tmp7516
%.tmp7519 = getelementptr [2 x i8], [2 x i8]*@.str7518, i32 0, i32 0
%.tmp7520 = call i32(i8*,i8*) @strcmp(i8* %.tmp7517, i8* %.tmp7519)
%.tmp7521 = icmp eq i32 %.tmp7520, 0
%.tmp7522 = or i1 %.tmp7514, %.tmp7521
%.tmp7523 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7524 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7523, i32 0, i32 1
%.tmp7525 = load i8*, i8** %.tmp7524
%.tmp7527 = getelementptr [2 x i8], [2 x i8]*@.str7526, i32 0, i32 0
%.tmp7528 = call i32(i8*,i8*) @strcmp(i8* %.tmp7525, i8* %.tmp7527)
%.tmp7529 = icmp eq i32 %.tmp7528, 0
%.tmp7530 = or i1 %.tmp7522, %.tmp7529
%.tmp7531 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7532 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7531, i32 0, i32 1
%.tmp7533 = load i8*, i8** %.tmp7532
%.tmp7535 = getelementptr [3 x i8], [3 x i8]*@.str7534, i32 0, i32 0
%.tmp7536 = call i32(i8*,i8*) @strcmp(i8* %.tmp7533, i8* %.tmp7535)
%.tmp7537 = icmp eq i32 %.tmp7536, 0
%.tmp7538 = or i1 %.tmp7530, %.tmp7537
%.tmp7539 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7540 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7539, i32 0, i32 1
%.tmp7541 = load i8*, i8** %.tmp7540
%.tmp7543 = getelementptr [3 x i8], [3 x i8]*@.str7542, i32 0, i32 0
%.tmp7544 = call i32(i8*,i8*) @strcmp(i8* %.tmp7541, i8* %.tmp7543)
%.tmp7545 = icmp eq i32 %.tmp7544, 0
%.tmp7546 = or i1 %.tmp7538, %.tmp7545
br i1 %.tmp7546, label %.if.true.7547, label %.if.false.7547
.if.true.7547:
%.tmp7548 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7483
%.tmp7549 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7548, i32 0, i32 0
%.tmp7551 = getelementptr [5 x i8], [5 x i8]*@.str7550, i32 0, i32 0
store i8* %.tmp7551, i8** %.tmp7549
br label %.if.end.7547
.if.false.7547:
%.tmp7552 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7483
%.tmp7553 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7552, i32 0, i32 0
%.tmp7555 = getelementptr [4 x i8], [4 x i8]*@.str7554, i32 0, i32 0
store i8* %.tmp7555, i8** %.tmp7553
br label %.if.end.7547
.if.end.7547:
%.tmp7556 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7483
ret %m2503$.Type.type* %.tmp7556
}
define %m2503$.AssignableInfo.type* @m295$compile_mono_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%curr_node = alloca %m878$.Node.type*
store %m878$.Node.type* %.curr_node.arg, %m878$.Node.type** %curr_node
%.tmp7557 = bitcast ptr null to %m2503$.AssignableInfo.type*
%assignable_info.7558 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7557, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7559 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%mono.7560 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7559, %m878$.Node.type** %mono.7560
%err_buf.7561 = alloca i8*
store i8* null, i8** %err_buf.7561
%buf.7562 = alloca i8*
store i8* null, i8** %buf.7562
%.tmp7563 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7564 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7563, i32 0, i32 6
%.tmp7565 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7564
%.tmp7566 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7565, i32 0, i32 0
%.tmp7567 = load i8*, i8** %.tmp7566
%.tmp7569 = getelementptr [7 x i8], [7 x i8]*@.str7568, i32 0, i32 0
%.tmp7570 = call i32(i8*,i8*) @strcmp(i8* %.tmp7567, i8* %.tmp7569)
%.tmp7571 = icmp eq i32 %.tmp7570, 0
br i1 %.tmp7571, label %.if.true.7572, label %.if.false.7572
.if.true.7572:
%.tmp7573 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7574 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7573)
store %m2503$.AssignableInfo.type* %.tmp7574, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7575 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7576 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7575, i32 0, i32 4
%.tmp7577 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp7577, %m2503$.Type.type** %.tmp7576
%.tmp7578 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7579 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7578, i32 0, i32 4
%.tmp7580 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7579
%.tmp7581 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7580, i32 0, i32 0
%.tmp7583 = getelementptr [4 x i8], [4 x i8]*@.str7582, i32 0, i32 0
store i8* %.tmp7583, i8** %.tmp7581
%.tmp7584 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7585 = load i8, i8* @SCOPE_CONST
%.tmp7586 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7587 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7586, i32 0, i32 6
%.tmp7588 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7587
%.tmp7589 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7588, i32 0, i32 1
%.tmp7590 = load i8*, i8** %.tmp7589
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp7584, i8 %.tmp7585, i8* %.tmp7590)
br label %.if.end.7572
.if.false.7572:
%.tmp7591 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7592 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7591, i32 0, i32 6
%.tmp7593 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7592
%.tmp7594 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7593, i32 0, i32 0
%.tmp7595 = load i8*, i8** %.tmp7594
%.tmp7597 = getelementptr [5 x i8], [5 x i8]*@.str7596, i32 0, i32 0
%.tmp7598 = call i32(i8*,i8*) @strcmp(i8* %.tmp7595, i8* %.tmp7597)
%.tmp7599 = icmp eq i32 %.tmp7598, 0
br i1 %.tmp7599, label %.if.true.7600, label %.if.false.7600
.if.true.7600:
%.tmp7601 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7602 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7601, i32 0, i32 6
%.tmp7603 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7602
%.tmp7604 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7603, i32 0, i32 1
%.tmp7605 = load i8*, i8** %.tmp7604
%.tmp7607 = getelementptr [5 x i8], [5 x i8]*@.str7606, i32 0, i32 0
%.tmp7608 = call i32(i8*,i8*) @strcmp(i8* %.tmp7605, i8* %.tmp7607)
%.tmp7609 = icmp ne i32 %.tmp7608, 0
br i1 %.tmp7609, label %.if.true.7610, label %.if.false.7610
.if.true.7610:
%.tmp7611 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7612 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7614 = getelementptr [42 x i8], [42 x i8]*@.str7613, i32 0, i32 0
%.tmp7615 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp7611, %m878$.Node.type* %.tmp7612, i8* %.tmp7614)
%.tmp7616 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7617 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7616, i32 0, i32 6
%.tmp7618 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7617
%.tmp7619 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7618, i32 0, i32 1
%.tmp7620 = load i8*, i8** %.tmp7619
%.tmp7621 = call i32(i8*,...) @printf(i8* %.tmp7615, i8* %.tmp7620)
%.tmp7622 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp7622
br label %.if.end.7610
.if.false.7610:
br label %.if.end.7610
.if.end.7610:
%.tmp7623 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7624 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7623)
store %m2503$.AssignableInfo.type* %.tmp7624, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7625 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7626 = load i8, i8* @SCOPE_CONST
%.tmp7628 = getelementptr [5 x i8], [5 x i8]*@.str7627, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp7625, i8 %.tmp7626, i8* %.tmp7628)
%.tmp7629 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7630 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7629, i32 0, i32 4
%.tmp7631 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp7631, %m2503$.Type.type** %.tmp7630
%.tmp7632 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7633 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7632, i32 0, i32 4
%.tmp7634 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7633
%.tmp7635 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7634, i32 0, i32 0
%.tmp7637 = getelementptr [8 x i8], [8 x i8]*@.str7636, i32 0, i32 0
store i8* %.tmp7637, i8** %.tmp7635
br label %.if.end.7600
.if.false.7600:
%.tmp7638 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7639 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7638, i32 0, i32 6
%.tmp7640 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7639
%.tmp7641 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7640, i32 0, i32 0
%.tmp7642 = load i8*, i8** %.tmp7641
%.tmp7644 = getelementptr [17 x i8], [17 x i8]*@.str7643, i32 0, i32 0
%.tmp7645 = call i32(i8*,i8*) @strcmp(i8* %.tmp7642, i8* %.tmp7644)
%.tmp7646 = icmp eq i32 %.tmp7645, 0
br i1 %.tmp7646, label %.if.true.7647, label %.if.false.7647
.if.true.7647:
%.tmp7648 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7649 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7648)
store %m2503$.AssignableInfo.type* %.tmp7649, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7650 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7651 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7650, i32 0, i32 6
%.tmp7652 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7651
%.tmp7653 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7652, i32 0, i32 6
%.tmp7654 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7653
%.tmp7656 = getelementptr [12 x i8], [12 x i8]*@.str7655, i32 0, i32 0
%.tmp7657 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp7654, i8* %.tmp7656)
%dest.7658 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7657, %m878$.Node.type** %dest.7658
%.tmp7659 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7660 = load %m878$.Node.type*, %m878$.Node.type** %dest.7658
%.tmp7661 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp7659, %m878$.Node.type* %.tmp7660)
%var_info.7662 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7661, %m2503$.AssignableInfo.type** %var_info.7662
%.tmp7663 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %var_info.7662
%.tmp7664 = icmp eq %m2503$.AssignableInfo.type* %.tmp7663, null
br i1 %.tmp7664, label %.if.true.7665, label %.if.false.7665
.if.true.7665:
%.tmp7666 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
ret %m2503$.AssignableInfo.type* %.tmp7666
br label %.if.end.7665
.if.false.7665:
br label %.if.end.7665
.if.end.7665:
%.tmp7667 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7668 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %var_info.7662
%.tmp7669 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7668, i32 0, i32 4
%.tmp7670 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7669
%.tmp7671 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp7667, %m2503$.Type.type* %.tmp7670)
%var_type_repr.7672 = alloca i8*
store i8* %.tmp7671, i8** %var_type_repr.7672
%.tmp7673 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7674 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp7673, %m2503$.AssignableInfo.type* %.tmp7674)
%.tmp7675 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7676 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7675, i32 0, i32 4
%.tmp7677 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %var_info.7662
%.tmp7678 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7677, i32 0, i32 4
%.tmp7679 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7678
store %m2503$.Type.type* %.tmp7679, %m2503$.Type.type** %.tmp7676
%.tmp7681 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7682 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7681, i32 0, i32 6
%.tmp7683 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7682
%.tmp7684 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7683, i32 0, i32 6
%.tmp7685 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7684
%ptr.7686 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7685, %m878$.Node.type** %ptr.7686
br label %.for.start.7680
.for.start.7680:
%.tmp7687 = load %m878$.Node.type*, %m878$.Node.type** %ptr.7686
%.tmp7688 = load %m878$.Node.type*, %m878$.Node.type** %dest.7658
%.tmp7689 = icmp ne %m878$.Node.type* %.tmp7687, %.tmp7688
br i1 %.tmp7689, label %.for.continue.7680, label %.for.end.7680
.for.continue.7680:
%.tmp7690 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%type.7691 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp7690, %m2503$.Type.type** %type.7691
%.tmp7692 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7691
%.tmp7693 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7692, i32 0, i32 3
%.tmp7694 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7695 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7694, i32 0, i32 4
%.tmp7696 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7695
store %m2503$.Type.type* %.tmp7696, %m2503$.Type.type** %.tmp7693
%.tmp7697 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7691
%.tmp7698 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7697, i32 0, i32 0
%.tmp7700 = getelementptr [4 x i8], [4 x i8]*@.str7699, i32 0, i32 0
store i8* %.tmp7700, i8** %.tmp7698
%.tmp7701 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7702 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7701, i32 0, i32 4
%.tmp7703 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7691
store %m2503$.Type.type* %.tmp7703, %m2503$.Type.type** %.tmp7702
%.tmp7704 = load %m878$.Node.type*, %m878$.Node.type** %ptr.7686
%.tmp7705 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7704, i32 0, i32 7
%.tmp7706 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7705
store %m878$.Node.type* %.tmp7706, %m878$.Node.type** %ptr.7686
br label %.for.start.7680
.for.end.7680:
%.tmp7707 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7708 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7707, i32 0, i32 6
%.tmp7709 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7708
%.tmp7710 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7709, i32 0, i32 6
%.tmp7711 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7710
%.tmp7712 = load %m878$.Node.type*, %m878$.Node.type** %dest.7658
%.tmp7713 = icmp ne %m878$.Node.type* %.tmp7711, %.tmp7712
br i1 %.tmp7713, label %.if.true.7714, label %.if.false.7714
.if.true.7714:
%.tmp7715 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7716 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp7715, i32 0, i32 1
%.tmp7717 = load %m0$.File.type*, %m0$.File.type** %.tmp7716
%.tmp7719 = getelementptr [38 x i8], [38 x i8]*@.str7718, i32 0, i32 0
%.tmp7720 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7721 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7720)
%.tmp7722 = load i8*, i8** %var_type_repr.7672
%.tmp7723 = load i8*, i8** %var_type_repr.7672
%.tmp7724 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %var_info.7662
%.tmp7725 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7724)
%.tmp7726 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7717, i8* %.tmp7719, i8* %.tmp7721, i8* %.tmp7722, i8* %.tmp7723, i8* %.tmp7725)
br label %.if.end.7714
.if.false.7714:
%.tmp7727 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7728 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7727, i32 0, i32 4
%.tmp7729 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7728
%.tmp7730 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7729, i32 0, i32 0
%.tmp7731 = load i8*, i8** %.tmp7730
%.tmp7733 = getelementptr [9 x i8], [9 x i8]*@.str7732, i32 0, i32 0
%.tmp7734 = call i32(i8*,i8*) @strcmp(i8* %.tmp7731, i8* %.tmp7733)
%.tmp7735 = icmp eq i32 %.tmp7734, 0
br i1 %.tmp7735, label %.if.true.7736, label %.if.false.7736
.if.true.7736:
%.tmp7737 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %var_info.7662
store %m2503$.AssignableInfo.type* %.tmp7737, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7738 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%type.7739 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp7738, %m2503$.Type.type** %type.7739
%.tmp7740 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7739
%.tmp7741 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7740, i32 0, i32 3
%.tmp7742 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7743 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7742, i32 0, i32 4
%.tmp7744 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7743
store %m2503$.Type.type* %.tmp7744, %m2503$.Type.type** %.tmp7741
%.tmp7745 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7739
%.tmp7746 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7745, i32 0, i32 0
%.tmp7748 = getelementptr [4 x i8], [4 x i8]*@.str7747, i32 0, i32 0
store i8* %.tmp7748, i8** %.tmp7746
%.tmp7749 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7750 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7749, i32 0, i32 4
%.tmp7751 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7739
store %m2503$.Type.type* %.tmp7751, %m2503$.Type.type** %.tmp7750
br label %.if.end.7736
.if.false.7736:
%.tmp7752 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7753 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp7752, i32 0, i32 1
%.tmp7754 = load %m0$.File.type*, %m0$.File.type** %.tmp7753
%.tmp7756 = getelementptr [22 x i8], [22 x i8]*@.str7755, i32 0, i32 0
%.tmp7757 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7758 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7757)
%.tmp7759 = load i8*, i8** %var_type_repr.7672
%.tmp7760 = load i8*, i8** %var_type_repr.7672
%.tmp7761 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %var_info.7662
%.tmp7762 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7761)
%.tmp7763 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7754, i8* %.tmp7756, i8* %.tmp7758, i8* %.tmp7759, i8* %.tmp7760, i8* %.tmp7762)
br label %.if.end.7736
.if.end.7736:
br label %.if.end.7714
.if.end.7714:
br label %.if.end.7647
.if.false.7647:
%.tmp7764 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7765 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7764, i32 0, i32 6
%.tmp7766 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7765
%.tmp7767 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7766, i32 0, i32 0
%.tmp7768 = load i8*, i8** %.tmp7767
%.tmp7770 = getelementptr [8 x i8], [8 x i8]*@.str7769, i32 0, i32 0
%.tmp7771 = call i32(i8*,i8*) @strcmp(i8* %.tmp7768, i8* %.tmp7770)
%.tmp7772 = icmp eq i32 %.tmp7771, 0
br i1 %.tmp7772, label %.if.true.7773, label %.if.false.7773
.if.true.7773:
%.tmp7774 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7775 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7774)
store %m2503$.AssignableInfo.type* %.tmp7775, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7776 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7777 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7776, i32 0, i32 4
%.tmp7778 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp7778, %m2503$.Type.type** %.tmp7777
%.tmp7779 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7780 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7779, i32 0, i32 4
%.tmp7781 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7780
%.tmp7782 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7781, i32 0, i32 0
%.tmp7784 = getelementptr [5 x i8], [5 x i8]*@.str7783, i32 0, i32 0
store i8* %.tmp7784, i8** %.tmp7782
%.tmp7785 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7786 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7785, i32 0, i32 6
%.tmp7787 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7786
%.tmp7788 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7787, i32 0, i32 6
%.tmp7789 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7788
%.tmp7790 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7789, i32 0, i32 1
%.tmp7791 = load i8*, i8** %.tmp7790
%.tmp7793 = getelementptr [6 x i8], [6 x i8]*@.str7792, i32 0, i32 0
%.tmp7794 = call i32(i8*,i8*) @strcmp(i8* %.tmp7791, i8* %.tmp7793)
%.tmp7795 = icmp eq i32 %.tmp7794, 0
br i1 %.tmp7795, label %.if.true.7796, label %.if.false.7796
.if.true.7796:
%.tmp7797 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7798 = load i8, i8* @SCOPE_CONST
%.tmp7800 = getelementptr [2 x i8], [2 x i8]*@.str7799, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp7797, i8 %.tmp7798, i8* %.tmp7800)
br label %.if.end.7796
.if.false.7796:
%.tmp7801 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7802 = load i8, i8* @SCOPE_CONST
%.tmp7804 = getelementptr [2 x i8], [2 x i8]*@.str7803, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp7801, i8 %.tmp7802, i8* %.tmp7804)
br label %.if.end.7796
.if.end.7796:
br label %.if.end.7773
.if.false.7773:
%.tmp7805 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7806 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7805, i32 0, i32 6
%.tmp7807 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7806
%.tmp7808 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7807, i32 0, i32 0
%.tmp7809 = load i8*, i8** %.tmp7808
%.tmp7811 = getelementptr [8 x i8], [8 x i8]*@.str7810, i32 0, i32 0
%.tmp7812 = call i32(i8*,i8*) @strcmp(i8* %.tmp7809, i8* %.tmp7811)
%.tmp7813 = icmp eq i32 %.tmp7812, 0
br i1 %.tmp7813, label %.if.true.7814, label %.if.false.7814
.if.true.7814:
%.tmp7815 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7816 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7817 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7816, i32 0, i32 6
%.tmp7818 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7817
%.tmp7819 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7818, i32 0, i32 6
%.tmp7820 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7819
%.tmp7821 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_fn_call.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp7815, %m878$.Node.type* %.tmp7820)
store %m2503$.AssignableInfo.type* %.tmp7821, %m2503$.AssignableInfo.type** %assignable_info.7558
br label %.if.end.7814
.if.false.7814:
%.tmp7822 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7823 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7822, i32 0, i32 6
%.tmp7824 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7823
%.tmp7825 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7824, i32 0, i32 0
%.tmp7826 = load i8*, i8** %.tmp7825
%.tmp7828 = getelementptr [7 x i8], [7 x i8]*@.str7827, i32 0, i32 0
%.tmp7829 = call i32(i8*,i8*) @strcmp(i8* %.tmp7826, i8* %.tmp7828)
%.tmp7830 = icmp eq i32 %.tmp7829, 0
br i1 %.tmp7830, label %.if.true.7831, label %.if.false.7831
.if.true.7831:
%.tmp7832 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7833 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7834 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7833, i32 0, i32 6
%.tmp7835 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7834
%.tmp7836 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7835, i32 0, i32 1
%.tmp7837 = load i8*, i8** %.tmp7836
%.tmp7838 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,i8*) @m295$define_string.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.tmp7832, i8* %.tmp7837)
%string_info.7839 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7838, %m2503$.AssignableInfo.type** %string_info.7839
%.tmp7840 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7841 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7840)
store %m2503$.AssignableInfo.type* %.tmp7841, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7842 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7843 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp7842, %m2503$.AssignableInfo.type* %.tmp7843)
%.tmp7844 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7845 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %string_info.7839
%.tmp7846 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7845, i32 0, i32 4
%.tmp7847 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7846
%.tmp7848 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp7844, %m2503$.Type.type* %.tmp7847)
%str_tr.7849 = alloca i8*
store i8* %.tmp7848, i8** %str_tr.7849
%.tmp7850 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7851 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp7850, i32 0, i32 1
%.tmp7852 = load %m0$.File.type*, %m0$.File.type** %.tmp7851
%.tmp7854 = getelementptr [44 x i8], [44 x i8]*@.str7853, i32 0, i32 0
%.tmp7855 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7856 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7855)
%.tmp7857 = load i8*, i8** %str_tr.7849
%.tmp7858 = load i8*, i8** %str_tr.7849
%.tmp7859 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %string_info.7839
%.tmp7860 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7859)
%.tmp7861 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7852, i8* %.tmp7854, i8* %.tmp7856, i8* %.tmp7857, i8* %.tmp7858, i8* %.tmp7860)
%.tmp7862 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7863 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7862, i32 0, i32 4
%.tmp7864 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp7864, %m2503$.Type.type** %.tmp7863
%.tmp7865 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7866 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7865, i32 0, i32 4
%.tmp7867 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7866
%.tmp7868 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7867, i32 0, i32 0
%.tmp7870 = getelementptr [4 x i8], [4 x i8]*@.str7869, i32 0, i32 0
store i8* %.tmp7870, i8** %.tmp7868
%.tmp7871 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7872 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7871, i32 0, i32 4
%.tmp7873 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7872
%.tmp7874 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7873, i32 0, i32 3
%.tmp7875 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp7875, %m2503$.Type.type** %.tmp7874
%.tmp7876 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7877 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7876, i32 0, i32 4
%.tmp7878 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7877
%.tmp7879 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7878, i32 0, i32 3
%.tmp7880 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7879
%.tmp7881 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7880, i32 0, i32 0
%.tmp7883 = getelementptr [4 x i8], [4 x i8]*@.str7882, i32 0, i32 0
store i8* %.tmp7883, i8** %.tmp7881
br label %.if.end.7831
.if.false.7831:
%.tmp7884 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7885 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7884, i32 0, i32 6
%.tmp7886 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7885
%.tmp7887 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7886, i32 0, i32 0
%.tmp7888 = load i8*, i8** %.tmp7887
%.tmp7890 = getelementptr [4 x i8], [4 x i8]*@.str7889, i32 0, i32 0
%.tmp7891 = call i32(i8*,i8*) @strcmp(i8* %.tmp7888, i8* %.tmp7890)
%.tmp7892 = icmp eq i32 %.tmp7891, 0
br i1 %.tmp7892, label %.if.true.7893, label %.if.false.7893
.if.true.7893:
%.tmp7894 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7895 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7894)
store %m2503$.AssignableInfo.type* %.tmp7895, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7896 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7897 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7896, i32 0, i32 6
%.tmp7898 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7897
%.tmp7899 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7898, i32 0, i32 1
%.tmp7900 = load i8*, i8** %.tmp7899
%.tmp7901 = call i32(i8*) @strlen(i8* %.tmp7900)
%chr_len.7902 = alloca i32
store i32 %.tmp7901, i32* %chr_len.7902
%.tmp7903 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7904 = load i8, i8* @SCOPE_CONST
%.tmp7906 = getelementptr [2 x i8], [2 x i8]*@.str7905, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp7903, i8 %.tmp7904, i8* %.tmp7906)
%.tmp7907 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7908 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7907, i32 0, i32 0
%.tmp7909 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7910 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7909, i32 0, i32 6
%.tmp7911 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7910
%.tmp7912 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7911, i32 0, i32 1
%.tmp7913 = load i8*, i8** %.tmp7912
%.tmp7914 = call i8*(i8*) @m2057$chr_to_llvm.cp.cp(i8* %.tmp7913)
store i8* %.tmp7914, i8** %.tmp7908
%.tmp7915 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7916 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7915, i32 0, i32 0
%.tmp7917 = load i8*, i8** %.tmp7916
%.tmp7918 = icmp eq i8* %.tmp7917, null
br i1 %.tmp7918, label %.if.true.7919, label %.if.false.7919
.if.true.7919:
%.tmp7920 = getelementptr i8*, i8** %err_buf.7561, i32 0
%.tmp7922 = getelementptr [22 x i8], [22 x i8]*@.str7921, i32 0, i32 0
%.tmp7923 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7924 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7923, i32 0, i32 6
%.tmp7925 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7924
%.tmp7926 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7925, i32 0, i32 1
%.tmp7927 = load i8*, i8** %.tmp7926
%.tmp7928 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7920, i8* %.tmp7922, i8* %.tmp7927)
%.tmp7929 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp7929
br label %.if.end.7919
.if.false.7919:
br label %.if.end.7919
.if.end.7919:
%.tmp7930 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7931 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7930, i32 0, i32 4
%.tmp7932 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp7932, %m2503$.Type.type** %.tmp7931
%.tmp7933 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7934 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7933, i32 0, i32 4
%.tmp7935 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7934
%.tmp7936 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7935, i32 0, i32 0
%.tmp7938 = getelementptr [4 x i8], [4 x i8]*@.str7937, i32 0, i32 0
store i8* %.tmp7938, i8** %.tmp7936
br label %.if.end.7893
.if.false.7893:
%.tmp7939 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7940 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7942 = getelementptr [40 x i8], [40 x i8]*@.str7941, i32 0, i32 0
%.tmp7943 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp7939, %m878$.Node.type* %.tmp7940, i8* %.tmp7942)
%.tmp7944 = load %m878$.Node.type*, %m878$.Node.type** %mono.7560
%.tmp7945 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7944, i32 0, i32 6
%.tmp7946 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7945
%.tmp7947 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7946, i32 0, i32 0
%.tmp7948 = load i8*, i8** %.tmp7947
%.tmp7949 = call i32(i8*,...) @printf(i8* %.tmp7943, i8* %.tmp7948)
%.tmp7950 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp7950
br label %.if.end.7893
.if.end.7893:
br label %.if.end.7831
.if.end.7831:
br label %.if.end.7814
.if.end.7814:
br label %.if.end.7773
.if.end.7773:
br label %.if.end.7647
.if.end.7647:
br label %.if.end.7600
.if.end.7600:
br label %.if.end.7572
.if.end.7572:
%.tmp7951 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7952 = icmp eq %m2503$.AssignableInfo.type* %.tmp7951, null
br i1 %.tmp7952, label %.if.true.7953, label %.if.false.7953
.if.true.7953:
%.tmp7954 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp7954
br label %.if.end.7953
.if.false.7953:
br label %.if.end.7953
.if.end.7953:
%.tmp7955 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7956 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7955, i32 0, i32 5
%.tmp7957 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7958 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7957, i32 0, i32 3
%.tmp7959 = load i32, i32* %.tmp7958
store i32 %.tmp7959, i32* %.tmp7956
%.tmp7960 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7961 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7960, i32 0, i32 6
%.tmp7962 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7963 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7962, i32 0, i32 4
%.tmp7964 = load i32, i32* %.tmp7963
store i32 %.tmp7964, i32* %.tmp7961
%.tmp7965 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7558
%.tmp7966 = bitcast %m2503$.AssignableInfo.type* %.tmp7965 to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp7966
}
define i8* @m295$type_abbr.cp.m2503$.Type.typep(%m2503$.Type.type* %.type.arg) {
%type = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.type.arg, %m2503$.Type.type** %type
%.tmp7967 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7968 = icmp ne %m2503$.Type.type* %.tmp7967, null
%.tmp7970 = getelementptr [22 x i8], [22 x i8]*@.str7969, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7968, i8* %.tmp7970)
%.tmp7971 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7972 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7971, i32 0, i32 0
%.tmp7973 = load i8*, i8** %.tmp7972
%.tmp7974 = icmp ne i8* %.tmp7973, null
%.tmp7976 = getelementptr [59 x i8], [59 x i8]*@.str7975, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7974, i8* %.tmp7976)
%.tmp7977 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7978 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7977, i32 0, i32 0
%.tmp7979 = load i8*, i8** %.tmp7978
%.tmp7981 = getelementptr [4 x i8], [4 x i8]*@.str7980, i32 0, i32 0
%.tmp7982 = call i32(i8*,i8*) @strcmp(i8* %.tmp7979, i8* %.tmp7981)
%.tmp7983 = icmp eq i32 %.tmp7982, 0
br i1 %.tmp7983, label %.if.true.7984, label %.if.false.7984
.if.true.7984:
%.tmp7986 = getelementptr [2 x i8], [2 x i8]*@.str7985, i32 0, i32 0
ret i8* %.tmp7986
br label %.if.end.7984
.if.false.7984:
%.tmp7987 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7988 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7987, i32 0, i32 0
%.tmp7989 = load i8*, i8** %.tmp7988
%.tmp7991 = getelementptr [5 x i8], [5 x i8]*@.str7990, i32 0, i32 0
%.tmp7992 = call i32(i8*,i8*) @strcmp(i8* %.tmp7989, i8* %.tmp7991)
%.tmp7993 = icmp eq i32 %.tmp7992, 0
br i1 %.tmp7993, label %.if.true.7994, label %.if.false.7994
.if.true.7994:
%.tmp7996 = getelementptr [2 x i8], [2 x i8]*@.str7995, i32 0, i32 0
ret i8* %.tmp7996
br label %.if.end.7994
.if.false.7994:
%.tmp7997 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7998 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7997, i32 0, i32 0
%.tmp7999 = load i8*, i8** %.tmp7998
%.tmp8001 = getelementptr [5 x i8], [5 x i8]*@.str8000, i32 0, i32 0
%.tmp8002 = call i32(i8*,i8*) @strcmp(i8* %.tmp7999, i8* %.tmp8001)
%.tmp8003 = icmp eq i32 %.tmp8002, 0
br i1 %.tmp8003, label %.if.true.8004, label %.if.false.8004
.if.true.8004:
%.tmp8006 = getelementptr [2 x i8], [2 x i8]*@.str8005, i32 0, i32 0
ret i8* %.tmp8006
br label %.if.end.8004
.if.false.8004:
%.tmp8007 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8008 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8007, i32 0, i32 0
%.tmp8009 = load i8*, i8** %.tmp8008
%.tmp8011 = getelementptr [4 x i8], [4 x i8]*@.str8010, i32 0, i32 0
%.tmp8012 = call i32(i8*,i8*) @strcmp(i8* %.tmp8009, i8* %.tmp8011)
%.tmp8013 = icmp eq i32 %.tmp8012, 0
br i1 %.tmp8013, label %.if.true.8014, label %.if.false.8014
.if.true.8014:
%.tmp8016 = getelementptr [2 x i8], [2 x i8]*@.str8015, i32 0, i32 0
ret i8* %.tmp8016
br label %.if.end.8014
.if.false.8014:
%.tmp8017 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8018 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8017, i32 0, i32 0
%.tmp8019 = load i8*, i8** %.tmp8018
%.tmp8021 = getelementptr [4 x i8], [4 x i8]*@.str8020, i32 0, i32 0
%.tmp8022 = call i32(i8*,i8*) @strcmp(i8* %.tmp8019, i8* %.tmp8021)
%.tmp8023 = icmp eq i32 %.tmp8022, 0
br i1 %.tmp8023, label %.if.true.8024, label %.if.false.8024
.if.true.8024:
%buf.8025 = alloca i8*
store i8* null, i8** %buf.8025
%.tmp8026 = getelementptr i8*, i8** %buf.8025, i32 0
%.tmp8028 = getelementptr [4 x i8], [4 x i8]*@.str8027, i32 0, i32 0
%.tmp8029 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8030 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8029, i32 0, i32 3
%.tmp8031 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8030
%.tmp8032 = call i8*(%m2503$.Type.type*) @m295$type_abbr.cp.m2503$.Type.typep(%m2503$.Type.type* %.tmp8031)
%.tmp8033 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8026, i8* %.tmp8028, i8* %.tmp8032)
%.tmp8034 = load i8*, i8** %buf.8025
ret i8* %.tmp8034
br label %.if.end.8024
.if.false.8024:
%.tmp8035 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8036 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8035, i32 0, i32 0
%.tmp8037 = load i8*, i8** %.tmp8036
%.tmp8039 = getelementptr [10 x i8], [10 x i8]*@.str8038, i32 0, i32 0
%.tmp8040 = call i32(i8*,i8*) @strcmp(i8* %.tmp8037, i8* %.tmp8039)
%.tmp8041 = icmp eq i32 %.tmp8040, 0
br i1 %.tmp8041, label %.if.true.8042, label %.if.false.8042
.if.true.8042:
%.tmp8043 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8044 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8043, i32 0, i32 2
%.tmp8045 = load i8*, i8** %.tmp8044
ret i8* %.tmp8045
br label %.if.end.8042
.if.false.8042:
%.tmp8046 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8047 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8046, i32 0, i32 0
%.tmp8048 = load i8*, i8** %.tmp8047
%.tmp8050 = getelementptr [7 x i8], [7 x i8]*@.str8049, i32 0, i32 0
%.tmp8051 = call i32(i8*,i8*) @strcmp(i8* %.tmp8048, i8* %.tmp8050)
%.tmp8052 = icmp eq i32 %.tmp8051, 0
br i1 %.tmp8052, label %.if.true.8053, label %.if.false.8053
.if.true.8053:
%.tmp8055 = getelementptr [2 x i8], [2 x i8]*@.str8054, i32 0, i32 0
%buf.8056 = alloca i8*
store i8* %.tmp8055, i8** %buf.8056
%.tmp8058 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8059 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8058, i32 0, i32 3
%.tmp8060 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8059
%t.8061 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8060, %m2503$.Type.type** %t.8061
br label %.for.start.8057
.for.start.8057:
%.tmp8062 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8061
%.tmp8063 = icmp ne %m2503$.Type.type* %.tmp8062, null
br i1 %.tmp8063, label %.for.continue.8057, label %.for.end.8057
.for.continue.8057:
%.tmp8064 = getelementptr i8*, i8** %buf.8056, i32 0
%.tmp8066 = getelementptr [5 x i8], [5 x i8]*@.str8065, i32 0, i32 0
%.tmp8067 = load i8*, i8** %buf.8056
%.tmp8068 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8061
%.tmp8069 = call i8*(%m2503$.Type.type*) @m295$type_abbr.cp.m2503$.Type.typep(%m2503$.Type.type* %.tmp8068)
%.tmp8070 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8064, i8* %.tmp8066, i8* %.tmp8067, i8* %.tmp8069)
%.tmp8071 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8061
%.tmp8072 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8071, i32 0, i32 4
%.tmp8073 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8072
store %m2503$.Type.type* %.tmp8073, %m2503$.Type.type** %t.8061
br label %.for.start.8057
.for.end.8057:
%.tmp8074 = load i8*, i8** %buf.8056
ret i8* %.tmp8074
br label %.if.end.8053
.if.false.8053:
%.tmp8075 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8076 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8075, i32 0, i32 0
%.tmp8077 = load i8*, i8** %.tmp8076
%.tmp8079 = getelementptr [9 x i8], [9 x i8]*@.str8078, i32 0, i32 0
%.tmp8080 = call i32(i8*,i8*) @strcmp(i8* %.tmp8077, i8* %.tmp8079)
%.tmp8081 = icmp eq i32 %.tmp8080, 0
br i1 %.tmp8081, label %.if.true.8082, label %.if.false.8082
.if.true.8082:
%.tmp8084 = getelementptr [2 x i8], [2 x i8]*@.str8083, i32 0, i32 0
ret i8* %.tmp8084
br label %.if.end.8082
.if.false.8082:
%.tmp8085 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8086 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8085, i32 0, i32 0
%.tmp8087 = load i8*, i8** %.tmp8086
%.tmp8089 = getelementptr [6 x i8], [6 x i8]*@.str8088, i32 0, i32 0
%.tmp8090 = call i32(i8*,i8*) @strcmp(i8* %.tmp8087, i8* %.tmp8089)
%.tmp8091 = icmp eq i32 %.tmp8090, 0
br i1 %.tmp8091, label %.if.true.8092, label %.if.false.8092
.if.true.8092:
%.tmp8094 = getelementptr [2 x i8], [2 x i8]*@.str8093, i32 0, i32 0
ret i8* %.tmp8094
br label %.if.end.8092
.if.false.8092:
%.tmp8096 = getelementptr [45 x i8], [45 x i8]*@.str8095, i32 0, i32 0
%.tmp8097 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8098 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8097, i32 0, i32 0
%.tmp8099 = load i8*, i8** %.tmp8098
%.tmp8100 = call i32(i8*,...) @printf(i8* %.tmp8096, i8* %.tmp8099)
br label %.if.end.8092
.if.end.8092:
br label %.if.end.8082
.if.end.8082:
br label %.if.end.8053
.if.end.8053:
br label %.if.end.8042
.if.end.8042:
br label %.if.end.8024
.if.end.8024:
br label %.if.end.8014
.if.end.8014:
br label %.if.end.8004
.if.end.8004:
br label %.if.end.7994
.if.end.7994:
br label %.if.end.7984
.if.end.7984:
%.tmp8101 = bitcast ptr null to i8*
ret i8* %.tmp8101
}
define %m2503$.AssignableInfo.type* @m295$define_string.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp8102 = bitcast ptr null to %m878$.Node.type*
%.tmp8103 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp8102)
%info.8104 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp8103, %m2503$.AssignableInfo.type** %info.8104
%tmp_buff.8105 = alloca i8*
store i8* null, i8** %tmp_buff.8105
%.tmp8106 = getelementptr i8*, i8** %tmp_buff.8105, i32 0
%.tmp8108 = getelementptr [7 x i8], [7 x i8]*@.str8107, i32 0, i32 0
%.tmp8109 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8110 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp8109)
%.tmp8111 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8106, i8* %.tmp8108, i32 %.tmp8110)
%.tmp8112 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8104
%.tmp8113 = load i8, i8* @SCOPE_GLOBAL
%.tmp8114 = load i8*, i8** %tmp_buff.8105
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp8112, i8 %.tmp8113, i8* %.tmp8114)
%.tmp8115 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8104
%.tmp8116 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8115, i32 0, i32 4
%.tmp8117 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp8117, %m2503$.Type.type** %.tmp8116
%.tmp8118 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8104
%.tmp8119 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8118, i32 0, i32 4
%.tmp8120 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8119
%.tmp8121 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8120, i32 0, i32 0
%.tmp8123 = getelementptr [6 x i8], [6 x i8]*@.str8122, i32 0, i32 0
store i8* %.tmp8123, i8** %.tmp8121
%.tmp8124 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8104
%.tmp8125 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8124, i32 0, i32 4
%.tmp8126 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8125
%.tmp8127 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8126, i32 0, i32 3
%.tmp8128 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp8128, %m2503$.Type.type** %.tmp8127
%.tmp8129 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8104
%.tmp8130 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8129, i32 0, i32 4
%.tmp8131 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8130
%.tmp8132 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8131, i32 0, i32 3
%.tmp8133 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8132
%.tmp8134 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8133, i32 0, i32 0
%.tmp8136 = getelementptr [4 x i8], [4 x i8]*@.str8135, i32 0, i32 0
store i8* %.tmp8136, i8** %.tmp8134
%.tmp8137 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8104
%.tmp8138 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8137, i32 0, i32 4
%.tmp8139 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8138
%.tmp8140 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8139, i32 0, i32 3
%.tmp8141 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8140
%.tmp8142 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8141, i32 0, i32 4
%.tmp8143 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp8143, %m2503$.Type.type** %.tmp8142
%.tmp8144 = load i8*, i8** %text
%.tmp8145 = call i8*(i8*) @m2057$string_to_llvm.cp.cp(i8* %.tmp8144)
%identifier.8146 = alloca i8*
store i8* %.tmp8145, i8** %identifier.8146
%.tmp8147 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8104
%.tmp8148 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8147, i32 0, i32 4
%.tmp8149 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8148
%.tmp8150 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8149, i32 0, i32 3
%.tmp8151 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8150
%.tmp8152 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8151, i32 0, i32 4
%.tmp8153 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8152
%.tmp8154 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8153, i32 0, i32 0
%.tmp8155 = getelementptr i8*, i8** %.tmp8154, i32 0
%.tmp8157 = getelementptr [3 x i8], [3 x i8]*@.str8156, i32 0, i32 0
%.tmp8158 = load i8*, i8** %identifier.8146
%.tmp8159 = call i32(i8*) @m2057$llvm_str_len.i.cp(i8* %.tmp8158)
%.tmp8160 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8155, i8* %.tmp8157, i32 %.tmp8159)
%.tmp8161 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8162 = load i8*, i8** %identifier.8146
%.tmp8164 = getelementptr [7 x i8], [7 x i8]*@.str8163, i32 0, i32 0
%.tmp8165 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8104
call void(%m2503$.CompilerCtx.type*,i8*,i8*,%m2503$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2503$.CompilerCtx.typep.cp.cp.m2503$.AssignableInfo.typep.b.b(%m2503$.CompilerCtx.type* %.tmp8161, i8* %.tmp8162, i8* %.tmp8164, %m2503$.AssignableInfo.type* %.tmp8165, i1 0, i1 0)
%.tmp8166 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8104
ret %m2503$.AssignableInfo.type* %.tmp8166
}
define void @m295$define_global.v.m2503$.CompilerCtx.typep.cp.cp.m2503$.AssignableInfo.typep.b.b(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg, i8* %.type.arg, %m2503$.AssignableInfo.type* %.info.arg, i1 %.weak.arg, i1 %.compiled.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%type = alloca i8*
store i8* %.type.arg, i8** %type
%info = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.info.arg, %m2503$.AssignableInfo.type** %info
%weak = alloca i1
store i1 %.weak.arg, i1* %weak
%compiled = alloca i1
store i1 %.compiled.arg, i1* %compiled
%.tmp8167 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* null, i32 1
%.tmp8168 = ptrtoint %m2503$.GlobalName.type* %.tmp8167 to i32
%.tmp8169 = call i8*(i32) @malloc(i32 %.tmp8168)
%.tmp8170 = bitcast i8* %.tmp8169 to %m2503$.GlobalName.type*
%global.8171 = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.tmp8170, %m2503$.GlobalName.type** %global.8171
%.tmp8172 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8171
%.tmp8173 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8172, i32 0, i32 0
%.tmp8174 = load i8*, i8** %id
store i8* %.tmp8174, i8** %.tmp8173
%.tmp8175 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8171
%.tmp8176 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8175, i32 0, i32 1
%.tmp8177 = load i8*, i8** %type
store i8* %.tmp8177, i8** %.tmp8176
%.tmp8178 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8171
%.tmp8179 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8178, i32 0, i32 4
%.tmp8180 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
store %m2503$.AssignableInfo.type* %.tmp8180, %m2503$.AssignableInfo.type** %.tmp8179
%.tmp8181 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8171
%.tmp8182 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8181, i32 0, i32 2
%.tmp8183 = load i1, i1* %compiled
store i1 %.tmp8183, i1* %.tmp8182
%.tmp8184 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8171
%.tmp8185 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8184, i32 0, i32 5
store %m2503$.GlobalName.type* null, %m2503$.GlobalName.type** %.tmp8185
%.tmp8186 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8171
%.tmp8187 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8186, i32 0, i32 3
%.tmp8188 = load i1, i1* %weak
store i1 %.tmp8188, i1* %.tmp8187
%.tmp8189 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8190 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8171
call void(%m2503$.CompilerCtx.type*,%m2503$.GlobalName.type*) @m295$append_global.v.m2503$.CompilerCtx.typep.m2503$.GlobalName.typep(%m2503$.CompilerCtx.type* %.tmp8189, %m2503$.GlobalName.type* %.tmp8190)
ret void
}
define void @m295$define_module.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.cp(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%mod = alloca %m878$.Node.type*
store %m878$.Node.type* %.mod.arg, %m878$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp8191 = load %m878$.Node.type*, %m878$.Node.type** %mod
%.tmp8192 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp8191)
%info.8193 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp8192, %m2503$.AssignableInfo.type** %info.8193
%.tmp8194 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8193
%.tmp8195 = load i8, i8* @SCOPE_CONST
%.tmp8196 = load i8*, i8** %abspath
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp8194, i8 %.tmp8195, i8* %.tmp8196)
%.tmp8197 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8193
%.tmp8198 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8197, i32 0, i32 3
%.tmp8200 = getelementptr [7 x i8], [7 x i8]*@.str8199, i32 0, i32 0
store i8* %.tmp8200, i8** %.tmp8198
%.tmp8201 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8193
%.tmp8202 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8201, i32 0, i32 4
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp8202
%.tmp8203 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8204 = load %m878$.Node.type*, %m878$.Node.type** %mod
%.tmp8205 = load i8*, i8** %as_name
%.tmp8206 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8193
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp8203, %m878$.Node.type* %.tmp8204, i8* %.tmp8205, %m2503$.AssignableInfo.type* %.tmp8206)
ret void
}
define void @m295$append_anon_fn.v.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.code.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%code = alloca i8*
store i8* %.code.arg, i8** %code
%.tmp8207 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* null, i32 1
%.tmp8208 = ptrtoint %m2503$.AnonFn.type* %.tmp8207 to i32
%.tmp8209 = call i8*(i32) @malloc(i32 %.tmp8208)
%.tmp8210 = bitcast i8* %.tmp8209 to %m2503$.AnonFn.type*
%fn.8211 = alloca %m2503$.AnonFn.type*
store %m2503$.AnonFn.type* %.tmp8210, %m2503$.AnonFn.type** %fn.8211
%.tmp8212 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8211
%.tmp8213 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8212, i32 0, i32 0
%.tmp8214 = load i8*, i8** %code
store i8* %.tmp8214, i8** %.tmp8213
%.tmp8215 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8216 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8215, i32 0, i32 8
%.tmp8217 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %.tmp8216
%.tmp8218 = icmp eq %m2503$.AnonFn.type* %.tmp8217, null
br i1 %.tmp8218, label %.if.true.8219, label %.if.false.8219
.if.true.8219:
%.tmp8220 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8221 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8220, i32 0, i32 8
%.tmp8222 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8211
store %m2503$.AnonFn.type* %.tmp8222, %m2503$.AnonFn.type** %.tmp8221
%.tmp8223 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8211
%.tmp8224 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8223, i32 0, i32 1
store %m2503$.AnonFn.type* null, %m2503$.AnonFn.type** %.tmp8224
br label %.if.end.8219
.if.false.8219:
%.tmp8225 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8226 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8225, i32 0, i32 8
%.tmp8227 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %.tmp8226
%last.8228 = alloca %m2503$.AnonFn.type*
store %m2503$.AnonFn.type* %.tmp8227, %m2503$.AnonFn.type** %last.8228
br label %.for.start.8229
.for.start.8229:
%.tmp8230 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %last.8228
%.tmp8231 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8230, i32 0, i32 1
%.tmp8232 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %.tmp8231
%.tmp8233 = icmp ne %m2503$.AnonFn.type* %.tmp8232, null
br i1 %.tmp8233, label %.for.continue.8229, label %.for.end.8229
.for.continue.8229:
%.tmp8234 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %last.8228
%.tmp8235 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8234, i32 0, i32 1
%.tmp8236 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %.tmp8235
store %m2503$.AnonFn.type* %.tmp8236, %m2503$.AnonFn.type** %last.8228
br label %.for.start.8229
.for.end.8229:
%.tmp8237 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %last.8228
%.tmp8238 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8237, i32 0, i32 1
%.tmp8239 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8211
store %m2503$.AnonFn.type* %.tmp8239, %m2503$.AnonFn.type** %.tmp8238
br label %.if.end.8219
.if.end.8219:
ret void
}
define void @m295$compile_anon_fn.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%.tmp8241 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8242 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8241, i32 0, i32 8
%.tmp8243 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %.tmp8242
%fn.8244 = alloca %m2503$.AnonFn.type*
store %m2503$.AnonFn.type* %.tmp8243, %m2503$.AnonFn.type** %fn.8244
br label %.for.start.8240
.for.start.8240:
%.tmp8245 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8244
%.tmp8246 = icmp ne %m2503$.AnonFn.type* %.tmp8245, null
br i1 %.tmp8246, label %.for.continue.8240, label %.for.end.8240
.for.continue.8240:
%.tmp8247 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8248 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8247, i32 0, i32 1
%.tmp8249 = load %m0$.File.type*, %m0$.File.type** %.tmp8248
%.tmp8251 = getelementptr [4 x i8], [4 x i8]*@.str8250, i32 0, i32 0
%.tmp8252 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8244
%.tmp8253 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8252, i32 0, i32 0
%.tmp8254 = load i8*, i8** %.tmp8253
%.tmp8255 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8249, i8* %.tmp8251, i8* %.tmp8254)
%.tmp8256 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8244
%.tmp8257 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8256, i32 0, i32 1
%.tmp8258 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %.tmp8257
store %m2503$.AnonFn.type* %.tmp8258, %m2503$.AnonFn.type** %fn.8244
br label %.for.start.8240
.for.end.8240:
%.tmp8259 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8260 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8259, i32 0, i32 8
store %m2503$.AnonFn.type* null, %m2503$.AnonFn.type** %.tmp8260
ret void
}
define void @m295$append_global.v.m2503$.CompilerCtx.typep.m2503$.GlobalName.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%g = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.g.arg, %m2503$.GlobalName.type** %g
%.tmp8261 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8262 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8261, i32 0, i32 3
%.tmp8263 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp8262
%.tmp8264 = icmp eq %m2503$.GlobalName.type* %.tmp8263, null
br i1 %.tmp8264, label %.if.true.8265, label %.if.false.8265
.if.true.8265:
%.tmp8266 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8267 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8266, i32 0, i32 3
%.tmp8268 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
store %m2503$.GlobalName.type* %.tmp8268, %m2503$.GlobalName.type** %.tmp8267
ret void
br label %.if.end.8265
.if.false.8265:
br label %.if.end.8265
.if.end.8265:
%.tmp8269 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8270 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8269, i32 0, i32 3
%.tmp8271 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp8270
%last_global.8272 = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.tmp8271, %m2503$.GlobalName.type** %last_global.8272
%.tmp8274 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8275 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8274, i32 0, i32 3
%.tmp8276 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp8275
%curr_global.8277 = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.tmp8276, %m2503$.GlobalName.type** %curr_global.8277
br label %.for.start.8273
.for.start.8273:
%.tmp8278 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %curr_global.8277
%.tmp8279 = icmp ne %m2503$.GlobalName.type* %.tmp8278, null
br i1 %.tmp8279, label %.for.continue.8273, label %.for.end.8273
.for.continue.8273:
%.tmp8280 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %curr_global.8277
%.tmp8281 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8280, i32 0, i32 4
%.tmp8282 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp8281
%.tmp8283 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8282, i32 0, i32 0
%.tmp8284 = load i8*, i8** %.tmp8283
%.tmp8285 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp8286 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8285, i32 0, i32 4
%.tmp8287 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp8286
%.tmp8288 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8287, i32 0, i32 0
%.tmp8289 = load i8*, i8** %.tmp8288
%.tmp8290 = call i32(i8*,i8*) @strcmp(i8* %.tmp8284, i8* %.tmp8289)
%.tmp8291 = icmp eq i32 %.tmp8290, 0
br i1 %.tmp8291, label %.if.true.8292, label %.if.false.8292
.if.true.8292:
ret void
br label %.if.end.8292
.if.false.8292:
br label %.if.end.8292
.if.end.8292:
%.tmp8293 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %curr_global.8277
store %m2503$.GlobalName.type* %.tmp8293, %m2503$.GlobalName.type** %last_global.8272
%.tmp8294 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %curr_global.8277
%.tmp8295 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8294, i32 0, i32 5
%.tmp8296 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp8295
store %m2503$.GlobalName.type* %.tmp8296, %m2503$.GlobalName.type** %curr_global.8277
br label %.for.start.8273
.for.end.8273:
%.tmp8297 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %last_global.8272
%.tmp8298 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8297, i32 0, i32 5
%.tmp8299 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
store %m2503$.GlobalName.type* %.tmp8299, %m2503$.GlobalName.type** %.tmp8298
ret void
}
define i8* @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.Type.type* %.type.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%type = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.type.arg, %m2503$.Type.type** %type
%.tmp8300 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8301 = icmp eq %m2503$.Type.type* %.tmp8300, null
br i1 %.tmp8301, label %.if.true.8302, label %.if.false.8302
.if.true.8302:
%.tmp8303 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp8303, label %.if.true.8304, label %.if.false.8304
.if.true.8304:
%.tmp8306 = getelementptr [44 x i8], [44 x i8]*@.str8305, i32 0, i32 0
%.tmp8307 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8308 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8307, i32 0, i32 7
%.tmp8309 = load i8*, i8** %.tmp8308
%.tmp8310 = call i32(i8*,...) @printf(i8* %.tmp8306, i8* %.tmp8309)
br label %.if.end.8304
.if.false.8304:
br label %.if.end.8304
.if.end.8304:
%.tmp8312 = getelementptr [2 x i8], [2 x i8]*@.str8311, i32 0, i32 0
ret i8* %.tmp8312
br label %.if.end.8302
.if.false.8302:
br label %.if.end.8302
.if.end.8302:
%.tmp8313 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8314 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8313, i32 0, i32 0
%.tmp8315 = load i8*, i8** %.tmp8314
%.tmp8316 = icmp ne i8* %.tmp8315, null
%.tmp8318 = getelementptr [59 x i8], [59 x i8]*@.str8317, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8316, i8* %.tmp8318)
%buf.8319 = alloca i8*
store i8* null, i8** %buf.8319
%.tmp8320 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8321 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8320, i32 0, i32 0
%.tmp8322 = load i8*, i8** %.tmp8321
%.tmp8324 = getelementptr [4 x i8], [4 x i8]*@.str8323, i32 0, i32 0
%.tmp8325 = call i32(i8*,i8*) @strcmp(i8* %.tmp8322, i8* %.tmp8324)
%.tmp8326 = icmp eq i32 %.tmp8325, 0
br i1 %.tmp8326, label %.if.true.8327, label %.if.false.8327
.if.true.8327:
%.tmp8329 = getelementptr [4 x i8], [4 x i8]*@.str8328, i32 0, i32 0
ret i8* %.tmp8329
br label %.if.end.8327
.if.false.8327:
%.tmp8330 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8331 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8330, i32 0, i32 0
%.tmp8332 = load i8*, i8** %.tmp8331
%.tmp8334 = getelementptr [5 x i8], [5 x i8]*@.str8333, i32 0, i32 0
%.tmp8335 = call i32(i8*,i8*) @strcmp(i8* %.tmp8332, i8* %.tmp8334)
%.tmp8336 = icmp eq i32 %.tmp8335, 0
br i1 %.tmp8336, label %.if.true.8337, label %.if.false.8337
.if.true.8337:
%.tmp8339 = getelementptr [5 x i8], [5 x i8]*@.str8338, i32 0, i32 0
ret i8* %.tmp8339
br label %.if.end.8337
.if.false.8337:
%.tmp8340 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8341 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8340, i32 0, i32 0
%.tmp8342 = load i8*, i8** %.tmp8341
%.tmp8344 = getelementptr [5 x i8], [5 x i8]*@.str8343, i32 0, i32 0
%.tmp8345 = call i32(i8*,i8*) @strcmp(i8* %.tmp8342, i8* %.tmp8344)
%.tmp8346 = icmp eq i32 %.tmp8345, 0
br i1 %.tmp8346, label %.if.true.8347, label %.if.false.8347
.if.true.8347:
%.tmp8349 = getelementptr [3 x i8], [3 x i8]*@.str8348, i32 0, i32 0
ret i8* %.tmp8349
br label %.if.end.8347
.if.false.8347:
%.tmp8350 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8351 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8350, i32 0, i32 0
%.tmp8352 = load i8*, i8** %.tmp8351
%.tmp8354 = getelementptr [8 x i8], [8 x i8]*@.str8353, i32 0, i32 0
%.tmp8355 = call i32(i8*,i8*) @strcmp(i8* %.tmp8352, i8* %.tmp8354)
%.tmp8356 = icmp eq i32 %.tmp8355, 0
br i1 %.tmp8356, label %.if.true.8357, label %.if.false.8357
.if.true.8357:
%.tmp8359 = getelementptr [4 x i8], [4 x i8]*@.str8358, i32 0, i32 0
ret i8* %.tmp8359
br label %.if.end.8357
.if.false.8357:
%.tmp8360 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8361 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8360, i32 0, i32 0
%.tmp8362 = load i8*, i8** %.tmp8361
%.tmp8364 = getelementptr [4 x i8], [4 x i8]*@.str8363, i32 0, i32 0
%.tmp8365 = call i32(i8*,i8*) @strcmp(i8* %.tmp8362, i8* %.tmp8364)
%.tmp8366 = icmp eq i32 %.tmp8365, 0
br i1 %.tmp8366, label %.if.true.8367, label %.if.false.8367
.if.true.8367:
%.tmp8369 = getelementptr [3 x i8], [3 x i8]*@.str8368, i32 0, i32 0
ret i8* %.tmp8369
br label %.if.end.8367
.if.false.8367:
%.tmp8370 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8371 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8370, i32 0, i32 0
%.tmp8372 = load i8*, i8** %.tmp8371
%.tmp8374 = getelementptr [9 x i8], [9 x i8]*@.str8373, i32 0, i32 0
%.tmp8375 = call i32(i8*,i8*) @strcmp(i8* %.tmp8372, i8* %.tmp8374)
%.tmp8376 = icmp eq i32 %.tmp8375, 0
br i1 %.tmp8376, label %.if.true.8377, label %.if.false.8377
.if.true.8377:
%.tmp8378 = getelementptr i8*, i8** %buf.8319, i32 0
%.tmp8380 = getelementptr [4 x i8], [4 x i8]*@.str8379, i32 0, i32 0
%.tmp8381 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8382 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8383 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8382, i32 0, i32 3
%.tmp8384 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8383
%.tmp8385 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp8381, %m2503$.Type.type* %.tmp8384)
%.tmp8386 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8378, i8* %.tmp8380, i8* %.tmp8385)
%.tmp8388 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8389 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8388, i32 0, i32 3
%.tmp8390 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8389
%.tmp8391 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8390, i32 0, i32 4
%.tmp8392 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8391
%p.8393 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8392, %m2503$.Type.type** %p.8393
br label %.for.start.8387
.for.start.8387:
%.tmp8394 = load %m2503$.Type.type*, %m2503$.Type.type** %p.8393
%.tmp8395 = icmp ne %m2503$.Type.type* %.tmp8394, null
br i1 %.tmp8395, label %.for.continue.8387, label %.for.end.8387
.for.continue.8387:
%.tmp8396 = load %m2503$.Type.type*, %m2503$.Type.type** %p.8393
%.tmp8397 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8398 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8397, i32 0, i32 3
%.tmp8399 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8398
%.tmp8400 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8399, i32 0, i32 4
%.tmp8401 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8400
%.tmp8402 = icmp ne %m2503$.Type.type* %.tmp8396, %.tmp8401
br i1 %.tmp8402, label %.if.true.8403, label %.if.false.8403
.if.true.8403:
%.tmp8404 = getelementptr i8*, i8** %buf.8319, i32 0
%.tmp8406 = getelementptr [4 x i8], [4 x i8]*@.str8405, i32 0, i32 0
%.tmp8407 = load i8*, i8** %buf.8319
%.tmp8408 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8404, i8* %.tmp8406, i8* %.tmp8407)
br label %.if.end.8403
.if.false.8403:
br label %.if.end.8403
.if.end.8403:
%.tmp8409 = getelementptr i8*, i8** %buf.8319, i32 0
%.tmp8411 = getelementptr [5 x i8], [5 x i8]*@.str8410, i32 0, i32 0
%.tmp8412 = load i8*, i8** %buf.8319
%.tmp8413 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8414 = load %m2503$.Type.type*, %m2503$.Type.type** %p.8393
%.tmp8415 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp8413, %m2503$.Type.type* %.tmp8414)
%.tmp8416 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8409, i8* %.tmp8411, i8* %.tmp8412, i8* %.tmp8415)
%.tmp8417 = load %m2503$.Type.type*, %m2503$.Type.type** %p.8393
%.tmp8418 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8417, i32 0, i32 4
%.tmp8419 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8418
store %m2503$.Type.type* %.tmp8419, %m2503$.Type.type** %p.8393
br label %.for.start.8387
.for.end.8387:
%.tmp8420 = getelementptr i8*, i8** %buf.8319, i32 0
%.tmp8422 = getelementptr [4 x i8], [4 x i8]*@.str8421, i32 0, i32 0
%.tmp8423 = load i8*, i8** %buf.8319
%.tmp8424 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8420, i8* %.tmp8422, i8* %.tmp8423)
%.tmp8425 = load i8*, i8** %buf.8319
ret i8* %.tmp8425
br label %.if.end.8377
.if.false.8377:
%.tmp8426 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8427 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8426, i32 0, i32 0
%.tmp8428 = load i8*, i8** %.tmp8427
%.tmp8430 = getelementptr [4 x i8], [4 x i8]*@.str8429, i32 0, i32 0
%.tmp8431 = call i32(i8*,i8*) @strcmp(i8* %.tmp8428, i8* %.tmp8430)
%.tmp8432 = icmp eq i32 %.tmp8431, 0
br i1 %.tmp8432, label %.if.true.8433, label %.if.false.8433
.if.true.8433:
%.tmp8434 = getelementptr i8*, i8** %buf.8319, i32 0
%.tmp8436 = getelementptr [4 x i8], [4 x i8]*@.str8435, i32 0, i32 0
%.tmp8437 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8438 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8439 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8438, i32 0, i32 3
%.tmp8440 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8439
%.tmp8441 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp8437, %m2503$.Type.type* %.tmp8440)
%.tmp8442 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8434, i8* %.tmp8436, i8* %.tmp8441)
%.tmp8443 = load i8*, i8** %buf.8319
ret i8* %.tmp8443
br label %.if.end.8433
.if.false.8433:
%.tmp8444 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8445 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8444, i32 0, i32 0
%.tmp8446 = load i8*, i8** %.tmp8445
%.tmp8448 = getelementptr [7 x i8], [7 x i8]*@.str8447, i32 0, i32 0
%.tmp8449 = call i32(i8*,i8*) @strcmp(i8* %.tmp8446, i8* %.tmp8448)
%.tmp8450 = icmp eq i32 %.tmp8449, 0
br i1 %.tmp8450, label %.if.true.8451, label %.if.false.8451
.if.true.8451:
%.tmp8452 = getelementptr i8*, i8** %buf.8319, i32 0
%.tmp8454 = getelementptr [2 x i8], [2 x i8]*@.str8453, i32 0, i32 0
%.tmp8455 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8452, i8* %.tmp8454)
%.tmp8457 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8458 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8457, i32 0, i32 3
%.tmp8459 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8458
%t.8460 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8459, %m2503$.Type.type** %t.8460
br label %.for.start.8456
.for.start.8456:
%.tmp8461 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8460
%.tmp8462 = icmp ne %m2503$.Type.type* %.tmp8461, null
br i1 %.tmp8462, label %.for.continue.8456, label %.for.end.8456
.for.continue.8456:
%.tmp8463 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8460
%.tmp8464 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8465 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8464, i32 0, i32 3
%.tmp8466 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8465
%.tmp8467 = icmp ne %m2503$.Type.type* %.tmp8463, %.tmp8466
br i1 %.tmp8467, label %.if.true.8468, label %.if.false.8468
.if.true.8468:
%.tmp8469 = getelementptr i8*, i8** %buf.8319, i32 0
%.tmp8471 = getelementptr [4 x i8], [4 x i8]*@.str8470, i32 0, i32 0
%.tmp8472 = load i8*, i8** %buf.8319
%.tmp8473 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8469, i8* %.tmp8471, i8* %.tmp8472)
br label %.if.end.8468
.if.false.8468:
br label %.if.end.8468
.if.end.8468:
%.tmp8474 = getelementptr i8*, i8** %buf.8319, i32 0
%.tmp8476 = getelementptr [5 x i8], [5 x i8]*@.str8475, i32 0, i32 0
%.tmp8477 = load i8*, i8** %buf.8319
%.tmp8478 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8479 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8460
%.tmp8480 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp8478, %m2503$.Type.type* %.tmp8479)
%.tmp8481 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8474, i8* %.tmp8476, i8* %.tmp8477, i8* %.tmp8480)
%.tmp8482 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8460
%.tmp8483 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8482, i32 0, i32 4
%.tmp8484 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8483
store %m2503$.Type.type* %.tmp8484, %m2503$.Type.type** %t.8460
br label %.for.start.8456
.for.end.8456:
%.tmp8485 = getelementptr i8*, i8** %buf.8319, i32 0
%.tmp8487 = getelementptr [4 x i8], [4 x i8]*@.str8486, i32 0, i32 0
%.tmp8488 = load i8*, i8** %buf.8319
%.tmp8489 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8485, i8* %.tmp8487, i8* %.tmp8488)
%.tmp8490 = load i8*, i8** %buf.8319
ret i8* %.tmp8490
br label %.if.end.8451
.if.false.8451:
%.tmp8491 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8492 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8491, i32 0, i32 0
%.tmp8493 = load i8*, i8** %.tmp8492
%.tmp8495 = getelementptr [6 x i8], [6 x i8]*@.str8494, i32 0, i32 0
%.tmp8496 = call i32(i8*,i8*) @strcmp(i8* %.tmp8493, i8* %.tmp8495)
%.tmp8497 = icmp eq i32 %.tmp8496, 0
br i1 %.tmp8497, label %.if.true.8498, label %.if.false.8498
.if.true.8498:
%.tmp8499 = getelementptr i8*, i8** %buf.8319, i32 0
%.tmp8501 = getelementptr [10 x i8], [10 x i8]*@.str8500, i32 0, i32 0
%.tmp8502 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8503 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8502, i32 0, i32 3
%.tmp8504 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8503
%.tmp8505 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8504, i32 0, i32 4
%.tmp8506 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8505
%.tmp8507 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8506, i32 0, i32 0
%.tmp8508 = load i8*, i8** %.tmp8507
%.tmp8509 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8510 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8511 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8510, i32 0, i32 3
%.tmp8512 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8511
%.tmp8513 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp8509, %m2503$.Type.type* %.tmp8512)
%.tmp8514 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8499, i8* %.tmp8501, i8* %.tmp8508, i8* %.tmp8513)
%.tmp8515 = load i8*, i8** %buf.8319
ret i8* %.tmp8515
br label %.if.end.8498
.if.false.8498:
%.tmp8516 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8517 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8516, i32 0, i32 0
%.tmp8518 = load i8*, i8** %.tmp8517
%.tmp8520 = getelementptr [10 x i8], [10 x i8]*@.str8519, i32 0, i32 0
%.tmp8521 = call i32(i8*,i8*) @strcmp(i8* %.tmp8518, i8* %.tmp8520)
%.tmp8522 = icmp eq i32 %.tmp8521, 0
br i1 %.tmp8522, label %.if.true.8523, label %.if.false.8523
.if.true.8523:
%.tmp8524 = getelementptr i8*, i8** %buf.8319, i32 0
%.tmp8526 = getelementptr [5 x i8], [5 x i8]*@.str8525, i32 0, i32 0
%.tmp8527 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8528 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8527, i32 0, i32 2
%.tmp8529 = load i8*, i8** %.tmp8528
%.tmp8530 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8524, i8* %.tmp8526, i8* %.tmp8529)
%.tmp8531 = load i8*, i8** %buf.8319
ret i8* %.tmp8531
br label %.if.end.8523
.if.false.8523:
%.tmp8532 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8533 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8532, i32 0, i32 0
%.tmp8534 = load i8*, i8** %.tmp8533
%.tmp8536 = getelementptr [7 x i8], [7 x i8]*@.str8535, i32 0, i32 0
%.tmp8537 = call i32(i8*,i8*) @strcmp(i8* %.tmp8534, i8* %.tmp8536)
%.tmp8538 = icmp eq i32 %.tmp8537, 0
br i1 %.tmp8538, label %.if.true.8539, label %.if.false.8539
.if.true.8539:
%.tmp8541 = getelementptr [4 x i8], [4 x i8]*@.str8540, i32 0, i32 0
ret i8* %.tmp8541
br label %.if.end.8539
.if.false.8539:
%.tmp8542 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8543 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8542, i32 0, i32 0
%.tmp8544 = load i8*, i8** %.tmp8543
%.tmp8546 = getelementptr [6 x i8], [6 x i8]*@.str8545, i32 0, i32 0
%.tmp8547 = call i32(i8*,i8*) @strcmp(i8* %.tmp8544, i8* %.tmp8546)
%.tmp8548 = icmp eq i32 %.tmp8547, 0
br i1 %.tmp8548, label %.if.true.8549, label %.if.false.8549
.if.true.8549:
br label %.if.end.8549
.if.false.8549:
%.tmp8551 = getelementptr [58 x i8], [58 x i8]*@.str8550, i32 0, i32 0
%.tmp8552 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8553 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8552, i32 0, i32 0
%.tmp8554 = load i8*, i8** %.tmp8553
%.tmp8555 = call i32(i8*,...) @printf(i8* %.tmp8551, i8* %.tmp8554)
br label %.if.end.8549
.if.end.8549:
br label %.if.end.8539
.if.end.8539:
br label %.if.end.8523
.if.end.8523:
br label %.if.end.8498
.if.end.8498:
br label %.if.end.8451
.if.end.8451:
br label %.if.end.8433
.if.end.8433:
br label %.if.end.8377
.if.end.8377:
br label %.if.end.8367
.if.end.8367:
br label %.if.end.8357
.if.end.8357:
br label %.if.end.8347
.if.end.8347:
br label %.if.end.8337
.if.end.8337:
br label %.if.end.8327
.if.end.8327:
%.tmp8556 = bitcast ptr null to i8*
ret i8* %.tmp8556
}
define void @m295$append_error.v.m2503$.CompilerCtx.typep.m296$.Error.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m296$.Error.type* %.e.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp8557 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* null, i32 1
%.tmp8558 = ptrtoint %m2503$.ErrorList.type* %.tmp8557 to i32
%.tmp8559 = call i8*(i32) @malloc(i32 %.tmp8558)
%.tmp8560 = bitcast i8* %.tmp8559 to %m2503$.ErrorList.type*
%new_err.8561 = alloca %m2503$.ErrorList.type*
store %m2503$.ErrorList.type* %.tmp8560, %m2503$.ErrorList.type** %new_err.8561
%.tmp8562 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %new_err.8561
%.tmp8563 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp8562, i32 0, i32 2
store i1 0, i1* %.tmp8563
%.tmp8564 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %new_err.8561
%.tmp8565 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp8564, i32 0, i32 0
%.tmp8566 = load %m296$.Error.type*, %m296$.Error.type** %e
store %m296$.Error.type* %.tmp8566, %m296$.Error.type** %.tmp8565
%.tmp8567 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %new_err.8561
%.tmp8568 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp8567, i32 0, i32 1
store %m2503$.ErrorList.type* null, %m2503$.ErrorList.type** %.tmp8568
%.tmp8569 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8570 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8569, i32 0, i32 2
%.tmp8571 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp8570
%.tmp8572 = icmp eq %m2503$.ErrorList.type* %.tmp8571, null
br i1 %.tmp8572, label %.if.true.8573, label %.if.false.8573
.if.true.8573:
%.tmp8574 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8575 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8574, i32 0, i32 2
%.tmp8576 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %new_err.8561
store %m2503$.ErrorList.type* %.tmp8576, %m2503$.ErrorList.type** %.tmp8575
ret void
br label %.if.end.8573
.if.false.8573:
br label %.if.end.8573
.if.end.8573:
%last.8577 = alloca %m2503$.ErrorList.type*
store %m2503$.ErrorList.type* null, %m2503$.ErrorList.type** %last.8577
%.tmp8579 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8580 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8579, i32 0, i32 2
%.tmp8581 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp8580
store %m2503$.ErrorList.type* %.tmp8581, %m2503$.ErrorList.type** %last.8577
br label %.for.start.8578
.for.start.8578:
%.tmp8582 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %last.8577
%.tmp8583 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp8582, i32 0, i32 1
%.tmp8584 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp8583
%.tmp8585 = icmp ne %m2503$.ErrorList.type* %.tmp8584, null
br i1 %.tmp8585, label %.for.continue.8578, label %.for.end.8578
.for.continue.8578:
%.tmp8586 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %last.8577
%.tmp8587 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp8586, i32 0, i32 1
%.tmp8588 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp8587
store %m2503$.ErrorList.type* %.tmp8588, %m2503$.ErrorList.type** %last.8577
br label %.for.start.8578
.for.end.8578:
%.tmp8589 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %last.8577
%.tmp8590 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp8589, i32 0, i32 1
%.tmp8591 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %new_err.8561
store %m2503$.ErrorList.type* %.tmp8591, %m2503$.ErrorList.type** %.tmp8590
ret void
}
define i8* @m295$syn_function_name.cp.m878$.Node.typep(%m878$.Node.type* %.stmt.arg) {
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp8592 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8593 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8592, i32 0, i32 6
%.tmp8594 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8593
%.tmp8595 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8594, i32 0, i32 7
%.tmp8596 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8595
%.tmp8597 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8596, i32 0, i32 1
%.tmp8598 = load i8*, i8** %.tmp8597
ret i8* %.tmp8598
}
define %m878$.Node.type* @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m878$.Node.type*
store %m878$.Node.type* %.node.arg, %m878$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp8600 = load %m878$.Node.type*, %m878$.Node.type** %node
%n.8601 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8600, %m878$.Node.type** %n.8601
br label %.for.start.8599
.for.start.8599:
%.tmp8602 = load %m878$.Node.type*, %m878$.Node.type** %n.8601
%.tmp8603 = icmp ne %m878$.Node.type* %.tmp8602, null
br i1 %.tmp8603, label %.for.continue.8599, label %.for.end.8599
.for.continue.8599:
%.tmp8604 = load %m878$.Node.type*, %m878$.Node.type** %n.8601
%.tmp8605 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8604, i32 0, i32 0
%.tmp8606 = load i8*, i8** %.tmp8605
%.tmp8607 = load i8*, i8** %type
%.tmp8608 = call i32(i8*,i8*) @strcmp(i8* %.tmp8606, i8* %.tmp8607)
%.tmp8609 = icmp eq i32 %.tmp8608, 0
br i1 %.tmp8609, label %.if.true.8610, label %.if.false.8610
.if.true.8610:
%.tmp8611 = load %m878$.Node.type*, %m878$.Node.type** %n.8601
ret %m878$.Node.type* %.tmp8611
br label %.if.end.8610
.if.false.8610:
br label %.if.end.8610
.if.end.8610:
%.tmp8612 = load %m878$.Node.type*, %m878$.Node.type** %n.8601
%.tmp8613 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8612, i32 0, i32 7
%.tmp8614 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8613
store %m878$.Node.type* %.tmp8614, %m878$.Node.type** %n.8601
br label %.for.start.8599
.for.end.8599:
%.tmp8615 = bitcast ptr null to %m878$.Node.type*
ret %m878$.Node.type* %.tmp8615
}
define %m2503$.Type.type* @m295$syn_function_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp8616 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%function_type.8617 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8616, %m2503$.Type.type** %function_type.8617
%.tmp8618 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8619 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8620 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8619, i32 0, i32 6
%.tmp8621 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8620
%.tmp8622 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8618, %m878$.Node.type* %.tmp8621)
%return_value_type.8623 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8622, %m2503$.Type.type** %return_value_type.8623
%.tmp8624 = load %m2503$.Type.type*, %m2503$.Type.type** %function_type.8617
%.tmp8625 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8624, i32 0, i32 0
%.tmp8627 = getelementptr [9 x i8], [9 x i8]*@.str8626, i32 0, i32 0
store i8* %.tmp8627, i8** %.tmp8625
%.tmp8628 = load %m2503$.Type.type*, %m2503$.Type.type** %function_type.8617
%.tmp8629 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8628, i32 0, i32 3
%.tmp8630 = load %m2503$.Type.type*, %m2503$.Type.type** %return_value_type.8623
store %m2503$.Type.type* %.tmp8630, %m2503$.Type.type** %.tmp8629
%.tmp8631 = load %m2503$.Type.type*, %m2503$.Type.type** %return_value_type.8623
%last_type.8632 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8631, %m2503$.Type.type** %last_type.8632
%.tmp8633 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8634 = call %m878$.Node.type*(%m878$.Node.type*) @m295$syn_function_params.m878$.Node.typep.m878$.Node.typep(%m878$.Node.type* %.tmp8633)
%params.8635 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8634, %m878$.Node.type** %params.8635
%.tmp8637 = load %m878$.Node.type*, %m878$.Node.type** %params.8635
%param_ptr.8638 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8637, %m878$.Node.type** %param_ptr.8638
br label %.for.start.8636
.for.start.8636:
%.tmp8639 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8638
%.tmp8640 = icmp ne %m878$.Node.type* %.tmp8639, null
br i1 %.tmp8640, label %.for.continue.8636, label %.for.end.8636
.for.continue.8636:
%.tmp8641 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8638
%.tmp8642 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8641, i32 0, i32 0
%.tmp8643 = load i8*, i8** %.tmp8642
%.tmp8645 = getelementptr [5 x i8], [5 x i8]*@.str8644, i32 0, i32 0
%.tmp8646 = call i32(i8*,i8*) @strcmp(i8* %.tmp8643, i8* %.tmp8645)
%.tmp8647 = icmp eq i32 %.tmp8646, 0
br i1 %.tmp8647, label %.if.true.8648, label %.if.false.8648
.if.true.8648:
%.tmp8649 = load %m2503$.Type.type*, %m2503$.Type.type** %last_type.8632
%.tmp8650 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8649, i32 0, i32 4
%.tmp8651 = load %m2503$.Type.type*, %m2503$.Type.type** %last_type.8632
%.tmp8652 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp8651)
store %m2503$.Type.type* %.tmp8652, %m2503$.Type.type** %.tmp8650
%.tmp8653 = load %m2503$.Type.type*, %m2503$.Type.type** %last_type.8632
%.tmp8654 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8653, i32 0, i32 4
%.tmp8655 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8654
%.tmp8656 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8655, i32 0, i32 4
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp8656
%.tmp8657 = load %m2503$.Type.type*, %m2503$.Type.type** %last_type.8632
%.tmp8658 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8657, i32 0, i32 4
%.tmp8659 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8658
store %m2503$.Type.type* %.tmp8659, %m2503$.Type.type** %last_type.8632
%.tmp8660 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8638
%.tmp8661 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8660, i32 0, i32 7
%.tmp8662 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8661
%.tmp8663 = icmp ne %m878$.Node.type* %.tmp8662, null
br i1 %.tmp8663, label %.if.true.8664, label %.if.false.8664
.if.true.8664:
%.tmp8665 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8638
%.tmp8666 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8665, i32 0, i32 7
%.tmp8667 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8666
store %m878$.Node.type* %.tmp8667, %m878$.Node.type** %param_ptr.8638
br label %.if.end.8664
.if.false.8664:
br label %.if.end.8664
.if.end.8664:
%.tmp8668 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8638
%.tmp8669 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8668, i32 0, i32 7
%.tmp8670 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8669
%.tmp8671 = icmp ne %m878$.Node.type* %.tmp8670, null
br i1 %.tmp8671, label %.if.true.8672, label %.if.false.8672
.if.true.8672:
%.tmp8673 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8638
%.tmp8674 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8673, i32 0, i32 7
%.tmp8675 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8674
store %m878$.Node.type* %.tmp8675, %m878$.Node.type** %param_ptr.8638
br label %.if.end.8672
.if.false.8672:
store %m878$.Node.type* null, %m878$.Node.type** %param_ptr.8638
br label %.if.end.8672
.if.end.8672:
br label %.if.end.8648
.if.false.8648:
%.tmp8676 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8677 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8638
%.tmp8678 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8677, i32 0, i32 6
%.tmp8679 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8678
%.tmp8680 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8676, %m878$.Node.type* %.tmp8679)
%param_type.8681 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8680, %m2503$.Type.type** %param_type.8681
%.tmp8682 = load %m2503$.Type.type*, %m2503$.Type.type** %last_type.8632
%.tmp8683 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8682, i32 0, i32 4
%.tmp8684 = load %m2503$.Type.type*, %m2503$.Type.type** %param_type.8681
store %m2503$.Type.type* %.tmp8684, %m2503$.Type.type** %.tmp8683
%.tmp8685 = load %m2503$.Type.type*, %m2503$.Type.type** %param_type.8681
store %m2503$.Type.type* %.tmp8685, %m2503$.Type.type** %last_type.8632
%.tmp8686 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8638
%.tmp8687 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8686, i32 0, i32 7
%.tmp8688 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8687
store %m878$.Node.type* %.tmp8688, %m878$.Node.type** %param_ptr.8638
%.tmp8689 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8638
%.tmp8690 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8689, i32 0, i32 7
%.tmp8691 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8690
%.tmp8692 = icmp ne %m878$.Node.type* %.tmp8691, null
br i1 %.tmp8692, label %.if.true.8693, label %.if.false.8693
.if.true.8693:
%.tmp8694 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8638
%.tmp8695 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8694, i32 0, i32 7
%.tmp8696 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8695
%.tmp8697 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8696, i32 0, i32 7
%.tmp8698 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8697
store %m878$.Node.type* %.tmp8698, %m878$.Node.type** %param_ptr.8638
br label %.if.end.8693
.if.false.8693:
store %m878$.Node.type* null, %m878$.Node.type** %param_ptr.8638
br label %.if.end.8693
.if.end.8693:
br label %.if.end.8648
.if.end.8648:
br label %.for.start.8636
.for.end.8636:
%.tmp8699 = load %m2503$.Type.type*, %m2503$.Type.type** %function_type.8617
ret %m2503$.Type.type* %.tmp8699
}
define %m878$.Node.type* @m295$syn_function_params.m878$.Node.typep.m878$.Node.typep(%m878$.Node.type* %.stmt.arg) {
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp8700 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8702 = getelementptr [10 x i8], [10 x i8]*@.str8701, i32 0, i32 0
%.tmp8703 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp8700, i8* %.tmp8702)
%params.8704 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8703, %m878$.Node.type** %params.8704
%.tmp8705 = load %m878$.Node.type*, %m878$.Node.type** %params.8704
%.tmp8706 = icmp eq %m878$.Node.type* %.tmp8705, null
br i1 %.tmp8706, label %.if.true.8707, label %.if.false.8707
.if.true.8707:
%.tmp8708 = bitcast ptr null to %m878$.Node.type*
ret %m878$.Node.type* %.tmp8708
br label %.if.end.8707
.if.false.8707:
br label %.if.end.8707
.if.end.8707:
%.tmp8709 = load %m878$.Node.type*, %m878$.Node.type** %params.8704
%.tmp8710 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8709, i32 0, i32 6
%.tmp8711 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8710
ret %m878$.Node.type* %.tmp8711
}
define %m2503$.Type.type* @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp8712 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8713 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8712, i32 0, i32 0
%.tmp8714 = load i8*, i8** %.tmp8713
%.tmp8716 = getelementptr [11 x i8], [11 x i8]*@.str8715, i32 0, i32 0
%.tmp8717 = call i32(i8*,i8*) @strcmp(i8* %.tmp8714, i8* %.tmp8716)
%.tmp8718 = icmp eq i32 %.tmp8717, 0
br i1 %.tmp8718, label %.if.true.8719, label %.if.false.8719
.if.true.8719:
%.tmp8720 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8721 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8722 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8721, i32 0, i32 6
%.tmp8723 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8722
%.tmp8724 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8720, %m878$.Node.type* %.tmp8723)
%t.8725 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8724, %m2503$.Type.type** %t.8725
%.tmp8726 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8727 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8726, i32 0, i32 7
%.tmp8728 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8727
%.tmp8729 = icmp ne %m878$.Node.type* %.tmp8728, null
br i1 %.tmp8729, label %.if.true.8730, label %.if.false.8730
.if.true.8730:
%.tmp8731 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8732 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8731, i32 0, i32 7
%.tmp8733 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8732
%.tmp8734 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8733, i32 0, i32 0
%.tmp8735 = load i8*, i8** %.tmp8734
%.tmp8737 = getelementptr [13 x i8], [13 x i8]*@.str8736, i32 0, i32 0
%.tmp8738 = call i32(i8*,i8*) @strcmp(i8* %.tmp8735, i8* %.tmp8737)
%.tmp8739 = icmp eq i32 %.tmp8738, 0
br i1 %.tmp8739, label %.if.true.8740, label %.if.false.8740
.if.true.8740:
%.tmp8741 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%fn_type.8742 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8741, %m2503$.Type.type** %fn_type.8742
%.tmp8743 = load %m2503$.Type.type*, %m2503$.Type.type** %fn_type.8742
%.tmp8744 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8743, i32 0, i32 0
%.tmp8746 = getelementptr [9 x i8], [9 x i8]*@.str8745, i32 0, i32 0
store i8* %.tmp8746, i8** %.tmp8744
%.tmp8747 = load %m2503$.Type.type*, %m2503$.Type.type** %fn_type.8742
%.tmp8748 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8747, i32 0, i32 3
%.tmp8749 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8725
store %m2503$.Type.type* %.tmp8749, %m2503$.Type.type** %.tmp8748
%.tmp8750 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8751 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8750, i32 0, i32 7
%.tmp8752 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8751
%.tmp8753 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8752, i32 0, i32 6
%.tmp8754 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8753
%.tmp8755 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8754, i32 0, i32 7
%.tmp8756 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8755
%fst_operator.8757 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8756, %m878$.Node.type** %fst_operator.8757
%.tmp8758 = load %m878$.Node.type*, %m878$.Node.type** %fst_operator.8757
%.tmp8759 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8758, i32 0, i32 0
%.tmp8760 = load i8*, i8** %.tmp8759
%.tmp8762 = getelementptr [15 x i8], [15 x i8]*@.str8761, i32 0, i32 0
%.tmp8763 = call i32(i8*,i8*) @strcmp(i8* %.tmp8760, i8* %.tmp8762)
%.tmp8764 = icmp eq i32 %.tmp8763, 0
br i1 %.tmp8764, label %.if.true.8765, label %.if.false.8765
.if.true.8765:
%.tmp8766 = load %m2503$.Type.type*, %m2503$.Type.type** %fn_type.8742
%.tmp8767 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8766, i32 0, i32 3
%.tmp8768 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8767
%last_fn_value.8769 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8768, %m2503$.Type.type** %last_fn_value.8769
%.tmp8771 = load %m878$.Node.type*, %m878$.Node.type** %fst_operator.8757
%.tmp8772 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8771, i32 0, i32 6
%.tmp8773 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8772
%t.8774 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8773, %m878$.Node.type** %t.8774
br label %.for.start.8770
.for.start.8770:
%.tmp8775 = load %m878$.Node.type*, %m878$.Node.type** %t.8774
%.tmp8776 = icmp ne %m878$.Node.type* %.tmp8775, null
br i1 %.tmp8776, label %.for.continue.8770, label %.for.end.8770
.for.continue.8770:
%.tmp8777 = load %m2503$.Type.type*, %m2503$.Type.type** %last_fn_value.8769
%.tmp8778 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8777, i32 0, i32 4
%.tmp8779 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8780 = load %m878$.Node.type*, %m878$.Node.type** %t.8774
%.tmp8781 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8780, i32 0, i32 6
%.tmp8782 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8781
%.tmp8783 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8779, %m878$.Node.type* %.tmp8782)
store %m2503$.Type.type* %.tmp8783, %m2503$.Type.type** %.tmp8778
%.tmp8784 = load %m2503$.Type.type*, %m2503$.Type.type** %last_fn_value.8769
%.tmp8785 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8784, i32 0, i32 4
%.tmp8786 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8785
store %m2503$.Type.type* %.tmp8786, %m2503$.Type.type** %last_fn_value.8769
%.tmp8787 = load %m878$.Node.type*, %m878$.Node.type** %t.8774
%.tmp8788 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8787, i32 0, i32 7
%.tmp8789 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8788
%.tmp8790 = icmp ne %m878$.Node.type* %.tmp8789, null
br i1 %.tmp8790, label %.if.true.8791, label %.if.false.8791
.if.true.8791:
%.tmp8792 = load %m878$.Node.type*, %m878$.Node.type** %t.8774
%.tmp8793 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8792, i32 0, i32 7
%.tmp8794 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8793
store %m878$.Node.type* %.tmp8794, %m878$.Node.type** %t.8774
br label %.if.end.8791
.if.false.8791:
br label %.if.end.8791
.if.end.8791:
%.tmp8795 = load %m878$.Node.type*, %m878$.Node.type** %t.8774
%.tmp8796 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8795, i32 0, i32 7
%.tmp8797 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8796
store %m878$.Node.type* %.tmp8797, %m878$.Node.type** %t.8774
br label %.for.start.8770
.for.end.8770:
br label %.if.end.8765
.if.false.8765:
br label %.if.end.8765
.if.end.8765:
%.tmp8798 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%t_ptr.8799 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8798, %m2503$.Type.type** %t_ptr.8799
%.tmp8800 = load %m2503$.Type.type*, %m2503$.Type.type** %t_ptr.8799
%.tmp8801 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8800, i32 0, i32 0
%.tmp8803 = getelementptr [4 x i8], [4 x i8]*@.str8802, i32 0, i32 0
store i8* %.tmp8803, i8** %.tmp8801
%.tmp8804 = load %m2503$.Type.type*, %m2503$.Type.type** %t_ptr.8799
%.tmp8805 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8804, i32 0, i32 3
%.tmp8806 = load %m2503$.Type.type*, %m2503$.Type.type** %fn_type.8742
store %m2503$.Type.type* %.tmp8806, %m2503$.Type.type** %.tmp8805
%.tmp8807 = load %m2503$.Type.type*, %m2503$.Type.type** %t_ptr.8799
store %m2503$.Type.type* %.tmp8807, %m2503$.Type.type** %t.8725
br label %.if.end.8740
.if.false.8740:
br label %.if.end.8740
.if.end.8740:
br label %.if.end.8730
.if.false.8730:
br label %.if.end.8730
.if.end.8730:
%.tmp8808 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8725
ret %m2503$.Type.type* %.tmp8808
br label %.if.end.8719
.if.false.8719:
br label %.if.end.8719
.if.end.8719:
%.tmp8809 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%t.8810 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8809, %m2503$.Type.type** %t.8810
%.tmp8811 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8812 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8811, i32 0, i32 0
%.tmp8813 = load i8*, i8** %.tmp8812
%.tmp8815 = getelementptr [10 x i8], [10 x i8]*@.str8814, i32 0, i32 0
%.tmp8816 = call i32(i8*,i8*) @strcmp(i8* %.tmp8813, i8* %.tmp8815)
%.tmp8817 = icmp eq i32 %.tmp8816, 0
br i1 %.tmp8817, label %.if.true.8818, label %.if.false.8818
.if.true.8818:
%.tmp8819 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8820 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8819, i32 0, i32 0
%.tmp8822 = getelementptr [7 x i8], [7 x i8]*@.str8821, i32 0, i32 0
store i8* %.tmp8822, i8** %.tmp8820
%.tmp8823 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8824 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8823, i32 0, i32 1
store i8* null, i8** %.tmp8824
%.tmp8825 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8826 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8825, i32 0, i32 6
%.tmp8827 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8826
%.tmp8829 = getelementptr [5 x i8], [5 x i8]*@.str8828, i32 0, i32 0
%.tmp8830 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp8827, i8* %.tmp8829)
%curr_type.8831 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8830, %m878$.Node.type** %curr_type.8831
%.tmp8832 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8831
%.tmp8833 = icmp ne %m878$.Node.type* %.tmp8832, null
br i1 %.tmp8833, label %.if.true.8834, label %.if.false.8834
.if.true.8834:
%.tmp8835 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8836 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8835, i32 0, i32 3
%.tmp8837 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8838 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8831
%.tmp8839 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8838, i32 0, i32 6
%.tmp8840 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8839
%.tmp8841 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8837, %m878$.Node.type* %.tmp8840)
store %m2503$.Type.type* %.tmp8841, %m2503$.Type.type** %.tmp8836
%.tmp8842 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8843 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8842, i32 0, i32 3
%.tmp8844 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8843
%.tmp8845 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8844, i32 0, i32 1
%.tmp8846 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8831
%.tmp8847 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8846, i32 0, i32 7
%.tmp8848 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8847
%.tmp8849 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8848, i32 0, i32 1
%.tmp8850 = load i8*, i8** %.tmp8849
store i8* %.tmp8850, i8** %.tmp8845
%.tmp8851 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8852 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8851, i32 0, i32 3
%.tmp8853 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8852
%curr_t.8854 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8853, %m2503$.Type.type** %curr_t.8854
%.tmp8856 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8831
%.tmp8857 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8856, i32 0, i32 7
%.tmp8858 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8857
%.tmp8860 = getelementptr [5 x i8], [5 x i8]*@.str8859, i32 0, i32 0
%.tmp8861 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp8858, i8* %.tmp8860)
store %m878$.Node.type* %.tmp8861, %m878$.Node.type** %curr_type.8831
br label %.for.start.8855
.for.start.8855:
%.tmp8862 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8831
%.tmp8863 = icmp ne %m878$.Node.type* %.tmp8862, null
br i1 %.tmp8863, label %.for.continue.8855, label %.for.end.8855
.for.continue.8855:
%.tmp8864 = load %m2503$.Type.type*, %m2503$.Type.type** %curr_t.8854
%.tmp8865 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8864, i32 0, i32 4
%.tmp8866 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8867 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8831
%.tmp8868 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8867, i32 0, i32 6
%.tmp8869 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8868
%.tmp8870 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8866, %m878$.Node.type* %.tmp8869)
store %m2503$.Type.type* %.tmp8870, %m2503$.Type.type** %.tmp8865
%.tmp8871 = load %m2503$.Type.type*, %m2503$.Type.type** %curr_t.8854
%.tmp8872 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8871, i32 0, i32 4
%.tmp8873 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8872
%.tmp8874 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8873, i32 0, i32 1
%.tmp8875 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8831
%.tmp8876 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8875, i32 0, i32 7
%.tmp8877 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8876
%.tmp8878 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8877, i32 0, i32 1
%.tmp8879 = load i8*, i8** %.tmp8878
store i8* %.tmp8879, i8** %.tmp8874
%.tmp8880 = load %m2503$.Type.type*, %m2503$.Type.type** %curr_t.8854
%.tmp8881 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8880, i32 0, i32 4
%.tmp8882 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8881
store %m2503$.Type.type* %.tmp8882, %m2503$.Type.type** %curr_t.8854
%.tmp8883 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8831
%.tmp8884 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8883, i32 0, i32 7
%.tmp8885 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8884
%.tmp8887 = getelementptr [5 x i8], [5 x i8]*@.str8886, i32 0, i32 0
%.tmp8888 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp8885, i8* %.tmp8887)
store %m878$.Node.type* %.tmp8888, %m878$.Node.type** %curr_type.8831
br label %.for.start.8855
.for.end.8855:
br label %.if.end.8834
.if.false.8834:
br label %.if.end.8834
.if.end.8834:
br label %.if.end.8818
.if.false.8818:
%.tmp8889 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8890 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8889, i32 0, i32 0
%.tmp8891 = load i8*, i8** %.tmp8890
%.tmp8893 = getelementptr [12 x i8], [12 x i8]*@.str8892, i32 0, i32 0
%.tmp8894 = call i32(i8*,i8*) @strcmp(i8* %.tmp8891, i8* %.tmp8893)
%.tmp8895 = icmp eq i32 %.tmp8894, 0
br i1 %.tmp8895, label %.if.true.8896, label %.if.false.8896
.if.true.8896:
%err_msg.8897 = alloca i8*
store i8* null, i8** %err_msg.8897
%.tmp8898 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8899 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8900 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$find_defined.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8898, %m878$.Node.type* %.tmp8899)
%base.8901 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp8900, %m2503$.ScopeItem.type** %base.8901
%.tmp8902 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %base.8901
%.tmp8903 = icmp eq %m2503$.ScopeItem.type* %.tmp8902, null
br i1 %.tmp8903, label %.if.true.8904, label %.if.false.8904
.if.true.8904:
%.tmp8905 = getelementptr i8*, i8** %err_msg.8897, i32 0
%.tmp8907 = getelementptr [37 x i8], [37 x i8]*@.str8906, i32 0, i32 0
%.tmp8908 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8909 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8908, i32 0, i32 6
%.tmp8910 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8909
%.tmp8911 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8910, i32 0, i32 1
%.tmp8912 = load i8*, i8** %.tmp8911
%.tmp8913 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8905, i8* %.tmp8907, i8* %.tmp8912)
%.tmp8914 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8915 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8916 = load i8*, i8** %err_msg.8897
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp8914, %m878$.Node.type* %.tmp8915, i8* %.tmp8916)
%.tmp8917 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8918 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8917, i32 0, i32 0
%.tmp8920 = getelementptr [6 x i8], [6 x i8]*@.str8919, i32 0, i32 0
store i8* %.tmp8920, i8** %.tmp8918
%.tmp8921 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
ret %m2503$.Type.type* %.tmp8921
br label %.if.end.8904
.if.false.8904:
br label %.if.end.8904
.if.end.8904:
%.tmp8922 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8923 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8922, i32 0, i32 0
%.tmp8925 = getelementptr [10 x i8], [10 x i8]*@.str8924, i32 0, i32 0
store i8* %.tmp8925, i8** %.tmp8923
%.tmp8926 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8927 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8926, i32 0, i32 1
%.tmp8928 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %base.8901
%.tmp8929 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp8928, i32 0, i32 0
%.tmp8930 = load i8*, i8** %.tmp8929
store i8* %.tmp8930, i8** %.tmp8927
%.tmp8931 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8932 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8931, i32 0, i32 2
%.tmp8933 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %base.8901
%.tmp8934 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp8933, i32 0, i32 1
%.tmp8935 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp8934
%.tmp8936 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8935, i32 0, i32 0
%.tmp8937 = load i8*, i8** %.tmp8936
store i8* %.tmp8937, i8** %.tmp8932
%.tmp8938 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8939 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8938, i32 0, i32 3
%.tmp8940 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %base.8901
%.tmp8941 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp8940, i32 0, i32 1
%.tmp8942 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp8941
%.tmp8943 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8942, i32 0, i32 4
%.tmp8944 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8943
store %m2503$.Type.type* %.tmp8944, %m2503$.Type.type** %.tmp8939
br label %.if.end.8896
.if.false.8896:
%.tmp8945 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8946 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8945, i32 0, i32 1
%.tmp8947 = load i8*, i8** %.tmp8946
%.tmp8949 = getelementptr [4 x i8], [4 x i8]*@.str8948, i32 0, i32 0
%.tmp8950 = call i32(i8*,i8*) @strcmp(i8* %.tmp8947, i8* %.tmp8949)
%.tmp8951 = icmp eq i32 %.tmp8950, 0
br i1 %.tmp8951, label %.if.true.8952, label %.if.false.8952
.if.true.8952:
%.tmp8953 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8954 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8953, i32 0, i32 0
%.tmp8956 = getelementptr [4 x i8], [4 x i8]*@.str8955, i32 0, i32 0
store i8* %.tmp8956, i8** %.tmp8954
%.tmp8957 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8958 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8957, i32 0, i32 3
%.tmp8959 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp8959, %m2503$.Type.type** %.tmp8958
%.tmp8960 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8961 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8960, i32 0, i32 3
%.tmp8962 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8961
%.tmp8963 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8962, i32 0, i32 0
%.tmp8965 = getelementptr [4 x i8], [4 x i8]*@.str8964, i32 0, i32 0
store i8* %.tmp8965, i8** %.tmp8963
br label %.if.end.8952
.if.false.8952:
%.tmp8966 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8967 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8966, i32 0, i32 0
%.tmp8968 = load i8*, i8** %.tmp8967
%.tmp8970 = getelementptr [5 x i8], [5 x i8]*@.str8969, i32 0, i32 0
%.tmp8971 = call i32(i8*,i8*) @strcmp(i8* %.tmp8968, i8* %.tmp8970)
%.tmp8972 = icmp eq i32 %.tmp8971, 0
br i1 %.tmp8972, label %.if.true.8973, label %.if.false.8973
.if.true.8973:
%.tmp8974 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8975 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8974, i32 0, i32 0
%.tmp8976 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8977 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8976, i32 0, i32 1
%.tmp8978 = load i8*, i8** %.tmp8977
store i8* %.tmp8978, i8** %.tmp8975
br label %.if.end.8973
.if.false.8973:
%.tmp8979 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8980 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8979, i32 0, i32 1
%.tmp8981 = load i8*, i8** %.tmp8980
%.tmp8983 = getelementptr [4 x i8], [4 x i8]*@.str8982, i32 0, i32 0
%.tmp8984 = call i32(i8*,i8*) @strcmp(i8* %.tmp8981, i8* %.tmp8983)
%.tmp8985 = icmp eq i32 %.tmp8984, 0
br i1 %.tmp8985, label %.if.true.8986, label %.if.false.8986
.if.true.8986:
%.tmp8987 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
%.tmp8988 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8987, i32 0, i32 0
%.tmp8990 = getelementptr [7 x i8], [7 x i8]*@.str8989, i32 0, i32 0
store i8* %.tmp8990, i8** %.tmp8988
br label %.if.end.8986
.if.false.8986:
%.tmp8991 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8992 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8994 = getelementptr [54 x i8], [54 x i8]*@.str8993, i32 0, i32 0
%.tmp8995 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp8991, %m878$.Node.type* %.tmp8992, i8* %.tmp8994)
%.tmp8996 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8997 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8996, i32 0, i32 0
%.tmp8998 = load i8*, i8** %.tmp8997
%.tmp8999 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp9000 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8999, i32 0, i32 1
%.tmp9001 = load i8*, i8** %.tmp9000
%.tmp9002 = call i32(i8*,...) @printf(i8* %.tmp8995, i8* %.tmp8998, i8* %.tmp9001)
%.tmp9003 = bitcast ptr null to %m2503$.Type.type*
ret %m2503$.Type.type* %.tmp9003
br label %.if.end.8986
.if.end.8986:
br label %.if.end.8973
.if.end.8973:
br label %.if.end.8952
.if.end.8952:
br label %.if.end.8896
.if.end.8896:
br label %.if.end.8818
.if.end.8818:
%.tmp9005 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp9006 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp9005, i32 0, i32 7
%.tmp9007 = load %m878$.Node.type*, %m878$.Node.type** %.tmp9006
%ptr.9008 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp9007, %m878$.Node.type** %ptr.9008
br label %.for.start.9004
.for.start.9004:
%.tmp9009 = load %m878$.Node.type*, %m878$.Node.type** %ptr.9008
%.tmp9010 = icmp ne %m878$.Node.type* %.tmp9009, null
br i1 %.tmp9010, label %.for.continue.9004, label %.for.end.9004
.for.continue.9004:
%.tmp9011 = load %m878$.Node.type*, %m878$.Node.type** %ptr.9008
%.tmp9012 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp9011, i32 0, i32 1
%.tmp9013 = load i8*, i8** %.tmp9012
%.tmp9015 = getelementptr [2 x i8], [2 x i8]*@.str9014, i32 0, i32 0
%.tmp9016 = call i32(i8*,i8*) @strcmp(i8* %.tmp9013, i8* %.tmp9015)
%.tmp9017 = icmp eq i32 %.tmp9016, 0
br i1 %.tmp9017, label %.if.true.9018, label %.if.false.9018
.if.true.9018:
%.tmp9019 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%pt.9020 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp9019, %m2503$.Type.type** %pt.9020
%.tmp9021 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.9020
%.tmp9022 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9021, i32 0, i32 0
%.tmp9024 = getelementptr [4 x i8], [4 x i8]*@.str9023, i32 0, i32 0
store i8* %.tmp9024, i8** %.tmp9022
%.tmp9025 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.9020
%.tmp9026 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9025, i32 0, i32 3
%.tmp9027 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
store %m2503$.Type.type* %.tmp9027, %m2503$.Type.type** %.tmp9026
%.tmp9028 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.9020
store %m2503$.Type.type* %.tmp9028, %m2503$.Type.type** %t.8810
br label %.if.end.9018
.if.false.9018:
%.tmp9029 = load %m878$.Node.type*, %m878$.Node.type** %ptr.9008
%.tmp9030 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp9029, i32 0, i32 1
%.tmp9031 = load i8*, i8** %.tmp9030
%.tmp9033 = getelementptr [2 x i8], [2 x i8]*@.str9032, i32 0, i32 0
%.tmp9034 = call i32(i8*,i8*) @strcmp(i8* %.tmp9031, i8* %.tmp9033)
%.tmp9035 = icmp eq i32 %.tmp9034, 0
br i1 %.tmp9035, label %.if.true.9036, label %.if.false.9036
.if.true.9036:
%.tmp9037 = load %m878$.Node.type*, %m878$.Node.type** %ptr.9008
%.tmp9038 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp9037, i32 0, i32 7
%.tmp9039 = load %m878$.Node.type*, %m878$.Node.type** %.tmp9038
%.tmp9040 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp9039, i32 0, i32 1
%.tmp9041 = load i8*, i8** %.tmp9040
%.tmp9043 = getelementptr [2 x i8], [2 x i8]*@.str9042, i32 0, i32 0
%.tmp9044 = call i32(i8*,i8*) @strcmp(i8* %.tmp9041, i8* %.tmp9043)
%.tmp9045 = icmp eq i32 %.tmp9044, 0
br i1 %.tmp9045, label %.if.true.9046, label %.if.false.9046
.if.true.9046:
%.tmp9047 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%slice_type.9048 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp9047, %m2503$.Type.type** %slice_type.9048
%.tmp9049 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_type.9048
%.tmp9050 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9049, i32 0, i32 0
%.tmp9052 = getelementptr [7 x i8], [7 x i8]*@.str9051, i32 0, i32 0
store i8* %.tmp9052, i8** %.tmp9050
%.tmp9053 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_type.9048
%.tmp9054 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9053, i32 0, i32 1
%.tmp9056 = getelementptr [6 x i8], [6 x i8]*@.str9055, i32 0, i32 0
store i8* %.tmp9056, i8** %.tmp9054
%.tmp9057 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%slice_c_array.9058 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp9057, %m2503$.Type.type** %slice_c_array.9058
%.tmp9059 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_c_array.9058
%.tmp9060 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9059, i32 0, i32 0
%.tmp9062 = getelementptr [4 x i8], [4 x i8]*@.str9061, i32 0, i32 0
store i8* %.tmp9062, i8** %.tmp9060
%.tmp9063 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_c_array.9058
%.tmp9064 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9063, i32 0, i32 1
%.tmp9066 = getelementptr [6 x i8], [6 x i8]*@.str9065, i32 0, i32 0
store i8* %.tmp9066, i8** %.tmp9064
%.tmp9067 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_c_array.9058
%.tmp9068 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9067, i32 0, i32 3
%.tmp9069 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
store %m2503$.Type.type* %.tmp9069, %m2503$.Type.type** %.tmp9068
%.tmp9070 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_type.9048
%.tmp9071 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9070, i32 0, i32 3
%.tmp9072 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_c_array.9058
store %m2503$.Type.type* %.tmp9072, %m2503$.Type.type** %.tmp9071
%.tmp9073 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%slice_len.9074 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp9073, %m2503$.Type.type** %slice_len.9074
%.tmp9075 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_len.9074
%.tmp9076 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9075, i32 0, i32 0
%.tmp9078 = getelementptr [4 x i8], [4 x i8]*@.str9077, i32 0, i32 0
store i8* %.tmp9078, i8** %.tmp9076
%.tmp9079 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_len.9074
%.tmp9080 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9079, i32 0, i32 1
%.tmp9082 = getelementptr [4 x i8], [4 x i8]*@.str9081, i32 0, i32 0
store i8* %.tmp9082, i8** %.tmp9080
%.tmp9083 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_c_array.9058
%.tmp9084 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9083, i32 0, i32 4
%.tmp9085 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_len.9074
store %m2503$.Type.type* %.tmp9085, %m2503$.Type.type** %.tmp9084
%.tmp9086 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%slice_cap.9087 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp9086, %m2503$.Type.type** %slice_cap.9087
%.tmp9088 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_cap.9087
%.tmp9089 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9088, i32 0, i32 0
%.tmp9091 = getelementptr [4 x i8], [4 x i8]*@.str9090, i32 0, i32 0
store i8* %.tmp9091, i8** %.tmp9089
%.tmp9092 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_cap.9087
%.tmp9093 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9092, i32 0, i32 1
%.tmp9095 = getelementptr [4 x i8], [4 x i8]*@.str9094, i32 0, i32 0
store i8* %.tmp9095, i8** %.tmp9093
%.tmp9096 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_len.9074
%.tmp9097 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9096, i32 0, i32 4
%.tmp9098 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_cap.9087
store %m2503$.Type.type* %.tmp9098, %m2503$.Type.type** %.tmp9097
%.tmp9099 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_type.9048
store %m2503$.Type.type* %.tmp9099, %m2503$.Type.type** %t.8810
%.tmp9100 = load %m878$.Node.type*, %m878$.Node.type** %ptr.9008
%.tmp9101 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp9100, i32 0, i32 7
%.tmp9102 = load %m878$.Node.type*, %m878$.Node.type** %.tmp9101
store %m878$.Node.type* %.tmp9102, %m878$.Node.type** %ptr.9008
br label %.if.end.9046
.if.false.9046:
br label %.if.end.9046
.if.end.9046:
br label %.if.end.9036
.if.false.9036:
%.tmp9103 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp9104 = load %m878$.Node.type*, %m878$.Node.type** %ptr.9008
%.tmp9106 = getelementptr [49 x i8], [49 x i8]*@.str9105, i32 0, i32 0
%.tmp9107 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp9103, %m878$.Node.type* %.tmp9104, i8* %.tmp9106)
%.tmp9108 = load %m878$.Node.type*, %m878$.Node.type** %ptr.9008
%.tmp9109 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp9108, i32 0, i32 1
%.tmp9110 = load i8*, i8** %.tmp9109
%.tmp9111 = call i32(i8*,...) @printf(i8* %.tmp9107, i8* %.tmp9110)
%.tmp9112 = bitcast ptr null to %m2503$.Type.type*
ret %m2503$.Type.type* %.tmp9112
br label %.if.end.9036
.if.end.9036:
br label %.if.end.9018
.if.end.9018:
%.tmp9113 = load %m878$.Node.type*, %m878$.Node.type** %ptr.9008
%.tmp9114 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp9113, i32 0, i32 7
%.tmp9115 = load %m878$.Node.type*, %m878$.Node.type** %.tmp9114
store %m878$.Node.type* %.tmp9115, %m878$.Node.type** %ptr.9008
br label %.for.start.9004
.for.end.9004:
%.tmp9116 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8810
ret %m2503$.Type.type* %.tmp9116
}
define i1 @compile_file.b.cp.cp(i8* %.filename.arg, i8* %.outname.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%outname = alloca i8*
store i8* %.outname.arg, i8** %outname
%.tmp9117 = load i32, i32* @STDERR
%.tmp9119 = getelementptr [2 x i8], [2 x i8]*@.str9118, i32 0, i32 0
%.tmp9120 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp9117, i8* %.tmp9119)
%stderr.9121 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9120, %m0$.File.type** %stderr.9121
%.tmp9122 = call %m0$.File.type*() @tmpfile()
%llvm_code.9123 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9122, %m0$.File.type** %llvm_code.9123
%.tmp9124 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9123
%.tmp9125 = load i8*, i8** %filename
%.tmp9126 = call %m2503$.CompilerCtx.type*(%m0$.File.type*,i8*) @m295$new_context.m2503$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp9124, i8* %.tmp9125)
%compiler_ctx.9127 = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.tmp9126, %m2503$.CompilerCtx.type** %compiler_ctx.9127
%.tmp9128 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %compiler_ctx.9127
%.tmp9129 = bitcast ptr null to %m878$.Node.type*
%.tmp9130 = load i8*, i8** %filename
%.tmp9131 = call i1(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$compile_file.b.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp9128, %m878$.Node.type* %.tmp9129, i8* %.tmp9130)
br i1 %.tmp9131, label %.if.true.9132, label %.if.false.9132
.if.true.9132:
%.tmp9133 = load %m0$.File.type*, %m0$.File.type** %stderr.9121
%.tmp9135 = getelementptr [34 x i8], [34 x i8]*@.str9134, i32 0, i32 0
%.tmp9136 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9133, i8* %.tmp9135)
ret i1 0
br label %.if.end.9132
.if.false.9132:
br label %.if.end.9132
.if.end.9132:
%.tmp9137 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9123
%.tmp9138 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp9137)
%.tmp9139 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9123
%.tmp9140 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp9139)
%llvm_code_size.9141 = alloca i32
store i32 %.tmp9140, i32* %llvm_code_size.9141
%.tmp9142 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9123
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp9142)
%.tmp9144 = getelementptr [1 x i8], [1 x i8]*@.str9143, i32 0, i32 0
%cmd.9145 = alloca i8*
store i8* %.tmp9144, i8** %cmd.9145
%.tmp9146 = getelementptr i8*, i8** %cmd.9145, i32 0
%.tmp9148 = getelementptr [32 x i8], [32 x i8]*@.str9147, i32 0, i32 0
%.tmp9149 = load i8*, i8** %outname
%.tmp9150 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9146, i8* %.tmp9148, i8* %.tmp9149)
%.tmp9151 = load i8*, i8** %cmd.9145
%.tmp9153 = getelementptr [2 x i8], [2 x i8]*@.str9152, i32 0, i32 0
%.tmp9154 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9151, i8* %.tmp9153)
%proc.9155 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9154, %m0$.File.type** %proc.9155
%.tmp9156 = load %m0$.File.type*, %m0$.File.type** %proc.9155
%.tmp9157 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9156)
%.tmp9158 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9123
%.tmp9159 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9158)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp9157, i32 %.tmp9159)
%.tmp9160 = load %m0$.File.type*, %m0$.File.type** %proc.9155
%.tmp9161 = icmp eq %m0$.File.type* %.tmp9160, null
br i1 %.tmp9161, label %.if.true.9162, label %.if.false.9162
.if.true.9162:
%.tmp9163 = load %m0$.File.type*, %m0$.File.type** %stderr.9121
%.tmp9165 = getelementptr [28 x i8], [28 x i8]*@.str9164, i32 0, i32 0
%.tmp9166 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9163, i8* %.tmp9165)
ret i1 0
br label %.if.end.9162
.if.false.9162:
br label %.if.end.9162
.if.end.9162:
%.tmp9167 = load %m0$.File.type*, %m0$.File.type** %proc.9155
%.tmp9168 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9167)
%.tmp9169 = icmp ne i32 %.tmp9168, 0
br i1 %.tmp9169, label %.if.true.9170, label %.if.false.9170
.if.true.9170:
%.tmp9171 = load %m0$.File.type*, %m0$.File.type** %stderr.9121
%.tmp9173 = getelementptr [24 x i8], [24 x i8]*@.str9172, i32 0, i32 0
%.tmp9174 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9171, i8* %.tmp9173)
ret i1 0
br label %.if.end.9170
.if.false.9170:
br label %.if.end.9170
.if.end.9170:
%.tmp9175 = getelementptr i8*, i8** %cmd.9145, i32 0
%.tmp9177 = getelementptr [17 x i8], [17 x i8]*@.str9176, i32 0, i32 0
%.tmp9178 = load i8*, i8** %outname
%.tmp9179 = load i8*, i8** %outname
%.tmp9180 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9175, i8* %.tmp9177, i8* %.tmp9178, i8* %.tmp9179)
%.tmp9181 = load i8*, i8** %cmd.9145
%.tmp9183 = getelementptr [2 x i8], [2 x i8]*@.str9182, i32 0, i32 0
%.tmp9184 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9181, i8* %.tmp9183)
%cc_proc.9185 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9184, %m0$.File.type** %cc_proc.9185
%.tmp9186 = load %m0$.File.type*, %m0$.File.type** %cc_proc.9185
%.tmp9187 = icmp eq %m0$.File.type* %.tmp9186, null
br i1 %.tmp9187, label %.if.true.9188, label %.if.false.9188
.if.true.9188:
%.tmp9189 = load %m0$.File.type*, %m0$.File.type** %stderr.9121
%.tmp9191 = getelementptr [28 x i8], [28 x i8]*@.str9190, i32 0, i32 0
%.tmp9192 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9189, i8* %.tmp9191)
ret i1 0
br label %.if.end.9188
.if.false.9188:
br label %.if.end.9188
.if.end.9188:
%.tmp9193 = load %m0$.File.type*, %m0$.File.type** %proc.9155
%.tmp9194 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9193)
%.tmp9195 = icmp ne i32 %.tmp9194, 0
br i1 %.tmp9195, label %.if.true.9196, label %.if.false.9196
.if.true.9196:
%.tmp9197 = load %m0$.File.type*, %m0$.File.type** %stderr.9121
%.tmp9199 = getelementptr [22 x i8], [22 x i8]*@.str9198, i32 0, i32 0
%.tmp9200 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9197, i8* %.tmp9199)
br label %.if.end.9196
.if.false.9196:
%.tmp9202 = getelementptr [32 x i8], [32 x i8]*@.str9201, i32 0, i32 0
%.tmp9203 = load i8*, i8** %outname
%.tmp9204 = call i32(i8*,...) @printf(i8* %.tmp9202, i8* %.tmp9203)
br label %.if.end.9196
.if.end.9196:
ret i1 1
}
%.Args.type = type {i8*,i8*,i8*,i8**}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9205 = load i32, i32* %argc
%.tmp9206 = load i8**, i8*** %argv
%.tmp9207 = call %.Args.type(i32,i8**) @check_args..Args.type.i.cpp(i32 %.tmp9205, i8** %.tmp9206)
%args.9208 = alloca %.Args.type
store %.Args.type %.tmp9207, %.Args.type* %args.9208
%.tmp9209 = getelementptr %.Args.type, %.Args.type* %args.9208, i32 0, i32 1
%.tmp9210 = load i8*, i8** %.tmp9209
%.tmp9211 = getelementptr %.Args.type, %.Args.type* %args.9208, i32 0, i32 2
%.tmp9212 = load i8*, i8** %.tmp9211
%.tmp9213 = call i1(i8*,i8*) @compile_file.b.cp.cp(i8* %.tmp9210, i8* %.tmp9212)
%.tmp9214 = icmp eq i1 %.tmp9213, 0
br i1 %.tmp9214, label %.if.true.9215, label %.if.false.9215
.if.true.9215:
ret i32 0
br label %.if.end.9215
.if.false.9215:
br label %.if.end.9215
.if.end.9215:
%.tmp9216 = getelementptr %.Args.type, %.Args.type* %args.9208, i32 0, i32 0
%.tmp9217 = load i8*, i8** %.tmp9216
%.tmp9219 = getelementptr [4 x i8], [4 x i8]*@.str9218, i32 0, i32 0
%.tmp9220 = call i32(i8*,i8*) @strcmp(i8* %.tmp9217, i8* %.tmp9219)
%.tmp9221 = icmp eq i32 %.tmp9220, 0
br i1 %.tmp9221, label %.if.true.9222, label %.if.false.9222
.if.true.9222:
%.tmp9224 = getelementptr [1 x i8], [1 x i8]*@.str9223, i32 0, i32 0
%cmd.9225 = alloca i8*
store i8* %.tmp9224, i8** %cmd.9225
%.tmp9226 = getelementptr i8*, i8** %cmd.9225, i32 0
%.tmp9228 = getelementptr [5 x i8], [5 x i8]*@.str9227, i32 0, i32 0
%.tmp9229 = getelementptr %.Args.type, %.Args.type* %args.9208, i32 0, i32 2
%.tmp9230 = load i8*, i8** %.tmp9229
%.tmp9231 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9226, i8* %.tmp9228, i8* %.tmp9230)
%.tmp9232 = load i8*, i8** %cmd.9225
%.tmp9233 = getelementptr %.Args.type, %.Args.type* %args.9208, i32 0, i32 3
%.tmp9234 = load i8**, i8*** %.tmp9233
%.tmp9235 = call i32(i8*,i8**) @execvp(i8* %.tmp9232, i8** %.tmp9234)
ret i32 %.tmp9235
br label %.if.end.9222
.if.false.9222:
br label %.if.end.9222
.if.end.9222:
ret i32 0
}
define %.Args.type @check_args..Args.type.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9237 = getelementptr [22 x i8], [22 x i8]*@.str9236, i32 0, i32 0
%tmpl.9238 = alloca i8*
store i8* %.tmp9237, i8** %tmpl.9238
%args.9239 = alloca %.Args.type
%.tmp9240 = getelementptr %.Args.type, %.Args.type* %args.9239, i32 0, i32 0
store i8* null, i8** %.tmp9240
%.tmp9241 = getelementptr %.Args.type, %.Args.type* %args.9239, i32 0, i32 1
store i8* null, i8** %.tmp9241
%.tmp9242 = getelementptr %.Args.type, %.Args.type* %args.9239, i32 0, i32 2
store i8* null, i8** %.tmp9242
%.tmp9243 = getelementptr %.Args.type, %.Args.type* %args.9239, i32 0, i32 3
store i8** null, i8*** %.tmp9243
%.tmp9244 = load i32, i32* %argc
%.tmp9245 = icmp slt i32 %.tmp9244, 2
br i1 %.tmp9245, label %.if.true.9246, label %.if.false.9246
.if.true.9246:
%.tmp9247 = load i8*, i8** %tmpl.9238
%.tmp9248 = load i8**, i8*** %argv
%.tmp9249 = getelementptr i8*, i8** %.tmp9248, i32 0
%.tmp9250 = load i8*, i8** %.tmp9249
%.tmp9251 = call i32(i8*,...) @printf(i8* %.tmp9247, i8* %.tmp9250)
call void(i32) @exit(i32 1)
br label %.if.end.9246
.if.false.9246:
br label %.if.end.9246
.if.end.9246:
%fp.9252 = alloca i32
store i32 1, i32* %fp.9252
%.tmp9253 = getelementptr %.Args.type, %.Args.type* %args.9239, i32 0, i32 0
%.tmp9255 = getelementptr [8 x i8], [8 x i8]*@.str9254, i32 0, i32 0
store i8* %.tmp9255, i8** %.tmp9253
%.tmp9256 = load i8**, i8*** %argv
%.tmp9257 = getelementptr i8*, i8** %.tmp9256, i32 1
%.tmp9258 = load i8*, i8** %.tmp9257
%.tmp9260 = getelementptr [4 x i8], [4 x i8]*@.str9259, i32 0, i32 0
%.tmp9261 = call i32(i8*,i8*) @strcmp(i8* %.tmp9258, i8* %.tmp9260)
%.tmp9262 = icmp eq i32 %.tmp9261, 0
br i1 %.tmp9262, label %.if.true.9263, label %.if.false.9263
.if.true.9263:
%.tmp9264 = getelementptr %.Args.type, %.Args.type* %args.9239, i32 0, i32 0
%.tmp9266 = getelementptr [4 x i8], [4 x i8]*@.str9265, i32 0, i32 0
store i8* %.tmp9266, i8** %.tmp9264
store i32 2, i32* %fp.9252
br label %.if.end.9263
.if.false.9263:
br label %.if.end.9263
.if.end.9263:
%.tmp9267 = load i32, i32* %argc
%.tmp9268 = load i32, i32* %fp.9252
%.tmp9269 = add i32 %.tmp9268, 1
%.tmp9270 = icmp slt i32 %.tmp9267, %.tmp9269
br i1 %.tmp9270, label %.if.true.9271, label %.if.false.9271
.if.true.9271:
%.tmp9272 = load i8*, i8** %tmpl.9238
%.tmp9273 = load i8**, i8*** %argv
%.tmp9274 = getelementptr i8*, i8** %.tmp9273, i32 0
%.tmp9275 = load i8*, i8** %.tmp9274
%.tmp9276 = call i32(i8*,...) @printf(i8* %.tmp9272, i8* %.tmp9275)
call void(i32) @exit(i32 1)
br label %.if.end.9271
.if.false.9271:
br label %.if.end.9271
.if.end.9271:
%.tmp9277 = getelementptr %.Args.type, %.Args.type* %args.9239, i32 0, i32 1
%.tmp9278 = load i32, i32* %fp.9252
%.tmp9279 = load i8**, i8*** %argv
%.tmp9280 = getelementptr i8*, i8** %.tmp9279, i32 %.tmp9278
%.tmp9281 = load i8*, i8** %.tmp9280
store i8* %.tmp9281, i8** %.tmp9277
%.tmp9282 = getelementptr %.Args.type, %.Args.type* %args.9239, i32 0, i32 1
%.tmp9283 = load i8*, i8** %.tmp9282
%.tmp9284 = call {i8*,i8*}(i8*) @m2$splitext.scpcp.cp(i8* %.tmp9283)
%ext.9285 = alloca {i8*,i8*}
store {i8*,i8*} %.tmp9284, {i8*,i8*}* %ext.9285
%.tmp9286 = getelementptr %.Args.type, %.Args.type* %args.9239, i32 0, i32 2
%.tmp9287 = getelementptr {i8*,i8*}, {i8*,i8*}* %ext.9285, i32 0, i32 0
%.tmp9288 = load i8*, i8** %.tmp9287
store i8* %.tmp9288, i8** %.tmp9286
%.tmp9289 = load i32, i32* %argc
%.tmp9290 = load i32, i32* %fp.9252
%.tmp9291 = sub i32 %.tmp9289, %.tmp9290
%.tmp9292 = add i32 %.tmp9291, 1
%ac.9293 = alloca i32
store i32 %.tmp9292, i32* %ac.9293
%.tmp9294 = getelementptr %.Args.type, %.Args.type* %args.9239, i32 0, i32 3
%.tmp9295 = load i32, i32* %ac.9293
%.tmp9296 = mul i32 8, %.tmp9295
%.tmp9297 = call i8*(i32) @malloc(i32 %.tmp9296)
%.tmp9298 = bitcast i8* %.tmp9297 to i8**
store i8** %.tmp9298, i8*** %.tmp9294
%.tmp9299 = getelementptr %.Args.type, %.Args.type* %args.9239, i32 0, i32 3
%.tmp9300 = load i8**, i8*** %.tmp9299
%.tmp9301 = getelementptr i8*, i8** %.tmp9300, i32 0
%.tmp9302 = getelementptr %.Args.type, %.Args.type* %args.9239, i32 0, i32 2
%.tmp9303 = load i8*, i8** %.tmp9302
store i8* %.tmp9303, i8** %.tmp9301
%i.9305 = alloca i32
store i32 0, i32* %i.9305
br label %.for.start.9304
.for.start.9304:
%.tmp9306 = load i32, i32* %i.9305
%.tmp9307 = load i32, i32* %argc
%.tmp9308 = load i32, i32* %fp.9252
%.tmp9309 = sub i32 %.tmp9307, %.tmp9308
%.tmp9310 = icmp slt i32 %.tmp9306, %.tmp9309
br i1 %.tmp9310, label %.for.continue.9304, label %.for.end.9304
.for.continue.9304:
%.tmp9311 = getelementptr %.Args.type, %.Args.type* %args.9239, i32 0, i32 3
%.tmp9312 = load i32, i32* %i.9305
%.tmp9313 = add i32 %.tmp9312, 1
%.tmp9314 = load i8**, i8*** %.tmp9311
%.tmp9315 = getelementptr i8*, i8** %.tmp9314, i32 %.tmp9313
%.tmp9316 = load i32, i32* %fp.9252
%.tmp9317 = load i32, i32* %i.9305
%.tmp9318 = add i32 %.tmp9316, %.tmp9317
%.tmp9319 = add i32 %.tmp9318, 1
%.tmp9320 = load i8**, i8*** %argv
%.tmp9321 = getelementptr i8*, i8** %.tmp9320, i32 %.tmp9319
%.tmp9322 = load i8*, i8** %.tmp9321
store i8* %.tmp9322, i8** %.tmp9315
%.tmp9323 = load i32, i32* %i.9305
%.tmp9324 = add i32 %.tmp9323, 1
store i32 %.tmp9324, i32* %i.9305
br label %.for.start.9304
.for.end.9304:
%.tmp9325 = load %.Args.type, %.Args.type* %args.9239
ret %.Args.type %.tmp9325
}
@.str292 = constant [2 x i8] c"r\00"
@.str373 = constant [1 x i8] c"\00"
@.str489 = constant [16 x i8] c"digit too large\00"
@.str497 = constant [7 x i8] c"NUMBER\00"
@.str527 = constant [15 x i8] c"WORD too large\00"
@.str535 = constant [5 x i8] c"WORD\00"
@.str556 = constant [7 x i8] c"STRING\00"
@.str577 = constant [15 x i8] c"char too large\00"
@.str598 = constant [4 x i8] c"CHR\00"
@.str606 = constant [3 x i8] c"NL\00"
@.str608 = constant [2 x i8] c"\0A\00"
@.str622 = constant [9 x i8] c"OPERATOR\00"
@.str624 = constant [2 x i8] c"-\00"
@.str651 = constant [8 x i8] c"COMMENT\00"
@.str660 = constant [47 x i8] c"%d:%d error: found non ascii token: '%c' (%d)\0A\00"
@.str675 = constant [9 x i8] c"OPERATOR\00"
@.str685 = constant [3 x i8] c"==\00"
@.str697 = constant [3 x i8] c"!=\00"
@.str709 = constant [3 x i8] c">=\00"
@.str721 = constant [3 x i8] c"<=\00"
@.str737 = constant [13 x i8] c"error on ..\0A\00"
@.str741 = constant [4 x i8] c"...\00"
@.str744 = constant [8 x i8] c"KEYWORD\00"
@.str759 = constant [4 x i8] c"EOF\00"
@.str761 = constant [1 x i8] c"\00"
@.str789 = constant [61 x i8] c"lexer: reached end of file while scanning for 'STRING' token\00"
@.str847 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
@.str863 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
@.str919 = constant [2 x i8] c"(\00"
@.str939 = constant [2 x i8] c"|\00"
@.str959 = constant [2 x i8] c")\00"
@.str968 = constant [4 x i8] c"EOF\00"
@.str985 = constant [2 x i8] c"|\00"
@.str994 = constant [2 x i8] c")\00"
@.str1000 = constant [48 x i8] c"[%d:%d] malformed grammar, expected | got '%s'\0A\00"
@.str1023 = constant [2 x i8] c"|\00"
@.str1040 = constant [2 x i8] c")\00"
@.str1046 = constant [22 x i8] c"open brace not closed\00"
@.str1060 = constant [2 x i8] c"+\00"
@.str1079 = constant [2 x i8] c"*\00"
@.str1098 = constant [2 x i8] c"?\00"
@.str1119 = constant [2 x i8] c"(\00"
@.str1128 = constant [5 x i8] c"WORD\00"
@.str1150 = constant [5 x i8] c"WORD\00"
@.str1157 = constant [7 x i8] c"STRING\00"
@.str1199 = constant [7 x i8] c"STRING\00"
@.str1224 = constant [17 x i8] c"rule name: '%s'\0A\00"
@.str1233 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1265 = constant [5 x i8] c"WORD\00"
@.str1270 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1284 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1298 = constant [2 x i8] c":\00"
@.str1310 = constant [27 x i8] c"expected : after rule name\00"
@.str1353 = constant [4 x i8] c"EOF\00"
@.str1362 = constant [3 x i8] c"NL\00"
@.str1529 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1586 = constant [7 x i8] c"(null)\00"
@.str1588 = constant [15 x i8] c"%s: %s != \22%s\22\00"
@.str1591 = constant [31 x i8] c"unable to match token by value\00"
@.str1666 = constant [13 x i8] c"%s: %s != %s\00"
@.str1669 = constant [30 x i8] c"unable to match token by type\00"
@.str1730 = constant [30 x i8] c"unable to retrieve alias rule\00"
@.str1753 = constant [41 x i8] c"parser.bn: query matcher not implemented\00"
@.str1893 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str1910 = constant [4 x i8] c"EOF\00"
@.str1924 = constant [26 x i8] c"syntax parsing ended here\00"
@.str1959 = constant [2 x i8] c"\0A\00"
@.str1968 = constant [3 x i8] c"  \00"
@.str1977 = constant [7 x i8] c"(null)\00"
@.str1981 = constant [2 x i8] c"{\00"
@.str1987 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str1996 = constant [12 x i8] c"\22value\22: %s\00"
@.str2005 = constant [11 x i8] c"\22line\22: %d\00"
@.str2014 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str2023 = constant [9 x i8] c"\22next\22: \00"
@.str2035 = constant [13 x i8] c"\22children\22: \00"
@.str2048 = constant [2 x i8] c"}\00"
@.str2052 = constant [1847 x i8] c"
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
@.str2055 = constant [1885 x i8] c"%%%1$s.tmp0 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
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
@.str2061 = constant [1 x i8] c"\00"
@.str2077 = constant [6 x i8] c"%s\5C22\00"
@.str2102 = constant [6 x i8] c"%s\5C0A\00"
@.str2116 = constant [6 x i8] c"%s\5C5C\00"
@.str2132 = constant [8 x i8] c"%s\5C%c%c\00"
@.str2150 = constant [5 x i8] c"%s%c\00"
@.str2159 = constant [5 x i8] c"%s%c\00"
@.str2170 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2207 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2212 = constant [3 x i8] c"%d\00"
@.str2220 = constant [6 x i8] c"'\5C%x'\00"
@.str2225 = constant [3 x i8] c"%d\00"
@.str2233 = constant [6 x i8] c"'\5C%c'\00"
@.str2240 = constant [3 x i8] c"10\00"
@.str2247 = constant [5 x i8] c"'%c'\00"
@.str2252 = constant [3 x i8] c"%d\00"
@.str2301 = constant [16 x i8] c"mono_assignable\00"
@.str2312 = constant [9 x i8] c"operator\00"
@.str2349 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2396 = constant [2 x i8] c"+\00"
@.str2403 = constant [2 x i8] c"-\00"
@.str2412 = constant [2 x i8] c"*\00"
@.str2419 = constant [2 x i8] c"/\00"
@.str2427 = constant [2 x i8] c"%\00"
@.str2436 = constant [3 x i8] c"==\00"
@.str2443 = constant [3 x i8] c"!=\00"
@.str2452 = constant [3 x i8] c">=\00"
@.str2459 = constant [3 x i8] c"<=\00"
@.str2468 = constant [2 x i8] c">\00"
@.str2475 = constant [2 x i8] c"<\00"
@.str2484 = constant [2 x i8] c"&\00"
@.str2492 = constant [2 x i8] c"|\00"
@.str2497 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
@.str2540 = constant [12 x i8] c"COFFEE_ROOT\00"
@.str2547 = constant [5 x i8] c"HOME\00"
@.str2552 = constant [11 x i8] c"%s/.coffee\00"
@.str2640 = constant [1 x i8] c"\00"
@.str2686 = constant [5 x i8] c"%c%s\00"
@.str2699 = constant [8 x i8] c"nullptr\00"
@.str2706 = constant [8 x i8] c"nullptr\00"
@.str2715 = constant [4 x i8] c"ptr\00"
@.str2722 = constant [4 x i8] c"ptr\00"
@.str2741 = constant [7 x i8] c".tmp%d\00"
@.str2841 = constant [1 x i8] c"\00"
@.str2883 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2901 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str2920 = constant [6 x i8] c"start\00"
@.str2997 = constant [6 x i8] c"start\00"
@.str3004 = constant [29 x i8] c"Expecting 'start' expression\00"
@.str3007 = constant [7 x i8] c"global\00"
@.str3018 = constant [13 x i8] c"head_comment\00"
@.str3057 = constant [1 x i8] c"\00"
@.str3081 = constant [7 x i8] c"string\00"
@.str3089 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3109 = constant [7 x i8] c"extern\00"
@.str3123 = constant [15 x i8] c"declare %s %s(\00"
@.str3159 = constant [3 x i8] c", \00"
@.str3165 = constant [3 x i8] c"%s\00"
@.str3177 = constant [3 x i8] c")\0A\00"
@.str3194 = constant [5 x i8] c"%s%s\00"
@.str3202 = constant [9 x i8] c"function\00"
@.str3208 = constant [5 x i8] c"main\00"
@.str3223 = constant [6 x i8] c"%s.%s\00"
@.str3244 = constant [3 x i8] c"NL\00"
@.str3252 = constant [7 x i8] c"global\00"
@.str3260 = constant [11 x i8] c"assignable\00"
@.str3291 = constant [9 x i8] c"variable\00"
@.str3303 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3318 = constant [10 x i8] c"typealias\00"
@.str3340 = constant [11 x i8] c"%s.%s.type\00"
@.str3352 = constant [10 x i8] c"typealias\00"
@.str3374 = constant [5 x i8] c"type\00"
@.str3404 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3417 = constant [7 x i8] c"extern\00"
@.str3435 = constant [7 x i8] c"extern\00"
@.str3476 = constant [7 x i8] c"extern\00"
@.str3488 = constant [9 x i8] c"function\00"
@.str3497 = constant [9 x i8] c"function\00"
@.str3536 = constant [14 x i8] c"define %s %s(\00"
@.str3565 = constant [3 x i8] c", \00"
@.str3571 = constant [5 x i8] c"type\00"
@.str3587 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3602 = constant [5 x i8] c") {\0A\00"
@.str3606 = constant [9 x i8] c"function\00"
@.str3615 = constant [6 x i8] c"block\00"
@.str3630 = constant [3 x i8] c"}\0A\00"
@.str3636 = constant [7 x i8] c"import\00"
@.str3692 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str3753 = constant [5 x i8] c"m%d$\00"
@.str3804 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3813 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3845 = constant [9 x i8] c"variable\00"
@.str3850 = constant [5 x i8] c"type\00"
@.str3882 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3895 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3907 = constant [6 x i8] c"block\00"
@.str3914 = constant [12 x i8] c"expressions\00"
@.str3945 = constant [7 x i8] c"struct\00"
@.str3950 = constant [7 x i8] c"WhAT!\0A\00"
@.str3990 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4002 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4028 = constant [7 x i8] c"struct\00"
@.str4033 = constant [7 x i8] c"WhAT!\0A\00"
@.str4064 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4076 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4101 = constant [7 x i8] c"sizeof\00"
@.str4107 = constant [8 x i8] c"fn_args\00"
@.str4114 = constant [11 x i8] c"assignable\00"
@.str4142 = constant [4 x i8] c"int\00"
@.str4155 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4164 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4175 = constant [7 x i8] c"append\00"
@.str4181 = constant [8 x i8] c"fn_args\00"
@.str4188 = constant [11 x i8] c"assignable\00"
@.str4195 = constant [11 x i8] c"assignable\00"
@.str4219 = constant [5 x i8] c".b%d\00"
@.str4253 = constant [8 x i8] c"realloc\00"
@.str4262 = constant [9 x i8] c"function\00"
@.str4275 = constant [4 x i8] c"ptr\00"
@.str4292 = constant [4 x i8] c"chr\00"
@.str4309 = constant [4 x i8] c"ptr\00"
@.str4330 = constant [4 x i8] c"chr\00"
@.str4351 = constant [4 x i8] c"int\00"
@.str4354 = constant [8 x i8] c"realloc\00"
@.str4356 = constant [7 x i8] c"extern\00"
@.str4363 = constant [4 x i8] c"len\00"
@.str4369 = constant [8 x i8] c"fn_args\00"
@.str4376 = constant [11 x i8] c"assignable\00"
@.str4384 = constant [1 x i8] c"\00"
@.str4400 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str4421 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str4427 = constant [1 x i8] c"\00"
@.str4433 = constant [6 x i8] c"%s.bn\00"
@.str4438 = constant [9 x i8] c"%s/%s.bn\00"
@.str4462 = constant [35 x i8] c"unable to compile function address\00"
@.str4468 = constant [8 x i8] c"fn_args\00"
@.str4472 = constant [1 x i8] c"\00"
@.str4481 = constant [4 x i8] c"ptr\00"
@.str4501 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str4525 = constant [11 x i8] c"assignable\00"
@.str4549 = constant [11 x i8] c"assignable\00"
@.str4561 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4579 = constant [5 x i8] c"%s, \00"
@.str4604 = constant [7 x i8] c"vararg\00"
@.str4617 = constant [1 x i8] c"\00"
@.str4621 = constant [58 x i8] c"types.Type for argument %d does not match: '%s', got '%s'\00"
@.str4638 = constant [8 x i8] c"%s%s %s\00"
@.str4655 = constant [7 x i8] c"vararg\00"
@.str4666 = constant [11 x i8] c"assignable\00"
@.str4675 = constant [7 x i8] c"vararg\00"
@.str4681 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4717 = constant [7 x i8] c"vararg\00"
@.str4728 = constant [42 x i8] c"Function '%s' takes %d arguments, 0 given\00"
@.str4746 = constant [5 x i8] c"void\00"
@.str4754 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4786 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4812 = constant [7 x i8] c"return\00"
@.str4824 = constant [3 x i8] c"NL\00"
@.str4842 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4855 = constant [10 x i8] c"ret void\0A\00"
@.str4859 = constant [3 x i8] c"NL\00"
@.str4865 = constant [8 x i8] c"fn_call\00"
@.str4876 = constant [12 x i8] c"declaration\00"
@.str4885 = constant [11 x i8] c"assignment\00"
@.str4893 = constant [11 x i8] c"assignable\00"
@.str4921 = constant [1 x i8] c"\00"
@.str4925 = constant [37 x i8] c"cannot assign type '%s' to type '%s'\00"
@.str4954 = constant [4 x i8] c"ptr\00"
@.str4963 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4973 = constant [9 x i8] c"if_block\00"
@.str4981 = constant [9 x i8] c"for_loop\00"
@.str4989 = constant [8 x i8] c"keyword\00"
@.str5006 = constant [6 x i8] c"break\00"
@.str5017 = constant [4 x i8] c"for\00"
@.str5025 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5036 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str5043 = constant [9 x i8] c"continue\00"
@.str5054 = constant [4 x i8] c"for\00"
@.str5062 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5073 = constant [51 x i8] c"'continue' keyword used outside of 'for' statement\00"
@.str5077 = constant [40 x i8] c"Keyword '%s': behaviour not implemented\00"
@.str5087 = constant [9 x i8] c"function\00"
@.str5096 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str5105 = constant [4 x i8] c"ptr\00"
@.str5114 = constant [4 x i8] c"chr\00"
@.str5125 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5134 = constant [9 x i8] c"function\00"
@.str5147 = constant [5 x i8] c"void\00"
@.str5177 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5179 = constant [7 x i8] c"extern\00"
@.str5187 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5196 = constant [9 x i8] c"function\00"
@.str5211 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5213 = constant [7 x i8] c"extern\00"
@.str5221 = constant [5 x i8] c"mmap\00"
@.str5230 = constant [9 x i8] c"function\00"
@.str5256 = constant [4 x i8] c"int\00"
@.str5268 = constant [4 x i8] c"int\00"
@.str5280 = constant [4 x i8] c"int\00"
@.str5292 = constant [4 x i8] c"int\00"
@.str5304 = constant [4 x i8] c"int\00"
@.str5310 = constant [5 x i8] c"mmap\00"
@.str5312 = constant [7 x i8] c"extern\00"
@.str5318 = constant [5 x i8] c"WORD\00"
@.str5341 = constant [9 x i8] c"function\00"
@.str5365 = constant [4 x i8] c"ptr\00"
@.str5374 = constant [7 x i8] c"struct\00"
@.str5388 = constant [1 x i8] c"\00"
@.str5392 = constant [5 x i8] c"@.%d\00"
@.str5406 = constant [101 x i8] c"%%.tmem%d = call i8*(i8*,i32,i32,i32,i32,i32) @mmap(i8* null, i32 72, i32 7, i32 34, i32 -1, i32 0)\0A\00"
@.str5413 = constant [100 x i8] c"call void(i8*,i8*,i8*) @llvm.init.trampoline(i8* %%.tmem%d, i8* bitcast (%s* %s to i8*), i8* null)\0A\00"
@.str5424 = constant [66 x i8] c"%%.trmp%d = call i8*(i8*) @llvm.adjust.trampoline(i8* %%.tmem%d)\0A\00"
@.str5432 = constant [35 x i8] c"%s = bitcast i8* %%.trmp%d to %s*\0A\00"
@.str5453 = constant [14 x i8] c"define %s %s(\00"
@.str5461 = constant [9 x i8] c"function\00"
@.str5468 = constant [13 x i8] c"%s nest %%.0\00"
@.str5495 = constant [3 x i8] c", \00"
@.str5501 = constant [5 x i8] c"type\00"
@.str5517 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str5532 = constant [5 x i8] c") {\0A\00"
@.str5540 = constant [6 x i8] c"block\00"
@.str5553 = constant [3 x i8] c"}\0A\00"
@.str5579 = constant [12 x i8] c"expressions\00"
@.str5593 = constant [3 x i8] c"NL\00"
@.str5610 = constant [7 x i8] c"return\00"
@.str5618 = constant [5 x i8] c"void\00"
@.str5629 = constant [21 x i8] c"Missing return value\00"
@.str5634 = constant [10 x i8] c"ret void\0A\00"
@.str5651 = constant [14 x i8] c".for.start.%d\00"
@.str5656 = constant [12 x i8] c".for.end.%d\00"
@.str5661 = constant [4 x i8] c"for\00"
@.str5668 = constant [12 x i8] c"declaration\00"
@.str5679 = constant [11 x i8] c"assignment\00"
@.str5689 = constant [9 x i8] c"OPERATOR\00"
@.str5696 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str5707 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str5714 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str5721 = constant [9 x i8] c"OPERATOR\00"
@.str5732 = constant [9 x i8] c"OPERATOR\00"
@.str5739 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str5748 = constant [9 x i8] c"OPERATOR\00"
@.str5753 = constant [6 x i8] c"block\00"
@.str5758 = constant [11 x i8] c"else_block\00"
@.str5768 = constant [13 x i8] c".for.else.%d\00"
@.str5775 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str5790 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str5809 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5819 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str5826 = constant [6 x i8] c"block\00"
@.str5835 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5842 = constant [5 x i8] c"%s:\0A\00"
@.str5856 = constant [5 x i8] c"type\00"
@.str5871 = constant [11 x i8] c"assignable\00"
@.str5886 = constant [9 x i8] c"variable\00"
@.str5891 = constant [5 x i8] c"WORD\00"
@.str5900 = constant [31 x i8] c"unable to get declaration name\00"
@.str5920 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5932 = constant [6 x i8] c"%s.%d\00"
@.str5989 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str6006 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str6018 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6059 = constant [4 x i8] c"int\00"
@.str6066 = constant [4 x i8] c"chr\00"
@.str6074 = constant [5 x i8] c"bool\00"
@.str6083 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str6092 = constant [4 x i8] c"ptr\00"
@.str6100 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6103 = constant [5 x i8] c"null\00"
@.str6111 = constant [7 x i8] c"struct\00"
@.str6132 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6152 = constant [10 x i8] c"typealias\00"
@.str6175 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6194 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str6211 = constant [11 x i8] c"assignable\00"
@.str6228 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str6243 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str6250 = constant [6 x i8] c"block\00"
@.str6259 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6266 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str6273 = constant [11 x i8] c"elif_block\00"
@.str6285 = constant [11 x i8] c"else_block\00"
@.str6295 = constant [6 x i8] c"block\00"
@.str6305 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6312 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str6333 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str6342 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str6376 = constant [1 x i8] c"\00"
@.str6387 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6407 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6432 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str6453 = constant [7 x i8] c"module\00"
@.str6506 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str6543 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str6551 = constant [9 x i8] c"function\00"
@.str6558 = constant [7 x i8] c"extern\00"
@.str6570 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str6591 = constant [9 x i8] c"variable\00"
@.str6613 = constant [4 x i8] c"ptr\00"
@.str6632 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str6656 = constant [10 x i8] c"typealias\00"
@.str6667 = constant [7 x i8] c"struct\00"
@.str6673 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str6725 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str6746 = constant [9 x i8] c"variable\00"
@.str6757 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6778 = constant [9 x i8] c"variable\00"
@.str6786 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str6800 = constant [17 x i8] c"addr_destination\00"
@.str6807 = constant [16 x i8] c"mono_assignable\00"
@.str6815 = constant [11 x i8] c"assignable\00"
@.str6829 = constant [12 x i8] c"destination\00"
@.str6834 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str6862 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str6881 = constant [7 x i8] c"module\00"
@.str6903 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str6974 = constant [6 x i8] c"slice\00"
@.str6987 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str7029 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str7050 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str7074 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str7097 = constant [16 x i8] c"mono_assignable\00"
@.str7123 = constant [5 x i8] c"cast\00"
@.str7133 = constant [5 x i8] c"type\00"
@.str7158 = constant [8 x i8] c"bitcast\00"
@.str7173 = constant [6 x i8] c"slice\00"
@.str7178 = constant [48 x i8] c"Casting array to slices is not implemented yet\0A\00"
@.str7186 = constant [4 x i8] c"ptr\00"
@.str7193 = constant [4 x i8] c"ptr\00"
@.str7212 = constant [4 x i8] c"i%d\00"
@.str7217 = constant [4 x i8] c"i%d\00"
@.str7225 = constant [5 x i8] c"sext\00"
@.str7227 = constant [6 x i8] c"trunc\00"
@.str7232 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str7252 = constant [16 x i8] c"mono_assignable\00"
@.str7314 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str7337 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str7344 = constant [2 x i8] c"+\00"
@.str7349 = constant [4 x i8] c"add\00"
@.str7354 = constant [2 x i8] c"-\00"
@.str7359 = constant [4 x i8] c"sub\00"
@.str7364 = constant [2 x i8] c"*\00"
@.str7369 = constant [4 x i8] c"mul\00"
@.str7374 = constant [2 x i8] c"/\00"
@.str7379 = constant [5 x i8] c"sdiv\00"
@.str7384 = constant [3 x i8] c"==\00"
@.str7389 = constant [8 x i8] c"icmp eq\00"
@.str7394 = constant [3 x i8] c"!=\00"
@.str7399 = constant [8 x i8] c"icmp ne\00"
@.str7404 = constant [2 x i8] c">\00"
@.str7409 = constant [9 x i8] c"icmp sgt\00"
@.str7414 = constant [2 x i8] c"<\00"
@.str7419 = constant [9 x i8] c"icmp slt\00"
@.str7424 = constant [2 x i8] c"&\00"
@.str7429 = constant [4 x i8] c"and\00"
@.str7434 = constant [2 x i8] c"|\00"
@.str7439 = constant [3 x i8] c"or\00"
@.str7444 = constant [3 x i8] c">=\00"
@.str7449 = constant [9 x i8] c"icmp sge\00"
@.str7454 = constant [3 x i8] c"<=\00"
@.str7459 = constant [9 x i8] c"icmp sle\00"
@.str7464 = constant [2 x i8] c"%\00"
@.str7469 = constant [5 x i8] c"srem\00"
@.str7473 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str7480 = constant [4 x i8] c"add\00"
@.str7487 = constant [3 x i8] c"==\00"
@.str7494 = constant [3 x i8] c"!=\00"
@.str7502 = constant [2 x i8] c"|\00"
@.str7510 = constant [2 x i8] c"&\00"
@.str7518 = constant [2 x i8] c">\00"
@.str7526 = constant [2 x i8] c"<\00"
@.str7534 = constant [3 x i8] c">=\00"
@.str7542 = constant [3 x i8] c"<=\00"
@.str7550 = constant [5 x i8] c"bool\00"
@.str7554 = constant [4 x i8] c"int\00"
@.str7568 = constant [7 x i8] c"NUMBER\00"
@.str7582 = constant [4 x i8] c"int\00"
@.str7596 = constant [5 x i8] c"WORD\00"
@.str7606 = constant [5 x i8] c"null\00"
@.str7613 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str7627 = constant [5 x i8] c"null\00"
@.str7636 = constant [8 x i8] c"nullptr\00"
@.str7643 = constant [17 x i8] c"addr_destination\00"
@.str7655 = constant [12 x i8] c"destination\00"
@.str7699 = constant [4 x i8] c"ptr\00"
@.str7718 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str7732 = constant [9 x i8] c"function\00"
@.str7747 = constant [4 x i8] c"ptr\00"
@.str7755 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str7769 = constant [8 x i8] c"boolean\00"
@.str7783 = constant [5 x i8] c"bool\00"
@.str7792 = constant [6 x i8] c"false\00"
@.str7799 = constant [2 x i8] c"0\00"
@.str7803 = constant [2 x i8] c"1\00"
@.str7810 = constant [8 x i8] c"fn_call\00"
@.str7827 = constant [7 x i8] c"STRING\00"
@.str7853 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str7869 = constant [4 x i8] c"ptr\00"
@.str7882 = constant [4 x i8] c"chr\00"
@.str7889 = constant [4 x i8] c"CHR\00"
@.str7905 = constant [2 x i8] c"0\00"
@.str7921 = constant [22 x i8] c"Invalid character: %s\00"
@.str7937 = constant [4 x i8] c"chr\00"
@.str7941 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str7969 = constant [22 x i8] c"called 'abbr' on null\00"
@.str7975 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str7980 = constant [4 x i8] c"int\00"
@.str7985 = constant [2 x i8] c"i\00"
@.str7990 = constant [5 x i8] c"bool\00"
@.str7995 = constant [2 x i8] c"b\00"
@.str8000 = constant [5 x i8] c"void\00"
@.str8005 = constant [2 x i8] c"v\00"
@.str8010 = constant [4 x i8] c"chr\00"
@.str8015 = constant [2 x i8] c"c\00"
@.str8020 = constant [4 x i8] c"ptr\00"
@.str8027 = constant [4 x i8] c"%sp\00"
@.str8038 = constant [10 x i8] c"typealias\00"
@.str8049 = constant [7 x i8] c"struct\00"
@.str8054 = constant [2 x i8] c"s\00"
@.str8065 = constant [5 x i8] c"%s%s\00"
@.str8078 = constant [9 x i8] c"function\00"
@.str8083 = constant [2 x i8] c"f\00"
@.str8088 = constant [6 x i8] c"error\00"
@.str8093 = constant [2 x i8] c"?\00"
@.str8095 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str8107 = constant [7 x i8] c".str%d\00"
@.str8122 = constant [6 x i8] c"array\00"
@.str8135 = constant [4 x i8] c"chr\00"
@.str8156 = constant [3 x i8] c"%d\00"
@.str8163 = constant [7 x i8] c"string\00"
@.str8199 = constant [7 x i8] c"module\00"
@.str8250 = constant [4 x i8] c"%s\0A\00"
@.str8305 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str8311 = constant [2 x i8] c"?\00"
@.str8317 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str8323 = constant [4 x i8] c"int\00"
@.str8328 = constant [4 x i8] c"i32\00"
@.str8333 = constant [5 x i8] c"void\00"
@.str8338 = constant [5 x i8] c"void\00"
@.str8343 = constant [5 x i8] c"bool\00"
@.str8348 = constant [3 x i8] c"i1\00"
@.str8353 = constant [8 x i8] c"nullptr\00"
@.str8358 = constant [4 x i8] c"ptr\00"
@.str8363 = constant [4 x i8] c"chr\00"
@.str8368 = constant [3 x i8] c"i8\00"
@.str8373 = constant [9 x i8] c"function\00"
@.str8379 = constant [4 x i8] c"%s(\00"
@.str8405 = constant [4 x i8] c"%s,\00"
@.str8410 = constant [5 x i8] c"%s%s\00"
@.str8421 = constant [4 x i8] c"%s)\00"
@.str8429 = constant [4 x i8] c"ptr\00"
@.str8435 = constant [4 x i8] c"%s*\00"
@.str8447 = constant [7 x i8] c"struct\00"
@.str8453 = constant [2 x i8] c"{\00"
@.str8470 = constant [4 x i8] c"%s,\00"
@.str8475 = constant [5 x i8] c"%s%s\00"
@.str8486 = constant [4 x i8] c"%s}\00"
@.str8494 = constant [6 x i8] c"array\00"
@.str8500 = constant [10 x i8] c"[%s x %s]\00"
@.str8519 = constant [10 x i8] c"typealias\00"
@.str8525 = constant [5 x i8] c"%%%s\00"
@.str8535 = constant [7 x i8] c"vararg\00"
@.str8540 = constant [4 x i8] c"...\00"
@.str8545 = constant [6 x i8] c"error\00"
@.str8550 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str8626 = constant [9 x i8] c"function\00"
@.str8644 = constant [5 x i8] c"WORD\00"
@.str8701 = constant [10 x i8] c"fn_params\00"
@.str8715 = constant [11 x i8] c"basic_type\00"
@.str8736 = constant [13 x i8] c"type_trailer\00"
@.str8745 = constant [9 x i8] c"function\00"
@.str8761 = constant [15 x i8] c"type_fn_params\00"
@.str8802 = constant [4 x i8] c"ptr\00"
@.str8814 = constant [10 x i8] c"structdef\00"
@.str8821 = constant [7 x i8] c"struct\00"
@.str8828 = constant [5 x i8] c"type\00"
@.str8859 = constant [5 x i8] c"type\00"
@.str8886 = constant [5 x i8] c"type\00"
@.str8892 = constant [12 x i8] c"dotted_name\00"
@.str8906 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str8919 = constant [6 x i8] c"error\00"
@.str8924 = constant [10 x i8] c"typealias\00"
@.str8948 = constant [4 x i8] c"str\00"
@.str8955 = constant [4 x i8] c"ptr\00"
@.str8964 = constant [4 x i8] c"chr\00"
@.str8969 = constant [5 x i8] c"WORD\00"
@.str8982 = constant [4 x i8] c"...\00"
@.str8989 = constant [7 x i8] c"vararg\00"
@.str8993 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str9014 = constant [2 x i8] c"*\00"
@.str9023 = constant [4 x i8] c"ptr\00"
@.str9032 = constant [2 x i8] c"[\00"
@.str9042 = constant [2 x i8] c"]\00"
@.str9051 = constant [7 x i8] c"struct\00"
@.str9055 = constant [6 x i8] c"slice\00"
@.str9061 = constant [4 x i8] c"ptr\00"
@.str9065 = constant [6 x i8] c"c_arr\00"
@.str9077 = constant [4 x i8] c"int\00"
@.str9081 = constant [4 x i8] c"len\00"
@.str9090 = constant [4 x i8] c"int\00"
@.str9094 = constant [4 x i8] c"cap\00"
@.str9105 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str9118 = constant [2 x i8] c"w\00"
@.str9134 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str9143 = constant [1 x i8] c"\00"
@.str9147 = constant [32 x i8] c"tee debug.ll | llc - -o debug.s\00"
@.str9152 = constant [2 x i8] c"w\00"
@.str9164 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9172 = constant [24 x i8] c"error on llc execution\0A\00"
@.str9176 = constant [17 x i8] c"cc debug.s -o %s\00"
@.str9182 = constant [2 x i8] c"w\00"
@.str9190 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9198 = constant [22 x i8] c"error on cc execution\00"
@.str9201 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str9218 = constant [4 x i8] c"run\00"
@.str9223 = constant [1 x i8] c"\00"
@.str9227 = constant [5 x i8] c"./%s\00"
@.str9236 = constant [22 x i8] c"Usage: %s <filename>\0A\00"
@.str9254 = constant [8 x i8] c"compile\00"
@.str9259 = constant [4 x i8] c"run\00"
@.str9265 = constant [4 x i8] c"run\00"
