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
declare i32 @getline(i8**, i32*, %m0$.File.type*)
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
define i8* @m296$_context.cp.m296$.Error.typep(%m296$.Error.type* %.e.arg) {
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%lines.847 = alloca {i8**,i32,i32}
%.tmp848 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 0
store i8** null, i8*** %.tmp848
%.tmp849 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 1
store i32 0, i32* %.tmp849
%.tmp850 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 2
store i32 0, i32* %.tmp850
%.tmp851 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp852 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp851, i32 0, i32 2
%.tmp853 = load i8*, i8** %.tmp852
%.tmp855 = getelementptr [2 x i8], [2 x i8]*@.str854, i32 0, i32 0
%.tmp856 = call %m0$.File.type*(i8*,i8*) @fopen(i8* %.tmp853, i8* %.tmp855)
%fd.857 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp856, %m0$.File.type** %fd.857
%.tmp858 = load %m0$.File.type*, %m0$.File.type** %fd.857
%.tmp859 = icmp eq %m0$.File.type* %.tmp858, null
br i1 %.tmp859, label %.if.true.860, label %.if.false.860
.if.true.860:
%.tmp862 = getelementptr [1 x i8], [1 x i8]*@.str861, i32 0, i32 0
ret i8* %.tmp862
br label %.if.end.860
.if.false.860:
br label %.if.end.860
.if.end.860:
%curline.863 = alloca i32
store i32 0, i32* %curline.863
%context_size.864 = alloca i32
store i32 1, i32* %context_size.864
%.tmp865 = bitcast ptr null to i8*
%buf.866 = alloca i8*
store i8* %.tmp865, i8** %buf.866
%bufsize.867 = alloca i32
store i32 0, i32* %bufsize.867
%curline.869 = alloca i32
store i32 1, i32* %curline.869
br label %.for.start.868
.for.start.868:
%.tmp870 = load i32, i32* %curline.869
%.tmp871 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp872 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp871, i32 0, i32 0
%.tmp873 = load i32, i32* %.tmp872
%.tmp874 = load i32, i32* %context_size.864
%.tmp875 = add i32 %.tmp873, %.tmp874
%.tmp876 = icmp sle i32 %.tmp870, %.tmp875
br i1 %.tmp876, label %.for.continue.868, label %.for.end.868
.for.continue.868:
%.tmp877 = getelementptr i8*, i8** %buf.866, i32 0
%.tmp878 = getelementptr i32, i32* %bufsize.867, i32 0
%.tmp879 = load %m0$.File.type*, %m0$.File.type** %fd.857
%.tmp880 = call i32(i8**,i32*,%m0$.File.type*) @getline(i8** %.tmp877, i32* %.tmp878, %m0$.File.type* %.tmp879)
%.tmp881 = icmp slt i32 %.tmp880, 0
br i1 %.tmp881, label %.if.true.882, label %.if.false.882
.if.true.882:
br label %.for.end.868
br label %.if.end.882
.if.false.882:
br label %.if.end.882
.if.end.882:
%.tmp883 = load i32, i32* %curline.869
%.tmp884 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp885 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp884, i32 0, i32 0
%.tmp886 = load i32, i32* %.tmp885
%.tmp887 = load i32, i32* %context_size.864
%.tmp888 = sub i32 %.tmp886, %.tmp887
%.tmp889 = icmp sge i32 %.tmp883, %.tmp888
%.tmp890 = load i32, i32* %curline.869
%.tmp891 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp892 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp891, i32 0, i32 0
%.tmp893 = load i32, i32* %.tmp892
%.tmp894 = load i32, i32* %context_size.864
%.tmp895 = add i32 %.tmp893, %.tmp894
%.tmp896 = icmp sle i32 %.tmp890, %.tmp895
%.tmp897 = and i1 %.tmp889, %.tmp896
br i1 %.tmp897, label %.if.true.898, label %.if.false.898
.if.true.898:
%.tmp900 = getelementptr [1 x i8], [1 x i8]*@.str899, i32 0, i32 0
%.b902.tmp0 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 1
%.b902.tmp1 = load i32, i32* %.b902.tmp0
%.b902.tmp2 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 2
%.b902.tmp3 = load i32, i32* %.b902.tmp2
%.b902.tmp4 = icmp sge i32 %.b902.tmp1, %.b902.tmp3
br i1 %.b902.tmp4, label %.b902.if.true.9, label %.b902.if.end.9
.b902.if.true.9:
%.b902.tmp6 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 2
%.b902.tmp7 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 2
%.b902.tmp8 = load i32, i32* %.b902.tmp7
%.b902.tmp9 = mul i32 %.b902.tmp8, 2
%.b902.tmp10 = add i32 %.b902.tmp9, 1
store i32 %.b902.tmp10, i32* %.b902.tmp6
%.b902.tmp11 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 0
%.b902.tmp12 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 0
%.b902.tmp13 = load i8**, i8*** %.b902.tmp12
%.b902.tmp14 = bitcast i8** %.b902.tmp13 to i8*
%.b902.tmp15 = getelementptr i8*, i8** null, i32 1
%.b902.tmp16 = ptrtoint i8** %.b902.tmp15 to i32
%.b902.tmp17 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 2
%.b902.tmp18 = load i32, i32* %.b902.tmp17
%.b902.tmp19 = mul i32 %.b902.tmp16, %.b902.tmp18
%.b902.tmp20 = call i8*(i8*,i32) @realloc(i8* %.b902.tmp14, i32 %.b902.tmp19)
%.b902.tmp21 = bitcast i8* %.b902.tmp20 to i8**
store i8** %.b902.tmp21, i8*** %.b902.tmp11
br label %.b902.if.end.9
.b902.if.end.9:
%.b902.tmp22 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 0
%.b902.tmp23 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 1
%.b902.tmp24 = load i32, i32* %.b902.tmp23
%.b902.tmp25 = load i8**, i8*** %.b902.tmp22
%.b902.tmp26 = getelementptr i8*, i8** %.b902.tmp25, i32 %.b902.tmp24
store i8* %.tmp900, i8** %.b902.tmp26
%.b902.tmp27 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 1
%.b902.tmp28 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 1
%.b902.tmp29 = load i32, i32* %.b902.tmp28
%.b902.tmp30 = add i32 %.b902.tmp29, 1
store i32 %.b902.tmp30, i32* %.b902.tmp27
%.tmp901 = load {i8**,i32,i32}, {i8**,i32,i32}* %lines.847
store {i8**,i32,i32} %.tmp901, {i8**,i32,i32}* %lines.847
%.tmp903 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 1
%.tmp904 = load i32, i32* %.tmp903
%.tmp905 = sub i32 %.tmp904, 1
%.tmp906 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 0
%.tmp907 = load i8**, i8*** %.tmp906
%.tmp908 = getelementptr i8*, i8** %.tmp907, i32 %.tmp905
%.tmp909 = getelementptr i8*, i8** %.tmp908, i32 0
%.tmp911 = getelementptr [9 x i8], [9 x i8]*@.str910, i32 0, i32 0
%.tmp912 = load i32, i32* %curline.869
%.tmp913 = load i8*, i8** %buf.866
%.tmp914 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp909, i8* %.tmp911, i32 %.tmp912, i8* %.tmp913)
br label %.if.end.898
.if.false.898:
br label %.if.end.898
.if.end.898:
%.tmp915 = load i32, i32* %curline.869
%.tmp916 = add i32 %.tmp915, 1
store i32 %.tmp916, i32* %curline.869
br label %.for.start.868
.for.end.868:
%.tmp917 = load %m0$.File.type*, %m0$.File.type** %fd.857
%.tmp918 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp917)
%.tmp920 = getelementptr [1 x i8], [1 x i8]*@.str919, i32 0, i32 0
store i8* %.tmp920, i8** %buf.866
%i.922 = alloca i32
store i32 0, i32* %i.922
br label %.for.start.921
.for.start.921:
%.tmp923 = load i32, i32* %i.922
%.tmp924 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 1
%.tmp925 = load i32, i32* %.tmp924
%.tmp926 = icmp slt i32 %.tmp923, %.tmp925
br i1 %.tmp926, label %.for.continue.921, label %.for.end.921
.for.continue.921:
%.tmp927 = getelementptr i8*, i8** %buf.866, i32 0
%.tmp929 = getelementptr [5 x i8], [5 x i8]*@.str928, i32 0, i32 0
%.tmp930 = load i8*, i8** %buf.866
%.tmp931 = load i32, i32* %i.922
%.tmp932 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 0
%.tmp933 = load i8**, i8*** %.tmp932
%.tmp934 = getelementptr i8*, i8** %.tmp933, i32 %.tmp931
%.tmp935 = load i8*, i8** %.tmp934
%.tmp936 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp927, i8* %.tmp929, i8* %.tmp930, i8* %.tmp935)
%.tmp937 = load i32, i32* %i.922
%.tmp938 = add i32 %.tmp937, 1
store i32 %.tmp938, i32* %i.922
br label %.for.start.921
.for.end.921:
%.tmp939 = getelementptr i8*, i8** %buf.866, i32 0
%.tmp941 = getelementptr [5 x i8], [5 x i8]*@.str940, i32 0, i32 0
%.tmp942 = load i8*, i8** %buf.866
%.tmp943 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp939, i8* %.tmp941, i8* %.tmp942)
%.tmp944 = load i8*, i8** %buf.866
ret i8* %.tmp944
}
define i8* @m296$to_string.cp.m296$.Error.typep(%m296$.Error.type* %.e.arg) {
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp946 = getelementptr [1 x i8], [1 x i8]*@.str945, i32 0, i32 0
%buf.947 = alloca i8*
store i8* %.tmp946, i8** %buf.947
%.tmp948 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp949 = call i8*(%m296$.Error.type*) @m296$_context.cp.m296$.Error.typep(%m296$.Error.type* %.tmp948)
%ctx.950 = alloca i8*
store i8* %.tmp949, i8** %ctx.950
%.tmp951 = getelementptr i8*, i8** %buf.947, i32 0
%.tmp953 = getelementptr [24 x i8], [24 x i8]*@.str952, i32 0, i32 0
%.tmp954 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp955 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp954, i32 0, i32 2
%.tmp956 = load i8*, i8** %.tmp955
%.tmp957 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp958 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp957, i32 0, i32 0
%.tmp959 = load i32, i32* %.tmp958
%.tmp960 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp961 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp960, i32 0, i32 1
%.tmp962 = load i32, i32* %.tmp961
%.tmp963 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp964 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp963, i32 0, i32 3
%.tmp965 = load i8*, i8** %.tmp964
%.tmp966 = load i8*, i8** %ctx.950
%.tmp967 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp951, i8* %.tmp953, i8* %.tmp956, i32 %.tmp959, i32 %.tmp962, i8* %.tmp965, i8* %.tmp966)
%.tmp968 = load i8*, i8** %buf.947
ret i8* %.tmp968
}
define void @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.e.arg) {
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp970 = getelementptr [3 x i8], [3 x i8]*@.str969, i32 0, i32 0
%.tmp971 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp972 = call i8*(%m296$.Error.type*) @m296$to_string.cp.m296$.Error.typep(%m296$.Error.type* %.tmp971)
%.tmp973 = call i32(i8*,...) @printf(i8* %.tmp970, i8* %.tmp972)
ret void
}
define void @m296$freport.v.m0$.File.typep.m296$.Error.typep(%m0$.File.type* %.fd.arg, %m296$.Error.type* %.e.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp974 = load %m0$.File.type*, %m0$.File.type** %fd
%.tmp976 = getelementptr [3 x i8], [3 x i8]*@.str975, i32 0, i32 0
%.tmp977 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp978 = call i8*(%m296$.Error.type*) @m296$to_string.cp.m296$.Error.typep(%m296$.Error.type* %.tmp977)
%.tmp979 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp974, i8* %.tmp976, i8* %.tmp978)
ret void
}
@TYPE_VALUE = constant i8 118
@TYPE_ALIAS = constant i8 97
@TYPE_TYPE = constant i8 116
@TYPE_IGNORE = constant i8 0
%m980$.Matcher.type = type {i8,i8*,%m980$.Matcher.type*,%m980$.Matcher.type*,%m980$.Matcher.type*,i8,i8*}
%m980$.Rule.type = type {i8*,i8*,%m980$.Matcher.type*}
%m980$.ParsingContext.type = type {%m297$.Token.type*,%m296$.Error.type*}
define %m980$.ParsingContext.type* @m980$new_context.m980$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.f.arg) {
%f = alloca %m0$.File.type*
store %m0$.File.type* %.f.arg, %m0$.File.type** %f
%.tmp981 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* null, i32 1
%.tmp982 = ptrtoint %m980$.ParsingContext.type* %.tmp981 to i32
%.tmp983 = call i8*(i32) @malloc(i32 %.tmp982)
%.tmp984 = bitcast i8* %.tmp983 to %m980$.ParsingContext.type*
%ctx.985 = alloca %m980$.ParsingContext.type*
store %m980$.ParsingContext.type* %.tmp984, %m980$.ParsingContext.type** %ctx.985
%.tmp986 = load %m0$.File.type*, %m0$.File.type** %f
%.tmp987 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp986)
%fd.988 = alloca i32
store i32 %.tmp987, i32* %fd.988
%.tmp989 = load i32, i32* %fd.988
%.tmp990 = call %m298$.PeekerInfo.type*(i32) @m298$new.m298$.PeekerInfo.typep.i(i32 %.tmp989)
%p.991 = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.tmp990, %m298$.PeekerInfo.type** %p.991
%.tmp992 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.991
%.tmp993 = call %m297$.Token.type*(%m298$.PeekerInfo.type*,i1) @m297$tokenize.m297$.Token.typep.m298$.PeekerInfo.typep.b(%m298$.PeekerInfo.type* %.tmp992, i1 0)
%token_list.994 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp993, %m297$.Token.type** %token_list.994
%.tmp995 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.991
%.tmp996 = bitcast %m298$.PeekerInfo.type* %.tmp995 to i8*
call void(i8*) @free(i8* %.tmp996)
%.tmp997 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx.985
%.tmp998 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp997, i32 0, i32 0
%.tmp999 = load %m297$.Token.type*, %m297$.Token.type** %token_list.994
store %m297$.Token.type* %.tmp999, %m297$.Token.type** %.tmp998
%.tmp1000 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx.985
ret %m980$.ParsingContext.type* %.tmp1000
}
define %m980$.Matcher.type* @m980$new_matcher.m980$.Matcher.typep() {
%.tmp1001 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* null, i32 1
%.tmp1002 = ptrtoint %m980$.Matcher.type* %.tmp1001 to i32
%.tmp1003 = call i8*(i32) @malloc(i32 %.tmp1002)
%.tmp1004 = bitcast i8* %.tmp1003 to %m980$.Matcher.type*
%m.1005 = alloca %m980$.Matcher.type*
store %m980$.Matcher.type* %.tmp1004, %m980$.Matcher.type** %m.1005
%.tmp1006 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1005
%.tmp1007 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1006, i32 0, i32 5
%.tmp1008 = load i8, i8* @TYPE_IGNORE
store i8 %.tmp1008, i8* %.tmp1007
%.tmp1009 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1005
%.tmp1010 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1009, i32 0, i32 6
%.tmp1012 = getelementptr [1 x i8], [1 x i8]*@.str1011, i32 0, i32 0
store i8* %.tmp1012, i8** %.tmp1010
%.tmp1013 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1005
%.tmp1014 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1013, i32 0, i32 1
%.tmp1016 = getelementptr [1 x i8], [1 x i8]*@.str1015, i32 0, i32 0
store i8* %.tmp1016, i8** %.tmp1014
%.tmp1017 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1005
%.tmp1018 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1017, i32 0, i32 4
store %m980$.Matcher.type* null, %m980$.Matcher.type** %.tmp1018
%.tmp1019 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1005
%.tmp1020 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1019, i32 0, i32 0
store i8 49, i8* %.tmp1020
%.tmp1021 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1005
%.tmp1022 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1021, i32 0, i32 2
store %m980$.Matcher.type* null, %m980$.Matcher.type** %.tmp1022
%.tmp1023 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1005
%.tmp1024 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1023, i32 0, i32 3
store %m980$.Matcher.type* null, %m980$.Matcher.type** %.tmp1024
%.tmp1025 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1005
ret %m980$.Matcher.type* %.tmp1025
}
define i8* @m980$value.cp.m297$.Token.typep(%m297$.Token.type* %.token.arg) {
%token = alloca %m297$.Token.type*
store %m297$.Token.type* %.token.arg, %m297$.Token.type** %token
%.tmp1026 = load %m297$.Token.type*, %m297$.Token.type** %token
%.tmp1027 = icmp eq %m297$.Token.type* %.tmp1026, null
br i1 %.tmp1027, label %.if.true.1028, label %.if.false.1028
.if.true.1028:
%.tmp1030 = getelementptr [1 x i8], [1 x i8]*@.str1029, i32 0, i32 0
ret i8* %.tmp1030
br label %.if.end.1028
.if.false.1028:
br label %.if.end.1028
.if.end.1028:
%.tmp1031 = load %m297$.Token.type*, %m297$.Token.type** %token
%.tmp1032 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1031, i32 0, i32 1
%.tmp1033 = load i8*, i8** %.tmp1032
ret i8* %.tmp1033
}
define i8* @m980$type.cp.m297$.Token.typep(%m297$.Token.type* %.token.arg) {
%token = alloca %m297$.Token.type*
store %m297$.Token.type* %.token.arg, %m297$.Token.type** %token
%.tmp1034 = load %m297$.Token.type*, %m297$.Token.type** %token
%.tmp1035 = icmp eq %m297$.Token.type* %.tmp1034, null
br i1 %.tmp1035, label %.if.true.1036, label %.if.false.1036
.if.true.1036:
%.tmp1038 = getelementptr [1 x i8], [1 x i8]*@.str1037, i32 0, i32 0
ret i8* %.tmp1038
br label %.if.end.1036
.if.false.1036:
br label %.if.end.1036
.if.end.1036:
%.tmp1039 = load %m297$.Token.type*, %m297$.Token.type** %token
%.tmp1040 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1039, i32 0, i32 0
%.tmp1041 = load i8*, i8** %.tmp1040
ret i8* %.tmp1041
}
define %m297$.Token.type* @m980$next.m297$.Token.typep.m297$.Token.typep(%m297$.Token.type* %.token.arg) {
%token = alloca %m297$.Token.type*
store %m297$.Token.type* %.token.arg, %m297$.Token.type** %token
%.tmp1042 = load %m297$.Token.type*, %m297$.Token.type** %token
%.tmp1043 = icmp eq %m297$.Token.type* %.tmp1042, null
br i1 %.tmp1043, label %.if.true.1044, label %.if.false.1044
.if.true.1044:
%.tmp1045 = bitcast ptr null to %m297$.Token.type*
ret %m297$.Token.type* %.tmp1045
br label %.if.end.1044
.if.false.1044:
br label %.if.end.1044
.if.end.1044:
%.tmp1046 = load %m297$.Token.type*, %m297$.Token.type** %token
%.tmp1047 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1046, i32 0, i32 5
%.tmp1048 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1047
ret %m297$.Token.type* %.tmp1048
}
define void @m980$append_submatch.v.m980$.Matcher.typep.m980$.Matcher.typep(%m980$.Matcher.type* %.m.arg, %m980$.Matcher.type* %.child.arg) {
%m = alloca %m980$.Matcher.type*
store %m980$.Matcher.type* %.m.arg, %m980$.Matcher.type** %m
%child = alloca %m980$.Matcher.type*
store %m980$.Matcher.type* %.child.arg, %m980$.Matcher.type** %child
%.tmp1049 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m
%.tmp1050 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1049, i32 0, i32 4
%.tmp1051 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1050
%.tmp1052 = icmp eq %m980$.Matcher.type* %.tmp1051, null
br i1 %.tmp1052, label %.if.true.1053, label %.if.false.1053
.if.true.1053:
%.tmp1054 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m
%.tmp1055 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1054, i32 0, i32 4
%.tmp1056 = load %m980$.Matcher.type*, %m980$.Matcher.type** %child
store %m980$.Matcher.type* %.tmp1056, %m980$.Matcher.type** %.tmp1055
ret void
br label %.if.end.1053
.if.false.1053:
br label %.if.end.1053
.if.end.1053:
%.tmp1057 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m
%.tmp1058 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1057, i32 0, i32 4
%.tmp1059 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1058
%base.1060 = alloca %m980$.Matcher.type*
store %m980$.Matcher.type* %.tmp1059, %m980$.Matcher.type** %base.1060
br label %.for.start.1061
.for.start.1061:
%.tmp1062 = load %m980$.Matcher.type*, %m980$.Matcher.type** %base.1060
%.tmp1063 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1062, i32 0, i32 3
%.tmp1064 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1063
%.tmp1065 = icmp ne %m980$.Matcher.type* %.tmp1064, null
br i1 %.tmp1065, label %.for.continue.1061, label %.for.end.1061
.for.continue.1061:
%.tmp1066 = load %m980$.Matcher.type*, %m980$.Matcher.type** %base.1060
%.tmp1067 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1066, i32 0, i32 3
%.tmp1068 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1067
store %m980$.Matcher.type* %.tmp1068, %m980$.Matcher.type** %base.1060
br label %.for.start.1061
.for.end.1061:
%.tmp1069 = load %m980$.Matcher.type*, %m980$.Matcher.type** %base.1060
%.tmp1070 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1069, i32 0, i32 3
%.tmp1071 = load %m980$.Matcher.type*, %m980$.Matcher.type** %child
store %m980$.Matcher.type* %.tmp1071, %m980$.Matcher.type** %.tmp1070
ret void
}
define %m980$.Matcher.type* @m980$parse_matcher.m980$.Matcher.typep.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m980$.ParsingContext.type*
store %m980$.ParsingContext.type* %.ctx.arg, %m980$.ParsingContext.type** %ctx
%.tmp1072 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1073 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1072, i32 0, i32 0
%.tmp1074 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1073
%.tmp1075 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1074, i32 0, i32 1
%.tmp1076 = load i8*, i8** %.tmp1075
%.tmp1078 = getelementptr [2 x i8], [2 x i8]*@.str1077, i32 0, i32 0
%.tmp1079 = call i32(i8*,i8*) @strcmp(i8* %.tmp1076, i8* %.tmp1078)
%.tmp1080 = icmp eq i32 %.tmp1079, 0
br i1 %.tmp1080, label %.if.true.1081, label %.if.false.1081
.if.true.1081:
%.tmp1082 = bitcast ptr null to %m980$.Matcher.type*
ret %m980$.Matcher.type* %.tmp1082
br label %.if.end.1081
.if.false.1081:
br label %.if.end.1081
.if.end.1081:
%.tmp1083 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1084 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1083, i32 0, i32 0
%.tmp1085 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1084
%.tmp1086 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1085, i32 0, i32 1
%.tmp1087 = load i8*, i8** %.tmp1086
%.tmp1089 = getelementptr [2 x i8], [2 x i8]*@.str1088, i32 0, i32 0
%.tmp1090 = call i32(i8*,i8*) @strcmp(i8* %.tmp1087, i8* %.tmp1089)
%.tmp1091 = icmp eq i32 %.tmp1090, 0
br i1 %.tmp1091, label %.if.true.1092, label %.if.false.1092
.if.true.1092:
%.tmp1093 = bitcast ptr null to %m980$.Matcher.type*
ret %m980$.Matcher.type* %.tmp1093
br label %.if.end.1092
.if.false.1092:
br label %.if.end.1092
.if.end.1092:
%.tmp1094 = call %m980$.Matcher.type*() @m980$new_matcher.m980$.Matcher.typep()
%m.1095 = alloca %m980$.Matcher.type*
store %m980$.Matcher.type* %.tmp1094, %m980$.Matcher.type** %m.1095
%.tmp1096 = bitcast ptr null to %m980$.Matcher.type*
%tmp_submatch.1097 = alloca %m980$.Matcher.type*
store %m980$.Matcher.type* %.tmp1096, %m980$.Matcher.type** %tmp_submatch.1097
%.tmp1099 = getelementptr [1 x i8], [1 x i8]*@.str1098, i32 0, i32 0
%tag.1100 = alloca i8*
store i8* %.tmp1099, i8** %tag.1100
br label %.for.start.1101
.for.start.1101:
%.tmp1102 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1103 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1102, i32 0, i32 0
%.tmp1104 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1103
%.tmp1105 = icmp ne %m297$.Token.type* %.tmp1104, null
br i1 %.tmp1105, label %.for.continue.1101, label %.for.end.1101
.for.continue.1101:
%.tmp1106 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1107 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1106, i32 0, i32 0
%.tmp1108 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1107
%.tmp1109 = call i8*(%m297$.Token.type*) @m980$type.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1108)
%.tmp1111 = getelementptr [5 x i8], [5 x i8]*@.str1110, i32 0, i32 0
%.tmp1112 = call i32(i8*,i8*) @strcmp(i8* %.tmp1109, i8* %.tmp1111)
%.tmp1113 = icmp eq i32 %.tmp1112, 0
%.tmp1114 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1115 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1114, i32 0, i32 0
%.tmp1116 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1115
%.tmp1117 = call %m297$.Token.type*(%m297$.Token.type*) @m980$next.m297$.Token.typep.m297$.Token.typep(%m297$.Token.type* %.tmp1116)
%.tmp1118 = call i8*(%m297$.Token.type*) @m980$value.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1117)
%.tmp1120 = getelementptr [2 x i8], [2 x i8]*@.str1119, i32 0, i32 0
%.tmp1121 = call i32(i8*,i8*) @strcmp(i8* %.tmp1118, i8* %.tmp1120)
%.tmp1122 = icmp eq i32 %.tmp1121, 0
%.tmp1123 = and i1 %.tmp1113, %.tmp1122
br i1 %.tmp1123, label %.if.true.1124, label %.if.false.1124
.if.true.1124:
%.tmp1125 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1126 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1125, i32 0, i32 0
%.tmp1127 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1126
%.tmp1128 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1127, i32 0, i32 1
%.tmp1129 = load i8*, i8** %.tmp1128
store i8* %.tmp1129, i8** %tag.1100
%.tmp1130 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1131 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1130, i32 0, i32 0
%.tmp1132 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1133 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1132, i32 0, i32 0
%.tmp1134 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1133
%.tmp1135 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1134, i32 0, i32 5
%.tmp1136 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1135
%.tmp1137 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1136, i32 0, i32 5
%.tmp1138 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1137
store %m297$.Token.type* %.tmp1138, %m297$.Token.type** %.tmp1131
br label %.if.end.1124
.if.false.1124:
%.tmp1140 = getelementptr [1 x i8], [1 x i8]*@.str1139, i32 0, i32 0
store i8* %.tmp1140, i8** %tag.1100
br label %.if.end.1124
.if.end.1124:
%.tmp1141 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1142 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1141, i32 0, i32 0
%.tmp1143 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1142
%.tmp1144 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1143, i32 0, i32 1
%.tmp1145 = load i8*, i8** %.tmp1144
%.tmp1147 = getelementptr [2 x i8], [2 x i8]*@.str1146, i32 0, i32 0
%.tmp1148 = call i32(i8*,i8*) @strcmp(i8* %.tmp1145, i8* %.tmp1147)
%.tmp1149 = icmp eq i32 %.tmp1148, 0
br i1 %.tmp1149, label %.if.true.1150, label %.if.false.1150
.if.true.1150:
%.tmp1151 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1152 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1151, i32 0, i32 0
%.tmp1153 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1152
%b_tok.1154 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1153, %m297$.Token.type** %b_tok.1154
%.tmp1155 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1156 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1155, i32 0, i32 0
%.tmp1157 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1158 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1157, i32 0, i32 0
%.tmp1159 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1158
%.tmp1160 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1159, i32 0, i32 5
%.tmp1161 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1160
store %m297$.Token.type* %.tmp1161, %m297$.Token.type** %.tmp1156
%.tmp1162 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1163 = call %m980$.Matcher.type*(%m980$.ParsingContext.type*) @m980$parse_matcher.m980$.Matcher.typep.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.tmp1162)
store %m980$.Matcher.type* %.tmp1163, %m980$.Matcher.type** %tmp_submatch.1097
%.tmp1164 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1165 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1164, i32 0, i32 0
%.tmp1166 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1165
%.tmp1167 = call i8*(%m297$.Token.type*) @m980$value.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1166)
%.tmp1169 = getelementptr [2 x i8], [2 x i8]*@.str1168, i32 0, i32 0
%.tmp1170 = call i32(i8*,i8*) @strcmp(i8* %.tmp1167, i8* %.tmp1169)
%.tmp1171 = icmp ne i32 %.tmp1170, 0
br i1 %.tmp1171, label %.if.true.1172, label %.if.false.1172
.if.true.1172:
%.tmp1173 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1174 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1173, i32 0, i32 1
%.tmp1175 = load %m297$.Token.type*, %m297$.Token.type** %b_tok.1154
%.tmp1177 = getelementptr [19 x i8], [19 x i8]*@.str1176, i32 0, i32 0
%.tmp1178 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1175, i8* %.tmp1177)
store %m296$.Error.type* %.tmp1178, %m296$.Error.type** %.tmp1174
%.tmp1179 = bitcast ptr null to %m980$.Matcher.type*
ret %m980$.Matcher.type* %.tmp1179
br label %.if.end.1172
.if.false.1172:
br label %.if.end.1172
.if.end.1172:
%.tmp1180 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1181 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1180, i32 0, i32 0
%.tmp1182 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1183 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1182, i32 0, i32 0
%.tmp1184 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1183
%.tmp1185 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1184, i32 0, i32 5
%.tmp1186 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1185
store %m297$.Token.type* %.tmp1186, %m297$.Token.type** %.tmp1181
br label %.if.end.1150
.if.false.1150:
%.tmp1187 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1188 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1187, i32 0, i32 0
%.tmp1189 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1188
%.tmp1190 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1189, i32 0, i32 0
%.tmp1191 = load i8*, i8** %.tmp1190
%.tmp1193 = getelementptr [5 x i8], [5 x i8]*@.str1192, i32 0, i32 0
%.tmp1194 = call i32(i8*,i8*) @strcmp(i8* %.tmp1191, i8* %.tmp1193)
%.tmp1195 = icmp eq i32 %.tmp1194, 0
%.tmp1196 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1197 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1196, i32 0, i32 0
%.tmp1198 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1197
%.tmp1199 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1198, i32 0, i32 0
%.tmp1200 = load i8*, i8** %.tmp1199
%.tmp1202 = getelementptr [7 x i8], [7 x i8]*@.str1201, i32 0, i32 0
%.tmp1203 = call i32(i8*,i8*) @strcmp(i8* %.tmp1200, i8* %.tmp1202)
%.tmp1204 = icmp eq i32 %.tmp1203, 0
%.tmp1205 = or i1 %.tmp1195, %.tmp1204
br i1 %.tmp1205, label %.if.true.1206, label %.if.false.1206
.if.true.1206:
%.tmp1207 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1208 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1209 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1208, i32 0, i32 0
%.tmp1210 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1209
%.tmp1211 = call %m980$.Matcher.type*(%m980$.ParsingContext.type*,%m297$.Token.type*) @m980$parse_single_token.m980$.Matcher.typep.m980$.ParsingContext.typep.m297$.Token.typep(%m980$.ParsingContext.type* %.tmp1207, %m297$.Token.type* %.tmp1210)
store %m980$.Matcher.type* %.tmp1211, %m980$.Matcher.type** %tmp_submatch.1097
%.tmp1212 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1213 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1212, i32 0, i32 0
%.tmp1214 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1215 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1214, i32 0, i32 0
%.tmp1216 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1215
%.tmp1217 = call %m297$.Token.type*(%m297$.Token.type*) @m980$next.m297$.Token.typep.m297$.Token.typep(%m297$.Token.type* %.tmp1216)
store %m297$.Token.type* %.tmp1217, %m297$.Token.type** %.tmp1213
br label %.if.end.1206
.if.false.1206:
%.tmp1218 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1219 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1218, i32 0, i32 0
%.tmp1220 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1219
%.tmp1221 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1220, i32 0, i32 1
%.tmp1222 = load i8*, i8** %.tmp1221
%.tmp1224 = getelementptr [2 x i8], [2 x i8]*@.str1223, i32 0, i32 0
%.tmp1225 = call i32(i8*,i8*) @strcmp(i8* %.tmp1222, i8* %.tmp1224)
%.tmp1226 = icmp eq i32 %.tmp1225, 0
br i1 %.tmp1226, label %.if.true.1227, label %.if.false.1227
.if.true.1227:
%.tmp1228 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1229 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1228, i32 0, i32 0
%.tmp1230 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1231 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1230, i32 0, i32 0
%.tmp1232 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1231
%.tmp1233 = call %m297$.Token.type*(%m297$.Token.type*) @m980$next.m297$.Token.typep.m297$.Token.typep(%m297$.Token.type* %.tmp1232)
store %m297$.Token.type* %.tmp1233, %m297$.Token.type** %.tmp1229
%.tmp1234 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1095
%.tmp1235 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1234, i32 0, i32 4
%.tmp1236 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1235
%.tmp1237 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1236, i32 0, i32 2
%.tmp1238 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1239 = call %m980$.Matcher.type*(%m980$.ParsingContext.type*) @m980$parse_matcher.m980$.Matcher.typep.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.tmp1238)
store %m980$.Matcher.type* %.tmp1239, %m980$.Matcher.type** %.tmp1237
br label %.for.end.1101
br label %.if.end.1227
.if.false.1227:
br label %.for.end.1101
br label %.if.end.1227
.if.end.1227:
br label %.if.end.1206
.if.end.1206:
br label %.if.end.1150
.if.end.1150:
%.tmp1240 = load %m980$.Matcher.type*, %m980$.Matcher.type** %tmp_submatch.1097
%.tmp1241 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1240, i32 0, i32 1
%.tmp1242 = load i8*, i8** %tag.1100
store i8* %.tmp1242, i8** %.tmp1241
%.tmp1243 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1244 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1243, i32 0, i32 0
%.tmp1245 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1244
%.tmp1246 = call i8*(%m297$.Token.type*) @m980$value.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1245)
%nv.1247 = alloca i8*
store i8* %.tmp1246, i8** %nv.1247
%.tmp1248 = load i8*, i8** %nv.1247
%.tmp1250 = getelementptr [2 x i8], [2 x i8]*@.str1249, i32 0, i32 0
%.tmp1251 = call i32(i8*,i8*) @strcmp(i8* %.tmp1248, i8* %.tmp1250)
%.tmp1252 = icmp eq i32 %.tmp1251, 0
br i1 %.tmp1252, label %.if.true.1253, label %.if.false.1253
.if.true.1253:
%.tmp1254 = load %m980$.Matcher.type*, %m980$.Matcher.type** %tmp_submatch.1097
%.tmp1255 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1254, i32 0, i32 0
store i8 43, i8* %.tmp1255
%.tmp1256 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1257 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1256, i32 0, i32 0
%.tmp1258 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1259 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1258, i32 0, i32 0
%.tmp1260 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1259
%.tmp1261 = call %m297$.Token.type*(%m297$.Token.type*) @m980$next.m297$.Token.typep.m297$.Token.typep(%m297$.Token.type* %.tmp1260)
store %m297$.Token.type* %.tmp1261, %m297$.Token.type** %.tmp1257
br label %.if.end.1253
.if.false.1253:
%.tmp1262 = load i8*, i8** %nv.1247
%.tmp1264 = getelementptr [2 x i8], [2 x i8]*@.str1263, i32 0, i32 0
%.tmp1265 = call i32(i8*,i8*) @strcmp(i8* %.tmp1262, i8* %.tmp1264)
%.tmp1266 = icmp eq i32 %.tmp1265, 0
br i1 %.tmp1266, label %.if.true.1267, label %.if.false.1267
.if.true.1267:
%.tmp1268 = load %m980$.Matcher.type*, %m980$.Matcher.type** %tmp_submatch.1097
%.tmp1269 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1268, i32 0, i32 0
store i8 42, i8* %.tmp1269
%.tmp1270 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1271 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1270, i32 0, i32 0
%.tmp1272 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1273 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1272, i32 0, i32 0
%.tmp1274 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1273
%.tmp1275 = call %m297$.Token.type*(%m297$.Token.type*) @m980$next.m297$.Token.typep.m297$.Token.typep(%m297$.Token.type* %.tmp1274)
store %m297$.Token.type* %.tmp1275, %m297$.Token.type** %.tmp1271
br label %.if.end.1267
.if.false.1267:
%.tmp1276 = load i8*, i8** %nv.1247
%.tmp1278 = getelementptr [2 x i8], [2 x i8]*@.str1277, i32 0, i32 0
%.tmp1279 = call i32(i8*,i8*) @strcmp(i8* %.tmp1276, i8* %.tmp1278)
%.tmp1280 = icmp eq i32 %.tmp1279, 0
br i1 %.tmp1280, label %.if.true.1281, label %.if.false.1281
.if.true.1281:
%.tmp1282 = load %m980$.Matcher.type*, %m980$.Matcher.type** %tmp_submatch.1097
%.tmp1283 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1282, i32 0, i32 0
store i8 63, i8* %.tmp1283
%.tmp1284 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1285 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1284, i32 0, i32 0
%.tmp1286 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1287 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1286, i32 0, i32 0
%.tmp1288 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1287
%.tmp1289 = call %m297$.Token.type*(%m297$.Token.type*) @m980$next.m297$.Token.typep.m297$.Token.typep(%m297$.Token.type* %.tmp1288)
store %m297$.Token.type* %.tmp1289, %m297$.Token.type** %.tmp1285
br label %.if.end.1281
.if.false.1281:
br label %.if.end.1281
.if.end.1281:
br label %.if.end.1267
.if.end.1267:
br label %.if.end.1253
.if.end.1253:
%.tmp1290 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1095
%.tmp1291 = load %m980$.Matcher.type*, %m980$.Matcher.type** %tmp_submatch.1097
call void(%m980$.Matcher.type*,%m980$.Matcher.type*) @m980$append_submatch.v.m980$.Matcher.typep.m980$.Matcher.typep(%m980$.Matcher.type* %.tmp1290, %m980$.Matcher.type* %.tmp1291)
br label %.for.start.1101
.for.end.1101:
%.tmp1292 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1095
ret %m980$.Matcher.type* %.tmp1292
}
define %m980$.Matcher.type* @m980$parse_single_token.m980$.Matcher.typep.m980$.ParsingContext.typep.m297$.Token.typep(%m980$.ParsingContext.type* %.ctx.arg, %m297$.Token.type* %.t.arg) {
%ctx = alloca %m980$.ParsingContext.type*
store %m980$.ParsingContext.type* %.ctx.arg, %m980$.ParsingContext.type** %ctx
%t = alloca %m297$.Token.type*
store %m297$.Token.type* %.t.arg, %m297$.Token.type** %t
%.tmp1293 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1294 = icmp eq %m297$.Token.type* %.tmp1293, null
br i1 %.tmp1294, label %.if.true.1295, label %.if.false.1295
.if.true.1295:
%.tmp1296 = bitcast ptr null to %m980$.Matcher.type*
ret %m980$.Matcher.type* %.tmp1296
br label %.if.end.1295
.if.false.1295:
br label %.if.end.1295
.if.end.1295:
%.tmp1297 = call %m980$.Matcher.type*() @m980$new_matcher.m980$.Matcher.typep()
%m.1298 = alloca %m980$.Matcher.type*
store %m980$.Matcher.type* %.tmp1297, %m980$.Matcher.type** %m.1298
%.tmp1299 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1298
%.tmp1300 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1299, i32 0, i32 6
%.tmp1301 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1302 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1301, i32 0, i32 1
%.tmp1303 = load i8*, i8** %.tmp1302
store i8* %.tmp1303, i8** %.tmp1300
%.tmp1304 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1305 = call i8*(%m297$.Token.type*) @m980$type.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1304)
%.tmp1307 = getelementptr [7 x i8], [7 x i8]*@.str1306, i32 0, i32 0
%.tmp1308 = call i32(i8*,i8*) @strcmp(i8* %.tmp1305, i8* %.tmp1307)
%.tmp1309 = icmp eq i32 %.tmp1308, 0
br i1 %.tmp1309, label %.if.true.1310, label %.if.false.1310
.if.true.1310:
%.tmp1311 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1298
%.tmp1312 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1311, i32 0, i32 5
%.tmp1313 = load i8, i8* @TYPE_VALUE
store i8 %.tmp1313, i8* %.tmp1312
br label %.if.end.1310
.if.false.1310:
%.tmp1314 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1315 = call i8*(%m297$.Token.type*) @m980$value.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1314)
%.tmp1316 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1315)
br i1 %.tmp1316, label %.if.true.1317, label %.if.false.1317
.if.true.1317:
%.tmp1318 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1298
%.tmp1319 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1318, i32 0, i32 5
%.tmp1320 = load i8, i8* @TYPE_ALIAS
store i8 %.tmp1320, i8* %.tmp1319
br label %.if.end.1317
.if.false.1317:
%.tmp1321 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1322 = call i8*(%m297$.Token.type*) @m980$value.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1321)
%.tmp1323 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1322)
br i1 %.tmp1323, label %.if.true.1324, label %.if.false.1324
.if.true.1324:
%.tmp1325 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1298
%.tmp1326 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1325, i32 0, i32 5
%.tmp1327 = load i8, i8* @TYPE_TYPE
store i8 %.tmp1327, i8* %.tmp1326
br label %.if.end.1324
.if.false.1324:
%.tmp1328 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1329 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1328, i32 0, i32 1
%.tmp1330 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1332 = getelementptr [50 x i8], [50 x i8]*@.str1331, i32 0, i32 0
%.tmp1333 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1330, i8* %.tmp1332)
store %m296$.Error.type* %.tmp1333, %m296$.Error.type** %.tmp1329
%.tmp1334 = bitcast ptr null to %m980$.Matcher.type*
ret %m980$.Matcher.type* %.tmp1334
br label %.if.end.1324
.if.end.1324:
br label %.if.end.1317
.if.end.1317:
br label %.if.end.1310
.if.end.1310:
%.tmp1335 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1298
ret %m980$.Matcher.type* %.tmp1335
}
define %m980$.Rule.type* @m980$parse_rule.m980$.Rule.typep.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m980$.ParsingContext.type*
store %m980$.ParsingContext.type* %.ctx.arg, %m980$.ParsingContext.type** %ctx
%.tmp1336 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1337 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1336, i32 0, i32 0
%.tmp1338 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1337
%.tmp1339 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1338, i32 0, i32 1
%.tmp1340 = load i8*, i8** %.tmp1339
%rule_name.1341 = alloca i8*
store i8* %.tmp1340, i8** %rule_name.1341
%.tmp1342 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1343 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1342, i32 0, i32 0
%.tmp1344 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1343
%.tmp1345 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1344, i32 0, i32 0
%.tmp1346 = load i8*, i8** %.tmp1345
%.tmp1348 = getelementptr [5 x i8], [5 x i8]*@.str1347, i32 0, i32 0
%.tmp1349 = call i32(i8*,i8*) @strcmp(i8* %.tmp1346, i8* %.tmp1348)
%.tmp1350 = icmp ne i32 %.tmp1349, 0
br i1 %.tmp1350, label %.if.true.1351, label %.if.false.1351
.if.true.1351:
%.tmp1353 = getelementptr [37 x i8], [37 x i8]*@.str1352, i32 0, i32 0
%.tmp1354 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1355 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1354, i32 0, i32 0
%.tmp1356 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1355
%.tmp1357 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1356, i32 0, i32 0
%.tmp1358 = load i8*, i8** %.tmp1357
%.tmp1359 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1360 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1359, i32 0, i32 0
%.tmp1361 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1360
%.tmp1362 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1361, i32 0, i32 1
%.tmp1363 = load i8*, i8** %.tmp1362
%.tmp1364 = call i32(i8*,...) @printf(i8* %.tmp1353, i8* %.tmp1358, i8* %.tmp1363)
%.tmp1365 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1367 = getelementptr [31 x i8], [31 x i8]*@.str1366, i32 0, i32 0
call void(%m980$.ParsingContext.type*,i8*) @m980$parser_error.v.m980$.ParsingContext.typep.cp(%m980$.ParsingContext.type* %.tmp1365, i8* %.tmp1367)
br label %.if.end.1351
.if.false.1351:
br label %.if.end.1351
.if.end.1351:
%.tmp1368 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1369 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1368, i32 0, i32 0
%.tmp1370 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1371 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1370, i32 0, i32 0
%.tmp1372 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1371
%.tmp1373 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1372, i32 0, i32 5
%.tmp1374 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1373
store %m297$.Token.type* %.tmp1374, %m297$.Token.type** %.tmp1369
%.tmp1376 = getelementptr [1 x i8], [1 x i8]*@.str1375, i32 0, i32 0
%transformer_name.1377 = alloca i8*
store i8* %.tmp1376, i8** %transformer_name.1377
%.tmp1378 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1379 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1378, i32 0, i32 0
%.tmp1380 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1379
%.tmp1381 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1380, i32 0, i32 1
%.tmp1382 = load i8*, i8** %.tmp1381
%.tmp1384 = getelementptr [2 x i8], [2 x i8]*@.str1383, i32 0, i32 0
%.tmp1385 = call i32(i8*,i8*) @strcmp(i8* %.tmp1382, i8* %.tmp1384)
%.tmp1386 = icmp eq i32 %.tmp1385, 0
br i1 %.tmp1386, label %.if.true.1387, label %.if.false.1387
.if.true.1387:
%.tmp1388 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1389 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1388, i32 0, i32 0
%.tmp1390 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1391 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1390, i32 0, i32 0
%.tmp1392 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1391
%.tmp1393 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1392, i32 0, i32 5
%.tmp1394 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1393
store %m297$.Token.type* %.tmp1394, %m297$.Token.type** %.tmp1389
%.tmp1395 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1396 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1395, i32 0, i32 0
%.tmp1397 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1396
%.tmp1398 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1397, i32 0, i32 1
%.tmp1399 = load i8*, i8** %.tmp1398
store i8* %.tmp1399, i8** %transformer_name.1377
%.tmp1400 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1401 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1400, i32 0, i32 0
%.tmp1402 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1403 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1402, i32 0, i32 0
%.tmp1404 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1403
%.tmp1405 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1404, i32 0, i32 5
%.tmp1406 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1405
%.tmp1407 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1406, i32 0, i32 5
%.tmp1408 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1407
store %m297$.Token.type* %.tmp1408, %m297$.Token.type** %.tmp1401
br label %.if.end.1387
.if.false.1387:
br label %.if.end.1387
.if.end.1387:
%.tmp1409 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1410 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1409, i32 0, i32 0
%.tmp1411 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1410
%.tmp1412 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1411, i32 0, i32 1
%.tmp1413 = load i8*, i8** %.tmp1412
%.tmp1415 = getelementptr [2 x i8], [2 x i8]*@.str1414, i32 0, i32 0
%.tmp1416 = call i32(i8*,i8*) @strcmp(i8* %.tmp1413, i8* %.tmp1415)
%.tmp1417 = icmp ne i32 %.tmp1416, 0
br i1 %.tmp1417, label %.if.true.1418, label %.if.false.1418
.if.true.1418:
%.tmp1419 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1420 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1419, i32 0, i32 0
%.tmp1421 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1420
%.tmp1422 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1421, i32 0, i32 1
%.tmp1423 = load i8*, i8** %.tmp1422
%.tmp1424 = call i32(i8*,...) @printf(i8* %.tmp1423)
%.tmp1426 = getelementptr [1 x i8], [1 x i8]*@.str1425, i32 0, i32 0
%err.1427 = alloca i8*
store i8* %.tmp1426, i8** %err.1427
%.tmp1428 = getelementptr i8*, i8** %err.1427, i32 0
%.tmp1430 = getelementptr [35 x i8], [35 x i8]*@.str1429, i32 0, i32 0
%.tmp1431 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1432 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1431, i32 0, i32 0
%.tmp1433 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1432
%.tmp1434 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1433, i32 0, i32 1
%.tmp1435 = load i8*, i8** %.tmp1434
%.tmp1436 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1428, i8* %.tmp1430, i8* %.tmp1435)
%.tmp1437 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1438 = load i8*, i8** %err.1427
call void(%m980$.ParsingContext.type*,i8*) @m980$parser_error.v.m980$.ParsingContext.typep.cp(%m980$.ParsingContext.type* %.tmp1437, i8* %.tmp1438)
br label %.if.end.1418
.if.false.1418:
br label %.if.end.1418
.if.end.1418:
%.tmp1439 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1440 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1439, i32 0, i32 0
%.tmp1441 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1442 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1441, i32 0, i32 0
%.tmp1443 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1442
%.tmp1444 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1443, i32 0, i32 5
%.tmp1445 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1444
store %m297$.Token.type* %.tmp1445, %m297$.Token.type** %.tmp1440
%.tmp1446 = getelementptr %m980$.Rule.type, %m980$.Rule.type* null, i32 1
%.tmp1447 = ptrtoint %m980$.Rule.type* %.tmp1446 to i32
%.tmp1448 = call i8*(i32) @malloc(i32 %.tmp1447)
%.tmp1449 = bitcast i8* %.tmp1448 to %m980$.Rule.type*
%rule.1450 = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.tmp1449, %m980$.Rule.type** %rule.1450
%.tmp1451 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1450
%.tmp1452 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1451, i32 0, i32 0
%.tmp1453 = load i8*, i8** %rule_name.1341
store i8* %.tmp1453, i8** %.tmp1452
%.tmp1454 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1450
%.tmp1455 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1454, i32 0, i32 1
%.tmp1456 = load i8*, i8** %transformer_name.1377
store i8* %.tmp1456, i8** %.tmp1455
%.tmp1457 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1450
%.tmp1458 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1457, i32 0, i32 2
%.tmp1459 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1460 = call %m980$.Matcher.type*(%m980$.ParsingContext.type*) @m980$parse_matcher.m980$.Matcher.typep.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.tmp1459)
store %m980$.Matcher.type* %.tmp1460, %m980$.Matcher.type** %.tmp1458
%.tmp1461 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1462 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1461, i32 0, i32 0
%.tmp1463 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1464 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1463, i32 0, i32 0
%.tmp1465 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1464
store %m297$.Token.type* %.tmp1465, %m297$.Token.type** %.tmp1462
%.tmp1466 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1467 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1466, i32 0, i32 0
%.tmp1468 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1467
%.tmp1469 = icmp ne %m297$.Token.type* %.tmp1468, null
br i1 %.tmp1469, label %.if.true.1470, label %.if.false.1470
.if.true.1470:
%.tmp1471 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1472 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1471, i32 0, i32 0
%.tmp1473 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1472
%.tmp1474 = call i8*(%m297$.Token.type*) @m980$type.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1473)
%.tmp1476 = getelementptr [3 x i8], [3 x i8]*@.str1475, i32 0, i32 0
%.tmp1477 = call i32(i8*,i8*) @strcmp(i8* %.tmp1474, i8* %.tmp1476)
%.tmp1478 = icmp ne i32 %.tmp1477, 0
%.tmp1479 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1480 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1479, i32 0, i32 0
%.tmp1481 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1480
%.tmp1482 = call i8*(%m297$.Token.type*) @m980$type.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1481)
%.tmp1484 = getelementptr [4 x i8], [4 x i8]*@.str1483, i32 0, i32 0
%.tmp1485 = call i32(i8*,i8*) @strcmp(i8* %.tmp1482, i8* %.tmp1484)
%.tmp1486 = icmp ne i32 %.tmp1485, 0
%.tmp1487 = and i1 %.tmp1478, %.tmp1486
br i1 %.tmp1487, label %.if.true.1488, label %.if.false.1488
.if.true.1488:
%.tmp1490 = getelementptr [58 x i8], [58 x i8]*@.str1489, i32 0, i32 0
%.tmp1491 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1492 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1491, i32 0, i32 0
%.tmp1493 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1492
%.tmp1494 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1493, i32 0, i32 2
%.tmp1495 = load i32, i32* %.tmp1494
%.tmp1496 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1497 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1496, i32 0, i32 0
%.tmp1498 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1497
%.tmp1499 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1498, i32 0, i32 3
%.tmp1500 = load i32, i32* %.tmp1499
%.tmp1501 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1502 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1501, i32 0, i32 0
%.tmp1503 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1502
%.tmp1504 = call i8*(%m297$.Token.type*) @m980$type.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1503)
%.tmp1505 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1506 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1505, i32 0, i32 0
%.tmp1507 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1506
%.tmp1508 = call i8*(%m297$.Token.type*) @m980$value.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1507)
%.tmp1509 = call i32(i8*,...) @printf(i8* %.tmp1490, i32 %.tmp1495, i32 %.tmp1500, i8* %.tmp1504, i8* %.tmp1508)
%.tmp1510 = bitcast ptr null to %m980$.Rule.type*
ret %m980$.Rule.type* %.tmp1510
br label %.if.end.1488
.if.false.1488:
br label %.if.end.1488
.if.end.1488:
br label %.if.end.1470
.if.false.1470:
br label %.if.end.1470
.if.end.1470:
%.tmp1511 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1450
%.tmp1512 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1511, i32 0, i32 2
%.tmp1513 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1512
%.tmp1514 = icmp eq %m980$.Matcher.type* %.tmp1513, null
br i1 %.tmp1514, label %.if.true.1515, label %.if.false.1515
.if.true.1515:
%.tmp1516 = bitcast ptr null to %m980$.Rule.type*
ret %m980$.Rule.type* %.tmp1516
br label %.if.end.1515
.if.false.1515:
br label %.if.end.1515
.if.end.1515:
%.tmp1517 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1450
ret %m980$.Rule.type* %.tmp1517
}
define void @m980$parser_error.v.m980$.ParsingContext.typep.cp(%m980$.ParsingContext.type* %.ctx.arg, i8* %.error.arg) {
%ctx = alloca %m980$.ParsingContext.type*
store %m980$.ParsingContext.type* %.ctx.arg, %m980$.ParsingContext.type** %ctx
%error = alloca i8*
store i8* %.error.arg, i8** %error
%.tmp1518 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1519 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1518, i32 0, i32 0
%.tmp1520 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1519
%.tmp1521 = load i8*, i8** %error
%.tmp1522 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1520, i8* %.tmp1521)
%e.1523 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1522, %m296$.Error.type** %e.1523
%.tmp1524 = load %m296$.Error.type*, %m296$.Error.type** %e.1523
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp1524)
call void(i32) @exit(i32 1)
ret void
}
define %m980$.Rule.type** @m980$parse_grammar.m980$.Rule.typepp.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m980$.ParsingContext.type*
store %m980$.ParsingContext.type* %.ctx.arg, %m980$.ParsingContext.type** %ctx
%max_rules.1525 = alloca i32
store i32 40, i32* %max_rules.1525
%.tmp1526 = load i32, i32* @ptr_size
%.tmp1527 = load i32, i32* %max_rules.1525
%.tmp1528 = mul i32 %.tmp1526, %.tmp1527
%.tmp1529 = call i8*(i32) @malloc(i32 %.tmp1528)
%.tmp1530 = bitcast i8* %.tmp1529 to %m980$.Rule.type**
%grammar.1531 = alloca %m980$.Rule.type**
store %m980$.Rule.type** %.tmp1530, %m980$.Rule.type*** %grammar.1531
%i.1533 = alloca i32
store i32 0, i32* %i.1533
br label %.for.start.1532
.for.start.1532:
%.tmp1534 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1535 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1534, i32 0, i32 0
%.tmp1536 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1535
%.tmp1537 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1536, i32 0, i32 0
%.tmp1538 = load i8*, i8** %.tmp1537
%.tmp1540 = getelementptr [4 x i8], [4 x i8]*@.str1539, i32 0, i32 0
%.tmp1541 = call i32(i8*,i8*) @strcmp(i8* %.tmp1538, i8* %.tmp1540)
%.tmp1542 = icmp ne i32 %.tmp1541, 0
br i1 %.tmp1542, label %.for.continue.1532, label %.for.end.1532
.for.continue.1532:
%.tmp1543 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1544 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1543, i32 0, i32 0
%.tmp1545 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1544
%.tmp1546 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1545, i32 0, i32 0
%.tmp1547 = load i8*, i8** %.tmp1546
%.tmp1549 = getelementptr [3 x i8], [3 x i8]*@.str1548, i32 0, i32 0
%.tmp1550 = call i32(i8*,i8*) @strcmp(i8* %.tmp1547, i8* %.tmp1549)
%.tmp1551 = icmp ne i32 %.tmp1550, 0
br i1 %.tmp1551, label %.if.true.1552, label %.if.false.1552
.if.true.1552:
%.tmp1553 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1554 = call %m980$.Rule.type*(%m980$.ParsingContext.type*) @m980$parse_rule.m980$.Rule.typep.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.tmp1553)
%rule.1555 = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.tmp1554, %m980$.Rule.type** %rule.1555
%.tmp1556 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1555
%.tmp1557 = icmp eq %m980$.Rule.type* %.tmp1556, null
br i1 %.tmp1557, label %.if.true.1558, label %.if.false.1558
.if.true.1558:
%.tmp1559 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1560 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1559, i32 0, i32 1
%.tmp1561 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1560
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp1561)
%.tmp1562 = bitcast ptr null to %m980$.Rule.type**
ret %m980$.Rule.type** %.tmp1562
br label %.if.end.1558
.if.false.1558:
br label %.if.end.1558
.if.end.1558:
%.tmp1563 = load i32, i32* %i.1533
%.tmp1564 = load %m980$.Rule.type**, %m980$.Rule.type*** %grammar.1531
%.tmp1565 = getelementptr %m980$.Rule.type*, %m980$.Rule.type** %.tmp1564, i32 %.tmp1563
%.tmp1566 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1555
store %m980$.Rule.type* %.tmp1566, %m980$.Rule.type** %.tmp1565
%.tmp1567 = load i32, i32* %i.1533
%.tmp1568 = add i32 %.tmp1567, 1
store i32 %.tmp1568, i32* %i.1533
br label %.if.end.1552
.if.false.1552:
%.tmp1569 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1570 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1569, i32 0, i32 0
%.tmp1571 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1572 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1571, i32 0, i32 0
%.tmp1573 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1572
%.tmp1574 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1573, i32 0, i32 5
%.tmp1575 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1574
store %m297$.Token.type* %.tmp1575, %m297$.Token.type** %.tmp1570
br label %.if.end.1552
.if.end.1552:
br label %.for.start.1532
.for.end.1532:
%.tmp1576 = load %m980$.Rule.type**, %m980$.Rule.type*** %grammar.1531
%.tmp1577 = bitcast %m980$.Rule.type** %.tmp1576 to %m980$.Rule.type**
ret %m980$.Rule.type** %.tmp1577
}
%m980$.Node.type = type {i8*,i8*,i8*,i32,i32,i8*,%m980$.Node.type*,%m980$.Node.type*,%m980$.Node.type*}
define %m980$.Node.type* @m980$new_node.m980$.Node.typep.m297$.Token.typep.cp.cp.cp(%m297$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg, i8* %.tag.arg) {
%t = alloca %m297$.Token.type*
store %m297$.Token.type* %.t.arg, %m297$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%tag = alloca i8*
store i8* %.tag.arg, i8** %tag
%.tmp1578 = getelementptr %m980$.Node.type, %m980$.Node.type* null, i32 1
%.tmp1579 = ptrtoint %m980$.Node.type* %.tmp1578 to i32
%.tmp1580 = call i8*(i32) @malloc(i32 %.tmp1579)
%.tmp1581 = bitcast i8* %.tmp1580 to %m980$.Node.type*
%node.1582 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp1581, %m980$.Node.type** %node.1582
%.tmp1583 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
%.tmp1584 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1583, i32 0, i32 0
%.tmp1585 = load i8*, i8** %type
store i8* %.tmp1585, i8** %.tmp1584
%.tmp1586 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
%.tmp1587 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1586, i32 0, i32 1
%.tmp1588 = load i8*, i8** %value
store i8* %.tmp1588, i8** %.tmp1587
%.tmp1589 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
%.tmp1590 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1589, i32 0, i32 3
%.tmp1591 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1592 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1591, i32 0, i32 2
%.tmp1593 = load i32, i32* %.tmp1592
store i32 %.tmp1593, i32* %.tmp1590
%.tmp1594 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
%.tmp1595 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1594, i32 0, i32 5
%.tmp1596 = load i8*, i8** %tag
store i8* %.tmp1596, i8** %.tmp1595
%.tmp1597 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
%.tmp1598 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1597, i32 0, i32 2
%.tmp1599 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1600 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1599, i32 0, i32 4
%.tmp1601 = load i8*, i8** %.tmp1600
store i8* %.tmp1601, i8** %.tmp1598
%.tmp1602 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
%.tmp1603 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1602, i32 0, i32 4
%.tmp1604 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1605 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1604, i32 0, i32 3
%.tmp1606 = load i32, i32* %.tmp1605
store i32 %.tmp1606, i32* %.tmp1603
%.tmp1607 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
%.tmp1608 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1607, i32 0, i32 6
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1608
%.tmp1609 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
%.tmp1610 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1609, i32 0, i32 8
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1610
%.tmp1611 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
%.tmp1612 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1611, i32 0, i32 7
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1612
%.tmp1613 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
ret %m980$.Node.type* %.tmp1613
}
define void @m980$child_append.v.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.parent.arg, %m980$.Node.type* %.child.arg) {
%parent = alloca %m980$.Node.type*
store %m980$.Node.type* %.parent.arg, %m980$.Node.type** %parent
%child = alloca %m980$.Node.type*
store %m980$.Node.type* %.child.arg, %m980$.Node.type** %child
%.tmp1614 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1615 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1614, i32 0, i32 7
%.tmp1616 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1615
%.tmp1617 = icmp eq %m980$.Node.type* %.tmp1616, null
br i1 %.tmp1617, label %.if.true.1618, label %.if.false.1618
.if.true.1618:
%.tmp1619 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1620 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1619, i32 0, i32 7
%.tmp1621 = load %m980$.Node.type*, %m980$.Node.type** %child
store %m980$.Node.type* %.tmp1621, %m980$.Node.type** %.tmp1620
br label %.if.end.1618
.if.false.1618:
%.tmp1622 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1623 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1622, i32 0, i32 7
%.tmp1624 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1623
%c.1625 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp1624, %m980$.Node.type** %c.1625
br label %.for.start.1626
.for.start.1626:
%.tmp1627 = load %m980$.Node.type*, %m980$.Node.type** %c.1625
%.tmp1628 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1627, i32 0, i32 8
%.tmp1629 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1628
%.tmp1630 = icmp ne %m980$.Node.type* %.tmp1629, null
br i1 %.tmp1630, label %.for.continue.1626, label %.for.end.1626
.for.continue.1626:
%.tmp1631 = load %m980$.Node.type*, %m980$.Node.type** %c.1625
%.tmp1632 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1631, i32 0, i32 8
%.tmp1633 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1632
store %m980$.Node.type* %.tmp1633, %m980$.Node.type** %c.1625
br label %.for.start.1626
.for.end.1626:
%.tmp1634 = load %m980$.Node.type*, %m980$.Node.type** %c.1625
%.tmp1635 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1634, i32 0, i32 8
%.tmp1636 = load %m980$.Node.type*, %m980$.Node.type** %child
store %m980$.Node.type* %.tmp1636, %m980$.Node.type** %.tmp1635
br label %.if.end.1618
.if.end.1618:
%.tmp1637 = load %m980$.Node.type*, %m980$.Node.type** %child
%.tmp1638 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1637, i32 0, i32 8
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1638
ret void
}
define void @m980$child_pop.v.m980$.Node.typep(%m980$.Node.type* %.parent.arg) {
%parent = alloca %m980$.Node.type*
store %m980$.Node.type* %.parent.arg, %m980$.Node.type** %parent
%.tmp1639 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1640 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1639, i32 0, i32 7
%.tmp1641 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1640
%.tmp1642 = icmp eq %m980$.Node.type* %.tmp1641, null
br i1 %.tmp1642, label %.if.true.1643, label %.if.false.1643
.if.true.1643:
ret void
br label %.if.end.1643
.if.false.1643:
br label %.if.end.1643
.if.end.1643:
%.tmp1644 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1645 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1644, i32 0, i32 7
%.tmp1646 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1645
%c.1647 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp1646, %m980$.Node.type** %c.1647
%.tmp1648 = load %m980$.Node.type*, %m980$.Node.type** %c.1647
%.tmp1649 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1648, i32 0, i32 8
%.tmp1650 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1649
%.tmp1651 = icmp eq %m980$.Node.type* %.tmp1650, null
br i1 %.tmp1651, label %.if.true.1652, label %.if.false.1652
.if.true.1652:
%.tmp1653 = load %m980$.Node.type*, %m980$.Node.type** %c.1647
%.tmp1654 = bitcast %m980$.Node.type* %.tmp1653 to i8*
call void(i8*) @free(i8* %.tmp1654)
%.tmp1655 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1656 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1655, i32 0, i32 7
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1656
ret void
br label %.if.end.1652
.if.false.1652:
br label %.if.end.1652
.if.end.1652:
br label %.for.start.1657
.for.start.1657:
%.tmp1658 = load %m980$.Node.type*, %m980$.Node.type** %c.1647
%.tmp1659 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1658, i32 0, i32 8
%.tmp1660 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1659
%.tmp1661 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1660, i32 0, i32 8
%.tmp1662 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1661
%.tmp1663 = icmp ne %m980$.Node.type* %.tmp1662, null
br i1 %.tmp1663, label %.for.continue.1657, label %.for.end.1657
.for.continue.1657:
%.tmp1664 = load %m980$.Node.type*, %m980$.Node.type** %c.1647
%.tmp1665 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1664, i32 0, i32 8
%.tmp1666 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1665
store %m980$.Node.type* %.tmp1666, %m980$.Node.type** %c.1647
br label %.for.start.1657
.for.end.1657:
%.tmp1667 = load %m980$.Node.type*, %m980$.Node.type** %c.1647
%.tmp1668 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1667, i32 0, i32 8
%.tmp1669 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1668
%.tmp1670 = bitcast %m980$.Node.type* %.tmp1669 to i8*
call void(i8*) @free(i8* %.tmp1670)
%.tmp1671 = load %m980$.Node.type*, %m980$.Node.type** %c.1647
%.tmp1672 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1671, i32 0, i32 8
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1672
ret void
}
%m980$.AstContext.type = type {%m297$.Token.type*,%m980$.Rule.type**,%m296$.Error.type*,i32,i32}
define %m980$.AstContext.type* @m980$next_token.m980$.AstContext.typep.m980$.AstContext.typep(%m980$.AstContext.type* %.ctx.arg) {
%ctx = alloca %m980$.AstContext.type*
store %m980$.AstContext.type* %.ctx.arg, %m980$.AstContext.type** %ctx
%.tmp1673 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1674 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1673, i32 0, i32 0
%.tmp1675 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1676 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1675, i32 0, i32 0
%.tmp1677 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1676
%.tmp1678 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1677, i32 0, i32 5
%.tmp1679 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1678
store %m297$.Token.type* %.tmp1679, %m297$.Token.type** %.tmp1674
%.tmp1680 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1681 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1680, i32 0, i32 0
%.tmp1682 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1681
%ct.1683 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1682, %m297$.Token.type** %ct.1683
%.tmp1684 = load %m297$.Token.type*, %m297$.Token.type** %ct.1683
%.tmp1685 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1684, i32 0, i32 2
%.tmp1686 = load i32, i32* %.tmp1685
%.tmp1687 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1688 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1687, i32 0, i32 3
%.tmp1689 = load i32, i32* %.tmp1688
%.tmp1690 = icmp sgt i32 %.tmp1686, %.tmp1689
br i1 %.tmp1690, label %.if.true.1691, label %.if.false.1691
.if.true.1691:
%.tmp1692 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1693 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1692, i32 0, i32 3
%.tmp1694 = load %m297$.Token.type*, %m297$.Token.type** %ct.1683
%.tmp1695 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1694, i32 0, i32 2
%.tmp1696 = load i32, i32* %.tmp1695
store i32 %.tmp1696, i32* %.tmp1693
%.tmp1697 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1698 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1697, i32 0, i32 4
%.tmp1699 = load %m297$.Token.type*, %m297$.Token.type** %ct.1683
%.tmp1700 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1699, i32 0, i32 3
%.tmp1701 = load i32, i32* %.tmp1700
store i32 %.tmp1701, i32* %.tmp1698
br label %.if.end.1691
.if.false.1691:
%.tmp1702 = load %m297$.Token.type*, %m297$.Token.type** %ct.1683
%.tmp1703 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1702, i32 0, i32 2
%.tmp1704 = load i32, i32* %.tmp1703
%.tmp1705 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1706 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1705, i32 0, i32 3
%.tmp1707 = load i32, i32* %.tmp1706
%.tmp1708 = icmp eq i32 %.tmp1704, %.tmp1707
br i1 %.tmp1708, label %.if.true.1709, label %.if.false.1709
.if.true.1709:
%.tmp1710 = load %m297$.Token.type*, %m297$.Token.type** %ct.1683
%.tmp1711 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1710, i32 0, i32 3
%.tmp1712 = load i32, i32* %.tmp1711
%.tmp1713 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1714 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1713, i32 0, i32 4
%.tmp1715 = load i32, i32* %.tmp1714
%.tmp1716 = icmp sgt i32 %.tmp1712, %.tmp1715
br i1 %.tmp1716, label %.if.true.1717, label %.if.false.1717
.if.true.1717:
%.tmp1718 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1719 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1718, i32 0, i32 4
%.tmp1720 = load %m297$.Token.type*, %m297$.Token.type** %ct.1683
%.tmp1721 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1720, i32 0, i32 3
%.tmp1722 = load i32, i32* %.tmp1721
store i32 %.tmp1722, i32* %.tmp1719
br label %.if.end.1717
.if.false.1717:
br label %.if.end.1717
.if.end.1717:
br label %.if.end.1709
.if.false.1709:
br label %.if.end.1709
.if.end.1709:
br label %.if.end.1691
.if.end.1691:
%.tmp1723 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
ret %m980$.AstContext.type* %.tmp1723
}
define %m980$.Rule.type* @m980$find_rule.m980$.Rule.typep.m980$.Rule.typepp.cp(%m980$.Rule.type** %.grammar.arg, i8* %.rule_name.arg) {
%grammar = alloca %m980$.Rule.type**
store %m980$.Rule.type** %.grammar.arg, %m980$.Rule.type*** %grammar
%rule_name = alloca i8*
store i8* %.rule_name.arg, i8** %rule_name
%i.1725 = alloca i32
store i32 0, i32* %i.1725
br label %.for.start.1724
.for.start.1724:
br i1 1, label %.for.continue.1724, label %.for.end.1724
.for.continue.1724:
%.tmp1726 = load i32, i32* %i.1725
%.tmp1727 = load %m980$.Rule.type**, %m980$.Rule.type*** %grammar
%.tmp1728 = getelementptr %m980$.Rule.type*, %m980$.Rule.type** %.tmp1727, i32 %.tmp1726
%.tmp1729 = load %m980$.Rule.type*, %m980$.Rule.type** %.tmp1728
%rule.1730 = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.tmp1729, %m980$.Rule.type** %rule.1730
%.tmp1731 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1730
%.tmp1732 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1731, i32 0, i32 0
%.tmp1733 = load i8*, i8** %.tmp1732
%.tmp1734 = load i8*, i8** %rule_name
%.tmp1735 = call i32(i8*,i8*) @strcmp(i8* %.tmp1733, i8* %.tmp1734)
%.tmp1736 = icmp eq i32 %.tmp1735, 0
br i1 %.tmp1736, label %.if.true.1737, label %.if.false.1737
.if.true.1737:
%.tmp1738 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1730
ret %m980$.Rule.type* %.tmp1738
br label %.if.end.1737
.if.false.1737:
br label %.if.end.1737
.if.end.1737:
%.tmp1739 = load i32, i32* %i.1725
%.tmp1740 = add i32 %.tmp1739, 1
store i32 %.tmp1740, i32* %i.1725
br label %.for.start.1724
.for.end.1724:
%.tmp1741 = bitcast ptr null to %m980$.Rule.type*
ret %m980$.Rule.type* %.tmp1741
}
%m980$.ParseResult.type = type {%m296$.Error.type*,%m980$.Node.type*}
define %m980$.ParseResult.type* @m980$parse_to_ast.m980$.ParseResult.typep.m980$.AstContext.typep.m980$.Rule.typep(%m980$.AstContext.type* %.c.arg, %m980$.Rule.type* %.rule.arg) {
%c = alloca %m980$.AstContext.type*
store %m980$.AstContext.type* %.c.arg, %m980$.AstContext.type** %c
%rule = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.rule.arg, %m980$.Rule.type** %rule
%.tmp1742 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* null, i32 1
%.tmp1743 = ptrtoint %m980$.ParseResult.type* %.tmp1742 to i32
%.tmp1744 = call i8*(i32) @malloc(i32 %.tmp1743)
%.tmp1745 = bitcast i8* %.tmp1744 to %m980$.ParseResult.type*
%res.1746 = alloca %m980$.ParseResult.type*
store %m980$.ParseResult.type* %.tmp1745, %m980$.ParseResult.type** %res.1746
%.tmp1747 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1746
%.tmp1748 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1747, i32 0, i32 0
store %m296$.Error.type* null, %m296$.Error.type** %.tmp1748
%.tmp1749 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1746
%.tmp1750 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1749, i32 0, i32 1
%.tmp1751 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1752 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1751, i32 0, i32 0
%.tmp1753 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1752
%.tmp1754 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1755 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1754, i32 0, i32 0
%.tmp1756 = load i8*, i8** %.tmp1755
%.tmp1757 = bitcast ptr null to i8*
%.tmp1758 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1759 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1758, i32 0, i32 2
%.tmp1760 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1759
%.tmp1761 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1760, i32 0, i32 1
%.tmp1762 = load i8*, i8** %.tmp1761
%.tmp1763 = call %m980$.Node.type*(%m297$.Token.type*,i8*,i8*,i8*) @m980$new_node.m980$.Node.typep.m297$.Token.typep.cp.cp.cp(%m297$.Token.type* %.tmp1753, i8* %.tmp1756, i8* %.tmp1757, i8* %.tmp1762)
store %m980$.Node.type* %.tmp1763, %m980$.Node.type** %.tmp1750
%.tmp1764 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1765 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1764, i32 0, i32 0
%.tmp1766 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1765
%start_match.1767 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1766, %m297$.Token.type** %start_match.1767
%.tmp1768 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1746
%.tmp1769 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1768, i32 0, i32 0
%.tmp1770 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1771 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1772 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1773 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1772, i32 0, i32 2
%.tmp1774 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1773
%.tmp1775 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1746
%.tmp1776 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1775, i32 0, i32 1
%.tmp1777 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1776
%.tmp1778 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp1770, %m980$.Rule.type* %.tmp1771, %m980$.Matcher.type* %.tmp1774, %m980$.Node.type* %.tmp1777)
store %m296$.Error.type* %.tmp1778, %m296$.Error.type** %.tmp1769
%.tmp1779 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1746
%.tmp1780 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1779, i32 0, i32 0
%.tmp1781 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1780
%.tmp1782 = icmp ne %m296$.Error.type* %.tmp1781, null
br i1 %.tmp1782, label %.if.true.1783, label %.if.false.1783
.if.true.1783:
%.tmp1784 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1746
%.tmp1785 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1784, i32 0, i32 0
%.tmp1786 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1785
%.tmp1787 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp1786, i32 0, i32 0
%.tmp1788 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1789 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1788, i32 0, i32 3
%.tmp1790 = load i32, i32* %.tmp1789
store i32 %.tmp1790, i32* %.tmp1787
%.tmp1791 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1746
%.tmp1792 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1791, i32 0, i32 0
%.tmp1793 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1792
%.tmp1794 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp1793, i32 0, i32 1
%.tmp1795 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1796 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1795, i32 0, i32 4
%.tmp1797 = load i32, i32* %.tmp1796
store i32 %.tmp1797, i32* %.tmp1794
br label %.if.end.1783
.if.false.1783:
br label %.if.end.1783
.if.end.1783:
%.tmp1798 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1746
ret %m980$.ParseResult.type* %.tmp1798
}
define %m296$.Error.type* @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.ctx.arg, %m980$.Rule.type* %.rule.arg, %m980$.Matcher.type* %.matcher.arg, %m980$.Node.type* %.root.arg) {
%ctx = alloca %m980$.AstContext.type*
store %m980$.AstContext.type* %.ctx.arg, %m980$.AstContext.type** %ctx
%rule = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.rule.arg, %m980$.Rule.type** %rule
%matcher = alloca %m980$.Matcher.type*
store %m980$.Matcher.type* %.matcher.arg, %m980$.Matcher.type** %matcher
%root = alloca %m980$.Node.type*
store %m980$.Node.type* %.root.arg, %m980$.Node.type** %root
%.tmp1799 = bitcast ptr null to %m296$.Error.type*
%err.1800 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1799, %m296$.Error.type** %err.1800
%.tmp1802 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%m.1803 = alloca %m980$.Matcher.type*
store %m980$.Matcher.type* %.tmp1802, %m980$.Matcher.type** %m.1803
br label %.for.start.1801
.for.start.1801:
%.tmp1804 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1803
%.tmp1805 = icmp ne %m980$.Matcher.type* %.tmp1804, null
br i1 %.tmp1805, label %.for.continue.1801, label %.for.end.1801
.for.continue.1801:
%.tmp1806 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1807 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1808 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1803
%.tmp1809 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp1810 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher_straight.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp1806, %m980$.Rule.type* %.tmp1807, %m980$.Matcher.type* %.tmp1808, %m980$.Node.type* %.tmp1809)
store %m296$.Error.type* %.tmp1810, %m296$.Error.type** %err.1800
%.tmp1811 = load %m296$.Error.type*, %m296$.Error.type** %err.1800
%.tmp1812 = icmp eq %m296$.Error.type* %.tmp1811, null
br i1 %.tmp1812, label %.if.true.1813, label %.if.false.1813
.if.true.1813:
br label %.for.end.1801
br label %.if.end.1813
.if.false.1813:
br label %.if.end.1813
.if.end.1813:
%.tmp1814 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1803
%.tmp1815 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1814, i32 0, i32 2
%.tmp1816 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1815
store %m980$.Matcher.type* %.tmp1816, %m980$.Matcher.type** %m.1803
br label %.for.start.1801
.for.end.1801:
%.tmp1817 = load %m296$.Error.type*, %m296$.Error.type** %err.1800
ret %m296$.Error.type* %.tmp1817
}
define %m296$.Error.type* @m980$execute_matcher_straight.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.ctx.arg, %m980$.Rule.type* %.rule.arg, %m980$.Matcher.type* %.matcher.arg, %m980$.Node.type* %.root.arg) {
%ctx = alloca %m980$.AstContext.type*
store %m980$.AstContext.type* %.ctx.arg, %m980$.AstContext.type** %ctx
%rule = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.rule.arg, %m980$.Rule.type** %rule
%matcher = alloca %m980$.Matcher.type*
store %m980$.Matcher.type* %.matcher.arg, %m980$.Matcher.type** %matcher
%root = alloca %m980$.Node.type*
store %m980$.Node.type* %.root.arg, %m980$.Node.type** %root
%.tmp1819 = getelementptr [1 x i8], [1 x i8]*@.str1818, i32 0, i32 0
%buf.1820 = alloca i8*
store i8* %.tmp1819, i8** %buf.1820
%.tmp1821 = bitcast ptr null to %m296$.Error.type*
%err.1822 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1821, %m296$.Error.type** %err.1822
%.tmp1823 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1824 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1823, i32 0, i32 0
%.tmp1825 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1824
%anchor.1826 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1825, %m297$.Token.type** %anchor.1826
%.tmp1827 = bitcast ptr null to %m980$.Node.type*
%child.1828 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp1827, %m980$.Node.type** %child.1828
%.tmp1829 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1830 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1829, i32 0, i32 5
%.tmp1831 = load i8, i8* %.tmp1830
%.tmp1832 = load i8, i8* @TYPE_IGNORE
%.tmp1833 = icmp eq i8 %.tmp1831, %.tmp1832
br i1 %.tmp1833, label %.if.true.1834, label %.if.false.1834
.if.true.1834:
%.tmp1835 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1836 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1835, i32 0, i32 4
%.tmp1837 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1836
%.tmp1838 = icmp ne %m980$.Matcher.type* %.tmp1837, null
br i1 %.tmp1838, label %.if.true.1839, label %.if.false.1839
.if.true.1839:
%.tmp1840 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1841 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1842 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1843 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1842, i32 0, i32 4
%.tmp1844 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1843
%.tmp1845 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp1846 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp1840, %m980$.Rule.type* %.tmp1841, %m980$.Matcher.type* %.tmp1844, %m980$.Node.type* %.tmp1845)
store %m296$.Error.type* %.tmp1846, %m296$.Error.type** %err.1822
br label %.if.end.1839
.if.false.1839:
br label %.if.end.1839
.if.end.1839:
br label %.if.end.1834
.if.false.1834:
%.tmp1847 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1848 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1847, i32 0, i32 5
%.tmp1849 = load i8, i8* %.tmp1848
%.tmp1850 = load i8, i8* @TYPE_VALUE
%.tmp1851 = icmp eq i8 %.tmp1849, %.tmp1850
br i1 %.tmp1851, label %.if.true.1852, label %.if.false.1852
.if.true.1852:
%.tmp1853 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1854 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1853, i32 0, i32 6
%.tmp1855 = load i8*, i8** %.tmp1854
%.tmp1856 = icmp eq i8* %.tmp1855, null
br i1 %.tmp1856, label %.if.true.1857, label %.if.false.1857
.if.true.1857:
%.tmp1859 = getelementptr [22 x i8], [22 x i8]*@.str1858, i32 0, i32 0
%.tmp1860 = call i32(i8*,...) @printf(i8* %.tmp1859)
br label %.if.end.1857
.if.false.1857:
br label %.if.end.1857
.if.end.1857:
%.tmp1861 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1862 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1861, i32 0, i32 6
%.tmp1863 = load i8*, i8** %.tmp1862
%.tmp1864 = call i32(i8*) @strlen(i8* %.tmp1863)
%.tmp1865 = sub i32 %.tmp1864, 1
%.tmp1866 = call i8*(i32) @malloc(i32 %.tmp1865)
%buf.1867 = alloca i8*
store i8* %.tmp1866, i8** %buf.1867
%.tmp1868 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1869 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1868, i32 0, i32 6
%.tmp1870 = load i8*, i8** %.tmp1869
%.tmp1872 = getelementptr [8 x i8], [8 x i8]*@.str1871, i32 0, i32 0
%.tmp1873 = load i8*, i8** %buf.1867
%.tmp1874 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1870, i8* %.tmp1872, i8* %.tmp1873)
%.tmp1875 = load i8*, i8** %buf.1867
%.tmp1876 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1877 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1876, i32 0, i32 0
%.tmp1878 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1877
%.tmp1879 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1878, i32 0, i32 1
%.tmp1880 = load i8*, i8** %.tmp1879
%.tmp1881 = call i32(i8*,i8*) @strcmp(i8* %.tmp1875, i8* %.tmp1880)
%.tmp1882 = icmp ne i32 %.tmp1881, 0
br i1 %.tmp1882, label %.if.true.1883, label %.if.false.1883
.if.true.1883:
%.tmp1884 = getelementptr i8*, i8** %buf.1867, i32 0
%.tmp1886 = getelementptr [43 x i8], [43 x i8]*@.str1885, i32 0, i32 0
%.tmp1887 = load i8*, i8** %buf.1867
%.tmp1888 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1889 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1888, i32 0, i32 0
%.tmp1890 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1889
%.tmp1891 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1890, i32 0, i32 1
%.tmp1892 = load i8*, i8** %.tmp1891
%.tmp1893 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1884, i8* %.tmp1886, i8* %.tmp1887, i8* %.tmp1892)
%.tmp1894 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1895 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1894, i32 0, i32 0
%.tmp1896 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1895
%.tmp1897 = load i8*, i8** %buf.1867
%.tmp1898 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1896, i8* %.tmp1897)
ret %m296$.Error.type* %.tmp1898
br label %.if.end.1883
.if.false.1883:
br label %.if.end.1883
.if.end.1883:
%.tmp1899 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1900 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1899, i32 0, i32 0
%.tmp1901 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1900
%.tmp1902 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1903 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1902, i32 0, i32 0
%.tmp1904 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1903
%.tmp1905 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1904, i32 0, i32 0
%.tmp1906 = load i8*, i8** %.tmp1905
%.tmp1907 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1908 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1907, i32 0, i32 0
%.tmp1909 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1908
%.tmp1910 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1909, i32 0, i32 1
%.tmp1911 = load i8*, i8** %.tmp1910
%.tmp1912 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1913 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1912, i32 0, i32 1
%.tmp1914 = load i8*, i8** %.tmp1913
%.tmp1915 = call %m980$.Node.type*(%m297$.Token.type*,i8*,i8*,i8*) @m980$new_node.m980$.Node.typep.m297$.Token.typep.cp.cp.cp(%m297$.Token.type* %.tmp1901, i8* %.tmp1906, i8* %.tmp1911, i8* %.tmp1914)
store %m980$.Node.type* %.tmp1915, %m980$.Node.type** %child.1828
%.tmp1916 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1917 = call %m980$.AstContext.type*(%m980$.AstContext.type*) @m980$next_token.m980$.AstContext.typep.m980$.AstContext.typep(%m980$.AstContext.type* %.tmp1916)
store %m980$.AstContext.type* %.tmp1917, %m980$.AstContext.type** %ctx
br label %.if.end.1852
.if.false.1852:
%.tmp1918 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1919 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1918, i32 0, i32 5
%.tmp1920 = load i8, i8* %.tmp1919
%.tmp1921 = load i8, i8* @TYPE_TYPE
%.tmp1922 = icmp eq i8 %.tmp1920, %.tmp1921
br i1 %.tmp1922, label %.if.true.1923, label %.if.false.1923
.if.true.1923:
%.tmp1924 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1925 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1924, i32 0, i32 6
%.tmp1926 = load i8*, i8** %.tmp1925
%.tmp1927 = icmp eq i8* %.tmp1926, null
br i1 %.tmp1927, label %.if.true.1928, label %.if.false.1928
.if.true.1928:
%.tmp1930 = getelementptr [22 x i8], [22 x i8]*@.str1929, i32 0, i32 0
%.tmp1931 = call i32(i8*,...) @printf(i8* %.tmp1930)
br label %.if.end.1928
.if.false.1928:
br label %.if.end.1928
.if.end.1928:
%.tmp1932 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1933 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1932, i32 0, i32 6
%.tmp1934 = load i8*, i8** %.tmp1933
%.tmp1935 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1936 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1935, i32 0, i32 0
%.tmp1937 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1936
%.tmp1938 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1937, i32 0, i32 0
%.tmp1939 = load i8*, i8** %.tmp1938
%.tmp1940 = call i32(i8*,i8*) @strcmp(i8* %.tmp1934, i8* %.tmp1939)
%.tmp1941 = icmp ne i32 %.tmp1940, 0
br i1 %.tmp1941, label %.if.true.1942, label %.if.false.1942
.if.true.1942:
%.tmp1943 = getelementptr i8*, i8** %buf.1820, i32 0
%.tmp1945 = getelementptr [54 x i8], [54 x i8]*@.str1944, i32 0, i32 0
%.tmp1946 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1947 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1946, i32 0, i32 6
%.tmp1948 = load i8*, i8** %.tmp1947
%.tmp1949 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1950 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1949, i32 0, i32 0
%.tmp1951 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1950
%.tmp1952 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1951, i32 0, i32 0
%.tmp1953 = load i8*, i8** %.tmp1952
%.tmp1954 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1943, i8* %.tmp1945, i8* %.tmp1948, i8* %.tmp1953)
%.tmp1955 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1956 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1955, i32 0, i32 0
%.tmp1957 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1956
%.tmp1958 = load i8*, i8** %buf.1820
%.tmp1959 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1957, i8* %.tmp1958)
ret %m296$.Error.type* %.tmp1959
br label %.if.end.1942
.if.false.1942:
br label %.if.end.1942
.if.end.1942:
%.tmp1960 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1961 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1960, i32 0, i32 0
%.tmp1962 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1961
%.tmp1963 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1964 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1963, i32 0, i32 0
%.tmp1965 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1964
%.tmp1966 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1965, i32 0, i32 0
%.tmp1967 = load i8*, i8** %.tmp1966
%.tmp1968 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1969 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1968, i32 0, i32 0
%.tmp1970 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1969
%.tmp1971 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1970, i32 0, i32 1
%.tmp1972 = load i8*, i8** %.tmp1971
%.tmp1973 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1974 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1973, i32 0, i32 1
%.tmp1975 = load i8*, i8** %.tmp1974
%.tmp1976 = call %m980$.Node.type*(%m297$.Token.type*,i8*,i8*,i8*) @m980$new_node.m980$.Node.typep.m297$.Token.typep.cp.cp.cp(%m297$.Token.type* %.tmp1962, i8* %.tmp1967, i8* %.tmp1972, i8* %.tmp1975)
store %m980$.Node.type* %.tmp1976, %m980$.Node.type** %child.1828
%.tmp1977 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1978 = call %m980$.AstContext.type*(%m980$.AstContext.type*) @m980$next_token.m980$.AstContext.typep.m980$.AstContext.typep(%m980$.AstContext.type* %.tmp1977)
store %m980$.AstContext.type* %.tmp1978, %m980$.AstContext.type** %ctx
br label %.if.end.1923
.if.false.1923:
%.tmp1979 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1980 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1979, i32 0, i32 5
%.tmp1981 = load i8, i8* %.tmp1980
%.tmp1982 = load i8, i8* @TYPE_ALIAS
%.tmp1983 = icmp eq i8 %.tmp1981, %.tmp1982
br i1 %.tmp1983, label %.if.true.1984, label %.if.false.1984
.if.true.1984:
%.tmp1985 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1986 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1985, i32 0, i32 1
%.tmp1987 = load %m980$.Rule.type**, %m980$.Rule.type*** %.tmp1986
%.tmp1988 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1989 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1988, i32 0, i32 6
%.tmp1990 = load i8*, i8** %.tmp1989
%.tmp1991 = call %m980$.Rule.type*(%m980$.Rule.type**,i8*) @m980$find_rule.m980$.Rule.typep.m980$.Rule.typepp.cp(%m980$.Rule.type** %.tmp1987, i8* %.tmp1990)
%alias_rule.1992 = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.tmp1991, %m980$.Rule.type** %alias_rule.1992
%.tmp1993 = load %m980$.Rule.type*, %m980$.Rule.type** %alias_rule.1992
%.tmp1994 = icmp eq %m980$.Rule.type* %.tmp1993, null
br i1 %.tmp1994, label %.if.true.1995, label %.if.false.1995
.if.true.1995:
%.tmp1996 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1997 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1996, i32 0, i32 0
%.tmp1998 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1997
%.tmp2000 = getelementptr [26 x i8], [26 x i8]*@.str1999, i32 0, i32 0
%.tmp2001 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1998, i8* %.tmp2000)
ret %m296$.Error.type* %.tmp2001
br label %.if.end.1995
.if.false.1995:
br label %.if.end.1995
.if.end.1995:
%.tmp2002 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp2003 = load %m980$.Rule.type*, %m980$.Rule.type** %alias_rule.1992
%.tmp2004 = call %m980$.ParseResult.type*(%m980$.AstContext.type*,%m980$.Rule.type*) @m980$parse_to_ast.m980$.ParseResult.typep.m980$.AstContext.typep.m980$.Rule.typep(%m980$.AstContext.type* %.tmp2002, %m980$.Rule.type* %.tmp2003)
%parse_result.2005 = alloca %m980$.ParseResult.type*
store %m980$.ParseResult.type* %.tmp2004, %m980$.ParseResult.type** %parse_result.2005
%.tmp2006 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %parse_result.2005
%.tmp2007 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp2006, i32 0, i32 0
%.tmp2008 = load %m296$.Error.type*, %m296$.Error.type** %.tmp2007
%.tmp2009 = icmp ne %m296$.Error.type* %.tmp2008, null
br i1 %.tmp2009, label %.if.true.2010, label %.if.false.2010
.if.true.2010:
%.tmp2011 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %parse_result.2005
%.tmp2012 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp2011, i32 0, i32 0
%.tmp2013 = load %m296$.Error.type*, %m296$.Error.type** %.tmp2012
ret %m296$.Error.type* %.tmp2013
br label %.if.end.2010
.if.false.2010:
br label %.if.end.2010
.if.end.2010:
%.tmp2014 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %parse_result.2005
%.tmp2015 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp2014, i32 0, i32 1
%.tmp2016 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2015
store %m980$.Node.type* %.tmp2016, %m980$.Node.type** %child.1828
br label %.if.end.1984
.if.false.1984:
%.tmp2018 = getelementptr [33 x i8], [33 x i8]*@.str2017, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp2018)
br label %.if.end.1984
.if.end.1984:
br label %.if.end.1923
.if.end.1923:
br label %.if.end.1852
.if.end.1852:
br label %.if.end.1834
.if.end.1834:
%.tmp2019 = load %m980$.Node.type*, %m980$.Node.type** %child.1828
%.tmp2020 = icmp ne %m980$.Node.type* %.tmp2019, null
br i1 %.tmp2020, label %.if.true.2021, label %.if.false.2021
.if.true.2021:
%.tmp2022 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2023 = load %m980$.Node.type*, %m980$.Node.type** %child.1828
call void(%m980$.Node.type*,%m980$.Node.type*) @m980$child_append.v.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.tmp2022, %m980$.Node.type* %.tmp2023)
br label %.if.end.2021
.if.false.2021:
br label %.if.end.2021
.if.end.2021:
%.tmp2024 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2025 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp2024, i32 0, i32 0
%.tmp2026 = load i8, i8* %.tmp2025
%.tmp2027 = icmp eq i8 %.tmp2026, 63
%.tmp2028 = load %m296$.Error.type*, %m296$.Error.type** %err.1822
%.tmp2029 = icmp ne %m296$.Error.type* %.tmp2028, null
%.tmp2030 = and i1 %.tmp2027, %.tmp2029
br i1 %.tmp2030, label %.if.true.2031, label %.if.false.2031
.if.true.2031:
store %m296$.Error.type* null, %m296$.Error.type** %err.1822
br label %.if.end.2031
.if.false.2031:
%.tmp2032 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2033 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp2032, i32 0, i32 0
%.tmp2034 = load i8, i8* %.tmp2033
%.tmp2035 = icmp eq i8 %.tmp2034, 42
br i1 %.tmp2035, label %.if.true.2036, label %.if.false.2036
.if.true.2036:
%.tmp2037 = load %m296$.Error.type*, %m296$.Error.type** %err.1822
%.tmp2038 = icmp ne %m296$.Error.type* %.tmp2037, null
br i1 %.tmp2038, label %.if.true.2039, label %.if.false.2039
.if.true.2039:
store %m296$.Error.type* null, %m296$.Error.type** %err.1822
br label %.if.end.2039
.if.false.2039:
%.tmp2040 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp2041 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp2042 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2043 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2044 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp2040, %m980$.Rule.type* %.tmp2041, %m980$.Matcher.type* %.tmp2042, %m980$.Node.type* %.tmp2043)
ret %m296$.Error.type* %.tmp2044
br label %.if.end.2039
.if.end.2039:
br label %.if.end.2036
.if.false.2036:
%.tmp2045 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2046 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp2045, i32 0, i32 0
%.tmp2047 = load i8, i8* %.tmp2046
%.tmp2048 = icmp eq i8 %.tmp2047, 43
%.tmp2049 = load %m296$.Error.type*, %m296$.Error.type** %err.1822
%.tmp2050 = icmp eq %m296$.Error.type* %.tmp2049, null
%.tmp2051 = and i1 %.tmp2048, %.tmp2050
br i1 %.tmp2051, label %.if.true.2052, label %.if.false.2052
.if.true.2052:
%.tmp2053 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp2054 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp2055 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2056 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2057 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp2053, %m980$.Rule.type* %.tmp2054, %m980$.Matcher.type* %.tmp2055, %m980$.Node.type* %.tmp2056)
store %m296$.Error.type* %.tmp2057, %m296$.Error.type** %err.1822
%.tmp2058 = load %m296$.Error.type*, %m296$.Error.type** %err.1822
%.tmp2059 = icmp ne %m296$.Error.type* %.tmp2058, null
br i1 %.tmp2059, label %.if.true.2060, label %.if.false.2060
.if.true.2060:
store %m296$.Error.type* null, %m296$.Error.type** %err.1822
br label %.if.end.2060
.if.false.2060:
%.tmp2061 = bitcast ptr null to %m296$.Error.type*
ret %m296$.Error.type* %.tmp2061
br label %.if.end.2060
.if.end.2060:
br label %.if.end.2052
.if.false.2052:
br label %.if.end.2052
.if.end.2052:
br label %.if.end.2036
.if.end.2036:
br label %.if.end.2031
.if.end.2031:
%.tmp2062 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2063 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp2062, i32 0, i32 3
%.tmp2064 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp2063
%.tmp2065 = icmp ne %m980$.Matcher.type* %.tmp2064, null
%.tmp2066 = load %m296$.Error.type*, %m296$.Error.type** %err.1822
%.tmp2067 = icmp eq %m296$.Error.type* %.tmp2066, null
%.tmp2068 = and i1 %.tmp2065, %.tmp2067
br i1 %.tmp2068, label %.if.true.2069, label %.if.false.2069
.if.true.2069:
%.tmp2070 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp2071 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp2072 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2073 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp2072, i32 0, i32 3
%.tmp2074 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp2073
%.tmp2075 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2076 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp2070, %m980$.Rule.type* %.tmp2071, %m980$.Matcher.type* %.tmp2074, %m980$.Node.type* %.tmp2075)
store %m296$.Error.type* %.tmp2076, %m296$.Error.type** %err.1822
br label %.if.end.2069
.if.false.2069:
br label %.if.end.2069
.if.end.2069:
%.tmp2077 = load %m296$.Error.type*, %m296$.Error.type** %err.1822
%.tmp2078 = icmp ne %m296$.Error.type* %.tmp2077, null
br i1 %.tmp2078, label %.if.true.2079, label %.if.false.2079
.if.true.2079:
%.tmp2080 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp2081 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp2080, i32 0, i32 0
%.tmp2082 = load %m297$.Token.type*, %m297$.Token.type** %anchor.1826
store %m297$.Token.type* %.tmp2082, %m297$.Token.type** %.tmp2081
%.tmp2083 = load %m980$.Node.type*, %m980$.Node.type** %child.1828
%.tmp2084 = icmp ne %m980$.Node.type* %.tmp2083, null
br i1 %.tmp2084, label %.if.true.2085, label %.if.false.2085
.if.true.2085:
%.tmp2086 = load %m980$.Node.type*, %m980$.Node.type** %root
call void(%m980$.Node.type*) @m980$child_pop.v.m980$.Node.typep(%m980$.Node.type* %.tmp2086)
br label %.if.end.2085
.if.false.2085:
br label %.if.end.2085
.if.end.2085:
br label %.if.end.2079
.if.false.2079:
br label %.if.end.2079
.if.end.2079:
%.tmp2087 = load %m296$.Error.type*, %m296$.Error.type** %err.1822
ret %m296$.Error.type* %.tmp2087
}
define %m980$.ParseResult.type* @m980$ast.m980$.ParseResult.typep.m980$.Rule.typepp.cp.m297$.Token.typep(%m980$.Rule.type** %.grammar.arg, i8* %.start.arg, %m297$.Token.type* %.tokens.arg) {
%grammar = alloca %m980$.Rule.type**
store %m980$.Rule.type** %.grammar.arg, %m980$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m297$.Token.type*
store %m297$.Token.type* %.tokens.arg, %m297$.Token.type** %tokens
%.tmp2088 = load %m980$.Rule.type**, %m980$.Rule.type*** %grammar
%.tmp2089 = load i8*, i8** %start
%.tmp2090 = call %m980$.Rule.type*(%m980$.Rule.type**,i8*) @m980$find_rule.m980$.Rule.typep.m980$.Rule.typepp.cp(%m980$.Rule.type** %.tmp2088, i8* %.tmp2089)
%start_matcher.2091 = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.tmp2090, %m980$.Rule.type** %start_matcher.2091
%.tmp2092 = load %m980$.Rule.type*, %m980$.Rule.type** %start_matcher.2091
%.tmp2093 = icmp ne %m980$.Rule.type* %.tmp2092, null
%.tmp2095 = getelementptr [44 x i8], [44 x i8]*@.str2094, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2093, i8* %.tmp2095)
%c.2096 = alloca %m980$.AstContext.type
%.tmp2097 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2096, i32 0, i32 0
store %m297$.Token.type* null, %m297$.Token.type** %.tmp2097
%.tmp2098 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2096, i32 0, i32 1
store %m980$.Rule.type** null, %m980$.Rule.type*** %.tmp2098
%.tmp2099 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2096, i32 0, i32 2
store %m296$.Error.type* null, %m296$.Error.type** %.tmp2099
%.tmp2100 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2096, i32 0, i32 3
store i32 0, i32* %.tmp2100
%.tmp2101 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2096, i32 0, i32 4
store i32 0, i32* %.tmp2101
%.tmp2102 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2096, i32 0, i32 0
%.tmp2103 = load %m297$.Token.type*, %m297$.Token.type** %tokens
store %m297$.Token.type* %.tmp2103, %m297$.Token.type** %.tmp2102
%.tmp2104 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2096, i32 0, i32 1
%.tmp2105 = load %m980$.Rule.type**, %m980$.Rule.type*** %grammar
store %m980$.Rule.type** %.tmp2105, %m980$.Rule.type*** %.tmp2104
%.tmp2106 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2096, i32 0
%.tmp2107 = load %m980$.Rule.type*, %m980$.Rule.type** %start_matcher.2091
%.tmp2108 = call %m980$.ParseResult.type*(%m980$.AstContext.type*,%m980$.Rule.type*) @m980$parse_to_ast.m980$.ParseResult.typep.m980$.AstContext.typep.m980$.Rule.typep(%m980$.AstContext.type* %.tmp2106, %m980$.Rule.type* %.tmp2107)
%res.2109 = alloca %m980$.ParseResult.type*
store %m980$.ParseResult.type* %.tmp2108, %m980$.ParseResult.type** %res.2109
%.tmp2110 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2096, i32 0, i32 0
%.tmp2111 = load %m297$.Token.type*, %m297$.Token.type** %.tmp2110
%.tmp2112 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp2111, i32 0, i32 0
%.tmp2113 = load i8*, i8** %.tmp2112
%.tmp2115 = getelementptr [4 x i8], [4 x i8]*@.str2114, i32 0, i32 0
%.tmp2116 = call i32(i8*,i8*) @strcmp(i8* %.tmp2113, i8* %.tmp2115)
%.tmp2117 = icmp ne i32 %.tmp2116, 0
%.tmp2118 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.2109
%.tmp2119 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp2118, i32 0, i32 0
%.tmp2120 = load %m296$.Error.type*, %m296$.Error.type** %.tmp2119
%.tmp2121 = icmp eq %m296$.Error.type* %.tmp2120, null
%.tmp2122 = and i1 %.tmp2117, %.tmp2121
br i1 %.tmp2122, label %.if.true.2123, label %.if.false.2123
.if.true.2123:
%.tmp2124 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.2109
%.tmp2125 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp2124, i32 0, i32 0
%.tmp2126 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2096, i32 0, i32 0
%.tmp2127 = load %m297$.Token.type*, %m297$.Token.type** %.tmp2126
%.tmp2129 = getelementptr [32 x i8], [32 x i8]*@.str2128, i32 0, i32 0
%.tmp2130 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp2127, i8* %.tmp2129)
store %m296$.Error.type* %.tmp2130, %m296$.Error.type** %.tmp2125
br label %.if.end.2123
.if.false.2123:
br label %.if.end.2123
.if.end.2123:
%.tmp2131 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.2109
ret %m980$.ParseResult.type* %.tmp2131
}
define %m980$.Node.type* @m980$find_tag.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.root.arg, i8* %.tag.arg) {
%root = alloca %m980$.Node.type*
store %m980$.Node.type* %.root.arg, %m980$.Node.type** %root
%tag = alloca i8*
store i8* %.tag.arg, i8** %tag
%.tmp2132 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2133 = icmp eq %m980$.Node.type* %.tmp2132, null
br i1 %.tmp2133, label %.if.true.2134, label %.if.false.2134
.if.true.2134:
%.tmp2135 = bitcast ptr null to %m980$.Node.type*
ret %m980$.Node.type* %.tmp2135
br label %.if.end.2134
.if.false.2134:
br label %.if.end.2134
.if.end.2134:
%.tmp2136 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2137 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2136, i32 0, i32 5
%.tmp2138 = load i8*, i8** %.tmp2137
%.tmp2139 = load i8*, i8** %tag
%.tmp2140 = call i32(i8*,i8*) @strcmp(i8* %.tmp2138, i8* %.tmp2139)
%.tmp2141 = icmp eq i32 %.tmp2140, 0
br i1 %.tmp2141, label %.if.true.2142, label %.if.false.2142
.if.true.2142:
%.tmp2143 = load %m980$.Node.type*, %m980$.Node.type** %root
ret %m980$.Node.type* %.tmp2143
br label %.if.end.2142
.if.false.2142:
br label %.if.end.2142
.if.end.2142:
%.tmp2145 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2146 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2145, i32 0, i32 8
%.tmp2147 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2146
%n.2148 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp2147, %m980$.Node.type** %n.2148
br label %.for.start.2144
.for.start.2144:
%.tmp2149 = load %m980$.Node.type*, %m980$.Node.type** %n.2148
%.tmp2150 = icmp ne %m980$.Node.type* %.tmp2149, null
br i1 %.tmp2150, label %.for.continue.2144, label %.for.end.2144
.for.continue.2144:
%.tmp2151 = load %m980$.Node.type*, %m980$.Node.type** %n.2148
%.tmp2152 = load i8*, i8** %tag
%.tmp2153 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m980$find_tag.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp2151, i8* %.tmp2152)
%node.2154 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp2153, %m980$.Node.type** %node.2154
%.tmp2155 = load %m980$.Node.type*, %m980$.Node.type** %node.2154
%.tmp2156 = icmp ne %m980$.Node.type* %.tmp2155, null
br i1 %.tmp2156, label %.if.true.2157, label %.if.false.2157
.if.true.2157:
%.tmp2158 = load %m980$.Node.type*, %m980$.Node.type** %node.2154
ret %m980$.Node.type* %.tmp2158
br label %.if.end.2157
.if.false.2157:
br label %.if.end.2157
.if.end.2157:
%.tmp2159 = load %m980$.Node.type*, %m980$.Node.type** %n.2148
%.tmp2160 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2159, i32 0, i32 8
%.tmp2161 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2160
store %m980$.Node.type* %.tmp2161, %m980$.Node.type** %n.2148
br label %.for.start.2144
.for.end.2144:
%.tmp2163 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2164 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2163, i32 0, i32 7
%.tmp2165 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2164
%n.2166 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp2165, %m980$.Node.type** %n.2166
br label %.for.start.2162
.for.start.2162:
%.tmp2167 = load %m980$.Node.type*, %m980$.Node.type** %n.2166
%.tmp2168 = icmp ne %m980$.Node.type* %.tmp2167, null
br i1 %.tmp2168, label %.for.continue.2162, label %.for.end.2162
.for.continue.2162:
%.tmp2169 = load %m980$.Node.type*, %m980$.Node.type** %n.2166
%.tmp2170 = load i8*, i8** %tag
%.tmp2171 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m980$find_tag.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp2169, i8* %.tmp2170)
%node.2172 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp2171, %m980$.Node.type** %node.2172
%.tmp2173 = load %m980$.Node.type*, %m980$.Node.type** %node.2172
%.tmp2174 = icmp ne %m980$.Node.type* %.tmp2173, null
br i1 %.tmp2174, label %.if.true.2175, label %.if.false.2175
.if.true.2175:
%.tmp2176 = load %m980$.Node.type*, %m980$.Node.type** %node.2172
ret %m980$.Node.type* %.tmp2176
br label %.if.end.2175
.if.false.2175:
br label %.if.end.2175
.if.end.2175:
%.tmp2177 = load %m980$.Node.type*, %m980$.Node.type** %n.2166
%.tmp2178 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2177, i32 0, i32 8
%.tmp2179 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2178
store %m980$.Node.type* %.tmp2179, %m980$.Node.type** %n.2166
br label %.for.start.2162
.for.end.2162:
%.tmp2180 = bitcast ptr null to %m980$.Node.type*
ret %m980$.Node.type* %.tmp2180
}
define i8* @m2181$node_to_string.cp.m980$.Node.typep(%m980$.Node.type* %.n.arg) {
%n = alloca %m980$.Node.type*
store %m980$.Node.type* %.n.arg, %m980$.Node.type** %n
%.tmp2182 = call %m0$.File.type*() @tmpfile()
%tmp.2183 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2182, %m0$.File.type** %tmp.2183
%.tmp2184 = load %m980$.Node.type*, %m980$.Node.type** %n
%.tmp2185 = load %m0$.File.type*, %m0$.File.type** %tmp.2183
call void(%m980$.Node.type*,%m0$.File.type*,i32) @m2181$_node_to_string.v.m980$.Node.typep.m0$.File.typep.i(%m980$.Node.type* %.tmp2184, %m0$.File.type* %.tmp2185, i32 1)
%.tmp2186 = load %m0$.File.type*, %m0$.File.type** %tmp.2183
%.tmp2187 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp2186)
%.tmp2188 = load %m0$.File.type*, %m0$.File.type** %tmp.2183
%.tmp2189 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp2188)
%str_len.2190 = alloca i32
store i32 %.tmp2189, i32* %str_len.2190
%.tmp2191 = load %m0$.File.type*, %m0$.File.type** %tmp.2183
%.tmp2192 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp2191)
%tmp_fd.2193 = alloca i32
store i32 %.tmp2192, i32* %tmp_fd.2193
%.tmp2194 = load i32, i32* %tmp_fd.2193
%.tmp2195 = load i32, i32* @SEEK_SET
%.tmp2196 = call i32(i32,i32,i32) @lseek(i32 %.tmp2194, i32 0, i32 %.tmp2195)
%.tmp2197 = load i32, i32* %str_len.2190
%.tmp2198 = call i8*(i32) @malloc(i32 %.tmp2197)
%buf.2199 = alloca i8*
store i8* %.tmp2198, i8** %buf.2199
%.tmp2200 = load i32, i32* %tmp_fd.2193
%.tmp2201 = load i8*, i8** %buf.2199
%.tmp2202 = load i32, i32* %str_len.2190
%.tmp2203 = call i32(i32,i8*,i32) @read(i32 %.tmp2200, i8* %.tmp2201, i32 %.tmp2202)
%read.2204 = alloca i32
store i32 %.tmp2203, i32* %read.2204
%.tmp2205 = load i32, i32* %read.2204
%.tmp2206 = load i32, i32* %str_len.2190
%.tmp2207 = icmp ne i32 %.tmp2205, %.tmp2206
br i1 %.tmp2207, label %.if.true.2208, label %.if.false.2208
.if.true.2208:
%.tmp2209 = load i8*, i8** %buf.2199
call void(i8*) @free(i8* %.tmp2209)
store i8* null, i8** %buf.2199
br label %.if.end.2208
.if.false.2208:
br label %.if.end.2208
.if.end.2208:
%.tmp2210 = load i8*, i8** %buf.2199
ret i8* %.tmp2210
}
define void @m2181$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2211 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2213 = getelementptr [2 x i8], [2 x i8]*@.str2212, i32 0, i32 0
%.tmp2214 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2211, i8* %.tmp2213)
%i.2216 = alloca i32
store i32 0, i32* %i.2216
br label %.for.start.2215
.for.start.2215:
%.tmp2217 = load i32, i32* %i.2216
%.tmp2218 = load i32, i32* %indent
%.tmp2219 = icmp slt i32 %.tmp2217, %.tmp2218
br i1 %.tmp2219, label %.for.continue.2215, label %.for.end.2215
.for.continue.2215:
%.tmp2220 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2222 = getelementptr [3 x i8], [3 x i8]*@.str2221, i32 0, i32 0
%.tmp2223 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2220, i8* %.tmp2222)
%.tmp2224 = load i32, i32* %i.2216
%.tmp2225 = add i32 %.tmp2224, 1
store i32 %.tmp2225, i32* %i.2216
br label %.for.start.2215
.for.end.2215:
ret void
}
define void @m2181$_node_to_string.v.m980$.Node.typep.m0$.File.typep.i(%m980$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m980$.Node.type*
store %m980$.Node.type* %.node.arg, %m980$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2226 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2227 = icmp eq %m980$.Node.type* %.tmp2226, null
br i1 %.tmp2227, label %.if.true.2228, label %.if.false.2228
.if.true.2228:
%.tmp2229 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2231 = getelementptr [7 x i8], [7 x i8]*@.str2230, i32 0, i32 0
%.tmp2232 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2229, i8* %.tmp2231)
ret void
br label %.if.end.2228
.if.false.2228:
br label %.if.end.2228
.if.end.2228:
%.tmp2233 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2235 = getelementptr [2 x i8], [2 x i8]*@.str2234, i32 0, i32 0
%.tmp2236 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2233, i8* %.tmp2235)
%.tmp2237 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2238 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2181$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2237, i32 %.tmp2238)
%.tmp2239 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2241 = getelementptr [13 x i8], [13 x i8]*@.str2240, i32 0, i32 0
%.tmp2242 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2243 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2242, i32 0, i32 0
%.tmp2244 = load i8*, i8** %.tmp2243
%.tmp2245 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2239, i8* %.tmp2241, i8* %.tmp2244)
%.tmp2246 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2247 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2181$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2246, i32 %.tmp2247)
%.tmp2248 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2250 = getelementptr [12 x i8], [12 x i8]*@.str2249, i32 0, i32 0
%.tmp2251 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2252 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2251, i32 0, i32 1
%.tmp2253 = load i8*, i8** %.tmp2252
%.tmp2254 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2248, i8* %.tmp2250, i8* %.tmp2253)
%.tmp2255 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2256 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2181$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2255, i32 %.tmp2256)
%.tmp2257 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2259 = getelementptr [11 x i8], [11 x i8]*@.str2258, i32 0, i32 0
%.tmp2260 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2261 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2260, i32 0, i32 3
%.tmp2262 = load i32, i32* %.tmp2261
%.tmp2263 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2257, i8* %.tmp2259, i32 %.tmp2262)
%.tmp2264 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2265 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2181$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2264, i32 %.tmp2265)
%.tmp2266 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2268 = getelementptr [19 x i8], [19 x i8]*@.str2267, i32 0, i32 0
%.tmp2269 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2270 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2269, i32 0, i32 4
%.tmp2271 = load i32, i32* %.tmp2270
%.tmp2272 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2266, i8* %.tmp2268, i32 %.tmp2271)
%.tmp2273 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2274 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2181$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2273, i32 %.tmp2274)
%.tmp2275 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2277 = getelementptr [9 x i8], [9 x i8]*@.str2276, i32 0, i32 0
%.tmp2278 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2275, i8* %.tmp2277)
%.tmp2279 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2280 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2279, i32 0, i32 8
%.tmp2281 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2280
%.tmp2282 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2283 = load i32, i32* %indent
%.tmp2284 = add i32 %.tmp2283, 1
call void(%m980$.Node.type*,%m0$.File.type*,i32) @m2181$_node_to_string.v.m980$.Node.typep.m0$.File.typep.i(%m980$.Node.type* %.tmp2281, %m0$.File.type* %.tmp2282, i32 %.tmp2284)
%.tmp2285 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2286 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2181$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2285, i32 %.tmp2286)
%.tmp2287 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2289 = getelementptr [13 x i8], [13 x i8]*@.str2288, i32 0, i32 0
%.tmp2290 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2287, i8* %.tmp2289)
%.tmp2291 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2292 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2291, i32 0, i32 7
%.tmp2293 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2292
%.tmp2294 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2295 = load i32, i32* %indent
%.tmp2296 = add i32 %.tmp2295, 1
call void(%m980$.Node.type*,%m0$.File.type*,i32) @m2181$_node_to_string.v.m980$.Node.typep.m0$.File.typep.i(%m980$.Node.type* %.tmp2293, %m0$.File.type* %.tmp2294, i32 %.tmp2296)
%.tmp2297 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2298 = load i32, i32* %indent
%.tmp2299 = sub i32 %.tmp2298, 1
call void(%m0$.File.type*,i32) @m2181$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2297, i32 %.tmp2299)
%.tmp2300 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2302 = getelementptr [2 x i8], [2 x i8]*@.str2301, i32 0, i32 0
%.tmp2303 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2300, i8* %.tmp2302)
ret void
}
define i8* @m2304$grammar.cp() {
%.tmp2306 = getelementptr [1886 x i8], [1886 x i8]*@.str2305, i32 0, i32 0
ret i8* %.tmp2306
}
define i8* @m2307$append_tmpl.cp() {
%.tmp2309 = getelementptr [1885 x i8], [1885 x i8]*@.str2308, i32 0, i32 0
ret i8* %.tmp2309
}
define i8* @m2310$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2311 = load i8*, i8** %text
%.tmp2312 = call i32(i8*) @strlen(i8* %.tmp2311)
%str_len.2313 = alloca i32
store i32 %.tmp2312, i32* %str_len.2313
%.tmp2315 = getelementptr [1 x i8], [1 x i8]*@.str2314, i32 0, i32 0
%buf.2316 = alloca i8*
store i8* %.tmp2315, i8** %buf.2316
%i.2318 = alloca i32
store i32 1, i32* %i.2318
br label %.for.start.2317
.for.start.2317:
%.tmp2319 = load i32, i32* %i.2318
%.tmp2320 = load i32, i32* %str_len.2313
%.tmp2321 = sub i32 %.tmp2320, 1
%.tmp2322 = icmp slt i32 %.tmp2319, %.tmp2321
br i1 %.tmp2322, label %.for.continue.2317, label %.for.end.2317
.for.continue.2317:
%.tmp2323 = load i32, i32* %i.2318
%.tmp2324 = load i8*, i8** %text
%.tmp2325 = getelementptr i8, i8* %.tmp2324, i32 %.tmp2323
%.tmp2326 = load i8, i8* %.tmp2325
%.tmp2327 = icmp eq i8 %.tmp2326, 34
br i1 %.tmp2327, label %.if.true.2328, label %.if.false.2328
.if.true.2328:
%.tmp2329 = getelementptr i8*, i8** %buf.2316, i32 0
%.tmp2331 = getelementptr [6 x i8], [6 x i8]*@.str2330, i32 0, i32 0
%.tmp2332 = load i8*, i8** %buf.2316
%.tmp2333 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2329, i8* %.tmp2331, i8* %.tmp2332)
br label %.if.end.2328
.if.false.2328:
%.tmp2334 = load i32, i32* %i.2318
%.tmp2335 = load i8*, i8** %text
%.tmp2336 = getelementptr i8, i8* %.tmp2335, i32 %.tmp2334
%.tmp2337 = load i8, i8* %.tmp2336
%.tmp2338 = icmp eq i8 %.tmp2337, 92
br i1 %.tmp2338, label %.if.true.2339, label %.if.false.2339
.if.true.2339:
%.tmp2340 = load i32, i32* %i.2318
%.tmp2341 = add i32 %.tmp2340, 1
%.tmp2342 = load i8*, i8** %text
%.tmp2343 = getelementptr i8, i8* %.tmp2342, i32 %.tmp2341
%.tmp2344 = load i8, i8* %.tmp2343
%.tmp2345 = icmp eq i8 %.tmp2344, 110
%.tmp2346 = load i32, i32* %i.2318
%.tmp2347 = add i32 %.tmp2346, 1
%.tmp2348 = load i8*, i8** %text
%.tmp2349 = getelementptr i8, i8* %.tmp2348, i32 %.tmp2347
%.tmp2350 = load i8, i8* %.tmp2349
%.tmp2351 = icmp eq i8 %.tmp2350, 78
%.tmp2352 = or i1 %.tmp2345, %.tmp2351
br i1 %.tmp2352, label %.if.true.2353, label %.if.false.2353
.if.true.2353:
%.tmp2354 = getelementptr i8*, i8** %buf.2316, i32 0
%.tmp2356 = getelementptr [6 x i8], [6 x i8]*@.str2355, i32 0, i32 0
%.tmp2357 = load i8*, i8** %buf.2316
%.tmp2358 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2354, i8* %.tmp2356, i8* %.tmp2357)
%.tmp2359 = load i32, i32* %i.2318
%.tmp2360 = add i32 %.tmp2359, 1
store i32 %.tmp2360, i32* %i.2318
br label %.if.end.2353
.if.false.2353:
%.tmp2361 = load i32, i32* %i.2318
%.tmp2362 = add i32 %.tmp2361, 1
%.tmp2363 = load i8*, i8** %text
%.tmp2364 = getelementptr i8, i8* %.tmp2363, i32 %.tmp2362
%.tmp2365 = load i8, i8* %.tmp2364
%.tmp2366 = icmp eq i8 %.tmp2365, 92
br i1 %.tmp2366, label %.if.true.2367, label %.if.false.2367
.if.true.2367:
%.tmp2368 = getelementptr i8*, i8** %buf.2316, i32 0
%.tmp2370 = getelementptr [6 x i8], [6 x i8]*@.str2369, i32 0, i32 0
%.tmp2371 = load i8*, i8** %buf.2316
%.tmp2372 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2368, i8* %.tmp2370, i8* %.tmp2371)
%.tmp2373 = load i32, i32* %i.2318
%.tmp2374 = add i32 %.tmp2373, 1
store i32 %.tmp2374, i32* %i.2318
br label %.if.end.2367
.if.false.2367:
%.tmp2375 = load i32, i32* %i.2318
%.tmp2376 = add i32 %.tmp2375, 1
%.tmp2377 = load i8*, i8** %text
%.tmp2378 = getelementptr i8, i8* %.tmp2377, i32 %.tmp2376
%.tmp2379 = load i8, i8* %.tmp2378
%.tmp2380 = icmp eq i8 %.tmp2379, 120
br i1 %.tmp2380, label %.if.true.2381, label %.if.false.2381
.if.true.2381:
%.tmp2382 = load i32, i32* %i.2318
%.tmp2383 = add i32 %.tmp2382, 2
store i32 %.tmp2383, i32* %i.2318
%.tmp2384 = getelementptr i8*, i8** %buf.2316, i32 0
%.tmp2386 = getelementptr [8 x i8], [8 x i8]*@.str2385, i32 0, i32 0
%.tmp2387 = load i8*, i8** %buf.2316
%.tmp2388 = load i32, i32* %i.2318
%.tmp2389 = load i8*, i8** %text
%.tmp2390 = getelementptr i8, i8* %.tmp2389, i32 %.tmp2388
%.tmp2391 = load i8, i8* %.tmp2390
%.tmp2392 = call i8(i8) @toupper(i8 %.tmp2391)
%.tmp2393 = load i32, i32* %i.2318
%.tmp2394 = add i32 %.tmp2393, 1
%.tmp2395 = load i8*, i8** %text
%.tmp2396 = getelementptr i8, i8* %.tmp2395, i32 %.tmp2394
%.tmp2397 = load i8, i8* %.tmp2396
%.tmp2398 = call i8(i8) @toupper(i8 %.tmp2397)
%.tmp2399 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2384, i8* %.tmp2386, i8* %.tmp2387, i8 %.tmp2392, i8 %.tmp2398)
%.tmp2400 = load i32, i32* %i.2318
%.tmp2401 = add i32 %.tmp2400, 1
store i32 %.tmp2401, i32* %i.2318
br label %.if.end.2381
.if.false.2381:
%.tmp2402 = getelementptr i8*, i8** %buf.2316, i32 0
%.tmp2404 = getelementptr [5 x i8], [5 x i8]*@.str2403, i32 0, i32 0
%.tmp2405 = load i8*, i8** %buf.2316
%.tmp2406 = load i32, i32* %i.2318
%.tmp2407 = load i8*, i8** %text
%.tmp2408 = getelementptr i8, i8* %.tmp2407, i32 %.tmp2406
%.tmp2409 = load i8, i8* %.tmp2408
%.tmp2410 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2402, i8* %.tmp2404, i8* %.tmp2405, i8 %.tmp2409)
br label %.if.end.2381
.if.end.2381:
br label %.if.end.2367
.if.end.2367:
br label %.if.end.2353
.if.end.2353:
br label %.if.end.2339
.if.false.2339:
%.tmp2411 = getelementptr i8*, i8** %buf.2316, i32 0
%.tmp2413 = getelementptr [5 x i8], [5 x i8]*@.str2412, i32 0, i32 0
%.tmp2414 = load i8*, i8** %buf.2316
%.tmp2415 = load i32, i32* %i.2318
%.tmp2416 = load i8*, i8** %text
%.tmp2417 = getelementptr i8, i8* %.tmp2416, i32 %.tmp2415
%.tmp2418 = load i8, i8* %.tmp2417
%.tmp2419 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2411, i8* %.tmp2413, i8* %.tmp2414, i8 %.tmp2418)
br label %.if.end.2339
.if.end.2339:
br label %.if.end.2328
.if.end.2328:
%.tmp2420 = load i32, i32* %i.2318
%.tmp2421 = add i32 %.tmp2420, 1
store i32 %.tmp2421, i32* %i.2318
br label %.for.start.2317
.for.end.2317:
%.tmp2422 = getelementptr i8*, i8** %buf.2316, i32 0
%.tmp2424 = getelementptr [9 x i8], [9 x i8]*@.str2423, i32 0, i32 0
%.tmp2425 = load i8*, i8** %buf.2316
%.tmp2426 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2422, i8* %.tmp2424, i8* %.tmp2425)
%.tmp2427 = load i8*, i8** %buf.2316
ret i8* %.tmp2427
}
define i32 @m2310$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len.2428 = alloca i32
store i32 0, i32* %len.2428
%i.2430 = alloca i32
store i32 2, i32* %i.2430
br label %.for.start.2429
.for.start.2429:
%.tmp2431 = load i32, i32* %i.2430
%.tmp2432 = load i8*, i8** %text
%.tmp2433 = getelementptr i8, i8* %.tmp2432, i32 %.tmp2431
%.tmp2434 = load i8, i8* %.tmp2433
%.tmp2435 = icmp ne i8 %.tmp2434, 0
br i1 %.tmp2435, label %.for.continue.2429, label %.for.end.2429
.for.continue.2429:
%.tmp2436 = load i32, i32* %i.2430
%.tmp2437 = load i8*, i8** %text
%.tmp2438 = getelementptr i8, i8* %.tmp2437, i32 %.tmp2436
%.tmp2439 = load i8, i8* %.tmp2438
%.tmp2440 = icmp eq i8 %.tmp2439, 92
br i1 %.tmp2440, label %.if.true.2441, label %.if.false.2441
.if.true.2441:
%.tmp2442 = load i32, i32* %i.2430
%.tmp2443 = add i32 %.tmp2442, 2
store i32 %.tmp2443, i32* %i.2430
br label %.if.end.2441
.if.false.2441:
br label %.if.end.2441
.if.end.2441:
%.tmp2444 = load i32, i32* %len.2428
%.tmp2445 = add i32 %.tmp2444, 1
store i32 %.tmp2445, i32* %len.2428
%.tmp2446 = load i32, i32* %i.2430
%.tmp2447 = add i32 %.tmp2446, 1
store i32 %.tmp2447, i32* %i.2430
br label %.for.start.2429
.for.end.2429:
%.tmp2448 = load i32, i32* %len.2428
%.tmp2449 = sub i32 %.tmp2448, 1
ret i32 %.tmp2449
}
define i8* @m2310$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval.2450 = alloca i32
store i32 0, i32* %intval.2450
%buf.2451 = alloca i8*
store i8* null, i8** %buf.2451
%chrval.2452 = alloca i8
store i8 0, i8* %chrval.2452
%.tmp2453 = load i8*, i8** %chr_repr
%.tmp2454 = call i32(i8*) @strlen(i8* %.tmp2453)
%chr_len.2455 = alloca i32
store i32 %.tmp2454, i32* %chr_len.2455
%.tmp2456 = load i32, i32* %chr_len.2455
%.tmp2457 = icmp eq i32 %.tmp2456, 6
br i1 %.tmp2457, label %.if.true.2458, label %.if.false.2458
.if.true.2458:
%.tmp2459 = load i8*, i8** %chr_repr
%.tmp2461 = getelementptr [7 x i8], [7 x i8]*@.str2460, i32 0, i32 0
%.tmp2462 = getelementptr i32, i32* %intval.2450, i32 0
%.tmp2463 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2459, i8* %.tmp2461, i32* %.tmp2462)
%.tmp2464 = getelementptr i8*, i8** %buf.2451, i32 0
%.tmp2466 = getelementptr [3 x i8], [3 x i8]*@.str2465, i32 0, i32 0
%.tmp2467 = load i32, i32* %intval.2450
%.tmp2468 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2464, i8* %.tmp2466, i32 %.tmp2467)
br label %.if.end.2458
.if.false.2458:
%.tmp2469 = load i32, i32* %chr_len.2455
%.tmp2470 = icmp eq i32 %.tmp2469, 5
br i1 %.tmp2470, label %.if.true.2471, label %.if.false.2471
.if.true.2471:
%.tmp2472 = load i8*, i8** %chr_repr
%.tmp2474 = getelementptr [6 x i8], [6 x i8]*@.str2473, i32 0, i32 0
%.tmp2475 = getelementptr i32, i32* %intval.2450, i32 0
%.tmp2476 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2472, i8* %.tmp2474, i32* %.tmp2475)
%.tmp2477 = getelementptr i8*, i8** %buf.2451, i32 0
%.tmp2479 = getelementptr [3 x i8], [3 x i8]*@.str2478, i32 0, i32 0
%.tmp2480 = load i32, i32* %intval.2450
%.tmp2481 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2477, i8* %.tmp2479, i32 %.tmp2480)
br label %.if.end.2471
.if.false.2471:
%.tmp2482 = load i32, i32* %chr_len.2455
%.tmp2483 = icmp eq i32 %.tmp2482, 4
br i1 %.tmp2483, label %.if.true.2484, label %.if.false.2484
.if.true.2484:
%.tmp2485 = load i8*, i8** %chr_repr
%.tmp2487 = getelementptr [6 x i8], [6 x i8]*@.str2486, i32 0, i32 0
%.tmp2488 = getelementptr i8, i8* %chrval.2452, i32 0
%.tmp2489 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2485, i8* %.tmp2487, i8* %.tmp2488)
%.tmp2490 = load i8, i8* %chrval.2452
%.tmp2491 = icmp eq i8 %.tmp2490, 110
br i1 %.tmp2491, label %.if.true.2492, label %.if.false.2492
.if.true.2492:
%.tmp2494 = getelementptr [3 x i8], [3 x i8]*@.str2493, i32 0, i32 0
store i8* %.tmp2494, i8** %buf.2451
br label %.if.end.2492
.if.false.2492:
%.tmp2495 = bitcast ptr null to i8*
ret i8* %.tmp2495
br label %.if.end.2492
.if.end.2492:
br label %.if.end.2484
.if.false.2484:
%.tmp2496 = load i32, i32* %chr_len.2455
%.tmp2497 = icmp eq i32 %.tmp2496, 3
br i1 %.tmp2497, label %.if.true.2498, label %.if.false.2498
.if.true.2498:
%.tmp2499 = load i8*, i8** %chr_repr
%.tmp2501 = getelementptr [5 x i8], [5 x i8]*@.str2500, i32 0, i32 0
%.tmp2502 = getelementptr i32, i32* %intval.2450, i32 0
%.tmp2503 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2499, i8* %.tmp2501, i32* %.tmp2502)
%.tmp2504 = getelementptr i8*, i8** %buf.2451, i32 0
%.tmp2506 = getelementptr [3 x i8], [3 x i8]*@.str2505, i32 0, i32 0
%.tmp2507 = load i32, i32* %intval.2450
%.tmp2508 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2504, i8* %.tmp2506, i32 %.tmp2507)
br label %.if.end.2498
.if.false.2498:
%.tmp2509 = bitcast ptr null to i8*
ret i8* %.tmp2509
br label %.if.end.2498
.if.end.2498:
br label %.if.end.2484
.if.end.2484:
br label %.if.end.2471
.if.end.2471:
br label %.if.end.2458
.if.end.2458:
%.tmp2510 = load i8*, i8** %buf.2451
ret i8* %.tmp2510
}
%m2511$.SYStack.type = type {%m980$.Node.type*,%m2511$.SYStack.type*}
@SYStack_size = constant i32 16
define %m2511$.SYStack.type* @m2511$stack_new.m2511$.SYStack.typep() {
%.tmp2512 = load i32, i32* @SYStack_size
%.tmp2513 = call i8*(i32) @malloc(i32 %.tmp2512)
%.tmp2514 = bitcast i8* %.tmp2513 to %m2511$.SYStack.type*
%s.2515 = alloca %m2511$.SYStack.type*
store %m2511$.SYStack.type* %.tmp2514, %m2511$.SYStack.type** %s.2515
%.tmp2516 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %s.2515
%.tmp2517 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2516, i32 0, i32 0
store %m980$.Node.type* null, %m980$.Node.type** %.tmp2517
%.tmp2518 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %s.2515
%.tmp2519 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2518, i32 0, i32 1
store %m2511$.SYStack.type* null, %m2511$.SYStack.type** %.tmp2519
%.tmp2520 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %s.2515
ret %m2511$.SYStack.type* %.tmp2520
}
define %m2511$.SYStack.type* @m2511$sy_algorithm.m2511$.SYStack.typep.m980$.Node.typep(%m980$.Node.type* %.assignable.arg) {
%assignable = alloca %m980$.Node.type*
store %m980$.Node.type* %.assignable.arg, %m980$.Node.type** %assignable
%.tmp2521 = call %m2511$.SYStack.type*() @m2511$stack_new.m2511$.SYStack.typep()
%out_stack.2522 = alloca %m2511$.SYStack.type*
store %m2511$.SYStack.type* %.tmp2521, %m2511$.SYStack.type** %out_stack.2522
%.tmp2523 = call %m2511$.SYStack.type*() @m2511$stack_new.m2511$.SYStack.typep()
%op_stack.2524 = alloca %m2511$.SYStack.type*
store %m2511$.SYStack.type* %.tmp2523, %m2511$.SYStack.type** %op_stack.2524
%.tmp2525 = call %m2511$.SYStack.type*() @m2511$stack_new.m2511$.SYStack.typep()
%token_stack.2526 = alloca %m2511$.SYStack.type*
store %m2511$.SYStack.type* %.tmp2525, %m2511$.SYStack.type** %token_stack.2526
%ptr.2527 = alloca %m980$.Node.type*
store %m980$.Node.type* null, %m980$.Node.type** %ptr.2527
%.tmp2529 = load %m980$.Node.type*, %m980$.Node.type** %assignable
store %m980$.Node.type* %.tmp2529, %m980$.Node.type** %ptr.2527
br label %.for.start.2528
.for.start.2528:
%.tmp2530 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2527
%.tmp2531 = icmp ne %m980$.Node.type* %.tmp2530, null
br i1 %.tmp2531, label %.for.continue.2528, label %.for.end.2528
.for.continue.2528:
%.tmp2532 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %token_stack.2526
%.tmp2533 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2527
%.tmp2534 = call %m2511$.SYStack.type*(%m2511$.SYStack.type*,%m980$.Node.type*) @m2511$stack_push.m2511$.SYStack.typep.m2511$.SYStack.typep.m980$.Node.typep(%m2511$.SYStack.type* %.tmp2532, %m980$.Node.type* %.tmp2533)
store %m2511$.SYStack.type* %.tmp2534, %m2511$.SYStack.type** %token_stack.2526
%.tmp2535 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2527
%.tmp2536 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2535, i32 0, i32 8
%.tmp2537 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2536
store %m980$.Node.type* %.tmp2537, %m980$.Node.type** %ptr.2527
br label %.for.start.2528
.for.end.2528:
%.tmp2539 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %token_stack.2526
%.tmp2540 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2539, i32 0, i32 0
%.tmp2541 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2540
store %m980$.Node.type* %.tmp2541, %m980$.Node.type** %ptr.2527
br label %.for.start.2538
.for.start.2538:
%.tmp2542 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2527
%.tmp2543 = icmp ne %m980$.Node.type* %.tmp2542, null
br i1 %.tmp2543, label %.for.continue.2538, label %.for.end.2538
.for.continue.2538:
%.tmp2544 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %token_stack.2526
%cs.2545 = alloca %m2511$.SYStack.type*
store %m2511$.SYStack.type* %.tmp2544, %m2511$.SYStack.type** %cs.2545
%.tmp2546 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %token_stack.2526
%.tmp2547 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2546, i32 0, i32 1
%.tmp2548 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %.tmp2547
store %m2511$.SYStack.type* %.tmp2548, %m2511$.SYStack.type** %token_stack.2526
%.tmp2549 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %cs.2545
%.tmp2550 = bitcast %m2511$.SYStack.type* %.tmp2549 to i8*
call void(i8*) @free(i8* %.tmp2550)
%.tmp2551 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2527
%.tmp2552 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2551, i32 0, i32 0
%.tmp2553 = load i8*, i8** %.tmp2552
%.tmp2555 = getelementptr [16 x i8], [16 x i8]*@.str2554, i32 0, i32 0
%.tmp2556 = call i32(i8*,i8*) @strcmp(i8* %.tmp2553, i8* %.tmp2555)
%.tmp2557 = icmp eq i32 %.tmp2556, 0
br i1 %.tmp2557, label %.if.true.2558, label %.if.false.2558
.if.true.2558:
%.tmp2559 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %out_stack.2522
%.tmp2560 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2527
%.tmp2561 = call %m2511$.SYStack.type*(%m2511$.SYStack.type*,%m980$.Node.type*) @m2511$stack_push.m2511$.SYStack.typep.m2511$.SYStack.typep.m980$.Node.typep(%m2511$.SYStack.type* %.tmp2559, %m980$.Node.type* %.tmp2560)
store %m2511$.SYStack.type* %.tmp2561, %m2511$.SYStack.type** %out_stack.2522
br label %.if.end.2558
.if.false.2558:
%.tmp2562 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2527
%.tmp2563 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2562, i32 0, i32 0
%.tmp2564 = load i8*, i8** %.tmp2563
%.tmp2566 = getelementptr [9 x i8], [9 x i8]*@.str2565, i32 0, i32 0
%.tmp2567 = call i32(i8*,i8*) @strcmp(i8* %.tmp2564, i8* %.tmp2566)
%.tmp2568 = icmp eq i32 %.tmp2567, 0
br i1 %.tmp2568, label %.if.true.2569, label %.if.false.2569
.if.true.2569:
%quit.2570 = alloca i1
store i1 0, i1* %quit.2570
br label %.for.start.2571
.for.start.2571:
%.tmp2572 = load i1, i1* %quit.2570
%.tmp2573 = icmp eq i1 %.tmp2572, 0
br i1 %.tmp2573, label %.for.continue.2571, label %.for.end.2571
.for.continue.2571:
%.tmp2574 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %op_stack.2524
%.tmp2575 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2574, i32 0, i32 0
%.tmp2576 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2575
%.tmp2577 = icmp eq %m980$.Node.type* %.tmp2576, null
br i1 %.tmp2577, label %.if.true.2578, label %.if.false.2578
.if.true.2578:
store i1 1, i1* %quit.2570
br label %.if.end.2578
.if.false.2578:
%.tmp2579 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %op_stack.2524
%.tmp2580 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2579, i32 0, i32 0
%.tmp2581 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2580
%.tmp2582 = call i32(%m980$.Node.type*) @m2511$op_precedence.i.m980$.Node.typep(%m980$.Node.type* %.tmp2581)
%.tmp2583 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2527
%.tmp2584 = call i32(%m980$.Node.type*) @m2511$op_precedence.i.m980$.Node.typep(%m980$.Node.type* %.tmp2583)
%.tmp2585 = icmp slt i32 %.tmp2582, %.tmp2584
br i1 %.tmp2585, label %.if.true.2586, label %.if.false.2586
.if.true.2586:
%.tmp2587 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %op_stack.2524
%top.2588 = alloca %m2511$.SYStack.type*
store %m2511$.SYStack.type* %.tmp2587, %m2511$.SYStack.type** %top.2588
%.tmp2589 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %op_stack.2524
%.tmp2590 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2589, i32 0, i32 1
%.tmp2591 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %.tmp2590
store %m2511$.SYStack.type* %.tmp2591, %m2511$.SYStack.type** %op_stack.2524
%.tmp2592 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %out_stack.2522
%.tmp2593 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %top.2588
%.tmp2594 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2593, i32 0, i32 0
%.tmp2595 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2594
%.tmp2596 = call %m2511$.SYStack.type*(%m2511$.SYStack.type*,%m980$.Node.type*) @m2511$stack_push.m2511$.SYStack.typep.m2511$.SYStack.typep.m980$.Node.typep(%m2511$.SYStack.type* %.tmp2592, %m980$.Node.type* %.tmp2595)
store %m2511$.SYStack.type* %.tmp2596, %m2511$.SYStack.type** %out_stack.2522
%.tmp2597 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %top.2588
%.tmp2598 = bitcast %m2511$.SYStack.type* %.tmp2597 to i8*
call void(i8*) @free(i8* %.tmp2598)
br label %.if.end.2586
.if.false.2586:
store i1 1, i1* %quit.2570
br label %.if.end.2586
.if.end.2586:
br label %.if.end.2578
.if.end.2578:
br label %.for.start.2571
.for.end.2571:
%.tmp2599 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %op_stack.2524
%.tmp2600 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2527
%.tmp2601 = call %m2511$.SYStack.type*(%m2511$.SYStack.type*,%m980$.Node.type*) @m2511$stack_push.m2511$.SYStack.typep.m2511$.SYStack.typep.m980$.Node.typep(%m2511$.SYStack.type* %.tmp2599, %m980$.Node.type* %.tmp2600)
store %m2511$.SYStack.type* %.tmp2601, %m2511$.SYStack.type** %op_stack.2524
br label %.if.end.2569
.if.false.2569:
%.tmp2603 = getelementptr [68 x i8], [68 x i8]*@.str2602, i32 0, i32 0
%.tmp2604 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2527
%.tmp2605 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2604, i32 0, i32 0
%.tmp2606 = load i8*, i8** %.tmp2605
%.tmp2607 = call i32(i8*,...) @printf(i8* %.tmp2603, i8* %.tmp2606)
br label %.if.end.2569
.if.end.2569:
br label %.if.end.2558
.if.end.2558:
%.tmp2608 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %token_stack.2526
%.tmp2609 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2608, i32 0, i32 0
%.tmp2610 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2609
store %m980$.Node.type* %.tmp2610, %m980$.Node.type** %ptr.2527
br label %.for.start.2538
.for.end.2538:
br label %.for.start.2611
.for.start.2611:
%.tmp2612 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %op_stack.2524
%.tmp2613 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2612, i32 0, i32 0
%.tmp2614 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2613
%.tmp2615 = icmp ne %m980$.Node.type* %.tmp2614, null
br i1 %.tmp2615, label %.for.continue.2611, label %.for.end.2611
.for.continue.2611:
%.tmp2616 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %op_stack.2524
%.tmp2617 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2616, i32 0, i32 0
%.tmp2618 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2617
%node.2619 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp2618, %m980$.Node.type** %node.2619
%.tmp2620 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %op_stack.2524
%s.2621 = alloca %m2511$.SYStack.type*
store %m2511$.SYStack.type* %.tmp2620, %m2511$.SYStack.type** %s.2621
%.tmp2622 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %op_stack.2524
%.tmp2623 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2622, i32 0, i32 1
%.tmp2624 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %.tmp2623
store %m2511$.SYStack.type* %.tmp2624, %m2511$.SYStack.type** %op_stack.2524
%.tmp2625 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %s.2621
%.tmp2626 = bitcast %m2511$.SYStack.type* %.tmp2625 to i8*
call void(i8*) @free(i8* %.tmp2626)
%.tmp2627 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %out_stack.2522
%.tmp2628 = load %m980$.Node.type*, %m980$.Node.type** %node.2619
%.tmp2629 = call %m2511$.SYStack.type*(%m2511$.SYStack.type*,%m980$.Node.type*) @m2511$stack_push.m2511$.SYStack.typep.m2511$.SYStack.typep.m980$.Node.typep(%m2511$.SYStack.type* %.tmp2627, %m980$.Node.type* %.tmp2628)
store %m2511$.SYStack.type* %.tmp2629, %m2511$.SYStack.type** %out_stack.2522
br label %.for.start.2611
.for.end.2611:
%.tmp2630 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %out_stack.2522
ret %m2511$.SYStack.type* %.tmp2630
}
define %m2511$.SYStack.type* @m2511$stack_push.m2511$.SYStack.typep.m2511$.SYStack.typep.m980$.Node.typep(%m2511$.SYStack.type* %.curr_stack.arg, %m980$.Node.type* %.node.arg) {
%curr_stack = alloca %m2511$.SYStack.type*
store %m2511$.SYStack.type* %.curr_stack.arg, %m2511$.SYStack.type** %curr_stack
%node = alloca %m980$.Node.type*
store %m980$.Node.type* %.node.arg, %m980$.Node.type** %node
%.tmp2631 = load i32, i32* @SYStack_size
%.tmp2632 = call i8*(i32) @malloc(i32 %.tmp2631)
%.tmp2633 = bitcast i8* %.tmp2632 to %m2511$.SYStack.type*
%s.2634 = alloca %m2511$.SYStack.type*
store %m2511$.SYStack.type* %.tmp2633, %m2511$.SYStack.type** %s.2634
%.tmp2635 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %s.2634
%.tmp2636 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2635, i32 0, i32 0
%.tmp2637 = load %m980$.Node.type*, %m980$.Node.type** %node
store %m980$.Node.type* %.tmp2637, %m980$.Node.type** %.tmp2636
%.tmp2638 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %s.2634
%.tmp2639 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp2638, i32 0, i32 1
%.tmp2640 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %curr_stack
store %m2511$.SYStack.type* %.tmp2640, %m2511$.SYStack.type** %.tmp2639
%.tmp2641 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %s.2634
ret %m2511$.SYStack.type* %.tmp2641
}
define i32 @m2511$op_precedence.i.m980$.Node.typep(%m980$.Node.type* %.n.arg) {
%n = alloca %m980$.Node.type*
store %m980$.Node.type* %.n.arg, %m980$.Node.type** %n
%.tmp2642 = load %m980$.Node.type*, %m980$.Node.type** %n
%.tmp2643 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2642, i32 0, i32 7
%.tmp2644 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2643
%op.2645 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp2644, %m980$.Node.type** %op.2645
%.tmp2646 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2647 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2646, i32 0, i32 1
%.tmp2648 = load i8*, i8** %.tmp2647
%.tmp2650 = getelementptr [2 x i8], [2 x i8]*@.str2649, i32 0, i32 0
%.tmp2651 = call i32(i8*,i8*) @strcmp(i8* %.tmp2648, i8* %.tmp2650)
%.tmp2652 = icmp eq i32 %.tmp2651, 0
%.tmp2653 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2654 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2653, i32 0, i32 1
%.tmp2655 = load i8*, i8** %.tmp2654
%.tmp2657 = getelementptr [2 x i8], [2 x i8]*@.str2656, i32 0, i32 0
%.tmp2658 = call i32(i8*,i8*) @strcmp(i8* %.tmp2655, i8* %.tmp2657)
%.tmp2659 = icmp eq i32 %.tmp2658, 0
%.tmp2660 = or i1 %.tmp2652, %.tmp2659
br i1 %.tmp2660, label %.if.true.2661, label %.if.false.2661
.if.true.2661:
ret i32 4
br label %.if.end.2661
.if.false.2661:
%.tmp2662 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2663 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2662, i32 0, i32 1
%.tmp2664 = load i8*, i8** %.tmp2663
%.tmp2666 = getelementptr [2 x i8], [2 x i8]*@.str2665, i32 0, i32 0
%.tmp2667 = call i32(i8*,i8*) @strcmp(i8* %.tmp2664, i8* %.tmp2666)
%.tmp2668 = icmp eq i32 %.tmp2667, 0
%.tmp2669 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2670 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2669, i32 0, i32 1
%.tmp2671 = load i8*, i8** %.tmp2670
%.tmp2673 = getelementptr [2 x i8], [2 x i8]*@.str2672, i32 0, i32 0
%.tmp2674 = call i32(i8*,i8*) @strcmp(i8* %.tmp2671, i8* %.tmp2673)
%.tmp2675 = icmp eq i32 %.tmp2674, 0
%.tmp2676 = or i1 %.tmp2668, %.tmp2675
%.tmp2677 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2678 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2677, i32 0, i32 1
%.tmp2679 = load i8*, i8** %.tmp2678
%.tmp2681 = getelementptr [2 x i8], [2 x i8]*@.str2680, i32 0, i32 0
%.tmp2682 = call i32(i8*,i8*) @strcmp(i8* %.tmp2679, i8* %.tmp2681)
%.tmp2683 = icmp eq i32 %.tmp2682, 0
%.tmp2684 = or i1 %.tmp2676, %.tmp2683
br i1 %.tmp2684, label %.if.true.2685, label %.if.false.2685
.if.true.2685:
ret i32 3
br label %.if.end.2685
.if.false.2685:
%.tmp2686 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2687 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2686, i32 0, i32 1
%.tmp2688 = load i8*, i8** %.tmp2687
%.tmp2690 = getelementptr [3 x i8], [3 x i8]*@.str2689, i32 0, i32 0
%.tmp2691 = call i32(i8*,i8*) @strcmp(i8* %.tmp2688, i8* %.tmp2690)
%.tmp2692 = icmp eq i32 %.tmp2691, 0
%.tmp2693 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2694 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2693, i32 0, i32 1
%.tmp2695 = load i8*, i8** %.tmp2694
%.tmp2697 = getelementptr [3 x i8], [3 x i8]*@.str2696, i32 0, i32 0
%.tmp2698 = call i32(i8*,i8*) @strcmp(i8* %.tmp2695, i8* %.tmp2697)
%.tmp2699 = icmp eq i32 %.tmp2698, 0
%.tmp2700 = or i1 %.tmp2692, %.tmp2699
br i1 %.tmp2700, label %.if.true.2701, label %.if.false.2701
.if.true.2701:
ret i32 7
br label %.if.end.2701
.if.false.2701:
%.tmp2702 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2703 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2702, i32 0, i32 1
%.tmp2704 = load i8*, i8** %.tmp2703
%.tmp2706 = getelementptr [3 x i8], [3 x i8]*@.str2705, i32 0, i32 0
%.tmp2707 = call i32(i8*,i8*) @strcmp(i8* %.tmp2704, i8* %.tmp2706)
%.tmp2708 = icmp eq i32 %.tmp2707, 0
%.tmp2709 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2710 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2709, i32 0, i32 1
%.tmp2711 = load i8*, i8** %.tmp2710
%.tmp2713 = getelementptr [3 x i8], [3 x i8]*@.str2712, i32 0, i32 0
%.tmp2714 = call i32(i8*,i8*) @strcmp(i8* %.tmp2711, i8* %.tmp2713)
%.tmp2715 = icmp eq i32 %.tmp2714, 0
%.tmp2716 = or i1 %.tmp2708, %.tmp2715
br i1 %.tmp2716, label %.if.true.2717, label %.if.false.2717
.if.true.2717:
ret i32 6
br label %.if.end.2717
.if.false.2717:
%.tmp2718 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2719 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2718, i32 0, i32 1
%.tmp2720 = load i8*, i8** %.tmp2719
%.tmp2722 = getelementptr [2 x i8], [2 x i8]*@.str2721, i32 0, i32 0
%.tmp2723 = call i32(i8*,i8*) @strcmp(i8* %.tmp2720, i8* %.tmp2722)
%.tmp2724 = icmp eq i32 %.tmp2723, 0
%.tmp2725 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2726 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2725, i32 0, i32 1
%.tmp2727 = load i8*, i8** %.tmp2726
%.tmp2729 = getelementptr [2 x i8], [2 x i8]*@.str2728, i32 0, i32 0
%.tmp2730 = call i32(i8*,i8*) @strcmp(i8* %.tmp2727, i8* %.tmp2729)
%.tmp2731 = icmp eq i32 %.tmp2730, 0
%.tmp2732 = or i1 %.tmp2724, %.tmp2731
br i1 %.tmp2732, label %.if.true.2733, label %.if.false.2733
.if.true.2733:
ret i32 6
br label %.if.end.2733
.if.false.2733:
%.tmp2734 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2735 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2734, i32 0, i32 1
%.tmp2736 = load i8*, i8** %.tmp2735
%.tmp2738 = getelementptr [2 x i8], [2 x i8]*@.str2737, i32 0, i32 0
%.tmp2739 = call i32(i8*,i8*) @strcmp(i8* %.tmp2736, i8* %.tmp2738)
%.tmp2740 = icmp eq i32 %.tmp2739, 0
br i1 %.tmp2740, label %.if.true.2741, label %.if.false.2741
.if.true.2741:
ret i32 11
br label %.if.end.2741
.if.false.2741:
%.tmp2742 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2743 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2742, i32 0, i32 1
%.tmp2744 = load i8*, i8** %.tmp2743
%.tmp2746 = getelementptr [2 x i8], [2 x i8]*@.str2745, i32 0, i32 0
%.tmp2747 = call i32(i8*,i8*) @strcmp(i8* %.tmp2744, i8* %.tmp2746)
%.tmp2748 = icmp eq i32 %.tmp2747, 0
br i1 %.tmp2748, label %.if.true.2749, label %.if.false.2749
.if.true.2749:
ret i32 12
br label %.if.end.2749
.if.false.2749:
br label %.if.end.2749
.if.end.2749:
br label %.if.end.2741
.if.end.2741:
br label %.if.end.2733
.if.end.2733:
br label %.if.end.2717
.if.end.2717:
br label %.if.end.2701
.if.end.2701:
br label %.if.end.2685
.if.end.2685:
br label %.if.end.2661
.if.end.2661:
%.tmp2751 = getelementptr [65 x i8], [65 x i8]*@.str2750, i32 0, i32 0
%.tmp2752 = load %m980$.Node.type*, %m980$.Node.type** %op.2645
%.tmp2753 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2752, i32 0, i32 1
%.tmp2754 = load i8*, i8** %.tmp2753
%.tmp2755 = call i32(i8*,...) @printf(i8* %.tmp2751, i8* %.tmp2754)
ret i32 4
}
%m2756$.Type.type = type {i8*,i8*,i8*,%m2756$.Type.type*,%m2756$.Type.type*}
%m2756$.ErrorList.type = type {%m296$.Error.type*,%m2756$.ErrorList.type*,i1}
%m2756$.AssignableInfo.type = type {i8*,i8,i8*,i8*,%m2756$.Type.type*,i32,i32,i8*}
%m2756$.ScopeItem.type = type {i8*,%m2756$.AssignableInfo.type*,%m2756$.ScopeItem.type*}
%m2756$.Scope.type = type {i8*,%m2756$.ScopeItem.type*,i8*,i8*,i8*,%m2756$.Scope.type*,%m2756$.Type.type*}
%m2756$.GlobalName.type = type {i8*,i8*,i1,i1,%m2756$.AssignableInfo.type*,%m2756$.GlobalName.type*}
%m2756$.ModuleLookup.type = type {i8*,i8*,%m2756$.ModuleLookup.type*,%m2756$.Scope.type*}
%m2756$.AnonFn.type = type {i8*,%m2756$.AnonFn.type*}
%m2756$.CompilerCtx.type = type {%m980$.Node.type*,%m0$.File.type*,%m2756$.ErrorList.type*,%m2756$.GlobalName.type*,%m980$.Rule.type**,i32,%m2756$.ModuleLookup.type*,i8*,%m2756$.AnonFn.type*}
define i8* @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.Type.type* %.type.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%type = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.type.arg, %m2756$.Type.type** %type
%.tmp2758 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2759 = icmp eq %m2756$.Type.type* %.tmp2758, null
br i1 %.tmp2759, label %.if.true.2760, label %.if.false.2760
.if.true.2760:
%.tmp2762 = getelementptr [2 x i8], [2 x i8]*@.str2761, i32 0, i32 0
ret i8* %.tmp2762
br label %.if.end.2760
.if.false.2760:
br label %.if.end.2760
.if.end.2760:
%.tmp2763 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2764 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2763, i32 0, i32 0
%.tmp2765 = load i8*, i8** %.tmp2764
%.tmp2766 = icmp ne i8* %.tmp2765, null
%.tmp2768 = getelementptr [54 x i8], [54 x i8]*@.str2767, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2766, i8* %.tmp2768)
%buf.2769 = alloca i8*
store i8* null, i8** %buf.2769
%.tmp2770 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2771 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2770, i32 0, i32 0
%.tmp2772 = load i8*, i8** %.tmp2771
%.tmp2774 = getelementptr [4 x i8], [4 x i8]*@.str2773, i32 0, i32 0
%.tmp2775 = call i32(i8*,i8*) @strcmp(i8* %.tmp2772, i8* %.tmp2774)
%.tmp2776 = icmp eq i32 %.tmp2775, 0
br i1 %.tmp2776, label %.if.true.2777, label %.if.false.2777
.if.true.2777:
%.tmp2779 = getelementptr [4 x i8], [4 x i8]*@.str2778, i32 0, i32 0
ret i8* %.tmp2779
br label %.if.end.2777
.if.false.2777:
%.tmp2780 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2781 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2780, i32 0, i32 0
%.tmp2782 = load i8*, i8** %.tmp2781
%.tmp2784 = getelementptr [5 x i8], [5 x i8]*@.str2783, i32 0, i32 0
%.tmp2785 = call i32(i8*,i8*) @strcmp(i8* %.tmp2782, i8* %.tmp2784)
%.tmp2786 = icmp eq i32 %.tmp2785, 0
br i1 %.tmp2786, label %.if.true.2787, label %.if.false.2787
.if.true.2787:
%.tmp2789 = getelementptr [5 x i8], [5 x i8]*@.str2788, i32 0, i32 0
ret i8* %.tmp2789
br label %.if.end.2787
.if.false.2787:
%.tmp2790 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2791 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2790, i32 0, i32 0
%.tmp2792 = load i8*, i8** %.tmp2791
%.tmp2794 = getelementptr [5 x i8], [5 x i8]*@.str2793, i32 0, i32 0
%.tmp2795 = call i32(i8*,i8*) @strcmp(i8* %.tmp2792, i8* %.tmp2794)
%.tmp2796 = icmp eq i32 %.tmp2795, 0
br i1 %.tmp2796, label %.if.true.2797, label %.if.false.2797
.if.true.2797:
%.tmp2799 = getelementptr [3 x i8], [3 x i8]*@.str2798, i32 0, i32 0
ret i8* %.tmp2799
br label %.if.end.2797
.if.false.2797:
%.tmp2800 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2801 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2800, i32 0, i32 0
%.tmp2802 = load i8*, i8** %.tmp2801
%.tmp2804 = getelementptr [8 x i8], [8 x i8]*@.str2803, i32 0, i32 0
%.tmp2805 = call i32(i8*,i8*) @strcmp(i8* %.tmp2802, i8* %.tmp2804)
%.tmp2806 = icmp eq i32 %.tmp2805, 0
br i1 %.tmp2806, label %.if.true.2807, label %.if.false.2807
.if.true.2807:
%.tmp2809 = getelementptr [4 x i8], [4 x i8]*@.str2808, i32 0, i32 0
ret i8* %.tmp2809
br label %.if.end.2807
.if.false.2807:
%.tmp2810 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2811 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2810, i32 0, i32 0
%.tmp2812 = load i8*, i8** %.tmp2811
%.tmp2814 = getelementptr [4 x i8], [4 x i8]*@.str2813, i32 0, i32 0
%.tmp2815 = call i32(i8*,i8*) @strcmp(i8* %.tmp2812, i8* %.tmp2814)
%.tmp2816 = icmp eq i32 %.tmp2815, 0
br i1 %.tmp2816, label %.if.true.2817, label %.if.false.2817
.if.true.2817:
%.tmp2819 = getelementptr [3 x i8], [3 x i8]*@.str2818, i32 0, i32 0
ret i8* %.tmp2819
br label %.if.end.2817
.if.false.2817:
%.tmp2820 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2821 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2820, i32 0, i32 0
%.tmp2822 = load i8*, i8** %.tmp2821
%.tmp2824 = getelementptr [9 x i8], [9 x i8]*@.str2823, i32 0, i32 0
%.tmp2825 = call i32(i8*,i8*) @strcmp(i8* %.tmp2822, i8* %.tmp2824)
%.tmp2826 = icmp eq i32 %.tmp2825, 0
br i1 %.tmp2826, label %.if.true.2827, label %.if.false.2827
.if.true.2827:
%.tmp2828 = getelementptr i8*, i8** %buf.2769, i32 0
%.tmp2830 = getelementptr [4 x i8], [4 x i8]*@.str2829, i32 0, i32 0
%.tmp2831 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp2832 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2833 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2832, i32 0, i32 3
%.tmp2834 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp2833
%.tmp2835 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp2831, %m2756$.Type.type* %.tmp2834)
%.tmp2836 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2828, i8* %.tmp2830, i8* %.tmp2835)
%.tmp2838 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2839 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2838, i32 0, i32 3
%.tmp2840 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp2839
%.tmp2841 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2840, i32 0, i32 4
%.tmp2842 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp2841
%p.2843 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp2842, %m2756$.Type.type** %p.2843
br label %.for.start.2837
.for.start.2837:
%.tmp2844 = load %m2756$.Type.type*, %m2756$.Type.type** %p.2843
%.tmp2845 = icmp ne %m2756$.Type.type* %.tmp2844, null
br i1 %.tmp2845, label %.for.continue.2837, label %.for.end.2837
.for.continue.2837:
%.tmp2846 = load %m2756$.Type.type*, %m2756$.Type.type** %p.2843
%.tmp2847 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2848 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2847, i32 0, i32 3
%.tmp2849 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp2848
%.tmp2850 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2849, i32 0, i32 4
%.tmp2851 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp2850
%.tmp2852 = icmp ne %m2756$.Type.type* %.tmp2846, %.tmp2851
br i1 %.tmp2852, label %.if.true.2853, label %.if.false.2853
.if.true.2853:
%.tmp2854 = getelementptr i8*, i8** %buf.2769, i32 0
%.tmp2856 = getelementptr [4 x i8], [4 x i8]*@.str2855, i32 0, i32 0
%.tmp2857 = load i8*, i8** %buf.2769
%.tmp2858 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2854, i8* %.tmp2856, i8* %.tmp2857)
br label %.if.end.2853
.if.false.2853:
br label %.if.end.2853
.if.end.2853:
%.tmp2859 = getelementptr i8*, i8** %buf.2769, i32 0
%.tmp2861 = getelementptr [5 x i8], [5 x i8]*@.str2860, i32 0, i32 0
%.tmp2862 = load i8*, i8** %buf.2769
%.tmp2863 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp2864 = load %m2756$.Type.type*, %m2756$.Type.type** %p.2843
%.tmp2865 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp2863, %m2756$.Type.type* %.tmp2864)
%.tmp2866 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2859, i8* %.tmp2861, i8* %.tmp2862, i8* %.tmp2865)
%.tmp2867 = load %m2756$.Type.type*, %m2756$.Type.type** %p.2843
%.tmp2868 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2867, i32 0, i32 4
%.tmp2869 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp2868
store %m2756$.Type.type* %.tmp2869, %m2756$.Type.type** %p.2843
br label %.for.start.2837
.for.end.2837:
%.tmp2870 = getelementptr i8*, i8** %buf.2769, i32 0
%.tmp2872 = getelementptr [4 x i8], [4 x i8]*@.str2871, i32 0, i32 0
%.tmp2873 = load i8*, i8** %buf.2769
%.tmp2874 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2870, i8* %.tmp2872, i8* %.tmp2873)
%.tmp2875 = load i8*, i8** %buf.2769
ret i8* %.tmp2875
br label %.if.end.2827
.if.false.2827:
%.tmp2876 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2877 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2876, i32 0, i32 0
%.tmp2878 = load i8*, i8** %.tmp2877
%.tmp2880 = getelementptr [4 x i8], [4 x i8]*@.str2879, i32 0, i32 0
%.tmp2881 = call i32(i8*,i8*) @strcmp(i8* %.tmp2878, i8* %.tmp2880)
%.tmp2882 = icmp eq i32 %.tmp2881, 0
br i1 %.tmp2882, label %.if.true.2883, label %.if.false.2883
.if.true.2883:
%.tmp2884 = getelementptr i8*, i8** %buf.2769, i32 0
%.tmp2886 = getelementptr [4 x i8], [4 x i8]*@.str2885, i32 0, i32 0
%.tmp2887 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp2888 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2889 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2888, i32 0, i32 3
%.tmp2890 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp2889
%.tmp2891 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp2887, %m2756$.Type.type* %.tmp2890)
%.tmp2892 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2884, i8* %.tmp2886, i8* %.tmp2891)
%.tmp2893 = load i8*, i8** %buf.2769
ret i8* %.tmp2893
br label %.if.end.2883
.if.false.2883:
%.tmp2894 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2895 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2894, i32 0, i32 0
%.tmp2896 = load i8*, i8** %.tmp2895
%.tmp2898 = getelementptr [7 x i8], [7 x i8]*@.str2897, i32 0, i32 0
%.tmp2899 = call i32(i8*,i8*) @strcmp(i8* %.tmp2896, i8* %.tmp2898)
%.tmp2900 = icmp eq i32 %.tmp2899, 0
br i1 %.tmp2900, label %.if.true.2901, label %.if.false.2901
.if.true.2901:
%.tmp2902 = getelementptr i8*, i8** %buf.2769, i32 0
%.tmp2904 = getelementptr [2 x i8], [2 x i8]*@.str2903, i32 0, i32 0
%.tmp2905 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2902, i8* %.tmp2904)
%.tmp2907 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2908 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2907, i32 0, i32 3
%.tmp2909 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp2908
%t.2910 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp2909, %m2756$.Type.type** %t.2910
br label %.for.start.2906
.for.start.2906:
%.tmp2911 = load %m2756$.Type.type*, %m2756$.Type.type** %t.2910
%.tmp2912 = icmp ne %m2756$.Type.type* %.tmp2911, null
br i1 %.tmp2912, label %.for.continue.2906, label %.for.end.2906
.for.continue.2906:
%.tmp2913 = load %m2756$.Type.type*, %m2756$.Type.type** %t.2910
%.tmp2914 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2915 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2914, i32 0, i32 3
%.tmp2916 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp2915
%.tmp2917 = icmp ne %m2756$.Type.type* %.tmp2913, %.tmp2916
br i1 %.tmp2917, label %.if.true.2918, label %.if.false.2918
.if.true.2918:
%.tmp2919 = getelementptr i8*, i8** %buf.2769, i32 0
%.tmp2921 = getelementptr [4 x i8], [4 x i8]*@.str2920, i32 0, i32 0
%.tmp2922 = load i8*, i8** %buf.2769
%.tmp2923 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2919, i8* %.tmp2921, i8* %.tmp2922)
br label %.if.end.2918
.if.false.2918:
br label %.if.end.2918
.if.end.2918:
%.tmp2924 = getelementptr i8*, i8** %buf.2769, i32 0
%.tmp2926 = getelementptr [5 x i8], [5 x i8]*@.str2925, i32 0, i32 0
%.tmp2927 = load i8*, i8** %buf.2769
%.tmp2928 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp2929 = load %m2756$.Type.type*, %m2756$.Type.type** %t.2910
%.tmp2930 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp2928, %m2756$.Type.type* %.tmp2929)
%.tmp2931 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2924, i8* %.tmp2926, i8* %.tmp2927, i8* %.tmp2930)
%.tmp2932 = load %m2756$.Type.type*, %m2756$.Type.type** %t.2910
%.tmp2933 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2932, i32 0, i32 4
%.tmp2934 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp2933
store %m2756$.Type.type* %.tmp2934, %m2756$.Type.type** %t.2910
br label %.for.start.2906
.for.end.2906:
%.tmp2935 = getelementptr i8*, i8** %buf.2769, i32 0
%.tmp2937 = getelementptr [4 x i8], [4 x i8]*@.str2936, i32 0, i32 0
%.tmp2938 = load i8*, i8** %buf.2769
%.tmp2939 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2935, i8* %.tmp2937, i8* %.tmp2938)
%.tmp2940 = load i8*, i8** %buf.2769
ret i8* %.tmp2940
br label %.if.end.2901
.if.false.2901:
%.tmp2941 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2942 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2941, i32 0, i32 0
%.tmp2943 = load i8*, i8** %.tmp2942
%.tmp2945 = getelementptr [6 x i8], [6 x i8]*@.str2944, i32 0, i32 0
%.tmp2946 = call i32(i8*,i8*) @strcmp(i8* %.tmp2943, i8* %.tmp2945)
%.tmp2947 = icmp eq i32 %.tmp2946, 0
br i1 %.tmp2947, label %.if.true.2948, label %.if.false.2948
.if.true.2948:
%.tmp2949 = getelementptr i8*, i8** %buf.2769, i32 0
%.tmp2951 = getelementptr [10 x i8], [10 x i8]*@.str2950, i32 0, i32 0
%.tmp2952 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2953 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2952, i32 0, i32 3
%.tmp2954 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp2953
%.tmp2955 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2954, i32 0, i32 4
%.tmp2956 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp2955
%.tmp2957 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2956, i32 0, i32 0
%.tmp2958 = load i8*, i8** %.tmp2957
%.tmp2959 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp2960 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2961 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2960, i32 0, i32 3
%.tmp2962 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp2961
%.tmp2963 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp2959, %m2756$.Type.type* %.tmp2962)
%.tmp2964 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2949, i8* %.tmp2951, i8* %.tmp2958, i8* %.tmp2963)
%.tmp2965 = load i8*, i8** %buf.2769
ret i8* %.tmp2965
br label %.if.end.2948
.if.false.2948:
%.tmp2966 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2967 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2966, i32 0, i32 0
%.tmp2968 = load i8*, i8** %.tmp2967
%.tmp2970 = getelementptr [10 x i8], [10 x i8]*@.str2969, i32 0, i32 0
%.tmp2971 = call i32(i8*,i8*) @strcmp(i8* %.tmp2968, i8* %.tmp2970)
%.tmp2972 = icmp eq i32 %.tmp2971, 0
br i1 %.tmp2972, label %.if.true.2973, label %.if.false.2973
.if.true.2973:
%.tmp2974 = getelementptr i8*, i8** %buf.2769, i32 0
%.tmp2976 = getelementptr [5 x i8], [5 x i8]*@.str2975, i32 0, i32 0
%.tmp2977 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2978 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2977, i32 0, i32 2
%.tmp2979 = load i8*, i8** %.tmp2978
%.tmp2980 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2974, i8* %.tmp2976, i8* %.tmp2979)
%.tmp2981 = load i8*, i8** %buf.2769
ret i8* %.tmp2981
br label %.if.end.2973
.if.false.2973:
%.tmp2982 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2983 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2982, i32 0, i32 0
%.tmp2984 = load i8*, i8** %.tmp2983
%.tmp2986 = getelementptr [7 x i8], [7 x i8]*@.str2985, i32 0, i32 0
%.tmp2987 = call i32(i8*,i8*) @strcmp(i8* %.tmp2984, i8* %.tmp2986)
%.tmp2988 = icmp eq i32 %.tmp2987, 0
br i1 %.tmp2988, label %.if.true.2989, label %.if.false.2989
.if.true.2989:
%.tmp2991 = getelementptr [4 x i8], [4 x i8]*@.str2990, i32 0, i32 0
ret i8* %.tmp2991
br label %.if.end.2989
.if.false.2989:
%.tmp2992 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp2993 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp2992, i32 0, i32 0
%.tmp2994 = load i8*, i8** %.tmp2993
%.tmp2996 = getelementptr [6 x i8], [6 x i8]*@.str2995, i32 0, i32 0
%.tmp2997 = call i32(i8*,i8*) @strcmp(i8* %.tmp2994, i8* %.tmp2996)
%.tmp2998 = icmp eq i32 %.tmp2997, 0
br i1 %.tmp2998, label %.if.true.2999, label %.if.false.2999
.if.true.2999:
br label %.if.end.2999
.if.false.2999:
%.tmp3001 = getelementptr [53 x i8], [53 x i8]*@.str3000, i32 0, i32 0
%.tmp3002 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp3003 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3002, i32 0, i32 0
%.tmp3004 = load i8*, i8** %.tmp3003
%.tmp3005 = call i32(i8*,...) @printf(i8* %.tmp3001, i8* %.tmp3004)
br label %.if.end.2999
.if.end.2999:
br label %.if.end.2989
.if.end.2989:
br label %.if.end.2973
.if.end.2973:
br label %.if.end.2948
.if.end.2948:
br label %.if.end.2901
.if.end.2901:
br label %.if.end.2883
.if.end.2883:
br label %.if.end.2827
.if.end.2827:
br label %.if.end.2817
.if.end.2817:
br label %.if.end.2807
.if.end.2807:
br label %.if.end.2797
.if.end.2797:
br label %.if.end.2787
.if.end.2787:
br label %.if.end.2777
.if.end.2777:
%.tmp3006 = bitcast ptr null to i8*
ret i8* %.tmp3006
}
define i1 @m2757$cmp.b.m2756$.CompilerCtx.typep.m2756$.Type.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.Type.type* %.a.arg, %m2756$.Type.type* %.b.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%a = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.a.arg, %m2756$.Type.type** %a
%b = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.b.arg, %m2756$.Type.type** %b
%.tmp3007 = load %m2756$.Type.type*, %m2756$.Type.type** %a
%.tmp3008 = icmp eq %m2756$.Type.type* %.tmp3007, null
%.tmp3009 = load %m2756$.Type.type*, %m2756$.Type.type** %b
%.tmp3010 = icmp eq %m2756$.Type.type* %.tmp3009, null
%.tmp3011 = or i1 %.tmp3008, %.tmp3010
br i1 %.tmp3011, label %.if.true.3012, label %.if.false.3012
.if.true.3012:
ret i1 0
br label %.if.end.3012
.if.false.3012:
br label %.if.end.3012
.if.end.3012:
%.tmp3013 = load %m2756$.Type.type*, %m2756$.Type.type** %a
%.tmp3014 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3013, i32 0, i32 0
%.tmp3015 = load i8*, i8** %.tmp3014
%.tmp3017 = getelementptr [8 x i8], [8 x i8]*@.str3016, i32 0, i32 0
%.tmp3018 = call i32(i8*,i8*) @strcmp(i8* %.tmp3015, i8* %.tmp3017)
%.tmp3019 = icmp eq i32 %.tmp3018, 0
%.tmp3020 = load %m2756$.Type.type*, %m2756$.Type.type** %b
%.tmp3021 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3020, i32 0, i32 0
%.tmp3022 = load i8*, i8** %.tmp3021
%.tmp3024 = getelementptr [8 x i8], [8 x i8]*@.str3023, i32 0, i32 0
%.tmp3025 = call i32(i8*,i8*) @strcmp(i8* %.tmp3022, i8* %.tmp3024)
%.tmp3026 = icmp eq i32 %.tmp3025, 0
%.tmp3027 = or i1 %.tmp3019, %.tmp3026
br i1 %.tmp3027, label %.if.true.3028, label %.if.false.3028
.if.true.3028:
%.tmp3029 = load %m2756$.Type.type*, %m2756$.Type.type** %a
%.tmp3030 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3029, i32 0, i32 0
%.tmp3031 = load i8*, i8** %.tmp3030
%.tmp3033 = getelementptr [4 x i8], [4 x i8]*@.str3032, i32 0, i32 0
%.tmp3034 = call i32(i8*,i8*) @strcmp(i8* %.tmp3031, i8* %.tmp3033)
%.tmp3035 = icmp eq i32 %.tmp3034, 0
%.tmp3036 = load %m2756$.Type.type*, %m2756$.Type.type** %b
%.tmp3037 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3036, i32 0, i32 0
%.tmp3038 = load i8*, i8** %.tmp3037
%.tmp3040 = getelementptr [4 x i8], [4 x i8]*@.str3039, i32 0, i32 0
%.tmp3041 = call i32(i8*,i8*) @strcmp(i8* %.tmp3038, i8* %.tmp3040)
%.tmp3042 = icmp eq i32 %.tmp3041, 0
%.tmp3043 = or i1 %.tmp3035, %.tmp3042
ret i1 %.tmp3043
br label %.if.end.3028
.if.false.3028:
br label %.if.end.3028
.if.end.3028:
%.tmp3044 = load %m2756$.Type.type*, %m2756$.Type.type** %a
%.tmp3045 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3044, i32 0, i32 0
%.tmp3046 = load i8*, i8** %.tmp3045
%.tmp3048 = getelementptr [10 x i8], [10 x i8]*@.str3047, i32 0, i32 0
%.tmp3049 = call i32(i8*,i8*) @strcmp(i8* %.tmp3046, i8* %.tmp3048)
%.tmp3050 = icmp eq i32 %.tmp3049, 0
br i1 %.tmp3050, label %.if.true.3051, label %.if.false.3051
.if.true.3051:
%.tmp3052 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3053 = load %m2756$.Type.type*, %m2756$.Type.type** %a
%.tmp3054 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3053, i32 0, i32 3
%.tmp3055 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3054
%.tmp3056 = load %m2756$.Type.type*, %m2756$.Type.type** %b
%.tmp3057 = call i1(%m2756$.CompilerCtx.type*,%m2756$.Type.type*,%m2756$.Type.type*) @m2757$cmp.b.m2756$.CompilerCtx.typep.m2756$.Type.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp3052, %m2756$.Type.type* %.tmp3055, %m2756$.Type.type* %.tmp3056)
ret i1 %.tmp3057
br label %.if.end.3051
.if.false.3051:
br label %.if.end.3051
.if.end.3051:
%.tmp3058 = load %m2756$.Type.type*, %m2756$.Type.type** %b
%.tmp3059 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3058, i32 0, i32 0
%.tmp3060 = load i8*, i8** %.tmp3059
%.tmp3062 = getelementptr [10 x i8], [10 x i8]*@.str3061, i32 0, i32 0
%.tmp3063 = call i32(i8*,i8*) @strcmp(i8* %.tmp3060, i8* %.tmp3062)
%.tmp3064 = icmp eq i32 %.tmp3063, 0
br i1 %.tmp3064, label %.if.true.3065, label %.if.false.3065
.if.true.3065:
%.tmp3066 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3067 = load %m2756$.Type.type*, %m2756$.Type.type** %a
%.tmp3068 = load %m2756$.Type.type*, %m2756$.Type.type** %b
%.tmp3069 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3068, i32 0, i32 3
%.tmp3070 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3069
%.tmp3071 = call i1(%m2756$.CompilerCtx.type*,%m2756$.Type.type*,%m2756$.Type.type*) @m2757$cmp.b.m2756$.CompilerCtx.typep.m2756$.Type.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp3066, %m2756$.Type.type* %.tmp3067, %m2756$.Type.type* %.tmp3070)
ret i1 %.tmp3071
br label %.if.end.3065
.if.false.3065:
br label %.if.end.3065
.if.end.3065:
%.tmp3072 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3073 = load %m2756$.Type.type*, %m2756$.Type.type** %a
%.tmp3074 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp3072, %m2756$.Type.type* %.tmp3073)
%a_repr.3075 = alloca i8*
store i8* %.tmp3074, i8** %a_repr.3075
%.tmp3076 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3077 = load %m2756$.Type.type*, %m2756$.Type.type** %b
%.tmp3078 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp3076, %m2756$.Type.type* %.tmp3077)
%b_repr.3079 = alloca i8*
store i8* %.tmp3078, i8** %b_repr.3079
%.tmp3080 = load i8*, i8** %a_repr.3075
%.tmp3081 = load i8*, i8** %b_repr.3079
%.tmp3082 = call i32(i8*,i8*) @strcmp(i8* %.tmp3080, i8* %.tmp3081)
%.tmp3083 = icmp eq i32 %.tmp3082, 0
ret i1 %.tmp3083
}
@DEBUG_INTERNALS = constant i1 0
define %m2756$.Type.type* @m295$type_clone.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.t.arg) {
%t = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.t.arg, %m2756$.Type.type** %t
%.tmp3084 = load %m2756$.Type.type*, %m2756$.Type.type** %t
%.tmp3085 = icmp eq %m2756$.Type.type* %.tmp3084, null
br i1 %.tmp3085, label %.if.true.3086, label %.if.false.3086
.if.true.3086:
%.tmp3087 = bitcast ptr null to %m2756$.Type.type*
ret %m2756$.Type.type* %.tmp3087
br label %.if.end.3086
.if.false.3086:
br label %.if.end.3086
.if.end.3086:
%.tmp3088 = getelementptr %m2756$.Type.type, %m2756$.Type.type* null, i32 1
%.tmp3089 = ptrtoint %m2756$.Type.type* %.tmp3088 to i32
%.tmp3090 = call i8*(i32) @malloc(i32 %.tmp3089)
%.tmp3091 = bitcast i8* %.tmp3090 to %m2756$.Type.type*
%clone.3092 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp3091, %m2756$.Type.type** %clone.3092
%.tmp3093 = load %m2756$.Type.type*, %m2756$.Type.type** %clone.3092
%.tmp3094 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3093, i32 0, i32 3
%.tmp3095 = load %m2756$.Type.type*, %m2756$.Type.type** %t
%.tmp3096 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3095, i32 0, i32 3
%.tmp3097 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3096
store %m2756$.Type.type* %.tmp3097, %m2756$.Type.type** %.tmp3094
%.tmp3098 = load %m2756$.Type.type*, %m2756$.Type.type** %clone.3092
%.tmp3099 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3098, i32 0, i32 4
%.tmp3100 = load %m2756$.Type.type*, %m2756$.Type.type** %t
%.tmp3101 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3100, i32 0, i32 4
%.tmp3102 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3101
%.tmp3103 = call %m2756$.Type.type*(%m2756$.Type.type*) @m295$type_clone.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.tmp3102)
store %m2756$.Type.type* %.tmp3103, %m2756$.Type.type** %.tmp3099
%.tmp3104 = load %m2756$.Type.type*, %m2756$.Type.type** %clone.3092
%.tmp3105 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3104, i32 0, i32 2
%.tmp3106 = load %m2756$.Type.type*, %m2756$.Type.type** %t
%.tmp3107 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3106, i32 0, i32 2
%.tmp3108 = load i8*, i8** %.tmp3107
store i8* %.tmp3108, i8** %.tmp3105
%.tmp3109 = load %m2756$.Type.type*, %m2756$.Type.type** %clone.3092
%.tmp3110 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3109, i32 0, i32 0
%.tmp3111 = load %m2756$.Type.type*, %m2756$.Type.type** %t
%.tmp3112 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3111, i32 0, i32 0
%.tmp3113 = load i8*, i8** %.tmp3112
store i8* %.tmp3113, i8** %.tmp3110
%.tmp3114 = load %m2756$.Type.type*, %m2756$.Type.type** %clone.3092
%.tmp3115 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3114, i32 0, i32 1
%.tmp3116 = load %m2756$.Type.type*, %m2756$.Type.type** %t
%.tmp3117 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3116, i32 0, i32 1
%.tmp3118 = load i8*, i8** %.tmp3117
store i8* %.tmp3118, i8** %.tmp3115
%.tmp3119 = load %m2756$.Type.type*, %m2756$.Type.type** %clone.3092
ret %m2756$.Type.type* %.tmp3119
}
define i8* @m295$get_root.cp() {
%.tmp3121 = getelementptr [12 x i8], [12 x i8]*@.str3120, i32 0, i32 0
%.tmp3122 = call i8*(i8*) @getenv(i8* %.tmp3121)
%project_root.3123 = alloca i8*
store i8* %.tmp3122, i8** %project_root.3123
%.tmp3124 = load i8*, i8** %project_root.3123
%.tmp3125 = icmp eq i8* %.tmp3124, null
br i1 %.tmp3125, label %.if.true.3126, label %.if.false.3126
.if.true.3126:
%.tmp3128 = getelementptr [5 x i8], [5 x i8]*@.str3127, i32 0, i32 0
%.tmp3129 = call i8*(i8*) @getenv(i8* %.tmp3128)
%home.3130 = alloca i8*
store i8* %.tmp3129, i8** %home.3130
%.tmp3131 = getelementptr i8*, i8** %project_root.3123, i32 0
%.tmp3133 = getelementptr [11 x i8], [11 x i8]*@.str3132, i32 0, i32 0
%.tmp3134 = load i8*, i8** %home.3130
%.tmp3135 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3131, i8* %.tmp3133, i8* %.tmp3134)
br label %.if.end.3126
.if.false.3126:
br label %.if.end.3126
.if.end.3126:
%.tmp3136 = load i8*, i8** %project_root.3123
ret i8* %.tmp3136
}
define %m2756$.Type.type* @m295$new_type.m2756$.Type.typep() {
%.tmp3137 = getelementptr %m2756$.Type.type, %m2756$.Type.type* null, i32 1
%.tmp3138 = ptrtoint %m2756$.Type.type* %.tmp3137 to i32
%.tmp3139 = call i8*(i32) @malloc(i32 %.tmp3138)
%.tmp3140 = bitcast i8* %.tmp3139 to %m2756$.Type.type*
%type.3141 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp3140, %m2756$.Type.type** %type.3141
%.tmp3142 = load %m2756$.Type.type*, %m2756$.Type.type** %type.3141
%.tmp3143 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3142, i32 0, i32 1
store i8* null, i8** %.tmp3143
%.tmp3144 = load %m2756$.Type.type*, %m2756$.Type.type** %type.3141
%.tmp3145 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3144, i32 0, i32 2
store i8* null, i8** %.tmp3145
%.tmp3146 = load %m2756$.Type.type*, %m2756$.Type.type** %type.3141
%.tmp3147 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3146, i32 0, i32 0
store i8* null, i8** %.tmp3147
%.tmp3148 = load %m2756$.Type.type*, %m2756$.Type.type** %type.3141
%.tmp3149 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3148, i32 0, i32 3
store %m2756$.Type.type* null, %m2756$.Type.type** %.tmp3149
%.tmp3150 = load %m2756$.Type.type*, %m2756$.Type.type** %type.3141
%.tmp3151 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3150, i32 0, i32 4
store %m2756$.Type.type* null, %m2756$.Type.type** %.tmp3151
%.tmp3152 = load %m2756$.Type.type*, %m2756$.Type.type** %type.3141
ret %m2756$.Type.type* %.tmp3152
}
define void @m295$copy_type.v.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.dest.arg, %m2756$.Type.type* %.src.arg) {
%dest = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.dest.arg, %m2756$.Type.type** %dest
%src = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.src.arg, %m2756$.Type.type** %src
%.tmp3153 = load %m2756$.Type.type*, %m2756$.Type.type** %dest
%.tmp3154 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3153, i32 0, i32 0
%.tmp3155 = load %m2756$.Type.type*, %m2756$.Type.type** %src
%.tmp3156 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3155, i32 0, i32 0
%.tmp3157 = load i8*, i8** %.tmp3156
store i8* %.tmp3157, i8** %.tmp3154
%.tmp3158 = load %m2756$.Type.type*, %m2756$.Type.type** %dest
%.tmp3159 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3158, i32 0, i32 1
%.tmp3160 = load %m2756$.Type.type*, %m2756$.Type.type** %src
%.tmp3161 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3160, i32 0, i32 1
%.tmp3162 = load i8*, i8** %.tmp3161
store i8* %.tmp3162, i8** %.tmp3159
%.tmp3163 = load %m2756$.Type.type*, %m2756$.Type.type** %dest
%.tmp3164 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3163, i32 0, i32 2
%.tmp3165 = load %m2756$.Type.type*, %m2756$.Type.type** %src
%.tmp3166 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3165, i32 0, i32 2
%.tmp3167 = load i8*, i8** %.tmp3166
store i8* %.tmp3167, i8** %.tmp3164
%.tmp3168 = load %m2756$.Type.type*, %m2756$.Type.type** %dest
%.tmp3169 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3168, i32 0, i32 3
%.tmp3170 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3169
%.tmp3171 = load %m2756$.Type.type*, %m2756$.Type.type** %src
%.tmp3172 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3171, i32 0, i32 3
%.tmp3173 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3172
%.tmp3174 = icmp ne %m2756$.Type.type* %.tmp3170, %.tmp3173
br i1 %.tmp3174, label %.if.true.3175, label %.if.false.3175
.if.true.3175:
%.tmp3176 = load %m2756$.Type.type*, %m2756$.Type.type** %dest
%.tmp3177 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3176, i32 0, i32 3
%.tmp3178 = load %m2756$.Type.type*, %m2756$.Type.type** %src
%.tmp3179 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3178, i32 0, i32 3
%.tmp3180 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3179
store %m2756$.Type.type* %.tmp3180, %m2756$.Type.type** %.tmp3177
%.tmp3181 = load %m2756$.Type.type*, %m2756$.Type.type** %dest
%.tmp3182 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3181, i32 0, i32 3
%.tmp3183 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3182
%.tmp3184 = load %m2756$.Type.type*, %m2756$.Type.type** %src
%.tmp3185 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3184, i32 0, i32 3
%.tmp3186 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3185
call void(%m2756$.Type.type*,%m2756$.Type.type*) @m295$copy_type.v.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.tmp3183, %m2756$.Type.type* %.tmp3186)
br label %.if.end.3175
.if.false.3175:
br label %.if.end.3175
.if.end.3175:
%.tmp3187 = load %m2756$.Type.type*, %m2756$.Type.type** %dest
%.tmp3188 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3187, i32 0, i32 4
%.tmp3189 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3188
%.tmp3190 = load %m2756$.Type.type*, %m2756$.Type.type** %src
%.tmp3191 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3190, i32 0, i32 4
%.tmp3192 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3191
%.tmp3193 = icmp ne %m2756$.Type.type* %.tmp3189, %.tmp3192
br i1 %.tmp3193, label %.if.true.3194, label %.if.false.3194
.if.true.3194:
%.tmp3195 = load %m2756$.Type.type*, %m2756$.Type.type** %dest
%.tmp3196 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3195, i32 0, i32 4
%.tmp3197 = load %m2756$.Type.type*, %m2756$.Type.type** %src
%.tmp3198 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3197, i32 0, i32 4
%.tmp3199 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3198
store %m2756$.Type.type* %.tmp3199, %m2756$.Type.type** %.tmp3196
%.tmp3200 = load %m2756$.Type.type*, %m2756$.Type.type** %dest
%.tmp3201 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3200, i32 0, i32 4
%.tmp3202 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3201
%.tmp3203 = load %m2756$.Type.type*, %m2756$.Type.type** %src
%.tmp3204 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3203, i32 0, i32 4
%.tmp3205 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3204
call void(%m2756$.Type.type*,%m2756$.Type.type*) @m295$copy_type.v.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.tmp3202, %m2756$.Type.type* %.tmp3205)
br label %.if.end.3194
.if.false.3194:
br label %.if.end.3194
.if.end.3194:
ret void
}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m2756$.AssignableInfo.type* @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.node.arg) {
%node = alloca %m980$.Node.type*
store %m980$.Node.type* %.node.arg, %m980$.Node.type** %node
%.tmp3206 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* null, i32 1
%.tmp3207 = ptrtoint %m2756$.AssignableInfo.type* %.tmp3206 to i32
%.tmp3208 = call i8*(i32) @malloc(i32 %.tmp3207)
%.tmp3209 = bitcast i8* %.tmp3208 to %m2756$.AssignableInfo.type*
%ptr.3210 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp3209, %m2756$.AssignableInfo.type** %ptr.3210
%.tmp3211 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %ptr.3210
%.tmp3212 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3211, i32 0, i32 1
%.tmp3213 = load i8, i8* @SCOPE_CONST
store i8 %.tmp3213, i8* %.tmp3212
%.tmp3214 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %ptr.3210
%.tmp3215 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3214, i32 0, i32 0
store i8* null, i8** %.tmp3215
%.tmp3216 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %ptr.3210
%.tmp3217 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3216, i32 0, i32 3
store i8* null, i8** %.tmp3217
%.tmp3218 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %ptr.3210
%.tmp3219 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3218, i32 0, i32 2
%.tmp3221 = getelementptr [1 x i8], [1 x i8]*@.str3220, i32 0, i32 0
store i8* %.tmp3221, i8** %.tmp3219
%.tmp3222 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %ptr.3210
%.tmp3223 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3222, i32 0, i32 4
store %m2756$.Type.type* null, %m2756$.Type.type** %.tmp3223
%.tmp3224 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp3225 = icmp ne %m980$.Node.type* %.tmp3224, null
br i1 %.tmp3225, label %.if.true.3226, label %.if.false.3226
.if.true.3226:
%.tmp3227 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %ptr.3210
%.tmp3228 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3227, i32 0, i32 5
%.tmp3229 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp3230 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3229, i32 0, i32 3
%.tmp3231 = load i32, i32* %.tmp3230
store i32 %.tmp3231, i32* %.tmp3228
%.tmp3232 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %ptr.3210
%.tmp3233 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3232, i32 0, i32 6
%.tmp3234 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp3235 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3234, i32 0, i32 4
%.tmp3236 = load i32, i32* %.tmp3235
store i32 %.tmp3236, i32* %.tmp3233
%.tmp3237 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %ptr.3210
%.tmp3238 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3237, i32 0, i32 7
%.tmp3239 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp3240 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3239, i32 0, i32 2
%.tmp3241 = load i8*, i8** %.tmp3240
store i8* %.tmp3241, i8** %.tmp3238
br label %.if.end.3226
.if.false.3226:
%.tmp3242 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %ptr.3210
%.tmp3243 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3242, i32 0, i32 5
store i32 0, i32* %.tmp3243
%.tmp3244 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %ptr.3210
%.tmp3245 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3244, i32 0, i32 6
store i32 0, i32* %.tmp3245
%.tmp3246 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %ptr.3210
%.tmp3247 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3246, i32 0, i32 7
store i8* null, i8** %.tmp3247
br label %.if.end.3226
.if.end.3226:
%.tmp3248 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %ptr.3210
ret %m2756$.AssignableInfo.type* %.tmp3248
}
define void @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.info.arg, %m2756$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp3249 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp3250 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3249, i32 0, i32 0
%.tmp3251 = load i8*, i8** %id
store i8* %.tmp3251, i8** %.tmp3250
%.tmp3252 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp3253 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3252, i32 0, i32 1
%.tmp3254 = load i8, i8* %scope
store i8 %.tmp3254, i8* %.tmp3253
ret void
}
define i8* @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.info.arg) {
%info = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.info.arg, %m2756$.AssignableInfo.type** %info
%.tmp3255 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp3256 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3255, i32 0, i32 1
%.tmp3257 = load i8, i8* %.tmp3256
%.tmp3258 = load i8, i8* @SCOPE_CONST
%.tmp3259 = icmp eq i8 %.tmp3257, %.tmp3258
br i1 %.tmp3259, label %.if.true.3260, label %.if.false.3260
.if.true.3260:
%.tmp3261 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp3262 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3261, i32 0, i32 0
%.tmp3263 = load i8*, i8** %.tmp3262
ret i8* %.tmp3263
br label %.if.end.3260
.if.false.3260:
br label %.if.end.3260
.if.end.3260:
%.tmp3265 = getelementptr [1 x i8], [1 x i8]*@.str3264, i32 0, i32 0
%buf.3266 = alloca i8*
store i8* %.tmp3265, i8** %buf.3266
%.tmp3267 = getelementptr i8*, i8** %buf.3266, i32 0
%.tmp3269 = getelementptr [5 x i8], [5 x i8]*@.str3268, i32 0, i32 0
%.tmp3270 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp3271 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3270, i32 0, i32 1
%.tmp3272 = load i8, i8* %.tmp3271
%.tmp3273 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp3274 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3273, i32 0, i32 0
%.tmp3275 = load i8*, i8** %.tmp3274
%.tmp3276 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3267, i8* %.tmp3269, i8 %.tmp3272, i8* %.tmp3275)
%.tmp3277 = load i8*, i8** %buf.3266
ret i8* %.tmp3277
}
define void @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%info = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.info.arg, %m2756$.AssignableInfo.type** %info
%.tmp3279 = getelementptr [1 x i8], [1 x i8]*@.str3278, i32 0, i32 0
%tmp_buff.3280 = alloca i8*
store i8* %.tmp3279, i8** %tmp_buff.3280
%.tmp3281 = getelementptr i8*, i8** %tmp_buff.3280, i32 0
%.tmp3283 = getelementptr [7 x i8], [7 x i8]*@.str3282, i32 0, i32 0
%.tmp3284 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3285 = call i32(%m2756$.CompilerCtx.type*) @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp3284)
%.tmp3286 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3281, i8* %.tmp3283, i32 %.tmp3285)
%.tmp3287 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp3288 = load i8, i8* @SCOPE_LOCAL
%.tmp3289 = load i8*, i8** %tmp_buff.3280
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp3287, i8 %.tmp3288, i8* %.tmp3289)
ret void
}
define %m2756$.ModuleLookup.type* @m295$get_module.m2756$.ModuleLookup.typep.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp3291 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3292 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3291, i32 0, i32 6
%.tmp3293 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %.tmp3292
%m.3294 = alloca %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* %.tmp3293, %m2756$.ModuleLookup.type** %m.3294
br label %.for.start.3290
.for.start.3290:
%.tmp3295 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.3294
%.tmp3296 = icmp ne %m2756$.ModuleLookup.type* %.tmp3295, null
br i1 %.tmp3296, label %.for.continue.3290, label %.for.end.3290
.for.continue.3290:
%.tmp3297 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.3294
%.tmp3298 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3297, i32 0, i32 0
%.tmp3299 = load i8*, i8** %.tmp3298
%.tmp3300 = load i8*, i8** %filename
%.tmp3301 = call i32(i8*,i8*) @strcmp(i8* %.tmp3299, i8* %.tmp3300)
%.tmp3302 = icmp eq i32 %.tmp3301, 0
br i1 %.tmp3302, label %.if.true.3303, label %.if.false.3303
.if.true.3303:
%.tmp3304 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.3294
ret %m2756$.ModuleLookup.type* %.tmp3304
br label %.if.end.3303
.if.false.3303:
br label %.if.end.3303
.if.end.3303:
%.tmp3305 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.3294
%.tmp3306 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3305, i32 0, i32 2
%.tmp3307 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %.tmp3306
store %m2756$.ModuleLookup.type* %.tmp3307, %m2756$.ModuleLookup.type** %m.3294
br label %.for.start.3290
.for.end.3290:
%.tmp3308 = bitcast ptr null to %m2756$.ModuleLookup.type*
ret %m2756$.ModuleLookup.type* %.tmp3308
}
define %m2756$.ModuleLookup.type* @m295$get_current_module.m2756$.ModuleLookup.typep.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%.tmp3309 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3310 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3311 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3310, i32 0, i32 7
%.tmp3312 = load i8*, i8** %.tmp3311
%.tmp3313 = call %m2756$.ModuleLookup.type*(%m2756$.CompilerCtx.type*,i8*) @m295$get_module.m2756$.ModuleLookup.typep.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.tmp3309, i8* %.tmp3312)
ret %m2756$.ModuleLookup.type* %.tmp3313
}
define i32 @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%.tmp3314 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3315 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3314, i32 0, i32 5
%.tmp3316 = load i32, i32* %.tmp3315
%uid.3317 = alloca i32
store i32 %.tmp3316, i32* %uid.3317
%.tmp3318 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3319 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3318, i32 0, i32 5
%.tmp3320 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3321 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3320, i32 0, i32 5
%.tmp3322 = load i32, i32* %.tmp3321
%.tmp3323 = add i32 %.tmp3322, 1
store i32 %.tmp3323, i32* %.tmp3319
%.tmp3324 = load i32, i32* %uid.3317
ret i32 %.tmp3324
}
define %m2756$.CompilerCtx.type* @m295$new_context.m2756$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp3325 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* null, i32 1
%.tmp3326 = ptrtoint %m2756$.CompilerCtx.type* %.tmp3325 to i32
%.tmp3327 = call i8*(i32) @malloc(i32 %.tmp3326)
%.tmp3328 = bitcast i8* %.tmp3327 to %m2756$.CompilerCtx.type*
%ctx.3329 = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.tmp3328, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3330 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3331 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3330, i32 0, i32 1
%.tmp3332 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp3332, %m0$.File.type** %.tmp3331
%.tmp3333 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3334 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3333, i32 0, i32 0
%.tmp3335 = bitcast ptr null to %m980$.Node.type*
store %m980$.Node.type* %.tmp3335, %m980$.Node.type** %.tmp3334
%.tmp3336 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3337 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3336, i32 0, i32 2
store %m2756$.ErrorList.type* null, %m2756$.ErrorList.type** %.tmp3337
%.tmp3338 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3339 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3338, i32 0, i32 5
store i32 0, i32* %.tmp3339
%.tmp3340 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3341 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3340, i32 0, i32 3
store %m2756$.GlobalName.type* null, %m2756$.GlobalName.type** %.tmp3341
%.tmp3342 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3343 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3342, i32 0, i32 8
store %m2756$.AnonFn.type* null, %m2756$.AnonFn.type** %.tmp3343
%.tmp3344 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3345 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3344, i32 0, i32 7
%.tmp3346 = load i8*, i8** %filename
store i8* %.tmp3346, i8** %.tmp3345
%.tmp3347 = call i8*() @m2304$grammar.cp()
%.tmp3348 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp3347)
%grammar_file.3349 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp3348, %m0$.File.type** %grammar_file.3349
%.tmp3350 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3349
%.tmp3351 = icmp eq %m0$.File.type* %.tmp3350, null
br i1 %.tmp3351, label %.if.true.3352, label %.if.false.3352
.if.true.3352:
%.tmp3353 = bitcast ptr null to %m2756$.CompilerCtx.type*
ret %m2756$.CompilerCtx.type* %.tmp3353
br label %.if.end.3352
.if.false.3352:
br label %.if.end.3352
.if.end.3352:
%.tmp3354 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3349
%.tmp3355 = call %m980$.ParsingContext.type*(%m0$.File.type*) @m980$new_context.m980$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp3354)
%grammar_ctx.3356 = alloca %m980$.ParsingContext.type*
store %m980$.ParsingContext.type* %.tmp3355, %m980$.ParsingContext.type** %grammar_ctx.3356
%.tmp3357 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3349
%.tmp3358 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp3357)
%.tmp3359 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3360 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3359, i32 0, i32 4
%.tmp3361 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %grammar_ctx.3356
%.tmp3362 = call %m980$.Rule.type**(%m980$.ParsingContext.type*) @m980$parse_grammar.m980$.Rule.typepp.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.tmp3361)
store %m980$.Rule.type** %.tmp3362, %m980$.Rule.type*** %.tmp3360
%.tmp3363 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3364 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3363, i32 0, i32 4
%.tmp3365 = load %m980$.Rule.type**, %m980$.Rule.type*** %.tmp3364
%.tmp3366 = icmp eq %m980$.Rule.type** %.tmp3365, null
br i1 %.tmp3366, label %.if.true.3367, label %.if.false.3367
.if.true.3367:
%.tmp3369 = getelementptr [39 x i8], [39 x i8]*@.str3368, i32 0, i32 0
%.tmp3370 = call i32(i8*,...) @printf(i8* %.tmp3369)
call void(i32) @exit(i32 1)
br label %.if.end.3367
.if.false.3367:
br label %.if.end.3367
.if.end.3367:
%.tmp3371 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3372 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3371, i32 0, i32 6
%.tmp3373 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* null, i32 1
%.tmp3374 = ptrtoint %m2756$.ModuleLookup.type* %.tmp3373 to i32
%.tmp3375 = call i8*(i32) @malloc(i32 %.tmp3374)
%.tmp3376 = bitcast i8* %.tmp3375 to %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* %.tmp3376, %m2756$.ModuleLookup.type** %.tmp3372
%.tmp3377 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3378 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3377, i32 0, i32 6
%.tmp3379 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %.tmp3378
%.tmp3380 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3379, i32 0, i32 0
%.tmp3381 = load i8*, i8** %filename
store i8* %.tmp3381, i8** %.tmp3380
%.tmp3382 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3383 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3382, i32 0, i32 6
%.tmp3384 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %.tmp3383
%.tmp3385 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3384, i32 0, i32 3
store %m2756$.Scope.type* null, %m2756$.Scope.type** %.tmp3385
%.tmp3386 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3387 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3386, i32 0, i32 6
%.tmp3388 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %.tmp3387
%.tmp3389 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3388, i32 0, i32 1
%.tmp3391 = getelementptr [1 x i8], [1 x i8]*@.str3390, i32 0, i32 0
store i8* %.tmp3391, i8** %.tmp3389
%.tmp3392 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3393 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3392, i32 0, i32 6
%.tmp3394 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %.tmp3393
%.tmp3395 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3394, i32 0, i32 2
store %m2756$.ModuleLookup.type* null, %m2756$.ModuleLookup.type** %.tmp3395
%.tmp3396 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx.3329
%.tmp3397 = bitcast %m2756$.CompilerCtx.type* %.tmp3396 to %m2756$.CompilerCtx.type*
ret %m2756$.CompilerCtx.type* %.tmp3397
}
define void @m295$push_scope.v.m2756$.CompilerCtx.typep.cp.cp.cp.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.ctx.arg, i8* %.type.arg, i8* %.begin_id.arg, i8* %.end_id.arg, %m2756$.Type.type* %.t.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%type = alloca i8*
store i8* %.type.arg, i8** %type
%begin_id = alloca i8*
store i8* %.begin_id.arg, i8** %begin_id
%end_id = alloca i8*
store i8* %.end_id.arg, i8** %end_id
%t = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.t.arg, %m2756$.Type.type** %t
%.tmp3398 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* null, i32 1
%.tmp3399 = ptrtoint %m2756$.Scope.type* %.tmp3398 to i32
%.tmp3400 = call i8*(i32) @malloc(i32 %.tmp3399)
%.tmp3401 = bitcast i8* %.tmp3400 to %m2756$.Scope.type*
%s.3402 = alloca %m2756$.Scope.type*
store %m2756$.Scope.type* %.tmp3401, %m2756$.Scope.type** %s.3402
%.tmp3403 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3404 = call %m2756$.ModuleLookup.type*(%m2756$.CompilerCtx.type*) @m295$get_current_module.m2756$.ModuleLookup.typep.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp3403)
%m.3405 = alloca %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* %.tmp3404, %m2756$.ModuleLookup.type** %m.3405
%.tmp3406 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.3402
%.tmp3407 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp3406, i32 0, i32 5
%.tmp3408 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.3405
%.tmp3409 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3408, i32 0, i32 3
%.tmp3410 = load %m2756$.Scope.type*, %m2756$.Scope.type** %.tmp3409
store %m2756$.Scope.type* %.tmp3410, %m2756$.Scope.type** %.tmp3407
%.tmp3411 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.3402
%.tmp3412 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp3411, i32 0, i32 1
store %m2756$.ScopeItem.type* null, %m2756$.ScopeItem.type** %.tmp3412
%.tmp3413 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.3402
%.tmp3414 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp3413, i32 0, i32 2
%.tmp3415 = load i8*, i8** %type
store i8* %.tmp3415, i8** %.tmp3414
%.tmp3416 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.3402
%.tmp3417 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp3416, i32 0, i32 3
%.tmp3418 = load i8*, i8** %begin_id
store i8* %.tmp3418, i8** %.tmp3417
%.tmp3419 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.3402
%.tmp3420 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp3419, i32 0, i32 4
%.tmp3421 = load i8*, i8** %end_id
store i8* %.tmp3421, i8** %.tmp3420
%.tmp3422 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.3402
%.tmp3423 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp3422, i32 0, i32 6
%.tmp3424 = load %m2756$.Type.type*, %m2756$.Type.type** %t
store %m2756$.Type.type* %.tmp3424, %m2756$.Type.type** %.tmp3423
%.tmp3425 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.3405
%.tmp3426 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3425, i32 0, i32 3
%.tmp3427 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.3402
store %m2756$.Scope.type* %.tmp3427, %m2756$.Scope.type** %.tmp3426
ret void
}
define void @m295$pop_scope.v.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%.tmp3428 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3429 = call %m2756$.ModuleLookup.type*(%m2756$.CompilerCtx.type*) @m295$get_current_module.m2756$.ModuleLookup.typep.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp3428)
%m.3430 = alloca %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* %.tmp3429, %m2756$.ModuleLookup.type** %m.3430
%.tmp3431 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.3430
%.tmp3432 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3431, i32 0, i32 3
%.tmp3433 = load %m2756$.Scope.type*, %m2756$.Scope.type** %.tmp3432
%.tmp3434 = icmp ne %m2756$.Scope.type* %.tmp3433, null
%.tmp3436 = getelementptr [61 x i8], [61 x i8]*@.str3435, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp3434, i8* %.tmp3436)
%.tmp3437 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.3430
%.tmp3438 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3437, i32 0, i32 3
%.tmp3439 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.3430
%.tmp3440 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3439, i32 0, i32 3
%.tmp3441 = load %m2756$.Scope.type*, %m2756$.Scope.type** %.tmp3440
%.tmp3442 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp3441, i32 0, i32 5
%.tmp3443 = load %m2756$.Scope.type*, %m2756$.Scope.type** %.tmp3442
store %m2756$.Scope.type* %.tmp3443, %m2756$.Scope.type** %.tmp3438
ret void
}
define i1 @m295$compile_file.b.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp3444 = load i8*, i8** %filepath
%.tmp3445 = load i32, i32* @O_RDONLY
%.tmp3446 = call i32(i8*,i32) @open(i8* %.tmp3444, i32 %.tmp3445)
%input_fd.3447 = alloca i32
store i32 %.tmp3446, i32* %input_fd.3447
%.tmp3448 = load i32, i32* %input_fd.3447
%.tmp3449 = icmp sle i32 %.tmp3448, 0
br i1 %.tmp3449, label %.if.true.3450, label %.if.false.3450
.if.true.3450:
%.tmp3452 = getelementptr [1 x i8], [1 x i8]*@.str3451, i32 0, i32 0
%err_msg.3453 = alloca i8*
store i8* %.tmp3452, i8** %err_msg.3453
%.tmp3454 = getelementptr i8*, i8** %err_msg.3453, i32 0
%.tmp3456 = getelementptr [26 x i8], [26 x i8]*@.str3455, i32 0, i32 0
%.tmp3457 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3458 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3454, i8* %.tmp3456, %m980$.Node.type* %.tmp3457)
%.tmp3459 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3460 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3461 = load i8*, i8** %err_msg.3453
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp3459, %m980$.Node.type* %.tmp3460, i8* %.tmp3461)
ret i1 0
br label %.if.end.3450
.if.false.3450:
br label %.if.end.3450
.if.end.3450:
%.tmp3462 = load i32, i32* %input_fd.3447
%.tmp3463 = call %m298$.PeekerInfo.type*(i32) @m298$new.m298$.PeekerInfo.typep.i(i32 %.tmp3462)
%p.3464 = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.tmp3463, %m298$.PeekerInfo.type** %p.3464
%.tmp3465 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.3464
%.tmp3466 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp3465, i32 0, i32 6
%.tmp3467 = load i8*, i8** %filepath
store i8* %.tmp3467, i8** %.tmp3466
%.tmp3468 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.3464
%.tmp3469 = call %m297$.Token.type*(%m298$.PeekerInfo.type*,i1) @m297$tokenize.m297$.Token.typep.m298$.PeekerInfo.typep.b(%m298$.PeekerInfo.type* %.tmp3468, i1 0)
%tokens.3470 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp3469, %m297$.Token.type** %tokens.3470
%.tmp3471 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3472 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3471, i32 0, i32 4
%.tmp3473 = load %m980$.Rule.type**, %m980$.Rule.type*** %.tmp3472
%.tmp3475 = getelementptr [6 x i8], [6 x i8]*@.str3474, i32 0, i32 0
%.tmp3476 = load %m297$.Token.type*, %m297$.Token.type** %tokens.3470
%.tmp3477 = call %m980$.ParseResult.type*(%m980$.Rule.type**,i8*,%m297$.Token.type*) @m980$ast.m980$.ParseResult.typep.m980$.Rule.typepp.cp.m297$.Token.typep(%m980$.Rule.type** %.tmp3473, i8* %.tmp3475, %m297$.Token.type* %.tmp3476)
%ast.3478 = alloca %m980$.ParseResult.type*
store %m980$.ParseResult.type* %.tmp3477, %m980$.ParseResult.type** %ast.3478
%.tmp3479 = load i32, i32* %input_fd.3447
%.tmp3480 = call i32(i32) @close(i32 %.tmp3479)
%.tmp3481 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %ast.3478
%.tmp3482 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp3481, i32 0, i32 0
%.tmp3483 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3482
%.tmp3484 = icmp ne %m296$.Error.type* %.tmp3483, null
br i1 %.tmp3484, label %.if.true.3485, label %.if.false.3485
.if.true.3485:
%.tmp3486 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3487 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %ast.3478
%.tmp3488 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp3487, i32 0, i32 0
%.tmp3489 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3488
call void(%m2756$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2756$.CompilerCtx.typep.m296$.Error.typep(%m2756$.CompilerCtx.type* %.tmp3486, %m296$.Error.type* %.tmp3489)
%.tmp3490 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
call void(%m2756$.CompilerCtx.type*) @m295$report_errors.v.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp3490)
ret i1 1
br label %.if.end.3485
.if.false.3485:
br label %.if.end.3485
.if.end.3485:
%.tmp3491 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3492 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %ast.3478
%.tmp3493 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp3492, i32 0, i32 1
%.tmp3494 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3493
%.tmp3495 = call i1(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile.b.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp3491, %m980$.Node.type* %.tmp3494)
ret i1 %.tmp3495
}
define void @m295$report_errors.v.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%.tmp3496 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3497 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3496, i32 0, i32 2
%.tmp3498 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %.tmp3497
%.tmp3499 = icmp ne %m2756$.ErrorList.type* %.tmp3498, null
br i1 %.tmp3499, label %.if.true.3500, label %.if.false.3500
.if.true.3500:
%.tmp3502 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3503 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3502, i32 0, i32 2
%.tmp3504 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %.tmp3503
%err.3505 = alloca %m2756$.ErrorList.type*
store %m2756$.ErrorList.type* %.tmp3504, %m2756$.ErrorList.type** %err.3505
br label %.for.start.3501
.for.start.3501:
%.tmp3506 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %err.3505
%.tmp3507 = icmp ne %m2756$.ErrorList.type* %.tmp3506, null
br i1 %.tmp3507, label %.for.continue.3501, label %.for.end.3501
.for.continue.3501:
%.tmp3508 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %err.3505
%.tmp3509 = getelementptr %m2756$.ErrorList.type, %m2756$.ErrorList.type* %.tmp3508, i32 0, i32 2
%.tmp3510 = load i1, i1* %.tmp3509
%.tmp3511 = icmp eq i1 %.tmp3510, 0
br i1 %.tmp3511, label %.if.true.3512, label %.if.false.3512
.if.true.3512:
%.tmp3513 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %err.3505
%.tmp3514 = getelementptr %m2756$.ErrorList.type, %m2756$.ErrorList.type* %.tmp3513, i32 0, i32 0
%.tmp3515 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3514
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp3515)
%.tmp3516 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %err.3505
%.tmp3517 = getelementptr %m2756$.ErrorList.type, %m2756$.ErrorList.type* %.tmp3516, i32 0, i32 2
store i1 1, i1* %.tmp3517
br label %.if.end.3512
.if.false.3512:
br label %.if.end.3512
.if.end.3512:
%.tmp3518 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %err.3505
%.tmp3519 = getelementptr %m2756$.ErrorList.type, %m2756$.ErrorList.type* %.tmp3518, i32 0, i32 1
%.tmp3520 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %.tmp3519
store %m2756$.ErrorList.type* %.tmp3520, %m2756$.ErrorList.type** %err.3505
br label %.for.start.3501
.for.end.3501:
br label %.if.end.3500
.if.false.3500:
br label %.if.end.3500
.if.end.3500:
ret void
}
define i1 @m295$compile.b.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.ast.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%ast = alloca %m980$.Node.type*
store %m980$.Node.type* %.ast.arg, %m980$.Node.type** %ast
%.tmp3521 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3522 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3521, i32 0, i32 2
%.tmp3523 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %.tmp3522
%.tmp3524 = icmp eq %m2756$.ErrorList.type* %.tmp3523, null
br i1 %.tmp3524, label %.if.true.3525, label %.if.false.3525
.if.true.3525:
%.tmp3526 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3527 = load %m980$.Node.type*, %m980$.Node.type** %ast
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_ast.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp3526, %m980$.Node.type* %.tmp3527)
br label %.if.end.3525
.if.false.3525:
br label %.if.end.3525
.if.end.3525:
%.tmp3528 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3529 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3528, i32 0, i32 2
%.tmp3530 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %.tmp3529
%.tmp3531 = icmp ne %m2756$.ErrorList.type* %.tmp3530, null
br i1 %.tmp3531, label %.if.true.3532, label %.if.false.3532
.if.true.3532:
%.tmp3533 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
call void(%m2756$.CompilerCtx.type*) @m295$report_errors.v.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp3533)
ret i1 1
br label %.if.end.3532
.if.false.3532:
br label %.if.end.3532
.if.end.3532:
ret i1 0
}
define void @m295$mark_weak_global.v.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp3535 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3536 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3535, i32 0, i32 3
%.tmp3537 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %.tmp3536
%g.3538 = alloca %m2756$.GlobalName.type*
store %m2756$.GlobalName.type* %.tmp3537, %m2756$.GlobalName.type** %g.3538
br label %.for.start.3534
.for.start.3534:
%.tmp3539 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g.3538
%.tmp3540 = icmp ne %m2756$.GlobalName.type* %.tmp3539, null
br i1 %.tmp3540, label %.for.continue.3534, label %.for.end.3534
.for.continue.3534:
%.tmp3541 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g.3538
%.tmp3542 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp3541, i32 0, i32 3
%.tmp3543 = load i1, i1* %.tmp3542
%.tmp3544 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g.3538
%.tmp3545 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp3544, i32 0, i32 0
%.tmp3546 = load i8*, i8** %.tmp3545
%.tmp3547 = load i8*, i8** %id
%.tmp3548 = call i32(i8*,i8*) @strcmp(i8* %.tmp3546, i8* %.tmp3547)
%.tmp3549 = icmp eq i32 %.tmp3548, 0
%.tmp3550 = and i1 %.tmp3543, %.tmp3549
br i1 %.tmp3550, label %.if.true.3551, label %.if.false.3551
.if.true.3551:
%.tmp3552 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g.3538
%.tmp3553 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp3552, i32 0, i32 2
store i1 1, i1* %.tmp3553
br label %.for.end.3534
br label %.if.end.3551
.if.false.3551:
br label %.if.end.3551
.if.end.3551:
%.tmp3554 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g.3538
%.tmp3555 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp3554, i32 0, i32 5
%.tmp3556 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %.tmp3555
store %m2756$.GlobalName.type* %.tmp3556, %m2756$.GlobalName.type** %g.3538
br label %.for.start.3534
.for.end.3534:
ret void
}
define void @m295$compile_ast.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.ast.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%ast = alloca %m980$.Node.type*
store %m980$.Node.type* %.ast.arg, %m980$.Node.type** %ast
%.tmp3557 = load %m980$.Node.type*, %m980$.Node.type** %ast
%.tmp3558 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3557, i32 0, i32 0
%.tmp3559 = load i8*, i8** %.tmp3558
%.tmp3561 = getelementptr [6 x i8], [6 x i8]*@.str3560, i32 0, i32 0
%.tmp3562 = call i32(i8*,i8*) @strcmp(i8* %.tmp3559, i8* %.tmp3561)
%.tmp3563 = icmp ne i32 %.tmp3562, 0
br i1 %.tmp3563, label %.if.true.3564, label %.if.false.3564
.if.true.3564:
%.tmp3565 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3566 = load %m980$.Node.type*, %m980$.Node.type** %ast
%.tmp3568 = getelementptr [29 x i8], [29 x i8]*@.str3567, i32 0, i32 0
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp3565, %m980$.Node.type* %.tmp3566, i8* %.tmp3568)
ret void
br label %.if.end.3564
.if.false.3564:
br label %.if.end.3564
.if.end.3564:
%.tmp3569 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3571 = getelementptr [7 x i8], [7 x i8]*@.str3570, i32 0, i32 0
%.tmp3572 = bitcast ptr null to i8*
%.tmp3573 = bitcast ptr null to i8*
%.tmp3574 = bitcast ptr null to %m2756$.Type.type*
call void(%m2756$.CompilerCtx.type*,i8*,i8*,i8*,%m2756$.Type.type*) @m295$push_scope.v.m2756$.CompilerCtx.typep.cp.cp.cp.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp3569, i8* %.tmp3571, i8* %.tmp3572, i8* %.tmp3573, %m2756$.Type.type* %.tmp3574)
%.tmp3575 = load %m980$.Node.type*, %m980$.Node.type** %ast
%.tmp3576 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3575, i32 0, i32 7
%.tmp3577 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3576
%start.3578 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3577, %m980$.Node.type** %start.3578
%.tmp3579 = load %m980$.Node.type*, %m980$.Node.type** %start.3578
%.tmp3580 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3579, i32 0, i32 0
%.tmp3581 = load i8*, i8** %.tmp3580
%.tmp3583 = getelementptr [13 x i8], [13 x i8]*@.str3582, i32 0, i32 0
%.tmp3584 = call i32(i8*,i8*) @strcmp(i8* %.tmp3581, i8* %.tmp3583)
%.tmp3585 = icmp eq i32 %.tmp3584, 0
br i1 %.tmp3585, label %.if.true.3586, label %.if.false.3586
.if.true.3586:
%.tmp3587 = load %m980$.Node.type*, %m980$.Node.type** %start.3578
%.tmp3588 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3587, i32 0, i32 8
%.tmp3589 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3588
store %m980$.Node.type* %.tmp3589, %m980$.Node.type** %start.3578
br label %.if.end.3586
.if.false.3586:
br label %.if.end.3586
.if.end.3586:
%.tmp3591 = load %m980$.Node.type*, %m980$.Node.type** %start.3578
%stmt.3592 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3591, %m980$.Node.type** %stmt.3592
br label %.for.start.3590
.for.start.3590:
%.tmp3593 = load %m980$.Node.type*, %m980$.Node.type** %stmt.3592
%.tmp3594 = icmp ne %m980$.Node.type* %.tmp3593, null
br i1 %.tmp3594, label %.for.continue.3590, label %.for.end.3590
.for.continue.3590:
%.tmp3595 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3596 = load %m980$.Node.type*, %m980$.Node.type** %stmt.3592
%.tmp3597 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3596, i32 0, i32 7
%.tmp3598 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3597
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i1) @m295$compile_statement.v.m2756$.CompilerCtx.typep.m980$.Node.typep.b(%m2756$.CompilerCtx.type* %.tmp3595, %m980$.Node.type* %.tmp3598, i1 1)
%.tmp3599 = load %m980$.Node.type*, %m980$.Node.type** %stmt.3592
%.tmp3600 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3599, i32 0, i32 8
%.tmp3601 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3600
store %m980$.Node.type* %.tmp3601, %m980$.Node.type** %stmt.3592
br label %.for.start.3590
.for.end.3590:
%.tmp3602 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3603 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3602, i32 0, i32 2
%.tmp3604 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %.tmp3603
%.tmp3605 = icmp ne %m2756$.ErrorList.type* %.tmp3604, null
br i1 %.tmp3605, label %.if.true.3606, label %.if.false.3606
.if.true.3606:
ret void
br label %.if.end.3606
.if.false.3606:
br label %.if.end.3606
.if.end.3606:
%.tmp3608 = load %m980$.Node.type*, %m980$.Node.type** %start.3578
%s.3609 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3608, %m980$.Node.type** %s.3609
br label %.for.start.3607
.for.start.3607:
%.tmp3610 = load %m980$.Node.type*, %m980$.Node.type** %s.3609
%.tmp3611 = icmp ne %m980$.Node.type* %.tmp3610, null
br i1 %.tmp3611, label %.for.continue.3607, label %.for.end.3607
.for.continue.3607:
%.tmp3612 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3613 = load %m980$.Node.type*, %m980$.Node.type** %s.3609
%.tmp3614 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3613, i32 0, i32 7
%.tmp3615 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3614
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i1) @m295$compile_statement.v.m2756$.CompilerCtx.typep.m980$.Node.typep.b(%m2756$.CompilerCtx.type* %.tmp3612, %m980$.Node.type* %.tmp3615, i1 0)
%.tmp3616 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
call void(%m2756$.CompilerCtx.type*) @m295$compile_anon_fn.v.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp3616)
%.tmp3617 = load %m980$.Node.type*, %m980$.Node.type** %s.3609
%.tmp3618 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3617, i32 0, i32 8
%.tmp3619 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3618
store %m980$.Node.type* %.tmp3619, %m980$.Node.type** %s.3609
br label %.for.start.3607
.for.end.3607:
%.tmp3620 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3621 = call %m2756$.ModuleLookup.type*(%m2756$.CompilerCtx.type*) @m295$get_current_module.m2756$.ModuleLookup.typep.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp3620)
%mod.3622 = alloca %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* %.tmp3621, %m2756$.ModuleLookup.type** %mod.3622
%.tmp3623 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.3622
%.tmp3624 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3623, i32 0, i32 1
%.tmp3625 = load i8*, i8** %.tmp3624
%.tmp3627 = getelementptr [1 x i8], [1 x i8]*@.str3626, i32 0, i32 0
%.tmp3628 = call i32(i8*,i8*) @strcmp(i8* %.tmp3625, i8* %.tmp3627)
%.tmp3629 = icmp eq i32 %.tmp3628, 0
br i1 %.tmp3629, label %.if.true.3630, label %.if.false.3630
.if.true.3630:
%.tmp3632 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3633 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3632, i32 0, i32 3
%.tmp3634 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %.tmp3633
%g.3635 = alloca %m2756$.GlobalName.type*
store %m2756$.GlobalName.type* %.tmp3634, %m2756$.GlobalName.type** %g.3635
br label %.for.start.3631
.for.start.3631:
%.tmp3636 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g.3635
%.tmp3637 = icmp ne %m2756$.GlobalName.type* %.tmp3636, null
br i1 %.tmp3637, label %.for.continue.3631, label %.for.end.3631
.for.continue.3631:
%.tmp3638 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3639 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g.3635
call void(%m2756$.CompilerCtx.type*,%m2756$.GlobalName.type*) @m295$compile_global.v.m2756$.CompilerCtx.typep.m2756$.GlobalName.typep(%m2756$.CompilerCtx.type* %.tmp3638, %m2756$.GlobalName.type* %.tmp3639)
%.tmp3640 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g.3635
%.tmp3641 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp3640, i32 0, i32 5
%.tmp3642 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %.tmp3641
store %m2756$.GlobalName.type* %.tmp3642, %m2756$.GlobalName.type** %g.3635
br label %.for.start.3631
.for.end.3631:
br label %.if.end.3630
.if.false.3630:
br label %.if.end.3630
.if.end.3630:
ret void
}
define void @m295$compile_global.v.m2756$.CompilerCtx.typep.m2756$.GlobalName.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%g = alloca %m2756$.GlobalName.type*
store %m2756$.GlobalName.type* %.g.arg, %m2756$.GlobalName.type** %g
%.tmp3643 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g
%.tmp3644 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp3643, i32 0, i32 2
%.tmp3645 = load i1, i1* %.tmp3644
br i1 %.tmp3645, label %.if.true.3646, label %.if.false.3646
.if.true.3646:
ret void
br label %.if.end.3646
.if.false.3646:
br label %.if.end.3646
.if.end.3646:
%.tmp3647 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g
%.tmp3648 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp3647, i32 0, i32 1
%.tmp3649 = load i8*, i8** %.tmp3648
%.tmp3651 = getelementptr [7 x i8], [7 x i8]*@.str3650, i32 0, i32 0
%.tmp3652 = call i32(i8*,i8*) @strcmp(i8* %.tmp3649, i8* %.tmp3651)
%.tmp3653 = icmp eq i32 %.tmp3652, 0
br i1 %.tmp3653, label %.if.true.3654, label %.if.false.3654
.if.true.3654:
%.tmp3655 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3656 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3655, i32 0, i32 1
%.tmp3657 = load %m0$.File.type*, %m0$.File.type** %.tmp3656
%.tmp3659 = getelementptr [21 x i8], [21 x i8]*@.str3658, i32 0, i32 0
%.tmp3660 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g
%.tmp3661 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp3660, i32 0, i32 4
%.tmp3662 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %.tmp3661
%.tmp3663 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp3662)
%.tmp3664 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3665 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g
%.tmp3666 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp3665, i32 0, i32 4
%.tmp3667 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %.tmp3666
%.tmp3668 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3667, i32 0, i32 4
%.tmp3669 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3668
%.tmp3670 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp3664, %m2756$.Type.type* %.tmp3669)
%.tmp3671 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g
%.tmp3672 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp3671, i32 0, i32 0
%.tmp3673 = load i8*, i8** %.tmp3672
%.tmp3674 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3657, i8* %.tmp3659, i8* %.tmp3663, i8* %.tmp3670, i8* %.tmp3673)
br label %.if.end.3654
.if.false.3654:
%.tmp3675 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g
%.tmp3676 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp3675, i32 0, i32 1
%.tmp3677 = load i8*, i8** %.tmp3676
%.tmp3679 = getelementptr [7 x i8], [7 x i8]*@.str3678, i32 0, i32 0
%.tmp3680 = call i32(i8*,i8*) @strcmp(i8* %.tmp3677, i8* %.tmp3679)
%.tmp3681 = icmp eq i32 %.tmp3680, 0
br i1 %.tmp3681, label %.if.true.3682, label %.if.false.3682
.if.true.3682:
%.tmp3683 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3684 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g
%.tmp3685 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp3684, i32 0, i32 4
%.tmp3686 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %.tmp3685
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$compile_extern.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp3683, %m2756$.AssignableInfo.type* %.tmp3686)
br label %.if.end.3682
.if.false.3682:
br label %.if.end.3682
.if.end.3682:
br label %.if.end.3654
.if.end.3654:
%.tmp3687 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g
%.tmp3688 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp3687, i32 0, i32 2
store i1 1, i1* %.tmp3688
ret void
}
define void @m295$compile_extern.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%info = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.info.arg, %m2756$.AssignableInfo.type** %info
%.tmp3689 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3690 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3689, i32 0, i32 1
%.tmp3691 = load %m0$.File.type*, %m0$.File.type** %.tmp3690
%.tmp3693 = getelementptr [15 x i8], [15 x i8]*@.str3692, i32 0, i32 0
%.tmp3694 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3695 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp3696 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3695, i32 0, i32 4
%.tmp3697 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3696
%.tmp3698 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3697, i32 0, i32 3
%.tmp3699 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3698
%.tmp3700 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp3694, %m2756$.Type.type* %.tmp3699)
%.tmp3701 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp3702 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp3701)
%.tmp3703 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3691, i8* %.tmp3693, i8* %.tmp3700, i8* %.tmp3702)
%.tmp3705 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp3706 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3705, i32 0, i32 4
%.tmp3707 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3706
%.tmp3708 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3707, i32 0, i32 3
%.tmp3709 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3708
%.tmp3710 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3709, i32 0, i32 4
%.tmp3711 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3710
%pt.3712 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp3711, %m2756$.Type.type** %pt.3712
br label %.for.start.3704
.for.start.3704:
%.tmp3713 = load %m2756$.Type.type*, %m2756$.Type.type** %pt.3712
%.tmp3714 = icmp ne %m2756$.Type.type* %.tmp3713, null
br i1 %.tmp3714, label %.for.continue.3704, label %.for.end.3704
.for.continue.3704:
%.tmp3715 = load %m2756$.Type.type*, %m2756$.Type.type** %pt.3712
%.tmp3716 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp3717 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3716, i32 0, i32 4
%.tmp3718 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3717
%.tmp3719 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3718, i32 0, i32 3
%.tmp3720 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3719
%.tmp3721 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3720, i32 0, i32 4
%.tmp3722 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3721
%.tmp3723 = icmp ne %m2756$.Type.type* %.tmp3715, %.tmp3722
br i1 %.tmp3723, label %.if.true.3724, label %.if.false.3724
.if.true.3724:
%.tmp3725 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3726 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3725, i32 0, i32 1
%.tmp3727 = load %m0$.File.type*, %m0$.File.type** %.tmp3726
%.tmp3729 = getelementptr [3 x i8], [3 x i8]*@.str3728, i32 0, i32 0
%.tmp3730 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3727, i8* %.tmp3729)
br label %.if.end.3724
.if.false.3724:
br label %.if.end.3724
.if.end.3724:
%.tmp3731 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3732 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3731, i32 0, i32 1
%.tmp3733 = load %m0$.File.type*, %m0$.File.type** %.tmp3732
%.tmp3735 = getelementptr [3 x i8], [3 x i8]*@.str3734, i32 0, i32 0
%.tmp3736 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3737 = load %m2756$.Type.type*, %m2756$.Type.type** %pt.3712
%.tmp3738 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp3736, %m2756$.Type.type* %.tmp3737)
%.tmp3739 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3733, i8* %.tmp3735, i8* %.tmp3738)
%.tmp3740 = load %m2756$.Type.type*, %m2756$.Type.type** %pt.3712
%.tmp3741 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3740, i32 0, i32 4
%.tmp3742 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3741
store %m2756$.Type.type* %.tmp3742, %m2756$.Type.type** %pt.3712
br label %.for.start.3704
.for.end.3704:
%.tmp3743 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3744 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3743, i32 0, i32 1
%.tmp3745 = load %m0$.File.type*, %m0$.File.type** %.tmp3744
%.tmp3747 = getelementptr [3 x i8], [3 x i8]*@.str3746, i32 0, i32 0
%.tmp3748 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3745, i8* %.tmp3747)
ret void
}
define i8* @m295$get_mod_prefix.cp.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3749 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3750 = call %m2756$.ModuleLookup.type*(%m2756$.CompilerCtx.type*) @m295$get_current_module.m2756$.ModuleLookup.typep.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp3749)
%m.3751 = alloca %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* %.tmp3750, %m2756$.ModuleLookup.type** %m.3751
%.tmp3752 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.3751
%.tmp3753 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3752, i32 0, i32 1
%.tmp3754 = load i8*, i8** %.tmp3753
ret i8* %.tmp3754
}
define i8* @m295$name_mangle.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.fn.arg, i8* %.original_name.arg, %m2756$.Type.type* %.type.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%fn = alloca %m980$.Node.type*
store %m980$.Node.type* %.fn.arg, %m980$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.type.arg, %m2756$.Type.type** %type
%.tmp3756 = getelementptr [1 x i8], [1 x i8]*@.str3755, i32 0, i32 0
%mangled_name.3757 = alloca i8*
store i8* %.tmp3756, i8** %mangled_name.3757
%.tmp3758 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3759 = load %m980$.Node.type*, %m980$.Node.type** %fn
%.tmp3760 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3759, i32 0, i32 2
%.tmp3761 = load i8*, i8** %.tmp3760
%.tmp3762 = call i8*(%m2756$.CompilerCtx.type*,i8*) @m295$get_mod_prefix.cp.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.tmp3758, i8* %.tmp3761)
%prefix.3763 = alloca i8*
store i8* %.tmp3762, i8** %prefix.3763
%.tmp3764 = getelementptr i8*, i8** %mangled_name.3757, i32 0
%.tmp3766 = getelementptr [5 x i8], [5 x i8]*@.str3765, i32 0, i32 0
%.tmp3767 = load i8*, i8** %prefix.3763
%.tmp3768 = load i8*, i8** %original_name
%.tmp3769 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3764, i8* %.tmp3766, i8* %.tmp3767, i8* %.tmp3768)
%.tmp3770 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp3771 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3770, i32 0, i32 0
%.tmp3772 = load i8*, i8** %.tmp3771
%.tmp3774 = getelementptr [9 x i8], [9 x i8]*@.str3773, i32 0, i32 0
%.tmp3775 = call i32(i8*,i8*) @strcmp(i8* %.tmp3772, i8* %.tmp3774)
%.tmp3776 = icmp eq i32 %.tmp3775, 0
br i1 %.tmp3776, label %.if.true.3777, label %.if.false.3777
.if.true.3777:
%.tmp3778 = load i8*, i8** %mangled_name.3757
%.tmp3780 = getelementptr [5 x i8], [5 x i8]*@.str3779, i32 0, i32 0
%.tmp3781 = call i32(i8*,i8*) @strcmp(i8* %.tmp3778, i8* %.tmp3780)
%.tmp3782 = icmp ne i32 %.tmp3781, 0
br i1 %.tmp3782, label %.if.true.3783, label %.if.false.3783
.if.true.3783:
%.tmp3785 = getelementptr [1 x i8], [1 x i8]*@.str3784, i32 0, i32 0
%tmp_buff.3786 = alloca i8*
store i8* %.tmp3785, i8** %tmp_buff.3786
%.tmp3788 = getelementptr [1 x i8], [1 x i8]*@.str3787, i32 0, i32 0
%swap_var.3789 = alloca i8*
store i8* %.tmp3788, i8** %swap_var.3789
%.tmp3791 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp3792 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3791, i32 0, i32 3
%.tmp3793 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3792
%tp.3794 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp3793, %m2756$.Type.type** %tp.3794
br label %.for.start.3790
.for.start.3790:
%.tmp3795 = load %m2756$.Type.type*, %m2756$.Type.type** %tp.3794
%.tmp3796 = icmp ne %m2756$.Type.type* %.tmp3795, null
br i1 %.tmp3796, label %.for.continue.3790, label %.for.end.3790
.for.continue.3790:
%.tmp3797 = getelementptr i8*, i8** %tmp_buff.3786, i32 0
%.tmp3799 = getelementptr [6 x i8], [6 x i8]*@.str3798, i32 0, i32 0
%.tmp3800 = load i8*, i8** %mangled_name.3757
%.tmp3801 = load %m2756$.Type.type*, %m2756$.Type.type** %tp.3794
%.tmp3802 = call i8*(%m2756$.Type.type*) @m295$type_abbr.cp.m2756$.Type.typep(%m2756$.Type.type* %.tmp3801)
%.tmp3803 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3797, i8* %.tmp3799, i8* %.tmp3800, i8* %.tmp3802)
%.tmp3804 = load i8*, i8** %tmp_buff.3786
store i8* %.tmp3804, i8** %swap_var.3789
%.tmp3805 = load i8*, i8** %mangled_name.3757
store i8* %.tmp3805, i8** %tmp_buff.3786
%.tmp3806 = load i8*, i8** %swap_var.3789
store i8* %.tmp3806, i8** %mangled_name.3757
%.tmp3807 = load i8*, i8** %tmp_buff.3786
call void(i8*) @free(i8* %.tmp3807)
%.tmp3808 = load %m2756$.Type.type*, %m2756$.Type.type** %tp.3794
%.tmp3809 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp3808, i32 0, i32 4
%.tmp3810 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3809
store %m2756$.Type.type* %.tmp3810, %m2756$.Type.type** %tp.3794
br label %.for.start.3790
.for.end.3790:
br label %.if.end.3783
.if.false.3783:
br label %.if.end.3783
.if.end.3783:
br label %.if.end.3777
.if.false.3777:
br label %.if.end.3777
.if.end.3777:
%.tmp3811 = load i8*, i8** %mangled_name.3757
ret i8* %.tmp3811
}
define void @m295$compile_statement.v.m2756$.CompilerCtx.typep.m980$.Node.typep.b(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3812 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* null, %m2756$.AssignableInfo.type** %info.3812
%return_type.3813 = alloca %m2756$.Type.type*
store %m2756$.Type.type* null, %m2756$.Type.type** %return_type.3813
%.tmp3815 = getelementptr [1 x i8], [1 x i8]*@.str3814, i32 0, i32 0
%err_buf.3816 = alloca i8*
store i8* %.tmp3815, i8** %err_buf.3816
%.tmp3818 = getelementptr [1 x i8], [1 x i8]*@.str3817, i32 0, i32 0
%tmp_buff.3819 = alloca i8*
store i8* %.tmp3818, i8** %tmp_buff.3819
%.tmp3820 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3821 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3820, i32 0, i32 0
%.tmp3822 = load i8*, i8** %.tmp3821
%.tmp3824 = getelementptr [3 x i8], [3 x i8]*@.str3823, i32 0, i32 0
%.tmp3825 = call i32(i8*,i8*) @strcmp(i8* %.tmp3822, i8* %.tmp3824)
%.tmp3826 = icmp eq i32 %.tmp3825, 0
br i1 %.tmp3826, label %.if.true.3827, label %.if.false.3827
.if.true.3827:
ret void
br label %.if.end.3827
.if.false.3827:
%.tmp3828 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3829 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3828, i32 0, i32 0
%.tmp3830 = load i8*, i8** %.tmp3829
%.tmp3832 = getelementptr [7 x i8], [7 x i8]*@.str3831, i32 0, i32 0
%.tmp3833 = call i32(i8*,i8*) @strcmp(i8* %.tmp3830, i8* %.tmp3832)
%.tmp3834 = icmp eq i32 %.tmp3833, 0
br i1 %.tmp3834, label %.if.true.3835, label %.if.false.3835
.if.true.3835:
%.tmp3836 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3837 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3836, i32 0, i32 7
%.tmp3838 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3837
%.tmp3840 = getelementptr [11 x i8], [11 x i8]*@.str3839, i32 0, i32 0
%.tmp3841 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp3838, i8* %.tmp3840)
%assignable.3842 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3841, %m980$.Node.type** %assignable.3842
%.tmp3843 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3844 = load %m980$.Node.type*, %m980$.Node.type** %assignable.3842
%.tmp3845 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp3843, %m980$.Node.type* %.tmp3844)
%a_info.3846 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp3845, %m2756$.AssignableInfo.type** %a_info.3846
%.tmp3847 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.3846
%.tmp3848 = icmp eq %m2756$.AssignableInfo.type* %.tmp3847, null
br i1 %.tmp3848, label %.if.true.3849, label %.if.false.3849
.if.true.3849:
ret void
br label %.if.end.3849
.if.false.3849:
br label %.if.end.3849
.if.end.3849:
%.tmp3850 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3851 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp3850)
store %m2756$.AssignableInfo.type* %.tmp3851, %m2756$.AssignableInfo.type** %info.3812
%.tmp3852 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3853 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3852, i32 0, i32 7
%.tmp3854 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3853
%.tmp3855 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3854, i32 0, i32 8
%.tmp3856 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3855
%.tmp3857 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3856, i32 0, i32 1
%.tmp3858 = load i8*, i8** %.tmp3857
%global_name.3859 = alloca i8*
store i8* %.tmp3858, i8** %global_name.3859
%.tmp3860 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3861 = load i8, i8* @SCOPE_GLOBAL
%.tmp3862 = load i8*, i8** %global_name.3859
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp3860, i8 %.tmp3861, i8* %.tmp3862)
%.tmp3863 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3864 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3863, i32 0, i32 4
%.tmp3865 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.3846
%.tmp3866 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3865, i32 0, i32 4
%.tmp3867 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3866
store %m2756$.Type.type* %.tmp3867, %m2756$.Type.type** %.tmp3864
%.tmp3868 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3869 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3868, i32 0, i32 3
%.tmp3871 = getelementptr [9 x i8], [9 x i8]*@.str3870, i32 0, i32 0
store i8* %.tmp3871, i8** %.tmp3869
%.tmp3872 = load i1, i1* %shallow
%.tmp3873 = icmp eq i1 %.tmp3872, 1
br i1 %.tmp3873, label %.if.true.3874, label %.if.false.3874
.if.true.3874:
%.tmp3875 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3876 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3877 = load i8*, i8** %global_name.3859
%.tmp3878 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2756$.AssignableInfo.type*) @m295$define_assignable.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp3875, %m980$.Node.type* %.tmp3876, i8* %.tmp3877, %m2756$.AssignableInfo.type* %.tmp3878)
br label %.if.end.3874
.if.false.3874:
%.tmp3879 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3880 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3879, i32 0, i32 1
%.tmp3881 = load %m0$.File.type*, %m0$.File.type** %.tmp3880
%.tmp3883 = getelementptr [21 x i8], [21 x i8]*@.str3882, i32 0, i32 0
%.tmp3884 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3885 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp3884)
%.tmp3886 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3887 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3888 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3887, i32 0, i32 4
%.tmp3889 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3888
%.tmp3890 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp3886, %m2756$.Type.type* %.tmp3889)
%.tmp3891 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.3846
%.tmp3892 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp3891)
%.tmp3893 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3881, i8* %.tmp3883, i8* %.tmp3885, i8* %.tmp3890, i8* %.tmp3892)
br label %.if.end.3874
.if.end.3874:
br label %.if.end.3835
.if.false.3835:
%.tmp3894 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3895 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3894, i32 0, i32 0
%.tmp3896 = load i8*, i8** %.tmp3895
%.tmp3898 = getelementptr [10 x i8], [10 x i8]*@.str3897, i32 0, i32 0
%.tmp3899 = call i32(i8*,i8*) @strcmp(i8* %.tmp3896, i8* %.tmp3898)
%.tmp3900 = icmp eq i32 %.tmp3899, 0
br i1 %.tmp3900, label %.if.true.3901, label %.if.false.3901
.if.true.3901:
%.tmp3902 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3903 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3902, i32 0, i32 7
%.tmp3904 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3903
%.tmp3905 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3904, i32 0, i32 8
%.tmp3906 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3905
%.tmp3907 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3906, i32 0, i32 1
%.tmp3908 = load i8*, i8** %.tmp3907
%type_name.3909 = alloca i8*
store i8* %.tmp3908, i8** %type_name.3909
%.tmp3910 = load i1, i1* %shallow
%.tmp3911 = icmp eq i1 %.tmp3910, 1
br i1 %.tmp3911, label %.if.true.3912, label %.if.false.3912
.if.true.3912:
%.tmp3913 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3914 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp3913)
store %m2756$.AssignableInfo.type* %.tmp3914, %m2756$.AssignableInfo.type** %info.3812
%.tmp3915 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3916 = call %m2756$.ModuleLookup.type*(%m2756$.CompilerCtx.type*) @m295$get_current_module.m2756$.ModuleLookup.typep.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp3915)
%mod_from.3917 = alloca %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* %.tmp3916, %m2756$.ModuleLookup.type** %mod_from.3917
%.tmp3918 = getelementptr i8*, i8** %tmp_buff.3819, i32 0
%.tmp3920 = getelementptr [11 x i8], [11 x i8]*@.str3919, i32 0, i32 0
%.tmp3921 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod_from.3917
%.tmp3922 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp3921, i32 0, i32 1
%.tmp3923 = load i8*, i8** %.tmp3922
%.tmp3924 = load i8*, i8** %type_name.3909
%.tmp3925 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3918, i8* %.tmp3920, i8* %.tmp3923, i8* %.tmp3924)
%.tmp3926 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3927 = load i8, i8* @SCOPE_LOCAL
%.tmp3928 = load i8*, i8** %tmp_buff.3819
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp3926, i8 %.tmp3927, i8* %.tmp3928)
%.tmp3929 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3930 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3929, i32 0, i32 3
%.tmp3932 = getelementptr [10 x i8], [10 x i8]*@.str3931, i32 0, i32 0
store i8* %.tmp3932, i8** %.tmp3930
%.tmp3933 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3934 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3933, i32 0, i32 5
%.tmp3935 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3936 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3935, i32 0, i32 3
%.tmp3937 = load i32, i32* %.tmp3936
store i32 %.tmp3937, i32* %.tmp3934
%.tmp3938 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3939 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3938, i32 0, i32 6
%.tmp3940 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3941 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3940, i32 0, i32 4
%.tmp3942 = load i32, i32* %.tmp3941
store i32 %.tmp3942, i32* %.tmp3939
%.tmp3943 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3944 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3943, i32 0, i32 4
%.tmp3945 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp3945, %m2756$.Type.type** %.tmp3944
%.tmp3946 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3947 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3948 = load i8*, i8** %type_name.3909
%.tmp3949 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2756$.AssignableInfo.type*) @m295$define_assignable.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp3946, %m980$.Node.type* %.tmp3947, i8* %.tmp3948, %m2756$.AssignableInfo.type* %.tmp3949)
%.tmp3950 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3951 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3950, i32 0, i32 7
%.tmp3952 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3951
%.tmp3954 = getelementptr [5 x i8], [5 x i8]*@.str3953, i32 0, i32 0
%.tmp3955 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp3952, i8* %.tmp3954)
%type_decl.3956 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3955, %m980$.Node.type** %type_decl.3956
%.tmp3957 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3958 = load %m980$.Node.type*, %m980$.Node.type** %type_decl.3956
%.tmp3959 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3958, i32 0, i32 7
%.tmp3960 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3959
%.tmp3961 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp3957, %m980$.Node.type* %.tmp3960)
%type_struct.3962 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp3961, %m2756$.Type.type** %type_struct.3962
%.tmp3963 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3964 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3963, i32 0, i32 4
%.tmp3965 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3964
%.tmp3966 = load %m2756$.Type.type*, %m2756$.Type.type** %type_struct.3962
call void(%m2756$.Type.type*,%m2756$.Type.type*) @m295$copy_type.v.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.tmp3965, %m2756$.Type.type* %.tmp3966)
%.tmp3967 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3968 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3967, i32 0, i32 4
%.tmp3969 = load %m2756$.Type.type*, %m2756$.Type.type** %type_struct.3962
store %m2756$.Type.type* %.tmp3969, %m2756$.Type.type** %.tmp3968
br label %.if.end.3912
.if.false.3912:
%.tmp3970 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3971 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3972 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3971, i32 0, i32 7
%.tmp3973 = load i8*, i8** %.tmp3972
%.tmp3974 = load i8*, i8** %type_name.3909
%.tmp3975 = call %m2756$.ScopeItem.type*(%m2756$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2756$.ScopeItem.typep.m2756$.CompilerCtx.typep.cp.cp(%m2756$.CompilerCtx.type* %.tmp3970, i8* %.tmp3973, i8* %.tmp3974)
%scope.3976 = alloca %m2756$.ScopeItem.type*
store %m2756$.ScopeItem.type* %.tmp3975, %m2756$.ScopeItem.type** %scope.3976
%.tmp3977 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %scope.3976
%.tmp3978 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp3977, i32 0, i32 1
%.tmp3979 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %.tmp3978
store %m2756$.AssignableInfo.type* %.tmp3979, %m2756$.AssignableInfo.type** %info.3812
%.tmp3980 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3981 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp3980, i32 0, i32 1
%.tmp3982 = load %m0$.File.type*, %m0$.File.type** %.tmp3981
%.tmp3984 = getelementptr [14 x i8], [14 x i8]*@.str3983, i32 0, i32 0
%.tmp3985 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3986 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp3985)
%.tmp3987 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp3988 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp3989 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp3988, i32 0, i32 4
%.tmp3990 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp3989
%.tmp3991 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp3987, %m2756$.Type.type* %.tmp3990)
%.tmp3992 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3982, i8* %.tmp3984, i8* %.tmp3986, i8* %.tmp3991)
br label %.if.end.3912
.if.end.3912:
br label %.if.end.3901
.if.false.3901:
%.tmp3993 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3994 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3993, i32 0, i32 0
%.tmp3995 = load i8*, i8** %.tmp3994
%.tmp3997 = getelementptr [7 x i8], [7 x i8]*@.str3996, i32 0, i32 0
%.tmp3998 = call i32(i8*,i8*) @strcmp(i8* %.tmp3995, i8* %.tmp3997)
%.tmp3999 = icmp eq i32 %.tmp3998, 0
br i1 %.tmp3999, label %.if.true.4000, label %.if.false.4000
.if.true.4000:
%.tmp4001 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4002 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4001)
store %m2756$.AssignableInfo.type* %.tmp4002, %m2756$.AssignableInfo.type** %info.3812
%.tmp4003 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp4004 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4003, i32 0, i32 4
%.tmp4005 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4006 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4007 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4006, i32 0, i32 7
%.tmp4008 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4007
%.tmp4009 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4008, i32 0, i32 8
%.tmp4010 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4009
%.tmp4011 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$syn_function_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp4005, %m980$.Node.type* %.tmp4010)
store %m2756$.Type.type* %.tmp4011, %m2756$.Type.type** %.tmp4004
%.tmp4012 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp4013 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4012, i32 0, i32 3
%.tmp4015 = getelementptr [7 x i8], [7 x i8]*@.str4014, i32 0, i32 0
store i8* %.tmp4015, i8** %.tmp4013
%.tmp4016 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4017 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4016, i32 0, i32 7
%.tmp4018 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4017
%.tmp4019 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4018, i32 0, i32 8
%.tmp4020 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4019
%.tmp4021 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4020, i32 0, i32 8
%.tmp4022 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4021
%.tmp4023 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4022, i32 0, i32 1
%.tmp4024 = load i8*, i8** %.tmp4023
%fn_name.4025 = alloca i8*
store i8* %.tmp4024, i8** %fn_name.4025
%.tmp4026 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp4027 = load i8, i8* @SCOPE_GLOBAL
%.tmp4028 = load i8*, i8** %fn_name.4025
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp4026, i8 %.tmp4027, i8* %.tmp4028)
%.tmp4029 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp4029, %m2756$.Type.type** %return_type.3813
%.tmp4030 = load %m2756$.Type.type*, %m2756$.Type.type** %return_type.3813
%.tmp4031 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4030, i32 0, i32 0
%.tmp4032 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp4033 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4032, i32 0, i32 4
%.tmp4034 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4033
%.tmp4035 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4034, i32 0, i32 3
%.tmp4036 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4035
%.tmp4037 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4036, i32 0, i32 0
%.tmp4038 = load i8*, i8** %.tmp4037
store i8* %.tmp4038, i8** %.tmp4031
%.tmp4039 = load %m2756$.Type.type*, %m2756$.Type.type** %return_type.3813
%.tmp4040 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4039, i32 0, i32 3
%.tmp4041 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp4042 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4041, i32 0, i32 4
%.tmp4043 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4042
%.tmp4044 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4043, i32 0, i32 3
%.tmp4045 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4044
%.tmp4046 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4045, i32 0, i32 3
%.tmp4047 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4046
store %m2756$.Type.type* %.tmp4047, %m2756$.Type.type** %.tmp4040
%.tmp4048 = load i1, i1* %shallow
%.tmp4049 = icmp eq i1 %.tmp4048, 0
br i1 %.tmp4049, label %.if.true.4050, label %.if.false.4050
.if.true.4050:
%.tmp4051 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4052 = load i8*, i8** %fn_name.4025
call void(%m2756$.CompilerCtx.type*,i8*) @m295$mark_weak_global.v.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.tmp4051, i8* %.tmp4052)
%.tmp4053 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4054 = load i8*, i8** %fn_name.4025
%.tmp4056 = getelementptr [7 x i8], [7 x i8]*@.str4055, i32 0, i32 0
%.tmp4057 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
call void(%m2756$.CompilerCtx.type*,i8*,i8*,%m2756$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2756$.CompilerCtx.typep.cp.cp.m2756$.AssignableInfo.typep.b.b(%m2756$.CompilerCtx.type* %.tmp4053, i8* %.tmp4054, i8* %.tmp4056, %m2756$.AssignableInfo.type* %.tmp4057, i1 1, i1 1)
%.tmp4058 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4059 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$compile_extern.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp4058, %m2756$.AssignableInfo.type* %.tmp4059)
br label %.if.end.4050
.if.false.4050:
%.tmp4060 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4061 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4062 = load i8*, i8** %fn_name.4025
%.tmp4063 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2756$.AssignableInfo.type*) @m295$define_assignable.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp4060, %m980$.Node.type* %.tmp4061, i8* %.tmp4062, %m2756$.AssignableInfo.type* %.tmp4063)
br label %.if.end.4050
.if.end.4050:
br label %.if.end.4000
.if.false.4000:
%.tmp4064 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4065 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4064, i32 0, i32 0
%.tmp4066 = load i8*, i8** %.tmp4065
%.tmp4068 = getelementptr [9 x i8], [9 x i8]*@.str4067, i32 0, i32 0
%.tmp4069 = call i32(i8*,i8*) @strcmp(i8* %.tmp4066, i8* %.tmp4068)
%.tmp4070 = icmp eq i32 %.tmp4069, 0
br i1 %.tmp4070, label %.if.true.4071, label %.if.false.4071
.if.true.4071:
%.tmp4072 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4073 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4072)
store %m2756$.AssignableInfo.type* %.tmp4073, %m2756$.AssignableInfo.type** %info.3812
%.tmp4074 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp4075 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4074, i32 0, i32 3
%.tmp4077 = getelementptr [9 x i8], [9 x i8]*@.str4076, i32 0, i32 0
store i8* %.tmp4077, i8** %.tmp4075
%.tmp4078 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp4079 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4078, i32 0, i32 4
%.tmp4080 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4081 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4082 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4081, i32 0, i32 7
%.tmp4083 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4082
%.tmp4084 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$syn_function_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp4080, %m980$.Node.type* %.tmp4083)
store %m2756$.Type.type* %.tmp4084, %m2756$.Type.type** %.tmp4079
%.tmp4085 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4086 = call i8*(%m980$.Node.type*) @m295$syn_function_name.cp.m980$.Node.typep(%m980$.Node.type* %.tmp4085)
%name.4087 = alloca i8*
store i8* %.tmp4086, i8** %name.4087
%.tmp4088 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4089 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4090 = load i8*, i8** %name.4087
%.tmp4091 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp4092 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4091, i32 0, i32 4
%.tmp4093 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4092
%.tmp4094 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2756$.Type.type*) @m295$name_mangle.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4088, %m980$.Node.type* %.tmp4089, i8* %.tmp4090, %m2756$.Type.type* %.tmp4093)
store i8* %.tmp4094, i8** %tmp_buff.3819
%.tmp4095 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp4096 = load i8, i8* @SCOPE_GLOBAL
%.tmp4097 = load i8*, i8** %tmp_buff.3819
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp4095, i8 %.tmp4096, i8* %.tmp4097)
%.tmp4098 = load i1, i1* %shallow
%.tmp4099 = icmp eq i1 %.tmp4098, 1
br i1 %.tmp4099, label %.if.true.4100, label %.if.false.4100
.if.true.4100:
%.tmp4101 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4102 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4103 = load i8*, i8** %name.4087
%.tmp4104 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2756$.AssignableInfo.type*) @m295$define_assignable.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp4101, %m980$.Node.type* %.tmp4102, i8* %.tmp4103, %m2756$.AssignableInfo.type* %.tmp4104)
br label %.if.end.4100
.if.false.4100:
%.tmp4105 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp4105, %m2756$.Type.type** %return_type.3813
%.tmp4106 = load %m2756$.Type.type*, %m2756$.Type.type** %return_type.3813
%.tmp4107 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp4108 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4107, i32 0, i32 4
%.tmp4109 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4108
%.tmp4110 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4109, i32 0, i32 3
%.tmp4111 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4110
call void(%m2756$.Type.type*,%m2756$.Type.type*) @m295$copy_type.v.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.tmp4106, %m2756$.Type.type* %.tmp4111)
%.tmp4112 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4113 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4112, i32 0, i32 1
%.tmp4114 = load %m0$.File.type*, %m0$.File.type** %.tmp4113
%.tmp4116 = getelementptr [14 x i8], [14 x i8]*@.str4115, i32 0, i32 0
%.tmp4117 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4118 = load %m2756$.Type.type*, %m2756$.Type.type** %return_type.3813
%.tmp4119 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4117, %m2756$.Type.type* %.tmp4118)
%.tmp4120 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.3812
%.tmp4121 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp4120)
%.tmp4122 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4114, i8* %.tmp4116, i8* %.tmp4119, i8* %.tmp4121)
%.tmp4123 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4124 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4123, i32 0, i32 7
%.tmp4125 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4124
%.tmp4126 = call %m980$.Node.type*(%m980$.Node.type*) @m295$syn_function_params.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4125)
%params.4127 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4126, %m980$.Node.type** %params.4127
%param_type.4128 = alloca %m2756$.Type.type*
store %m2756$.Type.type* null, %m2756$.Type.type** %param_type.4128
%.tmp4130 = load %m980$.Node.type*, %m980$.Node.type** %params.4127
%param_ptr.4131 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4130, %m980$.Node.type** %param_ptr.4131
br label %.for.start.4129
.for.start.4129:
%.tmp4132 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4131
%.tmp4133 = icmp ne %m980$.Node.type* %.tmp4132, null
br i1 %.tmp4133, label %.for.continue.4129, label %.for.end.4129
.for.continue.4129:
%.tmp4134 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4131
%.tmp4135 = load %m980$.Node.type*, %m980$.Node.type** %params.4127
%.tmp4136 = icmp ne %m980$.Node.type* %.tmp4134, %.tmp4135
br i1 %.tmp4136, label %.if.true.4137, label %.if.false.4137
.if.true.4137:
%.tmp4138 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4131
%.tmp4139 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4138, i32 0, i32 8
%.tmp4140 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4139
store %m980$.Node.type* %.tmp4140, %m980$.Node.type** %param_ptr.4131
%.tmp4141 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4142 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4141, i32 0, i32 1
%.tmp4143 = load %m0$.File.type*, %m0$.File.type** %.tmp4142
%.tmp4145 = getelementptr [3 x i8], [3 x i8]*@.str4144, i32 0, i32 0
%.tmp4146 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4143, i8* %.tmp4145)
br label %.if.end.4137
.if.false.4137:
br label %.if.end.4137
.if.end.4137:
%.tmp4147 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4131
%.tmp4148 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4147, i32 0, i32 0
%.tmp4149 = load i8*, i8** %.tmp4148
%.tmp4151 = getelementptr [5 x i8], [5 x i8]*@.str4150, i32 0, i32 0
%.tmp4152 = call i32(i8*,i8*) @strcmp(i8* %.tmp4149, i8* %.tmp4151)
%.tmp4153 = icmp eq i32 %.tmp4152, 0
br i1 %.tmp4153, label %.if.true.4154, label %.if.false.4154
.if.true.4154:
%.tmp4155 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4156 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4131
%.tmp4157 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4156, i32 0, i32 7
%.tmp4158 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4157
%.tmp4159 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp4155, %m980$.Node.type* %.tmp4158)
store %m2756$.Type.type* %.tmp4159, %m2756$.Type.type** %param_type.4128
%.tmp4160 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4131
%.tmp4161 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4160, i32 0, i32 8
%.tmp4162 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4161
store %m980$.Node.type* %.tmp4162, %m980$.Node.type** %param_ptr.4131
br label %.if.end.4154
.if.false.4154:
br label %.if.end.4154
.if.end.4154:
%.tmp4163 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4164 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4163, i32 0, i32 1
%.tmp4165 = load %m0$.File.type*, %m0$.File.type** %.tmp4164
%.tmp4167 = getelementptr [13 x i8], [13 x i8]*@.str4166, i32 0, i32 0
%.tmp4168 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4169 = load %m2756$.Type.type*, %m2756$.Type.type** %param_type.4128
%.tmp4170 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4168, %m2756$.Type.type* %.tmp4169)
%.tmp4171 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4131
%.tmp4172 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4171, i32 0, i32 1
%.tmp4173 = load i8*, i8** %.tmp4172
%.tmp4174 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4165, i8* %.tmp4167, i8* %.tmp4170, i8* %.tmp4173)
%.tmp4175 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4131
%.tmp4176 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4175, i32 0, i32 8
%.tmp4177 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4176
store %m980$.Node.type* %.tmp4177, %m980$.Node.type** %param_ptr.4131
br label %.for.start.4129
.for.end.4129:
%.tmp4178 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4179 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4178, i32 0, i32 1
%.tmp4180 = load %m0$.File.type*, %m0$.File.type** %.tmp4179
%.tmp4182 = getelementptr [5 x i8], [5 x i8]*@.str4181, i32 0, i32 0
%.tmp4183 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4180, i8* %.tmp4182)
%.tmp4184 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4186 = getelementptr [9 x i8], [9 x i8]*@.str4185, i32 0, i32 0
%.tmp4187 = bitcast ptr null to i8*
%.tmp4188 = bitcast ptr null to i8*
%.tmp4189 = load %m2756$.Type.type*, %m2756$.Type.type** %return_type.3813
call void(%m2756$.CompilerCtx.type*,i8*,i8*,i8*,%m2756$.Type.type*) @m295$push_scope.v.m2756$.CompilerCtx.typep.cp.cp.cp.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4184, i8* %.tmp4186, i8* %.tmp4187, i8* %.tmp4188, %m2756$.Type.type* %.tmp4189)
%.tmp4190 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4191 = load %m980$.Node.type*, %m980$.Node.type** %params.4127
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_fn_params.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp4190, %m980$.Node.type* %.tmp4191)
%.tmp4192 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4193 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4192, i32 0, i32 7
%.tmp4194 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4193
%.tmp4196 = getelementptr [6 x i8], [6 x i8]*@.str4195, i32 0, i32 0
%.tmp4197 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4194, i8* %.tmp4196)
%fn_block.4198 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4197, %m980$.Node.type** %fn_block.4198
%.tmp4199 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4200 = load %m980$.Node.type*, %m980$.Node.type** %fn_block.4198
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp4199, %m980$.Node.type* %.tmp4200)
%.tmp4201 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
call void(%m2756$.CompilerCtx.type*) @m295$pop_scope.v.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp4201)
%.tmp4202 = bitcast ptr null to %m980$.Node.type*
%last_valid_instruction.4203 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4202, %m980$.Node.type** %last_valid_instruction.4203
%.tmp4204 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4205 = load %m980$.Node.type*, %m980$.Node.type** %fn_block.4198
%.tmp4206 = load %m2756$.Type.type*, %m2756$.Type.type** %return_type.3813
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,%m2756$.Type.type*) @m295$check_n_add_implicit_return.v.m2756$.CompilerCtx.typep.m980$.Node.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4204, %m980$.Node.type* %.tmp4205, %m2756$.Type.type* %.tmp4206)
%.tmp4207 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4208 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4207, i32 0, i32 1
%.tmp4209 = load %m0$.File.type*, %m0$.File.type** %.tmp4208
%.tmp4211 = getelementptr [3 x i8], [3 x i8]*@.str4210, i32 0, i32 0
%.tmp4212 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4209, i8* %.tmp4211)
br label %.if.end.4100
.if.end.4100:
br label %.if.end.4071
.if.false.4071:
%.tmp4213 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4214 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4213, i32 0, i32 0
%.tmp4215 = load i8*, i8** %.tmp4214
%.tmp4217 = getelementptr [7 x i8], [7 x i8]*@.str4216, i32 0, i32 0
%.tmp4218 = call i32(i8*,i8*) @strcmp(i8* %.tmp4215, i8* %.tmp4217)
%.tmp4219 = icmp eq i32 %.tmp4218, 0
br i1 %.tmp4219, label %.if.true.4220, label %.if.false.4220
.if.true.4220:
%.tmp4221 = load i1, i1* %shallow
%.tmp4222 = icmp eq i1 %.tmp4221, 1
br i1 %.tmp4222, label %.if.true.4223, label %.if.false.4223
.if.true.4223:
%.tmp4224 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4225 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4224, i32 0, i32 7
%.tmp4226 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4225
%.tmp4227 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4226, i32 0, i32 8
%.tmp4228 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4227
%.tmp4229 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4228, i32 0, i32 1
%.tmp4230 = load i8*, i8** %.tmp4229
%mod_name.4231 = alloca i8*
store i8* %.tmp4230, i8** %mod_name.4231
%.tmp4232 = load i8*, i8** %mod_name.4231
%.tmp4233 = call i32(i8*) @strlen(i8* %.tmp4232)
%mod_name_len.4234 = alloca i32
store i32 %.tmp4233, i32* %mod_name_len.4234
%.tmp4235 = load i32, i32* %mod_name_len.4234
%.tmp4236 = sub i32 %.tmp4235, 1
%.tmp4237 = call i8*(i32) @malloc(i32 %.tmp4236)
%trimmed_path.4238 = alloca i8*
store i8* %.tmp4237, i8** %trimmed_path.4238
%i.4240 = alloca i32
store i32 1, i32* %i.4240
br label %.for.start.4239
.for.start.4239:
%.tmp4241 = load i32, i32* %i.4240
%.tmp4242 = load i32, i32* %mod_name_len.4234
%.tmp4243 = sub i32 %.tmp4242, 1
%.tmp4244 = icmp slt i32 %.tmp4241, %.tmp4243
br i1 %.tmp4244, label %.for.continue.4239, label %.for.end.4239
.for.continue.4239:
%.tmp4245 = load i32, i32* %i.4240
%.tmp4246 = sub i32 %.tmp4245, 1
%.tmp4247 = load i8*, i8** %trimmed_path.4238
%.tmp4248 = getelementptr i8, i8* %.tmp4247, i32 %.tmp4246
%.tmp4249 = load i32, i32* %i.4240
%.tmp4250 = load i8*, i8** %mod_name.4231
%.tmp4251 = getelementptr i8, i8* %.tmp4250, i32 %.tmp4249
%.tmp4252 = load i8, i8* %.tmp4251
store i8 %.tmp4252, i8* %.tmp4248
%.tmp4253 = load i32, i32* %i.4240
%.tmp4254 = add i32 %.tmp4253, 1
store i32 %.tmp4254, i32* %i.4240
br label %.for.start.4239
.for.end.4239:
%.tmp4255 = load i32, i32* %mod_name_len.4234
%.tmp4256 = sub i32 %.tmp4255, 2
%.tmp4257 = load i8*, i8** %trimmed_path.4238
%.tmp4258 = getelementptr i8, i8* %.tmp4257, i32 %.tmp4256
store i8 0, i8* %.tmp4258
%.tmp4259 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4260 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4261 = load i8*, i8** %trimmed_path.4238
%.tmp4262 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$resolve_import_path.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp4259, %m980$.Node.type* %.tmp4260, i8* %.tmp4261)
%mod_abspath.4263 = alloca i8*
store i8* %.tmp4262, i8** %mod_abspath.4263
%.tmp4264 = load i8*, i8** %mod_abspath.4263
%.tmp4265 = call i8*(i32) @malloc(i32 4096)
%.tmp4266 = call i8*(i8*,i8*) @realpath(i8* %.tmp4264, i8* %.tmp4265)
%relpath.4267 = alloca i8*
store i8* %.tmp4266, i8** %relpath.4267
%.tmp4268 = load i8*, i8** %relpath.4267
%.tmp4269 = icmp eq i8* %.tmp4268, null
br i1 %.tmp4269, label %.if.true.4270, label %.if.false.4270
.if.true.4270:
%.tmp4271 = getelementptr i8*, i8** %err_buf.3816, i32 0
%.tmp4273 = getelementptr [54 x i8], [54 x i8]*@.str4272, i32 0, i32 0
%.tmp4274 = load i8*, i8** %mod_name.4231
%.tmp4275 = load i8*, i8** %mod_abspath.4263
%.tmp4276 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4271, i8* %.tmp4273, i8* %.tmp4274, i8* %.tmp4275)
%.tmp4277 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4278 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4279 = load i8*, i8** %err_buf.3816
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp4277, %m980$.Node.type* %.tmp4278, i8* %.tmp4279)
ret void
br label %.if.end.4270
.if.false.4270:
br label %.if.end.4270
.if.end.4270:
%.tmp4280 = load i8*, i8** %relpath.4267
store i8* %.tmp4280, i8** %mod_abspath.4263
%m.4281 = alloca %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* null, %m2756$.ModuleLookup.type** %m.4281
%.tmp4282 = bitcast ptr null to %m2756$.ModuleLookup.type*
%mod.4283 = alloca %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* %.tmp4282, %m2756$.ModuleLookup.type** %mod.4283
%.tmp4285 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4286 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4285, i32 0, i32 6
%.tmp4287 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %.tmp4286
store %m2756$.ModuleLookup.type* %.tmp4287, %m2756$.ModuleLookup.type** %m.4281
br label %.for.start.4284
.for.start.4284:
%.tmp4288 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.4281
%.tmp4289 = icmp ne %m2756$.ModuleLookup.type* %.tmp4288, null
%.tmp4290 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.4283
%.tmp4291 = icmp eq %m2756$.ModuleLookup.type* %.tmp4290, null
%.tmp4292 = and i1 %.tmp4289, %.tmp4291
br i1 %.tmp4292, label %.for.continue.4284, label %.for.end.4284
.for.continue.4284:
%.tmp4293 = load i8*, i8** %mod_abspath.4263
%.tmp4294 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.4281
%.tmp4295 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp4294, i32 0, i32 0
%.tmp4296 = load i8*, i8** %.tmp4295
%.tmp4297 = call i32(i8*,i8*) @strcmp(i8* %.tmp4293, i8* %.tmp4296)
%.tmp4298 = icmp eq i32 %.tmp4297, 0
br i1 %.tmp4298, label %.if.true.4299, label %.if.false.4299
.if.true.4299:
%.tmp4300 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.4281
store %m2756$.ModuleLookup.type* %.tmp4300, %m2756$.ModuleLookup.type** %mod.4283
br label %.if.end.4299
.if.false.4299:
br label %.if.end.4299
.if.end.4299:
%.tmp4301 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.4281
%.tmp4302 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp4301, i32 0, i32 2
%.tmp4303 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %.tmp4302
store %m2756$.ModuleLookup.type* %.tmp4303, %m2756$.ModuleLookup.type** %m.4281
br label %.for.start.4284
.for.end.4284:
%.tmp4304 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4305 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4304, i32 0, i32 7
%.tmp4306 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4305
%.tmp4307 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4306, i32 0, i32 8
%.tmp4308 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4307
%.tmp4309 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4308, i32 0, i32 8
%.tmp4310 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4309
%.tmp4311 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4310, i32 0, i32 8
%.tmp4312 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4311
%.tmp4313 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4312, i32 0, i32 1
%.tmp4314 = load i8*, i8** %.tmp4313
%asname.4315 = alloca i8*
store i8* %.tmp4314, i8** %asname.4315
%.tmp4316 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.4283
%.tmp4317 = icmp eq %m2756$.ModuleLookup.type* %.tmp4316, null
br i1 %.tmp4317, label %.if.true.4318, label %.if.false.4318
.if.true.4318:
%.tmp4319 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* null, i32 1
%.tmp4320 = ptrtoint %m2756$.ModuleLookup.type* %.tmp4319 to i32
%.tmp4321 = call i8*(i32) @malloc(i32 %.tmp4320)
%.tmp4322 = bitcast i8* %.tmp4321 to %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* %.tmp4322, %m2756$.ModuleLookup.type** %mod.4283
%.tmp4323 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.4283
%.tmp4324 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp4323, i32 0, i32 0
%.tmp4325 = load i8*, i8** %mod_abspath.4263
store i8* %.tmp4325, i8** %.tmp4324
%.tmp4326 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.4283
%.tmp4327 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp4326, i32 0, i32 2
store %m2756$.ModuleLookup.type* null, %m2756$.ModuleLookup.type** %.tmp4327
%.tmp4328 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.4283
%.tmp4329 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp4328, i32 0, i32 3
store %m2756$.Scope.type* null, %m2756$.Scope.type** %.tmp4329
%.tmp4330 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.4283
%.tmp4331 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp4330, i32 0, i32 1
%.tmp4332 = getelementptr i8*, i8** %.tmp4331, i32 0
%.tmp4334 = getelementptr [5 x i8], [5 x i8]*@.str4333, i32 0, i32 0
%.tmp4335 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4336 = call i32(%m2756$.CompilerCtx.type*) @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp4335)
%.tmp4337 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4332, i8* %.tmp4334, i32 %.tmp4336)
%.tmp4339 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4340 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4339, i32 0, i32 6
%.tmp4341 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %.tmp4340
store %m2756$.ModuleLookup.type* %.tmp4341, %m2756$.ModuleLookup.type** %m.4281
br label %.for.start.4338
.for.start.4338:
%.tmp4342 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.4281
%.tmp4343 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp4342, i32 0, i32 2
%.tmp4344 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %.tmp4343
%.tmp4345 = icmp ne %m2756$.ModuleLookup.type* %.tmp4344, null
br i1 %.tmp4345, label %.for.continue.4338, label %.for.end.4338
.for.continue.4338:
%.tmp4346 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.4281
%.tmp4347 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp4346, i32 0, i32 2
%.tmp4348 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %.tmp4347
store %m2756$.ModuleLookup.type* %.tmp4348, %m2756$.ModuleLookup.type** %m.4281
br label %.for.start.4338
.for.end.4338:
%.tmp4349 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %m.4281
%.tmp4350 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp4349, i32 0, i32 2
%.tmp4351 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.4283
store %m2756$.ModuleLookup.type* %.tmp4351, %m2756$.ModuleLookup.type** %.tmp4350
%.tmp4352 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4353 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4354 = load i8*, i8** %asname.4315
%.tmp4355 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.4283
%.tmp4356 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp4355, i32 0, i32 0
%.tmp4357 = load i8*, i8** %.tmp4356
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*,i8*) @m295$define_module.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.cp(%m2756$.CompilerCtx.type* %.tmp4352, %m980$.Node.type* %.tmp4353, i8* %.tmp4354, i8* %.tmp4357)
%.tmp4358 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4359 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4358, i32 0, i32 7
%.tmp4360 = load i8*, i8** %.tmp4359
%curr_mod.4361 = alloca i8*
store i8* %.tmp4360, i8** %curr_mod.4361
%.tmp4362 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4363 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4362, i32 0, i32 7
%.tmp4364 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.4283
%.tmp4365 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp4364, i32 0, i32 0
%.tmp4366 = load i8*, i8** %.tmp4365
store i8* %.tmp4366, i8** %.tmp4363
%.tmp4367 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4368 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4369 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.4283
%.tmp4370 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp4369, i32 0, i32 0
%.tmp4371 = load i8*, i8** %.tmp4370
%.tmp4372 = call i1(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$compile_file.b.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp4367, %m980$.Node.type* %.tmp4368, i8* %.tmp4371)
%.tmp4373 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4374 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4373, i32 0, i32 7
%.tmp4375 = load i8*, i8** %curr_mod.4361
store i8* %.tmp4375, i8** %.tmp4374
br label %.if.end.4318
.if.false.4318:
%.tmp4376 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4377 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4378 = load i8*, i8** %asname.4315
%.tmp4379 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.4283
%.tmp4380 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp4379, i32 0, i32 0
%.tmp4381 = load i8*, i8** %.tmp4380
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*,i8*) @m295$define_module.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.cp(%m2756$.CompilerCtx.type* %.tmp4376, %m980$.Node.type* %.tmp4377, i8* %.tmp4378, i8* %.tmp4381)
br label %.if.end.4318
.if.end.4318:
br label %.if.end.4223
.if.false.4223:
br label %.if.end.4223
.if.end.4223:
br label %.if.end.4220
.if.false.4220:
%.tmp4382 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4383 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4385 = getelementptr [40 x i8], [40 x i8]*@.str4384, i32 0, i32 0
%.tmp4386 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp4382, %m980$.Node.type* %.tmp4383, i8* %.tmp4385)
%.tmp4387 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4388 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4387, i32 0, i32 0
%.tmp4389 = load i8*, i8** %.tmp4388
%.tmp4390 = call i32(i8*,...) @printf(i8* %.tmp4386, i8* %.tmp4389)
br label %.if.end.4220
.if.end.4220:
br label %.if.end.4071
.if.end.4071:
br label %.if.end.4000
.if.end.4000:
br label %.if.end.3901
.if.end.3901:
br label %.if.end.3835
.if.end.3835:
br label %.if.end.3827
.if.end.3827:
ret void
}
define i8* @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp4392 = getelementptr [1 x i8], [1 x i8]*@.str4391, i32 0, i32 0
%buf.4393 = alloca i8*
store i8* %.tmp4392, i8** %buf.4393
%.tmp4394 = getelementptr i8*, i8** %buf.4393, i32 0
%.tmp4396 = getelementptr [31 x i8], [31 x i8]*@.str4395, i32 0, i32 0
%.tmp4397 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4398 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4397, i32 0, i32 7
%.tmp4399 = load i8*, i8** %.tmp4398
%.tmp4400 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4401 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4400, i32 0, i32 3
%.tmp4402 = load i32, i32* %.tmp4401
%.tmp4403 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4404 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4403, i32 0, i32 4
%.tmp4405 = load i32, i32* %.tmp4404
%.tmp4406 = load i8*, i8** %msg
%.tmp4407 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4394, i8* %.tmp4396, i8* %.tmp4399, i32 %.tmp4402, i32 %.tmp4405, i8* %.tmp4406)
%.tmp4408 = load i8*, i8** %buf.4393
ret i8* %.tmp4408
}
define void @m295$compile_fn_params.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.fn_params.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%fn_params = alloca %m980$.Node.type*
store %m980$.Node.type* %.fn_params.arg, %m980$.Node.type** %fn_params
%param_type.4409 = alloca %m2756$.Type.type*
store %m2756$.Type.type* null, %m2756$.Type.type** %param_type.4409
%.tmp4411 = load %m980$.Node.type*, %m980$.Node.type** %fn_params
%param_ptr.4412 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4411, %m980$.Node.type** %param_ptr.4412
br label %.for.start.4410
.for.start.4410:
%.tmp4413 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4412
%.tmp4414 = icmp ne %m980$.Node.type* %.tmp4413, null
br i1 %.tmp4414, label %.for.continue.4410, label %.for.end.4410
.for.continue.4410:
%.tmp4415 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4412
%.tmp4416 = load %m980$.Node.type*, %m980$.Node.type** %fn_params
%.tmp4417 = icmp ne %m980$.Node.type* %.tmp4415, %.tmp4416
br i1 %.tmp4417, label %.if.true.4418, label %.if.false.4418
.if.true.4418:
%.tmp4419 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4412
%.tmp4420 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4419, i32 0, i32 8
%.tmp4421 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4420
store %m980$.Node.type* %.tmp4421, %m980$.Node.type** %param_ptr.4412
br label %.if.end.4418
.if.false.4418:
br label %.if.end.4418
.if.end.4418:
%.tmp4422 = load %m980$.Node.type*, %m980$.Node.type** %fn_params
%.tmp4423 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4422)
%param_info.4424 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp4423, %m2756$.AssignableInfo.type** %param_info.4424
%.tmp4425 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %param_info.4424
%.tmp4426 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4425, i32 0, i32 3
%.tmp4428 = getelementptr [9 x i8], [9 x i8]*@.str4427, i32 0, i32 0
store i8* %.tmp4428, i8** %.tmp4426
%.tmp4429 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4412
%.tmp4430 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4429, i32 0, i32 0
%.tmp4431 = load i8*, i8** %.tmp4430
%.tmp4433 = getelementptr [5 x i8], [5 x i8]*@.str4432, i32 0, i32 0
%.tmp4434 = call i32(i8*,i8*) @strcmp(i8* %.tmp4431, i8* %.tmp4433)
%.tmp4435 = icmp eq i32 %.tmp4434, 0
br i1 %.tmp4435, label %.if.true.4436, label %.if.false.4436
.if.true.4436:
%.tmp4437 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4438 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4412
%.tmp4439 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4438, i32 0, i32 7
%.tmp4440 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4439
%.tmp4441 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp4437, %m980$.Node.type* %.tmp4440)
store %m2756$.Type.type* %.tmp4441, %m2756$.Type.type** %param_type.4409
%.tmp4442 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4412
%.tmp4443 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4442, i32 0, i32 8
%.tmp4444 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4443
store %m980$.Node.type* %.tmp4444, %m980$.Node.type** %param_ptr.4412
br label %.if.end.4436
.if.false.4436:
br label %.if.end.4436
.if.end.4436:
%.tmp4445 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %param_info.4424
%.tmp4446 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4445, i32 0, i32 4
%.tmp4447 = load %m2756$.Type.type*, %m2756$.Type.type** %param_type.4409
store %m2756$.Type.type* %.tmp4447, %m2756$.Type.type** %.tmp4446
%.tmp4448 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4412
%.tmp4449 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4448, i32 0, i32 1
%.tmp4450 = load i8*, i8** %.tmp4449
%var_name.4451 = alloca i8*
store i8* %.tmp4450, i8** %var_name.4451
%.tmp4452 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %param_info.4424
%.tmp4453 = load i8, i8* @SCOPE_LOCAL
%.tmp4454 = load i8*, i8** %var_name.4451
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp4452, i8 %.tmp4453, i8* %.tmp4454)
%.tmp4455 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4456 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %param_info.4424
%.tmp4457 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4456, i32 0, i32 4
%.tmp4458 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4457
%.tmp4459 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4455, %m2756$.Type.type* %.tmp4458)
%param_info_tr.4460 = alloca i8*
store i8* %.tmp4459, i8** %param_info_tr.4460
%.tmp4461 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4462 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4461, i32 0, i32 1
%.tmp4463 = load %m0$.File.type*, %m0$.File.type** %.tmp4462
%.tmp4465 = getelementptr [16 x i8], [16 x i8]*@.str4464, i32 0, i32 0
%.tmp4466 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %param_info.4424
%.tmp4467 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp4466)
%.tmp4468 = load i8*, i8** %param_info_tr.4460
%.tmp4469 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4463, i8* %.tmp4465, i8* %.tmp4467, i8* %.tmp4468)
%.tmp4470 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4471 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4412
%.tmp4472 = load i8*, i8** %var_name.4451
%.tmp4473 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %param_info.4424
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2756$.AssignableInfo.type*) @m295$define_assignable.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp4470, %m980$.Node.type* %.tmp4471, i8* %.tmp4472, %m2756$.AssignableInfo.type* %.tmp4473)
%.tmp4474 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4475 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4474, i32 0, i32 1
%.tmp4476 = load %m0$.File.type*, %m0$.File.type** %.tmp4475
%.tmp4478 = getelementptr [28 x i8], [28 x i8]*@.str4477, i32 0, i32 0
%.tmp4479 = load i8*, i8** %param_info_tr.4460
%.tmp4480 = load i8*, i8** %var_name.4451
%.tmp4481 = load i8*, i8** %param_info_tr.4460
%.tmp4482 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %param_info.4424
%.tmp4483 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp4482)
%.tmp4484 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4476, i8* %.tmp4478, i8* %.tmp4479, i8* %.tmp4480, i8* %.tmp4481, i8* %.tmp4483)
%.tmp4485 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4412
%.tmp4486 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4485, i32 0, i32 8
%.tmp4487 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4486
store %m980$.Node.type* %.tmp4487, %m980$.Node.type** %param_ptr.4412
br label %.for.start.4410
.for.end.4410:
ret void
}
define void @m295$compile_block.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp4488 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4490 = getelementptr [6 x i8], [6 x i8]*@.str4489, i32 0, i32 0
%.tmp4491 = bitcast ptr null to i8*
%.tmp4492 = bitcast ptr null to i8*
%.tmp4493 = bitcast ptr null to %m2756$.Type.type*
call void(%m2756$.CompilerCtx.type*,i8*,i8*,i8*,%m2756$.Type.type*) @m295$push_scope.v.m2756$.CompilerCtx.typep.cp.cp.cp.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4488, i8* %.tmp4490, i8* %.tmp4491, i8* %.tmp4492, %m2756$.Type.type* %.tmp4493)
%.tmp4494 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4495 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4494, i32 0, i32 7
%.tmp4496 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4495
%.tmp4498 = getelementptr [12 x i8], [12 x i8]*@.str4497, i32 0, i32 0
%.tmp4499 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4496, i8* %.tmp4498)
%exprs.4500 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4499, %m980$.Node.type** %exprs.4500
%.tmp4501 = load %m980$.Node.type*, %m980$.Node.type** %exprs.4500
%.tmp4502 = icmp ne %m980$.Node.type* %.tmp4501, null
br i1 %.tmp4502, label %.if.true.4503, label %.if.false.4503
.if.true.4503:
%.tmp4505 = load %m980$.Node.type*, %m980$.Node.type** %exprs.4500
%.tmp4506 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4505, i32 0, i32 7
%.tmp4507 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4506
%b.4508 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4507, %m980$.Node.type** %b.4508
br label %.for.start.4504
.for.start.4504:
%.tmp4509 = load %m980$.Node.type*, %m980$.Node.type** %b.4508
%.tmp4510 = icmp ne %m980$.Node.type* %.tmp4509, null
br i1 %.tmp4510, label %.for.continue.4504, label %.for.end.4504
.for.continue.4504:
%.tmp4511 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4512 = load %m980$.Node.type*, %m980$.Node.type** %b.4508
%.tmp4513 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4512, i32 0, i32 7
%.tmp4514 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4513
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_expression.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp4511, %m980$.Node.type* %.tmp4514)
%.tmp4515 = load %m980$.Node.type*, %m980$.Node.type** %b.4508
%.tmp4516 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4515, i32 0, i32 8
%.tmp4517 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4516
store %m980$.Node.type* %.tmp4517, %m980$.Node.type** %b.4508
br label %.for.start.4504
.for.end.4504:
br label %.if.end.4503
.if.false.4503:
br label %.if.end.4503
.if.end.4503:
%.tmp4518 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
call void(%m2756$.CompilerCtx.type*) @m295$pop_scope.v.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp4518)
ret void
}
define %m2756$.AssignableInfo.type* @m295$get_struct_attr.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep.i(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp4519 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4520 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4521 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp4519, %m980$.Node.type* %.tmp4520)
%val.4522 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp4521, %m2756$.AssignableInfo.type** %val.4522
%.tmp4523 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %val.4522
%.tmp4524 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4523, i32 0, i32 4
%.tmp4525 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4524
%.tmp4526 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4525, i32 0, i32 0
%.tmp4527 = load i8*, i8** %.tmp4526
%.tmp4529 = getelementptr [7 x i8], [7 x i8]*@.str4528, i32 0, i32 0
%.tmp4530 = call i32(i8*,i8*) @strcmp(i8* %.tmp4527, i8* %.tmp4529)
%.tmp4531 = icmp ne i32 %.tmp4530, 0
br i1 %.tmp4531, label %.if.true.4532, label %.if.false.4532
.if.true.4532:
%.tmp4534 = getelementptr [7 x i8], [7 x i8]*@.str4533, i32 0, i32 0
%.tmp4535 = call i32(i8*,...) @printf(i8* %.tmp4534)
%.tmp4536 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp4536
br label %.if.end.4532
.if.false.4532:
br label %.if.end.4532
.if.end.4532:
%.tmp4537 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %val.4522
%.tmp4538 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4537, i32 0, i32 4
%.tmp4539 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4538
%.tmp4540 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4539, i32 0, i32 3
%.tmp4541 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4540
%node_type.4542 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp4541, %m2756$.Type.type** %node_type.4542
%i.4544 = alloca i32
store i32 0, i32* %i.4544
br label %.for.start.4543
.for.start.4543:
%.tmp4545 = load i32, i32* %i.4544
%.tmp4546 = load i32, i32* %attr_id
%.tmp4547 = icmp slt i32 %.tmp4545, %.tmp4546
br i1 %.tmp4547, label %.for.continue.4543, label %.for.end.4543
.for.continue.4543:
%.tmp4548 = load %m2756$.Type.type*, %m2756$.Type.type** %node_type.4542
%.tmp4549 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4548, i32 0, i32 4
%.tmp4550 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4549
store %m2756$.Type.type* %.tmp4550, %m2756$.Type.type** %node_type.4542
%.tmp4551 = load i32, i32* %i.4544
%.tmp4552 = add i32 %.tmp4551, 1
store i32 %.tmp4552, i32* %i.4544
br label %.for.start.4543
.for.end.4543:
%.tmp4553 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4554 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4553)
%info.4555 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp4554, %m2756$.AssignableInfo.type** %info.4555
%.tmp4556 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4555
%.tmp4557 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4556, i32 0, i32 4
%.tmp4558 = load %m2756$.Type.type*, %m2756$.Type.type** %node_type.4542
store %m2756$.Type.type* %.tmp4558, %m2756$.Type.type** %.tmp4557
%.tmp4559 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4560 = call i32(%m2756$.CompilerCtx.type*) @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp4559)
%tmp_id.4561 = alloca i32
store i32 %.tmp4560, i32* %tmp_id.4561
%.tmp4562 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4563 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %val.4522
%.tmp4564 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4563, i32 0, i32 4
%.tmp4565 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4564
%.tmp4566 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4562, %m2756$.Type.type* %.tmp4565)
%type_as_str.4567 = alloca i8*
store i8* %.tmp4566, i8** %type_as_str.4567
%.tmp4568 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4569 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4555
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp4568, %m2756$.AssignableInfo.type* %.tmp4569)
%.tmp4570 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4571 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4570, i32 0, i32 1
%.tmp4572 = load %m0$.File.type*, %m0$.File.type** %.tmp4571
%.tmp4574 = getelementptr [52 x i8], [52 x i8]*@.str4573, i32 0, i32 0
%.tmp4575 = load i32, i32* %tmp_id.4561
%.tmp4576 = load i8*, i8** %type_as_str.4567
%.tmp4577 = load i8*, i8** %type_as_str.4567
%.tmp4578 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %val.4522
%.tmp4579 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp4578)
%.tmp4580 = load i32, i32* %attr_id
%.tmp4581 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4572, i8* %.tmp4574, i32 %.tmp4575, i8* %.tmp4576, i8* %.tmp4577, i8* %.tmp4579, i32 %.tmp4580)
%.tmp4582 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4583 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4582, i32 0, i32 1
%.tmp4584 = load %m0$.File.type*, %m0$.File.type** %.tmp4583
%.tmp4586 = getelementptr [28 x i8], [28 x i8]*@.str4585, i32 0, i32 0
%.tmp4587 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4555
%.tmp4588 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp4587)
%.tmp4589 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4590 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4555
%.tmp4591 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4590, i32 0, i32 4
%.tmp4592 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4591
%.tmp4593 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4589, %m2756$.Type.type* %.tmp4592)
%.tmp4594 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4595 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4555
%.tmp4596 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4595, i32 0, i32 4
%.tmp4597 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4596
%.tmp4598 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4594, %m2756$.Type.type* %.tmp4597)
%.tmp4599 = load i32, i32* %tmp_id.4561
%.tmp4600 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4584, i8* %.tmp4586, i8* %.tmp4588, i8* %.tmp4593, i8* %.tmp4598, i32 %.tmp4599)
%.tmp4601 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4555
ret %m2756$.AssignableInfo.type* %.tmp4601
}
define void @m295$set_struct_attr.v.m2756$.CompilerCtx.typep.m980$.Node.typep.i.cp(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i32 %.attr_id.arg, i8* %.attr.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%attr = alloca i8*
store i8* %.attr.arg, i8** %attr
%.tmp4602 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4603 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4604 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp4602, %m980$.Node.type* %.tmp4603)
%val.4605 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp4604, %m2756$.AssignableInfo.type** %val.4605
%.tmp4606 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %val.4605
%.tmp4607 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4606, i32 0, i32 4
%.tmp4608 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4607
%.tmp4609 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4608, i32 0, i32 0
%.tmp4610 = load i8*, i8** %.tmp4609
%.tmp4612 = getelementptr [7 x i8], [7 x i8]*@.str4611, i32 0, i32 0
%.tmp4613 = call i32(i8*,i8*) @strcmp(i8* %.tmp4610, i8* %.tmp4612)
%.tmp4614 = icmp ne i32 %.tmp4613, 0
br i1 %.tmp4614, label %.if.true.4615, label %.if.false.4615
.if.true.4615:
%.tmp4617 = getelementptr [7 x i8], [7 x i8]*@.str4616, i32 0, i32 0
%.tmp4618 = call i32(i8*,...) @printf(i8* %.tmp4617)
ret void
br label %.if.end.4615
.if.false.4615:
br label %.if.end.4615
.if.end.4615:
%.tmp4619 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %val.4605
%.tmp4620 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4619, i32 0, i32 4
%.tmp4621 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4620
%.tmp4622 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4621, i32 0, i32 3
%.tmp4623 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4622
%node_type.4624 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp4623, %m2756$.Type.type** %node_type.4624
%i.4626 = alloca i32
store i32 0, i32* %i.4626
br label %.for.start.4625
.for.start.4625:
%.tmp4627 = load i32, i32* %i.4626
%.tmp4628 = load i32, i32* %attr_id
%.tmp4629 = icmp slt i32 %.tmp4627, %.tmp4628
br i1 %.tmp4629, label %.for.continue.4625, label %.for.end.4625
.for.continue.4625:
%.tmp4630 = load %m2756$.Type.type*, %m2756$.Type.type** %node_type.4624
%.tmp4631 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4630, i32 0, i32 4
%.tmp4632 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4631
store %m2756$.Type.type* %.tmp4632, %m2756$.Type.type** %node_type.4624
%.tmp4633 = load i32, i32* %i.4626
%.tmp4634 = add i32 %.tmp4633, 1
store i32 %.tmp4634, i32* %i.4626
br label %.for.start.4625
.for.end.4625:
%.tmp4635 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4636 = call i32(%m2756$.CompilerCtx.type*) @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp4635)
%tmp_id.4637 = alloca i32
store i32 %.tmp4636, i32* %tmp_id.4637
%.tmp4638 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4639 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %val.4605
%.tmp4640 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4639, i32 0, i32 4
%.tmp4641 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4640
%.tmp4642 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4638, %m2756$.Type.type* %.tmp4641)
%type_as_str.4643 = alloca i8*
store i8* %.tmp4642, i8** %type_as_str.4643
%.tmp4644 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4645 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4644, i32 0, i32 1
%.tmp4646 = load %m0$.File.type*, %m0$.File.type** %.tmp4645
%.tmp4648 = getelementptr [52 x i8], [52 x i8]*@.str4647, i32 0, i32 0
%.tmp4649 = load i32, i32* %tmp_id.4637
%.tmp4650 = load i8*, i8** %type_as_str.4643
%.tmp4651 = load i8*, i8** %type_as_str.4643
%.tmp4652 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %val.4605
%.tmp4653 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp4652)
%.tmp4654 = load i32, i32* %attr_id
%.tmp4655 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4646, i8* %.tmp4648, i32 %.tmp4649, i8* %.tmp4650, i8* %.tmp4651, i8* %.tmp4653, i32 %.tmp4654)
%.tmp4656 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4657 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4656, i32 0, i32 1
%.tmp4658 = load %m0$.File.type*, %m0$.File.type** %.tmp4657
%.tmp4660 = getelementptr [18 x i8], [18 x i8]*@.str4659, i32 0, i32 0
%.tmp4661 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4662 = load %m2756$.Type.type*, %m2756$.Type.type** %node_type.4624
%.tmp4663 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4661, %m2756$.Type.type* %.tmp4662)
%.tmp4664 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4665 = load %m2756$.Type.type*, %m2756$.Type.type** %node_type.4624
%.tmp4666 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4664, %m2756$.Type.type* %.tmp4665)
%.tmp4667 = load i8*, i8** %attr
%.tmp4668 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4658, i8* %.tmp4660, i8* %.tmp4663, i8* %.tmp4666, i8* %.tmp4667)
ret void
}
define %m2756$.AssignableInfo.type* @m295$compile_builtin.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp4669 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4670 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4669, i32 0, i32 7
%.tmp4671 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4670
%.tmp4672 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4671, i32 0, i32 7
%.tmp4673 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4672
%dotted.4674 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4673, %m980$.Node.type** %dotted.4674
%.tmp4675 = load %m980$.Node.type*, %m980$.Node.type** %dotted.4674
%.tmp4676 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4675, i32 0, i32 8
%.tmp4677 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4676
%.tmp4678 = icmp ne %m980$.Node.type* %.tmp4677, null
br i1 %.tmp4678, label %.if.true.4679, label %.if.false.4679
.if.true.4679:
%.tmp4680 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp4680
br label %.if.end.4679
.if.false.4679:
br label %.if.end.4679
.if.end.4679:
%.tmp4681 = load %m980$.Node.type*, %m980$.Node.type** %dotted.4674
%.tmp4682 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4681, i32 0, i32 1
%.tmp4683 = load i8*, i8** %.tmp4682
%.tmp4685 = getelementptr [7 x i8], [7 x i8]*@.str4684, i32 0, i32 0
%.tmp4686 = call i32(i8*,i8*) @strcmp(i8* %.tmp4683, i8* %.tmp4685)
%.tmp4687 = icmp eq i32 %.tmp4686, 0
br i1 %.tmp4687, label %.if.true.4688, label %.if.false.4688
.if.true.4688:
%.tmp4689 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4691 = getelementptr [8 x i8], [8 x i8]*@.str4690, i32 0, i32 0
%.tmp4692 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4689, i8* %.tmp4691)
%args.4693 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4692, %m980$.Node.type** %args.4693
%.tmp4694 = load %m980$.Node.type*, %m980$.Node.type** %args.4693
%.tmp4695 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4694, i32 0, i32 7
%.tmp4696 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4695
%.tmp4698 = getelementptr [11 x i8], [11 x i8]*@.str4697, i32 0, i32 0
%.tmp4699 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4696, i8* %.tmp4698)
%value.4700 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4699, %m980$.Node.type** %value.4700
%.tmp4701 = load %m980$.Node.type*, %m980$.Node.type** %value.4700
%.tmp4702 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4701, i32 0, i32 7
%.tmp4703 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4702
%.tmp4704 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4703, i32 0, i32 7
%.tmp4705 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4704
%.tmp4706 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4705, i32 0, i32 7
%.tmp4707 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4706
%.tmp4708 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4707, i32 0, i32 7
%.tmp4709 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4708
store %m980$.Node.type* %.tmp4709, %m980$.Node.type** %value.4700
%.tmp4710 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4711 = call i32(%m2756$.CompilerCtx.type*) @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp4710)
%tmp_id.4712 = alloca i32
store i32 %.tmp4711, i32* %tmp_id.4712
%.tmp4713 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4714 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4713)
%info.4715 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp4714, %m2756$.AssignableInfo.type** %info.4715
%.tmp4716 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4717 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4715
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp4716, %m2756$.AssignableInfo.type* %.tmp4717)
%.tmp4718 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4715
%.tmp4719 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4718, i32 0, i32 4
%.tmp4720 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp4720, %m2756$.Type.type** %.tmp4719
%.tmp4721 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4715
%.tmp4722 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4721, i32 0, i32 4
%.tmp4723 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4722
%.tmp4724 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4723, i32 0, i32 0
%.tmp4726 = getelementptr [4 x i8], [4 x i8]*@.str4725, i32 0, i32 0
store i8* %.tmp4726, i8** %.tmp4724
%.tmp4727 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4728 = load %m980$.Node.type*, %m980$.Node.type** %value.4700
%.tmp4729 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp4727, %m980$.Node.type* %.tmp4728)
%inspected_type.4730 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp4729, %m2756$.Type.type** %inspected_type.4730
%.tmp4731 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4732 = load %m2756$.Type.type*, %m2756$.Type.type** %inspected_type.4730
%.tmp4733 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4731, %m2756$.Type.type* %.tmp4732)
%type_as_str.4734 = alloca i8*
store i8* %.tmp4733, i8** %type_as_str.4734
%.tmp4735 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4736 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4735, i32 0, i32 1
%.tmp4737 = load %m0$.File.type*, %m0$.File.type** %.tmp4736
%.tmp4739 = getelementptr [46 x i8], [46 x i8]*@.str4738, i32 0, i32 0
%.tmp4740 = load i32, i32* %tmp_id.4712
%.tmp4741 = load i8*, i8** %type_as_str.4734
%.tmp4742 = load i8*, i8** %type_as_str.4734
%.tmp4743 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4737, i8* %.tmp4739, i32 %.tmp4740, i8* %.tmp4741, i8* %.tmp4742)
%.tmp4744 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4745 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4744, i32 0, i32 1
%.tmp4746 = load %m0$.File.type*, %m0$.File.type** %.tmp4745
%.tmp4748 = getelementptr [35 x i8], [35 x i8]*@.str4747, i32 0, i32 0
%.tmp4749 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4715
%.tmp4750 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp4749)
%.tmp4751 = load i8*, i8** %type_as_str.4734
%.tmp4752 = load i32, i32* %tmp_id.4712
%.tmp4753 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4746, i8* %.tmp4748, i8* %.tmp4750, i8* %.tmp4751, i32 %.tmp4752)
%.tmp4754 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4715
ret %m2756$.AssignableInfo.type* %.tmp4754
br label %.if.end.4688
.if.false.4688:
%.tmp4755 = load %m980$.Node.type*, %m980$.Node.type** %dotted.4674
%.tmp4756 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4755, i32 0, i32 1
%.tmp4757 = load i8*, i8** %.tmp4756
%.tmp4759 = getelementptr [7 x i8], [7 x i8]*@.str4758, i32 0, i32 0
%.tmp4760 = call i32(i8*,i8*) @strcmp(i8* %.tmp4757, i8* %.tmp4759)
%.tmp4761 = icmp eq i32 %.tmp4760, 0
br i1 %.tmp4761, label %.if.true.4762, label %.if.false.4762
.if.true.4762:
%.tmp4763 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4765 = getelementptr [8 x i8], [8 x i8]*@.str4764, i32 0, i32 0
%.tmp4766 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4763, i8* %.tmp4765)
%args.4767 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4766, %m980$.Node.type** %args.4767
%.tmp4768 = load %m980$.Node.type*, %m980$.Node.type** %args.4767
%.tmp4769 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4768, i32 0, i32 7
%.tmp4770 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4769
%.tmp4772 = getelementptr [11 x i8], [11 x i8]*@.str4771, i32 0, i32 0
%.tmp4773 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4770, i8* %.tmp4772)
%array.4774 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4773, %m980$.Node.type** %array.4774
%.tmp4775 = load %m980$.Node.type*, %m980$.Node.type** %array.4774
%.tmp4776 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4775, i32 0, i32 8
%.tmp4777 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4776
%.tmp4779 = getelementptr [11 x i8], [11 x i8]*@.str4778, i32 0, i32 0
%.tmp4780 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4777, i8* %.tmp4779)
%value.4781 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4780, %m980$.Node.type** %value.4781
%.tmp4782 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4783 = load %m980$.Node.type*, %m980$.Node.type** %value.4781
%.tmp4784 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp4782, %m980$.Node.type* %.tmp4783)
%value_info.4785 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp4784, %m2756$.AssignableInfo.type** %value_info.4785
%.tmp4786 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4787 = load %m980$.Node.type*, %m980$.Node.type** %array.4774
%.tmp4788 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp4786, %m980$.Node.type* %.tmp4787)
%array_info.4789 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp4788, %m2756$.AssignableInfo.type** %array_info.4789
%.tmp4790 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4791 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4790)
%info.4792 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp4791, %m2756$.AssignableInfo.type** %info.4792
%.tmp4793 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4794 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4792
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp4793, %m2756$.AssignableInfo.type* %.tmp4794)
%.tmp4795 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4792
%.tmp4796 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4795, i32 0, i32 4
%.tmp4797 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %array_info.4789
%.tmp4798 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4797, i32 0, i32 4
%.tmp4799 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4798
store %m2756$.Type.type* %.tmp4799, %m2756$.Type.type** %.tmp4796
%.tmp4801 = getelementptr [1 x i8], [1 x i8]*@.str4800, i32 0, i32 0
%builtin_prefix.4802 = alloca i8*
store i8* %.tmp4801, i8** %builtin_prefix.4802
%.tmp4803 = getelementptr i8*, i8** %builtin_prefix.4802, i32 0
%.tmp4805 = getelementptr [5 x i8], [5 x i8]*@.str4804, i32 0, i32 0
%.tmp4806 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4807 = call i32(%m2756$.CompilerCtx.type*) @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp4806)
%.tmp4808 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4803, i8* %.tmp4805, i32 %.tmp4807)
%.tmp4809 = call i8*() @m2307$append_tmpl.cp()
%tmpl.4810 = alloca i8*
store i8* %.tmp4809, i8** %tmpl.4810
%.tmp4811 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4812 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4811, i32 0, i32 1
%.tmp4813 = load %m0$.File.type*, %m0$.File.type** %.tmp4812
%.tmp4814 = load i8*, i8** %tmpl.4810
%.tmp4815 = load i8*, i8** %builtin_prefix.4802
%.tmp4816 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4817 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %array_info.4789
%.tmp4818 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4817, i32 0, i32 4
%.tmp4819 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4818
%.tmp4820 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4816, %m2756$.Type.type* %.tmp4819)
%.tmp4821 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %array_info.4789
%.tmp4822 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp4821)
%.tmp4823 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4824 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %value_info.4785
%.tmp4825 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4824, i32 0, i32 4
%.tmp4826 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4825
%.tmp4827 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp4823, %m2756$.Type.type* %.tmp4826)
%.tmp4828 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %value_info.4785
%.tmp4829 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp4828)
%.tmp4830 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4792
%.tmp4831 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp4830)
%.tmp4832 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4813, i8* %.tmp4814, i8* %.tmp4815, i8* %.tmp4820, i8* %.tmp4822, i8* %.tmp4827, i8* %.tmp4829, i8* %.tmp4831)
%.tmp4833 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4834 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4833)
%info_g.4835 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp4834, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4836 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4837 = load i8, i8* @SCOPE_GLOBAL
%.tmp4839 = getelementptr [8 x i8], [8 x i8]*@.str4838, i32 0, i32 0
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp4836, i8 %.tmp4837, i8* %.tmp4839)
%.tmp4840 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4841 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4840, i32 0, i32 4
%.tmp4842 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp4842, %m2756$.Type.type** %.tmp4841
%.tmp4843 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4844 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4843, i32 0, i32 4
%.tmp4845 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4844
%.tmp4846 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4845, i32 0, i32 0
%.tmp4848 = getelementptr [9 x i8], [9 x i8]*@.str4847, i32 0, i32 0
store i8* %.tmp4848, i8** %.tmp4846
%.tmp4849 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4850 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4849, i32 0, i32 4
%.tmp4851 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4850
%.tmp4852 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4851, i32 0, i32 3
%.tmp4853 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp4853, %m2756$.Type.type** %.tmp4852
%.tmp4854 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4855 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4854, i32 0, i32 4
%.tmp4856 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4855
%.tmp4857 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4856, i32 0, i32 3
%.tmp4858 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4857
%.tmp4859 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4858, i32 0, i32 0
%.tmp4861 = getelementptr [4 x i8], [4 x i8]*@.str4860, i32 0, i32 0
store i8* %.tmp4861, i8** %.tmp4859
%.tmp4862 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4863 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4862, i32 0, i32 4
%.tmp4864 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4863
%.tmp4865 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4864, i32 0, i32 3
%.tmp4866 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4865
%.tmp4867 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4866, i32 0, i32 3
%.tmp4868 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp4868, %m2756$.Type.type** %.tmp4867
%.tmp4869 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4870 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4869, i32 0, i32 4
%.tmp4871 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4870
%.tmp4872 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4871, i32 0, i32 3
%.tmp4873 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4872
%.tmp4874 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4873, i32 0, i32 3
%.tmp4875 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4874
%.tmp4876 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4875, i32 0, i32 0
%.tmp4878 = getelementptr [4 x i8], [4 x i8]*@.str4877, i32 0, i32 0
store i8* %.tmp4878, i8** %.tmp4876
%.tmp4879 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4880 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4879, i32 0, i32 4
%.tmp4881 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4880
%.tmp4882 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4881, i32 0, i32 3
%.tmp4883 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4882
%.tmp4884 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4883, i32 0, i32 4
%.tmp4885 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp4885, %m2756$.Type.type** %.tmp4884
%.tmp4886 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4887 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4886, i32 0, i32 4
%.tmp4888 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4887
%.tmp4889 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4888, i32 0, i32 3
%.tmp4890 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4889
%.tmp4891 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4890, i32 0, i32 4
%.tmp4892 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4891
%.tmp4893 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4892, i32 0, i32 0
%.tmp4895 = getelementptr [4 x i8], [4 x i8]*@.str4894, i32 0, i32 0
store i8* %.tmp4895, i8** %.tmp4893
%.tmp4896 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4897 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4896, i32 0, i32 4
%.tmp4898 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4897
%.tmp4899 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4898, i32 0, i32 3
%.tmp4900 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4899
%.tmp4901 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4900, i32 0, i32 4
%.tmp4902 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4901
%.tmp4903 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4902, i32 0, i32 3
%.tmp4904 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp4904, %m2756$.Type.type** %.tmp4903
%.tmp4905 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4906 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4905, i32 0, i32 4
%.tmp4907 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4906
%.tmp4908 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4907, i32 0, i32 3
%.tmp4909 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4908
%.tmp4910 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4909, i32 0, i32 4
%.tmp4911 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4910
%.tmp4912 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4911, i32 0, i32 3
%.tmp4913 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4912
%.tmp4914 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4913, i32 0, i32 0
%.tmp4916 = getelementptr [4 x i8], [4 x i8]*@.str4915, i32 0, i32 0
store i8* %.tmp4916, i8** %.tmp4914
%.tmp4917 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4918 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4917, i32 0, i32 4
%.tmp4919 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4918
%.tmp4920 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4919, i32 0, i32 3
%.tmp4921 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4920
%.tmp4922 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4921, i32 0, i32 4
%.tmp4923 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4922
%.tmp4924 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4923, i32 0, i32 4
%.tmp4925 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp4925, %m2756$.Type.type** %.tmp4924
%.tmp4926 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
%.tmp4927 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp4926, i32 0, i32 4
%.tmp4928 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4927
%.tmp4929 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4928, i32 0, i32 3
%.tmp4930 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4929
%.tmp4931 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4930, i32 0, i32 4
%.tmp4932 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4931
%.tmp4933 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4932, i32 0, i32 4
%.tmp4934 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp4933
%.tmp4935 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp4934, i32 0, i32 0
%.tmp4937 = getelementptr [4 x i8], [4 x i8]*@.str4936, i32 0, i32 0
store i8* %.tmp4937, i8** %.tmp4935
%.tmp4938 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4940 = getelementptr [8 x i8], [8 x i8]*@.str4939, i32 0, i32 0
%.tmp4942 = getelementptr [7 x i8], [7 x i8]*@.str4941, i32 0, i32 0
%.tmp4943 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_g.4835
call void(%m2756$.CompilerCtx.type*,i8*,i8*,%m2756$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2756$.CompilerCtx.typep.cp.cp.m2756$.AssignableInfo.typep.b.b(%m2756$.CompilerCtx.type* %.tmp4938, i8* %.tmp4940, i8* %.tmp4942, %m2756$.AssignableInfo.type* %.tmp4943, i1 1, i1 0)
%.tmp4944 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.4792
ret %m2756$.AssignableInfo.type* %.tmp4944
br label %.if.end.4762
.if.false.4762:
%.tmp4945 = load %m980$.Node.type*, %m980$.Node.type** %dotted.4674
%.tmp4946 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4945, i32 0, i32 1
%.tmp4947 = load i8*, i8** %.tmp4946
%.tmp4949 = getelementptr [4 x i8], [4 x i8]*@.str4948, i32 0, i32 0
%.tmp4950 = call i32(i8*,i8*) @strcmp(i8* %.tmp4947, i8* %.tmp4949)
%.tmp4951 = icmp eq i32 %.tmp4950, 0
br i1 %.tmp4951, label %.if.true.4952, label %.if.false.4952
.if.true.4952:
%.tmp4953 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4955 = getelementptr [8 x i8], [8 x i8]*@.str4954, i32 0, i32 0
%.tmp4956 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4953, i8* %.tmp4955)
%args.4957 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4956, %m980$.Node.type** %args.4957
%.tmp4958 = load %m980$.Node.type*, %m980$.Node.type** %args.4957
%.tmp4959 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4958, i32 0, i32 7
%.tmp4960 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4959
%.tmp4962 = getelementptr [11 x i8], [11 x i8]*@.str4961, i32 0, i32 0
%.tmp4963 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4960, i8* %.tmp4962)
%value.4964 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4963, %m980$.Node.type** %value.4964
%.tmp4965 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4966 = load %m980$.Node.type*, %m980$.Node.type** %value.4964
%.tmp4967 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i32) @m295$get_struct_attr.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep.i(%m2756$.CompilerCtx.type* %.tmp4965, %m980$.Node.type* %.tmp4966, i32 1)
ret %m2756$.AssignableInfo.type* %.tmp4967
br label %.if.end.4952
.if.false.4952:
br label %.if.end.4952
.if.end.4952:
br label %.if.end.4762
.if.end.4762:
br label %.if.end.4688
.if.end.4688:
%.tmp4968 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp4968
}
define i8* @m295$resolve_import_path.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp4970 = getelementptr [1 x i8], [1 x i8]*@.str4969, i32 0, i32 0
%err_buf.4971 = alloca i8*
store i8* %.tmp4970, i8** %err_buf.4971
%.tmp4972 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4973 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp4972, i32 0, i32 7
%.tmp4974 = load i8*, i8** %.tmp4973
%mod_abspath.4975 = alloca i8*
store i8* %.tmp4974, i8** %mod_abspath.4975
%.tmp4976 = load i8*, i8** %mod_abspath.4975
%.tmp4977 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp4976)
%dirname.4978 = alloca i8*
store i8* %.tmp4977, i8** %dirname.4978
%.tmp4979 = load i8*, i8** %import_str
%.tmp4980 = getelementptr i8, i8* %.tmp4979, i32 0
%.tmp4981 = load i8, i8* %.tmp4980
%.tmp4982 = icmp eq i8 %.tmp4981, 47
br i1 %.tmp4982, label %.if.true.4983, label %.if.false.4983
.if.true.4983:
%.tmp4984 = getelementptr i8*, i8** %err_buf.4971, i32 0
%.tmp4986 = getelementptr [46 x i8], [46 x i8]*@.str4985, i32 0, i32 0
%.tmp4987 = load i8*, i8** %import_str
%.tmp4988 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4984, i8* %.tmp4986, i8* %.tmp4987)
%.tmp4989 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp4990 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4991 = load i8*, i8** %err_buf.4971
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp4989, %m980$.Node.type* %.tmp4990, i8* %.tmp4991)
%.tmp4992 = bitcast ptr null to i8*
ret i8* %.tmp4992
br label %.if.end.4983
.if.false.4983:
br label %.if.end.4983
.if.end.4983:
%.tmp4993 = load i8*, i8** %import_str
%.tmp4994 = getelementptr i8, i8* %.tmp4993, i32 0
%.tmp4995 = load i8, i8* %.tmp4994
%.tmp4996 = icmp ne i8 %.tmp4995, 46
%.tmp4997 = load i8*, i8** %import_str
%.tmp4998 = getelementptr i8, i8* %.tmp4997, i32 1
%.tmp4999 = load i8, i8* %.tmp4998
%.tmp5000 = icmp ne i8 %.tmp4999, 47
%.tmp5001 = and i1 %.tmp4996, %.tmp5000
br i1 %.tmp5001, label %.if.true.5002, label %.if.false.5002
.if.true.5002:
%.tmp5003 = call i8*() @m295$get_root.cp()
%root.5004 = alloca i8*
store i8* %.tmp5003, i8** %root.5004
%.tmp5005 = getelementptr i8*, i8** %mod_abspath.4975, i32 0
%.tmp5007 = getelementptr [13 x i8], [13 x i8]*@.str5006, i32 0, i32 0
%.tmp5008 = load i8*, i8** %root.5004
%.tmp5009 = load i8*, i8** %import_str
%.tmp5010 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5005, i8* %.tmp5007, i8* %.tmp5008, i8* %.tmp5009)
br label %.if.end.5002
.if.false.5002:
%.tmp5011 = load i8*, i8** %dirname.4978
%.tmp5013 = getelementptr [1 x i8], [1 x i8]*@.str5012, i32 0, i32 0
%.tmp5014 = call i32(i8*,i8*) @strcmp(i8* %.tmp5011, i8* %.tmp5013)
%.tmp5015 = icmp eq i32 %.tmp5014, 0
br i1 %.tmp5015, label %.if.true.5016, label %.if.false.5016
.if.true.5016:
%.tmp5017 = getelementptr i8*, i8** %mod_abspath.4975, i32 0
%.tmp5019 = getelementptr [6 x i8], [6 x i8]*@.str5018, i32 0, i32 0
%.tmp5020 = load i8*, i8** %import_str
%.tmp5021 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5017, i8* %.tmp5019, i8* %.tmp5020)
br label %.if.end.5016
.if.false.5016:
%.tmp5022 = getelementptr i8*, i8** %mod_abspath.4975, i32 0
%.tmp5024 = getelementptr [9 x i8], [9 x i8]*@.str5023, i32 0, i32 0
%.tmp5025 = load i8*, i8** %dirname.4978
%.tmp5026 = load i8*, i8** %import_str
%.tmp5027 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5022, i8* %.tmp5024, i8* %.tmp5025, i8* %.tmp5026)
br label %.if.end.5016
.if.end.5016:
br label %.if.end.5002
.if.end.5002:
%.tmp5028 = load i8*, i8** %mod_abspath.4975
ret i8* %.tmp5028
}
define %m2756$.AssignableInfo.type* @m295$compile_fn_call.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp5029 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5030 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5031 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_builtin.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp5029, %m980$.Node.type* %.tmp5030)
%info.5032 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp5031, %m2756$.AssignableInfo.type** %info.5032
%.tmp5033 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5034 = icmp ne %m2756$.AssignableInfo.type* %.tmp5033, null
br i1 %.tmp5034, label %.if.true.5035, label %.if.false.5035
.if.true.5035:
%.tmp5036 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
ret %m2756$.AssignableInfo.type* %.tmp5036
br label %.if.end.5035
.if.false.5035:
br label %.if.end.5035
.if.end.5035:
%.tmp5037 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5038 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5039 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp5037, %m980$.Node.type* %.tmp5038)
store %m2756$.AssignableInfo.type* %.tmp5039, %m2756$.AssignableInfo.type** %info.5032
%.tmp5040 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5041 = icmp eq %m2756$.AssignableInfo.type* %.tmp5040, null
br i1 %.tmp5041, label %.if.true.5042, label %.if.false.5042
.if.true.5042:
%.tmp5043 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp5043, label %.if.true.5044, label %.if.false.5044
.if.true.5044:
%.tmp5045 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5046 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5048 = getelementptr [35 x i8], [35 x i8]*@.str5047, i32 0, i32 0
%.tmp5049 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp5045, %m980$.Node.type* %.tmp5046, i8* %.tmp5048)
%.tmp5050 = call i32(i8*,...) @printf(i8* %.tmp5049)
br label %.if.end.5044
.if.false.5044:
br label %.if.end.5044
.if.end.5044:
%.tmp5051 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp5051
br label %.if.end.5042
.if.false.5042:
br label %.if.end.5042
.if.end.5042:
%.tmp5052 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5054 = getelementptr [8 x i8], [8 x i8]*@.str5053, i32 0, i32 0
%.tmp5055 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5052, i8* %.tmp5054)
%args.5056 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp5055, %m980$.Node.type** %args.5056
%.tmp5058 = getelementptr [1 x i8], [1 x i8]*@.str5057, i32 0, i32 0
%params_buff.5059 = alloca i8*
store i8* %.tmp5058, i8** %params_buff.5059
%.tmp5061 = getelementptr [1 x i8], [1 x i8]*@.str5060, i32 0, i32 0
%tmp.5062 = alloca i8*
store i8* %.tmp5061, i8** %tmp.5062
%.tmp5063 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5064 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5063, i32 0, i32 4
%.tmp5065 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5064
%.tmp5066 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5065, i32 0, i32 0
%.tmp5067 = load i8*, i8** %.tmp5066
%.tmp5069 = getelementptr [4 x i8], [4 x i8]*@.str5068, i32 0, i32 0
%.tmp5070 = call i32(i8*,i8*) @strcmp(i8* %.tmp5067, i8* %.tmp5069)
%.tmp5071 = icmp eq i32 %.tmp5070, 0
br i1 %.tmp5071, label %.if.true.5072, label %.if.false.5072
.if.true.5072:
%.tmp5073 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5074 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5073)
%new_info.5075 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp5074, %m2756$.AssignableInfo.type** %new_info.5075
%.tmp5076 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5077 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_info.5075
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp5076, %m2756$.AssignableInfo.type* %.tmp5077)
%.tmp5078 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_info.5075
%.tmp5079 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5078, i32 0, i32 4
%.tmp5080 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5081 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5080, i32 0, i32 4
%.tmp5082 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5081
%.tmp5083 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5082, i32 0, i32 3
%.tmp5084 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5083
store %m2756$.Type.type* %.tmp5084, %m2756$.Type.type** %.tmp5079
%.tmp5085 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5086 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp5085, i32 0, i32 1
%.tmp5087 = load %m0$.File.type*, %m0$.File.type** %.tmp5086
%.tmp5089 = getelementptr [22 x i8], [22 x i8]*@.str5088, i32 0, i32 0
%.tmp5090 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_info.5075
%.tmp5091 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp5090)
%.tmp5092 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5093 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5094 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5093, i32 0, i32 4
%.tmp5095 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5094
%.tmp5096 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5092, %m2756$.Type.type* %.tmp5095)
%.tmp5097 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5098 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5099 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5098, i32 0, i32 4
%.tmp5100 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5099
%.tmp5101 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5097, %m2756$.Type.type* %.tmp5100)
%.tmp5102 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5103 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp5102)
%.tmp5104 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5087, i8* %.tmp5089, i8* %.tmp5091, i8* %.tmp5096, i8* %.tmp5101, i8* %.tmp5103)
%.tmp5105 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_info.5075
store %m2756$.AssignableInfo.type* %.tmp5105, %m2756$.AssignableInfo.type** %info.5032
br label %.if.end.5072
.if.false.5072:
br label %.if.end.5072
.if.end.5072:
%.tmp5106 = load %m980$.Node.type*, %m980$.Node.type** %args.5056
%.tmp5107 = icmp ne %m980$.Node.type* %.tmp5106, null
br i1 %.tmp5107, label %.if.true.5108, label %.if.false.5108
.if.true.5108:
%.tmp5109 = load %m980$.Node.type*, %m980$.Node.type** %args.5056
%.tmp5110 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5109, i32 0, i32 7
%.tmp5111 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5110
%.tmp5113 = getelementptr [11 x i8], [11 x i8]*@.str5112, i32 0, i32 0
%.tmp5114 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5111, i8* %.tmp5113)
%start.5115 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp5114, %m980$.Node.type** %start.5115
%argno.5116 = alloca i32
store i32 1, i32* %argno.5116
%.tmp5117 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5118 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5117, i32 0, i32 4
%.tmp5119 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5118
%.tmp5120 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5119, i32 0, i32 3
%.tmp5121 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5120
%.tmp5122 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5121, i32 0, i32 4
%.tmp5123 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5122
%expect_type.5124 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp5123, %m2756$.Type.type** %expect_type.5124
%provided_args.5125 = alloca i32
store i32 0, i32* %provided_args.5125
%.tmp5127 = load %m980$.Node.type*, %m980$.Node.type** %start.5115
%pp.5128 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp5127, %m980$.Node.type** %pp.5128
br label %.for.start.5126
.for.start.5126:
%.tmp5129 = load %m980$.Node.type*, %m980$.Node.type** %pp.5128
%.tmp5130 = icmp ne %m980$.Node.type* %.tmp5129, null
br i1 %.tmp5130, label %.for.continue.5126, label %.for.end.5126
.for.continue.5126:
%.tmp5131 = load i32, i32* %provided_args.5125
%.tmp5132 = add i32 %.tmp5131, 1
store i32 %.tmp5132, i32* %provided_args.5125
%.tmp5133 = load %m980$.Node.type*, %m980$.Node.type** %pp.5128
%.tmp5134 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5133, i32 0, i32 8
%.tmp5135 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5134
%.tmp5137 = getelementptr [11 x i8], [11 x i8]*@.str5136, i32 0, i32 0
%.tmp5138 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5135, i8* %.tmp5137)
store %m980$.Node.type* %.tmp5138, %m980$.Node.type** %pp.5128
br label %.for.start.5126
.for.end.5126:
%.tmp5140 = load %m980$.Node.type*, %m980$.Node.type** %start.5115
%pp.5141 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp5140, %m980$.Node.type** %pp.5141
br label %.for.start.5139
.for.start.5139:
%.tmp5142 = load %m980$.Node.type*, %m980$.Node.type** %pp.5141
%.tmp5143 = icmp ne %m980$.Node.type* %.tmp5142, null
br i1 %.tmp5143, label %.for.continue.5139, label %.for.end.5139
.for.continue.5139:
%.tmp5144 = load %m2756$.Type.type*, %m2756$.Type.type** %expect_type.5124
%.tmp5145 = icmp eq %m2756$.Type.type* %.tmp5144, null
br i1 %.tmp5145, label %.if.true.5146, label %.if.false.5146
.if.true.5146:
%.tmp5147 = getelementptr i8*, i8** %tmp.5062, i32 0
%.tmp5149 = getelementptr [43 x i8], [43 x i8]*@.str5148, i32 0, i32 0
%.tmp5150 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5151 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5150, i32 0, i32 2
%.tmp5152 = load i8*, i8** %.tmp5151
%.tmp5153 = load i32, i32* %argno.5116
%.tmp5154 = sub i32 %.tmp5153, 1
%.tmp5155 = load i32, i32* %provided_args.5125
%.tmp5156 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5147, i8* %.tmp5149, i8* %.tmp5152, i32 %.tmp5154, i32 %.tmp5155)
%.tmp5157 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5158 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5159 = load i8*, i8** %tmp.5062
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp5157, %m980$.Node.type* %.tmp5158, i8* %.tmp5159)
%.tmp5160 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp5160
br label %.if.end.5146
.if.false.5146:
br label %.if.end.5146
.if.end.5146:
%.tmp5161 = load %m980$.Node.type*, %m980$.Node.type** %pp.5141
%.tmp5162 = load %m980$.Node.type*, %m980$.Node.type** %start.5115
%.tmp5163 = icmp ne %m980$.Node.type* %.tmp5161, %.tmp5162
br i1 %.tmp5163, label %.if.true.5164, label %.if.false.5164
.if.true.5164:
%.tmp5165 = getelementptr i8*, i8** %tmp.5062, i32 0
%.tmp5167 = getelementptr [5 x i8], [5 x i8]*@.str5166, i32 0, i32 0
%.tmp5168 = load i8*, i8** %params_buff.5059
%.tmp5169 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5165, i8* %.tmp5167, i8* %.tmp5168)
%.tmp5170 = load i8*, i8** %params_buff.5059
%tmp_buff.5171 = alloca i8*
store i8* %.tmp5170, i8** %tmp_buff.5171
%.tmp5172 = load i8*, i8** %tmp.5062
store i8* %.tmp5172, i8** %params_buff.5059
%.tmp5173 = load i8*, i8** %tmp_buff.5171
store i8* %.tmp5173, i8** %tmp.5062
%.tmp5174 = load i8*, i8** %tmp.5062
call void(i8*) @free(i8* %.tmp5174)
br label %.if.end.5164
.if.false.5164:
br label %.if.end.5164
.if.end.5164:
%.tmp5175 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5176 = load %m980$.Node.type*, %m980$.Node.type** %pp.5141
%.tmp5177 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp5175, %m980$.Node.type* %.tmp5176)
%a_info.5178 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp5177, %m2756$.AssignableInfo.type** %a_info.5178
%.tmp5179 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.5178
%.tmp5180 = icmp eq %m2756$.AssignableInfo.type* %.tmp5179, null
br i1 %.tmp5180, label %.if.true.5181, label %.if.false.5181
.if.true.5181:
%.tmp5182 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp5182
br label %.if.end.5181
.if.false.5181:
br label %.if.end.5181
.if.end.5181:
%.tmp5183 = load %m2756$.Type.type*, %m2756$.Type.type** %expect_type.5124
%.tmp5184 = call %m2756$.Type.type*(%m2756$.Type.type*) @m295$type_clone.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.tmp5183)
%exp.5185 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp5184, %m2756$.Type.type** %exp.5185
%.tmp5186 = load %m2756$.Type.type*, %m2756$.Type.type** %exp.5185
%.tmp5187 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5186, i32 0, i32 4
store %m2756$.Type.type* null, %m2756$.Type.type** %.tmp5187
%.tmp5188 = load %m2756$.Type.type*, %m2756$.Type.type** %expect_type.5124
%.tmp5189 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5188, i32 0, i32 0
%.tmp5190 = load i8*, i8** %.tmp5189
%.tmp5192 = getelementptr [7 x i8], [7 x i8]*@.str5191, i32 0, i32 0
%.tmp5193 = call i32(i8*,i8*) @strcmp(i8* %.tmp5190, i8* %.tmp5192)
%.tmp5194 = icmp ne i32 %.tmp5193, 0
%.tmp5195 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5196 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.5178
%.tmp5197 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5196, i32 0, i32 4
%.tmp5198 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5197
%.tmp5199 = load %m2756$.Type.type*, %m2756$.Type.type** %exp.5185
%.tmp5200 = call i1(%m2756$.CompilerCtx.type*,%m2756$.Type.type*,%m2756$.Type.type*) @m2757$cmp.b.m2756$.CompilerCtx.typep.m2756$.Type.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5195, %m2756$.Type.type* %.tmp5198, %m2756$.Type.type* %.tmp5199)
%.tmp5201 = icmp eq i1 %.tmp5200, 0
%.tmp5202 = and i1 %.tmp5194, %.tmp5201
br i1 %.tmp5202, label %.if.true.5203, label %.if.false.5203
.if.true.5203:
%.tmp5205 = getelementptr [1 x i8], [1 x i8]*@.str5204, i32 0, i32 0
%err_buf.5206 = alloca i8*
store i8* %.tmp5205, i8** %err_buf.5206
%.tmp5207 = getelementptr i8*, i8** %err_buf.5206, i32 0
%.tmp5209 = getelementptr [58 x i8], [58 x i8]*@.str5208, i32 0, i32 0
%.tmp5210 = load i32, i32* %argno.5116
%.tmp5211 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5212 = load %m2756$.Type.type*, %m2756$.Type.type** %exp.5185
%.tmp5213 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5211, %m2756$.Type.type* %.tmp5212)
%.tmp5214 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5215 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.5178
%.tmp5216 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5215, i32 0, i32 4
%.tmp5217 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5216
%.tmp5218 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5214, %m2756$.Type.type* %.tmp5217)
%.tmp5219 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5207, i8* %.tmp5209, i32 %.tmp5210, i8* %.tmp5213, i8* %.tmp5218)
%.tmp5220 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5221 = load %m980$.Node.type*, %m980$.Node.type** %pp.5141
%.tmp5222 = load i8*, i8** %err_buf.5206
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp5220, %m980$.Node.type* %.tmp5221, i8* %.tmp5222)
%.tmp5223 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp5223
br label %.if.end.5203
.if.false.5203:
br label %.if.end.5203
.if.end.5203:
%.tmp5224 = getelementptr i8*, i8** %params_buff.5059, i32 0
%.tmp5226 = getelementptr [8 x i8], [8 x i8]*@.str5225, i32 0, i32 0
%.tmp5227 = load i8*, i8** %params_buff.5059
%.tmp5228 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5229 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.5178
%.tmp5230 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5229, i32 0, i32 4
%.tmp5231 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5230
%.tmp5232 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5228, %m2756$.Type.type* %.tmp5231)
%.tmp5233 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.5178
%.tmp5234 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp5233)
%.tmp5235 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5224, i8* %.tmp5226, i8* %.tmp5227, i8* %.tmp5232, i8* %.tmp5234)
%.tmp5236 = load %m980$.Node.type*, %m980$.Node.type** %pp.5141
%.tmp5237 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5236, i32 0, i32 8
%.tmp5238 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5237
store %m980$.Node.type* %.tmp5238, %m980$.Node.type** %pp.5141
%.tmp5239 = load %m2756$.Type.type*, %m2756$.Type.type** %expect_type.5124
%.tmp5240 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5239, i32 0, i32 0
%.tmp5241 = load i8*, i8** %.tmp5240
%.tmp5243 = getelementptr [7 x i8], [7 x i8]*@.str5242, i32 0, i32 0
%.tmp5244 = call i32(i8*,i8*) @strcmp(i8* %.tmp5241, i8* %.tmp5243)
%.tmp5245 = icmp ne i32 %.tmp5244, 0
br i1 %.tmp5245, label %.if.true.5246, label %.if.false.5246
.if.true.5246:
%.tmp5247 = load %m2756$.Type.type*, %m2756$.Type.type** %expect_type.5124
%.tmp5248 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5247, i32 0, i32 4
%.tmp5249 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5248
store %m2756$.Type.type* %.tmp5249, %m2756$.Type.type** %expect_type.5124
br label %.if.end.5246
.if.false.5246:
br label %.if.end.5246
.if.end.5246:
%.tmp5250 = load i32, i32* %argno.5116
%.tmp5251 = add i32 %.tmp5250, 1
store i32 %.tmp5251, i32* %argno.5116
%.tmp5252 = load %m980$.Node.type*, %m980$.Node.type** %pp.5141
%.tmp5254 = getelementptr [11 x i8], [11 x i8]*@.str5253, i32 0, i32 0
%.tmp5255 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5252, i8* %.tmp5254)
store %m980$.Node.type* %.tmp5255, %m980$.Node.type** %pp.5141
br label %.for.start.5139
.for.end.5139:
%.tmp5256 = load %m2756$.Type.type*, %m2756$.Type.type** %expect_type.5124
%.tmp5257 = icmp ne %m2756$.Type.type* %.tmp5256, null
br i1 %.tmp5257, label %.if.true.5258, label %.if.false.5258
.if.true.5258:
%.tmp5259 = load %m2756$.Type.type*, %m2756$.Type.type** %expect_type.5124
%.tmp5260 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5259, i32 0, i32 0
%.tmp5261 = load i8*, i8** %.tmp5260
%.tmp5263 = getelementptr [7 x i8], [7 x i8]*@.str5262, i32 0, i32 0
%.tmp5264 = call i32(i8*,i8*) @strcmp(i8* %.tmp5261, i8* %.tmp5263)
%.tmp5265 = icmp ne i32 %.tmp5264, 0
br i1 %.tmp5265, label %.if.true.5266, label %.if.false.5266
.if.true.5266:
%.tmp5267 = getelementptr i8*, i8** %tmp.5062, i32 0
%.tmp5269 = getelementptr [43 x i8], [43 x i8]*@.str5268, i32 0, i32 0
%.tmp5270 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5271 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5270, i32 0, i32 2
%.tmp5272 = load i8*, i8** %.tmp5271
%.tmp5273 = load i32, i32* %argno.5116
%.tmp5274 = load i32, i32* %provided_args.5125
%.tmp5275 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5267, i8* %.tmp5269, i8* %.tmp5272, i32 %.tmp5273, i32 %.tmp5274)
%.tmp5276 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5277 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5278 = load i8*, i8** %tmp.5062
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp5276, %m980$.Node.type* %.tmp5277, i8* %.tmp5278)
%.tmp5279 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp5279
br label %.if.end.5266
.if.false.5266:
br label %.if.end.5266
.if.end.5266:
br label %.if.end.5258
.if.false.5258:
br label %.if.end.5258
.if.end.5258:
br label %.if.end.5108
.if.false.5108:
%.tmp5280 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5281 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5280, i32 0, i32 4
%.tmp5282 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5281
%.tmp5283 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5282, i32 0, i32 3
%.tmp5284 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5283
%.tmp5285 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5284, i32 0, i32 4
%.tmp5286 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5285
%.tmp5287 = icmp ne %m2756$.Type.type* %.tmp5286, null
br i1 %.tmp5287, label %.if.true.5288, label %.if.false.5288
.if.true.5288:
%args_required.5289 = alloca i32
store i32 0, i32* %args_required.5289
%.tmp5291 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5292 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5291, i32 0, i32 4
%.tmp5293 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5292
%.tmp5294 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5293, i32 0, i32 3
%.tmp5295 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5294
%.tmp5296 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5295, i32 0, i32 4
%.tmp5297 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5296
%pp.5298 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp5297, %m2756$.Type.type** %pp.5298
br label %.for.start.5290
.for.start.5290:
%.tmp5299 = load %m2756$.Type.type*, %m2756$.Type.type** %pp.5298
%.tmp5300 = icmp ne %m2756$.Type.type* %.tmp5299, null
br i1 %.tmp5300, label %.for.continue.5290, label %.for.else.5290
.for.continue.5290:
%.tmp5301 = load %m2756$.Type.type*, %m2756$.Type.type** %pp.5298
%.tmp5302 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5301, i32 0, i32 0
%.tmp5303 = load i8*, i8** %.tmp5302
%.tmp5305 = getelementptr [7 x i8], [7 x i8]*@.str5304, i32 0, i32 0
%.tmp5306 = call i32(i8*,i8*) @strcmp(i8* %.tmp5303, i8* %.tmp5305)
%.tmp5307 = icmp eq i32 %.tmp5306, 0
br i1 %.tmp5307, label %.if.true.5308, label %.if.false.5308
.if.true.5308:
br label %.for.end.5290
br label %.if.end.5308
.if.false.5308:
br label %.if.end.5308
.if.end.5308:
%.tmp5309 = load i32, i32* %args_required.5289
%.tmp5310 = add i32 %.tmp5309, 1
store i32 %.tmp5310, i32* %args_required.5289
%.tmp5311 = load %m2756$.Type.type*, %m2756$.Type.type** %pp.5298
%.tmp5312 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5311, i32 0, i32 4
%.tmp5313 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5312
store %m2756$.Type.type* %.tmp5313, %m2756$.Type.type** %pp.5298
br label %.for.start.5290
.for.else.5290:
%.tmp5314 = getelementptr i8*, i8** %tmp.5062, i32 0
%.tmp5316 = getelementptr [42 x i8], [42 x i8]*@.str5315, i32 0, i32 0
%.tmp5317 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5318 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5317, i32 0, i32 2
%.tmp5319 = load i8*, i8** %.tmp5318
%.tmp5320 = load i32, i32* %args_required.5289
%.tmp5321 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5314, i8* %.tmp5316, i8* %.tmp5319, i32 %.tmp5320)
%.tmp5322 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5323 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5324 = load i8*, i8** %tmp.5062
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp5322, %m980$.Node.type* %.tmp5323, i8* %.tmp5324)
%.tmp5325 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp5325
br label %.for.end.5290
.for.end.5290:
br label %.if.end.5288
.if.false.5288:
br label %.if.end.5288
.if.end.5288:
br label %.if.end.5108
.if.end.5108:
%.tmp5326 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5327 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5328 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5327, i32 0, i32 4
%.tmp5329 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5328
%.tmp5330 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5329, i32 0, i32 3
%.tmp5331 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5330
%.tmp5332 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5326, %m2756$.Type.type* %.tmp5331)
%.tmp5334 = getelementptr [5 x i8], [5 x i8]*@.str5333, i32 0, i32 0
%.tmp5335 = call i32(i8*,i8*) @strcmp(i8* %.tmp5332, i8* %.tmp5334)
%.tmp5336 = icmp eq i32 %.tmp5335, 0
br i1 %.tmp5336, label %.if.true.5337, label %.if.false.5337
.if.true.5337:
%.tmp5338 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5339 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp5338, i32 0, i32 1
%.tmp5340 = load %m0$.File.type*, %m0$.File.type** %.tmp5339
%.tmp5342 = getelementptr [16 x i8], [16 x i8]*@.str5341, i32 0, i32 0
%.tmp5343 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5344 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5345 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5344, i32 0, i32 4
%.tmp5346 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5345
%.tmp5347 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5343, %m2756$.Type.type* %.tmp5346)
%.tmp5348 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5349 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp5348)
%.tmp5350 = load i8*, i8** %params_buff.5059
%.tmp5351 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5340, i8* %.tmp5342, i8* %.tmp5347, i8* %.tmp5349, i8* %.tmp5350)
%.tmp5352 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp5352
br label %.if.end.5337
.if.false.5337:
br label %.if.end.5337
.if.end.5337:
%.tmp5353 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5354 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5353)
%call_info.5355 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp5354, %m2756$.AssignableInfo.type** %call_info.5355
%.tmp5356 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5357 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %call_info.5355
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp5356, %m2756$.AssignableInfo.type* %.tmp5357)
%.tmp5358 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %call_info.5355
%.tmp5359 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5358, i32 0, i32 4
%.tmp5360 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5361 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5360, i32 0, i32 4
%.tmp5362 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5361
%.tmp5363 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5362, i32 0, i32 3
%.tmp5364 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5363
%.tmp5365 = call %m2756$.Type.type*(%m2756$.Type.type*) @m295$type_clone.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.tmp5364)
store %m2756$.Type.type* %.tmp5365, %m2756$.Type.type** %.tmp5359
%.tmp5366 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %call_info.5355
%.tmp5367 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5366, i32 0, i32 4
%.tmp5368 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5367
%.tmp5369 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5368, i32 0, i32 4
store %m2756$.Type.type* null, %m2756$.Type.type** %.tmp5369
%.tmp5370 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5371 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp5370, i32 0, i32 1
%.tmp5372 = load %m0$.File.type*, %m0$.File.type** %.tmp5371
%.tmp5374 = getelementptr [21 x i8], [21 x i8]*@.str5373, i32 0, i32 0
%.tmp5375 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %call_info.5355
%.tmp5376 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp5375)
%.tmp5377 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5378 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5379 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5378, i32 0, i32 4
%.tmp5380 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5379
%.tmp5381 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5377, %m2756$.Type.type* %.tmp5380)
%.tmp5382 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5032
%.tmp5383 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp5382)
%.tmp5384 = load i8*, i8** %params_buff.5059
%.tmp5385 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5372, i8* %.tmp5374, i8* %.tmp5376, i8* %.tmp5381, i8* %.tmp5383, i8* %.tmp5384)
%.tmp5386 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %call_info.5355
%.tmp5387 = bitcast %m2756$.AssignableInfo.type* %.tmp5386 to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp5387
}
define void @m295$compile_expression.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp5389 = getelementptr [1 x i8], [1 x i8]*@.str5388, i32 0, i32 0
%err_msg.5390 = alloca i8*
store i8* %.tmp5389, i8** %err_msg.5390
%.tmp5391 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5392 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5391, i32 0, i32 0
%.tmp5393 = load i8*, i8** %.tmp5392
%expr_type.5394 = alloca i8*
store i8* %.tmp5393, i8** %expr_type.5394
%.tmp5395 = bitcast ptr null to %m2756$.AssignableInfo.type*
%info.5396 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp5395, %m2756$.AssignableInfo.type** %info.5396
%assignable.5397 = alloca %m980$.Node.type*
store %m980$.Node.type* null, %m980$.Node.type** %assignable.5397
%.tmp5398 = bitcast ptr null to %m2756$.AssignableInfo.type*
%a_info.5399 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp5398, %m2756$.AssignableInfo.type** %a_info.5399
%.tmp5400 = load i8*, i8** %expr_type.5394
%.tmp5402 = getelementptr [7 x i8], [7 x i8]*@.str5401, i32 0, i32 0
%.tmp5403 = call i32(i8*,i8*) @strcmp(i8* %.tmp5400, i8* %.tmp5402)
%.tmp5404 = icmp eq i32 %.tmp5403, 0
br i1 %.tmp5404, label %.if.true.5405, label %.if.false.5405
.if.true.5405:
%.tmp5406 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5408 = getelementptr [9 x i8], [9 x i8]*@.str5407, i32 0, i32 0
%.tmp5409 = call %m2756$.Scope.type*(%m2756$.CompilerCtx.type*,i8*) @m295$get_scope.m2756$.Scope.typep.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.tmp5406, i8* %.tmp5408)
%fn_scope.5410 = alloca %m2756$.Scope.type*
store %m2756$.Scope.type* %.tmp5409, %m2756$.Scope.type** %fn_scope.5410
%.tmp5411 = load %m2756$.Scope.type*, %m2756$.Scope.type** %fn_scope.5410
%.tmp5412 = icmp eq %m2756$.Scope.type* %.tmp5411, null
br i1 %.tmp5412, label %.if.true.5413, label %.if.false.5413
.if.true.5413:
%.tmp5414 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5415 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5417 = getelementptr [40 x i8], [40 x i8]*@.str5416, i32 0, i32 0
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp5414, %m980$.Node.type* %.tmp5415, i8* %.tmp5417)
ret void
br label %.if.end.5413
.if.false.5413:
br label %.if.end.5413
.if.end.5413:
%.tmp5418 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5419 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5418, i32 0, i32 7
%.tmp5420 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5419
%.tmp5421 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5420, i32 0, i32 8
%.tmp5422 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5421
%.tmp5423 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5422, i32 0, i32 0
%.tmp5424 = load i8*, i8** %.tmp5423
%.tmp5426 = getelementptr [3 x i8], [3 x i8]*@.str5425, i32 0, i32 0
%.tmp5427 = call i32(i8*,i8*) @strcmp(i8* %.tmp5424, i8* %.tmp5426)
%.tmp5428 = icmp ne i32 %.tmp5427, 0
br i1 %.tmp5428, label %.if.true.5429, label %.if.false.5429
.if.true.5429:
%.tmp5430 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5431 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5432 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5431, i32 0, i32 7
%.tmp5433 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5432
%.tmp5434 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5433, i32 0, i32 8
%.tmp5435 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5434
%.tmp5436 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp5430, %m980$.Node.type* %.tmp5435)
store %m2756$.AssignableInfo.type* %.tmp5436, %m2756$.AssignableInfo.type** %info.5396
%.tmp5437 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5396
%.tmp5438 = icmp eq %m2756$.AssignableInfo.type* %.tmp5437, null
br i1 %.tmp5438, label %.if.true.5439, label %.if.false.5439
.if.true.5439:
ret void
br label %.if.end.5439
.if.false.5439:
br label %.if.end.5439
.if.end.5439:
%.tmp5440 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5441 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5396
%.tmp5442 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5441, i32 0, i32 4
%.tmp5443 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5442
%.tmp5444 = load %m2756$.Scope.type*, %m2756$.Scope.type** %fn_scope.5410
%.tmp5445 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp5444, i32 0, i32 6
%.tmp5446 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5445
%.tmp5447 = call i1(%m2756$.CompilerCtx.type*,%m2756$.Type.type*,%m2756$.Type.type*) @m2757$cmp.b.m2756$.CompilerCtx.typep.m2756$.Type.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5440, %m2756$.Type.type* %.tmp5443, %m2756$.Type.type* %.tmp5446)
%.tmp5448 = icmp eq i1 %.tmp5447, 0
br i1 %.tmp5448, label %.if.true.5449, label %.if.false.5449
.if.true.5449:
%.tmp5451 = getelementptr [1 x i8], [1 x i8]*@.str5450, i32 0, i32 0
%buf.5452 = alloca i8*
store i8* %.tmp5451, i8** %buf.5452
%.tmp5453 = getelementptr i8*, i8** %buf.5452, i32 0
%.tmp5455 = getelementptr [67 x i8], [67 x i8]*@.str5454, i32 0, i32 0
%.tmp5456 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5457 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5396
%.tmp5458 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5457, i32 0, i32 4
%.tmp5459 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5458
%.tmp5460 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5456, %m2756$.Type.type* %.tmp5459)
%.tmp5461 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5462 = load %m2756$.Scope.type*, %m2756$.Scope.type** %fn_scope.5410
%.tmp5463 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp5462, i32 0, i32 6
%.tmp5464 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5463
%.tmp5465 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5461, %m2756$.Type.type* %.tmp5464)
%.tmp5466 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5453, i8* %.tmp5455, i8* %.tmp5460, i8* %.tmp5465)
%.tmp5467 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5468 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5469 = load i8*, i8** %buf.5452
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp5467, %m980$.Node.type* %.tmp5468, i8* %.tmp5469)
ret void
br label %.if.end.5449
.if.false.5449:
br label %.if.end.5449
.if.end.5449:
%.tmp5470 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5471 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp5470, i32 0, i32 1
%.tmp5472 = load %m0$.File.type*, %m0$.File.type** %.tmp5471
%.tmp5474 = getelementptr [11 x i8], [11 x i8]*@.str5473, i32 0, i32 0
%.tmp5475 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5476 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5396
%.tmp5477 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5476, i32 0, i32 4
%.tmp5478 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5477
%.tmp5479 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5475, %m2756$.Type.type* %.tmp5478)
%.tmp5480 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5396
%.tmp5481 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp5480)
%.tmp5482 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5472, i8* %.tmp5474, i8* %.tmp5479, i8* %.tmp5481)
br label %.if.end.5429
.if.false.5429:
%.tmp5483 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5484 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp5483, i32 0, i32 1
%.tmp5485 = load %m0$.File.type*, %m0$.File.type** %.tmp5484
%.tmp5487 = getelementptr [10 x i8], [10 x i8]*@.str5486, i32 0, i32 0
%.tmp5488 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5485, i8* %.tmp5487)
br label %.if.end.5429
.if.end.5429:
br label %.if.end.5405
.if.false.5405:
%.tmp5489 = load i8*, i8** %expr_type.5394
%.tmp5491 = getelementptr [3 x i8], [3 x i8]*@.str5490, i32 0, i32 0
%.tmp5492 = call i32(i8*,i8*) @strcmp(i8* %.tmp5489, i8* %.tmp5491)
%.tmp5493 = icmp eq i32 %.tmp5492, 0
br i1 %.tmp5493, label %.if.true.5494, label %.if.false.5494
.if.true.5494:
br label %.if.end.5494
.if.false.5494:
%.tmp5495 = load i8*, i8** %expr_type.5394
%.tmp5497 = getelementptr [8 x i8], [8 x i8]*@.str5496, i32 0, i32 0
%.tmp5498 = call i32(i8*,i8*) @strcmp(i8* %.tmp5495, i8* %.tmp5497)
%.tmp5499 = icmp eq i32 %.tmp5498, 0
br i1 %.tmp5499, label %.if.true.5500, label %.if.false.5500
.if.true.5500:
%.tmp5501 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5502 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5503 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5502, i32 0, i32 7
%.tmp5504 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5503
%.tmp5505 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_fn_call.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp5501, %m980$.Node.type* %.tmp5504)
br label %.if.end.5500
.if.false.5500:
%.tmp5506 = load i8*, i8** %expr_type.5394
%.tmp5508 = getelementptr [12 x i8], [12 x i8]*@.str5507, i32 0, i32 0
%.tmp5509 = call i32(i8*,i8*) @strcmp(i8* %.tmp5506, i8* %.tmp5508)
%.tmp5510 = icmp eq i32 %.tmp5509, 0
br i1 %.tmp5510, label %.if.true.5511, label %.if.false.5511
.if.true.5511:
%.tmp5512 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5513 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5514 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_declaration.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp5512, %m980$.Node.type* %.tmp5513)
br label %.if.end.5511
.if.false.5511:
%.tmp5515 = load i8*, i8** %expr_type.5394
%.tmp5517 = getelementptr [11 x i8], [11 x i8]*@.str5516, i32 0, i32 0
%.tmp5518 = call i32(i8*,i8*) @strcmp(i8* %.tmp5515, i8* %.tmp5517)
%.tmp5519 = icmp eq i32 %.tmp5518, 0
br i1 %.tmp5519, label %.if.true.5520, label %.if.false.5520
.if.true.5520:
%.tmp5521 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5522 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5521, i32 0, i32 7
%.tmp5523 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5522
%.tmp5525 = getelementptr [11 x i8], [11 x i8]*@.str5524, i32 0, i32 0
%.tmp5526 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5523, i8* %.tmp5525)
store %m980$.Node.type* %.tmp5526, %m980$.Node.type** %assignable.5397
%.tmp5527 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5528 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5529 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5528, i32 0, i32 7
%.tmp5530 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5529
%.tmp5531 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp5527, %m980$.Node.type* %.tmp5530)
%dest.5532 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp5531, %m2756$.AssignableInfo.type** %dest.5532
%.tmp5533 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %dest.5532
%.tmp5534 = icmp eq %m2756$.AssignableInfo.type* %.tmp5533, null
br i1 %.tmp5534, label %.if.true.5535, label %.if.false.5535
.if.true.5535:
ret void
br label %.if.end.5535
.if.false.5535:
br label %.if.end.5535
.if.end.5535:
%.tmp5536 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5537 = load %m980$.Node.type*, %m980$.Node.type** %assignable.5397
%.tmp5538 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp5536, %m980$.Node.type* %.tmp5537)
store %m2756$.AssignableInfo.type* %.tmp5538, %m2756$.AssignableInfo.type** %a_info.5399
%.tmp5539 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.5399
%.tmp5540 = icmp eq %m2756$.AssignableInfo.type* %.tmp5539, null
br i1 %.tmp5540, label %.if.true.5541, label %.if.false.5541
.if.true.5541:
ret void
br label %.if.end.5541
.if.false.5541:
br label %.if.end.5541
.if.end.5541:
%.tmp5542 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5543 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.5399
%.tmp5544 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5543, i32 0, i32 4
%.tmp5545 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5544
%.tmp5546 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %dest.5532
%.tmp5547 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5546, i32 0, i32 4
%.tmp5548 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5547
%.tmp5549 = call i1(%m2756$.CompilerCtx.type*,%m2756$.Type.type*,%m2756$.Type.type*) @m2757$cmp.b.m2756$.CompilerCtx.typep.m2756$.Type.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5542, %m2756$.Type.type* %.tmp5545, %m2756$.Type.type* %.tmp5548)
%.tmp5550 = icmp eq i1 %.tmp5549, 0
br i1 %.tmp5550, label %.if.true.5551, label %.if.false.5551
.if.true.5551:
%.tmp5553 = getelementptr [1 x i8], [1 x i8]*@.str5552, i32 0, i32 0
%err_buf.5554 = alloca i8*
store i8* %.tmp5553, i8** %err_buf.5554
%.tmp5555 = getelementptr i8*, i8** %err_buf.5554, i32 0
%.tmp5557 = getelementptr [37 x i8], [37 x i8]*@.str5556, i32 0, i32 0
%.tmp5558 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5559 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.5399
%.tmp5560 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5559, i32 0, i32 4
%.tmp5561 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5560
%.tmp5562 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5558, %m2756$.Type.type* %.tmp5561)
%.tmp5563 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5564 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %dest.5532
%.tmp5565 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5564, i32 0, i32 4
%.tmp5566 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5565
%.tmp5567 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5563, %m2756$.Type.type* %.tmp5566)
%.tmp5568 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5555, i8* %.tmp5557, i8* %.tmp5562, i8* %.tmp5567)
%.tmp5569 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5570 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5571 = load i8*, i8** %err_buf.5554
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp5569, %m980$.Node.type* %.tmp5570, i8* %.tmp5571)
br label %.if.end.5551
.if.false.5551:
br label %.if.end.5551
.if.end.5551:
%.tmp5572 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5573 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %dest.5532
%.tmp5574 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5573, i32 0, i32 4
%.tmp5575 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5574
%.tmp5576 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5572, %m2756$.Type.type* %.tmp5575)
%dest_tr.5577 = alloca i8*
store i8* %.tmp5576, i8** %dest_tr.5577
%.tmp5578 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5579 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.5399
%.tmp5580 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5579, i32 0, i32 4
%.tmp5581 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5580
%.tmp5582 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp5578, %m2756$.Type.type* %.tmp5581)
%src_tr.5583 = alloca i8*
store i8* %.tmp5582, i8** %src_tr.5583
%.tmp5584 = load i8*, i8** %src_tr.5583
%.tmp5586 = getelementptr [4 x i8], [4 x i8]*@.str5585, i32 0, i32 0
%.tmp5587 = call i32(i8*,i8*) @strcmp(i8* %.tmp5584, i8* %.tmp5586)
%.tmp5588 = icmp eq i32 %.tmp5587, 0
br i1 %.tmp5588, label %.if.true.5589, label %.if.false.5589
.if.true.5589:
%.tmp5590 = load i8*, i8** %dest_tr.5577
store i8* %.tmp5590, i8** %src_tr.5583
br label %.if.end.5589
.if.false.5589:
br label %.if.end.5589
.if.end.5589:
%.tmp5591 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5592 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp5591, i32 0, i32 1
%.tmp5593 = load %m0$.File.type*, %m0$.File.type** %.tmp5592
%.tmp5595 = getelementptr [21 x i8], [21 x i8]*@.str5594, i32 0, i32 0
%.tmp5596 = load i8*, i8** %src_tr.5583
%.tmp5597 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.5399
%.tmp5598 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp5597)
%.tmp5599 = load i8*, i8** %dest_tr.5577
%.tmp5600 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %dest.5532
%.tmp5601 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp5600)
%.tmp5602 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5593, i8* %.tmp5595, i8* %.tmp5596, i8* %.tmp5598, i8* %.tmp5599, i8* %.tmp5601)
br label %.if.end.5520
.if.false.5520:
%.tmp5603 = load i8*, i8** %expr_type.5394
%.tmp5605 = getelementptr [9 x i8], [9 x i8]*@.str5604, i32 0, i32 0
%.tmp5606 = call i32(i8*,i8*) @strcmp(i8* %.tmp5603, i8* %.tmp5605)
%.tmp5607 = icmp eq i32 %.tmp5606, 0
br i1 %.tmp5607, label %.if.true.5608, label %.if.false.5608
.if.true.5608:
%.tmp5609 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5610 = load %m980$.Node.type*, %m980$.Node.type** %stmt
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_if_block.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp5609, %m980$.Node.type* %.tmp5610)
br label %.if.end.5608
.if.false.5608:
%.tmp5611 = load i8*, i8** %expr_type.5394
%.tmp5613 = getelementptr [9 x i8], [9 x i8]*@.str5612, i32 0, i32 0
%.tmp5614 = call i32(i8*,i8*) @strcmp(i8* %.tmp5611, i8* %.tmp5613)
%.tmp5615 = icmp eq i32 %.tmp5614, 0
br i1 %.tmp5615, label %.if.true.5616, label %.if.false.5616
.if.true.5616:
%.tmp5617 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5618 = load %m980$.Node.type*, %m980$.Node.type** %stmt
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_for_loop.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp5617, %m980$.Node.type* %.tmp5618)
br label %.if.end.5616
.if.false.5616:
%.tmp5619 = load i8*, i8** %expr_type.5394
%.tmp5621 = getelementptr [8 x i8], [8 x i8]*@.str5620, i32 0, i32 0
%.tmp5622 = call i32(i8*,i8*) @strcmp(i8* %.tmp5619, i8* %.tmp5621)
%.tmp5623 = icmp eq i32 %.tmp5622, 0
br i1 %.tmp5623, label %.if.true.5624, label %.if.false.5624
.if.true.5624:
%.tmp5625 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5627 = getelementptr [4 x i8], [4 x i8]*@.str5626, i32 0, i32 0
%.tmp5628 = call %m2756$.Scope.type*(%m2756$.CompilerCtx.type*,i8*) @m295$get_scope.m2756$.Scope.typep.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.tmp5625, i8* %.tmp5627)
%for_scope.5629 = alloca %m2756$.Scope.type*
store %m2756$.Scope.type* %.tmp5628, %m2756$.Scope.type** %for_scope.5629
%.tmp5630 = load %m2756$.Scope.type*, %m2756$.Scope.type** %for_scope.5629
%.tmp5631 = icmp eq %m2756$.Scope.type* %.tmp5630, null
br i1 %.tmp5631, label %.if.true.5632, label %.if.false.5632
.if.true.5632:
%.tmp5634 = getelementptr [1 x i8], [1 x i8]*@.str5633, i32 0, i32 0
%buf.5635 = alloca i8*
store i8* %.tmp5634, i8** %buf.5635
%.tmp5636 = getelementptr i8*, i8** %buf.5635, i32 0
%.tmp5638 = getelementptr [42 x i8], [42 x i8]*@.str5637, i32 0, i32 0
%.tmp5639 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5640 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5639, i32 0, i32 7
%.tmp5641 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5640
%.tmp5642 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5641, i32 0, i32 1
%.tmp5643 = load i8*, i8** %.tmp5642
%.tmp5644 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5636, i8* %.tmp5638, i8* %.tmp5643)
%.tmp5645 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5646 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5647 = load i8*, i8** %buf.5635
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp5645, %m980$.Node.type* %.tmp5646, i8* %.tmp5647)
ret void
br label %.if.end.5632
.if.false.5632:
br label %.if.end.5632
.if.end.5632:
%.tmp5648 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5649 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5648, i32 0, i32 7
%.tmp5650 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5649
%.tmp5651 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5650, i32 0, i32 1
%.tmp5652 = load i8*, i8** %.tmp5651
%.tmp5654 = getelementptr [6 x i8], [6 x i8]*@.str5653, i32 0, i32 0
%.tmp5655 = call i32(i8*,i8*) @strcmp(i8* %.tmp5652, i8* %.tmp5654)
%.tmp5656 = icmp eq i32 %.tmp5655, 0
br i1 %.tmp5656, label %.if.true.5657, label %.if.false.5657
.if.true.5657:
%.tmp5658 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5659 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp5658, i32 0, i32 1
%.tmp5660 = load %m0$.File.type*, %m0$.File.type** %.tmp5659
%.tmp5662 = getelementptr [15 x i8], [15 x i8]*@.str5661, i32 0, i32 0
%.tmp5663 = load %m2756$.Scope.type*, %m2756$.Scope.type** %for_scope.5629
%.tmp5664 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp5663, i32 0, i32 4
%.tmp5665 = load i8*, i8** %.tmp5664
%.tmp5666 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5660, i8* %.tmp5662, i8* %.tmp5665)
br label %.if.end.5657
.if.false.5657:
%.tmp5667 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5668 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5667, i32 0, i32 7
%.tmp5669 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5668
%.tmp5670 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5669, i32 0, i32 1
%.tmp5671 = load i8*, i8** %.tmp5670
%.tmp5673 = getelementptr [9 x i8], [9 x i8]*@.str5672, i32 0, i32 0
%.tmp5674 = call i32(i8*,i8*) @strcmp(i8* %.tmp5671, i8* %.tmp5673)
%.tmp5675 = icmp eq i32 %.tmp5674, 0
br i1 %.tmp5675, label %.if.true.5676, label %.if.false.5676
.if.true.5676:
%.tmp5677 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5678 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp5677, i32 0, i32 1
%.tmp5679 = load %m0$.File.type*, %m0$.File.type** %.tmp5678
%.tmp5681 = getelementptr [15 x i8], [15 x i8]*@.str5680, i32 0, i32 0
%.tmp5682 = load %m2756$.Scope.type*, %m2756$.Scope.type** %for_scope.5629
%.tmp5683 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp5682, i32 0, i32 3
%.tmp5684 = load i8*, i8** %.tmp5683
%.tmp5685 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5679, i8* %.tmp5681, i8* %.tmp5684)
br label %.if.end.5676
.if.false.5676:
br label %.if.end.5676
.if.end.5676:
br label %.if.end.5657
.if.end.5657:
br label %.if.end.5624
.if.false.5624:
%.tmp5686 = load i8*, i8** %expr_type.5394
%.tmp5688 = getelementptr [9 x i8], [9 x i8]*@.str5687, i32 0, i32 0
%.tmp5689 = call i32(i8*,i8*) @strcmp(i8* %.tmp5686, i8* %.tmp5688)
%.tmp5690 = icmp eq i32 %.tmp5689, 0
br i1 %.tmp5690, label %.if.true.5691, label %.if.false.5691
.if.true.5691:
%.tmp5692 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5693 = load %m980$.Node.type*, %m980$.Node.type** %stmt
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_closure.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp5692, %m980$.Node.type* %.tmp5693)
br label %.if.end.5691
.if.false.5691:
%.tmp5694 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5695 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5697 = getelementptr [34 x i8], [34 x i8]*@.str5696, i32 0, i32 0
%.tmp5698 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp5694, %m980$.Node.type* %.tmp5695, i8* %.tmp5697)
%.tmp5699 = load i8*, i8** %expr_type.5394
%.tmp5700 = call i32(i8*,...) @printf(i8* %.tmp5698, i8* %.tmp5699)
br label %.if.end.5691
.if.end.5691:
br label %.if.end.5624
.if.end.5624:
br label %.if.end.5616
.if.end.5616:
br label %.if.end.5608
.if.end.5608:
br label %.if.end.5520
.if.end.5520:
br label %.if.end.5511
.if.end.5511:
br label %.if.end.5500
.if.end.5500:
br label %.if.end.5494
.if.end.5494:
br label %.if.end.5405
.if.end.5405:
ret void
}
define %m2756$.Scope.type* @m295$get_scope.m2756$.Scope.typep.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.ctx.arg, i8* %.scope_type.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%scope_type = alloca i8*
store i8* %.scope_type.arg, i8** %scope_type
%.tmp5701 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5702 = call %m2756$.ModuleLookup.type*(%m2756$.CompilerCtx.type*) @m295$get_current_module.m2756$.ModuleLookup.typep.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp5701)
%mod.5703 = alloca %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* %.tmp5702, %m2756$.ModuleLookup.type** %mod.5703
%.tmp5705 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.5703
%.tmp5706 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp5705, i32 0, i32 3
%.tmp5707 = load %m2756$.Scope.type*, %m2756$.Scope.type** %.tmp5706
%s.5708 = alloca %m2756$.Scope.type*
store %m2756$.Scope.type* %.tmp5707, %m2756$.Scope.type** %s.5708
br label %.for.start.5704
.for.start.5704:
%.tmp5709 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.5708
%.tmp5710 = icmp ne %m2756$.Scope.type* %.tmp5709, null
br i1 %.tmp5710, label %.for.continue.5704, label %.for.end.5704
.for.continue.5704:
%.tmp5711 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.5708
%.tmp5712 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp5711, i32 0, i32 2
%.tmp5713 = load i8*, i8** %.tmp5712
%.tmp5714 = load i8*, i8** %scope_type
%.tmp5715 = call i32(i8*,i8*) @strcmp(i8* %.tmp5713, i8* %.tmp5714)
%.tmp5716 = icmp eq i32 %.tmp5715, 0
br i1 %.tmp5716, label %.if.true.5717, label %.if.false.5717
.if.true.5717:
%.tmp5718 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.5708
ret %m2756$.Scope.type* %.tmp5718
br label %.if.end.5717
.if.false.5717:
br label %.if.end.5717
.if.end.5717:
%.tmp5719 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.5708
%.tmp5720 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp5719, i32 0, i32 5
%.tmp5721 = load %m2756$.Scope.type*, %m2756$.Scope.type** %.tmp5720
store %m2756$.Scope.type* %.tmp5721, %m2756$.Scope.type** %s.5708
br label %.for.start.5704
.for.end.5704:
%.tmp5722 = bitcast ptr null to %m2756$.Scope.type*
ret %m2756$.Scope.type* %.tmp5722
}
define %m2756$.Type.type* @m295$type_ptr_of_chr.m2756$.Type.typep() {
%.tmp5723 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%t.5724 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp5723, %m2756$.Type.type** %t.5724
%.tmp5725 = load %m2756$.Type.type*, %m2756$.Type.type** %t.5724
%.tmp5726 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5725, i32 0, i32 0
%.tmp5728 = getelementptr [4 x i8], [4 x i8]*@.str5727, i32 0, i32 0
store i8* %.tmp5728, i8** %.tmp5726
%.tmp5729 = load %m2756$.Type.type*, %m2756$.Type.type** %t.5724
%.tmp5730 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5729, i32 0, i32 3
%.tmp5731 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5731, %m2756$.Type.type** %.tmp5730
%.tmp5732 = load %m2756$.Type.type*, %m2756$.Type.type** %t.5724
%.tmp5733 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5732, i32 0, i32 3
%.tmp5734 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5733
%.tmp5735 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5734, i32 0, i32 0
%.tmp5737 = getelementptr [4 x i8], [4 x i8]*@.str5736, i32 0, i32 0
store i8* %.tmp5737, i8** %.tmp5735
%.tmp5738 = load %m2756$.Type.type*, %m2756$.Type.type** %t.5724
ret %m2756$.Type.type* %.tmp5738
}
define void @m295$compile_closure.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp5739 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5740 = call i32(%m2756$.CompilerCtx.type*) @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp5739)
%cj_id.5741 = alloca i32
store i32 %.tmp5740, i32* %cj_id.5741
%.tmp5742 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5743 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5742)
%info_lit.5744 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp5743, %m2756$.AssignableInfo.type** %info_lit.5744
%.tmp5745 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lit.5744
%.tmp5746 = load i8, i8* @SCOPE_GLOBAL
%.tmp5748 = getelementptr [21 x i8], [21 x i8]*@.str5747, i32 0, i32 0
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp5745, i8 %.tmp5746, i8* %.tmp5748)
%.tmp5749 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lit.5744
%.tmp5750 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5749, i32 0, i32 4
%.tmp5751 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5751, %m2756$.Type.type** %.tmp5750
%.tmp5752 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lit.5744
%.tmp5753 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5752, i32 0, i32 4
%.tmp5754 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5753
%.tmp5755 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5754, i32 0, i32 0
%.tmp5757 = getelementptr [9 x i8], [9 x i8]*@.str5756, i32 0, i32 0
store i8* %.tmp5757, i8** %.tmp5755
%.tmp5758 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lit.5744
%.tmp5759 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5758, i32 0, i32 4
%.tmp5760 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5759
%.tmp5761 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5760, i32 0, i32 3
%.tmp5762 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5762, %m2756$.Type.type** %.tmp5761
%.tmp5763 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lit.5744
%.tmp5764 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5763, i32 0, i32 4
%.tmp5765 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5764
%.tmp5766 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5765, i32 0, i32 3
%.tmp5767 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5766
%.tmp5768 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5767, i32 0, i32 0
%.tmp5770 = getelementptr [5 x i8], [5 x i8]*@.str5769, i32 0, i32 0
store i8* %.tmp5770, i8** %.tmp5768
%.tmp5771 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lit.5744
%.tmp5772 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5771, i32 0, i32 4
%.tmp5773 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5772
%.tmp5774 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5773, i32 0, i32 3
%.tmp5775 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5774
%.tmp5776 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5775, i32 0, i32 4
%.tmp5777 = call %m2756$.Type.type*() @m295$type_ptr_of_chr.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5777, %m2756$.Type.type** %.tmp5776
%.tmp5778 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lit.5744
%.tmp5779 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5778, i32 0, i32 4
%.tmp5780 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5779
%.tmp5781 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5780, i32 0, i32 3
%.tmp5782 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5781
%.tmp5783 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5782, i32 0, i32 4
%.tmp5784 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5783
%.tmp5785 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5784, i32 0, i32 4
%.tmp5786 = call %m2756$.Type.type*() @m295$type_ptr_of_chr.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5786, %m2756$.Type.type** %.tmp5785
%.tmp5787 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lit.5744
%.tmp5788 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5787, i32 0, i32 4
%.tmp5789 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5788
%.tmp5790 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5789, i32 0, i32 3
%.tmp5791 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5790
%.tmp5792 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5791, i32 0, i32 4
%.tmp5793 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5792
%.tmp5794 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5793, i32 0, i32 4
%.tmp5795 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5794
%.tmp5796 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5795, i32 0, i32 4
%.tmp5797 = call %m2756$.Type.type*() @m295$type_ptr_of_chr.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5797, %m2756$.Type.type** %.tmp5796
%.tmp5798 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5800 = getelementptr [21 x i8], [21 x i8]*@.str5799, i32 0, i32 0
%.tmp5802 = getelementptr [7 x i8], [7 x i8]*@.str5801, i32 0, i32 0
%.tmp5803 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lit.5744
call void(%m2756$.CompilerCtx.type*,i8*,i8*,%m2756$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2756$.CompilerCtx.typep.cp.cp.m2756$.AssignableInfo.typep.b.b(%m2756$.CompilerCtx.type* %.tmp5798, i8* %.tmp5800, i8* %.tmp5802, %m2756$.AssignableInfo.type* %.tmp5803, i1 1, i1 0)
%.tmp5804 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5805 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5804)
%info_lat.5806 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp5805, %m2756$.AssignableInfo.type** %info_lat.5806
%.tmp5807 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lat.5806
%.tmp5808 = load i8, i8* @SCOPE_GLOBAL
%.tmp5810 = getelementptr [23 x i8], [23 x i8]*@.str5809, i32 0, i32 0
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp5807, i8 %.tmp5808, i8* %.tmp5810)
%.tmp5811 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lat.5806
%.tmp5812 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5811, i32 0, i32 4
%.tmp5813 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5813, %m2756$.Type.type** %.tmp5812
%.tmp5814 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lat.5806
%.tmp5815 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5814, i32 0, i32 4
%.tmp5816 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5815
%.tmp5817 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5816, i32 0, i32 0
%.tmp5819 = getelementptr [9 x i8], [9 x i8]*@.str5818, i32 0, i32 0
store i8* %.tmp5819, i8** %.tmp5817
%.tmp5820 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lat.5806
%.tmp5821 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5820, i32 0, i32 4
%.tmp5822 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5821
%.tmp5823 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5822, i32 0, i32 3
%.tmp5824 = call %m2756$.Type.type*() @m295$type_ptr_of_chr.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5824, %m2756$.Type.type** %.tmp5823
%.tmp5825 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lat.5806
%.tmp5826 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5825, i32 0, i32 4
%.tmp5827 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5826
%.tmp5828 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5827, i32 0, i32 3
%.tmp5829 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5828
%.tmp5830 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5829, i32 0, i32 4
%.tmp5831 = call %m2756$.Type.type*() @m295$type_ptr_of_chr.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5831, %m2756$.Type.type** %.tmp5830
%.tmp5832 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5834 = getelementptr [23 x i8], [23 x i8]*@.str5833, i32 0, i32 0
%.tmp5836 = getelementptr [7 x i8], [7 x i8]*@.str5835, i32 0, i32 0
%.tmp5837 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_lat.5806
call void(%m2756$.CompilerCtx.type*,i8*,i8*,%m2756$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2756$.CompilerCtx.typep.cp.cp.m2756$.AssignableInfo.typep.b.b(%m2756$.CompilerCtx.type* %.tmp5832, i8* %.tmp5834, i8* %.tmp5836, %m2756$.AssignableInfo.type* %.tmp5837, i1 1, i1 0)
%.tmp5838 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5839 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5838)
%info_mmap.5840 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp5839, %m2756$.AssignableInfo.type** %info_mmap.5840
%.tmp5841 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_mmap.5840
%.tmp5842 = load i8, i8* @SCOPE_GLOBAL
%.tmp5844 = getelementptr [5 x i8], [5 x i8]*@.str5843, i32 0, i32 0
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp5841, i8 %.tmp5842, i8* %.tmp5844)
%.tmp5845 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_mmap.5840
%.tmp5846 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5845, i32 0, i32 4
%.tmp5847 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5847, %m2756$.Type.type** %.tmp5846
%.tmp5848 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_mmap.5840
%.tmp5849 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5848, i32 0, i32 4
%.tmp5850 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5849
%.tmp5851 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5850, i32 0, i32 0
%.tmp5853 = getelementptr [9 x i8], [9 x i8]*@.str5852, i32 0, i32 0
store i8* %.tmp5853, i8** %.tmp5851
%.tmp5854 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_mmap.5840
%.tmp5855 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5854, i32 0, i32 4
%.tmp5856 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5855
%.tmp5857 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5856, i32 0, i32 3
%.tmp5858 = call %m2756$.Type.type*() @m295$type_ptr_of_chr.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5858, %m2756$.Type.type** %.tmp5857
%.tmp5859 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_mmap.5840
%.tmp5860 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5859, i32 0, i32 4
%.tmp5861 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5860
%.tmp5862 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5861, i32 0, i32 3
%.tmp5863 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5862
%lt.5864 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp5863, %m2756$.Type.type** %lt.5864
%.tmp5865 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5866 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5865, i32 0, i32 4
%.tmp5867 = call %m2756$.Type.type*() @m295$type_ptr_of_chr.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5867, %m2756$.Type.type** %.tmp5866
%.tmp5868 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5869 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5868, i32 0, i32 4
%.tmp5870 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5869
store %m2756$.Type.type* %.tmp5870, %m2756$.Type.type** %lt.5864
%.tmp5871 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5872 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5871, i32 0, i32 4
%.tmp5873 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5873, %m2756$.Type.type** %.tmp5872
%.tmp5874 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5875 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5874, i32 0, i32 4
%.tmp5876 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5875
%.tmp5877 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5876, i32 0, i32 0
%.tmp5879 = getelementptr [4 x i8], [4 x i8]*@.str5878, i32 0, i32 0
store i8* %.tmp5879, i8** %.tmp5877
%.tmp5880 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5881 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5880, i32 0, i32 4
%.tmp5882 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5881
store %m2756$.Type.type* %.tmp5882, %m2756$.Type.type** %lt.5864
%.tmp5883 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5884 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5883, i32 0, i32 4
%.tmp5885 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5885, %m2756$.Type.type** %.tmp5884
%.tmp5886 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5887 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5886, i32 0, i32 4
%.tmp5888 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5887
%.tmp5889 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5888, i32 0, i32 0
%.tmp5891 = getelementptr [4 x i8], [4 x i8]*@.str5890, i32 0, i32 0
store i8* %.tmp5891, i8** %.tmp5889
%.tmp5892 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5893 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5892, i32 0, i32 4
%.tmp5894 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5893
store %m2756$.Type.type* %.tmp5894, %m2756$.Type.type** %lt.5864
%.tmp5895 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5896 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5895, i32 0, i32 4
%.tmp5897 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5897, %m2756$.Type.type** %.tmp5896
%.tmp5898 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5899 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5898, i32 0, i32 4
%.tmp5900 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5899
%.tmp5901 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5900, i32 0, i32 0
%.tmp5903 = getelementptr [4 x i8], [4 x i8]*@.str5902, i32 0, i32 0
store i8* %.tmp5903, i8** %.tmp5901
%.tmp5904 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5905 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5904, i32 0, i32 4
%.tmp5906 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5905
store %m2756$.Type.type* %.tmp5906, %m2756$.Type.type** %lt.5864
%.tmp5907 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5908 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5907, i32 0, i32 4
%.tmp5909 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5909, %m2756$.Type.type** %.tmp5908
%.tmp5910 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5911 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5910, i32 0, i32 4
%.tmp5912 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5911
%.tmp5913 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5912, i32 0, i32 0
%.tmp5915 = getelementptr [4 x i8], [4 x i8]*@.str5914, i32 0, i32 0
store i8* %.tmp5915, i8** %.tmp5913
%.tmp5916 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5917 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5916, i32 0, i32 4
%.tmp5918 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5917
store %m2756$.Type.type* %.tmp5918, %m2756$.Type.type** %lt.5864
%.tmp5919 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5920 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5919, i32 0, i32 4
%.tmp5921 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5921, %m2756$.Type.type** %.tmp5920
%.tmp5922 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5923 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5922, i32 0, i32 4
%.tmp5924 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5923
%.tmp5925 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5924, i32 0, i32 0
%.tmp5927 = getelementptr [4 x i8], [4 x i8]*@.str5926, i32 0, i32 0
store i8* %.tmp5927, i8** %.tmp5925
%.tmp5928 = load %m2756$.Type.type*, %m2756$.Type.type** %lt.5864
%.tmp5929 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5928, i32 0, i32 4
%.tmp5930 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5929
store %m2756$.Type.type* %.tmp5930, %m2756$.Type.type** %lt.5864
%.tmp5931 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5933 = getelementptr [5 x i8], [5 x i8]*@.str5932, i32 0, i32 0
%.tmp5935 = getelementptr [7 x i8], [7 x i8]*@.str5934, i32 0, i32 0
%.tmp5936 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info_mmap.5840
call void(%m2756$.CompilerCtx.type*,i8*,i8*,%m2756$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2756$.CompilerCtx.typep.cp.cp.m2756$.AssignableInfo.typep.b.b(%m2756$.CompilerCtx.type* %.tmp5931, i8* %.tmp5933, i8* %.tmp5935, %m2756$.AssignableInfo.type* %.tmp5936, i1 1, i1 0)
%.tmp5937 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5938 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5937, i32 0, i32 7
%.tmp5939 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5938
%.tmp5941 = getelementptr [5 x i8], [5 x i8]*@.str5940, i32 0, i32 0
%.tmp5942 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5939, i8* %.tmp5941)
%fn_name_node.5943 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp5942, %m980$.Node.type** %fn_name_node.5943
%.tmp5944 = load %m980$.Node.type*, %m980$.Node.type** %fn_name_node.5943
%.tmp5945 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5944, i32 0, i32 1
%.tmp5946 = load i8*, i8** %.tmp5945
%fn_name.5947 = alloca i8*
store i8* %.tmp5946, i8** %fn_name.5947
%.tmp5948 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5949 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5948)
%info.5950 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp5949, %m2756$.AssignableInfo.type** %info.5950
%.tmp5951 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5950
%.tmp5952 = load i8, i8* @SCOPE_LOCAL
%.tmp5953 = load i8*, i8** %fn_name.5947
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp5951, i8 %.tmp5952, i8* %.tmp5953)
%.tmp5954 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5950
%.tmp5955 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5954, i32 0, i32 4
%.tmp5956 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5957 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5958 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5957, i32 0, i32 7
%.tmp5959 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5958
%.tmp5960 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$syn_function_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp5956, %m980$.Node.type* %.tmp5959)
store %m2756$.Type.type* %.tmp5960, %m2756$.Type.type** %.tmp5955
%.tmp5961 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5950
%.tmp5962 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5961, i32 0, i32 3
%.tmp5964 = getelementptr [9 x i8], [9 x i8]*@.str5963, i32 0, i32 0
store i8* %.tmp5964, i8** %.tmp5962
%.tmp5965 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5966 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5967 = load i8*, i8** %fn_name.5947
%.tmp5968 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5950
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2756$.AssignableInfo.type*) @m295$define_assignable.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp5965, %m980$.Node.type* %.tmp5966, i8* %.tmp5967, %m2756$.AssignableInfo.type* %.tmp5968)
%.tmp5969 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp5970 = call i32(%m2756$.CompilerCtx.type*) @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp5969)
%closure_id.5971 = alloca i32
store i32 %.tmp5970, i32* %closure_id.5971
%.tmp5972 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5950
%.tmp5973 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp5972, i32 0, i32 4
%.tmp5974 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5973
%.tmp5975 = call %m2756$.Type.type*(%m2756$.Type.type*) @m295$type_clone.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.tmp5974)
%closure_type.5976 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp5975, %m2756$.Type.type** %closure_type.5976
%.tmp5977 = load %m2756$.Type.type*, %m2756$.Type.type** %closure_type.5976
%.tmp5978 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5977, i32 0, i32 3
%.tmp5979 = load %m2756$.Type.type*, %m2756$.Type.type** %closure_type.5976
%.tmp5980 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5979, i32 0, i32 3
%.tmp5981 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5980
%.tmp5982 = call %m2756$.Type.type*(%m2756$.Type.type*) @m295$type_clone.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.tmp5981)
store %m2756$.Type.type* %.tmp5982, %m2756$.Type.type** %.tmp5978
%.tmp5983 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%ctx_param.5984 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp5983, %m2756$.Type.type** %ctx_param.5984
%.tmp5985 = load %m2756$.Type.type*, %m2756$.Type.type** %ctx_param.5984
%.tmp5986 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5985, i32 0, i32 0
%.tmp5988 = getelementptr [4 x i8], [4 x i8]*@.str5987, i32 0, i32 0
store i8* %.tmp5988, i8** %.tmp5986
%.tmp5989 = load %m2756$.Type.type*, %m2756$.Type.type** %ctx_param.5984
%.tmp5990 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5989, i32 0, i32 3
%.tmp5991 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp5991, %m2756$.Type.type** %.tmp5990
%.tmp5992 = load %m2756$.Type.type*, %m2756$.Type.type** %ctx_param.5984
%.tmp5993 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5992, i32 0, i32 3
%.tmp5994 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp5993
%.tmp5995 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5994, i32 0, i32 0
%.tmp5997 = getelementptr [7 x i8], [7 x i8]*@.str5996, i32 0, i32 0
store i8* %.tmp5997, i8** %.tmp5995
%.tmp5998 = load %m2756$.Type.type*, %m2756$.Type.type** %ctx_param.5984
%.tmp5999 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp5998, i32 0, i32 4
%.tmp6000 = load %m2756$.Type.type*, %m2756$.Type.type** %closure_type.5976
%.tmp6001 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6000, i32 0, i32 3
%.tmp6002 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6001
%.tmp6003 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6002, i32 0, i32 4
%.tmp6004 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6003
store %m2756$.Type.type* %.tmp6004, %m2756$.Type.type** %.tmp5999
%.tmp6005 = load %m2756$.Type.type*, %m2756$.Type.type** %closure_type.5976
%.tmp6006 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6005, i32 0, i32 3
%.tmp6007 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6006
%.tmp6008 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6007, i32 0, i32 4
%.tmp6009 = load %m2756$.Type.type*, %m2756$.Type.type** %ctx_param.5984
store %m2756$.Type.type* %.tmp6009, %m2756$.Type.type** %.tmp6008
%.tmp6011 = getelementptr [1 x i8], [1 x i8]*@.str6010, i32 0, i32 0
%closure_name.6012 = alloca i8*
store i8* %.tmp6011, i8** %closure_name.6012
%.tmp6013 = getelementptr i8*, i8** %closure_name.6012, i32 0
%.tmp6015 = getelementptr [5 x i8], [5 x i8]*@.str6014, i32 0, i32 0
%.tmp6016 = load i32, i32* %closure_id.5971
%.tmp6017 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6013, i8* %.tmp6015, i32 %.tmp6016)
%.tmp6018 = load %m2756$.Type.type*, %m2756$.Type.type** %closure_type.5976
%.tmp6019 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6018, i32 0, i32 3
%.tmp6020 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6019
%.tmp6021 = call %m2756$.Type.type*(%m2756$.Type.type*) @m295$type_clone.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.tmp6020)
%ret_type.6022 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp6021, %m2756$.Type.type** %ret_type.6022
%.tmp6023 = load %m2756$.Type.type*, %m2756$.Type.type** %ret_type.6022
%.tmp6024 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6023, i32 0, i32 3
store %m2756$.Type.type* null, %m2756$.Type.type** %.tmp6024
%.tmp6025 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6026 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6025, i32 0, i32 1
%.tmp6027 = load %m0$.File.type*, %m0$.File.type** %.tmp6026
%.tmp6029 = getelementptr [101 x i8], [101 x i8]*@.str6028, i32 0, i32 0
%.tmp6030 = load i32, i32* %closure_id.5971
%.tmp6031 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6027, i8* %.tmp6029, i32 %.tmp6030)
%.tmp6032 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6033 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6032, i32 0, i32 1
%.tmp6034 = load %m0$.File.type*, %m0$.File.type** %.tmp6033
%.tmp6036 = getelementptr [100 x i8], [100 x i8]*@.str6035, i32 0, i32 0
%.tmp6037 = load i32, i32* %closure_id.5971
%.tmp6038 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6039 = load %m2756$.Type.type*, %m2756$.Type.type** %closure_type.5976
%.tmp6040 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6038, %m2756$.Type.type* %.tmp6039)
%.tmp6041 = load i8*, i8** %closure_name.6012
%.tmp6042 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6034, i8* %.tmp6036, i32 %.tmp6037, i8* %.tmp6040, i8* %.tmp6041)
%.tmp6043 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6044 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6043, i32 0, i32 1
%.tmp6045 = load %m0$.File.type*, %m0$.File.type** %.tmp6044
%.tmp6047 = getelementptr [66 x i8], [66 x i8]*@.str6046, i32 0, i32 0
%.tmp6048 = load i32, i32* %closure_id.5971
%.tmp6049 = load i32, i32* %closure_id.5971
%.tmp6050 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6045, i8* %.tmp6047, i32 %.tmp6048, i32 %.tmp6049)
%.tmp6051 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6052 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6051, i32 0, i32 1
%.tmp6053 = load %m0$.File.type*, %m0$.File.type** %.tmp6052
%.tmp6055 = getelementptr [35 x i8], [35 x i8]*@.str6054, i32 0, i32 0
%.tmp6056 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5950
%.tmp6057 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp6056)
%.tmp6058 = load i32, i32* %closure_id.5971
%.tmp6059 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6060 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.5950
%.tmp6061 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6060, i32 0, i32 4
%.tmp6062 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6061
%.tmp6063 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6059, %m2756$.Type.type* %.tmp6062)
%.tmp6064 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6053, i8* %.tmp6055, i8* %.tmp6057, i32 %.tmp6058, i8* %.tmp6063)
%.tmp6065 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6066 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6065, i32 0, i32 1
%.tmp6067 = load %m0$.File.type*, %m0$.File.type** %.tmp6066
%bkp_ctx.6068 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6067, %m0$.File.type** %bkp_ctx.6068
%.tmp6069 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6070 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6069, i32 0, i32 1
%.tmp6071 = call %m0$.File.type*() @tmpfile()
store %m0$.File.type* %.tmp6071, %m0$.File.type** %.tmp6070
%.tmp6072 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6073 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6072, i32 0, i32 1
%.tmp6074 = load %m0$.File.type*, %m0$.File.type** %.tmp6073
%.tmp6076 = getelementptr [14 x i8], [14 x i8]*@.str6075, i32 0, i32 0
%.tmp6077 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6078 = load %m2756$.Type.type*, %m2756$.Type.type** %ret_type.6022
%.tmp6079 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6077, %m2756$.Type.type* %.tmp6078)
%.tmp6080 = load i8*, i8** %closure_name.6012
%.tmp6081 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6074, i8* %.tmp6076, i8* %.tmp6079, i8* %.tmp6080)
%.tmp6082 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6084 = getelementptr [9 x i8], [9 x i8]*@.str6083, i32 0, i32 0
%.tmp6085 = bitcast ptr null to i8*
%.tmp6086 = bitcast ptr null to i8*
%.tmp6087 = load %m2756$.Type.type*, %m2756$.Type.type** %ret_type.6022
call void(%m2756$.CompilerCtx.type*,i8*,i8*,i8*,%m2756$.Type.type*) @m295$push_scope.v.m2756$.CompilerCtx.typep.cp.cp.cp.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6082, i8* %.tmp6084, i8* %.tmp6085, i8* %.tmp6086, %m2756$.Type.type* %.tmp6087)
%.tmp6088 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6089 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6088, i32 0, i32 1
%.tmp6090 = load %m0$.File.type*, %m0$.File.type** %.tmp6089
%.tmp6092 = getelementptr [13 x i8], [13 x i8]*@.str6091, i32 0, i32 0
%.tmp6093 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6094 = load %m2756$.Type.type*, %m2756$.Type.type** %ctx_param.5984
%.tmp6095 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6093, %m2756$.Type.type* %.tmp6094)
%.tmp6096 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6090, i8* %.tmp6092, i8* %.tmp6095)
%.tmp6097 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6098 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6097, i32 0, i32 7
%.tmp6099 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6098
%.tmp6100 = call %m980$.Node.type*(%m980$.Node.type*) @m295$syn_function_params.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.tmp6099)
%params.6101 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6100, %m980$.Node.type** %params.6101
%param_type.6102 = alloca %m2756$.Type.type*
store %m2756$.Type.type* null, %m2756$.Type.type** %param_type.6102
%.tmp6104 = load %m980$.Node.type*, %m980$.Node.type** %params.6101
%param_ptr.6105 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6104, %m980$.Node.type** %param_ptr.6105
br label %.for.start.6103
.for.start.6103:
%.tmp6106 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6105
%.tmp6107 = icmp ne %m980$.Node.type* %.tmp6106, null
br i1 %.tmp6107, label %.for.continue.6103, label %.for.end.6103
.for.continue.6103:
%.tmp6108 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6105
%.tmp6109 = load %m980$.Node.type*, %m980$.Node.type** %params.6101
%.tmp6110 = icmp ne %m980$.Node.type* %.tmp6108, %.tmp6109
br i1 %.tmp6110, label %.if.true.6111, label %.if.false.6111
.if.true.6111:
%.tmp6112 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6105
%.tmp6113 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6112, i32 0, i32 8
%.tmp6114 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6113
store %m980$.Node.type* %.tmp6114, %m980$.Node.type** %param_ptr.6105
br label %.if.end.6111
.if.false.6111:
br label %.if.end.6111
.if.end.6111:
%.tmp6115 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6116 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6115, i32 0, i32 1
%.tmp6117 = load %m0$.File.type*, %m0$.File.type** %.tmp6116
%.tmp6119 = getelementptr [3 x i8], [3 x i8]*@.str6118, i32 0, i32 0
%.tmp6120 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6117, i8* %.tmp6119)
%.tmp6121 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6105
%.tmp6122 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6121, i32 0, i32 0
%.tmp6123 = load i8*, i8** %.tmp6122
%.tmp6125 = getelementptr [5 x i8], [5 x i8]*@.str6124, i32 0, i32 0
%.tmp6126 = call i32(i8*,i8*) @strcmp(i8* %.tmp6123, i8* %.tmp6125)
%.tmp6127 = icmp eq i32 %.tmp6126, 0
br i1 %.tmp6127, label %.if.true.6128, label %.if.false.6128
.if.true.6128:
%.tmp6129 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6130 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6105
%.tmp6131 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6130, i32 0, i32 7
%.tmp6132 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6131
%.tmp6133 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6129, %m980$.Node.type* %.tmp6132)
store %m2756$.Type.type* %.tmp6133, %m2756$.Type.type** %param_type.6102
%.tmp6134 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6105
%.tmp6135 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6134, i32 0, i32 8
%.tmp6136 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6135
store %m980$.Node.type* %.tmp6136, %m980$.Node.type** %param_ptr.6105
br label %.if.end.6128
.if.false.6128:
br label %.if.end.6128
.if.end.6128:
%.tmp6137 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6138 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6137, i32 0, i32 1
%.tmp6139 = load %m0$.File.type*, %m0$.File.type** %.tmp6138
%.tmp6141 = getelementptr [13 x i8], [13 x i8]*@.str6140, i32 0, i32 0
%.tmp6142 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6143 = load %m2756$.Type.type*, %m2756$.Type.type** %param_type.6102
%.tmp6144 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6142, %m2756$.Type.type* %.tmp6143)
%.tmp6145 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6105
%.tmp6146 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6145, i32 0, i32 1
%.tmp6147 = load i8*, i8** %.tmp6146
%.tmp6148 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6139, i8* %.tmp6141, i8* %.tmp6144, i8* %.tmp6147)
%.tmp6149 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6105
%.tmp6150 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6149, i32 0, i32 8
%.tmp6151 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6150
store %m980$.Node.type* %.tmp6151, %m980$.Node.type** %param_ptr.6105
br label %.for.start.6103
.for.end.6103:
%.tmp6152 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6153 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6152, i32 0, i32 1
%.tmp6154 = load %m0$.File.type*, %m0$.File.type** %.tmp6153
%.tmp6156 = getelementptr [5 x i8], [5 x i8]*@.str6155, i32 0, i32 0
%.tmp6157 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6154, i8* %.tmp6156)
%.tmp6158 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6159 = load %m980$.Node.type*, %m980$.Node.type** %params.6101
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_fn_params.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6158, %m980$.Node.type* %.tmp6159)
%.tmp6160 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6161 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6160, i32 0, i32 7
%.tmp6162 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6161
%.tmp6164 = getelementptr [6 x i8], [6 x i8]*@.str6163, i32 0, i32 0
%.tmp6165 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6162, i8* %.tmp6164)
%block.6166 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6165, %m980$.Node.type** %block.6166
%.tmp6167 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6168 = load %m980$.Node.type*, %m980$.Node.type** %block.6166
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6167, %m980$.Node.type* %.tmp6168)
%.tmp6169 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6170 = load %m980$.Node.type*, %m980$.Node.type** %block.6166
%.tmp6171 = load %m2756$.Type.type*, %m2756$.Type.type** %ret_type.6022
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,%m2756$.Type.type*) @m295$check_n_add_implicit_return.v.m2756$.CompilerCtx.typep.m980$.Node.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6169, %m980$.Node.type* %.tmp6170, %m2756$.Type.type* %.tmp6171)
%.tmp6172 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
call void(%m2756$.CompilerCtx.type*) @m295$pop_scope.v.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp6172)
%.tmp6173 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6174 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6173, i32 0, i32 1
%.tmp6175 = load %m0$.File.type*, %m0$.File.type** %.tmp6174
%.tmp6177 = getelementptr [3 x i8], [3 x i8]*@.str6176, i32 0, i32 0
%.tmp6178 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6175, i8* %.tmp6177)
%.tmp6179 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6180 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6179, i32 0, i32 1
%.tmp6181 = load %m0$.File.type*, %m0$.File.type** %.tmp6180
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp6181)
%.tmp6182 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6183 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6182, i32 0, i32 1
%.tmp6184 = load %m0$.File.type*, %m0$.File.type** %.tmp6183
%.tmp6185 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6184)
%.tmp6186 = call i8*(i32) @m1$readall.cp.i(i32 %.tmp6185)
%code.6187 = alloca i8*
store i8* %.tmp6186, i8** %code.6187
%.tmp6188 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6189 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6188, i32 0, i32 1
%.tmp6190 = load %m0$.File.type*, %m0$.File.type** %.tmp6189
%.tmp6191 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp6190)
%.tmp6192 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6193 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6192, i32 0, i32 1
%.tmp6194 = load %m0$.File.type*, %m0$.File.type** %bkp_ctx.6068
store %m0$.File.type* %.tmp6194, %m0$.File.type** %.tmp6193
%.tmp6195 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6196 = load i8*, i8** %code.6187
call void(%m2756$.CompilerCtx.type*,i8*) @m295$append_anon_fn.v.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.tmp6195, i8* %.tmp6196)
ret void
}
define void @m295$check_n_add_implicit_return.v.m2756$.CompilerCtx.typep.m980$.Node.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, %m2756$.Type.type* %.return_type.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%return_type = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.return_type.arg, %m2756$.Type.type** %return_type
%.tmp6197 = bitcast ptr null to %m980$.Node.type*
%li.6198 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6197, %m980$.Node.type** %li.6198
%.tmp6199 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6200 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6199, i32 0, i32 7
%.tmp6201 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6200
%.tmp6203 = getelementptr [12 x i8], [12 x i8]*@.str6202, i32 0, i32 0
%.tmp6204 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6201, i8* %.tmp6203)
%exprs.6205 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6204, %m980$.Node.type** %exprs.6205
%.tmp6207 = load %m980$.Node.type*, %m980$.Node.type** %exprs.6205
%.tmp6208 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6207, i32 0, i32 7
%.tmp6209 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6208
%ci.6210 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6209, %m980$.Node.type** %ci.6210
br label %.for.start.6206
.for.start.6206:
%.tmp6211 = load %m980$.Node.type*, %m980$.Node.type** %ci.6210
%.tmp6212 = icmp ne %m980$.Node.type* %.tmp6211, null
br i1 %.tmp6212, label %.for.continue.6206, label %.for.end.6206
.for.continue.6206:
%.tmp6213 = load %m980$.Node.type*, %m980$.Node.type** %ci.6210
%.tmp6214 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6213, i32 0, i32 7
%.tmp6215 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6214
%.tmp6216 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6215, i32 0, i32 0
%.tmp6217 = load i8*, i8** %.tmp6216
%.tmp6219 = getelementptr [3 x i8], [3 x i8]*@.str6218, i32 0, i32 0
%.tmp6220 = call i32(i8*,i8*) @strcmp(i8* %.tmp6217, i8* %.tmp6219)
%.tmp6221 = icmp ne i32 %.tmp6220, 0
br i1 %.tmp6221, label %.if.true.6222, label %.if.false.6222
.if.true.6222:
%.tmp6223 = load %m980$.Node.type*, %m980$.Node.type** %ci.6210
store %m980$.Node.type* %.tmp6223, %m980$.Node.type** %li.6198
br label %.if.end.6222
.if.false.6222:
br label %.if.end.6222
.if.end.6222:
%.tmp6224 = load %m980$.Node.type*, %m980$.Node.type** %ci.6210
%.tmp6225 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6224, i32 0, i32 8
%.tmp6226 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6225
store %m980$.Node.type* %.tmp6226, %m980$.Node.type** %ci.6210
br label %.for.start.6206
.for.end.6206:
%.tmp6227 = load %m980$.Node.type*, %m980$.Node.type** %li.6198
%.tmp6228 = icmp ne %m980$.Node.type* %.tmp6227, null
br i1 %.tmp6228, label %.if.true.6229, label %.if.false.6229
.if.true.6229:
%.tmp6230 = load %m980$.Node.type*, %m980$.Node.type** %li.6198
%.tmp6231 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6230, i32 0, i32 7
%.tmp6232 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6231
%.tmp6233 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6232, i32 0, i32 0
%.tmp6234 = load i8*, i8** %.tmp6233
%.tmp6236 = getelementptr [7 x i8], [7 x i8]*@.str6235, i32 0, i32 0
%.tmp6237 = call i32(i8*,i8*) @strcmp(i8* %.tmp6234, i8* %.tmp6236)
%.tmp6238 = icmp eq i32 %.tmp6237, 0
br i1 %.tmp6238, label %.if.true.6239, label %.if.false.6239
.if.true.6239:
ret void
br label %.if.end.6239
.if.false.6239:
br label %.if.end.6239
.if.end.6239:
br label %.if.end.6229
.if.false.6229:
br label %.if.end.6229
.if.end.6229:
%.tmp6240 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6241 = load %m2756$.Type.type*, %m2756$.Type.type** %return_type
%.tmp6242 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6240, %m2756$.Type.type* %.tmp6241)
%.tmp6244 = getelementptr [5 x i8], [5 x i8]*@.str6243, i32 0, i32 0
%.tmp6245 = call i32(i8*,i8*) @strcmp(i8* %.tmp6242, i8* %.tmp6244)
%.tmp6246 = icmp ne i32 %.tmp6245, 0
br i1 %.tmp6246, label %.if.true.6247, label %.if.false.6247
.if.true.6247:
%.tmp6248 = load %m980$.Node.type*, %m980$.Node.type** %li.6198
%.tmp6249 = icmp ne %m980$.Node.type* %.tmp6248, null
br i1 %.tmp6249, label %.if.true.6250, label %.if.false.6250
.if.true.6250:
%.tmp6251 = load %m980$.Node.type*, %m980$.Node.type** %li.6198
store %m980$.Node.type* %.tmp6251, %m980$.Node.type** %stmt
br label %.if.end.6250
.if.false.6250:
br label %.if.end.6250
.if.end.6250:
%.tmp6252 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6253 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6255 = getelementptr [21 x i8], [21 x i8]*@.str6254, i32 0, i32 0
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp6252, %m980$.Node.type* %.tmp6253, i8* %.tmp6255)
br label %.if.end.6247
.if.false.6247:
%.tmp6256 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6257 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6256, i32 0, i32 1
%.tmp6258 = load %m0$.File.type*, %m0$.File.type** %.tmp6257
%.tmp6260 = getelementptr [10 x i8], [10 x i8]*@.str6259, i32 0, i32 0
%.tmp6261 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6258, i8* %.tmp6260)
br label %.if.end.6247
.if.end.6247:
ret void
}
define void @m295$compile_for_loop.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp6262 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6263 = call i32(%m2756$.CompilerCtx.type*) @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp6262)
%for_id.6264 = alloca i32
store i32 %.tmp6263, i32* %for_id.6264
%.tmp6265 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6266 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6265, i32 0, i32 7
%.tmp6267 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6266
%.tmp6268 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6267, i32 0, i32 8
%.tmp6269 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6268
%init_stmt.6270 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6269, %m980$.Node.type** %init_stmt.6270
%.tmp6271 = bitcast ptr null to i8*
%begin_lbl.6272 = alloca i8*
store i8* %.tmp6271, i8** %begin_lbl.6272
%.tmp6273 = bitcast ptr null to i8*
%end_lbl.6274 = alloca i8*
store i8* %.tmp6273, i8** %end_lbl.6274
%.tmp6275 = getelementptr i8*, i8** %begin_lbl.6272, i32 0
%.tmp6277 = getelementptr [14 x i8], [14 x i8]*@.str6276, i32 0, i32 0
%.tmp6278 = load i32, i32* %for_id.6264
%.tmp6279 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6275, i8* %.tmp6277, i32 %.tmp6278)
%.tmp6280 = getelementptr i8*, i8** %end_lbl.6274, i32 0
%.tmp6282 = getelementptr [12 x i8], [12 x i8]*@.str6281, i32 0, i32 0
%.tmp6283 = load i32, i32* %for_id.6264
%.tmp6284 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6280, i8* %.tmp6282, i32 %.tmp6283)
%.tmp6285 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6287 = getelementptr [4 x i8], [4 x i8]*@.str6286, i32 0, i32 0
%.tmp6288 = load i8*, i8** %begin_lbl.6272
%.tmp6289 = load i8*, i8** %end_lbl.6274
%.tmp6290 = bitcast ptr null to %m2756$.Type.type*
call void(%m2756$.CompilerCtx.type*,i8*,i8*,i8*,%m2756$.Type.type*) @m295$push_scope.v.m2756$.CompilerCtx.typep.cp.cp.cp.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6285, i8* %.tmp6287, i8* %.tmp6288, i8* %.tmp6289, %m2756$.Type.type* %.tmp6290)
%.tmp6291 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6270
%.tmp6292 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6291, i32 0, i32 0
%.tmp6293 = load i8*, i8** %.tmp6292
%.tmp6295 = getelementptr [12 x i8], [12 x i8]*@.str6294, i32 0, i32 0
%.tmp6296 = call i32(i8*,i8*) @strcmp(i8* %.tmp6293, i8* %.tmp6295)
%.tmp6297 = icmp eq i32 %.tmp6296, 0
br i1 %.tmp6297, label %.if.true.6298, label %.if.false.6298
.if.true.6298:
%.tmp6299 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6300 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6270
%.tmp6301 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_declaration.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6299, %m980$.Node.type* %.tmp6300)
br label %.if.end.6298
.if.false.6298:
%.tmp6302 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6270
%.tmp6303 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6302, i32 0, i32 0
%.tmp6304 = load i8*, i8** %.tmp6303
%.tmp6306 = getelementptr [11 x i8], [11 x i8]*@.str6305, i32 0, i32 0
%.tmp6307 = call i32(i8*,i8*) @strcmp(i8* %.tmp6304, i8* %.tmp6306)
%.tmp6308 = icmp eq i32 %.tmp6307, 0
br i1 %.tmp6308, label %.if.true.6309, label %.if.false.6309
.if.true.6309:
%.tmp6310 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6311 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6270
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_expression.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6310, %m980$.Node.type* %.tmp6311)
br label %.if.end.6309
.if.false.6309:
%.tmp6312 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6270
%.tmp6313 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6312, i32 0, i32 0
%.tmp6314 = load i8*, i8** %.tmp6313
%.tmp6316 = getelementptr [9 x i8], [9 x i8]*@.str6315, i32 0, i32 0
%.tmp6317 = call i32(i8*,i8*) @strcmp(i8* %.tmp6314, i8* %.tmp6316)
%.tmp6318 = icmp eq i32 %.tmp6317, 0
br i1 %.tmp6318, label %.if.true.6319, label %.if.false.6319
.if.true.6319:
br label %.if.end.6319
.if.false.6319:
%.tmp6320 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6321 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6270
%.tmp6323 = getelementptr [66 x i8], [66 x i8]*@.str6322, i32 0, i32 0
%.tmp6324 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp6320, %m980$.Node.type* %.tmp6321, i8* %.tmp6323)
%.tmp6325 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6270
%.tmp6326 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6325, i32 0, i32 0
%.tmp6327 = load i8*, i8** %.tmp6326
%.tmp6328 = call i32(i8*,...) @printf(i8* %.tmp6324, i8* %.tmp6327)
%.tmp6329 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
call void(%m2756$.CompilerCtx.type*) @m295$pop_scope.v.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp6329)
ret void
br label %.if.end.6319
.if.end.6319:
br label %.if.end.6309
.if.end.6309:
br label %.if.end.6298
.if.end.6298:
%.tmp6330 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6331 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6330, i32 0, i32 1
%.tmp6332 = load %m0$.File.type*, %m0$.File.type** %.tmp6331
%.tmp6334 = getelementptr [26 x i8], [26 x i8]*@.str6333, i32 0, i32 0
%.tmp6335 = load i32, i32* %for_id.6264
%.tmp6336 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6332, i8* %.tmp6334, i32 %.tmp6335)
%.tmp6337 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6338 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6337, i32 0, i32 1
%.tmp6339 = load %m0$.File.type*, %m0$.File.type** %.tmp6338
%.tmp6341 = getelementptr [16 x i8], [16 x i8]*@.str6340, i32 0, i32 0
%.tmp6342 = load i32, i32* %for_id.6264
%.tmp6343 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6339, i8* %.tmp6341, i32 %.tmp6342)
%.tmp6344 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6345 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6344, i32 0, i32 7
%.tmp6346 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6345
%.tmp6348 = getelementptr [9 x i8], [9 x i8]*@.str6347, i32 0, i32 0
%.tmp6349 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6346, i8* %.tmp6348)
%fst_colon.6350 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6349, %m980$.Node.type** %fst_colon.6350
%.tmp6351 = load %m980$.Node.type*, %m980$.Node.type** %fst_colon.6350
%.tmp6352 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6351, i32 0, i32 8
%.tmp6353 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6352
%condition.6354 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6353, %m980$.Node.type** %condition.6354
%.tmp6355 = load %m980$.Node.type*, %m980$.Node.type** %condition.6354
%.tmp6356 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6355, i32 0, i32 0
%.tmp6357 = load i8*, i8** %.tmp6356
%.tmp6359 = getelementptr [9 x i8], [9 x i8]*@.str6358, i32 0, i32 0
%.tmp6360 = call i32(i8*,i8*) @strcmp(i8* %.tmp6357, i8* %.tmp6359)
%.tmp6361 = icmp eq i32 %.tmp6360, 0
br i1 %.tmp6361, label %.if.true.6362, label %.if.false.6362
.if.true.6362:
%.tmp6363 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6364 = load %m980$.Node.type*, %m980$.Node.type** %condition.6354
%.tmp6366 = getelementptr [39 x i8], [39 x i8]*@.str6365, i32 0, i32 0
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp6363, %m980$.Node.type* %.tmp6364, i8* %.tmp6366)
ret void
br label %.if.end.6362
.if.false.6362:
br label %.if.end.6362
.if.end.6362:
%.tmp6367 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6368 = load %m980$.Node.type*, %m980$.Node.type** %condition.6354
%.tmp6369 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6367, %m980$.Node.type* %.tmp6368)
%condition_info.6370 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp6369, %m2756$.AssignableInfo.type** %condition_info.6370
%.tmp6371 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %condition_info.6370
%.tmp6372 = icmp eq %m2756$.AssignableInfo.type* %.tmp6371, null
br i1 %.tmp6372, label %.if.true.6373, label %.if.false.6373
.if.true.6373:
ret void
br label %.if.end.6373
.if.false.6373:
br label %.if.end.6373
.if.end.6373:
%.tmp6374 = load %m980$.Node.type*, %m980$.Node.type** %fst_colon.6350
%.tmp6375 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6374, i32 0, i32 8
%.tmp6376 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6375
%.tmp6378 = getelementptr [9 x i8], [9 x i8]*@.str6377, i32 0, i32 0
%.tmp6379 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6376, i8* %.tmp6378)
%snd_colon.6380 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6379, %m980$.Node.type** %snd_colon.6380
%.tmp6381 = load %m980$.Node.type*, %m980$.Node.type** %snd_colon.6380
%.tmp6383 = getelementptr [6 x i8], [6 x i8]*@.str6382, i32 0, i32 0
%.tmp6384 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6381, i8* %.tmp6383)
%for_body.6385 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6384, %m980$.Node.type** %for_body.6385
%.tmp6386 = load %m980$.Node.type*, %m980$.Node.type** %for_body.6385
%.tmp6388 = getelementptr [11 x i8], [11 x i8]*@.str6387, i32 0, i32 0
%.tmp6389 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6386, i8* %.tmp6388)
%else_block.6390 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6389, %m980$.Node.type** %else_block.6390
%.tmp6391 = load i8*, i8** %end_lbl.6274
%on_end.6392 = alloca i8*
store i8* %.tmp6391, i8** %on_end.6392
%.tmp6393 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6390
%.tmp6394 = icmp ne %m980$.Node.type* %.tmp6393, null
br i1 %.tmp6394, label %.if.true.6395, label %.if.false.6395
.if.true.6395:
%.tmp6396 = getelementptr i8*, i8** %on_end.6392, i32 0
%.tmp6398 = getelementptr [13 x i8], [13 x i8]*@.str6397, i32 0, i32 0
%.tmp6399 = load i32, i32* %for_id.6264
%.tmp6400 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6396, i8* %.tmp6398, i32 %.tmp6399)
br label %.if.end.6395
.if.false.6395:
br label %.if.end.6395
.if.end.6395:
%.tmp6401 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6402 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6401, i32 0, i32 1
%.tmp6403 = load %m0$.File.type*, %m0$.File.type** %.tmp6402
%.tmp6405 = getelementptr [48 x i8], [48 x i8]*@.str6404, i32 0, i32 0
%.tmp6406 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6407 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %condition_info.6370
%.tmp6408 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6407, i32 0, i32 4
%.tmp6409 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6408
%.tmp6410 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6406, %m2756$.Type.type* %.tmp6409)
%.tmp6411 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %condition_info.6370
%.tmp6412 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp6411)
%.tmp6413 = load i32, i32* %for_id.6264
%.tmp6414 = load i8*, i8** %on_end.6392
%.tmp6415 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6403, i8* %.tmp6405, i8* %.tmp6410, i8* %.tmp6412, i32 %.tmp6413, i8* %.tmp6414)
%.tmp6416 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6417 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6416, i32 0, i32 1
%.tmp6418 = load %m0$.File.type*, %m0$.File.type** %.tmp6417
%.tmp6420 = getelementptr [19 x i8], [19 x i8]*@.str6419, i32 0, i32 0
%.tmp6421 = load i32, i32* %for_id.6264
%.tmp6422 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6418, i8* %.tmp6420, i32 %.tmp6421)
%.tmp6423 = load %m980$.Node.type*, %m980$.Node.type** %snd_colon.6380
%.tmp6424 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6423, i32 0, i32 8
%.tmp6425 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6424
%increment.6426 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6425, %m980$.Node.type** %increment.6426
%.tmp6427 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6428 = load %m980$.Node.type*, %m980$.Node.type** %for_body.6385
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6427, %m980$.Node.type* %.tmp6428)
%.tmp6429 = load %m980$.Node.type*, %m980$.Node.type** %increment.6426
%.tmp6430 = load %m980$.Node.type*, %m980$.Node.type** %for_body.6385
%.tmp6431 = icmp ne %m980$.Node.type* %.tmp6429, %.tmp6430
br i1 %.tmp6431, label %.if.true.6432, label %.if.false.6432
.if.true.6432:
%.tmp6433 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6434 = load %m980$.Node.type*, %m980$.Node.type** %increment.6426
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_expression.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6433, %m980$.Node.type* %.tmp6434)
br label %.if.end.6432
.if.false.6432:
br label %.if.end.6432
.if.end.6432:
%.tmp6435 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6436 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6435, i32 0, i32 1
%.tmp6437 = load %m0$.File.type*, %m0$.File.type** %.tmp6436
%.tmp6439 = getelementptr [15 x i8], [15 x i8]*@.str6438, i32 0, i32 0
%.tmp6440 = load i8*, i8** %begin_lbl.6272
%.tmp6441 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6437, i8* %.tmp6439, i8* %.tmp6440)
%.tmp6442 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6390
%.tmp6443 = icmp ne %m980$.Node.type* %.tmp6442, null
br i1 %.tmp6443, label %.if.true.6444, label %.if.false.6444
.if.true.6444:
%.tmp6445 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6446 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6445, i32 0, i32 1
%.tmp6447 = load %m0$.File.type*, %m0$.File.type** %.tmp6446
%.tmp6449 = getelementptr [15 x i8], [15 x i8]*@.str6448, i32 0, i32 0
%.tmp6450 = load i32, i32* %for_id.6264
%.tmp6451 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6447, i8* %.tmp6449, i32 %.tmp6450)
%.tmp6452 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6390
%.tmp6453 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6452, i32 0, i32 7
%.tmp6454 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6453
%.tmp6456 = getelementptr [6 x i8], [6 x i8]*@.str6455, i32 0, i32 0
%.tmp6457 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6454, i8* %.tmp6456)
%block.6458 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6457, %m980$.Node.type** %block.6458
%.tmp6459 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6460 = load %m980$.Node.type*, %m980$.Node.type** %block.6458
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6459, %m980$.Node.type* %.tmp6460)
%.tmp6461 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6462 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6461, i32 0, i32 1
%.tmp6463 = load %m0$.File.type*, %m0$.File.type** %.tmp6462
%.tmp6465 = getelementptr [15 x i8], [15 x i8]*@.str6464, i32 0, i32 0
%.tmp6466 = load i8*, i8** %end_lbl.6274
%.tmp6467 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6463, i8* %.tmp6465, i8* %.tmp6466)
br label %.if.end.6444
.if.false.6444:
br label %.if.end.6444
.if.end.6444:
%.tmp6468 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6469 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6468, i32 0, i32 1
%.tmp6470 = load %m0$.File.type*, %m0$.File.type** %.tmp6469
%.tmp6472 = getelementptr [5 x i8], [5 x i8]*@.str6471, i32 0, i32 0
%.tmp6473 = load i8*, i8** %end_lbl.6274
%.tmp6474 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6470, i8* %.tmp6472, i8* %.tmp6473)
%.tmp6475 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
call void(%m2756$.CompilerCtx.type*) @m295$pop_scope.v.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp6475)
ret void
}
define %m2756$.AssignableInfo.type* @m295$compile_declaration.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp6476 = bitcast ptr null to %m2756$.Type.type*
%decl_type.6477 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp6476, %m2756$.Type.type** %decl_type.6477
%.tmp6478 = bitcast ptr null to %m2756$.AssignableInfo.type*
%a_info.6479 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp6478, %m2756$.AssignableInfo.type** %a_info.6479
%.tmp6480 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6481 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6480, i32 0, i32 7
%.tmp6482 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6481
%.tmp6483 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6482, i32 0, i32 0
%.tmp6484 = load i8*, i8** %.tmp6483
%.tmp6486 = getelementptr [5 x i8], [5 x i8]*@.str6485, i32 0, i32 0
%.tmp6487 = call i32(i8*,i8*) @strcmp(i8* %.tmp6484, i8* %.tmp6486)
%.tmp6488 = icmp eq i32 %.tmp6487, 0
br i1 %.tmp6488, label %.if.true.6489, label %.if.false.6489
.if.true.6489:
%.tmp6490 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6491 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6492 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6491, i32 0, i32 7
%.tmp6493 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6492
%.tmp6494 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6493, i32 0, i32 7
%.tmp6495 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6494
%.tmp6496 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6490, %m980$.Node.type* %.tmp6495)
store %m2756$.Type.type* %.tmp6496, %m2756$.Type.type** %decl_type.6477
br label %.if.end.6489
.if.false.6489:
br label %.if.end.6489
.if.end.6489:
%.tmp6497 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6498 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6497, i32 0, i32 7
%.tmp6499 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6498
%.tmp6501 = getelementptr [11 x i8], [11 x i8]*@.str6500, i32 0, i32 0
%.tmp6502 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6499, i8* %.tmp6501)
%assignable.6503 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6502, %m980$.Node.type** %assignable.6503
%.tmp6504 = load %m980$.Node.type*, %m980$.Node.type** %assignable.6503
%.tmp6505 = icmp ne %m980$.Node.type* %.tmp6504, null
br i1 %.tmp6505, label %.if.true.6506, label %.if.false.6506
.if.true.6506:
%.tmp6507 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6508 = load %m980$.Node.type*, %m980$.Node.type** %assignable.6503
%.tmp6509 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6507, %m980$.Node.type* %.tmp6508)
store %m2756$.AssignableInfo.type* %.tmp6509, %m2756$.AssignableInfo.type** %a_info.6479
br label %.if.end.6506
.if.false.6506:
br label %.if.end.6506
.if.end.6506:
%.tmp6510 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6511 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp6510)
%info.6512 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp6511, %m2756$.AssignableInfo.type** %info.6512
%.tmp6513 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.6512
%.tmp6514 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6513, i32 0, i32 3
%.tmp6516 = getelementptr [9 x i8], [9 x i8]*@.str6515, i32 0, i32 0
store i8* %.tmp6516, i8** %.tmp6514
%.tmp6517 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6518 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6517, i32 0, i32 7
%.tmp6519 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6518
%.tmp6521 = getelementptr [5 x i8], [5 x i8]*@.str6520, i32 0, i32 0
%.tmp6522 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6519, i8* %.tmp6521)
%var_name.6523 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6522, %m980$.Node.type** %var_name.6523
%.tmp6524 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6523
%.tmp6525 = icmp eq %m980$.Node.type* %.tmp6524, null
br i1 %.tmp6525, label %.if.true.6526, label %.if.false.6526
.if.true.6526:
%.tmp6527 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6528 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6530 = getelementptr [31 x i8], [31 x i8]*@.str6529, i32 0, i32 0
%.tmp6531 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp6527, %m980$.Node.type* %.tmp6528, i8* %.tmp6530)
%.tmp6532 = call i32(i8*,...) @printf(i8* %.tmp6531)
%.tmp6533 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp6533
br label %.if.end.6526
.if.false.6526:
br label %.if.end.6526
.if.end.6526:
%.tmp6534 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6535 = call %m2756$.ModuleLookup.type*(%m2756$.CompilerCtx.type*) @m295$get_current_module.m2756$.ModuleLookup.typep.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp6534)
%mod.6536 = alloca %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* %.tmp6535, %m2756$.ModuleLookup.type** %mod.6536
%.tmp6537 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6538 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.6536
%.tmp6539 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp6538, i32 0, i32 3
%.tmp6540 = load %m2756$.Scope.type*, %m2756$.Scope.type** %.tmp6539
%.tmp6541 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6523
%.tmp6542 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6541, i32 0, i32 1
%.tmp6543 = load i8*, i8** %.tmp6542
%.tmp6544 = call %m2756$.ScopeItem.type*(%m2756$.CompilerCtx.type*,%m2756$.Scope.type*,i8*) @m295$find_defined_here.m2756$.ScopeItem.typep.m2756$.CompilerCtx.typep.m2756$.Scope.typep.cp(%m2756$.CompilerCtx.type* %.tmp6537, %m2756$.Scope.type* %.tmp6540, i8* %.tmp6543)
%.tmp6545 = icmp ne %m2756$.ScopeItem.type* %.tmp6544, null
br i1 %.tmp6545, label %.if.true.6546, label %.if.false.6546
.if.true.6546:
%.tmp6548 = getelementptr [1 x i8], [1 x i8]*@.str6547, i32 0, i32 0
%err_buf.6549 = alloca i8*
store i8* %.tmp6548, i8** %err_buf.6549
%.tmp6550 = getelementptr i8*, i8** %err_buf.6549, i32 0
%.tmp6552 = getelementptr [43 x i8], [43 x i8]*@.str6551, i32 0, i32 0
%.tmp6553 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6523
%.tmp6554 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6553, i32 0, i32 1
%.tmp6555 = load i8*, i8** %.tmp6554
%.tmp6556 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6550, i8* %.tmp6552, i8* %.tmp6555)
%.tmp6557 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6558 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6559 = load i8*, i8** %err_buf.6549
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp6557, %m980$.Node.type* %.tmp6558, i8* %.tmp6559)
%.tmp6560 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp6560
br label %.if.end.6546
.if.false.6546:
br label %.if.end.6546
.if.end.6546:
%.tmp6562 = getelementptr [1 x i8], [1 x i8]*@.str6561, i32 0, i32 0
%var_id.6563 = alloca i8*
store i8* %.tmp6562, i8** %var_id.6563
%.tmp6564 = getelementptr i8*, i8** %var_id.6563, i32 0
%.tmp6566 = getelementptr [6 x i8], [6 x i8]*@.str6565, i32 0, i32 0
%.tmp6567 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6523
%.tmp6568 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6567, i32 0, i32 1
%.tmp6569 = load i8*, i8** %.tmp6568
%.tmp6570 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6571 = call i32(%m2756$.CompilerCtx.type*) @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp6570)
%.tmp6572 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6564, i8* %.tmp6566, i8* %.tmp6569, i32 %.tmp6571)
%.tmp6573 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.6512
%.tmp6574 = load i8, i8* @SCOPE_LOCAL
%.tmp6575 = load i8*, i8** %var_id.6563
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp6573, i8 %.tmp6574, i8* %.tmp6575)
%.tmp6576 = load %m2756$.Type.type*, %m2756$.Type.type** %decl_type.6477
%.tmp6577 = icmp ne %m2756$.Type.type* %.tmp6576, null
br i1 %.tmp6577, label %.if.true.6578, label %.if.false.6578
.if.true.6578:
%.tmp6579 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.6512
%.tmp6580 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6579, i32 0, i32 4
%.tmp6581 = load %m2756$.Type.type*, %m2756$.Type.type** %decl_type.6477
store %m2756$.Type.type* %.tmp6581, %m2756$.Type.type** %.tmp6580
br label %.if.end.6578
.if.false.6578:
%.tmp6582 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.6479
%.tmp6583 = icmp ne %m2756$.AssignableInfo.type* %.tmp6582, null
br i1 %.tmp6583, label %.if.true.6584, label %.if.false.6584
.if.true.6584:
%.tmp6585 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.6512
%.tmp6586 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6585, i32 0, i32 4
%.tmp6587 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.6479
%.tmp6588 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6587, i32 0, i32 4
%.tmp6589 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6588
store %m2756$.Type.type* %.tmp6589, %m2756$.Type.type** %.tmp6586
br label %.if.end.6584
.if.false.6584:
br label %.if.end.6584
.if.end.6584:
br label %.if.end.6578
.if.end.6578:
%.tmp6590 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6591 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.6512
%.tmp6592 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6591, i32 0, i32 4
%.tmp6593 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6592
%.tmp6594 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6590, %m2756$.Type.type* %.tmp6593)
%var_type_repr.6595 = alloca i8*
store i8* %.tmp6594, i8** %var_type_repr.6595
%.tmp6596 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.6479
%.tmp6597 = icmp ne %m2756$.AssignableInfo.type* %.tmp6596, null
br i1 %.tmp6597, label %.if.true.6598, label %.if.false.6598
.if.true.6598:
%.tmp6599 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6600 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.6479
%.tmp6601 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6600, i32 0, i32 4
%.tmp6602 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6601
%.tmp6603 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6599, %m2756$.Type.type* %.tmp6602)
%a_type_repr.6604 = alloca i8*
store i8* %.tmp6603, i8** %a_type_repr.6604
%.tmp6605 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6606 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.6479
%.tmp6607 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6606, i32 0, i32 4
%.tmp6608 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6607
%.tmp6609 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.6512
%.tmp6610 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6609, i32 0, i32 4
%.tmp6611 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6610
%.tmp6612 = call i1(%m2756$.CompilerCtx.type*,%m2756$.Type.type*,%m2756$.Type.type*) @m2757$cmp.b.m2756$.CompilerCtx.typep.m2756$.Type.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6605, %m2756$.Type.type* %.tmp6608, %m2756$.Type.type* %.tmp6611)
%.tmp6613 = icmp eq i1 %.tmp6612, 0
br i1 %.tmp6613, label %.if.true.6614, label %.if.false.6614
.if.true.6614:
%.tmp6616 = getelementptr [1 x i8], [1 x i8]*@.str6615, i32 0, i32 0
%err_msg.6617 = alloca i8*
store i8* %.tmp6616, i8** %err_msg.6617
%.tmp6618 = getelementptr i8*, i8** %err_msg.6617, i32 0
%.tmp6620 = getelementptr [49 x i8], [49 x i8]*@.str6619, i32 0, i32 0
%.tmp6621 = load i8*, i8** %a_type_repr.6604
%.tmp6622 = load i8*, i8** %var_type_repr.6595
%.tmp6623 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6618, i8* %.tmp6620, i8* %.tmp6621, i8* %.tmp6622)
%.tmp6624 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6625 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6626 = load i8*, i8** %err_msg.6617
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp6624, %m980$.Node.type* %.tmp6625, i8* %.tmp6626)
br label %.if.end.6614
.if.false.6614:
br label %.if.end.6614
.if.end.6614:
br label %.if.end.6598
.if.false.6598:
br label %.if.end.6598
.if.end.6598:
%.tmp6627 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6628 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6629 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6523
%.tmp6630 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6629, i32 0, i32 1
%.tmp6631 = load i8*, i8** %.tmp6630
%.tmp6632 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.6512
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2756$.AssignableInfo.type*) @m295$define_assignable.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp6627, %m980$.Node.type* %.tmp6628, i8* %.tmp6631, %m2756$.AssignableInfo.type* %.tmp6632)
%.tmp6633 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6634 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6633, i32 0, i32 1
%.tmp6635 = load %m0$.File.type*, %m0$.File.type** %.tmp6634
%.tmp6637 = getelementptr [16 x i8], [16 x i8]*@.str6636, i32 0, i32 0
%.tmp6638 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.6512
%.tmp6639 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp6638)
%.tmp6640 = load i8*, i8** %var_type_repr.6595
%.tmp6641 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6635, i8* %.tmp6637, i8* %.tmp6639, i8* %.tmp6640)
%.tmp6642 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.6479
%.tmp6643 = icmp ne %m2756$.AssignableInfo.type* %.tmp6642, null
br i1 %.tmp6643, label %.if.true.6644, label %.if.false.6644
.if.true.6644:
%.tmp6645 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6646 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6645, i32 0, i32 1
%.tmp6647 = load %m0$.File.type*, %m0$.File.type** %.tmp6646
%.tmp6649 = getelementptr [21 x i8], [21 x i8]*@.str6648, i32 0, i32 0
%.tmp6650 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6651 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.6479
%.tmp6652 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6651, i32 0, i32 4
%.tmp6653 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6652
%.tmp6654 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6650, %m2756$.Type.type* %.tmp6653)
%.tmp6655 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.6479
%.tmp6656 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp6655)
%.tmp6657 = load i8*, i8** %var_type_repr.6595
%.tmp6658 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.6512
%.tmp6659 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp6658)
%.tmp6660 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6647, i8* %.tmp6649, i8* %.tmp6654, i8* %.tmp6656, i8* %.tmp6657, i8* %.tmp6659)
br label %.if.end.6644
.if.false.6644:
%.tmp6661 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6662 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6663 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.6512
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,%m2756$.AssignableInfo.type*) @m295$compile_zero_value.v.m2756$.CompilerCtx.typep.m980$.Node.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp6661, %m980$.Node.type* %.tmp6662, %m2756$.AssignableInfo.type* %.tmp6663)
br label %.if.end.6644
.if.end.6644:
%.tmp6664 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.6512
ret %m2756$.AssignableInfo.type* %.tmp6664
}
define void @m295$compile_zero_value.v.m2756$.CompilerCtx.typep.m980$.Node.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, %m2756$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%info = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.info.arg, %m2756$.AssignableInfo.type** %info
%.tmp6665 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp6666 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6665, i32 0, i32 4
%.tmp6667 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6666
%.tmp6668 = icmp eq %m2756$.Type.type* %.tmp6667, null
br i1 %.tmp6668, label %.if.true.6669, label %.if.false.6669
.if.true.6669:
ret void
br label %.if.end.6669
.if.false.6669:
br label %.if.end.6669
.if.end.6669:
%.tmp6670 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6671 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp6672 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6671, i32 0, i32 4
%.tmp6673 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6672
%.tmp6674 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6670, %m2756$.Type.type* %.tmp6673)
%t_repr.6675 = alloca i8*
store i8* %.tmp6674, i8** %t_repr.6675
%.tmp6676 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp6677 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp6676)
%id.6678 = alloca i8*
store i8* %.tmp6677, i8** %id.6678
%field_id.6679 = alloca i32
store i32 0, i32* %field_id.6679
%field.6680 = alloca %m2756$.Type.type*
store %m2756$.Type.type* null, %m2756$.Type.type** %field.6680
%field_info.6681 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* null, %m2756$.AssignableInfo.type** %field_info.6681
%.tmp6682 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp6683 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6682, i32 0, i32 4
%.tmp6684 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6683
%t.6685 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp6684, %m2756$.Type.type** %t.6685
%.tmp6686 = load %m2756$.Type.type*, %m2756$.Type.type** %t.6685
%.tmp6687 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6686, i32 0, i32 0
%.tmp6688 = load i8*, i8** %.tmp6687
%.tmp6690 = getelementptr [4 x i8], [4 x i8]*@.str6689, i32 0, i32 0
%.tmp6691 = call i32(i8*,i8*) @strcmp(i8* %.tmp6688, i8* %.tmp6690)
%.tmp6692 = icmp eq i32 %.tmp6691, 0
%.tmp6693 = load %m2756$.Type.type*, %m2756$.Type.type** %t.6685
%.tmp6694 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6693, i32 0, i32 0
%.tmp6695 = load i8*, i8** %.tmp6694
%.tmp6697 = getelementptr [4 x i8], [4 x i8]*@.str6696, i32 0, i32 0
%.tmp6698 = call i32(i8*,i8*) @strcmp(i8* %.tmp6695, i8* %.tmp6697)
%.tmp6699 = icmp eq i32 %.tmp6698, 0
%.tmp6700 = or i1 %.tmp6692, %.tmp6699
%.tmp6701 = load %m2756$.Type.type*, %m2756$.Type.type** %t.6685
%.tmp6702 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6701, i32 0, i32 0
%.tmp6703 = load i8*, i8** %.tmp6702
%.tmp6705 = getelementptr [5 x i8], [5 x i8]*@.str6704, i32 0, i32 0
%.tmp6706 = call i32(i8*,i8*) @strcmp(i8* %.tmp6703, i8* %.tmp6705)
%.tmp6707 = icmp eq i32 %.tmp6706, 0
%.tmp6708 = or i1 %.tmp6700, %.tmp6707
br i1 %.tmp6708, label %.if.true.6709, label %.if.false.6709
.if.true.6709:
%.tmp6710 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6711 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6710, i32 0, i32 1
%.tmp6712 = load %m0$.File.type*, %m0$.File.type** %.tmp6711
%.tmp6714 = getelementptr [21 x i8], [21 x i8]*@.str6713, i32 0, i32 0
%.tmp6715 = load i8*, i8** %t_repr.6675
%.tmp6716 = load i8*, i8** %t_repr.6675
%.tmp6717 = load i8*, i8** %id.6678
%.tmp6718 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6712, i8* %.tmp6714, i8* %.tmp6715, i32 0, i8* %.tmp6716, i8* %.tmp6717)
br label %.if.end.6709
.if.false.6709:
%.tmp6719 = load %m2756$.Type.type*, %m2756$.Type.type** %t.6685
%.tmp6720 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6719, i32 0, i32 0
%.tmp6721 = load i8*, i8** %.tmp6720
%.tmp6723 = getelementptr [4 x i8], [4 x i8]*@.str6722, i32 0, i32 0
%.tmp6724 = call i32(i8*,i8*) @strcmp(i8* %.tmp6721, i8* %.tmp6723)
%.tmp6725 = icmp eq i32 %.tmp6724, 0
br i1 %.tmp6725, label %.if.true.6726, label %.if.false.6726
.if.true.6726:
%.tmp6727 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6728 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6727, i32 0, i32 1
%.tmp6729 = load %m0$.File.type*, %m0$.File.type** %.tmp6728
%.tmp6731 = getelementptr [21 x i8], [21 x i8]*@.str6730, i32 0, i32 0
%.tmp6732 = load i8*, i8** %t_repr.6675
%.tmp6734 = getelementptr [5 x i8], [5 x i8]*@.str6733, i32 0, i32 0
%.tmp6735 = load i8*, i8** %t_repr.6675
%.tmp6736 = load i8*, i8** %id.6678
%.tmp6737 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6729, i8* %.tmp6731, i8* %.tmp6732, i8* %.tmp6734, i8* %.tmp6735, i8* %.tmp6736)
br label %.if.end.6726
.if.false.6726:
%.tmp6738 = load %m2756$.Type.type*, %m2756$.Type.type** %t.6685
%.tmp6739 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6738, i32 0, i32 0
%.tmp6740 = load i8*, i8** %.tmp6739
%.tmp6742 = getelementptr [7 x i8], [7 x i8]*@.str6741, i32 0, i32 0
%.tmp6743 = call i32(i8*,i8*) @strcmp(i8* %.tmp6740, i8* %.tmp6742)
%.tmp6744 = icmp eq i32 %.tmp6743, 0
br i1 %.tmp6744, label %.if.true.6745, label %.if.false.6745
.if.true.6745:
%.tmp6747 = load %m2756$.Type.type*, %m2756$.Type.type** %t.6685
%.tmp6748 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6747, i32 0, i32 3
%.tmp6749 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6748
store %m2756$.Type.type* %.tmp6749, %m2756$.Type.type** %field.6680
br label %.for.start.6746
.for.start.6746:
%.tmp6750 = load %m2756$.Type.type*, %m2756$.Type.type** %field.6680
%.tmp6751 = icmp ne %m2756$.Type.type* %.tmp6750, null
br i1 %.tmp6751, label %.for.continue.6746, label %.for.end.6746
.for.continue.6746:
%.tmp6752 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6753 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp6752)
store %m2756$.AssignableInfo.type* %.tmp6753, %m2756$.AssignableInfo.type** %field_info.6681
%.tmp6754 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6755 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %field_info.6681
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp6754, %m2756$.AssignableInfo.type* %.tmp6755)
%.tmp6756 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %field_info.6681
%.tmp6757 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6756, i32 0, i32 4
%.tmp6758 = load %m2756$.Type.type*, %m2756$.Type.type** %field.6680
store %m2756$.Type.type* %.tmp6758, %m2756$.Type.type** %.tmp6757
%.tmp6759 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6760 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6759, i32 0, i32 1
%.tmp6761 = load %m0$.File.type*, %m0$.File.type** %.tmp6760
%.tmp6763 = getelementptr [46 x i8], [46 x i8]*@.str6762, i32 0, i32 0
%.tmp6764 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %field_info.6681
%.tmp6765 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp6764)
%.tmp6766 = load i8*, i8** %t_repr.6675
%.tmp6767 = load i8*, i8** %t_repr.6675
%.tmp6768 = load i8*, i8** %id.6678
%.tmp6769 = load i32, i32* %field_id.6679
%.tmp6770 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6761, i8* %.tmp6763, i8* %.tmp6765, i8* %.tmp6766, i8* %.tmp6767, i8* %.tmp6768, i32 %.tmp6769)
%.tmp6771 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6772 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6773 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %field_info.6681
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,%m2756$.AssignableInfo.type*) @m295$compile_zero_value.v.m2756$.CompilerCtx.typep.m980$.Node.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp6771, %m980$.Node.type* %.tmp6772, %m2756$.AssignableInfo.type* %.tmp6773)
%.tmp6774 = load i32, i32* %field_id.6679
%.tmp6775 = add i32 %.tmp6774, 1
store i32 %.tmp6775, i32* %field_id.6679
%.tmp6776 = load %m2756$.Type.type*, %m2756$.Type.type** %field.6680
%.tmp6777 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6776, i32 0, i32 4
%.tmp6778 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6777
store %m2756$.Type.type* %.tmp6778, %m2756$.Type.type** %field.6680
br label %.for.start.6746
.for.end.6746:
br label %.if.end.6745
.if.false.6745:
%.tmp6779 = load %m2756$.Type.type*, %m2756$.Type.type** %t.6685
%.tmp6780 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6779, i32 0, i32 0
%.tmp6781 = load i8*, i8** %.tmp6780
%.tmp6783 = getelementptr [10 x i8], [10 x i8]*@.str6782, i32 0, i32 0
%.tmp6784 = call i32(i8*,i8*) @strcmp(i8* %.tmp6781, i8* %.tmp6783)
%.tmp6785 = icmp eq i32 %.tmp6784, 0
br i1 %.tmp6785, label %.if.true.6786, label %.if.false.6786
.if.true.6786:
%.tmp6788 = load %m2756$.Type.type*, %m2756$.Type.type** %t.6685
%.tmp6789 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6788, i32 0, i32 3
%.tmp6790 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6789
%.tmp6791 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6790, i32 0, i32 3
%.tmp6792 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6791
store %m2756$.Type.type* %.tmp6792, %m2756$.Type.type** %field.6680
br label %.for.start.6787
.for.start.6787:
%.tmp6793 = load %m2756$.Type.type*, %m2756$.Type.type** %field.6680
%.tmp6794 = icmp ne %m2756$.Type.type* %.tmp6793, null
br i1 %.tmp6794, label %.for.continue.6787, label %.for.end.6787
.for.continue.6787:
%.tmp6795 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6796 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp6795)
store %m2756$.AssignableInfo.type* %.tmp6796, %m2756$.AssignableInfo.type** %field_info.6681
%.tmp6797 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6798 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %field_info.6681
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp6797, %m2756$.AssignableInfo.type* %.tmp6798)
%.tmp6799 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %field_info.6681
%.tmp6800 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6799, i32 0, i32 4
%.tmp6801 = load %m2756$.Type.type*, %m2756$.Type.type** %field.6680
store %m2756$.Type.type* %.tmp6801, %m2756$.Type.type** %.tmp6800
%.tmp6802 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6803 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6802, i32 0, i32 1
%.tmp6804 = load %m0$.File.type*, %m0$.File.type** %.tmp6803
%.tmp6806 = getelementptr [46 x i8], [46 x i8]*@.str6805, i32 0, i32 0
%.tmp6807 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %field_info.6681
%.tmp6808 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp6807)
%.tmp6809 = load i8*, i8** %t_repr.6675
%.tmp6810 = load i8*, i8** %t_repr.6675
%.tmp6811 = load i8*, i8** %id.6678
%.tmp6812 = load i32, i32* %field_id.6679
%.tmp6813 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6804, i8* %.tmp6806, i8* %.tmp6808, i8* %.tmp6809, i8* %.tmp6810, i8* %.tmp6811, i32 %.tmp6812)
%.tmp6814 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6815 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6816 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %field_info.6681
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,%m2756$.AssignableInfo.type*) @m295$compile_zero_value.v.m2756$.CompilerCtx.typep.m980$.Node.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp6814, %m980$.Node.type* %.tmp6815, %m2756$.AssignableInfo.type* %.tmp6816)
%.tmp6817 = load i32, i32* %field_id.6679
%.tmp6818 = add i32 %.tmp6817, 1
store i32 %.tmp6818, i32* %field_id.6679
%.tmp6819 = load %m2756$.Type.type*, %m2756$.Type.type** %field.6680
%.tmp6820 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6819, i32 0, i32 4
%.tmp6821 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6820
store %m2756$.Type.type* %.tmp6821, %m2756$.Type.type** %field.6680
br label %.for.start.6787
.for.end.6787:
br label %.if.end.6786
.if.false.6786:
%.tmp6822 = load %m2756$.Type.type*, %m2756$.Type.type** %t.6685
%.tmp6823 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6822, i32 0, i32 0
%.tmp6824 = load i8*, i8** %.tmp6823
%.tmp6826 = getelementptr [6 x i8], [6 x i8]*@.str6825, i32 0, i32 0
%.tmp6827 = call i32(i8*,i8*) @strcmp(i8* %.tmp6824, i8* %.tmp6826)
%.tmp6828 = icmp eq i32 %.tmp6827, 0
br i1 %.tmp6828, label %.if.true.6829, label %.if.false.6829
.if.true.6829:
ret void
br label %.if.end.6829
.if.false.6829:
%.tmp6830 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6831 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6833 = getelementptr [44 x i8], [44 x i8]*@.str6832, i32 0, i32 0
%.tmp6834 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp6830, %m980$.Node.type* %.tmp6831, i8* %.tmp6833)
%.tmp6835 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp6836 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6835, i32 0, i32 4
%.tmp6837 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6836
%.tmp6838 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp6837, i32 0, i32 0
%.tmp6839 = load i8*, i8** %.tmp6838
%.tmp6840 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6841 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp6842 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6841, i32 0, i32 4
%.tmp6843 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6842
%.tmp6844 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6840, %m2756$.Type.type* %.tmp6843)
%.tmp6845 = call i32(i8*,...) @printf(i8* %.tmp6834, i8* %.tmp6839, i8* %.tmp6844)
ret void
br label %.if.end.6829
.if.end.6829:
br label %.if.end.6786
.if.end.6786:
br label %.if.end.6745
.if.end.6745:
br label %.if.end.6726
.if.end.6726:
br label %.if.end.6709
.if.end.6709:
ret void
}
define void @m295$compile_if_block.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp6846 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6847 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6846, i32 0, i32 7
%.tmp6848 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6847
%.tmp6850 = getelementptr [11 x i8], [11 x i8]*@.str6849, i32 0, i32 0
%.tmp6851 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6848, i8* %.tmp6850)
%assignable.6852 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6851, %m980$.Node.type** %assignable.6852
%.tmp6853 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6854 = load %m980$.Node.type*, %m980$.Node.type** %assignable.6852
%.tmp6855 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6853, %m980$.Node.type* %.tmp6854)
%a_info.6856 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp6855, %m2756$.AssignableInfo.type** %a_info.6856
%.tmp6857 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.6856
%.tmp6858 = icmp eq %m2756$.AssignableInfo.type* %.tmp6857, null
br i1 %.tmp6858, label %.if.true.6859, label %.if.false.6859
.if.true.6859:
ret void
br label %.if.end.6859
.if.false.6859:
br label %.if.end.6859
.if.end.6859:
%.tmp6860 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6861 = call i32(%m2756$.CompilerCtx.type*) @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp6860)
%if_id.6862 = alloca i32
store i32 %.tmp6861, i32* %if_id.6862
%.tmp6863 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6864 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6863, i32 0, i32 1
%.tmp6865 = load %m0$.File.type*, %m0$.File.type** %.tmp6864
%.tmp6867 = getelementptr [53 x i8], [53 x i8]*@.str6866, i32 0, i32 0
%.tmp6868 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6869 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.6856
%.tmp6870 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6869, i32 0, i32 4
%.tmp6871 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp6870
%.tmp6872 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp6868, %m2756$.Type.type* %.tmp6871)
%.tmp6873 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %a_info.6856
%.tmp6874 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp6873)
%.tmp6875 = load i32, i32* %if_id.6862
%.tmp6876 = load i32, i32* %if_id.6862
%.tmp6877 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6865, i8* %.tmp6867, i8* %.tmp6872, i8* %.tmp6874, i32 %.tmp6875, i32 %.tmp6876)
%.tmp6878 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6879 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6878, i32 0, i32 1
%.tmp6880 = load %m0$.File.type*, %m0$.File.type** %.tmp6879
%.tmp6882 = getelementptr [14 x i8], [14 x i8]*@.str6881, i32 0, i32 0
%.tmp6883 = load i32, i32* %if_id.6862
%.tmp6884 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6880, i8* %.tmp6882, i32 %.tmp6883)
%.tmp6885 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6886 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6885, i32 0, i32 7
%.tmp6887 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6886
%.tmp6889 = getelementptr [6 x i8], [6 x i8]*@.str6888, i32 0, i32 0
%.tmp6890 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6887, i8* %.tmp6889)
%block.6891 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6890, %m980$.Node.type** %block.6891
%.tmp6892 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6893 = load %m980$.Node.type*, %m980$.Node.type** %block.6891
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6892, %m980$.Node.type* %.tmp6893)
%.tmp6894 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6895 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6894, i32 0, i32 1
%.tmp6896 = load %m0$.File.type*, %m0$.File.type** %.tmp6895
%.tmp6898 = getelementptr [23 x i8], [23 x i8]*@.str6897, i32 0, i32 0
%.tmp6899 = load i32, i32* %if_id.6862
%.tmp6900 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6896, i8* %.tmp6898, i32 %.tmp6899)
%.tmp6901 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6902 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6901, i32 0, i32 1
%.tmp6903 = load %m0$.File.type*, %m0$.File.type** %.tmp6902
%.tmp6905 = getelementptr [15 x i8], [15 x i8]*@.str6904, i32 0, i32 0
%.tmp6906 = load i32, i32* %if_id.6862
%.tmp6907 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6903, i8* %.tmp6905, i32 %.tmp6906)
%.tmp6908 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6909 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6908, i32 0, i32 7
%.tmp6910 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6909
%.tmp6912 = getelementptr [11 x i8], [11 x i8]*@.str6911, i32 0, i32 0
%.tmp6913 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6910, i8* %.tmp6912)
%else_block.6914 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6913, %m980$.Node.type** %else_block.6914
%.tmp6915 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6914
%.tmp6916 = icmp ne %m980$.Node.type* %.tmp6915, null
br i1 %.tmp6916, label %.if.true.6917, label %.if.false.6917
.if.true.6917:
%.tmp6918 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6914
%.tmp6919 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6918, i32 0, i32 7
%.tmp6920 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6919
%.tmp6921 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6920, i32 0, i32 0
%.tmp6922 = load i8*, i8** %.tmp6921
%.tmp6924 = getelementptr [11 x i8], [11 x i8]*@.str6923, i32 0, i32 0
%.tmp6925 = call i32(i8*,i8*) @strcmp(i8* %.tmp6922, i8* %.tmp6924)
%.tmp6926 = icmp eq i32 %.tmp6925, 0
br i1 %.tmp6926, label %.if.true.6927, label %.if.false.6927
.if.true.6927:
%.tmp6928 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6914
%.tmp6929 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6928, i32 0, i32 7
%.tmp6930 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6929
%.tmp6931 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6930, i32 0, i32 7
%.tmp6932 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6931
%.tmp6934 = getelementptr [6 x i8], [6 x i8]*@.str6933, i32 0, i32 0
%.tmp6935 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6932, i8* %.tmp6934)
store %m980$.Node.type* %.tmp6935, %m980$.Node.type** %block.6891
%.tmp6936 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6937 = load %m980$.Node.type*, %m980$.Node.type** %block.6891
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6936, %m980$.Node.type* %.tmp6937)
br label %.if.end.6927
.if.false.6927:
%.tmp6938 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6939 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6914
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_if_block.v.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp6938, %m980$.Node.type* %.tmp6939)
br label %.if.end.6927
.if.end.6927:
br label %.if.end.6917
.if.false.6917:
br label %.if.end.6917
.if.end.6917:
%.tmp6940 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6941 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6940, i32 0, i32 1
%.tmp6942 = load %m0$.File.type*, %m0$.File.type** %.tmp6941
%.tmp6944 = getelementptr [23 x i8], [23 x i8]*@.str6943, i32 0, i32 0
%.tmp6945 = load i32, i32* %if_id.6862
%.tmp6946 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6942, i8* %.tmp6944, i32 %.tmp6945)
%.tmp6947 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6948 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6947, i32 0, i32 1
%.tmp6949 = load %m0$.File.type*, %m0$.File.type** %.tmp6948
%.tmp6951 = getelementptr [13 x i8], [13 x i8]*@.str6950, i32 0, i32 0
%.tmp6952 = load i32, i32* %if_id.6862
%.tmp6953 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6949, i8* %.tmp6951, i32 %.tmp6952)
ret void
}
define void @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%curr_node = alloca %m980$.Node.type*
store %m980$.Node.type* %.curr_node.arg, %m980$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp6954 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp6955 = icmp ne %m980$.Node.type* %.tmp6954, null
br i1 %.tmp6955, label %.if.true.6956, label %.if.false.6956
.if.true.6956:
%.tmp6957 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6958 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp6957, i32 0, i32 7
%.tmp6959 = load i8*, i8** %.tmp6958
%.tmp6960 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp6961 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6960, i32 0, i32 3
%.tmp6962 = load i32, i32* %.tmp6961
%.tmp6963 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp6964 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6963, i32 0, i32 4
%.tmp6965 = load i32, i32* %.tmp6964
%.tmp6966 = load i8*, i8** %msg
%.tmp6967 = call %m296$.Error.type*(i8*,i32,i32,i8*) @m296$new.m296$.Error.typep.cp.i.i.cp(i8* %.tmp6959, i32 %.tmp6962, i32 %.tmp6965, i8* %.tmp6966)
%err.6968 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp6967, %m296$.Error.type** %err.6968
%.tmp6969 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6970 = load %m296$.Error.type*, %m296$.Error.type** %err.6968
call void(%m2756$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2756$.CompilerCtx.typep.m296$.Error.typep(%m2756$.CompilerCtx.type* %.tmp6969, %m296$.Error.type* %.tmp6970)
br label %.if.end.6956
.if.false.6956:
%.tmp6972 = getelementptr [61 x i8], [61 x i8]*@.str6971, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp6972)
br label %.if.end.6956
.if.end.6956:
ret void
}
define void @m295$define_assignable.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i8* %.name.arg, %m2756$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.info.arg, %m2756$.AssignableInfo.type** %info
%.tmp6973 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp6974 = call %m2756$.ModuleLookup.type*(%m2756$.CompilerCtx.type*) @m295$get_current_module.m2756$.ModuleLookup.typep.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp6973)
%mod.6975 = alloca %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* %.tmp6974, %m2756$.ModuleLookup.type** %mod.6975
%.tmp6976 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.6975
%.tmp6977 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp6976, i32 0, i32 3
%.tmp6978 = load %m2756$.Scope.type*, %m2756$.Scope.type** %.tmp6977
%.tmp6979 = icmp ne %m2756$.Scope.type* %.tmp6978, null
%.tmp6981 = getelementptr [82 x i8], [82 x i8]*@.str6980, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6979, i8* %.tmp6981)
%.tmp6982 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.6975
%.tmp6983 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp6982, i32 0, i32 3
%.tmp6984 = load %m2756$.Scope.type*, %m2756$.Scope.type** %.tmp6983
%current_scope.6985 = alloca %m2756$.Scope.type*
store %m2756$.Scope.type* %.tmp6984, %m2756$.Scope.type** %current_scope.6985
%.tmp6986 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* null, i32 1
%.tmp6987 = ptrtoint %m2756$.ScopeItem.type* %.tmp6986 to i32
%.tmp6988 = call i8*(i32) @malloc(i32 %.tmp6987)
%.tmp6989 = bitcast i8* %.tmp6988 to %m2756$.ScopeItem.type*
%newitem.6990 = alloca %m2756$.ScopeItem.type*
store %m2756$.ScopeItem.type* %.tmp6989, %m2756$.ScopeItem.type** %newitem.6990
%.tmp6991 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %newitem.6990
%.tmp6992 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp6991, i32 0, i32 0
%.tmp6993 = load i8*, i8** %name
store i8* %.tmp6993, i8** %.tmp6992
%.tmp6994 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %newitem.6990
%.tmp6995 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp6994, i32 0, i32 1
%.tmp6996 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
store %m2756$.AssignableInfo.type* %.tmp6996, %m2756$.AssignableInfo.type** %.tmp6995
%.tmp6997 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %newitem.6990
%.tmp6998 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp6997, i32 0, i32 2
store %m2756$.ScopeItem.type* null, %m2756$.ScopeItem.type** %.tmp6998
%.tmp6999 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp7000 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp6999, i32 0, i32 2
%.tmp7001 = load i8*, i8** %name
store i8* %.tmp7001, i8** %.tmp7000
%.tmp7002 = load %m2756$.Scope.type*, %m2756$.Scope.type** %current_scope.6985
%.tmp7003 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp7002, i32 0, i32 1
%.tmp7004 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %.tmp7003
%.tmp7005 = icmp eq %m2756$.ScopeItem.type* %.tmp7004, null
br i1 %.tmp7005, label %.if.true.7006, label %.if.false.7006
.if.true.7006:
%.tmp7007 = load %m2756$.Scope.type*, %m2756$.Scope.type** %current_scope.6985
%.tmp7008 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp7007, i32 0, i32 1
%.tmp7009 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %newitem.6990
store %m2756$.ScopeItem.type* %.tmp7009, %m2756$.ScopeItem.type** %.tmp7008
ret void
br label %.if.end.7006
.if.false.7006:
br label %.if.end.7006
.if.end.7006:
%.tmp7010 = load %m2756$.Scope.type*, %m2756$.Scope.type** %current_scope.6985
%.tmp7011 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp7010, i32 0, i32 1
%.tmp7012 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %.tmp7011
%last_item.7013 = alloca %m2756$.ScopeItem.type*
store %m2756$.ScopeItem.type* %.tmp7012, %m2756$.ScopeItem.type** %last_item.7013
%.tmp7015 = getelementptr [1 x i8], [1 x i8]*@.str7014, i32 0, i32 0
%err_buf.7016 = alloca i8*
store i8* %.tmp7015, i8** %err_buf.7016
%.tmp7017 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %last_item.7013
%.tmp7018 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp7017, i32 0, i32 0
%.tmp7019 = load i8*, i8** %.tmp7018
%.tmp7020 = load i8*, i8** %name
%.tmp7021 = call i32(i8*,i8*) @strcmp(i8* %.tmp7019, i8* %.tmp7020)
%.tmp7022 = icmp eq i32 %.tmp7021, 0
br i1 %.tmp7022, label %.if.true.7023, label %.if.false.7023
.if.true.7023:
%.tmp7024 = getelementptr i8*, i8** %err_buf.7016, i32 0
%.tmp7026 = getelementptr [43 x i8], [43 x i8]*@.str7025, i32 0, i32 0
%.tmp7027 = load i8*, i8** %name
%.tmp7028 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7024, i8* %.tmp7026, i8* %.tmp7027)
%.tmp7029 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7030 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp7031 = load i8*, i8** %err_buf.7016
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp7029, %m980$.Node.type* %.tmp7030, i8* %.tmp7031)
br label %.if.end.7023
.if.false.7023:
br label %.if.end.7023
.if.end.7023:
br label %.for.start.7032
.for.start.7032:
%.tmp7033 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %last_item.7013
%.tmp7034 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp7033, i32 0, i32 2
%.tmp7035 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %.tmp7034
%.tmp7036 = icmp ne %m2756$.ScopeItem.type* %.tmp7035, null
br i1 %.tmp7036, label %.for.continue.7032, label %.for.else.7032
.for.continue.7032:
%.tmp7037 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %last_item.7013
%.tmp7038 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp7037, i32 0, i32 0
%.tmp7039 = load i8*, i8** %.tmp7038
%.tmp7040 = load i8*, i8** %name
%.tmp7041 = call i32(i8*,i8*) @strcmp(i8* %.tmp7039, i8* %.tmp7040)
%.tmp7042 = icmp eq i32 %.tmp7041, 0
br i1 %.tmp7042, label %.if.true.7043, label %.if.false.7043
.if.true.7043:
%.tmp7044 = getelementptr i8*, i8** %err_buf.7016, i32 0
%.tmp7046 = getelementptr [43 x i8], [43 x i8]*@.str7045, i32 0, i32 0
%.tmp7047 = load i8*, i8** %name
%.tmp7048 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7044, i8* %.tmp7046, i8* %.tmp7047)
%.tmp7049 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7050 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp7051 = load i8*, i8** %err_buf.7016
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp7049, %m980$.Node.type* %.tmp7050, i8* %.tmp7051)
br label %.for.end.7032
br label %.if.end.7043
.if.false.7043:
br label %.if.end.7043
.if.end.7043:
%.tmp7052 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %last_item.7013
%.tmp7053 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp7052, i32 0, i32 2
%.tmp7054 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %.tmp7053
store %m2756$.ScopeItem.type* %.tmp7054, %m2756$.ScopeItem.type** %last_item.7013
br label %.for.start.7032
.for.else.7032:
%.tmp7055 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %last_item.7013
%.tmp7056 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp7055, i32 0, i32 2
%.tmp7057 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %newitem.6990
store %m2756$.ScopeItem.type* %.tmp7057, %m2756$.ScopeItem.type** %.tmp7056
br label %.for.end.7032
.for.end.7032:
ret void
}
define %m2756$.ScopeItem.type* @m295$find_defined_in.m2756$.ScopeItem.typep.m2756$.CompilerCtx.typep.cp.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m980$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m980$.Node.type*
store %m980$.Node.type* %.dotted_name.arg, %m980$.Node.type** %dotted_name
%.tmp7058 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7059 = load i8*, i8** %module
%.tmp7060 = load %m980$.Node.type*, %m980$.Node.type** %dotted_name
%.tmp7061 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7060, i32 0, i32 1
%.tmp7062 = load i8*, i8** %.tmp7061
%.tmp7063 = call %m2756$.ScopeItem.type*(%m2756$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2756$.ScopeItem.typep.m2756$.CompilerCtx.typep.cp.cp(%m2756$.CompilerCtx.type* %.tmp7058, i8* %.tmp7059, i8* %.tmp7062)
%found.7064 = alloca %m2756$.ScopeItem.type*
store %m2756$.ScopeItem.type* %.tmp7063, %m2756$.ScopeItem.type** %found.7064
%.tmp7065 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %found.7064
%.tmp7066 = icmp eq %m2756$.ScopeItem.type* %.tmp7065, null
br i1 %.tmp7066, label %.if.true.7067, label %.if.false.7067
.if.true.7067:
%.tmp7068 = bitcast ptr null to %m2756$.ScopeItem.type*
ret %m2756$.ScopeItem.type* %.tmp7068
br label %.if.end.7067
.if.false.7067:
br label %.if.end.7067
.if.end.7067:
br label %.for.start.7069
.for.start.7069:
%.tmp7070 = load %m980$.Node.type*, %m980$.Node.type** %dotted_name
%.tmp7071 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7070, i32 0, i32 8
%.tmp7072 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7071
%.tmp7073 = icmp ne %m980$.Node.type* %.tmp7072, null
%.tmp7074 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %found.7064
%.tmp7075 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp7074, i32 0, i32 1
%.tmp7076 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %.tmp7075
%.tmp7077 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7076, i32 0, i32 3
%.tmp7078 = load i8*, i8** %.tmp7077
%.tmp7080 = getelementptr [7 x i8], [7 x i8]*@.str7079, i32 0, i32 0
%.tmp7081 = call i32(i8*,i8*) @strcmp(i8* %.tmp7078, i8* %.tmp7080)
%.tmp7082 = icmp eq i32 %.tmp7081, 0
%.tmp7083 = and i1 %.tmp7073, %.tmp7082
br i1 %.tmp7083, label %.for.continue.7069, label %.for.end.7069
.for.continue.7069:
%.tmp7084 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7085 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %found.7064
%.tmp7086 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp7085, i32 0, i32 1
%.tmp7087 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %.tmp7086
%.tmp7088 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7087, i32 0, i32 0
%.tmp7089 = load i8*, i8** %.tmp7088
%.tmp7090 = load %m980$.Node.type*, %m980$.Node.type** %dotted_name
%.tmp7091 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7090, i32 0, i32 8
%.tmp7092 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7091
%.tmp7093 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7092, i32 0, i32 8
%.tmp7094 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7093
%.tmp7095 = call %m2756$.ScopeItem.type*(%m2756$.CompilerCtx.type*,i8*,%m980$.Node.type*) @m295$find_defined_in.m2756$.ScopeItem.typep.m2756$.CompilerCtx.typep.cp.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp7084, i8* %.tmp7089, %m980$.Node.type* %.tmp7094)
store %m2756$.ScopeItem.type* %.tmp7095, %m2756$.ScopeItem.type** %found.7064
%.tmp7096 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %found.7064
%.tmp7097 = icmp eq %m2756$.ScopeItem.type* %.tmp7096, null
br i1 %.tmp7097, label %.if.true.7098, label %.if.false.7098
.if.true.7098:
%.tmp7099 = bitcast ptr null to %m2756$.ScopeItem.type*
ret %m2756$.ScopeItem.type* %.tmp7099
br label %.if.end.7098
.if.false.7098:
br label %.if.end.7098
.if.end.7098:
br label %.for.start.7069
.for.end.7069:
%.tmp7100 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %found.7064
ret %m2756$.ScopeItem.type* %.tmp7100
}
define %m2756$.ScopeItem.type* @m295$find_defined_here.m2756$.ScopeItem.typep.m2756$.CompilerCtx.typep.m2756$.Scope.typep.cp(%m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%s = alloca %m2756$.Scope.type*
store %m2756$.Scope.type* %.s.arg, %m2756$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp7101 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s
%.tmp7102 = icmp eq %m2756$.Scope.type* %.tmp7101, null
br i1 %.tmp7102, label %.if.true.7103, label %.if.false.7103
.if.true.7103:
%.tmp7104 = bitcast ptr null to %m2756$.ScopeItem.type*
ret %m2756$.ScopeItem.type* %.tmp7104
br label %.if.end.7103
.if.false.7103:
br label %.if.end.7103
.if.end.7103:
%.tmp7106 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s
%.tmp7107 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp7106, i32 0, i32 1
%.tmp7108 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %.tmp7107
%item.7109 = alloca %m2756$.ScopeItem.type*
store %m2756$.ScopeItem.type* %.tmp7108, %m2756$.ScopeItem.type** %item.7109
br label %.for.start.7105
.for.start.7105:
%.tmp7110 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %item.7109
%.tmp7111 = icmp ne %m2756$.ScopeItem.type* %.tmp7110, null
br i1 %.tmp7111, label %.for.continue.7105, label %.for.end.7105
.for.continue.7105:
%.tmp7112 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %item.7109
%.tmp7113 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp7112, i32 0, i32 0
%.tmp7114 = load i8*, i8** %.tmp7113
%.tmp7115 = load i8*, i8** %name
%.tmp7116 = call i32(i8*,i8*) @strcmp(i8* %.tmp7114, i8* %.tmp7115)
%.tmp7117 = icmp eq i32 %.tmp7116, 0
br i1 %.tmp7117, label %.if.true.7118, label %.if.false.7118
.if.true.7118:
%.tmp7119 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %item.7109
ret %m2756$.ScopeItem.type* %.tmp7119
br label %.if.end.7118
.if.false.7118:
br label %.if.end.7118
.if.end.7118:
%.tmp7120 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %item.7109
%.tmp7121 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp7120, i32 0, i32 2
%.tmp7122 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %.tmp7121
store %m2756$.ScopeItem.type* %.tmp7122, %m2756$.ScopeItem.type** %item.7109
br label %.for.start.7105
.for.end.7105:
%.tmp7123 = bitcast ptr null to %m2756$.ScopeItem.type*
ret %m2756$.ScopeItem.type* %.tmp7123
}
define %m2756$.ScopeItem.type* @m295$find_defined_str.m2756$.ScopeItem.typep.m2756$.CompilerCtx.typep.cp.cp(%m2756$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp7124 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7125 = load i8*, i8** %module
%.tmp7126 = call %m2756$.ModuleLookup.type*(%m2756$.CompilerCtx.type*,i8*) @m295$get_module.m2756$.ModuleLookup.typep.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.tmp7124, i8* %.tmp7125)
%mod.7127 = alloca %m2756$.ModuleLookup.type*
store %m2756$.ModuleLookup.type* %.tmp7126, %m2756$.ModuleLookup.type** %mod.7127
%.tmp7128 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.7127
%.tmp7129 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp7128, i32 0, i32 3
%.tmp7130 = load %m2756$.Scope.type*, %m2756$.Scope.type** %.tmp7129
%.tmp7131 = icmp ne %m2756$.Scope.type* %.tmp7130, null
%.tmp7133 = getelementptr [77 x i8], [77 x i8]*@.str7132, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7131, i8* %.tmp7133)
%.tmp7135 = load %m2756$.ModuleLookup.type*, %m2756$.ModuleLookup.type** %mod.7127
%.tmp7136 = getelementptr %m2756$.ModuleLookup.type, %m2756$.ModuleLookup.type* %.tmp7135, i32 0, i32 3
%.tmp7137 = load %m2756$.Scope.type*, %m2756$.Scope.type** %.tmp7136
%s.7138 = alloca %m2756$.Scope.type*
store %m2756$.Scope.type* %.tmp7137, %m2756$.Scope.type** %s.7138
br label %.for.start.7134
.for.start.7134:
%.tmp7139 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.7138
%.tmp7140 = icmp ne %m2756$.Scope.type* %.tmp7139, null
br i1 %.tmp7140, label %.for.continue.7134, label %.for.end.7134
.for.continue.7134:
%.tmp7141 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7142 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.7138
%.tmp7143 = load i8*, i8** %assignable_name
%.tmp7144 = call %m2756$.ScopeItem.type*(%m2756$.CompilerCtx.type*,%m2756$.Scope.type*,i8*) @m295$find_defined_here.m2756$.ScopeItem.typep.m2756$.CompilerCtx.typep.m2756$.Scope.typep.cp(%m2756$.CompilerCtx.type* %.tmp7141, %m2756$.Scope.type* %.tmp7142, i8* %.tmp7143)
%item.7145 = alloca %m2756$.ScopeItem.type*
store %m2756$.ScopeItem.type* %.tmp7144, %m2756$.ScopeItem.type** %item.7145
%.tmp7146 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %item.7145
%.tmp7147 = icmp ne %m2756$.ScopeItem.type* %.tmp7146, null
br i1 %.tmp7147, label %.if.true.7148, label %.if.false.7148
.if.true.7148:
%.tmp7149 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %item.7145
ret %m2756$.ScopeItem.type* %.tmp7149
br label %.if.end.7148
.if.false.7148:
br label %.if.end.7148
.if.end.7148:
%.tmp7150 = load %m2756$.Scope.type*, %m2756$.Scope.type** %s.7138
%.tmp7151 = getelementptr %m2756$.Scope.type, %m2756$.Scope.type* %.tmp7150, i32 0, i32 5
%.tmp7152 = load %m2756$.Scope.type*, %m2756$.Scope.type** %.tmp7151
store %m2756$.Scope.type* %.tmp7152, %m2756$.Scope.type** %s.7138
br label %.for.start.7134
.for.end.7134:
%.tmp7153 = bitcast ptr null to %m2756$.ScopeItem.type*
ret %m2756$.ScopeItem.type* %.tmp7153
}
define %m2756$.ScopeItem.type* @m295$find_defined.m2756$.ScopeItem.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%dotted_name = alloca %m980$.Node.type*
store %m980$.Node.type* %.dotted_name.arg, %m980$.Node.type** %dotted_name
%.tmp7154 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7155 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7156 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp7155, i32 0, i32 7
%.tmp7157 = load i8*, i8** %.tmp7156
%.tmp7158 = load %m980$.Node.type*, %m980$.Node.type** %dotted_name
%.tmp7159 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7158, i32 0, i32 7
%.tmp7160 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7159
%.tmp7161 = call %m2756$.ScopeItem.type*(%m2756$.CompilerCtx.type*,i8*,%m980$.Node.type*) @m295$find_defined_in.m2756$.ScopeItem.typep.m2756$.CompilerCtx.typep.cp.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp7154, i8* %.tmp7157, %m980$.Node.type* %.tmp7160)
ret %m2756$.ScopeItem.type* %.tmp7161
}
define %m2756$.AssignableInfo.type* @m295$get_dotted_name.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.dot_name_ptr.arg, %m2756$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m980$.Node.type*
store %m980$.Node.type* %.dot_name_ptr.arg, %m980$.Node.type** %dot_name_ptr
%info = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.info.arg, %m2756$.AssignableInfo.type** %info
%.tmp7163 = getelementptr [1 x i8], [1 x i8]*@.str7162, i32 0, i32 0
%err_msg.7164 = alloca i8*
store i8* %.tmp7163, i8** %err_msg.7164
%.tmp7166 = getelementptr [1 x i8], [1 x i8]*@.str7165, i32 0, i32 0
%buf.7167 = alloca i8*
store i8* %.tmp7166, i8** %buf.7167
%.tmp7168 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp7169 = icmp eq %m2756$.AssignableInfo.type* %.tmp7168, null
br i1 %.tmp7169, label %.if.true.7170, label %.if.false.7170
.if.true.7170:
%.tmp7171 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7172 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7174 = getelementptr [54 x i8], [54 x i8]*@.str7173, i32 0, i32 0
%.tmp7175 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp7171, %m980$.Node.type* %.tmp7172, i8* %.tmp7174)
%.tmp7176 = call i32(i8*,...) @printf(i8* %.tmp7175)
%.tmp7177 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp7177
br label %.if.end.7170
.if.false.7170:
br label %.if.end.7170
.if.end.7170:
%.tmp7178 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp7179 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7178, i32 0, i32 3
%.tmp7180 = load i8*, i8** %.tmp7179
%.tmp7182 = getelementptr [9 x i8], [9 x i8]*@.str7181, i32 0, i32 0
%.tmp7183 = call i32(i8*,i8*) @strcmp(i8* %.tmp7180, i8* %.tmp7182)
%.tmp7184 = icmp eq i32 %.tmp7183, 0
%.tmp7185 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp7186 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7185, i32 0, i32 3
%.tmp7187 = load i8*, i8** %.tmp7186
%.tmp7189 = getelementptr [7 x i8], [7 x i8]*@.str7188, i32 0, i32 0
%.tmp7190 = call i32(i8*,i8*) @strcmp(i8* %.tmp7187, i8* %.tmp7189)
%.tmp7191 = icmp eq i32 %.tmp7190, 0
%.tmp7192 = or i1 %.tmp7184, %.tmp7191
br i1 %.tmp7192, label %.if.true.7193, label %.if.false.7193
.if.true.7193:
%.tmp7194 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7195 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7194, i32 0, i32 8
%.tmp7196 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7195
%.tmp7197 = icmp ne %m980$.Node.type* %.tmp7196, null
br i1 %.tmp7197, label %.if.true.7198, label %.if.false.7198
.if.true.7198:
%.tmp7199 = getelementptr i8*, i8** %err_msg.7164, i32 0
%.tmp7201 = getelementptr [46 x i8], [46 x i8]*@.str7200, i32 0, i32 0
%.tmp7202 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7203 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7202, i32 0, i32 8
%.tmp7204 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7203
%.tmp7205 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7204, i32 0, i32 8
%.tmp7206 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7205
%.tmp7207 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7206, i32 0, i32 1
%.tmp7208 = load i8*, i8** %.tmp7207
%.tmp7209 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7210 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7209, i32 0, i32 1
%.tmp7211 = load i8*, i8** %.tmp7210
%.tmp7212 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7199, i8* %.tmp7201, i8* %.tmp7208, i8* %.tmp7211)
%.tmp7213 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7214 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7215 = load i8*, i8** %err_msg.7164
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp7213, %m980$.Node.type* %.tmp7214, i8* %.tmp7215)
%.tmp7216 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp7216
br label %.if.end.7198
.if.false.7198:
br label %.if.end.7198
.if.end.7198:
%.tmp7217 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
ret %m2756$.AssignableInfo.type* %.tmp7217
br label %.if.end.7193
.if.false.7193:
%.tmp7218 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp7219 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7218, i32 0, i32 3
%.tmp7220 = load i8*, i8** %.tmp7219
%.tmp7222 = getelementptr [9 x i8], [9 x i8]*@.str7221, i32 0, i32 0
%.tmp7223 = call i32(i8*,i8*) @strcmp(i8* %.tmp7220, i8* %.tmp7222)
%.tmp7224 = icmp eq i32 %.tmp7223, 0
%.tmp7225 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7226 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7225, i32 0, i32 8
%.tmp7227 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7226
%.tmp7228 = icmp ne %m980$.Node.type* %.tmp7227, null
%.tmp7229 = and i1 %.tmp7224, %.tmp7228
br i1 %.tmp7229, label %.if.true.7230, label %.if.false.7230
.if.true.7230:
%.tmp7231 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%base_var.7232 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp7231, %m2756$.AssignableInfo.type** %base_var.7232
%.tmp7233 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base_var.7232
%.tmp7234 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7233, i32 0, i32 4
%.tmp7235 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7234
%struct_info.7236 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp7235, %m2756$.Type.type** %struct_info.7236
br label %.for.start.7237
.for.start.7237:
%.tmp7238 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base_var.7232
%.tmp7239 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7238, i32 0, i32 4
%.tmp7240 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7239
%.tmp7241 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7240, i32 0, i32 0
%.tmp7242 = load i8*, i8** %.tmp7241
%.tmp7244 = getelementptr [4 x i8], [4 x i8]*@.str7243, i32 0, i32 0
%.tmp7245 = call i32(i8*,i8*) @strcmp(i8* %.tmp7242, i8* %.tmp7244)
%.tmp7246 = icmp eq i32 %.tmp7245, 0
br i1 %.tmp7246, label %.for.continue.7237, label %.for.end.7237
.for.continue.7237:
%.tmp7247 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7248 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7247)
%new_base.7249 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp7248, %m2756$.AssignableInfo.type** %new_base.7249
%.tmp7250 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7251 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7249
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp7250, %m2756$.AssignableInfo.type* %.tmp7251)
%.tmp7252 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7249
%.tmp7253 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7252, i32 0, i32 4
%.tmp7254 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base_var.7232
%.tmp7255 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7254, i32 0, i32 4
%.tmp7256 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7255
%.tmp7257 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7256, i32 0, i32 3
%.tmp7258 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7257
store %m2756$.Type.type* %.tmp7258, %m2756$.Type.type** %.tmp7253
%.tmp7259 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7260 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp7259, i32 0, i32 1
%.tmp7261 = load %m0$.File.type*, %m0$.File.type** %.tmp7260
%.tmp7263 = getelementptr [23 x i8], [23 x i8]*@.str7262, i32 0, i32 0
%.tmp7264 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7249
%.tmp7265 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7264)
%.tmp7266 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7267 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7249
%.tmp7268 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7267, i32 0, i32 4
%.tmp7269 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7268
%.tmp7270 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp7266, %m2756$.Type.type* %.tmp7269)
%.tmp7271 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7272 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base_var.7232
%.tmp7273 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7272, i32 0, i32 4
%.tmp7274 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7273
%.tmp7275 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp7271, %m2756$.Type.type* %.tmp7274)
%.tmp7276 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base_var.7232
%.tmp7277 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7276)
%.tmp7278 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7261, i8* %.tmp7263, i8* %.tmp7265, i8* %.tmp7270, i8* %.tmp7275, i8* %.tmp7277)
%.tmp7279 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7249
store %m2756$.AssignableInfo.type* %.tmp7279, %m2756$.AssignableInfo.type** %base_var.7232
%.tmp7280 = load %m2756$.Type.type*, %m2756$.Type.type** %struct_info.7236
%.tmp7281 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7280, i32 0, i32 3
%.tmp7282 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7281
store %m2756$.Type.type* %.tmp7282, %m2756$.Type.type** %struct_info.7236
br label %.for.start.7237
.for.end.7237:
%.tmp7283 = load %m2756$.Type.type*, %m2756$.Type.type** %struct_info.7236
%.tmp7284 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7283, i32 0, i32 0
%.tmp7285 = load i8*, i8** %.tmp7284
%.tmp7287 = getelementptr [10 x i8], [10 x i8]*@.str7286, i32 0, i32 0
%.tmp7288 = call i32(i8*,i8*) @strcmp(i8* %.tmp7285, i8* %.tmp7287)
%.tmp7289 = icmp eq i32 %.tmp7288, 0
br i1 %.tmp7289, label %.if.true.7290, label %.if.false.7290
.if.true.7290:
%.tmp7291 = load %m2756$.Type.type*, %m2756$.Type.type** %struct_info.7236
%.tmp7292 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7291, i32 0, i32 3
%.tmp7293 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7292
store %m2756$.Type.type* %.tmp7293, %m2756$.Type.type** %struct_info.7236
br label %.if.end.7290
.if.false.7290:
br label %.if.end.7290
.if.end.7290:
%.tmp7294 = load %m2756$.Type.type*, %m2756$.Type.type** %struct_info.7236
%.tmp7295 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7294, i32 0, i32 0
%.tmp7296 = load i8*, i8** %.tmp7295
%.tmp7298 = getelementptr [7 x i8], [7 x i8]*@.str7297, i32 0, i32 0
%.tmp7299 = call i32(i8*,i8*) @strcmp(i8* %.tmp7296, i8* %.tmp7298)
%.tmp7300 = icmp ne i32 %.tmp7299, 0
br i1 %.tmp7300, label %.if.true.7301, label %.if.false.7301
.if.true.7301:
%.tmp7302 = getelementptr i8*, i8** %err_msg.7164, i32 0
%.tmp7304 = getelementptr [48 x i8], [48 x i8]*@.str7303, i32 0, i32 0
%.tmp7305 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7306 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7305, i32 0, i32 8
%.tmp7307 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7306
%.tmp7308 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7307, i32 0, i32 8
%.tmp7309 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7308
%.tmp7310 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7309, i32 0, i32 1
%.tmp7311 = load i8*, i8** %.tmp7310
%.tmp7312 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7313 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7312, i32 0, i32 1
%.tmp7314 = load i8*, i8** %.tmp7313
%.tmp7315 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7302, i8* %.tmp7304, i8* %.tmp7311, i8* %.tmp7314)
%.tmp7316 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7317 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7318 = load i8*, i8** %err_msg.7164
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp7316, %m980$.Node.type* %.tmp7317, i8* %.tmp7318)
%.tmp7319 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp7319
br label %.if.end.7301
.if.false.7301:
br label %.if.end.7301
.if.end.7301:
%.tmp7320 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7321 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7320, i32 0, i32 8
%.tmp7322 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7321
%.tmp7323 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7322, i32 0, i32 8
%.tmp7324 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7323
%.tmp7325 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7324, i32 0, i32 1
%.tmp7326 = load i8*, i8** %.tmp7325
%field_name.7327 = alloca i8*
store i8* %.tmp7326, i8** %field_name.7327
%field_id.7328 = alloca i32
store i32 0, i32* %field_id.7328
%.tmp7329 = bitcast ptr null to %m2756$.Type.type*
%found_field.7330 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp7329, %m2756$.Type.type** %found_field.7330
%.tmp7332 = load %m2756$.Type.type*, %m2756$.Type.type** %struct_info.7236
%.tmp7333 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7332, i32 0, i32 3
%.tmp7334 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7333
%field.7335 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp7334, %m2756$.Type.type** %field.7335
br label %.for.start.7331
.for.start.7331:
%.tmp7336 = load %m2756$.Type.type*, %m2756$.Type.type** %field.7335
%.tmp7337 = icmp ne %m2756$.Type.type* %.tmp7336, null
br i1 %.tmp7337, label %.for.continue.7331, label %.for.end.7331
.for.continue.7331:
%.tmp7338 = load %m2756$.Type.type*, %m2756$.Type.type** %field.7335
%.tmp7339 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7338, i32 0, i32 1
%.tmp7340 = load i8*, i8** %.tmp7339
%.tmp7341 = load i8*, i8** %field_name.7327
%.tmp7342 = call i32(i8*,i8*) @strcmp(i8* %.tmp7340, i8* %.tmp7341)
%.tmp7343 = icmp eq i32 %.tmp7342, 0
br i1 %.tmp7343, label %.if.true.7344, label %.if.false.7344
.if.true.7344:
%.tmp7345 = load %m2756$.Type.type*, %m2756$.Type.type** %field.7335
store %m2756$.Type.type* %.tmp7345, %m2756$.Type.type** %found_field.7330
br label %.for.end.7331
br label %.if.end.7344
.if.false.7344:
%.tmp7346 = load i32, i32* %field_id.7328
%.tmp7347 = add i32 %.tmp7346, 1
store i32 %.tmp7347, i32* %field_id.7328
br label %.if.end.7344
.if.end.7344:
%.tmp7348 = load %m2756$.Type.type*, %m2756$.Type.type** %field.7335
%.tmp7349 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7348, i32 0, i32 4
%.tmp7350 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7349
store %m2756$.Type.type* %.tmp7350, %m2756$.Type.type** %field.7335
br label %.for.start.7331
.for.end.7331:
%.tmp7351 = load %m2756$.Type.type*, %m2756$.Type.type** %found_field.7330
%.tmp7352 = icmp eq %m2756$.Type.type* %.tmp7351, null
br i1 %.tmp7352, label %.if.true.7353, label %.if.false.7353
.if.true.7353:
%.tmp7354 = getelementptr i8*, i8** %err_msg.7164, i32 0
%.tmp7356 = getelementptr [34 x i8], [34 x i8]*@.str7355, i32 0, i32 0
%.tmp7357 = load i8*, i8** %field_name.7327
%.tmp7358 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7359 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7358, i32 0, i32 1
%.tmp7360 = load i8*, i8** %.tmp7359
%.tmp7361 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7354, i8* %.tmp7356, i8* %.tmp7357, i8* %.tmp7360)
%.tmp7362 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7363 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7364 = load i8*, i8** %err_msg.7164
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp7362, %m980$.Node.type* %.tmp7363, i8* %.tmp7364)
%.tmp7365 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp7365
br label %.if.end.7353
.if.false.7353:
br label %.if.end.7353
.if.end.7353:
%.tmp7366 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7367 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7366)
%new_info.7368 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp7367, %m2756$.AssignableInfo.type** %new_info.7368
%.tmp7369 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_info.7368
%.tmp7370 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7369, i32 0, i32 4
%.tmp7371 = load %m2756$.Type.type*, %m2756$.Type.type** %found_field.7330
store %m2756$.Type.type* %.tmp7371, %m2756$.Type.type** %.tmp7370
%.tmp7372 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7373 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_info.7368
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp7372, %m2756$.AssignableInfo.type* %.tmp7373)
%.tmp7374 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_info.7368
%.tmp7375 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7374, i32 0, i32 3
%.tmp7377 = getelementptr [9 x i8], [9 x i8]*@.str7376, i32 0, i32 0
store i8* %.tmp7377, i8** %.tmp7375
%.tmp7378 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7379 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base_var.7232
%.tmp7380 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7379, i32 0, i32 4
%.tmp7381 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7380
%.tmp7382 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp7378, %m2756$.Type.type* %.tmp7381)
%info_tr.7383 = alloca i8*
store i8* %.tmp7382, i8** %info_tr.7383
%.tmp7384 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7385 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp7384, i32 0, i32 1
%.tmp7386 = load %m0$.File.type*, %m0$.File.type** %.tmp7385
%.tmp7388 = getelementptr [46 x i8], [46 x i8]*@.str7387, i32 0, i32 0
%.tmp7389 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_info.7368
%.tmp7390 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7389)
%.tmp7391 = load i8*, i8** %info_tr.7383
%.tmp7392 = load i8*, i8** %info_tr.7383
%.tmp7393 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base_var.7232
%.tmp7394 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7393)
%.tmp7395 = load i32, i32* %field_id.7328
%.tmp7396 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7386, i8* %.tmp7388, i8* %.tmp7390, i8* %.tmp7391, i8* %.tmp7392, i8* %.tmp7394, i32 %.tmp7395)
%.tmp7397 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7398 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7399 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7398, i32 0, i32 8
%.tmp7400 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7399
%.tmp7401 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7400, i32 0, i32 8
%.tmp7402 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7401
%.tmp7403 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_info.7368
%.tmp7404 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,%m2756$.AssignableInfo.type*) @m295$get_dotted_name.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp7397, %m980$.Node.type* %.tmp7402, %m2756$.AssignableInfo.type* %.tmp7403)
ret %m2756$.AssignableInfo.type* %.tmp7404
br label %.if.end.7230
.if.false.7230:
%.tmp7405 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp7406 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7405, i32 0, i32 3
%.tmp7407 = load i8*, i8** %.tmp7406
%.tmp7409 = getelementptr [9 x i8], [9 x i8]*@.str7408, i32 0, i32 0
%.tmp7410 = call i32(i8*,i8*) @strcmp(i8* %.tmp7407, i8* %.tmp7409)
%.tmp7411 = icmp eq i32 %.tmp7410, 0
br i1 %.tmp7411, label %.if.true.7412, label %.if.false.7412
.if.true.7412:
%.tmp7413 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
ret %m2756$.AssignableInfo.type* %.tmp7413
br label %.if.end.7412
.if.false.7412:
br label %.if.end.7412
.if.end.7412:
br label %.if.end.7230
.if.end.7230:
br label %.if.end.7193
.if.end.7193:
%.tmp7414 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7415 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7417 = getelementptr [43 x i8], [43 x i8]*@.str7416, i32 0, i32 0
%.tmp7418 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp7414, %m980$.Node.type* %.tmp7415, i8* %.tmp7417)
%.tmp7419 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
%.tmp7420 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7419, i32 0, i32 3
%.tmp7421 = load i8*, i8** %.tmp7420
%.tmp7422 = call i32(i8*,...) @printf(i8* %.tmp7418, i8* %.tmp7421)
%.tmp7423 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp7423
}
define %m2756$.AssignableInfo.type* @m295$compile_addr.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp7425 = getelementptr [1 x i8], [1 x i8]*@.str7424, i32 0, i32 0
%err_msg.7426 = alloca i8*
store i8* %.tmp7425, i8** %err_msg.7426
%.tmp7427 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%curr_node.7428 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7427, %m980$.Node.type** %curr_node.7428
%.tmp7429 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7428
%.tmp7430 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7429, i32 0, i32 0
%.tmp7431 = load i8*, i8** %.tmp7430
%.tmp7433 = getelementptr [17 x i8], [17 x i8]*@.str7432, i32 0, i32 0
%.tmp7434 = call i32(i8*,i8*) @strcmp(i8* %.tmp7431, i8* %.tmp7433)
%.tmp7435 = icmp eq i32 %.tmp7434, 0
%.tmp7436 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7428
%.tmp7437 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7436, i32 0, i32 0
%.tmp7438 = load i8*, i8** %.tmp7437
%.tmp7440 = getelementptr [16 x i8], [16 x i8]*@.str7439, i32 0, i32 0
%.tmp7441 = call i32(i8*,i8*) @strcmp(i8* %.tmp7438, i8* %.tmp7440)
%.tmp7442 = icmp eq i32 %.tmp7441, 0
%.tmp7443 = or i1 %.tmp7435, %.tmp7442
%.tmp7444 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7428
%.tmp7445 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7444, i32 0, i32 0
%.tmp7446 = load i8*, i8** %.tmp7445
%.tmp7448 = getelementptr [11 x i8], [11 x i8]*@.str7447, i32 0, i32 0
%.tmp7449 = call i32(i8*,i8*) @strcmp(i8* %.tmp7446, i8* %.tmp7448)
%.tmp7450 = icmp eq i32 %.tmp7449, 0
%.tmp7451 = or i1 %.tmp7443, %.tmp7450
br i1 %.tmp7451, label %.if.true.7452, label %.if.false.7452
.if.true.7452:
%.tmp7453 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7454 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp7455 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7454, i32 0, i32 7
%.tmp7456 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7455
%.tmp7457 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp7453, %m980$.Node.type* %.tmp7456)
ret %m2756$.AssignableInfo.type* %.tmp7457
br label %.if.end.7452
.if.false.7452:
br label %.if.end.7452
.if.end.7452:
%.tmp7458 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7428
%.tmp7459 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7458, i32 0, i32 0
%.tmp7460 = load i8*, i8** %.tmp7459
%.tmp7462 = getelementptr [12 x i8], [12 x i8]*@.str7461, i32 0, i32 0
%.tmp7463 = call i32(i8*,i8*) @strcmp(i8* %.tmp7460, i8* %.tmp7462)
%.tmp7464 = icmp ne i32 %.tmp7463, 0
br i1 %.tmp7464, label %.if.true.7465, label %.if.false.7465
.if.true.7465:
%.tmp7467 = getelementptr [92 x i8], [92 x i8]*@.str7466, i32 0, i32 0
%.tmp7468 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7428
%.tmp7469 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7468, i32 0, i32 0
%.tmp7470 = load i8*, i8** %.tmp7469
%.tmp7471 = call i32(i8*,...) @printf(i8* %.tmp7467, i8* %.tmp7470)
%.tmp7472 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp7473 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7472, i32 0, i32 7
%.tmp7474 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7473
store %m980$.Node.type* %.tmp7474, %m980$.Node.type** %curr_node.7428
br label %.if.end.7465
.if.false.7465:
br label %.if.end.7465
.if.end.7465:
%.tmp7475 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7428
%.tmp7476 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7475, i32 0, i32 7
%.tmp7477 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7476
%assignable_name.7478 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7477, %m980$.Node.type** %assignable_name.7478
%.tmp7479 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7480 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7481 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp7480, i32 0, i32 7
%.tmp7482 = load i8*, i8** %.tmp7481
%.tmp7483 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7478
%.tmp7484 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7483, i32 0, i32 7
%.tmp7485 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7484
%.tmp7486 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7485, i32 0, i32 1
%.tmp7487 = load i8*, i8** %.tmp7486
%.tmp7488 = call %m2756$.ScopeItem.type*(%m2756$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2756$.ScopeItem.typep.m2756$.CompilerCtx.typep.cp.cp(%m2756$.CompilerCtx.type* %.tmp7479, i8* %.tmp7482, i8* %.tmp7487)
%scope_info.7489 = alloca %m2756$.ScopeItem.type*
store %m2756$.ScopeItem.type* %.tmp7488, %m2756$.ScopeItem.type** %scope_info.7489
%.tmp7490 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %scope_info.7489
%.tmp7491 = icmp eq %m2756$.ScopeItem.type* %.tmp7490, null
br i1 %.tmp7491, label %.if.true.7492, label %.if.false.7492
.if.true.7492:
%.tmp7493 = getelementptr i8*, i8** %err_msg.7426, i32 0
%.tmp7495 = getelementptr [41 x i8], [41 x i8]*@.str7494, i32 0, i32 0
%.tmp7496 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7478
%.tmp7497 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7496, i32 0, i32 7
%.tmp7498 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7497
%.tmp7499 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7498, i32 0, i32 1
%.tmp7500 = load i8*, i8** %.tmp7499
%.tmp7501 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7493, i8* %.tmp7495, i8* %.tmp7500)
%.tmp7502 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7503 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7478
%.tmp7504 = load i8*, i8** %err_msg.7426
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp7502, %m980$.Node.type* %.tmp7503, i8* %.tmp7504)
%.tmp7505 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp7505
br label %.if.end.7492
.if.false.7492:
br label %.if.end.7492
.if.end.7492:
%.tmp7506 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %scope_info.7489
%.tmp7507 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp7506, i32 0, i32 1
%.tmp7508 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %.tmp7507
%info.7509 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp7508, %m2756$.AssignableInfo.type** %info.7509
%.tmp7510 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7509
%.tmp7511 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7510, i32 0, i32 3
%.tmp7512 = load i8*, i8** %.tmp7511
%.tmp7514 = getelementptr [7 x i8], [7 x i8]*@.str7513, i32 0, i32 0
%.tmp7515 = call i32(i8*,i8*) @strcmp(i8* %.tmp7512, i8* %.tmp7514)
%.tmp7516 = icmp eq i32 %.tmp7515, 0
br i1 %.tmp7516, label %.if.true.7517, label %.if.false.7517
.if.true.7517:
%.tmp7518 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7519 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7509
%.tmp7520 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7519)
%.tmp7521 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7478
%.tmp7522 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7521, i32 0, i32 7
%.tmp7523 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7522
%.tmp7524 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7523, i32 0, i32 8
%.tmp7525 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7524
%.tmp7526 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7525, i32 0, i32 8
%.tmp7527 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7526
%.tmp7528 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7527, i32 0, i32 1
%.tmp7529 = load i8*, i8** %.tmp7528
%.tmp7530 = call %m2756$.ScopeItem.type*(%m2756$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2756$.ScopeItem.typep.m2756$.CompilerCtx.typep.cp.cp(%m2756$.CompilerCtx.type* %.tmp7518, i8* %.tmp7520, i8* %.tmp7529)
store %m2756$.ScopeItem.type* %.tmp7530, %m2756$.ScopeItem.type** %scope_info.7489
%.tmp7531 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %scope_info.7489
%.tmp7532 = icmp eq %m2756$.ScopeItem.type* %.tmp7531, null
br i1 %.tmp7532, label %.if.true.7533, label %.if.false.7533
.if.true.7533:
%.tmp7534 = getelementptr i8*, i8** %err_msg.7426, i32 0
%.tmp7536 = getelementptr [31 x i8], [31 x i8]*@.str7535, i32 0, i32 0
%.tmp7537 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7478
%.tmp7538 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7537, i32 0, i32 7
%.tmp7539 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7538
%.tmp7540 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7539, i32 0, i32 8
%.tmp7541 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7540
%.tmp7542 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7541, i32 0, i32 8
%.tmp7543 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7542
%.tmp7544 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7543, i32 0, i32 1
%.tmp7545 = load i8*, i8** %.tmp7544
%.tmp7546 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7509
%.tmp7547 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7546)
%.tmp7548 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7534, i8* %.tmp7536, i8* %.tmp7545, i8* %.tmp7547)
%.tmp7549 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7550 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7428
%.tmp7551 = load i8*, i8** %err_msg.7426
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp7549, %m980$.Node.type* %.tmp7550, i8* %.tmp7551)
%.tmp7552 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp7552
br label %.if.end.7533
.if.false.7533:
br label %.if.end.7533
.if.end.7533:
%.tmp7553 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %scope_info.7489
%.tmp7554 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp7553, i32 0, i32 1
%.tmp7555 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %.tmp7554
store %m2756$.AssignableInfo.type* %.tmp7555, %m2756$.AssignableInfo.type** %info.7509
%.tmp7556 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7478
%.tmp7557 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7556, i32 0, i32 7
%.tmp7558 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7557
%.tmp7559 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7558, i32 0, i32 8
%.tmp7560 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7559
%.tmp7561 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7560, i32 0, i32 8
%.tmp7562 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7561
store %m980$.Node.type* %.tmp7562, %m980$.Node.type** %assignable_name.7478
br label %.if.end.7517
.if.false.7517:
%.tmp7563 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7478
%.tmp7564 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7563, i32 0, i32 7
%.tmp7565 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7564
store %m980$.Node.type* %.tmp7565, %m980$.Node.type** %assignable_name.7478
br label %.if.end.7517
.if.end.7517:
%.tmp7566 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7567 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7478
%.tmp7568 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7509
%.tmp7569 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,%m2756$.AssignableInfo.type*) @m295$get_dotted_name.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp7566, %m980$.Node.type* %.tmp7567, %m2756$.AssignableInfo.type* %.tmp7568)
%base.7570 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp7569, %m2756$.AssignableInfo.type** %base.7570
%.tmp7572 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7428
%.tmp7573 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7572, i32 0, i32 7
%.tmp7574 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7573
%.tmp7575 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7574, i32 0, i32 8
%.tmp7576 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7575
%addr.7577 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7576, %m980$.Node.type** %addr.7577
br label %.for.start.7571
.for.start.7571:
%.tmp7578 = load %m980$.Node.type*, %m980$.Node.type** %addr.7577
%.tmp7579 = icmp ne %m980$.Node.type* %.tmp7578, null
br i1 %.tmp7579, label %.for.continue.7571, label %.for.end.7571
.for.continue.7571:
%.tmp7580 = load %m980$.Node.type*, %m980$.Node.type** %addr.7577
%.tmp7581 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7580, i32 0, i32 8
%.tmp7582 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7581
%index.7583 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7582, %m980$.Node.type** %index.7583
%.tmp7584 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7585 = load %m980$.Node.type*, %m980$.Node.type** %index.7583
%.tmp7586 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp7584, %m980$.Node.type* %.tmp7585)
%index_info.7587 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp7586, %m2756$.AssignableInfo.type** %index_info.7587
%.tmp7588 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7589 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %index_info.7587
%.tmp7590 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7589, i32 0, i32 4
%.tmp7591 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7590
%.tmp7592 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp7588, %m2756$.Type.type* %.tmp7591)
%index_type.7593 = alloca i8*
store i8* %.tmp7592, i8** %index_type.7593
%.tmp7594 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base.7570
%.tmp7595 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7594, i32 0, i32 4
%.tmp7596 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7595
%.tmp7597 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7596, i32 0, i32 1
%.tmp7598 = load i8*, i8** %.tmp7597
%.tmp7599 = icmp ne i8* %.tmp7598, null
br i1 %.tmp7599, label %.if.true.7600, label %.if.false.7600
.if.true.7600:
%.tmp7601 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base.7570
%.tmp7602 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7601, i32 0, i32 4
%.tmp7603 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7602
%.tmp7604 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7603, i32 0, i32 1
%.tmp7605 = load i8*, i8** %.tmp7604
%.tmp7607 = getelementptr [6 x i8], [6 x i8]*@.str7606, i32 0, i32 0
%.tmp7608 = call i32(i8*,i8*) @strcmp(i8* %.tmp7605, i8* %.tmp7607)
%.tmp7609 = icmp eq i32 %.tmp7608, 0
br i1 %.tmp7609, label %.if.true.7610, label %.if.false.7610
.if.true.7610:
%.tmp7611 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7428
%.tmp7612 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7611)
%new_base.7613 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp7612, %m2756$.AssignableInfo.type** %new_base.7613
%.tmp7614 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7615 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7613
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp7614, %m2756$.AssignableInfo.type* %.tmp7615)
%.tmp7616 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7617 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp7616, i32 0, i32 1
%.tmp7618 = load %m0$.File.type*, %m0$.File.type** %.tmp7617
%.tmp7620 = getelementptr [45 x i8], [45 x i8]*@.str7619, i32 0, i32 0
%.tmp7621 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7613
%.tmp7622 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7621)
%.tmp7623 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7624 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base.7570
%.tmp7625 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7624, i32 0, i32 4
%.tmp7626 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7625
%.tmp7627 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp7623, %m2756$.Type.type* %.tmp7626)
%.tmp7628 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7629 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base.7570
%.tmp7630 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7629, i32 0, i32 4
%.tmp7631 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7630
%.tmp7632 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp7628, %m2756$.Type.type* %.tmp7631)
%.tmp7633 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base.7570
%.tmp7634 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7633)
%.tmp7635 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7618, i8* %.tmp7620, i8* %.tmp7622, i8* %.tmp7627, i8* %.tmp7632, i8* %.tmp7634)
%.tmp7636 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7613
%.tmp7637 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7636, i32 0, i32 4
%.tmp7638 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base.7570
%.tmp7639 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7638, i32 0, i32 4
%.tmp7640 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7639
%.tmp7641 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7640, i32 0, i32 3
%.tmp7642 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7641
%.tmp7643 = call %m2756$.Type.type*(%m2756$.Type.type*) @m295$type_clone.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.tmp7642)
store %m2756$.Type.type* %.tmp7643, %m2756$.Type.type** %.tmp7637
%.tmp7644 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7613
%.tmp7645 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7644, i32 0, i32 4
%.tmp7646 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7645
%.tmp7647 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7646, i32 0, i32 4
store %m2756$.Type.type* null, %m2756$.Type.type** %.tmp7647
%.tmp7648 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7613
store %m2756$.AssignableInfo.type* %.tmp7648, %m2756$.AssignableInfo.type** %base.7570
br label %.if.end.7610
.if.false.7610:
br label %.if.end.7610
.if.end.7610:
br label %.if.end.7600
.if.false.7600:
br label %.if.end.7600
.if.end.7600:
%.tmp7649 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7650 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base.7570
%.tmp7651 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7650, i32 0, i32 4
%.tmp7652 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7651
%.tmp7653 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp7649, %m2756$.Type.type* %.tmp7652)
%base_type.7654 = alloca i8*
store i8* %.tmp7653, i8** %base_type.7654
%.tmp7655 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7656 = call i32(%m2756$.CompilerCtx.type*) @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp7655)
%tmp_id.7657 = alloca i32
store i32 %.tmp7656, i32* %tmp_id.7657
%.tmp7658 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7659 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp7658, i32 0, i32 1
%.tmp7660 = load %m0$.File.type*, %m0$.File.type** %.tmp7659
%.tmp7662 = getelementptr [28 x i8], [28 x i8]*@.str7661, i32 0, i32 0
%.tmp7663 = load i32, i32* %tmp_id.7657
%.tmp7664 = load i8*, i8** %base_type.7654
%.tmp7665 = load i8*, i8** %base_type.7654
%.tmp7666 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base.7570
%.tmp7667 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7666)
%.tmp7668 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7660, i8* %.tmp7662, i32 %.tmp7663, i8* %.tmp7664, i8* %.tmp7665, i8* %.tmp7667)
%.tmp7669 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7428
%.tmp7670 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7669)
%new_base.7671 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp7670, %m2756$.AssignableInfo.type** %new_base.7671
%.tmp7672 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7673 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7671
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp7672, %m2756$.AssignableInfo.type* %.tmp7673)
%.tmp7674 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base.7570
%.tmp7675 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7674, i32 0, i32 4
%.tmp7676 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7675
%.tmp7677 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7676, i32 0, i32 3
%.tmp7678 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7677
%.tmp7679 = icmp eq %m2756$.Type.type* %.tmp7678, null
br i1 %.tmp7679, label %.if.true.7680, label %.if.false.7680
.if.true.7680:
%.tmp7681 = getelementptr i8*, i8** %err_msg.7426, i32 0
%.tmp7683 = getelementptr [35 x i8], [35 x i8]*@.str7682, i32 0, i32 0
%.tmp7684 = load i8*, i8** %base_type.7654
%.tmp7685 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7681, i8* %.tmp7683, i8* %.tmp7684)
%.tmp7686 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7687 = load %m980$.Node.type*, %m980$.Node.type** %addr.7577
%.tmp7688 = load i8*, i8** %err_msg.7426
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp7686, %m980$.Node.type* %.tmp7687, i8* %.tmp7688)
%.tmp7689 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp7689
br label %.if.end.7680
.if.false.7680:
br label %.if.end.7680
.if.end.7680:
%.tmp7690 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7671
%.tmp7691 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7690, i32 0, i32 4
%.tmp7692 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base.7570
%.tmp7693 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7692, i32 0, i32 4
%.tmp7694 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7693
%.tmp7695 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7694, i32 0, i32 3
%.tmp7696 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7695
store %m2756$.Type.type* %.tmp7696, %m2756$.Type.type** %.tmp7691
%.tmp7697 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7698 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7671
%.tmp7699 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7698, i32 0, i32 4
%.tmp7700 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7699
%.tmp7701 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp7697, %m2756$.Type.type* %.tmp7700)
%base_type_2.7702 = alloca i8*
store i8* %.tmp7701, i8** %base_type_2.7702
%.tmp7703 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7704 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp7703, i32 0, i32 1
%.tmp7705 = load %m0$.File.type*, %m0$.File.type** %.tmp7704
%.tmp7707 = getelementptr [44 x i8], [44 x i8]*@.str7706, i32 0, i32 0
%.tmp7708 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7671
%.tmp7709 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7708)
%.tmp7710 = load i8*, i8** %base_type_2.7702
%.tmp7711 = load i8*, i8** %base_type_2.7702
%.tmp7712 = load i32, i32* %tmp_id.7657
%.tmp7713 = load i8*, i8** %index_type.7593
%.tmp7714 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %index_info.7587
%.tmp7715 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7714)
%.tmp7716 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7705, i8* %.tmp7707, i8* %.tmp7709, i8* %.tmp7710, i8* %.tmp7711, i32 %.tmp7712, i8* %.tmp7713, i8* %.tmp7715)
%.tmp7717 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %new_base.7671
store %m2756$.AssignableInfo.type* %.tmp7717, %m2756$.AssignableInfo.type** %base.7570
%.tmp7718 = load %m980$.Node.type*, %m980$.Node.type** %addr.7577
%.tmp7719 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7718, i32 0, i32 8
%.tmp7720 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7719
%.tmp7721 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7720, i32 0, i32 8
%.tmp7722 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7721
%.tmp7723 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7722, i32 0, i32 8
%.tmp7724 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7723
store %m980$.Node.type* %.tmp7724, %m980$.Node.type** %addr.7577
br label %.for.start.7571
.for.end.7571:
%.tmp7725 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %base.7570
ret %m2756$.AssignableInfo.type* %.tmp7725
}
%m295$.StackHead.type = type {%m2511$.SYStack.type*}
define %m2756$.AssignableInfo.type* @m295$compile_assignable.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%curr_node = alloca %m980$.Node.type*
store %m980$.Node.type* %.curr_node.arg, %m980$.Node.type** %curr_node
%.tmp7726 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp7727 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7726, i32 0, i32 7
%.tmp7728 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7727
%.tmp7730 = getelementptr [16 x i8], [16 x i8]*@.str7729, i32 0, i32 0
%.tmp7731 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp7728, i8* %.tmp7730)
%assignable_start.7732 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7731, %m980$.Node.type** %assignable_start.7732
%.tmp7733 = load %m980$.Node.type*, %m980$.Node.type** %assignable_start.7732
%.tmp7734 = call %m2511$.SYStack.type*(%m980$.Node.type*) @m2511$sy_algorithm.m2511$.SYStack.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7733)
%operator_stack.7735 = alloca %m2511$.SYStack.type*
store %m2511$.SYStack.type* %.tmp7734, %m2511$.SYStack.type** %operator_stack.7735
%.tmp7736 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* null, i32 1
%.tmp7737 = ptrtoint %m295$.StackHead.type* %.tmp7736 to i32
%.tmp7738 = call i8*(i32) @malloc(i32 %.tmp7737)
%.tmp7739 = bitcast i8* %.tmp7738 to %m295$.StackHead.type*
%stack.7740 = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.tmp7739, %m295$.StackHead.type** %stack.7740
%.tmp7741 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7740
%.tmp7742 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7741, i32 0, i32 0
%.tmp7743 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %operator_stack.7735
store %m2511$.SYStack.type* %.tmp7743, %m2511$.SYStack.type** %.tmp7742
%.tmp7744 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7745 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7740
%.tmp7746 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m295$.StackHead.typep(%m2756$.CompilerCtx.type* %.tmp7744, %m295$.StackHead.type* %.tmp7745)
%info.7747 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp7746, %m2756$.AssignableInfo.type** %info.7747
%.tmp7748 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7747
%.tmp7749 = icmp eq %m2756$.AssignableInfo.type* %.tmp7748, null
br i1 %.tmp7749, label %.if.true.7750, label %.if.false.7750
.if.true.7750:
%.tmp7751 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7747
ret %m2756$.AssignableInfo.type* %.tmp7751
br label %.if.end.7750
.if.false.7750:
br label %.if.end.7750
.if.end.7750:
%.tmp7752 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp7753 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7752, i32 0, i32 7
%.tmp7754 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7753
%.tmp7756 = getelementptr [5 x i8], [5 x i8]*@.str7755, i32 0, i32 0
%.tmp7757 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp7754, i8* %.tmp7756)
%cast.7758 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7757, %m980$.Node.type** %cast.7758
%.tmp7759 = load %m980$.Node.type*, %m980$.Node.type** %cast.7758
%.tmp7760 = icmp ne %m980$.Node.type* %.tmp7759, null
br i1 %.tmp7760, label %.if.true.7761, label %.if.false.7761
.if.true.7761:
%.tmp7762 = load %m980$.Node.type*, %m980$.Node.type** %cast.7758
%.tmp7763 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7762, i32 0, i32 7
%.tmp7764 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7763
%.tmp7766 = getelementptr [5 x i8], [5 x i8]*@.str7765, i32 0, i32 0
%.tmp7767 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp7764, i8* %.tmp7766)
%cast_type.7768 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7767, %m980$.Node.type** %cast_type.7768
%.tmp7769 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7770 = load %m980$.Node.type*, %m980$.Node.type** %cast_type.7768
%.tmp7771 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7770, i32 0, i32 7
%.tmp7772 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7771
%.tmp7773 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp7769, %m980$.Node.type* %.tmp7772)
%type.7774 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp7773, %m2756$.Type.type** %type.7774
%.tmp7775 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7747
%.tmp7776 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7775)
%prev_id.7777 = alloca i8*
store i8* %.tmp7776, i8** %prev_id.7777
%.tmp7778 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7779 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7747
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp7778, %m2756$.AssignableInfo.type* %.tmp7779)
%.tmp7780 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7781 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7747
%.tmp7782 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7781, i32 0, i32 4
%.tmp7783 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7782
%.tmp7784 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp7780, %m2756$.Type.type* %.tmp7783)
%from_type.7785 = alloca i8*
store i8* %.tmp7784, i8** %from_type.7785
%.tmp7786 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7787 = load %m2756$.Type.type*, %m2756$.Type.type** %type.7774
%.tmp7788 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp7786, %m2756$.Type.type* %.tmp7787)
%to_type.7789 = alloca i8*
store i8* %.tmp7788, i8** %to_type.7789
%.tmp7791 = getelementptr [8 x i8], [8 x i8]*@.str7790, i32 0, i32 0
%cast_fn.7792 = alloca i8*
store i8* %.tmp7791, i8** %cast_fn.7792
%.tmp7793 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7747
%.tmp7794 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7793, i32 0, i32 4
%.tmp7795 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7794
%.tmp7796 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7795, i32 0, i32 1
%.tmp7797 = load i8*, i8** %.tmp7796
%.tmp7798 = icmp ne i8* %.tmp7797, null
br i1 %.tmp7798, label %.if.true.7799, label %.if.false.7799
.if.true.7799:
%.tmp7800 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7747
%.tmp7801 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7800, i32 0, i32 4
%.tmp7802 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7801
%.tmp7803 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7802, i32 0, i32 1
%.tmp7804 = load i8*, i8** %.tmp7803
%.tmp7806 = getelementptr [6 x i8], [6 x i8]*@.str7805, i32 0, i32 0
%.tmp7807 = call i32(i8*,i8*) @strcmp(i8* %.tmp7804, i8* %.tmp7806)
%.tmp7808 = icmp eq i32 %.tmp7807, 0
br i1 %.tmp7808, label %.if.true.7809, label %.if.false.7809
.if.true.7809:
%.tmp7811 = getelementptr [48 x i8], [48 x i8]*@.str7810, i32 0, i32 0
%.tmp7812 = call i32(i8*,...) @printf(i8* %.tmp7811)
br label %.if.end.7809
.if.false.7809:
br label %.if.end.7809
.if.end.7809:
br label %.if.end.7799
.if.false.7799:
br label %.if.end.7799
.if.end.7799:
%.tmp7813 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7747
%.tmp7814 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7813, i32 0, i32 4
%.tmp7815 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7814
%.tmp7816 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7815, i32 0, i32 0
%.tmp7817 = load i8*, i8** %.tmp7816
%.tmp7819 = getelementptr [4 x i8], [4 x i8]*@.str7818, i32 0, i32 0
%.tmp7820 = call i32(i8*,i8*) @strcmp(i8* %.tmp7817, i8* %.tmp7819)
%.tmp7821 = icmp ne i32 %.tmp7820, 0
%.tmp7822 = load %m2756$.Type.type*, %m2756$.Type.type** %type.7774
%.tmp7823 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp7822, i32 0, i32 0
%.tmp7824 = load i8*, i8** %.tmp7823
%.tmp7826 = getelementptr [4 x i8], [4 x i8]*@.str7825, i32 0, i32 0
%.tmp7827 = call i32(i8*,i8*) @strcmp(i8* %.tmp7824, i8* %.tmp7826)
%.tmp7828 = icmp ne i32 %.tmp7827, 0
%.tmp7829 = and i1 %.tmp7821, %.tmp7828
br i1 %.tmp7829, label %.if.true.7830, label %.if.false.7830
.if.true.7830:
%.tmp7831 = load i8*, i8** %from_type.7785
%.tmp7832 = getelementptr i8, i8* %.tmp7831, i32 0
%.tmp7833 = load i8, i8* %.tmp7832
%.tmp7834 = icmp eq i8 %.tmp7833, 105
%.tmp7835 = load i8*, i8** %to_type.7789
%.tmp7836 = getelementptr i8, i8* %.tmp7835, i32 0
%.tmp7837 = load i8, i8* %.tmp7836
%.tmp7838 = icmp eq i8 %.tmp7837, 105
%.tmp7839 = and i1 %.tmp7834, %.tmp7838
br i1 %.tmp7839, label %.if.true.7840, label %.if.false.7840
.if.true.7840:
%from_size.7841 = alloca i32
store i32 0, i32* %from_size.7841
%to_size.7842 = alloca i32
store i32 0, i32* %to_size.7842
%.tmp7843 = load i8*, i8** %from_type.7785
%.tmp7845 = getelementptr [4 x i8], [4 x i8]*@.str7844, i32 0, i32 0
%.tmp7846 = getelementptr i32, i32* %from_size.7841, i32 0
%.tmp7847 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7843, i8* %.tmp7845, i32* %.tmp7846)
%.tmp7848 = load i8*, i8** %to_type.7789
%.tmp7850 = getelementptr [4 x i8], [4 x i8]*@.str7849, i32 0, i32 0
%.tmp7851 = getelementptr i32, i32* %to_size.7842, i32 0
%.tmp7852 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7848, i8* %.tmp7850, i32* %.tmp7851)
%.tmp7853 = load i32, i32* %from_size.7841
%.tmp7854 = load i32, i32* %to_size.7842
%.tmp7855 = icmp slt i32 %.tmp7853, %.tmp7854
br i1 %.tmp7855, label %.if.true.7856, label %.if.false.7856
.if.true.7856:
%.tmp7858 = getelementptr [5 x i8], [5 x i8]*@.str7857, i32 0, i32 0
store i8* %.tmp7858, i8** %cast_fn.7792
br label %.if.end.7856
.if.false.7856:
%.tmp7860 = getelementptr [6 x i8], [6 x i8]*@.str7859, i32 0, i32 0
store i8* %.tmp7860, i8** %cast_fn.7792
br label %.if.end.7856
.if.end.7856:
br label %.if.end.7840
.if.false.7840:
br label %.if.end.7840
.if.end.7840:
br label %.if.end.7830
.if.false.7830:
br label %.if.end.7830
.if.end.7830:
%.tmp7861 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7862 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp7861, i32 0, i32 1
%.tmp7863 = load %m0$.File.type*, %m0$.File.type** %.tmp7862
%.tmp7865 = getelementptr [21 x i8], [21 x i8]*@.str7864, i32 0, i32 0
%.tmp7866 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7747
%.tmp7867 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7866)
%.tmp7868 = load i8*, i8** %cast_fn.7792
%.tmp7869 = load i8*, i8** %from_type.7785
%.tmp7870 = load i8*, i8** %prev_id.7777
%.tmp7871 = load i8*, i8** %to_type.7789
%.tmp7872 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7863, i8* %.tmp7865, i8* %.tmp7867, i8* %.tmp7868, i8* %.tmp7869, i8* %.tmp7870, i8* %.tmp7871)
%.tmp7873 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7747
%.tmp7874 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7873, i32 0, i32 4
%.tmp7875 = load %m2756$.Type.type*, %m2756$.Type.type** %type.7774
store %m2756$.Type.type* %.tmp7875, %m2756$.Type.type** %.tmp7874
br label %.if.end.7761
.if.false.7761:
br label %.if.end.7761
.if.end.7761:
%.tmp7876 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.7747
ret %m2756$.AssignableInfo.type* %.tmp7876
}
define %m2756$.AssignableInfo.type* @m295$compile_assignable_stack.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m295$.StackHead.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m295$.StackHead.type* %.stack.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stack = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.stack.arg, %m295$.StackHead.type** %stack
%.tmp7877 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7878 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7877, i32 0, i32 0
%.tmp7879 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %.tmp7878
%.tmp7880 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp7879, i32 0, i32 0
%.tmp7881 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7880
%.tmp7882 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7881, i32 0, i32 0
%.tmp7883 = load i8*, i8** %.tmp7882
%.tmp7885 = getelementptr [16 x i8], [16 x i8]*@.str7884, i32 0, i32 0
%.tmp7886 = call i32(i8*,i8*) @strcmp(i8* %.tmp7883, i8* %.tmp7885)
%.tmp7887 = icmp eq i32 %.tmp7886, 0
br i1 %.tmp7887, label %.if.true.7888, label %.if.false.7888
.if.true.7888:
%.tmp7889 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7890 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7891 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7890, i32 0, i32 0
%.tmp7892 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %.tmp7891
%.tmp7893 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp7892, i32 0, i32 0
%.tmp7894 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7893
%.tmp7895 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_mono_assignable.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp7889, %m980$.Node.type* %.tmp7894)
ret %m2756$.AssignableInfo.type* %.tmp7895
br label %.if.end.7888
.if.false.7888:
br label %.if.end.7888
.if.end.7888:
%.tmp7896 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7897 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7896, i32 0, i32 0
%.tmp7898 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %.tmp7897
%.tmp7899 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp7898, i32 0, i32 0
%.tmp7900 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7899
%.tmp7901 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7900, i32 0, i32 7
%.tmp7902 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7901
%operator.7903 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7902, %m980$.Node.type** %operator.7903
%.tmp7904 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7905 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7904, i32 0, i32 0
%.tmp7906 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7907 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7906, i32 0, i32 0
%.tmp7908 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %.tmp7907
%.tmp7909 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp7908, i32 0, i32 1
%.tmp7910 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %.tmp7909
store %m2511$.SYStack.type* %.tmp7910, %m2511$.SYStack.type** %.tmp7905
%.tmp7911 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7912 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7913 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m295$.StackHead.typep(%m2756$.CompilerCtx.type* %.tmp7911, %m295$.StackHead.type* %.tmp7912)
%A.7914 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp7913, %m2756$.AssignableInfo.type** %A.7914
%.tmp7915 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %A.7914
%.tmp7916 = icmp eq %m2756$.AssignableInfo.type* %.tmp7915, null
br i1 %.tmp7916, label %.if.true.7917, label %.if.false.7917
.if.true.7917:
%.tmp7918 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %A.7914
ret %m2756$.AssignableInfo.type* %.tmp7918
br label %.if.end.7917
.if.false.7917:
br label %.if.end.7917
.if.end.7917:
%.tmp7919 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7920 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7919, i32 0, i32 0
%.tmp7921 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7922 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7921, i32 0, i32 0
%.tmp7923 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %.tmp7922
%.tmp7924 = getelementptr %m2511$.SYStack.type, %m2511$.SYStack.type* %.tmp7923, i32 0, i32 1
%.tmp7925 = load %m2511$.SYStack.type*, %m2511$.SYStack.type** %.tmp7924
store %m2511$.SYStack.type* %.tmp7925, %m2511$.SYStack.type** %.tmp7920
%.tmp7926 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7927 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7928 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m295$.StackHead.typep(%m2756$.CompilerCtx.type* %.tmp7926, %m295$.StackHead.type* %.tmp7927)
%B.7929 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp7928, %m2756$.AssignableInfo.type** %B.7929
%.tmp7930 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %B.7929
%.tmp7931 = icmp eq %m2756$.AssignableInfo.type* %.tmp7930, null
br i1 %.tmp7931, label %.if.true.7932, label %.if.false.7932
.if.true.7932:
%.tmp7933 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %B.7929
ret %m2756$.AssignableInfo.type* %.tmp7933
br label %.if.end.7932
.if.false.7932:
br label %.if.end.7932
.if.end.7932:
%.tmp7934 = bitcast ptr null to %m980$.Node.type*
%.tmp7935 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7934)
%op_info.7936 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp7935, %m2756$.AssignableInfo.type** %op_info.7936
%.tmp7937 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %op_info.7936
%.tmp7938 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7937, i32 0, i32 4
%.tmp7939 = load %m980$.Node.type*, %m980$.Node.type** %operator.7903
%.tmp7940 = call %m2756$.Type.type*(%m980$.Node.type*) @m295$operator_type.m2756$.Type.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7939)
store %m2756$.Type.type* %.tmp7940, %m2756$.Type.type** %.tmp7938
%.tmp7941 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7942 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %op_info.7936
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp7941, %m2756$.AssignableInfo.type* %.tmp7942)
%.tmp7943 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7944 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp7943, i32 0, i32 1
%.tmp7945 = load %m0$.File.type*, %m0$.File.type** %.tmp7944
%.tmp7947 = getelementptr [19 x i8], [19 x i8]*@.str7946, i32 0, i32 0
%.tmp7948 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %op_info.7936
%.tmp7949 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7948)
%.tmp7950 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7951 = load %m980$.Node.type*, %m980$.Node.type** %operator.7903
%.tmp7952 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$operator_op.cp.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp7950, %m980$.Node.type* %.tmp7951)
%.tmp7953 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7954 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %A.7914
%.tmp7955 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp7954, i32 0, i32 4
%.tmp7956 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp7955
%.tmp7957 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp7953, %m2756$.Type.type* %.tmp7956)
%.tmp7958 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %A.7914
%.tmp7959 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7958)
%.tmp7960 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %B.7929
%.tmp7961 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp7960)
%.tmp7962 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7945, i8* %.tmp7947, i8* %.tmp7949, i8* %.tmp7952, i8* %.tmp7957, i8* %.tmp7959, i8* %.tmp7961)
%.tmp7963 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %op_info.7936
ret %m2756$.AssignableInfo.type* %.tmp7963
}
define i8* @m295$operator_op.cp.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.op.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%op = alloca %m980$.Node.type*
store %m980$.Node.type* %.op.arg, %m980$.Node.type** %op
%.tmp7964 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7965 = icmp eq %m980$.Node.type* %.tmp7964, null
br i1 %.tmp7965, label %.if.true.7966, label %.if.false.7966
.if.true.7966:
%.tmp7967 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp7968 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7970 = getelementptr [31 x i8], [31 x i8]*@.str7969, i32 0, i32 0
%.tmp7971 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp7967, %m980$.Node.type* %.tmp7968, i8* %.tmp7970)
%.tmp7972 = call i32(i8*,...) @printf(i8* %.tmp7971)
br label %.if.end.7966
.if.false.7966:
br label %.if.end.7966
.if.end.7966:
%.tmp7973 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7974 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7973, i32 0, i32 1
%.tmp7975 = load i8*, i8** %.tmp7974
%.tmp7977 = getelementptr [2 x i8], [2 x i8]*@.str7976, i32 0, i32 0
%.tmp7978 = call i32(i8*,i8*) @strcmp(i8* %.tmp7975, i8* %.tmp7977)
%.tmp7979 = icmp eq i32 %.tmp7978, 0
br i1 %.tmp7979, label %.if.true.7980, label %.if.false.7980
.if.true.7980:
%.tmp7982 = getelementptr [4 x i8], [4 x i8]*@.str7981, i32 0, i32 0
ret i8* %.tmp7982
br label %.if.end.7980
.if.false.7980:
%.tmp7983 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7984 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7983, i32 0, i32 1
%.tmp7985 = load i8*, i8** %.tmp7984
%.tmp7987 = getelementptr [2 x i8], [2 x i8]*@.str7986, i32 0, i32 0
%.tmp7988 = call i32(i8*,i8*) @strcmp(i8* %.tmp7985, i8* %.tmp7987)
%.tmp7989 = icmp eq i32 %.tmp7988, 0
br i1 %.tmp7989, label %.if.true.7990, label %.if.false.7990
.if.true.7990:
%.tmp7992 = getelementptr [4 x i8], [4 x i8]*@.str7991, i32 0, i32 0
ret i8* %.tmp7992
br label %.if.end.7990
.if.false.7990:
%.tmp7993 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7994 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7993, i32 0, i32 1
%.tmp7995 = load i8*, i8** %.tmp7994
%.tmp7997 = getelementptr [2 x i8], [2 x i8]*@.str7996, i32 0, i32 0
%.tmp7998 = call i32(i8*,i8*) @strcmp(i8* %.tmp7995, i8* %.tmp7997)
%.tmp7999 = icmp eq i32 %.tmp7998, 0
br i1 %.tmp7999, label %.if.true.8000, label %.if.false.8000
.if.true.8000:
%.tmp8002 = getelementptr [4 x i8], [4 x i8]*@.str8001, i32 0, i32 0
ret i8* %.tmp8002
br label %.if.end.8000
.if.false.8000:
%.tmp8003 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8004 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8003, i32 0, i32 1
%.tmp8005 = load i8*, i8** %.tmp8004
%.tmp8007 = getelementptr [2 x i8], [2 x i8]*@.str8006, i32 0, i32 0
%.tmp8008 = call i32(i8*,i8*) @strcmp(i8* %.tmp8005, i8* %.tmp8007)
%.tmp8009 = icmp eq i32 %.tmp8008, 0
br i1 %.tmp8009, label %.if.true.8010, label %.if.false.8010
.if.true.8010:
%.tmp8012 = getelementptr [5 x i8], [5 x i8]*@.str8011, i32 0, i32 0
ret i8* %.tmp8012
br label %.if.end.8010
.if.false.8010:
%.tmp8013 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8014 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8013, i32 0, i32 1
%.tmp8015 = load i8*, i8** %.tmp8014
%.tmp8017 = getelementptr [3 x i8], [3 x i8]*@.str8016, i32 0, i32 0
%.tmp8018 = call i32(i8*,i8*) @strcmp(i8* %.tmp8015, i8* %.tmp8017)
%.tmp8019 = icmp eq i32 %.tmp8018, 0
br i1 %.tmp8019, label %.if.true.8020, label %.if.false.8020
.if.true.8020:
%.tmp8022 = getelementptr [8 x i8], [8 x i8]*@.str8021, i32 0, i32 0
ret i8* %.tmp8022
br label %.if.end.8020
.if.false.8020:
%.tmp8023 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8024 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8023, i32 0, i32 1
%.tmp8025 = load i8*, i8** %.tmp8024
%.tmp8027 = getelementptr [3 x i8], [3 x i8]*@.str8026, i32 0, i32 0
%.tmp8028 = call i32(i8*,i8*) @strcmp(i8* %.tmp8025, i8* %.tmp8027)
%.tmp8029 = icmp eq i32 %.tmp8028, 0
br i1 %.tmp8029, label %.if.true.8030, label %.if.false.8030
.if.true.8030:
%.tmp8032 = getelementptr [8 x i8], [8 x i8]*@.str8031, i32 0, i32 0
ret i8* %.tmp8032
br label %.if.end.8030
.if.false.8030:
%.tmp8033 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8034 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8033, i32 0, i32 1
%.tmp8035 = load i8*, i8** %.tmp8034
%.tmp8037 = getelementptr [2 x i8], [2 x i8]*@.str8036, i32 0, i32 0
%.tmp8038 = call i32(i8*,i8*) @strcmp(i8* %.tmp8035, i8* %.tmp8037)
%.tmp8039 = icmp eq i32 %.tmp8038, 0
br i1 %.tmp8039, label %.if.true.8040, label %.if.false.8040
.if.true.8040:
%.tmp8042 = getelementptr [9 x i8], [9 x i8]*@.str8041, i32 0, i32 0
ret i8* %.tmp8042
br label %.if.end.8040
.if.false.8040:
%.tmp8043 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8044 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8043, i32 0, i32 1
%.tmp8045 = load i8*, i8** %.tmp8044
%.tmp8047 = getelementptr [2 x i8], [2 x i8]*@.str8046, i32 0, i32 0
%.tmp8048 = call i32(i8*,i8*) @strcmp(i8* %.tmp8045, i8* %.tmp8047)
%.tmp8049 = icmp eq i32 %.tmp8048, 0
br i1 %.tmp8049, label %.if.true.8050, label %.if.false.8050
.if.true.8050:
%.tmp8052 = getelementptr [9 x i8], [9 x i8]*@.str8051, i32 0, i32 0
ret i8* %.tmp8052
br label %.if.end.8050
.if.false.8050:
%.tmp8053 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8054 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8053, i32 0, i32 1
%.tmp8055 = load i8*, i8** %.tmp8054
%.tmp8057 = getelementptr [2 x i8], [2 x i8]*@.str8056, i32 0, i32 0
%.tmp8058 = call i32(i8*,i8*) @strcmp(i8* %.tmp8055, i8* %.tmp8057)
%.tmp8059 = icmp eq i32 %.tmp8058, 0
br i1 %.tmp8059, label %.if.true.8060, label %.if.false.8060
.if.true.8060:
%.tmp8062 = getelementptr [4 x i8], [4 x i8]*@.str8061, i32 0, i32 0
ret i8* %.tmp8062
br label %.if.end.8060
.if.false.8060:
%.tmp8063 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8064 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8063, i32 0, i32 1
%.tmp8065 = load i8*, i8** %.tmp8064
%.tmp8067 = getelementptr [2 x i8], [2 x i8]*@.str8066, i32 0, i32 0
%.tmp8068 = call i32(i8*,i8*) @strcmp(i8* %.tmp8065, i8* %.tmp8067)
%.tmp8069 = icmp eq i32 %.tmp8068, 0
br i1 %.tmp8069, label %.if.true.8070, label %.if.false.8070
.if.true.8070:
%.tmp8072 = getelementptr [3 x i8], [3 x i8]*@.str8071, i32 0, i32 0
ret i8* %.tmp8072
br label %.if.end.8070
.if.false.8070:
%.tmp8073 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8074 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8073, i32 0, i32 1
%.tmp8075 = load i8*, i8** %.tmp8074
%.tmp8077 = getelementptr [3 x i8], [3 x i8]*@.str8076, i32 0, i32 0
%.tmp8078 = call i32(i8*,i8*) @strcmp(i8* %.tmp8075, i8* %.tmp8077)
%.tmp8079 = icmp eq i32 %.tmp8078, 0
br i1 %.tmp8079, label %.if.true.8080, label %.if.false.8080
.if.true.8080:
%.tmp8082 = getelementptr [9 x i8], [9 x i8]*@.str8081, i32 0, i32 0
ret i8* %.tmp8082
br label %.if.end.8080
.if.false.8080:
%.tmp8083 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8084 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8083, i32 0, i32 1
%.tmp8085 = load i8*, i8** %.tmp8084
%.tmp8087 = getelementptr [3 x i8], [3 x i8]*@.str8086, i32 0, i32 0
%.tmp8088 = call i32(i8*,i8*) @strcmp(i8* %.tmp8085, i8* %.tmp8087)
%.tmp8089 = icmp eq i32 %.tmp8088, 0
br i1 %.tmp8089, label %.if.true.8090, label %.if.false.8090
.if.true.8090:
%.tmp8092 = getelementptr [9 x i8], [9 x i8]*@.str8091, i32 0, i32 0
ret i8* %.tmp8092
br label %.if.end.8090
.if.false.8090:
%.tmp8093 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8094 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8093, i32 0, i32 1
%.tmp8095 = load i8*, i8** %.tmp8094
%.tmp8097 = getelementptr [2 x i8], [2 x i8]*@.str8096, i32 0, i32 0
%.tmp8098 = call i32(i8*,i8*) @strcmp(i8* %.tmp8095, i8* %.tmp8097)
%.tmp8099 = icmp eq i32 %.tmp8098, 0
br i1 %.tmp8099, label %.if.true.8100, label %.if.false.8100
.if.true.8100:
%.tmp8102 = getelementptr [5 x i8], [5 x i8]*@.str8101, i32 0, i32 0
ret i8* %.tmp8102
br label %.if.end.8100
.if.false.8100:
%.tmp8103 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8104 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8106 = getelementptr [30 x i8], [30 x i8]*@.str8105, i32 0, i32 0
%.tmp8107 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp8103, %m980$.Node.type* %.tmp8104, i8* %.tmp8106)
%.tmp8108 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8109 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8108, i32 0, i32 1
%.tmp8110 = load i8*, i8** %.tmp8109
%.tmp8111 = call i32(i8*,...) @printf(i8* %.tmp8107, i8* %.tmp8110)
br label %.if.end.8100
.if.end.8100:
br label %.if.end.8090
.if.end.8090:
br label %.if.end.8080
.if.end.8080:
br label %.if.end.8070
.if.end.8070:
br label %.if.end.8060
.if.end.8060:
br label %.if.end.8050
.if.end.8050:
br label %.if.end.8040
.if.end.8040:
br label %.if.end.8030
.if.end.8030:
br label %.if.end.8020
.if.end.8020:
br label %.if.end.8010
.if.end.8010:
br label %.if.end.8000
.if.end.8000:
br label %.if.end.7990
.if.end.7990:
br label %.if.end.7980
.if.end.7980:
%.tmp8113 = getelementptr [4 x i8], [4 x i8]*@.str8112, i32 0, i32 0
ret i8* %.tmp8113
}
define %m2756$.Type.type* @m295$operator_type.m2756$.Type.typep.m980$.Node.typep(%m980$.Node.type* %.op.arg) {
%op = alloca %m980$.Node.type*
store %m980$.Node.type* %.op.arg, %m980$.Node.type** %op
%.tmp8114 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%type.8115 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp8114, %m2756$.Type.type** %type.8115
%.tmp8116 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8117 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8116, i32 0, i32 1
%.tmp8118 = load i8*, i8** %.tmp8117
%.tmp8120 = getelementptr [3 x i8], [3 x i8]*@.str8119, i32 0, i32 0
%.tmp8121 = call i32(i8*,i8*) @strcmp(i8* %.tmp8118, i8* %.tmp8120)
%.tmp8122 = icmp eq i32 %.tmp8121, 0
%.tmp8123 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8124 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8123, i32 0, i32 1
%.tmp8125 = load i8*, i8** %.tmp8124
%.tmp8127 = getelementptr [3 x i8], [3 x i8]*@.str8126, i32 0, i32 0
%.tmp8128 = call i32(i8*,i8*) @strcmp(i8* %.tmp8125, i8* %.tmp8127)
%.tmp8129 = icmp eq i32 %.tmp8128, 0
%.tmp8130 = or i1 %.tmp8122, %.tmp8129
%.tmp8131 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8132 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8131, i32 0, i32 1
%.tmp8133 = load i8*, i8** %.tmp8132
%.tmp8135 = getelementptr [2 x i8], [2 x i8]*@.str8134, i32 0, i32 0
%.tmp8136 = call i32(i8*,i8*) @strcmp(i8* %.tmp8133, i8* %.tmp8135)
%.tmp8137 = icmp eq i32 %.tmp8136, 0
%.tmp8138 = or i1 %.tmp8130, %.tmp8137
%.tmp8139 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8140 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8139, i32 0, i32 1
%.tmp8141 = load i8*, i8** %.tmp8140
%.tmp8143 = getelementptr [2 x i8], [2 x i8]*@.str8142, i32 0, i32 0
%.tmp8144 = call i32(i8*,i8*) @strcmp(i8* %.tmp8141, i8* %.tmp8143)
%.tmp8145 = icmp eq i32 %.tmp8144, 0
%.tmp8146 = or i1 %.tmp8138, %.tmp8145
%.tmp8147 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8148 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8147, i32 0, i32 1
%.tmp8149 = load i8*, i8** %.tmp8148
%.tmp8151 = getelementptr [2 x i8], [2 x i8]*@.str8150, i32 0, i32 0
%.tmp8152 = call i32(i8*,i8*) @strcmp(i8* %.tmp8149, i8* %.tmp8151)
%.tmp8153 = icmp eq i32 %.tmp8152, 0
%.tmp8154 = or i1 %.tmp8146, %.tmp8153
%.tmp8155 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8156 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8155, i32 0, i32 1
%.tmp8157 = load i8*, i8** %.tmp8156
%.tmp8159 = getelementptr [2 x i8], [2 x i8]*@.str8158, i32 0, i32 0
%.tmp8160 = call i32(i8*,i8*) @strcmp(i8* %.tmp8157, i8* %.tmp8159)
%.tmp8161 = icmp eq i32 %.tmp8160, 0
%.tmp8162 = or i1 %.tmp8154, %.tmp8161
%.tmp8163 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8164 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8163, i32 0, i32 1
%.tmp8165 = load i8*, i8** %.tmp8164
%.tmp8167 = getelementptr [3 x i8], [3 x i8]*@.str8166, i32 0, i32 0
%.tmp8168 = call i32(i8*,i8*) @strcmp(i8* %.tmp8165, i8* %.tmp8167)
%.tmp8169 = icmp eq i32 %.tmp8168, 0
%.tmp8170 = or i1 %.tmp8162, %.tmp8169
%.tmp8171 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8172 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8171, i32 0, i32 1
%.tmp8173 = load i8*, i8** %.tmp8172
%.tmp8175 = getelementptr [3 x i8], [3 x i8]*@.str8174, i32 0, i32 0
%.tmp8176 = call i32(i8*,i8*) @strcmp(i8* %.tmp8173, i8* %.tmp8175)
%.tmp8177 = icmp eq i32 %.tmp8176, 0
%.tmp8178 = or i1 %.tmp8170, %.tmp8177
br i1 %.tmp8178, label %.if.true.8179, label %.if.false.8179
.if.true.8179:
%.tmp8180 = load %m2756$.Type.type*, %m2756$.Type.type** %type.8115
%.tmp8181 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8180, i32 0, i32 0
%.tmp8183 = getelementptr [5 x i8], [5 x i8]*@.str8182, i32 0, i32 0
store i8* %.tmp8183, i8** %.tmp8181
br label %.if.end.8179
.if.false.8179:
%.tmp8184 = load %m2756$.Type.type*, %m2756$.Type.type** %type.8115
%.tmp8185 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8184, i32 0, i32 0
%.tmp8187 = getelementptr [4 x i8], [4 x i8]*@.str8186, i32 0, i32 0
store i8* %.tmp8187, i8** %.tmp8185
br label %.if.end.8179
.if.end.8179:
%.tmp8188 = load %m2756$.Type.type*, %m2756$.Type.type** %type.8115
ret %m2756$.Type.type* %.tmp8188
}
define %m2756$.AssignableInfo.type* @m295$compile_mono_assignable.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%curr_node = alloca %m980$.Node.type*
store %m980$.Node.type* %.curr_node.arg, %m980$.Node.type** %curr_node
%.tmp8189 = bitcast ptr null to %m2756$.AssignableInfo.type*
%assignable_info.8190 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp8189, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8191 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%mono.8192 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8191, %m980$.Node.type** %mono.8192
%.tmp8194 = getelementptr [1 x i8], [1 x i8]*@.str8193, i32 0, i32 0
%err_buf.8195 = alloca i8*
store i8* %.tmp8194, i8** %err_buf.8195
%.tmp8197 = getelementptr [1 x i8], [1 x i8]*@.str8196, i32 0, i32 0
%buf.8198 = alloca i8*
store i8* %.tmp8197, i8** %buf.8198
%.tmp8199 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8200 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8199, i32 0, i32 7
%.tmp8201 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8200
%.tmp8202 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8201, i32 0, i32 0
%.tmp8203 = load i8*, i8** %.tmp8202
%.tmp8205 = getelementptr [7 x i8], [7 x i8]*@.str8204, i32 0, i32 0
%.tmp8206 = call i32(i8*,i8*) @strcmp(i8* %.tmp8203, i8* %.tmp8205)
%.tmp8207 = icmp eq i32 %.tmp8206, 0
br i1 %.tmp8207, label %.if.true.8208, label %.if.false.8208
.if.true.8208:
%.tmp8209 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8210 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8209)
store %m2756$.AssignableInfo.type* %.tmp8210, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8211 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8212 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8211, i32 0, i32 4
%.tmp8213 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp8213, %m2756$.Type.type** %.tmp8212
%.tmp8214 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8215 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8214, i32 0, i32 4
%.tmp8216 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8215
%.tmp8217 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8216, i32 0, i32 0
%.tmp8219 = getelementptr [4 x i8], [4 x i8]*@.str8218, i32 0, i32 0
store i8* %.tmp8219, i8** %.tmp8217
%.tmp8220 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8221 = load i8, i8* @SCOPE_CONST
%.tmp8222 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8223 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8222, i32 0, i32 7
%.tmp8224 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8223
%.tmp8225 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8224, i32 0, i32 1
%.tmp8226 = load i8*, i8** %.tmp8225
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp8220, i8 %.tmp8221, i8* %.tmp8226)
br label %.if.end.8208
.if.false.8208:
%.tmp8227 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8228 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8227, i32 0, i32 7
%.tmp8229 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8228
%.tmp8230 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8229, i32 0, i32 0
%.tmp8231 = load i8*, i8** %.tmp8230
%.tmp8233 = getelementptr [5 x i8], [5 x i8]*@.str8232, i32 0, i32 0
%.tmp8234 = call i32(i8*,i8*) @strcmp(i8* %.tmp8231, i8* %.tmp8233)
%.tmp8235 = icmp eq i32 %.tmp8234, 0
br i1 %.tmp8235, label %.if.true.8236, label %.if.false.8236
.if.true.8236:
%.tmp8237 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8238 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8237, i32 0, i32 7
%.tmp8239 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8238
%.tmp8240 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8239, i32 0, i32 1
%.tmp8241 = load i8*, i8** %.tmp8240
%.tmp8243 = getelementptr [5 x i8], [5 x i8]*@.str8242, i32 0, i32 0
%.tmp8244 = call i32(i8*,i8*) @strcmp(i8* %.tmp8241, i8* %.tmp8243)
%.tmp8245 = icmp ne i32 %.tmp8244, 0
br i1 %.tmp8245, label %.if.true.8246, label %.if.false.8246
.if.true.8246:
%.tmp8247 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8248 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8250 = getelementptr [42 x i8], [42 x i8]*@.str8249, i32 0, i32 0
%.tmp8251 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp8247, %m980$.Node.type* %.tmp8248, i8* %.tmp8250)
%.tmp8252 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8253 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8252, i32 0, i32 7
%.tmp8254 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8253
%.tmp8255 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8254, i32 0, i32 1
%.tmp8256 = load i8*, i8** %.tmp8255
%.tmp8257 = call i32(i8*,...) @printf(i8* %.tmp8251, i8* %.tmp8256)
%.tmp8258 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp8258
br label %.if.end.8246
.if.false.8246:
br label %.if.end.8246
.if.end.8246:
%.tmp8259 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8260 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8259)
store %m2756$.AssignableInfo.type* %.tmp8260, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8261 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8262 = load i8, i8* @SCOPE_CONST
%.tmp8264 = getelementptr [5 x i8], [5 x i8]*@.str8263, i32 0, i32 0
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp8261, i8 %.tmp8262, i8* %.tmp8264)
%.tmp8265 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8266 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8265, i32 0, i32 4
%.tmp8267 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp8267, %m2756$.Type.type** %.tmp8266
%.tmp8268 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8269 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8268, i32 0, i32 4
%.tmp8270 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8269
%.tmp8271 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8270, i32 0, i32 0
%.tmp8273 = getelementptr [8 x i8], [8 x i8]*@.str8272, i32 0, i32 0
store i8* %.tmp8273, i8** %.tmp8271
br label %.if.end.8236
.if.false.8236:
%.tmp8274 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8275 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8274, i32 0, i32 7
%.tmp8276 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8275
%.tmp8277 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8276, i32 0, i32 0
%.tmp8278 = load i8*, i8** %.tmp8277
%.tmp8280 = getelementptr [17 x i8], [17 x i8]*@.str8279, i32 0, i32 0
%.tmp8281 = call i32(i8*,i8*) @strcmp(i8* %.tmp8278, i8* %.tmp8280)
%.tmp8282 = icmp eq i32 %.tmp8281, 0
br i1 %.tmp8282, label %.if.true.8283, label %.if.false.8283
.if.true.8283:
%.tmp8284 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8285 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8284)
store %m2756$.AssignableInfo.type* %.tmp8285, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8286 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8287 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8286, i32 0, i32 7
%.tmp8288 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8287
%.tmp8289 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8288, i32 0, i32 7
%.tmp8290 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8289
%.tmp8292 = getelementptr [12 x i8], [12 x i8]*@.str8291, i32 0, i32 0
%.tmp8293 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp8290, i8* %.tmp8292)
%dest.8294 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8293, %m980$.Node.type** %dest.8294
%.tmp8295 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8296 = load %m980$.Node.type*, %m980$.Node.type** %dest.8294
%.tmp8297 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp8295, %m980$.Node.type* %.tmp8296)
%var_info.8298 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp8297, %m2756$.AssignableInfo.type** %var_info.8298
%.tmp8299 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %var_info.8298
%.tmp8300 = icmp eq %m2756$.AssignableInfo.type* %.tmp8299, null
br i1 %.tmp8300, label %.if.true.8301, label %.if.false.8301
.if.true.8301:
%.tmp8302 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp8302
br label %.if.end.8301
.if.false.8301:
br label %.if.end.8301
.if.end.8301:
%.tmp8303 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %var_info.8298
%.tmp8304 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8303, i32 0, i32 4
%.tmp8305 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8304
%.tmp8306 = icmp eq %m2756$.Type.type* %.tmp8305, null
br i1 %.tmp8306, label %.if.true.8307, label %.if.false.8307
.if.true.8307:
%.tmp8308 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp8308
br label %.if.end.8307
.if.false.8307:
br label %.if.end.8307
.if.end.8307:
%.tmp8309 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8310 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %var_info.8298
%.tmp8311 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8310, i32 0, i32 4
%.tmp8312 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8311
%.tmp8313 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp8309, %m2756$.Type.type* %.tmp8312)
%var_type_repr.8314 = alloca i8*
store i8* %.tmp8313, i8** %var_type_repr.8314
%.tmp8315 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8316 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp8315, %m2756$.AssignableInfo.type* %.tmp8316)
%.tmp8317 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8318 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8317, i32 0, i32 4
%.tmp8319 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %var_info.8298
%.tmp8320 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8319, i32 0, i32 4
%.tmp8321 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8320
store %m2756$.Type.type* %.tmp8321, %m2756$.Type.type** %.tmp8318
%.tmp8323 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8324 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8323, i32 0, i32 7
%.tmp8325 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8324
%.tmp8326 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8325, i32 0, i32 7
%.tmp8327 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8326
%ptr.8328 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8327, %m980$.Node.type** %ptr.8328
br label %.for.start.8322
.for.start.8322:
%.tmp8329 = load %m980$.Node.type*, %m980$.Node.type** %ptr.8328
%.tmp8330 = load %m980$.Node.type*, %m980$.Node.type** %dest.8294
%.tmp8331 = icmp ne %m980$.Node.type* %.tmp8329, %.tmp8330
br i1 %.tmp8331, label %.for.continue.8322, label %.for.end.8322
.for.continue.8322:
%.tmp8332 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%type.8333 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp8332, %m2756$.Type.type** %type.8333
%.tmp8334 = load %m2756$.Type.type*, %m2756$.Type.type** %type.8333
%.tmp8335 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8334, i32 0, i32 3
%.tmp8336 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8337 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8336, i32 0, i32 4
%.tmp8338 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8337
store %m2756$.Type.type* %.tmp8338, %m2756$.Type.type** %.tmp8335
%.tmp8339 = load %m2756$.Type.type*, %m2756$.Type.type** %type.8333
%.tmp8340 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8339, i32 0, i32 0
%.tmp8342 = getelementptr [4 x i8], [4 x i8]*@.str8341, i32 0, i32 0
store i8* %.tmp8342, i8** %.tmp8340
%.tmp8343 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8344 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8343, i32 0, i32 4
%.tmp8345 = load %m2756$.Type.type*, %m2756$.Type.type** %type.8333
store %m2756$.Type.type* %.tmp8345, %m2756$.Type.type** %.tmp8344
%.tmp8346 = load %m980$.Node.type*, %m980$.Node.type** %ptr.8328
%.tmp8347 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8346, i32 0, i32 8
%.tmp8348 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8347
store %m980$.Node.type* %.tmp8348, %m980$.Node.type** %ptr.8328
br label %.for.start.8322
.for.end.8322:
%.tmp8349 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8350 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8349, i32 0, i32 7
%.tmp8351 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8350
%.tmp8352 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8351, i32 0, i32 7
%.tmp8353 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8352
%.tmp8354 = load %m980$.Node.type*, %m980$.Node.type** %dest.8294
%.tmp8355 = icmp ne %m980$.Node.type* %.tmp8353, %.tmp8354
br i1 %.tmp8355, label %.if.true.8356, label %.if.false.8356
.if.true.8356:
%.tmp8357 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8358 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8357, i32 0, i32 1
%.tmp8359 = load %m0$.File.type*, %m0$.File.type** %.tmp8358
%.tmp8361 = getelementptr [38 x i8], [38 x i8]*@.str8360, i32 0, i32 0
%.tmp8362 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8363 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp8362)
%.tmp8364 = load i8*, i8** %var_type_repr.8314
%.tmp8365 = load i8*, i8** %var_type_repr.8314
%.tmp8366 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %var_info.8298
%.tmp8367 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp8366)
%.tmp8368 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8359, i8* %.tmp8361, i8* %.tmp8363, i8* %.tmp8364, i8* %.tmp8365, i8* %.tmp8367)
br label %.if.end.8356
.if.false.8356:
%.tmp8369 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8370 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8369, i32 0, i32 4
%.tmp8371 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8370
%.tmp8372 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8371, i32 0, i32 0
%.tmp8373 = load i8*, i8** %.tmp8372
%.tmp8375 = getelementptr [9 x i8], [9 x i8]*@.str8374, i32 0, i32 0
%.tmp8376 = call i32(i8*,i8*) @strcmp(i8* %.tmp8373, i8* %.tmp8375)
%.tmp8377 = icmp eq i32 %.tmp8376, 0
br i1 %.tmp8377, label %.if.true.8378, label %.if.false.8378
.if.true.8378:
%.tmp8379 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %var_info.8298
store %m2756$.AssignableInfo.type* %.tmp8379, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8380 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%type.8381 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp8380, %m2756$.Type.type** %type.8381
%.tmp8382 = load %m2756$.Type.type*, %m2756$.Type.type** %type.8381
%.tmp8383 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8382, i32 0, i32 3
%.tmp8384 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8385 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8384, i32 0, i32 4
%.tmp8386 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8385
store %m2756$.Type.type* %.tmp8386, %m2756$.Type.type** %.tmp8383
%.tmp8387 = load %m2756$.Type.type*, %m2756$.Type.type** %type.8381
%.tmp8388 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8387, i32 0, i32 0
%.tmp8390 = getelementptr [4 x i8], [4 x i8]*@.str8389, i32 0, i32 0
store i8* %.tmp8390, i8** %.tmp8388
%.tmp8391 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8392 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8391, i32 0, i32 4
%.tmp8393 = load %m2756$.Type.type*, %m2756$.Type.type** %type.8381
store %m2756$.Type.type* %.tmp8393, %m2756$.Type.type** %.tmp8392
br label %.if.end.8378
.if.false.8378:
%.tmp8394 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8395 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8394, i32 0, i32 1
%.tmp8396 = load %m0$.File.type*, %m0$.File.type** %.tmp8395
%.tmp8398 = getelementptr [22 x i8], [22 x i8]*@.str8397, i32 0, i32 0
%.tmp8399 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8400 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp8399)
%.tmp8401 = load i8*, i8** %var_type_repr.8314
%.tmp8402 = load i8*, i8** %var_type_repr.8314
%.tmp8403 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %var_info.8298
%.tmp8404 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp8403)
%.tmp8405 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8396, i8* %.tmp8398, i8* %.tmp8400, i8* %.tmp8401, i8* %.tmp8402, i8* %.tmp8404)
br label %.if.end.8378
.if.end.8378:
br label %.if.end.8356
.if.end.8356:
br label %.if.end.8283
.if.false.8283:
%.tmp8406 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8407 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8406, i32 0, i32 7
%.tmp8408 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8407
%.tmp8409 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8408, i32 0, i32 0
%.tmp8410 = load i8*, i8** %.tmp8409
%.tmp8412 = getelementptr [8 x i8], [8 x i8]*@.str8411, i32 0, i32 0
%.tmp8413 = call i32(i8*,i8*) @strcmp(i8* %.tmp8410, i8* %.tmp8412)
%.tmp8414 = icmp eq i32 %.tmp8413, 0
br i1 %.tmp8414, label %.if.true.8415, label %.if.false.8415
.if.true.8415:
%.tmp8416 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8417 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8416)
store %m2756$.AssignableInfo.type* %.tmp8417, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8418 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8419 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8418, i32 0, i32 4
%.tmp8420 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp8420, %m2756$.Type.type** %.tmp8419
%.tmp8421 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8422 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8421, i32 0, i32 4
%.tmp8423 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8422
%.tmp8424 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8423, i32 0, i32 0
%.tmp8426 = getelementptr [5 x i8], [5 x i8]*@.str8425, i32 0, i32 0
store i8* %.tmp8426, i8** %.tmp8424
%.tmp8427 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8428 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8427, i32 0, i32 7
%.tmp8429 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8428
%.tmp8430 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8429, i32 0, i32 7
%.tmp8431 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8430
%.tmp8432 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8431, i32 0, i32 1
%.tmp8433 = load i8*, i8** %.tmp8432
%.tmp8435 = getelementptr [6 x i8], [6 x i8]*@.str8434, i32 0, i32 0
%.tmp8436 = call i32(i8*,i8*) @strcmp(i8* %.tmp8433, i8* %.tmp8435)
%.tmp8437 = icmp eq i32 %.tmp8436, 0
br i1 %.tmp8437, label %.if.true.8438, label %.if.false.8438
.if.true.8438:
%.tmp8439 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8440 = load i8, i8* @SCOPE_CONST
%.tmp8442 = getelementptr [2 x i8], [2 x i8]*@.str8441, i32 0, i32 0
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp8439, i8 %.tmp8440, i8* %.tmp8442)
br label %.if.end.8438
.if.false.8438:
%.tmp8443 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8444 = load i8, i8* @SCOPE_CONST
%.tmp8446 = getelementptr [2 x i8], [2 x i8]*@.str8445, i32 0, i32 0
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp8443, i8 %.tmp8444, i8* %.tmp8446)
br label %.if.end.8438
.if.end.8438:
br label %.if.end.8415
.if.false.8415:
%.tmp8447 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8448 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8447, i32 0, i32 7
%.tmp8449 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8448
%.tmp8450 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8449, i32 0, i32 0
%.tmp8451 = load i8*, i8** %.tmp8450
%.tmp8453 = getelementptr [8 x i8], [8 x i8]*@.str8452, i32 0, i32 0
%.tmp8454 = call i32(i8*,i8*) @strcmp(i8* %.tmp8451, i8* %.tmp8453)
%.tmp8455 = icmp eq i32 %.tmp8454, 0
br i1 %.tmp8455, label %.if.true.8456, label %.if.false.8456
.if.true.8456:
%.tmp8457 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8458 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8459 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8458, i32 0, i32 7
%.tmp8460 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8459
%.tmp8461 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8460, i32 0, i32 7
%.tmp8462 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8461
%.tmp8463 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_fn_call.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp8457, %m980$.Node.type* %.tmp8462)
store %m2756$.AssignableInfo.type* %.tmp8463, %m2756$.AssignableInfo.type** %assignable_info.8190
br label %.if.end.8456
.if.false.8456:
%.tmp8464 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8465 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8464, i32 0, i32 7
%.tmp8466 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8465
%.tmp8467 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8466, i32 0, i32 0
%.tmp8468 = load i8*, i8** %.tmp8467
%.tmp8470 = getelementptr [7 x i8], [7 x i8]*@.str8469, i32 0, i32 0
%.tmp8471 = call i32(i8*,i8*) @strcmp(i8* %.tmp8468, i8* %.tmp8470)
%.tmp8472 = icmp eq i32 %.tmp8471, 0
br i1 %.tmp8472, label %.if.true.8473, label %.if.false.8473
.if.true.8473:
%.tmp8474 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8475 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8476 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8475, i32 0, i32 7
%.tmp8477 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8476
%.tmp8478 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8477, i32 0, i32 1
%.tmp8479 = load i8*, i8** %.tmp8478
%.tmp8480 = call %m2756$.AssignableInfo.type*(%m2756$.CompilerCtx.type*,i8*) @m295$define_string.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.tmp8474, i8* %.tmp8479)
%string_info.8481 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp8480, %m2756$.AssignableInfo.type** %string_info.8481
%.tmp8482 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8483 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8482)
store %m2756$.AssignableInfo.type* %.tmp8483, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8484 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8485 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
call void(%m2756$.CompilerCtx.type*,%m2756$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2756$.CompilerCtx.typep.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp8484, %m2756$.AssignableInfo.type* %.tmp8485)
%.tmp8486 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8487 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %string_info.8481
%.tmp8488 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8487, i32 0, i32 4
%.tmp8489 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8488
%.tmp8490 = call i8*(%m2756$.CompilerCtx.type*,%m2756$.Type.type*) @m2757$repr.cp.m2756$.CompilerCtx.typep.m2756$.Type.typep(%m2756$.CompilerCtx.type* %.tmp8486, %m2756$.Type.type* %.tmp8489)
%str_tr.8491 = alloca i8*
store i8* %.tmp8490, i8** %str_tr.8491
%.tmp8492 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8493 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8492, i32 0, i32 1
%.tmp8494 = load %m0$.File.type*, %m0$.File.type** %.tmp8493
%.tmp8496 = getelementptr [44 x i8], [44 x i8]*@.str8495, i32 0, i32 0
%.tmp8497 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8498 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp8497)
%.tmp8499 = load i8*, i8** %str_tr.8491
%.tmp8500 = load i8*, i8** %str_tr.8491
%.tmp8501 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %string_info.8481
%.tmp8502 = call i8*(%m2756$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2756$.AssignableInfo.typep(%m2756$.AssignableInfo.type* %.tmp8501)
%.tmp8503 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8494, i8* %.tmp8496, i8* %.tmp8498, i8* %.tmp8499, i8* %.tmp8500, i8* %.tmp8502)
%.tmp8504 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8505 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8504, i32 0, i32 4
%.tmp8506 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp8506, %m2756$.Type.type** %.tmp8505
%.tmp8507 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8508 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8507, i32 0, i32 4
%.tmp8509 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8508
%.tmp8510 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8509, i32 0, i32 0
%.tmp8512 = getelementptr [4 x i8], [4 x i8]*@.str8511, i32 0, i32 0
store i8* %.tmp8512, i8** %.tmp8510
%.tmp8513 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8514 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8513, i32 0, i32 4
%.tmp8515 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8514
%.tmp8516 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8515, i32 0, i32 3
%.tmp8517 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp8517, %m2756$.Type.type** %.tmp8516
%.tmp8518 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8519 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8518, i32 0, i32 4
%.tmp8520 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8519
%.tmp8521 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8520, i32 0, i32 3
%.tmp8522 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8521
%.tmp8523 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8522, i32 0, i32 0
%.tmp8525 = getelementptr [4 x i8], [4 x i8]*@.str8524, i32 0, i32 0
store i8* %.tmp8525, i8** %.tmp8523
br label %.if.end.8473
.if.false.8473:
%.tmp8526 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8527 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8526, i32 0, i32 7
%.tmp8528 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8527
%.tmp8529 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8528, i32 0, i32 0
%.tmp8530 = load i8*, i8** %.tmp8529
%.tmp8532 = getelementptr [4 x i8], [4 x i8]*@.str8531, i32 0, i32 0
%.tmp8533 = call i32(i8*,i8*) @strcmp(i8* %.tmp8530, i8* %.tmp8532)
%.tmp8534 = icmp eq i32 %.tmp8533, 0
br i1 %.tmp8534, label %.if.true.8535, label %.if.false.8535
.if.true.8535:
%.tmp8536 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8537 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8536)
store %m2756$.AssignableInfo.type* %.tmp8537, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8538 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8539 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8538, i32 0, i32 7
%.tmp8540 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8539
%.tmp8541 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8540, i32 0, i32 1
%.tmp8542 = load i8*, i8** %.tmp8541
%.tmp8543 = call i32(i8*) @strlen(i8* %.tmp8542)
%chr_len.8544 = alloca i32
store i32 %.tmp8543, i32* %chr_len.8544
%.tmp8545 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8546 = load i8, i8* @SCOPE_CONST
%.tmp8548 = getelementptr [2 x i8], [2 x i8]*@.str8547, i32 0, i32 0
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp8545, i8 %.tmp8546, i8* %.tmp8548)
%.tmp8549 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8550 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8549, i32 0, i32 0
%.tmp8551 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8552 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8551, i32 0, i32 7
%.tmp8553 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8552
%.tmp8554 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8553, i32 0, i32 1
%.tmp8555 = load i8*, i8** %.tmp8554
%.tmp8556 = call i8*(i8*) @m2310$chr_to_llvm.cp.cp(i8* %.tmp8555)
store i8* %.tmp8556, i8** %.tmp8550
%.tmp8557 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8558 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8557, i32 0, i32 0
%.tmp8559 = load i8*, i8** %.tmp8558
%.tmp8560 = icmp eq i8* %.tmp8559, null
br i1 %.tmp8560, label %.if.true.8561, label %.if.false.8561
.if.true.8561:
%.tmp8562 = getelementptr i8*, i8** %err_buf.8195, i32 0
%.tmp8564 = getelementptr [22 x i8], [22 x i8]*@.str8563, i32 0, i32 0
%.tmp8565 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8566 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8565, i32 0, i32 7
%.tmp8567 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8566
%.tmp8568 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8567, i32 0, i32 1
%.tmp8569 = load i8*, i8** %.tmp8568
%.tmp8570 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8562, i8* %.tmp8564, i8* %.tmp8569)
%.tmp8571 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp8571
br label %.if.end.8561
.if.false.8561:
br label %.if.end.8561
.if.end.8561:
%.tmp8572 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8573 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8572, i32 0, i32 4
%.tmp8574 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp8574, %m2756$.Type.type** %.tmp8573
%.tmp8575 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8576 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8575, i32 0, i32 4
%.tmp8577 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8576
%.tmp8578 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8577, i32 0, i32 0
%.tmp8580 = getelementptr [4 x i8], [4 x i8]*@.str8579, i32 0, i32 0
store i8* %.tmp8580, i8** %.tmp8578
br label %.if.end.8535
.if.false.8535:
%.tmp8581 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8582 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8584 = getelementptr [40 x i8], [40 x i8]*@.str8583, i32 0, i32 0
%.tmp8585 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp8581, %m980$.Node.type* %.tmp8582, i8* %.tmp8584)
%.tmp8586 = load %m980$.Node.type*, %m980$.Node.type** %mono.8192
%.tmp8587 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8586, i32 0, i32 7
%.tmp8588 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8587
%.tmp8589 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8588, i32 0, i32 0
%.tmp8590 = load i8*, i8** %.tmp8589
%.tmp8591 = call i32(i8*,...) @printf(i8* %.tmp8585, i8* %.tmp8590)
%.tmp8592 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp8592
br label %.if.end.8535
.if.end.8535:
br label %.if.end.8473
.if.end.8473:
br label %.if.end.8456
.if.end.8456:
br label %.if.end.8415
.if.end.8415:
br label %.if.end.8283
.if.end.8283:
br label %.if.end.8236
.if.end.8236:
br label %.if.end.8208
.if.end.8208:
%.tmp8593 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8594 = icmp eq %m2756$.AssignableInfo.type* %.tmp8593, null
br i1 %.tmp8594, label %.if.true.8595, label %.if.false.8595
.if.true.8595:
%.tmp8596 = bitcast ptr null to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp8596
br label %.if.end.8595
.if.false.8595:
br label %.if.end.8595
.if.end.8595:
%.tmp8597 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8598 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8597, i32 0, i32 5
%.tmp8599 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8600 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8599, i32 0, i32 3
%.tmp8601 = load i32, i32* %.tmp8600
store i32 %.tmp8601, i32* %.tmp8598
%.tmp8602 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8603 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8602, i32 0, i32 6
%.tmp8604 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8605 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8604, i32 0, i32 4
%.tmp8606 = load i32, i32* %.tmp8605
store i32 %.tmp8606, i32* %.tmp8603
%.tmp8607 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %assignable_info.8190
%.tmp8608 = bitcast %m2756$.AssignableInfo.type* %.tmp8607 to %m2756$.AssignableInfo.type*
ret %m2756$.AssignableInfo.type* %.tmp8608
}
define i8* @m295$type_abbr.cp.m2756$.Type.typep(%m2756$.Type.type* %.type.arg) {
%type = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.type.arg, %m2756$.Type.type** %type
%.tmp8609 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8610 = icmp ne %m2756$.Type.type* %.tmp8609, null
%.tmp8612 = getelementptr [22 x i8], [22 x i8]*@.str8611, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8610, i8* %.tmp8612)
%.tmp8613 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8614 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8613, i32 0, i32 0
%.tmp8615 = load i8*, i8** %.tmp8614
%.tmp8616 = icmp ne i8* %.tmp8615, null
%.tmp8618 = getelementptr [59 x i8], [59 x i8]*@.str8617, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8616, i8* %.tmp8618)
%.tmp8619 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8620 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8619, i32 0, i32 0
%.tmp8621 = load i8*, i8** %.tmp8620
%.tmp8623 = getelementptr [4 x i8], [4 x i8]*@.str8622, i32 0, i32 0
%.tmp8624 = call i32(i8*,i8*) @strcmp(i8* %.tmp8621, i8* %.tmp8623)
%.tmp8625 = icmp eq i32 %.tmp8624, 0
br i1 %.tmp8625, label %.if.true.8626, label %.if.false.8626
.if.true.8626:
%.tmp8628 = getelementptr [2 x i8], [2 x i8]*@.str8627, i32 0, i32 0
ret i8* %.tmp8628
br label %.if.end.8626
.if.false.8626:
%.tmp8629 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8630 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8629, i32 0, i32 0
%.tmp8631 = load i8*, i8** %.tmp8630
%.tmp8633 = getelementptr [5 x i8], [5 x i8]*@.str8632, i32 0, i32 0
%.tmp8634 = call i32(i8*,i8*) @strcmp(i8* %.tmp8631, i8* %.tmp8633)
%.tmp8635 = icmp eq i32 %.tmp8634, 0
br i1 %.tmp8635, label %.if.true.8636, label %.if.false.8636
.if.true.8636:
%.tmp8638 = getelementptr [2 x i8], [2 x i8]*@.str8637, i32 0, i32 0
ret i8* %.tmp8638
br label %.if.end.8636
.if.false.8636:
%.tmp8639 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8640 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8639, i32 0, i32 0
%.tmp8641 = load i8*, i8** %.tmp8640
%.tmp8643 = getelementptr [5 x i8], [5 x i8]*@.str8642, i32 0, i32 0
%.tmp8644 = call i32(i8*,i8*) @strcmp(i8* %.tmp8641, i8* %.tmp8643)
%.tmp8645 = icmp eq i32 %.tmp8644, 0
br i1 %.tmp8645, label %.if.true.8646, label %.if.false.8646
.if.true.8646:
%.tmp8648 = getelementptr [2 x i8], [2 x i8]*@.str8647, i32 0, i32 0
ret i8* %.tmp8648
br label %.if.end.8646
.if.false.8646:
%.tmp8649 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8650 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8649, i32 0, i32 0
%.tmp8651 = load i8*, i8** %.tmp8650
%.tmp8653 = getelementptr [4 x i8], [4 x i8]*@.str8652, i32 0, i32 0
%.tmp8654 = call i32(i8*,i8*) @strcmp(i8* %.tmp8651, i8* %.tmp8653)
%.tmp8655 = icmp eq i32 %.tmp8654, 0
br i1 %.tmp8655, label %.if.true.8656, label %.if.false.8656
.if.true.8656:
%.tmp8658 = getelementptr [2 x i8], [2 x i8]*@.str8657, i32 0, i32 0
ret i8* %.tmp8658
br label %.if.end.8656
.if.false.8656:
%.tmp8659 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8660 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8659, i32 0, i32 0
%.tmp8661 = load i8*, i8** %.tmp8660
%.tmp8663 = getelementptr [4 x i8], [4 x i8]*@.str8662, i32 0, i32 0
%.tmp8664 = call i32(i8*,i8*) @strcmp(i8* %.tmp8661, i8* %.tmp8663)
%.tmp8665 = icmp eq i32 %.tmp8664, 0
br i1 %.tmp8665, label %.if.true.8666, label %.if.false.8666
.if.true.8666:
%.tmp8668 = getelementptr [1 x i8], [1 x i8]*@.str8667, i32 0, i32 0
%buf.8669 = alloca i8*
store i8* %.tmp8668, i8** %buf.8669
%.tmp8670 = getelementptr i8*, i8** %buf.8669, i32 0
%.tmp8672 = getelementptr [4 x i8], [4 x i8]*@.str8671, i32 0, i32 0
%.tmp8673 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8674 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8673, i32 0, i32 3
%.tmp8675 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8674
%.tmp8676 = call i8*(%m2756$.Type.type*) @m295$type_abbr.cp.m2756$.Type.typep(%m2756$.Type.type* %.tmp8675)
%.tmp8677 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8670, i8* %.tmp8672, i8* %.tmp8676)
%.tmp8678 = load i8*, i8** %buf.8669
ret i8* %.tmp8678
br label %.if.end.8666
.if.false.8666:
%.tmp8679 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8680 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8679, i32 0, i32 0
%.tmp8681 = load i8*, i8** %.tmp8680
%.tmp8683 = getelementptr [10 x i8], [10 x i8]*@.str8682, i32 0, i32 0
%.tmp8684 = call i32(i8*,i8*) @strcmp(i8* %.tmp8681, i8* %.tmp8683)
%.tmp8685 = icmp eq i32 %.tmp8684, 0
br i1 %.tmp8685, label %.if.true.8686, label %.if.false.8686
.if.true.8686:
%.tmp8687 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8688 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8687, i32 0, i32 2
%.tmp8689 = load i8*, i8** %.tmp8688
ret i8* %.tmp8689
br label %.if.end.8686
.if.false.8686:
%.tmp8690 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8691 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8690, i32 0, i32 0
%.tmp8692 = load i8*, i8** %.tmp8691
%.tmp8694 = getelementptr [7 x i8], [7 x i8]*@.str8693, i32 0, i32 0
%.tmp8695 = call i32(i8*,i8*) @strcmp(i8* %.tmp8692, i8* %.tmp8694)
%.tmp8696 = icmp eq i32 %.tmp8695, 0
br i1 %.tmp8696, label %.if.true.8697, label %.if.false.8697
.if.true.8697:
%.tmp8699 = getelementptr [2 x i8], [2 x i8]*@.str8698, i32 0, i32 0
%buf.8700 = alloca i8*
store i8* %.tmp8699, i8** %buf.8700
%.tmp8702 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8703 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8702, i32 0, i32 3
%.tmp8704 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8703
%t.8705 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp8704, %m2756$.Type.type** %t.8705
br label %.for.start.8701
.for.start.8701:
%.tmp8706 = load %m2756$.Type.type*, %m2756$.Type.type** %t.8705
%.tmp8707 = icmp ne %m2756$.Type.type* %.tmp8706, null
br i1 %.tmp8707, label %.for.continue.8701, label %.for.end.8701
.for.continue.8701:
%.tmp8708 = getelementptr i8*, i8** %buf.8700, i32 0
%.tmp8710 = getelementptr [5 x i8], [5 x i8]*@.str8709, i32 0, i32 0
%.tmp8711 = load i8*, i8** %buf.8700
%.tmp8712 = load %m2756$.Type.type*, %m2756$.Type.type** %t.8705
%.tmp8713 = call i8*(%m2756$.Type.type*) @m295$type_abbr.cp.m2756$.Type.typep(%m2756$.Type.type* %.tmp8712)
%.tmp8714 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8708, i8* %.tmp8710, i8* %.tmp8711, i8* %.tmp8713)
%.tmp8715 = load %m2756$.Type.type*, %m2756$.Type.type** %t.8705
%.tmp8716 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8715, i32 0, i32 4
%.tmp8717 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8716
store %m2756$.Type.type* %.tmp8717, %m2756$.Type.type** %t.8705
br label %.for.start.8701
.for.end.8701:
%.tmp8718 = load i8*, i8** %buf.8700
ret i8* %.tmp8718
br label %.if.end.8697
.if.false.8697:
%.tmp8719 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8720 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8719, i32 0, i32 0
%.tmp8721 = load i8*, i8** %.tmp8720
%.tmp8723 = getelementptr [9 x i8], [9 x i8]*@.str8722, i32 0, i32 0
%.tmp8724 = call i32(i8*,i8*) @strcmp(i8* %.tmp8721, i8* %.tmp8723)
%.tmp8725 = icmp eq i32 %.tmp8724, 0
br i1 %.tmp8725, label %.if.true.8726, label %.if.false.8726
.if.true.8726:
%.tmp8728 = getelementptr [2 x i8], [2 x i8]*@.str8727, i32 0, i32 0
ret i8* %.tmp8728
br label %.if.end.8726
.if.false.8726:
%.tmp8729 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8730 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8729, i32 0, i32 0
%.tmp8731 = load i8*, i8** %.tmp8730
%.tmp8733 = getelementptr [6 x i8], [6 x i8]*@.str8732, i32 0, i32 0
%.tmp8734 = call i32(i8*,i8*) @strcmp(i8* %.tmp8731, i8* %.tmp8733)
%.tmp8735 = icmp eq i32 %.tmp8734, 0
br i1 %.tmp8735, label %.if.true.8736, label %.if.false.8736
.if.true.8736:
%.tmp8738 = getelementptr [2 x i8], [2 x i8]*@.str8737, i32 0, i32 0
ret i8* %.tmp8738
br label %.if.end.8736
.if.false.8736:
%.tmp8740 = getelementptr [45 x i8], [45 x i8]*@.str8739, i32 0, i32 0
%.tmp8741 = load %m2756$.Type.type*, %m2756$.Type.type** %type
%.tmp8742 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8741, i32 0, i32 0
%.tmp8743 = load i8*, i8** %.tmp8742
%.tmp8744 = call i32(i8*,...) @printf(i8* %.tmp8740, i8* %.tmp8743)
br label %.if.end.8736
.if.end.8736:
br label %.if.end.8726
.if.end.8726:
br label %.if.end.8697
.if.end.8697:
br label %.if.end.8686
.if.end.8686:
br label %.if.end.8666
.if.end.8666:
br label %.if.end.8656
.if.end.8656:
br label %.if.end.8646
.if.end.8646:
br label %.if.end.8636
.if.end.8636:
br label %.if.end.8626
.if.end.8626:
%.tmp8745 = bitcast ptr null to i8*
ret i8* %.tmp8745
}
define %m2756$.AssignableInfo.type* @m295$define_string.m2756$.AssignableInfo.typep.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp8746 = bitcast ptr null to %m980$.Node.type*
%.tmp8747 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8746)
%info.8748 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp8747, %m2756$.AssignableInfo.type** %info.8748
%.tmp8750 = getelementptr [1 x i8], [1 x i8]*@.str8749, i32 0, i32 0
%tmp_buff.8751 = alloca i8*
store i8* %.tmp8750, i8** %tmp_buff.8751
%.tmp8752 = getelementptr i8*, i8** %tmp_buff.8751, i32 0
%.tmp8754 = getelementptr [7 x i8], [7 x i8]*@.str8753, i32 0, i32 0
%.tmp8755 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8756 = call i32(%m2756$.CompilerCtx.type*) @m295$new_uid.i.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.tmp8755)
%.tmp8757 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8752, i8* %.tmp8754, i32 %.tmp8756)
%.tmp8758 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.8748
%.tmp8759 = load i8, i8* @SCOPE_GLOBAL
%.tmp8760 = load i8*, i8** %tmp_buff.8751
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp8758, i8 %.tmp8759, i8* %.tmp8760)
%.tmp8761 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.8748
%.tmp8762 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8761, i32 0, i32 4
%.tmp8763 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp8763, %m2756$.Type.type** %.tmp8762
%.tmp8764 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.8748
%.tmp8765 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8764, i32 0, i32 4
%.tmp8766 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8765
%.tmp8767 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8766, i32 0, i32 0
%.tmp8769 = getelementptr [6 x i8], [6 x i8]*@.str8768, i32 0, i32 0
store i8* %.tmp8769, i8** %.tmp8767
%.tmp8770 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.8748
%.tmp8771 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8770, i32 0, i32 4
%.tmp8772 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8771
%.tmp8773 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8772, i32 0, i32 3
%.tmp8774 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp8774, %m2756$.Type.type** %.tmp8773
%.tmp8775 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.8748
%.tmp8776 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8775, i32 0, i32 4
%.tmp8777 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8776
%.tmp8778 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8777, i32 0, i32 3
%.tmp8779 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8778
%.tmp8780 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8779, i32 0, i32 0
%.tmp8782 = getelementptr [4 x i8], [4 x i8]*@.str8781, i32 0, i32 0
store i8* %.tmp8782, i8** %.tmp8780
%.tmp8783 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.8748
%.tmp8784 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8783, i32 0, i32 4
%.tmp8785 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8784
%.tmp8786 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8785, i32 0, i32 3
%.tmp8787 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8786
%.tmp8788 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8787, i32 0, i32 4
%.tmp8789 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp8789, %m2756$.Type.type** %.tmp8788
%.tmp8790 = load i8*, i8** %text
%.tmp8791 = call i8*(i8*) @m2310$string_to_llvm.cp.cp(i8* %.tmp8790)
%identifier.8792 = alloca i8*
store i8* %.tmp8791, i8** %identifier.8792
%.tmp8793 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.8748
%.tmp8794 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8793, i32 0, i32 4
%.tmp8795 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8794
%.tmp8796 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8795, i32 0, i32 3
%.tmp8797 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8796
%.tmp8798 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8797, i32 0, i32 4
%.tmp8799 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp8798
%.tmp8800 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp8799, i32 0, i32 0
%.tmp8801 = getelementptr i8*, i8** %.tmp8800, i32 0
%.tmp8803 = getelementptr [3 x i8], [3 x i8]*@.str8802, i32 0, i32 0
%.tmp8804 = load i8*, i8** %identifier.8792
%.tmp8805 = call i32(i8*) @m2310$llvm_str_len.i.cp(i8* %.tmp8804)
%.tmp8806 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8801, i8* %.tmp8803, i32 %.tmp8805)
%.tmp8807 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8808 = load i8*, i8** %identifier.8792
%.tmp8810 = getelementptr [7 x i8], [7 x i8]*@.str8809, i32 0, i32 0
%.tmp8811 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.8748
call void(%m2756$.CompilerCtx.type*,i8*,i8*,%m2756$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2756$.CompilerCtx.typep.cp.cp.m2756$.AssignableInfo.typep.b.b(%m2756$.CompilerCtx.type* %.tmp8807, i8* %.tmp8808, i8* %.tmp8810, %m2756$.AssignableInfo.type* %.tmp8811, i1 0, i1 0)
%.tmp8812 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.8748
ret %m2756$.AssignableInfo.type* %.tmp8812
}
define void @m295$define_global.v.m2756$.CompilerCtx.typep.cp.cp.m2756$.AssignableInfo.typep.b.b(%m2756$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg, i8* %.type.arg, %m2756$.AssignableInfo.type* %.info.arg, i1 %.weak.arg, i1 %.compiled.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%type = alloca i8*
store i8* %.type.arg, i8** %type
%info = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.info.arg, %m2756$.AssignableInfo.type** %info
%weak = alloca i1
store i1 %.weak.arg, i1* %weak
%compiled = alloca i1
store i1 %.compiled.arg, i1* %compiled
%.tmp8813 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* null, i32 1
%.tmp8814 = ptrtoint %m2756$.GlobalName.type* %.tmp8813 to i32
%.tmp8815 = call i8*(i32) @malloc(i32 %.tmp8814)
%.tmp8816 = bitcast i8* %.tmp8815 to %m2756$.GlobalName.type*
%global.8817 = alloca %m2756$.GlobalName.type*
store %m2756$.GlobalName.type* %.tmp8816, %m2756$.GlobalName.type** %global.8817
%.tmp8818 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %global.8817
%.tmp8819 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp8818, i32 0, i32 0
%.tmp8820 = load i8*, i8** %id
store i8* %.tmp8820, i8** %.tmp8819
%.tmp8821 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %global.8817
%.tmp8822 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp8821, i32 0, i32 1
%.tmp8823 = load i8*, i8** %type
store i8* %.tmp8823, i8** %.tmp8822
%.tmp8824 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %global.8817
%.tmp8825 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp8824, i32 0, i32 4
%.tmp8826 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info
store %m2756$.AssignableInfo.type* %.tmp8826, %m2756$.AssignableInfo.type** %.tmp8825
%.tmp8827 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %global.8817
%.tmp8828 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp8827, i32 0, i32 2
%.tmp8829 = load i1, i1* %compiled
store i1 %.tmp8829, i1* %.tmp8828
%.tmp8830 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %global.8817
%.tmp8831 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp8830, i32 0, i32 5
store %m2756$.GlobalName.type* null, %m2756$.GlobalName.type** %.tmp8831
%.tmp8832 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %global.8817
%.tmp8833 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp8832, i32 0, i32 3
%.tmp8834 = load i1, i1* %weak
store i1 %.tmp8834, i1* %.tmp8833
%.tmp8835 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8836 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %global.8817
call void(%m2756$.CompilerCtx.type*,%m2756$.GlobalName.type*) @m295$append_global.v.m2756$.CompilerCtx.typep.m2756$.GlobalName.typep(%m2756$.CompilerCtx.type* %.tmp8835, %m2756$.GlobalName.type* %.tmp8836)
ret void
}
define void @m295$define_module.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.cp(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%mod = alloca %m980$.Node.type*
store %m980$.Node.type* %.mod.arg, %m980$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp8837 = load %m980$.Node.type*, %m980$.Node.type** %mod
%.tmp8838 = call %m2756$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2756$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8837)
%info.8839 = alloca %m2756$.AssignableInfo.type*
store %m2756$.AssignableInfo.type* %.tmp8838, %m2756$.AssignableInfo.type** %info.8839
%.tmp8840 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.8839
%.tmp8841 = load i8, i8* @SCOPE_CONST
%.tmp8842 = load i8*, i8** %abspath
call void(%m2756$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2756$.AssignableInfo.typep.c.cp(%m2756$.AssignableInfo.type* %.tmp8840, i8 %.tmp8841, i8* %.tmp8842)
%.tmp8843 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.8839
%.tmp8844 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8843, i32 0, i32 3
%.tmp8846 = getelementptr [7 x i8], [7 x i8]*@.str8845, i32 0, i32 0
store i8* %.tmp8846, i8** %.tmp8844
%.tmp8847 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.8839
%.tmp8848 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8847, i32 0, i32 4
store %m2756$.Type.type* null, %m2756$.Type.type** %.tmp8848
%.tmp8849 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8850 = load %m980$.Node.type*, %m980$.Node.type** %mod
%.tmp8851 = load i8*, i8** %as_name
%.tmp8852 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %info.8839
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2756$.AssignableInfo.type*) @m295$define_assignable.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp.m2756$.AssignableInfo.typep(%m2756$.CompilerCtx.type* %.tmp8849, %m980$.Node.type* %.tmp8850, i8* %.tmp8851, %m2756$.AssignableInfo.type* %.tmp8852)
ret void
}
define void @m295$append_anon_fn.v.m2756$.CompilerCtx.typep.cp(%m2756$.CompilerCtx.type* %.ctx.arg, i8* %.code.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%code = alloca i8*
store i8* %.code.arg, i8** %code
%.tmp8853 = getelementptr %m2756$.AnonFn.type, %m2756$.AnonFn.type* null, i32 1
%.tmp8854 = ptrtoint %m2756$.AnonFn.type* %.tmp8853 to i32
%.tmp8855 = call i8*(i32) @malloc(i32 %.tmp8854)
%.tmp8856 = bitcast i8* %.tmp8855 to %m2756$.AnonFn.type*
%fn.8857 = alloca %m2756$.AnonFn.type*
store %m2756$.AnonFn.type* %.tmp8856, %m2756$.AnonFn.type** %fn.8857
%.tmp8858 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %fn.8857
%.tmp8859 = getelementptr %m2756$.AnonFn.type, %m2756$.AnonFn.type* %.tmp8858, i32 0, i32 0
%.tmp8860 = load i8*, i8** %code
store i8* %.tmp8860, i8** %.tmp8859
%.tmp8861 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8862 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8861, i32 0, i32 8
%.tmp8863 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %.tmp8862
%.tmp8864 = icmp eq %m2756$.AnonFn.type* %.tmp8863, null
br i1 %.tmp8864, label %.if.true.8865, label %.if.false.8865
.if.true.8865:
%.tmp8866 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8867 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8866, i32 0, i32 8
%.tmp8868 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %fn.8857
store %m2756$.AnonFn.type* %.tmp8868, %m2756$.AnonFn.type** %.tmp8867
%.tmp8869 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %fn.8857
%.tmp8870 = getelementptr %m2756$.AnonFn.type, %m2756$.AnonFn.type* %.tmp8869, i32 0, i32 1
store %m2756$.AnonFn.type* null, %m2756$.AnonFn.type** %.tmp8870
br label %.if.end.8865
.if.false.8865:
%.tmp8871 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8872 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8871, i32 0, i32 8
%.tmp8873 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %.tmp8872
%last.8874 = alloca %m2756$.AnonFn.type*
store %m2756$.AnonFn.type* %.tmp8873, %m2756$.AnonFn.type** %last.8874
br label %.for.start.8875
.for.start.8875:
%.tmp8876 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %last.8874
%.tmp8877 = getelementptr %m2756$.AnonFn.type, %m2756$.AnonFn.type* %.tmp8876, i32 0, i32 1
%.tmp8878 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %.tmp8877
%.tmp8879 = icmp ne %m2756$.AnonFn.type* %.tmp8878, null
br i1 %.tmp8879, label %.for.continue.8875, label %.for.end.8875
.for.continue.8875:
%.tmp8880 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %last.8874
%.tmp8881 = getelementptr %m2756$.AnonFn.type, %m2756$.AnonFn.type* %.tmp8880, i32 0, i32 1
%.tmp8882 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %.tmp8881
store %m2756$.AnonFn.type* %.tmp8882, %m2756$.AnonFn.type** %last.8874
br label %.for.start.8875
.for.end.8875:
%.tmp8883 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %last.8874
%.tmp8884 = getelementptr %m2756$.AnonFn.type, %m2756$.AnonFn.type* %.tmp8883, i32 0, i32 1
%.tmp8885 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %fn.8857
store %m2756$.AnonFn.type* %.tmp8885, %m2756$.AnonFn.type** %.tmp8884
br label %.if.end.8865
.if.end.8865:
ret void
}
define void @m295$compile_anon_fn.v.m2756$.CompilerCtx.typep(%m2756$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%.tmp8887 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8888 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8887, i32 0, i32 8
%.tmp8889 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %.tmp8888
%fn.8890 = alloca %m2756$.AnonFn.type*
store %m2756$.AnonFn.type* %.tmp8889, %m2756$.AnonFn.type** %fn.8890
br label %.for.start.8886
.for.start.8886:
%.tmp8891 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %fn.8890
%.tmp8892 = icmp ne %m2756$.AnonFn.type* %.tmp8891, null
br i1 %.tmp8892, label %.for.continue.8886, label %.for.end.8886
.for.continue.8886:
%.tmp8893 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8894 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8893, i32 0, i32 1
%.tmp8895 = load %m0$.File.type*, %m0$.File.type** %.tmp8894
%.tmp8897 = getelementptr [4 x i8], [4 x i8]*@.str8896, i32 0, i32 0
%.tmp8898 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %fn.8890
%.tmp8899 = getelementptr %m2756$.AnonFn.type, %m2756$.AnonFn.type* %.tmp8898, i32 0, i32 0
%.tmp8900 = load i8*, i8** %.tmp8899
%.tmp8901 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8895, i8* %.tmp8897, i8* %.tmp8900)
%.tmp8902 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %fn.8890
%.tmp8903 = getelementptr %m2756$.AnonFn.type, %m2756$.AnonFn.type* %.tmp8902, i32 0, i32 1
%.tmp8904 = load %m2756$.AnonFn.type*, %m2756$.AnonFn.type** %.tmp8903
store %m2756$.AnonFn.type* %.tmp8904, %m2756$.AnonFn.type** %fn.8890
br label %.for.start.8886
.for.end.8886:
%.tmp8905 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8906 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8905, i32 0, i32 8
store %m2756$.AnonFn.type* null, %m2756$.AnonFn.type** %.tmp8906
ret void
}
define void @m295$append_global.v.m2756$.CompilerCtx.typep.m2756$.GlobalName.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%g = alloca %m2756$.GlobalName.type*
store %m2756$.GlobalName.type* %.g.arg, %m2756$.GlobalName.type** %g
%.tmp8907 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8908 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8907, i32 0, i32 3
%.tmp8909 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %.tmp8908
%.tmp8910 = icmp eq %m2756$.GlobalName.type* %.tmp8909, null
br i1 %.tmp8910, label %.if.true.8911, label %.if.false.8911
.if.true.8911:
%.tmp8912 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8913 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8912, i32 0, i32 3
%.tmp8914 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g
store %m2756$.GlobalName.type* %.tmp8914, %m2756$.GlobalName.type** %.tmp8913
ret void
br label %.if.end.8911
.if.false.8911:
br label %.if.end.8911
.if.end.8911:
%.tmp8915 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8916 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8915, i32 0, i32 3
%.tmp8917 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %.tmp8916
%last_global.8918 = alloca %m2756$.GlobalName.type*
store %m2756$.GlobalName.type* %.tmp8917, %m2756$.GlobalName.type** %last_global.8918
%.tmp8920 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8921 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8920, i32 0, i32 3
%.tmp8922 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %.tmp8921
%curr_global.8923 = alloca %m2756$.GlobalName.type*
store %m2756$.GlobalName.type* %.tmp8922, %m2756$.GlobalName.type** %curr_global.8923
br label %.for.start.8919
.for.start.8919:
%.tmp8924 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %curr_global.8923
%.tmp8925 = icmp ne %m2756$.GlobalName.type* %.tmp8924, null
br i1 %.tmp8925, label %.for.continue.8919, label %.for.end.8919
.for.continue.8919:
%.tmp8926 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %curr_global.8923
%.tmp8927 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp8926, i32 0, i32 4
%.tmp8928 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %.tmp8927
%.tmp8929 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8928, i32 0, i32 0
%.tmp8930 = load i8*, i8** %.tmp8929
%.tmp8931 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g
%.tmp8932 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp8931, i32 0, i32 4
%.tmp8933 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %.tmp8932
%.tmp8934 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp8933, i32 0, i32 0
%.tmp8935 = load i8*, i8** %.tmp8934
%.tmp8936 = call i32(i8*,i8*) @strcmp(i8* %.tmp8930, i8* %.tmp8935)
%.tmp8937 = icmp eq i32 %.tmp8936, 0
br i1 %.tmp8937, label %.if.true.8938, label %.if.false.8938
.if.true.8938:
ret void
br label %.if.end.8938
.if.false.8938:
br label %.if.end.8938
.if.end.8938:
%.tmp8939 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %curr_global.8923
store %m2756$.GlobalName.type* %.tmp8939, %m2756$.GlobalName.type** %last_global.8918
%.tmp8940 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %curr_global.8923
%.tmp8941 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp8940, i32 0, i32 5
%.tmp8942 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %.tmp8941
store %m2756$.GlobalName.type* %.tmp8942, %m2756$.GlobalName.type** %curr_global.8923
br label %.for.start.8919
.for.end.8919:
%.tmp8943 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %last_global.8918
%.tmp8944 = getelementptr %m2756$.GlobalName.type, %m2756$.GlobalName.type* %.tmp8943, i32 0, i32 5
%.tmp8945 = load %m2756$.GlobalName.type*, %m2756$.GlobalName.type** %g
store %m2756$.GlobalName.type* %.tmp8945, %m2756$.GlobalName.type** %.tmp8944
ret void
}
define void @m295$append_error.v.m2756$.CompilerCtx.typep.m296$.Error.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m296$.Error.type* %.e.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp8946 = getelementptr %m2756$.ErrorList.type, %m2756$.ErrorList.type* null, i32 1
%.tmp8947 = ptrtoint %m2756$.ErrorList.type* %.tmp8946 to i32
%.tmp8948 = call i8*(i32) @malloc(i32 %.tmp8947)
%.tmp8949 = bitcast i8* %.tmp8948 to %m2756$.ErrorList.type*
%new_err.8950 = alloca %m2756$.ErrorList.type*
store %m2756$.ErrorList.type* %.tmp8949, %m2756$.ErrorList.type** %new_err.8950
%.tmp8951 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %new_err.8950
%.tmp8952 = getelementptr %m2756$.ErrorList.type, %m2756$.ErrorList.type* %.tmp8951, i32 0, i32 2
store i1 0, i1* %.tmp8952
%.tmp8953 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %new_err.8950
%.tmp8954 = getelementptr %m2756$.ErrorList.type, %m2756$.ErrorList.type* %.tmp8953, i32 0, i32 0
%.tmp8955 = load %m296$.Error.type*, %m296$.Error.type** %e
store %m296$.Error.type* %.tmp8955, %m296$.Error.type** %.tmp8954
%.tmp8956 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %new_err.8950
%.tmp8957 = getelementptr %m2756$.ErrorList.type, %m2756$.ErrorList.type* %.tmp8956, i32 0, i32 1
store %m2756$.ErrorList.type* null, %m2756$.ErrorList.type** %.tmp8957
%.tmp8958 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8959 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8958, i32 0, i32 2
%.tmp8960 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %.tmp8959
%.tmp8961 = icmp eq %m2756$.ErrorList.type* %.tmp8960, null
br i1 %.tmp8961, label %.if.true.8962, label %.if.false.8962
.if.true.8962:
%.tmp8963 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8964 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8963, i32 0, i32 2
%.tmp8965 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %new_err.8950
store %m2756$.ErrorList.type* %.tmp8965, %m2756$.ErrorList.type** %.tmp8964
ret void
br label %.if.end.8962
.if.false.8962:
br label %.if.end.8962
.if.end.8962:
%last.8966 = alloca %m2756$.ErrorList.type*
store %m2756$.ErrorList.type* null, %m2756$.ErrorList.type** %last.8966
%.tmp8968 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp8969 = getelementptr %m2756$.CompilerCtx.type, %m2756$.CompilerCtx.type* %.tmp8968, i32 0, i32 2
%.tmp8970 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %.tmp8969
store %m2756$.ErrorList.type* %.tmp8970, %m2756$.ErrorList.type** %last.8966
br label %.for.start.8967
.for.start.8967:
%.tmp8971 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %last.8966
%.tmp8972 = getelementptr %m2756$.ErrorList.type, %m2756$.ErrorList.type* %.tmp8971, i32 0, i32 1
%.tmp8973 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %.tmp8972
%.tmp8974 = icmp ne %m2756$.ErrorList.type* %.tmp8973, null
br i1 %.tmp8974, label %.for.continue.8967, label %.for.end.8967
.for.continue.8967:
%.tmp8975 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %last.8966
%.tmp8976 = getelementptr %m2756$.ErrorList.type, %m2756$.ErrorList.type* %.tmp8975, i32 0, i32 1
%.tmp8977 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %.tmp8976
store %m2756$.ErrorList.type* %.tmp8977, %m2756$.ErrorList.type** %last.8966
br label %.for.start.8967
.for.end.8967:
%.tmp8978 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %last.8966
%.tmp8979 = getelementptr %m2756$.ErrorList.type, %m2756$.ErrorList.type* %.tmp8978, i32 0, i32 1
%.tmp8980 = load %m2756$.ErrorList.type*, %m2756$.ErrorList.type** %new_err.8950
store %m2756$.ErrorList.type* %.tmp8980, %m2756$.ErrorList.type** %.tmp8979
ret void
}
define i8* @m295$syn_function_name.cp.m980$.Node.typep(%m980$.Node.type* %.stmt.arg) {
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp8981 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp8982 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8981, i32 0, i32 7
%.tmp8983 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8982
%.tmp8984 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8983, i32 0, i32 8
%.tmp8985 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8984
%.tmp8986 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8985, i32 0, i32 1
%.tmp8987 = load i8*, i8** %.tmp8986
ret i8* %.tmp8987
}
define %m980$.Node.type* @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m980$.Node.type*
store %m980$.Node.type* %.node.arg, %m980$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp8989 = load %m980$.Node.type*, %m980$.Node.type** %node
%n.8990 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8989, %m980$.Node.type** %n.8990
br label %.for.start.8988
.for.start.8988:
%.tmp8991 = load %m980$.Node.type*, %m980$.Node.type** %n.8990
%.tmp8992 = icmp ne %m980$.Node.type* %.tmp8991, null
br i1 %.tmp8992, label %.for.continue.8988, label %.for.end.8988
.for.continue.8988:
%.tmp8993 = load %m980$.Node.type*, %m980$.Node.type** %n.8990
%.tmp8994 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8993, i32 0, i32 0
%.tmp8995 = load i8*, i8** %.tmp8994
%.tmp8996 = load i8*, i8** %type
%.tmp8997 = call i32(i8*,i8*) @strcmp(i8* %.tmp8995, i8* %.tmp8996)
%.tmp8998 = icmp eq i32 %.tmp8997, 0
br i1 %.tmp8998, label %.if.true.8999, label %.if.false.8999
.if.true.8999:
%.tmp9000 = load %m980$.Node.type*, %m980$.Node.type** %n.8990
ret %m980$.Node.type* %.tmp9000
br label %.if.end.8999
.if.false.8999:
br label %.if.end.8999
.if.end.8999:
%.tmp9001 = load %m980$.Node.type*, %m980$.Node.type** %n.8990
%.tmp9002 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9001, i32 0, i32 8
%.tmp9003 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9002
store %m980$.Node.type* %.tmp9003, %m980$.Node.type** %n.8990
br label %.for.start.8988
.for.end.8988:
%.tmp9004 = bitcast ptr null to %m980$.Node.type*
ret %m980$.Node.type* %.tmp9004
}
define %m2756$.Type.type* @m295$syn_function_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp9005 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%function_type.9006 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9005, %m2756$.Type.type** %function_type.9006
%.tmp9007 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp9008 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9009 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9008, i32 0, i32 7
%.tmp9010 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9009
%.tmp9011 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp9007, %m980$.Node.type* %.tmp9010)
%return_value_type.9012 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9011, %m2756$.Type.type** %return_value_type.9012
%.tmp9013 = load %m2756$.Type.type*, %m2756$.Type.type** %function_type.9006
%.tmp9014 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9013, i32 0, i32 0
%.tmp9016 = getelementptr [9 x i8], [9 x i8]*@.str9015, i32 0, i32 0
store i8* %.tmp9016, i8** %.tmp9014
%.tmp9017 = load %m2756$.Type.type*, %m2756$.Type.type** %function_type.9006
%.tmp9018 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9017, i32 0, i32 3
%.tmp9019 = load %m2756$.Type.type*, %m2756$.Type.type** %return_value_type.9012
store %m2756$.Type.type* %.tmp9019, %m2756$.Type.type** %.tmp9018
%.tmp9020 = load %m2756$.Type.type*, %m2756$.Type.type** %return_value_type.9012
%last_type.9021 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9020, %m2756$.Type.type** %last_type.9021
%.tmp9022 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9023 = call %m980$.Node.type*(%m980$.Node.type*) @m295$syn_function_params.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.tmp9022)
%params.9024 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9023, %m980$.Node.type** %params.9024
%.tmp9026 = load %m980$.Node.type*, %m980$.Node.type** %params.9024
%param_ptr.9027 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9026, %m980$.Node.type** %param_ptr.9027
br label %.for.start.9025
.for.start.9025:
%.tmp9028 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.9027
%.tmp9029 = icmp ne %m980$.Node.type* %.tmp9028, null
br i1 %.tmp9029, label %.for.continue.9025, label %.for.end.9025
.for.continue.9025:
%.tmp9030 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.9027
%.tmp9031 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9030, i32 0, i32 0
%.tmp9032 = load i8*, i8** %.tmp9031
%.tmp9034 = getelementptr [5 x i8], [5 x i8]*@.str9033, i32 0, i32 0
%.tmp9035 = call i32(i8*,i8*) @strcmp(i8* %.tmp9032, i8* %.tmp9034)
%.tmp9036 = icmp eq i32 %.tmp9035, 0
br i1 %.tmp9036, label %.if.true.9037, label %.if.false.9037
.if.true.9037:
%.tmp9038 = load %m2756$.Type.type*, %m2756$.Type.type** %last_type.9021
%.tmp9039 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9038, i32 0, i32 4
%.tmp9040 = load %m2756$.Type.type*, %m2756$.Type.type** %last_type.9021
%.tmp9041 = call %m2756$.Type.type*(%m2756$.Type.type*) @m295$type_clone.m2756$.Type.typep.m2756$.Type.typep(%m2756$.Type.type* %.tmp9040)
store %m2756$.Type.type* %.tmp9041, %m2756$.Type.type** %.tmp9039
%.tmp9042 = load %m2756$.Type.type*, %m2756$.Type.type** %last_type.9021
%.tmp9043 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9042, i32 0, i32 4
%.tmp9044 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp9043
%.tmp9045 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9044, i32 0, i32 4
store %m2756$.Type.type* null, %m2756$.Type.type** %.tmp9045
%.tmp9046 = load %m2756$.Type.type*, %m2756$.Type.type** %last_type.9021
%.tmp9047 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9046, i32 0, i32 4
%.tmp9048 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp9047
store %m2756$.Type.type* %.tmp9048, %m2756$.Type.type** %last_type.9021
%.tmp9049 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.9027
%.tmp9050 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9049, i32 0, i32 8
%.tmp9051 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9050
%.tmp9052 = icmp ne %m980$.Node.type* %.tmp9051, null
br i1 %.tmp9052, label %.if.true.9053, label %.if.false.9053
.if.true.9053:
%.tmp9054 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.9027
%.tmp9055 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9054, i32 0, i32 8
%.tmp9056 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9055
store %m980$.Node.type* %.tmp9056, %m980$.Node.type** %param_ptr.9027
br label %.if.end.9053
.if.false.9053:
br label %.if.end.9053
.if.end.9053:
%.tmp9057 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.9027
%.tmp9058 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9057, i32 0, i32 8
%.tmp9059 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9058
%.tmp9060 = icmp ne %m980$.Node.type* %.tmp9059, null
br i1 %.tmp9060, label %.if.true.9061, label %.if.false.9061
.if.true.9061:
%.tmp9062 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.9027
%.tmp9063 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9062, i32 0, i32 8
%.tmp9064 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9063
store %m980$.Node.type* %.tmp9064, %m980$.Node.type** %param_ptr.9027
br label %.if.end.9061
.if.false.9061:
store %m980$.Node.type* null, %m980$.Node.type** %param_ptr.9027
br label %.if.end.9061
.if.end.9061:
br label %.if.end.9037
.if.false.9037:
%.tmp9065 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp9066 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.9027
%.tmp9067 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9066, i32 0, i32 7
%.tmp9068 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9067
%.tmp9069 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp9065, %m980$.Node.type* %.tmp9068)
%param_type.9070 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9069, %m2756$.Type.type** %param_type.9070
%.tmp9071 = load %m2756$.Type.type*, %m2756$.Type.type** %last_type.9021
%.tmp9072 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9071, i32 0, i32 4
%.tmp9073 = load %m2756$.Type.type*, %m2756$.Type.type** %param_type.9070
store %m2756$.Type.type* %.tmp9073, %m2756$.Type.type** %.tmp9072
%.tmp9074 = load %m2756$.Type.type*, %m2756$.Type.type** %param_type.9070
store %m2756$.Type.type* %.tmp9074, %m2756$.Type.type** %last_type.9021
%.tmp9075 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.9027
%.tmp9076 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9075, i32 0, i32 8
%.tmp9077 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9076
store %m980$.Node.type* %.tmp9077, %m980$.Node.type** %param_ptr.9027
%.tmp9078 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.9027
%.tmp9079 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9078, i32 0, i32 8
%.tmp9080 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9079
%.tmp9081 = icmp ne %m980$.Node.type* %.tmp9080, null
br i1 %.tmp9081, label %.if.true.9082, label %.if.false.9082
.if.true.9082:
%.tmp9083 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.9027
%.tmp9084 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9083, i32 0, i32 8
%.tmp9085 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9084
%.tmp9086 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9085, i32 0, i32 8
%.tmp9087 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9086
store %m980$.Node.type* %.tmp9087, %m980$.Node.type** %param_ptr.9027
br label %.if.end.9082
.if.false.9082:
store %m980$.Node.type* null, %m980$.Node.type** %param_ptr.9027
br label %.if.end.9082
.if.end.9082:
br label %.if.end.9037
.if.end.9037:
br label %.for.start.9025
.for.end.9025:
%.tmp9088 = load %m2756$.Type.type*, %m2756$.Type.type** %function_type.9006
ret %m2756$.Type.type* %.tmp9088
}
define %m980$.Node.type* @m295$syn_function_params.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.stmt.arg) {
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp9089 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9091 = getelementptr [10 x i8], [10 x i8]*@.str9090, i32 0, i32 0
%.tmp9092 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp9089, i8* %.tmp9091)
%params.9093 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9092, %m980$.Node.type** %params.9093
%.tmp9094 = load %m980$.Node.type*, %m980$.Node.type** %params.9093
%.tmp9095 = icmp eq %m980$.Node.type* %.tmp9094, null
br i1 %.tmp9095, label %.if.true.9096, label %.if.false.9096
.if.true.9096:
%.tmp9097 = bitcast ptr null to %m980$.Node.type*
ret %m980$.Node.type* %.tmp9097
br label %.if.end.9096
.if.false.9096:
br label %.if.end.9096
.if.end.9096:
%.tmp9098 = load %m980$.Node.type*, %m980$.Node.type** %params.9093
%.tmp9099 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9098, i32 0, i32 7
%.tmp9100 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9099
ret %m980$.Node.type* %.tmp9100
}
define %m2756$.Type.type* @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.ctx.arg, %m2756$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp9101 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9102 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9101, i32 0, i32 0
%.tmp9103 = load i8*, i8** %.tmp9102
%.tmp9105 = getelementptr [11 x i8], [11 x i8]*@.str9104, i32 0, i32 0
%.tmp9106 = call i32(i8*,i8*) @strcmp(i8* %.tmp9103, i8* %.tmp9105)
%.tmp9107 = icmp eq i32 %.tmp9106, 0
br i1 %.tmp9107, label %.if.true.9108, label %.if.false.9108
.if.true.9108:
%.tmp9109 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp9110 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9111 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9110, i32 0, i32 7
%.tmp9112 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9111
%.tmp9113 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp9109, %m980$.Node.type* %.tmp9112)
%t.9114 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9113, %m2756$.Type.type** %t.9114
%.tmp9115 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9116 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9115, i32 0, i32 8
%.tmp9117 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9116
%.tmp9118 = icmp ne %m980$.Node.type* %.tmp9117, null
br i1 %.tmp9118, label %.if.true.9119, label %.if.false.9119
.if.true.9119:
%.tmp9120 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9121 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9120, i32 0, i32 8
%.tmp9122 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9121
%.tmp9123 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9122, i32 0, i32 0
%.tmp9124 = load i8*, i8** %.tmp9123
%.tmp9126 = getelementptr [13 x i8], [13 x i8]*@.str9125, i32 0, i32 0
%.tmp9127 = call i32(i8*,i8*) @strcmp(i8* %.tmp9124, i8* %.tmp9126)
%.tmp9128 = icmp eq i32 %.tmp9127, 0
br i1 %.tmp9128, label %.if.true.9129, label %.if.false.9129
.if.true.9129:
%.tmp9130 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%fn_type.9131 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9130, %m2756$.Type.type** %fn_type.9131
%.tmp9132 = load %m2756$.Type.type*, %m2756$.Type.type** %fn_type.9131
%.tmp9133 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9132, i32 0, i32 0
%.tmp9135 = getelementptr [9 x i8], [9 x i8]*@.str9134, i32 0, i32 0
store i8* %.tmp9135, i8** %.tmp9133
%.tmp9136 = load %m2756$.Type.type*, %m2756$.Type.type** %fn_type.9131
%.tmp9137 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9136, i32 0, i32 3
%.tmp9138 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9114
store %m2756$.Type.type* %.tmp9138, %m2756$.Type.type** %.tmp9137
%.tmp9139 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9140 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9139, i32 0, i32 8
%.tmp9141 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9140
%.tmp9142 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9141, i32 0, i32 7
%.tmp9143 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9142
%.tmp9144 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9143, i32 0, i32 8
%.tmp9145 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9144
%fst_operator.9146 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9145, %m980$.Node.type** %fst_operator.9146
%.tmp9147 = load %m980$.Node.type*, %m980$.Node.type** %fst_operator.9146
%.tmp9148 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9147, i32 0, i32 0
%.tmp9149 = load i8*, i8** %.tmp9148
%.tmp9151 = getelementptr [15 x i8], [15 x i8]*@.str9150, i32 0, i32 0
%.tmp9152 = call i32(i8*,i8*) @strcmp(i8* %.tmp9149, i8* %.tmp9151)
%.tmp9153 = icmp eq i32 %.tmp9152, 0
br i1 %.tmp9153, label %.if.true.9154, label %.if.false.9154
.if.true.9154:
%.tmp9155 = load %m2756$.Type.type*, %m2756$.Type.type** %fn_type.9131
%.tmp9156 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9155, i32 0, i32 3
%.tmp9157 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp9156
%last_fn_value.9158 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9157, %m2756$.Type.type** %last_fn_value.9158
%.tmp9160 = load %m980$.Node.type*, %m980$.Node.type** %fst_operator.9146
%.tmp9161 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9160, i32 0, i32 7
%.tmp9162 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9161
%t.9163 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9162, %m980$.Node.type** %t.9163
br label %.for.start.9159
.for.start.9159:
%.tmp9164 = load %m980$.Node.type*, %m980$.Node.type** %t.9163
%.tmp9165 = icmp ne %m980$.Node.type* %.tmp9164, null
br i1 %.tmp9165, label %.for.continue.9159, label %.for.end.9159
.for.continue.9159:
%.tmp9166 = load %m2756$.Type.type*, %m2756$.Type.type** %last_fn_value.9158
%.tmp9167 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9166, i32 0, i32 4
%.tmp9168 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp9169 = load %m980$.Node.type*, %m980$.Node.type** %t.9163
%.tmp9170 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9169, i32 0, i32 7
%.tmp9171 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9170
%.tmp9172 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp9168, %m980$.Node.type* %.tmp9171)
store %m2756$.Type.type* %.tmp9172, %m2756$.Type.type** %.tmp9167
%.tmp9173 = load %m2756$.Type.type*, %m2756$.Type.type** %last_fn_value.9158
%.tmp9174 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9173, i32 0, i32 4
%.tmp9175 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp9174
store %m2756$.Type.type* %.tmp9175, %m2756$.Type.type** %last_fn_value.9158
%.tmp9176 = load %m980$.Node.type*, %m980$.Node.type** %t.9163
%.tmp9177 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9176, i32 0, i32 8
%.tmp9178 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9177
%.tmp9179 = icmp ne %m980$.Node.type* %.tmp9178, null
br i1 %.tmp9179, label %.if.true.9180, label %.if.false.9180
.if.true.9180:
%.tmp9181 = load %m980$.Node.type*, %m980$.Node.type** %t.9163
%.tmp9182 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9181, i32 0, i32 8
%.tmp9183 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9182
store %m980$.Node.type* %.tmp9183, %m980$.Node.type** %t.9163
br label %.if.end.9180
.if.false.9180:
br label %.if.end.9180
.if.end.9180:
%.tmp9184 = load %m980$.Node.type*, %m980$.Node.type** %t.9163
%.tmp9185 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9184, i32 0, i32 8
%.tmp9186 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9185
store %m980$.Node.type* %.tmp9186, %m980$.Node.type** %t.9163
br label %.for.start.9159
.for.end.9159:
br label %.if.end.9154
.if.false.9154:
br label %.if.end.9154
.if.end.9154:
%.tmp9187 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%t_ptr.9188 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9187, %m2756$.Type.type** %t_ptr.9188
%.tmp9189 = load %m2756$.Type.type*, %m2756$.Type.type** %t_ptr.9188
%.tmp9190 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9189, i32 0, i32 0
%.tmp9192 = getelementptr [4 x i8], [4 x i8]*@.str9191, i32 0, i32 0
store i8* %.tmp9192, i8** %.tmp9190
%.tmp9193 = load %m2756$.Type.type*, %m2756$.Type.type** %t_ptr.9188
%.tmp9194 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9193, i32 0, i32 3
%.tmp9195 = load %m2756$.Type.type*, %m2756$.Type.type** %fn_type.9131
store %m2756$.Type.type* %.tmp9195, %m2756$.Type.type** %.tmp9194
%.tmp9196 = load %m2756$.Type.type*, %m2756$.Type.type** %t_ptr.9188
store %m2756$.Type.type* %.tmp9196, %m2756$.Type.type** %t.9114
br label %.if.end.9129
.if.false.9129:
br label %.if.end.9129
.if.end.9129:
br label %.if.end.9119
.if.false.9119:
br label %.if.end.9119
.if.end.9119:
%.tmp9197 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9114
ret %m2756$.Type.type* %.tmp9197
br label %.if.end.9108
.if.false.9108:
br label %.if.end.9108
.if.end.9108:
%.tmp9198 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%t.9199 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9198, %m2756$.Type.type** %t.9199
%.tmp9200 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9201 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9200, i32 0, i32 0
%.tmp9202 = load i8*, i8** %.tmp9201
%.tmp9204 = getelementptr [10 x i8], [10 x i8]*@.str9203, i32 0, i32 0
%.tmp9205 = call i32(i8*,i8*) @strcmp(i8* %.tmp9202, i8* %.tmp9204)
%.tmp9206 = icmp eq i32 %.tmp9205, 0
br i1 %.tmp9206, label %.if.true.9207, label %.if.false.9207
.if.true.9207:
%.tmp9208 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9209 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9208, i32 0, i32 0
%.tmp9211 = getelementptr [7 x i8], [7 x i8]*@.str9210, i32 0, i32 0
store i8* %.tmp9211, i8** %.tmp9209
%.tmp9212 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9213 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9212, i32 0, i32 1
store i8* null, i8** %.tmp9213
%.tmp9214 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9215 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9214, i32 0, i32 7
%.tmp9216 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9215
%.tmp9218 = getelementptr [5 x i8], [5 x i8]*@.str9217, i32 0, i32 0
%.tmp9219 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp9216, i8* %.tmp9218)
%curr_type.9220 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9219, %m980$.Node.type** %curr_type.9220
%.tmp9221 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9220
%.tmp9222 = icmp ne %m980$.Node.type* %.tmp9221, null
br i1 %.tmp9222, label %.if.true.9223, label %.if.false.9223
.if.true.9223:
%.tmp9224 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9225 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9224, i32 0, i32 3
%.tmp9226 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp9227 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9220
%.tmp9228 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9227, i32 0, i32 7
%.tmp9229 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9228
%.tmp9230 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp9226, %m980$.Node.type* %.tmp9229)
store %m2756$.Type.type* %.tmp9230, %m2756$.Type.type** %.tmp9225
%.tmp9231 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9232 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9231, i32 0, i32 3
%.tmp9233 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp9232
%.tmp9234 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9233, i32 0, i32 1
%.tmp9235 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9220
%.tmp9236 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9235, i32 0, i32 8
%.tmp9237 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9236
%.tmp9238 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9237, i32 0, i32 1
%.tmp9239 = load i8*, i8** %.tmp9238
store i8* %.tmp9239, i8** %.tmp9234
%.tmp9240 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9241 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9240, i32 0, i32 3
%.tmp9242 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp9241
%curr_t.9243 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9242, %m2756$.Type.type** %curr_t.9243
%.tmp9245 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9220
%.tmp9246 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9245, i32 0, i32 8
%.tmp9247 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9246
%.tmp9249 = getelementptr [5 x i8], [5 x i8]*@.str9248, i32 0, i32 0
%.tmp9250 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp9247, i8* %.tmp9249)
store %m980$.Node.type* %.tmp9250, %m980$.Node.type** %curr_type.9220
br label %.for.start.9244
.for.start.9244:
%.tmp9251 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9220
%.tmp9252 = icmp ne %m980$.Node.type* %.tmp9251, null
br i1 %.tmp9252, label %.for.continue.9244, label %.for.end.9244
.for.continue.9244:
%.tmp9253 = load %m2756$.Type.type*, %m2756$.Type.type** %curr_t.9243
%.tmp9254 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9253, i32 0, i32 4
%.tmp9255 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp9256 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9220
%.tmp9257 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9256, i32 0, i32 7
%.tmp9258 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9257
%.tmp9259 = call %m2756$.Type.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2756$.Type.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp9255, %m980$.Node.type* %.tmp9258)
store %m2756$.Type.type* %.tmp9259, %m2756$.Type.type** %.tmp9254
%.tmp9260 = load %m2756$.Type.type*, %m2756$.Type.type** %curr_t.9243
%.tmp9261 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9260, i32 0, i32 4
%.tmp9262 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp9261
%.tmp9263 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9262, i32 0, i32 1
%.tmp9264 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9220
%.tmp9265 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9264, i32 0, i32 8
%.tmp9266 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9265
%.tmp9267 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9266, i32 0, i32 1
%.tmp9268 = load i8*, i8** %.tmp9267
store i8* %.tmp9268, i8** %.tmp9263
%.tmp9269 = load %m2756$.Type.type*, %m2756$.Type.type** %curr_t.9243
%.tmp9270 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9269, i32 0, i32 4
%.tmp9271 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp9270
store %m2756$.Type.type* %.tmp9271, %m2756$.Type.type** %curr_t.9243
%.tmp9272 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9220
%.tmp9273 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9272, i32 0, i32 8
%.tmp9274 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9273
%.tmp9276 = getelementptr [5 x i8], [5 x i8]*@.str9275, i32 0, i32 0
%.tmp9277 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp9274, i8* %.tmp9276)
store %m980$.Node.type* %.tmp9277, %m980$.Node.type** %curr_type.9220
br label %.for.start.9244
.for.end.9244:
br label %.if.end.9223
.if.false.9223:
br label %.if.end.9223
.if.end.9223:
br label %.if.end.9207
.if.false.9207:
%.tmp9278 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9279 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9278, i32 0, i32 0
%.tmp9280 = load i8*, i8** %.tmp9279
%.tmp9282 = getelementptr [12 x i8], [12 x i8]*@.str9281, i32 0, i32 0
%.tmp9283 = call i32(i8*,i8*) @strcmp(i8* %.tmp9280, i8* %.tmp9282)
%.tmp9284 = icmp eq i32 %.tmp9283, 0
br i1 %.tmp9284, label %.if.true.9285, label %.if.false.9285
.if.true.9285:
%.tmp9287 = getelementptr [1 x i8], [1 x i8]*@.str9286, i32 0, i32 0
%err_msg.9288 = alloca i8*
store i8* %.tmp9287, i8** %err_msg.9288
%.tmp9289 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp9290 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9291 = call %m2756$.ScopeItem.type*(%m2756$.CompilerCtx.type*,%m980$.Node.type*) @m295$find_defined.m2756$.ScopeItem.typep.m2756$.CompilerCtx.typep.m980$.Node.typep(%m2756$.CompilerCtx.type* %.tmp9289, %m980$.Node.type* %.tmp9290)
%base.9292 = alloca %m2756$.ScopeItem.type*
store %m2756$.ScopeItem.type* %.tmp9291, %m2756$.ScopeItem.type** %base.9292
%.tmp9293 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %base.9292
%.tmp9294 = icmp eq %m2756$.ScopeItem.type* %.tmp9293, null
br i1 %.tmp9294, label %.if.true.9295, label %.if.false.9295
.if.true.9295:
%.tmp9296 = getelementptr i8*, i8** %err_msg.9288, i32 0
%.tmp9298 = getelementptr [37 x i8], [37 x i8]*@.str9297, i32 0, i32 0
%.tmp9299 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9300 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9299, i32 0, i32 7
%.tmp9301 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9300
%.tmp9302 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9301, i32 0, i32 1
%.tmp9303 = load i8*, i8** %.tmp9302
%.tmp9304 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9296, i8* %.tmp9298, i8* %.tmp9303)
%.tmp9305 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp9306 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9307 = load i8*, i8** %err_msg.9288
call void(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp9305, %m980$.Node.type* %.tmp9306, i8* %.tmp9307)
%.tmp9308 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9309 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9308, i32 0, i32 0
%.tmp9311 = getelementptr [6 x i8], [6 x i8]*@.str9310, i32 0, i32 0
store i8* %.tmp9311, i8** %.tmp9309
%.tmp9312 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
ret %m2756$.Type.type* %.tmp9312
br label %.if.end.9295
.if.false.9295:
br label %.if.end.9295
.if.end.9295:
%.tmp9313 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9314 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9313, i32 0, i32 0
%.tmp9316 = getelementptr [10 x i8], [10 x i8]*@.str9315, i32 0, i32 0
store i8* %.tmp9316, i8** %.tmp9314
%.tmp9317 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9318 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9317, i32 0, i32 1
%.tmp9319 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %base.9292
%.tmp9320 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp9319, i32 0, i32 0
%.tmp9321 = load i8*, i8** %.tmp9320
store i8* %.tmp9321, i8** %.tmp9318
%.tmp9322 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9323 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9322, i32 0, i32 2
%.tmp9324 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %base.9292
%.tmp9325 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp9324, i32 0, i32 1
%.tmp9326 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %.tmp9325
%.tmp9327 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp9326, i32 0, i32 0
%.tmp9328 = load i8*, i8** %.tmp9327
store i8* %.tmp9328, i8** %.tmp9323
%.tmp9329 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9330 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9329, i32 0, i32 3
%.tmp9331 = load %m2756$.ScopeItem.type*, %m2756$.ScopeItem.type** %base.9292
%.tmp9332 = getelementptr %m2756$.ScopeItem.type, %m2756$.ScopeItem.type* %.tmp9331, i32 0, i32 1
%.tmp9333 = load %m2756$.AssignableInfo.type*, %m2756$.AssignableInfo.type** %.tmp9332
%.tmp9334 = getelementptr %m2756$.AssignableInfo.type, %m2756$.AssignableInfo.type* %.tmp9333, i32 0, i32 4
%.tmp9335 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp9334
store %m2756$.Type.type* %.tmp9335, %m2756$.Type.type** %.tmp9330
br label %.if.end.9285
.if.false.9285:
%.tmp9336 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9337 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9336, i32 0, i32 1
%.tmp9338 = load i8*, i8** %.tmp9337
%.tmp9340 = getelementptr [4 x i8], [4 x i8]*@.str9339, i32 0, i32 0
%.tmp9341 = call i32(i8*,i8*) @strcmp(i8* %.tmp9338, i8* %.tmp9340)
%.tmp9342 = icmp eq i32 %.tmp9341, 0
br i1 %.tmp9342, label %.if.true.9343, label %.if.false.9343
.if.true.9343:
%.tmp9344 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9345 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9344, i32 0, i32 0
%.tmp9347 = getelementptr [4 x i8], [4 x i8]*@.str9346, i32 0, i32 0
store i8* %.tmp9347, i8** %.tmp9345
%.tmp9348 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9349 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9348, i32 0, i32 3
%.tmp9350 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
store %m2756$.Type.type* %.tmp9350, %m2756$.Type.type** %.tmp9349
%.tmp9351 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9352 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9351, i32 0, i32 3
%.tmp9353 = load %m2756$.Type.type*, %m2756$.Type.type** %.tmp9352
%.tmp9354 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9353, i32 0, i32 0
%.tmp9356 = getelementptr [4 x i8], [4 x i8]*@.str9355, i32 0, i32 0
store i8* %.tmp9356, i8** %.tmp9354
br label %.if.end.9343
.if.false.9343:
%.tmp9357 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9358 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9357, i32 0, i32 0
%.tmp9359 = load i8*, i8** %.tmp9358
%.tmp9361 = getelementptr [5 x i8], [5 x i8]*@.str9360, i32 0, i32 0
%.tmp9362 = call i32(i8*,i8*) @strcmp(i8* %.tmp9359, i8* %.tmp9361)
%.tmp9363 = icmp eq i32 %.tmp9362, 0
br i1 %.tmp9363, label %.if.true.9364, label %.if.false.9364
.if.true.9364:
%.tmp9365 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9366 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9365, i32 0, i32 0
%.tmp9367 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9368 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9367, i32 0, i32 1
%.tmp9369 = load i8*, i8** %.tmp9368
store i8* %.tmp9369, i8** %.tmp9366
br label %.if.end.9364
.if.false.9364:
%.tmp9370 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9371 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9370, i32 0, i32 1
%.tmp9372 = load i8*, i8** %.tmp9371
%.tmp9374 = getelementptr [4 x i8], [4 x i8]*@.str9373, i32 0, i32 0
%.tmp9375 = call i32(i8*,i8*) @strcmp(i8* %.tmp9372, i8* %.tmp9374)
%.tmp9376 = icmp eq i32 %.tmp9375, 0
br i1 %.tmp9376, label %.if.true.9377, label %.if.false.9377
.if.true.9377:
%.tmp9378 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
%.tmp9379 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9378, i32 0, i32 0
%.tmp9381 = getelementptr [7 x i8], [7 x i8]*@.str9380, i32 0, i32 0
store i8* %.tmp9381, i8** %.tmp9379
br label %.if.end.9377
.if.false.9377:
%.tmp9382 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp9383 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9385 = getelementptr [54 x i8], [54 x i8]*@.str9384, i32 0, i32 0
%.tmp9386 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp9382, %m980$.Node.type* %.tmp9383, i8* %.tmp9385)
%.tmp9387 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9388 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9387, i32 0, i32 0
%.tmp9389 = load i8*, i8** %.tmp9388
%.tmp9390 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9391 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9390, i32 0, i32 1
%.tmp9392 = load i8*, i8** %.tmp9391
%.tmp9393 = call i32(i8*,...) @printf(i8* %.tmp9386, i8* %.tmp9389, i8* %.tmp9392)
%.tmp9394 = bitcast ptr null to %m2756$.Type.type*
ret %m2756$.Type.type* %.tmp9394
br label %.if.end.9377
.if.end.9377:
br label %.if.end.9364
.if.end.9364:
br label %.if.end.9343
.if.end.9343:
br label %.if.end.9285
.if.end.9285:
br label %.if.end.9207
.if.end.9207:
%.tmp9396 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9397 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9396, i32 0, i32 8
%.tmp9398 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9397
%ptr.9399 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9398, %m980$.Node.type** %ptr.9399
br label %.for.start.9395
.for.start.9395:
%.tmp9400 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9399
%.tmp9401 = icmp ne %m980$.Node.type* %.tmp9400, null
br i1 %.tmp9401, label %.for.continue.9395, label %.for.end.9395
.for.continue.9395:
%.tmp9402 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9399
%.tmp9403 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9402, i32 0, i32 1
%.tmp9404 = load i8*, i8** %.tmp9403
%.tmp9406 = getelementptr [2 x i8], [2 x i8]*@.str9405, i32 0, i32 0
%.tmp9407 = call i32(i8*,i8*) @strcmp(i8* %.tmp9404, i8* %.tmp9406)
%.tmp9408 = icmp eq i32 %.tmp9407, 0
br i1 %.tmp9408, label %.if.true.9409, label %.if.false.9409
.if.true.9409:
%.tmp9410 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%pt.9411 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9410, %m2756$.Type.type** %pt.9411
%.tmp9412 = load %m2756$.Type.type*, %m2756$.Type.type** %pt.9411
%.tmp9413 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9412, i32 0, i32 0
%.tmp9415 = getelementptr [4 x i8], [4 x i8]*@.str9414, i32 0, i32 0
store i8* %.tmp9415, i8** %.tmp9413
%.tmp9416 = load %m2756$.Type.type*, %m2756$.Type.type** %pt.9411
%.tmp9417 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9416, i32 0, i32 3
%.tmp9418 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
store %m2756$.Type.type* %.tmp9418, %m2756$.Type.type** %.tmp9417
%.tmp9419 = load %m2756$.Type.type*, %m2756$.Type.type** %pt.9411
store %m2756$.Type.type* %.tmp9419, %m2756$.Type.type** %t.9199
br label %.if.end.9409
.if.false.9409:
%.tmp9420 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9399
%.tmp9421 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9420, i32 0, i32 1
%.tmp9422 = load i8*, i8** %.tmp9421
%.tmp9424 = getelementptr [2 x i8], [2 x i8]*@.str9423, i32 0, i32 0
%.tmp9425 = call i32(i8*,i8*) @strcmp(i8* %.tmp9422, i8* %.tmp9424)
%.tmp9426 = icmp eq i32 %.tmp9425, 0
br i1 %.tmp9426, label %.if.true.9427, label %.if.false.9427
.if.true.9427:
%.tmp9428 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9399
%.tmp9429 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9428, i32 0, i32 8
%.tmp9430 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9429
%.tmp9431 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9430, i32 0, i32 1
%.tmp9432 = load i8*, i8** %.tmp9431
%.tmp9434 = getelementptr [2 x i8], [2 x i8]*@.str9433, i32 0, i32 0
%.tmp9435 = call i32(i8*,i8*) @strcmp(i8* %.tmp9432, i8* %.tmp9434)
%.tmp9436 = icmp eq i32 %.tmp9435, 0
br i1 %.tmp9436, label %.if.true.9437, label %.if.false.9437
.if.true.9437:
%.tmp9438 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%slice_type.9439 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9438, %m2756$.Type.type** %slice_type.9439
%.tmp9440 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_type.9439
%.tmp9441 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9440, i32 0, i32 0
%.tmp9443 = getelementptr [7 x i8], [7 x i8]*@.str9442, i32 0, i32 0
store i8* %.tmp9443, i8** %.tmp9441
%.tmp9444 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_type.9439
%.tmp9445 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9444, i32 0, i32 1
%.tmp9447 = getelementptr [6 x i8], [6 x i8]*@.str9446, i32 0, i32 0
store i8* %.tmp9447, i8** %.tmp9445
%.tmp9448 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%slice_c_array.9449 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9448, %m2756$.Type.type** %slice_c_array.9449
%.tmp9450 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_c_array.9449
%.tmp9451 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9450, i32 0, i32 0
%.tmp9453 = getelementptr [4 x i8], [4 x i8]*@.str9452, i32 0, i32 0
store i8* %.tmp9453, i8** %.tmp9451
%.tmp9454 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_c_array.9449
%.tmp9455 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9454, i32 0, i32 1
%.tmp9457 = getelementptr [6 x i8], [6 x i8]*@.str9456, i32 0, i32 0
store i8* %.tmp9457, i8** %.tmp9455
%.tmp9458 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_c_array.9449
%.tmp9459 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9458, i32 0, i32 3
%.tmp9460 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
store %m2756$.Type.type* %.tmp9460, %m2756$.Type.type** %.tmp9459
%.tmp9461 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_type.9439
%.tmp9462 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9461, i32 0, i32 3
%.tmp9463 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_c_array.9449
store %m2756$.Type.type* %.tmp9463, %m2756$.Type.type** %.tmp9462
%.tmp9464 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%slice_len.9465 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9464, %m2756$.Type.type** %slice_len.9465
%.tmp9466 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_len.9465
%.tmp9467 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9466, i32 0, i32 0
%.tmp9469 = getelementptr [4 x i8], [4 x i8]*@.str9468, i32 0, i32 0
store i8* %.tmp9469, i8** %.tmp9467
%.tmp9470 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_len.9465
%.tmp9471 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9470, i32 0, i32 1
%.tmp9473 = getelementptr [4 x i8], [4 x i8]*@.str9472, i32 0, i32 0
store i8* %.tmp9473, i8** %.tmp9471
%.tmp9474 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_c_array.9449
%.tmp9475 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9474, i32 0, i32 4
%.tmp9476 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_len.9465
store %m2756$.Type.type* %.tmp9476, %m2756$.Type.type** %.tmp9475
%.tmp9477 = call %m2756$.Type.type*() @m295$new_type.m2756$.Type.typep()
%slice_cap.9478 = alloca %m2756$.Type.type*
store %m2756$.Type.type* %.tmp9477, %m2756$.Type.type** %slice_cap.9478
%.tmp9479 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_cap.9478
%.tmp9480 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9479, i32 0, i32 0
%.tmp9482 = getelementptr [4 x i8], [4 x i8]*@.str9481, i32 0, i32 0
store i8* %.tmp9482, i8** %.tmp9480
%.tmp9483 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_cap.9478
%.tmp9484 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9483, i32 0, i32 1
%.tmp9486 = getelementptr [4 x i8], [4 x i8]*@.str9485, i32 0, i32 0
store i8* %.tmp9486, i8** %.tmp9484
%.tmp9487 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_len.9465
%.tmp9488 = getelementptr %m2756$.Type.type, %m2756$.Type.type* %.tmp9487, i32 0, i32 4
%.tmp9489 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_cap.9478
store %m2756$.Type.type* %.tmp9489, %m2756$.Type.type** %.tmp9488
%.tmp9490 = load %m2756$.Type.type*, %m2756$.Type.type** %slice_type.9439
store %m2756$.Type.type* %.tmp9490, %m2756$.Type.type** %t.9199
%.tmp9491 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9399
%.tmp9492 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9491, i32 0, i32 8
%.tmp9493 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9492
store %m980$.Node.type* %.tmp9493, %m980$.Node.type** %ptr.9399
br label %.if.end.9437
.if.false.9437:
br label %.if.end.9437
.if.end.9437:
br label %.if.end.9427
.if.false.9427:
%.tmp9494 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %ctx
%.tmp9495 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9399
%.tmp9497 = getelementptr [49 x i8], [49 x i8]*@.str9496, i32 0, i32 0
%.tmp9498 = call i8*(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp9494, %m980$.Node.type* %.tmp9495, i8* %.tmp9497)
%.tmp9499 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9399
%.tmp9500 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9499, i32 0, i32 1
%.tmp9501 = load i8*, i8** %.tmp9500
%.tmp9502 = call i32(i8*,...) @printf(i8* %.tmp9498, i8* %.tmp9501)
%.tmp9503 = bitcast ptr null to %m2756$.Type.type*
ret %m2756$.Type.type* %.tmp9503
br label %.if.end.9427
.if.end.9427:
br label %.if.end.9409
.if.end.9409:
%.tmp9504 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9399
%.tmp9505 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9504, i32 0, i32 8
%.tmp9506 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9505
store %m980$.Node.type* %.tmp9506, %m980$.Node.type** %ptr.9399
br label %.for.start.9395
.for.end.9395:
%.tmp9507 = load %m2756$.Type.type*, %m2756$.Type.type** %t.9199
ret %m2756$.Type.type* %.tmp9507
}
define i1 @compile_file.b.cp.cp(i8* %.filename.arg, i8* %.outname.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%outname = alloca i8*
store i8* %.outname.arg, i8** %outname
%.tmp9508 = load i32, i32* @STDERR
%.tmp9510 = getelementptr [2 x i8], [2 x i8]*@.str9509, i32 0, i32 0
%.tmp9511 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp9508, i8* %.tmp9510)
%stderr.9512 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9511, %m0$.File.type** %stderr.9512
%.tmp9513 = call %m0$.File.type*() @tmpfile()
%llvm_code.9514 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9513, %m0$.File.type** %llvm_code.9514
%.tmp9515 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9514
%.tmp9516 = load i8*, i8** %filename
%.tmp9517 = call %m2756$.CompilerCtx.type*(%m0$.File.type*,i8*) @m295$new_context.m2756$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp9515, i8* %.tmp9516)
%compiler_ctx.9518 = alloca %m2756$.CompilerCtx.type*
store %m2756$.CompilerCtx.type* %.tmp9517, %m2756$.CompilerCtx.type** %compiler_ctx.9518
%.tmp9519 = load %m2756$.CompilerCtx.type*, %m2756$.CompilerCtx.type** %compiler_ctx.9518
%.tmp9520 = bitcast ptr null to %m980$.Node.type*
%.tmp9521 = load i8*, i8** %filename
%.tmp9522 = call i1(%m2756$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$compile_file.b.m2756$.CompilerCtx.typep.m980$.Node.typep.cp(%m2756$.CompilerCtx.type* %.tmp9519, %m980$.Node.type* %.tmp9520, i8* %.tmp9521)
br i1 %.tmp9522, label %.if.true.9523, label %.if.false.9523
.if.true.9523:
%.tmp9524 = load %m0$.File.type*, %m0$.File.type** %stderr.9512
%.tmp9526 = getelementptr [34 x i8], [34 x i8]*@.str9525, i32 0, i32 0
%.tmp9527 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9524, i8* %.tmp9526)
ret i1 0
br label %.if.end.9523
.if.false.9523:
br label %.if.end.9523
.if.end.9523:
%.tmp9528 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9514
%.tmp9529 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp9528)
%.tmp9530 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9514
%.tmp9531 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp9530)
%llvm_code_size.9532 = alloca i32
store i32 %.tmp9531, i32* %llvm_code_size.9532
%.tmp9533 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9514
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp9533)
%.tmp9535 = getelementptr [1 x i8], [1 x i8]*@.str9534, i32 0, i32 0
%cmd.9536 = alloca i8*
store i8* %.tmp9535, i8** %cmd.9536
%.tmp9537 = getelementptr i8*, i8** %cmd.9536, i32 0
%.tmp9539 = getelementptr [32 x i8], [32 x i8]*@.str9538, i32 0, i32 0
%.tmp9540 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9537, i8* %.tmp9539)
%.tmp9541 = load i8*, i8** %cmd.9536
%.tmp9543 = getelementptr [2 x i8], [2 x i8]*@.str9542, i32 0, i32 0
%.tmp9544 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9541, i8* %.tmp9543)
%proc.9545 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9544, %m0$.File.type** %proc.9545
%.tmp9546 = load %m0$.File.type*, %m0$.File.type** %proc.9545
%.tmp9547 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9546)
%.tmp9548 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9514
%.tmp9549 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9548)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp9547, i32 %.tmp9549)
%.tmp9550 = load %m0$.File.type*, %m0$.File.type** %proc.9545
%.tmp9551 = icmp eq %m0$.File.type* %.tmp9550, null
br i1 %.tmp9551, label %.if.true.9552, label %.if.false.9552
.if.true.9552:
%.tmp9553 = load %m0$.File.type*, %m0$.File.type** %stderr.9512
%.tmp9555 = getelementptr [28 x i8], [28 x i8]*@.str9554, i32 0, i32 0
%.tmp9556 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9553, i8* %.tmp9555)
ret i1 0
br label %.if.end.9552
.if.false.9552:
br label %.if.end.9552
.if.end.9552:
%.tmp9557 = load %m0$.File.type*, %m0$.File.type** %proc.9545
%.tmp9558 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9557)
%.tmp9559 = icmp ne i32 %.tmp9558, 0
br i1 %.tmp9559, label %.if.true.9560, label %.if.false.9560
.if.true.9560:
%.tmp9561 = load %m0$.File.type*, %m0$.File.type** %stderr.9512
%.tmp9563 = getelementptr [24 x i8], [24 x i8]*@.str9562, i32 0, i32 0
%.tmp9564 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9561, i8* %.tmp9563)
ret i1 0
br label %.if.end.9560
.if.false.9560:
br label %.if.end.9560
.if.end.9560:
%.tmp9565 = getelementptr i8*, i8** %cmd.9536, i32 0
%.tmp9567 = getelementptr [17 x i8], [17 x i8]*@.str9566, i32 0, i32 0
%.tmp9568 = load i8*, i8** %outname
%.tmp9569 = load i8*, i8** %outname
%.tmp9570 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9565, i8* %.tmp9567, i8* %.tmp9568, i8* %.tmp9569)
%.tmp9571 = load i8*, i8** %cmd.9536
%.tmp9573 = getelementptr [2 x i8], [2 x i8]*@.str9572, i32 0, i32 0
%.tmp9574 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9571, i8* %.tmp9573)
%cc_proc.9575 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9574, %m0$.File.type** %cc_proc.9575
%.tmp9576 = load %m0$.File.type*, %m0$.File.type** %cc_proc.9575
%.tmp9577 = icmp eq %m0$.File.type* %.tmp9576, null
br i1 %.tmp9577, label %.if.true.9578, label %.if.false.9578
.if.true.9578:
%.tmp9579 = load %m0$.File.type*, %m0$.File.type** %stderr.9512
%.tmp9581 = getelementptr [28 x i8], [28 x i8]*@.str9580, i32 0, i32 0
%.tmp9582 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9579, i8* %.tmp9581)
ret i1 0
br label %.if.end.9578
.if.false.9578:
br label %.if.end.9578
.if.end.9578:
%.tmp9583 = load %m0$.File.type*, %m0$.File.type** %proc.9545
%.tmp9584 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9583)
%.tmp9585 = icmp ne i32 %.tmp9584, 0
br i1 %.tmp9585, label %.if.true.9586, label %.if.false.9586
.if.true.9586:
%.tmp9587 = load %m0$.File.type*, %m0$.File.type** %stderr.9512
%.tmp9589 = getelementptr [22 x i8], [22 x i8]*@.str9588, i32 0, i32 0
%.tmp9590 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9587, i8* %.tmp9589)
br label %.if.end.9586
.if.false.9586:
%.tmp9592 = getelementptr [32 x i8], [32 x i8]*@.str9591, i32 0, i32 0
%.tmp9593 = load i8*, i8** %outname
%.tmp9594 = call i32(i8*,...) @printf(i8* %.tmp9592, i8* %.tmp9593)
br label %.if.end.9586
.if.end.9586:
ret i1 1
}
%.Args.type = type {i8*,i8*,i8*,i8**}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9595 = load i32, i32* %argc
%.tmp9596 = load i8**, i8*** %argv
%.tmp9597 = call %.Args.type(i32,i8**) @check_args..Args.type.i.cpp(i32 %.tmp9595, i8** %.tmp9596)
%args.9598 = alloca %.Args.type
store %.Args.type %.tmp9597, %.Args.type* %args.9598
%.tmp9599 = getelementptr %.Args.type, %.Args.type* %args.9598, i32 0, i32 1
%.tmp9600 = load i8*, i8** %.tmp9599
%.tmp9601 = getelementptr %.Args.type, %.Args.type* %args.9598, i32 0, i32 2
%.tmp9602 = load i8*, i8** %.tmp9601
%.tmp9603 = call i1(i8*,i8*) @compile_file.b.cp.cp(i8* %.tmp9600, i8* %.tmp9602)
%.tmp9604 = icmp eq i1 %.tmp9603, 0
br i1 %.tmp9604, label %.if.true.9605, label %.if.false.9605
.if.true.9605:
ret i32 0
br label %.if.end.9605
.if.false.9605:
br label %.if.end.9605
.if.end.9605:
%.tmp9606 = getelementptr %.Args.type, %.Args.type* %args.9598, i32 0, i32 0
%.tmp9607 = load i8*, i8** %.tmp9606
%.tmp9609 = getelementptr [4 x i8], [4 x i8]*@.str9608, i32 0, i32 0
%.tmp9610 = call i32(i8*,i8*) @strcmp(i8* %.tmp9607, i8* %.tmp9609)
%.tmp9611 = icmp eq i32 %.tmp9610, 0
br i1 %.tmp9611, label %.if.true.9612, label %.if.false.9612
.if.true.9612:
%.tmp9614 = getelementptr [1 x i8], [1 x i8]*@.str9613, i32 0, i32 0
%cmd.9615 = alloca i8*
store i8* %.tmp9614, i8** %cmd.9615
%.tmp9616 = getelementptr i8*, i8** %cmd.9615, i32 0
%.tmp9618 = getelementptr [5 x i8], [5 x i8]*@.str9617, i32 0, i32 0
%.tmp9619 = getelementptr %.Args.type, %.Args.type* %args.9598, i32 0, i32 2
%.tmp9620 = load i8*, i8** %.tmp9619
%.tmp9621 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9616, i8* %.tmp9618, i8* %.tmp9620)
%.tmp9622 = load i8*, i8** %cmd.9615
%.tmp9623 = getelementptr %.Args.type, %.Args.type* %args.9598, i32 0, i32 3
%.tmp9624 = load i8**, i8*** %.tmp9623
%.tmp9625 = call i32(i8*,i8**) @execvp(i8* %.tmp9622, i8** %.tmp9624)
ret i32 %.tmp9625
br label %.if.end.9612
.if.false.9612:
br label %.if.end.9612
.if.end.9612:
ret i32 0
}
define %.Args.type @check_args..Args.type.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9627 = getelementptr [22 x i8], [22 x i8]*@.str9626, i32 0, i32 0
%tmpl.9628 = alloca i8*
store i8* %.tmp9627, i8** %tmpl.9628
%args.9629 = alloca %.Args.type
%.tmp9630 = getelementptr %.Args.type, %.Args.type* %args.9629, i32 0, i32 0
store i8* null, i8** %.tmp9630
%.tmp9631 = getelementptr %.Args.type, %.Args.type* %args.9629, i32 0, i32 1
store i8* null, i8** %.tmp9631
%.tmp9632 = getelementptr %.Args.type, %.Args.type* %args.9629, i32 0, i32 2
store i8* null, i8** %.tmp9632
%.tmp9633 = getelementptr %.Args.type, %.Args.type* %args.9629, i32 0, i32 3
store i8** null, i8*** %.tmp9633
%.tmp9634 = load i32, i32* %argc
%.tmp9635 = icmp slt i32 %.tmp9634, 2
br i1 %.tmp9635, label %.if.true.9636, label %.if.false.9636
.if.true.9636:
%.tmp9637 = load i8*, i8** %tmpl.9628
%.tmp9638 = load i8**, i8*** %argv
%.tmp9639 = getelementptr i8*, i8** %.tmp9638, i32 0
%.tmp9640 = load i8*, i8** %.tmp9639
%.tmp9641 = call i32(i8*,...) @printf(i8* %.tmp9637, i8* %.tmp9640)
call void(i32) @exit(i32 1)
br label %.if.end.9636
.if.false.9636:
br label %.if.end.9636
.if.end.9636:
%fp.9642 = alloca i32
store i32 1, i32* %fp.9642
%.tmp9643 = getelementptr %.Args.type, %.Args.type* %args.9629, i32 0, i32 0
%.tmp9645 = getelementptr [8 x i8], [8 x i8]*@.str9644, i32 0, i32 0
store i8* %.tmp9645, i8** %.tmp9643
%.tmp9646 = load i8**, i8*** %argv
%.tmp9647 = getelementptr i8*, i8** %.tmp9646, i32 1
%.tmp9648 = load i8*, i8** %.tmp9647
%.tmp9650 = getelementptr [4 x i8], [4 x i8]*@.str9649, i32 0, i32 0
%.tmp9651 = call i32(i8*,i8*) @strcmp(i8* %.tmp9648, i8* %.tmp9650)
%.tmp9652 = icmp eq i32 %.tmp9651, 0
br i1 %.tmp9652, label %.if.true.9653, label %.if.false.9653
.if.true.9653:
%.tmp9654 = getelementptr %.Args.type, %.Args.type* %args.9629, i32 0, i32 0
%.tmp9656 = getelementptr [4 x i8], [4 x i8]*@.str9655, i32 0, i32 0
store i8* %.tmp9656, i8** %.tmp9654
store i32 2, i32* %fp.9642
br label %.if.end.9653
.if.false.9653:
br label %.if.end.9653
.if.end.9653:
%.tmp9657 = load i32, i32* %argc
%.tmp9658 = load i32, i32* %fp.9642
%.tmp9659 = add i32 %.tmp9658, 1
%.tmp9660 = icmp slt i32 %.tmp9657, %.tmp9659
br i1 %.tmp9660, label %.if.true.9661, label %.if.false.9661
.if.true.9661:
%.tmp9662 = load i8*, i8** %tmpl.9628
%.tmp9663 = load i8**, i8*** %argv
%.tmp9664 = getelementptr i8*, i8** %.tmp9663, i32 0
%.tmp9665 = load i8*, i8** %.tmp9664
%.tmp9666 = call i32(i8*,...) @printf(i8* %.tmp9662, i8* %.tmp9665)
call void(i32) @exit(i32 1)
br label %.if.end.9661
.if.false.9661:
br label %.if.end.9661
.if.end.9661:
%.tmp9667 = getelementptr %.Args.type, %.Args.type* %args.9629, i32 0, i32 1
%.tmp9668 = load i32, i32* %fp.9642
%.tmp9669 = load i8**, i8*** %argv
%.tmp9670 = getelementptr i8*, i8** %.tmp9669, i32 %.tmp9668
%.tmp9671 = load i8*, i8** %.tmp9670
store i8* %.tmp9671, i8** %.tmp9667
%.tmp9672 = getelementptr %.Args.type, %.Args.type* %args.9629, i32 0, i32 1
%.tmp9673 = load i8*, i8** %.tmp9672
%.tmp9674 = call {i8*,i8*}(i8*) @m2$splitext.scpcp.cp(i8* %.tmp9673)
%ext.9675 = alloca {i8*,i8*}
store {i8*,i8*} %.tmp9674, {i8*,i8*}* %ext.9675
%.tmp9676 = getelementptr %.Args.type, %.Args.type* %args.9629, i32 0, i32 2
%.tmp9677 = getelementptr {i8*,i8*}, {i8*,i8*}* %ext.9675, i32 0, i32 0
%.tmp9678 = load i8*, i8** %.tmp9677
store i8* %.tmp9678, i8** %.tmp9676
%.tmp9679 = load i32, i32* %argc
%.tmp9680 = load i32, i32* %fp.9642
%.tmp9681 = sub i32 %.tmp9679, %.tmp9680
%.tmp9682 = add i32 %.tmp9681, 1
%ac.9683 = alloca i32
store i32 %.tmp9682, i32* %ac.9683
%.tmp9684 = getelementptr %.Args.type, %.Args.type* %args.9629, i32 0, i32 3
%.tmp9685 = load i32, i32* %ac.9683
%.tmp9686 = mul i32 8, %.tmp9685
%.tmp9687 = call i8*(i32) @malloc(i32 %.tmp9686)
%.tmp9688 = bitcast i8* %.tmp9687 to i8**
store i8** %.tmp9688, i8*** %.tmp9684
%.tmp9689 = getelementptr %.Args.type, %.Args.type* %args.9629, i32 0, i32 3
%.tmp9690 = load i8**, i8*** %.tmp9689
%.tmp9691 = getelementptr i8*, i8** %.tmp9690, i32 0
%.tmp9692 = getelementptr %.Args.type, %.Args.type* %args.9629, i32 0, i32 2
%.tmp9693 = load i8*, i8** %.tmp9692
store i8* %.tmp9693, i8** %.tmp9691
%i.9695 = alloca i32
store i32 0, i32* %i.9695
br label %.for.start.9694
.for.start.9694:
%.tmp9696 = load i32, i32* %i.9695
%.tmp9697 = load i32, i32* %argc
%.tmp9698 = load i32, i32* %fp.9642
%.tmp9699 = sub i32 %.tmp9697, %.tmp9698
%.tmp9700 = icmp slt i32 %.tmp9696, %.tmp9699
br i1 %.tmp9700, label %.for.continue.9694, label %.for.end.9694
.for.continue.9694:
%.tmp9701 = getelementptr %.Args.type, %.Args.type* %args.9629, i32 0, i32 3
%.tmp9702 = load i32, i32* %i.9695
%.tmp9703 = add i32 %.tmp9702, 1
%.tmp9704 = load i8**, i8*** %.tmp9701
%.tmp9705 = getelementptr i8*, i8** %.tmp9704, i32 %.tmp9703
%.tmp9706 = load i32, i32* %fp.9642
%.tmp9707 = load i32, i32* %i.9695
%.tmp9708 = add i32 %.tmp9706, %.tmp9707
%.tmp9709 = add i32 %.tmp9708, 1
%.tmp9710 = load i8**, i8*** %argv
%.tmp9711 = getelementptr i8*, i8** %.tmp9710, i32 %.tmp9709
%.tmp9712 = load i8*, i8** %.tmp9711
store i8* %.tmp9712, i8** %.tmp9705
%.tmp9713 = load i32, i32* %i.9695
%.tmp9714 = add i32 %.tmp9713, 1
store i32 %.tmp9714, i32* %i.9695
br label %.for.start.9694
.for.end.9694:
%.tmp9715 = load %.Args.type, %.Args.type* %args.9629
ret %.Args.type %.tmp9715
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
@.str854 = constant [2 x i8] c"r\00"
@.str861 = constant [1 x i8] c"\00"
@.str899 = constant [1 x i8] c"\00"
@.str910 = constant [9 x i8] c"%4d | %s\00"
@.str919 = constant [1 x i8] c"\00"
@.str928 = constant [5 x i8] c"%s%s\00"
@.str940 = constant [5 x i8] c"\0A%s\0A\00"
@.str945 = constant [1 x i8] c"\00"
@.str952 = constant [24 x i8] c"[%s %d:%d] error: %s\0A%s\00"
@.str969 = constant [3 x i8] c"%s\00"
@.str975 = constant [3 x i8] c"%s\00"
@.str1011 = constant [1 x i8] c"\00"
@.str1015 = constant [1 x i8] c"\00"
@.str1029 = constant [1 x i8] c"\00"
@.str1037 = constant [1 x i8] c"\00"
@.str1077 = constant [2 x i8] c")\00"
@.str1088 = constant [2 x i8] c"]\00"
@.str1098 = constant [1 x i8] c"\00"
@.str1110 = constant [5 x i8] c"WORD\00"
@.str1119 = constant [2 x i8] c"=\00"
@.str1139 = constant [1 x i8] c"\00"
@.str1146 = constant [2 x i8] c"(\00"
@.str1168 = constant [2 x i8] c")\00"
@.str1176 = constant [19 x i8] c"Bracket not closed\00"
@.str1192 = constant [5 x i8] c"WORD\00"
@.str1201 = constant [7 x i8] c"STRING\00"
@.str1223 = constant [2 x i8] c"|\00"
@.str1249 = constant [2 x i8] c"+\00"
@.str1263 = constant [2 x i8] c"*\00"
@.str1277 = constant [2 x i8] c"?\00"
@.str1306 = constant [7 x i8] c"STRING\00"
@.str1331 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1347 = constant [5 x i8] c"WORD\00"
@.str1352 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1366 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1375 = constant [1 x i8] c"\00"
@.str1383 = constant [2 x i8] c"[\00"
@.str1414 = constant [2 x i8] c":\00"
@.str1425 = constant [1 x i8] c"\00"
@.str1429 = constant [35 x i8] c"expected : after rule name, got %s\00"
@.str1475 = constant [3 x i8] c"NL\00"
@.str1483 = constant [4 x i8] c"EOF\00"
@.str1489 = constant [58 x i8] c"[%d, %d]: rule must terminate with newline, got: '%s' %s\0A\00"
@.str1539 = constant [4 x i8] c"EOF\00"
@.str1548 = constant [3 x i8] c"NL\00"
@.str1818 = constant [1 x i8] c"\00"
@.str1858 = constant [22 x i8] c"Matcher type is null\0A\00"
@.str1871 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1885 = constant [43 x i8] c"Unable to match token by value: %s != \22%s\22\00"
@.str1929 = constant [22 x i8] c"Matcher type is null\0A\00"
@.str1944 = constant [54 x i8] c"Unable to match token by type, expecing \22%s\22 got \22%s\22\00"
@.str1999 = constant [26 x i8] c"Unable to find alias rule\00"
@.str2017 = constant [33 x i8] c"CRITICAL: Parser not implemented\00"
@.str2094 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str2114 = constant [4 x i8] c"EOF\00"
@.str2128 = constant [32 x i8] c"SyntaxError: parsing ended here\00"
@.str2212 = constant [2 x i8] c"\0A\00"
@.str2221 = constant [3 x i8] c"  \00"
@.str2230 = constant [7 x i8] c"(null)\00"
@.str2234 = constant [2 x i8] c"{\00"
@.str2240 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str2249 = constant [12 x i8] c"\22value\22: %s\00"
@.str2258 = constant [11 x i8] c"\22line\22: %d\00"
@.str2267 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str2276 = constant [9 x i8] c"\22next\22: \00"
@.str2288 = constant [13 x i8] c"\22children\22: \00"
@.str2301 = constant [2 x i8] c"}\00"
@.str2305 = constant [1886 x i8] c"
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

fn_args: ( (assignable ( \22,\22 assignable )* ) | ( NL ( assignable \22,\22 NL )* ) )

fn_call: (destination \22(\22) (fn_args)? (\22)\22)

keyword: (\22break\22 | \22continue\22)

expression: ( if_block | return | keyword | for_loop | function | assignment | fn_call | declaration | NL )

expressions: (expression)*

block: \22{\22 NL expressions (\22}\22)

for_loop: \22for\22 (declaration | assignment)? (\22;\22) (assignable)? (\22;\22) (assignment)? block (else_block)?
\00"
@.str2308 = constant [1885 x i8] c"%%%1$s.tmp0 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
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
@.str2314 = constant [1 x i8] c"\00"
@.str2330 = constant [6 x i8] c"%s\5C22\00"
@.str2355 = constant [6 x i8] c"%s\5C0A\00"
@.str2369 = constant [6 x i8] c"%s\5C5C\00"
@.str2385 = constant [8 x i8] c"%s\5C%c%c\00"
@.str2403 = constant [5 x i8] c"%s%c\00"
@.str2412 = constant [5 x i8] c"%s%c\00"
@.str2423 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2460 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2465 = constant [3 x i8] c"%d\00"
@.str2473 = constant [6 x i8] c"'\5C%x'\00"
@.str2478 = constant [3 x i8] c"%d\00"
@.str2486 = constant [6 x i8] c"'\5C%c'\00"
@.str2493 = constant [3 x i8] c"10\00"
@.str2500 = constant [5 x i8] c"'%c'\00"
@.str2505 = constant [3 x i8] c"%d\00"
@.str2554 = constant [16 x i8] c"mono_assignable\00"
@.str2565 = constant [9 x i8] c"operator\00"
@.str2602 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2649 = constant [2 x i8] c"+\00"
@.str2656 = constant [2 x i8] c"-\00"
@.str2665 = constant [2 x i8] c"*\00"
@.str2672 = constant [2 x i8] c"/\00"
@.str2680 = constant [2 x i8] c"%\00"
@.str2689 = constant [3 x i8] c"==\00"
@.str2696 = constant [3 x i8] c"!=\00"
@.str2705 = constant [3 x i8] c">=\00"
@.str2712 = constant [3 x i8] c"<=\00"
@.str2721 = constant [2 x i8] c">\00"
@.str2728 = constant [2 x i8] c"<\00"
@.str2737 = constant [2 x i8] c"&\00"
@.str2745 = constant [2 x i8] c"|\00"
@.str2750 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
@.str2761 = constant [2 x i8] c"?\00"
@.str2767 = constant [54 x i8] c"called 'repr' with malformed type, container is null.\00"
@.str2773 = constant [4 x i8] c"int\00"
@.str2778 = constant [4 x i8] c"i32\00"
@.str2783 = constant [5 x i8] c"void\00"
@.str2788 = constant [5 x i8] c"void\00"
@.str2793 = constant [5 x i8] c"bool\00"
@.str2798 = constant [3 x i8] c"i1\00"
@.str2803 = constant [8 x i8] c"nullptr\00"
@.str2808 = constant [4 x i8] c"ptr\00"
@.str2813 = constant [4 x i8] c"chr\00"
@.str2818 = constant [3 x i8] c"i8\00"
@.str2823 = constant [9 x i8] c"function\00"
@.str2829 = constant [4 x i8] c"%s(\00"
@.str2855 = constant [4 x i8] c"%s,\00"
@.str2860 = constant [5 x i8] c"%s%s\00"
@.str2871 = constant [4 x i8] c"%s)\00"
@.str2879 = constant [4 x i8] c"ptr\00"
@.str2885 = constant [4 x i8] c"%s*\00"
@.str2897 = constant [7 x i8] c"struct\00"
@.str2903 = constant [2 x i8] c"{\00"
@.str2920 = constant [4 x i8] c"%s,\00"
@.str2925 = constant [5 x i8] c"%s%s\00"
@.str2936 = constant [4 x i8] c"%s}\00"
@.str2944 = constant [6 x i8] c"array\00"
@.str2950 = constant [10 x i8] c"[%s x %s]\00"
@.str2969 = constant [10 x i8] c"typealias\00"
@.str2975 = constant [5 x i8] c"%%%s\00"
@.str2985 = constant [7 x i8] c"vararg\00"
@.str2990 = constant [4 x i8] c"...\00"
@.str2995 = constant [6 x i8] c"error\00"
@.str3000 = constant [53 x i8] c":coffee-error: 'repr' not implemented for type '%s'\0A\00"
@.str3016 = constant [8 x i8] c"nullptr\00"
@.str3023 = constant [8 x i8] c"nullptr\00"
@.str3032 = constant [4 x i8] c"ptr\00"
@.str3039 = constant [4 x i8] c"ptr\00"
@.str3047 = constant [10 x i8] c"typealias\00"
@.str3061 = constant [10 x i8] c"typealias\00"
@.str3120 = constant [12 x i8] c"COFFEE_ROOT\00"
@.str3127 = constant [5 x i8] c"HOME\00"
@.str3132 = constant [11 x i8] c"%s/.coffee\00"
@.str3220 = constant [1 x i8] c"\00"
@.str3264 = constant [1 x i8] c"\00"
@.str3268 = constant [5 x i8] c"%c%s\00"
@.str3278 = constant [1 x i8] c"\00"
@.str3282 = constant [7 x i8] c".tmp%d\00"
@.str3368 = constant [39 x i8] c"Grammar error unable to create context\00"
@.str3390 = constant [1 x i8] c"\00"
@.str3435 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str3451 = constant [1 x i8] c"\00"
@.str3455 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str3474 = constant [6 x i8] c"start\00"
@.str3560 = constant [6 x i8] c"start\00"
@.str3567 = constant [29 x i8] c"Expecting 'start' expression\00"
@.str3570 = constant [7 x i8] c"global\00"
@.str3582 = constant [13 x i8] c"head_comment\00"
@.str3626 = constant [1 x i8] c"\00"
@.str3650 = constant [7 x i8] c"string\00"
@.str3658 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3678 = constant [7 x i8] c"extern\00"
@.str3692 = constant [15 x i8] c"declare %s %s(\00"
@.str3728 = constant [3 x i8] c", \00"
@.str3734 = constant [3 x i8] c"%s\00"
@.str3746 = constant [3 x i8] c")\0A\00"
@.str3755 = constant [1 x i8] c"\00"
@.str3765 = constant [5 x i8] c"%s%s\00"
@.str3773 = constant [9 x i8] c"function\00"
@.str3779 = constant [5 x i8] c"main\00"
@.str3784 = constant [1 x i8] c"\00"
@.str3787 = constant [1 x i8] c"\00"
@.str3798 = constant [6 x i8] c"%s.%s\00"
@.str3814 = constant [1 x i8] c"\00"
@.str3817 = constant [1 x i8] c"\00"
@.str3823 = constant [3 x i8] c"NL\00"
@.str3831 = constant [7 x i8] c"global\00"
@.str3839 = constant [11 x i8] c"assignable\00"
@.str3870 = constant [9 x i8] c"variable\00"
@.str3882 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3897 = constant [10 x i8] c"typealias\00"
@.str3919 = constant [11 x i8] c"%s.%s.type\00"
@.str3931 = constant [10 x i8] c"typealias\00"
@.str3953 = constant [5 x i8] c"type\00"
@.str3983 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3996 = constant [7 x i8] c"extern\00"
@.str4014 = constant [7 x i8] c"extern\00"
@.str4055 = constant [7 x i8] c"extern\00"
@.str4067 = constant [9 x i8] c"function\00"
@.str4076 = constant [9 x i8] c"function\00"
@.str4115 = constant [14 x i8] c"define %s %s(\00"
@.str4144 = constant [3 x i8] c", \00"
@.str4150 = constant [5 x i8] c"type\00"
@.str4166 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str4181 = constant [5 x i8] c") {\0A\00"
@.str4185 = constant [9 x i8] c"function\00"
@.str4195 = constant [6 x i8] c"block\00"
@.str4210 = constant [3 x i8] c"}\0A\00"
@.str4216 = constant [7 x i8] c"import\00"
@.str4272 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str4333 = constant [5 x i8] c"m%d$\00"
@.str4384 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str4391 = constant [1 x i8] c"\00"
@.str4395 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str4427 = constant [9 x i8] c"variable\00"
@.str4432 = constant [5 x i8] c"type\00"
@.str4464 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4477 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str4489 = constant [6 x i8] c"block\00"
@.str4497 = constant [12 x i8] c"expressions\00"
@.str4528 = constant [7 x i8] c"struct\00"
@.str4533 = constant [7 x i8] c"WhAT!\0A\00"
@.str4573 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4585 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4611 = constant [7 x i8] c"struct\00"
@.str4616 = constant [7 x i8] c"WhAT!\0A\00"
@.str4647 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4659 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4684 = constant [7 x i8] c"sizeof\00"
@.str4690 = constant [8 x i8] c"fn_args\00"
@.str4697 = constant [11 x i8] c"assignable\00"
@.str4725 = constant [4 x i8] c"int\00"
@.str4738 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4747 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4758 = constant [7 x i8] c"append\00"
@.str4764 = constant [8 x i8] c"fn_args\00"
@.str4771 = constant [11 x i8] c"assignable\00"
@.str4778 = constant [11 x i8] c"assignable\00"
@.str4800 = constant [1 x i8] c"\00"
@.str4804 = constant [5 x i8] c".b%d\00"
@.str4838 = constant [8 x i8] c"realloc\00"
@.str4847 = constant [9 x i8] c"function\00"
@.str4860 = constant [4 x i8] c"ptr\00"
@.str4877 = constant [4 x i8] c"chr\00"
@.str4894 = constant [4 x i8] c"ptr\00"
@.str4915 = constant [4 x i8] c"chr\00"
@.str4936 = constant [4 x i8] c"int\00"
@.str4939 = constant [8 x i8] c"realloc\00"
@.str4941 = constant [7 x i8] c"extern\00"
@.str4948 = constant [4 x i8] c"len\00"
@.str4954 = constant [8 x i8] c"fn_args\00"
@.str4961 = constant [11 x i8] c"assignable\00"
@.str4969 = constant [1 x i8] c"\00"
@.str4985 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str5006 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str5012 = constant [1 x i8] c"\00"
@.str5018 = constant [6 x i8] c"%s.bn\00"
@.str5023 = constant [9 x i8] c"%s/%s.bn\00"
@.str5047 = constant [35 x i8] c"unable to compile function address\00"
@.str5053 = constant [8 x i8] c"fn_args\00"
@.str5057 = constant [1 x i8] c"\00"
@.str5060 = constant [1 x i8] c"\00"
@.str5068 = constant [4 x i8] c"ptr\00"
@.str5088 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str5112 = constant [11 x i8] c"assignable\00"
@.str5136 = constant [11 x i8] c"assignable\00"
@.str5148 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str5166 = constant [5 x i8] c"%s, \00"
@.str5191 = constant [7 x i8] c"vararg\00"
@.str5204 = constant [1 x i8] c"\00"
@.str5208 = constant [58 x i8] c"types.Type for argument %d does not match: '%s', got '%s'\00"
@.str5225 = constant [8 x i8] c"%s%s %s\00"
@.str5242 = constant [7 x i8] c"vararg\00"
@.str5253 = constant [11 x i8] c"assignable\00"
@.str5262 = constant [7 x i8] c"vararg\00"
@.str5268 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str5304 = constant [7 x i8] c"vararg\00"
@.str5315 = constant [42 x i8] c"Function '%s' takes %d arguments, 0 given\00"
@.str5333 = constant [5 x i8] c"void\00"
@.str5341 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str5373 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str5388 = constant [1 x i8] c"\00"
@.str5401 = constant [7 x i8] c"return\00"
@.str5407 = constant [9 x i8] c"function\00"
@.str5416 = constant [40 x i8] c"'return' used outside of function scope\00"
@.str5425 = constant [3 x i8] c"NL\00"
@.str5450 = constant [1 x i8] c"\00"
@.str5454 = constant [67 x i8] c"trying to return '%s' from function declared with return type '%s'\00"
@.str5473 = constant [11 x i8] c"ret %s %s\0A\00"
@.str5486 = constant [10 x i8] c"ret void\0A\00"
@.str5490 = constant [3 x i8] c"NL\00"
@.str5496 = constant [8 x i8] c"fn_call\00"
@.str5507 = constant [12 x i8] c"declaration\00"
@.str5516 = constant [11 x i8] c"assignment\00"
@.str5524 = constant [11 x i8] c"assignable\00"
@.str5552 = constant [1 x i8] c"\00"
@.str5556 = constant [37 x i8] c"cannot assign type '%s' to type '%s'\00"
@.str5585 = constant [4 x i8] c"ptr\00"
@.str5594 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5604 = constant [9 x i8] c"if_block\00"
@.str5612 = constant [9 x i8] c"for_loop\00"
@.str5620 = constant [8 x i8] c"keyword\00"
@.str5626 = constant [4 x i8] c"for\00"
@.str5633 = constant [1 x i8] c"\00"
@.str5637 = constant [42 x i8] c"'%s' keyword used outside 'for' statement\00"
@.str5653 = constant [6 x i8] c"break\00"
@.str5661 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5672 = constant [9 x i8] c"continue\00"
@.str5680 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5687 = constant [9 x i8] c"function\00"
@.str5696 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str5727 = constant [4 x i8] c"ptr\00"
@.str5736 = constant [4 x i8] c"chr\00"
@.str5747 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5756 = constant [9 x i8] c"function\00"
@.str5769 = constant [5 x i8] c"void\00"
@.str5799 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5801 = constant [7 x i8] c"extern\00"
@.str5809 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5818 = constant [9 x i8] c"function\00"
@.str5833 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5835 = constant [7 x i8] c"extern\00"
@.str5843 = constant [5 x i8] c"mmap\00"
@.str5852 = constant [9 x i8] c"function\00"
@.str5878 = constant [4 x i8] c"int\00"
@.str5890 = constant [4 x i8] c"int\00"
@.str5902 = constant [4 x i8] c"int\00"
@.str5914 = constant [4 x i8] c"int\00"
@.str5926 = constant [4 x i8] c"int\00"
@.str5932 = constant [5 x i8] c"mmap\00"
@.str5934 = constant [7 x i8] c"extern\00"
@.str5940 = constant [5 x i8] c"WORD\00"
@.str5963 = constant [9 x i8] c"function\00"
@.str5987 = constant [4 x i8] c"ptr\00"
@.str5996 = constant [7 x i8] c"struct\00"
@.str6010 = constant [1 x i8] c"\00"
@.str6014 = constant [5 x i8] c"@.%d\00"
@.str6028 = constant [101 x i8] c"%%.tmem%d = call i8*(i8*,i32,i32,i32,i32,i32) @mmap(i8* null, i32 72, i32 7, i32 34, i32 -1, i32 0)\0A\00"
@.str6035 = constant [100 x i8] c"call void(i8*,i8*,i8*) @llvm.init.trampoline(i8* %%.tmem%d, i8* bitcast (%s* %s to i8*), i8* null)\0A\00"
@.str6046 = constant [66 x i8] c"%%.trmp%d = call i8*(i8*) @llvm.adjust.trampoline(i8* %%.tmem%d)\0A\00"
@.str6054 = constant [35 x i8] c"%s = bitcast i8* %%.trmp%d to %s*\0A\00"
@.str6075 = constant [14 x i8] c"define %s %s(\00"
@.str6083 = constant [9 x i8] c"function\00"
@.str6091 = constant [13 x i8] c"%s nest %%.0\00"
@.str6118 = constant [3 x i8] c", \00"
@.str6124 = constant [5 x i8] c"type\00"
@.str6140 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str6155 = constant [5 x i8] c") {\0A\00"
@.str6163 = constant [6 x i8] c"block\00"
@.str6176 = constant [3 x i8] c"}\0A\00"
@.str6202 = constant [12 x i8] c"expressions\00"
@.str6218 = constant [3 x i8] c"NL\00"
@.str6235 = constant [7 x i8] c"return\00"
@.str6243 = constant [5 x i8] c"void\00"
@.str6254 = constant [21 x i8] c"Missing return value\00"
@.str6259 = constant [10 x i8] c"ret void\0A\00"
@.str6276 = constant [14 x i8] c".for.start.%d\00"
@.str6281 = constant [12 x i8] c".for.end.%d\00"
@.str6286 = constant [4 x i8] c"for\00"
@.str6294 = constant [12 x i8] c"declaration\00"
@.str6305 = constant [11 x i8] c"assignment\00"
@.str6315 = constant [9 x i8] c"OPERATOR\00"
@.str6322 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str6333 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str6340 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str6347 = constant [9 x i8] c"OPERATOR\00"
@.str6358 = constant [9 x i8] c"OPERATOR\00"
@.str6365 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str6377 = constant [9 x i8] c"OPERATOR\00"
@.str6382 = constant [6 x i8] c"block\00"
@.str6387 = constant [11 x i8] c"else_block\00"
@.str6397 = constant [13 x i8] c".for.else.%d\00"
@.str6404 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str6419 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str6438 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6448 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str6455 = constant [6 x i8] c"block\00"
@.str6464 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6471 = constant [5 x i8] c"%s:\0A\00"
@.str6485 = constant [5 x i8] c"type\00"
@.str6500 = constant [11 x i8] c"assignable\00"
@.str6515 = constant [9 x i8] c"variable\00"
@.str6520 = constant [5 x i8] c"WORD\00"
@.str6529 = constant [31 x i8] c"unable to get declaration name\00"
@.str6547 = constant [1 x i8] c"\00"
@.str6551 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6561 = constant [1 x i8] c"\00"
@.str6565 = constant [6 x i8] c"%s.%d\00"
@.str6615 = constant [1 x i8] c"\00"
@.str6619 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str6636 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str6648 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6689 = constant [4 x i8] c"int\00"
@.str6696 = constant [4 x i8] c"chr\00"
@.str6704 = constant [5 x i8] c"bool\00"
@.str6713 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str6722 = constant [4 x i8] c"ptr\00"
@.str6730 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6733 = constant [5 x i8] c"null\00"
@.str6741 = constant [7 x i8] c"struct\00"
@.str6762 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6782 = constant [10 x i8] c"typealias\00"
@.str6805 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6825 = constant [6 x i8] c"error\00"
@.str6832 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str6849 = constant [11 x i8] c"assignable\00"
@.str6866 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str6881 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str6888 = constant [6 x i8] c"block\00"
@.str6897 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6904 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str6911 = constant [11 x i8] c"elif_block\00"
@.str6923 = constant [11 x i8] c"else_block\00"
@.str6933 = constant [6 x i8] c"block\00"
@.str6943 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6950 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str6971 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str6980 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str7014 = constant [1 x i8] c"\00"
@.str7025 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str7045 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str7079 = constant [7 x i8] c"module\00"
@.str7132 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str7162 = constant [1 x i8] c"\00"
@.str7165 = constant [1 x i8] c"\00"
@.str7173 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str7181 = constant [9 x i8] c"function\00"
@.str7188 = constant [7 x i8] c"extern\00"
@.str7200 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str7221 = constant [9 x i8] c"variable\00"
@.str7243 = constant [4 x i8] c"ptr\00"
@.str7262 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str7286 = constant [10 x i8] c"typealias\00"
@.str7297 = constant [7 x i8] c"struct\00"
@.str7303 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str7355 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str7376 = constant [9 x i8] c"variable\00"
@.str7387 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str7408 = constant [9 x i8] c"variable\00"
@.str7416 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str7424 = constant [1 x i8] c"\00"
@.str7432 = constant [17 x i8] c"addr_destination\00"
@.str7439 = constant [16 x i8] c"mono_assignable\00"
@.str7447 = constant [11 x i8] c"assignable\00"
@.str7461 = constant [12 x i8] c"destination\00"
@.str7466 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str7494 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str7513 = constant [7 x i8] c"module\00"
@.str7535 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str7606 = constant [6 x i8] c"slice\00"
@.str7619 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str7661 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str7682 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str7706 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str7729 = constant [16 x i8] c"mono_assignable\00"
@.str7755 = constant [5 x i8] c"cast\00"
@.str7765 = constant [5 x i8] c"type\00"
@.str7790 = constant [8 x i8] c"bitcast\00"
@.str7805 = constant [6 x i8] c"slice\00"
@.str7810 = constant [48 x i8] c"Casting array to slices is not implemented yet\0A\00"
@.str7818 = constant [4 x i8] c"ptr\00"
@.str7825 = constant [4 x i8] c"ptr\00"
@.str7844 = constant [4 x i8] c"i%d\00"
@.str7849 = constant [4 x i8] c"i%d\00"
@.str7857 = constant [5 x i8] c"sext\00"
@.str7859 = constant [6 x i8] c"trunc\00"
@.str7864 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str7884 = constant [16 x i8] c"mono_assignable\00"
@.str7946 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str7969 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str7976 = constant [2 x i8] c"+\00"
@.str7981 = constant [4 x i8] c"add\00"
@.str7986 = constant [2 x i8] c"-\00"
@.str7991 = constant [4 x i8] c"sub\00"
@.str7996 = constant [2 x i8] c"*\00"
@.str8001 = constant [4 x i8] c"mul\00"
@.str8006 = constant [2 x i8] c"/\00"
@.str8011 = constant [5 x i8] c"sdiv\00"
@.str8016 = constant [3 x i8] c"==\00"
@.str8021 = constant [8 x i8] c"icmp eq\00"
@.str8026 = constant [3 x i8] c"!=\00"
@.str8031 = constant [8 x i8] c"icmp ne\00"
@.str8036 = constant [2 x i8] c">\00"
@.str8041 = constant [9 x i8] c"icmp sgt\00"
@.str8046 = constant [2 x i8] c"<\00"
@.str8051 = constant [9 x i8] c"icmp slt\00"
@.str8056 = constant [2 x i8] c"&\00"
@.str8061 = constant [4 x i8] c"and\00"
@.str8066 = constant [2 x i8] c"|\00"
@.str8071 = constant [3 x i8] c"or\00"
@.str8076 = constant [3 x i8] c">=\00"
@.str8081 = constant [9 x i8] c"icmp sge\00"
@.str8086 = constant [3 x i8] c"<=\00"
@.str8091 = constant [9 x i8] c"icmp sle\00"
@.str8096 = constant [2 x i8] c"%\00"
@.str8101 = constant [5 x i8] c"srem\00"
@.str8105 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str8112 = constant [4 x i8] c"add\00"
@.str8119 = constant [3 x i8] c"==\00"
@.str8126 = constant [3 x i8] c"!=\00"
@.str8134 = constant [2 x i8] c"|\00"
@.str8142 = constant [2 x i8] c"&\00"
@.str8150 = constant [2 x i8] c">\00"
@.str8158 = constant [2 x i8] c"<\00"
@.str8166 = constant [3 x i8] c">=\00"
@.str8174 = constant [3 x i8] c"<=\00"
@.str8182 = constant [5 x i8] c"bool\00"
@.str8186 = constant [4 x i8] c"int\00"
@.str8193 = constant [1 x i8] c"\00"
@.str8196 = constant [1 x i8] c"\00"
@.str8204 = constant [7 x i8] c"NUMBER\00"
@.str8218 = constant [4 x i8] c"int\00"
@.str8232 = constant [5 x i8] c"WORD\00"
@.str8242 = constant [5 x i8] c"null\00"
@.str8249 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str8263 = constant [5 x i8] c"null\00"
@.str8272 = constant [8 x i8] c"nullptr\00"
@.str8279 = constant [17 x i8] c"addr_destination\00"
@.str8291 = constant [12 x i8] c"destination\00"
@.str8341 = constant [4 x i8] c"ptr\00"
@.str8360 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str8374 = constant [9 x i8] c"function\00"
@.str8389 = constant [4 x i8] c"ptr\00"
@.str8397 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str8411 = constant [8 x i8] c"boolean\00"
@.str8425 = constant [5 x i8] c"bool\00"
@.str8434 = constant [6 x i8] c"false\00"
@.str8441 = constant [2 x i8] c"0\00"
@.str8445 = constant [2 x i8] c"1\00"
@.str8452 = constant [8 x i8] c"fn_call\00"
@.str8469 = constant [7 x i8] c"STRING\00"
@.str8495 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str8511 = constant [4 x i8] c"ptr\00"
@.str8524 = constant [4 x i8] c"chr\00"
@.str8531 = constant [4 x i8] c"CHR\00"
@.str8547 = constant [2 x i8] c"0\00"
@.str8563 = constant [22 x i8] c"Invalid character: %s\00"
@.str8579 = constant [4 x i8] c"chr\00"
@.str8583 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str8611 = constant [22 x i8] c"called 'abbr' on null\00"
@.str8617 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str8622 = constant [4 x i8] c"int\00"
@.str8627 = constant [2 x i8] c"i\00"
@.str8632 = constant [5 x i8] c"bool\00"
@.str8637 = constant [2 x i8] c"b\00"
@.str8642 = constant [5 x i8] c"void\00"
@.str8647 = constant [2 x i8] c"v\00"
@.str8652 = constant [4 x i8] c"chr\00"
@.str8657 = constant [2 x i8] c"c\00"
@.str8662 = constant [4 x i8] c"ptr\00"
@.str8667 = constant [1 x i8] c"\00"
@.str8671 = constant [4 x i8] c"%sp\00"
@.str8682 = constant [10 x i8] c"typealias\00"
@.str8693 = constant [7 x i8] c"struct\00"
@.str8698 = constant [2 x i8] c"s\00"
@.str8709 = constant [5 x i8] c"%s%s\00"
@.str8722 = constant [9 x i8] c"function\00"
@.str8727 = constant [2 x i8] c"f\00"
@.str8732 = constant [6 x i8] c"error\00"
@.str8737 = constant [2 x i8] c"?\00"
@.str8739 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str8749 = constant [1 x i8] c"\00"
@.str8753 = constant [7 x i8] c".str%d\00"
@.str8768 = constant [6 x i8] c"array\00"
@.str8781 = constant [4 x i8] c"chr\00"
@.str8802 = constant [3 x i8] c"%d\00"
@.str8809 = constant [7 x i8] c"string\00"
@.str8845 = constant [7 x i8] c"module\00"
@.str8896 = constant [4 x i8] c"%s\0A\00"
@.str9015 = constant [9 x i8] c"function\00"
@.str9033 = constant [5 x i8] c"WORD\00"
@.str9090 = constant [10 x i8] c"fn_params\00"
@.str9104 = constant [11 x i8] c"basic_type\00"
@.str9125 = constant [13 x i8] c"type_trailer\00"
@.str9134 = constant [9 x i8] c"function\00"
@.str9150 = constant [15 x i8] c"type_fn_params\00"
@.str9191 = constant [4 x i8] c"ptr\00"
@.str9203 = constant [10 x i8] c"structdef\00"
@.str9210 = constant [7 x i8] c"struct\00"
@.str9217 = constant [5 x i8] c"type\00"
@.str9248 = constant [5 x i8] c"type\00"
@.str9275 = constant [5 x i8] c"type\00"
@.str9281 = constant [12 x i8] c"dotted_name\00"
@.str9286 = constant [1 x i8] c"\00"
@.str9297 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str9310 = constant [6 x i8] c"error\00"
@.str9315 = constant [10 x i8] c"typealias\00"
@.str9339 = constant [4 x i8] c"str\00"
@.str9346 = constant [4 x i8] c"ptr\00"
@.str9355 = constant [4 x i8] c"chr\00"
@.str9360 = constant [5 x i8] c"WORD\00"
@.str9373 = constant [4 x i8] c"...\00"
@.str9380 = constant [7 x i8] c"vararg\00"
@.str9384 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str9405 = constant [2 x i8] c"*\00"
@.str9414 = constant [4 x i8] c"ptr\00"
@.str9423 = constant [2 x i8] c"[\00"
@.str9433 = constant [2 x i8] c"]\00"
@.str9442 = constant [7 x i8] c"struct\00"
@.str9446 = constant [6 x i8] c"slice\00"
@.str9452 = constant [4 x i8] c"ptr\00"
@.str9456 = constant [6 x i8] c"c_arr\00"
@.str9468 = constant [4 x i8] c"int\00"
@.str9472 = constant [4 x i8] c"len\00"
@.str9481 = constant [4 x i8] c"int\00"
@.str9485 = constant [4 x i8] c"cap\00"
@.str9496 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str9509 = constant [2 x i8] c"w\00"
@.str9525 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str9534 = constant [1 x i8] c"\00"
@.str9538 = constant [32 x i8] c"tee debug.ll | llc - -o debug.s\00"
@.str9542 = constant [2 x i8] c"w\00"
@.str9554 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9562 = constant [24 x i8] c"error on llc execution\0A\00"
@.str9566 = constant [17 x i8] c"cc debug.s -o %s\00"
@.str9572 = constant [2 x i8] c"w\00"
@.str9580 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9588 = constant [22 x i8] c"error on cc execution\00"
@.str9591 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str9608 = constant [4 x i8] c"run\00"
@.str9613 = constant [1 x i8] c"\00"
@.str9617 = constant [5 x i8] c"./%s\00"
@.str9626 = constant [22 x i8] c"Usage: %s <filename>\0A\00"
@.str9644 = constant [8 x i8] c"compile\00"
@.str9649 = constant [4 x i8] c"run\00"
@.str9655 = constant [4 x i8] c"run\00"
