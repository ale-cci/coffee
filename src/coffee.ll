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
%.tmp2696 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2697 = load %m2503$.Type.type*, %m2503$.Type.type** %a
%.tmp2698 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp2696, %m2503$.Type.type* %.tmp2697)
%a_repr.2699 = alloca i8*
store i8* %.tmp2698, i8** %a_repr.2699
%.tmp2700 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2701 = load %m2503$.Type.type*, %m2503$.Type.type** %b
%.tmp2702 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp2700, %m2503$.Type.type* %.tmp2701)
%b_repr.2703 = alloca i8*
store i8* %.tmp2702, i8** %b_repr.2703
%.tmp2704 = load i8*, i8** %a_repr.2699
%.tmp2705 = load i8*, i8** %b_repr.2703
%.tmp2706 = call i32(i8*,i8*) @strcmp(i8* %.tmp2704, i8* %.tmp2705)
%.tmp2707 = icmp eq i32 %.tmp2706, 0
ret i1 %.tmp2707
}
define void @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%info = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.info.arg, %m2503$.AssignableInfo.type** %info
%tmp_buff.2708 = alloca i8*
store i8* null, i8** %tmp_buff.2708
%.tmp2709 = getelementptr i8*, i8** %tmp_buff.2708, i32 0
%.tmp2711 = getelementptr [7 x i8], [7 x i8]*@.str2710, i32 0, i32 0
%.tmp2712 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2713 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp2712)
%.tmp2714 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2709, i8* %.tmp2711, i32 %.tmp2713)
%.tmp2715 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp2716 = load i8, i8* @SCOPE_LOCAL
%.tmp2717 = load i8*, i8** %tmp_buff.2708
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp2715, i8 %.tmp2716, i8* %.tmp2717)
ret void
}
define %m2503$.ModuleLookup.type* @m295$get_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2719 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2720 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2719, i32 0, i32 6
%.tmp2721 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp2720
%m.2722 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp2721, %m2503$.ModuleLookup.type** %m.2722
br label %.for.start.2718
.for.start.2718:
%.tmp2723 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2722
%.tmp2724 = icmp ne %m2503$.ModuleLookup.type* %.tmp2723, null
br i1 %.tmp2724, label %.for.continue.2718, label %.for.end.2718
.for.continue.2718:
%.tmp2725 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2722
%.tmp2726 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2725, i32 0, i32 0
%.tmp2727 = load i8*, i8** %.tmp2726
%.tmp2728 = load i8*, i8** %filename
%.tmp2729 = call i32(i8*,i8*) @strcmp(i8* %.tmp2727, i8* %.tmp2728)
%.tmp2730 = icmp eq i32 %.tmp2729, 0
br i1 %.tmp2730, label %.if.true.2731, label %.if.false.2731
.if.true.2731:
%.tmp2732 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2722
ret %m2503$.ModuleLookup.type* %.tmp2732
br label %.if.end.2731
.if.false.2731:
br label %.if.end.2731
.if.end.2731:
%.tmp2733 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2722
%.tmp2734 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2733, i32 0, i32 2
%.tmp2735 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp2734
store %m2503$.ModuleLookup.type* %.tmp2735, %m2503$.ModuleLookup.type** %m.2722
br label %.for.start.2718
.for.end.2718:
%.tmp2736 = bitcast ptr null to %m2503$.ModuleLookup.type*
ret %m2503$.ModuleLookup.type* %.tmp2736
}
define %m2503$.ModuleLookup.type* @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%.tmp2737 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2738 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2739 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2738, i32 0, i32 7
%.tmp2740 = load i8*, i8** %.tmp2739
%.tmp2741 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*,i8*) @m295$get_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.tmp2737, i8* %.tmp2740)
ret %m2503$.ModuleLookup.type* %.tmp2741
}
define i32 @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%.tmp2742 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2743 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2742, i32 0, i32 5
%.tmp2744 = load i32, i32* %.tmp2743
%uid.2745 = alloca i32
store i32 %.tmp2744, i32* %uid.2745
%.tmp2746 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2747 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2746, i32 0, i32 5
%.tmp2748 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2749 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2748, i32 0, i32 5
%.tmp2750 = load i32, i32* %.tmp2749
%.tmp2751 = add i32 %.tmp2750, 1
store i32 %.tmp2751, i32* %.tmp2747
%.tmp2752 = load i32, i32* %uid.2745
ret i32 %.tmp2752
}
define %m2503$.CompilerCtx.type* @m295$new_context.m2503$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2753 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* null, i32 1
%.tmp2754 = ptrtoint %m2503$.CompilerCtx.type* %.tmp2753 to i32
%.tmp2755 = call i8*(i32) @malloc(i32 %.tmp2754)
%.tmp2756 = bitcast i8* %.tmp2755 to %m2503$.CompilerCtx.type*
%ctx.2757 = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.tmp2756, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2758 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2759 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2758, i32 0, i32 1
%.tmp2760 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2760, %m0$.File.type** %.tmp2759
%.tmp2761 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2762 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2761, i32 0, i32 0
%.tmp2763 = bitcast ptr null to %m878$.Node.type*
store %m878$.Node.type* %.tmp2763, %m878$.Node.type** %.tmp2762
%.tmp2764 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2765 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2764, i32 0, i32 2
store %m2503$.ErrorList.type* null, %m2503$.ErrorList.type** %.tmp2765
%.tmp2766 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2767 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2766, i32 0, i32 5
store i32 0, i32* %.tmp2767
%.tmp2768 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2769 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2768, i32 0, i32 3
store %m2503$.GlobalName.type* null, %m2503$.GlobalName.type** %.tmp2769
%.tmp2770 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2771 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2770, i32 0, i32 8
store %m2503$.AnonFn.type* null, %m2503$.AnonFn.type** %.tmp2771
%.tmp2772 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2773 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2772, i32 0, i32 7
%.tmp2774 = load i8*, i8** %filename
store i8* %.tmp2774, i8** %.tmp2773
%.tmp2775 = call i8*() @m2051$grammar.cp()
%.tmp2776 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2775)
%grammar_file.2777 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2776, %m0$.File.type** %grammar_file.2777
%.tmp2778 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2777
%.tmp2779 = icmp eq %m0$.File.type* %.tmp2778, null
br i1 %.tmp2779, label %.if.true.2780, label %.if.false.2780
.if.true.2780:
%.tmp2781 = bitcast ptr null to %m2503$.CompilerCtx.type*
ret %m2503$.CompilerCtx.type* %.tmp2781
br label %.if.end.2780
.if.false.2780:
br label %.if.end.2780
.if.end.2780:
%.tmp2782 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2777
%.tmp2783 = call %m878$.ParsingContext.type*(%m0$.File.type*) @m878$new_context.m878$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2782)
%grammar_ctx.2784 = alloca %m878$.ParsingContext.type*
store %m878$.ParsingContext.type* %.tmp2783, %m878$.ParsingContext.type** %grammar_ctx.2784
%.tmp2785 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2777
%.tmp2786 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp2785)
%.tmp2787 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2788 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2787, i32 0, i32 4
%.tmp2789 = load %m878$.ParsingContext.type*, %m878$.ParsingContext.type** %grammar_ctx.2784
%.tmp2790 = call %m878$.Rule.type**(%m878$.ParsingContext.type*) @m878$parse_grammar.m878$.Rule.typepp.m878$.ParsingContext.typep(%m878$.ParsingContext.type* %.tmp2789)
store %m878$.Rule.type** %.tmp2790, %m878$.Rule.type*** %.tmp2788
%.tmp2791 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2792 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2791, i32 0, i32 6
%.tmp2793 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* null, i32 1
%.tmp2794 = ptrtoint %m2503$.ModuleLookup.type* %.tmp2793 to i32
%.tmp2795 = call i8*(i32) @malloc(i32 %.tmp2794)
%.tmp2796 = bitcast i8* %.tmp2795 to %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp2796, %m2503$.ModuleLookup.type** %.tmp2792
%.tmp2797 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2798 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2797, i32 0, i32 6
%.tmp2799 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp2798
%.tmp2800 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2799, i32 0, i32 0
%.tmp2801 = load i8*, i8** %filename
store i8* %.tmp2801, i8** %.tmp2800
%.tmp2802 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2803 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2802, i32 0, i32 6
%.tmp2804 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp2803
%.tmp2805 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2804, i32 0, i32 3
store %m2503$.Scope.type* null, %m2503$.Scope.type** %.tmp2805
%.tmp2806 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2807 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2806, i32 0, i32 6
%.tmp2808 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp2807
%.tmp2809 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2808, i32 0, i32 1
%.tmp2811 = getelementptr [1 x i8], [1 x i8]*@.str2810, i32 0, i32 0
store i8* %.tmp2811, i8** %.tmp2809
%.tmp2812 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2813 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2812, i32 0, i32 6
%.tmp2814 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp2813
%.tmp2815 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2814, i32 0, i32 2
store %m2503$.ModuleLookup.type* null, %m2503$.ModuleLookup.type** %.tmp2815
%.tmp2816 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx.2757
%.tmp2817 = bitcast %m2503$.CompilerCtx.type* %.tmp2816 to %m2503$.CompilerCtx.type*
ret %m2503$.CompilerCtx.type* %.tmp2817
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
%.tmp2818 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* null, i32 1
%.tmp2819 = ptrtoint %m2503$.Scope.type* %.tmp2818 to i32
%.tmp2820 = call i8*(i32) @malloc(i32 %.tmp2819)
%.tmp2821 = bitcast i8* %.tmp2820 to %m2503$.Scope.type*
%s.2822 = alloca %m2503$.Scope.type*
store %m2503$.Scope.type* %.tmp2821, %m2503$.Scope.type** %s.2822
%.tmp2823 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2824 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp2823)
%m.2825 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp2824, %m2503$.ModuleLookup.type** %m.2825
%.tmp2826 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.2822
%.tmp2827 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp2826, i32 0, i32 5
%.tmp2828 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2825
%.tmp2829 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2828, i32 0, i32 3
%.tmp2830 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp2829
store %m2503$.Scope.type* %.tmp2830, %m2503$.Scope.type** %.tmp2827
%.tmp2831 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.2822
%.tmp2832 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp2831, i32 0, i32 1
store %m2503$.ScopeItem.type* null, %m2503$.ScopeItem.type** %.tmp2832
%.tmp2833 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.2822
%.tmp2834 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp2833, i32 0, i32 2
%.tmp2835 = load i8*, i8** %type
store i8* %.tmp2835, i8** %.tmp2834
%.tmp2836 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.2822
%.tmp2837 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp2836, i32 0, i32 3
%.tmp2838 = load i8*, i8** %begin_id
store i8* %.tmp2838, i8** %.tmp2837
%.tmp2839 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.2822
%.tmp2840 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp2839, i32 0, i32 4
%.tmp2841 = load i8*, i8** %end_id
store i8* %.tmp2841, i8** %.tmp2840
%.tmp2842 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2825
%.tmp2843 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2842, i32 0, i32 3
%.tmp2844 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.2822
store %m2503$.Scope.type* %.tmp2844, %m2503$.Scope.type** %.tmp2843
ret void
}
define void @m295$pop_scope.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%.tmp2845 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2846 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp2845)
%m.2847 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp2846, %m2503$.ModuleLookup.type** %m.2847
%.tmp2848 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2847
%.tmp2849 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2848, i32 0, i32 3
%.tmp2850 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp2849
%.tmp2851 = icmp ne %m2503$.Scope.type* %.tmp2850, null
%.tmp2853 = getelementptr [61 x i8], [61 x i8]*@.str2852, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2851, i8* %.tmp2853)
%.tmp2854 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2847
%.tmp2855 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2854, i32 0, i32 3
%.tmp2856 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.2847
%.tmp2857 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp2856, i32 0, i32 3
%.tmp2858 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp2857
%.tmp2859 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp2858, i32 0, i32 5
%.tmp2860 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp2859
store %m2503$.Scope.type* %.tmp2860, %m2503$.Scope.type** %.tmp2855
ret void
}
define i1 @m295$compile_file.b.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2861 = call i8*() @m2051$grammar.cp()
%.tmp2862 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2861)
%grammar_file.2863 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2862, %m0$.File.type** %grammar_file.2863
%.tmp2864 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2863
%.tmp2865 = icmp eq %m0$.File.type* %.tmp2864, null
br i1 %.tmp2865, label %.if.true.2866, label %.if.false.2866
.if.true.2866:
ret i1 0
br label %.if.end.2866
.if.false.2866:
br label %.if.end.2866
.if.end.2866:
%.tmp2867 = load i8*, i8** %filepath
%.tmp2868 = load i32, i32* @O_RDONLY
%.tmp2869 = call i32(i8*,i32) @open(i8* %.tmp2867, i32 %.tmp2868)
%input_fd.2870 = alloca i32
store i32 %.tmp2869, i32* %input_fd.2870
%.tmp2871 = load i32, i32* %input_fd.2870
%.tmp2872 = icmp sle i32 %.tmp2871, 0
br i1 %.tmp2872, label %.if.true.2873, label %.if.false.2873
.if.true.2873:
%err_msg.2874 = alloca i8*
store i8* null, i8** %err_msg.2874
%.tmp2875 = getelementptr i8*, i8** %err_msg.2874, i32 0
%.tmp2877 = getelementptr [26 x i8], [26 x i8]*@.str2876, i32 0, i32 0
%.tmp2878 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp2879 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2875, i8* %.tmp2877, %m878$.Node.type* %.tmp2878)
%.tmp2880 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2881 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp2882 = load i8*, i8** %err_msg.2874
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp2880, %m878$.Node.type* %.tmp2881, i8* %.tmp2882)
ret i1 0
br label %.if.end.2873
.if.false.2873:
br label %.if.end.2873
.if.end.2873:
%.tmp2883 = load i32, i32* %input_fd.2870
%.tmp2884 = call %m298$.PeekerInfo.type*(i32) @m298$new.m298$.PeekerInfo.typep.i(i32 %.tmp2883)
%p.2885 = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.tmp2884, %m298$.PeekerInfo.type** %p.2885
%.tmp2886 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.2885
%.tmp2887 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp2886, i32 0, i32 6
%.tmp2888 = load i8*, i8** %filepath
store i8* %.tmp2888, i8** %.tmp2887
%.tmp2889 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.2885
%.tmp2890 = call %m297$.Token.type*(%m298$.PeekerInfo.type*,i1) @m297$tokenize.m297$.Token.typep.m298$.PeekerInfo.typep.b(%m298$.PeekerInfo.type* %.tmp2889, i1 0)
%tokens.2891 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp2890, %m297$.Token.type** %tokens.2891
%.tmp2892 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2893 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2892, i32 0, i32 4
%.tmp2894 = load %m878$.Rule.type**, %m878$.Rule.type*** %.tmp2893
%.tmp2896 = getelementptr [6 x i8], [6 x i8]*@.str2895, i32 0, i32 0
%.tmp2897 = load %m297$.Token.type*, %m297$.Token.type** %tokens.2891
%.tmp2898 = call %m878$.ParseResult.type*(%m878$.Rule.type**,i8*,%m297$.Token.type*) @m878$ast.m878$.ParseResult.typep.m878$.Rule.typepp.cp.m297$.Token.typep(%m878$.Rule.type** %.tmp2894, i8* %.tmp2896, %m297$.Token.type* %.tmp2897)
%ast.2899 = alloca %m878$.ParseResult.type*
store %m878$.ParseResult.type* %.tmp2898, %m878$.ParseResult.type** %ast.2899
%.tmp2900 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %ast.2899
%.tmp2901 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp2900, i32 0, i32 0
%.tmp2902 = load %m296$.Error.type*, %m296$.Error.type** %.tmp2901
%.tmp2903 = icmp ne %m296$.Error.type* %.tmp2902, null
br i1 %.tmp2903, label %.if.true.2904, label %.if.false.2904
.if.true.2904:
%.tmp2905 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2906 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %ast.2899
%.tmp2907 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp2906, i32 0, i32 0
%.tmp2908 = load %m296$.Error.type*, %m296$.Error.type** %.tmp2907
call void(%m2503$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2503$.CompilerCtx.typep.m296$.Error.typep(%m2503$.CompilerCtx.type* %.tmp2905, %m296$.Error.type* %.tmp2908)
br label %.if.end.2904
.if.false.2904:
br label %.if.end.2904
.if.end.2904:
%.tmp2909 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2910 = load %m878$.ParseResult.type*, %m878$.ParseResult.type** %ast.2899
%.tmp2911 = getelementptr %m878$.ParseResult.type, %m878$.ParseResult.type* %.tmp2910, i32 0, i32 1
%.tmp2912 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2911
%.tmp2913 = call i1(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile.b.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp2909, %m878$.Node.type* %.tmp2912)
ret i1 %.tmp2913
}
define i1 @m295$compile.b.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.ast.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%ast = alloca %m878$.Node.type*
store %m878$.Node.type* %.ast.arg, %m878$.Node.type** %ast
%.tmp2914 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2915 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2914, i32 0, i32 2
%.tmp2916 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp2915
%.tmp2917 = icmp eq %m2503$.ErrorList.type* %.tmp2916, null
br i1 %.tmp2917, label %.if.true.2918, label %.if.false.2918
.if.true.2918:
%.tmp2919 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2920 = load %m878$.Node.type*, %m878$.Node.type** %ast
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_ast.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp2919, %m878$.Node.type* %.tmp2920)
br label %.if.end.2918
.if.false.2918:
br label %.if.end.2918
.if.end.2918:
%.tmp2921 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2922 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2921, i32 0, i32 2
%.tmp2923 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp2922
%.tmp2924 = icmp ne %m2503$.ErrorList.type* %.tmp2923, null
br i1 %.tmp2924, label %.if.true.2925, label %.if.false.2925
.if.true.2925:
%.tmp2927 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2928 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2927, i32 0, i32 2
%.tmp2929 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp2928
%err.2930 = alloca %m2503$.ErrorList.type*
store %m2503$.ErrorList.type* %.tmp2929, %m2503$.ErrorList.type** %err.2930
br label %.for.start.2926
.for.start.2926:
%.tmp2931 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %err.2930
%.tmp2932 = icmp ne %m2503$.ErrorList.type* %.tmp2931, null
br i1 %.tmp2932, label %.for.continue.2926, label %.for.end.2926
.for.continue.2926:
%.tmp2933 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %err.2930
%.tmp2934 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp2933, i32 0, i32 2
%.tmp2935 = load i1, i1* %.tmp2934
%.tmp2936 = icmp eq i1 %.tmp2935, 0
br i1 %.tmp2936, label %.if.true.2937, label %.if.false.2937
.if.true.2937:
%.tmp2938 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %err.2930
%.tmp2939 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp2938, i32 0, i32 0
%.tmp2940 = load %m296$.Error.type*, %m296$.Error.type** %.tmp2939
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp2940)
%.tmp2941 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %err.2930
%.tmp2942 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp2941, i32 0, i32 2
store i1 1, i1* %.tmp2942
br label %.if.end.2937
.if.false.2937:
br label %.if.end.2937
.if.end.2937:
%.tmp2943 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %err.2930
%.tmp2944 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp2943, i32 0, i32 1
%.tmp2945 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp2944
store %m2503$.ErrorList.type* %.tmp2945, %m2503$.ErrorList.type** %err.2930
br label %.for.start.2926
.for.end.2926:
ret i1 1
br label %.if.end.2925
.if.false.2925:
br label %.if.end.2925
.if.end.2925:
ret i1 0
}
define void @m295$mark_weak_global.v.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2947 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2948 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp2947, i32 0, i32 3
%.tmp2949 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp2948
%g.2950 = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.tmp2949, %m2503$.GlobalName.type** %g.2950
br label %.for.start.2946
.for.start.2946:
%.tmp2951 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.2950
%.tmp2952 = icmp ne %m2503$.GlobalName.type* %.tmp2951, null
br i1 %.tmp2952, label %.for.continue.2946, label %.for.end.2946
.for.continue.2946:
%.tmp2953 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.2950
%.tmp2954 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp2953, i32 0, i32 3
%.tmp2955 = load i1, i1* %.tmp2954
%.tmp2956 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.2950
%.tmp2957 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp2956, i32 0, i32 0
%.tmp2958 = load i8*, i8** %.tmp2957
%.tmp2959 = load i8*, i8** %id
%.tmp2960 = call i32(i8*,i8*) @strcmp(i8* %.tmp2958, i8* %.tmp2959)
%.tmp2961 = icmp eq i32 %.tmp2960, 0
%.tmp2962 = and i1 %.tmp2955, %.tmp2961
br i1 %.tmp2962, label %.if.true.2963, label %.if.false.2963
.if.true.2963:
%.tmp2964 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.2950
%.tmp2965 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp2964, i32 0, i32 2
store i1 1, i1* %.tmp2965
br label %.for.end.2946
br label %.if.end.2963
.if.false.2963:
br label %.if.end.2963
.if.end.2963:
%.tmp2966 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.2950
%.tmp2967 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp2966, i32 0, i32 5
%.tmp2968 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp2967
store %m2503$.GlobalName.type* %.tmp2968, %m2503$.GlobalName.type** %g.2950
br label %.for.start.2946
.for.end.2946:
ret void
}
define void @m295$compile_ast.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.ast.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%ast = alloca %m878$.Node.type*
store %m878$.Node.type* %.ast.arg, %m878$.Node.type** %ast
%.tmp2969 = load %m878$.Node.type*, %m878$.Node.type** %ast
%.tmp2970 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2969, i32 0, i32 0
%.tmp2971 = load i8*, i8** %.tmp2970
%.tmp2973 = getelementptr [6 x i8], [6 x i8]*@.str2972, i32 0, i32 0
%.tmp2974 = call i32(i8*,i8*) @strcmp(i8* %.tmp2971, i8* %.tmp2973)
%.tmp2975 = icmp ne i32 %.tmp2974, 0
br i1 %.tmp2975, label %.if.true.2976, label %.if.false.2976
.if.true.2976:
%.tmp2977 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2978 = load %m878$.Node.type*, %m878$.Node.type** %ast
%.tmp2980 = getelementptr [29 x i8], [29 x i8]*@.str2979, i32 0, i32 0
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp2977, %m878$.Node.type* %.tmp2978, i8* %.tmp2980)
ret void
br label %.if.end.2976
.if.false.2976:
br label %.if.end.2976
.if.end.2976:
%.tmp2981 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp2983 = getelementptr [7 x i8], [7 x i8]*@.str2982, i32 0, i32 0
%.tmp2984 = bitcast ptr null to i8*
%.tmp2985 = bitcast ptr null to i8*
call void(%m2503$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2503$.CompilerCtx.typep.cp.cp.cp(%m2503$.CompilerCtx.type* %.tmp2981, i8* %.tmp2983, i8* %.tmp2984, i8* %.tmp2985)
%.tmp2986 = load %m878$.Node.type*, %m878$.Node.type** %ast
%.tmp2987 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2986, i32 0, i32 6
%.tmp2988 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2987
%start.2989 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp2988, %m878$.Node.type** %start.2989
%.tmp2990 = load %m878$.Node.type*, %m878$.Node.type** %start.2989
%.tmp2991 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2990, i32 0, i32 0
%.tmp2992 = load i8*, i8** %.tmp2991
%.tmp2994 = getelementptr [13 x i8], [13 x i8]*@.str2993, i32 0, i32 0
%.tmp2995 = call i32(i8*,i8*) @strcmp(i8* %.tmp2992, i8* %.tmp2994)
%.tmp2996 = icmp eq i32 %.tmp2995, 0
br i1 %.tmp2996, label %.if.true.2997, label %.if.false.2997
.if.true.2997:
%.tmp2998 = load %m878$.Node.type*, %m878$.Node.type** %start.2989
%.tmp2999 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp2998, i32 0, i32 7
%.tmp3000 = load %m878$.Node.type*, %m878$.Node.type** %.tmp2999
store %m878$.Node.type* %.tmp3000, %m878$.Node.type** %start.2989
br label %.if.end.2997
.if.false.2997:
br label %.if.end.2997
.if.end.2997:
%.tmp3002 = load %m878$.Node.type*, %m878$.Node.type** %start.2989
%stmt.3003 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3002, %m878$.Node.type** %stmt.3003
br label %.for.start.3001
.for.start.3001:
%.tmp3004 = load %m878$.Node.type*, %m878$.Node.type** %stmt.3003
%.tmp3005 = icmp ne %m878$.Node.type* %.tmp3004, null
br i1 %.tmp3005, label %.for.continue.3001, label %.for.end.3001
.for.continue.3001:
%.tmp3006 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3007 = load %m878$.Node.type*, %m878$.Node.type** %stmt.3003
%.tmp3008 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3007, i32 0, i32 6
%.tmp3009 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3008
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i1) @m295$compile_statement.v.m2503$.CompilerCtx.typep.m878$.Node.typep.b(%m2503$.CompilerCtx.type* %.tmp3006, %m878$.Node.type* %.tmp3009, i1 1)
%.tmp3010 = load %m878$.Node.type*, %m878$.Node.type** %stmt.3003
%.tmp3011 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3010, i32 0, i32 7
%.tmp3012 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3011
store %m878$.Node.type* %.tmp3012, %m878$.Node.type** %stmt.3003
br label %.for.start.3001
.for.end.3001:
%.tmp3014 = load %m878$.Node.type*, %m878$.Node.type** %start.2989
%s.3015 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3014, %m878$.Node.type** %s.3015
br label %.for.start.3013
.for.start.3013:
%.tmp3016 = load %m878$.Node.type*, %m878$.Node.type** %s.3015
%.tmp3017 = icmp ne %m878$.Node.type* %.tmp3016, null
br i1 %.tmp3017, label %.for.continue.3013, label %.for.end.3013
.for.continue.3013:
%.tmp3018 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3019 = load %m878$.Node.type*, %m878$.Node.type** %s.3015
%.tmp3020 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3019, i32 0, i32 6
%.tmp3021 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3020
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i1) @m295$compile_statement.v.m2503$.CompilerCtx.typep.m878$.Node.typep.b(%m2503$.CompilerCtx.type* %.tmp3018, %m878$.Node.type* %.tmp3021, i1 0)
%.tmp3022 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
call void(%m2503$.CompilerCtx.type*) @m295$compile_anon_fn.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3022)
%.tmp3023 = load %m878$.Node.type*, %m878$.Node.type** %s.3015
%.tmp3024 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3023, i32 0, i32 7
%.tmp3025 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3024
store %m878$.Node.type* %.tmp3025, %m878$.Node.type** %s.3015
br label %.for.start.3013
.for.end.3013:
%.tmp3026 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3027 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3026)
%mod.3028 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp3027, %m2503$.ModuleLookup.type** %mod.3028
%.tmp3029 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3028
%.tmp3030 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3029, i32 0, i32 1
%.tmp3031 = load i8*, i8** %.tmp3030
%.tmp3033 = getelementptr [1 x i8], [1 x i8]*@.str3032, i32 0, i32 0
%.tmp3034 = call i32(i8*,i8*) @strcmp(i8* %.tmp3031, i8* %.tmp3033)
%.tmp3035 = icmp eq i32 %.tmp3034, 0
br i1 %.tmp3035, label %.if.true.3036, label %.if.false.3036
.if.true.3036:
%.tmp3038 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3039 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3038, i32 0, i32 3
%.tmp3040 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp3039
%g.3041 = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.tmp3040, %m2503$.GlobalName.type** %g.3041
br label %.for.start.3037
.for.start.3037:
%.tmp3042 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.3041
%.tmp3043 = icmp ne %m2503$.GlobalName.type* %.tmp3042, null
br i1 %.tmp3043, label %.for.continue.3037, label %.for.end.3037
.for.continue.3037:
%.tmp3044 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3045 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.3041
call void(%m2503$.CompilerCtx.type*,%m2503$.GlobalName.type*) @m295$compile_global.v.m2503$.CompilerCtx.typep.m2503$.GlobalName.typep(%m2503$.CompilerCtx.type* %.tmp3044, %m2503$.GlobalName.type* %.tmp3045)
%.tmp3046 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g.3041
%.tmp3047 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3046, i32 0, i32 5
%.tmp3048 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp3047
store %m2503$.GlobalName.type* %.tmp3048, %m2503$.GlobalName.type** %g.3041
br label %.for.start.3037
.for.end.3037:
br label %.if.end.3036
.if.false.3036:
br label %.if.end.3036
.if.end.3036:
ret void
}
define void @m295$compile_global.v.m2503$.CompilerCtx.typep.m2503$.GlobalName.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%g = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.g.arg, %m2503$.GlobalName.type** %g
%.tmp3049 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3050 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3049, i32 0, i32 2
%.tmp3051 = load i1, i1* %.tmp3050
br i1 %.tmp3051, label %.if.true.3052, label %.if.false.3052
.if.true.3052:
ret void
br label %.if.end.3052
.if.false.3052:
br label %.if.end.3052
.if.end.3052:
%.tmp3053 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3054 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3053, i32 0, i32 1
%.tmp3055 = load i8*, i8** %.tmp3054
%.tmp3057 = getelementptr [7 x i8], [7 x i8]*@.str3056, i32 0, i32 0
%.tmp3058 = call i32(i8*,i8*) @strcmp(i8* %.tmp3055, i8* %.tmp3057)
%.tmp3059 = icmp eq i32 %.tmp3058, 0
br i1 %.tmp3059, label %.if.true.3060, label %.if.false.3060
.if.true.3060:
%.tmp3061 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3062 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3061, i32 0, i32 1
%.tmp3063 = load %m0$.File.type*, %m0$.File.type** %.tmp3062
%.tmp3065 = getelementptr [21 x i8], [21 x i8]*@.str3064, i32 0, i32 0
%.tmp3066 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3067 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3066, i32 0, i32 4
%.tmp3068 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp3067
%.tmp3069 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3068)
%.tmp3070 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3071 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3072 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3071, i32 0, i32 4
%.tmp3073 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp3072
%.tmp3074 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3073, i32 0, i32 4
%.tmp3075 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3074
%.tmp3076 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3070, %m2503$.Type.type* %.tmp3075)
%.tmp3077 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3078 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3077, i32 0, i32 0
%.tmp3079 = load i8*, i8** %.tmp3078
%.tmp3080 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3063, i8* %.tmp3065, i8* %.tmp3069, i8* %.tmp3076, i8* %.tmp3079)
br label %.if.end.3060
.if.false.3060:
%.tmp3081 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3082 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3081, i32 0, i32 1
%.tmp3083 = load i8*, i8** %.tmp3082
%.tmp3085 = getelementptr [7 x i8], [7 x i8]*@.str3084, i32 0, i32 0
%.tmp3086 = call i32(i8*,i8*) @strcmp(i8* %.tmp3083, i8* %.tmp3085)
%.tmp3087 = icmp eq i32 %.tmp3086, 0
br i1 %.tmp3087, label %.if.true.3088, label %.if.false.3088
.if.true.3088:
%.tmp3089 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3090 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3091 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3090, i32 0, i32 4
%.tmp3092 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp3091
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$compile_extern.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3089, %m2503$.AssignableInfo.type* %.tmp3092)
br label %.if.end.3088
.if.false.3088:
br label %.if.end.3088
.if.end.3088:
br label %.if.end.3060
.if.end.3060:
%.tmp3093 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp3094 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp3093, i32 0, i32 2
store i1 1, i1* %.tmp3094
ret void
}
define void @m295$compile_extern.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%info = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.info.arg, %m2503$.AssignableInfo.type** %info
%.tmp3095 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3096 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3095, i32 0, i32 1
%.tmp3097 = load %m0$.File.type*, %m0$.File.type** %.tmp3096
%.tmp3099 = getelementptr [15 x i8], [15 x i8]*@.str3098, i32 0, i32 0
%.tmp3100 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3101 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp3102 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3101, i32 0, i32 4
%.tmp3103 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3102
%.tmp3104 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3103, i32 0, i32 3
%.tmp3105 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3104
%.tmp3106 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3100, %m2503$.Type.type* %.tmp3105)
%.tmp3107 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp3108 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3107)
%.tmp3109 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3097, i8* %.tmp3099, i8* %.tmp3106, i8* %.tmp3108)
%.tmp3111 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp3112 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3111, i32 0, i32 4
%.tmp3113 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3112
%.tmp3114 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3113, i32 0, i32 3
%.tmp3115 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3114
%.tmp3116 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3115, i32 0, i32 4
%.tmp3117 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3116
%pt.3118 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp3117, %m2503$.Type.type** %pt.3118
br label %.for.start.3110
.for.start.3110:
%.tmp3119 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.3118
%.tmp3120 = icmp ne %m2503$.Type.type* %.tmp3119, null
br i1 %.tmp3120, label %.for.continue.3110, label %.for.end.3110
.for.continue.3110:
%.tmp3121 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.3118
%.tmp3122 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp3123 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3122, i32 0, i32 4
%.tmp3124 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3123
%.tmp3125 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3124, i32 0, i32 3
%.tmp3126 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3125
%.tmp3127 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3126, i32 0, i32 4
%.tmp3128 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3127
%.tmp3129 = icmp ne %m2503$.Type.type* %.tmp3121, %.tmp3128
br i1 %.tmp3129, label %.if.true.3130, label %.if.false.3130
.if.true.3130:
%.tmp3131 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3132 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3131, i32 0, i32 1
%.tmp3133 = load %m0$.File.type*, %m0$.File.type** %.tmp3132
%.tmp3135 = getelementptr [3 x i8], [3 x i8]*@.str3134, i32 0, i32 0
%.tmp3136 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3133, i8* %.tmp3135)
br label %.if.end.3130
.if.false.3130:
br label %.if.end.3130
.if.end.3130:
%.tmp3137 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3138 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3137, i32 0, i32 1
%.tmp3139 = load %m0$.File.type*, %m0$.File.type** %.tmp3138
%.tmp3141 = getelementptr [3 x i8], [3 x i8]*@.str3140, i32 0, i32 0
%.tmp3142 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3143 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.3118
%.tmp3144 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3142, %m2503$.Type.type* %.tmp3143)
%.tmp3145 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3139, i8* %.tmp3141, i8* %.tmp3144)
%.tmp3146 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.3118
%.tmp3147 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3146, i32 0, i32 4
%.tmp3148 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3147
store %m2503$.Type.type* %.tmp3148, %m2503$.Type.type** %pt.3118
br label %.for.start.3110
.for.end.3110:
%.tmp3149 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3150 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3149, i32 0, i32 1
%.tmp3151 = load %m0$.File.type*, %m0$.File.type** %.tmp3150
%.tmp3153 = getelementptr [3 x i8], [3 x i8]*@.str3152, i32 0, i32 0
%.tmp3154 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3151, i8* %.tmp3153)
ret void
}
define i8* @m295$get_mod_prefix.cp.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3155 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3156 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3155)
%m.3157 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp3156, %m2503$.ModuleLookup.type** %m.3157
%.tmp3158 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3157
%.tmp3159 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3158, i32 0, i32 1
%.tmp3160 = load i8*, i8** %.tmp3159
ret i8* %.tmp3160
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
%mangled_name.3161 = alloca i8*
store i8* null, i8** %mangled_name.3161
%.tmp3162 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3163 = load %m878$.Node.type*, %m878$.Node.type** %fn
%.tmp3164 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3163, i32 0, i32 2
%.tmp3165 = load i8*, i8** %.tmp3164
%.tmp3166 = call i8*(%m2503$.CompilerCtx.type*,i8*) @m295$get_mod_prefix.cp.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.tmp3162, i8* %.tmp3165)
%prefix.3167 = alloca i8*
store i8* %.tmp3166, i8** %prefix.3167
%.tmp3168 = getelementptr i8*, i8** %mangled_name.3161, i32 0
%.tmp3170 = getelementptr [5 x i8], [5 x i8]*@.str3169, i32 0, i32 0
%.tmp3171 = load i8*, i8** %prefix.3167
%.tmp3172 = load i8*, i8** %original_name
%.tmp3173 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3168, i8* %.tmp3170, i8* %.tmp3171, i8* %.tmp3172)
%.tmp3174 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp3175 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3174, i32 0, i32 0
%.tmp3176 = load i8*, i8** %.tmp3175
%.tmp3178 = getelementptr [9 x i8], [9 x i8]*@.str3177, i32 0, i32 0
%.tmp3179 = call i32(i8*,i8*) @strcmp(i8* %.tmp3176, i8* %.tmp3178)
%.tmp3180 = icmp eq i32 %.tmp3179, 0
br i1 %.tmp3180, label %.if.true.3181, label %.if.false.3181
.if.true.3181:
%.tmp3182 = load i8*, i8** %mangled_name.3161
%.tmp3184 = getelementptr [5 x i8], [5 x i8]*@.str3183, i32 0, i32 0
%.tmp3185 = call i32(i8*,i8*) @strcmp(i8* %.tmp3182, i8* %.tmp3184)
%.tmp3186 = icmp ne i32 %.tmp3185, 0
br i1 %.tmp3186, label %.if.true.3187, label %.if.false.3187
.if.true.3187:
%tmp_buff.3188 = alloca i8*
store i8* null, i8** %tmp_buff.3188
%swap_var.3189 = alloca i8*
store i8* null, i8** %swap_var.3189
%.tmp3191 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp3192 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3191, i32 0, i32 3
%.tmp3193 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3192
%tp.3194 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp3193, %m2503$.Type.type** %tp.3194
br label %.for.start.3190
.for.start.3190:
%.tmp3195 = load %m2503$.Type.type*, %m2503$.Type.type** %tp.3194
%.tmp3196 = icmp ne %m2503$.Type.type* %.tmp3195, null
br i1 %.tmp3196, label %.for.continue.3190, label %.for.end.3190
.for.continue.3190:
%.tmp3197 = getelementptr i8*, i8** %tmp_buff.3188, i32 0
%.tmp3199 = getelementptr [6 x i8], [6 x i8]*@.str3198, i32 0, i32 0
%.tmp3200 = load i8*, i8** %mangled_name.3161
%.tmp3201 = load %m2503$.Type.type*, %m2503$.Type.type** %tp.3194
%.tmp3202 = call i8*(%m2503$.Type.type*) @m295$type_abbr.cp.m2503$.Type.typep(%m2503$.Type.type* %.tmp3201)
%.tmp3203 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3197, i8* %.tmp3199, i8* %.tmp3200, i8* %.tmp3202)
%.tmp3204 = load i8*, i8** %tmp_buff.3188
store i8* %.tmp3204, i8** %swap_var.3189
%.tmp3205 = load i8*, i8** %mangled_name.3161
store i8* %.tmp3205, i8** %tmp_buff.3188
%.tmp3206 = load i8*, i8** %swap_var.3189
store i8* %.tmp3206, i8** %mangled_name.3161
%.tmp3207 = load i8*, i8** %tmp_buff.3188
call void(i8*) @free(i8* %.tmp3207)
%.tmp3208 = load %m2503$.Type.type*, %m2503$.Type.type** %tp.3194
%.tmp3209 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3208, i32 0, i32 4
%.tmp3210 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3209
store %m2503$.Type.type* %.tmp3210, %m2503$.Type.type** %tp.3194
br label %.for.start.3190
.for.end.3190:
br label %.if.end.3187
.if.false.3187:
br label %.if.end.3187
.if.end.3187:
br label %.if.end.3181
.if.false.3181:
br label %.if.end.3181
.if.end.3181:
%.tmp3211 = load i8*, i8** %mangled_name.3161
ret i8* %.tmp3211
}
define void @m295$compile_statement.v.m2503$.CompilerCtx.typep.m878$.Node.typep.b(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3212 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* null, %m2503$.AssignableInfo.type** %info.3212
%return_type.3213 = alloca %m2503$.Type.type*
store %m2503$.Type.type* null, %m2503$.Type.type** %return_type.3213
%err_buf.3214 = alloca i8*
store i8* null, i8** %err_buf.3214
%tmp_buff.3215 = alloca i8*
store i8* null, i8** %tmp_buff.3215
%.tmp3216 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3217 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3216, i32 0, i32 0
%.tmp3218 = load i8*, i8** %.tmp3217
%.tmp3220 = getelementptr [3 x i8], [3 x i8]*@.str3219, i32 0, i32 0
%.tmp3221 = call i32(i8*,i8*) @strcmp(i8* %.tmp3218, i8* %.tmp3220)
%.tmp3222 = icmp eq i32 %.tmp3221, 0
br i1 %.tmp3222, label %.if.true.3223, label %.if.false.3223
.if.true.3223:
ret void
br label %.if.end.3223
.if.false.3223:
%.tmp3224 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3225 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3224, i32 0, i32 0
%.tmp3226 = load i8*, i8** %.tmp3225
%.tmp3228 = getelementptr [7 x i8], [7 x i8]*@.str3227, i32 0, i32 0
%.tmp3229 = call i32(i8*,i8*) @strcmp(i8* %.tmp3226, i8* %.tmp3228)
%.tmp3230 = icmp eq i32 %.tmp3229, 0
br i1 %.tmp3230, label %.if.true.3231, label %.if.false.3231
.if.true.3231:
%.tmp3232 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3233 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3232, i32 0, i32 6
%.tmp3234 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3233
%.tmp3236 = getelementptr [11 x i8], [11 x i8]*@.str3235, i32 0, i32 0
%.tmp3237 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp3234, i8* %.tmp3236)
%assignable.3238 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3237, %m878$.Node.type** %assignable.3238
%.tmp3239 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3240 = load %m878$.Node.type*, %m878$.Node.type** %assignable.3238
%.tmp3241 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3239, %m878$.Node.type* %.tmp3240)
%a_info.3242 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp3241, %m2503$.AssignableInfo.type** %a_info.3242
%.tmp3243 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.3242
%.tmp3244 = icmp eq %m2503$.AssignableInfo.type* %.tmp3243, null
br i1 %.tmp3244, label %.if.true.3245, label %.if.false.3245
.if.true.3245:
ret void
br label %.if.end.3245
.if.false.3245:
br label %.if.end.3245
.if.end.3245:
%.tmp3246 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3247 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3246)
store %m2503$.AssignableInfo.type* %.tmp3247, %m2503$.AssignableInfo.type** %info.3212
%.tmp3248 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3249 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3248, i32 0, i32 6
%.tmp3250 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3249
%.tmp3251 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3250, i32 0, i32 7
%.tmp3252 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3251
%.tmp3253 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3252, i32 0, i32 1
%.tmp3254 = load i8*, i8** %.tmp3253
%global_name.3255 = alloca i8*
store i8* %.tmp3254, i8** %global_name.3255
%.tmp3256 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3257 = load i8, i8* @SCOPE_GLOBAL
%.tmp3258 = load i8*, i8** %global_name.3255
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp3256, i8 %.tmp3257, i8* %.tmp3258)
%.tmp3259 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3260 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3259, i32 0, i32 4
%.tmp3261 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.3242
%.tmp3262 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3261, i32 0, i32 4
%.tmp3263 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3262
store %m2503$.Type.type* %.tmp3263, %m2503$.Type.type** %.tmp3260
%.tmp3264 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3265 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3264, i32 0, i32 3
%.tmp3267 = getelementptr [9 x i8], [9 x i8]*@.str3266, i32 0, i32 0
store i8* %.tmp3267, i8** %.tmp3265
%.tmp3268 = load i1, i1* %shallow
%.tmp3269 = icmp eq i1 %.tmp3268, 1
br i1 %.tmp3269, label %.if.true.3270, label %.if.false.3270
.if.true.3270:
%.tmp3271 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3272 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3273 = load i8*, i8** %global_name.3255
%.tmp3274 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3271, %m878$.Node.type* %.tmp3272, i8* %.tmp3273, %m2503$.AssignableInfo.type* %.tmp3274)
br label %.if.end.3270
.if.false.3270:
%.tmp3275 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3276 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3275, i32 0, i32 1
%.tmp3277 = load %m0$.File.type*, %m0$.File.type** %.tmp3276
%.tmp3279 = getelementptr [21 x i8], [21 x i8]*@.str3278, i32 0, i32 0
%.tmp3280 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3281 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3280)
%.tmp3282 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3283 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3284 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3283, i32 0, i32 4
%.tmp3285 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3284
%.tmp3286 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3282, %m2503$.Type.type* %.tmp3285)
%.tmp3287 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.3242
%.tmp3288 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3287)
%.tmp3289 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3277, i8* %.tmp3279, i8* %.tmp3281, i8* %.tmp3286, i8* %.tmp3288)
br label %.if.end.3270
.if.end.3270:
br label %.if.end.3231
.if.false.3231:
%.tmp3290 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3291 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3290, i32 0, i32 0
%.tmp3292 = load i8*, i8** %.tmp3291
%.tmp3294 = getelementptr [10 x i8], [10 x i8]*@.str3293, i32 0, i32 0
%.tmp3295 = call i32(i8*,i8*) @strcmp(i8* %.tmp3292, i8* %.tmp3294)
%.tmp3296 = icmp eq i32 %.tmp3295, 0
br i1 %.tmp3296, label %.if.true.3297, label %.if.false.3297
.if.true.3297:
%.tmp3298 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3299 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3298, i32 0, i32 6
%.tmp3300 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3299
%.tmp3301 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3300, i32 0, i32 7
%.tmp3302 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3301
%.tmp3303 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3302, i32 0, i32 1
%.tmp3304 = load i8*, i8** %.tmp3303
%type_name.3305 = alloca i8*
store i8* %.tmp3304, i8** %type_name.3305
%.tmp3306 = load i1, i1* %shallow
%.tmp3307 = icmp eq i1 %.tmp3306, 1
br i1 %.tmp3307, label %.if.true.3308, label %.if.false.3308
.if.true.3308:
%.tmp3309 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3310 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3309)
store %m2503$.AssignableInfo.type* %.tmp3310, %m2503$.AssignableInfo.type** %info.3212
%.tmp3311 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3312 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3311)
%mod_from.3313 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp3312, %m2503$.ModuleLookup.type** %mod_from.3313
%.tmp3314 = getelementptr i8*, i8** %tmp_buff.3215, i32 0
%.tmp3316 = getelementptr [11 x i8], [11 x i8]*@.str3315, i32 0, i32 0
%.tmp3317 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod_from.3313
%.tmp3318 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3317, i32 0, i32 1
%.tmp3319 = load i8*, i8** %.tmp3318
%.tmp3320 = load i8*, i8** %type_name.3305
%.tmp3321 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3314, i8* %.tmp3316, i8* %.tmp3319, i8* %.tmp3320)
%.tmp3322 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3323 = load i8, i8* @SCOPE_LOCAL
%.tmp3324 = load i8*, i8** %tmp_buff.3215
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp3322, i8 %.tmp3323, i8* %.tmp3324)
%.tmp3325 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3326 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3325, i32 0, i32 3
%.tmp3328 = getelementptr [10 x i8], [10 x i8]*@.str3327, i32 0, i32 0
store i8* %.tmp3328, i8** %.tmp3326
%.tmp3329 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3330 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3329, i32 0, i32 5
%.tmp3331 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3332 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3331, i32 0, i32 3
%.tmp3333 = load i32, i32* %.tmp3332
store i32 %.tmp3333, i32* %.tmp3330
%.tmp3334 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3335 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3334, i32 0, i32 6
%.tmp3336 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3337 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3336, i32 0, i32 4
%.tmp3338 = load i32, i32* %.tmp3337
store i32 %.tmp3338, i32* %.tmp3335
%.tmp3339 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3340 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3339, i32 0, i32 4
%.tmp3341 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp3341, %m2503$.Type.type** %.tmp3340
%.tmp3342 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3343 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3344 = load i8*, i8** %type_name.3305
%.tmp3345 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3342, %m878$.Node.type* %.tmp3343, i8* %.tmp3344, %m2503$.AssignableInfo.type* %.tmp3345)
%.tmp3346 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3347 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3346, i32 0, i32 6
%.tmp3348 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3347
%.tmp3350 = getelementptr [5 x i8], [5 x i8]*@.str3349, i32 0, i32 0
%.tmp3351 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp3348, i8* %.tmp3350)
%type_decl.3352 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3351, %m878$.Node.type** %type_decl.3352
%.tmp3353 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3354 = load %m878$.Node.type*, %m878$.Node.type** %type_decl.3352
%.tmp3355 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3354, i32 0, i32 6
%.tmp3356 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3355
%.tmp3357 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3353, %m878$.Node.type* %.tmp3356)
%type_struct.3358 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp3357, %m2503$.Type.type** %type_struct.3358
%.tmp3359 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3360 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3359, i32 0, i32 4
%.tmp3361 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3360
%.tmp3362 = load %m2503$.Type.type*, %m2503$.Type.type** %type_struct.3358
call void(%m2503$.Type.type*,%m2503$.Type.type*) @m295$copy_type.v.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp3361, %m2503$.Type.type* %.tmp3362)
%.tmp3363 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3364 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3363, i32 0, i32 4
%.tmp3365 = load %m2503$.Type.type*, %m2503$.Type.type** %type_struct.3358
store %m2503$.Type.type* %.tmp3365, %m2503$.Type.type** %.tmp3364
br label %.if.end.3308
.if.false.3308:
%.tmp3366 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3367 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3368 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3367, i32 0, i32 7
%.tmp3369 = load i8*, i8** %.tmp3368
%.tmp3370 = load i8*, i8** %type_name.3305
%.tmp3371 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.cp(%m2503$.CompilerCtx.type* %.tmp3366, i8* %.tmp3369, i8* %.tmp3370)
%scope.3372 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp3371, %m2503$.ScopeItem.type** %scope.3372
%.tmp3373 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %scope.3372
%.tmp3374 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp3373, i32 0, i32 1
%.tmp3375 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp3374
store %m2503$.AssignableInfo.type* %.tmp3375, %m2503$.AssignableInfo.type** %info.3212
%.tmp3376 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3377 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3376, i32 0, i32 1
%.tmp3378 = load %m0$.File.type*, %m0$.File.type** %.tmp3377
%.tmp3380 = getelementptr [14 x i8], [14 x i8]*@.str3379, i32 0, i32 0
%.tmp3381 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3382 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3381)
%.tmp3383 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3384 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3385 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3384, i32 0, i32 4
%.tmp3386 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3385
%.tmp3387 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3383, %m2503$.Type.type* %.tmp3386)
%.tmp3388 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3378, i8* %.tmp3380, i8* %.tmp3382, i8* %.tmp3387)
br label %.if.end.3308
.if.end.3308:
br label %.if.end.3297
.if.false.3297:
%.tmp3389 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3390 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3389, i32 0, i32 0
%.tmp3391 = load i8*, i8** %.tmp3390
%.tmp3393 = getelementptr [7 x i8], [7 x i8]*@.str3392, i32 0, i32 0
%.tmp3394 = call i32(i8*,i8*) @strcmp(i8* %.tmp3391, i8* %.tmp3393)
%.tmp3395 = icmp eq i32 %.tmp3394, 0
br i1 %.tmp3395, label %.if.true.3396, label %.if.false.3396
.if.true.3396:
%.tmp3397 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3398 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3397)
store %m2503$.AssignableInfo.type* %.tmp3398, %m2503$.AssignableInfo.type** %info.3212
%.tmp3399 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3400 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3399, i32 0, i32 4
%.tmp3401 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3402 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3403 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3402, i32 0, i32 6
%.tmp3404 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3403
%.tmp3405 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3404, i32 0, i32 7
%.tmp3406 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3405
%.tmp3407 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$syn_function_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3401, %m878$.Node.type* %.tmp3406)
store %m2503$.Type.type* %.tmp3407, %m2503$.Type.type** %.tmp3400
%.tmp3408 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3409 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3408, i32 0, i32 3
%.tmp3411 = getelementptr [7 x i8], [7 x i8]*@.str3410, i32 0, i32 0
store i8* %.tmp3411, i8** %.tmp3409
%.tmp3412 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3413 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3412, i32 0, i32 6
%.tmp3414 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3413
%.tmp3415 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3414, i32 0, i32 7
%.tmp3416 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3415
%.tmp3417 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3416, i32 0, i32 7
%.tmp3418 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3417
%.tmp3419 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3418, i32 0, i32 1
%.tmp3420 = load i8*, i8** %.tmp3419
%fn_name.3421 = alloca i8*
store i8* %.tmp3420, i8** %fn_name.3421
%.tmp3422 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3423 = load i8, i8* @SCOPE_GLOBAL
%.tmp3424 = load i8*, i8** %fn_name.3421
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp3422, i8 %.tmp3423, i8* %.tmp3424)
%.tmp3425 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp3425, %m2503$.Type.type** %return_type.3213
%.tmp3426 = load %m2503$.Type.type*, %m2503$.Type.type** %return_type.3213
%.tmp3427 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3426, i32 0, i32 0
%.tmp3428 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3429 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3428, i32 0, i32 4
%.tmp3430 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3429
%.tmp3431 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3430, i32 0, i32 3
%.tmp3432 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3431
%.tmp3433 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3432, i32 0, i32 0
%.tmp3434 = load i8*, i8** %.tmp3433
store i8* %.tmp3434, i8** %.tmp3427
%.tmp3435 = load %m2503$.Type.type*, %m2503$.Type.type** %return_type.3213
%.tmp3436 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3435, i32 0, i32 3
%.tmp3437 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3438 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3437, i32 0, i32 4
%.tmp3439 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3438
%.tmp3440 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3439, i32 0, i32 3
%.tmp3441 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3440
%.tmp3442 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3441, i32 0, i32 3
%.tmp3443 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3442
store %m2503$.Type.type* %.tmp3443, %m2503$.Type.type** %.tmp3436
%.tmp3444 = load i1, i1* %shallow
%.tmp3445 = icmp eq i1 %.tmp3444, 0
br i1 %.tmp3445, label %.if.true.3446, label %.if.false.3446
.if.true.3446:
%.tmp3447 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3448 = load i8*, i8** %fn_name.3421
call void(%m2503$.CompilerCtx.type*,i8*) @m295$mark_weak_global.v.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.tmp3447, i8* %.tmp3448)
%.tmp3449 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3450 = load i8*, i8** %fn_name.3421
%.tmp3452 = getelementptr [7 x i8], [7 x i8]*@.str3451, i32 0, i32 0
%.tmp3453 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
call void(%m2503$.CompilerCtx.type*,i8*,i8*,%m2503$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2503$.CompilerCtx.typep.cp.cp.m2503$.AssignableInfo.typep.b.b(%m2503$.CompilerCtx.type* %.tmp3449, i8* %.tmp3450, i8* %.tmp3452, %m2503$.AssignableInfo.type* %.tmp3453, i1 1, i1 1)
%.tmp3454 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3455 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$compile_extern.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3454, %m2503$.AssignableInfo.type* %.tmp3455)
br label %.if.end.3446
.if.false.3446:
%.tmp3456 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3457 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3458 = load i8*, i8** %fn_name.3421
%.tmp3459 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3456, %m878$.Node.type* %.tmp3457, i8* %.tmp3458, %m2503$.AssignableInfo.type* %.tmp3459)
br label %.if.end.3446
.if.end.3446:
br label %.if.end.3396
.if.false.3396:
%.tmp3460 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3461 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3460, i32 0, i32 0
%.tmp3462 = load i8*, i8** %.tmp3461
%.tmp3464 = getelementptr [9 x i8], [9 x i8]*@.str3463, i32 0, i32 0
%.tmp3465 = call i32(i8*,i8*) @strcmp(i8* %.tmp3462, i8* %.tmp3464)
%.tmp3466 = icmp eq i32 %.tmp3465, 0
br i1 %.tmp3466, label %.if.true.3467, label %.if.false.3467
.if.true.3467:
%.tmp3468 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3469 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3468)
store %m2503$.AssignableInfo.type* %.tmp3469, %m2503$.AssignableInfo.type** %info.3212
%.tmp3470 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3471 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3470, i32 0, i32 3
%.tmp3473 = getelementptr [9 x i8], [9 x i8]*@.str3472, i32 0, i32 0
store i8* %.tmp3473, i8** %.tmp3471
%.tmp3474 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3475 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3474, i32 0, i32 4
%.tmp3476 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3477 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3478 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3477, i32 0, i32 6
%.tmp3479 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3478
%.tmp3480 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$syn_function_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3476, %m878$.Node.type* %.tmp3479)
store %m2503$.Type.type* %.tmp3480, %m2503$.Type.type** %.tmp3475
%.tmp3481 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3482 = call i8*(%m878$.Node.type*) @m295$syn_function_name.cp.m878$.Node.typep(%m878$.Node.type* %.tmp3481)
%name.3483 = alloca i8*
store i8* %.tmp3482, i8** %name.3483
%.tmp3484 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3485 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3486 = load i8*, i8** %name.3483
%.tmp3487 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3488 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3487, i32 0, i32 4
%.tmp3489 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3488
%.tmp3490 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.Type.type*) @m295$name_mangle.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3484, %m878$.Node.type* %.tmp3485, i8* %.tmp3486, %m2503$.Type.type* %.tmp3489)
store i8* %.tmp3490, i8** %tmp_buff.3215
%.tmp3491 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3492 = load i8, i8* @SCOPE_GLOBAL
%.tmp3493 = load i8*, i8** %tmp_buff.3215
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp3491, i8 %.tmp3492, i8* %.tmp3493)
%.tmp3494 = load i1, i1* %shallow
%.tmp3495 = icmp eq i1 %.tmp3494, 1
br i1 %.tmp3495, label %.if.true.3496, label %.if.false.3496
.if.true.3496:
%.tmp3497 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3498 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3499 = load i8*, i8** %name.3483
%.tmp3500 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3497, %m878$.Node.type* %.tmp3498, i8* %.tmp3499, %m2503$.AssignableInfo.type* %.tmp3500)
br label %.if.end.3496
.if.false.3496:
%.tmp3501 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp3501, %m2503$.Type.type** %return_type.3213
%.tmp3502 = load %m2503$.Type.type*, %m2503$.Type.type** %return_type.3213
%.tmp3503 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3504 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3503, i32 0, i32 4
%.tmp3505 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3504
%.tmp3506 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3505, i32 0, i32 3
%.tmp3507 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3506
call void(%m2503$.Type.type*,%m2503$.Type.type*) @m295$copy_type.v.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp3502, %m2503$.Type.type* %.tmp3507)
%.tmp3508 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3509 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3508, i32 0, i32 1
%.tmp3510 = load %m0$.File.type*, %m0$.File.type** %.tmp3509
%.tmp3512 = getelementptr [14 x i8], [14 x i8]*@.str3511, i32 0, i32 0
%.tmp3513 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3514 = load %m2503$.Type.type*, %m2503$.Type.type** %return_type.3213
%.tmp3515 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3513, %m2503$.Type.type* %.tmp3514)
%.tmp3516 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3212
%.tmp3517 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3516)
%.tmp3518 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3510, i8* %.tmp3512, i8* %.tmp3515, i8* %.tmp3517)
%.tmp3519 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3520 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3519, i32 0, i32 6
%.tmp3521 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3520
%.tmp3522 = call %m878$.Node.type*(%m878$.Node.type*) @m295$syn_function_params.m878$.Node.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3521)
%params.3523 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3522, %m878$.Node.type** %params.3523
%param_type.3524 = alloca %m2503$.Type.type*
store %m2503$.Type.type* null, %m2503$.Type.type** %param_type.3524
%.tmp3526 = load %m878$.Node.type*, %m878$.Node.type** %params.3523
%param_ptr.3527 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3526, %m878$.Node.type** %param_ptr.3527
br label %.for.start.3525
.for.start.3525:
%.tmp3528 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3527
%.tmp3529 = icmp ne %m878$.Node.type* %.tmp3528, null
br i1 %.tmp3529, label %.for.continue.3525, label %.for.end.3525
.for.continue.3525:
%.tmp3530 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3527
%.tmp3531 = load %m878$.Node.type*, %m878$.Node.type** %params.3523
%.tmp3532 = icmp ne %m878$.Node.type* %.tmp3530, %.tmp3531
br i1 %.tmp3532, label %.if.true.3533, label %.if.false.3533
.if.true.3533:
%.tmp3534 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3527
%.tmp3535 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3534, i32 0, i32 7
%.tmp3536 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3535
store %m878$.Node.type* %.tmp3536, %m878$.Node.type** %param_ptr.3527
%.tmp3537 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3538 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3537, i32 0, i32 1
%.tmp3539 = load %m0$.File.type*, %m0$.File.type** %.tmp3538
%.tmp3541 = getelementptr [3 x i8], [3 x i8]*@.str3540, i32 0, i32 0
%.tmp3542 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3539, i8* %.tmp3541)
br label %.if.end.3533
.if.false.3533:
br label %.if.end.3533
.if.end.3533:
%.tmp3543 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3527
%.tmp3544 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3543, i32 0, i32 0
%.tmp3545 = load i8*, i8** %.tmp3544
%.tmp3547 = getelementptr [5 x i8], [5 x i8]*@.str3546, i32 0, i32 0
%.tmp3548 = call i32(i8*,i8*) @strcmp(i8* %.tmp3545, i8* %.tmp3547)
%.tmp3549 = icmp eq i32 %.tmp3548, 0
br i1 %.tmp3549, label %.if.true.3550, label %.if.false.3550
.if.true.3550:
%.tmp3551 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3552 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3527
%.tmp3553 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3552, i32 0, i32 6
%.tmp3554 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3553
%.tmp3555 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3551, %m878$.Node.type* %.tmp3554)
store %m2503$.Type.type* %.tmp3555, %m2503$.Type.type** %param_type.3524
%.tmp3556 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3527
%.tmp3557 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3556, i32 0, i32 7
%.tmp3558 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3557
store %m878$.Node.type* %.tmp3558, %m878$.Node.type** %param_ptr.3527
br label %.if.end.3550
.if.false.3550:
br label %.if.end.3550
.if.end.3550:
%.tmp3559 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3560 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3559, i32 0, i32 1
%.tmp3561 = load %m0$.File.type*, %m0$.File.type** %.tmp3560
%.tmp3563 = getelementptr [13 x i8], [13 x i8]*@.str3562, i32 0, i32 0
%.tmp3564 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3565 = load %m2503$.Type.type*, %m2503$.Type.type** %param_type.3524
%.tmp3566 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3564, %m2503$.Type.type* %.tmp3565)
%.tmp3567 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3527
%.tmp3568 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3567, i32 0, i32 1
%.tmp3569 = load i8*, i8** %.tmp3568
%.tmp3570 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3561, i8* %.tmp3563, i8* %.tmp3566, i8* %.tmp3569)
%.tmp3571 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3527
%.tmp3572 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3571, i32 0, i32 7
%.tmp3573 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3572
store %m878$.Node.type* %.tmp3573, %m878$.Node.type** %param_ptr.3527
br label %.for.start.3525
.for.end.3525:
%.tmp3574 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3575 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3574, i32 0, i32 1
%.tmp3576 = load %m0$.File.type*, %m0$.File.type** %.tmp3575
%.tmp3578 = getelementptr [5 x i8], [5 x i8]*@.str3577, i32 0, i32 0
%.tmp3579 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3576, i8* %.tmp3578)
%.tmp3580 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3582 = getelementptr [9 x i8], [9 x i8]*@.str3581, i32 0, i32 0
%.tmp3583 = bitcast ptr null to i8*
%.tmp3584 = bitcast ptr null to i8*
call void(%m2503$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2503$.CompilerCtx.typep.cp.cp.cp(%m2503$.CompilerCtx.type* %.tmp3580, i8* %.tmp3582, i8* %.tmp3583, i8* %.tmp3584)
%.tmp3585 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3586 = load %m878$.Node.type*, %m878$.Node.type** %params.3523
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_fn_params.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3585, %m878$.Node.type* %.tmp3586)
%.tmp3587 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3588 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3587, i32 0, i32 6
%.tmp3589 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3588
%.tmp3591 = getelementptr [6 x i8], [6 x i8]*@.str3590, i32 0, i32 0
%.tmp3592 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp3589, i8* %.tmp3591)
%fn_block.3593 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3592, %m878$.Node.type** %fn_block.3593
%.tmp3594 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3595 = load %m878$.Node.type*, %m878$.Node.type** %fn_block.3593
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3594, %m878$.Node.type* %.tmp3595)
%.tmp3596 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
call void(%m2503$.CompilerCtx.type*) @m295$pop_scope.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3596)
%.tmp3597 = bitcast ptr null to %m878$.Node.type*
%last_valid_instruction.3598 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3597, %m878$.Node.type** %last_valid_instruction.3598
%.tmp3599 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3600 = load %m878$.Node.type*, %m878$.Node.type** %fn_block.3593
%.tmp3601 = load %m2503$.Type.type*, %m2503$.Type.type** %return_type.3213
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.Type.type*) @m295$check_n_add_implicit_return.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3599, %m878$.Node.type* %.tmp3600, %m2503$.Type.type* %.tmp3601)
%.tmp3602 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3603 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3602, i32 0, i32 1
%.tmp3604 = load %m0$.File.type*, %m0$.File.type** %.tmp3603
%.tmp3606 = getelementptr [3 x i8], [3 x i8]*@.str3605, i32 0, i32 0
%.tmp3607 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3604, i8* %.tmp3606)
br label %.if.end.3496
.if.end.3496:
br label %.if.end.3467
.if.false.3467:
%.tmp3608 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3609 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3608, i32 0, i32 0
%.tmp3610 = load i8*, i8** %.tmp3609
%.tmp3612 = getelementptr [7 x i8], [7 x i8]*@.str3611, i32 0, i32 0
%.tmp3613 = call i32(i8*,i8*) @strcmp(i8* %.tmp3610, i8* %.tmp3612)
%.tmp3614 = icmp eq i32 %.tmp3613, 0
br i1 %.tmp3614, label %.if.true.3615, label %.if.false.3615
.if.true.3615:
%.tmp3616 = load i1, i1* %shallow
%.tmp3617 = icmp eq i1 %.tmp3616, 1
br i1 %.tmp3617, label %.if.true.3618, label %.if.false.3618
.if.true.3618:
%.tmp3619 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3620 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3619, i32 0, i32 6
%.tmp3621 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3620
%.tmp3622 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3621, i32 0, i32 7
%.tmp3623 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3622
%.tmp3624 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3623, i32 0, i32 1
%.tmp3625 = load i8*, i8** %.tmp3624
%mod_name.3626 = alloca i8*
store i8* %.tmp3625, i8** %mod_name.3626
%.tmp3627 = load i8*, i8** %mod_name.3626
%.tmp3628 = call i32(i8*) @strlen(i8* %.tmp3627)
%mod_name_len.3629 = alloca i32
store i32 %.tmp3628, i32* %mod_name_len.3629
%.tmp3630 = load i32, i32* %mod_name_len.3629
%.tmp3631 = sub i32 %.tmp3630, 1
%.tmp3632 = call i8*(i32) @malloc(i32 %.tmp3631)
%trimmed_path.3633 = alloca i8*
store i8* %.tmp3632, i8** %trimmed_path.3633
%i.3635 = alloca i32
store i32 1, i32* %i.3635
br label %.for.start.3634
.for.start.3634:
%.tmp3636 = load i32, i32* %i.3635
%.tmp3637 = load i32, i32* %mod_name_len.3629
%.tmp3638 = sub i32 %.tmp3637, 1
%.tmp3639 = icmp slt i32 %.tmp3636, %.tmp3638
br i1 %.tmp3639, label %.for.continue.3634, label %.for.end.3634
.for.continue.3634:
%.tmp3640 = load i32, i32* %i.3635
%.tmp3641 = sub i32 %.tmp3640, 1
%.tmp3642 = load i8*, i8** %trimmed_path.3633
%.tmp3643 = getelementptr i8, i8* %.tmp3642, i32 %.tmp3641
%.tmp3644 = load i32, i32* %i.3635
%.tmp3645 = load i8*, i8** %mod_name.3626
%.tmp3646 = getelementptr i8, i8* %.tmp3645, i32 %.tmp3644
%.tmp3647 = load i8, i8* %.tmp3646
store i8 %.tmp3647, i8* %.tmp3643
%.tmp3648 = load i32, i32* %i.3635
%.tmp3649 = add i32 %.tmp3648, 1
store i32 %.tmp3649, i32* %i.3635
br label %.for.start.3634
.for.end.3634:
%.tmp3650 = load i32, i32* %mod_name_len.3629
%.tmp3651 = sub i32 %.tmp3650, 2
%.tmp3652 = load i8*, i8** %trimmed_path.3633
%.tmp3653 = getelementptr i8, i8* %.tmp3652, i32 %.tmp3651
store i8 0, i8* %.tmp3653
%.tmp3654 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3655 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3656 = load i8*, i8** %trimmed_path.3633
%.tmp3657 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$resolve_import_path.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp3654, %m878$.Node.type* %.tmp3655, i8* %.tmp3656)
%mod_abspath.3658 = alloca i8*
store i8* %.tmp3657, i8** %mod_abspath.3658
%.tmp3659 = load i8*, i8** %mod_abspath.3658
%.tmp3660 = call i8*(i32) @malloc(i32 4096)
%.tmp3661 = call i8*(i8*,i8*) @realpath(i8* %.tmp3659, i8* %.tmp3660)
%relpath.3662 = alloca i8*
store i8* %.tmp3661, i8** %relpath.3662
%.tmp3663 = load i8*, i8** %relpath.3662
%.tmp3664 = icmp eq i8* %.tmp3663, null
br i1 %.tmp3664, label %.if.true.3665, label %.if.false.3665
.if.true.3665:
%.tmp3666 = getelementptr i8*, i8** %err_buf.3214, i32 0
%.tmp3668 = getelementptr [54 x i8], [54 x i8]*@.str3667, i32 0, i32 0
%.tmp3669 = load i8*, i8** %mod_name.3626
%.tmp3670 = load i8*, i8** %mod_abspath.3658
%.tmp3671 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3666, i8* %.tmp3668, i8* %.tmp3669, i8* %.tmp3670)
%.tmp3672 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3673 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3674 = load i8*, i8** %err_buf.3214
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp3672, %m878$.Node.type* %.tmp3673, i8* %.tmp3674)
ret void
br label %.if.end.3665
.if.false.3665:
br label %.if.end.3665
.if.end.3665:
%.tmp3675 = load i8*, i8** %relpath.3662
store i8* %.tmp3675, i8** %mod_abspath.3658
%m.3676 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* null, %m2503$.ModuleLookup.type** %m.3676
%.tmp3677 = bitcast ptr null to %m2503$.ModuleLookup.type*
%mod.3678 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp3677, %m2503$.ModuleLookup.type** %mod.3678
%.tmp3680 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3681 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3680, i32 0, i32 6
%.tmp3682 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp3681
store %m2503$.ModuleLookup.type* %.tmp3682, %m2503$.ModuleLookup.type** %m.3676
br label %.for.start.3679
.for.start.3679:
%.tmp3683 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3676
%.tmp3684 = icmp ne %m2503$.ModuleLookup.type* %.tmp3683, null
%.tmp3685 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3678
%.tmp3686 = icmp eq %m2503$.ModuleLookup.type* %.tmp3685, null
%.tmp3687 = and i1 %.tmp3684, %.tmp3686
br i1 %.tmp3687, label %.for.continue.3679, label %.for.end.3679
.for.continue.3679:
%.tmp3688 = load i8*, i8** %mod_abspath.3658
%.tmp3689 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3676
%.tmp3690 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3689, i32 0, i32 0
%.tmp3691 = load i8*, i8** %.tmp3690
%.tmp3692 = call i32(i8*,i8*) @strcmp(i8* %.tmp3688, i8* %.tmp3691)
%.tmp3693 = icmp eq i32 %.tmp3692, 0
br i1 %.tmp3693, label %.if.true.3694, label %.if.false.3694
.if.true.3694:
%.tmp3695 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3676
store %m2503$.ModuleLookup.type* %.tmp3695, %m2503$.ModuleLookup.type** %mod.3678
br label %.if.end.3694
.if.false.3694:
br label %.if.end.3694
.if.end.3694:
%.tmp3696 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3676
%.tmp3697 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3696, i32 0, i32 2
%.tmp3698 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp3697
store %m2503$.ModuleLookup.type* %.tmp3698, %m2503$.ModuleLookup.type** %m.3676
br label %.for.start.3679
.for.end.3679:
%.tmp3699 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3700 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3699, i32 0, i32 6
%.tmp3701 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3700
%.tmp3702 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3701, i32 0, i32 7
%.tmp3703 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3702
%.tmp3704 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3703, i32 0, i32 7
%.tmp3705 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3704
%.tmp3706 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3705, i32 0, i32 7
%.tmp3707 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3706
%.tmp3708 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3707, i32 0, i32 1
%.tmp3709 = load i8*, i8** %.tmp3708
%asname.3710 = alloca i8*
store i8* %.tmp3709, i8** %asname.3710
%.tmp3711 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3678
%.tmp3712 = icmp eq %m2503$.ModuleLookup.type* %.tmp3711, null
br i1 %.tmp3712, label %.if.true.3713, label %.if.false.3713
.if.true.3713:
%.tmp3714 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* null, i32 1
%.tmp3715 = ptrtoint %m2503$.ModuleLookup.type* %.tmp3714 to i32
%.tmp3716 = call i8*(i32) @malloc(i32 %.tmp3715)
%.tmp3717 = bitcast i8* %.tmp3716 to %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp3717, %m2503$.ModuleLookup.type** %mod.3678
%.tmp3718 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3678
%.tmp3719 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3718, i32 0, i32 0
%.tmp3720 = load i8*, i8** %mod_abspath.3658
store i8* %.tmp3720, i8** %.tmp3719
%.tmp3721 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3678
%.tmp3722 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3721, i32 0, i32 2
store %m2503$.ModuleLookup.type* null, %m2503$.ModuleLookup.type** %.tmp3722
%.tmp3723 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3678
%.tmp3724 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3723, i32 0, i32 3
store %m2503$.Scope.type* null, %m2503$.Scope.type** %.tmp3724
%.tmp3725 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3678
%.tmp3726 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3725, i32 0, i32 1
%.tmp3727 = getelementptr i8*, i8** %.tmp3726, i32 0
%.tmp3729 = getelementptr [5 x i8], [5 x i8]*@.str3728, i32 0, i32 0
%.tmp3730 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3731 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3730)
%.tmp3732 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3727, i8* %.tmp3729, i32 %.tmp3731)
%.tmp3734 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3735 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3734, i32 0, i32 6
%.tmp3736 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp3735
store %m2503$.ModuleLookup.type* %.tmp3736, %m2503$.ModuleLookup.type** %m.3676
br label %.for.start.3733
.for.start.3733:
%.tmp3737 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3676
%.tmp3738 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3737, i32 0, i32 2
%.tmp3739 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp3738
%.tmp3740 = icmp ne %m2503$.ModuleLookup.type* %.tmp3739, null
br i1 %.tmp3740, label %.for.continue.3733, label %.for.end.3733
.for.continue.3733:
%.tmp3741 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3676
%.tmp3742 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3741, i32 0, i32 2
%.tmp3743 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %.tmp3742
store %m2503$.ModuleLookup.type* %.tmp3743, %m2503$.ModuleLookup.type** %m.3676
br label %.for.start.3733
.for.end.3733:
%.tmp3744 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %m.3676
%.tmp3745 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3744, i32 0, i32 2
%.tmp3746 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3678
store %m2503$.ModuleLookup.type* %.tmp3746, %m2503$.ModuleLookup.type** %.tmp3745
%.tmp3747 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3748 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3749 = load i8*, i8** %asname.3710
%.tmp3750 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3678
%.tmp3751 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3750, i32 0, i32 0
%.tmp3752 = load i8*, i8** %.tmp3751
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,i8*) @m295$define_module.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.cp(%m2503$.CompilerCtx.type* %.tmp3747, %m878$.Node.type* %.tmp3748, i8* %.tmp3749, i8* %.tmp3752)
%.tmp3753 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3754 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3753, i32 0, i32 7
%.tmp3755 = load i8*, i8** %.tmp3754
%curr_mod.3756 = alloca i8*
store i8* %.tmp3755, i8** %curr_mod.3756
%.tmp3757 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3758 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3757, i32 0, i32 7
%.tmp3759 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3678
%.tmp3760 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3759, i32 0, i32 0
%.tmp3761 = load i8*, i8** %.tmp3760
store i8* %.tmp3761, i8** %.tmp3758
%.tmp3762 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3763 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3764 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3678
%.tmp3765 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3764, i32 0, i32 0
%.tmp3766 = load i8*, i8** %.tmp3765
%.tmp3767 = call i1(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$compile_file.b.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp3762, %m878$.Node.type* %.tmp3763, i8* %.tmp3766)
%.tmp3768 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3769 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3768, i32 0, i32 7
%.tmp3770 = load i8*, i8** %curr_mod.3756
store i8* %.tmp3770, i8** %.tmp3769
br label %.if.end.3713
.if.false.3713:
%.tmp3771 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3772 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3773 = load i8*, i8** %asname.3710
%.tmp3774 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.3678
%.tmp3775 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp3774, i32 0, i32 0
%.tmp3776 = load i8*, i8** %.tmp3775
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,i8*) @m295$define_module.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.cp(%m2503$.CompilerCtx.type* %.tmp3771, %m878$.Node.type* %.tmp3772, i8* %.tmp3773, i8* %.tmp3776)
br label %.if.end.3713
.if.end.3713:
br label %.if.end.3618
.if.false.3618:
br label %.if.end.3618
.if.end.3618:
br label %.if.end.3615
.if.false.3615:
%.tmp3777 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3778 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3780 = getelementptr [40 x i8], [40 x i8]*@.str3779, i32 0, i32 0
%.tmp3781 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp3777, %m878$.Node.type* %.tmp3778, i8* %.tmp3780)
%.tmp3782 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3783 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3782, i32 0, i32 0
%.tmp3784 = load i8*, i8** %.tmp3783
%.tmp3785 = call i32(i8*,...) @printf(i8* %.tmp3781, i8* %.tmp3784)
br label %.if.end.3615
.if.end.3615:
br label %.if.end.3467
.if.end.3467:
br label %.if.end.3396
.if.end.3396:
br label %.if.end.3297
.if.end.3297:
br label %.if.end.3231
.if.end.3231:
br label %.if.end.3223
.if.end.3223:
ret void
}
define i8* @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf.3786 = alloca i8*
store i8* null, i8** %buf.3786
%.tmp3787 = getelementptr i8*, i8** %buf.3786, i32 0
%.tmp3789 = getelementptr [31 x i8], [31 x i8]*@.str3788, i32 0, i32 0
%.tmp3790 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3791 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3790, i32 0, i32 7
%.tmp3792 = load i8*, i8** %.tmp3791
%.tmp3793 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3794 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3793, i32 0, i32 3
%.tmp3795 = load i32, i32* %.tmp3794
%.tmp3796 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3797 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3796, i32 0, i32 4
%.tmp3798 = load i32, i32* %.tmp3797
%.tmp3799 = load i8*, i8** %msg
%.tmp3800 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3787, i8* %.tmp3789, i8* %.tmp3792, i32 %.tmp3795, i32 %.tmp3798, i8* %.tmp3799)
%.tmp3801 = load i8*, i8** %buf.3786
ret i8* %.tmp3801
}
define void @m295$compile_fn_params.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.fn_params.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%fn_params = alloca %m878$.Node.type*
store %m878$.Node.type* %.fn_params.arg, %m878$.Node.type** %fn_params
%param_type.3802 = alloca %m2503$.Type.type*
store %m2503$.Type.type* null, %m2503$.Type.type** %param_type.3802
%.tmp3804 = load %m878$.Node.type*, %m878$.Node.type** %fn_params
%param_ptr.3805 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3804, %m878$.Node.type** %param_ptr.3805
br label %.for.start.3803
.for.start.3803:
%.tmp3806 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3805
%.tmp3807 = icmp ne %m878$.Node.type* %.tmp3806, null
br i1 %.tmp3807, label %.for.continue.3803, label %.for.end.3803
.for.continue.3803:
%.tmp3808 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3805
%.tmp3809 = load %m878$.Node.type*, %m878$.Node.type** %fn_params
%.tmp3810 = icmp ne %m878$.Node.type* %.tmp3808, %.tmp3809
br i1 %.tmp3810, label %.if.true.3811, label %.if.false.3811
.if.true.3811:
%.tmp3812 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3805
%.tmp3813 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3812, i32 0, i32 7
%.tmp3814 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3813
store %m878$.Node.type* %.tmp3814, %m878$.Node.type** %param_ptr.3805
br label %.if.end.3811
.if.false.3811:
br label %.if.end.3811
.if.end.3811:
%.tmp3815 = load %m878$.Node.type*, %m878$.Node.type** %fn_params
%.tmp3816 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3815)
%param_info.3817 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp3816, %m2503$.AssignableInfo.type** %param_info.3817
%.tmp3818 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3817
%.tmp3819 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3818, i32 0, i32 3
%.tmp3821 = getelementptr [9 x i8], [9 x i8]*@.str3820, i32 0, i32 0
store i8* %.tmp3821, i8** %.tmp3819
%.tmp3822 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3805
%.tmp3823 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3822, i32 0, i32 0
%.tmp3824 = load i8*, i8** %.tmp3823
%.tmp3826 = getelementptr [5 x i8], [5 x i8]*@.str3825, i32 0, i32 0
%.tmp3827 = call i32(i8*,i8*) @strcmp(i8* %.tmp3824, i8* %.tmp3826)
%.tmp3828 = icmp eq i32 %.tmp3827, 0
br i1 %.tmp3828, label %.if.true.3829, label %.if.false.3829
.if.true.3829:
%.tmp3830 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3831 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3805
%.tmp3832 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3831, i32 0, i32 6
%.tmp3833 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3832
%.tmp3834 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3830, %m878$.Node.type* %.tmp3833)
store %m2503$.Type.type* %.tmp3834, %m2503$.Type.type** %param_type.3802
%.tmp3835 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3805
%.tmp3836 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3835, i32 0, i32 7
%.tmp3837 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3836
store %m878$.Node.type* %.tmp3837, %m878$.Node.type** %param_ptr.3805
br label %.if.end.3829
.if.false.3829:
br label %.if.end.3829
.if.end.3829:
%.tmp3838 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3817
%.tmp3839 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3838, i32 0, i32 4
%.tmp3840 = load %m2503$.Type.type*, %m2503$.Type.type** %param_type.3802
store %m2503$.Type.type* %.tmp3840, %m2503$.Type.type** %.tmp3839
%.tmp3841 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3805
%.tmp3842 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3841, i32 0, i32 1
%.tmp3843 = load i8*, i8** %.tmp3842
%var_name.3844 = alloca i8*
store i8* %.tmp3843, i8** %var_name.3844
%.tmp3845 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3817
%.tmp3846 = load i8, i8* @SCOPE_LOCAL
%.tmp3847 = load i8*, i8** %var_name.3844
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp3845, i8 %.tmp3846, i8* %.tmp3847)
%.tmp3848 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3849 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3817
%.tmp3850 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3849, i32 0, i32 4
%.tmp3851 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3850
%.tmp3852 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3848, %m2503$.Type.type* %.tmp3851)
%param_info_tr.3853 = alloca i8*
store i8* %.tmp3852, i8** %param_info_tr.3853
%.tmp3854 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3855 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3854, i32 0, i32 1
%.tmp3856 = load %m0$.File.type*, %m0$.File.type** %.tmp3855
%.tmp3858 = getelementptr [16 x i8], [16 x i8]*@.str3857, i32 0, i32 0
%.tmp3859 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3817
%.tmp3860 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3859)
%.tmp3861 = load i8*, i8** %param_info_tr.3853
%.tmp3862 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3856, i8* %.tmp3858, i8* %.tmp3860, i8* %.tmp3861)
%.tmp3863 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3864 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3805
%.tmp3865 = load i8*, i8** %var_name.3844
%.tmp3866 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3817
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3863, %m878$.Node.type* %.tmp3864, i8* %.tmp3865, %m2503$.AssignableInfo.type* %.tmp3866)
%.tmp3867 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3868 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3867, i32 0, i32 1
%.tmp3869 = load %m0$.File.type*, %m0$.File.type** %.tmp3868
%.tmp3871 = getelementptr [28 x i8], [28 x i8]*@.str3870, i32 0, i32 0
%.tmp3872 = load i8*, i8** %param_info_tr.3853
%.tmp3873 = load i8*, i8** %var_name.3844
%.tmp3874 = load i8*, i8** %param_info_tr.3853
%.tmp3875 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %param_info.3817
%.tmp3876 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3875)
%.tmp3877 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3869, i8* %.tmp3871, i8* %.tmp3872, i8* %.tmp3873, i8* %.tmp3874, i8* %.tmp3876)
%.tmp3878 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.3805
%.tmp3879 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3878, i32 0, i32 7
%.tmp3880 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3879
store %m878$.Node.type* %.tmp3880, %m878$.Node.type** %param_ptr.3805
br label %.for.start.3803
.for.end.3803:
ret void
}
define void @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp3881 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3883 = getelementptr [6 x i8], [6 x i8]*@.str3882, i32 0, i32 0
%.tmp3884 = bitcast ptr null to i8*
%.tmp3885 = bitcast ptr null to i8*
call void(%m2503$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2503$.CompilerCtx.typep.cp.cp.cp(%m2503$.CompilerCtx.type* %.tmp3881, i8* %.tmp3883, i8* %.tmp3884, i8* %.tmp3885)
%.tmp3886 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3887 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3886, i32 0, i32 6
%.tmp3888 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3887
%.tmp3890 = getelementptr [12 x i8], [12 x i8]*@.str3889, i32 0, i32 0
%.tmp3891 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp3888, i8* %.tmp3890)
%exprs.3892 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3891, %m878$.Node.type** %exprs.3892
%.tmp3893 = load %m878$.Node.type*, %m878$.Node.type** %exprs.3892
%.tmp3894 = icmp ne %m878$.Node.type* %.tmp3893, null
br i1 %.tmp3894, label %.if.true.3895, label %.if.false.3895
.if.true.3895:
%.tmp3897 = load %m878$.Node.type*, %m878$.Node.type** %exprs.3892
%.tmp3898 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3897, i32 0, i32 6
%.tmp3899 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3898
%b.3900 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp3899, %m878$.Node.type** %b.3900
br label %.for.start.3896
.for.start.3896:
%.tmp3901 = load %m878$.Node.type*, %m878$.Node.type** %b.3900
%.tmp3902 = icmp ne %m878$.Node.type* %.tmp3901, null
br i1 %.tmp3902, label %.for.continue.3896, label %.for.end.3896
.for.continue.3896:
%.tmp3903 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3904 = load %m878$.Node.type*, %m878$.Node.type** %b.3900
%.tmp3905 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3904, i32 0, i32 6
%.tmp3906 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3905
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_expression.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3903, %m878$.Node.type* %.tmp3906)
%.tmp3907 = load %m878$.Node.type*, %m878$.Node.type** %b.3900
%.tmp3908 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp3907, i32 0, i32 7
%.tmp3909 = load %m878$.Node.type*, %m878$.Node.type** %.tmp3908
store %m878$.Node.type* %.tmp3909, %m878$.Node.type** %b.3900
br label %.for.start.3896
.for.end.3896:
br label %.if.end.3895
.if.false.3895:
br label %.if.end.3895
.if.end.3895:
%.tmp3910 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
call void(%m2503$.CompilerCtx.type*) @m295$pop_scope.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3910)
ret void
}
define %m2503$.AssignableInfo.type* @m295$get_struct_attr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep.i(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp3911 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3912 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3913 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3911, %m878$.Node.type* %.tmp3912)
%val.3914 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp3913, %m2503$.AssignableInfo.type** %val.3914
%.tmp3915 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.3914
%.tmp3916 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3915, i32 0, i32 4
%.tmp3917 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3916
%.tmp3918 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3917, i32 0, i32 0
%.tmp3919 = load i8*, i8** %.tmp3918
%.tmp3921 = getelementptr [7 x i8], [7 x i8]*@.str3920, i32 0, i32 0
%.tmp3922 = call i32(i8*,i8*) @strcmp(i8* %.tmp3919, i8* %.tmp3921)
%.tmp3923 = icmp ne i32 %.tmp3922, 0
br i1 %.tmp3923, label %.if.true.3924, label %.if.false.3924
.if.true.3924:
%.tmp3926 = getelementptr [7 x i8], [7 x i8]*@.str3925, i32 0, i32 0
%.tmp3927 = call i32(i8*,...) @printf(i8* %.tmp3926)
%.tmp3928 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp3928
br label %.if.end.3924
.if.false.3924:
br label %.if.end.3924
.if.end.3924:
%.tmp3929 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.3914
%.tmp3930 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3929, i32 0, i32 4
%.tmp3931 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3930
%.tmp3932 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3931, i32 0, i32 3
%.tmp3933 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3932
%node_type.3934 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp3933, %m2503$.Type.type** %node_type.3934
%i.3936 = alloca i32
store i32 0, i32* %i.3936
br label %.for.start.3935
.for.start.3935:
%.tmp3937 = load i32, i32* %i.3936
%.tmp3938 = load i32, i32* %attr_id
%.tmp3939 = icmp slt i32 %.tmp3937, %.tmp3938
br i1 %.tmp3939, label %.for.continue.3935, label %.for.end.3935
.for.continue.3935:
%.tmp3940 = load %m2503$.Type.type*, %m2503$.Type.type** %node_type.3934
%.tmp3941 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp3940, i32 0, i32 4
%.tmp3942 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3941
store %m2503$.Type.type* %.tmp3942, %m2503$.Type.type** %node_type.3934
%.tmp3943 = load i32, i32* %i.3936
%.tmp3944 = add i32 %.tmp3943, 1
store i32 %.tmp3944, i32* %i.3936
br label %.for.start.3935
.for.end.3935:
%.tmp3945 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3946 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp3945)
%info.3947 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp3946, %m2503$.AssignableInfo.type** %info.3947
%.tmp3948 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3947
%.tmp3949 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3948, i32 0, i32 4
%.tmp3950 = load %m2503$.Type.type*, %m2503$.Type.type** %node_type.3934
store %m2503$.Type.type* %.tmp3950, %m2503$.Type.type** %.tmp3949
%.tmp3951 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3952 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp3951)
%tmp_id.3953 = alloca i32
store i32 %.tmp3952, i32* %tmp_id.3953
%.tmp3954 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3955 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.3914
%.tmp3956 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3955, i32 0, i32 4
%.tmp3957 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3956
%.tmp3958 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3954, %m2503$.Type.type* %.tmp3957)
%type_as_str.3959 = alloca i8*
store i8* %.tmp3958, i8** %type_as_str.3959
%.tmp3960 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3961 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3947
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp3960, %m2503$.AssignableInfo.type* %.tmp3961)
%.tmp3962 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3963 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3962, i32 0, i32 1
%.tmp3964 = load %m0$.File.type*, %m0$.File.type** %.tmp3963
%.tmp3966 = getelementptr [52 x i8], [52 x i8]*@.str3965, i32 0, i32 0
%.tmp3967 = load i32, i32* %tmp_id.3953
%.tmp3968 = load i8*, i8** %type_as_str.3959
%.tmp3969 = load i8*, i8** %type_as_str.3959
%.tmp3970 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.3914
%.tmp3971 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3970)
%.tmp3972 = load i32, i32* %attr_id
%.tmp3973 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3964, i8* %.tmp3966, i32 %.tmp3967, i8* %.tmp3968, i8* %.tmp3969, i8* %.tmp3971, i32 %.tmp3972)
%.tmp3974 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3975 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp3974, i32 0, i32 1
%.tmp3976 = load %m0$.File.type*, %m0$.File.type** %.tmp3975
%.tmp3978 = getelementptr [28 x i8], [28 x i8]*@.str3977, i32 0, i32 0
%.tmp3979 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3947
%.tmp3980 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp3979)
%.tmp3981 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3982 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3947
%.tmp3983 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3982, i32 0, i32 4
%.tmp3984 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3983
%.tmp3985 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3981, %m2503$.Type.type* %.tmp3984)
%.tmp3986 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3987 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3947
%.tmp3988 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3987, i32 0, i32 4
%.tmp3989 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3988
%.tmp3990 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp3986, %m2503$.Type.type* %.tmp3989)
%.tmp3991 = load i32, i32* %tmp_id.3953
%.tmp3992 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3976, i8* %.tmp3978, i8* %.tmp3980, i8* %.tmp3985, i8* %.tmp3990, i32 %.tmp3991)
%.tmp3993 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.3947
ret %m2503$.AssignableInfo.type* %.tmp3993
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
%.tmp3994 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp3995 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp3996 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp3994, %m878$.Node.type* %.tmp3995)
%val.3997 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp3996, %m2503$.AssignableInfo.type** %val.3997
%.tmp3998 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.3997
%.tmp3999 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp3998, i32 0, i32 4
%.tmp4000 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp3999
%.tmp4001 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4000, i32 0, i32 0
%.tmp4002 = load i8*, i8** %.tmp4001
%.tmp4004 = getelementptr [7 x i8], [7 x i8]*@.str4003, i32 0, i32 0
%.tmp4005 = call i32(i8*,i8*) @strcmp(i8* %.tmp4002, i8* %.tmp4004)
%.tmp4006 = icmp ne i32 %.tmp4005, 0
br i1 %.tmp4006, label %.if.true.4007, label %.if.false.4007
.if.true.4007:
%.tmp4009 = getelementptr [7 x i8], [7 x i8]*@.str4008, i32 0, i32 0
%.tmp4010 = call i32(i8*,...) @printf(i8* %.tmp4009)
ret void
br label %.if.end.4007
.if.false.4007:
br label %.if.end.4007
.if.end.4007:
%.tmp4011 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.3997
%.tmp4012 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4011, i32 0, i32 4
%.tmp4013 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4012
%.tmp4014 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4013, i32 0, i32 3
%.tmp4015 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4014
%node_type.4016 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp4015, %m2503$.Type.type** %node_type.4016
%i.4018 = alloca i32
store i32 0, i32* %i.4018
br label %.for.start.4017
.for.start.4017:
%.tmp4019 = load i32, i32* %i.4018
%.tmp4020 = load i32, i32* %attr_id
%.tmp4021 = icmp slt i32 %.tmp4019, %.tmp4020
br i1 %.tmp4021, label %.for.continue.4017, label %.for.end.4017
.for.continue.4017:
%.tmp4022 = load %m2503$.Type.type*, %m2503$.Type.type** %node_type.4016
%.tmp4023 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4022, i32 0, i32 4
%.tmp4024 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4023
store %m2503$.Type.type* %.tmp4024, %m2503$.Type.type** %node_type.4016
%.tmp4025 = load i32, i32* %i.4018
%.tmp4026 = add i32 %.tmp4025, 1
store i32 %.tmp4026, i32* %i.4018
br label %.for.start.4017
.for.end.4017:
%.tmp4027 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4028 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp4027)
%tmp_id.4029 = alloca i32
store i32 %.tmp4028, i32* %tmp_id.4029
%.tmp4030 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4031 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.3997
%.tmp4032 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4031, i32 0, i32 4
%.tmp4033 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4032
%.tmp4034 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4030, %m2503$.Type.type* %.tmp4033)
%type_as_str.4035 = alloca i8*
store i8* %.tmp4034, i8** %type_as_str.4035
%.tmp4036 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4037 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4036, i32 0, i32 1
%.tmp4038 = load %m0$.File.type*, %m0$.File.type** %.tmp4037
%.tmp4040 = getelementptr [52 x i8], [52 x i8]*@.str4039, i32 0, i32 0
%.tmp4041 = load i32, i32* %tmp_id.4029
%.tmp4042 = load i8*, i8** %type_as_str.4035
%.tmp4043 = load i8*, i8** %type_as_str.4035
%.tmp4044 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %val.3997
%.tmp4045 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4044)
%.tmp4046 = load i32, i32* %attr_id
%.tmp4047 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4038, i8* %.tmp4040, i32 %.tmp4041, i8* %.tmp4042, i8* %.tmp4043, i8* %.tmp4045, i32 %.tmp4046)
%.tmp4048 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4049 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4048, i32 0, i32 1
%.tmp4050 = load %m0$.File.type*, %m0$.File.type** %.tmp4049
%.tmp4052 = getelementptr [18 x i8], [18 x i8]*@.str4051, i32 0, i32 0
%.tmp4053 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4054 = load %m2503$.Type.type*, %m2503$.Type.type** %node_type.4016
%.tmp4055 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4053, %m2503$.Type.type* %.tmp4054)
%.tmp4056 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4057 = load %m2503$.Type.type*, %m2503$.Type.type** %node_type.4016
%.tmp4058 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4056, %m2503$.Type.type* %.tmp4057)
%.tmp4059 = load i8*, i8** %attr
%.tmp4060 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4050, i8* %.tmp4052, i8* %.tmp4055, i8* %.tmp4058, i8* %.tmp4059)
ret void
}
define %m2503$.AssignableInfo.type* @m295$compile_builtin.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp4061 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4062 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4061, i32 0, i32 6
%.tmp4063 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4062
%.tmp4064 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4063, i32 0, i32 6
%.tmp4065 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4064
%dotted.4066 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4065, %m878$.Node.type** %dotted.4066
%.tmp4067 = load %m878$.Node.type*, %m878$.Node.type** %dotted.4066
%.tmp4068 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4067, i32 0, i32 7
%.tmp4069 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4068
%.tmp4070 = icmp ne %m878$.Node.type* %.tmp4069, null
br i1 %.tmp4070, label %.if.true.4071, label %.if.false.4071
.if.true.4071:
%.tmp4072 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4072
br label %.if.end.4071
.if.false.4071:
br label %.if.end.4071
.if.end.4071:
%.tmp4073 = load %m878$.Node.type*, %m878$.Node.type** %dotted.4066
%.tmp4074 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4073, i32 0, i32 1
%.tmp4075 = load i8*, i8** %.tmp4074
%.tmp4077 = getelementptr [7 x i8], [7 x i8]*@.str4076, i32 0, i32 0
%.tmp4078 = call i32(i8*,i8*) @strcmp(i8* %.tmp4075, i8* %.tmp4077)
%.tmp4079 = icmp eq i32 %.tmp4078, 0
br i1 %.tmp4079, label %.if.true.4080, label %.if.false.4080
.if.true.4080:
%.tmp4081 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4083 = getelementptr [8 x i8], [8 x i8]*@.str4082, i32 0, i32 0
%.tmp4084 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4081, i8* %.tmp4083)
%args.4085 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4084, %m878$.Node.type** %args.4085
%.tmp4086 = load %m878$.Node.type*, %m878$.Node.type** %args.4085
%.tmp4087 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4086, i32 0, i32 6
%.tmp4088 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4087
%.tmp4090 = getelementptr [11 x i8], [11 x i8]*@.str4089, i32 0, i32 0
%.tmp4091 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4088, i8* %.tmp4090)
%value.4092 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4091, %m878$.Node.type** %value.4092
%.tmp4093 = load %m878$.Node.type*, %m878$.Node.type** %value.4092
%.tmp4094 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4093, i32 0, i32 6
%.tmp4095 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4094
%.tmp4096 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4095, i32 0, i32 6
%.tmp4097 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4096
%.tmp4098 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4097, i32 0, i32 6
%.tmp4099 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4098
%.tmp4100 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4099, i32 0, i32 6
%.tmp4101 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4100
store %m878$.Node.type* %.tmp4101, %m878$.Node.type** %value.4092
%.tmp4102 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4103 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp4102)
%tmp_id.4104 = alloca i32
store i32 %.tmp4103, i32* %tmp_id.4104
%.tmp4105 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4106 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp4105)
%info.4107 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4106, %m2503$.AssignableInfo.type** %info.4107
%.tmp4108 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4109 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4107
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp4108, %m2503$.AssignableInfo.type* %.tmp4109)
%.tmp4110 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4107
%.tmp4111 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4110, i32 0, i32 4
%.tmp4112 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4112, %m2503$.Type.type** %.tmp4111
%.tmp4113 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4107
%.tmp4114 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4113, i32 0, i32 4
%.tmp4115 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4114
%.tmp4116 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4115, i32 0, i32 0
%.tmp4118 = getelementptr [4 x i8], [4 x i8]*@.str4117, i32 0, i32 0
store i8* %.tmp4118, i8** %.tmp4116
%.tmp4119 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4120 = load %m878$.Node.type*, %m878$.Node.type** %value.4092
%.tmp4121 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4119, %m878$.Node.type* %.tmp4120)
%inspected_type.4122 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp4121, %m2503$.Type.type** %inspected_type.4122
%.tmp4123 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4124 = load %m2503$.Type.type*, %m2503$.Type.type** %inspected_type.4122
%.tmp4125 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4123, %m2503$.Type.type* %.tmp4124)
%type_as_str.4126 = alloca i8*
store i8* %.tmp4125, i8** %type_as_str.4126
%.tmp4127 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4128 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4127, i32 0, i32 1
%.tmp4129 = load %m0$.File.type*, %m0$.File.type** %.tmp4128
%.tmp4131 = getelementptr [46 x i8], [46 x i8]*@.str4130, i32 0, i32 0
%.tmp4132 = load i32, i32* %tmp_id.4104
%.tmp4133 = load i8*, i8** %type_as_str.4126
%.tmp4134 = load i8*, i8** %type_as_str.4126
%.tmp4135 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4129, i8* %.tmp4131, i32 %.tmp4132, i8* %.tmp4133, i8* %.tmp4134)
%.tmp4136 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4137 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4136, i32 0, i32 1
%.tmp4138 = load %m0$.File.type*, %m0$.File.type** %.tmp4137
%.tmp4140 = getelementptr [35 x i8], [35 x i8]*@.str4139, i32 0, i32 0
%.tmp4141 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4107
%.tmp4142 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4141)
%.tmp4143 = load i8*, i8** %type_as_str.4126
%.tmp4144 = load i32, i32* %tmp_id.4104
%.tmp4145 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4138, i8* %.tmp4140, i8* %.tmp4142, i8* %.tmp4143, i32 %.tmp4144)
%.tmp4146 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4107
ret %m2503$.AssignableInfo.type* %.tmp4146
br label %.if.end.4080
.if.false.4080:
%.tmp4147 = load %m878$.Node.type*, %m878$.Node.type** %dotted.4066
%.tmp4148 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4147, i32 0, i32 1
%.tmp4149 = load i8*, i8** %.tmp4148
%.tmp4151 = getelementptr [7 x i8], [7 x i8]*@.str4150, i32 0, i32 0
%.tmp4152 = call i32(i8*,i8*) @strcmp(i8* %.tmp4149, i8* %.tmp4151)
%.tmp4153 = icmp eq i32 %.tmp4152, 0
br i1 %.tmp4153, label %.if.true.4154, label %.if.false.4154
.if.true.4154:
%.tmp4155 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4157 = getelementptr [8 x i8], [8 x i8]*@.str4156, i32 0, i32 0
%.tmp4158 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4155, i8* %.tmp4157)
%args.4159 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4158, %m878$.Node.type** %args.4159
%.tmp4160 = load %m878$.Node.type*, %m878$.Node.type** %args.4159
%.tmp4161 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4160, i32 0, i32 6
%.tmp4162 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4161
%.tmp4164 = getelementptr [11 x i8], [11 x i8]*@.str4163, i32 0, i32 0
%.tmp4165 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4162, i8* %.tmp4164)
%array.4166 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4165, %m878$.Node.type** %array.4166
%.tmp4167 = load %m878$.Node.type*, %m878$.Node.type** %array.4166
%.tmp4168 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4167, i32 0, i32 7
%.tmp4169 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4168
%.tmp4171 = getelementptr [11 x i8], [11 x i8]*@.str4170, i32 0, i32 0
%.tmp4172 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4169, i8* %.tmp4171)
%value.4173 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4172, %m878$.Node.type** %value.4173
%.tmp4174 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4175 = load %m878$.Node.type*, %m878$.Node.type** %value.4173
%.tmp4176 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4174, %m878$.Node.type* %.tmp4175)
%value_info.4177 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4176, %m2503$.AssignableInfo.type** %value_info.4177
%.tmp4178 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4179 = load %m878$.Node.type*, %m878$.Node.type** %array.4166
%.tmp4180 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4178, %m878$.Node.type* %.tmp4179)
%array_info.4181 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4180, %m2503$.AssignableInfo.type** %array_info.4181
%.tmp4182 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4183 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp4182)
%info.4184 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4183, %m2503$.AssignableInfo.type** %info.4184
%.tmp4185 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4186 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4184
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp4185, %m2503$.AssignableInfo.type* %.tmp4186)
%.tmp4187 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4184
%.tmp4188 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4187, i32 0, i32 4
%.tmp4189 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %array_info.4181
%.tmp4190 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4189, i32 0, i32 4
%.tmp4191 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4190
store %m2503$.Type.type* %.tmp4191, %m2503$.Type.type** %.tmp4188
%builtin_prefix.4192 = alloca i8*
store i8* null, i8** %builtin_prefix.4192
%.tmp4193 = getelementptr i8*, i8** %builtin_prefix.4192, i32 0
%.tmp4195 = getelementptr [5 x i8], [5 x i8]*@.str4194, i32 0, i32 0
%.tmp4196 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4197 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp4196)
%.tmp4198 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4193, i8* %.tmp4195, i32 %.tmp4197)
%.tmp4199 = call i8*() @m2054$append_tmpl.cp()
%tmpl.4200 = alloca i8*
store i8* %.tmp4199, i8** %tmpl.4200
%.tmp4201 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4202 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4201, i32 0, i32 1
%.tmp4203 = load %m0$.File.type*, %m0$.File.type** %.tmp4202
%.tmp4204 = load i8*, i8** %tmpl.4200
%.tmp4205 = load i8*, i8** %builtin_prefix.4192
%.tmp4206 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4207 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %array_info.4181
%.tmp4208 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4207, i32 0, i32 4
%.tmp4209 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4208
%.tmp4210 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4206, %m2503$.Type.type* %.tmp4209)
%.tmp4211 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %array_info.4181
%.tmp4212 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4211)
%.tmp4213 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4214 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %value_info.4177
%.tmp4215 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4214, i32 0, i32 4
%.tmp4216 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4215
%.tmp4217 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4213, %m2503$.Type.type* %.tmp4216)
%.tmp4218 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %value_info.4177
%.tmp4219 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4218)
%.tmp4220 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4184
%.tmp4221 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4220)
%.tmp4222 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4203, i8* %.tmp4204, i8* %.tmp4205, i8* %.tmp4210, i8* %.tmp4212, i8* %.tmp4217, i8* %.tmp4219, i8* %.tmp4221)
%.tmp4223 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4224 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp4223)
%info_g.4225 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4224, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4226 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4227 = load i8, i8* @SCOPE_GLOBAL
%.tmp4229 = getelementptr [8 x i8], [8 x i8]*@.str4228, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp4226, i8 %.tmp4227, i8* %.tmp4229)
%.tmp4230 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4231 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4230, i32 0, i32 4
%.tmp4232 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4232, %m2503$.Type.type** %.tmp4231
%.tmp4233 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4234 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4233, i32 0, i32 4
%.tmp4235 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4234
%.tmp4236 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4235, i32 0, i32 0
%.tmp4238 = getelementptr [9 x i8], [9 x i8]*@.str4237, i32 0, i32 0
store i8* %.tmp4238, i8** %.tmp4236
%.tmp4239 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4240 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4239, i32 0, i32 4
%.tmp4241 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4240
%.tmp4242 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4241, i32 0, i32 3
%.tmp4243 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4243, %m2503$.Type.type** %.tmp4242
%.tmp4244 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4245 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4244, i32 0, i32 4
%.tmp4246 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4245
%.tmp4247 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4246, i32 0, i32 3
%.tmp4248 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4247
%.tmp4249 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4248, i32 0, i32 0
%.tmp4251 = getelementptr [4 x i8], [4 x i8]*@.str4250, i32 0, i32 0
store i8* %.tmp4251, i8** %.tmp4249
%.tmp4252 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4253 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4252, i32 0, i32 4
%.tmp4254 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4253
%.tmp4255 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4254, i32 0, i32 3
%.tmp4256 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4255
%.tmp4257 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4256, i32 0, i32 3
%.tmp4258 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4258, %m2503$.Type.type** %.tmp4257
%.tmp4259 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4260 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4259, i32 0, i32 4
%.tmp4261 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4260
%.tmp4262 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4261, i32 0, i32 3
%.tmp4263 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4262
%.tmp4264 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4263, i32 0, i32 3
%.tmp4265 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4264
%.tmp4266 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4265, i32 0, i32 0
%.tmp4268 = getelementptr [4 x i8], [4 x i8]*@.str4267, i32 0, i32 0
store i8* %.tmp4268, i8** %.tmp4266
%.tmp4269 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4270 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4269, i32 0, i32 4
%.tmp4271 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4270
%.tmp4272 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4271, i32 0, i32 3
%.tmp4273 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4272
%.tmp4274 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4273, i32 0, i32 4
%.tmp4275 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4275, %m2503$.Type.type** %.tmp4274
%.tmp4276 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4277 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4276, i32 0, i32 4
%.tmp4278 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4277
%.tmp4279 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4278, i32 0, i32 3
%.tmp4280 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4279
%.tmp4281 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4280, i32 0, i32 4
%.tmp4282 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4281
%.tmp4283 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4282, i32 0, i32 0
%.tmp4285 = getelementptr [4 x i8], [4 x i8]*@.str4284, i32 0, i32 0
store i8* %.tmp4285, i8** %.tmp4283
%.tmp4286 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4287 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4286, i32 0, i32 4
%.tmp4288 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4287
%.tmp4289 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4288, i32 0, i32 3
%.tmp4290 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4289
%.tmp4291 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4290, i32 0, i32 4
%.tmp4292 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4291
%.tmp4293 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4292, i32 0, i32 3
%.tmp4294 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4294, %m2503$.Type.type** %.tmp4293
%.tmp4295 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4296 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4295, i32 0, i32 4
%.tmp4297 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4296
%.tmp4298 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4297, i32 0, i32 3
%.tmp4299 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4298
%.tmp4300 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4299, i32 0, i32 4
%.tmp4301 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4300
%.tmp4302 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4301, i32 0, i32 3
%.tmp4303 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4302
%.tmp4304 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4303, i32 0, i32 0
%.tmp4306 = getelementptr [4 x i8], [4 x i8]*@.str4305, i32 0, i32 0
store i8* %.tmp4306, i8** %.tmp4304
%.tmp4307 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4308 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4307, i32 0, i32 4
%.tmp4309 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4308
%.tmp4310 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4309, i32 0, i32 3
%.tmp4311 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4310
%.tmp4312 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4311, i32 0, i32 4
%.tmp4313 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4312
%.tmp4314 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4313, i32 0, i32 4
%.tmp4315 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp4315, %m2503$.Type.type** %.tmp4314
%.tmp4316 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
%.tmp4317 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4316, i32 0, i32 4
%.tmp4318 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4317
%.tmp4319 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4318, i32 0, i32 3
%.tmp4320 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4319
%.tmp4321 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4320, i32 0, i32 4
%.tmp4322 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4321
%.tmp4323 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4322, i32 0, i32 4
%.tmp4324 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4323
%.tmp4325 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4324, i32 0, i32 0
%.tmp4327 = getelementptr [4 x i8], [4 x i8]*@.str4326, i32 0, i32 0
store i8* %.tmp4327, i8** %.tmp4325
%.tmp4328 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4330 = getelementptr [8 x i8], [8 x i8]*@.str4329, i32 0, i32 0
%.tmp4332 = getelementptr [7 x i8], [7 x i8]*@.str4331, i32 0, i32 0
%.tmp4333 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_g.4225
call void(%m2503$.CompilerCtx.type*,i8*,i8*,%m2503$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2503$.CompilerCtx.typep.cp.cp.m2503$.AssignableInfo.typep.b.b(%m2503$.CompilerCtx.type* %.tmp4328, i8* %.tmp4330, i8* %.tmp4332, %m2503$.AssignableInfo.type* %.tmp4333, i1 1, i1 0)
%.tmp4334 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4184
ret %m2503$.AssignableInfo.type* %.tmp4334
br label %.if.end.4154
.if.false.4154:
%.tmp4335 = load %m878$.Node.type*, %m878$.Node.type** %dotted.4066
%.tmp4336 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4335, i32 0, i32 1
%.tmp4337 = load i8*, i8** %.tmp4336
%.tmp4339 = getelementptr [4 x i8], [4 x i8]*@.str4338, i32 0, i32 0
%.tmp4340 = call i32(i8*,i8*) @strcmp(i8* %.tmp4337, i8* %.tmp4339)
%.tmp4341 = icmp eq i32 %.tmp4340, 0
br i1 %.tmp4341, label %.if.true.4342, label %.if.false.4342
.if.true.4342:
%.tmp4343 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4345 = getelementptr [8 x i8], [8 x i8]*@.str4344, i32 0, i32 0
%.tmp4346 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4343, i8* %.tmp4345)
%args.4347 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4346, %m878$.Node.type** %args.4347
%.tmp4348 = load %m878$.Node.type*, %m878$.Node.type** %args.4347
%.tmp4349 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4348, i32 0, i32 6
%.tmp4350 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4349
%.tmp4352 = getelementptr [11 x i8], [11 x i8]*@.str4351, i32 0, i32 0
%.tmp4353 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4350, i8* %.tmp4352)
%value.4354 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4353, %m878$.Node.type** %value.4354
%.tmp4355 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4356 = load %m878$.Node.type*, %m878$.Node.type** %value.4354
%.tmp4357 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i32) @m295$get_struct_attr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep.i(%m2503$.CompilerCtx.type* %.tmp4355, %m878$.Node.type* %.tmp4356, i32 1)
ret %m2503$.AssignableInfo.type* %.tmp4357
br label %.if.end.4342
.if.false.4342:
br label %.if.end.4342
.if.end.4342:
br label %.if.end.4154
.if.end.4154:
br label %.if.end.4080
.if.end.4080:
%.tmp4358 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4358
}
define i8* @m295$resolve_import_path.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp4360 = getelementptr [1 x i8], [1 x i8]*@.str4359, i32 0, i32 0
%err_buf.4361 = alloca i8*
store i8* %.tmp4360, i8** %err_buf.4361
%.tmp4362 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4363 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4362, i32 0, i32 7
%.tmp4364 = load i8*, i8** %.tmp4363
%mod_abspath.4365 = alloca i8*
store i8* %.tmp4364, i8** %mod_abspath.4365
%.tmp4366 = load i8*, i8** %mod_abspath.4365
%.tmp4367 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp4366)
%dirname.4368 = alloca i8*
store i8* %.tmp4367, i8** %dirname.4368
%.tmp4369 = load i8*, i8** %import_str
%.tmp4370 = getelementptr i8, i8* %.tmp4369, i32 0
%.tmp4371 = load i8, i8* %.tmp4370
%.tmp4372 = icmp eq i8 %.tmp4371, 47
br i1 %.tmp4372, label %.if.true.4373, label %.if.false.4373
.if.true.4373:
%.tmp4374 = getelementptr i8*, i8** %err_buf.4361, i32 0
%.tmp4376 = getelementptr [46 x i8], [46 x i8]*@.str4375, i32 0, i32 0
%.tmp4377 = load i8*, i8** %import_str
%.tmp4378 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4374, i8* %.tmp4376, i8* %.tmp4377)
%.tmp4379 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4380 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4381 = load i8*, i8** %err_buf.4361
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4379, %m878$.Node.type* %.tmp4380, i8* %.tmp4381)
%.tmp4382 = bitcast ptr null to i8*
ret i8* %.tmp4382
br label %.if.end.4373
.if.false.4373:
br label %.if.end.4373
.if.end.4373:
%.tmp4383 = load i8*, i8** %import_str
%.tmp4384 = getelementptr i8, i8* %.tmp4383, i32 0
%.tmp4385 = load i8, i8* %.tmp4384
%.tmp4386 = icmp ne i8 %.tmp4385, 46
%.tmp4387 = load i8*, i8** %import_str
%.tmp4388 = getelementptr i8, i8* %.tmp4387, i32 1
%.tmp4389 = load i8, i8* %.tmp4388
%.tmp4390 = icmp ne i8 %.tmp4389, 47
%.tmp4391 = and i1 %.tmp4386, %.tmp4390
br i1 %.tmp4391, label %.if.true.4392, label %.if.false.4392
.if.true.4392:
%.tmp4393 = call i8*() @m295$get_root.cp()
%root.4394 = alloca i8*
store i8* %.tmp4393, i8** %root.4394
%.tmp4395 = getelementptr i8*, i8** %mod_abspath.4365, i32 0
%.tmp4397 = getelementptr [13 x i8], [13 x i8]*@.str4396, i32 0, i32 0
%.tmp4398 = load i8*, i8** %root.4394
%.tmp4399 = load i8*, i8** %import_str
%.tmp4400 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4395, i8* %.tmp4397, i8* %.tmp4398, i8* %.tmp4399)
br label %.if.end.4392
.if.false.4392:
%.tmp4401 = load i8*, i8** %dirname.4368
%.tmp4403 = getelementptr [1 x i8], [1 x i8]*@.str4402, i32 0, i32 0
%.tmp4404 = call i32(i8*,i8*) @strcmp(i8* %.tmp4401, i8* %.tmp4403)
%.tmp4405 = icmp eq i32 %.tmp4404, 0
br i1 %.tmp4405, label %.if.true.4406, label %.if.false.4406
.if.true.4406:
%.tmp4407 = getelementptr i8*, i8** %mod_abspath.4365, i32 0
%.tmp4409 = getelementptr [6 x i8], [6 x i8]*@.str4408, i32 0, i32 0
%.tmp4410 = load i8*, i8** %import_str
%.tmp4411 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4407, i8* %.tmp4409, i8* %.tmp4410)
br label %.if.end.4406
.if.false.4406:
%.tmp4412 = getelementptr i8*, i8** %mod_abspath.4365, i32 0
%.tmp4414 = getelementptr [9 x i8], [9 x i8]*@.str4413, i32 0, i32 0
%.tmp4415 = load i8*, i8** %dirname.4368
%.tmp4416 = load i8*, i8** %import_str
%.tmp4417 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4412, i8* %.tmp4414, i8* %.tmp4415, i8* %.tmp4416)
br label %.if.end.4406
.if.end.4406:
br label %.if.end.4392
.if.end.4392:
%.tmp4418 = load i8*, i8** %mod_abspath.4365
ret i8* %.tmp4418
}
define %m2503$.AssignableInfo.type* @m295$compile_fn_call.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp4419 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4420 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4421 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_builtin.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4419, %m878$.Node.type* %.tmp4420)
%info.4422 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4421, %m2503$.AssignableInfo.type** %info.4422
%.tmp4423 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4424 = icmp ne %m2503$.AssignableInfo.type* %.tmp4423, null
br i1 %.tmp4424, label %.if.true.4425, label %.if.false.4425
.if.true.4425:
%.tmp4426 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
ret %m2503$.AssignableInfo.type* %.tmp4426
br label %.if.end.4425
.if.false.4425:
br label %.if.end.4425
.if.end.4425:
%.tmp4427 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4428 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4429 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4427, %m878$.Node.type* %.tmp4428)
store %m2503$.AssignableInfo.type* %.tmp4429, %m2503$.AssignableInfo.type** %info.4422
%.tmp4430 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4431 = icmp eq %m2503$.AssignableInfo.type* %.tmp4430, null
br i1 %.tmp4431, label %.if.true.4432, label %.if.false.4432
.if.true.4432:
%.tmp4433 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4433, label %.if.true.4434, label %.if.false.4434
.if.true.4434:
%.tmp4435 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4436 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4438 = getelementptr [35 x i8], [35 x i8]*@.str4437, i32 0, i32 0
%.tmp4439 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4435, %m878$.Node.type* %.tmp4436, i8* %.tmp4438)
%.tmp4440 = call i32(i8*,...) @printf(i8* %.tmp4439)
br label %.if.end.4434
.if.false.4434:
br label %.if.end.4434
.if.end.4434:
%.tmp4441 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4441
br label %.if.end.4432
.if.false.4432:
br label %.if.end.4432
.if.end.4432:
%.tmp4442 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4444 = getelementptr [8 x i8], [8 x i8]*@.str4443, i32 0, i32 0
%.tmp4445 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4442, i8* %.tmp4444)
%args.4446 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4445, %m878$.Node.type** %args.4446
%.tmp4448 = getelementptr [1 x i8], [1 x i8]*@.str4447, i32 0, i32 0
%params_buff.4449 = alloca i8*
store i8* %.tmp4448, i8** %params_buff.4449
%tmp.4450 = alloca i8*
store i8* null, i8** %tmp.4450
%.tmp4451 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4452 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4451, i32 0, i32 4
%.tmp4453 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4452
%.tmp4454 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4453, i32 0, i32 0
%.tmp4455 = load i8*, i8** %.tmp4454
%.tmp4457 = getelementptr [4 x i8], [4 x i8]*@.str4456, i32 0, i32 0
%.tmp4458 = call i32(i8*,i8*) @strcmp(i8* %.tmp4455, i8* %.tmp4457)
%.tmp4459 = icmp eq i32 %.tmp4458, 0
br i1 %.tmp4459, label %.if.true.4460, label %.if.false.4460
.if.true.4460:
%.tmp4461 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4462 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp4461)
%new_info.4463 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4462, %m2503$.AssignableInfo.type** %new_info.4463
%.tmp4464 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4465 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.4463
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp4464, %m2503$.AssignableInfo.type* %.tmp4465)
%.tmp4466 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.4463
%.tmp4467 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4466, i32 0, i32 4
%.tmp4468 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4469 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4468, i32 0, i32 4
%.tmp4470 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4469
%.tmp4471 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4470, i32 0, i32 3
%.tmp4472 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4471
store %m2503$.Type.type* %.tmp4472, %m2503$.Type.type** %.tmp4467
%.tmp4473 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4474 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4473, i32 0, i32 1
%.tmp4475 = load %m0$.File.type*, %m0$.File.type** %.tmp4474
%.tmp4477 = getelementptr [22 x i8], [22 x i8]*@.str4476, i32 0, i32 0
%.tmp4478 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.4463
%.tmp4479 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4478)
%.tmp4480 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4481 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4482 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4481, i32 0, i32 4
%.tmp4483 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4482
%.tmp4484 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4480, %m2503$.Type.type* %.tmp4483)
%.tmp4485 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4486 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4487 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4486, i32 0, i32 4
%.tmp4488 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4487
%.tmp4489 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4485, %m2503$.Type.type* %.tmp4488)
%.tmp4490 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4491 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4490)
%.tmp4492 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4475, i8* %.tmp4477, i8* %.tmp4479, i8* %.tmp4484, i8* %.tmp4489, i8* %.tmp4491)
%.tmp4493 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.4463
store %m2503$.AssignableInfo.type* %.tmp4493, %m2503$.AssignableInfo.type** %info.4422
br label %.if.end.4460
.if.false.4460:
br label %.if.end.4460
.if.end.4460:
%.tmp4494 = load %m878$.Node.type*, %m878$.Node.type** %args.4446
%.tmp4495 = icmp ne %m878$.Node.type* %.tmp4494, null
br i1 %.tmp4495, label %.if.true.4496, label %.if.false.4496
.if.true.4496:
%.tmp4497 = load %m878$.Node.type*, %m878$.Node.type** %args.4446
%.tmp4498 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4497, i32 0, i32 6
%.tmp4499 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4498
%.tmp4501 = getelementptr [11 x i8], [11 x i8]*@.str4500, i32 0, i32 0
%.tmp4502 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4499, i8* %.tmp4501)
%start.4503 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4502, %m878$.Node.type** %start.4503
%argno.4504 = alloca i32
store i32 1, i32* %argno.4504
%.tmp4505 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4506 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4505, i32 0, i32 4
%.tmp4507 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4506
%.tmp4508 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4507, i32 0, i32 3
%.tmp4509 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4508
%.tmp4510 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4509, i32 0, i32 4
%.tmp4511 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4510
%expect_type.4512 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp4511, %m2503$.Type.type** %expect_type.4512
%provided_args.4513 = alloca i32
store i32 0, i32* %provided_args.4513
%.tmp4515 = load %m878$.Node.type*, %m878$.Node.type** %start.4503
%pp.4516 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4515, %m878$.Node.type** %pp.4516
br label %.for.start.4514
.for.start.4514:
%.tmp4517 = load %m878$.Node.type*, %m878$.Node.type** %pp.4516
%.tmp4518 = icmp ne %m878$.Node.type* %.tmp4517, null
br i1 %.tmp4518, label %.for.continue.4514, label %.for.end.4514
.for.continue.4514:
%.tmp4519 = load i32, i32* %provided_args.4513
%.tmp4520 = add i32 %.tmp4519, 1
store i32 %.tmp4520, i32* %provided_args.4513
%.tmp4521 = load %m878$.Node.type*, %m878$.Node.type** %pp.4516
%.tmp4522 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4521, i32 0, i32 7
%.tmp4523 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4522
%.tmp4525 = getelementptr [11 x i8], [11 x i8]*@.str4524, i32 0, i32 0
%.tmp4526 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4523, i8* %.tmp4525)
store %m878$.Node.type* %.tmp4526, %m878$.Node.type** %pp.4516
br label %.for.start.4514
.for.end.4514:
%.tmp4528 = load %m878$.Node.type*, %m878$.Node.type** %start.4503
%pp.4529 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp4528, %m878$.Node.type** %pp.4529
br label %.for.start.4527
.for.start.4527:
%.tmp4530 = load %m878$.Node.type*, %m878$.Node.type** %pp.4529
%.tmp4531 = icmp ne %m878$.Node.type* %.tmp4530, null
br i1 %.tmp4531, label %.for.continue.4527, label %.for.end.4527
.for.continue.4527:
%.tmp4532 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4512
%.tmp4533 = icmp eq %m2503$.Type.type* %.tmp4532, null
br i1 %.tmp4533, label %.if.true.4534, label %.if.false.4534
.if.true.4534:
%.tmp4535 = getelementptr i8*, i8** %tmp.4450, i32 0
%.tmp4537 = getelementptr [43 x i8], [43 x i8]*@.str4536, i32 0, i32 0
%.tmp4538 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4539 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4538, i32 0, i32 2
%.tmp4540 = load i8*, i8** %.tmp4539
%.tmp4541 = load i32, i32* %argno.4504
%.tmp4542 = sub i32 %.tmp4541, 1
%.tmp4543 = load i32, i32* %provided_args.4513
%.tmp4544 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4535, i8* %.tmp4537, i8* %.tmp4540, i32 %.tmp4542, i32 %.tmp4543)
%.tmp4545 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4546 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4547 = load i8*, i8** %tmp.4450
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4545, %m878$.Node.type* %.tmp4546, i8* %.tmp4547)
%.tmp4548 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4548
br label %.if.end.4534
.if.false.4534:
br label %.if.end.4534
.if.end.4534:
%.tmp4549 = load %m878$.Node.type*, %m878$.Node.type** %pp.4529
%.tmp4550 = load %m878$.Node.type*, %m878$.Node.type** %start.4503
%.tmp4551 = icmp ne %m878$.Node.type* %.tmp4549, %.tmp4550
br i1 %.tmp4551, label %.if.true.4552, label %.if.false.4552
.if.true.4552:
%.tmp4553 = getelementptr i8*, i8** %tmp.4450, i32 0
%.tmp4555 = getelementptr [5 x i8], [5 x i8]*@.str4554, i32 0, i32 0
%.tmp4556 = load i8*, i8** %params_buff.4449
%.tmp4557 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4553, i8* %.tmp4555, i8* %.tmp4556)
%.tmp4558 = load i8*, i8** %params_buff.4449
%tmp_buff.4559 = alloca i8*
store i8* %.tmp4558, i8** %tmp_buff.4559
%.tmp4560 = load i8*, i8** %tmp.4450
store i8* %.tmp4560, i8** %params_buff.4449
%.tmp4561 = load i8*, i8** %tmp_buff.4559
store i8* %.tmp4561, i8** %tmp.4450
%.tmp4562 = load i8*, i8** %tmp.4450
call void(i8*) @free(i8* %.tmp4562)
br label %.if.end.4552
.if.false.4552:
br label %.if.end.4552
.if.end.4552:
%.tmp4563 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4564 = load %m878$.Node.type*, %m878$.Node.type** %pp.4529
%.tmp4565 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4563, %m878$.Node.type* %.tmp4564)
%a_info.4566 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4565, %m2503$.AssignableInfo.type** %a_info.4566
%.tmp4567 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4566
%.tmp4568 = icmp eq %m2503$.AssignableInfo.type* %.tmp4567, null
br i1 %.tmp4568, label %.if.true.4569, label %.if.false.4569
.if.true.4569:
%.tmp4570 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4570
br label %.if.end.4569
.if.false.4569:
br label %.if.end.4569
.if.end.4569:
%.tmp4571 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4512
%.tmp4572 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp4571)
%exp.4573 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp4572, %m2503$.Type.type** %exp.4573
%.tmp4574 = load %m2503$.Type.type*, %m2503$.Type.type** %exp.4573
%.tmp4575 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4574, i32 0, i32 4
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp4575
%.tmp4576 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4512
%.tmp4577 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4576, i32 0, i32 0
%.tmp4578 = load i8*, i8** %.tmp4577
%.tmp4580 = getelementptr [7 x i8], [7 x i8]*@.str4579, i32 0, i32 0
%.tmp4581 = call i32(i8*,i8*) @strcmp(i8* %.tmp4578, i8* %.tmp4580)
%.tmp4582 = icmp ne i32 %.tmp4581, 0
%.tmp4583 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4584 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4566
%.tmp4585 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4584, i32 0, i32 4
%.tmp4586 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4585
%.tmp4587 = load %m2503$.Type.type*, %m2503$.Type.type** %exp.4573
%.tmp4588 = call i1(%m2503$.CompilerCtx.type*,%m2503$.Type.type*,%m2503$.Type.type*) @m295$is_same_type.b.m2503$.CompilerCtx.typep.m2503$.Type.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4583, %m2503$.Type.type* %.tmp4586, %m2503$.Type.type* %.tmp4587)
%.tmp4589 = icmp eq i1 %.tmp4588, 0
%.tmp4590 = and i1 %.tmp4582, %.tmp4589
br i1 %.tmp4590, label %.if.true.4591, label %.if.false.4591
.if.true.4591:
%.tmp4593 = getelementptr [1 x i8], [1 x i8]*@.str4592, i32 0, i32 0
%err_buf.4594 = alloca i8*
store i8* %.tmp4593, i8** %err_buf.4594
%.tmp4595 = getelementptr i8*, i8** %err_buf.4594, i32 0
%.tmp4597 = getelementptr [58 x i8], [58 x i8]*@.str4596, i32 0, i32 0
%.tmp4598 = load i32, i32* %argno.4504
%.tmp4599 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4600 = load %m2503$.Type.type*, %m2503$.Type.type** %exp.4573
%.tmp4601 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4599, %m2503$.Type.type* %.tmp4600)
%.tmp4602 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4603 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4566
%.tmp4604 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4603, i32 0, i32 4
%.tmp4605 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4604
%.tmp4606 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4602, %m2503$.Type.type* %.tmp4605)
%.tmp4607 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4595, i8* %.tmp4597, i32 %.tmp4598, i8* %.tmp4601, i8* %.tmp4606)
%.tmp4608 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4609 = load %m878$.Node.type*, %m878$.Node.type** %pp.4529
%.tmp4610 = load i8*, i8** %err_buf.4594
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4608, %m878$.Node.type* %.tmp4609, i8* %.tmp4610)
%.tmp4611 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4611
br label %.if.end.4591
.if.false.4591:
br label %.if.end.4591
.if.end.4591:
%.tmp4612 = getelementptr i8*, i8** %params_buff.4449, i32 0
%.tmp4614 = getelementptr [8 x i8], [8 x i8]*@.str4613, i32 0, i32 0
%.tmp4615 = load i8*, i8** %params_buff.4449
%.tmp4616 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4617 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4566
%.tmp4618 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4617, i32 0, i32 4
%.tmp4619 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4618
%.tmp4620 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4616, %m2503$.Type.type* %.tmp4619)
%.tmp4621 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4566
%.tmp4622 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4621)
%.tmp4623 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4612, i8* %.tmp4614, i8* %.tmp4615, i8* %.tmp4620, i8* %.tmp4622)
%.tmp4624 = load %m878$.Node.type*, %m878$.Node.type** %pp.4529
%.tmp4625 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4624, i32 0, i32 7
%.tmp4626 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4625
store %m878$.Node.type* %.tmp4626, %m878$.Node.type** %pp.4529
%.tmp4627 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4512
%.tmp4628 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4627, i32 0, i32 0
%.tmp4629 = load i8*, i8** %.tmp4628
%.tmp4631 = getelementptr [7 x i8], [7 x i8]*@.str4630, i32 0, i32 0
%.tmp4632 = call i32(i8*,i8*) @strcmp(i8* %.tmp4629, i8* %.tmp4631)
%.tmp4633 = icmp ne i32 %.tmp4632, 0
br i1 %.tmp4633, label %.if.true.4634, label %.if.false.4634
.if.true.4634:
%.tmp4635 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4512
%.tmp4636 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4635, i32 0, i32 4
%.tmp4637 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4636
store %m2503$.Type.type* %.tmp4637, %m2503$.Type.type** %expect_type.4512
br label %.if.end.4634
.if.false.4634:
br label %.if.end.4634
.if.end.4634:
%.tmp4638 = load i32, i32* %argno.4504
%.tmp4639 = add i32 %.tmp4638, 1
store i32 %.tmp4639, i32* %argno.4504
%.tmp4640 = load %m878$.Node.type*, %m878$.Node.type** %pp.4529
%.tmp4642 = getelementptr [11 x i8], [11 x i8]*@.str4641, i32 0, i32 0
%.tmp4643 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4640, i8* %.tmp4642)
store %m878$.Node.type* %.tmp4643, %m878$.Node.type** %pp.4529
br label %.for.start.4527
.for.end.4527:
%.tmp4644 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4512
%.tmp4645 = icmp ne %m2503$.Type.type* %.tmp4644, null
br i1 %.tmp4645, label %.if.true.4646, label %.if.false.4646
.if.true.4646:
%.tmp4647 = load %m2503$.Type.type*, %m2503$.Type.type** %expect_type.4512
%.tmp4648 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4647, i32 0, i32 0
%.tmp4649 = load i8*, i8** %.tmp4648
%.tmp4651 = getelementptr [7 x i8], [7 x i8]*@.str4650, i32 0, i32 0
%.tmp4652 = call i32(i8*,i8*) @strcmp(i8* %.tmp4649, i8* %.tmp4651)
%.tmp4653 = icmp ne i32 %.tmp4652, 0
br i1 %.tmp4653, label %.if.true.4654, label %.if.false.4654
.if.true.4654:
%.tmp4655 = getelementptr i8*, i8** %tmp.4450, i32 0
%.tmp4657 = getelementptr [43 x i8], [43 x i8]*@.str4656, i32 0, i32 0
%.tmp4658 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4659 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4658, i32 0, i32 2
%.tmp4660 = load i8*, i8** %.tmp4659
%.tmp4661 = load i32, i32* %argno.4504
%.tmp4662 = load i32, i32* %provided_args.4513
%.tmp4663 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4655, i8* %.tmp4657, i8* %.tmp4660, i32 %.tmp4661, i32 %.tmp4662)
%.tmp4664 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4665 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4666 = load i8*, i8** %tmp.4450
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4664, %m878$.Node.type* %.tmp4665, i8* %.tmp4666)
%.tmp4667 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4667
br label %.if.end.4654
.if.false.4654:
br label %.if.end.4654
.if.end.4654:
br label %.if.end.4646
.if.false.4646:
br label %.if.end.4646
.if.end.4646:
br label %.if.end.4496
.if.false.4496:
%.tmp4668 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4669 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4668, i32 0, i32 4
%.tmp4670 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4669
%.tmp4671 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4670, i32 0, i32 3
%.tmp4672 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4671
%.tmp4673 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4672, i32 0, i32 4
%.tmp4674 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4673
%.tmp4675 = icmp ne %m2503$.Type.type* %.tmp4674, null
br i1 %.tmp4675, label %.if.true.4676, label %.if.false.4676
.if.true.4676:
%args_required.4677 = alloca i32
store i32 0, i32* %args_required.4677
%.tmp4679 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4680 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4679, i32 0, i32 4
%.tmp4681 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4680
%.tmp4682 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4681, i32 0, i32 3
%.tmp4683 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4682
%.tmp4684 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4683, i32 0, i32 4
%.tmp4685 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4684
%pp.4686 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp4685, %m2503$.Type.type** %pp.4686
br label %.for.start.4678
.for.start.4678:
%.tmp4687 = load %m2503$.Type.type*, %m2503$.Type.type** %pp.4686
%.tmp4688 = icmp ne %m2503$.Type.type* %.tmp4687, null
br i1 %.tmp4688, label %.for.continue.4678, label %.for.else.4678
.for.continue.4678:
%.tmp4689 = load %m2503$.Type.type*, %m2503$.Type.type** %pp.4686
%.tmp4690 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4689, i32 0, i32 0
%.tmp4691 = load i8*, i8** %.tmp4690
%.tmp4693 = getelementptr [7 x i8], [7 x i8]*@.str4692, i32 0, i32 0
%.tmp4694 = call i32(i8*,i8*) @strcmp(i8* %.tmp4691, i8* %.tmp4693)
%.tmp4695 = icmp eq i32 %.tmp4694, 0
br i1 %.tmp4695, label %.if.true.4696, label %.if.false.4696
.if.true.4696:
br label %.for.end.4678
br label %.if.end.4696
.if.false.4696:
br label %.if.end.4696
.if.end.4696:
%.tmp4697 = load i32, i32* %args_required.4677
%.tmp4698 = add i32 %.tmp4697, 1
store i32 %.tmp4698, i32* %args_required.4677
%.tmp4699 = load %m2503$.Type.type*, %m2503$.Type.type** %pp.4686
%.tmp4700 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4699, i32 0, i32 4
%.tmp4701 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4700
store %m2503$.Type.type* %.tmp4701, %m2503$.Type.type** %pp.4686
br label %.for.start.4678
.for.else.4678:
%.tmp4702 = getelementptr i8*, i8** %tmp.4450, i32 0
%.tmp4704 = getelementptr [42 x i8], [42 x i8]*@.str4703, i32 0, i32 0
%.tmp4705 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4706 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4705, i32 0, i32 2
%.tmp4707 = load i8*, i8** %.tmp4706
%.tmp4708 = load i32, i32* %args_required.4677
%.tmp4709 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4702, i8* %.tmp4704, i8* %.tmp4707, i32 %.tmp4708)
%.tmp4710 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4711 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4712 = load i8*, i8** %tmp.4450
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4710, %m878$.Node.type* %.tmp4711, i8* %.tmp4712)
%.tmp4713 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4713
br label %.for.end.4678
.for.end.4678:
br label %.if.end.4676
.if.false.4676:
br label %.if.end.4676
.if.end.4676:
br label %.if.end.4496
.if.end.4496:
%.tmp4714 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4715 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4716 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4715, i32 0, i32 4
%.tmp4717 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4716
%.tmp4718 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4717, i32 0, i32 3
%.tmp4719 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4718
%.tmp4720 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4714, %m2503$.Type.type* %.tmp4719)
%.tmp4722 = getelementptr [5 x i8], [5 x i8]*@.str4721, i32 0, i32 0
%.tmp4723 = call i32(i8*,i8*) @strcmp(i8* %.tmp4720, i8* %.tmp4722)
%.tmp4724 = icmp eq i32 %.tmp4723, 0
br i1 %.tmp4724, label %.if.true.4725, label %.if.false.4725
.if.true.4725:
%.tmp4726 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4727 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4726, i32 0, i32 1
%.tmp4728 = load %m0$.File.type*, %m0$.File.type** %.tmp4727
%.tmp4730 = getelementptr [16 x i8], [16 x i8]*@.str4729, i32 0, i32 0
%.tmp4731 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4732 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4733 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4732, i32 0, i32 4
%.tmp4734 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4733
%.tmp4735 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4731, %m2503$.Type.type* %.tmp4734)
%.tmp4736 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4737 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4736)
%.tmp4738 = load i8*, i8** %params_buff.4449
%.tmp4739 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4728, i8* %.tmp4730, i8* %.tmp4735, i8* %.tmp4737, i8* %.tmp4738)
%.tmp4740 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4740
br label %.if.end.4725
.if.false.4725:
br label %.if.end.4725
.if.end.4725:
%.tmp4741 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4742 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp4741)
%call_info.4743 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4742, %m2503$.AssignableInfo.type** %call_info.4743
%.tmp4744 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4745 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %call_info.4743
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp4744, %m2503$.AssignableInfo.type* %.tmp4745)
%.tmp4746 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %call_info.4743
%.tmp4747 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4746, i32 0, i32 4
%.tmp4748 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4749 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4748, i32 0, i32 4
%.tmp4750 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4749
%.tmp4751 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4750, i32 0, i32 3
%.tmp4752 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4751
%.tmp4753 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp4752)
store %m2503$.Type.type* %.tmp4753, %m2503$.Type.type** %.tmp4747
%.tmp4754 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %call_info.4743
%.tmp4755 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4754, i32 0, i32 4
%.tmp4756 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4755
%.tmp4757 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp4756, i32 0, i32 4
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp4757
%.tmp4758 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4759 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4758, i32 0, i32 1
%.tmp4760 = load %m0$.File.type*, %m0$.File.type** %.tmp4759
%.tmp4762 = getelementptr [21 x i8], [21 x i8]*@.str4761, i32 0, i32 0
%.tmp4763 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %call_info.4743
%.tmp4764 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4763)
%.tmp4765 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4766 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4767 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4766, i32 0, i32 4
%.tmp4768 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4767
%.tmp4769 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4765, %m2503$.Type.type* %.tmp4768)
%.tmp4770 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4422
%.tmp4771 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4770)
%.tmp4772 = load i8*, i8** %params_buff.4449
%.tmp4773 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4760, i8* %.tmp4762, i8* %.tmp4764, i8* %.tmp4769, i8* %.tmp4771, i8* %.tmp4772)
%.tmp4774 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %call_info.4743
%.tmp4775 = bitcast %m2503$.AssignableInfo.type* %.tmp4774 to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp4775
}
define void @m295$compile_expression.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%err_msg.4776 = alloca i8*
store i8* null, i8** %err_msg.4776
%.tmp4777 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4778 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4777, i32 0, i32 0
%.tmp4779 = load i8*, i8** %.tmp4778
%expr_type.4780 = alloca i8*
store i8* %.tmp4779, i8** %expr_type.4780
%.tmp4781 = bitcast ptr null to %m2503$.AssignableInfo.type*
%info.4782 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4781, %m2503$.AssignableInfo.type** %info.4782
%assignable.4783 = alloca %m878$.Node.type*
store %m878$.Node.type* null, %m878$.Node.type** %assignable.4783
%.tmp4784 = bitcast ptr null to %m2503$.AssignableInfo.type*
%a_info.4785 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4784, %m2503$.AssignableInfo.type** %a_info.4785
%.tmp4786 = load i8*, i8** %expr_type.4780
%.tmp4788 = getelementptr [7 x i8], [7 x i8]*@.str4787, i32 0, i32 0
%.tmp4789 = call i32(i8*,i8*) @strcmp(i8* %.tmp4786, i8* %.tmp4788)
%.tmp4790 = icmp eq i32 %.tmp4789, 0
br i1 %.tmp4790, label %.if.true.4791, label %.if.false.4791
.if.true.4791:
%.tmp4792 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4793 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4792, i32 0, i32 6
%.tmp4794 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4793
%.tmp4795 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4794, i32 0, i32 7
%.tmp4796 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4795
%.tmp4797 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4796, i32 0, i32 0
%.tmp4798 = load i8*, i8** %.tmp4797
%.tmp4800 = getelementptr [3 x i8], [3 x i8]*@.str4799, i32 0, i32 0
%.tmp4801 = call i32(i8*,i8*) @strcmp(i8* %.tmp4798, i8* %.tmp4800)
%.tmp4802 = icmp ne i32 %.tmp4801, 0
br i1 %.tmp4802, label %.if.true.4803, label %.if.false.4803
.if.true.4803:
%.tmp4804 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4805 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4806 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4805, i32 0, i32 6
%.tmp4807 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4806
%.tmp4808 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4807, i32 0, i32 7
%.tmp4809 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4808
%.tmp4810 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4804, %m878$.Node.type* %.tmp4809)
store %m2503$.AssignableInfo.type* %.tmp4810, %m2503$.AssignableInfo.type** %info.4782
%.tmp4811 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4782
%.tmp4812 = icmp eq %m2503$.AssignableInfo.type* %.tmp4811, null
br i1 %.tmp4812, label %.if.true.4813, label %.if.false.4813
.if.true.4813:
ret void
br label %.if.end.4813
.if.false.4813:
br label %.if.end.4813
.if.end.4813:
%.tmp4814 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4815 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4814, i32 0, i32 1
%.tmp4816 = load %m0$.File.type*, %m0$.File.type** %.tmp4815
%.tmp4818 = getelementptr [11 x i8], [11 x i8]*@.str4817, i32 0, i32 0
%.tmp4819 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4820 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4782
%.tmp4821 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4820, i32 0, i32 4
%.tmp4822 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4821
%.tmp4823 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4819, %m2503$.Type.type* %.tmp4822)
%.tmp4824 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.4782
%.tmp4825 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4824)
%.tmp4826 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4816, i8* %.tmp4818, i8* %.tmp4823, i8* %.tmp4825)
br label %.if.end.4803
.if.false.4803:
%.tmp4827 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4828 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4827, i32 0, i32 1
%.tmp4829 = load %m0$.File.type*, %m0$.File.type** %.tmp4828
%.tmp4831 = getelementptr [10 x i8], [10 x i8]*@.str4830, i32 0, i32 0
%.tmp4832 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4829, i8* %.tmp4831)
br label %.if.end.4803
.if.end.4803:
br label %.if.end.4791
.if.false.4791:
%.tmp4833 = load i8*, i8** %expr_type.4780
%.tmp4835 = getelementptr [3 x i8], [3 x i8]*@.str4834, i32 0, i32 0
%.tmp4836 = call i32(i8*,i8*) @strcmp(i8* %.tmp4833, i8* %.tmp4835)
%.tmp4837 = icmp eq i32 %.tmp4836, 0
br i1 %.tmp4837, label %.if.true.4838, label %.if.false.4838
.if.true.4838:
br label %.if.end.4838
.if.false.4838:
%.tmp4839 = load i8*, i8** %expr_type.4780
%.tmp4841 = getelementptr [8 x i8], [8 x i8]*@.str4840, i32 0, i32 0
%.tmp4842 = call i32(i8*,i8*) @strcmp(i8* %.tmp4839, i8* %.tmp4841)
%.tmp4843 = icmp eq i32 %.tmp4842, 0
br i1 %.tmp4843, label %.if.true.4844, label %.if.false.4844
.if.true.4844:
%.tmp4845 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4846 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4847 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4846, i32 0, i32 6
%.tmp4848 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4847
%.tmp4849 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_fn_call.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4845, %m878$.Node.type* %.tmp4848)
br label %.if.end.4844
.if.false.4844:
%.tmp4850 = load i8*, i8** %expr_type.4780
%.tmp4852 = getelementptr [12 x i8], [12 x i8]*@.str4851, i32 0, i32 0
%.tmp4853 = call i32(i8*,i8*) @strcmp(i8* %.tmp4850, i8* %.tmp4852)
%.tmp4854 = icmp eq i32 %.tmp4853, 0
br i1 %.tmp4854, label %.if.true.4855, label %.if.false.4855
.if.true.4855:
%.tmp4856 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4857 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4858 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_declaration.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4856, %m878$.Node.type* %.tmp4857)
br label %.if.end.4855
.if.false.4855:
%.tmp4859 = load i8*, i8** %expr_type.4780
%.tmp4861 = getelementptr [11 x i8], [11 x i8]*@.str4860, i32 0, i32 0
%.tmp4862 = call i32(i8*,i8*) @strcmp(i8* %.tmp4859, i8* %.tmp4861)
%.tmp4863 = icmp eq i32 %.tmp4862, 0
br i1 %.tmp4863, label %.if.true.4864, label %.if.false.4864
.if.true.4864:
%.tmp4865 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4866 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4865, i32 0, i32 6
%.tmp4867 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4866
%.tmp4869 = getelementptr [11 x i8], [11 x i8]*@.str4868, i32 0, i32 0
%.tmp4870 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp4867, i8* %.tmp4869)
store %m878$.Node.type* %.tmp4870, %m878$.Node.type** %assignable.4783
%.tmp4871 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4872 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4873 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4872, i32 0, i32 6
%.tmp4874 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4873
%.tmp4875 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4871, %m878$.Node.type* %.tmp4874)
%dest.4876 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp4875, %m2503$.AssignableInfo.type** %dest.4876
%.tmp4877 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %dest.4876
%.tmp4878 = icmp eq %m2503$.AssignableInfo.type* %.tmp4877, null
br i1 %.tmp4878, label %.if.true.4879, label %.if.false.4879
.if.true.4879:
ret void
br label %.if.end.4879
.if.false.4879:
br label %.if.end.4879
.if.end.4879:
%.tmp4880 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4881 = load %m878$.Node.type*, %m878$.Node.type** %assignable.4783
%.tmp4882 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4880, %m878$.Node.type* %.tmp4881)
store %m2503$.AssignableInfo.type* %.tmp4882, %m2503$.AssignableInfo.type** %a_info.4785
%.tmp4883 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4785
%.tmp4884 = icmp eq %m2503$.AssignableInfo.type* %.tmp4883, null
br i1 %.tmp4884, label %.if.true.4885, label %.if.false.4885
.if.true.4885:
ret void
br label %.if.end.4885
.if.false.4885:
br label %.if.end.4885
.if.end.4885:
%.tmp4886 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4887 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %dest.4876
%.tmp4888 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4887, i32 0, i32 4
%.tmp4889 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4888
%.tmp4890 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4886, %m2503$.Type.type* %.tmp4889)
%dest_tr.4891 = alloca i8*
store i8* %.tmp4890, i8** %dest_tr.4891
%.tmp4892 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4893 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4785
%.tmp4894 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp4893, i32 0, i32 4
%.tmp4895 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp4894
%.tmp4896 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp4892, %m2503$.Type.type* %.tmp4895)
%src_tr.4897 = alloca i8*
store i8* %.tmp4896, i8** %src_tr.4897
%.tmp4898 = load i8*, i8** %src_tr.4897
%.tmp4900 = getelementptr [4 x i8], [4 x i8]*@.str4899, i32 0, i32 0
%.tmp4901 = call i32(i8*,i8*) @strcmp(i8* %.tmp4898, i8* %.tmp4900)
%.tmp4902 = icmp eq i32 %.tmp4901, 0
br i1 %.tmp4902, label %.if.true.4903, label %.if.false.4903
.if.true.4903:
%.tmp4904 = load i8*, i8** %dest_tr.4891
store i8* %.tmp4904, i8** %src_tr.4897
br label %.if.end.4903
.if.false.4903:
br label %.if.end.4903
.if.end.4903:
%.tmp4905 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4906 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4905, i32 0, i32 1
%.tmp4907 = load %m0$.File.type*, %m0$.File.type** %.tmp4906
%.tmp4909 = getelementptr [21 x i8], [21 x i8]*@.str4908, i32 0, i32 0
%.tmp4910 = load i8*, i8** %src_tr.4897
%.tmp4911 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.4785
%.tmp4912 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4911)
%.tmp4913 = load i8*, i8** %dest_tr.4891
%.tmp4914 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %dest.4876
%.tmp4915 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp4914)
%.tmp4916 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4907, i8* %.tmp4909, i8* %.tmp4910, i8* %.tmp4912, i8* %.tmp4913, i8* %.tmp4915)
br label %.if.end.4864
.if.false.4864:
%.tmp4917 = load i8*, i8** %expr_type.4780
%.tmp4919 = getelementptr [9 x i8], [9 x i8]*@.str4918, i32 0, i32 0
%.tmp4920 = call i32(i8*,i8*) @strcmp(i8* %.tmp4917, i8* %.tmp4919)
%.tmp4921 = icmp eq i32 %.tmp4920, 0
br i1 %.tmp4921, label %.if.true.4922, label %.if.false.4922
.if.true.4922:
%.tmp4923 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4924 = load %m878$.Node.type*, %m878$.Node.type** %stmt
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_if_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4923, %m878$.Node.type* %.tmp4924)
br label %.if.end.4922
.if.false.4922:
%.tmp4925 = load i8*, i8** %expr_type.4780
%.tmp4927 = getelementptr [9 x i8], [9 x i8]*@.str4926, i32 0, i32 0
%.tmp4928 = call i32(i8*,i8*) @strcmp(i8* %.tmp4925, i8* %.tmp4927)
%.tmp4929 = icmp eq i32 %.tmp4928, 0
br i1 %.tmp4929, label %.if.true.4930, label %.if.false.4930
.if.true.4930:
%.tmp4931 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4932 = load %m878$.Node.type*, %m878$.Node.type** %stmt
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_for_loop.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp4931, %m878$.Node.type* %.tmp4932)
br label %.if.end.4930
.if.false.4930:
%.tmp4933 = load i8*, i8** %expr_type.4780
%.tmp4935 = getelementptr [8 x i8], [8 x i8]*@.str4934, i32 0, i32 0
%.tmp4936 = call i32(i8*,i8*) @strcmp(i8* %.tmp4933, i8* %.tmp4935)
%.tmp4937 = icmp eq i32 %.tmp4936, 0
br i1 %.tmp4937, label %.if.true.4938, label %.if.false.4938
.if.true.4938:
%.tmp4939 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4940 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp4939)
%mod.4941 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp4940, %m2503$.ModuleLookup.type** %mod.4941
%.tmp4942 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.4941
%.tmp4943 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp4942, i32 0, i32 3
%.tmp4944 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp4943
%s.4945 = alloca %m2503$.Scope.type*
store %m2503$.Scope.type* %.tmp4944, %m2503$.Scope.type** %s.4945
%.tmp4946 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4947 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4946, i32 0, i32 6
%.tmp4948 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4947
%.tmp4949 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4948, i32 0, i32 1
%.tmp4950 = load i8*, i8** %.tmp4949
%.tmp4952 = getelementptr [6 x i8], [6 x i8]*@.str4951, i32 0, i32 0
%.tmp4953 = call i32(i8*,i8*) @strcmp(i8* %.tmp4950, i8* %.tmp4952)
%.tmp4954 = icmp eq i32 %.tmp4953, 0
br i1 %.tmp4954, label %.if.true.4955, label %.if.false.4955
.if.true.4955:
br label %.for.start.4956
.for.start.4956:
%.tmp4957 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.4945
%.tmp4958 = icmp ne %m2503$.Scope.type* %.tmp4957, null
br i1 %.tmp4958, label %.for.continue.4956, label %.for.else.4956
.for.continue.4956:
%.tmp4959 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.4945
%.tmp4960 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp4959, i32 0, i32 2
%.tmp4961 = load i8*, i8** %.tmp4960
%.tmp4963 = getelementptr [4 x i8], [4 x i8]*@.str4962, i32 0, i32 0
%.tmp4964 = call i32(i8*,i8*) @strcmp(i8* %.tmp4961, i8* %.tmp4963)
%.tmp4965 = icmp eq i32 %.tmp4964, 0
br i1 %.tmp4965, label %.if.true.4966, label %.if.false.4966
.if.true.4966:
%.tmp4967 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4968 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp4967, i32 0, i32 1
%.tmp4969 = load %m0$.File.type*, %m0$.File.type** %.tmp4968
%.tmp4971 = getelementptr [15 x i8], [15 x i8]*@.str4970, i32 0, i32 0
%.tmp4972 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.4945
%.tmp4973 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp4972, i32 0, i32 4
%.tmp4974 = load i8*, i8** %.tmp4973
%.tmp4975 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4969, i8* %.tmp4971, i8* %.tmp4974)
br label %.for.end.4956
br label %.if.end.4966
.if.false.4966:
br label %.if.end.4966
.if.end.4966:
%.tmp4976 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.4945
%.tmp4977 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp4976, i32 0, i32 5
%.tmp4978 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp4977
store %m2503$.Scope.type* %.tmp4978, %m2503$.Scope.type** %s.4945
br label %.for.start.4956
.for.else.4956:
%.tmp4979 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp4980 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4982 = getelementptr [48 x i8], [48 x i8]*@.str4981, i32 0, i32 0
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp4979, %m878$.Node.type* %.tmp4980, i8* %.tmp4982)
br label %.for.end.4956
.for.end.4956:
br label %.if.end.4955
.if.false.4955:
%.tmp4983 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp4984 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4983, i32 0, i32 6
%.tmp4985 = load %m878$.Node.type*, %m878$.Node.type** %.tmp4984
%.tmp4986 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp4985, i32 0, i32 1
%.tmp4987 = load i8*, i8** %.tmp4986
%.tmp4989 = getelementptr [9 x i8], [9 x i8]*@.str4988, i32 0, i32 0
%.tmp4990 = call i32(i8*,i8*) @strcmp(i8* %.tmp4987, i8* %.tmp4989)
%.tmp4991 = icmp eq i32 %.tmp4990, 0
br i1 %.tmp4991, label %.if.true.4992, label %.if.false.4992
.if.true.4992:
br label %.for.start.4993
.for.start.4993:
%.tmp4994 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.4945
%.tmp4995 = icmp ne %m2503$.Scope.type* %.tmp4994, null
br i1 %.tmp4995, label %.for.continue.4993, label %.for.else.4993
.for.continue.4993:
%.tmp4996 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.4945
%.tmp4997 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp4996, i32 0, i32 2
%.tmp4998 = load i8*, i8** %.tmp4997
%.tmp5000 = getelementptr [4 x i8], [4 x i8]*@.str4999, i32 0, i32 0
%.tmp5001 = call i32(i8*,i8*) @strcmp(i8* %.tmp4998, i8* %.tmp5000)
%.tmp5002 = icmp eq i32 %.tmp5001, 0
br i1 %.tmp5002, label %.if.true.5003, label %.if.false.5003
.if.true.5003:
%.tmp5004 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5005 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5004, i32 0, i32 1
%.tmp5006 = load %m0$.File.type*, %m0$.File.type** %.tmp5005
%.tmp5008 = getelementptr [15 x i8], [15 x i8]*@.str5007, i32 0, i32 0
%.tmp5009 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.4945
%.tmp5010 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp5009, i32 0, i32 3
%.tmp5011 = load i8*, i8** %.tmp5010
%.tmp5012 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5006, i8* %.tmp5008, i8* %.tmp5011)
br label %.for.end.4993
br label %.if.end.5003
.if.false.5003:
br label %.if.end.5003
.if.end.5003:
%.tmp5013 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.4945
%.tmp5014 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp5013, i32 0, i32 5
%.tmp5015 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp5014
store %m2503$.Scope.type* %.tmp5015, %m2503$.Scope.type** %s.4945
br label %.for.start.4993
.for.else.4993:
%.tmp5016 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5017 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5019 = getelementptr [51 x i8], [51 x i8]*@.str5018, i32 0, i32 0
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5016, %m878$.Node.type* %.tmp5017, i8* %.tmp5019)
br label %.for.end.4993
.for.end.4993:
br label %.if.end.4992
.if.false.4992:
%.tmp5020 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5021 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5023 = getelementptr [40 x i8], [40 x i8]*@.str5022, i32 0, i32 0
%.tmp5024 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5020, %m878$.Node.type* %.tmp5021, i8* %.tmp5023)
%.tmp5025 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5026 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5025, i32 0, i32 6
%.tmp5027 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5026
%.tmp5028 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5027, i32 0, i32 1
%.tmp5029 = load i8*, i8** %.tmp5028
%.tmp5030 = call i32(i8*,...) @printf(i8* %.tmp5024, i8* %.tmp5029)
br label %.if.end.4992
.if.end.4992:
br label %.if.end.4955
.if.end.4955:
br label %.if.end.4938
.if.false.4938:
%.tmp5031 = load i8*, i8** %expr_type.4780
%.tmp5033 = getelementptr [9 x i8], [9 x i8]*@.str5032, i32 0, i32 0
%.tmp5034 = call i32(i8*,i8*) @strcmp(i8* %.tmp5031, i8* %.tmp5033)
%.tmp5035 = icmp eq i32 %.tmp5034, 0
br i1 %.tmp5035, label %.if.true.5036, label %.if.false.5036
.if.true.5036:
%.tmp5037 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5038 = load %m878$.Node.type*, %m878$.Node.type** %stmt
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_closure.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5037, %m878$.Node.type* %.tmp5038)
br label %.if.end.5036
.if.false.5036:
%.tmp5039 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5040 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5042 = getelementptr [34 x i8], [34 x i8]*@.str5041, i32 0, i32 0
%.tmp5043 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5039, %m878$.Node.type* %.tmp5040, i8* %.tmp5042)
%.tmp5044 = load i8*, i8** %expr_type.4780
%.tmp5045 = call i32(i8*,...) @printf(i8* %.tmp5043, i8* %.tmp5044)
br label %.if.end.5036
.if.end.5036:
br label %.if.end.4938
.if.end.4938:
br label %.if.end.4930
.if.end.4930:
br label %.if.end.4922
.if.end.4922:
br label %.if.end.4864
.if.end.4864:
br label %.if.end.4855
.if.end.4855:
br label %.if.end.4844
.if.end.4844:
br label %.if.end.4838
.if.end.4838:
br label %.if.end.4791
.if.end.4791:
ret void
}
define %m2503$.Type.type* @m295$type_ptr_of_chr.m2503$.Type.typep() {
%.tmp5046 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%t.5047 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp5046, %m2503$.Type.type** %t.5047
%.tmp5048 = load %m2503$.Type.type*, %m2503$.Type.type** %t.5047
%.tmp5049 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5048, i32 0, i32 0
%.tmp5051 = getelementptr [4 x i8], [4 x i8]*@.str5050, i32 0, i32 0
store i8* %.tmp5051, i8** %.tmp5049
%.tmp5052 = load %m2503$.Type.type*, %m2503$.Type.type** %t.5047
%.tmp5053 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5052, i32 0, i32 3
%.tmp5054 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5054, %m2503$.Type.type** %.tmp5053
%.tmp5055 = load %m2503$.Type.type*, %m2503$.Type.type** %t.5047
%.tmp5056 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5055, i32 0, i32 3
%.tmp5057 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5056
%.tmp5058 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5057, i32 0, i32 0
%.tmp5060 = getelementptr [4 x i8], [4 x i8]*@.str5059, i32 0, i32 0
store i8* %.tmp5060, i8** %.tmp5058
%.tmp5061 = load %m2503$.Type.type*, %m2503$.Type.type** %t.5047
ret %m2503$.Type.type* %.tmp5061
}
define void @m295$compile_closure.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp5062 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5063 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5062)
%cj_id.5064 = alloca i32
store i32 %.tmp5063, i32* %cj_id.5064
%.tmp5065 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5066 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp5065)
%info_lit.5067 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5066, %m2503$.AssignableInfo.type** %info_lit.5067
%.tmp5068 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5067
%.tmp5069 = load i8, i8* @SCOPE_GLOBAL
%.tmp5071 = getelementptr [21 x i8], [21 x i8]*@.str5070, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp5068, i8 %.tmp5069, i8* %.tmp5071)
%.tmp5072 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5067
%.tmp5073 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5072, i32 0, i32 4
%.tmp5074 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5074, %m2503$.Type.type** %.tmp5073
%.tmp5075 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5067
%.tmp5076 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5075, i32 0, i32 4
%.tmp5077 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5076
%.tmp5078 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5077, i32 0, i32 0
%.tmp5080 = getelementptr [9 x i8], [9 x i8]*@.str5079, i32 0, i32 0
store i8* %.tmp5080, i8** %.tmp5078
%.tmp5081 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5067
%.tmp5082 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5081, i32 0, i32 4
%.tmp5083 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5082
%.tmp5084 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5083, i32 0, i32 3
%.tmp5085 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5085, %m2503$.Type.type** %.tmp5084
%.tmp5086 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5067
%.tmp5087 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5086, i32 0, i32 4
%.tmp5088 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5087
%.tmp5089 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5088, i32 0, i32 3
%.tmp5090 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5089
%.tmp5091 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5090, i32 0, i32 0
%.tmp5093 = getelementptr [5 x i8], [5 x i8]*@.str5092, i32 0, i32 0
store i8* %.tmp5093, i8** %.tmp5091
%.tmp5094 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5067
%.tmp5095 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5094, i32 0, i32 4
%.tmp5096 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5095
%.tmp5097 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5096, i32 0, i32 3
%.tmp5098 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5097
%.tmp5099 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5098, i32 0, i32 4
%.tmp5100 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5100, %m2503$.Type.type** %.tmp5099
%.tmp5101 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5067
%.tmp5102 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5101, i32 0, i32 4
%.tmp5103 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5102
%.tmp5104 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5103, i32 0, i32 3
%.tmp5105 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5104
%.tmp5106 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5105, i32 0, i32 4
%.tmp5107 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5106
%.tmp5108 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5107, i32 0, i32 4
%.tmp5109 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5109, %m2503$.Type.type** %.tmp5108
%.tmp5110 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5067
%.tmp5111 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5110, i32 0, i32 4
%.tmp5112 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5111
%.tmp5113 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5112, i32 0, i32 3
%.tmp5114 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5113
%.tmp5115 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5114, i32 0, i32 4
%.tmp5116 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5115
%.tmp5117 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5116, i32 0, i32 4
%.tmp5118 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5117
%.tmp5119 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5118, i32 0, i32 4
%.tmp5120 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5120, %m2503$.Type.type** %.tmp5119
%.tmp5121 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5123 = getelementptr [21 x i8], [21 x i8]*@.str5122, i32 0, i32 0
%.tmp5125 = getelementptr [7 x i8], [7 x i8]*@.str5124, i32 0, i32 0
%.tmp5126 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lit.5067
call void(%m2503$.CompilerCtx.type*,i8*,i8*,%m2503$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2503$.CompilerCtx.typep.cp.cp.m2503$.AssignableInfo.typep.b.b(%m2503$.CompilerCtx.type* %.tmp5121, i8* %.tmp5123, i8* %.tmp5125, %m2503$.AssignableInfo.type* %.tmp5126, i1 1, i1 0)
%.tmp5127 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5128 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp5127)
%info_lat.5129 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5128, %m2503$.AssignableInfo.type** %info_lat.5129
%.tmp5130 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lat.5129
%.tmp5131 = load i8, i8* @SCOPE_GLOBAL
%.tmp5133 = getelementptr [23 x i8], [23 x i8]*@.str5132, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp5130, i8 %.tmp5131, i8* %.tmp5133)
%.tmp5134 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lat.5129
%.tmp5135 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5134, i32 0, i32 4
%.tmp5136 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5136, %m2503$.Type.type** %.tmp5135
%.tmp5137 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lat.5129
%.tmp5138 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5137, i32 0, i32 4
%.tmp5139 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5138
%.tmp5140 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5139, i32 0, i32 0
%.tmp5142 = getelementptr [9 x i8], [9 x i8]*@.str5141, i32 0, i32 0
store i8* %.tmp5142, i8** %.tmp5140
%.tmp5143 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lat.5129
%.tmp5144 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5143, i32 0, i32 4
%.tmp5145 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5144
%.tmp5146 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5145, i32 0, i32 3
%.tmp5147 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5147, %m2503$.Type.type** %.tmp5146
%.tmp5148 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lat.5129
%.tmp5149 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5148, i32 0, i32 4
%.tmp5150 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5149
%.tmp5151 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5150, i32 0, i32 3
%.tmp5152 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5151
%.tmp5153 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5152, i32 0, i32 4
%.tmp5154 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5154, %m2503$.Type.type** %.tmp5153
%.tmp5155 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5157 = getelementptr [23 x i8], [23 x i8]*@.str5156, i32 0, i32 0
%.tmp5159 = getelementptr [7 x i8], [7 x i8]*@.str5158, i32 0, i32 0
%.tmp5160 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_lat.5129
call void(%m2503$.CompilerCtx.type*,i8*,i8*,%m2503$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2503$.CompilerCtx.typep.cp.cp.m2503$.AssignableInfo.typep.b.b(%m2503$.CompilerCtx.type* %.tmp5155, i8* %.tmp5157, i8* %.tmp5159, %m2503$.AssignableInfo.type* %.tmp5160, i1 1, i1 0)
%.tmp5161 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5162 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp5161)
%info_mmap.5163 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5162, %m2503$.AssignableInfo.type** %info_mmap.5163
%.tmp5164 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_mmap.5163
%.tmp5165 = load i8, i8* @SCOPE_GLOBAL
%.tmp5167 = getelementptr [5 x i8], [5 x i8]*@.str5166, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp5164, i8 %.tmp5165, i8* %.tmp5167)
%.tmp5168 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_mmap.5163
%.tmp5169 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5168, i32 0, i32 4
%.tmp5170 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5170, %m2503$.Type.type** %.tmp5169
%.tmp5171 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_mmap.5163
%.tmp5172 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5171, i32 0, i32 4
%.tmp5173 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5172
%.tmp5174 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5173, i32 0, i32 0
%.tmp5176 = getelementptr [9 x i8], [9 x i8]*@.str5175, i32 0, i32 0
store i8* %.tmp5176, i8** %.tmp5174
%.tmp5177 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_mmap.5163
%.tmp5178 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5177, i32 0, i32 4
%.tmp5179 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5178
%.tmp5180 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5179, i32 0, i32 3
%.tmp5181 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5181, %m2503$.Type.type** %.tmp5180
%.tmp5182 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_mmap.5163
%.tmp5183 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5182, i32 0, i32 4
%.tmp5184 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5183
%.tmp5185 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5184, i32 0, i32 3
%.tmp5186 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5185
%lt.5187 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp5186, %m2503$.Type.type** %lt.5187
%.tmp5188 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5189 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5188, i32 0, i32 4
%.tmp5190 = call %m2503$.Type.type*() @m295$type_ptr_of_chr.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5190, %m2503$.Type.type** %.tmp5189
%.tmp5191 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5192 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5191, i32 0, i32 4
%.tmp5193 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5192
store %m2503$.Type.type* %.tmp5193, %m2503$.Type.type** %lt.5187
%.tmp5194 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5195 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5194, i32 0, i32 4
%.tmp5196 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5196, %m2503$.Type.type** %.tmp5195
%.tmp5197 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5198 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5197, i32 0, i32 4
%.tmp5199 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5198
%.tmp5200 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5199, i32 0, i32 0
%.tmp5202 = getelementptr [4 x i8], [4 x i8]*@.str5201, i32 0, i32 0
store i8* %.tmp5202, i8** %.tmp5200
%.tmp5203 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5204 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5203, i32 0, i32 4
%.tmp5205 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5204
store %m2503$.Type.type* %.tmp5205, %m2503$.Type.type** %lt.5187
%.tmp5206 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5207 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5206, i32 0, i32 4
%.tmp5208 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5208, %m2503$.Type.type** %.tmp5207
%.tmp5209 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5210 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5209, i32 0, i32 4
%.tmp5211 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5210
%.tmp5212 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5211, i32 0, i32 0
%.tmp5214 = getelementptr [4 x i8], [4 x i8]*@.str5213, i32 0, i32 0
store i8* %.tmp5214, i8** %.tmp5212
%.tmp5215 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5216 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5215, i32 0, i32 4
%.tmp5217 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5216
store %m2503$.Type.type* %.tmp5217, %m2503$.Type.type** %lt.5187
%.tmp5218 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5219 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5218, i32 0, i32 4
%.tmp5220 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5220, %m2503$.Type.type** %.tmp5219
%.tmp5221 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5222 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5221, i32 0, i32 4
%.tmp5223 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5222
%.tmp5224 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5223, i32 0, i32 0
%.tmp5226 = getelementptr [4 x i8], [4 x i8]*@.str5225, i32 0, i32 0
store i8* %.tmp5226, i8** %.tmp5224
%.tmp5227 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5228 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5227, i32 0, i32 4
%.tmp5229 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5228
store %m2503$.Type.type* %.tmp5229, %m2503$.Type.type** %lt.5187
%.tmp5230 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5231 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5230, i32 0, i32 4
%.tmp5232 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5232, %m2503$.Type.type** %.tmp5231
%.tmp5233 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5234 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5233, i32 0, i32 4
%.tmp5235 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5234
%.tmp5236 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5235, i32 0, i32 0
%.tmp5238 = getelementptr [4 x i8], [4 x i8]*@.str5237, i32 0, i32 0
store i8* %.tmp5238, i8** %.tmp5236
%.tmp5239 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5240 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5239, i32 0, i32 4
%.tmp5241 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5240
store %m2503$.Type.type* %.tmp5241, %m2503$.Type.type** %lt.5187
%.tmp5242 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5243 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5242, i32 0, i32 4
%.tmp5244 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5244, %m2503$.Type.type** %.tmp5243
%.tmp5245 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5246 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5245, i32 0, i32 4
%.tmp5247 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5246
%.tmp5248 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5247, i32 0, i32 0
%.tmp5250 = getelementptr [4 x i8], [4 x i8]*@.str5249, i32 0, i32 0
store i8* %.tmp5250, i8** %.tmp5248
%.tmp5251 = load %m2503$.Type.type*, %m2503$.Type.type** %lt.5187
%.tmp5252 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5251, i32 0, i32 4
%.tmp5253 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5252
store %m2503$.Type.type* %.tmp5253, %m2503$.Type.type** %lt.5187
%.tmp5254 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5256 = getelementptr [5 x i8], [5 x i8]*@.str5255, i32 0, i32 0
%.tmp5258 = getelementptr [7 x i8], [7 x i8]*@.str5257, i32 0, i32 0
%.tmp5259 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info_mmap.5163
call void(%m2503$.CompilerCtx.type*,i8*,i8*,%m2503$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2503$.CompilerCtx.typep.cp.cp.m2503$.AssignableInfo.typep.b.b(%m2503$.CompilerCtx.type* %.tmp5254, i8* %.tmp5256, i8* %.tmp5258, %m2503$.AssignableInfo.type* %.tmp5259, i1 1, i1 0)
%.tmp5260 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5261 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5260, i32 0, i32 6
%.tmp5262 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5261
%.tmp5264 = getelementptr [5 x i8], [5 x i8]*@.str5263, i32 0, i32 0
%.tmp5265 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5262, i8* %.tmp5264)
%fn_name_node.5266 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5265, %m878$.Node.type** %fn_name_node.5266
%.tmp5267 = load %m878$.Node.type*, %m878$.Node.type** %fn_name_node.5266
%.tmp5268 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5267, i32 0, i32 1
%.tmp5269 = load i8*, i8** %.tmp5268
%fn_name.5270 = alloca i8*
store i8* %.tmp5269, i8** %fn_name.5270
%.tmp5271 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5272 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp5271)
%info.5273 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5272, %m2503$.AssignableInfo.type** %info.5273
%.tmp5274 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5273
%.tmp5275 = load i8, i8* @SCOPE_LOCAL
%.tmp5276 = load i8*, i8** %fn_name.5270
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp5274, i8 %.tmp5275, i8* %.tmp5276)
%.tmp5277 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5273
%.tmp5278 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5277, i32 0, i32 4
%.tmp5279 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5280 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5281 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5280, i32 0, i32 6
%.tmp5282 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5281
%.tmp5283 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$syn_function_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5279, %m878$.Node.type* %.tmp5282)
store %m2503$.Type.type* %.tmp5283, %m2503$.Type.type** %.tmp5278
%.tmp5284 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5273
%.tmp5285 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5284, i32 0, i32 3
%.tmp5287 = getelementptr [9 x i8], [9 x i8]*@.str5286, i32 0, i32 0
store i8* %.tmp5287, i8** %.tmp5285
%.tmp5288 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5289 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5290 = load i8*, i8** %fn_name.5270
%.tmp5291 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5273
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp5288, %m878$.Node.type* %.tmp5289, i8* %.tmp5290, %m2503$.AssignableInfo.type* %.tmp5291)
%.tmp5292 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5293 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5292)
%closure_id.5294 = alloca i32
store i32 %.tmp5293, i32* %closure_id.5294
%.tmp5295 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5273
%.tmp5296 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5295, i32 0, i32 4
%.tmp5297 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5296
%.tmp5298 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp5297)
%closure_type.5299 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp5298, %m2503$.Type.type** %closure_type.5299
%.tmp5300 = load %m2503$.Type.type*, %m2503$.Type.type** %closure_type.5299
%.tmp5301 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5300, i32 0, i32 3
%.tmp5302 = load %m2503$.Type.type*, %m2503$.Type.type** %closure_type.5299
%.tmp5303 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5302, i32 0, i32 3
%.tmp5304 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5303
%.tmp5305 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp5304)
store %m2503$.Type.type* %.tmp5305, %m2503$.Type.type** %.tmp5301
%.tmp5306 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%ctx_param.5307 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp5306, %m2503$.Type.type** %ctx_param.5307
%.tmp5308 = load %m2503$.Type.type*, %m2503$.Type.type** %ctx_param.5307
%.tmp5309 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5308, i32 0, i32 0
%.tmp5311 = getelementptr [4 x i8], [4 x i8]*@.str5310, i32 0, i32 0
store i8* %.tmp5311, i8** %.tmp5309
%.tmp5312 = load %m2503$.Type.type*, %m2503$.Type.type** %ctx_param.5307
%.tmp5313 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5312, i32 0, i32 3
%.tmp5314 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp5314, %m2503$.Type.type** %.tmp5313
%.tmp5315 = load %m2503$.Type.type*, %m2503$.Type.type** %ctx_param.5307
%.tmp5316 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5315, i32 0, i32 3
%.tmp5317 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5316
%.tmp5318 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5317, i32 0, i32 0
%.tmp5320 = getelementptr [7 x i8], [7 x i8]*@.str5319, i32 0, i32 0
store i8* %.tmp5320, i8** %.tmp5318
%.tmp5321 = load %m2503$.Type.type*, %m2503$.Type.type** %ctx_param.5307
%.tmp5322 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5321, i32 0, i32 4
%.tmp5323 = load %m2503$.Type.type*, %m2503$.Type.type** %closure_type.5299
%.tmp5324 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5323, i32 0, i32 3
%.tmp5325 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5324
%.tmp5326 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5325, i32 0, i32 4
%.tmp5327 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5326
store %m2503$.Type.type* %.tmp5327, %m2503$.Type.type** %.tmp5322
%.tmp5328 = load %m2503$.Type.type*, %m2503$.Type.type** %closure_type.5299
%.tmp5329 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5328, i32 0, i32 3
%.tmp5330 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5329
%.tmp5331 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5330, i32 0, i32 4
%.tmp5332 = load %m2503$.Type.type*, %m2503$.Type.type** %ctx_param.5307
store %m2503$.Type.type* %.tmp5332, %m2503$.Type.type** %.tmp5331
%.tmp5334 = getelementptr [1 x i8], [1 x i8]*@.str5333, i32 0, i32 0
%closure_name.5335 = alloca i8*
store i8* %.tmp5334, i8** %closure_name.5335
%.tmp5336 = getelementptr i8*, i8** %closure_name.5335, i32 0
%.tmp5338 = getelementptr [5 x i8], [5 x i8]*@.str5337, i32 0, i32 0
%.tmp5339 = load i32, i32* %closure_id.5294
%.tmp5340 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5336, i8* %.tmp5338, i32 %.tmp5339)
%.tmp5341 = load %m2503$.Type.type*, %m2503$.Type.type** %closure_type.5299
%.tmp5342 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5341, i32 0, i32 3
%.tmp5343 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5342
%.tmp5344 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp5343)
%ret_type.5345 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp5344, %m2503$.Type.type** %ret_type.5345
%.tmp5346 = load %m2503$.Type.type*, %m2503$.Type.type** %ret_type.5345
%.tmp5347 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp5346, i32 0, i32 3
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp5347
%.tmp5348 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5349 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5348, i32 0, i32 1
%.tmp5350 = load %m0$.File.type*, %m0$.File.type** %.tmp5349
%.tmp5352 = getelementptr [101 x i8], [101 x i8]*@.str5351, i32 0, i32 0
%.tmp5353 = load i32, i32* %closure_id.5294
%.tmp5354 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5350, i8* %.tmp5352, i32 %.tmp5353)
%.tmp5355 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5356 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5355, i32 0, i32 1
%.tmp5357 = load %m0$.File.type*, %m0$.File.type** %.tmp5356
%.tmp5359 = getelementptr [100 x i8], [100 x i8]*@.str5358, i32 0, i32 0
%.tmp5360 = load i32, i32* %closure_id.5294
%.tmp5361 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5362 = load %m2503$.Type.type*, %m2503$.Type.type** %closure_type.5299
%.tmp5363 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5361, %m2503$.Type.type* %.tmp5362)
%.tmp5364 = load i8*, i8** %closure_name.5335
%.tmp5365 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5357, i8* %.tmp5359, i32 %.tmp5360, i8* %.tmp5363, i8* %.tmp5364)
%.tmp5366 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5367 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5366, i32 0, i32 1
%.tmp5368 = load %m0$.File.type*, %m0$.File.type** %.tmp5367
%.tmp5370 = getelementptr [66 x i8], [66 x i8]*@.str5369, i32 0, i32 0
%.tmp5371 = load i32, i32* %closure_id.5294
%.tmp5372 = load i32, i32* %closure_id.5294
%.tmp5373 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5368, i8* %.tmp5370, i32 %.tmp5371, i32 %.tmp5372)
%.tmp5374 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5375 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5374, i32 0, i32 1
%.tmp5376 = load %m0$.File.type*, %m0$.File.type** %.tmp5375
%.tmp5378 = getelementptr [35 x i8], [35 x i8]*@.str5377, i32 0, i32 0
%.tmp5379 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5273
%.tmp5380 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp5379)
%.tmp5381 = load i32, i32* %closure_id.5294
%.tmp5382 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5383 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5273
%.tmp5384 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5383, i32 0, i32 4
%.tmp5385 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5384
%.tmp5386 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5382, %m2503$.Type.type* %.tmp5385)
%.tmp5387 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5376, i8* %.tmp5378, i8* %.tmp5380, i32 %.tmp5381, i8* %.tmp5386)
%.tmp5388 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5389 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5388, i32 0, i32 1
%.tmp5390 = load %m0$.File.type*, %m0$.File.type** %.tmp5389
%bkp_ctx.5391 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp5390, %m0$.File.type** %bkp_ctx.5391
%.tmp5392 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5393 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5392, i32 0, i32 1
%.tmp5394 = call %m0$.File.type*() @tmpfile()
store %m0$.File.type* %.tmp5394, %m0$.File.type** %.tmp5393
%.tmp5395 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5396 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5395, i32 0, i32 1
%.tmp5397 = load %m0$.File.type*, %m0$.File.type** %.tmp5396
%.tmp5399 = getelementptr [14 x i8], [14 x i8]*@.str5398, i32 0, i32 0
%.tmp5400 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5401 = load %m2503$.Type.type*, %m2503$.Type.type** %ret_type.5345
%.tmp5402 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5400, %m2503$.Type.type* %.tmp5401)
%.tmp5403 = load i8*, i8** %closure_name.5335
%.tmp5404 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5397, i8* %.tmp5399, i8* %.tmp5402, i8* %.tmp5403)
%.tmp5405 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5407 = getelementptr [9 x i8], [9 x i8]*@.str5406, i32 0, i32 0
%.tmp5408 = bitcast ptr null to i8*
%.tmp5409 = bitcast ptr null to i8*
call void(%m2503$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2503$.CompilerCtx.typep.cp.cp.cp(%m2503$.CompilerCtx.type* %.tmp5405, i8* %.tmp5407, i8* %.tmp5408, i8* %.tmp5409)
%.tmp5410 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5411 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5410, i32 0, i32 1
%.tmp5412 = load %m0$.File.type*, %m0$.File.type** %.tmp5411
%.tmp5414 = getelementptr [13 x i8], [13 x i8]*@.str5413, i32 0, i32 0
%.tmp5415 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5416 = load %m2503$.Type.type*, %m2503$.Type.type** %ctx_param.5307
%.tmp5417 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5415, %m2503$.Type.type* %.tmp5416)
%.tmp5418 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5412, i8* %.tmp5414, i8* %.tmp5417)
%.tmp5419 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5420 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5419, i32 0, i32 6
%.tmp5421 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5420
%.tmp5422 = call %m878$.Node.type*(%m878$.Node.type*) @m295$syn_function_params.m878$.Node.typep.m878$.Node.typep(%m878$.Node.type* %.tmp5421)
%params.5423 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5422, %m878$.Node.type** %params.5423
%param_type.5424 = alloca %m2503$.Type.type*
store %m2503$.Type.type* null, %m2503$.Type.type** %param_type.5424
%.tmp5426 = load %m878$.Node.type*, %m878$.Node.type** %params.5423
%param_ptr.5427 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5426, %m878$.Node.type** %param_ptr.5427
br label %.for.start.5425
.for.start.5425:
%.tmp5428 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5427
%.tmp5429 = icmp ne %m878$.Node.type* %.tmp5428, null
br i1 %.tmp5429, label %.for.continue.5425, label %.for.end.5425
.for.continue.5425:
%.tmp5430 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5427
%.tmp5431 = load %m878$.Node.type*, %m878$.Node.type** %params.5423
%.tmp5432 = icmp ne %m878$.Node.type* %.tmp5430, %.tmp5431
br i1 %.tmp5432, label %.if.true.5433, label %.if.false.5433
.if.true.5433:
%.tmp5434 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5427
%.tmp5435 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5434, i32 0, i32 7
%.tmp5436 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5435
store %m878$.Node.type* %.tmp5436, %m878$.Node.type** %param_ptr.5427
br label %.if.end.5433
.if.false.5433:
br label %.if.end.5433
.if.end.5433:
%.tmp5437 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5438 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5437, i32 0, i32 1
%.tmp5439 = load %m0$.File.type*, %m0$.File.type** %.tmp5438
%.tmp5441 = getelementptr [3 x i8], [3 x i8]*@.str5440, i32 0, i32 0
%.tmp5442 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5439, i8* %.tmp5441)
%.tmp5443 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5427
%.tmp5444 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5443, i32 0, i32 0
%.tmp5445 = load i8*, i8** %.tmp5444
%.tmp5447 = getelementptr [5 x i8], [5 x i8]*@.str5446, i32 0, i32 0
%.tmp5448 = call i32(i8*,i8*) @strcmp(i8* %.tmp5445, i8* %.tmp5447)
%.tmp5449 = icmp eq i32 %.tmp5448, 0
br i1 %.tmp5449, label %.if.true.5450, label %.if.false.5450
.if.true.5450:
%.tmp5451 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5452 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5427
%.tmp5453 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5452, i32 0, i32 6
%.tmp5454 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5453
%.tmp5455 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5451, %m878$.Node.type* %.tmp5454)
store %m2503$.Type.type* %.tmp5455, %m2503$.Type.type** %param_type.5424
%.tmp5456 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5427
%.tmp5457 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5456, i32 0, i32 7
%.tmp5458 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5457
store %m878$.Node.type* %.tmp5458, %m878$.Node.type** %param_ptr.5427
br label %.if.end.5450
.if.false.5450:
br label %.if.end.5450
.if.end.5450:
%.tmp5459 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5460 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5459, i32 0, i32 1
%.tmp5461 = load %m0$.File.type*, %m0$.File.type** %.tmp5460
%.tmp5463 = getelementptr [13 x i8], [13 x i8]*@.str5462, i32 0, i32 0
%.tmp5464 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5465 = load %m2503$.Type.type*, %m2503$.Type.type** %param_type.5424
%.tmp5466 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5464, %m2503$.Type.type* %.tmp5465)
%.tmp5467 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5427
%.tmp5468 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5467, i32 0, i32 1
%.tmp5469 = load i8*, i8** %.tmp5468
%.tmp5470 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5461, i8* %.tmp5463, i8* %.tmp5466, i8* %.tmp5469)
%.tmp5471 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.5427
%.tmp5472 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5471, i32 0, i32 7
%.tmp5473 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5472
store %m878$.Node.type* %.tmp5473, %m878$.Node.type** %param_ptr.5427
br label %.for.start.5425
.for.end.5425:
%.tmp5474 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5475 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5474, i32 0, i32 1
%.tmp5476 = load %m0$.File.type*, %m0$.File.type** %.tmp5475
%.tmp5478 = getelementptr [5 x i8], [5 x i8]*@.str5477, i32 0, i32 0
%.tmp5479 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5476, i8* %.tmp5478)
%.tmp5480 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5481 = load %m878$.Node.type*, %m878$.Node.type** %params.5423
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_fn_params.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5480, %m878$.Node.type* %.tmp5481)
%.tmp5482 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5483 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5482, i32 0, i32 6
%.tmp5484 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5483
%.tmp5486 = getelementptr [6 x i8], [6 x i8]*@.str5485, i32 0, i32 0
%.tmp5487 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5484, i8* %.tmp5486)
%block.5488 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5487, %m878$.Node.type** %block.5488
%.tmp5489 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5490 = load %m878$.Node.type*, %m878$.Node.type** %block.5488
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5489, %m878$.Node.type* %.tmp5490)
%.tmp5491 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5492 = load %m878$.Node.type*, %m878$.Node.type** %block.5488
%.tmp5493 = load %m2503$.Type.type*, %m2503$.Type.type** %ret_type.5345
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.Type.type*) @m295$check_n_add_implicit_return.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5491, %m878$.Node.type* %.tmp5492, %m2503$.Type.type* %.tmp5493)
%.tmp5494 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
call void(%m2503$.CompilerCtx.type*) @m295$pop_scope.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5494)
%.tmp5495 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5496 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5495, i32 0, i32 1
%.tmp5497 = load %m0$.File.type*, %m0$.File.type** %.tmp5496
%.tmp5499 = getelementptr [3 x i8], [3 x i8]*@.str5498, i32 0, i32 0
%.tmp5500 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5497, i8* %.tmp5499)
%.tmp5501 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5502 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5501, i32 0, i32 1
%.tmp5503 = load %m0$.File.type*, %m0$.File.type** %.tmp5502
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp5503)
%.tmp5504 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5505 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5504, i32 0, i32 1
%.tmp5506 = load %m0$.File.type*, %m0$.File.type** %.tmp5505
%.tmp5507 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp5506)
%.tmp5508 = call i8*(i32) @m1$readall.cp.i(i32 %.tmp5507)
%code.5509 = alloca i8*
store i8* %.tmp5508, i8** %code.5509
%.tmp5510 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5511 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5510, i32 0, i32 1
%.tmp5512 = load %m0$.File.type*, %m0$.File.type** %.tmp5511
%.tmp5513 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp5512)
%.tmp5514 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5515 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5514, i32 0, i32 1
%.tmp5516 = load %m0$.File.type*, %m0$.File.type** %bkp_ctx.5391
store %m0$.File.type* %.tmp5516, %m0$.File.type** %.tmp5515
%.tmp5517 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5518 = load i8*, i8** %code.5509
call void(%m2503$.CompilerCtx.type*,i8*) @m295$append_anon_fn.v.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.tmp5517, i8* %.tmp5518)
ret void
}
define void @m295$check_n_add_implicit_return.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, %m2503$.Type.type* %.return_type.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%return_type = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.return_type.arg, %m2503$.Type.type** %return_type
%.tmp5519 = bitcast ptr null to %m878$.Node.type*
%li.5520 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5519, %m878$.Node.type** %li.5520
%.tmp5521 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5522 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5521, i32 0, i32 6
%.tmp5523 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5522
%.tmp5525 = getelementptr [12 x i8], [12 x i8]*@.str5524, i32 0, i32 0
%.tmp5526 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5523, i8* %.tmp5525)
%exprs.5527 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5526, %m878$.Node.type** %exprs.5527
%.tmp5529 = load %m878$.Node.type*, %m878$.Node.type** %exprs.5527
%.tmp5530 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5529, i32 0, i32 6
%.tmp5531 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5530
%ci.5532 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5531, %m878$.Node.type** %ci.5532
br label %.for.start.5528
.for.start.5528:
%.tmp5533 = load %m878$.Node.type*, %m878$.Node.type** %ci.5532
%.tmp5534 = icmp ne %m878$.Node.type* %.tmp5533, null
br i1 %.tmp5534, label %.for.continue.5528, label %.for.end.5528
.for.continue.5528:
%.tmp5535 = load %m878$.Node.type*, %m878$.Node.type** %ci.5532
%.tmp5536 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5535, i32 0, i32 0
%.tmp5537 = load i8*, i8** %.tmp5536
%.tmp5539 = getelementptr [3 x i8], [3 x i8]*@.str5538, i32 0, i32 0
%.tmp5540 = call i32(i8*,i8*) @strcmp(i8* %.tmp5537, i8* %.tmp5539)
%.tmp5541 = icmp ne i32 %.tmp5540, 0
br i1 %.tmp5541, label %.if.true.5542, label %.if.false.5542
.if.true.5542:
%.tmp5543 = load %m878$.Node.type*, %m878$.Node.type** %ci.5532
store %m878$.Node.type* %.tmp5543, %m878$.Node.type** %li.5520
br label %.if.end.5542
.if.false.5542:
br label %.if.end.5542
.if.end.5542:
%.tmp5544 = load %m878$.Node.type*, %m878$.Node.type** %ci.5532
%.tmp5545 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5544, i32 0, i32 7
%.tmp5546 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5545
store %m878$.Node.type* %.tmp5546, %m878$.Node.type** %ci.5532
br label %.for.start.5528
.for.end.5528:
%.tmp5547 = load %m878$.Node.type*, %m878$.Node.type** %li.5520
%.tmp5548 = icmp ne %m878$.Node.type* %.tmp5547, null
br i1 %.tmp5548, label %.if.true.5549, label %.if.false.5549
.if.true.5549:
%.tmp5550 = load %m878$.Node.type*, %m878$.Node.type** %li.5520
%.tmp5551 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5550, i32 0, i32 6
%.tmp5552 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5551
%.tmp5553 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5552, i32 0, i32 0
%.tmp5554 = load i8*, i8** %.tmp5553
%.tmp5556 = getelementptr [7 x i8], [7 x i8]*@.str5555, i32 0, i32 0
%.tmp5557 = call i32(i8*,i8*) @strcmp(i8* %.tmp5554, i8* %.tmp5556)
%.tmp5558 = icmp eq i32 %.tmp5557, 0
br i1 %.tmp5558, label %.if.true.5559, label %.if.false.5559
.if.true.5559:
ret void
br label %.if.end.5559
.if.false.5559:
br label %.if.end.5559
.if.end.5559:
br label %.if.end.5549
.if.false.5549:
br label %.if.end.5549
.if.end.5549:
%.tmp5560 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5561 = load %m2503$.Type.type*, %m2503$.Type.type** %return_type
%.tmp5562 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5560, %m2503$.Type.type* %.tmp5561)
%.tmp5564 = getelementptr [5 x i8], [5 x i8]*@.str5563, i32 0, i32 0
%.tmp5565 = call i32(i8*,i8*) @strcmp(i8* %.tmp5562, i8* %.tmp5564)
%.tmp5566 = icmp ne i32 %.tmp5565, 0
br i1 %.tmp5566, label %.if.true.5567, label %.if.false.5567
.if.true.5567:
%.tmp5568 = load %m878$.Node.type*, %m878$.Node.type** %li.5520
%.tmp5569 = icmp ne %m878$.Node.type* %.tmp5568, null
br i1 %.tmp5569, label %.if.true.5570, label %.if.false.5570
.if.true.5570:
%.tmp5571 = load %m878$.Node.type*, %m878$.Node.type** %li.5520
store %m878$.Node.type* %.tmp5571, %m878$.Node.type** %stmt
br label %.if.end.5570
.if.false.5570:
br label %.if.end.5570
.if.end.5570:
%.tmp5572 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5573 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5575 = getelementptr [21 x i8], [21 x i8]*@.str5574, i32 0, i32 0
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5572, %m878$.Node.type* %.tmp5573, i8* %.tmp5575)
br label %.if.end.5567
.if.false.5567:
%.tmp5576 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5577 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5576, i32 0, i32 1
%.tmp5578 = load %m0$.File.type*, %m0$.File.type** %.tmp5577
%.tmp5580 = getelementptr [10 x i8], [10 x i8]*@.str5579, i32 0, i32 0
%.tmp5581 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5578, i8* %.tmp5580)
br label %.if.end.5567
.if.end.5567:
ret void
}
define void @m295$compile_for_loop.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp5582 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5583 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5582)
%for_id.5584 = alloca i32
store i32 %.tmp5583, i32* %for_id.5584
%.tmp5585 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5586 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5585, i32 0, i32 6
%.tmp5587 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5586
%.tmp5588 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5587, i32 0, i32 7
%.tmp5589 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5588
%init_stmt.5590 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5589, %m878$.Node.type** %init_stmt.5590
%.tmp5591 = bitcast ptr null to i8*
%begin_lbl.5592 = alloca i8*
store i8* %.tmp5591, i8** %begin_lbl.5592
%.tmp5593 = bitcast ptr null to i8*
%end_lbl.5594 = alloca i8*
store i8* %.tmp5593, i8** %end_lbl.5594
%.tmp5595 = getelementptr i8*, i8** %begin_lbl.5592, i32 0
%.tmp5597 = getelementptr [14 x i8], [14 x i8]*@.str5596, i32 0, i32 0
%.tmp5598 = load i32, i32* %for_id.5584
%.tmp5599 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5595, i8* %.tmp5597, i32 %.tmp5598)
%.tmp5600 = getelementptr i8*, i8** %end_lbl.5594, i32 0
%.tmp5602 = getelementptr [12 x i8], [12 x i8]*@.str5601, i32 0, i32 0
%.tmp5603 = load i32, i32* %for_id.5584
%.tmp5604 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5600, i8* %.tmp5602, i32 %.tmp5603)
%.tmp5605 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5607 = getelementptr [4 x i8], [4 x i8]*@.str5606, i32 0, i32 0
%.tmp5608 = load i8*, i8** %begin_lbl.5592
%.tmp5609 = load i8*, i8** %end_lbl.5594
call void(%m2503$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2503$.CompilerCtx.typep.cp.cp.cp(%m2503$.CompilerCtx.type* %.tmp5605, i8* %.tmp5607, i8* %.tmp5608, i8* %.tmp5609)
%.tmp5610 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5590
%.tmp5611 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5610, i32 0, i32 0
%.tmp5612 = load i8*, i8** %.tmp5611
%.tmp5614 = getelementptr [12 x i8], [12 x i8]*@.str5613, i32 0, i32 0
%.tmp5615 = call i32(i8*,i8*) @strcmp(i8* %.tmp5612, i8* %.tmp5614)
%.tmp5616 = icmp eq i32 %.tmp5615, 0
br i1 %.tmp5616, label %.if.true.5617, label %.if.false.5617
.if.true.5617:
%.tmp5618 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5619 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5590
%.tmp5620 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_declaration.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5618, %m878$.Node.type* %.tmp5619)
br label %.if.end.5617
.if.false.5617:
%.tmp5621 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5590
%.tmp5622 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5621, i32 0, i32 0
%.tmp5623 = load i8*, i8** %.tmp5622
%.tmp5625 = getelementptr [11 x i8], [11 x i8]*@.str5624, i32 0, i32 0
%.tmp5626 = call i32(i8*,i8*) @strcmp(i8* %.tmp5623, i8* %.tmp5625)
%.tmp5627 = icmp eq i32 %.tmp5626, 0
br i1 %.tmp5627, label %.if.true.5628, label %.if.false.5628
.if.true.5628:
%.tmp5629 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5630 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5590
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_expression.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5629, %m878$.Node.type* %.tmp5630)
br label %.if.end.5628
.if.false.5628:
%.tmp5631 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5590
%.tmp5632 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5631, i32 0, i32 0
%.tmp5633 = load i8*, i8** %.tmp5632
%.tmp5635 = getelementptr [9 x i8], [9 x i8]*@.str5634, i32 0, i32 0
%.tmp5636 = call i32(i8*,i8*) @strcmp(i8* %.tmp5633, i8* %.tmp5635)
%.tmp5637 = icmp eq i32 %.tmp5636, 0
br i1 %.tmp5637, label %.if.true.5638, label %.if.false.5638
.if.true.5638:
br label %.if.end.5638
.if.false.5638:
%.tmp5639 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5640 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5590
%.tmp5642 = getelementptr [66 x i8], [66 x i8]*@.str5641, i32 0, i32 0
%.tmp5643 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5639, %m878$.Node.type* %.tmp5640, i8* %.tmp5642)
%.tmp5644 = load %m878$.Node.type*, %m878$.Node.type** %init_stmt.5590
%.tmp5645 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5644, i32 0, i32 0
%.tmp5646 = load i8*, i8** %.tmp5645
%.tmp5647 = call i32(i8*,...) @printf(i8* %.tmp5643, i8* %.tmp5646)
%.tmp5648 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
call void(%m2503$.CompilerCtx.type*) @m295$pop_scope.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5648)
ret void
br label %.if.end.5638
.if.end.5638:
br label %.if.end.5628
.if.end.5628:
br label %.if.end.5617
.if.end.5617:
%.tmp5649 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5650 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5649, i32 0, i32 1
%.tmp5651 = load %m0$.File.type*, %m0$.File.type** %.tmp5650
%.tmp5653 = getelementptr [26 x i8], [26 x i8]*@.str5652, i32 0, i32 0
%.tmp5654 = load i32, i32* %for_id.5584
%.tmp5655 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5651, i8* %.tmp5653, i32 %.tmp5654)
%.tmp5656 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5657 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5656, i32 0, i32 1
%.tmp5658 = load %m0$.File.type*, %m0$.File.type** %.tmp5657
%.tmp5660 = getelementptr [16 x i8], [16 x i8]*@.str5659, i32 0, i32 0
%.tmp5661 = load i32, i32* %for_id.5584
%.tmp5662 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5658, i8* %.tmp5660, i32 %.tmp5661)
%.tmp5663 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5664 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5663, i32 0, i32 6
%.tmp5665 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5664
%.tmp5667 = getelementptr [9 x i8], [9 x i8]*@.str5666, i32 0, i32 0
%.tmp5668 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5665, i8* %.tmp5667)
%fst_colon.5669 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5668, %m878$.Node.type** %fst_colon.5669
%.tmp5670 = load %m878$.Node.type*, %m878$.Node.type** %fst_colon.5669
%.tmp5671 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5670, i32 0, i32 7
%.tmp5672 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5671
%condition.5673 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5672, %m878$.Node.type** %condition.5673
%.tmp5674 = load %m878$.Node.type*, %m878$.Node.type** %condition.5673
%.tmp5675 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5674, i32 0, i32 0
%.tmp5676 = load i8*, i8** %.tmp5675
%.tmp5678 = getelementptr [9 x i8], [9 x i8]*@.str5677, i32 0, i32 0
%.tmp5679 = call i32(i8*,i8*) @strcmp(i8* %.tmp5676, i8* %.tmp5678)
%.tmp5680 = icmp eq i32 %.tmp5679, 0
br i1 %.tmp5680, label %.if.true.5681, label %.if.false.5681
.if.true.5681:
%.tmp5682 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5683 = load %m878$.Node.type*, %m878$.Node.type** %condition.5673
%.tmp5685 = getelementptr [39 x i8], [39 x i8]*@.str5684, i32 0, i32 0
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5682, %m878$.Node.type* %.tmp5683, i8* %.tmp5685)
ret void
br label %.if.end.5681
.if.false.5681:
br label %.if.end.5681
.if.end.5681:
%.tmp5686 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5687 = load %m878$.Node.type*, %m878$.Node.type** %condition.5673
%.tmp5688 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5686, %m878$.Node.type* %.tmp5687)
%condition_info.5689 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5688, %m2503$.AssignableInfo.type** %condition_info.5689
%.tmp5690 = load %m878$.Node.type*, %m878$.Node.type** %fst_colon.5669
%.tmp5691 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5690, i32 0, i32 7
%.tmp5692 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5691
%.tmp5694 = getelementptr [9 x i8], [9 x i8]*@.str5693, i32 0, i32 0
%.tmp5695 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5692, i8* %.tmp5694)
%snd_colon.5696 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5695, %m878$.Node.type** %snd_colon.5696
%.tmp5697 = load %m878$.Node.type*, %m878$.Node.type** %snd_colon.5696
%.tmp5699 = getelementptr [6 x i8], [6 x i8]*@.str5698, i32 0, i32 0
%.tmp5700 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5697, i8* %.tmp5699)
%for_body.5701 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5700, %m878$.Node.type** %for_body.5701
%.tmp5702 = load %m878$.Node.type*, %m878$.Node.type** %for_body.5701
%.tmp5704 = getelementptr [11 x i8], [11 x i8]*@.str5703, i32 0, i32 0
%.tmp5705 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5702, i8* %.tmp5704)
%else_block.5706 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5705, %m878$.Node.type** %else_block.5706
%.tmp5707 = load i8*, i8** %end_lbl.5594
%on_end.5708 = alloca i8*
store i8* %.tmp5707, i8** %on_end.5708
%.tmp5709 = load %m878$.Node.type*, %m878$.Node.type** %else_block.5706
%.tmp5710 = icmp ne %m878$.Node.type* %.tmp5709, null
br i1 %.tmp5710, label %.if.true.5711, label %.if.false.5711
.if.true.5711:
%.tmp5712 = getelementptr i8*, i8** %on_end.5708, i32 0
%.tmp5714 = getelementptr [13 x i8], [13 x i8]*@.str5713, i32 0, i32 0
%.tmp5715 = load i32, i32* %for_id.5584
%.tmp5716 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5712, i8* %.tmp5714, i32 %.tmp5715)
br label %.if.end.5711
.if.false.5711:
br label %.if.end.5711
.if.end.5711:
%.tmp5717 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5718 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5717, i32 0, i32 1
%.tmp5719 = load %m0$.File.type*, %m0$.File.type** %.tmp5718
%.tmp5721 = getelementptr [48 x i8], [48 x i8]*@.str5720, i32 0, i32 0
%.tmp5722 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5723 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %condition_info.5689
%.tmp5724 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5723, i32 0, i32 4
%.tmp5725 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5724
%.tmp5726 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5722, %m2503$.Type.type* %.tmp5725)
%.tmp5727 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %condition_info.5689
%.tmp5728 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp5727)
%.tmp5729 = load i32, i32* %for_id.5584
%.tmp5730 = load i8*, i8** %on_end.5708
%.tmp5731 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5719, i8* %.tmp5721, i8* %.tmp5726, i8* %.tmp5728, i32 %.tmp5729, i8* %.tmp5730)
%.tmp5732 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5733 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5732, i32 0, i32 1
%.tmp5734 = load %m0$.File.type*, %m0$.File.type** %.tmp5733
%.tmp5736 = getelementptr [19 x i8], [19 x i8]*@.str5735, i32 0, i32 0
%.tmp5737 = load i32, i32* %for_id.5584
%.tmp5738 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5734, i8* %.tmp5736, i32 %.tmp5737)
%.tmp5739 = load %m878$.Node.type*, %m878$.Node.type** %snd_colon.5696
%.tmp5740 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5739, i32 0, i32 7
%.tmp5741 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5740
%increment.5742 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5741, %m878$.Node.type** %increment.5742
%.tmp5743 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5744 = load %m878$.Node.type*, %m878$.Node.type** %for_body.5701
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5743, %m878$.Node.type* %.tmp5744)
%.tmp5745 = load %m878$.Node.type*, %m878$.Node.type** %increment.5742
%.tmp5746 = load %m878$.Node.type*, %m878$.Node.type** %for_body.5701
%.tmp5747 = icmp ne %m878$.Node.type* %.tmp5745, %.tmp5746
br i1 %.tmp5747, label %.if.true.5748, label %.if.false.5748
.if.true.5748:
%.tmp5749 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5750 = load %m878$.Node.type*, %m878$.Node.type** %increment.5742
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_expression.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5749, %m878$.Node.type* %.tmp5750)
br label %.if.end.5748
.if.false.5748:
br label %.if.end.5748
.if.end.5748:
%.tmp5751 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5752 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5751, i32 0, i32 1
%.tmp5753 = load %m0$.File.type*, %m0$.File.type** %.tmp5752
%.tmp5755 = getelementptr [15 x i8], [15 x i8]*@.str5754, i32 0, i32 0
%.tmp5756 = load i8*, i8** %begin_lbl.5592
%.tmp5757 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5753, i8* %.tmp5755, i8* %.tmp5756)
%.tmp5758 = load %m878$.Node.type*, %m878$.Node.type** %else_block.5706
%.tmp5759 = icmp ne %m878$.Node.type* %.tmp5758, null
br i1 %.tmp5759, label %.if.true.5760, label %.if.false.5760
.if.true.5760:
%.tmp5761 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5762 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5761, i32 0, i32 1
%.tmp5763 = load %m0$.File.type*, %m0$.File.type** %.tmp5762
%.tmp5765 = getelementptr [15 x i8], [15 x i8]*@.str5764, i32 0, i32 0
%.tmp5766 = load i32, i32* %for_id.5584
%.tmp5767 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5763, i8* %.tmp5765, i32 %.tmp5766)
%.tmp5768 = load %m878$.Node.type*, %m878$.Node.type** %else_block.5706
%.tmp5769 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5768, i32 0, i32 6
%.tmp5770 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5769
%.tmp5772 = getelementptr [6 x i8], [6 x i8]*@.str5771, i32 0, i32 0
%.tmp5773 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5770, i8* %.tmp5772)
%block.5774 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5773, %m878$.Node.type** %block.5774
%.tmp5775 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5776 = load %m878$.Node.type*, %m878$.Node.type** %block.5774
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5775, %m878$.Node.type* %.tmp5776)
%.tmp5777 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5778 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5777, i32 0, i32 1
%.tmp5779 = load %m0$.File.type*, %m0$.File.type** %.tmp5778
%.tmp5781 = getelementptr [15 x i8], [15 x i8]*@.str5780, i32 0, i32 0
%.tmp5782 = load i8*, i8** %end_lbl.5594
%.tmp5783 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5779, i8* %.tmp5781, i8* %.tmp5782)
br label %.if.end.5760
.if.false.5760:
br label %.if.end.5760
.if.end.5760:
%.tmp5784 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5785 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5784, i32 0, i32 1
%.tmp5786 = load %m0$.File.type*, %m0$.File.type** %.tmp5785
%.tmp5788 = getelementptr [5 x i8], [5 x i8]*@.str5787, i32 0, i32 0
%.tmp5789 = load i8*, i8** %end_lbl.5594
%.tmp5790 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5786, i8* %.tmp5788, i8* %.tmp5789)
%.tmp5791 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
call void(%m2503$.CompilerCtx.type*) @m295$pop_scope.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5791)
ret void
}
define %m2503$.AssignableInfo.type* @m295$compile_declaration.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp5792 = bitcast ptr null to %m2503$.Type.type*
%decl_type.5793 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp5792, %m2503$.Type.type** %decl_type.5793
%.tmp5794 = bitcast ptr null to %m2503$.AssignableInfo.type*
%a_info.5795 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5794, %m2503$.AssignableInfo.type** %a_info.5795
%.tmp5796 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5797 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5796, i32 0, i32 6
%.tmp5798 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5797
%.tmp5799 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5798, i32 0, i32 0
%.tmp5800 = load i8*, i8** %.tmp5799
%.tmp5802 = getelementptr [5 x i8], [5 x i8]*@.str5801, i32 0, i32 0
%.tmp5803 = call i32(i8*,i8*) @strcmp(i8* %.tmp5800, i8* %.tmp5802)
%.tmp5804 = icmp eq i32 %.tmp5803, 0
br i1 %.tmp5804, label %.if.true.5805, label %.if.false.5805
.if.true.5805:
%.tmp5806 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5807 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5808 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5807, i32 0, i32 6
%.tmp5809 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5808
%.tmp5810 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5809, i32 0, i32 6
%.tmp5811 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5810
%.tmp5812 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5806, %m878$.Node.type* %.tmp5811)
store %m2503$.Type.type* %.tmp5812, %m2503$.Type.type** %decl_type.5793
br label %.if.end.5805
.if.false.5805:
br label %.if.end.5805
.if.end.5805:
%.tmp5813 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5814 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5813, i32 0, i32 6
%.tmp5815 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5814
%.tmp5817 = getelementptr [11 x i8], [11 x i8]*@.str5816, i32 0, i32 0
%.tmp5818 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5815, i8* %.tmp5817)
%assignable.5819 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5818, %m878$.Node.type** %assignable.5819
%.tmp5820 = load %m878$.Node.type*, %m878$.Node.type** %assignable.5819
%.tmp5821 = icmp ne %m878$.Node.type* %.tmp5820, null
br i1 %.tmp5821, label %.if.true.5822, label %.if.false.5822
.if.true.5822:
%.tmp5823 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5824 = load %m878$.Node.type*, %m878$.Node.type** %assignable.5819
%.tmp5825 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp5823, %m878$.Node.type* %.tmp5824)
store %m2503$.AssignableInfo.type* %.tmp5825, %m2503$.AssignableInfo.type** %a_info.5795
br label %.if.end.5822
.if.false.5822:
br label %.if.end.5822
.if.end.5822:
%.tmp5826 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5827 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp5826)
%info.5828 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp5827, %m2503$.AssignableInfo.type** %info.5828
%.tmp5829 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5828
%.tmp5830 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5829, i32 0, i32 3
%.tmp5832 = getelementptr [9 x i8], [9 x i8]*@.str5831, i32 0, i32 0
store i8* %.tmp5832, i8** %.tmp5830
%.tmp5833 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5834 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5833, i32 0, i32 6
%.tmp5835 = load %m878$.Node.type*, %m878$.Node.type** %.tmp5834
%.tmp5837 = getelementptr [5 x i8], [5 x i8]*@.str5836, i32 0, i32 0
%.tmp5838 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp5835, i8* %.tmp5837)
%var_name.5839 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp5838, %m878$.Node.type** %var_name.5839
%.tmp5840 = load %m878$.Node.type*, %m878$.Node.type** %var_name.5839
%.tmp5841 = icmp eq %m878$.Node.type* %.tmp5840, null
br i1 %.tmp5841, label %.if.true.5842, label %.if.false.5842
.if.true.5842:
%.tmp5843 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5844 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5846 = getelementptr [31 x i8], [31 x i8]*@.str5845, i32 0, i32 0
%.tmp5847 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5843, %m878$.Node.type* %.tmp5844, i8* %.tmp5846)
%.tmp5848 = call i32(i8*,...) @printf(i8* %.tmp5847)
%.tmp5849 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp5849
br label %.if.end.5842
.if.false.5842:
br label %.if.end.5842
.if.end.5842:
%.tmp5850 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5851 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5850)
%mod.5852 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp5851, %m2503$.ModuleLookup.type** %mod.5852
%.tmp5853 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5854 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.5852
%.tmp5855 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp5854, i32 0, i32 3
%.tmp5856 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp5855
%.tmp5857 = load %m878$.Node.type*, %m878$.Node.type** %var_name.5839
%.tmp5858 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5857, i32 0, i32 1
%.tmp5859 = load i8*, i8** %.tmp5858
%.tmp5860 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,%m2503$.Scope.type*,i8*) @m295$find_defined_here.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.m2503$.Scope.typep.cp(%m2503$.CompilerCtx.type* %.tmp5853, %m2503$.Scope.type* %.tmp5856, i8* %.tmp5859)
%.tmp5861 = icmp ne %m2503$.ScopeItem.type* %.tmp5860, null
br i1 %.tmp5861, label %.if.true.5862, label %.if.false.5862
.if.true.5862:
%err_buf.5863 = alloca i8*
store i8* null, i8** %err_buf.5863
%.tmp5864 = getelementptr i8*, i8** %err_buf.5863, i32 0
%.tmp5866 = getelementptr [43 x i8], [43 x i8]*@.str5865, i32 0, i32 0
%.tmp5867 = load %m878$.Node.type*, %m878$.Node.type** %var_name.5839
%.tmp5868 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5867, i32 0, i32 1
%.tmp5869 = load i8*, i8** %.tmp5868
%.tmp5870 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5864, i8* %.tmp5866, i8* %.tmp5869)
%.tmp5871 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5872 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5873 = load i8*, i8** %err_buf.5863
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5871, %m878$.Node.type* %.tmp5872, i8* %.tmp5873)
%.tmp5874 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp5874
br label %.if.end.5862
.if.false.5862:
br label %.if.end.5862
.if.end.5862:
%var_id.5875 = alloca i8*
store i8* null, i8** %var_id.5875
%.tmp5876 = getelementptr i8*, i8** %var_id.5875, i32 0
%.tmp5878 = getelementptr [6 x i8], [6 x i8]*@.str5877, i32 0, i32 0
%.tmp5879 = load %m878$.Node.type*, %m878$.Node.type** %var_name.5839
%.tmp5880 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5879, i32 0, i32 1
%.tmp5881 = load i8*, i8** %.tmp5880
%.tmp5882 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5883 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp5882)
%.tmp5884 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5876, i8* %.tmp5878, i8* %.tmp5881, i32 %.tmp5883)
%.tmp5885 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5828
%.tmp5886 = load i8, i8* @SCOPE_LOCAL
%.tmp5887 = load i8*, i8** %var_id.5875
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp5885, i8 %.tmp5886, i8* %.tmp5887)
%.tmp5888 = load %m2503$.Type.type*, %m2503$.Type.type** %decl_type.5793
%.tmp5889 = icmp ne %m2503$.Type.type* %.tmp5888, null
br i1 %.tmp5889, label %.if.true.5890, label %.if.false.5890
.if.true.5890:
%.tmp5891 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5828
%.tmp5892 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5891, i32 0, i32 4
%.tmp5893 = load %m2503$.Type.type*, %m2503$.Type.type** %decl_type.5793
store %m2503$.Type.type* %.tmp5893, %m2503$.Type.type** %.tmp5892
br label %.if.end.5890
.if.false.5890:
%.tmp5894 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5795
%.tmp5895 = icmp ne %m2503$.AssignableInfo.type* %.tmp5894, null
br i1 %.tmp5895, label %.if.true.5896, label %.if.false.5896
.if.true.5896:
%.tmp5897 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5828
%.tmp5898 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5897, i32 0, i32 4
%.tmp5899 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5795
%.tmp5900 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5899, i32 0, i32 4
%.tmp5901 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5900
store %m2503$.Type.type* %.tmp5901, %m2503$.Type.type** %.tmp5898
br label %.if.end.5896
.if.false.5896:
br label %.if.end.5896
.if.end.5896:
br label %.if.end.5890
.if.end.5890:
%.tmp5902 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5903 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5828
%.tmp5904 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5903, i32 0, i32 4
%.tmp5905 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5904
%.tmp5906 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5902, %m2503$.Type.type* %.tmp5905)
%var_type_repr.5907 = alloca i8*
store i8* %.tmp5906, i8** %var_type_repr.5907
%.tmp5908 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5795
%.tmp5909 = icmp ne %m2503$.AssignableInfo.type* %.tmp5908, null
br i1 %.tmp5909, label %.if.true.5910, label %.if.false.5910
.if.true.5910:
%.tmp5911 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5912 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5795
%.tmp5913 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5912, i32 0, i32 4
%.tmp5914 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5913
%.tmp5915 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5911, %m2503$.Type.type* %.tmp5914)
%a_type_repr.5916 = alloca i8*
store i8* %.tmp5915, i8** %a_type_repr.5916
%type_error.5917 = alloca i1
store i1 0, i1* %type_error.5917
%.tmp5918 = load i8*, i8** %a_type_repr.5916
%.tmp5919 = call i32(i8*) @strlen(i8* %.tmp5918)
%.tmp5920 = load i8*, i8** %var_type_repr.5907
%.tmp5921 = call i32(i8*) @strlen(i8* %.tmp5920)
%.tmp5922 = icmp ne i32 %.tmp5919, %.tmp5921
br i1 %.tmp5922, label %.if.true.5923, label %.if.false.5923
.if.true.5923:
store i1 1, i1* %type_error.5917
br label %.if.end.5923
.if.false.5923:
%.tmp5924 = load i8*, i8** %a_type_repr.5916
%.tmp5925 = load i8*, i8** %var_type_repr.5907
%.tmp5926 = call i32(i8*,i8*) @strcmp(i8* %.tmp5924, i8* %.tmp5925)
%.tmp5927 = icmp ne i32 %.tmp5926, 0
br i1 %.tmp5927, label %.if.true.5928, label %.if.false.5928
.if.true.5928:
store i1 1, i1* %type_error.5917
br label %.if.end.5928
.if.false.5928:
br label %.if.end.5928
.if.end.5928:
br label %.if.end.5923
.if.end.5923:
%.tmp5929 = load i1, i1* %type_error.5917
br i1 %.tmp5929, label %.if.true.5930, label %.if.false.5930
.if.true.5930:
%.tmp5931 = bitcast ptr null to i8*
%err_msg.5932 = alloca i8*
store i8* %.tmp5931, i8** %err_msg.5932
%.tmp5933 = getelementptr i8*, i8** %err_msg.5932, i32 0
%.tmp5935 = getelementptr [49 x i8], [49 x i8]*@.str5934, i32 0, i32 0
%.tmp5936 = load i8*, i8** %a_type_repr.5916
%.tmp5937 = load i8*, i8** %var_type_repr.5907
%.tmp5938 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5933, i8* %.tmp5935, i8* %.tmp5936, i8* %.tmp5937)
%.tmp5939 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5940 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5941 = load i8*, i8** %err_msg.5932
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp5939, %m878$.Node.type* %.tmp5940, i8* %.tmp5941)
br label %.if.end.5930
.if.false.5930:
br label %.if.end.5930
.if.end.5930:
br label %.if.end.5910
.if.false.5910:
br label %.if.end.5910
.if.end.5910:
%.tmp5942 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5943 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5944 = load %m878$.Node.type*, %m878$.Node.type** %var_name.5839
%.tmp5945 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp5944, i32 0, i32 1
%.tmp5946 = load i8*, i8** %.tmp5945
%.tmp5947 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5828
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp5942, %m878$.Node.type* %.tmp5943, i8* %.tmp5946, %m2503$.AssignableInfo.type* %.tmp5947)
%.tmp5948 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5949 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5948, i32 0, i32 1
%.tmp5950 = load %m0$.File.type*, %m0$.File.type** %.tmp5949
%.tmp5952 = getelementptr [16 x i8], [16 x i8]*@.str5951, i32 0, i32 0
%.tmp5953 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5828
%.tmp5954 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp5953)
%.tmp5955 = load i8*, i8** %var_type_repr.5907
%.tmp5956 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5950, i8* %.tmp5952, i8* %.tmp5954, i8* %.tmp5955)
%.tmp5957 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5795
%.tmp5958 = icmp ne %m2503$.AssignableInfo.type* %.tmp5957, null
br i1 %.tmp5958, label %.if.true.5959, label %.if.false.5959
.if.true.5959:
%.tmp5960 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5961 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp5960, i32 0, i32 1
%.tmp5962 = load %m0$.File.type*, %m0$.File.type** %.tmp5961
%.tmp5964 = getelementptr [21 x i8], [21 x i8]*@.str5963, i32 0, i32 0
%.tmp5965 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5966 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5795
%.tmp5967 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5966, i32 0, i32 4
%.tmp5968 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5967
%.tmp5969 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5965, %m2503$.Type.type* %.tmp5968)
%.tmp5970 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.5795
%.tmp5971 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp5970)
%.tmp5972 = load i8*, i8** %var_type_repr.5907
%.tmp5973 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5828
%.tmp5974 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp5973)
%.tmp5975 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5962, i8* %.tmp5964, i8* %.tmp5969, i8* %.tmp5971, i8* %.tmp5972, i8* %.tmp5974)
br label %.if.end.5959
.if.false.5959:
%.tmp5976 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5977 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp5978 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5828
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.AssignableInfo.type*) @m295$compile_zero_value.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp5976, %m878$.Node.type* %.tmp5977, %m2503$.AssignableInfo.type* %.tmp5978)
br label %.if.end.5959
.if.end.5959:
%.tmp5979 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.5828
ret %m2503$.AssignableInfo.type* %.tmp5979
}
define void @m295$compile_zero_value.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg, %m2503$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%info = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.info.arg, %m2503$.AssignableInfo.type** %info
%.tmp5980 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp5981 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5980, i32 0, i32 4
%.tmp5982 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5981
%.tmp5983 = icmp eq %m2503$.Type.type* %.tmp5982, null
br i1 %.tmp5983, label %.if.true.5984, label %.if.false.5984
.if.true.5984:
ret void
br label %.if.end.5984
.if.false.5984:
br label %.if.end.5984
.if.end.5984:
%.tmp5985 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp5986 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp5987 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5986, i32 0, i32 4
%.tmp5988 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5987
%.tmp5989 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp5985, %m2503$.Type.type* %.tmp5988)
%t_repr.5990 = alloca i8*
store i8* %.tmp5989, i8** %t_repr.5990
%.tmp5991 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp5992 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp5991)
%id.5993 = alloca i8*
store i8* %.tmp5992, i8** %id.5993
%field_id.5994 = alloca i32
store i32 0, i32* %field_id.5994
%field.5995 = alloca %m2503$.Type.type*
store %m2503$.Type.type* null, %m2503$.Type.type** %field.5995
%field_info.5996 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* null, %m2503$.AssignableInfo.type** %field_info.5996
%.tmp5997 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp5998 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp5997, i32 0, i32 4
%.tmp5999 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp5998
%t.6000 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp5999, %m2503$.Type.type** %t.6000
%.tmp6001 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6000
%.tmp6002 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6001, i32 0, i32 0
%.tmp6003 = load i8*, i8** %.tmp6002
%.tmp6005 = getelementptr [4 x i8], [4 x i8]*@.str6004, i32 0, i32 0
%.tmp6006 = call i32(i8*,i8*) @strcmp(i8* %.tmp6003, i8* %.tmp6005)
%.tmp6007 = icmp eq i32 %.tmp6006, 0
%.tmp6008 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6000
%.tmp6009 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6008, i32 0, i32 0
%.tmp6010 = load i8*, i8** %.tmp6009
%.tmp6012 = getelementptr [4 x i8], [4 x i8]*@.str6011, i32 0, i32 0
%.tmp6013 = call i32(i8*,i8*) @strcmp(i8* %.tmp6010, i8* %.tmp6012)
%.tmp6014 = icmp eq i32 %.tmp6013, 0
%.tmp6015 = or i1 %.tmp6007, %.tmp6014
%.tmp6016 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6000
%.tmp6017 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6016, i32 0, i32 0
%.tmp6018 = load i8*, i8** %.tmp6017
%.tmp6020 = getelementptr [5 x i8], [5 x i8]*@.str6019, i32 0, i32 0
%.tmp6021 = call i32(i8*,i8*) @strcmp(i8* %.tmp6018, i8* %.tmp6020)
%.tmp6022 = icmp eq i32 %.tmp6021, 0
%.tmp6023 = or i1 %.tmp6015, %.tmp6022
br i1 %.tmp6023, label %.if.true.6024, label %.if.false.6024
.if.true.6024:
%.tmp6025 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6026 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6025, i32 0, i32 1
%.tmp6027 = load %m0$.File.type*, %m0$.File.type** %.tmp6026
%.tmp6029 = getelementptr [21 x i8], [21 x i8]*@.str6028, i32 0, i32 0
%.tmp6030 = load i8*, i8** %t_repr.5990
%.tmp6031 = load i8*, i8** %t_repr.5990
%.tmp6032 = load i8*, i8** %id.5993
%.tmp6033 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6027, i8* %.tmp6029, i8* %.tmp6030, i32 0, i8* %.tmp6031, i8* %.tmp6032)
br label %.if.end.6024
.if.false.6024:
%.tmp6034 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6000
%.tmp6035 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6034, i32 0, i32 0
%.tmp6036 = load i8*, i8** %.tmp6035
%.tmp6038 = getelementptr [4 x i8], [4 x i8]*@.str6037, i32 0, i32 0
%.tmp6039 = call i32(i8*,i8*) @strcmp(i8* %.tmp6036, i8* %.tmp6038)
%.tmp6040 = icmp eq i32 %.tmp6039, 0
br i1 %.tmp6040, label %.if.true.6041, label %.if.false.6041
.if.true.6041:
%.tmp6042 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6043 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6042, i32 0, i32 1
%.tmp6044 = load %m0$.File.type*, %m0$.File.type** %.tmp6043
%.tmp6046 = getelementptr [21 x i8], [21 x i8]*@.str6045, i32 0, i32 0
%.tmp6047 = load i8*, i8** %t_repr.5990
%.tmp6049 = getelementptr [5 x i8], [5 x i8]*@.str6048, i32 0, i32 0
%.tmp6050 = load i8*, i8** %t_repr.5990
%.tmp6051 = load i8*, i8** %id.5993
%.tmp6052 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6044, i8* %.tmp6046, i8* %.tmp6047, i8* %.tmp6049, i8* %.tmp6050, i8* %.tmp6051)
br label %.if.end.6041
.if.false.6041:
%.tmp6053 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6000
%.tmp6054 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6053, i32 0, i32 0
%.tmp6055 = load i8*, i8** %.tmp6054
%.tmp6057 = getelementptr [7 x i8], [7 x i8]*@.str6056, i32 0, i32 0
%.tmp6058 = call i32(i8*,i8*) @strcmp(i8* %.tmp6055, i8* %.tmp6057)
%.tmp6059 = icmp eq i32 %.tmp6058, 0
br i1 %.tmp6059, label %.if.true.6060, label %.if.false.6060
.if.true.6060:
%.tmp6062 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6000
%.tmp6063 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6062, i32 0, i32 3
%.tmp6064 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6063
store %m2503$.Type.type* %.tmp6064, %m2503$.Type.type** %field.5995
br label %.for.start.6061
.for.start.6061:
%.tmp6065 = load %m2503$.Type.type*, %m2503$.Type.type** %field.5995
%.tmp6066 = icmp ne %m2503$.Type.type* %.tmp6065, null
br i1 %.tmp6066, label %.for.continue.6061, label %.for.end.6061
.for.continue.6061:
%.tmp6067 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6068 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp6067)
store %m2503$.AssignableInfo.type* %.tmp6068, %m2503$.AssignableInfo.type** %field_info.5996
%.tmp6069 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6070 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.5996
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6069, %m2503$.AssignableInfo.type* %.tmp6070)
%.tmp6071 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.5996
%.tmp6072 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6071, i32 0, i32 4
%.tmp6073 = load %m2503$.Type.type*, %m2503$.Type.type** %field.5995
store %m2503$.Type.type* %.tmp6073, %m2503$.Type.type** %.tmp6072
%.tmp6074 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6075 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6074, i32 0, i32 1
%.tmp6076 = load %m0$.File.type*, %m0$.File.type** %.tmp6075
%.tmp6078 = getelementptr [46 x i8], [46 x i8]*@.str6077, i32 0, i32 0
%.tmp6079 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.5996
%.tmp6080 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6079)
%.tmp6081 = load i8*, i8** %t_repr.5990
%.tmp6082 = load i8*, i8** %t_repr.5990
%.tmp6083 = load i8*, i8** %id.5993
%.tmp6084 = load i32, i32* %field_id.5994
%.tmp6085 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6076, i8* %.tmp6078, i8* %.tmp6080, i8* %.tmp6081, i8* %.tmp6082, i8* %.tmp6083, i32 %.tmp6084)
%.tmp6086 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6087 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6088 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.5996
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.AssignableInfo.type*) @m295$compile_zero_value.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6086, %m878$.Node.type* %.tmp6087, %m2503$.AssignableInfo.type* %.tmp6088)
%.tmp6089 = load i32, i32* %field_id.5994
%.tmp6090 = add i32 %.tmp6089, 1
store i32 %.tmp6090, i32* %field_id.5994
%.tmp6091 = load %m2503$.Type.type*, %m2503$.Type.type** %field.5995
%.tmp6092 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6091, i32 0, i32 4
%.tmp6093 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6092
store %m2503$.Type.type* %.tmp6093, %m2503$.Type.type** %field.5995
br label %.for.start.6061
.for.end.6061:
br label %.if.end.6060
.if.false.6060:
%.tmp6094 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6000
%.tmp6095 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6094, i32 0, i32 0
%.tmp6096 = load i8*, i8** %.tmp6095
%.tmp6098 = getelementptr [10 x i8], [10 x i8]*@.str6097, i32 0, i32 0
%.tmp6099 = call i32(i8*,i8*) @strcmp(i8* %.tmp6096, i8* %.tmp6098)
%.tmp6100 = icmp eq i32 %.tmp6099, 0
br i1 %.tmp6100, label %.if.true.6101, label %.if.false.6101
.if.true.6101:
%.tmp6103 = load %m2503$.Type.type*, %m2503$.Type.type** %t.6000
%.tmp6104 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6103, i32 0, i32 3
%.tmp6105 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6104
%.tmp6106 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6105, i32 0, i32 3
%.tmp6107 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6106
store %m2503$.Type.type* %.tmp6107, %m2503$.Type.type** %field.5995
br label %.for.start.6102
.for.start.6102:
%.tmp6108 = load %m2503$.Type.type*, %m2503$.Type.type** %field.5995
%.tmp6109 = icmp ne %m2503$.Type.type* %.tmp6108, null
br i1 %.tmp6109, label %.for.continue.6102, label %.for.end.6102
.for.continue.6102:
%.tmp6110 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6111 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp6110)
store %m2503$.AssignableInfo.type* %.tmp6111, %m2503$.AssignableInfo.type** %field_info.5996
%.tmp6112 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6113 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.5996
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6112, %m2503$.AssignableInfo.type* %.tmp6113)
%.tmp6114 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.5996
%.tmp6115 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6114, i32 0, i32 4
%.tmp6116 = load %m2503$.Type.type*, %m2503$.Type.type** %field.5995
store %m2503$.Type.type* %.tmp6116, %m2503$.Type.type** %.tmp6115
%.tmp6117 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6118 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6117, i32 0, i32 1
%.tmp6119 = load %m0$.File.type*, %m0$.File.type** %.tmp6118
%.tmp6121 = getelementptr [46 x i8], [46 x i8]*@.str6120, i32 0, i32 0
%.tmp6122 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.5996
%.tmp6123 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6122)
%.tmp6124 = load i8*, i8** %t_repr.5990
%.tmp6125 = load i8*, i8** %t_repr.5990
%.tmp6126 = load i8*, i8** %id.5993
%.tmp6127 = load i32, i32* %field_id.5994
%.tmp6128 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6119, i8* %.tmp6121, i8* %.tmp6123, i8* %.tmp6124, i8* %.tmp6125, i8* %.tmp6126, i32 %.tmp6127)
%.tmp6129 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6130 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6131 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %field_info.5996
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.AssignableInfo.type*) @m295$compile_zero_value.v.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6129, %m878$.Node.type* %.tmp6130, %m2503$.AssignableInfo.type* %.tmp6131)
%.tmp6132 = load i32, i32* %field_id.5994
%.tmp6133 = add i32 %.tmp6132, 1
store i32 %.tmp6133, i32* %field_id.5994
%.tmp6134 = load %m2503$.Type.type*, %m2503$.Type.type** %field.5995
%.tmp6135 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6134, i32 0, i32 4
%.tmp6136 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6135
store %m2503$.Type.type* %.tmp6136, %m2503$.Type.type** %field.5995
br label %.for.start.6102
.for.end.6102:
br label %.if.end.6101
.if.false.6101:
%.tmp6137 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6138 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6140 = getelementptr [44 x i8], [44 x i8]*@.str6139, i32 0, i32 0
%.tmp6141 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6137, %m878$.Node.type* %.tmp6138, i8* %.tmp6140)
%.tmp6142 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6143 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6142, i32 0, i32 4
%.tmp6144 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6143
%.tmp6145 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6144, i32 0, i32 0
%.tmp6146 = load i8*, i8** %.tmp6145
%.tmp6147 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6148 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6149 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6148, i32 0, i32 4
%.tmp6150 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6149
%.tmp6151 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6147, %m2503$.Type.type* %.tmp6150)
%.tmp6152 = call i32(i8*,...) @printf(i8* %.tmp6141, i8* %.tmp6146, i8* %.tmp6151)
ret void
br label %.if.end.6101
.if.end.6101:
br label %.if.end.6060
.if.end.6060:
br label %.if.end.6041
.if.end.6041:
br label %.if.end.6024
.if.end.6024:
ret void
}
define void @m295$compile_if_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp6153 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6154 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6153, i32 0, i32 6
%.tmp6155 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6154
%.tmp6157 = getelementptr [11 x i8], [11 x i8]*@.str6156, i32 0, i32 0
%.tmp6158 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp6155, i8* %.tmp6157)
%assignable.6159 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6158, %m878$.Node.type** %assignable.6159
%.tmp6160 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6161 = load %m878$.Node.type*, %m878$.Node.type** %assignable.6159
%.tmp6162 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6160, %m878$.Node.type* %.tmp6161)
%a_info.6163 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6162, %m2503$.AssignableInfo.type** %a_info.6163
%.tmp6164 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.6163
%.tmp6165 = icmp eq %m2503$.AssignableInfo.type* %.tmp6164, null
br i1 %.tmp6165, label %.if.true.6166, label %.if.false.6166
.if.true.6166:
ret void
br label %.if.end.6166
.if.false.6166:
br label %.if.end.6166
.if.end.6166:
%.tmp6167 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6168 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp6167)
%if_id.6169 = alloca i32
store i32 %.tmp6168, i32* %if_id.6169
%.tmp6170 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6171 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6170, i32 0, i32 1
%.tmp6172 = load %m0$.File.type*, %m0$.File.type** %.tmp6171
%.tmp6174 = getelementptr [53 x i8], [53 x i8]*@.str6173, i32 0, i32 0
%.tmp6175 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6176 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.6163
%.tmp6177 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6176, i32 0, i32 4
%.tmp6178 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6177
%.tmp6179 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6175, %m2503$.Type.type* %.tmp6178)
%.tmp6180 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %a_info.6163
%.tmp6181 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6180)
%.tmp6182 = load i32, i32* %if_id.6169
%.tmp6183 = load i32, i32* %if_id.6169
%.tmp6184 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6172, i8* %.tmp6174, i8* %.tmp6179, i8* %.tmp6181, i32 %.tmp6182, i32 %.tmp6183)
%.tmp6185 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6186 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6185, i32 0, i32 1
%.tmp6187 = load %m0$.File.type*, %m0$.File.type** %.tmp6186
%.tmp6189 = getelementptr [14 x i8], [14 x i8]*@.str6188, i32 0, i32 0
%.tmp6190 = load i32, i32* %if_id.6169
%.tmp6191 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6187, i8* %.tmp6189, i32 %.tmp6190)
%.tmp6192 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6193 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6192, i32 0, i32 6
%.tmp6194 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6193
%.tmp6196 = getelementptr [6 x i8], [6 x i8]*@.str6195, i32 0, i32 0
%.tmp6197 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp6194, i8* %.tmp6196)
%block.6198 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6197, %m878$.Node.type** %block.6198
%.tmp6199 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6200 = load %m878$.Node.type*, %m878$.Node.type** %block.6198
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6199, %m878$.Node.type* %.tmp6200)
%.tmp6201 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6202 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6201, i32 0, i32 1
%.tmp6203 = load %m0$.File.type*, %m0$.File.type** %.tmp6202
%.tmp6205 = getelementptr [23 x i8], [23 x i8]*@.str6204, i32 0, i32 0
%.tmp6206 = load i32, i32* %if_id.6169
%.tmp6207 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6203, i8* %.tmp6205, i32 %.tmp6206)
%.tmp6208 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6209 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6208, i32 0, i32 1
%.tmp6210 = load %m0$.File.type*, %m0$.File.type** %.tmp6209
%.tmp6212 = getelementptr [15 x i8], [15 x i8]*@.str6211, i32 0, i32 0
%.tmp6213 = load i32, i32* %if_id.6169
%.tmp6214 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6210, i8* %.tmp6212, i32 %.tmp6213)
%.tmp6215 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6216 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6215, i32 0, i32 6
%.tmp6217 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6216
%.tmp6219 = getelementptr [11 x i8], [11 x i8]*@.str6218, i32 0, i32 0
%.tmp6220 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp6217, i8* %.tmp6219)
%else_block.6221 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6220, %m878$.Node.type** %else_block.6221
%.tmp6222 = load %m878$.Node.type*, %m878$.Node.type** %else_block.6221
%.tmp6223 = icmp ne %m878$.Node.type* %.tmp6222, null
br i1 %.tmp6223, label %.if.true.6224, label %.if.false.6224
.if.true.6224:
%.tmp6225 = load %m878$.Node.type*, %m878$.Node.type** %else_block.6221
%.tmp6226 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6225, i32 0, i32 6
%.tmp6227 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6226
%.tmp6228 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6227, i32 0, i32 0
%.tmp6229 = load i8*, i8** %.tmp6228
%.tmp6231 = getelementptr [11 x i8], [11 x i8]*@.str6230, i32 0, i32 0
%.tmp6232 = call i32(i8*,i8*) @strcmp(i8* %.tmp6229, i8* %.tmp6231)
%.tmp6233 = icmp eq i32 %.tmp6232, 0
br i1 %.tmp6233, label %.if.true.6234, label %.if.false.6234
.if.true.6234:
%.tmp6235 = load %m878$.Node.type*, %m878$.Node.type** %else_block.6221
%.tmp6236 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6235, i32 0, i32 6
%.tmp6237 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6236
%.tmp6238 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6237, i32 0, i32 6
%.tmp6239 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6238
%.tmp6241 = getelementptr [6 x i8], [6 x i8]*@.str6240, i32 0, i32 0
%.tmp6242 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp6239, i8* %.tmp6241)
store %m878$.Node.type* %.tmp6242, %m878$.Node.type** %block.6198
%.tmp6243 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6244 = load %m878$.Node.type*, %m878$.Node.type** %block.6198
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6243, %m878$.Node.type* %.tmp6244)
br label %.if.end.6234
.if.false.6234:
%.tmp6245 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6246 = load %m878$.Node.type*, %m878$.Node.type** %else_block.6221
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_if_block.v.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6245, %m878$.Node.type* %.tmp6246)
br label %.if.end.6234
.if.end.6234:
br label %.if.end.6224
.if.false.6224:
br label %.if.end.6224
.if.end.6224:
%.tmp6247 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6248 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6247, i32 0, i32 1
%.tmp6249 = load %m0$.File.type*, %m0$.File.type** %.tmp6248
%.tmp6251 = getelementptr [23 x i8], [23 x i8]*@.str6250, i32 0, i32 0
%.tmp6252 = load i32, i32* %if_id.6169
%.tmp6253 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6249, i8* %.tmp6251, i32 %.tmp6252)
%.tmp6254 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6255 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6254, i32 0, i32 1
%.tmp6256 = load %m0$.File.type*, %m0$.File.type** %.tmp6255
%.tmp6258 = getelementptr [13 x i8], [13 x i8]*@.str6257, i32 0, i32 0
%.tmp6259 = load i32, i32* %if_id.6169
%.tmp6260 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6256, i8* %.tmp6258, i32 %.tmp6259)
ret void
}
define void @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%curr_node = alloca %m878$.Node.type*
store %m878$.Node.type* %.curr_node.arg, %m878$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp6261 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp6262 = icmp ne %m878$.Node.type* %.tmp6261, null
br i1 %.tmp6262, label %.if.true.6263, label %.if.false.6263
.if.true.6263:
%.tmp6264 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6265 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6264, i32 0, i32 7
%.tmp6266 = load i8*, i8** %.tmp6265
%.tmp6267 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp6268 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6267, i32 0, i32 3
%.tmp6269 = load i32, i32* %.tmp6268
%.tmp6270 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp6271 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6270, i32 0, i32 4
%.tmp6272 = load i32, i32* %.tmp6271
%.tmp6273 = load i8*, i8** %msg
%.tmp6274 = call %m296$.Error.type*(i8*,i32,i32,i8*) @m296$new.m296$.Error.typep.cp.i.i.cp(i8* %.tmp6266, i32 %.tmp6269, i32 %.tmp6272, i8* %.tmp6273)
%err.6275 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp6274, %m296$.Error.type** %err.6275
%.tmp6276 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6277 = load %m296$.Error.type*, %m296$.Error.type** %err.6275
call void(%m2503$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2503$.CompilerCtx.typep.m296$.Error.typep(%m2503$.CompilerCtx.type* %.tmp6276, %m296$.Error.type* %.tmp6277)
br label %.if.end.6263
.if.false.6263:
%.tmp6279 = getelementptr [61 x i8], [61 x i8]*@.str6278, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp6279)
br label %.if.end.6263
.if.end.6263:
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
%.tmp6280 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6281 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*) @m295$get_current_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp6280)
%mod.6282 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp6281, %m2503$.ModuleLookup.type** %mod.6282
%.tmp6283 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.6282
%.tmp6284 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp6283, i32 0, i32 3
%.tmp6285 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp6284
%.tmp6286 = icmp ne %m2503$.Scope.type* %.tmp6285, null
%.tmp6288 = getelementptr [82 x i8], [82 x i8]*@.str6287, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6286, i8* %.tmp6288)
%.tmp6289 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.6282
%.tmp6290 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp6289, i32 0, i32 3
%.tmp6291 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp6290
%current_scope.6292 = alloca %m2503$.Scope.type*
store %m2503$.Scope.type* %.tmp6291, %m2503$.Scope.type** %current_scope.6292
%.tmp6293 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* null, i32 1
%.tmp6294 = ptrtoint %m2503$.ScopeItem.type* %.tmp6293 to i32
%.tmp6295 = call i8*(i32) @malloc(i32 %.tmp6294)
%.tmp6296 = bitcast i8* %.tmp6295 to %m2503$.ScopeItem.type*
%newitem.6297 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp6296, %m2503$.ScopeItem.type** %newitem.6297
%.tmp6298 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %newitem.6297
%.tmp6299 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6298, i32 0, i32 0
%.tmp6300 = load i8*, i8** %name
store i8* %.tmp6300, i8** %.tmp6299
%.tmp6301 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %newitem.6297
%.tmp6302 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6301, i32 0, i32 1
%.tmp6303 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
store %m2503$.AssignableInfo.type* %.tmp6303, %m2503$.AssignableInfo.type** %.tmp6302
%.tmp6304 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %newitem.6297
%.tmp6305 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6304, i32 0, i32 2
store %m2503$.ScopeItem.type* null, %m2503$.ScopeItem.type** %.tmp6305
%.tmp6306 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6307 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6306, i32 0, i32 2
%.tmp6308 = load i8*, i8** %name
store i8* %.tmp6308, i8** %.tmp6307
%.tmp6309 = load %m2503$.Scope.type*, %m2503$.Scope.type** %current_scope.6292
%.tmp6310 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp6309, i32 0, i32 1
%.tmp6311 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %.tmp6310
%.tmp6312 = icmp eq %m2503$.ScopeItem.type* %.tmp6311, null
br i1 %.tmp6312, label %.if.true.6313, label %.if.false.6313
.if.true.6313:
%.tmp6314 = load %m2503$.Scope.type*, %m2503$.Scope.type** %current_scope.6292
%.tmp6315 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp6314, i32 0, i32 1
%.tmp6316 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %newitem.6297
store %m2503$.ScopeItem.type* %.tmp6316, %m2503$.ScopeItem.type** %.tmp6315
ret void
br label %.if.end.6313
.if.false.6313:
br label %.if.end.6313
.if.end.6313:
%.tmp6317 = load %m2503$.Scope.type*, %m2503$.Scope.type** %current_scope.6292
%.tmp6318 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp6317, i32 0, i32 1
%.tmp6319 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %.tmp6318
%last_item.6320 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp6319, %m2503$.ScopeItem.type** %last_item.6320
%.tmp6322 = getelementptr [1 x i8], [1 x i8]*@.str6321, i32 0, i32 0
%err_buf.6323 = alloca i8*
store i8* %.tmp6322, i8** %err_buf.6323
%.tmp6324 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %last_item.6320
%.tmp6325 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6324, i32 0, i32 0
%.tmp6326 = load i8*, i8** %.tmp6325
%.tmp6327 = load i8*, i8** %name
%.tmp6328 = call i32(i8*,i8*) @strcmp(i8* %.tmp6326, i8* %.tmp6327)
%.tmp6329 = icmp eq i32 %.tmp6328, 0
br i1 %.tmp6329, label %.if.true.6330, label %.if.false.6330
.if.true.6330:
%.tmp6331 = getelementptr i8*, i8** %err_buf.6323, i32 0
%.tmp6333 = getelementptr [43 x i8], [43 x i8]*@.str6332, i32 0, i32 0
%.tmp6334 = load i8*, i8** %name
%.tmp6335 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6331, i8* %.tmp6333, i8* %.tmp6334)
%.tmp6336 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6337 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6338 = load i8*, i8** %err_buf.6323
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6336, %m878$.Node.type* %.tmp6337, i8* %.tmp6338)
br label %.if.end.6330
.if.false.6330:
br label %.if.end.6330
.if.end.6330:
br label %.for.start.6339
.for.start.6339:
%.tmp6340 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %last_item.6320
%.tmp6341 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6340, i32 0, i32 2
%.tmp6342 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %.tmp6341
%.tmp6343 = icmp ne %m2503$.ScopeItem.type* %.tmp6342, null
br i1 %.tmp6343, label %.for.continue.6339, label %.for.else.6339
.for.continue.6339:
%.tmp6344 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %last_item.6320
%.tmp6345 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6344, i32 0, i32 0
%.tmp6346 = load i8*, i8** %.tmp6345
%.tmp6347 = load i8*, i8** %name
%.tmp6348 = call i32(i8*,i8*) @strcmp(i8* %.tmp6346, i8* %.tmp6347)
%.tmp6349 = icmp eq i32 %.tmp6348, 0
br i1 %.tmp6349, label %.if.true.6350, label %.if.false.6350
.if.true.6350:
%.tmp6351 = getelementptr i8*, i8** %err_buf.6323, i32 0
%.tmp6353 = getelementptr [43 x i8], [43 x i8]*@.str6352, i32 0, i32 0
%.tmp6354 = load i8*, i8** %name
%.tmp6355 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6351, i8* %.tmp6353, i8* %.tmp6354)
%.tmp6356 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6357 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6358 = load i8*, i8** %err_buf.6323
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6356, %m878$.Node.type* %.tmp6357, i8* %.tmp6358)
br label %.for.end.6339
br label %.if.end.6350
.if.false.6350:
br label %.if.end.6350
.if.end.6350:
%.tmp6359 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %last_item.6320
%.tmp6360 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6359, i32 0, i32 2
%.tmp6361 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %.tmp6360
store %m2503$.ScopeItem.type* %.tmp6361, %m2503$.ScopeItem.type** %last_item.6320
br label %.for.start.6339
.for.else.6339:
%.tmp6362 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %last_item.6320
%.tmp6363 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6362, i32 0, i32 2
%.tmp6364 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %newitem.6297
store %m2503$.ScopeItem.type* %.tmp6364, %m2503$.ScopeItem.type** %.tmp6363
br label %.for.end.6339
.for.end.6339:
ret void
}
define %m2503$.ScopeItem.type* @m295$find_defined_in.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m878$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m878$.Node.type*
store %m878$.Node.type* %.dotted_name.arg, %m878$.Node.type** %dotted_name
%err_buf.6365 = alloca i8*
store i8* null, i8** %err_buf.6365
%.tmp6366 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6367 = load i8*, i8** %module
%.tmp6368 = load %m878$.Node.type*, %m878$.Node.type** %dotted_name
%.tmp6369 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6368, i32 0, i32 1
%.tmp6370 = load i8*, i8** %.tmp6369
%.tmp6371 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.cp(%m2503$.CompilerCtx.type* %.tmp6366, i8* %.tmp6367, i8* %.tmp6370)
%found.6372 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp6371, %m2503$.ScopeItem.type** %found.6372
%.tmp6373 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %found.6372
%.tmp6374 = icmp eq %m2503$.ScopeItem.type* %.tmp6373, null
br i1 %.tmp6374, label %.if.true.6375, label %.if.false.6375
.if.true.6375:
%.tmp6376 = getelementptr i8*, i8** %err_buf.6365, i32 0
%.tmp6378 = getelementptr [31 x i8], [31 x i8]*@.str6377, i32 0, i32 0
%.tmp6379 = load %m878$.Node.type*, %m878$.Node.type** %dotted_name
%.tmp6380 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6379, i32 0, i32 1
%.tmp6381 = load i8*, i8** %.tmp6380
%.tmp6382 = load i8*, i8** %module
%.tmp6383 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6376, i8* %.tmp6378, i8* %.tmp6381, i8* %.tmp6382)
%.tmp6384 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6385 = load %m878$.Node.type*, %m878$.Node.type** %dotted_name
%.tmp6386 = load i8*, i8** %err_buf.6365
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6384, %m878$.Node.type* %.tmp6385, i8* %.tmp6386)
%.tmp6387 = bitcast ptr null to %m2503$.ScopeItem.type*
ret %m2503$.ScopeItem.type* %.tmp6387
br label %.if.end.6375
.if.false.6375:
br label %.if.end.6375
.if.end.6375:
br label %.for.start.6388
.for.start.6388:
%.tmp6389 = load %m878$.Node.type*, %m878$.Node.type** %dotted_name
%.tmp6390 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6389, i32 0, i32 7
%.tmp6391 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6390
%.tmp6392 = icmp ne %m878$.Node.type* %.tmp6391, null
%.tmp6393 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %found.6372
%.tmp6394 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6393, i32 0, i32 1
%.tmp6395 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp6394
%.tmp6396 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6395, i32 0, i32 3
%.tmp6397 = load i8*, i8** %.tmp6396
%.tmp6399 = getelementptr [7 x i8], [7 x i8]*@.str6398, i32 0, i32 0
%.tmp6400 = call i32(i8*,i8*) @strcmp(i8* %.tmp6397, i8* %.tmp6399)
%.tmp6401 = icmp eq i32 %.tmp6400, 0
%.tmp6402 = and i1 %.tmp6392, %.tmp6401
br i1 %.tmp6402, label %.for.continue.6388, label %.for.end.6388
.for.continue.6388:
%.tmp6403 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6404 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %found.6372
%.tmp6405 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6404, i32 0, i32 1
%.tmp6406 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp6405
%.tmp6407 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6406, i32 0, i32 0
%.tmp6408 = load i8*, i8** %.tmp6407
%.tmp6409 = load %m878$.Node.type*, %m878$.Node.type** %dotted_name
%.tmp6410 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6409, i32 0, i32 7
%.tmp6411 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6410
%.tmp6412 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6411, i32 0, i32 7
%.tmp6413 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6412
%.tmp6414 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,i8*,%m878$.Node.type*) @m295$find_defined_in.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6403, i8* %.tmp6408, %m878$.Node.type* %.tmp6413)
store %m2503$.ScopeItem.type* %.tmp6414, %m2503$.ScopeItem.type** %found.6372
%.tmp6415 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %found.6372
%.tmp6416 = icmp eq %m2503$.ScopeItem.type* %.tmp6415, null
br i1 %.tmp6416, label %.if.true.6417, label %.if.false.6417
.if.true.6417:
%.tmp6418 = bitcast ptr null to %m2503$.ScopeItem.type*
ret %m2503$.ScopeItem.type* %.tmp6418
br label %.if.end.6417
.if.false.6417:
br label %.if.end.6417
.if.end.6417:
br label %.for.start.6388
.for.end.6388:
%.tmp6419 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %found.6372
ret %m2503$.ScopeItem.type* %.tmp6419
}
define %m2503$.ScopeItem.type* @m295$find_defined_here.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.m2503$.Scope.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%s = alloca %m2503$.Scope.type*
store %m2503$.Scope.type* %.s.arg, %m2503$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp6420 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s
%.tmp6421 = icmp eq %m2503$.Scope.type* %.tmp6420, null
br i1 %.tmp6421, label %.if.true.6422, label %.if.false.6422
.if.true.6422:
%.tmp6423 = bitcast ptr null to %m2503$.ScopeItem.type*
ret %m2503$.ScopeItem.type* %.tmp6423
br label %.if.end.6422
.if.false.6422:
br label %.if.end.6422
.if.end.6422:
%.tmp6425 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s
%.tmp6426 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp6425, i32 0, i32 1
%.tmp6427 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %.tmp6426
%item.6428 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp6427, %m2503$.ScopeItem.type** %item.6428
br label %.for.start.6424
.for.start.6424:
%.tmp6429 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %item.6428
%.tmp6430 = icmp ne %m2503$.ScopeItem.type* %.tmp6429, null
br i1 %.tmp6430, label %.for.continue.6424, label %.for.end.6424
.for.continue.6424:
%.tmp6431 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %item.6428
%.tmp6432 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6431, i32 0, i32 0
%.tmp6433 = load i8*, i8** %.tmp6432
%.tmp6434 = load i8*, i8** %name
%.tmp6435 = call i32(i8*,i8*) @strcmp(i8* %.tmp6433, i8* %.tmp6434)
%.tmp6436 = icmp eq i32 %.tmp6435, 0
br i1 %.tmp6436, label %.if.true.6437, label %.if.false.6437
.if.true.6437:
%.tmp6438 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %item.6428
ret %m2503$.ScopeItem.type* %.tmp6438
br label %.if.end.6437
.if.false.6437:
br label %.if.end.6437
.if.end.6437:
%.tmp6439 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %item.6428
%.tmp6440 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6439, i32 0, i32 2
%.tmp6441 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %.tmp6440
store %m2503$.ScopeItem.type* %.tmp6441, %m2503$.ScopeItem.type** %item.6428
br label %.for.start.6424
.for.end.6424:
%.tmp6442 = bitcast ptr null to %m2503$.ScopeItem.type*
ret %m2503$.ScopeItem.type* %.tmp6442
}
define %m2503$.ScopeItem.type* @m295$find_defined_str.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.cp(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp6443 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6444 = load i8*, i8** %module
%.tmp6445 = call %m2503$.ModuleLookup.type*(%m2503$.CompilerCtx.type*,i8*) @m295$get_module.m2503$.ModuleLookup.typep.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.tmp6443, i8* %.tmp6444)
%mod.6446 = alloca %m2503$.ModuleLookup.type*
store %m2503$.ModuleLookup.type* %.tmp6445, %m2503$.ModuleLookup.type** %mod.6446
%.tmp6447 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.6446
%.tmp6448 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp6447, i32 0, i32 3
%.tmp6449 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp6448
%.tmp6450 = icmp ne %m2503$.Scope.type* %.tmp6449, null
%.tmp6452 = getelementptr [77 x i8], [77 x i8]*@.str6451, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6450, i8* %.tmp6452)
%.tmp6454 = load %m2503$.ModuleLookup.type*, %m2503$.ModuleLookup.type** %mod.6446
%.tmp6455 = getelementptr %m2503$.ModuleLookup.type, %m2503$.ModuleLookup.type* %.tmp6454, i32 0, i32 3
%.tmp6456 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp6455
%s.6457 = alloca %m2503$.Scope.type*
store %m2503$.Scope.type* %.tmp6456, %m2503$.Scope.type** %s.6457
br label %.for.start.6453
.for.start.6453:
%.tmp6458 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.6457
%.tmp6459 = icmp ne %m2503$.Scope.type* %.tmp6458, null
br i1 %.tmp6459, label %.for.continue.6453, label %.for.end.6453
.for.continue.6453:
%.tmp6460 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6461 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.6457
%.tmp6462 = load i8*, i8** %assignable_name
%.tmp6463 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,%m2503$.Scope.type*,i8*) @m295$find_defined_here.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.m2503$.Scope.typep.cp(%m2503$.CompilerCtx.type* %.tmp6460, %m2503$.Scope.type* %.tmp6461, i8* %.tmp6462)
%item.6464 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp6463, %m2503$.ScopeItem.type** %item.6464
%.tmp6465 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %item.6464
%.tmp6466 = icmp ne %m2503$.ScopeItem.type* %.tmp6465, null
br i1 %.tmp6466, label %.if.true.6467, label %.if.false.6467
.if.true.6467:
%.tmp6468 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %item.6464
ret %m2503$.ScopeItem.type* %.tmp6468
br label %.if.end.6467
.if.false.6467:
br label %.if.end.6467
.if.end.6467:
%.tmp6469 = load %m2503$.Scope.type*, %m2503$.Scope.type** %s.6457
%.tmp6470 = getelementptr %m2503$.Scope.type, %m2503$.Scope.type* %.tmp6469, i32 0, i32 5
%.tmp6471 = load %m2503$.Scope.type*, %m2503$.Scope.type** %.tmp6470
store %m2503$.Scope.type* %.tmp6471, %m2503$.Scope.type** %s.6457
br label %.for.start.6453
.for.end.6453:
%.tmp6472 = bitcast ptr null to %m2503$.ScopeItem.type*
ret %m2503$.ScopeItem.type* %.tmp6472
}
define %m2503$.ScopeItem.type* @m295$find_defined.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%dotted_name = alloca %m878$.Node.type*
store %m878$.Node.type* %.dotted_name.arg, %m878$.Node.type** %dotted_name
%.tmp6473 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6474 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6475 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6474, i32 0, i32 7
%.tmp6476 = load i8*, i8** %.tmp6475
%.tmp6477 = load %m878$.Node.type*, %m878$.Node.type** %dotted_name
%.tmp6478 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6477, i32 0, i32 6
%.tmp6479 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6478
%.tmp6480 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,i8*,%m878$.Node.type*) @m295$find_defined_in.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6473, i8* %.tmp6476, %m878$.Node.type* %.tmp6479)
ret %m2503$.ScopeItem.type* %.tmp6480
}
define %m2503$.AssignableInfo.type* @m295$get_dotted_name.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.dot_name_ptr.arg, %m2503$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m878$.Node.type*
store %m878$.Node.type* %.dot_name_ptr.arg, %m878$.Node.type** %dot_name_ptr
%info = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.info.arg, %m2503$.AssignableInfo.type** %info
%err_msg.6481 = alloca i8*
store i8* null, i8** %err_msg.6481
%buf.6482 = alloca i8*
store i8* null, i8** %buf.6482
%.tmp6483 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6484 = icmp eq %m2503$.AssignableInfo.type* %.tmp6483, null
br i1 %.tmp6484, label %.if.true.6485, label %.if.false.6485
.if.true.6485:
%.tmp6486 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6487 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6489 = getelementptr [54 x i8], [54 x i8]*@.str6488, i32 0, i32 0
%.tmp6490 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6486, %m878$.Node.type* %.tmp6487, i8* %.tmp6489)
%.tmp6491 = call i32(i8*,...) @printf(i8* %.tmp6490)
%.tmp6492 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6492
br label %.if.end.6485
.if.false.6485:
br label %.if.end.6485
.if.end.6485:
%.tmp6493 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6494 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6493, i32 0, i32 3
%.tmp6495 = load i8*, i8** %.tmp6494
%.tmp6497 = getelementptr [9 x i8], [9 x i8]*@.str6496, i32 0, i32 0
%.tmp6498 = call i32(i8*,i8*) @strcmp(i8* %.tmp6495, i8* %.tmp6497)
%.tmp6499 = icmp eq i32 %.tmp6498, 0
%.tmp6500 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6501 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6500, i32 0, i32 3
%.tmp6502 = load i8*, i8** %.tmp6501
%.tmp6504 = getelementptr [7 x i8], [7 x i8]*@.str6503, i32 0, i32 0
%.tmp6505 = call i32(i8*,i8*) @strcmp(i8* %.tmp6502, i8* %.tmp6504)
%.tmp6506 = icmp eq i32 %.tmp6505, 0
%.tmp6507 = or i1 %.tmp6499, %.tmp6506
br i1 %.tmp6507, label %.if.true.6508, label %.if.false.6508
.if.true.6508:
%.tmp6509 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6510 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6509, i32 0, i32 7
%.tmp6511 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6510
%.tmp6512 = icmp ne %m878$.Node.type* %.tmp6511, null
br i1 %.tmp6512, label %.if.true.6513, label %.if.false.6513
.if.true.6513:
%.tmp6514 = getelementptr i8*, i8** %err_msg.6481, i32 0
%.tmp6516 = getelementptr [46 x i8], [46 x i8]*@.str6515, i32 0, i32 0
%.tmp6517 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6518 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6517, i32 0, i32 7
%.tmp6519 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6518
%.tmp6520 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6519, i32 0, i32 7
%.tmp6521 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6520
%.tmp6522 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6521, i32 0, i32 1
%.tmp6523 = load i8*, i8** %.tmp6522
%.tmp6524 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6525 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6524, i32 0, i32 1
%.tmp6526 = load i8*, i8** %.tmp6525
%.tmp6527 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6514, i8* %.tmp6516, i8* %.tmp6523, i8* %.tmp6526)
%.tmp6528 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6529 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6530 = load i8*, i8** %err_msg.6481
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6528, %m878$.Node.type* %.tmp6529, i8* %.tmp6530)
%.tmp6531 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6531
br label %.if.end.6513
.if.false.6513:
br label %.if.end.6513
.if.end.6513:
%.tmp6532 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
ret %m2503$.AssignableInfo.type* %.tmp6532
br label %.if.end.6508
.if.false.6508:
%.tmp6533 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6534 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6533, i32 0, i32 3
%.tmp6535 = load i8*, i8** %.tmp6534
%.tmp6537 = getelementptr [9 x i8], [9 x i8]*@.str6536, i32 0, i32 0
%.tmp6538 = call i32(i8*,i8*) @strcmp(i8* %.tmp6535, i8* %.tmp6537)
%.tmp6539 = icmp eq i32 %.tmp6538, 0
%.tmp6540 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6541 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6540, i32 0, i32 7
%.tmp6542 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6541
%.tmp6543 = icmp ne %m878$.Node.type* %.tmp6542, null
%.tmp6544 = and i1 %.tmp6539, %.tmp6543
br i1 %.tmp6544, label %.if.true.6545, label %.if.false.6545
.if.true.6545:
%.tmp6546 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%base_var.6547 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6546, %m2503$.AssignableInfo.type** %base_var.6547
%.tmp6548 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6547
%.tmp6549 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6548, i32 0, i32 4
%.tmp6550 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6549
%struct_info.6551 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp6550, %m2503$.Type.type** %struct_info.6551
br label %.for.start.6552
.for.start.6552:
%.tmp6553 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6547
%.tmp6554 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6553, i32 0, i32 4
%.tmp6555 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6554
%.tmp6556 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6555, i32 0, i32 0
%.tmp6557 = load i8*, i8** %.tmp6556
%.tmp6559 = getelementptr [4 x i8], [4 x i8]*@.str6558, i32 0, i32 0
%.tmp6560 = call i32(i8*,i8*) @strcmp(i8* %.tmp6557, i8* %.tmp6559)
%.tmp6561 = icmp eq i32 %.tmp6560, 0
br i1 %.tmp6561, label %.for.continue.6552, label %.for.end.6552
.for.continue.6552:
%.tmp6562 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6563 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp6562)
%new_base.6564 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6563, %m2503$.AssignableInfo.type** %new_base.6564
%.tmp6565 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6566 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6564
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6565, %m2503$.AssignableInfo.type* %.tmp6566)
%.tmp6567 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6564
%.tmp6568 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6567, i32 0, i32 4
%.tmp6569 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6547
%.tmp6570 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6569, i32 0, i32 4
%.tmp6571 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6570
%.tmp6572 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6571, i32 0, i32 3
%.tmp6573 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6572
store %m2503$.Type.type* %.tmp6573, %m2503$.Type.type** %.tmp6568
%.tmp6574 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6575 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6574, i32 0, i32 1
%.tmp6576 = load %m0$.File.type*, %m0$.File.type** %.tmp6575
%.tmp6578 = getelementptr [23 x i8], [23 x i8]*@.str6577, i32 0, i32 0
%.tmp6579 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6564
%.tmp6580 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6579)
%.tmp6581 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6582 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6564
%.tmp6583 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6582, i32 0, i32 4
%.tmp6584 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6583
%.tmp6585 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6581, %m2503$.Type.type* %.tmp6584)
%.tmp6586 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6587 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6547
%.tmp6588 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6587, i32 0, i32 4
%.tmp6589 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6588
%.tmp6590 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6586, %m2503$.Type.type* %.tmp6589)
%.tmp6591 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6547
%.tmp6592 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6591)
%.tmp6593 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6576, i8* %.tmp6578, i8* %.tmp6580, i8* %.tmp6585, i8* %.tmp6590, i8* %.tmp6592)
%.tmp6594 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6564
store %m2503$.AssignableInfo.type* %.tmp6594, %m2503$.AssignableInfo.type** %base_var.6547
%.tmp6595 = load %m2503$.Type.type*, %m2503$.Type.type** %struct_info.6551
%.tmp6596 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6595, i32 0, i32 3
%.tmp6597 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6596
store %m2503$.Type.type* %.tmp6597, %m2503$.Type.type** %struct_info.6551
br label %.for.start.6552
.for.end.6552:
%.tmp6598 = load %m2503$.Type.type*, %m2503$.Type.type** %struct_info.6551
%.tmp6599 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6598, i32 0, i32 0
%.tmp6600 = load i8*, i8** %.tmp6599
%.tmp6602 = getelementptr [10 x i8], [10 x i8]*@.str6601, i32 0, i32 0
%.tmp6603 = call i32(i8*,i8*) @strcmp(i8* %.tmp6600, i8* %.tmp6602)
%.tmp6604 = icmp eq i32 %.tmp6603, 0
br i1 %.tmp6604, label %.if.true.6605, label %.if.false.6605
.if.true.6605:
%.tmp6606 = load %m2503$.Type.type*, %m2503$.Type.type** %struct_info.6551
%.tmp6607 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6606, i32 0, i32 3
%.tmp6608 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6607
store %m2503$.Type.type* %.tmp6608, %m2503$.Type.type** %struct_info.6551
br label %.if.end.6605
.if.false.6605:
br label %.if.end.6605
.if.end.6605:
%.tmp6609 = load %m2503$.Type.type*, %m2503$.Type.type** %struct_info.6551
%.tmp6610 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6609, i32 0, i32 0
%.tmp6611 = load i8*, i8** %.tmp6610
%.tmp6613 = getelementptr [7 x i8], [7 x i8]*@.str6612, i32 0, i32 0
%.tmp6614 = call i32(i8*,i8*) @strcmp(i8* %.tmp6611, i8* %.tmp6613)
%.tmp6615 = icmp ne i32 %.tmp6614, 0
br i1 %.tmp6615, label %.if.true.6616, label %.if.false.6616
.if.true.6616:
%.tmp6617 = getelementptr i8*, i8** %err_msg.6481, i32 0
%.tmp6619 = getelementptr [48 x i8], [48 x i8]*@.str6618, i32 0, i32 0
%.tmp6620 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6621 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6620, i32 0, i32 7
%.tmp6622 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6621
%.tmp6623 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6622, i32 0, i32 7
%.tmp6624 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6623
%.tmp6625 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6624, i32 0, i32 1
%.tmp6626 = load i8*, i8** %.tmp6625
%.tmp6627 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6628 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6627, i32 0, i32 1
%.tmp6629 = load i8*, i8** %.tmp6628
%.tmp6630 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6617, i8* %.tmp6619, i8* %.tmp6626, i8* %.tmp6629)
%.tmp6631 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6632 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6633 = load i8*, i8** %err_msg.6481
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6631, %m878$.Node.type* %.tmp6632, i8* %.tmp6633)
%.tmp6634 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6634
br label %.if.end.6616
.if.false.6616:
br label %.if.end.6616
.if.end.6616:
%.tmp6635 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6636 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6635, i32 0, i32 7
%.tmp6637 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6636
%.tmp6638 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6637, i32 0, i32 7
%.tmp6639 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6638
%.tmp6640 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6639, i32 0, i32 1
%.tmp6641 = load i8*, i8** %.tmp6640
%field_name.6642 = alloca i8*
store i8* %.tmp6641, i8** %field_name.6642
%field_id.6643 = alloca i32
store i32 0, i32* %field_id.6643
%.tmp6644 = bitcast ptr null to %m2503$.Type.type*
%found_field.6645 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp6644, %m2503$.Type.type** %found_field.6645
%.tmp6647 = load %m2503$.Type.type*, %m2503$.Type.type** %struct_info.6551
%.tmp6648 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6647, i32 0, i32 3
%.tmp6649 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6648
%field.6650 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp6649, %m2503$.Type.type** %field.6650
br label %.for.start.6646
.for.start.6646:
%.tmp6651 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6650
%.tmp6652 = icmp ne %m2503$.Type.type* %.tmp6651, null
br i1 %.tmp6652, label %.for.continue.6646, label %.for.end.6646
.for.continue.6646:
%.tmp6653 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6650
%.tmp6654 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6653, i32 0, i32 1
%.tmp6655 = load i8*, i8** %.tmp6654
%.tmp6656 = load i8*, i8** %field_name.6642
%.tmp6657 = call i32(i8*,i8*) @strcmp(i8* %.tmp6655, i8* %.tmp6656)
%.tmp6658 = icmp eq i32 %.tmp6657, 0
br i1 %.tmp6658, label %.if.true.6659, label %.if.false.6659
.if.true.6659:
%.tmp6660 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6650
store %m2503$.Type.type* %.tmp6660, %m2503$.Type.type** %found_field.6645
br label %.for.end.6646
br label %.if.end.6659
.if.false.6659:
%.tmp6661 = load i32, i32* %field_id.6643
%.tmp6662 = add i32 %.tmp6661, 1
store i32 %.tmp6662, i32* %field_id.6643
br label %.if.end.6659
.if.end.6659:
%.tmp6663 = load %m2503$.Type.type*, %m2503$.Type.type** %field.6650
%.tmp6664 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6663, i32 0, i32 4
%.tmp6665 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6664
store %m2503$.Type.type* %.tmp6665, %m2503$.Type.type** %field.6650
br label %.for.start.6646
.for.end.6646:
%.tmp6666 = load %m2503$.Type.type*, %m2503$.Type.type** %found_field.6645
%.tmp6667 = icmp eq %m2503$.Type.type* %.tmp6666, null
br i1 %.tmp6667, label %.if.true.6668, label %.if.false.6668
.if.true.6668:
%.tmp6669 = getelementptr i8*, i8** %err_msg.6481, i32 0
%.tmp6671 = getelementptr [34 x i8], [34 x i8]*@.str6670, i32 0, i32 0
%.tmp6672 = load i8*, i8** %field_name.6642
%.tmp6673 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6674 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6673, i32 0, i32 1
%.tmp6675 = load i8*, i8** %.tmp6674
%.tmp6676 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6669, i8* %.tmp6671, i8* %.tmp6672, i8* %.tmp6675)
%.tmp6677 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6678 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6679 = load i8*, i8** %err_msg.6481
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6677, %m878$.Node.type* %.tmp6678, i8* %.tmp6679)
%.tmp6680 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6680
br label %.if.end.6668
.if.false.6668:
br label %.if.end.6668
.if.end.6668:
%.tmp6681 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6682 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp6681)
%new_info.6683 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6682, %m2503$.AssignableInfo.type** %new_info.6683
%.tmp6684 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.6683
%.tmp6685 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6684, i32 0, i32 4
%.tmp6686 = load %m2503$.Type.type*, %m2503$.Type.type** %found_field.6645
store %m2503$.Type.type* %.tmp6686, %m2503$.Type.type** %.tmp6685
%.tmp6687 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6688 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.6683
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6687, %m2503$.AssignableInfo.type* %.tmp6688)
%.tmp6689 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.6683
%.tmp6690 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6689, i32 0, i32 3
%.tmp6692 = getelementptr [9 x i8], [9 x i8]*@.str6691, i32 0, i32 0
store i8* %.tmp6692, i8** %.tmp6690
%.tmp6693 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6694 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6547
%.tmp6695 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6694, i32 0, i32 4
%.tmp6696 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6695
%.tmp6697 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6693, %m2503$.Type.type* %.tmp6696)
%info_tr.6698 = alloca i8*
store i8* %.tmp6697, i8** %info_tr.6698
%.tmp6699 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6700 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6699, i32 0, i32 1
%.tmp6701 = load %m0$.File.type*, %m0$.File.type** %.tmp6700
%.tmp6703 = getelementptr [46 x i8], [46 x i8]*@.str6702, i32 0, i32 0
%.tmp6704 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.6683
%.tmp6705 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6704)
%.tmp6706 = load i8*, i8** %info_tr.6698
%.tmp6707 = load i8*, i8** %info_tr.6698
%.tmp6708 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base_var.6547
%.tmp6709 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6708)
%.tmp6710 = load i32, i32* %field_id.6643
%.tmp6711 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6701, i8* %.tmp6703, i8* %.tmp6705, i8* %.tmp6706, i8* %.tmp6707, i8* %.tmp6709, i32 %.tmp6710)
%.tmp6712 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6713 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6714 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6713, i32 0, i32 7
%.tmp6715 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6714
%.tmp6716 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6715, i32 0, i32 7
%.tmp6717 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6716
%.tmp6718 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_info.6683
%.tmp6719 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.AssignableInfo.type*) @m295$get_dotted_name.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6712, %m878$.Node.type* %.tmp6717, %m2503$.AssignableInfo.type* %.tmp6718)
ret %m2503$.AssignableInfo.type* %.tmp6719
br label %.if.end.6545
.if.false.6545:
%.tmp6720 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6721 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6720, i32 0, i32 3
%.tmp6722 = load i8*, i8** %.tmp6721
%.tmp6724 = getelementptr [9 x i8], [9 x i8]*@.str6723, i32 0, i32 0
%.tmp6725 = call i32(i8*,i8*) @strcmp(i8* %.tmp6722, i8* %.tmp6724)
%.tmp6726 = icmp eq i32 %.tmp6725, 0
br i1 %.tmp6726, label %.if.true.6727, label %.if.false.6727
.if.true.6727:
%.tmp6728 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
ret %m2503$.AssignableInfo.type* %.tmp6728
br label %.if.end.6727
.if.false.6727:
br label %.if.end.6727
.if.end.6727:
br label %.if.end.6545
.if.end.6545:
br label %.if.end.6508
.if.end.6508:
%.tmp6729 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6730 = load %m878$.Node.type*, %m878$.Node.type** %dot_name_ptr
%.tmp6732 = getelementptr [43 x i8], [43 x i8]*@.str6731, i32 0, i32 0
%.tmp6733 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6729, %m878$.Node.type* %.tmp6730, i8* %.tmp6732)
%.tmp6734 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
%.tmp6735 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6734, i32 0, i32 3
%.tmp6736 = load i8*, i8** %.tmp6735
%.tmp6737 = call i32(i8*,...) @printf(i8* %.tmp6733, i8* %.tmp6736)
%.tmp6738 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6738
}
define %m2503$.AssignableInfo.type* @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%err_msg.6739 = alloca i8*
store i8* null, i8** %err_msg.6739
%.tmp6740 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%curr_node.6741 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6740, %m878$.Node.type** %curr_node.6741
%.tmp6742 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6741
%.tmp6743 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6742, i32 0, i32 0
%.tmp6744 = load i8*, i8** %.tmp6743
%.tmp6746 = getelementptr [17 x i8], [17 x i8]*@.str6745, i32 0, i32 0
%.tmp6747 = call i32(i8*,i8*) @strcmp(i8* %.tmp6744, i8* %.tmp6746)
%.tmp6748 = icmp eq i32 %.tmp6747, 0
%.tmp6749 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6741
%.tmp6750 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6749, i32 0, i32 0
%.tmp6751 = load i8*, i8** %.tmp6750
%.tmp6753 = getelementptr [16 x i8], [16 x i8]*@.str6752, i32 0, i32 0
%.tmp6754 = call i32(i8*,i8*) @strcmp(i8* %.tmp6751, i8* %.tmp6753)
%.tmp6755 = icmp eq i32 %.tmp6754, 0
%.tmp6756 = or i1 %.tmp6748, %.tmp6755
%.tmp6757 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6741
%.tmp6758 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6757, i32 0, i32 0
%.tmp6759 = load i8*, i8** %.tmp6758
%.tmp6761 = getelementptr [11 x i8], [11 x i8]*@.str6760, i32 0, i32 0
%.tmp6762 = call i32(i8*,i8*) @strcmp(i8* %.tmp6759, i8* %.tmp6761)
%.tmp6763 = icmp eq i32 %.tmp6762, 0
%.tmp6764 = or i1 %.tmp6756, %.tmp6763
br i1 %.tmp6764, label %.if.true.6765, label %.if.false.6765
.if.true.6765:
%.tmp6766 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6767 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6768 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6767, i32 0, i32 6
%.tmp6769 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6768
%.tmp6770 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6766, %m878$.Node.type* %.tmp6769)
ret %m2503$.AssignableInfo.type* %.tmp6770
br label %.if.end.6765
.if.false.6765:
br label %.if.end.6765
.if.end.6765:
%.tmp6771 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6741
%.tmp6772 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6771, i32 0, i32 0
%.tmp6773 = load i8*, i8** %.tmp6772
%.tmp6775 = getelementptr [12 x i8], [12 x i8]*@.str6774, i32 0, i32 0
%.tmp6776 = call i32(i8*,i8*) @strcmp(i8* %.tmp6773, i8* %.tmp6775)
%.tmp6777 = icmp ne i32 %.tmp6776, 0
br i1 %.tmp6777, label %.if.true.6778, label %.if.false.6778
.if.true.6778:
%.tmp6780 = getelementptr [92 x i8], [92 x i8]*@.str6779, i32 0, i32 0
%.tmp6781 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6741
%.tmp6782 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6781, i32 0, i32 0
%.tmp6783 = load i8*, i8** %.tmp6782
%.tmp6784 = call i32(i8*,...) @printf(i8* %.tmp6780, i8* %.tmp6783)
%.tmp6785 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp6786 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6785, i32 0, i32 6
%.tmp6787 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6786
store %m878$.Node.type* %.tmp6787, %m878$.Node.type** %curr_node.6741
br label %.if.end.6778
.if.false.6778:
br label %.if.end.6778
.if.end.6778:
%.tmp6788 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6741
%.tmp6789 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6788, i32 0, i32 6
%.tmp6790 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6789
%assignable_name.6791 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6790, %m878$.Node.type** %assignable_name.6791
%.tmp6792 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6793 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6794 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6793, i32 0, i32 7
%.tmp6795 = load i8*, i8** %.tmp6794
%.tmp6796 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6791
%.tmp6797 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6796, i32 0, i32 6
%.tmp6798 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6797
%.tmp6799 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6798, i32 0, i32 1
%.tmp6800 = load i8*, i8** %.tmp6799
%.tmp6801 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.cp(%m2503$.CompilerCtx.type* %.tmp6792, i8* %.tmp6795, i8* %.tmp6800)
%scope_info.6802 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp6801, %m2503$.ScopeItem.type** %scope_info.6802
%.tmp6803 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %scope_info.6802
%.tmp6804 = icmp eq %m2503$.ScopeItem.type* %.tmp6803, null
br i1 %.tmp6804, label %.if.true.6805, label %.if.false.6805
.if.true.6805:
%.tmp6806 = getelementptr i8*, i8** %err_msg.6739, i32 0
%.tmp6808 = getelementptr [41 x i8], [41 x i8]*@.str6807, i32 0, i32 0
%.tmp6809 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6791
%.tmp6810 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6809, i32 0, i32 6
%.tmp6811 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6810
%.tmp6812 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6811, i32 0, i32 1
%.tmp6813 = load i8*, i8** %.tmp6812
%.tmp6814 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6806, i8* %.tmp6808, i8* %.tmp6813)
%.tmp6815 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6816 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6791
%.tmp6817 = load i8*, i8** %err_msg.6739
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6815, %m878$.Node.type* %.tmp6816, i8* %.tmp6817)
%.tmp6818 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6818
br label %.if.end.6805
.if.false.6805:
br label %.if.end.6805
.if.end.6805:
%.tmp6819 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %scope_info.6802
%.tmp6820 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6819, i32 0, i32 1
%.tmp6821 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp6820
%info.6822 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6821, %m2503$.AssignableInfo.type** %info.6822
%.tmp6823 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.6822
%.tmp6824 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6823, i32 0, i32 3
%.tmp6825 = load i8*, i8** %.tmp6824
%.tmp6827 = getelementptr [7 x i8], [7 x i8]*@.str6826, i32 0, i32 0
%.tmp6828 = call i32(i8*,i8*) @strcmp(i8* %.tmp6825, i8* %.tmp6827)
%.tmp6829 = icmp eq i32 %.tmp6828, 0
br i1 %.tmp6829, label %.if.true.6830, label %.if.false.6830
.if.true.6830:
%.tmp6831 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6832 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.6822
%.tmp6833 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6832)
%.tmp6834 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6791
%.tmp6835 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6834, i32 0, i32 6
%.tmp6836 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6835
%.tmp6837 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6836, i32 0, i32 7
%.tmp6838 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6837
%.tmp6839 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6838, i32 0, i32 7
%.tmp6840 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6839
%.tmp6841 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6840, i32 0, i32 1
%.tmp6842 = load i8*, i8** %.tmp6841
%.tmp6843 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.cp.cp(%m2503$.CompilerCtx.type* %.tmp6831, i8* %.tmp6833, i8* %.tmp6842)
store %m2503$.ScopeItem.type* %.tmp6843, %m2503$.ScopeItem.type** %scope_info.6802
%.tmp6844 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %scope_info.6802
%.tmp6845 = icmp eq %m2503$.ScopeItem.type* %.tmp6844, null
br i1 %.tmp6845, label %.if.true.6846, label %.if.false.6846
.if.true.6846:
%.tmp6847 = getelementptr i8*, i8** %err_msg.6739, i32 0
%.tmp6849 = getelementptr [31 x i8], [31 x i8]*@.str6848, i32 0, i32 0
%.tmp6850 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6791
%.tmp6851 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6850, i32 0, i32 6
%.tmp6852 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6851
%.tmp6853 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6852, i32 0, i32 7
%.tmp6854 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6853
%.tmp6855 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6854, i32 0, i32 7
%.tmp6856 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6855
%.tmp6857 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6856, i32 0, i32 1
%.tmp6858 = load i8*, i8** %.tmp6857
%.tmp6859 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.6822
%.tmp6860 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6859)
%.tmp6861 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6847, i8* %.tmp6849, i8* %.tmp6858, i8* %.tmp6860)
%.tmp6862 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6863 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6741
%.tmp6864 = load i8*, i8** %err_msg.6739
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6862, %m878$.Node.type* %.tmp6863, i8* %.tmp6864)
%.tmp6865 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp6865
br label %.if.end.6846
.if.false.6846:
br label %.if.end.6846
.if.end.6846:
%.tmp6866 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %scope_info.6802
%.tmp6867 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp6866, i32 0, i32 1
%.tmp6868 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp6867
store %m2503$.AssignableInfo.type* %.tmp6868, %m2503$.AssignableInfo.type** %info.6822
%.tmp6869 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6791
%.tmp6870 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6869, i32 0, i32 6
%.tmp6871 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6870
%.tmp6872 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6871, i32 0, i32 7
%.tmp6873 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6872
%.tmp6874 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6873, i32 0, i32 7
%.tmp6875 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6874
store %m878$.Node.type* %.tmp6875, %m878$.Node.type** %assignable_name.6791
br label %.if.end.6830
.if.false.6830:
%.tmp6876 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6791
%.tmp6877 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6876, i32 0, i32 6
%.tmp6878 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6877
store %m878$.Node.type* %.tmp6878, %m878$.Node.type** %assignable_name.6791
br label %.if.end.6830
.if.end.6830:
%.tmp6879 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6880 = load %m878$.Node.type*, %m878$.Node.type** %assignable_name.6791
%.tmp6881 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.6822
%.tmp6882 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,%m2503$.AssignableInfo.type*) @m295$get_dotted_name.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6879, %m878$.Node.type* %.tmp6880, %m2503$.AssignableInfo.type* %.tmp6881)
%base.6883 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6882, %m2503$.AssignableInfo.type** %base.6883
%.tmp6885 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6741
%.tmp6886 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6885, i32 0, i32 6
%.tmp6887 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6886
%.tmp6888 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6887, i32 0, i32 7
%.tmp6889 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6888
%addr.6890 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6889, %m878$.Node.type** %addr.6890
br label %.for.start.6884
.for.start.6884:
%.tmp6891 = load %m878$.Node.type*, %m878$.Node.type** %addr.6890
%.tmp6892 = icmp ne %m878$.Node.type* %.tmp6891, null
br i1 %.tmp6892, label %.for.continue.6884, label %.for.end.6884
.for.continue.6884:
%.tmp6893 = load %m878$.Node.type*, %m878$.Node.type** %addr.6890
%.tmp6894 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp6893, i32 0, i32 7
%.tmp6895 = load %m878$.Node.type*, %m878$.Node.type** %.tmp6894
%index.6896 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp6895, %m878$.Node.type** %index.6896
%.tmp6897 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6898 = load %m878$.Node.type*, %m878$.Node.type** %index.6896
%.tmp6899 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp6897, %m878$.Node.type* %.tmp6898)
%index_info.6900 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6899, %m2503$.AssignableInfo.type** %index_info.6900
%.tmp6901 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6902 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %index_info.6900
%.tmp6903 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6902, i32 0, i32 4
%.tmp6904 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6903
%.tmp6905 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6901, %m2503$.Type.type* %.tmp6904)
%index_type.6906 = alloca i8*
store i8* %.tmp6905, i8** %index_type.6906
%.tmp6907 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6883
%.tmp6908 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6907, i32 0, i32 4
%.tmp6909 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6908
%.tmp6910 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6909, i32 0, i32 1
%.tmp6911 = load i8*, i8** %.tmp6910
%.tmp6912 = icmp ne i8* %.tmp6911, null
br i1 %.tmp6912, label %.if.true.6913, label %.if.false.6913
.if.true.6913:
%.tmp6914 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6883
%.tmp6915 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6914, i32 0, i32 4
%.tmp6916 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6915
%.tmp6917 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6916, i32 0, i32 1
%.tmp6918 = load i8*, i8** %.tmp6917
%.tmp6920 = getelementptr [6 x i8], [6 x i8]*@.str6919, i32 0, i32 0
%.tmp6921 = call i32(i8*,i8*) @strcmp(i8* %.tmp6918, i8* %.tmp6920)
%.tmp6922 = icmp eq i32 %.tmp6921, 0
br i1 %.tmp6922, label %.if.true.6923, label %.if.false.6923
.if.true.6923:
%.tmp6924 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6741
%.tmp6925 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp6924)
%new_base.6926 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6925, %m2503$.AssignableInfo.type** %new_base.6926
%.tmp6927 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6928 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6926
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6927, %m2503$.AssignableInfo.type* %.tmp6928)
%.tmp6929 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6930 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6929, i32 0, i32 1
%.tmp6931 = load %m0$.File.type*, %m0$.File.type** %.tmp6930
%.tmp6933 = getelementptr [45 x i8], [45 x i8]*@.str6932, i32 0, i32 0
%.tmp6934 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6926
%.tmp6935 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6934)
%.tmp6936 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6937 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6883
%.tmp6938 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6937, i32 0, i32 4
%.tmp6939 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6938
%.tmp6940 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6936, %m2503$.Type.type* %.tmp6939)
%.tmp6941 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6942 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6883
%.tmp6943 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6942, i32 0, i32 4
%.tmp6944 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6943
%.tmp6945 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6941, %m2503$.Type.type* %.tmp6944)
%.tmp6946 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6883
%.tmp6947 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6946)
%.tmp6948 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6931, i8* %.tmp6933, i8* %.tmp6935, i8* %.tmp6940, i8* %.tmp6945, i8* %.tmp6947)
%.tmp6949 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6926
%.tmp6950 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6949, i32 0, i32 4
%.tmp6951 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6883
%.tmp6952 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6951, i32 0, i32 4
%.tmp6953 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6952
%.tmp6954 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6953, i32 0, i32 3
%.tmp6955 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6954
%.tmp6956 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp6955)
store %m2503$.Type.type* %.tmp6956, %m2503$.Type.type** %.tmp6950
%.tmp6957 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6926
%.tmp6958 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6957, i32 0, i32 4
%.tmp6959 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6958
%.tmp6960 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6959, i32 0, i32 4
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp6960
%.tmp6961 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6926
store %m2503$.AssignableInfo.type* %.tmp6961, %m2503$.AssignableInfo.type** %base.6883
br label %.if.end.6923
.if.false.6923:
br label %.if.end.6923
.if.end.6923:
br label %.if.end.6913
.if.false.6913:
br label %.if.end.6913
.if.end.6913:
%.tmp6962 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6963 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6883
%.tmp6964 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6963, i32 0, i32 4
%.tmp6965 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6964
%.tmp6966 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp6962, %m2503$.Type.type* %.tmp6965)
%base_type.6967 = alloca i8*
store i8* %.tmp6966, i8** %base_type.6967
%.tmp6968 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6969 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp6968)
%tmp_id.6970 = alloca i32
store i32 %.tmp6969, i32* %tmp_id.6970
%.tmp6971 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6972 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp6971, i32 0, i32 1
%.tmp6973 = load %m0$.File.type*, %m0$.File.type** %.tmp6972
%.tmp6975 = getelementptr [28 x i8], [28 x i8]*@.str6974, i32 0, i32 0
%.tmp6976 = load i32, i32* %tmp_id.6970
%.tmp6977 = load i8*, i8** %base_type.6967
%.tmp6978 = load i8*, i8** %base_type.6967
%.tmp6979 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6883
%.tmp6980 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp6979)
%.tmp6981 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6973, i8* %.tmp6975, i32 %.tmp6976, i8* %.tmp6977, i8* %.tmp6978, i8* %.tmp6980)
%.tmp6982 = load %m878$.Node.type*, %m878$.Node.type** %curr_node.6741
%.tmp6983 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp6982)
%new_base.6984 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp6983, %m2503$.AssignableInfo.type** %new_base.6984
%.tmp6985 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp6986 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6984
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp6985, %m2503$.AssignableInfo.type* %.tmp6986)
%.tmp6987 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6883
%.tmp6988 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp6987, i32 0, i32 4
%.tmp6989 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6988
%.tmp6990 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp6989, i32 0, i32 3
%.tmp6991 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp6990
%.tmp6992 = icmp eq %m2503$.Type.type* %.tmp6991, null
br i1 %.tmp6992, label %.if.true.6993, label %.if.false.6993
.if.true.6993:
%.tmp6994 = getelementptr i8*, i8** %err_msg.6739, i32 0
%.tmp6996 = getelementptr [35 x i8], [35 x i8]*@.str6995, i32 0, i32 0
%.tmp6997 = load i8*, i8** %base_type.6967
%.tmp6998 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6994, i8* %.tmp6996, i8* %.tmp6997)
%.tmp6999 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7000 = load %m878$.Node.type*, %m878$.Node.type** %addr.6890
%.tmp7001 = load i8*, i8** %err_msg.6739
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp6999, %m878$.Node.type* %.tmp7000, i8* %.tmp7001)
%.tmp7002 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6883
ret %m2503$.AssignableInfo.type* %.tmp7002
br label %.if.end.6993
.if.false.6993:
br label %.if.end.6993
.if.end.6993:
%.tmp7003 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6984
%.tmp7004 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7003, i32 0, i32 4
%.tmp7005 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6883
%.tmp7006 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7005, i32 0, i32 4
%.tmp7007 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7006
%.tmp7008 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7007, i32 0, i32 3
%.tmp7009 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7008
store %m2503$.Type.type* %.tmp7009, %m2503$.Type.type** %.tmp7004
%.tmp7010 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7011 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6984
%.tmp7012 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7011, i32 0, i32 4
%.tmp7013 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7012
%.tmp7014 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp7010, %m2503$.Type.type* %.tmp7013)
%base_type_2.7015 = alloca i8*
store i8* %.tmp7014, i8** %base_type_2.7015
%.tmp7016 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7017 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp7016, i32 0, i32 1
%.tmp7018 = load %m0$.File.type*, %m0$.File.type** %.tmp7017
%.tmp7020 = getelementptr [44 x i8], [44 x i8]*@.str7019, i32 0, i32 0
%.tmp7021 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6984
%.tmp7022 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7021)
%.tmp7023 = load i8*, i8** %base_type_2.7015
%.tmp7024 = load i8*, i8** %base_type_2.7015
%.tmp7025 = load i32, i32* %tmp_id.6970
%.tmp7026 = load i8*, i8** %index_type.6906
%.tmp7027 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %index_info.6900
%.tmp7028 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7027)
%.tmp7029 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7018, i8* %.tmp7020, i8* %.tmp7022, i8* %.tmp7023, i8* %.tmp7024, i32 %.tmp7025, i8* %.tmp7026, i8* %.tmp7028)
%.tmp7030 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %new_base.6984
store %m2503$.AssignableInfo.type* %.tmp7030, %m2503$.AssignableInfo.type** %base.6883
%.tmp7031 = load %m878$.Node.type*, %m878$.Node.type** %addr.6890
%.tmp7032 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7031, i32 0, i32 7
%.tmp7033 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7032
%.tmp7034 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7033, i32 0, i32 7
%.tmp7035 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7034
%.tmp7036 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7035, i32 0, i32 7
%.tmp7037 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7036
store %m878$.Node.type* %.tmp7037, %m878$.Node.type** %addr.6890
br label %.for.start.6884
.for.end.6884:
%.tmp7038 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %base.6883
ret %m2503$.AssignableInfo.type* %.tmp7038
}
%m295$.StackHead.type = type {%m2258$.SYStack.type*}
define %m2503$.AssignableInfo.type* @m295$compile_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%curr_node = alloca %m878$.Node.type*
store %m878$.Node.type* %.curr_node.arg, %m878$.Node.type** %curr_node
%.tmp7039 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7040 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7039, i32 0, i32 6
%.tmp7041 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7040
%.tmp7043 = getelementptr [16 x i8], [16 x i8]*@.str7042, i32 0, i32 0
%.tmp7044 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp7041, i8* %.tmp7043)
%assignable_start.7045 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7044, %m878$.Node.type** %assignable_start.7045
%.tmp7046 = load %m878$.Node.type*, %m878$.Node.type** %assignable_start.7045
%.tmp7047 = call %m2258$.SYStack.type*(%m878$.Node.type*) @m2258$sy_algorithm.m2258$.SYStack.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7046)
%operator_stack.7048 = alloca %m2258$.SYStack.type*
store %m2258$.SYStack.type* %.tmp7047, %m2258$.SYStack.type** %operator_stack.7048
%.tmp7049 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* null, i32 1
%.tmp7050 = ptrtoint %m295$.StackHead.type* %.tmp7049 to i32
%.tmp7051 = call i8*(i32) @malloc(i32 %.tmp7050)
%.tmp7052 = bitcast i8* %.tmp7051 to %m295$.StackHead.type*
%stack.7053 = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.tmp7052, %m295$.StackHead.type** %stack.7053
%.tmp7054 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7053
%.tmp7055 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7054, i32 0, i32 0
%.tmp7056 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %operator_stack.7048
store %m2258$.SYStack.type* %.tmp7056, %m2258$.SYStack.type** %.tmp7055
%.tmp7057 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7058 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7053
%.tmp7059 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m295$.StackHead.typep(%m2503$.CompilerCtx.type* %.tmp7057, %m295$.StackHead.type* %.tmp7058)
%info.7060 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7059, %m2503$.AssignableInfo.type** %info.7060
%.tmp7061 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7060
%.tmp7062 = icmp eq %m2503$.AssignableInfo.type* %.tmp7061, null
br i1 %.tmp7062, label %.if.true.7063, label %.if.false.7063
.if.true.7063:
%.tmp7064 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7060
ret %m2503$.AssignableInfo.type* %.tmp7064
br label %.if.end.7063
.if.false.7063:
br label %.if.end.7063
.if.end.7063:
%.tmp7065 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7066 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7065, i32 0, i32 6
%.tmp7067 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7066
%.tmp7069 = getelementptr [5 x i8], [5 x i8]*@.str7068, i32 0, i32 0
%.tmp7070 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp7067, i8* %.tmp7069)
%cast.7071 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7070, %m878$.Node.type** %cast.7071
%.tmp7072 = load %m878$.Node.type*, %m878$.Node.type** %cast.7071
%.tmp7073 = icmp ne %m878$.Node.type* %.tmp7072, null
br i1 %.tmp7073, label %.if.true.7074, label %.if.false.7074
.if.true.7074:
%.tmp7075 = load %m878$.Node.type*, %m878$.Node.type** %cast.7071
%.tmp7076 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7075, i32 0, i32 6
%.tmp7077 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7076
%.tmp7079 = getelementptr [5 x i8], [5 x i8]*@.str7078, i32 0, i32 0
%.tmp7080 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp7077, i8* %.tmp7079)
%cast_type.7081 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7080, %m878$.Node.type** %cast_type.7081
%.tmp7082 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7083 = load %m878$.Node.type*, %m878$.Node.type** %cast_type.7081
%.tmp7084 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7083, i32 0, i32 6
%.tmp7085 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7084
%.tmp7086 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp7082, %m878$.Node.type* %.tmp7085)
%type.7087 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp7086, %m2503$.Type.type** %type.7087
%.tmp7088 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7060
%.tmp7089 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7088)
%prev_id.7090 = alloca i8*
store i8* %.tmp7089, i8** %prev_id.7090
%.tmp7091 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7092 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7060
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp7091, %m2503$.AssignableInfo.type* %.tmp7092)
%.tmp7093 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7094 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7060
%.tmp7095 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7094, i32 0, i32 4
%.tmp7096 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7095
%.tmp7097 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp7093, %m2503$.Type.type* %.tmp7096)
%from_type.7098 = alloca i8*
store i8* %.tmp7097, i8** %from_type.7098
%.tmp7099 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7100 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7087
%.tmp7101 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp7099, %m2503$.Type.type* %.tmp7100)
%to_type.7102 = alloca i8*
store i8* %.tmp7101, i8** %to_type.7102
%.tmp7104 = getelementptr [8 x i8], [8 x i8]*@.str7103, i32 0, i32 0
%cast_fn.7105 = alloca i8*
store i8* %.tmp7104, i8** %cast_fn.7105
%.tmp7106 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7060
%.tmp7107 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7106, i32 0, i32 4
%.tmp7108 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7107
%.tmp7109 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7108, i32 0, i32 1
%.tmp7110 = load i8*, i8** %.tmp7109
%.tmp7111 = icmp ne i8* %.tmp7110, null
br i1 %.tmp7111, label %.if.true.7112, label %.if.false.7112
.if.true.7112:
%.tmp7113 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7060
%.tmp7114 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7113, i32 0, i32 4
%.tmp7115 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7114
%.tmp7116 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7115, i32 0, i32 1
%.tmp7117 = load i8*, i8** %.tmp7116
%.tmp7119 = getelementptr [6 x i8], [6 x i8]*@.str7118, i32 0, i32 0
%.tmp7120 = call i32(i8*,i8*) @strcmp(i8* %.tmp7117, i8* %.tmp7119)
%.tmp7121 = icmp eq i32 %.tmp7120, 0
br i1 %.tmp7121, label %.if.true.7122, label %.if.false.7122
.if.true.7122:
%.tmp7124 = getelementptr [48 x i8], [48 x i8]*@.str7123, i32 0, i32 0
%.tmp7125 = call i32(i8*,...) @printf(i8* %.tmp7124)
br label %.if.end.7122
.if.false.7122:
br label %.if.end.7122
.if.end.7122:
br label %.if.end.7112
.if.false.7112:
br label %.if.end.7112
.if.end.7112:
%.tmp7126 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7060
%.tmp7127 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7126, i32 0, i32 4
%.tmp7128 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7127
%.tmp7129 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7128, i32 0, i32 0
%.tmp7130 = load i8*, i8** %.tmp7129
%.tmp7132 = getelementptr [4 x i8], [4 x i8]*@.str7131, i32 0, i32 0
%.tmp7133 = call i32(i8*,i8*) @strcmp(i8* %.tmp7130, i8* %.tmp7132)
%.tmp7134 = icmp ne i32 %.tmp7133, 0
%.tmp7135 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7087
%.tmp7136 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7135, i32 0, i32 0
%.tmp7137 = load i8*, i8** %.tmp7136
%.tmp7139 = getelementptr [4 x i8], [4 x i8]*@.str7138, i32 0, i32 0
%.tmp7140 = call i32(i8*,i8*) @strcmp(i8* %.tmp7137, i8* %.tmp7139)
%.tmp7141 = icmp ne i32 %.tmp7140, 0
%.tmp7142 = and i1 %.tmp7134, %.tmp7141
br i1 %.tmp7142, label %.if.true.7143, label %.if.false.7143
.if.true.7143:
%.tmp7144 = load i8*, i8** %from_type.7098
%.tmp7145 = getelementptr i8, i8* %.tmp7144, i32 0
%.tmp7146 = load i8, i8* %.tmp7145
%.tmp7147 = icmp eq i8 %.tmp7146, 105
%.tmp7148 = load i8*, i8** %to_type.7102
%.tmp7149 = getelementptr i8, i8* %.tmp7148, i32 0
%.tmp7150 = load i8, i8* %.tmp7149
%.tmp7151 = icmp eq i8 %.tmp7150, 105
%.tmp7152 = and i1 %.tmp7147, %.tmp7151
br i1 %.tmp7152, label %.if.true.7153, label %.if.false.7153
.if.true.7153:
%from_size.7154 = alloca i32
store i32 0, i32* %from_size.7154
%to_size.7155 = alloca i32
store i32 0, i32* %to_size.7155
%.tmp7156 = load i8*, i8** %from_type.7098
%.tmp7158 = getelementptr [4 x i8], [4 x i8]*@.str7157, i32 0, i32 0
%.tmp7159 = getelementptr i32, i32* %from_size.7154, i32 0
%.tmp7160 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7156, i8* %.tmp7158, i32* %.tmp7159)
%.tmp7161 = load i8*, i8** %to_type.7102
%.tmp7163 = getelementptr [4 x i8], [4 x i8]*@.str7162, i32 0, i32 0
%.tmp7164 = getelementptr i32, i32* %to_size.7155, i32 0
%.tmp7165 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7161, i8* %.tmp7163, i32* %.tmp7164)
%.tmp7166 = load i32, i32* %from_size.7154
%.tmp7167 = load i32, i32* %to_size.7155
%.tmp7168 = icmp slt i32 %.tmp7166, %.tmp7167
br i1 %.tmp7168, label %.if.true.7169, label %.if.false.7169
.if.true.7169:
%.tmp7171 = getelementptr [5 x i8], [5 x i8]*@.str7170, i32 0, i32 0
store i8* %.tmp7171, i8** %cast_fn.7105
br label %.if.end.7169
.if.false.7169:
%.tmp7173 = getelementptr [6 x i8], [6 x i8]*@.str7172, i32 0, i32 0
store i8* %.tmp7173, i8** %cast_fn.7105
br label %.if.end.7169
.if.end.7169:
br label %.if.end.7153
.if.false.7153:
br label %.if.end.7153
.if.end.7153:
br label %.if.end.7143
.if.false.7143:
br label %.if.end.7143
.if.end.7143:
%.tmp7174 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7175 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp7174, i32 0, i32 1
%.tmp7176 = load %m0$.File.type*, %m0$.File.type** %.tmp7175
%.tmp7178 = getelementptr [21 x i8], [21 x i8]*@.str7177, i32 0, i32 0
%.tmp7179 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7060
%.tmp7180 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7179)
%.tmp7181 = load i8*, i8** %cast_fn.7105
%.tmp7182 = load i8*, i8** %from_type.7098
%.tmp7183 = load i8*, i8** %prev_id.7090
%.tmp7184 = load i8*, i8** %to_type.7102
%.tmp7185 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7176, i8* %.tmp7178, i8* %.tmp7180, i8* %.tmp7181, i8* %.tmp7182, i8* %.tmp7183, i8* %.tmp7184)
%.tmp7186 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7060
%.tmp7187 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7186, i32 0, i32 4
%.tmp7188 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7087
store %m2503$.Type.type* %.tmp7188, %m2503$.Type.type** %.tmp7187
br label %.if.end.7074
.if.false.7074:
br label %.if.end.7074
.if.end.7074:
%.tmp7189 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.7060
ret %m2503$.AssignableInfo.type* %.tmp7189
}
define %m2503$.AssignableInfo.type* @m295$compile_assignable_stack.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m295$.StackHead.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m295$.StackHead.type* %.stack.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stack = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.stack.arg, %m295$.StackHead.type** %stack
%.tmp7190 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7191 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7190, i32 0, i32 0
%.tmp7192 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7191
%.tmp7193 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp7192, i32 0, i32 0
%.tmp7194 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7193
%.tmp7195 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7194, i32 0, i32 0
%.tmp7196 = load i8*, i8** %.tmp7195
%.tmp7198 = getelementptr [16 x i8], [16 x i8]*@.str7197, i32 0, i32 0
%.tmp7199 = call i32(i8*,i8*) @strcmp(i8* %.tmp7196, i8* %.tmp7198)
%.tmp7200 = icmp eq i32 %.tmp7199, 0
br i1 %.tmp7200, label %.if.true.7201, label %.if.false.7201
.if.true.7201:
%.tmp7202 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7203 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7204 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7203, i32 0, i32 0
%.tmp7205 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7204
%.tmp7206 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp7205, i32 0, i32 0
%.tmp7207 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7206
%.tmp7208 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_mono_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp7202, %m878$.Node.type* %.tmp7207)
ret %m2503$.AssignableInfo.type* %.tmp7208
br label %.if.end.7201
.if.false.7201:
br label %.if.end.7201
.if.end.7201:
%.tmp7209 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7210 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7209, i32 0, i32 0
%.tmp7211 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7210
%.tmp7212 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp7211, i32 0, i32 0
%.tmp7213 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7212
%.tmp7214 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7213, i32 0, i32 6
%.tmp7215 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7214
%operator.7216 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7215, %m878$.Node.type** %operator.7216
%.tmp7217 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7218 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7217, i32 0, i32 0
%.tmp7219 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7220 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7219, i32 0, i32 0
%.tmp7221 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7220
%.tmp7222 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp7221, i32 0, i32 1
%.tmp7223 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7222
store %m2258$.SYStack.type* %.tmp7223, %m2258$.SYStack.type** %.tmp7218
%.tmp7224 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7225 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7226 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m295$.StackHead.typep(%m2503$.CompilerCtx.type* %.tmp7224, %m295$.StackHead.type* %.tmp7225)
%A.7227 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7226, %m2503$.AssignableInfo.type** %A.7227
%.tmp7228 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %A.7227
%.tmp7229 = icmp eq %m2503$.AssignableInfo.type* %.tmp7228, null
br i1 %.tmp7229, label %.if.true.7230, label %.if.false.7230
.if.true.7230:
%.tmp7231 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %A.7227
ret %m2503$.AssignableInfo.type* %.tmp7231
br label %.if.end.7230
.if.false.7230:
br label %.if.end.7230
.if.end.7230:
%.tmp7232 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7233 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7232, i32 0, i32 0
%.tmp7234 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7235 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7234, i32 0, i32 0
%.tmp7236 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7235
%.tmp7237 = getelementptr %m2258$.SYStack.type, %m2258$.SYStack.type* %.tmp7236, i32 0, i32 1
%.tmp7238 = load %m2258$.SYStack.type*, %m2258$.SYStack.type** %.tmp7237
store %m2258$.SYStack.type* %.tmp7238, %m2258$.SYStack.type** %.tmp7233
%.tmp7239 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7240 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7241 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m295$.StackHead.typep(%m2503$.CompilerCtx.type* %.tmp7239, %m295$.StackHead.type* %.tmp7240)
%B.7242 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7241, %m2503$.AssignableInfo.type** %B.7242
%.tmp7243 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %B.7242
%.tmp7244 = icmp eq %m2503$.AssignableInfo.type* %.tmp7243, null
br i1 %.tmp7244, label %.if.true.7245, label %.if.false.7245
.if.true.7245:
%.tmp7246 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %B.7242
ret %m2503$.AssignableInfo.type* %.tmp7246
br label %.if.end.7245
.if.false.7245:
br label %.if.end.7245
.if.end.7245:
%.tmp7247 = bitcast ptr null to %m878$.Node.type*
%.tmp7248 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7247)
%op_info.7249 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7248, %m2503$.AssignableInfo.type** %op_info.7249
%.tmp7250 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %op_info.7249
%.tmp7251 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7250, i32 0, i32 4
%.tmp7252 = load %m878$.Node.type*, %m878$.Node.type** %operator.7216
%.tmp7253 = call %m2503$.Type.type*(%m878$.Node.type*) @m295$operator_type.m2503$.Type.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7252)
store %m2503$.Type.type* %.tmp7253, %m2503$.Type.type** %.tmp7251
%.tmp7254 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7255 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %op_info.7249
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp7254, %m2503$.AssignableInfo.type* %.tmp7255)
%.tmp7256 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7257 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp7256, i32 0, i32 1
%.tmp7258 = load %m0$.File.type*, %m0$.File.type** %.tmp7257
%.tmp7260 = getelementptr [19 x i8], [19 x i8]*@.str7259, i32 0, i32 0
%.tmp7261 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %op_info.7249
%.tmp7262 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7261)
%.tmp7263 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7264 = load %m878$.Node.type*, %m878$.Node.type** %operator.7216
%.tmp7265 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$operator_op.cp.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp7263, %m878$.Node.type* %.tmp7264)
%.tmp7266 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7267 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %A.7227
%.tmp7268 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7267, i32 0, i32 4
%.tmp7269 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7268
%.tmp7270 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp7266, %m2503$.Type.type* %.tmp7269)
%.tmp7271 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %A.7227
%.tmp7272 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7271)
%.tmp7273 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %B.7242
%.tmp7274 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7273)
%.tmp7275 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7258, i8* %.tmp7260, i8* %.tmp7262, i8* %.tmp7265, i8* %.tmp7270, i8* %.tmp7272, i8* %.tmp7274)
%.tmp7276 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %op_info.7249
ret %m2503$.AssignableInfo.type* %.tmp7276
}
define i8* @m295$operator_op.cp.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.op.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%op = alloca %m878$.Node.type*
store %m878$.Node.type* %.op.arg, %m878$.Node.type** %op
%.tmp7277 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7278 = icmp eq %m878$.Node.type* %.tmp7277, null
br i1 %.tmp7278, label %.if.true.7279, label %.if.false.7279
.if.true.7279:
%.tmp7280 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7281 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7283 = getelementptr [31 x i8], [31 x i8]*@.str7282, i32 0, i32 0
%.tmp7284 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp7280, %m878$.Node.type* %.tmp7281, i8* %.tmp7283)
%.tmp7285 = call i32(i8*,...) @printf(i8* %.tmp7284)
br label %.if.end.7279
.if.false.7279:
br label %.if.end.7279
.if.end.7279:
%.tmp7286 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7287 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7286, i32 0, i32 1
%.tmp7288 = load i8*, i8** %.tmp7287
%.tmp7290 = getelementptr [2 x i8], [2 x i8]*@.str7289, i32 0, i32 0
%.tmp7291 = call i32(i8*,i8*) @strcmp(i8* %.tmp7288, i8* %.tmp7290)
%.tmp7292 = icmp eq i32 %.tmp7291, 0
br i1 %.tmp7292, label %.if.true.7293, label %.if.false.7293
.if.true.7293:
%.tmp7295 = getelementptr [4 x i8], [4 x i8]*@.str7294, i32 0, i32 0
ret i8* %.tmp7295
br label %.if.end.7293
.if.false.7293:
%.tmp7296 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7297 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7296, i32 0, i32 1
%.tmp7298 = load i8*, i8** %.tmp7297
%.tmp7300 = getelementptr [2 x i8], [2 x i8]*@.str7299, i32 0, i32 0
%.tmp7301 = call i32(i8*,i8*) @strcmp(i8* %.tmp7298, i8* %.tmp7300)
%.tmp7302 = icmp eq i32 %.tmp7301, 0
br i1 %.tmp7302, label %.if.true.7303, label %.if.false.7303
.if.true.7303:
%.tmp7305 = getelementptr [4 x i8], [4 x i8]*@.str7304, i32 0, i32 0
ret i8* %.tmp7305
br label %.if.end.7303
.if.false.7303:
%.tmp7306 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7307 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7306, i32 0, i32 1
%.tmp7308 = load i8*, i8** %.tmp7307
%.tmp7310 = getelementptr [2 x i8], [2 x i8]*@.str7309, i32 0, i32 0
%.tmp7311 = call i32(i8*,i8*) @strcmp(i8* %.tmp7308, i8* %.tmp7310)
%.tmp7312 = icmp eq i32 %.tmp7311, 0
br i1 %.tmp7312, label %.if.true.7313, label %.if.false.7313
.if.true.7313:
%.tmp7315 = getelementptr [4 x i8], [4 x i8]*@.str7314, i32 0, i32 0
ret i8* %.tmp7315
br label %.if.end.7313
.if.false.7313:
%.tmp7316 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7317 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7316, i32 0, i32 1
%.tmp7318 = load i8*, i8** %.tmp7317
%.tmp7320 = getelementptr [2 x i8], [2 x i8]*@.str7319, i32 0, i32 0
%.tmp7321 = call i32(i8*,i8*) @strcmp(i8* %.tmp7318, i8* %.tmp7320)
%.tmp7322 = icmp eq i32 %.tmp7321, 0
br i1 %.tmp7322, label %.if.true.7323, label %.if.false.7323
.if.true.7323:
%.tmp7325 = getelementptr [5 x i8], [5 x i8]*@.str7324, i32 0, i32 0
ret i8* %.tmp7325
br label %.if.end.7323
.if.false.7323:
%.tmp7326 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7327 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7326, i32 0, i32 1
%.tmp7328 = load i8*, i8** %.tmp7327
%.tmp7330 = getelementptr [3 x i8], [3 x i8]*@.str7329, i32 0, i32 0
%.tmp7331 = call i32(i8*,i8*) @strcmp(i8* %.tmp7328, i8* %.tmp7330)
%.tmp7332 = icmp eq i32 %.tmp7331, 0
br i1 %.tmp7332, label %.if.true.7333, label %.if.false.7333
.if.true.7333:
%.tmp7335 = getelementptr [8 x i8], [8 x i8]*@.str7334, i32 0, i32 0
ret i8* %.tmp7335
br label %.if.end.7333
.if.false.7333:
%.tmp7336 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7337 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7336, i32 0, i32 1
%.tmp7338 = load i8*, i8** %.tmp7337
%.tmp7340 = getelementptr [3 x i8], [3 x i8]*@.str7339, i32 0, i32 0
%.tmp7341 = call i32(i8*,i8*) @strcmp(i8* %.tmp7338, i8* %.tmp7340)
%.tmp7342 = icmp eq i32 %.tmp7341, 0
br i1 %.tmp7342, label %.if.true.7343, label %.if.false.7343
.if.true.7343:
%.tmp7345 = getelementptr [8 x i8], [8 x i8]*@.str7344, i32 0, i32 0
ret i8* %.tmp7345
br label %.if.end.7343
.if.false.7343:
%.tmp7346 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7347 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7346, i32 0, i32 1
%.tmp7348 = load i8*, i8** %.tmp7347
%.tmp7350 = getelementptr [2 x i8], [2 x i8]*@.str7349, i32 0, i32 0
%.tmp7351 = call i32(i8*,i8*) @strcmp(i8* %.tmp7348, i8* %.tmp7350)
%.tmp7352 = icmp eq i32 %.tmp7351, 0
br i1 %.tmp7352, label %.if.true.7353, label %.if.false.7353
.if.true.7353:
%.tmp7355 = getelementptr [9 x i8], [9 x i8]*@.str7354, i32 0, i32 0
ret i8* %.tmp7355
br label %.if.end.7353
.if.false.7353:
%.tmp7356 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7357 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7356, i32 0, i32 1
%.tmp7358 = load i8*, i8** %.tmp7357
%.tmp7360 = getelementptr [2 x i8], [2 x i8]*@.str7359, i32 0, i32 0
%.tmp7361 = call i32(i8*,i8*) @strcmp(i8* %.tmp7358, i8* %.tmp7360)
%.tmp7362 = icmp eq i32 %.tmp7361, 0
br i1 %.tmp7362, label %.if.true.7363, label %.if.false.7363
.if.true.7363:
%.tmp7365 = getelementptr [9 x i8], [9 x i8]*@.str7364, i32 0, i32 0
ret i8* %.tmp7365
br label %.if.end.7363
.if.false.7363:
%.tmp7366 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7367 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7366, i32 0, i32 1
%.tmp7368 = load i8*, i8** %.tmp7367
%.tmp7370 = getelementptr [2 x i8], [2 x i8]*@.str7369, i32 0, i32 0
%.tmp7371 = call i32(i8*,i8*) @strcmp(i8* %.tmp7368, i8* %.tmp7370)
%.tmp7372 = icmp eq i32 %.tmp7371, 0
br i1 %.tmp7372, label %.if.true.7373, label %.if.false.7373
.if.true.7373:
%.tmp7375 = getelementptr [4 x i8], [4 x i8]*@.str7374, i32 0, i32 0
ret i8* %.tmp7375
br label %.if.end.7373
.if.false.7373:
%.tmp7376 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7377 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7376, i32 0, i32 1
%.tmp7378 = load i8*, i8** %.tmp7377
%.tmp7380 = getelementptr [2 x i8], [2 x i8]*@.str7379, i32 0, i32 0
%.tmp7381 = call i32(i8*,i8*) @strcmp(i8* %.tmp7378, i8* %.tmp7380)
%.tmp7382 = icmp eq i32 %.tmp7381, 0
br i1 %.tmp7382, label %.if.true.7383, label %.if.false.7383
.if.true.7383:
%.tmp7385 = getelementptr [3 x i8], [3 x i8]*@.str7384, i32 0, i32 0
ret i8* %.tmp7385
br label %.if.end.7383
.if.false.7383:
%.tmp7386 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7387 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7386, i32 0, i32 1
%.tmp7388 = load i8*, i8** %.tmp7387
%.tmp7390 = getelementptr [3 x i8], [3 x i8]*@.str7389, i32 0, i32 0
%.tmp7391 = call i32(i8*,i8*) @strcmp(i8* %.tmp7388, i8* %.tmp7390)
%.tmp7392 = icmp eq i32 %.tmp7391, 0
br i1 %.tmp7392, label %.if.true.7393, label %.if.false.7393
.if.true.7393:
%.tmp7395 = getelementptr [9 x i8], [9 x i8]*@.str7394, i32 0, i32 0
ret i8* %.tmp7395
br label %.if.end.7393
.if.false.7393:
%.tmp7396 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7397 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7396, i32 0, i32 1
%.tmp7398 = load i8*, i8** %.tmp7397
%.tmp7400 = getelementptr [3 x i8], [3 x i8]*@.str7399, i32 0, i32 0
%.tmp7401 = call i32(i8*,i8*) @strcmp(i8* %.tmp7398, i8* %.tmp7400)
%.tmp7402 = icmp eq i32 %.tmp7401, 0
br i1 %.tmp7402, label %.if.true.7403, label %.if.false.7403
.if.true.7403:
%.tmp7405 = getelementptr [9 x i8], [9 x i8]*@.str7404, i32 0, i32 0
ret i8* %.tmp7405
br label %.if.end.7403
.if.false.7403:
%.tmp7406 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7407 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7406, i32 0, i32 1
%.tmp7408 = load i8*, i8** %.tmp7407
%.tmp7410 = getelementptr [2 x i8], [2 x i8]*@.str7409, i32 0, i32 0
%.tmp7411 = call i32(i8*,i8*) @strcmp(i8* %.tmp7408, i8* %.tmp7410)
%.tmp7412 = icmp eq i32 %.tmp7411, 0
br i1 %.tmp7412, label %.if.true.7413, label %.if.false.7413
.if.true.7413:
%.tmp7415 = getelementptr [5 x i8], [5 x i8]*@.str7414, i32 0, i32 0
ret i8* %.tmp7415
br label %.if.end.7413
.if.false.7413:
%.tmp7416 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7417 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7419 = getelementptr [30 x i8], [30 x i8]*@.str7418, i32 0, i32 0
%.tmp7420 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp7416, %m878$.Node.type* %.tmp7417, i8* %.tmp7419)
%.tmp7421 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7422 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7421, i32 0, i32 1
%.tmp7423 = load i8*, i8** %.tmp7422
%.tmp7424 = call i32(i8*,...) @printf(i8* %.tmp7420, i8* %.tmp7423)
br label %.if.end.7413
.if.end.7413:
br label %.if.end.7403
.if.end.7403:
br label %.if.end.7393
.if.end.7393:
br label %.if.end.7383
.if.end.7383:
br label %.if.end.7373
.if.end.7373:
br label %.if.end.7363
.if.end.7363:
br label %.if.end.7353
.if.end.7353:
br label %.if.end.7343
.if.end.7343:
br label %.if.end.7333
.if.end.7333:
br label %.if.end.7323
.if.end.7323:
br label %.if.end.7313
.if.end.7313:
br label %.if.end.7303
.if.end.7303:
br label %.if.end.7293
.if.end.7293:
%.tmp7426 = getelementptr [4 x i8], [4 x i8]*@.str7425, i32 0, i32 0
ret i8* %.tmp7426
}
define %m2503$.Type.type* @m295$operator_type.m2503$.Type.typep.m878$.Node.typep(%m878$.Node.type* %.op.arg) {
%op = alloca %m878$.Node.type*
store %m878$.Node.type* %.op.arg, %m878$.Node.type** %op
%.tmp7427 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%type.7428 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp7427, %m2503$.Type.type** %type.7428
%.tmp7429 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7430 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7429, i32 0, i32 1
%.tmp7431 = load i8*, i8** %.tmp7430
%.tmp7433 = getelementptr [3 x i8], [3 x i8]*@.str7432, i32 0, i32 0
%.tmp7434 = call i32(i8*,i8*) @strcmp(i8* %.tmp7431, i8* %.tmp7433)
%.tmp7435 = icmp eq i32 %.tmp7434, 0
%.tmp7436 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7437 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7436, i32 0, i32 1
%.tmp7438 = load i8*, i8** %.tmp7437
%.tmp7440 = getelementptr [3 x i8], [3 x i8]*@.str7439, i32 0, i32 0
%.tmp7441 = call i32(i8*,i8*) @strcmp(i8* %.tmp7438, i8* %.tmp7440)
%.tmp7442 = icmp eq i32 %.tmp7441, 0
%.tmp7443 = or i1 %.tmp7435, %.tmp7442
%.tmp7444 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7445 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7444, i32 0, i32 1
%.tmp7446 = load i8*, i8** %.tmp7445
%.tmp7448 = getelementptr [2 x i8], [2 x i8]*@.str7447, i32 0, i32 0
%.tmp7449 = call i32(i8*,i8*) @strcmp(i8* %.tmp7446, i8* %.tmp7448)
%.tmp7450 = icmp eq i32 %.tmp7449, 0
%.tmp7451 = or i1 %.tmp7443, %.tmp7450
%.tmp7452 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7453 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7452, i32 0, i32 1
%.tmp7454 = load i8*, i8** %.tmp7453
%.tmp7456 = getelementptr [2 x i8], [2 x i8]*@.str7455, i32 0, i32 0
%.tmp7457 = call i32(i8*,i8*) @strcmp(i8* %.tmp7454, i8* %.tmp7456)
%.tmp7458 = icmp eq i32 %.tmp7457, 0
%.tmp7459 = or i1 %.tmp7451, %.tmp7458
%.tmp7460 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7461 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7460, i32 0, i32 1
%.tmp7462 = load i8*, i8** %.tmp7461
%.tmp7464 = getelementptr [2 x i8], [2 x i8]*@.str7463, i32 0, i32 0
%.tmp7465 = call i32(i8*,i8*) @strcmp(i8* %.tmp7462, i8* %.tmp7464)
%.tmp7466 = icmp eq i32 %.tmp7465, 0
%.tmp7467 = or i1 %.tmp7459, %.tmp7466
%.tmp7468 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7469 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7468, i32 0, i32 1
%.tmp7470 = load i8*, i8** %.tmp7469
%.tmp7472 = getelementptr [2 x i8], [2 x i8]*@.str7471, i32 0, i32 0
%.tmp7473 = call i32(i8*,i8*) @strcmp(i8* %.tmp7470, i8* %.tmp7472)
%.tmp7474 = icmp eq i32 %.tmp7473, 0
%.tmp7475 = or i1 %.tmp7467, %.tmp7474
%.tmp7476 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7477 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7476, i32 0, i32 1
%.tmp7478 = load i8*, i8** %.tmp7477
%.tmp7480 = getelementptr [3 x i8], [3 x i8]*@.str7479, i32 0, i32 0
%.tmp7481 = call i32(i8*,i8*) @strcmp(i8* %.tmp7478, i8* %.tmp7480)
%.tmp7482 = icmp eq i32 %.tmp7481, 0
%.tmp7483 = or i1 %.tmp7475, %.tmp7482
%.tmp7484 = load %m878$.Node.type*, %m878$.Node.type** %op
%.tmp7485 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7484, i32 0, i32 1
%.tmp7486 = load i8*, i8** %.tmp7485
%.tmp7488 = getelementptr [3 x i8], [3 x i8]*@.str7487, i32 0, i32 0
%.tmp7489 = call i32(i8*,i8*) @strcmp(i8* %.tmp7486, i8* %.tmp7488)
%.tmp7490 = icmp eq i32 %.tmp7489, 0
%.tmp7491 = or i1 %.tmp7483, %.tmp7490
br i1 %.tmp7491, label %.if.true.7492, label %.if.false.7492
.if.true.7492:
%.tmp7493 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7428
%.tmp7494 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7493, i32 0, i32 0
%.tmp7496 = getelementptr [5 x i8], [5 x i8]*@.str7495, i32 0, i32 0
store i8* %.tmp7496, i8** %.tmp7494
br label %.if.end.7492
.if.false.7492:
%.tmp7497 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7428
%.tmp7498 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7497, i32 0, i32 0
%.tmp7500 = getelementptr [4 x i8], [4 x i8]*@.str7499, i32 0, i32 0
store i8* %.tmp7500, i8** %.tmp7498
br label %.if.end.7492
.if.end.7492:
%.tmp7501 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7428
ret %m2503$.Type.type* %.tmp7501
}
define %m2503$.AssignableInfo.type* @m295$compile_mono_assignable.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%curr_node = alloca %m878$.Node.type*
store %m878$.Node.type* %.curr_node.arg, %m878$.Node.type** %curr_node
%.tmp7502 = bitcast ptr null to %m2503$.AssignableInfo.type*
%assignable_info.7503 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7502, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7504 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%mono.7505 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7504, %m878$.Node.type** %mono.7505
%err_buf.7506 = alloca i8*
store i8* null, i8** %err_buf.7506
%buf.7507 = alloca i8*
store i8* null, i8** %buf.7507
%.tmp7508 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7509 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7508, i32 0, i32 6
%.tmp7510 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7509
%.tmp7511 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7510, i32 0, i32 0
%.tmp7512 = load i8*, i8** %.tmp7511
%.tmp7514 = getelementptr [7 x i8], [7 x i8]*@.str7513, i32 0, i32 0
%.tmp7515 = call i32(i8*,i8*) @strcmp(i8* %.tmp7512, i8* %.tmp7514)
%.tmp7516 = icmp eq i32 %.tmp7515, 0
br i1 %.tmp7516, label %.if.true.7517, label %.if.false.7517
.if.true.7517:
%.tmp7518 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7519 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7518)
store %m2503$.AssignableInfo.type* %.tmp7519, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7520 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7521 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7520, i32 0, i32 4
%.tmp7522 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp7522, %m2503$.Type.type** %.tmp7521
%.tmp7523 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7524 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7523, i32 0, i32 4
%.tmp7525 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7524
%.tmp7526 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7525, i32 0, i32 0
%.tmp7528 = getelementptr [4 x i8], [4 x i8]*@.str7527, i32 0, i32 0
store i8* %.tmp7528, i8** %.tmp7526
%.tmp7529 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7530 = load i8, i8* @SCOPE_CONST
%.tmp7531 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7532 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7531, i32 0, i32 6
%.tmp7533 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7532
%.tmp7534 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7533, i32 0, i32 1
%.tmp7535 = load i8*, i8** %.tmp7534
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp7529, i8 %.tmp7530, i8* %.tmp7535)
br label %.if.end.7517
.if.false.7517:
%.tmp7536 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7537 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7536, i32 0, i32 6
%.tmp7538 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7537
%.tmp7539 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7538, i32 0, i32 0
%.tmp7540 = load i8*, i8** %.tmp7539
%.tmp7542 = getelementptr [5 x i8], [5 x i8]*@.str7541, i32 0, i32 0
%.tmp7543 = call i32(i8*,i8*) @strcmp(i8* %.tmp7540, i8* %.tmp7542)
%.tmp7544 = icmp eq i32 %.tmp7543, 0
br i1 %.tmp7544, label %.if.true.7545, label %.if.false.7545
.if.true.7545:
%.tmp7546 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7547 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7546, i32 0, i32 6
%.tmp7548 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7547
%.tmp7549 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7548, i32 0, i32 1
%.tmp7550 = load i8*, i8** %.tmp7549
%.tmp7552 = getelementptr [5 x i8], [5 x i8]*@.str7551, i32 0, i32 0
%.tmp7553 = call i32(i8*,i8*) @strcmp(i8* %.tmp7550, i8* %.tmp7552)
%.tmp7554 = icmp ne i32 %.tmp7553, 0
br i1 %.tmp7554, label %.if.true.7555, label %.if.false.7555
.if.true.7555:
%.tmp7556 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7557 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7559 = getelementptr [42 x i8], [42 x i8]*@.str7558, i32 0, i32 0
%.tmp7560 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp7556, %m878$.Node.type* %.tmp7557, i8* %.tmp7559)
%.tmp7561 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7562 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7561, i32 0, i32 6
%.tmp7563 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7562
%.tmp7564 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7563, i32 0, i32 1
%.tmp7565 = load i8*, i8** %.tmp7564
%.tmp7566 = call i32(i8*,...) @printf(i8* %.tmp7560, i8* %.tmp7565)
%.tmp7567 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp7567
br label %.if.end.7555
.if.false.7555:
br label %.if.end.7555
.if.end.7555:
%.tmp7568 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7569 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7568)
store %m2503$.AssignableInfo.type* %.tmp7569, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7570 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7571 = load i8, i8* @SCOPE_CONST
%.tmp7573 = getelementptr [5 x i8], [5 x i8]*@.str7572, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp7570, i8 %.tmp7571, i8* %.tmp7573)
%.tmp7574 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7575 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7574, i32 0, i32 4
%.tmp7576 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp7576, %m2503$.Type.type** %.tmp7575
%.tmp7577 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7578 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7577, i32 0, i32 4
%.tmp7579 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7578
%.tmp7580 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7579, i32 0, i32 0
%.tmp7582 = getelementptr [8 x i8], [8 x i8]*@.str7581, i32 0, i32 0
store i8* %.tmp7582, i8** %.tmp7580
br label %.if.end.7545
.if.false.7545:
%.tmp7583 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7584 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7583, i32 0, i32 6
%.tmp7585 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7584
%.tmp7586 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7585, i32 0, i32 0
%.tmp7587 = load i8*, i8** %.tmp7586
%.tmp7589 = getelementptr [17 x i8], [17 x i8]*@.str7588, i32 0, i32 0
%.tmp7590 = call i32(i8*,i8*) @strcmp(i8* %.tmp7587, i8* %.tmp7589)
%.tmp7591 = icmp eq i32 %.tmp7590, 0
br i1 %.tmp7591, label %.if.true.7592, label %.if.false.7592
.if.true.7592:
%.tmp7593 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7594 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7593)
store %m2503$.AssignableInfo.type* %.tmp7594, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7595 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7596 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7595, i32 0, i32 6
%.tmp7597 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7596
%.tmp7598 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7597, i32 0, i32 6
%.tmp7599 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7598
%.tmp7601 = getelementptr [12 x i8], [12 x i8]*@.str7600, i32 0, i32 0
%.tmp7602 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp7599, i8* %.tmp7601)
%dest.7603 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7602, %m878$.Node.type** %dest.7603
%.tmp7604 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7605 = load %m878$.Node.type*, %m878$.Node.type** %dest.7603
%.tmp7606 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_addr.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp7604, %m878$.Node.type* %.tmp7605)
%var_info.7607 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7606, %m2503$.AssignableInfo.type** %var_info.7607
%.tmp7608 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %var_info.7607
%.tmp7609 = icmp eq %m2503$.AssignableInfo.type* %.tmp7608, null
br i1 %.tmp7609, label %.if.true.7610, label %.if.false.7610
.if.true.7610:
%.tmp7611 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
ret %m2503$.AssignableInfo.type* %.tmp7611
br label %.if.end.7610
.if.false.7610:
br label %.if.end.7610
.if.end.7610:
%.tmp7612 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7613 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %var_info.7607
%.tmp7614 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7613, i32 0, i32 4
%.tmp7615 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7614
%.tmp7616 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp7612, %m2503$.Type.type* %.tmp7615)
%var_type_repr.7617 = alloca i8*
store i8* %.tmp7616, i8** %var_type_repr.7617
%.tmp7618 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7619 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp7618, %m2503$.AssignableInfo.type* %.tmp7619)
%.tmp7620 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7621 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7620, i32 0, i32 4
%.tmp7622 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %var_info.7607
%.tmp7623 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7622, i32 0, i32 4
%.tmp7624 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7623
store %m2503$.Type.type* %.tmp7624, %m2503$.Type.type** %.tmp7621
%.tmp7626 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7627 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7626, i32 0, i32 6
%.tmp7628 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7627
%.tmp7629 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7628, i32 0, i32 6
%.tmp7630 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7629
%ptr.7631 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp7630, %m878$.Node.type** %ptr.7631
br label %.for.start.7625
.for.start.7625:
%.tmp7632 = load %m878$.Node.type*, %m878$.Node.type** %ptr.7631
%.tmp7633 = load %m878$.Node.type*, %m878$.Node.type** %dest.7603
%.tmp7634 = icmp ne %m878$.Node.type* %.tmp7632, %.tmp7633
br i1 %.tmp7634, label %.for.continue.7625, label %.for.end.7625
.for.continue.7625:
%.tmp7635 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%type.7636 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp7635, %m2503$.Type.type** %type.7636
%.tmp7637 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7636
%.tmp7638 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7637, i32 0, i32 3
%.tmp7639 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7640 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7639, i32 0, i32 4
%.tmp7641 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7640
store %m2503$.Type.type* %.tmp7641, %m2503$.Type.type** %.tmp7638
%.tmp7642 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7636
%.tmp7643 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7642, i32 0, i32 0
%.tmp7645 = getelementptr [4 x i8], [4 x i8]*@.str7644, i32 0, i32 0
store i8* %.tmp7645, i8** %.tmp7643
%.tmp7646 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7647 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7646, i32 0, i32 4
%.tmp7648 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7636
store %m2503$.Type.type* %.tmp7648, %m2503$.Type.type** %.tmp7647
%.tmp7649 = load %m878$.Node.type*, %m878$.Node.type** %ptr.7631
%.tmp7650 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7649, i32 0, i32 7
%.tmp7651 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7650
store %m878$.Node.type* %.tmp7651, %m878$.Node.type** %ptr.7631
br label %.for.start.7625
.for.end.7625:
%.tmp7652 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7653 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7652, i32 0, i32 6
%.tmp7654 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7653
%.tmp7655 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7654, i32 0, i32 6
%.tmp7656 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7655
%.tmp7657 = load %m878$.Node.type*, %m878$.Node.type** %dest.7603
%.tmp7658 = icmp ne %m878$.Node.type* %.tmp7656, %.tmp7657
br i1 %.tmp7658, label %.if.true.7659, label %.if.false.7659
.if.true.7659:
%.tmp7660 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7661 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp7660, i32 0, i32 1
%.tmp7662 = load %m0$.File.type*, %m0$.File.type** %.tmp7661
%.tmp7664 = getelementptr [38 x i8], [38 x i8]*@.str7663, i32 0, i32 0
%.tmp7665 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7666 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7665)
%.tmp7667 = load i8*, i8** %var_type_repr.7617
%.tmp7668 = load i8*, i8** %var_type_repr.7617
%.tmp7669 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %var_info.7607
%.tmp7670 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7669)
%.tmp7671 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7662, i8* %.tmp7664, i8* %.tmp7666, i8* %.tmp7667, i8* %.tmp7668, i8* %.tmp7670)
br label %.if.end.7659
.if.false.7659:
%.tmp7672 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7673 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7672, i32 0, i32 4
%.tmp7674 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7673
%.tmp7675 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7674, i32 0, i32 0
%.tmp7676 = load i8*, i8** %.tmp7675
%.tmp7678 = getelementptr [9 x i8], [9 x i8]*@.str7677, i32 0, i32 0
%.tmp7679 = call i32(i8*,i8*) @strcmp(i8* %.tmp7676, i8* %.tmp7678)
%.tmp7680 = icmp eq i32 %.tmp7679, 0
br i1 %.tmp7680, label %.if.true.7681, label %.if.false.7681
.if.true.7681:
%.tmp7682 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %var_info.7607
store %m2503$.AssignableInfo.type* %.tmp7682, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7683 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%type.7684 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp7683, %m2503$.Type.type** %type.7684
%.tmp7685 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7684
%.tmp7686 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7685, i32 0, i32 3
%.tmp7687 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7688 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7687, i32 0, i32 4
%.tmp7689 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7688
store %m2503$.Type.type* %.tmp7689, %m2503$.Type.type** %.tmp7686
%.tmp7690 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7684
%.tmp7691 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7690, i32 0, i32 0
%.tmp7693 = getelementptr [4 x i8], [4 x i8]*@.str7692, i32 0, i32 0
store i8* %.tmp7693, i8** %.tmp7691
%.tmp7694 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7695 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7694, i32 0, i32 4
%.tmp7696 = load %m2503$.Type.type*, %m2503$.Type.type** %type.7684
store %m2503$.Type.type* %.tmp7696, %m2503$.Type.type** %.tmp7695
br label %.if.end.7681
.if.false.7681:
%.tmp7697 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7698 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp7697, i32 0, i32 1
%.tmp7699 = load %m0$.File.type*, %m0$.File.type** %.tmp7698
%.tmp7701 = getelementptr [22 x i8], [22 x i8]*@.str7700, i32 0, i32 0
%.tmp7702 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7703 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7702)
%.tmp7704 = load i8*, i8** %var_type_repr.7617
%.tmp7705 = load i8*, i8** %var_type_repr.7617
%.tmp7706 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %var_info.7607
%.tmp7707 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7706)
%.tmp7708 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7699, i8* %.tmp7701, i8* %.tmp7703, i8* %.tmp7704, i8* %.tmp7705, i8* %.tmp7707)
br label %.if.end.7681
.if.end.7681:
br label %.if.end.7659
.if.end.7659:
br label %.if.end.7592
.if.false.7592:
%.tmp7709 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7710 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7709, i32 0, i32 6
%.tmp7711 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7710
%.tmp7712 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7711, i32 0, i32 0
%.tmp7713 = load i8*, i8** %.tmp7712
%.tmp7715 = getelementptr [8 x i8], [8 x i8]*@.str7714, i32 0, i32 0
%.tmp7716 = call i32(i8*,i8*) @strcmp(i8* %.tmp7713, i8* %.tmp7715)
%.tmp7717 = icmp eq i32 %.tmp7716, 0
br i1 %.tmp7717, label %.if.true.7718, label %.if.false.7718
.if.true.7718:
%.tmp7719 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7720 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7719)
store %m2503$.AssignableInfo.type* %.tmp7720, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7721 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7722 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7721, i32 0, i32 4
%.tmp7723 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp7723, %m2503$.Type.type** %.tmp7722
%.tmp7724 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7725 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7724, i32 0, i32 4
%.tmp7726 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7725
%.tmp7727 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7726, i32 0, i32 0
%.tmp7729 = getelementptr [5 x i8], [5 x i8]*@.str7728, i32 0, i32 0
store i8* %.tmp7729, i8** %.tmp7727
%.tmp7730 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7731 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7730, i32 0, i32 6
%.tmp7732 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7731
%.tmp7733 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7732, i32 0, i32 6
%.tmp7734 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7733
%.tmp7735 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7734, i32 0, i32 1
%.tmp7736 = load i8*, i8** %.tmp7735
%.tmp7738 = getelementptr [6 x i8], [6 x i8]*@.str7737, i32 0, i32 0
%.tmp7739 = call i32(i8*,i8*) @strcmp(i8* %.tmp7736, i8* %.tmp7738)
%.tmp7740 = icmp eq i32 %.tmp7739, 0
br i1 %.tmp7740, label %.if.true.7741, label %.if.false.7741
.if.true.7741:
%.tmp7742 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7743 = load i8, i8* @SCOPE_CONST
%.tmp7745 = getelementptr [2 x i8], [2 x i8]*@.str7744, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp7742, i8 %.tmp7743, i8* %.tmp7745)
br label %.if.end.7741
.if.false.7741:
%.tmp7746 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7747 = load i8, i8* @SCOPE_CONST
%.tmp7749 = getelementptr [2 x i8], [2 x i8]*@.str7748, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp7746, i8 %.tmp7747, i8* %.tmp7749)
br label %.if.end.7741
.if.end.7741:
br label %.if.end.7718
.if.false.7718:
%.tmp7750 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7751 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7750, i32 0, i32 6
%.tmp7752 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7751
%.tmp7753 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7752, i32 0, i32 0
%.tmp7754 = load i8*, i8** %.tmp7753
%.tmp7756 = getelementptr [8 x i8], [8 x i8]*@.str7755, i32 0, i32 0
%.tmp7757 = call i32(i8*,i8*) @strcmp(i8* %.tmp7754, i8* %.tmp7756)
%.tmp7758 = icmp eq i32 %.tmp7757, 0
br i1 %.tmp7758, label %.if.true.7759, label %.if.false.7759
.if.true.7759:
%.tmp7760 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7761 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7762 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7761, i32 0, i32 6
%.tmp7763 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7762
%.tmp7764 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7763, i32 0, i32 6
%.tmp7765 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7764
%.tmp7766 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$compile_fn_call.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp7760, %m878$.Node.type* %.tmp7765)
store %m2503$.AssignableInfo.type* %.tmp7766, %m2503$.AssignableInfo.type** %assignable_info.7503
br label %.if.end.7759
.if.false.7759:
%.tmp7767 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7768 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7767, i32 0, i32 6
%.tmp7769 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7768
%.tmp7770 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7769, i32 0, i32 0
%.tmp7771 = load i8*, i8** %.tmp7770
%.tmp7773 = getelementptr [7 x i8], [7 x i8]*@.str7772, i32 0, i32 0
%.tmp7774 = call i32(i8*,i8*) @strcmp(i8* %.tmp7771, i8* %.tmp7773)
%.tmp7775 = icmp eq i32 %.tmp7774, 0
br i1 %.tmp7775, label %.if.true.7776, label %.if.false.7776
.if.true.7776:
%.tmp7777 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7778 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7779 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7778, i32 0, i32 6
%.tmp7780 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7779
%.tmp7781 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7780, i32 0, i32 1
%.tmp7782 = load i8*, i8** %.tmp7781
%.tmp7783 = call %m2503$.AssignableInfo.type*(%m2503$.CompilerCtx.type*,i8*) @m295$define_string.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.tmp7777, i8* %.tmp7782)
%string_info.7784 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp7783, %m2503$.AssignableInfo.type** %string_info.7784
%.tmp7785 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7786 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7785)
store %m2503$.AssignableInfo.type* %.tmp7786, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7787 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7788 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
call void(%m2503$.CompilerCtx.type*,%m2503$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2503$.CompilerCtx.typep.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp7787, %m2503$.AssignableInfo.type* %.tmp7788)
%.tmp7789 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7790 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %string_info.7784
%.tmp7791 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7790, i32 0, i32 4
%.tmp7792 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7791
%.tmp7793 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp7789, %m2503$.Type.type* %.tmp7792)
%str_tr.7794 = alloca i8*
store i8* %.tmp7793, i8** %str_tr.7794
%.tmp7795 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7796 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp7795, i32 0, i32 1
%.tmp7797 = load %m0$.File.type*, %m0$.File.type** %.tmp7796
%.tmp7799 = getelementptr [44 x i8], [44 x i8]*@.str7798, i32 0, i32 0
%.tmp7800 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7801 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7800)
%.tmp7802 = load i8*, i8** %str_tr.7794
%.tmp7803 = load i8*, i8** %str_tr.7794
%.tmp7804 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %string_info.7784
%.tmp7805 = call i8*(%m2503$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2503$.AssignableInfo.typep(%m2503$.AssignableInfo.type* %.tmp7804)
%.tmp7806 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7797, i8* %.tmp7799, i8* %.tmp7801, i8* %.tmp7802, i8* %.tmp7803, i8* %.tmp7805)
%.tmp7807 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7808 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7807, i32 0, i32 4
%.tmp7809 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp7809, %m2503$.Type.type** %.tmp7808
%.tmp7810 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7811 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7810, i32 0, i32 4
%.tmp7812 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7811
%.tmp7813 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7812, i32 0, i32 0
%.tmp7815 = getelementptr [4 x i8], [4 x i8]*@.str7814, i32 0, i32 0
store i8* %.tmp7815, i8** %.tmp7813
%.tmp7816 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7817 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7816, i32 0, i32 4
%.tmp7818 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7817
%.tmp7819 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7818, i32 0, i32 3
%.tmp7820 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp7820, %m2503$.Type.type** %.tmp7819
%.tmp7821 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7822 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7821, i32 0, i32 4
%.tmp7823 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7822
%.tmp7824 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7823, i32 0, i32 3
%.tmp7825 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7824
%.tmp7826 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7825, i32 0, i32 0
%.tmp7828 = getelementptr [4 x i8], [4 x i8]*@.str7827, i32 0, i32 0
store i8* %.tmp7828, i8** %.tmp7826
br label %.if.end.7776
.if.false.7776:
%.tmp7829 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7830 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7829, i32 0, i32 6
%.tmp7831 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7830
%.tmp7832 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7831, i32 0, i32 0
%.tmp7833 = load i8*, i8** %.tmp7832
%.tmp7835 = getelementptr [4 x i8], [4 x i8]*@.str7834, i32 0, i32 0
%.tmp7836 = call i32(i8*,i8*) @strcmp(i8* %.tmp7833, i8* %.tmp7835)
%.tmp7837 = icmp eq i32 %.tmp7836, 0
br i1 %.tmp7837, label %.if.true.7838, label %.if.false.7838
.if.true.7838:
%.tmp7839 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7840 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp7839)
store %m2503$.AssignableInfo.type* %.tmp7840, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7841 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7842 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7841, i32 0, i32 6
%.tmp7843 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7842
%.tmp7844 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7843, i32 0, i32 1
%.tmp7845 = load i8*, i8** %.tmp7844
%.tmp7846 = call i32(i8*) @strlen(i8* %.tmp7845)
%chr_len.7847 = alloca i32
store i32 %.tmp7846, i32* %chr_len.7847
%.tmp7848 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7849 = load i8, i8* @SCOPE_CONST
%.tmp7851 = getelementptr [2 x i8], [2 x i8]*@.str7850, i32 0, i32 0
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp7848, i8 %.tmp7849, i8* %.tmp7851)
%.tmp7852 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7853 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7852, i32 0, i32 0
%.tmp7854 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7855 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7854, i32 0, i32 6
%.tmp7856 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7855
%.tmp7857 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7856, i32 0, i32 1
%.tmp7858 = load i8*, i8** %.tmp7857
%.tmp7859 = call i8*(i8*) @m2057$chr_to_llvm.cp.cp(i8* %.tmp7858)
store i8* %.tmp7859, i8** %.tmp7853
%.tmp7860 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7861 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7860, i32 0, i32 0
%.tmp7862 = load i8*, i8** %.tmp7861
%.tmp7863 = icmp eq i8* %.tmp7862, null
br i1 %.tmp7863, label %.if.true.7864, label %.if.false.7864
.if.true.7864:
%.tmp7865 = getelementptr i8*, i8** %err_buf.7506, i32 0
%.tmp7867 = getelementptr [22 x i8], [22 x i8]*@.str7866, i32 0, i32 0
%.tmp7868 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7869 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7868, i32 0, i32 6
%.tmp7870 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7869
%.tmp7871 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7870, i32 0, i32 1
%.tmp7872 = load i8*, i8** %.tmp7871
%.tmp7873 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7865, i8* %.tmp7867, i8* %.tmp7872)
%.tmp7874 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp7874
br label %.if.end.7864
.if.false.7864:
br label %.if.end.7864
.if.end.7864:
%.tmp7875 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7876 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7875, i32 0, i32 4
%.tmp7877 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp7877, %m2503$.Type.type** %.tmp7876
%.tmp7878 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7879 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7878, i32 0, i32 4
%.tmp7880 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7879
%.tmp7881 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7880, i32 0, i32 0
%.tmp7883 = getelementptr [4 x i8], [4 x i8]*@.str7882, i32 0, i32 0
store i8* %.tmp7883, i8** %.tmp7881
br label %.if.end.7838
.if.false.7838:
%.tmp7884 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp7885 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7887 = getelementptr [40 x i8], [40 x i8]*@.str7886, i32 0, i32 0
%.tmp7888 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp7884, %m878$.Node.type* %.tmp7885, i8* %.tmp7887)
%.tmp7889 = load %m878$.Node.type*, %m878$.Node.type** %mono.7505
%.tmp7890 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7889, i32 0, i32 6
%.tmp7891 = load %m878$.Node.type*, %m878$.Node.type** %.tmp7890
%.tmp7892 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7891, i32 0, i32 0
%.tmp7893 = load i8*, i8** %.tmp7892
%.tmp7894 = call i32(i8*,...) @printf(i8* %.tmp7888, i8* %.tmp7893)
%.tmp7895 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp7895
br label %.if.end.7838
.if.end.7838:
br label %.if.end.7776
.if.end.7776:
br label %.if.end.7759
.if.end.7759:
br label %.if.end.7718
.if.end.7718:
br label %.if.end.7592
.if.end.7592:
br label %.if.end.7545
.if.end.7545:
br label %.if.end.7517
.if.end.7517:
%.tmp7896 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7897 = icmp eq %m2503$.AssignableInfo.type* %.tmp7896, null
br i1 %.tmp7897, label %.if.true.7898, label %.if.false.7898
.if.true.7898:
%.tmp7899 = bitcast ptr null to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp7899
br label %.if.end.7898
.if.false.7898:
br label %.if.end.7898
.if.end.7898:
%.tmp7900 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7901 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7900, i32 0, i32 5
%.tmp7902 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7903 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7902, i32 0, i32 3
%.tmp7904 = load i32, i32* %.tmp7903
store i32 %.tmp7904, i32* %.tmp7901
%.tmp7905 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7906 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp7905, i32 0, i32 6
%.tmp7907 = load %m878$.Node.type*, %m878$.Node.type** %curr_node
%.tmp7908 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp7907, i32 0, i32 4
%.tmp7909 = load i32, i32* %.tmp7908
store i32 %.tmp7909, i32* %.tmp7906
%.tmp7910 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %assignable_info.7503
%.tmp7911 = bitcast %m2503$.AssignableInfo.type* %.tmp7910 to %m2503$.AssignableInfo.type*
ret %m2503$.AssignableInfo.type* %.tmp7911
}
define i8* @m295$type_abbr.cp.m2503$.Type.typep(%m2503$.Type.type* %.type.arg) {
%type = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.type.arg, %m2503$.Type.type** %type
%.tmp7912 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7913 = icmp ne %m2503$.Type.type* %.tmp7912, null
%.tmp7915 = getelementptr [22 x i8], [22 x i8]*@.str7914, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7913, i8* %.tmp7915)
%.tmp7916 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7917 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7916, i32 0, i32 0
%.tmp7918 = load i8*, i8** %.tmp7917
%.tmp7919 = icmp ne i8* %.tmp7918, null
%.tmp7921 = getelementptr [59 x i8], [59 x i8]*@.str7920, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7919, i8* %.tmp7921)
%.tmp7922 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7923 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7922, i32 0, i32 0
%.tmp7924 = load i8*, i8** %.tmp7923
%.tmp7926 = getelementptr [4 x i8], [4 x i8]*@.str7925, i32 0, i32 0
%.tmp7927 = call i32(i8*,i8*) @strcmp(i8* %.tmp7924, i8* %.tmp7926)
%.tmp7928 = icmp eq i32 %.tmp7927, 0
br i1 %.tmp7928, label %.if.true.7929, label %.if.false.7929
.if.true.7929:
%.tmp7931 = getelementptr [2 x i8], [2 x i8]*@.str7930, i32 0, i32 0
ret i8* %.tmp7931
br label %.if.end.7929
.if.false.7929:
%.tmp7932 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7933 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7932, i32 0, i32 0
%.tmp7934 = load i8*, i8** %.tmp7933
%.tmp7936 = getelementptr [5 x i8], [5 x i8]*@.str7935, i32 0, i32 0
%.tmp7937 = call i32(i8*,i8*) @strcmp(i8* %.tmp7934, i8* %.tmp7936)
%.tmp7938 = icmp eq i32 %.tmp7937, 0
br i1 %.tmp7938, label %.if.true.7939, label %.if.false.7939
.if.true.7939:
%.tmp7941 = getelementptr [2 x i8], [2 x i8]*@.str7940, i32 0, i32 0
ret i8* %.tmp7941
br label %.if.end.7939
.if.false.7939:
%.tmp7942 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7943 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7942, i32 0, i32 0
%.tmp7944 = load i8*, i8** %.tmp7943
%.tmp7946 = getelementptr [5 x i8], [5 x i8]*@.str7945, i32 0, i32 0
%.tmp7947 = call i32(i8*,i8*) @strcmp(i8* %.tmp7944, i8* %.tmp7946)
%.tmp7948 = icmp eq i32 %.tmp7947, 0
br i1 %.tmp7948, label %.if.true.7949, label %.if.false.7949
.if.true.7949:
%.tmp7951 = getelementptr [2 x i8], [2 x i8]*@.str7950, i32 0, i32 0
ret i8* %.tmp7951
br label %.if.end.7949
.if.false.7949:
%.tmp7952 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7953 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7952, i32 0, i32 0
%.tmp7954 = load i8*, i8** %.tmp7953
%.tmp7956 = getelementptr [4 x i8], [4 x i8]*@.str7955, i32 0, i32 0
%.tmp7957 = call i32(i8*,i8*) @strcmp(i8* %.tmp7954, i8* %.tmp7956)
%.tmp7958 = icmp eq i32 %.tmp7957, 0
br i1 %.tmp7958, label %.if.true.7959, label %.if.false.7959
.if.true.7959:
%.tmp7961 = getelementptr [2 x i8], [2 x i8]*@.str7960, i32 0, i32 0
ret i8* %.tmp7961
br label %.if.end.7959
.if.false.7959:
%.tmp7962 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7963 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7962, i32 0, i32 0
%.tmp7964 = load i8*, i8** %.tmp7963
%.tmp7966 = getelementptr [4 x i8], [4 x i8]*@.str7965, i32 0, i32 0
%.tmp7967 = call i32(i8*,i8*) @strcmp(i8* %.tmp7964, i8* %.tmp7966)
%.tmp7968 = icmp eq i32 %.tmp7967, 0
br i1 %.tmp7968, label %.if.true.7969, label %.if.false.7969
.if.true.7969:
%buf.7970 = alloca i8*
store i8* null, i8** %buf.7970
%.tmp7971 = getelementptr i8*, i8** %buf.7970, i32 0
%.tmp7973 = getelementptr [4 x i8], [4 x i8]*@.str7972, i32 0, i32 0
%.tmp7974 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7975 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7974, i32 0, i32 3
%.tmp7976 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp7975
%.tmp7977 = call i8*(%m2503$.Type.type*) @m295$type_abbr.cp.m2503$.Type.typep(%m2503$.Type.type* %.tmp7976)
%.tmp7978 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7971, i8* %.tmp7973, i8* %.tmp7977)
%.tmp7979 = load i8*, i8** %buf.7970
ret i8* %.tmp7979
br label %.if.end.7969
.if.false.7969:
%.tmp7980 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7981 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7980, i32 0, i32 0
%.tmp7982 = load i8*, i8** %.tmp7981
%.tmp7984 = getelementptr [10 x i8], [10 x i8]*@.str7983, i32 0, i32 0
%.tmp7985 = call i32(i8*,i8*) @strcmp(i8* %.tmp7982, i8* %.tmp7984)
%.tmp7986 = icmp eq i32 %.tmp7985, 0
br i1 %.tmp7986, label %.if.true.7987, label %.if.false.7987
.if.true.7987:
%.tmp7988 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7989 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7988, i32 0, i32 2
%.tmp7990 = load i8*, i8** %.tmp7989
ret i8* %.tmp7990
br label %.if.end.7987
.if.false.7987:
%.tmp7991 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp7992 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp7991, i32 0, i32 0
%.tmp7993 = load i8*, i8** %.tmp7992
%.tmp7995 = getelementptr [7 x i8], [7 x i8]*@.str7994, i32 0, i32 0
%.tmp7996 = call i32(i8*,i8*) @strcmp(i8* %.tmp7993, i8* %.tmp7995)
%.tmp7997 = icmp eq i32 %.tmp7996, 0
br i1 %.tmp7997, label %.if.true.7998, label %.if.false.7998
.if.true.7998:
%.tmp8000 = getelementptr [2 x i8], [2 x i8]*@.str7999, i32 0, i32 0
%buf.8001 = alloca i8*
store i8* %.tmp8000, i8** %buf.8001
%.tmp8003 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8004 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8003, i32 0, i32 3
%.tmp8005 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8004
%t.8006 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8005, %m2503$.Type.type** %t.8006
br label %.for.start.8002
.for.start.8002:
%.tmp8007 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8006
%.tmp8008 = icmp ne %m2503$.Type.type* %.tmp8007, null
br i1 %.tmp8008, label %.for.continue.8002, label %.for.end.8002
.for.continue.8002:
%.tmp8009 = getelementptr i8*, i8** %buf.8001, i32 0
%.tmp8011 = getelementptr [5 x i8], [5 x i8]*@.str8010, i32 0, i32 0
%.tmp8012 = load i8*, i8** %buf.8001
%.tmp8013 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8006
%.tmp8014 = call i8*(%m2503$.Type.type*) @m295$type_abbr.cp.m2503$.Type.typep(%m2503$.Type.type* %.tmp8013)
%.tmp8015 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8009, i8* %.tmp8011, i8* %.tmp8012, i8* %.tmp8014)
%.tmp8016 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8006
%.tmp8017 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8016, i32 0, i32 4
%.tmp8018 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8017
store %m2503$.Type.type* %.tmp8018, %m2503$.Type.type** %t.8006
br label %.for.start.8002
.for.end.8002:
%.tmp8019 = load i8*, i8** %buf.8001
ret i8* %.tmp8019
br label %.if.end.7998
.if.false.7998:
%.tmp8020 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8021 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8020, i32 0, i32 0
%.tmp8022 = load i8*, i8** %.tmp8021
%.tmp8024 = getelementptr [9 x i8], [9 x i8]*@.str8023, i32 0, i32 0
%.tmp8025 = call i32(i8*,i8*) @strcmp(i8* %.tmp8022, i8* %.tmp8024)
%.tmp8026 = icmp eq i32 %.tmp8025, 0
br i1 %.tmp8026, label %.if.true.8027, label %.if.false.8027
.if.true.8027:
%.tmp8029 = getelementptr [2 x i8], [2 x i8]*@.str8028, i32 0, i32 0
ret i8* %.tmp8029
br label %.if.end.8027
.if.false.8027:
%.tmp8030 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8031 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8030, i32 0, i32 0
%.tmp8032 = load i8*, i8** %.tmp8031
%.tmp8034 = getelementptr [6 x i8], [6 x i8]*@.str8033, i32 0, i32 0
%.tmp8035 = call i32(i8*,i8*) @strcmp(i8* %.tmp8032, i8* %.tmp8034)
%.tmp8036 = icmp eq i32 %.tmp8035, 0
br i1 %.tmp8036, label %.if.true.8037, label %.if.false.8037
.if.true.8037:
%.tmp8039 = getelementptr [2 x i8], [2 x i8]*@.str8038, i32 0, i32 0
ret i8* %.tmp8039
br label %.if.end.8037
.if.false.8037:
%.tmp8041 = getelementptr [45 x i8], [45 x i8]*@.str8040, i32 0, i32 0
%.tmp8042 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8043 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8042, i32 0, i32 0
%.tmp8044 = load i8*, i8** %.tmp8043
%.tmp8045 = call i32(i8*,...) @printf(i8* %.tmp8041, i8* %.tmp8044)
br label %.if.end.8037
.if.end.8037:
br label %.if.end.8027
.if.end.8027:
br label %.if.end.7998
.if.end.7998:
br label %.if.end.7987
.if.end.7987:
br label %.if.end.7969
.if.end.7969:
br label %.if.end.7959
.if.end.7959:
br label %.if.end.7949
.if.end.7949:
br label %.if.end.7939
.if.end.7939:
br label %.if.end.7929
.if.end.7929:
%.tmp8046 = bitcast ptr null to i8*
ret i8* %.tmp8046
}
define %m2503$.AssignableInfo.type* @m295$define_string.m2503$.AssignableInfo.typep.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp8047 = bitcast ptr null to %m878$.Node.type*
%.tmp8048 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp8047)
%info.8049 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp8048, %m2503$.AssignableInfo.type** %info.8049
%tmp_buff.8050 = alloca i8*
store i8* null, i8** %tmp_buff.8050
%.tmp8051 = getelementptr i8*, i8** %tmp_buff.8050, i32 0
%.tmp8053 = getelementptr [7 x i8], [7 x i8]*@.str8052, i32 0, i32 0
%.tmp8054 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8055 = call i32(%m2503$.CompilerCtx.type*) @m295$new_uid.i.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.tmp8054)
%.tmp8056 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8051, i8* %.tmp8053, i32 %.tmp8055)
%.tmp8057 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8049
%.tmp8058 = load i8, i8* @SCOPE_GLOBAL
%.tmp8059 = load i8*, i8** %tmp_buff.8050
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp8057, i8 %.tmp8058, i8* %.tmp8059)
%.tmp8060 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8049
%.tmp8061 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8060, i32 0, i32 4
%.tmp8062 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp8062, %m2503$.Type.type** %.tmp8061
%.tmp8063 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8049
%.tmp8064 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8063, i32 0, i32 4
%.tmp8065 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8064
%.tmp8066 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8065, i32 0, i32 0
%.tmp8068 = getelementptr [6 x i8], [6 x i8]*@.str8067, i32 0, i32 0
store i8* %.tmp8068, i8** %.tmp8066
%.tmp8069 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8049
%.tmp8070 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8069, i32 0, i32 4
%.tmp8071 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8070
%.tmp8072 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8071, i32 0, i32 3
%.tmp8073 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp8073, %m2503$.Type.type** %.tmp8072
%.tmp8074 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8049
%.tmp8075 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8074, i32 0, i32 4
%.tmp8076 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8075
%.tmp8077 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8076, i32 0, i32 3
%.tmp8078 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8077
%.tmp8079 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8078, i32 0, i32 0
%.tmp8081 = getelementptr [4 x i8], [4 x i8]*@.str8080, i32 0, i32 0
store i8* %.tmp8081, i8** %.tmp8079
%.tmp8082 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8049
%.tmp8083 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8082, i32 0, i32 4
%.tmp8084 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8083
%.tmp8085 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8084, i32 0, i32 3
%.tmp8086 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8085
%.tmp8087 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8086, i32 0, i32 4
%.tmp8088 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp8088, %m2503$.Type.type** %.tmp8087
%.tmp8089 = load i8*, i8** %text
%.tmp8090 = call i8*(i8*) @m2057$string_to_llvm.cp.cp(i8* %.tmp8089)
%identifier.8091 = alloca i8*
store i8* %.tmp8090, i8** %identifier.8091
%.tmp8092 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8049
%.tmp8093 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8092, i32 0, i32 4
%.tmp8094 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8093
%.tmp8095 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8094, i32 0, i32 3
%.tmp8096 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8095
%.tmp8097 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8096, i32 0, i32 4
%.tmp8098 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8097
%.tmp8099 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8098, i32 0, i32 0
%.tmp8100 = getelementptr i8*, i8** %.tmp8099, i32 0
%.tmp8102 = getelementptr [3 x i8], [3 x i8]*@.str8101, i32 0, i32 0
%.tmp8103 = load i8*, i8** %identifier.8091
%.tmp8104 = call i32(i8*) @m2057$llvm_str_len.i.cp(i8* %.tmp8103)
%.tmp8105 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8100, i8* %.tmp8102, i32 %.tmp8104)
%.tmp8106 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8107 = load i8*, i8** %identifier.8091
%.tmp8109 = getelementptr [7 x i8], [7 x i8]*@.str8108, i32 0, i32 0
%.tmp8110 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8049
call void(%m2503$.CompilerCtx.type*,i8*,i8*,%m2503$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2503$.CompilerCtx.typep.cp.cp.m2503$.AssignableInfo.typep.b.b(%m2503$.CompilerCtx.type* %.tmp8106, i8* %.tmp8107, i8* %.tmp8109, %m2503$.AssignableInfo.type* %.tmp8110, i1 0, i1 0)
%.tmp8111 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8049
ret %m2503$.AssignableInfo.type* %.tmp8111
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
%.tmp8112 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* null, i32 1
%.tmp8113 = ptrtoint %m2503$.GlobalName.type* %.tmp8112 to i32
%.tmp8114 = call i8*(i32) @malloc(i32 %.tmp8113)
%.tmp8115 = bitcast i8* %.tmp8114 to %m2503$.GlobalName.type*
%global.8116 = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.tmp8115, %m2503$.GlobalName.type** %global.8116
%.tmp8117 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8116
%.tmp8118 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8117, i32 0, i32 0
%.tmp8119 = load i8*, i8** %id
store i8* %.tmp8119, i8** %.tmp8118
%.tmp8120 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8116
%.tmp8121 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8120, i32 0, i32 1
%.tmp8122 = load i8*, i8** %type
store i8* %.tmp8122, i8** %.tmp8121
%.tmp8123 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8116
%.tmp8124 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8123, i32 0, i32 4
%.tmp8125 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info
store %m2503$.AssignableInfo.type* %.tmp8125, %m2503$.AssignableInfo.type** %.tmp8124
%.tmp8126 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8116
%.tmp8127 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8126, i32 0, i32 2
%.tmp8128 = load i1, i1* %compiled
store i1 %.tmp8128, i1* %.tmp8127
%.tmp8129 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8116
%.tmp8130 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8129, i32 0, i32 5
store %m2503$.GlobalName.type* null, %m2503$.GlobalName.type** %.tmp8130
%.tmp8131 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8116
%.tmp8132 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8131, i32 0, i32 3
%.tmp8133 = load i1, i1* %weak
store i1 %.tmp8133, i1* %.tmp8132
%.tmp8134 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8135 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %global.8116
call void(%m2503$.CompilerCtx.type*,%m2503$.GlobalName.type*) @m295$append_global.v.m2503$.CompilerCtx.typep.m2503$.GlobalName.typep(%m2503$.CompilerCtx.type* %.tmp8134, %m2503$.GlobalName.type* %.tmp8135)
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
%.tmp8136 = load %m878$.Node.type*, %m878$.Node.type** %mod
%.tmp8137 = call %m2503$.AssignableInfo.type*(%m878$.Node.type*) @m295$new_assignable_info.m2503$.AssignableInfo.typep.m878$.Node.typep(%m878$.Node.type* %.tmp8136)
%info.8138 = alloca %m2503$.AssignableInfo.type*
store %m2503$.AssignableInfo.type* %.tmp8137, %m2503$.AssignableInfo.type** %info.8138
%.tmp8139 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8138
%.tmp8140 = load i8, i8* @SCOPE_CONST
%.tmp8141 = load i8*, i8** %abspath
call void(%m2503$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2503$.AssignableInfo.typep.c.cp(%m2503$.AssignableInfo.type* %.tmp8139, i8 %.tmp8140, i8* %.tmp8141)
%.tmp8142 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8138
%.tmp8143 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8142, i32 0, i32 3
%.tmp8145 = getelementptr [7 x i8], [7 x i8]*@.str8144, i32 0, i32 0
store i8* %.tmp8145, i8** %.tmp8143
%.tmp8146 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8138
%.tmp8147 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8146, i32 0, i32 4
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp8147
%.tmp8148 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8149 = load %m878$.Node.type*, %m878$.Node.type** %mod
%.tmp8150 = load i8*, i8** %as_name
%.tmp8151 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %info.8138
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*,%m2503$.AssignableInfo.type*) @m295$define_assignable.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp.m2503$.AssignableInfo.typep(%m2503$.CompilerCtx.type* %.tmp8148, %m878$.Node.type* %.tmp8149, i8* %.tmp8150, %m2503$.AssignableInfo.type* %.tmp8151)
ret void
}
define void @m295$append_anon_fn.v.m2503$.CompilerCtx.typep.cp(%m2503$.CompilerCtx.type* %.ctx.arg, i8* %.code.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%code = alloca i8*
store i8* %.code.arg, i8** %code
%.tmp8152 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* null, i32 1
%.tmp8153 = ptrtoint %m2503$.AnonFn.type* %.tmp8152 to i32
%.tmp8154 = call i8*(i32) @malloc(i32 %.tmp8153)
%.tmp8155 = bitcast i8* %.tmp8154 to %m2503$.AnonFn.type*
%fn.8156 = alloca %m2503$.AnonFn.type*
store %m2503$.AnonFn.type* %.tmp8155, %m2503$.AnonFn.type** %fn.8156
%.tmp8157 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8156
%.tmp8158 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8157, i32 0, i32 0
%.tmp8159 = load i8*, i8** %code
store i8* %.tmp8159, i8** %.tmp8158
%.tmp8160 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8161 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8160, i32 0, i32 8
%.tmp8162 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %.tmp8161
%.tmp8163 = icmp eq %m2503$.AnonFn.type* %.tmp8162, null
br i1 %.tmp8163, label %.if.true.8164, label %.if.false.8164
.if.true.8164:
%.tmp8165 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8166 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8165, i32 0, i32 8
%.tmp8167 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8156
store %m2503$.AnonFn.type* %.tmp8167, %m2503$.AnonFn.type** %.tmp8166
%.tmp8168 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8156
%.tmp8169 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8168, i32 0, i32 1
store %m2503$.AnonFn.type* null, %m2503$.AnonFn.type** %.tmp8169
br label %.if.end.8164
.if.false.8164:
%.tmp8170 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8171 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8170, i32 0, i32 8
%.tmp8172 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %.tmp8171
%last.8173 = alloca %m2503$.AnonFn.type*
store %m2503$.AnonFn.type* %.tmp8172, %m2503$.AnonFn.type** %last.8173
br label %.for.start.8174
.for.start.8174:
%.tmp8175 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %last.8173
%.tmp8176 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8175, i32 0, i32 1
%.tmp8177 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %.tmp8176
%.tmp8178 = icmp ne %m2503$.AnonFn.type* %.tmp8177, null
br i1 %.tmp8178, label %.for.continue.8174, label %.for.end.8174
.for.continue.8174:
%.tmp8179 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %last.8173
%.tmp8180 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8179, i32 0, i32 1
%.tmp8181 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %.tmp8180
store %m2503$.AnonFn.type* %.tmp8181, %m2503$.AnonFn.type** %last.8173
br label %.for.start.8174
.for.end.8174:
%.tmp8182 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %last.8173
%.tmp8183 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8182, i32 0, i32 1
%.tmp8184 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8156
store %m2503$.AnonFn.type* %.tmp8184, %m2503$.AnonFn.type** %.tmp8183
br label %.if.end.8164
.if.end.8164:
ret void
}
define void @m295$compile_anon_fn.v.m2503$.CompilerCtx.typep(%m2503$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%.tmp8186 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8187 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8186, i32 0, i32 8
%.tmp8188 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %.tmp8187
%fn.8189 = alloca %m2503$.AnonFn.type*
store %m2503$.AnonFn.type* %.tmp8188, %m2503$.AnonFn.type** %fn.8189
br label %.for.start.8185
.for.start.8185:
%.tmp8190 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8189
%.tmp8191 = icmp ne %m2503$.AnonFn.type* %.tmp8190, null
br i1 %.tmp8191, label %.for.continue.8185, label %.for.end.8185
.for.continue.8185:
%.tmp8192 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8193 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8192, i32 0, i32 1
%.tmp8194 = load %m0$.File.type*, %m0$.File.type** %.tmp8193
%.tmp8196 = getelementptr [4 x i8], [4 x i8]*@.str8195, i32 0, i32 0
%.tmp8197 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8189
%.tmp8198 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8197, i32 0, i32 0
%.tmp8199 = load i8*, i8** %.tmp8198
%.tmp8200 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8194, i8* %.tmp8196, i8* %.tmp8199)
%.tmp8201 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %fn.8189
%.tmp8202 = getelementptr %m2503$.AnonFn.type, %m2503$.AnonFn.type* %.tmp8201, i32 0, i32 1
%.tmp8203 = load %m2503$.AnonFn.type*, %m2503$.AnonFn.type** %.tmp8202
store %m2503$.AnonFn.type* %.tmp8203, %m2503$.AnonFn.type** %fn.8189
br label %.for.start.8185
.for.end.8185:
%.tmp8204 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8205 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8204, i32 0, i32 8
store %m2503$.AnonFn.type* null, %m2503$.AnonFn.type** %.tmp8205
ret void
}
define void @m295$append_global.v.m2503$.CompilerCtx.typep.m2503$.GlobalName.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%g = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.g.arg, %m2503$.GlobalName.type** %g
%.tmp8206 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8207 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8206, i32 0, i32 3
%.tmp8208 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp8207
%.tmp8209 = icmp eq %m2503$.GlobalName.type* %.tmp8208, null
br i1 %.tmp8209, label %.if.true.8210, label %.if.false.8210
.if.true.8210:
%.tmp8211 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8212 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8211, i32 0, i32 3
%.tmp8213 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
store %m2503$.GlobalName.type* %.tmp8213, %m2503$.GlobalName.type** %.tmp8212
ret void
br label %.if.end.8210
.if.false.8210:
br label %.if.end.8210
.if.end.8210:
%.tmp8214 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8215 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8214, i32 0, i32 3
%.tmp8216 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp8215
%last_global.8217 = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.tmp8216, %m2503$.GlobalName.type** %last_global.8217
%.tmp8219 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8220 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8219, i32 0, i32 3
%.tmp8221 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp8220
%curr_global.8222 = alloca %m2503$.GlobalName.type*
store %m2503$.GlobalName.type* %.tmp8221, %m2503$.GlobalName.type** %curr_global.8222
br label %.for.start.8218
.for.start.8218:
%.tmp8223 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %curr_global.8222
%.tmp8224 = icmp ne %m2503$.GlobalName.type* %.tmp8223, null
br i1 %.tmp8224, label %.for.continue.8218, label %.for.end.8218
.for.continue.8218:
%.tmp8225 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %curr_global.8222
%.tmp8226 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8225, i32 0, i32 4
%.tmp8227 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp8226
%.tmp8228 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8227, i32 0, i32 0
%.tmp8229 = load i8*, i8** %.tmp8228
%.tmp8230 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
%.tmp8231 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8230, i32 0, i32 4
%.tmp8232 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp8231
%.tmp8233 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8232, i32 0, i32 0
%.tmp8234 = load i8*, i8** %.tmp8233
%.tmp8235 = call i32(i8*,i8*) @strcmp(i8* %.tmp8229, i8* %.tmp8234)
%.tmp8236 = icmp eq i32 %.tmp8235, 0
br i1 %.tmp8236, label %.if.true.8237, label %.if.false.8237
.if.true.8237:
ret void
br label %.if.end.8237
.if.false.8237:
br label %.if.end.8237
.if.end.8237:
%.tmp8238 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %curr_global.8222
store %m2503$.GlobalName.type* %.tmp8238, %m2503$.GlobalName.type** %last_global.8217
%.tmp8239 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %curr_global.8222
%.tmp8240 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8239, i32 0, i32 5
%.tmp8241 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %.tmp8240
store %m2503$.GlobalName.type* %.tmp8241, %m2503$.GlobalName.type** %curr_global.8222
br label %.for.start.8218
.for.end.8218:
%.tmp8242 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %last_global.8217
%.tmp8243 = getelementptr %m2503$.GlobalName.type, %m2503$.GlobalName.type* %.tmp8242, i32 0, i32 5
%.tmp8244 = load %m2503$.GlobalName.type*, %m2503$.GlobalName.type** %g
store %m2503$.GlobalName.type* %.tmp8244, %m2503$.GlobalName.type** %.tmp8243
ret void
}
define i8* @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.Type.type* %.type.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%type = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.type.arg, %m2503$.Type.type** %type
%.tmp8245 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8246 = icmp eq %m2503$.Type.type* %.tmp8245, null
br i1 %.tmp8246, label %.if.true.8247, label %.if.false.8247
.if.true.8247:
%.tmp8248 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp8248, label %.if.true.8249, label %.if.false.8249
.if.true.8249:
%.tmp8251 = getelementptr [44 x i8], [44 x i8]*@.str8250, i32 0, i32 0
%.tmp8252 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8253 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8252, i32 0, i32 7
%.tmp8254 = load i8*, i8** %.tmp8253
%.tmp8255 = call i32(i8*,...) @printf(i8* %.tmp8251, i8* %.tmp8254)
br label %.if.end.8249
.if.false.8249:
br label %.if.end.8249
.if.end.8249:
%.tmp8257 = getelementptr [2 x i8], [2 x i8]*@.str8256, i32 0, i32 0
ret i8* %.tmp8257
br label %.if.end.8247
.if.false.8247:
br label %.if.end.8247
.if.end.8247:
%.tmp8258 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8259 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8258, i32 0, i32 0
%.tmp8260 = load i8*, i8** %.tmp8259
%.tmp8261 = icmp ne i8* %.tmp8260, null
%.tmp8263 = getelementptr [59 x i8], [59 x i8]*@.str8262, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8261, i8* %.tmp8263)
%buf.8264 = alloca i8*
store i8* null, i8** %buf.8264
%.tmp8265 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8266 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8265, i32 0, i32 0
%.tmp8267 = load i8*, i8** %.tmp8266
%.tmp8269 = getelementptr [4 x i8], [4 x i8]*@.str8268, i32 0, i32 0
%.tmp8270 = call i32(i8*,i8*) @strcmp(i8* %.tmp8267, i8* %.tmp8269)
%.tmp8271 = icmp eq i32 %.tmp8270, 0
br i1 %.tmp8271, label %.if.true.8272, label %.if.false.8272
.if.true.8272:
%.tmp8274 = getelementptr [4 x i8], [4 x i8]*@.str8273, i32 0, i32 0
ret i8* %.tmp8274
br label %.if.end.8272
.if.false.8272:
%.tmp8275 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8276 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8275, i32 0, i32 0
%.tmp8277 = load i8*, i8** %.tmp8276
%.tmp8279 = getelementptr [5 x i8], [5 x i8]*@.str8278, i32 0, i32 0
%.tmp8280 = call i32(i8*,i8*) @strcmp(i8* %.tmp8277, i8* %.tmp8279)
%.tmp8281 = icmp eq i32 %.tmp8280, 0
br i1 %.tmp8281, label %.if.true.8282, label %.if.false.8282
.if.true.8282:
%.tmp8284 = getelementptr [5 x i8], [5 x i8]*@.str8283, i32 0, i32 0
ret i8* %.tmp8284
br label %.if.end.8282
.if.false.8282:
%.tmp8285 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8286 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8285, i32 0, i32 0
%.tmp8287 = load i8*, i8** %.tmp8286
%.tmp8289 = getelementptr [5 x i8], [5 x i8]*@.str8288, i32 0, i32 0
%.tmp8290 = call i32(i8*,i8*) @strcmp(i8* %.tmp8287, i8* %.tmp8289)
%.tmp8291 = icmp eq i32 %.tmp8290, 0
br i1 %.tmp8291, label %.if.true.8292, label %.if.false.8292
.if.true.8292:
%.tmp8294 = getelementptr [3 x i8], [3 x i8]*@.str8293, i32 0, i32 0
ret i8* %.tmp8294
br label %.if.end.8292
.if.false.8292:
%.tmp8295 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8296 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8295, i32 0, i32 0
%.tmp8297 = load i8*, i8** %.tmp8296
%.tmp8299 = getelementptr [8 x i8], [8 x i8]*@.str8298, i32 0, i32 0
%.tmp8300 = call i32(i8*,i8*) @strcmp(i8* %.tmp8297, i8* %.tmp8299)
%.tmp8301 = icmp eq i32 %.tmp8300, 0
br i1 %.tmp8301, label %.if.true.8302, label %.if.false.8302
.if.true.8302:
%.tmp8304 = getelementptr [4 x i8], [4 x i8]*@.str8303, i32 0, i32 0
ret i8* %.tmp8304
br label %.if.end.8302
.if.false.8302:
%.tmp8305 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8306 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8305, i32 0, i32 0
%.tmp8307 = load i8*, i8** %.tmp8306
%.tmp8309 = getelementptr [4 x i8], [4 x i8]*@.str8308, i32 0, i32 0
%.tmp8310 = call i32(i8*,i8*) @strcmp(i8* %.tmp8307, i8* %.tmp8309)
%.tmp8311 = icmp eq i32 %.tmp8310, 0
br i1 %.tmp8311, label %.if.true.8312, label %.if.false.8312
.if.true.8312:
%.tmp8314 = getelementptr [3 x i8], [3 x i8]*@.str8313, i32 0, i32 0
ret i8* %.tmp8314
br label %.if.end.8312
.if.false.8312:
%.tmp8315 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8316 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8315, i32 0, i32 0
%.tmp8317 = load i8*, i8** %.tmp8316
%.tmp8319 = getelementptr [9 x i8], [9 x i8]*@.str8318, i32 0, i32 0
%.tmp8320 = call i32(i8*,i8*) @strcmp(i8* %.tmp8317, i8* %.tmp8319)
%.tmp8321 = icmp eq i32 %.tmp8320, 0
br i1 %.tmp8321, label %.if.true.8322, label %.if.false.8322
.if.true.8322:
%.tmp8323 = getelementptr i8*, i8** %buf.8264, i32 0
%.tmp8325 = getelementptr [4 x i8], [4 x i8]*@.str8324, i32 0, i32 0
%.tmp8326 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8327 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8328 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8327, i32 0, i32 3
%.tmp8329 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8328
%.tmp8330 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp8326, %m2503$.Type.type* %.tmp8329)
%.tmp8331 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8323, i8* %.tmp8325, i8* %.tmp8330)
%.tmp8333 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8334 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8333, i32 0, i32 3
%.tmp8335 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8334
%.tmp8336 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8335, i32 0, i32 4
%.tmp8337 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8336
%p.8338 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8337, %m2503$.Type.type** %p.8338
br label %.for.start.8332
.for.start.8332:
%.tmp8339 = load %m2503$.Type.type*, %m2503$.Type.type** %p.8338
%.tmp8340 = icmp ne %m2503$.Type.type* %.tmp8339, null
br i1 %.tmp8340, label %.for.continue.8332, label %.for.end.8332
.for.continue.8332:
%.tmp8341 = load %m2503$.Type.type*, %m2503$.Type.type** %p.8338
%.tmp8342 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8343 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8342, i32 0, i32 3
%.tmp8344 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8343
%.tmp8345 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8344, i32 0, i32 4
%.tmp8346 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8345
%.tmp8347 = icmp ne %m2503$.Type.type* %.tmp8341, %.tmp8346
br i1 %.tmp8347, label %.if.true.8348, label %.if.false.8348
.if.true.8348:
%.tmp8349 = getelementptr i8*, i8** %buf.8264, i32 0
%.tmp8351 = getelementptr [4 x i8], [4 x i8]*@.str8350, i32 0, i32 0
%.tmp8352 = load i8*, i8** %buf.8264
%.tmp8353 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8349, i8* %.tmp8351, i8* %.tmp8352)
br label %.if.end.8348
.if.false.8348:
br label %.if.end.8348
.if.end.8348:
%.tmp8354 = getelementptr i8*, i8** %buf.8264, i32 0
%.tmp8356 = getelementptr [5 x i8], [5 x i8]*@.str8355, i32 0, i32 0
%.tmp8357 = load i8*, i8** %buf.8264
%.tmp8358 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8359 = load %m2503$.Type.type*, %m2503$.Type.type** %p.8338
%.tmp8360 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp8358, %m2503$.Type.type* %.tmp8359)
%.tmp8361 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8354, i8* %.tmp8356, i8* %.tmp8357, i8* %.tmp8360)
%.tmp8362 = load %m2503$.Type.type*, %m2503$.Type.type** %p.8338
%.tmp8363 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8362, i32 0, i32 4
%.tmp8364 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8363
store %m2503$.Type.type* %.tmp8364, %m2503$.Type.type** %p.8338
br label %.for.start.8332
.for.end.8332:
%.tmp8365 = getelementptr i8*, i8** %buf.8264, i32 0
%.tmp8367 = getelementptr [4 x i8], [4 x i8]*@.str8366, i32 0, i32 0
%.tmp8368 = load i8*, i8** %buf.8264
%.tmp8369 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8365, i8* %.tmp8367, i8* %.tmp8368)
%.tmp8370 = load i8*, i8** %buf.8264
ret i8* %.tmp8370
br label %.if.end.8322
.if.false.8322:
%.tmp8371 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8372 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8371, i32 0, i32 0
%.tmp8373 = load i8*, i8** %.tmp8372
%.tmp8375 = getelementptr [4 x i8], [4 x i8]*@.str8374, i32 0, i32 0
%.tmp8376 = call i32(i8*,i8*) @strcmp(i8* %.tmp8373, i8* %.tmp8375)
%.tmp8377 = icmp eq i32 %.tmp8376, 0
br i1 %.tmp8377, label %.if.true.8378, label %.if.false.8378
.if.true.8378:
%.tmp8379 = getelementptr i8*, i8** %buf.8264, i32 0
%.tmp8381 = getelementptr [4 x i8], [4 x i8]*@.str8380, i32 0, i32 0
%.tmp8382 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8383 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8384 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8383, i32 0, i32 3
%.tmp8385 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8384
%.tmp8386 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp8382, %m2503$.Type.type* %.tmp8385)
%.tmp8387 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8379, i8* %.tmp8381, i8* %.tmp8386)
%.tmp8388 = load i8*, i8** %buf.8264
ret i8* %.tmp8388
br label %.if.end.8378
.if.false.8378:
%.tmp8389 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8390 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8389, i32 0, i32 0
%.tmp8391 = load i8*, i8** %.tmp8390
%.tmp8393 = getelementptr [7 x i8], [7 x i8]*@.str8392, i32 0, i32 0
%.tmp8394 = call i32(i8*,i8*) @strcmp(i8* %.tmp8391, i8* %.tmp8393)
%.tmp8395 = icmp eq i32 %.tmp8394, 0
br i1 %.tmp8395, label %.if.true.8396, label %.if.false.8396
.if.true.8396:
%.tmp8397 = getelementptr i8*, i8** %buf.8264, i32 0
%.tmp8399 = getelementptr [2 x i8], [2 x i8]*@.str8398, i32 0, i32 0
%.tmp8400 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8397, i8* %.tmp8399)
%.tmp8402 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8403 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8402, i32 0, i32 3
%.tmp8404 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8403
%t.8405 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8404, %m2503$.Type.type** %t.8405
br label %.for.start.8401
.for.start.8401:
%.tmp8406 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8405
%.tmp8407 = icmp ne %m2503$.Type.type* %.tmp8406, null
br i1 %.tmp8407, label %.for.continue.8401, label %.for.end.8401
.for.continue.8401:
%.tmp8408 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8405
%.tmp8409 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8410 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8409, i32 0, i32 3
%.tmp8411 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8410
%.tmp8412 = icmp ne %m2503$.Type.type* %.tmp8408, %.tmp8411
br i1 %.tmp8412, label %.if.true.8413, label %.if.false.8413
.if.true.8413:
%.tmp8414 = getelementptr i8*, i8** %buf.8264, i32 0
%.tmp8416 = getelementptr [4 x i8], [4 x i8]*@.str8415, i32 0, i32 0
%.tmp8417 = load i8*, i8** %buf.8264
%.tmp8418 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8414, i8* %.tmp8416, i8* %.tmp8417)
br label %.if.end.8413
.if.false.8413:
br label %.if.end.8413
.if.end.8413:
%.tmp8419 = getelementptr i8*, i8** %buf.8264, i32 0
%.tmp8421 = getelementptr [5 x i8], [5 x i8]*@.str8420, i32 0, i32 0
%.tmp8422 = load i8*, i8** %buf.8264
%.tmp8423 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8424 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8405
%.tmp8425 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp8423, %m2503$.Type.type* %.tmp8424)
%.tmp8426 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8419, i8* %.tmp8421, i8* %.tmp8422, i8* %.tmp8425)
%.tmp8427 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8405
%.tmp8428 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8427, i32 0, i32 4
%.tmp8429 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8428
store %m2503$.Type.type* %.tmp8429, %m2503$.Type.type** %t.8405
br label %.for.start.8401
.for.end.8401:
%.tmp8430 = getelementptr i8*, i8** %buf.8264, i32 0
%.tmp8432 = getelementptr [4 x i8], [4 x i8]*@.str8431, i32 0, i32 0
%.tmp8433 = load i8*, i8** %buf.8264
%.tmp8434 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8430, i8* %.tmp8432, i8* %.tmp8433)
%.tmp8435 = load i8*, i8** %buf.8264
ret i8* %.tmp8435
br label %.if.end.8396
.if.false.8396:
%.tmp8436 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8437 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8436, i32 0, i32 0
%.tmp8438 = load i8*, i8** %.tmp8437
%.tmp8440 = getelementptr [6 x i8], [6 x i8]*@.str8439, i32 0, i32 0
%.tmp8441 = call i32(i8*,i8*) @strcmp(i8* %.tmp8438, i8* %.tmp8440)
%.tmp8442 = icmp eq i32 %.tmp8441, 0
br i1 %.tmp8442, label %.if.true.8443, label %.if.false.8443
.if.true.8443:
%.tmp8444 = getelementptr i8*, i8** %buf.8264, i32 0
%.tmp8446 = getelementptr [10 x i8], [10 x i8]*@.str8445, i32 0, i32 0
%.tmp8447 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8448 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8447, i32 0, i32 3
%.tmp8449 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8448
%.tmp8450 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8449, i32 0, i32 4
%.tmp8451 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8450
%.tmp8452 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8451, i32 0, i32 0
%.tmp8453 = load i8*, i8** %.tmp8452
%.tmp8454 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8455 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8456 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8455, i32 0, i32 3
%.tmp8457 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8456
%.tmp8458 = call i8*(%m2503$.CompilerCtx.type*,%m2503$.Type.type*) @m295$type_repr.cp.m2503$.CompilerCtx.typep.m2503$.Type.typep(%m2503$.CompilerCtx.type* %.tmp8454, %m2503$.Type.type* %.tmp8457)
%.tmp8459 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8444, i8* %.tmp8446, i8* %.tmp8453, i8* %.tmp8458)
%.tmp8460 = load i8*, i8** %buf.8264
ret i8* %.tmp8460
br label %.if.end.8443
.if.false.8443:
%.tmp8461 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8462 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8461, i32 0, i32 0
%.tmp8463 = load i8*, i8** %.tmp8462
%.tmp8465 = getelementptr [10 x i8], [10 x i8]*@.str8464, i32 0, i32 0
%.tmp8466 = call i32(i8*,i8*) @strcmp(i8* %.tmp8463, i8* %.tmp8465)
%.tmp8467 = icmp eq i32 %.tmp8466, 0
br i1 %.tmp8467, label %.if.true.8468, label %.if.false.8468
.if.true.8468:
%.tmp8469 = getelementptr i8*, i8** %buf.8264, i32 0
%.tmp8471 = getelementptr [5 x i8], [5 x i8]*@.str8470, i32 0, i32 0
%.tmp8472 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8473 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8472, i32 0, i32 2
%.tmp8474 = load i8*, i8** %.tmp8473
%.tmp8475 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8469, i8* %.tmp8471, i8* %.tmp8474)
%.tmp8476 = load i8*, i8** %buf.8264
ret i8* %.tmp8476
br label %.if.end.8468
.if.false.8468:
%.tmp8477 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8478 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8477, i32 0, i32 0
%.tmp8479 = load i8*, i8** %.tmp8478
%.tmp8481 = getelementptr [7 x i8], [7 x i8]*@.str8480, i32 0, i32 0
%.tmp8482 = call i32(i8*,i8*) @strcmp(i8* %.tmp8479, i8* %.tmp8481)
%.tmp8483 = icmp eq i32 %.tmp8482, 0
br i1 %.tmp8483, label %.if.true.8484, label %.if.false.8484
.if.true.8484:
%.tmp8486 = getelementptr [4 x i8], [4 x i8]*@.str8485, i32 0, i32 0
ret i8* %.tmp8486
br label %.if.end.8484
.if.false.8484:
%.tmp8487 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8488 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8487, i32 0, i32 0
%.tmp8489 = load i8*, i8** %.tmp8488
%.tmp8491 = getelementptr [6 x i8], [6 x i8]*@.str8490, i32 0, i32 0
%.tmp8492 = call i32(i8*,i8*) @strcmp(i8* %.tmp8489, i8* %.tmp8491)
%.tmp8493 = icmp eq i32 %.tmp8492, 0
br i1 %.tmp8493, label %.if.true.8494, label %.if.false.8494
.if.true.8494:
br label %.if.end.8494
.if.false.8494:
%.tmp8496 = getelementptr [58 x i8], [58 x i8]*@.str8495, i32 0, i32 0
%.tmp8497 = load %m2503$.Type.type*, %m2503$.Type.type** %type
%.tmp8498 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8497, i32 0, i32 0
%.tmp8499 = load i8*, i8** %.tmp8498
%.tmp8500 = call i32(i8*,...) @printf(i8* %.tmp8496, i8* %.tmp8499)
br label %.if.end.8494
.if.end.8494:
br label %.if.end.8484
.if.end.8484:
br label %.if.end.8468
.if.end.8468:
br label %.if.end.8443
.if.end.8443:
br label %.if.end.8396
.if.end.8396:
br label %.if.end.8378
.if.end.8378:
br label %.if.end.8322
.if.end.8322:
br label %.if.end.8312
.if.end.8312:
br label %.if.end.8302
.if.end.8302:
br label %.if.end.8292
.if.end.8292:
br label %.if.end.8282
.if.end.8282:
br label %.if.end.8272
.if.end.8272:
%.tmp8501 = bitcast ptr null to i8*
ret i8* %.tmp8501
}
define void @m295$append_error.v.m2503$.CompilerCtx.typep.m296$.Error.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m296$.Error.type* %.e.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp8502 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* null, i32 1
%.tmp8503 = ptrtoint %m2503$.ErrorList.type* %.tmp8502 to i32
%.tmp8504 = call i8*(i32) @malloc(i32 %.tmp8503)
%.tmp8505 = bitcast i8* %.tmp8504 to %m2503$.ErrorList.type*
%new_err.8506 = alloca %m2503$.ErrorList.type*
store %m2503$.ErrorList.type* %.tmp8505, %m2503$.ErrorList.type** %new_err.8506
%.tmp8507 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %new_err.8506
%.tmp8508 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp8507, i32 0, i32 2
store i1 0, i1* %.tmp8508
%.tmp8509 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %new_err.8506
%.tmp8510 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp8509, i32 0, i32 0
%.tmp8511 = load %m296$.Error.type*, %m296$.Error.type** %e
store %m296$.Error.type* %.tmp8511, %m296$.Error.type** %.tmp8510
%.tmp8512 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %new_err.8506
%.tmp8513 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp8512, i32 0, i32 1
store %m2503$.ErrorList.type* null, %m2503$.ErrorList.type** %.tmp8513
%.tmp8514 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8515 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8514, i32 0, i32 2
%.tmp8516 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp8515
%.tmp8517 = icmp eq %m2503$.ErrorList.type* %.tmp8516, null
br i1 %.tmp8517, label %.if.true.8518, label %.if.false.8518
.if.true.8518:
%.tmp8519 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8520 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8519, i32 0, i32 2
%.tmp8521 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %new_err.8506
store %m2503$.ErrorList.type* %.tmp8521, %m2503$.ErrorList.type** %.tmp8520
ret void
br label %.if.end.8518
.if.false.8518:
br label %.if.end.8518
.if.end.8518:
%last.8522 = alloca %m2503$.ErrorList.type*
store %m2503$.ErrorList.type* null, %m2503$.ErrorList.type** %last.8522
%.tmp8524 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8525 = getelementptr %m2503$.CompilerCtx.type, %m2503$.CompilerCtx.type* %.tmp8524, i32 0, i32 2
%.tmp8526 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp8525
store %m2503$.ErrorList.type* %.tmp8526, %m2503$.ErrorList.type** %last.8522
br label %.for.start.8523
.for.start.8523:
%.tmp8527 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %last.8522
%.tmp8528 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp8527, i32 0, i32 1
%.tmp8529 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp8528
%.tmp8530 = icmp ne %m2503$.ErrorList.type* %.tmp8529, null
br i1 %.tmp8530, label %.for.continue.8523, label %.for.end.8523
.for.continue.8523:
%.tmp8531 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %last.8522
%.tmp8532 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp8531, i32 0, i32 1
%.tmp8533 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %.tmp8532
store %m2503$.ErrorList.type* %.tmp8533, %m2503$.ErrorList.type** %last.8522
br label %.for.start.8523
.for.end.8523:
%.tmp8534 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %last.8522
%.tmp8535 = getelementptr %m2503$.ErrorList.type, %m2503$.ErrorList.type* %.tmp8534, i32 0, i32 1
%.tmp8536 = load %m2503$.ErrorList.type*, %m2503$.ErrorList.type** %new_err.8506
store %m2503$.ErrorList.type* %.tmp8536, %m2503$.ErrorList.type** %.tmp8535
ret void
}
define i8* @m295$syn_function_name.cp.m878$.Node.typep(%m878$.Node.type* %.stmt.arg) {
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp8537 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8538 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8537, i32 0, i32 6
%.tmp8539 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8538
%.tmp8540 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8539, i32 0, i32 7
%.tmp8541 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8540
%.tmp8542 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8541, i32 0, i32 1
%.tmp8543 = load i8*, i8** %.tmp8542
ret i8* %.tmp8543
}
define %m878$.Node.type* @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m878$.Node.type*
store %m878$.Node.type* %.node.arg, %m878$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp8545 = load %m878$.Node.type*, %m878$.Node.type** %node
%n.8546 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8545, %m878$.Node.type** %n.8546
br label %.for.start.8544
.for.start.8544:
%.tmp8547 = load %m878$.Node.type*, %m878$.Node.type** %n.8546
%.tmp8548 = icmp ne %m878$.Node.type* %.tmp8547, null
br i1 %.tmp8548, label %.for.continue.8544, label %.for.end.8544
.for.continue.8544:
%.tmp8549 = load %m878$.Node.type*, %m878$.Node.type** %n.8546
%.tmp8550 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8549, i32 0, i32 0
%.tmp8551 = load i8*, i8** %.tmp8550
%.tmp8552 = load i8*, i8** %type
%.tmp8553 = call i32(i8*,i8*) @strcmp(i8* %.tmp8551, i8* %.tmp8552)
%.tmp8554 = icmp eq i32 %.tmp8553, 0
br i1 %.tmp8554, label %.if.true.8555, label %.if.false.8555
.if.true.8555:
%.tmp8556 = load %m878$.Node.type*, %m878$.Node.type** %n.8546
ret %m878$.Node.type* %.tmp8556
br label %.if.end.8555
.if.false.8555:
br label %.if.end.8555
.if.end.8555:
%.tmp8557 = load %m878$.Node.type*, %m878$.Node.type** %n.8546
%.tmp8558 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8557, i32 0, i32 7
%.tmp8559 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8558
store %m878$.Node.type* %.tmp8559, %m878$.Node.type** %n.8546
br label %.for.start.8544
.for.end.8544:
%.tmp8560 = bitcast ptr null to %m878$.Node.type*
ret %m878$.Node.type* %.tmp8560
}
define %m2503$.Type.type* @m295$syn_function_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp8561 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%function_type.8562 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8561, %m2503$.Type.type** %function_type.8562
%.tmp8563 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8564 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8565 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8564, i32 0, i32 6
%.tmp8566 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8565
%.tmp8567 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8563, %m878$.Node.type* %.tmp8566)
%return_value_type.8568 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8567, %m2503$.Type.type** %return_value_type.8568
%.tmp8569 = load %m2503$.Type.type*, %m2503$.Type.type** %function_type.8562
%.tmp8570 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8569, i32 0, i32 0
%.tmp8572 = getelementptr [9 x i8], [9 x i8]*@.str8571, i32 0, i32 0
store i8* %.tmp8572, i8** %.tmp8570
%.tmp8573 = load %m2503$.Type.type*, %m2503$.Type.type** %function_type.8562
%.tmp8574 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8573, i32 0, i32 3
%.tmp8575 = load %m2503$.Type.type*, %m2503$.Type.type** %return_value_type.8568
store %m2503$.Type.type* %.tmp8575, %m2503$.Type.type** %.tmp8574
%.tmp8576 = load %m2503$.Type.type*, %m2503$.Type.type** %return_value_type.8568
%last_type.8577 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8576, %m2503$.Type.type** %last_type.8577
%.tmp8578 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8579 = call %m878$.Node.type*(%m878$.Node.type*) @m295$syn_function_params.m878$.Node.typep.m878$.Node.typep(%m878$.Node.type* %.tmp8578)
%params.8580 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8579, %m878$.Node.type** %params.8580
%.tmp8582 = load %m878$.Node.type*, %m878$.Node.type** %params.8580
%param_ptr.8583 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8582, %m878$.Node.type** %param_ptr.8583
br label %.for.start.8581
.for.start.8581:
%.tmp8584 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8583
%.tmp8585 = icmp ne %m878$.Node.type* %.tmp8584, null
br i1 %.tmp8585, label %.for.continue.8581, label %.for.end.8581
.for.continue.8581:
%.tmp8586 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8583
%.tmp8587 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8586, i32 0, i32 0
%.tmp8588 = load i8*, i8** %.tmp8587
%.tmp8590 = getelementptr [5 x i8], [5 x i8]*@.str8589, i32 0, i32 0
%.tmp8591 = call i32(i8*,i8*) @strcmp(i8* %.tmp8588, i8* %.tmp8590)
%.tmp8592 = icmp eq i32 %.tmp8591, 0
br i1 %.tmp8592, label %.if.true.8593, label %.if.false.8593
.if.true.8593:
%.tmp8594 = load %m2503$.Type.type*, %m2503$.Type.type** %last_type.8577
%.tmp8595 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8594, i32 0, i32 4
%.tmp8596 = load %m2503$.Type.type*, %m2503$.Type.type** %last_type.8577
%.tmp8597 = call %m2503$.Type.type*(%m2503$.Type.type*) @m295$type_clone.m2503$.Type.typep.m2503$.Type.typep(%m2503$.Type.type* %.tmp8596)
store %m2503$.Type.type* %.tmp8597, %m2503$.Type.type** %.tmp8595
%.tmp8598 = load %m2503$.Type.type*, %m2503$.Type.type** %last_type.8577
%.tmp8599 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8598, i32 0, i32 4
%.tmp8600 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8599
%.tmp8601 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8600, i32 0, i32 4
store %m2503$.Type.type* null, %m2503$.Type.type** %.tmp8601
%.tmp8602 = load %m2503$.Type.type*, %m2503$.Type.type** %last_type.8577
%.tmp8603 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8602, i32 0, i32 4
%.tmp8604 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8603
store %m2503$.Type.type* %.tmp8604, %m2503$.Type.type** %last_type.8577
%.tmp8605 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8583
%.tmp8606 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8605, i32 0, i32 7
%.tmp8607 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8606
%.tmp8608 = icmp ne %m878$.Node.type* %.tmp8607, null
br i1 %.tmp8608, label %.if.true.8609, label %.if.false.8609
.if.true.8609:
%.tmp8610 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8583
%.tmp8611 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8610, i32 0, i32 7
%.tmp8612 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8611
store %m878$.Node.type* %.tmp8612, %m878$.Node.type** %param_ptr.8583
br label %.if.end.8609
.if.false.8609:
br label %.if.end.8609
.if.end.8609:
%.tmp8613 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8583
%.tmp8614 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8613, i32 0, i32 7
%.tmp8615 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8614
%.tmp8616 = icmp ne %m878$.Node.type* %.tmp8615, null
br i1 %.tmp8616, label %.if.true.8617, label %.if.false.8617
.if.true.8617:
%.tmp8618 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8583
%.tmp8619 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8618, i32 0, i32 7
%.tmp8620 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8619
store %m878$.Node.type* %.tmp8620, %m878$.Node.type** %param_ptr.8583
br label %.if.end.8617
.if.false.8617:
store %m878$.Node.type* null, %m878$.Node.type** %param_ptr.8583
br label %.if.end.8617
.if.end.8617:
br label %.if.end.8593
.if.false.8593:
%.tmp8621 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8622 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8583
%.tmp8623 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8622, i32 0, i32 6
%.tmp8624 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8623
%.tmp8625 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8621, %m878$.Node.type* %.tmp8624)
%param_type.8626 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8625, %m2503$.Type.type** %param_type.8626
%.tmp8627 = load %m2503$.Type.type*, %m2503$.Type.type** %last_type.8577
%.tmp8628 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8627, i32 0, i32 4
%.tmp8629 = load %m2503$.Type.type*, %m2503$.Type.type** %param_type.8626
store %m2503$.Type.type* %.tmp8629, %m2503$.Type.type** %.tmp8628
%.tmp8630 = load %m2503$.Type.type*, %m2503$.Type.type** %param_type.8626
store %m2503$.Type.type* %.tmp8630, %m2503$.Type.type** %last_type.8577
%.tmp8631 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8583
%.tmp8632 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8631, i32 0, i32 7
%.tmp8633 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8632
store %m878$.Node.type* %.tmp8633, %m878$.Node.type** %param_ptr.8583
%.tmp8634 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8583
%.tmp8635 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8634, i32 0, i32 7
%.tmp8636 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8635
%.tmp8637 = icmp ne %m878$.Node.type* %.tmp8636, null
br i1 %.tmp8637, label %.if.true.8638, label %.if.false.8638
.if.true.8638:
%.tmp8639 = load %m878$.Node.type*, %m878$.Node.type** %param_ptr.8583
%.tmp8640 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8639, i32 0, i32 7
%.tmp8641 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8640
%.tmp8642 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8641, i32 0, i32 7
%.tmp8643 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8642
store %m878$.Node.type* %.tmp8643, %m878$.Node.type** %param_ptr.8583
br label %.if.end.8638
.if.false.8638:
store %m878$.Node.type* null, %m878$.Node.type** %param_ptr.8583
br label %.if.end.8638
.if.end.8638:
br label %.if.end.8593
.if.end.8593:
br label %.for.start.8581
.for.end.8581:
%.tmp8644 = load %m2503$.Type.type*, %m2503$.Type.type** %function_type.8562
ret %m2503$.Type.type* %.tmp8644
}
define %m878$.Node.type* @m295$syn_function_params.m878$.Node.typep.m878$.Node.typep(%m878$.Node.type* %.stmt.arg) {
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp8645 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8647 = getelementptr [10 x i8], [10 x i8]*@.str8646, i32 0, i32 0
%.tmp8648 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp8645, i8* %.tmp8647)
%params.8649 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8648, %m878$.Node.type** %params.8649
%.tmp8650 = load %m878$.Node.type*, %m878$.Node.type** %params.8649
%.tmp8651 = icmp eq %m878$.Node.type* %.tmp8650, null
br i1 %.tmp8651, label %.if.true.8652, label %.if.false.8652
.if.true.8652:
%.tmp8653 = bitcast ptr null to %m878$.Node.type*
ret %m878$.Node.type* %.tmp8653
br label %.if.end.8652
.if.false.8652:
br label %.if.end.8652
.if.end.8652:
%.tmp8654 = load %m878$.Node.type*, %m878$.Node.type** %params.8649
%.tmp8655 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8654, i32 0, i32 6
%.tmp8656 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8655
ret %m878$.Node.type* %.tmp8656
}
define %m2503$.Type.type* @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.ctx.arg, %m878$.Node.type* %.stmt.arg) {
%ctx = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.ctx.arg, %m2503$.CompilerCtx.type** %ctx
%stmt = alloca %m878$.Node.type*
store %m878$.Node.type* %.stmt.arg, %m878$.Node.type** %stmt
%.tmp8657 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8658 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8657, i32 0, i32 0
%.tmp8659 = load i8*, i8** %.tmp8658
%.tmp8661 = getelementptr [11 x i8], [11 x i8]*@.str8660, i32 0, i32 0
%.tmp8662 = call i32(i8*,i8*) @strcmp(i8* %.tmp8659, i8* %.tmp8661)
%.tmp8663 = icmp eq i32 %.tmp8662, 0
br i1 %.tmp8663, label %.if.true.8664, label %.if.false.8664
.if.true.8664:
%.tmp8665 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8666 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8667 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8666, i32 0, i32 6
%.tmp8668 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8667
%.tmp8669 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8665, %m878$.Node.type* %.tmp8668)
%t.8670 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8669, %m2503$.Type.type** %t.8670
%.tmp8671 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8672 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8671, i32 0, i32 7
%.tmp8673 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8672
%.tmp8674 = icmp ne %m878$.Node.type* %.tmp8673, null
br i1 %.tmp8674, label %.if.true.8675, label %.if.false.8675
.if.true.8675:
%.tmp8676 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8677 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8676, i32 0, i32 7
%.tmp8678 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8677
%.tmp8679 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8678, i32 0, i32 0
%.tmp8680 = load i8*, i8** %.tmp8679
%.tmp8682 = getelementptr [13 x i8], [13 x i8]*@.str8681, i32 0, i32 0
%.tmp8683 = call i32(i8*,i8*) @strcmp(i8* %.tmp8680, i8* %.tmp8682)
%.tmp8684 = icmp eq i32 %.tmp8683, 0
br i1 %.tmp8684, label %.if.true.8685, label %.if.false.8685
.if.true.8685:
%.tmp8686 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%fn_type.8687 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8686, %m2503$.Type.type** %fn_type.8687
%.tmp8688 = load %m2503$.Type.type*, %m2503$.Type.type** %fn_type.8687
%.tmp8689 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8688, i32 0, i32 0
%.tmp8691 = getelementptr [9 x i8], [9 x i8]*@.str8690, i32 0, i32 0
store i8* %.tmp8691, i8** %.tmp8689
%.tmp8692 = load %m2503$.Type.type*, %m2503$.Type.type** %fn_type.8687
%.tmp8693 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8692, i32 0, i32 3
%.tmp8694 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8670
store %m2503$.Type.type* %.tmp8694, %m2503$.Type.type** %.tmp8693
%.tmp8695 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8696 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8695, i32 0, i32 7
%.tmp8697 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8696
%.tmp8698 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8697, i32 0, i32 6
%.tmp8699 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8698
%.tmp8700 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8699, i32 0, i32 7
%.tmp8701 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8700
%fst_operator.8702 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8701, %m878$.Node.type** %fst_operator.8702
%.tmp8703 = load %m878$.Node.type*, %m878$.Node.type** %fst_operator.8702
%.tmp8704 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8703, i32 0, i32 0
%.tmp8705 = load i8*, i8** %.tmp8704
%.tmp8707 = getelementptr [15 x i8], [15 x i8]*@.str8706, i32 0, i32 0
%.tmp8708 = call i32(i8*,i8*) @strcmp(i8* %.tmp8705, i8* %.tmp8707)
%.tmp8709 = icmp eq i32 %.tmp8708, 0
br i1 %.tmp8709, label %.if.true.8710, label %.if.false.8710
.if.true.8710:
%.tmp8711 = load %m2503$.Type.type*, %m2503$.Type.type** %fn_type.8687
%.tmp8712 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8711, i32 0, i32 3
%.tmp8713 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8712
%last_fn_value.8714 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8713, %m2503$.Type.type** %last_fn_value.8714
%.tmp8716 = load %m878$.Node.type*, %m878$.Node.type** %fst_operator.8702
%.tmp8717 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8716, i32 0, i32 6
%.tmp8718 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8717
%t.8719 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8718, %m878$.Node.type** %t.8719
br label %.for.start.8715
.for.start.8715:
%.tmp8720 = load %m878$.Node.type*, %m878$.Node.type** %t.8719
%.tmp8721 = icmp ne %m878$.Node.type* %.tmp8720, null
br i1 %.tmp8721, label %.for.continue.8715, label %.for.end.8715
.for.continue.8715:
%.tmp8722 = load %m2503$.Type.type*, %m2503$.Type.type** %last_fn_value.8714
%.tmp8723 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8722, i32 0, i32 4
%.tmp8724 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8725 = load %m878$.Node.type*, %m878$.Node.type** %t.8719
%.tmp8726 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8725, i32 0, i32 6
%.tmp8727 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8726
%.tmp8728 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8724, %m878$.Node.type* %.tmp8727)
store %m2503$.Type.type* %.tmp8728, %m2503$.Type.type** %.tmp8723
%.tmp8729 = load %m2503$.Type.type*, %m2503$.Type.type** %last_fn_value.8714
%.tmp8730 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8729, i32 0, i32 4
%.tmp8731 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8730
store %m2503$.Type.type* %.tmp8731, %m2503$.Type.type** %last_fn_value.8714
%.tmp8732 = load %m878$.Node.type*, %m878$.Node.type** %t.8719
%.tmp8733 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8732, i32 0, i32 7
%.tmp8734 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8733
%.tmp8735 = icmp ne %m878$.Node.type* %.tmp8734, null
br i1 %.tmp8735, label %.if.true.8736, label %.if.false.8736
.if.true.8736:
%.tmp8737 = load %m878$.Node.type*, %m878$.Node.type** %t.8719
%.tmp8738 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8737, i32 0, i32 7
%.tmp8739 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8738
store %m878$.Node.type* %.tmp8739, %m878$.Node.type** %t.8719
br label %.if.end.8736
.if.false.8736:
br label %.if.end.8736
.if.end.8736:
%.tmp8740 = load %m878$.Node.type*, %m878$.Node.type** %t.8719
%.tmp8741 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8740, i32 0, i32 7
%.tmp8742 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8741
store %m878$.Node.type* %.tmp8742, %m878$.Node.type** %t.8719
br label %.for.start.8715
.for.end.8715:
br label %.if.end.8710
.if.false.8710:
br label %.if.end.8710
.if.end.8710:
%.tmp8743 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%t_ptr.8744 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8743, %m2503$.Type.type** %t_ptr.8744
%.tmp8745 = load %m2503$.Type.type*, %m2503$.Type.type** %t_ptr.8744
%.tmp8746 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8745, i32 0, i32 0
%.tmp8748 = getelementptr [4 x i8], [4 x i8]*@.str8747, i32 0, i32 0
store i8* %.tmp8748, i8** %.tmp8746
%.tmp8749 = load %m2503$.Type.type*, %m2503$.Type.type** %t_ptr.8744
%.tmp8750 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8749, i32 0, i32 3
%.tmp8751 = load %m2503$.Type.type*, %m2503$.Type.type** %fn_type.8687
store %m2503$.Type.type* %.tmp8751, %m2503$.Type.type** %.tmp8750
%.tmp8752 = load %m2503$.Type.type*, %m2503$.Type.type** %t_ptr.8744
store %m2503$.Type.type* %.tmp8752, %m2503$.Type.type** %t.8670
br label %.if.end.8685
.if.false.8685:
br label %.if.end.8685
.if.end.8685:
br label %.if.end.8675
.if.false.8675:
br label %.if.end.8675
.if.end.8675:
%.tmp8753 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8670
ret %m2503$.Type.type* %.tmp8753
br label %.if.end.8664
.if.false.8664:
br label %.if.end.8664
.if.end.8664:
%.tmp8754 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%t.8755 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8754, %m2503$.Type.type** %t.8755
%.tmp8756 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8757 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8756, i32 0, i32 0
%.tmp8758 = load i8*, i8** %.tmp8757
%.tmp8760 = getelementptr [10 x i8], [10 x i8]*@.str8759, i32 0, i32 0
%.tmp8761 = call i32(i8*,i8*) @strcmp(i8* %.tmp8758, i8* %.tmp8760)
%.tmp8762 = icmp eq i32 %.tmp8761, 0
br i1 %.tmp8762, label %.if.true.8763, label %.if.false.8763
.if.true.8763:
%.tmp8764 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8765 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8764, i32 0, i32 0
%.tmp8767 = getelementptr [7 x i8], [7 x i8]*@.str8766, i32 0, i32 0
store i8* %.tmp8767, i8** %.tmp8765
%.tmp8768 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8769 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8768, i32 0, i32 1
store i8* null, i8** %.tmp8769
%.tmp8770 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8771 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8770, i32 0, i32 6
%.tmp8772 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8771
%.tmp8774 = getelementptr [5 x i8], [5 x i8]*@.str8773, i32 0, i32 0
%.tmp8775 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp8772, i8* %.tmp8774)
%curr_type.8776 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8775, %m878$.Node.type** %curr_type.8776
%.tmp8777 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8776
%.tmp8778 = icmp ne %m878$.Node.type* %.tmp8777, null
br i1 %.tmp8778, label %.if.true.8779, label %.if.false.8779
.if.true.8779:
%.tmp8780 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8781 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8780, i32 0, i32 3
%.tmp8782 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8783 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8776
%.tmp8784 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8783, i32 0, i32 6
%.tmp8785 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8784
%.tmp8786 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8782, %m878$.Node.type* %.tmp8785)
store %m2503$.Type.type* %.tmp8786, %m2503$.Type.type** %.tmp8781
%.tmp8787 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8788 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8787, i32 0, i32 3
%.tmp8789 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8788
%.tmp8790 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8789, i32 0, i32 1
%.tmp8791 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8776
%.tmp8792 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8791, i32 0, i32 7
%.tmp8793 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8792
%.tmp8794 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8793, i32 0, i32 1
%.tmp8795 = load i8*, i8** %.tmp8794
store i8* %.tmp8795, i8** %.tmp8790
%.tmp8796 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8797 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8796, i32 0, i32 3
%.tmp8798 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8797
%curr_t.8799 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8798, %m2503$.Type.type** %curr_t.8799
%.tmp8801 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8776
%.tmp8802 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8801, i32 0, i32 7
%.tmp8803 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8802
%.tmp8805 = getelementptr [5 x i8], [5 x i8]*@.str8804, i32 0, i32 0
%.tmp8806 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp8803, i8* %.tmp8805)
store %m878$.Node.type* %.tmp8806, %m878$.Node.type** %curr_type.8776
br label %.for.start.8800
.for.start.8800:
%.tmp8807 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8776
%.tmp8808 = icmp ne %m878$.Node.type* %.tmp8807, null
br i1 %.tmp8808, label %.for.continue.8800, label %.for.end.8800
.for.continue.8800:
%.tmp8809 = load %m2503$.Type.type*, %m2503$.Type.type** %curr_t.8799
%.tmp8810 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8809, i32 0, i32 4
%.tmp8811 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8812 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8776
%.tmp8813 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8812, i32 0, i32 6
%.tmp8814 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8813
%.tmp8815 = call %m2503$.Type.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$node_to_type.m2503$.Type.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8811, %m878$.Node.type* %.tmp8814)
store %m2503$.Type.type* %.tmp8815, %m2503$.Type.type** %.tmp8810
%.tmp8816 = load %m2503$.Type.type*, %m2503$.Type.type** %curr_t.8799
%.tmp8817 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8816, i32 0, i32 4
%.tmp8818 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8817
%.tmp8819 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8818, i32 0, i32 1
%.tmp8820 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8776
%.tmp8821 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8820, i32 0, i32 7
%.tmp8822 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8821
%.tmp8823 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8822, i32 0, i32 1
%.tmp8824 = load i8*, i8** %.tmp8823
store i8* %.tmp8824, i8** %.tmp8819
%.tmp8825 = load %m2503$.Type.type*, %m2503$.Type.type** %curr_t.8799
%.tmp8826 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8825, i32 0, i32 4
%.tmp8827 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8826
store %m2503$.Type.type* %.tmp8827, %m2503$.Type.type** %curr_t.8799
%.tmp8828 = load %m878$.Node.type*, %m878$.Node.type** %curr_type.8776
%.tmp8829 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8828, i32 0, i32 7
%.tmp8830 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8829
%.tmp8832 = getelementptr [5 x i8], [5 x i8]*@.str8831, i32 0, i32 0
%.tmp8833 = call %m878$.Node.type*(%m878$.Node.type*,i8*) @m295$skip_to_type.m878$.Node.typep.m878$.Node.typep.cp(%m878$.Node.type* %.tmp8830, i8* %.tmp8832)
store %m878$.Node.type* %.tmp8833, %m878$.Node.type** %curr_type.8776
br label %.for.start.8800
.for.end.8800:
br label %.if.end.8779
.if.false.8779:
br label %.if.end.8779
.if.end.8779:
br label %.if.end.8763
.if.false.8763:
%.tmp8834 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8835 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8834, i32 0, i32 0
%.tmp8836 = load i8*, i8** %.tmp8835
%.tmp8838 = getelementptr [12 x i8], [12 x i8]*@.str8837, i32 0, i32 0
%.tmp8839 = call i32(i8*,i8*) @strcmp(i8* %.tmp8836, i8* %.tmp8838)
%.tmp8840 = icmp eq i32 %.tmp8839, 0
br i1 %.tmp8840, label %.if.true.8841, label %.if.false.8841
.if.true.8841:
%err_msg.8842 = alloca i8*
store i8* null, i8** %err_msg.8842
%.tmp8843 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8844 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8845 = call %m2503$.ScopeItem.type*(%m2503$.CompilerCtx.type*,%m878$.Node.type*) @m295$find_defined.m2503$.ScopeItem.typep.m2503$.CompilerCtx.typep.m878$.Node.typep(%m2503$.CompilerCtx.type* %.tmp8843, %m878$.Node.type* %.tmp8844)
%base.8846 = alloca %m2503$.ScopeItem.type*
store %m2503$.ScopeItem.type* %.tmp8845, %m2503$.ScopeItem.type** %base.8846
%.tmp8847 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %base.8846
%.tmp8848 = icmp eq %m2503$.ScopeItem.type* %.tmp8847, null
br i1 %.tmp8848, label %.if.true.8849, label %.if.false.8849
.if.true.8849:
%.tmp8850 = getelementptr i8*, i8** %err_msg.8842, i32 0
%.tmp8852 = getelementptr [37 x i8], [37 x i8]*@.str8851, i32 0, i32 0
%.tmp8853 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8854 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8853, i32 0, i32 6
%.tmp8855 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8854
%.tmp8856 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8855, i32 0, i32 1
%.tmp8857 = load i8*, i8** %.tmp8856
%.tmp8858 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8850, i8* %.tmp8852, i8* %.tmp8857)
%.tmp8859 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8860 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8861 = load i8*, i8** %err_msg.8842
call void(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$new_error.v.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp8859, %m878$.Node.type* %.tmp8860, i8* %.tmp8861)
%.tmp8862 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8863 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8862, i32 0, i32 0
%.tmp8865 = getelementptr [6 x i8], [6 x i8]*@.str8864, i32 0, i32 0
store i8* %.tmp8865, i8** %.tmp8863
%.tmp8866 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
ret %m2503$.Type.type* %.tmp8866
br label %.if.end.8849
.if.false.8849:
br label %.if.end.8849
.if.end.8849:
%.tmp8867 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8868 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8867, i32 0, i32 0
%.tmp8870 = getelementptr [10 x i8], [10 x i8]*@.str8869, i32 0, i32 0
store i8* %.tmp8870, i8** %.tmp8868
%.tmp8871 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8872 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8871, i32 0, i32 1
%.tmp8873 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %base.8846
%.tmp8874 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp8873, i32 0, i32 0
%.tmp8875 = load i8*, i8** %.tmp8874
store i8* %.tmp8875, i8** %.tmp8872
%.tmp8876 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8877 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8876, i32 0, i32 2
%.tmp8878 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %base.8846
%.tmp8879 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp8878, i32 0, i32 1
%.tmp8880 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp8879
%.tmp8881 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8880, i32 0, i32 0
%.tmp8882 = load i8*, i8** %.tmp8881
store i8* %.tmp8882, i8** %.tmp8877
%.tmp8883 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8884 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8883, i32 0, i32 3
%.tmp8885 = load %m2503$.ScopeItem.type*, %m2503$.ScopeItem.type** %base.8846
%.tmp8886 = getelementptr %m2503$.ScopeItem.type, %m2503$.ScopeItem.type* %.tmp8885, i32 0, i32 1
%.tmp8887 = load %m2503$.AssignableInfo.type*, %m2503$.AssignableInfo.type** %.tmp8886
%.tmp8888 = getelementptr %m2503$.AssignableInfo.type, %m2503$.AssignableInfo.type* %.tmp8887, i32 0, i32 4
%.tmp8889 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8888
store %m2503$.Type.type* %.tmp8889, %m2503$.Type.type** %.tmp8884
br label %.if.end.8841
.if.false.8841:
%.tmp8890 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8891 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8890, i32 0, i32 1
%.tmp8892 = load i8*, i8** %.tmp8891
%.tmp8894 = getelementptr [4 x i8], [4 x i8]*@.str8893, i32 0, i32 0
%.tmp8895 = call i32(i8*,i8*) @strcmp(i8* %.tmp8892, i8* %.tmp8894)
%.tmp8896 = icmp eq i32 %.tmp8895, 0
br i1 %.tmp8896, label %.if.true.8897, label %.if.false.8897
.if.true.8897:
%.tmp8898 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8899 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8898, i32 0, i32 0
%.tmp8901 = getelementptr [4 x i8], [4 x i8]*@.str8900, i32 0, i32 0
store i8* %.tmp8901, i8** %.tmp8899
%.tmp8902 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8903 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8902, i32 0, i32 3
%.tmp8904 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
store %m2503$.Type.type* %.tmp8904, %m2503$.Type.type** %.tmp8903
%.tmp8905 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8906 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8905, i32 0, i32 3
%.tmp8907 = load %m2503$.Type.type*, %m2503$.Type.type** %.tmp8906
%.tmp8908 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8907, i32 0, i32 0
%.tmp8910 = getelementptr [4 x i8], [4 x i8]*@.str8909, i32 0, i32 0
store i8* %.tmp8910, i8** %.tmp8908
br label %.if.end.8897
.if.false.8897:
%.tmp8911 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8912 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8911, i32 0, i32 0
%.tmp8913 = load i8*, i8** %.tmp8912
%.tmp8915 = getelementptr [5 x i8], [5 x i8]*@.str8914, i32 0, i32 0
%.tmp8916 = call i32(i8*,i8*) @strcmp(i8* %.tmp8913, i8* %.tmp8915)
%.tmp8917 = icmp eq i32 %.tmp8916, 0
br i1 %.tmp8917, label %.if.true.8918, label %.if.false.8918
.if.true.8918:
%.tmp8919 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8920 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8919, i32 0, i32 0
%.tmp8921 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8922 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8921, i32 0, i32 1
%.tmp8923 = load i8*, i8** %.tmp8922
store i8* %.tmp8923, i8** %.tmp8920
br label %.if.end.8918
.if.false.8918:
%.tmp8924 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8925 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8924, i32 0, i32 1
%.tmp8926 = load i8*, i8** %.tmp8925
%.tmp8928 = getelementptr [4 x i8], [4 x i8]*@.str8927, i32 0, i32 0
%.tmp8929 = call i32(i8*,i8*) @strcmp(i8* %.tmp8926, i8* %.tmp8928)
%.tmp8930 = icmp eq i32 %.tmp8929, 0
br i1 %.tmp8930, label %.if.true.8931, label %.if.false.8931
.if.true.8931:
%.tmp8932 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
%.tmp8933 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8932, i32 0, i32 0
%.tmp8935 = getelementptr [7 x i8], [7 x i8]*@.str8934, i32 0, i32 0
store i8* %.tmp8935, i8** %.tmp8933
br label %.if.end.8931
.if.false.8931:
%.tmp8936 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp8937 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8939 = getelementptr [54 x i8], [54 x i8]*@.str8938, i32 0, i32 0
%.tmp8940 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp8936, %m878$.Node.type* %.tmp8937, i8* %.tmp8939)
%.tmp8941 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8942 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8941, i32 0, i32 0
%.tmp8943 = load i8*, i8** %.tmp8942
%.tmp8944 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8945 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8944, i32 0, i32 1
%.tmp8946 = load i8*, i8** %.tmp8945
%.tmp8947 = call i32(i8*,...) @printf(i8* %.tmp8940, i8* %.tmp8943, i8* %.tmp8946)
%.tmp8948 = bitcast ptr null to %m2503$.Type.type*
ret %m2503$.Type.type* %.tmp8948
br label %.if.end.8931
.if.end.8931:
br label %.if.end.8918
.if.end.8918:
br label %.if.end.8897
.if.end.8897:
br label %.if.end.8841
.if.end.8841:
br label %.if.end.8763
.if.end.8763:
%.tmp8950 = load %m878$.Node.type*, %m878$.Node.type** %stmt
%.tmp8951 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8950, i32 0, i32 7
%.tmp8952 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8951
%ptr.8953 = alloca %m878$.Node.type*
store %m878$.Node.type* %.tmp8952, %m878$.Node.type** %ptr.8953
br label %.for.start.8949
.for.start.8949:
%.tmp8954 = load %m878$.Node.type*, %m878$.Node.type** %ptr.8953
%.tmp8955 = icmp ne %m878$.Node.type* %.tmp8954, null
br i1 %.tmp8955, label %.for.continue.8949, label %.for.end.8949
.for.continue.8949:
%.tmp8956 = load %m878$.Node.type*, %m878$.Node.type** %ptr.8953
%.tmp8957 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8956, i32 0, i32 1
%.tmp8958 = load i8*, i8** %.tmp8957
%.tmp8960 = getelementptr [2 x i8], [2 x i8]*@.str8959, i32 0, i32 0
%.tmp8961 = call i32(i8*,i8*) @strcmp(i8* %.tmp8958, i8* %.tmp8960)
%.tmp8962 = icmp eq i32 %.tmp8961, 0
br i1 %.tmp8962, label %.if.true.8963, label %.if.false.8963
.if.true.8963:
%.tmp8964 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%pt.8965 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8964, %m2503$.Type.type** %pt.8965
%.tmp8966 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.8965
%.tmp8967 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8966, i32 0, i32 0
%.tmp8969 = getelementptr [4 x i8], [4 x i8]*@.str8968, i32 0, i32 0
store i8* %.tmp8969, i8** %.tmp8967
%.tmp8970 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.8965
%.tmp8971 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8970, i32 0, i32 3
%.tmp8972 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
store %m2503$.Type.type* %.tmp8972, %m2503$.Type.type** %.tmp8971
%.tmp8973 = load %m2503$.Type.type*, %m2503$.Type.type** %pt.8965
store %m2503$.Type.type* %.tmp8973, %m2503$.Type.type** %t.8755
br label %.if.end.8963
.if.false.8963:
%.tmp8974 = load %m878$.Node.type*, %m878$.Node.type** %ptr.8953
%.tmp8975 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8974, i32 0, i32 1
%.tmp8976 = load i8*, i8** %.tmp8975
%.tmp8978 = getelementptr [2 x i8], [2 x i8]*@.str8977, i32 0, i32 0
%.tmp8979 = call i32(i8*,i8*) @strcmp(i8* %.tmp8976, i8* %.tmp8978)
%.tmp8980 = icmp eq i32 %.tmp8979, 0
br i1 %.tmp8980, label %.if.true.8981, label %.if.false.8981
.if.true.8981:
%.tmp8982 = load %m878$.Node.type*, %m878$.Node.type** %ptr.8953
%.tmp8983 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8982, i32 0, i32 7
%.tmp8984 = load %m878$.Node.type*, %m878$.Node.type** %.tmp8983
%.tmp8985 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp8984, i32 0, i32 1
%.tmp8986 = load i8*, i8** %.tmp8985
%.tmp8988 = getelementptr [2 x i8], [2 x i8]*@.str8987, i32 0, i32 0
%.tmp8989 = call i32(i8*,i8*) @strcmp(i8* %.tmp8986, i8* %.tmp8988)
%.tmp8990 = icmp eq i32 %.tmp8989, 0
br i1 %.tmp8990, label %.if.true.8991, label %.if.false.8991
.if.true.8991:
%.tmp8992 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%slice_type.8993 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp8992, %m2503$.Type.type** %slice_type.8993
%.tmp8994 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_type.8993
%.tmp8995 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8994, i32 0, i32 0
%.tmp8997 = getelementptr [7 x i8], [7 x i8]*@.str8996, i32 0, i32 0
store i8* %.tmp8997, i8** %.tmp8995
%.tmp8998 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_type.8993
%.tmp8999 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp8998, i32 0, i32 1
%.tmp9001 = getelementptr [6 x i8], [6 x i8]*@.str9000, i32 0, i32 0
store i8* %.tmp9001, i8** %.tmp8999
%.tmp9002 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%slice_c_array.9003 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp9002, %m2503$.Type.type** %slice_c_array.9003
%.tmp9004 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_c_array.9003
%.tmp9005 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9004, i32 0, i32 0
%.tmp9007 = getelementptr [4 x i8], [4 x i8]*@.str9006, i32 0, i32 0
store i8* %.tmp9007, i8** %.tmp9005
%.tmp9008 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_c_array.9003
%.tmp9009 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9008, i32 0, i32 1
%.tmp9011 = getelementptr [6 x i8], [6 x i8]*@.str9010, i32 0, i32 0
store i8* %.tmp9011, i8** %.tmp9009
%.tmp9012 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_c_array.9003
%.tmp9013 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9012, i32 0, i32 3
%.tmp9014 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
store %m2503$.Type.type* %.tmp9014, %m2503$.Type.type** %.tmp9013
%.tmp9015 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_type.8993
%.tmp9016 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9015, i32 0, i32 3
%.tmp9017 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_c_array.9003
store %m2503$.Type.type* %.tmp9017, %m2503$.Type.type** %.tmp9016
%.tmp9018 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%slice_len.9019 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp9018, %m2503$.Type.type** %slice_len.9019
%.tmp9020 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_len.9019
%.tmp9021 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9020, i32 0, i32 0
%.tmp9023 = getelementptr [4 x i8], [4 x i8]*@.str9022, i32 0, i32 0
store i8* %.tmp9023, i8** %.tmp9021
%.tmp9024 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_len.9019
%.tmp9025 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9024, i32 0, i32 1
%.tmp9027 = getelementptr [4 x i8], [4 x i8]*@.str9026, i32 0, i32 0
store i8* %.tmp9027, i8** %.tmp9025
%.tmp9028 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_c_array.9003
%.tmp9029 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9028, i32 0, i32 4
%.tmp9030 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_len.9019
store %m2503$.Type.type* %.tmp9030, %m2503$.Type.type** %.tmp9029
%.tmp9031 = call %m2503$.Type.type*() @m295$new_type.m2503$.Type.typep()
%slice_cap.9032 = alloca %m2503$.Type.type*
store %m2503$.Type.type* %.tmp9031, %m2503$.Type.type** %slice_cap.9032
%.tmp9033 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_cap.9032
%.tmp9034 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9033, i32 0, i32 0
%.tmp9036 = getelementptr [4 x i8], [4 x i8]*@.str9035, i32 0, i32 0
store i8* %.tmp9036, i8** %.tmp9034
%.tmp9037 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_cap.9032
%.tmp9038 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9037, i32 0, i32 1
%.tmp9040 = getelementptr [4 x i8], [4 x i8]*@.str9039, i32 0, i32 0
store i8* %.tmp9040, i8** %.tmp9038
%.tmp9041 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_len.9019
%.tmp9042 = getelementptr %m2503$.Type.type, %m2503$.Type.type* %.tmp9041, i32 0, i32 4
%.tmp9043 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_cap.9032
store %m2503$.Type.type* %.tmp9043, %m2503$.Type.type** %.tmp9042
%.tmp9044 = load %m2503$.Type.type*, %m2503$.Type.type** %slice_type.8993
store %m2503$.Type.type* %.tmp9044, %m2503$.Type.type** %t.8755
%.tmp9045 = load %m878$.Node.type*, %m878$.Node.type** %ptr.8953
%.tmp9046 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp9045, i32 0, i32 7
%.tmp9047 = load %m878$.Node.type*, %m878$.Node.type** %.tmp9046
store %m878$.Node.type* %.tmp9047, %m878$.Node.type** %ptr.8953
br label %.if.end.8991
.if.false.8991:
br label %.if.end.8991
.if.end.8991:
br label %.if.end.8981
.if.false.8981:
%.tmp9048 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %ctx
%.tmp9049 = load %m878$.Node.type*, %m878$.Node.type** %ptr.8953
%.tmp9051 = getelementptr [49 x i8], [49 x i8]*@.str9050, i32 0, i32 0
%.tmp9052 = call i8*(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$err_tmpl.cp.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp9048, %m878$.Node.type* %.tmp9049, i8* %.tmp9051)
%.tmp9053 = load %m878$.Node.type*, %m878$.Node.type** %ptr.8953
%.tmp9054 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp9053, i32 0, i32 1
%.tmp9055 = load i8*, i8** %.tmp9054
%.tmp9056 = call i32(i8*,...) @printf(i8* %.tmp9052, i8* %.tmp9055)
%.tmp9057 = bitcast ptr null to %m2503$.Type.type*
ret %m2503$.Type.type* %.tmp9057
br label %.if.end.8981
.if.end.8981:
br label %.if.end.8963
.if.end.8963:
%.tmp9058 = load %m878$.Node.type*, %m878$.Node.type** %ptr.8953
%.tmp9059 = getelementptr %m878$.Node.type, %m878$.Node.type* %.tmp9058, i32 0, i32 7
%.tmp9060 = load %m878$.Node.type*, %m878$.Node.type** %.tmp9059
store %m878$.Node.type* %.tmp9060, %m878$.Node.type** %ptr.8953
br label %.for.start.8949
.for.end.8949:
%.tmp9061 = load %m2503$.Type.type*, %m2503$.Type.type** %t.8755
ret %m2503$.Type.type* %.tmp9061
}
define i1 @compile_file.b.cp.cp(i8* %.filename.arg, i8* %.outname.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%outname = alloca i8*
store i8* %.outname.arg, i8** %outname
%.tmp9062 = load i32, i32* @STDERR
%.tmp9064 = getelementptr [2 x i8], [2 x i8]*@.str9063, i32 0, i32 0
%.tmp9065 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp9062, i8* %.tmp9064)
%stderr.9066 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9065, %m0$.File.type** %stderr.9066
%.tmp9067 = call %m0$.File.type*() @tmpfile()
%llvm_code.9068 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9067, %m0$.File.type** %llvm_code.9068
%.tmp9069 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9068
%.tmp9070 = load i8*, i8** %filename
%.tmp9071 = call %m2503$.CompilerCtx.type*(%m0$.File.type*,i8*) @m295$new_context.m2503$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp9069, i8* %.tmp9070)
%compiler_ctx.9072 = alloca %m2503$.CompilerCtx.type*
store %m2503$.CompilerCtx.type* %.tmp9071, %m2503$.CompilerCtx.type** %compiler_ctx.9072
%.tmp9073 = load %m2503$.CompilerCtx.type*, %m2503$.CompilerCtx.type** %compiler_ctx.9072
%.tmp9074 = bitcast ptr null to %m878$.Node.type*
%.tmp9075 = load i8*, i8** %filename
%.tmp9076 = call i1(%m2503$.CompilerCtx.type*,%m878$.Node.type*,i8*) @m295$compile_file.b.m2503$.CompilerCtx.typep.m878$.Node.typep.cp(%m2503$.CompilerCtx.type* %.tmp9073, %m878$.Node.type* %.tmp9074, i8* %.tmp9075)
br i1 %.tmp9076, label %.if.true.9077, label %.if.false.9077
.if.true.9077:
%.tmp9078 = load %m0$.File.type*, %m0$.File.type** %stderr.9066
%.tmp9080 = getelementptr [34 x i8], [34 x i8]*@.str9079, i32 0, i32 0
%.tmp9081 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9078, i8* %.tmp9080)
ret i1 0
br label %.if.end.9077
.if.false.9077:
br label %.if.end.9077
.if.end.9077:
%.tmp9082 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9068
%.tmp9083 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp9082)
%.tmp9084 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9068
%.tmp9085 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp9084)
%llvm_code_size.9086 = alloca i32
store i32 %.tmp9085, i32* %llvm_code_size.9086
%.tmp9087 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9068
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp9087)
%.tmp9089 = getelementptr [1 x i8], [1 x i8]*@.str9088, i32 0, i32 0
%cmd.9090 = alloca i8*
store i8* %.tmp9089, i8** %cmd.9090
%.tmp9091 = getelementptr i8*, i8** %cmd.9090, i32 0
%.tmp9093 = getelementptr [32 x i8], [32 x i8]*@.str9092, i32 0, i32 0
%.tmp9094 = load i8*, i8** %outname
%.tmp9095 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9091, i8* %.tmp9093, i8* %.tmp9094)
%.tmp9096 = load i8*, i8** %cmd.9090
%.tmp9098 = getelementptr [2 x i8], [2 x i8]*@.str9097, i32 0, i32 0
%.tmp9099 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9096, i8* %.tmp9098)
%proc.9100 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9099, %m0$.File.type** %proc.9100
%.tmp9101 = load %m0$.File.type*, %m0$.File.type** %proc.9100
%.tmp9102 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9101)
%.tmp9103 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9068
%.tmp9104 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9103)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp9102, i32 %.tmp9104)
%.tmp9105 = load %m0$.File.type*, %m0$.File.type** %proc.9100
%.tmp9106 = icmp eq %m0$.File.type* %.tmp9105, null
br i1 %.tmp9106, label %.if.true.9107, label %.if.false.9107
.if.true.9107:
%.tmp9108 = load %m0$.File.type*, %m0$.File.type** %stderr.9066
%.tmp9110 = getelementptr [28 x i8], [28 x i8]*@.str9109, i32 0, i32 0
%.tmp9111 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9108, i8* %.tmp9110)
ret i1 0
br label %.if.end.9107
.if.false.9107:
br label %.if.end.9107
.if.end.9107:
%.tmp9112 = load %m0$.File.type*, %m0$.File.type** %proc.9100
%.tmp9113 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9112)
%.tmp9114 = icmp ne i32 %.tmp9113, 0
br i1 %.tmp9114, label %.if.true.9115, label %.if.false.9115
.if.true.9115:
%.tmp9116 = load %m0$.File.type*, %m0$.File.type** %stderr.9066
%.tmp9118 = getelementptr [24 x i8], [24 x i8]*@.str9117, i32 0, i32 0
%.tmp9119 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9116, i8* %.tmp9118)
ret i1 0
br label %.if.end.9115
.if.false.9115:
br label %.if.end.9115
.if.end.9115:
%.tmp9120 = getelementptr i8*, i8** %cmd.9090, i32 0
%.tmp9122 = getelementptr [17 x i8], [17 x i8]*@.str9121, i32 0, i32 0
%.tmp9123 = load i8*, i8** %outname
%.tmp9124 = load i8*, i8** %outname
%.tmp9125 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9120, i8* %.tmp9122, i8* %.tmp9123, i8* %.tmp9124)
%.tmp9126 = load i8*, i8** %cmd.9090
%.tmp9128 = getelementptr [2 x i8], [2 x i8]*@.str9127, i32 0, i32 0
%.tmp9129 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9126, i8* %.tmp9128)
%cc_proc.9130 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9129, %m0$.File.type** %cc_proc.9130
%.tmp9131 = load %m0$.File.type*, %m0$.File.type** %cc_proc.9130
%.tmp9132 = icmp eq %m0$.File.type* %.tmp9131, null
br i1 %.tmp9132, label %.if.true.9133, label %.if.false.9133
.if.true.9133:
%.tmp9134 = load %m0$.File.type*, %m0$.File.type** %stderr.9066
%.tmp9136 = getelementptr [28 x i8], [28 x i8]*@.str9135, i32 0, i32 0
%.tmp9137 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9134, i8* %.tmp9136)
ret i1 0
br label %.if.end.9133
.if.false.9133:
br label %.if.end.9133
.if.end.9133:
%.tmp9138 = load %m0$.File.type*, %m0$.File.type** %proc.9100
%.tmp9139 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9138)
%.tmp9140 = icmp ne i32 %.tmp9139, 0
br i1 %.tmp9140, label %.if.true.9141, label %.if.false.9141
.if.true.9141:
%.tmp9142 = load %m0$.File.type*, %m0$.File.type** %stderr.9066
%.tmp9144 = getelementptr [22 x i8], [22 x i8]*@.str9143, i32 0, i32 0
%.tmp9145 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9142, i8* %.tmp9144)
br label %.if.end.9141
.if.false.9141:
%.tmp9147 = getelementptr [32 x i8], [32 x i8]*@.str9146, i32 0, i32 0
%.tmp9148 = load i8*, i8** %outname
%.tmp9149 = call i32(i8*,...) @printf(i8* %.tmp9147, i8* %.tmp9148)
br label %.if.end.9141
.if.end.9141:
ret i1 1
}
%.Args.type = type {i8*,i8*,i8*,i8**}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9150 = load i32, i32* %argc
%.tmp9151 = load i8**, i8*** %argv
%.tmp9152 = call %.Args.type(i32,i8**) @check_args..Args.type.i.cpp(i32 %.tmp9150, i8** %.tmp9151)
%args.9153 = alloca %.Args.type
store %.Args.type %.tmp9152, %.Args.type* %args.9153
%.tmp9154 = getelementptr %.Args.type, %.Args.type* %args.9153, i32 0, i32 1
%.tmp9155 = load i8*, i8** %.tmp9154
%.tmp9156 = getelementptr %.Args.type, %.Args.type* %args.9153, i32 0, i32 2
%.tmp9157 = load i8*, i8** %.tmp9156
%.tmp9158 = call i1(i8*,i8*) @compile_file.b.cp.cp(i8* %.tmp9155, i8* %.tmp9157)
%.tmp9159 = icmp eq i1 %.tmp9158, 0
br i1 %.tmp9159, label %.if.true.9160, label %.if.false.9160
.if.true.9160:
ret i32 0
br label %.if.end.9160
.if.false.9160:
br label %.if.end.9160
.if.end.9160:
%.tmp9161 = getelementptr %.Args.type, %.Args.type* %args.9153, i32 0, i32 0
%.tmp9162 = load i8*, i8** %.tmp9161
%.tmp9164 = getelementptr [4 x i8], [4 x i8]*@.str9163, i32 0, i32 0
%.tmp9165 = call i32(i8*,i8*) @strcmp(i8* %.tmp9162, i8* %.tmp9164)
%.tmp9166 = icmp eq i32 %.tmp9165, 0
br i1 %.tmp9166, label %.if.true.9167, label %.if.false.9167
.if.true.9167:
%.tmp9169 = getelementptr [1 x i8], [1 x i8]*@.str9168, i32 0, i32 0
%cmd.9170 = alloca i8*
store i8* %.tmp9169, i8** %cmd.9170
%.tmp9171 = getelementptr i8*, i8** %cmd.9170, i32 0
%.tmp9173 = getelementptr [5 x i8], [5 x i8]*@.str9172, i32 0, i32 0
%.tmp9174 = getelementptr %.Args.type, %.Args.type* %args.9153, i32 0, i32 2
%.tmp9175 = load i8*, i8** %.tmp9174
%.tmp9176 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9171, i8* %.tmp9173, i8* %.tmp9175)
%.tmp9177 = load i8*, i8** %cmd.9170
%.tmp9178 = getelementptr %.Args.type, %.Args.type* %args.9153, i32 0, i32 3
%.tmp9179 = load i8**, i8*** %.tmp9178
%.tmp9180 = call i32(i8*,i8**) @execvp(i8* %.tmp9177, i8** %.tmp9179)
ret i32 %.tmp9180
br label %.if.end.9167
.if.false.9167:
br label %.if.end.9167
.if.end.9167:
ret i32 0
}
define %.Args.type @check_args..Args.type.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9182 = getelementptr [22 x i8], [22 x i8]*@.str9181, i32 0, i32 0
%tmpl.9183 = alloca i8*
store i8* %.tmp9182, i8** %tmpl.9183
%args.9184 = alloca %.Args.type
%.tmp9185 = getelementptr %.Args.type, %.Args.type* %args.9184, i32 0, i32 0
store i8* null, i8** %.tmp9185
%.tmp9186 = getelementptr %.Args.type, %.Args.type* %args.9184, i32 0, i32 1
store i8* null, i8** %.tmp9186
%.tmp9187 = getelementptr %.Args.type, %.Args.type* %args.9184, i32 0, i32 2
store i8* null, i8** %.tmp9187
%.tmp9188 = getelementptr %.Args.type, %.Args.type* %args.9184, i32 0, i32 3
store i8** null, i8*** %.tmp9188
%.tmp9189 = load i32, i32* %argc
%.tmp9190 = icmp slt i32 %.tmp9189, 2
br i1 %.tmp9190, label %.if.true.9191, label %.if.false.9191
.if.true.9191:
%.tmp9192 = load i8*, i8** %tmpl.9183
%.tmp9193 = load i8**, i8*** %argv
%.tmp9194 = getelementptr i8*, i8** %.tmp9193, i32 0
%.tmp9195 = load i8*, i8** %.tmp9194
%.tmp9196 = call i32(i8*,...) @printf(i8* %.tmp9192, i8* %.tmp9195)
call void(i32) @exit(i32 1)
br label %.if.end.9191
.if.false.9191:
br label %.if.end.9191
.if.end.9191:
%fp.9197 = alloca i32
store i32 1, i32* %fp.9197
%.tmp9198 = getelementptr %.Args.type, %.Args.type* %args.9184, i32 0, i32 0
%.tmp9200 = getelementptr [8 x i8], [8 x i8]*@.str9199, i32 0, i32 0
store i8* %.tmp9200, i8** %.tmp9198
%.tmp9201 = load i8**, i8*** %argv
%.tmp9202 = getelementptr i8*, i8** %.tmp9201, i32 1
%.tmp9203 = load i8*, i8** %.tmp9202
%.tmp9205 = getelementptr [4 x i8], [4 x i8]*@.str9204, i32 0, i32 0
%.tmp9206 = call i32(i8*,i8*) @strcmp(i8* %.tmp9203, i8* %.tmp9205)
%.tmp9207 = icmp eq i32 %.tmp9206, 0
br i1 %.tmp9207, label %.if.true.9208, label %.if.false.9208
.if.true.9208:
%.tmp9209 = getelementptr %.Args.type, %.Args.type* %args.9184, i32 0, i32 0
%.tmp9211 = getelementptr [4 x i8], [4 x i8]*@.str9210, i32 0, i32 0
store i8* %.tmp9211, i8** %.tmp9209
store i32 2, i32* %fp.9197
br label %.if.end.9208
.if.false.9208:
br label %.if.end.9208
.if.end.9208:
%.tmp9212 = load i32, i32* %argc
%.tmp9213 = load i32, i32* %fp.9197
%.tmp9214 = add i32 %.tmp9213, 1
%.tmp9215 = icmp slt i32 %.tmp9212, %.tmp9214
br i1 %.tmp9215, label %.if.true.9216, label %.if.false.9216
.if.true.9216:
%.tmp9217 = load i8*, i8** %tmpl.9183
%.tmp9218 = load i8**, i8*** %argv
%.tmp9219 = getelementptr i8*, i8** %.tmp9218, i32 0
%.tmp9220 = load i8*, i8** %.tmp9219
%.tmp9221 = call i32(i8*,...) @printf(i8* %.tmp9217, i8* %.tmp9220)
call void(i32) @exit(i32 1)
br label %.if.end.9216
.if.false.9216:
br label %.if.end.9216
.if.end.9216:
%.tmp9222 = getelementptr %.Args.type, %.Args.type* %args.9184, i32 0, i32 1
%.tmp9223 = load i32, i32* %fp.9197
%.tmp9224 = load i8**, i8*** %argv
%.tmp9225 = getelementptr i8*, i8** %.tmp9224, i32 %.tmp9223
%.tmp9226 = load i8*, i8** %.tmp9225
store i8* %.tmp9226, i8** %.tmp9222
%.tmp9227 = getelementptr %.Args.type, %.Args.type* %args.9184, i32 0, i32 1
%.tmp9228 = load i8*, i8** %.tmp9227
%.tmp9229 = call {i8*,i8*}(i8*) @m2$splitext.scpcp.cp(i8* %.tmp9228)
%ext.9230 = alloca {i8*,i8*}
store {i8*,i8*} %.tmp9229, {i8*,i8*}* %ext.9230
%.tmp9231 = getelementptr %.Args.type, %.Args.type* %args.9184, i32 0, i32 2
%.tmp9232 = getelementptr {i8*,i8*}, {i8*,i8*}* %ext.9230, i32 0, i32 0
%.tmp9233 = load i8*, i8** %.tmp9232
store i8* %.tmp9233, i8** %.tmp9231
%.tmp9234 = load i32, i32* %argc
%.tmp9235 = load i32, i32* %fp.9197
%.tmp9236 = sub i32 %.tmp9234, %.tmp9235
%.tmp9237 = add i32 %.tmp9236, 1
%ac.9238 = alloca i32
store i32 %.tmp9237, i32* %ac.9238
%.tmp9239 = getelementptr %.Args.type, %.Args.type* %args.9184, i32 0, i32 3
%.tmp9240 = load i32, i32* %ac.9238
%.tmp9241 = mul i32 8, %.tmp9240
%.tmp9242 = call i8*(i32) @malloc(i32 %.tmp9241)
%.tmp9243 = bitcast i8* %.tmp9242 to i8**
store i8** %.tmp9243, i8*** %.tmp9239
%.tmp9244 = getelementptr %.Args.type, %.Args.type* %args.9184, i32 0, i32 3
%.tmp9245 = load i8**, i8*** %.tmp9244
%.tmp9246 = getelementptr i8*, i8** %.tmp9245, i32 0
%.tmp9247 = getelementptr %.Args.type, %.Args.type* %args.9184, i32 0, i32 2
%.tmp9248 = load i8*, i8** %.tmp9247
store i8* %.tmp9248, i8** %.tmp9246
%i.9250 = alloca i32
store i32 0, i32* %i.9250
br label %.for.start.9249
.for.start.9249:
%.tmp9251 = load i32, i32* %i.9250
%.tmp9252 = load i32, i32* %argc
%.tmp9253 = load i32, i32* %fp.9197
%.tmp9254 = sub i32 %.tmp9252, %.tmp9253
%.tmp9255 = icmp slt i32 %.tmp9251, %.tmp9254
br i1 %.tmp9255, label %.for.continue.9249, label %.for.end.9249
.for.continue.9249:
%.tmp9256 = getelementptr %.Args.type, %.Args.type* %args.9184, i32 0, i32 3
%.tmp9257 = load i32, i32* %i.9250
%.tmp9258 = add i32 %.tmp9257, 1
%.tmp9259 = load i8**, i8*** %.tmp9256
%.tmp9260 = getelementptr i8*, i8** %.tmp9259, i32 %.tmp9258
%.tmp9261 = load i32, i32* %fp.9197
%.tmp9262 = load i32, i32* %i.9250
%.tmp9263 = add i32 %.tmp9261, %.tmp9262
%.tmp9264 = add i32 %.tmp9263, 1
%.tmp9265 = load i8**, i8*** %argv
%.tmp9266 = getelementptr i8*, i8** %.tmp9265, i32 %.tmp9264
%.tmp9267 = load i8*, i8** %.tmp9266
store i8* %.tmp9267, i8** %.tmp9260
%.tmp9268 = load i32, i32* %i.9250
%.tmp9269 = add i32 %.tmp9268, 1
store i32 %.tmp9269, i32* %i.9250
br label %.for.start.9249
.for.end.9249:
%.tmp9270 = load %.Args.type, %.Args.type* %args.9184
ret %.Args.type %.tmp9270
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
@.str2710 = constant [7 x i8] c".tmp%d\00"
@.str2810 = constant [1 x i8] c"\00"
@.str2852 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2876 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str2895 = constant [6 x i8] c"start\00"
@.str2972 = constant [6 x i8] c"start\00"
@.str2979 = constant [29 x i8] c"Expecting 'start' expression\00"
@.str2982 = constant [7 x i8] c"global\00"
@.str2993 = constant [13 x i8] c"head_comment\00"
@.str3032 = constant [1 x i8] c"\00"
@.str3056 = constant [7 x i8] c"string\00"
@.str3064 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3084 = constant [7 x i8] c"extern\00"
@.str3098 = constant [15 x i8] c"declare %s %s(\00"
@.str3134 = constant [3 x i8] c", \00"
@.str3140 = constant [3 x i8] c"%s\00"
@.str3152 = constant [3 x i8] c")\0A\00"
@.str3169 = constant [5 x i8] c"%s%s\00"
@.str3177 = constant [9 x i8] c"function\00"
@.str3183 = constant [5 x i8] c"main\00"
@.str3198 = constant [6 x i8] c"%s.%s\00"
@.str3219 = constant [3 x i8] c"NL\00"
@.str3227 = constant [7 x i8] c"global\00"
@.str3235 = constant [11 x i8] c"assignable\00"
@.str3266 = constant [9 x i8] c"variable\00"
@.str3278 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3293 = constant [10 x i8] c"typealias\00"
@.str3315 = constant [11 x i8] c"%s.%s.type\00"
@.str3327 = constant [10 x i8] c"typealias\00"
@.str3349 = constant [5 x i8] c"type\00"
@.str3379 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3392 = constant [7 x i8] c"extern\00"
@.str3410 = constant [7 x i8] c"extern\00"
@.str3451 = constant [7 x i8] c"extern\00"
@.str3463 = constant [9 x i8] c"function\00"
@.str3472 = constant [9 x i8] c"function\00"
@.str3511 = constant [14 x i8] c"define %s %s(\00"
@.str3540 = constant [3 x i8] c", \00"
@.str3546 = constant [5 x i8] c"type\00"
@.str3562 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3577 = constant [5 x i8] c") {\0A\00"
@.str3581 = constant [9 x i8] c"function\00"
@.str3590 = constant [6 x i8] c"block\00"
@.str3605 = constant [3 x i8] c"}\0A\00"
@.str3611 = constant [7 x i8] c"import\00"
@.str3667 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str3728 = constant [5 x i8] c"m%d$\00"
@.str3779 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3788 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3820 = constant [9 x i8] c"variable\00"
@.str3825 = constant [5 x i8] c"type\00"
@.str3857 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3870 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3882 = constant [6 x i8] c"block\00"
@.str3889 = constant [12 x i8] c"expressions\00"
@.str3920 = constant [7 x i8] c"struct\00"
@.str3925 = constant [7 x i8] c"WhAT!\0A\00"
@.str3965 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str3977 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4003 = constant [7 x i8] c"struct\00"
@.str4008 = constant [7 x i8] c"WhAT!\0A\00"
@.str4039 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4051 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4076 = constant [7 x i8] c"sizeof\00"
@.str4082 = constant [8 x i8] c"fn_args\00"
@.str4089 = constant [11 x i8] c"assignable\00"
@.str4117 = constant [4 x i8] c"int\00"
@.str4130 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4139 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4150 = constant [7 x i8] c"append\00"
@.str4156 = constant [8 x i8] c"fn_args\00"
@.str4163 = constant [11 x i8] c"assignable\00"
@.str4170 = constant [11 x i8] c"assignable\00"
@.str4194 = constant [5 x i8] c".b%d\00"
@.str4228 = constant [8 x i8] c"realloc\00"
@.str4237 = constant [9 x i8] c"function\00"
@.str4250 = constant [4 x i8] c"ptr\00"
@.str4267 = constant [4 x i8] c"chr\00"
@.str4284 = constant [4 x i8] c"ptr\00"
@.str4305 = constant [4 x i8] c"chr\00"
@.str4326 = constant [4 x i8] c"int\00"
@.str4329 = constant [8 x i8] c"realloc\00"
@.str4331 = constant [7 x i8] c"extern\00"
@.str4338 = constant [4 x i8] c"len\00"
@.str4344 = constant [8 x i8] c"fn_args\00"
@.str4351 = constant [11 x i8] c"assignable\00"
@.str4359 = constant [1 x i8] c"\00"
@.str4375 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str4396 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str4402 = constant [1 x i8] c"\00"
@.str4408 = constant [6 x i8] c"%s.bn\00"
@.str4413 = constant [9 x i8] c"%s/%s.bn\00"
@.str4437 = constant [35 x i8] c"unable to compile function address\00"
@.str4443 = constant [8 x i8] c"fn_args\00"
@.str4447 = constant [1 x i8] c"\00"
@.str4456 = constant [4 x i8] c"ptr\00"
@.str4476 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str4500 = constant [11 x i8] c"assignable\00"
@.str4524 = constant [11 x i8] c"assignable\00"
@.str4536 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4554 = constant [5 x i8] c"%s, \00"
@.str4579 = constant [7 x i8] c"vararg\00"
@.str4592 = constant [1 x i8] c"\00"
@.str4596 = constant [58 x i8] c"types.Type for argument %d does not match: '%s', got '%s'\00"
@.str4613 = constant [8 x i8] c"%s%s %s\00"
@.str4630 = constant [7 x i8] c"vararg\00"
@.str4641 = constant [11 x i8] c"assignable\00"
@.str4650 = constant [7 x i8] c"vararg\00"
@.str4656 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4692 = constant [7 x i8] c"vararg\00"
@.str4703 = constant [42 x i8] c"Function '%s' takes %d arguments, 0 given\00"
@.str4721 = constant [5 x i8] c"void\00"
@.str4729 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4761 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4787 = constant [7 x i8] c"return\00"
@.str4799 = constant [3 x i8] c"NL\00"
@.str4817 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4830 = constant [10 x i8] c"ret void\0A\00"
@.str4834 = constant [3 x i8] c"NL\00"
@.str4840 = constant [8 x i8] c"fn_call\00"
@.str4851 = constant [12 x i8] c"declaration\00"
@.str4860 = constant [11 x i8] c"assignment\00"
@.str4868 = constant [11 x i8] c"assignable\00"
@.str4899 = constant [4 x i8] c"ptr\00"
@.str4908 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4918 = constant [9 x i8] c"if_block\00"
@.str4926 = constant [9 x i8] c"for_loop\00"
@.str4934 = constant [8 x i8] c"keyword\00"
@.str4951 = constant [6 x i8] c"break\00"
@.str4962 = constant [4 x i8] c"for\00"
@.str4970 = constant [15 x i8] c"br label %%%s\0A\00"
@.str4981 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str4988 = constant [9 x i8] c"continue\00"
@.str4999 = constant [4 x i8] c"for\00"
@.str5007 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5018 = constant [51 x i8] c"'continue' keyword used outside of 'for' statement\00"
@.str5022 = constant [40 x i8] c"Keyword '%s': behaviour not implemented\00"
@.str5032 = constant [9 x i8] c"function\00"
@.str5041 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str5050 = constant [4 x i8] c"ptr\00"
@.str5059 = constant [4 x i8] c"chr\00"
@.str5070 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5079 = constant [9 x i8] c"function\00"
@.str5092 = constant [5 x i8] c"void\00"
@.str5122 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5124 = constant [7 x i8] c"extern\00"
@.str5132 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5141 = constant [9 x i8] c"function\00"
@.str5156 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5158 = constant [7 x i8] c"extern\00"
@.str5166 = constant [5 x i8] c"mmap\00"
@.str5175 = constant [9 x i8] c"function\00"
@.str5201 = constant [4 x i8] c"int\00"
@.str5213 = constant [4 x i8] c"int\00"
@.str5225 = constant [4 x i8] c"int\00"
@.str5237 = constant [4 x i8] c"int\00"
@.str5249 = constant [4 x i8] c"int\00"
@.str5255 = constant [5 x i8] c"mmap\00"
@.str5257 = constant [7 x i8] c"extern\00"
@.str5263 = constant [5 x i8] c"WORD\00"
@.str5286 = constant [9 x i8] c"function\00"
@.str5310 = constant [4 x i8] c"ptr\00"
@.str5319 = constant [7 x i8] c"struct\00"
@.str5333 = constant [1 x i8] c"\00"
@.str5337 = constant [5 x i8] c"@.%d\00"
@.str5351 = constant [101 x i8] c"%%.tmem%d = call i8*(i8*,i32,i32,i32,i32,i32) @mmap(i8* null, i32 72, i32 7, i32 34, i32 -1, i32 0)\0A\00"
@.str5358 = constant [100 x i8] c"call void(i8*,i8*,i8*) @llvm.init.trampoline(i8* %%.tmem%d, i8* bitcast (%s* %s to i8*), i8* null)\0A\00"
@.str5369 = constant [66 x i8] c"%%.trmp%d = call i8*(i8*) @llvm.adjust.trampoline(i8* %%.tmem%d)\0A\00"
@.str5377 = constant [35 x i8] c"%s = bitcast i8* %%.trmp%d to %s*\0A\00"
@.str5398 = constant [14 x i8] c"define %s %s(\00"
@.str5406 = constant [9 x i8] c"function\00"
@.str5413 = constant [13 x i8] c"%s nest %%.0\00"
@.str5440 = constant [3 x i8] c", \00"
@.str5446 = constant [5 x i8] c"type\00"
@.str5462 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str5477 = constant [5 x i8] c") {\0A\00"
@.str5485 = constant [6 x i8] c"block\00"
@.str5498 = constant [3 x i8] c"}\0A\00"
@.str5524 = constant [12 x i8] c"expressions\00"
@.str5538 = constant [3 x i8] c"NL\00"
@.str5555 = constant [7 x i8] c"return\00"
@.str5563 = constant [5 x i8] c"void\00"
@.str5574 = constant [21 x i8] c"Missing return value\00"
@.str5579 = constant [10 x i8] c"ret void\0A\00"
@.str5596 = constant [14 x i8] c".for.start.%d\00"
@.str5601 = constant [12 x i8] c".for.end.%d\00"
@.str5606 = constant [4 x i8] c"for\00"
@.str5613 = constant [12 x i8] c"declaration\00"
@.str5624 = constant [11 x i8] c"assignment\00"
@.str5634 = constant [9 x i8] c"OPERATOR\00"
@.str5641 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str5652 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str5659 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str5666 = constant [9 x i8] c"OPERATOR\00"
@.str5677 = constant [9 x i8] c"OPERATOR\00"
@.str5684 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str5693 = constant [9 x i8] c"OPERATOR\00"
@.str5698 = constant [6 x i8] c"block\00"
@.str5703 = constant [11 x i8] c"else_block\00"
@.str5713 = constant [13 x i8] c".for.else.%d\00"
@.str5720 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str5735 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str5754 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5764 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str5771 = constant [6 x i8] c"block\00"
@.str5780 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5787 = constant [5 x i8] c"%s:\0A\00"
@.str5801 = constant [5 x i8] c"type\00"
@.str5816 = constant [11 x i8] c"assignable\00"
@.str5831 = constant [9 x i8] c"variable\00"
@.str5836 = constant [5 x i8] c"WORD\00"
@.str5845 = constant [31 x i8] c"unable to get declaration name\00"
@.str5865 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str5877 = constant [6 x i8] c"%s.%d\00"
@.str5934 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str5951 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str5963 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6004 = constant [4 x i8] c"int\00"
@.str6011 = constant [4 x i8] c"chr\00"
@.str6019 = constant [5 x i8] c"bool\00"
@.str6028 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str6037 = constant [4 x i8] c"ptr\00"
@.str6045 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6048 = constant [5 x i8] c"null\00"
@.str6056 = constant [7 x i8] c"struct\00"
@.str6077 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6097 = constant [10 x i8] c"typealias\00"
@.str6120 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6139 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str6156 = constant [11 x i8] c"assignable\00"
@.str6173 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str6188 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str6195 = constant [6 x i8] c"block\00"
@.str6204 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6211 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str6218 = constant [11 x i8] c"elif_block\00"
@.str6230 = constant [11 x i8] c"else_block\00"
@.str6240 = constant [6 x i8] c"block\00"
@.str6250 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6257 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str6278 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str6287 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str6321 = constant [1 x i8] c"\00"
@.str6332 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6352 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6377 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str6398 = constant [7 x i8] c"module\00"
@.str6451 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str6488 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str6496 = constant [9 x i8] c"function\00"
@.str6503 = constant [7 x i8] c"extern\00"
@.str6515 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str6536 = constant [9 x i8] c"variable\00"
@.str6558 = constant [4 x i8] c"ptr\00"
@.str6577 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str6601 = constant [10 x i8] c"typealias\00"
@.str6612 = constant [7 x i8] c"struct\00"
@.str6618 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str6670 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str6691 = constant [9 x i8] c"variable\00"
@.str6702 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6723 = constant [9 x i8] c"variable\00"
@.str6731 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str6745 = constant [17 x i8] c"addr_destination\00"
@.str6752 = constant [16 x i8] c"mono_assignable\00"
@.str6760 = constant [11 x i8] c"assignable\00"
@.str6774 = constant [12 x i8] c"destination\00"
@.str6779 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str6807 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str6826 = constant [7 x i8] c"module\00"
@.str6848 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str6919 = constant [6 x i8] c"slice\00"
@.str6932 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str6974 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str6995 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str7019 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str7042 = constant [16 x i8] c"mono_assignable\00"
@.str7068 = constant [5 x i8] c"cast\00"
@.str7078 = constant [5 x i8] c"type\00"
@.str7103 = constant [8 x i8] c"bitcast\00"
@.str7118 = constant [6 x i8] c"slice\00"
@.str7123 = constant [48 x i8] c"Casting array to slices is not implemented yet\0A\00"
@.str7131 = constant [4 x i8] c"ptr\00"
@.str7138 = constant [4 x i8] c"ptr\00"
@.str7157 = constant [4 x i8] c"i%d\00"
@.str7162 = constant [4 x i8] c"i%d\00"
@.str7170 = constant [5 x i8] c"sext\00"
@.str7172 = constant [6 x i8] c"trunc\00"
@.str7177 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str7197 = constant [16 x i8] c"mono_assignable\00"
@.str7259 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str7282 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str7289 = constant [2 x i8] c"+\00"
@.str7294 = constant [4 x i8] c"add\00"
@.str7299 = constant [2 x i8] c"-\00"
@.str7304 = constant [4 x i8] c"sub\00"
@.str7309 = constant [2 x i8] c"*\00"
@.str7314 = constant [4 x i8] c"mul\00"
@.str7319 = constant [2 x i8] c"/\00"
@.str7324 = constant [5 x i8] c"sdiv\00"
@.str7329 = constant [3 x i8] c"==\00"
@.str7334 = constant [8 x i8] c"icmp eq\00"
@.str7339 = constant [3 x i8] c"!=\00"
@.str7344 = constant [8 x i8] c"icmp ne\00"
@.str7349 = constant [2 x i8] c">\00"
@.str7354 = constant [9 x i8] c"icmp sgt\00"
@.str7359 = constant [2 x i8] c"<\00"
@.str7364 = constant [9 x i8] c"icmp slt\00"
@.str7369 = constant [2 x i8] c"&\00"
@.str7374 = constant [4 x i8] c"and\00"
@.str7379 = constant [2 x i8] c"|\00"
@.str7384 = constant [3 x i8] c"or\00"
@.str7389 = constant [3 x i8] c">=\00"
@.str7394 = constant [9 x i8] c"icmp sge\00"
@.str7399 = constant [3 x i8] c"<=\00"
@.str7404 = constant [9 x i8] c"icmp sle\00"
@.str7409 = constant [2 x i8] c"%\00"
@.str7414 = constant [5 x i8] c"srem\00"
@.str7418 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str7425 = constant [4 x i8] c"add\00"
@.str7432 = constant [3 x i8] c"==\00"
@.str7439 = constant [3 x i8] c"!=\00"
@.str7447 = constant [2 x i8] c"|\00"
@.str7455 = constant [2 x i8] c"&\00"
@.str7463 = constant [2 x i8] c">\00"
@.str7471 = constant [2 x i8] c"<\00"
@.str7479 = constant [3 x i8] c">=\00"
@.str7487 = constant [3 x i8] c"<=\00"
@.str7495 = constant [5 x i8] c"bool\00"
@.str7499 = constant [4 x i8] c"int\00"
@.str7513 = constant [7 x i8] c"NUMBER\00"
@.str7527 = constant [4 x i8] c"int\00"
@.str7541 = constant [5 x i8] c"WORD\00"
@.str7551 = constant [5 x i8] c"null\00"
@.str7558 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str7572 = constant [5 x i8] c"null\00"
@.str7581 = constant [8 x i8] c"nullptr\00"
@.str7588 = constant [17 x i8] c"addr_destination\00"
@.str7600 = constant [12 x i8] c"destination\00"
@.str7644 = constant [4 x i8] c"ptr\00"
@.str7663 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str7677 = constant [9 x i8] c"function\00"
@.str7692 = constant [4 x i8] c"ptr\00"
@.str7700 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str7714 = constant [8 x i8] c"boolean\00"
@.str7728 = constant [5 x i8] c"bool\00"
@.str7737 = constant [6 x i8] c"false\00"
@.str7744 = constant [2 x i8] c"0\00"
@.str7748 = constant [2 x i8] c"1\00"
@.str7755 = constant [8 x i8] c"fn_call\00"
@.str7772 = constant [7 x i8] c"STRING\00"
@.str7798 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str7814 = constant [4 x i8] c"ptr\00"
@.str7827 = constant [4 x i8] c"chr\00"
@.str7834 = constant [4 x i8] c"CHR\00"
@.str7850 = constant [2 x i8] c"0\00"
@.str7866 = constant [22 x i8] c"Invalid character: %s\00"
@.str7882 = constant [4 x i8] c"chr\00"
@.str7886 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str7914 = constant [22 x i8] c"called 'abbr' on null\00"
@.str7920 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str7925 = constant [4 x i8] c"int\00"
@.str7930 = constant [2 x i8] c"i\00"
@.str7935 = constant [5 x i8] c"bool\00"
@.str7940 = constant [2 x i8] c"b\00"
@.str7945 = constant [5 x i8] c"void\00"
@.str7950 = constant [2 x i8] c"v\00"
@.str7955 = constant [4 x i8] c"chr\00"
@.str7960 = constant [2 x i8] c"c\00"
@.str7965 = constant [4 x i8] c"ptr\00"
@.str7972 = constant [4 x i8] c"%sp\00"
@.str7983 = constant [10 x i8] c"typealias\00"
@.str7994 = constant [7 x i8] c"struct\00"
@.str7999 = constant [2 x i8] c"s\00"
@.str8010 = constant [5 x i8] c"%s%s\00"
@.str8023 = constant [9 x i8] c"function\00"
@.str8028 = constant [2 x i8] c"f\00"
@.str8033 = constant [6 x i8] c"error\00"
@.str8038 = constant [2 x i8] c"?\00"
@.str8040 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str8052 = constant [7 x i8] c".str%d\00"
@.str8067 = constant [6 x i8] c"array\00"
@.str8080 = constant [4 x i8] c"chr\00"
@.str8101 = constant [3 x i8] c"%d\00"
@.str8108 = constant [7 x i8] c"string\00"
@.str8144 = constant [7 x i8] c"module\00"
@.str8195 = constant [4 x i8] c"%s\0A\00"
@.str8250 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str8256 = constant [2 x i8] c"?\00"
@.str8262 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str8268 = constant [4 x i8] c"int\00"
@.str8273 = constant [4 x i8] c"i32\00"
@.str8278 = constant [5 x i8] c"void\00"
@.str8283 = constant [5 x i8] c"void\00"
@.str8288 = constant [5 x i8] c"bool\00"
@.str8293 = constant [3 x i8] c"i1\00"
@.str8298 = constant [8 x i8] c"nullptr\00"
@.str8303 = constant [4 x i8] c"ptr\00"
@.str8308 = constant [4 x i8] c"chr\00"
@.str8313 = constant [3 x i8] c"i8\00"
@.str8318 = constant [9 x i8] c"function\00"
@.str8324 = constant [4 x i8] c"%s(\00"
@.str8350 = constant [4 x i8] c"%s,\00"
@.str8355 = constant [5 x i8] c"%s%s\00"
@.str8366 = constant [4 x i8] c"%s)\00"
@.str8374 = constant [4 x i8] c"ptr\00"
@.str8380 = constant [4 x i8] c"%s*\00"
@.str8392 = constant [7 x i8] c"struct\00"
@.str8398 = constant [2 x i8] c"{\00"
@.str8415 = constant [4 x i8] c"%s,\00"
@.str8420 = constant [5 x i8] c"%s%s\00"
@.str8431 = constant [4 x i8] c"%s}\00"
@.str8439 = constant [6 x i8] c"array\00"
@.str8445 = constant [10 x i8] c"[%s x %s]\00"
@.str8464 = constant [10 x i8] c"typealias\00"
@.str8470 = constant [5 x i8] c"%%%s\00"
@.str8480 = constant [7 x i8] c"vararg\00"
@.str8485 = constant [4 x i8] c"...\00"
@.str8490 = constant [6 x i8] c"error\00"
@.str8495 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str8571 = constant [9 x i8] c"function\00"
@.str8589 = constant [5 x i8] c"WORD\00"
@.str8646 = constant [10 x i8] c"fn_params\00"
@.str8660 = constant [11 x i8] c"basic_type\00"
@.str8681 = constant [13 x i8] c"type_trailer\00"
@.str8690 = constant [9 x i8] c"function\00"
@.str8706 = constant [15 x i8] c"type_fn_params\00"
@.str8747 = constant [4 x i8] c"ptr\00"
@.str8759 = constant [10 x i8] c"structdef\00"
@.str8766 = constant [7 x i8] c"struct\00"
@.str8773 = constant [5 x i8] c"type\00"
@.str8804 = constant [5 x i8] c"type\00"
@.str8831 = constant [5 x i8] c"type\00"
@.str8837 = constant [12 x i8] c"dotted_name\00"
@.str8851 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str8864 = constant [6 x i8] c"error\00"
@.str8869 = constant [10 x i8] c"typealias\00"
@.str8893 = constant [4 x i8] c"str\00"
@.str8900 = constant [4 x i8] c"ptr\00"
@.str8909 = constant [4 x i8] c"chr\00"
@.str8914 = constant [5 x i8] c"WORD\00"
@.str8927 = constant [4 x i8] c"...\00"
@.str8934 = constant [7 x i8] c"vararg\00"
@.str8938 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str8959 = constant [2 x i8] c"*\00"
@.str8968 = constant [4 x i8] c"ptr\00"
@.str8977 = constant [2 x i8] c"[\00"
@.str8987 = constant [2 x i8] c"]\00"
@.str8996 = constant [7 x i8] c"struct\00"
@.str9000 = constant [6 x i8] c"slice\00"
@.str9006 = constant [4 x i8] c"ptr\00"
@.str9010 = constant [6 x i8] c"c_arr\00"
@.str9022 = constant [4 x i8] c"int\00"
@.str9026 = constant [4 x i8] c"len\00"
@.str9035 = constant [4 x i8] c"int\00"
@.str9039 = constant [4 x i8] c"cap\00"
@.str9050 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str9063 = constant [2 x i8] c"w\00"
@.str9079 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str9088 = constant [1 x i8] c"\00"
@.str9092 = constant [32 x i8] c"tee debug.ll | llc - -o debug.s\00"
@.str9097 = constant [2 x i8] c"w\00"
@.str9109 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9117 = constant [24 x i8] c"error on llc execution\0A\00"
@.str9121 = constant [17 x i8] c"cc debug.s -o %s\00"
@.str9127 = constant [2 x i8] c"w\00"
@.str9135 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9143 = constant [22 x i8] c"error on cc execution\00"
@.str9146 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str9163 = constant [4 x i8] c"run\00"
@.str9168 = constant [1 x i8] c"\00"
@.str9172 = constant [5 x i8] c"./%s\00"
@.str9181 = constant [22 x i8] c"Usage: %s <filename>\0A\00"
@.str9199 = constant [8 x i8] c"compile\00"
@.str9204 = constant [4 x i8] c"run\00"
@.str9210 = constant [4 x i8] c"run\00"
