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
br label %.for.start.1098
.for.start.1098:
%.tmp1099 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1100 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1099, i32 0, i32 0
%.tmp1101 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1100
%.tmp1102 = icmp ne %m297$.Token.type* %.tmp1101, null
br i1 %.tmp1102, label %.for.continue.1098, label %.for.end.1098
.for.continue.1098:
%.tmp1103 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1104 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1103, i32 0, i32 0
%.tmp1105 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1104
%.tmp1106 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1105, i32 0, i32 1
%.tmp1107 = load i8*, i8** %.tmp1106
%.tmp1109 = getelementptr [2 x i8], [2 x i8]*@.str1108, i32 0, i32 0
%.tmp1110 = call i32(i8*,i8*) @strcmp(i8* %.tmp1107, i8* %.tmp1109)
%.tmp1111 = icmp eq i32 %.tmp1110, 0
br i1 %.tmp1111, label %.if.true.1112, label %.if.false.1112
.if.true.1112:
%.tmp1113 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1114 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1113, i32 0, i32 0
%.tmp1115 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1114
%b_tok.1116 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1115, %m297$.Token.type** %b_tok.1116
%.tmp1117 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1118 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1117, i32 0, i32 0
%.tmp1119 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1120 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1119, i32 0, i32 0
%.tmp1121 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1120
%.tmp1122 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1121, i32 0, i32 5
%.tmp1123 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1122
store %m297$.Token.type* %.tmp1123, %m297$.Token.type** %.tmp1118
%.tmp1124 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1125 = call %m980$.Matcher.type*(%m980$.ParsingContext.type*) @m980$parse_matcher.m980$.Matcher.typep.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.tmp1124)
store %m980$.Matcher.type* %.tmp1125, %m980$.Matcher.type** %tmp_submatch.1097
%.tmp1126 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1127 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1126, i32 0, i32 0
%.tmp1128 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1127
%.tmp1129 = call i8*(%m297$.Token.type*) @m980$value.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1128)
%.tmp1131 = getelementptr [2 x i8], [2 x i8]*@.str1130, i32 0, i32 0
%.tmp1132 = call i32(i8*,i8*) @strcmp(i8* %.tmp1129, i8* %.tmp1131)
%.tmp1133 = icmp ne i32 %.tmp1132, 0
br i1 %.tmp1133, label %.if.true.1134, label %.if.false.1134
.if.true.1134:
%.tmp1135 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1136 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1135, i32 0, i32 1
%.tmp1137 = load %m297$.Token.type*, %m297$.Token.type** %b_tok.1116
%.tmp1139 = getelementptr [19 x i8], [19 x i8]*@.str1138, i32 0, i32 0
%.tmp1140 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1137, i8* %.tmp1139)
store %m296$.Error.type* %.tmp1140, %m296$.Error.type** %.tmp1136
%.tmp1141 = bitcast ptr null to %m980$.Matcher.type*
ret %m980$.Matcher.type* %.tmp1141
br label %.if.end.1134
.if.false.1134:
br label %.if.end.1134
.if.end.1134:
%.tmp1142 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1143 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1142, i32 0, i32 0
%.tmp1144 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1145 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1144, i32 0, i32 0
%.tmp1146 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1145
%.tmp1147 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1146, i32 0, i32 5
%.tmp1148 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1147
store %m297$.Token.type* %.tmp1148, %m297$.Token.type** %.tmp1143
br label %.if.end.1112
.if.false.1112:
%.tmp1149 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1150 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1149, i32 0, i32 0
%.tmp1151 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1150
%.tmp1152 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1151, i32 0, i32 0
%.tmp1153 = load i8*, i8** %.tmp1152
%.tmp1155 = getelementptr [5 x i8], [5 x i8]*@.str1154, i32 0, i32 0
%.tmp1156 = call i32(i8*,i8*) @strcmp(i8* %.tmp1153, i8* %.tmp1155)
%.tmp1157 = icmp eq i32 %.tmp1156, 0
%.tmp1158 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1159 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1158, i32 0, i32 0
%.tmp1160 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1159
%.tmp1161 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1160, i32 0, i32 0
%.tmp1162 = load i8*, i8** %.tmp1161
%.tmp1164 = getelementptr [7 x i8], [7 x i8]*@.str1163, i32 0, i32 0
%.tmp1165 = call i32(i8*,i8*) @strcmp(i8* %.tmp1162, i8* %.tmp1164)
%.tmp1166 = icmp eq i32 %.tmp1165, 0
%.tmp1167 = or i1 %.tmp1157, %.tmp1166
br i1 %.tmp1167, label %.if.true.1168, label %.if.false.1168
.if.true.1168:
%.tmp1169 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1170 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1171 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1170, i32 0, i32 0
%.tmp1172 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1171
%.tmp1173 = call %m980$.Matcher.type*(%m980$.ParsingContext.type*,%m297$.Token.type*) @m980$parse_single_token.m980$.Matcher.typep.m980$.ParsingContext.typep.m297$.Token.typep(%m980$.ParsingContext.type* %.tmp1169, %m297$.Token.type* %.tmp1172)
store %m980$.Matcher.type* %.tmp1173, %m980$.Matcher.type** %tmp_submatch.1097
%.tmp1174 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1175 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1174, i32 0, i32 0
%.tmp1176 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1177 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1176, i32 0, i32 0
%.tmp1178 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1177
%.tmp1179 = call %m297$.Token.type*(%m297$.Token.type*) @m980$next.m297$.Token.typep.m297$.Token.typep(%m297$.Token.type* %.tmp1178)
store %m297$.Token.type* %.tmp1179, %m297$.Token.type** %.tmp1175
br label %.if.end.1168
.if.false.1168:
%.tmp1180 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1181 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1180, i32 0, i32 0
%.tmp1182 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1181
%.tmp1183 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1182, i32 0, i32 1
%.tmp1184 = load i8*, i8** %.tmp1183
%.tmp1186 = getelementptr [2 x i8], [2 x i8]*@.str1185, i32 0, i32 0
%.tmp1187 = call i32(i8*,i8*) @strcmp(i8* %.tmp1184, i8* %.tmp1186)
%.tmp1188 = icmp eq i32 %.tmp1187, 0
br i1 %.tmp1188, label %.if.true.1189, label %.if.false.1189
.if.true.1189:
%.tmp1190 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1191 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1190, i32 0, i32 0
%.tmp1192 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1193 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1192, i32 0, i32 0
%.tmp1194 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1193
%.tmp1195 = call %m297$.Token.type*(%m297$.Token.type*) @m980$next.m297$.Token.typep.m297$.Token.typep(%m297$.Token.type* %.tmp1194)
store %m297$.Token.type* %.tmp1195, %m297$.Token.type** %.tmp1191
%.tmp1196 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1095
%.tmp1197 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1196, i32 0, i32 4
%.tmp1198 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1197
%.tmp1199 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1198, i32 0, i32 2
%.tmp1200 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1201 = call %m980$.Matcher.type*(%m980$.ParsingContext.type*) @m980$parse_matcher.m980$.Matcher.typep.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.tmp1200)
store %m980$.Matcher.type* %.tmp1201, %m980$.Matcher.type** %.tmp1199
br label %.for.end.1098
br label %.if.end.1189
.if.false.1189:
br label %.for.end.1098
br label %.if.end.1189
.if.end.1189:
br label %.if.end.1168
.if.end.1168:
br label %.if.end.1112
.if.end.1112:
%.tmp1202 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1203 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1202, i32 0, i32 0
%.tmp1204 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1203
%.tmp1205 = call i8*(%m297$.Token.type*) @m980$value.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1204)
%nv.1206 = alloca i8*
store i8* %.tmp1205, i8** %nv.1206
%.tmp1207 = load i8*, i8** %nv.1206
%.tmp1209 = getelementptr [2 x i8], [2 x i8]*@.str1208, i32 0, i32 0
%.tmp1210 = call i32(i8*,i8*) @strcmp(i8* %.tmp1207, i8* %.tmp1209)
%.tmp1211 = icmp eq i32 %.tmp1210, 0
br i1 %.tmp1211, label %.if.true.1212, label %.if.false.1212
.if.true.1212:
%.tmp1213 = load %m980$.Matcher.type*, %m980$.Matcher.type** %tmp_submatch.1097
%.tmp1214 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1213, i32 0, i32 0
store i8 43, i8* %.tmp1214
%.tmp1215 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1216 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1215, i32 0, i32 0
%.tmp1217 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1218 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1217, i32 0, i32 0
%.tmp1219 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1218
%.tmp1220 = call %m297$.Token.type*(%m297$.Token.type*) @m980$next.m297$.Token.typep.m297$.Token.typep(%m297$.Token.type* %.tmp1219)
store %m297$.Token.type* %.tmp1220, %m297$.Token.type** %.tmp1216
br label %.if.end.1212
.if.false.1212:
%.tmp1221 = load i8*, i8** %nv.1206
%.tmp1223 = getelementptr [2 x i8], [2 x i8]*@.str1222, i32 0, i32 0
%.tmp1224 = call i32(i8*,i8*) @strcmp(i8* %.tmp1221, i8* %.tmp1223)
%.tmp1225 = icmp eq i32 %.tmp1224, 0
br i1 %.tmp1225, label %.if.true.1226, label %.if.false.1226
.if.true.1226:
%.tmp1227 = load %m980$.Matcher.type*, %m980$.Matcher.type** %tmp_submatch.1097
%.tmp1228 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1227, i32 0, i32 0
store i8 42, i8* %.tmp1228
%.tmp1229 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1230 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1229, i32 0, i32 0
%.tmp1231 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1232 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1231, i32 0, i32 0
%.tmp1233 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1232
%.tmp1234 = call %m297$.Token.type*(%m297$.Token.type*) @m980$next.m297$.Token.typep.m297$.Token.typep(%m297$.Token.type* %.tmp1233)
store %m297$.Token.type* %.tmp1234, %m297$.Token.type** %.tmp1230
br label %.if.end.1226
.if.false.1226:
%.tmp1235 = load i8*, i8** %nv.1206
%.tmp1237 = getelementptr [2 x i8], [2 x i8]*@.str1236, i32 0, i32 0
%.tmp1238 = call i32(i8*,i8*) @strcmp(i8* %.tmp1235, i8* %.tmp1237)
%.tmp1239 = icmp eq i32 %.tmp1238, 0
br i1 %.tmp1239, label %.if.true.1240, label %.if.false.1240
.if.true.1240:
%.tmp1241 = load %m980$.Matcher.type*, %m980$.Matcher.type** %tmp_submatch.1097
%.tmp1242 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1241, i32 0, i32 0
store i8 63, i8* %.tmp1242
%.tmp1243 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1244 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1243, i32 0, i32 0
%.tmp1245 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1246 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1245, i32 0, i32 0
%.tmp1247 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1246
%.tmp1248 = call %m297$.Token.type*(%m297$.Token.type*) @m980$next.m297$.Token.typep.m297$.Token.typep(%m297$.Token.type* %.tmp1247)
store %m297$.Token.type* %.tmp1248, %m297$.Token.type** %.tmp1244
br label %.if.end.1240
.if.false.1240:
br label %.if.end.1240
.if.end.1240:
br label %.if.end.1226
.if.end.1226:
br label %.if.end.1212
.if.end.1212:
%.tmp1249 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1095
%.tmp1250 = load %m980$.Matcher.type*, %m980$.Matcher.type** %tmp_submatch.1097
call void(%m980$.Matcher.type*,%m980$.Matcher.type*) @m980$append_submatch.v.m980$.Matcher.typep.m980$.Matcher.typep(%m980$.Matcher.type* %.tmp1249, %m980$.Matcher.type* %.tmp1250)
br label %.for.start.1098
.for.end.1098:
%.tmp1251 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1095
ret %m980$.Matcher.type* %.tmp1251
}
define %m980$.Matcher.type* @m980$parse_single_token.m980$.Matcher.typep.m980$.ParsingContext.typep.m297$.Token.typep(%m980$.ParsingContext.type* %.ctx.arg, %m297$.Token.type* %.t.arg) {
%ctx = alloca %m980$.ParsingContext.type*
store %m980$.ParsingContext.type* %.ctx.arg, %m980$.ParsingContext.type** %ctx
%t = alloca %m297$.Token.type*
store %m297$.Token.type* %.t.arg, %m297$.Token.type** %t
%.tmp1252 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1253 = icmp eq %m297$.Token.type* %.tmp1252, null
br i1 %.tmp1253, label %.if.true.1254, label %.if.false.1254
.if.true.1254:
%.tmp1255 = bitcast ptr null to %m980$.Matcher.type*
ret %m980$.Matcher.type* %.tmp1255
br label %.if.end.1254
.if.false.1254:
br label %.if.end.1254
.if.end.1254:
%.tmp1256 = call %m980$.Matcher.type*() @m980$new_matcher.m980$.Matcher.typep()
%m.1257 = alloca %m980$.Matcher.type*
store %m980$.Matcher.type* %.tmp1256, %m980$.Matcher.type** %m.1257
%.tmp1258 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1257
%.tmp1259 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1258, i32 0, i32 6
%.tmp1260 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1261 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1260, i32 0, i32 1
%.tmp1262 = load i8*, i8** %.tmp1261
store i8* %.tmp1262, i8** %.tmp1259
%.tmp1263 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1264 = call i8*(%m297$.Token.type*) @m980$type.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1263)
%.tmp1266 = getelementptr [7 x i8], [7 x i8]*@.str1265, i32 0, i32 0
%.tmp1267 = call i32(i8*,i8*) @strcmp(i8* %.tmp1264, i8* %.tmp1266)
%.tmp1268 = icmp eq i32 %.tmp1267, 0
br i1 %.tmp1268, label %.if.true.1269, label %.if.false.1269
.if.true.1269:
%.tmp1270 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1257
%.tmp1271 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1270, i32 0, i32 5
%.tmp1272 = load i8, i8* @TYPE_VALUE
store i8 %.tmp1272, i8* %.tmp1271
br label %.if.end.1269
.if.false.1269:
%.tmp1273 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1274 = call i8*(%m297$.Token.type*) @m980$value.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1273)
%.tmp1275 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1274)
br i1 %.tmp1275, label %.if.true.1276, label %.if.false.1276
.if.true.1276:
%.tmp1277 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1257
%.tmp1278 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1277, i32 0, i32 5
%.tmp1279 = load i8, i8* @TYPE_ALIAS
store i8 %.tmp1279, i8* %.tmp1278
br label %.if.end.1276
.if.false.1276:
%.tmp1280 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1281 = call i8*(%m297$.Token.type*) @m980$value.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1280)
%.tmp1282 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1281)
br i1 %.tmp1282, label %.if.true.1283, label %.if.false.1283
.if.true.1283:
%.tmp1284 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1257
%.tmp1285 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1284, i32 0, i32 5
%.tmp1286 = load i8, i8* @TYPE_TYPE
store i8 %.tmp1286, i8* %.tmp1285
br label %.if.end.1283
.if.false.1283:
%.tmp1287 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1288 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1287, i32 0, i32 1
%.tmp1289 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1291 = getelementptr [50 x i8], [50 x i8]*@.str1290, i32 0, i32 0
%.tmp1292 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1289, i8* %.tmp1291)
store %m296$.Error.type* %.tmp1292, %m296$.Error.type** %.tmp1288
%.tmp1293 = bitcast ptr null to %m980$.Matcher.type*
ret %m980$.Matcher.type* %.tmp1293
br label %.if.end.1283
.if.end.1283:
br label %.if.end.1276
.if.end.1276:
br label %.if.end.1269
.if.end.1269:
%.tmp1294 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1257
ret %m980$.Matcher.type* %.tmp1294
}
define %m980$.Rule.type* @m980$parse_rule.m980$.Rule.typep.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m980$.ParsingContext.type*
store %m980$.ParsingContext.type* %.ctx.arg, %m980$.ParsingContext.type** %ctx
%.tmp1295 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1296 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1295, i32 0, i32 0
%.tmp1297 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1296
%.tmp1298 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1297, i32 0, i32 1
%.tmp1299 = load i8*, i8** %.tmp1298
%rule_name.1300 = alloca i8*
store i8* %.tmp1299, i8** %rule_name.1300
%.tmp1301 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1302 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1301, i32 0, i32 0
%.tmp1303 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1302
%.tmp1304 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1303, i32 0, i32 0
%.tmp1305 = load i8*, i8** %.tmp1304
%.tmp1307 = getelementptr [5 x i8], [5 x i8]*@.str1306, i32 0, i32 0
%.tmp1308 = call i32(i8*,i8*) @strcmp(i8* %.tmp1305, i8* %.tmp1307)
%.tmp1309 = icmp ne i32 %.tmp1308, 0
br i1 %.tmp1309, label %.if.true.1310, label %.if.false.1310
.if.true.1310:
%.tmp1312 = getelementptr [37 x i8], [37 x i8]*@.str1311, i32 0, i32 0
%.tmp1313 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1314 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1313, i32 0, i32 0
%.tmp1315 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1314
%.tmp1316 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1315, i32 0, i32 0
%.tmp1317 = load i8*, i8** %.tmp1316
%.tmp1318 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1319 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1318, i32 0, i32 0
%.tmp1320 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1319
%.tmp1321 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1320, i32 0, i32 1
%.tmp1322 = load i8*, i8** %.tmp1321
%.tmp1323 = call i32(i8*,...) @printf(i8* %.tmp1312, i8* %.tmp1317, i8* %.tmp1322)
%.tmp1324 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1326 = getelementptr [31 x i8], [31 x i8]*@.str1325, i32 0, i32 0
call void(%m980$.ParsingContext.type*,i8*) @m980$parser_error.v.m980$.ParsingContext.typep.cp(%m980$.ParsingContext.type* %.tmp1324, i8* %.tmp1326)
br label %.if.end.1310
.if.false.1310:
br label %.if.end.1310
.if.end.1310:
%.tmp1327 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1328 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1327, i32 0, i32 0
%.tmp1329 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1330 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1329, i32 0, i32 0
%.tmp1331 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1330
%.tmp1332 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1331, i32 0, i32 5
%.tmp1333 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1332
store %m297$.Token.type* %.tmp1333, %m297$.Token.type** %.tmp1328
%.tmp1335 = getelementptr [1 x i8], [1 x i8]*@.str1334, i32 0, i32 0
%transformer_name.1336 = alloca i8*
store i8* %.tmp1335, i8** %transformer_name.1336
%.tmp1337 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1338 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1337, i32 0, i32 0
%.tmp1339 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1338
%.tmp1340 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1339, i32 0, i32 1
%.tmp1341 = load i8*, i8** %.tmp1340
%.tmp1343 = getelementptr [2 x i8], [2 x i8]*@.str1342, i32 0, i32 0
%.tmp1344 = call i32(i8*,i8*) @strcmp(i8* %.tmp1341, i8* %.tmp1343)
%.tmp1345 = icmp eq i32 %.tmp1344, 0
br i1 %.tmp1345, label %.if.true.1346, label %.if.false.1346
.if.true.1346:
%.tmp1347 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1348 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1347, i32 0, i32 0
%.tmp1349 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1350 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1349, i32 0, i32 0
%.tmp1351 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1350
%.tmp1352 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1351, i32 0, i32 5
%.tmp1353 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1352
store %m297$.Token.type* %.tmp1353, %m297$.Token.type** %.tmp1348
%.tmp1354 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1355 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1354, i32 0, i32 0
%.tmp1356 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1355
%.tmp1357 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1356, i32 0, i32 1
%.tmp1358 = load i8*, i8** %.tmp1357
store i8* %.tmp1358, i8** %transformer_name.1336
%.tmp1359 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1360 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1359, i32 0, i32 0
%.tmp1361 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1362 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1361, i32 0, i32 0
%.tmp1363 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1362
%.tmp1364 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1363, i32 0, i32 5
%.tmp1365 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1364
%.tmp1366 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1365, i32 0, i32 5
%.tmp1367 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1366
store %m297$.Token.type* %.tmp1367, %m297$.Token.type** %.tmp1360
br label %.if.end.1346
.if.false.1346:
br label %.if.end.1346
.if.end.1346:
%.tmp1368 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1369 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1368, i32 0, i32 0
%.tmp1370 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1369
%.tmp1371 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1370, i32 0, i32 1
%.tmp1372 = load i8*, i8** %.tmp1371
%.tmp1374 = getelementptr [2 x i8], [2 x i8]*@.str1373, i32 0, i32 0
%.tmp1375 = call i32(i8*,i8*) @strcmp(i8* %.tmp1372, i8* %.tmp1374)
%.tmp1376 = icmp ne i32 %.tmp1375, 0
br i1 %.tmp1376, label %.if.true.1377, label %.if.false.1377
.if.true.1377:
%.tmp1378 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1379 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1378, i32 0, i32 0
%.tmp1380 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1379
%.tmp1381 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1380, i32 0, i32 1
%.tmp1382 = load i8*, i8** %.tmp1381
%.tmp1383 = call i32(i8*,...) @printf(i8* %.tmp1382)
%.tmp1385 = getelementptr [1 x i8], [1 x i8]*@.str1384, i32 0, i32 0
%err.1386 = alloca i8*
store i8* %.tmp1385, i8** %err.1386
%.tmp1387 = getelementptr i8*, i8** %err.1386, i32 0
%.tmp1389 = getelementptr [35 x i8], [35 x i8]*@.str1388, i32 0, i32 0
%.tmp1390 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1391 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1390, i32 0, i32 0
%.tmp1392 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1391
%.tmp1393 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1392, i32 0, i32 1
%.tmp1394 = load i8*, i8** %.tmp1393
%.tmp1395 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1387, i8* %.tmp1389, i8* %.tmp1394)
%.tmp1396 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1397 = load i8*, i8** %err.1386
call void(%m980$.ParsingContext.type*,i8*) @m980$parser_error.v.m980$.ParsingContext.typep.cp(%m980$.ParsingContext.type* %.tmp1396, i8* %.tmp1397)
br label %.if.end.1377
.if.false.1377:
br label %.if.end.1377
.if.end.1377:
%.tmp1398 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1399 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1398, i32 0, i32 0
%.tmp1400 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1401 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1400, i32 0, i32 0
%.tmp1402 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1401
%.tmp1403 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1402, i32 0, i32 5
%.tmp1404 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1403
store %m297$.Token.type* %.tmp1404, %m297$.Token.type** %.tmp1399
%.tmp1405 = getelementptr %m980$.Rule.type, %m980$.Rule.type* null, i32 1
%.tmp1406 = ptrtoint %m980$.Rule.type* %.tmp1405 to i32
%.tmp1407 = call i8*(i32) @malloc(i32 %.tmp1406)
%.tmp1408 = bitcast i8* %.tmp1407 to %m980$.Rule.type*
%rule.1409 = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.tmp1408, %m980$.Rule.type** %rule.1409
%.tmp1410 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1409
%.tmp1411 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1410, i32 0, i32 0
%.tmp1412 = load i8*, i8** %rule_name.1300
store i8* %.tmp1412, i8** %.tmp1411
%.tmp1413 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1409
%.tmp1414 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1413, i32 0, i32 1
%.tmp1415 = load i8*, i8** %transformer_name.1336
store i8* %.tmp1415, i8** %.tmp1414
%.tmp1416 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1409
%.tmp1417 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1416, i32 0, i32 2
%.tmp1418 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1419 = call %m980$.Matcher.type*(%m980$.ParsingContext.type*) @m980$parse_matcher.m980$.Matcher.typep.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.tmp1418)
store %m980$.Matcher.type* %.tmp1419, %m980$.Matcher.type** %.tmp1417
%.tmp1420 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1421 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1420, i32 0, i32 0
%.tmp1422 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1423 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1422, i32 0, i32 0
%.tmp1424 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1423
store %m297$.Token.type* %.tmp1424, %m297$.Token.type** %.tmp1421
%.tmp1425 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1426 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1425, i32 0, i32 0
%.tmp1427 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1426
%.tmp1428 = icmp ne %m297$.Token.type* %.tmp1427, null
br i1 %.tmp1428, label %.if.true.1429, label %.if.false.1429
.if.true.1429:
%.tmp1430 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1431 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1430, i32 0, i32 0
%.tmp1432 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1431
%.tmp1433 = call i8*(%m297$.Token.type*) @m980$type.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1432)
%.tmp1435 = getelementptr [3 x i8], [3 x i8]*@.str1434, i32 0, i32 0
%.tmp1436 = call i32(i8*,i8*) @strcmp(i8* %.tmp1433, i8* %.tmp1435)
%.tmp1437 = icmp ne i32 %.tmp1436, 0
%.tmp1438 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1439 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1438, i32 0, i32 0
%.tmp1440 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1439
%.tmp1441 = call i8*(%m297$.Token.type*) @m980$type.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1440)
%.tmp1443 = getelementptr [4 x i8], [4 x i8]*@.str1442, i32 0, i32 0
%.tmp1444 = call i32(i8*,i8*) @strcmp(i8* %.tmp1441, i8* %.tmp1443)
%.tmp1445 = icmp ne i32 %.tmp1444, 0
%.tmp1446 = and i1 %.tmp1437, %.tmp1445
br i1 %.tmp1446, label %.if.true.1447, label %.if.false.1447
.if.true.1447:
%.tmp1449 = getelementptr [58 x i8], [58 x i8]*@.str1448, i32 0, i32 0
%.tmp1450 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1451 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1450, i32 0, i32 0
%.tmp1452 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1451
%.tmp1453 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1452, i32 0, i32 2
%.tmp1454 = load i32, i32* %.tmp1453
%.tmp1455 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1456 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1455, i32 0, i32 0
%.tmp1457 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1456
%.tmp1458 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1457, i32 0, i32 3
%.tmp1459 = load i32, i32* %.tmp1458
%.tmp1460 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1461 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1460, i32 0, i32 0
%.tmp1462 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1461
%.tmp1463 = call i8*(%m297$.Token.type*) @m980$type.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1462)
%.tmp1464 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1465 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1464, i32 0, i32 0
%.tmp1466 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1465
%.tmp1467 = call i8*(%m297$.Token.type*) @m980$value.cp.m297$.Token.typep(%m297$.Token.type* %.tmp1466)
%.tmp1468 = call i32(i8*,...) @printf(i8* %.tmp1449, i32 %.tmp1454, i32 %.tmp1459, i8* %.tmp1463, i8* %.tmp1467)
%.tmp1469 = bitcast ptr null to %m980$.Rule.type*
ret %m980$.Rule.type* %.tmp1469
br label %.if.end.1447
.if.false.1447:
br label %.if.end.1447
.if.end.1447:
br label %.if.end.1429
.if.false.1429:
br label %.if.end.1429
.if.end.1429:
%.tmp1470 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1409
%.tmp1471 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1470, i32 0, i32 2
%.tmp1472 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1471
%.tmp1473 = icmp eq %m980$.Matcher.type* %.tmp1472, null
br i1 %.tmp1473, label %.if.true.1474, label %.if.false.1474
.if.true.1474:
%.tmp1475 = bitcast ptr null to %m980$.Rule.type*
ret %m980$.Rule.type* %.tmp1475
br label %.if.end.1474
.if.false.1474:
br label %.if.end.1474
.if.end.1474:
%.tmp1476 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1409
ret %m980$.Rule.type* %.tmp1476
}
define void @m980$parser_error.v.m980$.ParsingContext.typep.cp(%m980$.ParsingContext.type* %.ctx.arg, i8* %.error.arg) {
%ctx = alloca %m980$.ParsingContext.type*
store %m980$.ParsingContext.type* %.ctx.arg, %m980$.ParsingContext.type** %ctx
%error = alloca i8*
store i8* %.error.arg, i8** %error
%.tmp1477 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1478 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1477, i32 0, i32 0
%.tmp1479 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1478
%.tmp1480 = load i8*, i8** %error
%.tmp1481 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1479, i8* %.tmp1480)
%e.1482 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1481, %m296$.Error.type** %e.1482
%.tmp1483 = load %m296$.Error.type*, %m296$.Error.type** %e.1482
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp1483)
call void(i32) @exit(i32 1)
ret void
}
define %m980$.Rule.type** @m980$parse_grammar.m980$.Rule.typepp.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m980$.ParsingContext.type*
store %m980$.ParsingContext.type* %.ctx.arg, %m980$.ParsingContext.type** %ctx
%max_rules.1484 = alloca i32
store i32 40, i32* %max_rules.1484
%.tmp1485 = load i32, i32* @ptr_size
%.tmp1486 = load i32, i32* %max_rules.1484
%.tmp1487 = mul i32 %.tmp1485, %.tmp1486
%.tmp1488 = call i8*(i32) @malloc(i32 %.tmp1487)
%.tmp1489 = bitcast i8* %.tmp1488 to %m980$.Rule.type**
%grammar.1490 = alloca %m980$.Rule.type**
store %m980$.Rule.type** %.tmp1489, %m980$.Rule.type*** %grammar.1490
%i.1492 = alloca i32
store i32 0, i32* %i.1492
br label %.for.start.1491
.for.start.1491:
%.tmp1493 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1494 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1493, i32 0, i32 0
%.tmp1495 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1494
%.tmp1496 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1495, i32 0, i32 0
%.tmp1497 = load i8*, i8** %.tmp1496
%.tmp1499 = getelementptr [4 x i8], [4 x i8]*@.str1498, i32 0, i32 0
%.tmp1500 = call i32(i8*,i8*) @strcmp(i8* %.tmp1497, i8* %.tmp1499)
%.tmp1501 = icmp ne i32 %.tmp1500, 0
br i1 %.tmp1501, label %.for.continue.1491, label %.for.end.1491
.for.continue.1491:
%.tmp1502 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1503 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1502, i32 0, i32 0
%.tmp1504 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1503
%.tmp1505 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1504, i32 0, i32 0
%.tmp1506 = load i8*, i8** %.tmp1505
%.tmp1508 = getelementptr [3 x i8], [3 x i8]*@.str1507, i32 0, i32 0
%.tmp1509 = call i32(i8*,i8*) @strcmp(i8* %.tmp1506, i8* %.tmp1508)
%.tmp1510 = icmp ne i32 %.tmp1509, 0
br i1 %.tmp1510, label %.if.true.1511, label %.if.false.1511
.if.true.1511:
%.tmp1512 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1513 = call %m980$.Rule.type*(%m980$.ParsingContext.type*) @m980$parse_rule.m980$.Rule.typep.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.tmp1512)
%rule.1514 = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.tmp1513, %m980$.Rule.type** %rule.1514
%.tmp1515 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1514
%.tmp1516 = icmp eq %m980$.Rule.type* %.tmp1515, null
br i1 %.tmp1516, label %.if.true.1517, label %.if.false.1517
.if.true.1517:
%.tmp1518 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1519 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1518, i32 0, i32 1
%.tmp1520 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1519
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp1520)
%.tmp1521 = bitcast ptr null to %m980$.Rule.type**
ret %m980$.Rule.type** %.tmp1521
br label %.if.end.1517
.if.false.1517:
br label %.if.end.1517
.if.end.1517:
%.tmp1522 = load i32, i32* %i.1492
%.tmp1523 = load %m980$.Rule.type**, %m980$.Rule.type*** %grammar.1490
%.tmp1524 = getelementptr %m980$.Rule.type*, %m980$.Rule.type** %.tmp1523, i32 %.tmp1522
%.tmp1525 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1514
store %m980$.Rule.type* %.tmp1525, %m980$.Rule.type** %.tmp1524
%.tmp1526 = load i32, i32* %i.1492
%.tmp1527 = add i32 %.tmp1526, 1
store i32 %.tmp1527, i32* %i.1492
br label %.if.end.1511
.if.false.1511:
%.tmp1528 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1529 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1528, i32 0, i32 0
%.tmp1530 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %ctx
%.tmp1531 = getelementptr %m980$.ParsingContext.type, %m980$.ParsingContext.type* %.tmp1530, i32 0, i32 0
%.tmp1532 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1531
%.tmp1533 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1532, i32 0, i32 5
%.tmp1534 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1533
store %m297$.Token.type* %.tmp1534, %m297$.Token.type** %.tmp1529
br label %.if.end.1511
.if.end.1511:
br label %.for.start.1491
.for.end.1491:
%.tmp1535 = load %m980$.Rule.type**, %m980$.Rule.type*** %grammar.1490
%.tmp1536 = bitcast %m980$.Rule.type** %.tmp1535 to %m980$.Rule.type**
ret %m980$.Rule.type** %.tmp1536
}
%m980$.Node.type = type {i8*,i8*,i8*,i32,i32,%m980$.Node.type*,%m980$.Node.type*,%m980$.Node.type*}
define %m980$.Node.type* @m980$new_node.m980$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg) {
%t = alloca %m297$.Token.type*
store %m297$.Token.type* %.t.arg, %m297$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp1537 = getelementptr %m980$.Node.type, %m980$.Node.type* null, i32 1
%.tmp1538 = ptrtoint %m980$.Node.type* %.tmp1537 to i32
%.tmp1539 = call i8*(i32) @malloc(i32 %.tmp1538)
%.tmp1540 = bitcast i8* %.tmp1539 to %m980$.Node.type*
%node.1541 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp1540, %m980$.Node.type** %node.1541
%.tmp1542 = load %m980$.Node.type*, %m980$.Node.type** %node.1541
%.tmp1543 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1542, i32 0, i32 0
%.tmp1544 = load i8*, i8** %type
store i8* %.tmp1544, i8** %.tmp1543
%.tmp1545 = load %m980$.Node.type*, %m980$.Node.type** %node.1541
%.tmp1546 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1545, i32 0, i32 1
%.tmp1547 = load i8*, i8** %value
store i8* %.tmp1547, i8** %.tmp1546
%.tmp1548 = load %m980$.Node.type*, %m980$.Node.type** %node.1541
%.tmp1549 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1548, i32 0, i32 3
%.tmp1550 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1551 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1550, i32 0, i32 2
%.tmp1552 = load i32, i32* %.tmp1551
store i32 %.tmp1552, i32* %.tmp1549
%.tmp1553 = load %m980$.Node.type*, %m980$.Node.type** %node.1541
%.tmp1554 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1553, i32 0, i32 2
%.tmp1555 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1556 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1555, i32 0, i32 4
%.tmp1557 = load i8*, i8** %.tmp1556
store i8* %.tmp1557, i8** %.tmp1554
%.tmp1558 = load %m980$.Node.type*, %m980$.Node.type** %node.1541
%.tmp1559 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1558, i32 0, i32 4
%.tmp1560 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1561 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1560, i32 0, i32 3
%.tmp1562 = load i32, i32* %.tmp1561
store i32 %.tmp1562, i32* %.tmp1559
%.tmp1563 = load %m980$.Node.type*, %m980$.Node.type** %node.1541
%.tmp1564 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1563, i32 0, i32 5
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1564
%.tmp1565 = load %m980$.Node.type*, %m980$.Node.type** %node.1541
%.tmp1566 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1565, i32 0, i32 7
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1566
%.tmp1567 = load %m980$.Node.type*, %m980$.Node.type** %node.1541
%.tmp1568 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1567, i32 0, i32 6
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1568
%.tmp1569 = load %m980$.Node.type*, %m980$.Node.type** %node.1541
ret %m980$.Node.type* %.tmp1569
}
define void @m980$child_append.v.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.parent.arg, %m980$.Node.type* %.child.arg) {
%parent = alloca %m980$.Node.type*
store %m980$.Node.type* %.parent.arg, %m980$.Node.type** %parent
%child = alloca %m980$.Node.type*
store %m980$.Node.type* %.child.arg, %m980$.Node.type** %child
%.tmp1570 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1571 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1570, i32 0, i32 6
%.tmp1572 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1571
%.tmp1573 = icmp eq %m980$.Node.type* %.tmp1572, null
br i1 %.tmp1573, label %.if.true.1574, label %.if.false.1574
.if.true.1574:
%.tmp1575 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1576 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1575, i32 0, i32 6
%.tmp1577 = load %m980$.Node.type*, %m980$.Node.type** %child
store %m980$.Node.type* %.tmp1577, %m980$.Node.type** %.tmp1576
br label %.if.end.1574
.if.false.1574:
%.tmp1578 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1579 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1578, i32 0, i32 6
%.tmp1580 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1579
%c.1581 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp1580, %m980$.Node.type** %c.1581
br label %.for.start.1582
.for.start.1582:
%.tmp1583 = load %m980$.Node.type*, %m980$.Node.type** %c.1581
%.tmp1584 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1583, i32 0, i32 7
%.tmp1585 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1584
%.tmp1586 = icmp ne %m980$.Node.type* %.tmp1585, null
br i1 %.tmp1586, label %.for.continue.1582, label %.for.end.1582
.for.continue.1582:
%.tmp1587 = load %m980$.Node.type*, %m980$.Node.type** %c.1581
%.tmp1588 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1587, i32 0, i32 7
%.tmp1589 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1588
store %m980$.Node.type* %.tmp1589, %m980$.Node.type** %c.1581
br label %.for.start.1582
.for.end.1582:
%.tmp1590 = load %m980$.Node.type*, %m980$.Node.type** %c.1581
%.tmp1591 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1590, i32 0, i32 7
%.tmp1592 = load %m980$.Node.type*, %m980$.Node.type** %child
store %m980$.Node.type* %.tmp1592, %m980$.Node.type** %.tmp1591
br label %.if.end.1574
.if.end.1574:
%.tmp1593 = load %m980$.Node.type*, %m980$.Node.type** %child
%.tmp1594 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1593, i32 0, i32 7
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1594
ret void
}
define void @m980$child_pop.v.m980$.Node.typep(%m980$.Node.type* %.parent.arg) {
%parent = alloca %m980$.Node.type*
store %m980$.Node.type* %.parent.arg, %m980$.Node.type** %parent
%.tmp1595 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1596 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1595, i32 0, i32 6
%.tmp1597 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1596
%.tmp1598 = icmp eq %m980$.Node.type* %.tmp1597, null
br i1 %.tmp1598, label %.if.true.1599, label %.if.false.1599
.if.true.1599:
ret void
br label %.if.end.1599
.if.false.1599:
br label %.if.end.1599
.if.end.1599:
%.tmp1600 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1601 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1600, i32 0, i32 6
%.tmp1602 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1601
%c.1603 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp1602, %m980$.Node.type** %c.1603
%.tmp1604 = load %m980$.Node.type*, %m980$.Node.type** %c.1603
%.tmp1605 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1604, i32 0, i32 7
%.tmp1606 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1605
%.tmp1607 = icmp eq %m980$.Node.type* %.tmp1606, null
br i1 %.tmp1607, label %.if.true.1608, label %.if.false.1608
.if.true.1608:
%.tmp1609 = load %m980$.Node.type*, %m980$.Node.type** %c.1603
%.tmp1610 = bitcast %m980$.Node.type* %.tmp1609 to i8*
call void(i8*) @free(i8* %.tmp1610)
%.tmp1611 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1612 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1611, i32 0, i32 6
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1612
ret void
br label %.if.end.1608
.if.false.1608:
br label %.if.end.1608
.if.end.1608:
br label %.for.start.1613
.for.start.1613:
%.tmp1614 = load %m980$.Node.type*, %m980$.Node.type** %c.1603
%.tmp1615 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1614, i32 0, i32 7
%.tmp1616 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1615
%.tmp1617 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1616, i32 0, i32 7
%.tmp1618 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1617
%.tmp1619 = icmp ne %m980$.Node.type* %.tmp1618, null
br i1 %.tmp1619, label %.for.continue.1613, label %.for.end.1613
.for.continue.1613:
%.tmp1620 = load %m980$.Node.type*, %m980$.Node.type** %c.1603
%.tmp1621 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1620, i32 0, i32 7
%.tmp1622 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1621
store %m980$.Node.type* %.tmp1622, %m980$.Node.type** %c.1603
br label %.for.start.1613
.for.end.1613:
%.tmp1623 = load %m980$.Node.type*, %m980$.Node.type** %c.1603
%.tmp1624 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1623, i32 0, i32 7
%.tmp1625 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1624
%.tmp1626 = bitcast %m980$.Node.type* %.tmp1625 to i8*
call void(i8*) @free(i8* %.tmp1626)
%.tmp1627 = load %m980$.Node.type*, %m980$.Node.type** %c.1603
%.tmp1628 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1627, i32 0, i32 7
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1628
ret void
}
%m980$.AstContext.type = type {%m297$.Token.type*,%m980$.Rule.type**,%m296$.Error.type*,i32,i32}
define %m980$.AstContext.type* @m980$next_token.m980$.AstContext.typep.m980$.AstContext.typep(%m980$.AstContext.type* %.ctx.arg) {
%ctx = alloca %m980$.AstContext.type*
store %m980$.AstContext.type* %.ctx.arg, %m980$.AstContext.type** %ctx
%.tmp1629 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1630 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1629, i32 0, i32 0
%.tmp1631 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1632 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1631, i32 0, i32 0
%.tmp1633 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1632
%.tmp1634 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1633, i32 0, i32 5
%.tmp1635 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1634
store %m297$.Token.type* %.tmp1635, %m297$.Token.type** %.tmp1630
%.tmp1636 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1637 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1636, i32 0, i32 0
%.tmp1638 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1637
%ct.1639 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1638, %m297$.Token.type** %ct.1639
%.tmp1640 = load %m297$.Token.type*, %m297$.Token.type** %ct.1639
%.tmp1641 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1640, i32 0, i32 2
%.tmp1642 = load i32, i32* %.tmp1641
%.tmp1643 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1644 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1643, i32 0, i32 3
%.tmp1645 = load i32, i32* %.tmp1644
%.tmp1646 = icmp sgt i32 %.tmp1642, %.tmp1645
br i1 %.tmp1646, label %.if.true.1647, label %.if.false.1647
.if.true.1647:
%.tmp1648 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1649 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1648, i32 0, i32 3
%.tmp1650 = load %m297$.Token.type*, %m297$.Token.type** %ct.1639
%.tmp1651 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1650, i32 0, i32 2
%.tmp1652 = load i32, i32* %.tmp1651
store i32 %.tmp1652, i32* %.tmp1649
%.tmp1653 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1654 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1653, i32 0, i32 4
%.tmp1655 = load %m297$.Token.type*, %m297$.Token.type** %ct.1639
%.tmp1656 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1655, i32 0, i32 3
%.tmp1657 = load i32, i32* %.tmp1656
store i32 %.tmp1657, i32* %.tmp1654
br label %.if.end.1647
.if.false.1647:
%.tmp1658 = load %m297$.Token.type*, %m297$.Token.type** %ct.1639
%.tmp1659 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1658, i32 0, i32 2
%.tmp1660 = load i32, i32* %.tmp1659
%.tmp1661 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1662 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1661, i32 0, i32 3
%.tmp1663 = load i32, i32* %.tmp1662
%.tmp1664 = icmp eq i32 %.tmp1660, %.tmp1663
br i1 %.tmp1664, label %.if.true.1665, label %.if.false.1665
.if.true.1665:
%.tmp1666 = load %m297$.Token.type*, %m297$.Token.type** %ct.1639
%.tmp1667 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1666, i32 0, i32 3
%.tmp1668 = load i32, i32* %.tmp1667
%.tmp1669 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1670 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1669, i32 0, i32 4
%.tmp1671 = load i32, i32* %.tmp1670
%.tmp1672 = icmp sgt i32 %.tmp1668, %.tmp1671
br i1 %.tmp1672, label %.if.true.1673, label %.if.false.1673
.if.true.1673:
%.tmp1674 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1675 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1674, i32 0, i32 4
%.tmp1676 = load %m297$.Token.type*, %m297$.Token.type** %ct.1639
%.tmp1677 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1676, i32 0, i32 3
%.tmp1678 = load i32, i32* %.tmp1677
store i32 %.tmp1678, i32* %.tmp1675
br label %.if.end.1673
.if.false.1673:
br label %.if.end.1673
.if.end.1673:
br label %.if.end.1665
.if.false.1665:
br label %.if.end.1665
.if.end.1665:
br label %.if.end.1647
.if.end.1647:
%.tmp1679 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
ret %m980$.AstContext.type* %.tmp1679
}
define %m980$.Rule.type* @m980$find_rule.m980$.Rule.typep.m980$.Rule.typepp.cp(%m980$.Rule.type** %.grammar.arg, i8* %.rule_name.arg) {
%grammar = alloca %m980$.Rule.type**
store %m980$.Rule.type** %.grammar.arg, %m980$.Rule.type*** %grammar
%rule_name = alloca i8*
store i8* %.rule_name.arg, i8** %rule_name
%i.1681 = alloca i32
store i32 0, i32* %i.1681
br label %.for.start.1680
.for.start.1680:
br i1 1, label %.for.continue.1680, label %.for.end.1680
.for.continue.1680:
%.tmp1682 = load i32, i32* %i.1681
%.tmp1683 = load %m980$.Rule.type**, %m980$.Rule.type*** %grammar
%.tmp1684 = getelementptr %m980$.Rule.type*, %m980$.Rule.type** %.tmp1683, i32 %.tmp1682
%.tmp1685 = load %m980$.Rule.type*, %m980$.Rule.type** %.tmp1684
%rule.1686 = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.tmp1685, %m980$.Rule.type** %rule.1686
%.tmp1687 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1686
%.tmp1688 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1687, i32 0, i32 0
%.tmp1689 = load i8*, i8** %.tmp1688
%.tmp1690 = load i8*, i8** %rule_name
%.tmp1691 = call i32(i8*,i8*) @strcmp(i8* %.tmp1689, i8* %.tmp1690)
%.tmp1692 = icmp eq i32 %.tmp1691, 0
br i1 %.tmp1692, label %.if.true.1693, label %.if.false.1693
.if.true.1693:
%.tmp1694 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1686
ret %m980$.Rule.type* %.tmp1694
br label %.if.end.1693
.if.false.1693:
br label %.if.end.1693
.if.end.1693:
%.tmp1695 = load i32, i32* %i.1681
%.tmp1696 = add i32 %.tmp1695, 1
store i32 %.tmp1696, i32* %i.1681
br label %.for.start.1680
.for.end.1680:
%.tmp1697 = bitcast ptr null to %m980$.Rule.type*
ret %m980$.Rule.type* %.tmp1697
}
%m980$.ParseResult.type = type {%m296$.Error.type*,%m980$.Node.type*}
define %m980$.ParseResult.type* @m980$parse_to_ast.m980$.ParseResult.typep.m980$.AstContext.typep.m980$.Rule.typep(%m980$.AstContext.type* %.c.arg, %m980$.Rule.type* %.rule.arg) {
%c = alloca %m980$.AstContext.type*
store %m980$.AstContext.type* %.c.arg, %m980$.AstContext.type** %c
%rule = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.rule.arg, %m980$.Rule.type** %rule
%.tmp1698 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* null, i32 1
%.tmp1699 = ptrtoint %m980$.ParseResult.type* %.tmp1698 to i32
%.tmp1700 = call i8*(i32) @malloc(i32 %.tmp1699)
%.tmp1701 = bitcast i8* %.tmp1700 to %m980$.ParseResult.type*
%res.1702 = alloca %m980$.ParseResult.type*
store %m980$.ParseResult.type* %.tmp1701, %m980$.ParseResult.type** %res.1702
%.tmp1703 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1702
%.tmp1704 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1703, i32 0, i32 0
store %m296$.Error.type* null, %m296$.Error.type** %.tmp1704
%.tmp1705 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1702
%.tmp1706 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1705, i32 0, i32 1
%.tmp1707 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1708 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1707, i32 0, i32 0
%.tmp1709 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1708
%.tmp1710 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1711 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1710, i32 0, i32 0
%.tmp1712 = load i8*, i8** %.tmp1711
%.tmp1713 = bitcast ptr null to i8*
%.tmp1714 = call %m980$.Node.type*(%m297$.Token.type*,i8*,i8*) @m980$new_node.m980$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1709, i8* %.tmp1712, i8* %.tmp1713)
store %m980$.Node.type* %.tmp1714, %m980$.Node.type** %.tmp1706
%.tmp1715 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1716 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1715, i32 0, i32 0
%.tmp1717 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1716
%start_match.1718 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1717, %m297$.Token.type** %start_match.1718
%.tmp1719 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1702
%.tmp1720 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1719, i32 0, i32 0
%.tmp1721 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1722 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1723 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1724 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1723, i32 0, i32 2
%.tmp1725 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1724
%.tmp1726 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1702
%.tmp1727 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1726, i32 0, i32 1
%.tmp1728 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1727
%.tmp1729 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp1721, %m980$.Rule.type* %.tmp1722, %m980$.Matcher.type* %.tmp1725, %m980$.Node.type* %.tmp1728)
store %m296$.Error.type* %.tmp1729, %m296$.Error.type** %.tmp1720
%.tmp1730 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1702
%.tmp1731 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1730, i32 0, i32 0
%.tmp1732 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1731
%.tmp1733 = icmp ne %m296$.Error.type* %.tmp1732, null
br i1 %.tmp1733, label %.if.true.1734, label %.if.false.1734
.if.true.1734:
%.tmp1735 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1702
%.tmp1736 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1735, i32 0, i32 0
%.tmp1737 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1736
%.tmp1738 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp1737, i32 0, i32 0
%.tmp1739 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1740 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1739, i32 0, i32 3
%.tmp1741 = load i32, i32* %.tmp1740
store i32 %.tmp1741, i32* %.tmp1738
%.tmp1742 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1702
%.tmp1743 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1742, i32 0, i32 0
%.tmp1744 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1743
%.tmp1745 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp1744, i32 0, i32 1
%.tmp1746 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1747 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1746, i32 0, i32 4
%.tmp1748 = load i32, i32* %.tmp1747
store i32 %.tmp1748, i32* %.tmp1745
br label %.if.end.1734
.if.false.1734:
br label %.if.end.1734
.if.end.1734:
%.tmp1749 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1702
ret %m980$.ParseResult.type* %.tmp1749
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
%.tmp1750 = bitcast ptr null to %m296$.Error.type*
%err.1751 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1750, %m296$.Error.type** %err.1751
%.tmp1753 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%m.1754 = alloca %m980$.Matcher.type*
store %m980$.Matcher.type* %.tmp1753, %m980$.Matcher.type** %m.1754
br label %.for.start.1752
.for.start.1752:
%.tmp1755 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1754
%.tmp1756 = icmp ne %m980$.Matcher.type* %.tmp1755, null
br i1 %.tmp1756, label %.for.continue.1752, label %.for.end.1752
.for.continue.1752:
%.tmp1757 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1758 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1759 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1754
%.tmp1760 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp1761 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher_straight.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp1757, %m980$.Rule.type* %.tmp1758, %m980$.Matcher.type* %.tmp1759, %m980$.Node.type* %.tmp1760)
store %m296$.Error.type* %.tmp1761, %m296$.Error.type** %err.1751
%.tmp1762 = load %m296$.Error.type*, %m296$.Error.type** %err.1751
%.tmp1763 = icmp eq %m296$.Error.type* %.tmp1762, null
br i1 %.tmp1763, label %.if.true.1764, label %.if.false.1764
.if.true.1764:
br label %.for.end.1752
br label %.if.end.1764
.if.false.1764:
br label %.if.end.1764
.if.end.1764:
%.tmp1765 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1754
%.tmp1766 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1765, i32 0, i32 2
%.tmp1767 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1766
store %m980$.Matcher.type* %.tmp1767, %m980$.Matcher.type** %m.1754
br label %.for.start.1752
.for.end.1752:
%.tmp1768 = load %m296$.Error.type*, %m296$.Error.type** %err.1751
ret %m296$.Error.type* %.tmp1768
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
%.tmp1770 = getelementptr [1 x i8], [1 x i8]*@.str1769, i32 0, i32 0
%buf.1771 = alloca i8*
store i8* %.tmp1770, i8** %buf.1771
%.tmp1772 = bitcast ptr null to %m296$.Error.type*
%err.1773 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1772, %m296$.Error.type** %err.1773
%.tmp1774 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1775 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1774, i32 0, i32 0
%.tmp1776 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1775
%anchor.1777 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1776, %m297$.Token.type** %anchor.1777
%.tmp1778 = bitcast ptr null to %m980$.Node.type*
%child.1779 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp1778, %m980$.Node.type** %child.1779
%.tmp1780 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1781 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1780, i32 0, i32 5
%.tmp1782 = load i8, i8* %.tmp1781
%.tmp1783 = load i8, i8* @TYPE_IGNORE
%.tmp1784 = icmp eq i8 %.tmp1782, %.tmp1783
br i1 %.tmp1784, label %.if.true.1785, label %.if.false.1785
.if.true.1785:
%.tmp1786 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1787 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1786, i32 0, i32 4
%.tmp1788 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1787
%.tmp1789 = icmp ne %m980$.Matcher.type* %.tmp1788, null
br i1 %.tmp1789, label %.if.true.1790, label %.if.false.1790
.if.true.1790:
%.tmp1791 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1792 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1793 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1794 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1793, i32 0, i32 4
%.tmp1795 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1794
%.tmp1796 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp1797 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp1791, %m980$.Rule.type* %.tmp1792, %m980$.Matcher.type* %.tmp1795, %m980$.Node.type* %.tmp1796)
store %m296$.Error.type* %.tmp1797, %m296$.Error.type** %err.1773
br label %.if.end.1790
.if.false.1790:
br label %.if.end.1790
.if.end.1790:
br label %.if.end.1785
.if.false.1785:
%.tmp1798 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1799 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1798, i32 0, i32 5
%.tmp1800 = load i8, i8* %.tmp1799
%.tmp1801 = load i8, i8* @TYPE_VALUE
%.tmp1802 = icmp eq i8 %.tmp1800, %.tmp1801
br i1 %.tmp1802, label %.if.true.1803, label %.if.false.1803
.if.true.1803:
%.tmp1804 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1805 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1804, i32 0, i32 6
%.tmp1806 = load i8*, i8** %.tmp1805
%.tmp1807 = icmp eq i8* %.tmp1806, null
br i1 %.tmp1807, label %.if.true.1808, label %.if.false.1808
.if.true.1808:
%.tmp1810 = getelementptr [22 x i8], [22 x i8]*@.str1809, i32 0, i32 0
%.tmp1811 = call i32(i8*,...) @printf(i8* %.tmp1810)
br label %.if.end.1808
.if.false.1808:
br label %.if.end.1808
.if.end.1808:
%.tmp1812 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1813 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1812, i32 0, i32 6
%.tmp1814 = load i8*, i8** %.tmp1813
%.tmp1815 = call i32(i8*) @strlen(i8* %.tmp1814)
%.tmp1816 = sub i32 %.tmp1815, 1
%.tmp1817 = call i8*(i32) @malloc(i32 %.tmp1816)
%buf.1818 = alloca i8*
store i8* %.tmp1817, i8** %buf.1818
%.tmp1819 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1820 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1819, i32 0, i32 6
%.tmp1821 = load i8*, i8** %.tmp1820
%.tmp1823 = getelementptr [8 x i8], [8 x i8]*@.str1822, i32 0, i32 0
%.tmp1824 = load i8*, i8** %buf.1818
%.tmp1825 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1821, i8* %.tmp1823, i8* %.tmp1824)
%.tmp1826 = load i8*, i8** %buf.1818
%.tmp1827 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1828 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1827, i32 0, i32 0
%.tmp1829 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1828
%.tmp1830 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1829, i32 0, i32 1
%.tmp1831 = load i8*, i8** %.tmp1830
%.tmp1832 = call i32(i8*,i8*) @strcmp(i8* %.tmp1826, i8* %.tmp1831)
%.tmp1833 = icmp ne i32 %.tmp1832, 0
br i1 %.tmp1833, label %.if.true.1834, label %.if.false.1834
.if.true.1834:
%.tmp1835 = getelementptr i8*, i8** %buf.1818, i32 0
%.tmp1837 = getelementptr [43 x i8], [43 x i8]*@.str1836, i32 0, i32 0
%.tmp1838 = load i8*, i8** %buf.1818
%.tmp1839 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1840 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1839, i32 0, i32 0
%.tmp1841 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1840
%.tmp1842 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1841, i32 0, i32 1
%.tmp1843 = load i8*, i8** %.tmp1842
%.tmp1844 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1835, i8* %.tmp1837, i8* %.tmp1838, i8* %.tmp1843)
%.tmp1845 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1846 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1845, i32 0, i32 0
%.tmp1847 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1846
%.tmp1848 = load i8*, i8** %buf.1818
%.tmp1849 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1847, i8* %.tmp1848)
ret %m296$.Error.type* %.tmp1849
br label %.if.end.1834
.if.false.1834:
br label %.if.end.1834
.if.end.1834:
%.tmp1850 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1851 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1850, i32 0, i32 0
%.tmp1852 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1851
%.tmp1853 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1854 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1853, i32 0, i32 0
%.tmp1855 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1854
%.tmp1856 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1855, i32 0, i32 0
%.tmp1857 = load i8*, i8** %.tmp1856
%.tmp1858 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1859 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1858, i32 0, i32 0
%.tmp1860 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1859
%.tmp1861 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1860, i32 0, i32 1
%.tmp1862 = load i8*, i8** %.tmp1861
%.tmp1863 = call %m980$.Node.type*(%m297$.Token.type*,i8*,i8*) @m980$new_node.m980$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1852, i8* %.tmp1857, i8* %.tmp1862)
store %m980$.Node.type* %.tmp1863, %m980$.Node.type** %child.1779
%.tmp1864 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1865 = call %m980$.AstContext.type*(%m980$.AstContext.type*) @m980$next_token.m980$.AstContext.typep.m980$.AstContext.typep(%m980$.AstContext.type* %.tmp1864)
store %m980$.AstContext.type* %.tmp1865, %m980$.AstContext.type** %ctx
br label %.if.end.1803
.if.false.1803:
%.tmp1866 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1867 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1866, i32 0, i32 5
%.tmp1868 = load i8, i8* %.tmp1867
%.tmp1869 = load i8, i8* @TYPE_TYPE
%.tmp1870 = icmp eq i8 %.tmp1868, %.tmp1869
br i1 %.tmp1870, label %.if.true.1871, label %.if.false.1871
.if.true.1871:
%.tmp1872 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1873 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1872, i32 0, i32 6
%.tmp1874 = load i8*, i8** %.tmp1873
%.tmp1875 = icmp eq i8* %.tmp1874, null
br i1 %.tmp1875, label %.if.true.1876, label %.if.false.1876
.if.true.1876:
%.tmp1878 = getelementptr [22 x i8], [22 x i8]*@.str1877, i32 0, i32 0
%.tmp1879 = call i32(i8*,...) @printf(i8* %.tmp1878)
br label %.if.end.1876
.if.false.1876:
br label %.if.end.1876
.if.end.1876:
%.tmp1880 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1881 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1880, i32 0, i32 6
%.tmp1882 = load i8*, i8** %.tmp1881
%.tmp1883 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1884 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1883, i32 0, i32 0
%.tmp1885 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1884
%.tmp1886 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1885, i32 0, i32 0
%.tmp1887 = load i8*, i8** %.tmp1886
%.tmp1888 = call i32(i8*,i8*) @strcmp(i8* %.tmp1882, i8* %.tmp1887)
%.tmp1889 = icmp ne i32 %.tmp1888, 0
br i1 %.tmp1889, label %.if.true.1890, label %.if.false.1890
.if.true.1890:
%.tmp1891 = getelementptr i8*, i8** %buf.1771, i32 0
%.tmp1893 = getelementptr [54 x i8], [54 x i8]*@.str1892, i32 0, i32 0
%.tmp1894 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1895 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1894, i32 0, i32 6
%.tmp1896 = load i8*, i8** %.tmp1895
%.tmp1897 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1898 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1897, i32 0, i32 0
%.tmp1899 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1898
%.tmp1900 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1899, i32 0, i32 0
%.tmp1901 = load i8*, i8** %.tmp1900
%.tmp1902 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1891, i8* %.tmp1893, i8* %.tmp1896, i8* %.tmp1901)
%.tmp1903 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1904 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1903, i32 0, i32 0
%.tmp1905 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1904
%.tmp1906 = load i8*, i8** %buf.1771
%.tmp1907 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1905, i8* %.tmp1906)
ret %m296$.Error.type* %.tmp1907
br label %.if.end.1890
.if.false.1890:
br label %.if.end.1890
.if.end.1890:
%.tmp1908 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1909 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1908, i32 0, i32 0
%.tmp1910 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1909
%.tmp1911 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1912 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1911, i32 0, i32 0
%.tmp1913 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1912
%.tmp1914 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1913, i32 0, i32 0
%.tmp1915 = load i8*, i8** %.tmp1914
%.tmp1916 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1917 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1916, i32 0, i32 0
%.tmp1918 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1917
%.tmp1919 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1918, i32 0, i32 1
%.tmp1920 = load i8*, i8** %.tmp1919
%.tmp1921 = call %m980$.Node.type*(%m297$.Token.type*,i8*,i8*) @m980$new_node.m980$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1910, i8* %.tmp1915, i8* %.tmp1920)
store %m980$.Node.type* %.tmp1921, %m980$.Node.type** %child.1779
%.tmp1922 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1923 = call %m980$.AstContext.type*(%m980$.AstContext.type*) @m980$next_token.m980$.AstContext.typep.m980$.AstContext.typep(%m980$.AstContext.type* %.tmp1922)
store %m980$.AstContext.type* %.tmp1923, %m980$.AstContext.type** %ctx
br label %.if.end.1871
.if.false.1871:
%.tmp1924 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1925 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1924, i32 0, i32 5
%.tmp1926 = load i8, i8* %.tmp1925
%.tmp1927 = load i8, i8* @TYPE_ALIAS
%.tmp1928 = icmp eq i8 %.tmp1926, %.tmp1927
br i1 %.tmp1928, label %.if.true.1929, label %.if.false.1929
.if.true.1929:
%.tmp1930 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1931 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1930, i32 0, i32 1
%.tmp1932 = load %m980$.Rule.type**, %m980$.Rule.type*** %.tmp1931
%.tmp1933 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1934 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1933, i32 0, i32 6
%.tmp1935 = load i8*, i8** %.tmp1934
%.tmp1936 = call %m980$.Rule.type*(%m980$.Rule.type**,i8*) @m980$find_rule.m980$.Rule.typep.m980$.Rule.typepp.cp(%m980$.Rule.type** %.tmp1932, i8* %.tmp1935)
%alias_rule.1937 = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.tmp1936, %m980$.Rule.type** %alias_rule.1937
%.tmp1938 = load %m980$.Rule.type*, %m980$.Rule.type** %alias_rule.1937
%.tmp1939 = icmp eq %m980$.Rule.type* %.tmp1938, null
br i1 %.tmp1939, label %.if.true.1940, label %.if.false.1940
.if.true.1940:
%.tmp1941 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1942 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1941, i32 0, i32 0
%.tmp1943 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1942
%.tmp1945 = getelementptr [26 x i8], [26 x i8]*@.str1944, i32 0, i32 0
%.tmp1946 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1943, i8* %.tmp1945)
ret %m296$.Error.type* %.tmp1946
br label %.if.end.1940
.if.false.1940:
br label %.if.end.1940
.if.end.1940:
%.tmp1947 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1948 = load %m980$.Rule.type*, %m980$.Rule.type** %alias_rule.1937
%.tmp1949 = call %m980$.ParseResult.type*(%m980$.AstContext.type*,%m980$.Rule.type*) @m980$parse_to_ast.m980$.ParseResult.typep.m980$.AstContext.typep.m980$.Rule.typep(%m980$.AstContext.type* %.tmp1947, %m980$.Rule.type* %.tmp1948)
%parse_result.1950 = alloca %m980$.ParseResult.type*
store %m980$.ParseResult.type* %.tmp1949, %m980$.ParseResult.type** %parse_result.1950
%.tmp1951 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %parse_result.1950
%.tmp1952 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1951, i32 0, i32 0
%.tmp1953 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1952
%.tmp1954 = icmp ne %m296$.Error.type* %.tmp1953, null
br i1 %.tmp1954, label %.if.true.1955, label %.if.false.1955
.if.true.1955:
%.tmp1956 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %parse_result.1950
%.tmp1957 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1956, i32 0, i32 0
%.tmp1958 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1957
ret %m296$.Error.type* %.tmp1958
br label %.if.end.1955
.if.false.1955:
br label %.if.end.1955
.if.end.1955:
%.tmp1959 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %parse_result.1950
%.tmp1960 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1959, i32 0, i32 1
%.tmp1961 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1960
store %m980$.Node.type* %.tmp1961, %m980$.Node.type** %child.1779
br label %.if.end.1929
.if.false.1929:
%.tmp1963 = getelementptr [33 x i8], [33 x i8]*@.str1962, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp1963)
br label %.if.end.1929
.if.end.1929:
br label %.if.end.1871
.if.end.1871:
br label %.if.end.1803
.if.end.1803:
br label %.if.end.1785
.if.end.1785:
%.tmp1964 = load %m980$.Node.type*, %m980$.Node.type** %child.1779
%.tmp1965 = icmp ne %m980$.Node.type* %.tmp1964, null
br i1 %.tmp1965, label %.if.true.1966, label %.if.false.1966
.if.true.1966:
%.tmp1967 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp1968 = load %m980$.Node.type*, %m980$.Node.type** %child.1779
call void(%m980$.Node.type*,%m980$.Node.type*) @m980$child_append.v.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.tmp1967, %m980$.Node.type* %.tmp1968)
br label %.if.end.1966
.if.false.1966:
br label %.if.end.1966
.if.end.1966:
%.tmp1969 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1970 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1969, i32 0, i32 0
%.tmp1971 = load i8, i8* %.tmp1970
%.tmp1972 = icmp eq i8 %.tmp1971, 63
%.tmp1973 = load %m296$.Error.type*, %m296$.Error.type** %err.1773
%.tmp1974 = icmp ne %m296$.Error.type* %.tmp1973, null
%.tmp1975 = and i1 %.tmp1972, %.tmp1974
br i1 %.tmp1975, label %.if.true.1976, label %.if.false.1976
.if.true.1976:
store %m296$.Error.type* null, %m296$.Error.type** %err.1773
br label %.if.end.1976
.if.false.1976:
%.tmp1977 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1978 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1977, i32 0, i32 0
%.tmp1979 = load i8, i8* %.tmp1978
%.tmp1980 = icmp eq i8 %.tmp1979, 42
br i1 %.tmp1980, label %.if.true.1981, label %.if.false.1981
.if.true.1981:
%.tmp1982 = load %m296$.Error.type*, %m296$.Error.type** %err.1773
%.tmp1983 = icmp ne %m296$.Error.type* %.tmp1982, null
br i1 %.tmp1983, label %.if.true.1984, label %.if.false.1984
.if.true.1984:
store %m296$.Error.type* null, %m296$.Error.type** %err.1773
br label %.if.end.1984
.if.false.1984:
%.tmp1985 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1986 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1987 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1988 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp1989 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp1985, %m980$.Rule.type* %.tmp1986, %m980$.Matcher.type* %.tmp1987, %m980$.Node.type* %.tmp1988)
ret %m296$.Error.type* %.tmp1989
br label %.if.end.1984
.if.end.1984:
br label %.if.end.1981
.if.false.1981:
%.tmp1990 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1991 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1990, i32 0, i32 0
%.tmp1992 = load i8, i8* %.tmp1991
%.tmp1993 = icmp eq i8 %.tmp1992, 43
%.tmp1994 = load %m296$.Error.type*, %m296$.Error.type** %err.1773
%.tmp1995 = icmp eq %m296$.Error.type* %.tmp1994, null
%.tmp1996 = and i1 %.tmp1993, %.tmp1995
br i1 %.tmp1996, label %.if.true.1997, label %.if.false.1997
.if.true.1997:
%.tmp1998 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1999 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp2000 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2001 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2002 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp1998, %m980$.Rule.type* %.tmp1999, %m980$.Matcher.type* %.tmp2000, %m980$.Node.type* %.tmp2001)
store %m296$.Error.type* %.tmp2002, %m296$.Error.type** %err.1773
%.tmp2003 = load %m296$.Error.type*, %m296$.Error.type** %err.1773
%.tmp2004 = icmp ne %m296$.Error.type* %.tmp2003, null
br i1 %.tmp2004, label %.if.true.2005, label %.if.false.2005
.if.true.2005:
store %m296$.Error.type* null, %m296$.Error.type** %err.1773
br label %.if.end.2005
.if.false.2005:
%.tmp2006 = bitcast ptr null to %m296$.Error.type*
ret %m296$.Error.type* %.tmp2006
br label %.if.end.2005
.if.end.2005:
br label %.if.end.1997
.if.false.1997:
br label %.if.end.1997
.if.end.1997:
br label %.if.end.1981
.if.end.1981:
br label %.if.end.1976
.if.end.1976:
%.tmp2007 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2008 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp2007, i32 0, i32 3
%.tmp2009 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp2008
%.tmp2010 = icmp ne %m980$.Matcher.type* %.tmp2009, null
%.tmp2011 = load %m296$.Error.type*, %m296$.Error.type** %err.1773
%.tmp2012 = icmp eq %m296$.Error.type* %.tmp2011, null
%.tmp2013 = and i1 %.tmp2010, %.tmp2012
br i1 %.tmp2013, label %.if.true.2014, label %.if.false.2014
.if.true.2014:
%.tmp2015 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp2016 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp2017 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2018 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp2017, i32 0, i32 3
%.tmp2019 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp2018
%.tmp2020 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2021 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp2015, %m980$.Rule.type* %.tmp2016, %m980$.Matcher.type* %.tmp2019, %m980$.Node.type* %.tmp2020)
store %m296$.Error.type* %.tmp2021, %m296$.Error.type** %err.1773
br label %.if.end.2014
.if.false.2014:
br label %.if.end.2014
.if.end.2014:
%.tmp2022 = load %m296$.Error.type*, %m296$.Error.type** %err.1773
%.tmp2023 = icmp ne %m296$.Error.type* %.tmp2022, null
br i1 %.tmp2023, label %.if.true.2024, label %.if.false.2024
.if.true.2024:
%.tmp2025 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp2026 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp2025, i32 0, i32 0
%.tmp2027 = load %m297$.Token.type*, %m297$.Token.type** %anchor.1777
store %m297$.Token.type* %.tmp2027, %m297$.Token.type** %.tmp2026
%.tmp2028 = load %m980$.Node.type*, %m980$.Node.type** %child.1779
%.tmp2029 = icmp ne %m980$.Node.type* %.tmp2028, null
br i1 %.tmp2029, label %.if.true.2030, label %.if.false.2030
.if.true.2030:
%.tmp2031 = load %m980$.Node.type*, %m980$.Node.type** %root
call void(%m980$.Node.type*) @m980$child_pop.v.m980$.Node.typep(%m980$.Node.type* %.tmp2031)
br label %.if.end.2030
.if.false.2030:
br label %.if.end.2030
.if.end.2030:
br label %.if.end.2024
.if.false.2024:
br label %.if.end.2024
.if.end.2024:
%.tmp2032 = load %m296$.Error.type*, %m296$.Error.type** %err.1773
ret %m296$.Error.type* %.tmp2032
}
define %m980$.ParseResult.type* @m980$ast.m980$.ParseResult.typep.m980$.Rule.typepp.cp.m297$.Token.typep(%m980$.Rule.type** %.grammar.arg, i8* %.start.arg, %m297$.Token.type* %.tokens.arg) {
%grammar = alloca %m980$.Rule.type**
store %m980$.Rule.type** %.grammar.arg, %m980$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m297$.Token.type*
store %m297$.Token.type* %.tokens.arg, %m297$.Token.type** %tokens
%.tmp2033 = load %m980$.Rule.type**, %m980$.Rule.type*** %grammar
%.tmp2034 = load i8*, i8** %start
%.tmp2035 = call %m980$.Rule.type*(%m980$.Rule.type**,i8*) @m980$find_rule.m980$.Rule.typep.m980$.Rule.typepp.cp(%m980$.Rule.type** %.tmp2033, i8* %.tmp2034)
%start_matcher.2036 = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.tmp2035, %m980$.Rule.type** %start_matcher.2036
%.tmp2037 = load %m980$.Rule.type*, %m980$.Rule.type** %start_matcher.2036
%.tmp2038 = icmp ne %m980$.Rule.type* %.tmp2037, null
%.tmp2040 = getelementptr [44 x i8], [44 x i8]*@.str2039, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2038, i8* %.tmp2040)
%c.2041 = alloca %m980$.AstContext.type
%.tmp2042 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2041, i32 0, i32 0
store %m297$.Token.type* null, %m297$.Token.type** %.tmp2042
%.tmp2043 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2041, i32 0, i32 1
store %m980$.Rule.type** null, %m980$.Rule.type*** %.tmp2043
%.tmp2044 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2041, i32 0, i32 2
store %m296$.Error.type* null, %m296$.Error.type** %.tmp2044
%.tmp2045 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2041, i32 0, i32 3
store i32 0, i32* %.tmp2045
%.tmp2046 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2041, i32 0, i32 4
store i32 0, i32* %.tmp2046
%.tmp2047 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2041, i32 0, i32 0
%.tmp2048 = load %m297$.Token.type*, %m297$.Token.type** %tokens
store %m297$.Token.type* %.tmp2048, %m297$.Token.type** %.tmp2047
%.tmp2049 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2041, i32 0, i32 1
%.tmp2050 = load %m980$.Rule.type**, %m980$.Rule.type*** %grammar
store %m980$.Rule.type** %.tmp2050, %m980$.Rule.type*** %.tmp2049
%.tmp2051 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2041, i32 0
%.tmp2052 = load %m980$.Rule.type*, %m980$.Rule.type** %start_matcher.2036
%.tmp2053 = call %m980$.ParseResult.type*(%m980$.AstContext.type*,%m980$.Rule.type*) @m980$parse_to_ast.m980$.ParseResult.typep.m980$.AstContext.typep.m980$.Rule.typep(%m980$.AstContext.type* %.tmp2051, %m980$.Rule.type* %.tmp2052)
%res.2054 = alloca %m980$.ParseResult.type*
store %m980$.ParseResult.type* %.tmp2053, %m980$.ParseResult.type** %res.2054
%.tmp2055 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2041, i32 0, i32 0
%.tmp2056 = load %m297$.Token.type*, %m297$.Token.type** %.tmp2055
%.tmp2057 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp2056, i32 0, i32 0
%.tmp2058 = load i8*, i8** %.tmp2057
%.tmp2060 = getelementptr [4 x i8], [4 x i8]*@.str2059, i32 0, i32 0
%.tmp2061 = call i32(i8*,i8*) @strcmp(i8* %.tmp2058, i8* %.tmp2060)
%.tmp2062 = icmp ne i32 %.tmp2061, 0
%.tmp2063 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.2054
%.tmp2064 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp2063, i32 0, i32 0
%.tmp2065 = load %m296$.Error.type*, %m296$.Error.type** %.tmp2064
%.tmp2066 = icmp eq %m296$.Error.type* %.tmp2065, null
%.tmp2067 = and i1 %.tmp2062, %.tmp2066
br i1 %.tmp2067, label %.if.true.2068, label %.if.false.2068
.if.true.2068:
%.tmp2069 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.2054
%.tmp2070 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp2069, i32 0, i32 0
%.tmp2071 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2041, i32 0, i32 0
%.tmp2072 = load %m297$.Token.type*, %m297$.Token.type** %.tmp2071
%.tmp2074 = getelementptr [32 x i8], [32 x i8]*@.str2073, i32 0, i32 0
%.tmp2075 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp2072, i8* %.tmp2074)
store %m296$.Error.type* %.tmp2075, %m296$.Error.type** %.tmp2070
br label %.if.end.2068
.if.false.2068:
br label %.if.end.2068
.if.end.2068:
%.tmp2076 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.2054
ret %m980$.ParseResult.type* %.tmp2076
}
define i8* @m2077$node_to_string.cp.m980$.Node.typep(%m980$.Node.type* %.n.arg) {
%n = alloca %m980$.Node.type*
store %m980$.Node.type* %.n.arg, %m980$.Node.type** %n
%.tmp2078 = call %m0$.File.type*() @tmpfile()
%tmp.2079 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2078, %m0$.File.type** %tmp.2079
%.tmp2080 = load %m980$.Node.type*, %m980$.Node.type** %n
%.tmp2081 = load %m0$.File.type*, %m0$.File.type** %tmp.2079
call void(%m980$.Node.type*,%m0$.File.type*,i32) @m2077$_node_to_string.v.m980$.Node.typep.m0$.File.typep.i(%m980$.Node.type* %.tmp2080, %m0$.File.type* %.tmp2081, i32 1)
%.tmp2082 = load %m0$.File.type*, %m0$.File.type** %tmp.2079
%.tmp2083 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp2082)
%.tmp2084 = load %m0$.File.type*, %m0$.File.type** %tmp.2079
%.tmp2085 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp2084)
%str_len.2086 = alloca i32
store i32 %.tmp2085, i32* %str_len.2086
%.tmp2087 = load %m0$.File.type*, %m0$.File.type** %tmp.2079
%.tmp2088 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp2087)
%tmp_fd.2089 = alloca i32
store i32 %.tmp2088, i32* %tmp_fd.2089
%.tmp2090 = load i32, i32* %tmp_fd.2089
%.tmp2091 = load i32, i32* @SEEK_SET
%.tmp2092 = call i32(i32,i32,i32) @lseek(i32 %.tmp2090, i32 0, i32 %.tmp2091)
%.tmp2093 = load i32, i32* %str_len.2086
%.tmp2094 = call i8*(i32) @malloc(i32 %.tmp2093)
%buf.2095 = alloca i8*
store i8* %.tmp2094, i8** %buf.2095
%.tmp2096 = load i32, i32* %tmp_fd.2089
%.tmp2097 = load i8*, i8** %buf.2095
%.tmp2098 = load i32, i32* %str_len.2086
%.tmp2099 = call i32(i32,i8*,i32) @read(i32 %.tmp2096, i8* %.tmp2097, i32 %.tmp2098)
%read.2100 = alloca i32
store i32 %.tmp2099, i32* %read.2100
%.tmp2101 = load i32, i32* %read.2100
%.tmp2102 = load i32, i32* %str_len.2086
%.tmp2103 = icmp ne i32 %.tmp2101, %.tmp2102
br i1 %.tmp2103, label %.if.true.2104, label %.if.false.2104
.if.true.2104:
%.tmp2105 = load i8*, i8** %buf.2095
call void(i8*) @free(i8* %.tmp2105)
store i8* null, i8** %buf.2095
br label %.if.end.2104
.if.false.2104:
br label %.if.end.2104
.if.end.2104:
%.tmp2106 = load i8*, i8** %buf.2095
ret i8* %.tmp2106
}
define void @m2077$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2107 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2109 = getelementptr [2 x i8], [2 x i8]*@.str2108, i32 0, i32 0
%.tmp2110 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2107, i8* %.tmp2109)
%i.2112 = alloca i32
store i32 0, i32* %i.2112
br label %.for.start.2111
.for.start.2111:
%.tmp2113 = load i32, i32* %i.2112
%.tmp2114 = load i32, i32* %indent
%.tmp2115 = icmp slt i32 %.tmp2113, %.tmp2114
br i1 %.tmp2115, label %.for.continue.2111, label %.for.end.2111
.for.continue.2111:
%.tmp2116 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2118 = getelementptr [3 x i8], [3 x i8]*@.str2117, i32 0, i32 0
%.tmp2119 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2116, i8* %.tmp2118)
%.tmp2120 = load i32, i32* %i.2112
%.tmp2121 = add i32 %.tmp2120, 1
store i32 %.tmp2121, i32* %i.2112
br label %.for.start.2111
.for.end.2111:
ret void
}
define void @m2077$_node_to_string.v.m980$.Node.typep.m0$.File.typep.i(%m980$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m980$.Node.type*
store %m980$.Node.type* %.node.arg, %m980$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2122 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2123 = icmp eq %m980$.Node.type* %.tmp2122, null
br i1 %.tmp2123, label %.if.true.2124, label %.if.false.2124
.if.true.2124:
%.tmp2125 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2127 = getelementptr [7 x i8], [7 x i8]*@.str2126, i32 0, i32 0
%.tmp2128 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2125, i8* %.tmp2127)
ret void
br label %.if.end.2124
.if.false.2124:
br label %.if.end.2124
.if.end.2124:
%.tmp2129 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2131 = getelementptr [2 x i8], [2 x i8]*@.str2130, i32 0, i32 0
%.tmp2132 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2129, i8* %.tmp2131)
%.tmp2133 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2134 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2077$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2133, i32 %.tmp2134)
%.tmp2135 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2137 = getelementptr [13 x i8], [13 x i8]*@.str2136, i32 0, i32 0
%.tmp2138 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2139 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2138, i32 0, i32 0
%.tmp2140 = load i8*, i8** %.tmp2139
%.tmp2141 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2135, i8* %.tmp2137, i8* %.tmp2140)
%.tmp2142 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2143 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2077$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2142, i32 %.tmp2143)
%.tmp2144 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2146 = getelementptr [12 x i8], [12 x i8]*@.str2145, i32 0, i32 0
%.tmp2147 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2148 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2147, i32 0, i32 1
%.tmp2149 = load i8*, i8** %.tmp2148
%.tmp2150 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2144, i8* %.tmp2146, i8* %.tmp2149)
%.tmp2151 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2152 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2077$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2151, i32 %.tmp2152)
%.tmp2153 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2155 = getelementptr [11 x i8], [11 x i8]*@.str2154, i32 0, i32 0
%.tmp2156 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2157 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2156, i32 0, i32 3
%.tmp2158 = load i32, i32* %.tmp2157
%.tmp2159 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2153, i8* %.tmp2155, i32 %.tmp2158)
%.tmp2160 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2161 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2077$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2160, i32 %.tmp2161)
%.tmp2162 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2164 = getelementptr [19 x i8], [19 x i8]*@.str2163, i32 0, i32 0
%.tmp2165 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2166 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2165, i32 0, i32 4
%.tmp2167 = load i32, i32* %.tmp2166
%.tmp2168 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2162, i8* %.tmp2164, i32 %.tmp2167)
%.tmp2169 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2170 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2077$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2169, i32 %.tmp2170)
%.tmp2171 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2173 = getelementptr [9 x i8], [9 x i8]*@.str2172, i32 0, i32 0
%.tmp2174 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2171, i8* %.tmp2173)
%.tmp2175 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2176 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2175, i32 0, i32 7
%.tmp2177 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2176
%.tmp2178 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2179 = load i32, i32* %indent
%.tmp2180 = add i32 %.tmp2179, 1
call void(%m980$.Node.type*,%m0$.File.type*,i32) @m2077$_node_to_string.v.m980$.Node.typep.m0$.File.typep.i(%m980$.Node.type* %.tmp2177, %m0$.File.type* %.tmp2178, i32 %.tmp2180)
%.tmp2181 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2182 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2077$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2181, i32 %.tmp2182)
%.tmp2183 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2185 = getelementptr [13 x i8], [13 x i8]*@.str2184, i32 0, i32 0
%.tmp2186 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2183, i8* %.tmp2185)
%.tmp2187 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2188 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2187, i32 0, i32 6
%.tmp2189 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2188
%.tmp2190 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2191 = load i32, i32* %indent
%.tmp2192 = add i32 %.tmp2191, 1
call void(%m980$.Node.type*,%m0$.File.type*,i32) @m2077$_node_to_string.v.m980$.Node.typep.m0$.File.typep.i(%m980$.Node.type* %.tmp2189, %m0$.File.type* %.tmp2190, i32 %.tmp2192)
%.tmp2193 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2194 = load i32, i32* %indent
%.tmp2195 = sub i32 %.tmp2194, 1
call void(%m0$.File.type*,i32) @m2077$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2193, i32 %.tmp2195)
%.tmp2196 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2198 = getelementptr [2 x i8], [2 x i8]*@.str2197, i32 0, i32 0
%.tmp2199 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2196, i8* %.tmp2198)
ret void
}
define i8* @m2200$grammar.cp() {
%.tmp2202 = getelementptr [1886 x i8], [1886 x i8]*@.str2201, i32 0, i32 0
ret i8* %.tmp2202
}
define i8* @m2203$append_tmpl.cp() {
%.tmp2205 = getelementptr [1885 x i8], [1885 x i8]*@.str2204, i32 0, i32 0
ret i8* %.tmp2205
}
define i8* @m2206$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2207 = load i8*, i8** %text
%.tmp2208 = call i32(i8*) @strlen(i8* %.tmp2207)
%str_len.2209 = alloca i32
store i32 %.tmp2208, i32* %str_len.2209
%.tmp2211 = getelementptr [1 x i8], [1 x i8]*@.str2210, i32 0, i32 0
%buf.2212 = alloca i8*
store i8* %.tmp2211, i8** %buf.2212
%i.2214 = alloca i32
store i32 1, i32* %i.2214
br label %.for.start.2213
.for.start.2213:
%.tmp2215 = load i32, i32* %i.2214
%.tmp2216 = load i32, i32* %str_len.2209
%.tmp2217 = sub i32 %.tmp2216, 1
%.tmp2218 = icmp slt i32 %.tmp2215, %.tmp2217
br i1 %.tmp2218, label %.for.continue.2213, label %.for.end.2213
.for.continue.2213:
%.tmp2219 = load i32, i32* %i.2214
%.tmp2220 = load i8*, i8** %text
%.tmp2221 = getelementptr i8, i8* %.tmp2220, i32 %.tmp2219
%.tmp2222 = load i8, i8* %.tmp2221
%.tmp2223 = icmp eq i8 %.tmp2222, 34
br i1 %.tmp2223, label %.if.true.2224, label %.if.false.2224
.if.true.2224:
%.tmp2225 = getelementptr i8*, i8** %buf.2212, i32 0
%.tmp2227 = getelementptr [6 x i8], [6 x i8]*@.str2226, i32 0, i32 0
%.tmp2228 = load i8*, i8** %buf.2212
%.tmp2229 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2225, i8* %.tmp2227, i8* %.tmp2228)
br label %.if.end.2224
.if.false.2224:
%.tmp2230 = load i32, i32* %i.2214
%.tmp2231 = load i8*, i8** %text
%.tmp2232 = getelementptr i8, i8* %.tmp2231, i32 %.tmp2230
%.tmp2233 = load i8, i8* %.tmp2232
%.tmp2234 = icmp eq i8 %.tmp2233, 92
br i1 %.tmp2234, label %.if.true.2235, label %.if.false.2235
.if.true.2235:
%.tmp2236 = load i32, i32* %i.2214
%.tmp2237 = add i32 %.tmp2236, 1
%.tmp2238 = load i8*, i8** %text
%.tmp2239 = getelementptr i8, i8* %.tmp2238, i32 %.tmp2237
%.tmp2240 = load i8, i8* %.tmp2239
%.tmp2241 = icmp eq i8 %.tmp2240, 110
%.tmp2242 = load i32, i32* %i.2214
%.tmp2243 = add i32 %.tmp2242, 1
%.tmp2244 = load i8*, i8** %text
%.tmp2245 = getelementptr i8, i8* %.tmp2244, i32 %.tmp2243
%.tmp2246 = load i8, i8* %.tmp2245
%.tmp2247 = icmp eq i8 %.tmp2246, 78
%.tmp2248 = or i1 %.tmp2241, %.tmp2247
br i1 %.tmp2248, label %.if.true.2249, label %.if.false.2249
.if.true.2249:
%.tmp2250 = getelementptr i8*, i8** %buf.2212, i32 0
%.tmp2252 = getelementptr [6 x i8], [6 x i8]*@.str2251, i32 0, i32 0
%.tmp2253 = load i8*, i8** %buf.2212
%.tmp2254 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2250, i8* %.tmp2252, i8* %.tmp2253)
%.tmp2255 = load i32, i32* %i.2214
%.tmp2256 = add i32 %.tmp2255, 1
store i32 %.tmp2256, i32* %i.2214
br label %.if.end.2249
.if.false.2249:
%.tmp2257 = load i32, i32* %i.2214
%.tmp2258 = add i32 %.tmp2257, 1
%.tmp2259 = load i8*, i8** %text
%.tmp2260 = getelementptr i8, i8* %.tmp2259, i32 %.tmp2258
%.tmp2261 = load i8, i8* %.tmp2260
%.tmp2262 = icmp eq i8 %.tmp2261, 92
br i1 %.tmp2262, label %.if.true.2263, label %.if.false.2263
.if.true.2263:
%.tmp2264 = getelementptr i8*, i8** %buf.2212, i32 0
%.tmp2266 = getelementptr [6 x i8], [6 x i8]*@.str2265, i32 0, i32 0
%.tmp2267 = load i8*, i8** %buf.2212
%.tmp2268 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2264, i8* %.tmp2266, i8* %.tmp2267)
%.tmp2269 = load i32, i32* %i.2214
%.tmp2270 = add i32 %.tmp2269, 1
store i32 %.tmp2270, i32* %i.2214
br label %.if.end.2263
.if.false.2263:
%.tmp2271 = load i32, i32* %i.2214
%.tmp2272 = add i32 %.tmp2271, 1
%.tmp2273 = load i8*, i8** %text
%.tmp2274 = getelementptr i8, i8* %.tmp2273, i32 %.tmp2272
%.tmp2275 = load i8, i8* %.tmp2274
%.tmp2276 = icmp eq i8 %.tmp2275, 120
br i1 %.tmp2276, label %.if.true.2277, label %.if.false.2277
.if.true.2277:
%.tmp2278 = load i32, i32* %i.2214
%.tmp2279 = add i32 %.tmp2278, 2
store i32 %.tmp2279, i32* %i.2214
%.tmp2280 = getelementptr i8*, i8** %buf.2212, i32 0
%.tmp2282 = getelementptr [8 x i8], [8 x i8]*@.str2281, i32 0, i32 0
%.tmp2283 = load i8*, i8** %buf.2212
%.tmp2284 = load i32, i32* %i.2214
%.tmp2285 = load i8*, i8** %text
%.tmp2286 = getelementptr i8, i8* %.tmp2285, i32 %.tmp2284
%.tmp2287 = load i8, i8* %.tmp2286
%.tmp2288 = call i8(i8) @toupper(i8 %.tmp2287)
%.tmp2289 = load i32, i32* %i.2214
%.tmp2290 = add i32 %.tmp2289, 1
%.tmp2291 = load i8*, i8** %text
%.tmp2292 = getelementptr i8, i8* %.tmp2291, i32 %.tmp2290
%.tmp2293 = load i8, i8* %.tmp2292
%.tmp2294 = call i8(i8) @toupper(i8 %.tmp2293)
%.tmp2295 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2280, i8* %.tmp2282, i8* %.tmp2283, i8 %.tmp2288, i8 %.tmp2294)
%.tmp2296 = load i32, i32* %i.2214
%.tmp2297 = add i32 %.tmp2296, 1
store i32 %.tmp2297, i32* %i.2214
br label %.if.end.2277
.if.false.2277:
%.tmp2298 = getelementptr i8*, i8** %buf.2212, i32 0
%.tmp2300 = getelementptr [5 x i8], [5 x i8]*@.str2299, i32 0, i32 0
%.tmp2301 = load i8*, i8** %buf.2212
%.tmp2302 = load i32, i32* %i.2214
%.tmp2303 = load i8*, i8** %text
%.tmp2304 = getelementptr i8, i8* %.tmp2303, i32 %.tmp2302
%.tmp2305 = load i8, i8* %.tmp2304
%.tmp2306 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2298, i8* %.tmp2300, i8* %.tmp2301, i8 %.tmp2305)
br label %.if.end.2277
.if.end.2277:
br label %.if.end.2263
.if.end.2263:
br label %.if.end.2249
.if.end.2249:
br label %.if.end.2235
.if.false.2235:
%.tmp2307 = getelementptr i8*, i8** %buf.2212, i32 0
%.tmp2309 = getelementptr [5 x i8], [5 x i8]*@.str2308, i32 0, i32 0
%.tmp2310 = load i8*, i8** %buf.2212
%.tmp2311 = load i32, i32* %i.2214
%.tmp2312 = load i8*, i8** %text
%.tmp2313 = getelementptr i8, i8* %.tmp2312, i32 %.tmp2311
%.tmp2314 = load i8, i8* %.tmp2313
%.tmp2315 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2307, i8* %.tmp2309, i8* %.tmp2310, i8 %.tmp2314)
br label %.if.end.2235
.if.end.2235:
br label %.if.end.2224
.if.end.2224:
%.tmp2316 = load i32, i32* %i.2214
%.tmp2317 = add i32 %.tmp2316, 1
store i32 %.tmp2317, i32* %i.2214
br label %.for.start.2213
.for.end.2213:
%.tmp2318 = getelementptr i8*, i8** %buf.2212, i32 0
%.tmp2320 = getelementptr [9 x i8], [9 x i8]*@.str2319, i32 0, i32 0
%.tmp2321 = load i8*, i8** %buf.2212
%.tmp2322 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2318, i8* %.tmp2320, i8* %.tmp2321)
%.tmp2323 = load i8*, i8** %buf.2212
ret i8* %.tmp2323
}
define i32 @m2206$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len.2324 = alloca i32
store i32 0, i32* %len.2324
%i.2326 = alloca i32
store i32 2, i32* %i.2326
br label %.for.start.2325
.for.start.2325:
%.tmp2327 = load i32, i32* %i.2326
%.tmp2328 = load i8*, i8** %text
%.tmp2329 = getelementptr i8, i8* %.tmp2328, i32 %.tmp2327
%.tmp2330 = load i8, i8* %.tmp2329
%.tmp2331 = icmp ne i8 %.tmp2330, 0
br i1 %.tmp2331, label %.for.continue.2325, label %.for.end.2325
.for.continue.2325:
%.tmp2332 = load i32, i32* %i.2326
%.tmp2333 = load i8*, i8** %text
%.tmp2334 = getelementptr i8, i8* %.tmp2333, i32 %.tmp2332
%.tmp2335 = load i8, i8* %.tmp2334
%.tmp2336 = icmp eq i8 %.tmp2335, 92
br i1 %.tmp2336, label %.if.true.2337, label %.if.false.2337
.if.true.2337:
%.tmp2338 = load i32, i32* %i.2326
%.tmp2339 = add i32 %.tmp2338, 2
store i32 %.tmp2339, i32* %i.2326
br label %.if.end.2337
.if.false.2337:
br label %.if.end.2337
.if.end.2337:
%.tmp2340 = load i32, i32* %len.2324
%.tmp2341 = add i32 %.tmp2340, 1
store i32 %.tmp2341, i32* %len.2324
%.tmp2342 = load i32, i32* %i.2326
%.tmp2343 = add i32 %.tmp2342, 1
store i32 %.tmp2343, i32* %i.2326
br label %.for.start.2325
.for.end.2325:
%.tmp2344 = load i32, i32* %len.2324
%.tmp2345 = sub i32 %.tmp2344, 1
ret i32 %.tmp2345
}
define i8* @m2206$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval.2346 = alloca i32
store i32 0, i32* %intval.2346
%buf.2347 = alloca i8*
store i8* null, i8** %buf.2347
%chrval.2348 = alloca i8
store i8 0, i8* %chrval.2348
%.tmp2349 = load i8*, i8** %chr_repr
%.tmp2350 = call i32(i8*) @strlen(i8* %.tmp2349)
%chr_len.2351 = alloca i32
store i32 %.tmp2350, i32* %chr_len.2351
%.tmp2352 = load i32, i32* %chr_len.2351
%.tmp2353 = icmp eq i32 %.tmp2352, 6
br i1 %.tmp2353, label %.if.true.2354, label %.if.false.2354
.if.true.2354:
%.tmp2355 = load i8*, i8** %chr_repr
%.tmp2357 = getelementptr [7 x i8], [7 x i8]*@.str2356, i32 0, i32 0
%.tmp2358 = getelementptr i32, i32* %intval.2346, i32 0
%.tmp2359 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2355, i8* %.tmp2357, i32* %.tmp2358)
%.tmp2360 = getelementptr i8*, i8** %buf.2347, i32 0
%.tmp2362 = getelementptr [3 x i8], [3 x i8]*@.str2361, i32 0, i32 0
%.tmp2363 = load i32, i32* %intval.2346
%.tmp2364 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2360, i8* %.tmp2362, i32 %.tmp2363)
br label %.if.end.2354
.if.false.2354:
%.tmp2365 = load i32, i32* %chr_len.2351
%.tmp2366 = icmp eq i32 %.tmp2365, 5
br i1 %.tmp2366, label %.if.true.2367, label %.if.false.2367
.if.true.2367:
%.tmp2368 = load i8*, i8** %chr_repr
%.tmp2370 = getelementptr [6 x i8], [6 x i8]*@.str2369, i32 0, i32 0
%.tmp2371 = getelementptr i32, i32* %intval.2346, i32 0
%.tmp2372 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2368, i8* %.tmp2370, i32* %.tmp2371)
%.tmp2373 = getelementptr i8*, i8** %buf.2347, i32 0
%.tmp2375 = getelementptr [3 x i8], [3 x i8]*@.str2374, i32 0, i32 0
%.tmp2376 = load i32, i32* %intval.2346
%.tmp2377 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2373, i8* %.tmp2375, i32 %.tmp2376)
br label %.if.end.2367
.if.false.2367:
%.tmp2378 = load i32, i32* %chr_len.2351
%.tmp2379 = icmp eq i32 %.tmp2378, 4
br i1 %.tmp2379, label %.if.true.2380, label %.if.false.2380
.if.true.2380:
%.tmp2381 = load i8*, i8** %chr_repr
%.tmp2383 = getelementptr [6 x i8], [6 x i8]*@.str2382, i32 0, i32 0
%.tmp2384 = getelementptr i8, i8* %chrval.2348, i32 0
%.tmp2385 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2381, i8* %.tmp2383, i8* %.tmp2384)
%.tmp2386 = load i8, i8* %chrval.2348
%.tmp2387 = icmp eq i8 %.tmp2386, 110
br i1 %.tmp2387, label %.if.true.2388, label %.if.false.2388
.if.true.2388:
%.tmp2390 = getelementptr [3 x i8], [3 x i8]*@.str2389, i32 0, i32 0
store i8* %.tmp2390, i8** %buf.2347
br label %.if.end.2388
.if.false.2388:
%.tmp2391 = bitcast ptr null to i8*
ret i8* %.tmp2391
br label %.if.end.2388
.if.end.2388:
br label %.if.end.2380
.if.false.2380:
%.tmp2392 = load i32, i32* %chr_len.2351
%.tmp2393 = icmp eq i32 %.tmp2392, 3
br i1 %.tmp2393, label %.if.true.2394, label %.if.false.2394
.if.true.2394:
%.tmp2395 = load i8*, i8** %chr_repr
%.tmp2397 = getelementptr [5 x i8], [5 x i8]*@.str2396, i32 0, i32 0
%.tmp2398 = getelementptr i32, i32* %intval.2346, i32 0
%.tmp2399 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2395, i8* %.tmp2397, i32* %.tmp2398)
%.tmp2400 = getelementptr i8*, i8** %buf.2347, i32 0
%.tmp2402 = getelementptr [3 x i8], [3 x i8]*@.str2401, i32 0, i32 0
%.tmp2403 = load i32, i32* %intval.2346
%.tmp2404 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2400, i8* %.tmp2402, i32 %.tmp2403)
br label %.if.end.2394
.if.false.2394:
%.tmp2405 = bitcast ptr null to i8*
ret i8* %.tmp2405
br label %.if.end.2394
.if.end.2394:
br label %.if.end.2380
.if.end.2380:
br label %.if.end.2367
.if.end.2367:
br label %.if.end.2354
.if.end.2354:
%.tmp2406 = load i8*, i8** %buf.2347
ret i8* %.tmp2406
}
%m2407$.SYStack.type = type {%m980$.Node.type*,%m2407$.SYStack.type*}
@SYStack_size = constant i32 16
define %m2407$.SYStack.type* @m2407$stack_new.m2407$.SYStack.typep() {
%.tmp2408 = load i32, i32* @SYStack_size
%.tmp2409 = call i8*(i32) @malloc(i32 %.tmp2408)
%.tmp2410 = bitcast i8* %.tmp2409 to %m2407$.SYStack.type*
%s.2411 = alloca %m2407$.SYStack.type*
store %m2407$.SYStack.type* %.tmp2410, %m2407$.SYStack.type** %s.2411
%.tmp2412 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %s.2411
%.tmp2413 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2412, i32 0, i32 0
store %m980$.Node.type* null, %m980$.Node.type** %.tmp2413
%.tmp2414 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %s.2411
%.tmp2415 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2414, i32 0, i32 1
store %m2407$.SYStack.type* null, %m2407$.SYStack.type** %.tmp2415
%.tmp2416 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %s.2411
ret %m2407$.SYStack.type* %.tmp2416
}
define %m2407$.SYStack.type* @m2407$sy_algorithm.m2407$.SYStack.typep.m980$.Node.typep(%m980$.Node.type* %.assignable.arg) {
%assignable = alloca %m980$.Node.type*
store %m980$.Node.type* %.assignable.arg, %m980$.Node.type** %assignable
%.tmp2417 = call %m2407$.SYStack.type*() @m2407$stack_new.m2407$.SYStack.typep()
%out_stack.2418 = alloca %m2407$.SYStack.type*
store %m2407$.SYStack.type* %.tmp2417, %m2407$.SYStack.type** %out_stack.2418
%.tmp2419 = call %m2407$.SYStack.type*() @m2407$stack_new.m2407$.SYStack.typep()
%op_stack.2420 = alloca %m2407$.SYStack.type*
store %m2407$.SYStack.type* %.tmp2419, %m2407$.SYStack.type** %op_stack.2420
%.tmp2421 = call %m2407$.SYStack.type*() @m2407$stack_new.m2407$.SYStack.typep()
%token_stack.2422 = alloca %m2407$.SYStack.type*
store %m2407$.SYStack.type* %.tmp2421, %m2407$.SYStack.type** %token_stack.2422
%ptr.2423 = alloca %m980$.Node.type*
store %m980$.Node.type* null, %m980$.Node.type** %ptr.2423
%.tmp2425 = load %m980$.Node.type*, %m980$.Node.type** %assignable
store %m980$.Node.type* %.tmp2425, %m980$.Node.type** %ptr.2423
br label %.for.start.2424
.for.start.2424:
%.tmp2426 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2423
%.tmp2427 = icmp ne %m980$.Node.type* %.tmp2426, null
br i1 %.tmp2427, label %.for.continue.2424, label %.for.end.2424
.for.continue.2424:
%.tmp2428 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %token_stack.2422
%.tmp2429 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2423
%.tmp2430 = call %m2407$.SYStack.type*(%m2407$.SYStack.type*,%m980$.Node.type*) @m2407$stack_push.m2407$.SYStack.typep.m2407$.SYStack.typep.m980$.Node.typep(%m2407$.SYStack.type* %.tmp2428, %m980$.Node.type* %.tmp2429)
store %m2407$.SYStack.type* %.tmp2430, %m2407$.SYStack.type** %token_stack.2422
%.tmp2431 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2423
%.tmp2432 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2431, i32 0, i32 7
%.tmp2433 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2432
store %m980$.Node.type* %.tmp2433, %m980$.Node.type** %ptr.2423
br label %.for.start.2424
.for.end.2424:
%.tmp2435 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %token_stack.2422
%.tmp2436 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2435, i32 0, i32 0
%.tmp2437 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2436
store %m980$.Node.type* %.tmp2437, %m980$.Node.type** %ptr.2423
br label %.for.start.2434
.for.start.2434:
%.tmp2438 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2423
%.tmp2439 = icmp ne %m980$.Node.type* %.tmp2438, null
br i1 %.tmp2439, label %.for.continue.2434, label %.for.end.2434
.for.continue.2434:
%.tmp2440 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %token_stack.2422
%cs.2441 = alloca %m2407$.SYStack.type*
store %m2407$.SYStack.type* %.tmp2440, %m2407$.SYStack.type** %cs.2441
%.tmp2442 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %token_stack.2422
%.tmp2443 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2442, i32 0, i32 1
%.tmp2444 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %.tmp2443
store %m2407$.SYStack.type* %.tmp2444, %m2407$.SYStack.type** %token_stack.2422
%.tmp2445 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %cs.2441
%.tmp2446 = bitcast %m2407$.SYStack.type* %.tmp2445 to i8*
call void(i8*) @free(i8* %.tmp2446)
%.tmp2447 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2423
%.tmp2448 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2447, i32 0, i32 0
%.tmp2449 = load i8*, i8** %.tmp2448
%.tmp2451 = getelementptr [16 x i8], [16 x i8]*@.str2450, i32 0, i32 0
%.tmp2452 = call i32(i8*,i8*) @strcmp(i8* %.tmp2449, i8* %.tmp2451)
%.tmp2453 = icmp eq i32 %.tmp2452, 0
br i1 %.tmp2453, label %.if.true.2454, label %.if.false.2454
.if.true.2454:
%.tmp2455 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %out_stack.2418
%.tmp2456 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2423
%.tmp2457 = call %m2407$.SYStack.type*(%m2407$.SYStack.type*,%m980$.Node.type*) @m2407$stack_push.m2407$.SYStack.typep.m2407$.SYStack.typep.m980$.Node.typep(%m2407$.SYStack.type* %.tmp2455, %m980$.Node.type* %.tmp2456)
store %m2407$.SYStack.type* %.tmp2457, %m2407$.SYStack.type** %out_stack.2418
br label %.if.end.2454
.if.false.2454:
%.tmp2458 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2423
%.tmp2459 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2458, i32 0, i32 0
%.tmp2460 = load i8*, i8** %.tmp2459
%.tmp2462 = getelementptr [9 x i8], [9 x i8]*@.str2461, i32 0, i32 0
%.tmp2463 = call i32(i8*,i8*) @strcmp(i8* %.tmp2460, i8* %.tmp2462)
%.tmp2464 = icmp eq i32 %.tmp2463, 0
br i1 %.tmp2464, label %.if.true.2465, label %.if.false.2465
.if.true.2465:
%quit.2466 = alloca i1
store i1 0, i1* %quit.2466
br label %.for.start.2467
.for.start.2467:
%.tmp2468 = load i1, i1* %quit.2466
%.tmp2469 = icmp eq i1 %.tmp2468, 0
br i1 %.tmp2469, label %.for.continue.2467, label %.for.end.2467
.for.continue.2467:
%.tmp2470 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %op_stack.2420
%.tmp2471 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2470, i32 0, i32 0
%.tmp2472 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2471
%.tmp2473 = icmp eq %m980$.Node.type* %.tmp2472, null
br i1 %.tmp2473, label %.if.true.2474, label %.if.false.2474
.if.true.2474:
store i1 1, i1* %quit.2466
br label %.if.end.2474
.if.false.2474:
%.tmp2475 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %op_stack.2420
%.tmp2476 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2475, i32 0, i32 0
%.tmp2477 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2476
%.tmp2478 = call i32(%m980$.Node.type*) @m2407$op_precedence.i.m980$.Node.typep(%m980$.Node.type* %.tmp2477)
%.tmp2479 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2423
%.tmp2480 = call i32(%m980$.Node.type*) @m2407$op_precedence.i.m980$.Node.typep(%m980$.Node.type* %.tmp2479)
%.tmp2481 = icmp slt i32 %.tmp2478, %.tmp2480
br i1 %.tmp2481, label %.if.true.2482, label %.if.false.2482
.if.true.2482:
%.tmp2483 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %op_stack.2420
%top.2484 = alloca %m2407$.SYStack.type*
store %m2407$.SYStack.type* %.tmp2483, %m2407$.SYStack.type** %top.2484
%.tmp2485 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %op_stack.2420
%.tmp2486 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2485, i32 0, i32 1
%.tmp2487 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %.tmp2486
store %m2407$.SYStack.type* %.tmp2487, %m2407$.SYStack.type** %op_stack.2420
%.tmp2488 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %out_stack.2418
%.tmp2489 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %top.2484
%.tmp2490 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2489, i32 0, i32 0
%.tmp2491 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2490
%.tmp2492 = call %m2407$.SYStack.type*(%m2407$.SYStack.type*,%m980$.Node.type*) @m2407$stack_push.m2407$.SYStack.typep.m2407$.SYStack.typep.m980$.Node.typep(%m2407$.SYStack.type* %.tmp2488, %m980$.Node.type* %.tmp2491)
store %m2407$.SYStack.type* %.tmp2492, %m2407$.SYStack.type** %out_stack.2418
%.tmp2493 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %top.2484
%.tmp2494 = bitcast %m2407$.SYStack.type* %.tmp2493 to i8*
call void(i8*) @free(i8* %.tmp2494)
br label %.if.end.2482
.if.false.2482:
store i1 1, i1* %quit.2466
br label %.if.end.2482
.if.end.2482:
br label %.if.end.2474
.if.end.2474:
br label %.for.start.2467
.for.end.2467:
%.tmp2495 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %op_stack.2420
%.tmp2496 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2423
%.tmp2497 = call %m2407$.SYStack.type*(%m2407$.SYStack.type*,%m980$.Node.type*) @m2407$stack_push.m2407$.SYStack.typep.m2407$.SYStack.typep.m980$.Node.typep(%m2407$.SYStack.type* %.tmp2495, %m980$.Node.type* %.tmp2496)
store %m2407$.SYStack.type* %.tmp2497, %m2407$.SYStack.type** %op_stack.2420
br label %.if.end.2465
.if.false.2465:
%.tmp2499 = getelementptr [68 x i8], [68 x i8]*@.str2498, i32 0, i32 0
%.tmp2500 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2423
%.tmp2501 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2500, i32 0, i32 0
%.tmp2502 = load i8*, i8** %.tmp2501
%.tmp2503 = call i32(i8*,...) @printf(i8* %.tmp2499, i8* %.tmp2502)
br label %.if.end.2465
.if.end.2465:
br label %.if.end.2454
.if.end.2454:
%.tmp2504 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %token_stack.2422
%.tmp2505 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2504, i32 0, i32 0
%.tmp2506 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2505
store %m980$.Node.type* %.tmp2506, %m980$.Node.type** %ptr.2423
br label %.for.start.2434
.for.end.2434:
br label %.for.start.2507
.for.start.2507:
%.tmp2508 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %op_stack.2420
%.tmp2509 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2508, i32 0, i32 0
%.tmp2510 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2509
%.tmp2511 = icmp ne %m980$.Node.type* %.tmp2510, null
br i1 %.tmp2511, label %.for.continue.2507, label %.for.end.2507
.for.continue.2507:
%.tmp2512 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %op_stack.2420
%.tmp2513 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2512, i32 0, i32 0
%.tmp2514 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2513
%node.2515 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp2514, %m980$.Node.type** %node.2515
%.tmp2516 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %op_stack.2420
%s.2517 = alloca %m2407$.SYStack.type*
store %m2407$.SYStack.type* %.tmp2516, %m2407$.SYStack.type** %s.2517
%.tmp2518 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %op_stack.2420
%.tmp2519 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2518, i32 0, i32 1
%.tmp2520 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %.tmp2519
store %m2407$.SYStack.type* %.tmp2520, %m2407$.SYStack.type** %op_stack.2420
%.tmp2521 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %s.2517
%.tmp2522 = bitcast %m2407$.SYStack.type* %.tmp2521 to i8*
call void(i8*) @free(i8* %.tmp2522)
%.tmp2523 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %out_stack.2418
%.tmp2524 = load %m980$.Node.type*, %m980$.Node.type** %node.2515
%.tmp2525 = call %m2407$.SYStack.type*(%m2407$.SYStack.type*,%m980$.Node.type*) @m2407$stack_push.m2407$.SYStack.typep.m2407$.SYStack.typep.m980$.Node.typep(%m2407$.SYStack.type* %.tmp2523, %m980$.Node.type* %.tmp2524)
store %m2407$.SYStack.type* %.tmp2525, %m2407$.SYStack.type** %out_stack.2418
br label %.for.start.2507
.for.end.2507:
%.tmp2526 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %out_stack.2418
ret %m2407$.SYStack.type* %.tmp2526
}
define %m2407$.SYStack.type* @m2407$stack_push.m2407$.SYStack.typep.m2407$.SYStack.typep.m980$.Node.typep(%m2407$.SYStack.type* %.curr_stack.arg, %m980$.Node.type* %.node.arg) {
%curr_stack = alloca %m2407$.SYStack.type*
store %m2407$.SYStack.type* %.curr_stack.arg, %m2407$.SYStack.type** %curr_stack
%node = alloca %m980$.Node.type*
store %m980$.Node.type* %.node.arg, %m980$.Node.type** %node
%.tmp2527 = load i32, i32* @SYStack_size
%.tmp2528 = call i8*(i32) @malloc(i32 %.tmp2527)
%.tmp2529 = bitcast i8* %.tmp2528 to %m2407$.SYStack.type*
%s.2530 = alloca %m2407$.SYStack.type*
store %m2407$.SYStack.type* %.tmp2529, %m2407$.SYStack.type** %s.2530
%.tmp2531 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %s.2530
%.tmp2532 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2531, i32 0, i32 0
%.tmp2533 = load %m980$.Node.type*, %m980$.Node.type** %node
store %m980$.Node.type* %.tmp2533, %m980$.Node.type** %.tmp2532
%.tmp2534 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %s.2530
%.tmp2535 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp2534, i32 0, i32 1
%.tmp2536 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %curr_stack
store %m2407$.SYStack.type* %.tmp2536, %m2407$.SYStack.type** %.tmp2535
%.tmp2537 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %s.2530
ret %m2407$.SYStack.type* %.tmp2537
}
define i32 @m2407$op_precedence.i.m980$.Node.typep(%m980$.Node.type* %.n.arg) {
%n = alloca %m980$.Node.type*
store %m980$.Node.type* %.n.arg, %m980$.Node.type** %n
%.tmp2538 = load %m980$.Node.type*, %m980$.Node.type** %n
%.tmp2539 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2538, i32 0, i32 6
%.tmp2540 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2539
%op.2541 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp2540, %m980$.Node.type** %op.2541
%.tmp2542 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2543 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2542, i32 0, i32 1
%.tmp2544 = load i8*, i8** %.tmp2543
%.tmp2546 = getelementptr [2 x i8], [2 x i8]*@.str2545, i32 0, i32 0
%.tmp2547 = call i32(i8*,i8*) @strcmp(i8* %.tmp2544, i8* %.tmp2546)
%.tmp2548 = icmp eq i32 %.tmp2547, 0
%.tmp2549 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2550 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2549, i32 0, i32 1
%.tmp2551 = load i8*, i8** %.tmp2550
%.tmp2553 = getelementptr [2 x i8], [2 x i8]*@.str2552, i32 0, i32 0
%.tmp2554 = call i32(i8*,i8*) @strcmp(i8* %.tmp2551, i8* %.tmp2553)
%.tmp2555 = icmp eq i32 %.tmp2554, 0
%.tmp2556 = or i1 %.tmp2548, %.tmp2555
br i1 %.tmp2556, label %.if.true.2557, label %.if.false.2557
.if.true.2557:
ret i32 4
br label %.if.end.2557
.if.false.2557:
%.tmp2558 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2559 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2558, i32 0, i32 1
%.tmp2560 = load i8*, i8** %.tmp2559
%.tmp2562 = getelementptr [2 x i8], [2 x i8]*@.str2561, i32 0, i32 0
%.tmp2563 = call i32(i8*,i8*) @strcmp(i8* %.tmp2560, i8* %.tmp2562)
%.tmp2564 = icmp eq i32 %.tmp2563, 0
%.tmp2565 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2566 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2565, i32 0, i32 1
%.tmp2567 = load i8*, i8** %.tmp2566
%.tmp2569 = getelementptr [2 x i8], [2 x i8]*@.str2568, i32 0, i32 0
%.tmp2570 = call i32(i8*,i8*) @strcmp(i8* %.tmp2567, i8* %.tmp2569)
%.tmp2571 = icmp eq i32 %.tmp2570, 0
%.tmp2572 = or i1 %.tmp2564, %.tmp2571
%.tmp2573 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2574 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2573, i32 0, i32 1
%.tmp2575 = load i8*, i8** %.tmp2574
%.tmp2577 = getelementptr [2 x i8], [2 x i8]*@.str2576, i32 0, i32 0
%.tmp2578 = call i32(i8*,i8*) @strcmp(i8* %.tmp2575, i8* %.tmp2577)
%.tmp2579 = icmp eq i32 %.tmp2578, 0
%.tmp2580 = or i1 %.tmp2572, %.tmp2579
br i1 %.tmp2580, label %.if.true.2581, label %.if.false.2581
.if.true.2581:
ret i32 3
br label %.if.end.2581
.if.false.2581:
%.tmp2582 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2583 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2582, i32 0, i32 1
%.tmp2584 = load i8*, i8** %.tmp2583
%.tmp2586 = getelementptr [3 x i8], [3 x i8]*@.str2585, i32 0, i32 0
%.tmp2587 = call i32(i8*,i8*) @strcmp(i8* %.tmp2584, i8* %.tmp2586)
%.tmp2588 = icmp eq i32 %.tmp2587, 0
%.tmp2589 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2590 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2589, i32 0, i32 1
%.tmp2591 = load i8*, i8** %.tmp2590
%.tmp2593 = getelementptr [3 x i8], [3 x i8]*@.str2592, i32 0, i32 0
%.tmp2594 = call i32(i8*,i8*) @strcmp(i8* %.tmp2591, i8* %.tmp2593)
%.tmp2595 = icmp eq i32 %.tmp2594, 0
%.tmp2596 = or i1 %.tmp2588, %.tmp2595
br i1 %.tmp2596, label %.if.true.2597, label %.if.false.2597
.if.true.2597:
ret i32 7
br label %.if.end.2597
.if.false.2597:
%.tmp2598 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2599 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2598, i32 0, i32 1
%.tmp2600 = load i8*, i8** %.tmp2599
%.tmp2602 = getelementptr [3 x i8], [3 x i8]*@.str2601, i32 0, i32 0
%.tmp2603 = call i32(i8*,i8*) @strcmp(i8* %.tmp2600, i8* %.tmp2602)
%.tmp2604 = icmp eq i32 %.tmp2603, 0
%.tmp2605 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2606 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2605, i32 0, i32 1
%.tmp2607 = load i8*, i8** %.tmp2606
%.tmp2609 = getelementptr [3 x i8], [3 x i8]*@.str2608, i32 0, i32 0
%.tmp2610 = call i32(i8*,i8*) @strcmp(i8* %.tmp2607, i8* %.tmp2609)
%.tmp2611 = icmp eq i32 %.tmp2610, 0
%.tmp2612 = or i1 %.tmp2604, %.tmp2611
br i1 %.tmp2612, label %.if.true.2613, label %.if.false.2613
.if.true.2613:
ret i32 6
br label %.if.end.2613
.if.false.2613:
%.tmp2614 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2615 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2614, i32 0, i32 1
%.tmp2616 = load i8*, i8** %.tmp2615
%.tmp2618 = getelementptr [2 x i8], [2 x i8]*@.str2617, i32 0, i32 0
%.tmp2619 = call i32(i8*,i8*) @strcmp(i8* %.tmp2616, i8* %.tmp2618)
%.tmp2620 = icmp eq i32 %.tmp2619, 0
%.tmp2621 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2622 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2621, i32 0, i32 1
%.tmp2623 = load i8*, i8** %.tmp2622
%.tmp2625 = getelementptr [2 x i8], [2 x i8]*@.str2624, i32 0, i32 0
%.tmp2626 = call i32(i8*,i8*) @strcmp(i8* %.tmp2623, i8* %.tmp2625)
%.tmp2627 = icmp eq i32 %.tmp2626, 0
%.tmp2628 = or i1 %.tmp2620, %.tmp2627
br i1 %.tmp2628, label %.if.true.2629, label %.if.false.2629
.if.true.2629:
ret i32 6
br label %.if.end.2629
.if.false.2629:
%.tmp2630 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2631 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2630, i32 0, i32 1
%.tmp2632 = load i8*, i8** %.tmp2631
%.tmp2634 = getelementptr [2 x i8], [2 x i8]*@.str2633, i32 0, i32 0
%.tmp2635 = call i32(i8*,i8*) @strcmp(i8* %.tmp2632, i8* %.tmp2634)
%.tmp2636 = icmp eq i32 %.tmp2635, 0
br i1 %.tmp2636, label %.if.true.2637, label %.if.false.2637
.if.true.2637:
ret i32 11
br label %.if.end.2637
.if.false.2637:
%.tmp2638 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2639 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2638, i32 0, i32 1
%.tmp2640 = load i8*, i8** %.tmp2639
%.tmp2642 = getelementptr [2 x i8], [2 x i8]*@.str2641, i32 0, i32 0
%.tmp2643 = call i32(i8*,i8*) @strcmp(i8* %.tmp2640, i8* %.tmp2642)
%.tmp2644 = icmp eq i32 %.tmp2643, 0
br i1 %.tmp2644, label %.if.true.2645, label %.if.false.2645
.if.true.2645:
ret i32 12
br label %.if.end.2645
.if.false.2645:
br label %.if.end.2645
.if.end.2645:
br label %.if.end.2637
.if.end.2637:
br label %.if.end.2629
.if.end.2629:
br label %.if.end.2613
.if.end.2613:
br label %.if.end.2597
.if.end.2597:
br label %.if.end.2581
.if.end.2581:
br label %.if.end.2557
.if.end.2557:
%.tmp2647 = getelementptr [65 x i8], [65 x i8]*@.str2646, i32 0, i32 0
%.tmp2648 = load %m980$.Node.type*, %m980$.Node.type** %op.2541
%.tmp2649 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2648, i32 0, i32 1
%.tmp2650 = load i8*, i8** %.tmp2649
%.tmp2651 = call i32(i8*,...) @printf(i8* %.tmp2647, i8* %.tmp2650)
ret i32 4
}
%m2652$.Type.type = type {i8*,i8*,i8*,%m2652$.Type.type*,%m2652$.Type.type*}
%m2652$.ErrorList.type = type {%m296$.Error.type*,%m2652$.ErrorList.type*,i1}
%m2652$.AssignableInfo.type = type {i8*,i8,i8*,i8*,%m2652$.Type.type*,i32,i32,i8*}
%m2652$.ScopeItem.type = type {i8*,%m2652$.AssignableInfo.type*,%m2652$.ScopeItem.type*}
%m2652$.Scope.type = type {i8*,%m2652$.ScopeItem.type*,i8*,i8*,i8*,%m2652$.Scope.type*,%m2652$.Type.type*}
%m2652$.GlobalName.type = type {i8*,i8*,i1,i1,%m2652$.AssignableInfo.type*,%m2652$.GlobalName.type*}
%m2652$.ModuleLookup.type = type {i8*,i8*,%m2652$.ModuleLookup.type*,%m2652$.Scope.type*}
%m2652$.AnonFn.type = type {i8*,%m2652$.AnonFn.type*}
%m2652$.CompilerCtx.type = type {%m980$.Node.type*,%m0$.File.type*,%m2652$.ErrorList.type*,%m2652$.GlobalName.type*,%m980$.Rule.type**,i32,%m2652$.ModuleLookup.type*,i8*,%m2652$.AnonFn.type*}
define i8* @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.Type.type* %.type.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%type = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.type.arg, %m2652$.Type.type** %type
%.tmp2654 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2655 = icmp eq %m2652$.Type.type* %.tmp2654, null
br i1 %.tmp2655, label %.if.true.2656, label %.if.false.2656
.if.true.2656:
%.tmp2658 = getelementptr [2 x i8], [2 x i8]*@.str2657, i32 0, i32 0
ret i8* %.tmp2658
br label %.if.end.2656
.if.false.2656:
br label %.if.end.2656
.if.end.2656:
%.tmp2659 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2660 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2659, i32 0, i32 0
%.tmp2661 = load i8*, i8** %.tmp2660
%.tmp2662 = icmp ne i8* %.tmp2661, null
%.tmp2664 = getelementptr [54 x i8], [54 x i8]*@.str2663, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2662, i8* %.tmp2664)
%buf.2665 = alloca i8*
store i8* null, i8** %buf.2665
%.tmp2666 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2667 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2666, i32 0, i32 0
%.tmp2668 = load i8*, i8** %.tmp2667
%.tmp2670 = getelementptr [4 x i8], [4 x i8]*@.str2669, i32 0, i32 0
%.tmp2671 = call i32(i8*,i8*) @strcmp(i8* %.tmp2668, i8* %.tmp2670)
%.tmp2672 = icmp eq i32 %.tmp2671, 0
br i1 %.tmp2672, label %.if.true.2673, label %.if.false.2673
.if.true.2673:
%.tmp2675 = getelementptr [4 x i8], [4 x i8]*@.str2674, i32 0, i32 0
ret i8* %.tmp2675
br label %.if.end.2673
.if.false.2673:
%.tmp2676 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2677 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2676, i32 0, i32 0
%.tmp2678 = load i8*, i8** %.tmp2677
%.tmp2680 = getelementptr [5 x i8], [5 x i8]*@.str2679, i32 0, i32 0
%.tmp2681 = call i32(i8*,i8*) @strcmp(i8* %.tmp2678, i8* %.tmp2680)
%.tmp2682 = icmp eq i32 %.tmp2681, 0
br i1 %.tmp2682, label %.if.true.2683, label %.if.false.2683
.if.true.2683:
%.tmp2685 = getelementptr [5 x i8], [5 x i8]*@.str2684, i32 0, i32 0
ret i8* %.tmp2685
br label %.if.end.2683
.if.false.2683:
%.tmp2686 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2687 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2686, i32 0, i32 0
%.tmp2688 = load i8*, i8** %.tmp2687
%.tmp2690 = getelementptr [5 x i8], [5 x i8]*@.str2689, i32 0, i32 0
%.tmp2691 = call i32(i8*,i8*) @strcmp(i8* %.tmp2688, i8* %.tmp2690)
%.tmp2692 = icmp eq i32 %.tmp2691, 0
br i1 %.tmp2692, label %.if.true.2693, label %.if.false.2693
.if.true.2693:
%.tmp2695 = getelementptr [3 x i8], [3 x i8]*@.str2694, i32 0, i32 0
ret i8* %.tmp2695
br label %.if.end.2693
.if.false.2693:
%.tmp2696 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2697 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2696, i32 0, i32 0
%.tmp2698 = load i8*, i8** %.tmp2697
%.tmp2700 = getelementptr [8 x i8], [8 x i8]*@.str2699, i32 0, i32 0
%.tmp2701 = call i32(i8*,i8*) @strcmp(i8* %.tmp2698, i8* %.tmp2700)
%.tmp2702 = icmp eq i32 %.tmp2701, 0
br i1 %.tmp2702, label %.if.true.2703, label %.if.false.2703
.if.true.2703:
%.tmp2705 = getelementptr [4 x i8], [4 x i8]*@.str2704, i32 0, i32 0
ret i8* %.tmp2705
br label %.if.end.2703
.if.false.2703:
%.tmp2706 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2707 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2706, i32 0, i32 0
%.tmp2708 = load i8*, i8** %.tmp2707
%.tmp2710 = getelementptr [4 x i8], [4 x i8]*@.str2709, i32 0, i32 0
%.tmp2711 = call i32(i8*,i8*) @strcmp(i8* %.tmp2708, i8* %.tmp2710)
%.tmp2712 = icmp eq i32 %.tmp2711, 0
br i1 %.tmp2712, label %.if.true.2713, label %.if.false.2713
.if.true.2713:
%.tmp2715 = getelementptr [3 x i8], [3 x i8]*@.str2714, i32 0, i32 0
ret i8* %.tmp2715
br label %.if.end.2713
.if.false.2713:
%.tmp2716 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2717 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2716, i32 0, i32 0
%.tmp2718 = load i8*, i8** %.tmp2717
%.tmp2720 = getelementptr [9 x i8], [9 x i8]*@.str2719, i32 0, i32 0
%.tmp2721 = call i32(i8*,i8*) @strcmp(i8* %.tmp2718, i8* %.tmp2720)
%.tmp2722 = icmp eq i32 %.tmp2721, 0
br i1 %.tmp2722, label %.if.true.2723, label %.if.false.2723
.if.true.2723:
%.tmp2724 = getelementptr i8*, i8** %buf.2665, i32 0
%.tmp2726 = getelementptr [4 x i8], [4 x i8]*@.str2725, i32 0, i32 0
%.tmp2727 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp2728 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2729 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2728, i32 0, i32 3
%.tmp2730 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2729
%.tmp2731 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp2727, %m2652$.Type.type* %.tmp2730)
%.tmp2732 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2724, i8* %.tmp2726, i8* %.tmp2731)
%.tmp2734 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2735 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2734, i32 0, i32 3
%.tmp2736 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2735
%.tmp2737 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2736, i32 0, i32 4
%.tmp2738 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2737
%p.2739 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp2738, %m2652$.Type.type** %p.2739
br label %.for.start.2733
.for.start.2733:
%.tmp2740 = load %m2652$.Type.type*, %m2652$.Type.type** %p.2739
%.tmp2741 = icmp ne %m2652$.Type.type* %.tmp2740, null
br i1 %.tmp2741, label %.for.continue.2733, label %.for.end.2733
.for.continue.2733:
%.tmp2742 = load %m2652$.Type.type*, %m2652$.Type.type** %p.2739
%.tmp2743 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2744 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2743, i32 0, i32 3
%.tmp2745 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2744
%.tmp2746 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2745, i32 0, i32 4
%.tmp2747 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2746
%.tmp2748 = icmp ne %m2652$.Type.type* %.tmp2742, %.tmp2747
br i1 %.tmp2748, label %.if.true.2749, label %.if.false.2749
.if.true.2749:
%.tmp2750 = getelementptr i8*, i8** %buf.2665, i32 0
%.tmp2752 = getelementptr [4 x i8], [4 x i8]*@.str2751, i32 0, i32 0
%.tmp2753 = load i8*, i8** %buf.2665
%.tmp2754 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2750, i8* %.tmp2752, i8* %.tmp2753)
br label %.if.end.2749
.if.false.2749:
br label %.if.end.2749
.if.end.2749:
%.tmp2755 = getelementptr i8*, i8** %buf.2665, i32 0
%.tmp2757 = getelementptr [5 x i8], [5 x i8]*@.str2756, i32 0, i32 0
%.tmp2758 = load i8*, i8** %buf.2665
%.tmp2759 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp2760 = load %m2652$.Type.type*, %m2652$.Type.type** %p.2739
%.tmp2761 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp2759, %m2652$.Type.type* %.tmp2760)
%.tmp2762 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2755, i8* %.tmp2757, i8* %.tmp2758, i8* %.tmp2761)
%.tmp2763 = load %m2652$.Type.type*, %m2652$.Type.type** %p.2739
%.tmp2764 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2763, i32 0, i32 4
%.tmp2765 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2764
store %m2652$.Type.type* %.tmp2765, %m2652$.Type.type** %p.2739
br label %.for.start.2733
.for.end.2733:
%.tmp2766 = getelementptr i8*, i8** %buf.2665, i32 0
%.tmp2768 = getelementptr [4 x i8], [4 x i8]*@.str2767, i32 0, i32 0
%.tmp2769 = load i8*, i8** %buf.2665
%.tmp2770 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2766, i8* %.tmp2768, i8* %.tmp2769)
%.tmp2771 = load i8*, i8** %buf.2665
ret i8* %.tmp2771
br label %.if.end.2723
.if.false.2723:
%.tmp2772 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2773 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2772, i32 0, i32 0
%.tmp2774 = load i8*, i8** %.tmp2773
%.tmp2776 = getelementptr [4 x i8], [4 x i8]*@.str2775, i32 0, i32 0
%.tmp2777 = call i32(i8*,i8*) @strcmp(i8* %.tmp2774, i8* %.tmp2776)
%.tmp2778 = icmp eq i32 %.tmp2777, 0
br i1 %.tmp2778, label %.if.true.2779, label %.if.false.2779
.if.true.2779:
%.tmp2780 = getelementptr i8*, i8** %buf.2665, i32 0
%.tmp2782 = getelementptr [4 x i8], [4 x i8]*@.str2781, i32 0, i32 0
%.tmp2783 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp2784 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2785 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2784, i32 0, i32 3
%.tmp2786 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2785
%.tmp2787 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp2783, %m2652$.Type.type* %.tmp2786)
%.tmp2788 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2780, i8* %.tmp2782, i8* %.tmp2787)
%.tmp2789 = load i8*, i8** %buf.2665
ret i8* %.tmp2789
br label %.if.end.2779
.if.false.2779:
%.tmp2790 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2791 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2790, i32 0, i32 0
%.tmp2792 = load i8*, i8** %.tmp2791
%.tmp2794 = getelementptr [7 x i8], [7 x i8]*@.str2793, i32 0, i32 0
%.tmp2795 = call i32(i8*,i8*) @strcmp(i8* %.tmp2792, i8* %.tmp2794)
%.tmp2796 = icmp eq i32 %.tmp2795, 0
br i1 %.tmp2796, label %.if.true.2797, label %.if.false.2797
.if.true.2797:
%.tmp2798 = getelementptr i8*, i8** %buf.2665, i32 0
%.tmp2800 = getelementptr [2 x i8], [2 x i8]*@.str2799, i32 0, i32 0
%.tmp2801 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2798, i8* %.tmp2800)
%.tmp2803 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2804 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2803, i32 0, i32 3
%.tmp2805 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2804
%t.2806 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp2805, %m2652$.Type.type** %t.2806
br label %.for.start.2802
.for.start.2802:
%.tmp2807 = load %m2652$.Type.type*, %m2652$.Type.type** %t.2806
%.tmp2808 = icmp ne %m2652$.Type.type* %.tmp2807, null
br i1 %.tmp2808, label %.for.continue.2802, label %.for.end.2802
.for.continue.2802:
%.tmp2809 = load %m2652$.Type.type*, %m2652$.Type.type** %t.2806
%.tmp2810 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2811 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2810, i32 0, i32 3
%.tmp2812 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2811
%.tmp2813 = icmp ne %m2652$.Type.type* %.tmp2809, %.tmp2812
br i1 %.tmp2813, label %.if.true.2814, label %.if.false.2814
.if.true.2814:
%.tmp2815 = getelementptr i8*, i8** %buf.2665, i32 0
%.tmp2817 = getelementptr [4 x i8], [4 x i8]*@.str2816, i32 0, i32 0
%.tmp2818 = load i8*, i8** %buf.2665
%.tmp2819 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2815, i8* %.tmp2817, i8* %.tmp2818)
br label %.if.end.2814
.if.false.2814:
br label %.if.end.2814
.if.end.2814:
%.tmp2820 = getelementptr i8*, i8** %buf.2665, i32 0
%.tmp2822 = getelementptr [5 x i8], [5 x i8]*@.str2821, i32 0, i32 0
%.tmp2823 = load i8*, i8** %buf.2665
%.tmp2824 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp2825 = load %m2652$.Type.type*, %m2652$.Type.type** %t.2806
%.tmp2826 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp2824, %m2652$.Type.type* %.tmp2825)
%.tmp2827 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2820, i8* %.tmp2822, i8* %.tmp2823, i8* %.tmp2826)
%.tmp2828 = load %m2652$.Type.type*, %m2652$.Type.type** %t.2806
%.tmp2829 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2828, i32 0, i32 4
%.tmp2830 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2829
store %m2652$.Type.type* %.tmp2830, %m2652$.Type.type** %t.2806
br label %.for.start.2802
.for.end.2802:
%.tmp2831 = getelementptr i8*, i8** %buf.2665, i32 0
%.tmp2833 = getelementptr [4 x i8], [4 x i8]*@.str2832, i32 0, i32 0
%.tmp2834 = load i8*, i8** %buf.2665
%.tmp2835 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2831, i8* %.tmp2833, i8* %.tmp2834)
%.tmp2836 = load i8*, i8** %buf.2665
ret i8* %.tmp2836
br label %.if.end.2797
.if.false.2797:
%.tmp2837 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2838 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2837, i32 0, i32 0
%.tmp2839 = load i8*, i8** %.tmp2838
%.tmp2841 = getelementptr [6 x i8], [6 x i8]*@.str2840, i32 0, i32 0
%.tmp2842 = call i32(i8*,i8*) @strcmp(i8* %.tmp2839, i8* %.tmp2841)
%.tmp2843 = icmp eq i32 %.tmp2842, 0
br i1 %.tmp2843, label %.if.true.2844, label %.if.false.2844
.if.true.2844:
%.tmp2845 = getelementptr i8*, i8** %buf.2665, i32 0
%.tmp2847 = getelementptr [10 x i8], [10 x i8]*@.str2846, i32 0, i32 0
%.tmp2848 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2849 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2848, i32 0, i32 3
%.tmp2850 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2849
%.tmp2851 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2850, i32 0, i32 4
%.tmp2852 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2851
%.tmp2853 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2852, i32 0, i32 0
%.tmp2854 = load i8*, i8** %.tmp2853
%.tmp2855 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp2856 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2857 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2856, i32 0, i32 3
%.tmp2858 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2857
%.tmp2859 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp2855, %m2652$.Type.type* %.tmp2858)
%.tmp2860 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2845, i8* %.tmp2847, i8* %.tmp2854, i8* %.tmp2859)
%.tmp2861 = load i8*, i8** %buf.2665
ret i8* %.tmp2861
br label %.if.end.2844
.if.false.2844:
%.tmp2862 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2863 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2862, i32 0, i32 0
%.tmp2864 = load i8*, i8** %.tmp2863
%.tmp2866 = getelementptr [10 x i8], [10 x i8]*@.str2865, i32 0, i32 0
%.tmp2867 = call i32(i8*,i8*) @strcmp(i8* %.tmp2864, i8* %.tmp2866)
%.tmp2868 = icmp eq i32 %.tmp2867, 0
br i1 %.tmp2868, label %.if.true.2869, label %.if.false.2869
.if.true.2869:
%.tmp2870 = getelementptr i8*, i8** %buf.2665, i32 0
%.tmp2872 = getelementptr [5 x i8], [5 x i8]*@.str2871, i32 0, i32 0
%.tmp2873 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2874 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2873, i32 0, i32 2
%.tmp2875 = load i8*, i8** %.tmp2874
%.tmp2876 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2870, i8* %.tmp2872, i8* %.tmp2875)
%.tmp2877 = load i8*, i8** %buf.2665
ret i8* %.tmp2877
br label %.if.end.2869
.if.false.2869:
%.tmp2878 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2879 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2878, i32 0, i32 0
%.tmp2880 = load i8*, i8** %.tmp2879
%.tmp2882 = getelementptr [7 x i8], [7 x i8]*@.str2881, i32 0, i32 0
%.tmp2883 = call i32(i8*,i8*) @strcmp(i8* %.tmp2880, i8* %.tmp2882)
%.tmp2884 = icmp eq i32 %.tmp2883, 0
br i1 %.tmp2884, label %.if.true.2885, label %.if.false.2885
.if.true.2885:
%.tmp2887 = getelementptr [4 x i8], [4 x i8]*@.str2886, i32 0, i32 0
ret i8* %.tmp2887
br label %.if.end.2885
.if.false.2885:
%.tmp2888 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2889 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2888, i32 0, i32 0
%.tmp2890 = load i8*, i8** %.tmp2889
%.tmp2892 = getelementptr [6 x i8], [6 x i8]*@.str2891, i32 0, i32 0
%.tmp2893 = call i32(i8*,i8*) @strcmp(i8* %.tmp2890, i8* %.tmp2892)
%.tmp2894 = icmp eq i32 %.tmp2893, 0
br i1 %.tmp2894, label %.if.true.2895, label %.if.false.2895
.if.true.2895:
br label %.if.end.2895
.if.false.2895:
%.tmp2897 = getelementptr [53 x i8], [53 x i8]*@.str2896, i32 0, i32 0
%.tmp2898 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp2899 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2898, i32 0, i32 0
%.tmp2900 = load i8*, i8** %.tmp2899
%.tmp2901 = call i32(i8*,...) @printf(i8* %.tmp2897, i8* %.tmp2900)
br label %.if.end.2895
.if.end.2895:
br label %.if.end.2885
.if.end.2885:
br label %.if.end.2869
.if.end.2869:
br label %.if.end.2844
.if.end.2844:
br label %.if.end.2797
.if.end.2797:
br label %.if.end.2779
.if.end.2779:
br label %.if.end.2723
.if.end.2723:
br label %.if.end.2713
.if.end.2713:
br label %.if.end.2703
.if.end.2703:
br label %.if.end.2693
.if.end.2693:
br label %.if.end.2683
.if.end.2683:
br label %.if.end.2673
.if.end.2673:
%.tmp2902 = bitcast ptr null to i8*
ret i8* %.tmp2902
}
define i1 @m2653$cmp.b.m2652$.CompilerCtx.typep.m2652$.Type.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.Type.type* %.a.arg, %m2652$.Type.type* %.b.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%a = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.a.arg, %m2652$.Type.type** %a
%b = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.b.arg, %m2652$.Type.type** %b
%.tmp2903 = load %m2652$.Type.type*, %m2652$.Type.type** %a
%.tmp2904 = icmp eq %m2652$.Type.type* %.tmp2903, null
%.tmp2905 = load %m2652$.Type.type*, %m2652$.Type.type** %b
%.tmp2906 = icmp eq %m2652$.Type.type* %.tmp2905, null
%.tmp2907 = or i1 %.tmp2904, %.tmp2906
br i1 %.tmp2907, label %.if.true.2908, label %.if.false.2908
.if.true.2908:
ret i1 0
br label %.if.end.2908
.if.false.2908:
br label %.if.end.2908
.if.end.2908:
%.tmp2909 = load %m2652$.Type.type*, %m2652$.Type.type** %a
%.tmp2910 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2909, i32 0, i32 0
%.tmp2911 = load i8*, i8** %.tmp2910
%.tmp2913 = getelementptr [8 x i8], [8 x i8]*@.str2912, i32 0, i32 0
%.tmp2914 = call i32(i8*,i8*) @strcmp(i8* %.tmp2911, i8* %.tmp2913)
%.tmp2915 = icmp eq i32 %.tmp2914, 0
%.tmp2916 = load %m2652$.Type.type*, %m2652$.Type.type** %b
%.tmp2917 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2916, i32 0, i32 0
%.tmp2918 = load i8*, i8** %.tmp2917
%.tmp2920 = getelementptr [8 x i8], [8 x i8]*@.str2919, i32 0, i32 0
%.tmp2921 = call i32(i8*,i8*) @strcmp(i8* %.tmp2918, i8* %.tmp2920)
%.tmp2922 = icmp eq i32 %.tmp2921, 0
%.tmp2923 = or i1 %.tmp2915, %.tmp2922
br i1 %.tmp2923, label %.if.true.2924, label %.if.false.2924
.if.true.2924:
%.tmp2925 = load %m2652$.Type.type*, %m2652$.Type.type** %a
%.tmp2926 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2925, i32 0, i32 0
%.tmp2927 = load i8*, i8** %.tmp2926
%.tmp2929 = getelementptr [4 x i8], [4 x i8]*@.str2928, i32 0, i32 0
%.tmp2930 = call i32(i8*,i8*) @strcmp(i8* %.tmp2927, i8* %.tmp2929)
%.tmp2931 = icmp eq i32 %.tmp2930, 0
%.tmp2932 = load %m2652$.Type.type*, %m2652$.Type.type** %b
%.tmp2933 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2932, i32 0, i32 0
%.tmp2934 = load i8*, i8** %.tmp2933
%.tmp2936 = getelementptr [4 x i8], [4 x i8]*@.str2935, i32 0, i32 0
%.tmp2937 = call i32(i8*,i8*) @strcmp(i8* %.tmp2934, i8* %.tmp2936)
%.tmp2938 = icmp eq i32 %.tmp2937, 0
%.tmp2939 = or i1 %.tmp2931, %.tmp2938
ret i1 %.tmp2939
br label %.if.end.2924
.if.false.2924:
br label %.if.end.2924
.if.end.2924:
%.tmp2940 = load %m2652$.Type.type*, %m2652$.Type.type** %a
%.tmp2941 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2940, i32 0, i32 0
%.tmp2942 = load i8*, i8** %.tmp2941
%.tmp2944 = getelementptr [10 x i8], [10 x i8]*@.str2943, i32 0, i32 0
%.tmp2945 = call i32(i8*,i8*) @strcmp(i8* %.tmp2942, i8* %.tmp2944)
%.tmp2946 = icmp eq i32 %.tmp2945, 0
br i1 %.tmp2946, label %.if.true.2947, label %.if.false.2947
.if.true.2947:
%.tmp2948 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp2949 = load %m2652$.Type.type*, %m2652$.Type.type** %a
%.tmp2950 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2949, i32 0, i32 3
%.tmp2951 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2950
%.tmp2952 = load %m2652$.Type.type*, %m2652$.Type.type** %b
%.tmp2953 = call i1(%m2652$.CompilerCtx.type*,%m2652$.Type.type*,%m2652$.Type.type*) @m2653$cmp.b.m2652$.CompilerCtx.typep.m2652$.Type.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp2948, %m2652$.Type.type* %.tmp2951, %m2652$.Type.type* %.tmp2952)
ret i1 %.tmp2953
br label %.if.end.2947
.if.false.2947:
br label %.if.end.2947
.if.end.2947:
%.tmp2954 = load %m2652$.Type.type*, %m2652$.Type.type** %b
%.tmp2955 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2954, i32 0, i32 0
%.tmp2956 = load i8*, i8** %.tmp2955
%.tmp2958 = getelementptr [10 x i8], [10 x i8]*@.str2957, i32 0, i32 0
%.tmp2959 = call i32(i8*,i8*) @strcmp(i8* %.tmp2956, i8* %.tmp2958)
%.tmp2960 = icmp eq i32 %.tmp2959, 0
br i1 %.tmp2960, label %.if.true.2961, label %.if.false.2961
.if.true.2961:
%.tmp2962 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp2963 = load %m2652$.Type.type*, %m2652$.Type.type** %a
%.tmp2964 = load %m2652$.Type.type*, %m2652$.Type.type** %b
%.tmp2965 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2964, i32 0, i32 3
%.tmp2966 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2965
%.tmp2967 = call i1(%m2652$.CompilerCtx.type*,%m2652$.Type.type*,%m2652$.Type.type*) @m2653$cmp.b.m2652$.CompilerCtx.typep.m2652$.Type.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp2962, %m2652$.Type.type* %.tmp2963, %m2652$.Type.type* %.tmp2966)
ret i1 %.tmp2967
br label %.if.end.2961
.if.false.2961:
br label %.if.end.2961
.if.end.2961:
%.tmp2968 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp2969 = load %m2652$.Type.type*, %m2652$.Type.type** %a
%.tmp2970 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp2968, %m2652$.Type.type* %.tmp2969)
%a_repr.2971 = alloca i8*
store i8* %.tmp2970, i8** %a_repr.2971
%.tmp2972 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp2973 = load %m2652$.Type.type*, %m2652$.Type.type** %b
%.tmp2974 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp2972, %m2652$.Type.type* %.tmp2973)
%b_repr.2975 = alloca i8*
store i8* %.tmp2974, i8** %b_repr.2975
%.tmp2976 = load i8*, i8** %a_repr.2971
%.tmp2977 = load i8*, i8** %b_repr.2975
%.tmp2978 = call i32(i8*,i8*) @strcmp(i8* %.tmp2976, i8* %.tmp2977)
%.tmp2979 = icmp eq i32 %.tmp2978, 0
ret i1 %.tmp2979
}
@DEBUG_INTERNALS = constant i1 0
define %m2652$.Type.type* @m295$type_clone.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.t.arg) {
%t = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.t.arg, %m2652$.Type.type** %t
%.tmp2980 = load %m2652$.Type.type*, %m2652$.Type.type** %t
%.tmp2981 = icmp eq %m2652$.Type.type* %.tmp2980, null
br i1 %.tmp2981, label %.if.true.2982, label %.if.false.2982
.if.true.2982:
%.tmp2983 = bitcast ptr null to %m2652$.Type.type*
ret %m2652$.Type.type* %.tmp2983
br label %.if.end.2982
.if.false.2982:
br label %.if.end.2982
.if.end.2982:
%.tmp2984 = getelementptr %m2652$.Type.type, %m2652$.Type.type* null, i32 1
%.tmp2985 = ptrtoint %m2652$.Type.type* %.tmp2984 to i32
%.tmp2986 = call i8*(i32) @malloc(i32 %.tmp2985)
%.tmp2987 = bitcast i8* %.tmp2986 to %m2652$.Type.type*
%clone.2988 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp2987, %m2652$.Type.type** %clone.2988
%.tmp2989 = load %m2652$.Type.type*, %m2652$.Type.type** %clone.2988
%.tmp2990 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2989, i32 0, i32 3
%.tmp2991 = load %m2652$.Type.type*, %m2652$.Type.type** %t
%.tmp2992 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2991, i32 0, i32 3
%.tmp2993 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2992
store %m2652$.Type.type* %.tmp2993, %m2652$.Type.type** %.tmp2990
%.tmp2994 = load %m2652$.Type.type*, %m2652$.Type.type** %clone.2988
%.tmp2995 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2994, i32 0, i32 4
%.tmp2996 = load %m2652$.Type.type*, %m2652$.Type.type** %t
%.tmp2997 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp2996, i32 0, i32 4
%.tmp2998 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp2997
%.tmp2999 = call %m2652$.Type.type*(%m2652$.Type.type*) @m295$type_clone.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.tmp2998)
store %m2652$.Type.type* %.tmp2999, %m2652$.Type.type** %.tmp2995
%.tmp3000 = load %m2652$.Type.type*, %m2652$.Type.type** %clone.2988
%.tmp3001 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3000, i32 0, i32 2
%.tmp3002 = load %m2652$.Type.type*, %m2652$.Type.type** %t
%.tmp3003 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3002, i32 0, i32 2
%.tmp3004 = load i8*, i8** %.tmp3003
store i8* %.tmp3004, i8** %.tmp3001
%.tmp3005 = load %m2652$.Type.type*, %m2652$.Type.type** %clone.2988
%.tmp3006 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3005, i32 0, i32 0
%.tmp3007 = load %m2652$.Type.type*, %m2652$.Type.type** %t
%.tmp3008 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3007, i32 0, i32 0
%.tmp3009 = load i8*, i8** %.tmp3008
store i8* %.tmp3009, i8** %.tmp3006
%.tmp3010 = load %m2652$.Type.type*, %m2652$.Type.type** %clone.2988
%.tmp3011 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3010, i32 0, i32 1
%.tmp3012 = load %m2652$.Type.type*, %m2652$.Type.type** %t
%.tmp3013 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3012, i32 0, i32 1
%.tmp3014 = load i8*, i8** %.tmp3013
store i8* %.tmp3014, i8** %.tmp3011
%.tmp3015 = load %m2652$.Type.type*, %m2652$.Type.type** %clone.2988
ret %m2652$.Type.type* %.tmp3015
}
define i8* @m295$get_root.cp() {
%.tmp3017 = getelementptr [12 x i8], [12 x i8]*@.str3016, i32 0, i32 0
%.tmp3018 = call i8*(i8*) @getenv(i8* %.tmp3017)
%project_root.3019 = alloca i8*
store i8* %.tmp3018, i8** %project_root.3019
%.tmp3020 = load i8*, i8** %project_root.3019
%.tmp3021 = icmp eq i8* %.tmp3020, null
br i1 %.tmp3021, label %.if.true.3022, label %.if.false.3022
.if.true.3022:
%.tmp3024 = getelementptr [5 x i8], [5 x i8]*@.str3023, i32 0, i32 0
%.tmp3025 = call i8*(i8*) @getenv(i8* %.tmp3024)
%home.3026 = alloca i8*
store i8* %.tmp3025, i8** %home.3026
%.tmp3027 = getelementptr i8*, i8** %project_root.3019, i32 0
%.tmp3029 = getelementptr [11 x i8], [11 x i8]*@.str3028, i32 0, i32 0
%.tmp3030 = load i8*, i8** %home.3026
%.tmp3031 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3027, i8* %.tmp3029, i8* %.tmp3030)
br label %.if.end.3022
.if.false.3022:
br label %.if.end.3022
.if.end.3022:
%.tmp3032 = load i8*, i8** %project_root.3019
ret i8* %.tmp3032
}
define %m2652$.Type.type* @m295$new_type.m2652$.Type.typep() {
%.tmp3033 = getelementptr %m2652$.Type.type, %m2652$.Type.type* null, i32 1
%.tmp3034 = ptrtoint %m2652$.Type.type* %.tmp3033 to i32
%.tmp3035 = call i8*(i32) @malloc(i32 %.tmp3034)
%.tmp3036 = bitcast i8* %.tmp3035 to %m2652$.Type.type*
%type.3037 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp3036, %m2652$.Type.type** %type.3037
%.tmp3038 = load %m2652$.Type.type*, %m2652$.Type.type** %type.3037
%.tmp3039 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3038, i32 0, i32 1
store i8* null, i8** %.tmp3039
%.tmp3040 = load %m2652$.Type.type*, %m2652$.Type.type** %type.3037
%.tmp3041 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3040, i32 0, i32 2
store i8* null, i8** %.tmp3041
%.tmp3042 = load %m2652$.Type.type*, %m2652$.Type.type** %type.3037
%.tmp3043 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3042, i32 0, i32 0
store i8* null, i8** %.tmp3043
%.tmp3044 = load %m2652$.Type.type*, %m2652$.Type.type** %type.3037
%.tmp3045 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3044, i32 0, i32 3
store %m2652$.Type.type* null, %m2652$.Type.type** %.tmp3045
%.tmp3046 = load %m2652$.Type.type*, %m2652$.Type.type** %type.3037
%.tmp3047 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3046, i32 0, i32 4
store %m2652$.Type.type* null, %m2652$.Type.type** %.tmp3047
%.tmp3048 = load %m2652$.Type.type*, %m2652$.Type.type** %type.3037
ret %m2652$.Type.type* %.tmp3048
}
define void @m295$copy_type.v.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.dest.arg, %m2652$.Type.type* %.src.arg) {
%dest = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.dest.arg, %m2652$.Type.type** %dest
%src = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.src.arg, %m2652$.Type.type** %src
%.tmp3049 = load %m2652$.Type.type*, %m2652$.Type.type** %dest
%.tmp3050 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3049, i32 0, i32 0
%.tmp3051 = load %m2652$.Type.type*, %m2652$.Type.type** %src
%.tmp3052 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3051, i32 0, i32 0
%.tmp3053 = load i8*, i8** %.tmp3052
store i8* %.tmp3053, i8** %.tmp3050
%.tmp3054 = load %m2652$.Type.type*, %m2652$.Type.type** %dest
%.tmp3055 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3054, i32 0, i32 1
%.tmp3056 = load %m2652$.Type.type*, %m2652$.Type.type** %src
%.tmp3057 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3056, i32 0, i32 1
%.tmp3058 = load i8*, i8** %.tmp3057
store i8* %.tmp3058, i8** %.tmp3055
%.tmp3059 = load %m2652$.Type.type*, %m2652$.Type.type** %dest
%.tmp3060 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3059, i32 0, i32 2
%.tmp3061 = load %m2652$.Type.type*, %m2652$.Type.type** %src
%.tmp3062 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3061, i32 0, i32 2
%.tmp3063 = load i8*, i8** %.tmp3062
store i8* %.tmp3063, i8** %.tmp3060
%.tmp3064 = load %m2652$.Type.type*, %m2652$.Type.type** %dest
%.tmp3065 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3064, i32 0, i32 3
%.tmp3066 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3065
%.tmp3067 = load %m2652$.Type.type*, %m2652$.Type.type** %src
%.tmp3068 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3067, i32 0, i32 3
%.tmp3069 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3068
%.tmp3070 = icmp ne %m2652$.Type.type* %.tmp3066, %.tmp3069
br i1 %.tmp3070, label %.if.true.3071, label %.if.false.3071
.if.true.3071:
%.tmp3072 = load %m2652$.Type.type*, %m2652$.Type.type** %dest
%.tmp3073 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3072, i32 0, i32 3
%.tmp3074 = load %m2652$.Type.type*, %m2652$.Type.type** %src
%.tmp3075 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3074, i32 0, i32 3
%.tmp3076 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3075
store %m2652$.Type.type* %.tmp3076, %m2652$.Type.type** %.tmp3073
%.tmp3077 = load %m2652$.Type.type*, %m2652$.Type.type** %dest
%.tmp3078 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3077, i32 0, i32 3
%.tmp3079 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3078
%.tmp3080 = load %m2652$.Type.type*, %m2652$.Type.type** %src
%.tmp3081 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3080, i32 0, i32 3
%.tmp3082 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3081
call void(%m2652$.Type.type*,%m2652$.Type.type*) @m295$copy_type.v.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.tmp3079, %m2652$.Type.type* %.tmp3082)
br label %.if.end.3071
.if.false.3071:
br label %.if.end.3071
.if.end.3071:
%.tmp3083 = load %m2652$.Type.type*, %m2652$.Type.type** %dest
%.tmp3084 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3083, i32 0, i32 4
%.tmp3085 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3084
%.tmp3086 = load %m2652$.Type.type*, %m2652$.Type.type** %src
%.tmp3087 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3086, i32 0, i32 4
%.tmp3088 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3087
%.tmp3089 = icmp ne %m2652$.Type.type* %.tmp3085, %.tmp3088
br i1 %.tmp3089, label %.if.true.3090, label %.if.false.3090
.if.true.3090:
%.tmp3091 = load %m2652$.Type.type*, %m2652$.Type.type** %dest
%.tmp3092 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3091, i32 0, i32 4
%.tmp3093 = load %m2652$.Type.type*, %m2652$.Type.type** %src
%.tmp3094 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3093, i32 0, i32 4
%.tmp3095 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3094
store %m2652$.Type.type* %.tmp3095, %m2652$.Type.type** %.tmp3092
%.tmp3096 = load %m2652$.Type.type*, %m2652$.Type.type** %dest
%.tmp3097 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3096, i32 0, i32 4
%.tmp3098 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3097
%.tmp3099 = load %m2652$.Type.type*, %m2652$.Type.type** %src
%.tmp3100 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3099, i32 0, i32 4
%.tmp3101 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3100
call void(%m2652$.Type.type*,%m2652$.Type.type*) @m295$copy_type.v.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.tmp3098, %m2652$.Type.type* %.tmp3101)
br label %.if.end.3090
.if.false.3090:
br label %.if.end.3090
.if.end.3090:
ret void
}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m2652$.AssignableInfo.type* @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.node.arg) {
%node = alloca %m980$.Node.type*
store %m980$.Node.type* %.node.arg, %m980$.Node.type** %node
%.tmp3102 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* null, i32 1
%.tmp3103 = ptrtoint %m2652$.AssignableInfo.type* %.tmp3102 to i32
%.tmp3104 = call i8*(i32) @malloc(i32 %.tmp3103)
%.tmp3105 = bitcast i8* %.tmp3104 to %m2652$.AssignableInfo.type*
%ptr.3106 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp3105, %m2652$.AssignableInfo.type** %ptr.3106
%.tmp3107 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %ptr.3106
%.tmp3108 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3107, i32 0, i32 1
%.tmp3109 = load i8, i8* @SCOPE_CONST
store i8 %.tmp3109, i8* %.tmp3108
%.tmp3110 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %ptr.3106
%.tmp3111 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3110, i32 0, i32 0
store i8* null, i8** %.tmp3111
%.tmp3112 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %ptr.3106
%.tmp3113 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3112, i32 0, i32 3
store i8* null, i8** %.tmp3113
%.tmp3114 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %ptr.3106
%.tmp3115 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3114, i32 0, i32 2
%.tmp3117 = getelementptr [1 x i8], [1 x i8]*@.str3116, i32 0, i32 0
store i8* %.tmp3117, i8** %.tmp3115
%.tmp3118 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %ptr.3106
%.tmp3119 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3118, i32 0, i32 4
store %m2652$.Type.type* null, %m2652$.Type.type** %.tmp3119
%.tmp3120 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp3121 = icmp ne %m980$.Node.type* %.tmp3120, null
br i1 %.tmp3121, label %.if.true.3122, label %.if.false.3122
.if.true.3122:
%.tmp3123 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %ptr.3106
%.tmp3124 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3123, i32 0, i32 5
%.tmp3125 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp3126 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3125, i32 0, i32 3
%.tmp3127 = load i32, i32* %.tmp3126
store i32 %.tmp3127, i32* %.tmp3124
%.tmp3128 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %ptr.3106
%.tmp3129 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3128, i32 0, i32 6
%.tmp3130 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp3131 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3130, i32 0, i32 4
%.tmp3132 = load i32, i32* %.tmp3131
store i32 %.tmp3132, i32* %.tmp3129
%.tmp3133 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %ptr.3106
%.tmp3134 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3133, i32 0, i32 7
%.tmp3135 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp3136 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3135, i32 0, i32 2
%.tmp3137 = load i8*, i8** %.tmp3136
store i8* %.tmp3137, i8** %.tmp3134
br label %.if.end.3122
.if.false.3122:
%.tmp3138 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %ptr.3106
%.tmp3139 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3138, i32 0, i32 5
store i32 0, i32* %.tmp3139
%.tmp3140 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %ptr.3106
%.tmp3141 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3140, i32 0, i32 6
store i32 0, i32* %.tmp3141
%.tmp3142 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %ptr.3106
%.tmp3143 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3142, i32 0, i32 7
store i8* null, i8** %.tmp3143
br label %.if.end.3122
.if.end.3122:
%.tmp3144 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %ptr.3106
ret %m2652$.AssignableInfo.type* %.tmp3144
}
define void @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.info.arg, %m2652$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp3145 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp3146 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3145, i32 0, i32 0
%.tmp3147 = load i8*, i8** %id
store i8* %.tmp3147, i8** %.tmp3146
%.tmp3148 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp3149 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3148, i32 0, i32 1
%.tmp3150 = load i8, i8* %scope
store i8 %.tmp3150, i8* %.tmp3149
ret void
}
define i8* @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.info.arg) {
%info = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.info.arg, %m2652$.AssignableInfo.type** %info
%.tmp3151 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp3152 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3151, i32 0, i32 1
%.tmp3153 = load i8, i8* %.tmp3152
%.tmp3154 = load i8, i8* @SCOPE_CONST
%.tmp3155 = icmp eq i8 %.tmp3153, %.tmp3154
br i1 %.tmp3155, label %.if.true.3156, label %.if.false.3156
.if.true.3156:
%.tmp3157 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp3158 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3157, i32 0, i32 0
%.tmp3159 = load i8*, i8** %.tmp3158
ret i8* %.tmp3159
br label %.if.end.3156
.if.false.3156:
br label %.if.end.3156
.if.end.3156:
%buf.3160 = alloca i8*
store i8* null, i8** %buf.3160
%.tmp3161 = getelementptr i8*, i8** %buf.3160, i32 0
%.tmp3163 = getelementptr [5 x i8], [5 x i8]*@.str3162, i32 0, i32 0
%.tmp3164 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp3165 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3164, i32 0, i32 1
%.tmp3166 = load i8, i8* %.tmp3165
%.tmp3167 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp3168 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3167, i32 0, i32 0
%.tmp3169 = load i8*, i8** %.tmp3168
%.tmp3170 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3161, i8* %.tmp3163, i8 %.tmp3166, i8* %.tmp3169)
%.tmp3171 = load i8*, i8** %buf.3160
ret i8* %.tmp3171
}
define void @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%info = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.info.arg, %m2652$.AssignableInfo.type** %info
%tmp_buff.3172 = alloca i8*
store i8* null, i8** %tmp_buff.3172
%.tmp3173 = getelementptr i8*, i8** %tmp_buff.3172, i32 0
%.tmp3175 = getelementptr [7 x i8], [7 x i8]*@.str3174, i32 0, i32 0
%.tmp3176 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3177 = call i32(%m2652$.CompilerCtx.type*) @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp3176)
%.tmp3178 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3173, i8* %.tmp3175, i32 %.tmp3177)
%.tmp3179 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp3180 = load i8, i8* @SCOPE_LOCAL
%.tmp3181 = load i8*, i8** %tmp_buff.3172
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp3179, i8 %.tmp3180, i8* %.tmp3181)
ret void
}
define %m2652$.ModuleLookup.type* @m295$get_module.m2652$.ModuleLookup.typep.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp3183 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3184 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3183, i32 0, i32 6
%.tmp3185 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %.tmp3184
%m.3186 = alloca %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* %.tmp3185, %m2652$.ModuleLookup.type** %m.3186
br label %.for.start.3182
.for.start.3182:
%.tmp3187 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.3186
%.tmp3188 = icmp ne %m2652$.ModuleLookup.type* %.tmp3187, null
br i1 %.tmp3188, label %.for.continue.3182, label %.for.end.3182
.for.continue.3182:
%.tmp3189 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.3186
%.tmp3190 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3189, i32 0, i32 0
%.tmp3191 = load i8*, i8** %.tmp3190
%.tmp3192 = load i8*, i8** %filename
%.tmp3193 = call i32(i8*,i8*) @strcmp(i8* %.tmp3191, i8* %.tmp3192)
%.tmp3194 = icmp eq i32 %.tmp3193, 0
br i1 %.tmp3194, label %.if.true.3195, label %.if.false.3195
.if.true.3195:
%.tmp3196 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.3186
ret %m2652$.ModuleLookup.type* %.tmp3196
br label %.if.end.3195
.if.false.3195:
br label %.if.end.3195
.if.end.3195:
%.tmp3197 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.3186
%.tmp3198 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3197, i32 0, i32 2
%.tmp3199 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %.tmp3198
store %m2652$.ModuleLookup.type* %.tmp3199, %m2652$.ModuleLookup.type** %m.3186
br label %.for.start.3182
.for.end.3182:
%.tmp3200 = bitcast ptr null to %m2652$.ModuleLookup.type*
ret %m2652$.ModuleLookup.type* %.tmp3200
}
define %m2652$.ModuleLookup.type* @m295$get_current_module.m2652$.ModuleLookup.typep.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%.tmp3201 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3202 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3203 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3202, i32 0, i32 7
%.tmp3204 = load i8*, i8** %.tmp3203
%.tmp3205 = call %m2652$.ModuleLookup.type*(%m2652$.CompilerCtx.type*,i8*) @m295$get_module.m2652$.ModuleLookup.typep.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.tmp3201, i8* %.tmp3204)
ret %m2652$.ModuleLookup.type* %.tmp3205
}
define i32 @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%.tmp3206 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3207 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3206, i32 0, i32 5
%.tmp3208 = load i32, i32* %.tmp3207
%uid.3209 = alloca i32
store i32 %.tmp3208, i32* %uid.3209
%.tmp3210 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3211 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3210, i32 0, i32 5
%.tmp3212 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3213 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3212, i32 0, i32 5
%.tmp3214 = load i32, i32* %.tmp3213
%.tmp3215 = add i32 %.tmp3214, 1
store i32 %.tmp3215, i32* %.tmp3211
%.tmp3216 = load i32, i32* %uid.3209
ret i32 %.tmp3216
}
define %m2652$.CompilerCtx.type* @m295$new_context.m2652$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp3217 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* null, i32 1
%.tmp3218 = ptrtoint %m2652$.CompilerCtx.type* %.tmp3217 to i32
%.tmp3219 = call i8*(i32) @malloc(i32 %.tmp3218)
%.tmp3220 = bitcast i8* %.tmp3219 to %m2652$.CompilerCtx.type*
%ctx.3221 = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.tmp3220, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3222 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3223 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3222, i32 0, i32 1
%.tmp3224 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp3224, %m0$.File.type** %.tmp3223
%.tmp3225 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3226 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3225, i32 0, i32 0
%.tmp3227 = bitcast ptr null to %m980$.Node.type*
store %m980$.Node.type* %.tmp3227, %m980$.Node.type** %.tmp3226
%.tmp3228 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3229 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3228, i32 0, i32 2
store %m2652$.ErrorList.type* null, %m2652$.ErrorList.type** %.tmp3229
%.tmp3230 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3231 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3230, i32 0, i32 5
store i32 0, i32* %.tmp3231
%.tmp3232 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3233 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3232, i32 0, i32 3
store %m2652$.GlobalName.type* null, %m2652$.GlobalName.type** %.tmp3233
%.tmp3234 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3235 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3234, i32 0, i32 8
store %m2652$.AnonFn.type* null, %m2652$.AnonFn.type** %.tmp3235
%.tmp3236 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3237 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3236, i32 0, i32 7
%.tmp3238 = load i8*, i8** %filename
store i8* %.tmp3238, i8** %.tmp3237
%.tmp3239 = call i8*() @m2200$grammar.cp()
%.tmp3240 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp3239)
%grammar_file.3241 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp3240, %m0$.File.type** %grammar_file.3241
%.tmp3242 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3241
%.tmp3243 = icmp eq %m0$.File.type* %.tmp3242, null
br i1 %.tmp3243, label %.if.true.3244, label %.if.false.3244
.if.true.3244:
%.tmp3245 = bitcast ptr null to %m2652$.CompilerCtx.type*
ret %m2652$.CompilerCtx.type* %.tmp3245
br label %.if.end.3244
.if.false.3244:
br label %.if.end.3244
.if.end.3244:
%.tmp3246 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3241
%.tmp3247 = call %m980$.ParsingContext.type*(%m0$.File.type*) @m980$new_context.m980$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp3246)
%grammar_ctx.3248 = alloca %m980$.ParsingContext.type*
store %m980$.ParsingContext.type* %.tmp3247, %m980$.ParsingContext.type** %grammar_ctx.3248
%.tmp3249 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3241
%.tmp3250 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp3249)
%.tmp3251 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3252 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3251, i32 0, i32 4
%.tmp3253 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %grammar_ctx.3248
%.tmp3254 = call %m980$.Rule.type**(%m980$.ParsingContext.type*) @m980$parse_grammar.m980$.Rule.typepp.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.tmp3253)
store %m980$.Rule.type** %.tmp3254, %m980$.Rule.type*** %.tmp3252
%.tmp3255 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3256 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3255, i32 0, i32 4
%.tmp3257 = load %m980$.Rule.type**, %m980$.Rule.type*** %.tmp3256
%.tmp3258 = icmp eq %m980$.Rule.type** %.tmp3257, null
br i1 %.tmp3258, label %.if.true.3259, label %.if.false.3259
.if.true.3259:
%.tmp3261 = getelementptr [39 x i8], [39 x i8]*@.str3260, i32 0, i32 0
%.tmp3262 = call i32(i8*,...) @printf(i8* %.tmp3261)
call void(i32) @exit(i32 1)
br label %.if.end.3259
.if.false.3259:
br label %.if.end.3259
.if.end.3259:
%.tmp3263 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3264 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3263, i32 0, i32 6
%.tmp3265 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* null, i32 1
%.tmp3266 = ptrtoint %m2652$.ModuleLookup.type* %.tmp3265 to i32
%.tmp3267 = call i8*(i32) @malloc(i32 %.tmp3266)
%.tmp3268 = bitcast i8* %.tmp3267 to %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* %.tmp3268, %m2652$.ModuleLookup.type** %.tmp3264
%.tmp3269 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3270 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3269, i32 0, i32 6
%.tmp3271 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %.tmp3270
%.tmp3272 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3271, i32 0, i32 0
%.tmp3273 = load i8*, i8** %filename
store i8* %.tmp3273, i8** %.tmp3272
%.tmp3274 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3275 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3274, i32 0, i32 6
%.tmp3276 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %.tmp3275
%.tmp3277 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3276, i32 0, i32 3
store %m2652$.Scope.type* null, %m2652$.Scope.type** %.tmp3277
%.tmp3278 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3279 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3278, i32 0, i32 6
%.tmp3280 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %.tmp3279
%.tmp3281 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3280, i32 0, i32 1
%.tmp3283 = getelementptr [1 x i8], [1 x i8]*@.str3282, i32 0, i32 0
store i8* %.tmp3283, i8** %.tmp3281
%.tmp3284 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3285 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3284, i32 0, i32 6
%.tmp3286 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %.tmp3285
%.tmp3287 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3286, i32 0, i32 2
store %m2652$.ModuleLookup.type* null, %m2652$.ModuleLookup.type** %.tmp3287
%.tmp3288 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx.3221
%.tmp3289 = bitcast %m2652$.CompilerCtx.type* %.tmp3288 to %m2652$.CompilerCtx.type*
ret %m2652$.CompilerCtx.type* %.tmp3289
}
define void @m295$push_scope.v.m2652$.CompilerCtx.typep.cp.cp.cp.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.ctx.arg, i8* %.type.arg, i8* %.begin_id.arg, i8* %.end_id.arg, %m2652$.Type.type* %.t.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%type = alloca i8*
store i8* %.type.arg, i8** %type
%begin_id = alloca i8*
store i8* %.begin_id.arg, i8** %begin_id
%end_id = alloca i8*
store i8* %.end_id.arg, i8** %end_id
%t = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.t.arg, %m2652$.Type.type** %t
%.tmp3290 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* null, i32 1
%.tmp3291 = ptrtoint %m2652$.Scope.type* %.tmp3290 to i32
%.tmp3292 = call i8*(i32) @malloc(i32 %.tmp3291)
%.tmp3293 = bitcast i8* %.tmp3292 to %m2652$.Scope.type*
%s.3294 = alloca %m2652$.Scope.type*
store %m2652$.Scope.type* %.tmp3293, %m2652$.Scope.type** %s.3294
%.tmp3295 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3296 = call %m2652$.ModuleLookup.type*(%m2652$.CompilerCtx.type*) @m295$get_current_module.m2652$.ModuleLookup.typep.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp3295)
%m.3297 = alloca %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* %.tmp3296, %m2652$.ModuleLookup.type** %m.3297
%.tmp3298 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.3294
%.tmp3299 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp3298, i32 0, i32 5
%.tmp3300 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.3297
%.tmp3301 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3300, i32 0, i32 3
%.tmp3302 = load %m2652$.Scope.type*, %m2652$.Scope.type** %.tmp3301
store %m2652$.Scope.type* %.tmp3302, %m2652$.Scope.type** %.tmp3299
%.tmp3303 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.3294
%.tmp3304 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp3303, i32 0, i32 1
store %m2652$.ScopeItem.type* null, %m2652$.ScopeItem.type** %.tmp3304
%.tmp3305 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.3294
%.tmp3306 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp3305, i32 0, i32 2
%.tmp3307 = load i8*, i8** %type
store i8* %.tmp3307, i8** %.tmp3306
%.tmp3308 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.3294
%.tmp3309 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp3308, i32 0, i32 3
%.tmp3310 = load i8*, i8** %begin_id
store i8* %.tmp3310, i8** %.tmp3309
%.tmp3311 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.3294
%.tmp3312 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp3311, i32 0, i32 4
%.tmp3313 = load i8*, i8** %end_id
store i8* %.tmp3313, i8** %.tmp3312
%.tmp3314 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.3294
%.tmp3315 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp3314, i32 0, i32 6
%.tmp3316 = load %m2652$.Type.type*, %m2652$.Type.type** %t
store %m2652$.Type.type* %.tmp3316, %m2652$.Type.type** %.tmp3315
%.tmp3317 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.3297
%.tmp3318 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3317, i32 0, i32 3
%.tmp3319 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.3294
store %m2652$.Scope.type* %.tmp3319, %m2652$.Scope.type** %.tmp3318
ret void
}
define void @m295$pop_scope.v.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%.tmp3320 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3321 = call %m2652$.ModuleLookup.type*(%m2652$.CompilerCtx.type*) @m295$get_current_module.m2652$.ModuleLookup.typep.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp3320)
%m.3322 = alloca %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* %.tmp3321, %m2652$.ModuleLookup.type** %m.3322
%.tmp3323 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.3322
%.tmp3324 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3323, i32 0, i32 3
%.tmp3325 = load %m2652$.Scope.type*, %m2652$.Scope.type** %.tmp3324
%.tmp3326 = icmp ne %m2652$.Scope.type* %.tmp3325, null
%.tmp3328 = getelementptr [61 x i8], [61 x i8]*@.str3327, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp3326, i8* %.tmp3328)
%.tmp3329 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.3322
%.tmp3330 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3329, i32 0, i32 3
%.tmp3331 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.3322
%.tmp3332 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3331, i32 0, i32 3
%.tmp3333 = load %m2652$.Scope.type*, %m2652$.Scope.type** %.tmp3332
%.tmp3334 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp3333, i32 0, i32 5
%.tmp3335 = load %m2652$.Scope.type*, %m2652$.Scope.type** %.tmp3334
store %m2652$.Scope.type* %.tmp3335, %m2652$.Scope.type** %.tmp3330
ret void
}
define i1 @m295$compile_file.b.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp3336 = load i8*, i8** %filepath
%.tmp3337 = load i32, i32* @O_RDONLY
%.tmp3338 = call i32(i8*,i32) @open(i8* %.tmp3336, i32 %.tmp3337)
%input_fd.3339 = alloca i32
store i32 %.tmp3338, i32* %input_fd.3339
%.tmp3340 = load i32, i32* %input_fd.3339
%.tmp3341 = icmp sle i32 %.tmp3340, 0
br i1 %.tmp3341, label %.if.true.3342, label %.if.false.3342
.if.true.3342:
%err_msg.3343 = alloca i8*
store i8* null, i8** %err_msg.3343
%.tmp3344 = getelementptr i8*, i8** %err_msg.3343, i32 0
%.tmp3346 = getelementptr [26 x i8], [26 x i8]*@.str3345, i32 0, i32 0
%.tmp3347 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3348 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3344, i8* %.tmp3346, %m980$.Node.type* %.tmp3347)
%.tmp3349 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3350 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3351 = load i8*, i8** %err_msg.3343
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp3349, %m980$.Node.type* %.tmp3350, i8* %.tmp3351)
ret i1 0
br label %.if.end.3342
.if.false.3342:
br label %.if.end.3342
.if.end.3342:
%.tmp3352 = load i32, i32* %input_fd.3339
%.tmp3353 = call %m298$.PeekerInfo.type*(i32) @m298$new.m298$.PeekerInfo.typep.i(i32 %.tmp3352)
%p.3354 = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.tmp3353, %m298$.PeekerInfo.type** %p.3354
%.tmp3355 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.3354
%.tmp3356 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp3355, i32 0, i32 6
%.tmp3357 = load i8*, i8** %filepath
store i8* %.tmp3357, i8** %.tmp3356
%.tmp3358 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.3354
%.tmp3359 = call %m297$.Token.type*(%m298$.PeekerInfo.type*,i1) @m297$tokenize.m297$.Token.typep.m298$.PeekerInfo.typep.b(%m298$.PeekerInfo.type* %.tmp3358, i1 0)
%tokens.3360 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp3359, %m297$.Token.type** %tokens.3360
%.tmp3361 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3362 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3361, i32 0, i32 4
%.tmp3363 = load %m980$.Rule.type**, %m980$.Rule.type*** %.tmp3362
%.tmp3365 = getelementptr [6 x i8], [6 x i8]*@.str3364, i32 0, i32 0
%.tmp3366 = load %m297$.Token.type*, %m297$.Token.type** %tokens.3360
%.tmp3367 = call %m980$.ParseResult.type*(%m980$.Rule.type**,i8*,%m297$.Token.type*) @m980$ast.m980$.ParseResult.typep.m980$.Rule.typepp.cp.m297$.Token.typep(%m980$.Rule.type** %.tmp3363, i8* %.tmp3365, %m297$.Token.type* %.tmp3366)
%ast.3368 = alloca %m980$.ParseResult.type*
store %m980$.ParseResult.type* %.tmp3367, %m980$.ParseResult.type** %ast.3368
%.tmp3369 = load i32, i32* %input_fd.3339
%.tmp3370 = call i32(i32) @close(i32 %.tmp3369)
%.tmp3371 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %ast.3368
%.tmp3372 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp3371, i32 0, i32 0
%.tmp3373 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3372
%.tmp3374 = icmp ne %m296$.Error.type* %.tmp3373, null
br i1 %.tmp3374, label %.if.true.3375, label %.if.false.3375
.if.true.3375:
%.tmp3376 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3377 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %ast.3368
%.tmp3378 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp3377, i32 0, i32 0
%.tmp3379 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3378
call void(%m2652$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2652$.CompilerCtx.typep.m296$.Error.typep(%m2652$.CompilerCtx.type* %.tmp3376, %m296$.Error.type* %.tmp3379)
ret i1 1
br label %.if.end.3375
.if.false.3375:
br label %.if.end.3375
.if.end.3375:
%.tmp3380 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3381 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %ast.3368
%.tmp3382 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp3381, i32 0, i32 1
%.tmp3383 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3382
%.tmp3384 = call i1(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile.b.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp3380, %m980$.Node.type* %.tmp3383)
ret i1 %.tmp3384
}
define i1 @m295$compile.b.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.ast.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%ast = alloca %m980$.Node.type*
store %m980$.Node.type* %.ast.arg, %m980$.Node.type** %ast
%.tmp3385 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3386 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3385, i32 0, i32 2
%.tmp3387 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %.tmp3386
%.tmp3388 = icmp eq %m2652$.ErrorList.type* %.tmp3387, null
br i1 %.tmp3388, label %.if.true.3389, label %.if.false.3389
.if.true.3389:
%.tmp3390 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3391 = load %m980$.Node.type*, %m980$.Node.type** %ast
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_ast.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp3390, %m980$.Node.type* %.tmp3391)
br label %.if.end.3389
.if.false.3389:
br label %.if.end.3389
.if.end.3389:
%.tmp3392 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3393 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3392, i32 0, i32 2
%.tmp3394 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %.tmp3393
%.tmp3395 = icmp ne %m2652$.ErrorList.type* %.tmp3394, null
br i1 %.tmp3395, label %.if.true.3396, label %.if.false.3396
.if.true.3396:
%.tmp3398 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3399 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3398, i32 0, i32 2
%.tmp3400 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %.tmp3399
%err.3401 = alloca %m2652$.ErrorList.type*
store %m2652$.ErrorList.type* %.tmp3400, %m2652$.ErrorList.type** %err.3401
br label %.for.start.3397
.for.start.3397:
%.tmp3402 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %err.3401
%.tmp3403 = icmp ne %m2652$.ErrorList.type* %.tmp3402, null
br i1 %.tmp3403, label %.for.continue.3397, label %.for.end.3397
.for.continue.3397:
%.tmp3404 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %err.3401
%.tmp3405 = getelementptr %m2652$.ErrorList.type, %m2652$.ErrorList.type* %.tmp3404, i32 0, i32 2
%.tmp3406 = load i1, i1* %.tmp3405
%.tmp3407 = icmp eq i1 %.tmp3406, 0
br i1 %.tmp3407, label %.if.true.3408, label %.if.false.3408
.if.true.3408:
%.tmp3409 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %err.3401
%.tmp3410 = getelementptr %m2652$.ErrorList.type, %m2652$.ErrorList.type* %.tmp3409, i32 0, i32 0
%.tmp3411 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3410
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp3411)
%.tmp3412 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %err.3401
%.tmp3413 = getelementptr %m2652$.ErrorList.type, %m2652$.ErrorList.type* %.tmp3412, i32 0, i32 2
store i1 1, i1* %.tmp3413
br label %.if.end.3408
.if.false.3408:
br label %.if.end.3408
.if.end.3408:
%.tmp3414 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %err.3401
%.tmp3415 = getelementptr %m2652$.ErrorList.type, %m2652$.ErrorList.type* %.tmp3414, i32 0, i32 1
%.tmp3416 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %.tmp3415
store %m2652$.ErrorList.type* %.tmp3416, %m2652$.ErrorList.type** %err.3401
br label %.for.start.3397
.for.end.3397:
ret i1 1
br label %.if.end.3396
.if.false.3396:
br label %.if.end.3396
.if.end.3396:
ret i1 0
}
define void @m295$mark_weak_global.v.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp3418 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3419 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3418, i32 0, i32 3
%.tmp3420 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %.tmp3419
%g.3421 = alloca %m2652$.GlobalName.type*
store %m2652$.GlobalName.type* %.tmp3420, %m2652$.GlobalName.type** %g.3421
br label %.for.start.3417
.for.start.3417:
%.tmp3422 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g.3421
%.tmp3423 = icmp ne %m2652$.GlobalName.type* %.tmp3422, null
br i1 %.tmp3423, label %.for.continue.3417, label %.for.end.3417
.for.continue.3417:
%.tmp3424 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g.3421
%.tmp3425 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp3424, i32 0, i32 3
%.tmp3426 = load i1, i1* %.tmp3425
%.tmp3427 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g.3421
%.tmp3428 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp3427, i32 0, i32 0
%.tmp3429 = load i8*, i8** %.tmp3428
%.tmp3430 = load i8*, i8** %id
%.tmp3431 = call i32(i8*,i8*) @strcmp(i8* %.tmp3429, i8* %.tmp3430)
%.tmp3432 = icmp eq i32 %.tmp3431, 0
%.tmp3433 = and i1 %.tmp3426, %.tmp3432
br i1 %.tmp3433, label %.if.true.3434, label %.if.false.3434
.if.true.3434:
%.tmp3435 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g.3421
%.tmp3436 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp3435, i32 0, i32 2
store i1 1, i1* %.tmp3436
br label %.for.end.3417
br label %.if.end.3434
.if.false.3434:
br label %.if.end.3434
.if.end.3434:
%.tmp3437 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g.3421
%.tmp3438 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp3437, i32 0, i32 5
%.tmp3439 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %.tmp3438
store %m2652$.GlobalName.type* %.tmp3439, %m2652$.GlobalName.type** %g.3421
br label %.for.start.3417
.for.end.3417:
ret void
}
define void @m295$compile_ast.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.ast.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%ast = alloca %m980$.Node.type*
store %m980$.Node.type* %.ast.arg, %m980$.Node.type** %ast
%.tmp3440 = load %m980$.Node.type*, %m980$.Node.type** %ast
%.tmp3441 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3440, i32 0, i32 0
%.tmp3442 = load i8*, i8** %.tmp3441
%.tmp3444 = getelementptr [6 x i8], [6 x i8]*@.str3443, i32 0, i32 0
%.tmp3445 = call i32(i8*,i8*) @strcmp(i8* %.tmp3442, i8* %.tmp3444)
%.tmp3446 = icmp ne i32 %.tmp3445, 0
br i1 %.tmp3446, label %.if.true.3447, label %.if.false.3447
.if.true.3447:
%.tmp3448 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3449 = load %m980$.Node.type*, %m980$.Node.type** %ast
%.tmp3451 = getelementptr [29 x i8], [29 x i8]*@.str3450, i32 0, i32 0
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp3448, %m980$.Node.type* %.tmp3449, i8* %.tmp3451)
ret void
br label %.if.end.3447
.if.false.3447:
br label %.if.end.3447
.if.end.3447:
%.tmp3452 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3454 = getelementptr [7 x i8], [7 x i8]*@.str3453, i32 0, i32 0
%.tmp3455 = bitcast ptr null to i8*
%.tmp3456 = bitcast ptr null to i8*
%.tmp3457 = bitcast ptr null to %m2652$.Type.type*
call void(%m2652$.CompilerCtx.type*,i8*,i8*,i8*,%m2652$.Type.type*) @m295$push_scope.v.m2652$.CompilerCtx.typep.cp.cp.cp.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp3452, i8* %.tmp3454, i8* %.tmp3455, i8* %.tmp3456, %m2652$.Type.type* %.tmp3457)
%.tmp3458 = load %m980$.Node.type*, %m980$.Node.type** %ast
%.tmp3459 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3458, i32 0, i32 6
%.tmp3460 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3459
%start.3461 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3460, %m980$.Node.type** %start.3461
%.tmp3462 = load %m980$.Node.type*, %m980$.Node.type** %start.3461
%.tmp3463 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3462, i32 0, i32 0
%.tmp3464 = load i8*, i8** %.tmp3463
%.tmp3466 = getelementptr [13 x i8], [13 x i8]*@.str3465, i32 0, i32 0
%.tmp3467 = call i32(i8*,i8*) @strcmp(i8* %.tmp3464, i8* %.tmp3466)
%.tmp3468 = icmp eq i32 %.tmp3467, 0
br i1 %.tmp3468, label %.if.true.3469, label %.if.false.3469
.if.true.3469:
%.tmp3470 = load %m980$.Node.type*, %m980$.Node.type** %start.3461
%.tmp3471 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3470, i32 0, i32 7
%.tmp3472 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3471
store %m980$.Node.type* %.tmp3472, %m980$.Node.type** %start.3461
br label %.if.end.3469
.if.false.3469:
br label %.if.end.3469
.if.end.3469:
%.tmp3474 = load %m980$.Node.type*, %m980$.Node.type** %start.3461
%stmt.3475 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3474, %m980$.Node.type** %stmt.3475
br label %.for.start.3473
.for.start.3473:
%.tmp3476 = load %m980$.Node.type*, %m980$.Node.type** %stmt.3475
%.tmp3477 = icmp ne %m980$.Node.type* %.tmp3476, null
br i1 %.tmp3477, label %.for.continue.3473, label %.for.end.3473
.for.continue.3473:
%.tmp3478 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3479 = load %m980$.Node.type*, %m980$.Node.type** %stmt.3475
%.tmp3480 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3479, i32 0, i32 6
%.tmp3481 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3480
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i1) @m295$compile_statement.v.m2652$.CompilerCtx.typep.m980$.Node.typep.b(%m2652$.CompilerCtx.type* %.tmp3478, %m980$.Node.type* %.tmp3481, i1 1)
%.tmp3482 = load %m980$.Node.type*, %m980$.Node.type** %stmt.3475
%.tmp3483 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3482, i32 0, i32 7
%.tmp3484 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3483
store %m980$.Node.type* %.tmp3484, %m980$.Node.type** %stmt.3475
br label %.for.start.3473
.for.end.3473:
%.tmp3485 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3486 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3485, i32 0, i32 2
%.tmp3487 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %.tmp3486
%.tmp3488 = icmp ne %m2652$.ErrorList.type* %.tmp3487, null
br i1 %.tmp3488, label %.if.true.3489, label %.if.false.3489
.if.true.3489:
ret void
br label %.if.end.3489
.if.false.3489:
br label %.if.end.3489
.if.end.3489:
%.tmp3491 = load %m980$.Node.type*, %m980$.Node.type** %start.3461
%s.3492 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3491, %m980$.Node.type** %s.3492
br label %.for.start.3490
.for.start.3490:
%.tmp3493 = load %m980$.Node.type*, %m980$.Node.type** %s.3492
%.tmp3494 = icmp ne %m980$.Node.type* %.tmp3493, null
br i1 %.tmp3494, label %.for.continue.3490, label %.for.end.3490
.for.continue.3490:
%.tmp3495 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3496 = load %m980$.Node.type*, %m980$.Node.type** %s.3492
%.tmp3497 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3496, i32 0, i32 6
%.tmp3498 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3497
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i1) @m295$compile_statement.v.m2652$.CompilerCtx.typep.m980$.Node.typep.b(%m2652$.CompilerCtx.type* %.tmp3495, %m980$.Node.type* %.tmp3498, i1 0)
%.tmp3499 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
call void(%m2652$.CompilerCtx.type*) @m295$compile_anon_fn.v.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp3499)
%.tmp3500 = load %m980$.Node.type*, %m980$.Node.type** %s.3492
%.tmp3501 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3500, i32 0, i32 7
%.tmp3502 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3501
store %m980$.Node.type* %.tmp3502, %m980$.Node.type** %s.3492
br label %.for.start.3490
.for.end.3490:
%.tmp3503 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3504 = call %m2652$.ModuleLookup.type*(%m2652$.CompilerCtx.type*) @m295$get_current_module.m2652$.ModuleLookup.typep.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp3503)
%mod.3505 = alloca %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* %.tmp3504, %m2652$.ModuleLookup.type** %mod.3505
%.tmp3506 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.3505
%.tmp3507 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3506, i32 0, i32 1
%.tmp3508 = load i8*, i8** %.tmp3507
%.tmp3510 = getelementptr [1 x i8], [1 x i8]*@.str3509, i32 0, i32 0
%.tmp3511 = call i32(i8*,i8*) @strcmp(i8* %.tmp3508, i8* %.tmp3510)
%.tmp3512 = icmp eq i32 %.tmp3511, 0
br i1 %.tmp3512, label %.if.true.3513, label %.if.false.3513
.if.true.3513:
%.tmp3515 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3516 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3515, i32 0, i32 3
%.tmp3517 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %.tmp3516
%g.3518 = alloca %m2652$.GlobalName.type*
store %m2652$.GlobalName.type* %.tmp3517, %m2652$.GlobalName.type** %g.3518
br label %.for.start.3514
.for.start.3514:
%.tmp3519 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g.3518
%.tmp3520 = icmp ne %m2652$.GlobalName.type* %.tmp3519, null
br i1 %.tmp3520, label %.for.continue.3514, label %.for.end.3514
.for.continue.3514:
%.tmp3521 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3522 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g.3518
call void(%m2652$.CompilerCtx.type*,%m2652$.GlobalName.type*) @m295$compile_global.v.m2652$.CompilerCtx.typep.m2652$.GlobalName.typep(%m2652$.CompilerCtx.type* %.tmp3521, %m2652$.GlobalName.type* %.tmp3522)
%.tmp3523 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g.3518
%.tmp3524 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp3523, i32 0, i32 5
%.tmp3525 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %.tmp3524
store %m2652$.GlobalName.type* %.tmp3525, %m2652$.GlobalName.type** %g.3518
br label %.for.start.3514
.for.end.3514:
br label %.if.end.3513
.if.false.3513:
br label %.if.end.3513
.if.end.3513:
ret void
}
define void @m295$compile_global.v.m2652$.CompilerCtx.typep.m2652$.GlobalName.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%g = alloca %m2652$.GlobalName.type*
store %m2652$.GlobalName.type* %.g.arg, %m2652$.GlobalName.type** %g
%.tmp3526 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g
%.tmp3527 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp3526, i32 0, i32 2
%.tmp3528 = load i1, i1* %.tmp3527
br i1 %.tmp3528, label %.if.true.3529, label %.if.false.3529
.if.true.3529:
ret void
br label %.if.end.3529
.if.false.3529:
br label %.if.end.3529
.if.end.3529:
%.tmp3530 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g
%.tmp3531 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp3530, i32 0, i32 1
%.tmp3532 = load i8*, i8** %.tmp3531
%.tmp3534 = getelementptr [7 x i8], [7 x i8]*@.str3533, i32 0, i32 0
%.tmp3535 = call i32(i8*,i8*) @strcmp(i8* %.tmp3532, i8* %.tmp3534)
%.tmp3536 = icmp eq i32 %.tmp3535, 0
br i1 %.tmp3536, label %.if.true.3537, label %.if.false.3537
.if.true.3537:
%.tmp3538 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3539 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3538, i32 0, i32 1
%.tmp3540 = load %m0$.File.type*, %m0$.File.type** %.tmp3539
%.tmp3542 = getelementptr [21 x i8], [21 x i8]*@.str3541, i32 0, i32 0
%.tmp3543 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g
%.tmp3544 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp3543, i32 0, i32 4
%.tmp3545 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %.tmp3544
%.tmp3546 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp3545)
%.tmp3547 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3548 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g
%.tmp3549 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp3548, i32 0, i32 4
%.tmp3550 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %.tmp3549
%.tmp3551 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3550, i32 0, i32 4
%.tmp3552 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3551
%.tmp3553 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp3547, %m2652$.Type.type* %.tmp3552)
%.tmp3554 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g
%.tmp3555 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp3554, i32 0, i32 0
%.tmp3556 = load i8*, i8** %.tmp3555
%.tmp3557 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3540, i8* %.tmp3542, i8* %.tmp3546, i8* %.tmp3553, i8* %.tmp3556)
br label %.if.end.3537
.if.false.3537:
%.tmp3558 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g
%.tmp3559 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp3558, i32 0, i32 1
%.tmp3560 = load i8*, i8** %.tmp3559
%.tmp3562 = getelementptr [7 x i8], [7 x i8]*@.str3561, i32 0, i32 0
%.tmp3563 = call i32(i8*,i8*) @strcmp(i8* %.tmp3560, i8* %.tmp3562)
%.tmp3564 = icmp eq i32 %.tmp3563, 0
br i1 %.tmp3564, label %.if.true.3565, label %.if.false.3565
.if.true.3565:
%.tmp3566 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3567 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g
%.tmp3568 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp3567, i32 0, i32 4
%.tmp3569 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %.tmp3568
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$compile_extern.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp3566, %m2652$.AssignableInfo.type* %.tmp3569)
br label %.if.end.3565
.if.false.3565:
br label %.if.end.3565
.if.end.3565:
br label %.if.end.3537
.if.end.3537:
%.tmp3570 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g
%.tmp3571 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp3570, i32 0, i32 2
store i1 1, i1* %.tmp3571
ret void
}
define void @m295$compile_extern.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%info = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.info.arg, %m2652$.AssignableInfo.type** %info
%.tmp3572 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3573 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3572, i32 0, i32 1
%.tmp3574 = load %m0$.File.type*, %m0$.File.type** %.tmp3573
%.tmp3576 = getelementptr [15 x i8], [15 x i8]*@.str3575, i32 0, i32 0
%.tmp3577 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3578 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp3579 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3578, i32 0, i32 4
%.tmp3580 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3579
%.tmp3581 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3580, i32 0, i32 3
%.tmp3582 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3581
%.tmp3583 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp3577, %m2652$.Type.type* %.tmp3582)
%.tmp3584 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp3585 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp3584)
%.tmp3586 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3574, i8* %.tmp3576, i8* %.tmp3583, i8* %.tmp3585)
%.tmp3588 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp3589 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3588, i32 0, i32 4
%.tmp3590 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3589
%.tmp3591 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3590, i32 0, i32 3
%.tmp3592 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3591
%.tmp3593 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3592, i32 0, i32 4
%.tmp3594 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3593
%pt.3595 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp3594, %m2652$.Type.type** %pt.3595
br label %.for.start.3587
.for.start.3587:
%.tmp3596 = load %m2652$.Type.type*, %m2652$.Type.type** %pt.3595
%.tmp3597 = icmp ne %m2652$.Type.type* %.tmp3596, null
br i1 %.tmp3597, label %.for.continue.3587, label %.for.end.3587
.for.continue.3587:
%.tmp3598 = load %m2652$.Type.type*, %m2652$.Type.type** %pt.3595
%.tmp3599 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp3600 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3599, i32 0, i32 4
%.tmp3601 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3600
%.tmp3602 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3601, i32 0, i32 3
%.tmp3603 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3602
%.tmp3604 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3603, i32 0, i32 4
%.tmp3605 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3604
%.tmp3606 = icmp ne %m2652$.Type.type* %.tmp3598, %.tmp3605
br i1 %.tmp3606, label %.if.true.3607, label %.if.false.3607
.if.true.3607:
%.tmp3608 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3609 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3608, i32 0, i32 1
%.tmp3610 = load %m0$.File.type*, %m0$.File.type** %.tmp3609
%.tmp3612 = getelementptr [3 x i8], [3 x i8]*@.str3611, i32 0, i32 0
%.tmp3613 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3610, i8* %.tmp3612)
br label %.if.end.3607
.if.false.3607:
br label %.if.end.3607
.if.end.3607:
%.tmp3614 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3615 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3614, i32 0, i32 1
%.tmp3616 = load %m0$.File.type*, %m0$.File.type** %.tmp3615
%.tmp3618 = getelementptr [3 x i8], [3 x i8]*@.str3617, i32 0, i32 0
%.tmp3619 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3620 = load %m2652$.Type.type*, %m2652$.Type.type** %pt.3595
%.tmp3621 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp3619, %m2652$.Type.type* %.tmp3620)
%.tmp3622 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3616, i8* %.tmp3618, i8* %.tmp3621)
%.tmp3623 = load %m2652$.Type.type*, %m2652$.Type.type** %pt.3595
%.tmp3624 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3623, i32 0, i32 4
%.tmp3625 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3624
store %m2652$.Type.type* %.tmp3625, %m2652$.Type.type** %pt.3595
br label %.for.start.3587
.for.end.3587:
%.tmp3626 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3627 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3626, i32 0, i32 1
%.tmp3628 = load %m0$.File.type*, %m0$.File.type** %.tmp3627
%.tmp3630 = getelementptr [3 x i8], [3 x i8]*@.str3629, i32 0, i32 0
%.tmp3631 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3628, i8* %.tmp3630)
ret void
}
define i8* @m295$get_mod_prefix.cp.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3632 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3633 = call %m2652$.ModuleLookup.type*(%m2652$.CompilerCtx.type*) @m295$get_current_module.m2652$.ModuleLookup.typep.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp3632)
%m.3634 = alloca %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* %.tmp3633, %m2652$.ModuleLookup.type** %m.3634
%.tmp3635 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.3634
%.tmp3636 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3635, i32 0, i32 1
%.tmp3637 = load i8*, i8** %.tmp3636
ret i8* %.tmp3637
}
define i8* @m295$name_mangle.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.fn.arg, i8* %.original_name.arg, %m2652$.Type.type* %.type.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%fn = alloca %m980$.Node.type*
store %m980$.Node.type* %.fn.arg, %m980$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.type.arg, %m2652$.Type.type** %type
%mangled_name.3638 = alloca i8*
store i8* null, i8** %mangled_name.3638
%.tmp3639 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3640 = load %m980$.Node.type*, %m980$.Node.type** %fn
%.tmp3641 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3640, i32 0, i32 2
%.tmp3642 = load i8*, i8** %.tmp3641
%.tmp3643 = call i8*(%m2652$.CompilerCtx.type*,i8*) @m295$get_mod_prefix.cp.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.tmp3639, i8* %.tmp3642)
%prefix.3644 = alloca i8*
store i8* %.tmp3643, i8** %prefix.3644
%.tmp3645 = getelementptr i8*, i8** %mangled_name.3638, i32 0
%.tmp3647 = getelementptr [5 x i8], [5 x i8]*@.str3646, i32 0, i32 0
%.tmp3648 = load i8*, i8** %prefix.3644
%.tmp3649 = load i8*, i8** %original_name
%.tmp3650 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3645, i8* %.tmp3647, i8* %.tmp3648, i8* %.tmp3649)
%.tmp3651 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp3652 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3651, i32 0, i32 0
%.tmp3653 = load i8*, i8** %.tmp3652
%.tmp3655 = getelementptr [9 x i8], [9 x i8]*@.str3654, i32 0, i32 0
%.tmp3656 = call i32(i8*,i8*) @strcmp(i8* %.tmp3653, i8* %.tmp3655)
%.tmp3657 = icmp eq i32 %.tmp3656, 0
br i1 %.tmp3657, label %.if.true.3658, label %.if.false.3658
.if.true.3658:
%.tmp3659 = load i8*, i8** %mangled_name.3638
%.tmp3661 = getelementptr [5 x i8], [5 x i8]*@.str3660, i32 0, i32 0
%.tmp3662 = call i32(i8*,i8*) @strcmp(i8* %.tmp3659, i8* %.tmp3661)
%.tmp3663 = icmp ne i32 %.tmp3662, 0
br i1 %.tmp3663, label %.if.true.3664, label %.if.false.3664
.if.true.3664:
%tmp_buff.3665 = alloca i8*
store i8* null, i8** %tmp_buff.3665
%swap_var.3666 = alloca i8*
store i8* null, i8** %swap_var.3666
%.tmp3668 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp3669 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3668, i32 0, i32 3
%.tmp3670 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3669
%tp.3671 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp3670, %m2652$.Type.type** %tp.3671
br label %.for.start.3667
.for.start.3667:
%.tmp3672 = load %m2652$.Type.type*, %m2652$.Type.type** %tp.3671
%.tmp3673 = icmp ne %m2652$.Type.type* %.tmp3672, null
br i1 %.tmp3673, label %.for.continue.3667, label %.for.end.3667
.for.continue.3667:
%.tmp3674 = getelementptr i8*, i8** %tmp_buff.3665, i32 0
%.tmp3676 = getelementptr [6 x i8], [6 x i8]*@.str3675, i32 0, i32 0
%.tmp3677 = load i8*, i8** %mangled_name.3638
%.tmp3678 = load %m2652$.Type.type*, %m2652$.Type.type** %tp.3671
%.tmp3679 = call i8*(%m2652$.Type.type*) @m295$type_abbr.cp.m2652$.Type.typep(%m2652$.Type.type* %.tmp3678)
%.tmp3680 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3674, i8* %.tmp3676, i8* %.tmp3677, i8* %.tmp3679)
%.tmp3681 = load i8*, i8** %tmp_buff.3665
store i8* %.tmp3681, i8** %swap_var.3666
%.tmp3682 = load i8*, i8** %mangled_name.3638
store i8* %.tmp3682, i8** %tmp_buff.3665
%.tmp3683 = load i8*, i8** %swap_var.3666
store i8* %.tmp3683, i8** %mangled_name.3638
%.tmp3684 = load i8*, i8** %tmp_buff.3665
call void(i8*) @free(i8* %.tmp3684)
%.tmp3685 = load %m2652$.Type.type*, %m2652$.Type.type** %tp.3671
%.tmp3686 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3685, i32 0, i32 4
%.tmp3687 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3686
store %m2652$.Type.type* %.tmp3687, %m2652$.Type.type** %tp.3671
br label %.for.start.3667
.for.end.3667:
br label %.if.end.3664
.if.false.3664:
br label %.if.end.3664
.if.end.3664:
br label %.if.end.3658
.if.false.3658:
br label %.if.end.3658
.if.end.3658:
%.tmp3688 = load i8*, i8** %mangled_name.3638
ret i8* %.tmp3688
}
define void @m295$compile_statement.v.m2652$.CompilerCtx.typep.m980$.Node.typep.b(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3689 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* null, %m2652$.AssignableInfo.type** %info.3689
%return_type.3690 = alloca %m2652$.Type.type*
store %m2652$.Type.type* null, %m2652$.Type.type** %return_type.3690
%err_buf.3691 = alloca i8*
store i8* null, i8** %err_buf.3691
%tmp_buff.3692 = alloca i8*
store i8* null, i8** %tmp_buff.3692
%.tmp3693 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3694 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3693, i32 0, i32 0
%.tmp3695 = load i8*, i8** %.tmp3694
%.tmp3697 = getelementptr [3 x i8], [3 x i8]*@.str3696, i32 0, i32 0
%.tmp3698 = call i32(i8*,i8*) @strcmp(i8* %.tmp3695, i8* %.tmp3697)
%.tmp3699 = icmp eq i32 %.tmp3698, 0
br i1 %.tmp3699, label %.if.true.3700, label %.if.false.3700
.if.true.3700:
ret void
br label %.if.end.3700
.if.false.3700:
%.tmp3701 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3702 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3701, i32 0, i32 0
%.tmp3703 = load i8*, i8** %.tmp3702
%.tmp3705 = getelementptr [7 x i8], [7 x i8]*@.str3704, i32 0, i32 0
%.tmp3706 = call i32(i8*,i8*) @strcmp(i8* %.tmp3703, i8* %.tmp3705)
%.tmp3707 = icmp eq i32 %.tmp3706, 0
br i1 %.tmp3707, label %.if.true.3708, label %.if.false.3708
.if.true.3708:
%.tmp3709 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3710 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3709, i32 0, i32 6
%.tmp3711 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3710
%.tmp3713 = getelementptr [11 x i8], [11 x i8]*@.str3712, i32 0, i32 0
%.tmp3714 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp3711, i8* %.tmp3713)
%assignable.3715 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3714, %m980$.Node.type** %assignable.3715
%.tmp3716 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3717 = load %m980$.Node.type*, %m980$.Node.type** %assignable.3715
%.tmp3718 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp3716, %m980$.Node.type* %.tmp3717)
%a_info.3719 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp3718, %m2652$.AssignableInfo.type** %a_info.3719
%.tmp3720 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.3719
%.tmp3721 = icmp eq %m2652$.AssignableInfo.type* %.tmp3720, null
br i1 %.tmp3721, label %.if.true.3722, label %.if.false.3722
.if.true.3722:
ret void
br label %.if.end.3722
.if.false.3722:
br label %.if.end.3722
.if.end.3722:
%.tmp3723 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3724 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp3723)
store %m2652$.AssignableInfo.type* %.tmp3724, %m2652$.AssignableInfo.type** %info.3689
%.tmp3725 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3726 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3725, i32 0, i32 6
%.tmp3727 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3726
%.tmp3728 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3727, i32 0, i32 7
%.tmp3729 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3728
%.tmp3730 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3729, i32 0, i32 1
%.tmp3731 = load i8*, i8** %.tmp3730
%global_name.3732 = alloca i8*
store i8* %.tmp3731, i8** %global_name.3732
%.tmp3733 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3734 = load i8, i8* @SCOPE_GLOBAL
%.tmp3735 = load i8*, i8** %global_name.3732
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp3733, i8 %.tmp3734, i8* %.tmp3735)
%.tmp3736 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3737 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3736, i32 0, i32 4
%.tmp3738 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.3719
%.tmp3739 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3738, i32 0, i32 4
%.tmp3740 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3739
store %m2652$.Type.type* %.tmp3740, %m2652$.Type.type** %.tmp3737
%.tmp3741 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3742 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3741, i32 0, i32 3
%.tmp3744 = getelementptr [9 x i8], [9 x i8]*@.str3743, i32 0, i32 0
store i8* %.tmp3744, i8** %.tmp3742
%.tmp3745 = load i1, i1* %shallow
%.tmp3746 = icmp eq i1 %.tmp3745, 1
br i1 %.tmp3746, label %.if.true.3747, label %.if.false.3747
.if.true.3747:
%.tmp3748 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3749 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3750 = load i8*, i8** %global_name.3732
%.tmp3751 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2652$.AssignableInfo.type*) @m295$define_assignable.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp3748, %m980$.Node.type* %.tmp3749, i8* %.tmp3750, %m2652$.AssignableInfo.type* %.tmp3751)
br label %.if.end.3747
.if.false.3747:
%.tmp3752 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3753 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3752, i32 0, i32 1
%.tmp3754 = load %m0$.File.type*, %m0$.File.type** %.tmp3753
%.tmp3756 = getelementptr [21 x i8], [21 x i8]*@.str3755, i32 0, i32 0
%.tmp3757 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3758 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp3757)
%.tmp3759 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3760 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3761 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3760, i32 0, i32 4
%.tmp3762 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3761
%.tmp3763 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp3759, %m2652$.Type.type* %.tmp3762)
%.tmp3764 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.3719
%.tmp3765 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp3764)
%.tmp3766 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3754, i8* %.tmp3756, i8* %.tmp3758, i8* %.tmp3763, i8* %.tmp3765)
br label %.if.end.3747
.if.end.3747:
br label %.if.end.3708
.if.false.3708:
%.tmp3767 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3768 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3767, i32 0, i32 0
%.tmp3769 = load i8*, i8** %.tmp3768
%.tmp3771 = getelementptr [10 x i8], [10 x i8]*@.str3770, i32 0, i32 0
%.tmp3772 = call i32(i8*,i8*) @strcmp(i8* %.tmp3769, i8* %.tmp3771)
%.tmp3773 = icmp eq i32 %.tmp3772, 0
br i1 %.tmp3773, label %.if.true.3774, label %.if.false.3774
.if.true.3774:
%.tmp3775 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3776 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3775, i32 0, i32 6
%.tmp3777 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3776
%.tmp3778 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3777, i32 0, i32 7
%.tmp3779 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3778
%.tmp3780 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3779, i32 0, i32 1
%.tmp3781 = load i8*, i8** %.tmp3780
%type_name.3782 = alloca i8*
store i8* %.tmp3781, i8** %type_name.3782
%.tmp3783 = load i1, i1* %shallow
%.tmp3784 = icmp eq i1 %.tmp3783, 1
br i1 %.tmp3784, label %.if.true.3785, label %.if.false.3785
.if.true.3785:
%.tmp3786 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3787 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp3786)
store %m2652$.AssignableInfo.type* %.tmp3787, %m2652$.AssignableInfo.type** %info.3689
%.tmp3788 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3789 = call %m2652$.ModuleLookup.type*(%m2652$.CompilerCtx.type*) @m295$get_current_module.m2652$.ModuleLookup.typep.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp3788)
%mod_from.3790 = alloca %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* %.tmp3789, %m2652$.ModuleLookup.type** %mod_from.3790
%.tmp3791 = getelementptr i8*, i8** %tmp_buff.3692, i32 0
%.tmp3793 = getelementptr [11 x i8], [11 x i8]*@.str3792, i32 0, i32 0
%.tmp3794 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod_from.3790
%.tmp3795 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp3794, i32 0, i32 1
%.tmp3796 = load i8*, i8** %.tmp3795
%.tmp3797 = load i8*, i8** %type_name.3782
%.tmp3798 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3791, i8* %.tmp3793, i8* %.tmp3796, i8* %.tmp3797)
%.tmp3799 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3800 = load i8, i8* @SCOPE_LOCAL
%.tmp3801 = load i8*, i8** %tmp_buff.3692
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp3799, i8 %.tmp3800, i8* %.tmp3801)
%.tmp3802 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3803 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3802, i32 0, i32 3
%.tmp3805 = getelementptr [10 x i8], [10 x i8]*@.str3804, i32 0, i32 0
store i8* %.tmp3805, i8** %.tmp3803
%.tmp3806 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3807 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3806, i32 0, i32 5
%.tmp3808 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3809 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3808, i32 0, i32 3
%.tmp3810 = load i32, i32* %.tmp3809
store i32 %.tmp3810, i32* %.tmp3807
%.tmp3811 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3812 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3811, i32 0, i32 6
%.tmp3813 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3814 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3813, i32 0, i32 4
%.tmp3815 = load i32, i32* %.tmp3814
store i32 %.tmp3815, i32* %.tmp3812
%.tmp3816 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3817 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3816, i32 0, i32 4
%.tmp3818 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp3818, %m2652$.Type.type** %.tmp3817
%.tmp3819 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3820 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3821 = load i8*, i8** %type_name.3782
%.tmp3822 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2652$.AssignableInfo.type*) @m295$define_assignable.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp3819, %m980$.Node.type* %.tmp3820, i8* %.tmp3821, %m2652$.AssignableInfo.type* %.tmp3822)
%.tmp3823 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3824 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3823, i32 0, i32 6
%.tmp3825 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3824
%.tmp3827 = getelementptr [5 x i8], [5 x i8]*@.str3826, i32 0, i32 0
%.tmp3828 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp3825, i8* %.tmp3827)
%type_decl.3829 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3828, %m980$.Node.type** %type_decl.3829
%.tmp3830 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3831 = load %m980$.Node.type*, %m980$.Node.type** %type_decl.3829
%.tmp3832 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3831, i32 0, i32 6
%.tmp3833 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3832
%.tmp3834 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp3830, %m980$.Node.type* %.tmp3833)
%type_struct.3835 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp3834, %m2652$.Type.type** %type_struct.3835
%.tmp3836 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3837 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3836, i32 0, i32 4
%.tmp3838 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3837
%.tmp3839 = load %m2652$.Type.type*, %m2652$.Type.type** %type_struct.3835
call void(%m2652$.Type.type*,%m2652$.Type.type*) @m295$copy_type.v.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.tmp3838, %m2652$.Type.type* %.tmp3839)
%.tmp3840 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3841 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3840, i32 0, i32 4
%.tmp3842 = load %m2652$.Type.type*, %m2652$.Type.type** %type_struct.3835
store %m2652$.Type.type* %.tmp3842, %m2652$.Type.type** %.tmp3841
br label %.if.end.3785
.if.false.3785:
%.tmp3843 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3844 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3845 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3844, i32 0, i32 7
%.tmp3846 = load i8*, i8** %.tmp3845
%.tmp3847 = load i8*, i8** %type_name.3782
%.tmp3848 = call %m2652$.ScopeItem.type*(%m2652$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2652$.ScopeItem.typep.m2652$.CompilerCtx.typep.cp.cp(%m2652$.CompilerCtx.type* %.tmp3843, i8* %.tmp3846, i8* %.tmp3847)
%scope.3849 = alloca %m2652$.ScopeItem.type*
store %m2652$.ScopeItem.type* %.tmp3848, %m2652$.ScopeItem.type** %scope.3849
%.tmp3850 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %scope.3849
%.tmp3851 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp3850, i32 0, i32 1
%.tmp3852 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %.tmp3851
store %m2652$.AssignableInfo.type* %.tmp3852, %m2652$.AssignableInfo.type** %info.3689
%.tmp3853 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3854 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3853, i32 0, i32 1
%.tmp3855 = load %m0$.File.type*, %m0$.File.type** %.tmp3854
%.tmp3857 = getelementptr [14 x i8], [14 x i8]*@.str3856, i32 0, i32 0
%.tmp3858 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3859 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp3858)
%.tmp3860 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3861 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3862 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3861, i32 0, i32 4
%.tmp3863 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3862
%.tmp3864 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp3860, %m2652$.Type.type* %.tmp3863)
%.tmp3865 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3855, i8* %.tmp3857, i8* %.tmp3859, i8* %.tmp3864)
br label %.if.end.3785
.if.end.3785:
br label %.if.end.3774
.if.false.3774:
%.tmp3866 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3867 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3866, i32 0, i32 0
%.tmp3868 = load i8*, i8** %.tmp3867
%.tmp3870 = getelementptr [7 x i8], [7 x i8]*@.str3869, i32 0, i32 0
%.tmp3871 = call i32(i8*,i8*) @strcmp(i8* %.tmp3868, i8* %.tmp3870)
%.tmp3872 = icmp eq i32 %.tmp3871, 0
br i1 %.tmp3872, label %.if.true.3873, label %.if.false.3873
.if.true.3873:
%.tmp3874 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3875 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp3874)
store %m2652$.AssignableInfo.type* %.tmp3875, %m2652$.AssignableInfo.type** %info.3689
%.tmp3876 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3877 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3876, i32 0, i32 4
%.tmp3878 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3879 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3880 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3879, i32 0, i32 6
%.tmp3881 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3880
%.tmp3882 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3881, i32 0, i32 7
%.tmp3883 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3882
%.tmp3884 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$syn_function_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp3878, %m980$.Node.type* %.tmp3883)
store %m2652$.Type.type* %.tmp3884, %m2652$.Type.type** %.tmp3877
%.tmp3885 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3886 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3885, i32 0, i32 3
%.tmp3888 = getelementptr [7 x i8], [7 x i8]*@.str3887, i32 0, i32 0
store i8* %.tmp3888, i8** %.tmp3886
%.tmp3889 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3890 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3889, i32 0, i32 6
%.tmp3891 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3890
%.tmp3892 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3891, i32 0, i32 7
%.tmp3893 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3892
%.tmp3894 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3893, i32 0, i32 7
%.tmp3895 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3894
%.tmp3896 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3895, i32 0, i32 1
%.tmp3897 = load i8*, i8** %.tmp3896
%fn_name.3898 = alloca i8*
store i8* %.tmp3897, i8** %fn_name.3898
%.tmp3899 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3900 = load i8, i8* @SCOPE_GLOBAL
%.tmp3901 = load i8*, i8** %fn_name.3898
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp3899, i8 %.tmp3900, i8* %.tmp3901)
%.tmp3902 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp3902, %m2652$.Type.type** %return_type.3690
%.tmp3903 = load %m2652$.Type.type*, %m2652$.Type.type** %return_type.3690
%.tmp3904 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3903, i32 0, i32 0
%.tmp3905 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3906 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3905, i32 0, i32 4
%.tmp3907 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3906
%.tmp3908 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3907, i32 0, i32 3
%.tmp3909 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3908
%.tmp3910 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3909, i32 0, i32 0
%.tmp3911 = load i8*, i8** %.tmp3910
store i8* %.tmp3911, i8** %.tmp3904
%.tmp3912 = load %m2652$.Type.type*, %m2652$.Type.type** %return_type.3690
%.tmp3913 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3912, i32 0, i32 3
%.tmp3914 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3915 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3914, i32 0, i32 4
%.tmp3916 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3915
%.tmp3917 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3916, i32 0, i32 3
%.tmp3918 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3917
%.tmp3919 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3918, i32 0, i32 3
%.tmp3920 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3919
store %m2652$.Type.type* %.tmp3920, %m2652$.Type.type** %.tmp3913
%.tmp3921 = load i1, i1* %shallow
%.tmp3922 = icmp eq i1 %.tmp3921, 0
br i1 %.tmp3922, label %.if.true.3923, label %.if.false.3923
.if.true.3923:
%.tmp3924 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3925 = load i8*, i8** %fn_name.3898
call void(%m2652$.CompilerCtx.type*,i8*) @m295$mark_weak_global.v.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.tmp3924, i8* %.tmp3925)
%.tmp3926 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3927 = load i8*, i8** %fn_name.3898
%.tmp3929 = getelementptr [7 x i8], [7 x i8]*@.str3928, i32 0, i32 0
%.tmp3930 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
call void(%m2652$.CompilerCtx.type*,i8*,i8*,%m2652$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2652$.CompilerCtx.typep.cp.cp.m2652$.AssignableInfo.typep.b.b(%m2652$.CompilerCtx.type* %.tmp3926, i8* %.tmp3927, i8* %.tmp3929, %m2652$.AssignableInfo.type* %.tmp3930, i1 1, i1 1)
%.tmp3931 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3932 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$compile_extern.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp3931, %m2652$.AssignableInfo.type* %.tmp3932)
br label %.if.end.3923
.if.false.3923:
%.tmp3933 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3934 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3935 = load i8*, i8** %fn_name.3898
%.tmp3936 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2652$.AssignableInfo.type*) @m295$define_assignable.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp3933, %m980$.Node.type* %.tmp3934, i8* %.tmp3935, %m2652$.AssignableInfo.type* %.tmp3936)
br label %.if.end.3923
.if.end.3923:
br label %.if.end.3873
.if.false.3873:
%.tmp3937 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3938 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3937, i32 0, i32 0
%.tmp3939 = load i8*, i8** %.tmp3938
%.tmp3941 = getelementptr [9 x i8], [9 x i8]*@.str3940, i32 0, i32 0
%.tmp3942 = call i32(i8*,i8*) @strcmp(i8* %.tmp3939, i8* %.tmp3941)
%.tmp3943 = icmp eq i32 %.tmp3942, 0
br i1 %.tmp3943, label %.if.true.3944, label %.if.false.3944
.if.true.3944:
%.tmp3945 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3946 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp3945)
store %m2652$.AssignableInfo.type* %.tmp3946, %m2652$.AssignableInfo.type** %info.3689
%.tmp3947 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3948 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3947, i32 0, i32 3
%.tmp3950 = getelementptr [9 x i8], [9 x i8]*@.str3949, i32 0, i32 0
store i8* %.tmp3950, i8** %.tmp3948
%.tmp3951 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3952 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3951, i32 0, i32 4
%.tmp3953 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3954 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3955 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3954, i32 0, i32 6
%.tmp3956 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3955
%.tmp3957 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$syn_function_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp3953, %m980$.Node.type* %.tmp3956)
store %m2652$.Type.type* %.tmp3957, %m2652$.Type.type** %.tmp3952
%.tmp3958 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3959 = call i8*(%m980$.Node.type*) @m295$syn_function_name.cp.m980$.Node.typep(%m980$.Node.type* %.tmp3958)
%name.3960 = alloca i8*
store i8* %.tmp3959, i8** %name.3960
%.tmp3961 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3962 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3963 = load i8*, i8** %name.3960
%.tmp3964 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3965 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3964, i32 0, i32 4
%.tmp3966 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3965
%.tmp3967 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2652$.Type.type*) @m295$name_mangle.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp3961, %m980$.Node.type* %.tmp3962, i8* %.tmp3963, %m2652$.Type.type* %.tmp3966)
store i8* %.tmp3967, i8** %tmp_buff.3692
%.tmp3968 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3969 = load i8, i8* @SCOPE_GLOBAL
%.tmp3970 = load i8*, i8** %tmp_buff.3692
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp3968, i8 %.tmp3969, i8* %.tmp3970)
%.tmp3971 = load i1, i1* %shallow
%.tmp3972 = icmp eq i1 %.tmp3971, 1
br i1 %.tmp3972, label %.if.true.3973, label %.if.false.3973
.if.true.3973:
%.tmp3974 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3975 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3976 = load i8*, i8** %name.3960
%.tmp3977 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2652$.AssignableInfo.type*) @m295$define_assignable.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp3974, %m980$.Node.type* %.tmp3975, i8* %.tmp3976, %m2652$.AssignableInfo.type* %.tmp3977)
br label %.if.end.3973
.if.false.3973:
%.tmp3978 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp3978, %m2652$.Type.type** %return_type.3690
%.tmp3979 = load %m2652$.Type.type*, %m2652$.Type.type** %return_type.3690
%.tmp3980 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3981 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp3980, i32 0, i32 4
%.tmp3982 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3981
%.tmp3983 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp3982, i32 0, i32 3
%.tmp3984 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp3983
call void(%m2652$.Type.type*,%m2652$.Type.type*) @m295$copy_type.v.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.tmp3979, %m2652$.Type.type* %.tmp3984)
%.tmp3985 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3986 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp3985, i32 0, i32 1
%.tmp3987 = load %m0$.File.type*, %m0$.File.type** %.tmp3986
%.tmp3989 = getelementptr [14 x i8], [14 x i8]*@.str3988, i32 0, i32 0
%.tmp3990 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp3991 = load %m2652$.Type.type*, %m2652$.Type.type** %return_type.3690
%.tmp3992 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp3990, %m2652$.Type.type* %.tmp3991)
%.tmp3993 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.3689
%.tmp3994 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp3993)
%.tmp3995 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3987, i8* %.tmp3989, i8* %.tmp3992, i8* %.tmp3994)
%.tmp3996 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3997 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3996, i32 0, i32 6
%.tmp3998 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3997
%.tmp3999 = call %m980$.Node.type*(%m980$.Node.type*) @m295$syn_function_params.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.tmp3998)
%params.4000 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3999, %m980$.Node.type** %params.4000
%param_type.4001 = alloca %m2652$.Type.type*
store %m2652$.Type.type* null, %m2652$.Type.type** %param_type.4001
%.tmp4003 = load %m980$.Node.type*, %m980$.Node.type** %params.4000
%param_ptr.4004 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4003, %m980$.Node.type** %param_ptr.4004
br label %.for.start.4002
.for.start.4002:
%.tmp4005 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4004
%.tmp4006 = icmp ne %m980$.Node.type* %.tmp4005, null
br i1 %.tmp4006, label %.for.continue.4002, label %.for.end.4002
.for.continue.4002:
%.tmp4007 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4004
%.tmp4008 = load %m980$.Node.type*, %m980$.Node.type** %params.4000
%.tmp4009 = icmp ne %m980$.Node.type* %.tmp4007, %.tmp4008
br i1 %.tmp4009, label %.if.true.4010, label %.if.false.4010
.if.true.4010:
%.tmp4011 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4004
%.tmp4012 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4011, i32 0, i32 7
%.tmp4013 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4012
store %m980$.Node.type* %.tmp4013, %m980$.Node.type** %param_ptr.4004
%.tmp4014 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4015 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4014, i32 0, i32 1
%.tmp4016 = load %m0$.File.type*, %m0$.File.type** %.tmp4015
%.tmp4018 = getelementptr [3 x i8], [3 x i8]*@.str4017, i32 0, i32 0
%.tmp4019 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4016, i8* %.tmp4018)
br label %.if.end.4010
.if.false.4010:
br label %.if.end.4010
.if.end.4010:
%.tmp4020 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4004
%.tmp4021 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4020, i32 0, i32 0
%.tmp4022 = load i8*, i8** %.tmp4021
%.tmp4024 = getelementptr [5 x i8], [5 x i8]*@.str4023, i32 0, i32 0
%.tmp4025 = call i32(i8*,i8*) @strcmp(i8* %.tmp4022, i8* %.tmp4024)
%.tmp4026 = icmp eq i32 %.tmp4025, 0
br i1 %.tmp4026, label %.if.true.4027, label %.if.false.4027
.if.true.4027:
%.tmp4028 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4029 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4004
%.tmp4030 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4029, i32 0, i32 6
%.tmp4031 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4030
%.tmp4032 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp4028, %m980$.Node.type* %.tmp4031)
store %m2652$.Type.type* %.tmp4032, %m2652$.Type.type** %param_type.4001
%.tmp4033 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4004
%.tmp4034 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4033, i32 0, i32 7
%.tmp4035 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4034
store %m980$.Node.type* %.tmp4035, %m980$.Node.type** %param_ptr.4004
br label %.if.end.4027
.if.false.4027:
br label %.if.end.4027
.if.end.4027:
%.tmp4036 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4037 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4036, i32 0, i32 1
%.tmp4038 = load %m0$.File.type*, %m0$.File.type** %.tmp4037
%.tmp4040 = getelementptr [13 x i8], [13 x i8]*@.str4039, i32 0, i32 0
%.tmp4041 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4042 = load %m2652$.Type.type*, %m2652$.Type.type** %param_type.4001
%.tmp4043 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4041, %m2652$.Type.type* %.tmp4042)
%.tmp4044 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4004
%.tmp4045 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4044, i32 0, i32 1
%.tmp4046 = load i8*, i8** %.tmp4045
%.tmp4047 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4038, i8* %.tmp4040, i8* %.tmp4043, i8* %.tmp4046)
%.tmp4048 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4004
%.tmp4049 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4048, i32 0, i32 7
%.tmp4050 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4049
store %m980$.Node.type* %.tmp4050, %m980$.Node.type** %param_ptr.4004
br label %.for.start.4002
.for.end.4002:
%.tmp4051 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4052 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4051, i32 0, i32 1
%.tmp4053 = load %m0$.File.type*, %m0$.File.type** %.tmp4052
%.tmp4055 = getelementptr [5 x i8], [5 x i8]*@.str4054, i32 0, i32 0
%.tmp4056 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4053, i8* %.tmp4055)
%.tmp4057 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4059 = getelementptr [9 x i8], [9 x i8]*@.str4058, i32 0, i32 0
%.tmp4060 = bitcast ptr null to i8*
%.tmp4061 = bitcast ptr null to i8*
%.tmp4062 = load %m2652$.Type.type*, %m2652$.Type.type** %return_type.3690
call void(%m2652$.CompilerCtx.type*,i8*,i8*,i8*,%m2652$.Type.type*) @m295$push_scope.v.m2652$.CompilerCtx.typep.cp.cp.cp.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4057, i8* %.tmp4059, i8* %.tmp4060, i8* %.tmp4061, %m2652$.Type.type* %.tmp4062)
%.tmp4063 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4064 = load %m980$.Node.type*, %m980$.Node.type** %params.4000
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_fn_params.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp4063, %m980$.Node.type* %.tmp4064)
%.tmp4065 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4066 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4065, i32 0, i32 6
%.tmp4067 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4066
%.tmp4069 = getelementptr [6 x i8], [6 x i8]*@.str4068, i32 0, i32 0
%.tmp4070 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4067, i8* %.tmp4069)
%fn_block.4071 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4070, %m980$.Node.type** %fn_block.4071
%.tmp4072 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4073 = load %m980$.Node.type*, %m980$.Node.type** %fn_block.4071
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp4072, %m980$.Node.type* %.tmp4073)
%.tmp4074 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
call void(%m2652$.CompilerCtx.type*) @m295$pop_scope.v.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp4074)
%.tmp4075 = bitcast ptr null to %m980$.Node.type*
%last_valid_instruction.4076 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4075, %m980$.Node.type** %last_valid_instruction.4076
%.tmp4077 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4078 = load %m980$.Node.type*, %m980$.Node.type** %fn_block.4071
%.tmp4079 = load %m2652$.Type.type*, %m2652$.Type.type** %return_type.3690
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,%m2652$.Type.type*) @m295$check_n_add_implicit_return.v.m2652$.CompilerCtx.typep.m980$.Node.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4077, %m980$.Node.type* %.tmp4078, %m2652$.Type.type* %.tmp4079)
%.tmp4080 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4081 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4080, i32 0, i32 1
%.tmp4082 = load %m0$.File.type*, %m0$.File.type** %.tmp4081
%.tmp4084 = getelementptr [3 x i8], [3 x i8]*@.str4083, i32 0, i32 0
%.tmp4085 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4082, i8* %.tmp4084)
br label %.if.end.3973
.if.end.3973:
br label %.if.end.3944
.if.false.3944:
%.tmp4086 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4087 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4086, i32 0, i32 0
%.tmp4088 = load i8*, i8** %.tmp4087
%.tmp4090 = getelementptr [7 x i8], [7 x i8]*@.str4089, i32 0, i32 0
%.tmp4091 = call i32(i8*,i8*) @strcmp(i8* %.tmp4088, i8* %.tmp4090)
%.tmp4092 = icmp eq i32 %.tmp4091, 0
br i1 %.tmp4092, label %.if.true.4093, label %.if.false.4093
.if.true.4093:
%.tmp4094 = load i1, i1* %shallow
%.tmp4095 = icmp eq i1 %.tmp4094, 1
br i1 %.tmp4095, label %.if.true.4096, label %.if.false.4096
.if.true.4096:
%.tmp4097 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4098 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4097, i32 0, i32 6
%.tmp4099 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4098
%.tmp4100 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4099, i32 0, i32 7
%.tmp4101 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4100
%.tmp4102 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4101, i32 0, i32 1
%.tmp4103 = load i8*, i8** %.tmp4102
%mod_name.4104 = alloca i8*
store i8* %.tmp4103, i8** %mod_name.4104
%.tmp4105 = load i8*, i8** %mod_name.4104
%.tmp4106 = call i32(i8*) @strlen(i8* %.tmp4105)
%mod_name_len.4107 = alloca i32
store i32 %.tmp4106, i32* %mod_name_len.4107
%.tmp4108 = load i32, i32* %mod_name_len.4107
%.tmp4109 = sub i32 %.tmp4108, 1
%.tmp4110 = call i8*(i32) @malloc(i32 %.tmp4109)
%trimmed_path.4111 = alloca i8*
store i8* %.tmp4110, i8** %trimmed_path.4111
%i.4113 = alloca i32
store i32 1, i32* %i.4113
br label %.for.start.4112
.for.start.4112:
%.tmp4114 = load i32, i32* %i.4113
%.tmp4115 = load i32, i32* %mod_name_len.4107
%.tmp4116 = sub i32 %.tmp4115, 1
%.tmp4117 = icmp slt i32 %.tmp4114, %.tmp4116
br i1 %.tmp4117, label %.for.continue.4112, label %.for.end.4112
.for.continue.4112:
%.tmp4118 = load i32, i32* %i.4113
%.tmp4119 = sub i32 %.tmp4118, 1
%.tmp4120 = load i8*, i8** %trimmed_path.4111
%.tmp4121 = getelementptr i8, i8* %.tmp4120, i32 %.tmp4119
%.tmp4122 = load i32, i32* %i.4113
%.tmp4123 = load i8*, i8** %mod_name.4104
%.tmp4124 = getelementptr i8, i8* %.tmp4123, i32 %.tmp4122
%.tmp4125 = load i8, i8* %.tmp4124
store i8 %.tmp4125, i8* %.tmp4121
%.tmp4126 = load i32, i32* %i.4113
%.tmp4127 = add i32 %.tmp4126, 1
store i32 %.tmp4127, i32* %i.4113
br label %.for.start.4112
.for.end.4112:
%.tmp4128 = load i32, i32* %mod_name_len.4107
%.tmp4129 = sub i32 %.tmp4128, 2
%.tmp4130 = load i8*, i8** %trimmed_path.4111
%.tmp4131 = getelementptr i8, i8* %.tmp4130, i32 %.tmp4129
store i8 0, i8* %.tmp4131
%.tmp4132 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4133 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4134 = load i8*, i8** %trimmed_path.4111
%.tmp4135 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$resolve_import_path.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp4132, %m980$.Node.type* %.tmp4133, i8* %.tmp4134)
%mod_abspath.4136 = alloca i8*
store i8* %.tmp4135, i8** %mod_abspath.4136
%.tmp4137 = load i8*, i8** %mod_abspath.4136
%.tmp4138 = call i8*(i32) @malloc(i32 4096)
%.tmp4139 = call i8*(i8*,i8*) @realpath(i8* %.tmp4137, i8* %.tmp4138)
%relpath.4140 = alloca i8*
store i8* %.tmp4139, i8** %relpath.4140
%.tmp4141 = load i8*, i8** %relpath.4140
%.tmp4142 = icmp eq i8* %.tmp4141, null
br i1 %.tmp4142, label %.if.true.4143, label %.if.false.4143
.if.true.4143:
%.tmp4144 = getelementptr i8*, i8** %err_buf.3691, i32 0
%.tmp4146 = getelementptr [54 x i8], [54 x i8]*@.str4145, i32 0, i32 0
%.tmp4147 = load i8*, i8** %mod_name.4104
%.tmp4148 = load i8*, i8** %mod_abspath.4136
%.tmp4149 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4144, i8* %.tmp4146, i8* %.tmp4147, i8* %.tmp4148)
%.tmp4150 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4151 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4152 = load i8*, i8** %err_buf.3691
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp4150, %m980$.Node.type* %.tmp4151, i8* %.tmp4152)
ret void
br label %.if.end.4143
.if.false.4143:
br label %.if.end.4143
.if.end.4143:
%.tmp4153 = load i8*, i8** %relpath.4140
store i8* %.tmp4153, i8** %mod_abspath.4136
%m.4154 = alloca %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* null, %m2652$.ModuleLookup.type** %m.4154
%.tmp4155 = bitcast ptr null to %m2652$.ModuleLookup.type*
%mod.4156 = alloca %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* %.tmp4155, %m2652$.ModuleLookup.type** %mod.4156
%.tmp4158 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4159 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4158, i32 0, i32 6
%.tmp4160 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %.tmp4159
store %m2652$.ModuleLookup.type* %.tmp4160, %m2652$.ModuleLookup.type** %m.4154
br label %.for.start.4157
.for.start.4157:
%.tmp4161 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.4154
%.tmp4162 = icmp ne %m2652$.ModuleLookup.type* %.tmp4161, null
%.tmp4163 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.4156
%.tmp4164 = icmp eq %m2652$.ModuleLookup.type* %.tmp4163, null
%.tmp4165 = and i1 %.tmp4162, %.tmp4164
br i1 %.tmp4165, label %.for.continue.4157, label %.for.end.4157
.for.continue.4157:
%.tmp4166 = load i8*, i8** %mod_abspath.4136
%.tmp4167 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.4154
%.tmp4168 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp4167, i32 0, i32 0
%.tmp4169 = load i8*, i8** %.tmp4168
%.tmp4170 = call i32(i8*,i8*) @strcmp(i8* %.tmp4166, i8* %.tmp4169)
%.tmp4171 = icmp eq i32 %.tmp4170, 0
br i1 %.tmp4171, label %.if.true.4172, label %.if.false.4172
.if.true.4172:
%.tmp4173 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.4154
store %m2652$.ModuleLookup.type* %.tmp4173, %m2652$.ModuleLookup.type** %mod.4156
br label %.if.end.4172
.if.false.4172:
br label %.if.end.4172
.if.end.4172:
%.tmp4174 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.4154
%.tmp4175 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp4174, i32 0, i32 2
%.tmp4176 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %.tmp4175
store %m2652$.ModuleLookup.type* %.tmp4176, %m2652$.ModuleLookup.type** %m.4154
br label %.for.start.4157
.for.end.4157:
%.tmp4177 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4178 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4177, i32 0, i32 6
%.tmp4179 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4178
%.tmp4180 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4179, i32 0, i32 7
%.tmp4181 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4180
%.tmp4182 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4181, i32 0, i32 7
%.tmp4183 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4182
%.tmp4184 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4183, i32 0, i32 7
%.tmp4185 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4184
%.tmp4186 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4185, i32 0, i32 1
%.tmp4187 = load i8*, i8** %.tmp4186
%asname.4188 = alloca i8*
store i8* %.tmp4187, i8** %asname.4188
%.tmp4189 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.4156
%.tmp4190 = icmp eq %m2652$.ModuleLookup.type* %.tmp4189, null
br i1 %.tmp4190, label %.if.true.4191, label %.if.false.4191
.if.true.4191:
%.tmp4192 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* null, i32 1
%.tmp4193 = ptrtoint %m2652$.ModuleLookup.type* %.tmp4192 to i32
%.tmp4194 = call i8*(i32) @malloc(i32 %.tmp4193)
%.tmp4195 = bitcast i8* %.tmp4194 to %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* %.tmp4195, %m2652$.ModuleLookup.type** %mod.4156
%.tmp4196 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.4156
%.tmp4197 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp4196, i32 0, i32 0
%.tmp4198 = load i8*, i8** %mod_abspath.4136
store i8* %.tmp4198, i8** %.tmp4197
%.tmp4199 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.4156
%.tmp4200 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp4199, i32 0, i32 2
store %m2652$.ModuleLookup.type* null, %m2652$.ModuleLookup.type** %.tmp4200
%.tmp4201 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.4156
%.tmp4202 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp4201, i32 0, i32 3
store %m2652$.Scope.type* null, %m2652$.Scope.type** %.tmp4202
%.tmp4203 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.4156
%.tmp4204 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp4203, i32 0, i32 1
%.tmp4205 = getelementptr i8*, i8** %.tmp4204, i32 0
%.tmp4207 = getelementptr [5 x i8], [5 x i8]*@.str4206, i32 0, i32 0
%.tmp4208 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4209 = call i32(%m2652$.CompilerCtx.type*) @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp4208)
%.tmp4210 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4205, i8* %.tmp4207, i32 %.tmp4209)
%.tmp4212 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4213 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4212, i32 0, i32 6
%.tmp4214 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %.tmp4213
store %m2652$.ModuleLookup.type* %.tmp4214, %m2652$.ModuleLookup.type** %m.4154
br label %.for.start.4211
.for.start.4211:
%.tmp4215 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.4154
%.tmp4216 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp4215, i32 0, i32 2
%.tmp4217 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %.tmp4216
%.tmp4218 = icmp ne %m2652$.ModuleLookup.type* %.tmp4217, null
br i1 %.tmp4218, label %.for.continue.4211, label %.for.end.4211
.for.continue.4211:
%.tmp4219 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.4154
%.tmp4220 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp4219, i32 0, i32 2
%.tmp4221 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %.tmp4220
store %m2652$.ModuleLookup.type* %.tmp4221, %m2652$.ModuleLookup.type** %m.4154
br label %.for.start.4211
.for.end.4211:
%.tmp4222 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %m.4154
%.tmp4223 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp4222, i32 0, i32 2
%.tmp4224 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.4156
store %m2652$.ModuleLookup.type* %.tmp4224, %m2652$.ModuleLookup.type** %.tmp4223
%.tmp4225 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4226 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4227 = load i8*, i8** %asname.4188
%.tmp4228 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.4156
%.tmp4229 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp4228, i32 0, i32 0
%.tmp4230 = load i8*, i8** %.tmp4229
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*,i8*) @m295$define_module.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.cp(%m2652$.CompilerCtx.type* %.tmp4225, %m980$.Node.type* %.tmp4226, i8* %.tmp4227, i8* %.tmp4230)
%.tmp4231 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4232 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4231, i32 0, i32 7
%.tmp4233 = load i8*, i8** %.tmp4232
%curr_mod.4234 = alloca i8*
store i8* %.tmp4233, i8** %curr_mod.4234
%.tmp4235 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4236 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4235, i32 0, i32 7
%.tmp4237 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.4156
%.tmp4238 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp4237, i32 0, i32 0
%.tmp4239 = load i8*, i8** %.tmp4238
store i8* %.tmp4239, i8** %.tmp4236
%.tmp4240 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4241 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4242 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.4156
%.tmp4243 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp4242, i32 0, i32 0
%.tmp4244 = load i8*, i8** %.tmp4243
%.tmp4245 = call i1(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$compile_file.b.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp4240, %m980$.Node.type* %.tmp4241, i8* %.tmp4244)
%.tmp4246 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4247 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4246, i32 0, i32 7
%.tmp4248 = load i8*, i8** %curr_mod.4234
store i8* %.tmp4248, i8** %.tmp4247
br label %.if.end.4191
.if.false.4191:
%.tmp4249 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4250 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4251 = load i8*, i8** %asname.4188
%.tmp4252 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.4156
%.tmp4253 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp4252, i32 0, i32 0
%.tmp4254 = load i8*, i8** %.tmp4253
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*,i8*) @m295$define_module.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.cp(%m2652$.CompilerCtx.type* %.tmp4249, %m980$.Node.type* %.tmp4250, i8* %.tmp4251, i8* %.tmp4254)
br label %.if.end.4191
.if.end.4191:
br label %.if.end.4096
.if.false.4096:
br label %.if.end.4096
.if.end.4096:
br label %.if.end.4093
.if.false.4093:
%.tmp4255 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4256 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4258 = getelementptr [40 x i8], [40 x i8]*@.str4257, i32 0, i32 0
%.tmp4259 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp4255, %m980$.Node.type* %.tmp4256, i8* %.tmp4258)
%.tmp4260 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4261 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4260, i32 0, i32 0
%.tmp4262 = load i8*, i8** %.tmp4261
%.tmp4263 = call i32(i8*,...) @printf(i8* %.tmp4259, i8* %.tmp4262)
br label %.if.end.4093
.if.end.4093:
br label %.if.end.3944
.if.end.3944:
br label %.if.end.3873
.if.end.3873:
br label %.if.end.3774
.if.end.3774:
br label %.if.end.3708
.if.end.3708:
br label %.if.end.3700
.if.end.3700:
ret void
}
define i8* @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf.4264 = alloca i8*
store i8* null, i8** %buf.4264
%.tmp4265 = getelementptr i8*, i8** %buf.4264, i32 0
%.tmp4267 = getelementptr [31 x i8], [31 x i8]*@.str4266, i32 0, i32 0
%.tmp4268 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4269 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4268, i32 0, i32 7
%.tmp4270 = load i8*, i8** %.tmp4269
%.tmp4271 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4272 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4271, i32 0, i32 3
%.tmp4273 = load i32, i32* %.tmp4272
%.tmp4274 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4275 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4274, i32 0, i32 4
%.tmp4276 = load i32, i32* %.tmp4275
%.tmp4277 = load i8*, i8** %msg
%.tmp4278 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4265, i8* %.tmp4267, i8* %.tmp4270, i32 %.tmp4273, i32 %.tmp4276, i8* %.tmp4277)
%.tmp4279 = load i8*, i8** %buf.4264
ret i8* %.tmp4279
}
define void @m295$compile_fn_params.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.fn_params.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%fn_params = alloca %m980$.Node.type*
store %m980$.Node.type* %.fn_params.arg, %m980$.Node.type** %fn_params
%param_type.4280 = alloca %m2652$.Type.type*
store %m2652$.Type.type* null, %m2652$.Type.type** %param_type.4280
%.tmp4282 = load %m980$.Node.type*, %m980$.Node.type** %fn_params
%param_ptr.4283 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4282, %m980$.Node.type** %param_ptr.4283
br label %.for.start.4281
.for.start.4281:
%.tmp4284 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4283
%.tmp4285 = icmp ne %m980$.Node.type* %.tmp4284, null
br i1 %.tmp4285, label %.for.continue.4281, label %.for.end.4281
.for.continue.4281:
%.tmp4286 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4283
%.tmp4287 = load %m980$.Node.type*, %m980$.Node.type** %fn_params
%.tmp4288 = icmp ne %m980$.Node.type* %.tmp4286, %.tmp4287
br i1 %.tmp4288, label %.if.true.4289, label %.if.false.4289
.if.true.4289:
%.tmp4290 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4283
%.tmp4291 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4290, i32 0, i32 7
%.tmp4292 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4291
store %m980$.Node.type* %.tmp4292, %m980$.Node.type** %param_ptr.4283
br label %.if.end.4289
.if.false.4289:
br label %.if.end.4289
.if.end.4289:
%.tmp4293 = load %m980$.Node.type*, %m980$.Node.type** %fn_params
%.tmp4294 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4293)
%param_info.4295 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp4294, %m2652$.AssignableInfo.type** %param_info.4295
%.tmp4296 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %param_info.4295
%.tmp4297 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4296, i32 0, i32 3
%.tmp4299 = getelementptr [9 x i8], [9 x i8]*@.str4298, i32 0, i32 0
store i8* %.tmp4299, i8** %.tmp4297
%.tmp4300 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4283
%.tmp4301 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4300, i32 0, i32 0
%.tmp4302 = load i8*, i8** %.tmp4301
%.tmp4304 = getelementptr [5 x i8], [5 x i8]*@.str4303, i32 0, i32 0
%.tmp4305 = call i32(i8*,i8*) @strcmp(i8* %.tmp4302, i8* %.tmp4304)
%.tmp4306 = icmp eq i32 %.tmp4305, 0
br i1 %.tmp4306, label %.if.true.4307, label %.if.false.4307
.if.true.4307:
%.tmp4308 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4309 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4283
%.tmp4310 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4309, i32 0, i32 6
%.tmp4311 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4310
%.tmp4312 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp4308, %m980$.Node.type* %.tmp4311)
store %m2652$.Type.type* %.tmp4312, %m2652$.Type.type** %param_type.4280
%.tmp4313 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4283
%.tmp4314 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4313, i32 0, i32 7
%.tmp4315 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4314
store %m980$.Node.type* %.tmp4315, %m980$.Node.type** %param_ptr.4283
br label %.if.end.4307
.if.false.4307:
br label %.if.end.4307
.if.end.4307:
%.tmp4316 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %param_info.4295
%.tmp4317 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4316, i32 0, i32 4
%.tmp4318 = load %m2652$.Type.type*, %m2652$.Type.type** %param_type.4280
store %m2652$.Type.type* %.tmp4318, %m2652$.Type.type** %.tmp4317
%.tmp4319 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4283
%.tmp4320 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4319, i32 0, i32 1
%.tmp4321 = load i8*, i8** %.tmp4320
%var_name.4322 = alloca i8*
store i8* %.tmp4321, i8** %var_name.4322
%.tmp4323 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %param_info.4295
%.tmp4324 = load i8, i8* @SCOPE_LOCAL
%.tmp4325 = load i8*, i8** %var_name.4322
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp4323, i8 %.tmp4324, i8* %.tmp4325)
%.tmp4326 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4327 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %param_info.4295
%.tmp4328 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4327, i32 0, i32 4
%.tmp4329 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4328
%.tmp4330 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4326, %m2652$.Type.type* %.tmp4329)
%param_info_tr.4331 = alloca i8*
store i8* %.tmp4330, i8** %param_info_tr.4331
%.tmp4332 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4333 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4332, i32 0, i32 1
%.tmp4334 = load %m0$.File.type*, %m0$.File.type** %.tmp4333
%.tmp4336 = getelementptr [16 x i8], [16 x i8]*@.str4335, i32 0, i32 0
%.tmp4337 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %param_info.4295
%.tmp4338 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp4337)
%.tmp4339 = load i8*, i8** %param_info_tr.4331
%.tmp4340 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4334, i8* %.tmp4336, i8* %.tmp4338, i8* %.tmp4339)
%.tmp4341 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4342 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4283
%.tmp4343 = load i8*, i8** %var_name.4322
%.tmp4344 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %param_info.4295
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2652$.AssignableInfo.type*) @m295$define_assignable.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp4341, %m980$.Node.type* %.tmp4342, i8* %.tmp4343, %m2652$.AssignableInfo.type* %.tmp4344)
%.tmp4345 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4346 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4345, i32 0, i32 1
%.tmp4347 = load %m0$.File.type*, %m0$.File.type** %.tmp4346
%.tmp4349 = getelementptr [28 x i8], [28 x i8]*@.str4348, i32 0, i32 0
%.tmp4350 = load i8*, i8** %param_info_tr.4331
%.tmp4351 = load i8*, i8** %var_name.4322
%.tmp4352 = load i8*, i8** %param_info_tr.4331
%.tmp4353 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %param_info.4295
%.tmp4354 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp4353)
%.tmp4355 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4347, i8* %.tmp4349, i8* %.tmp4350, i8* %.tmp4351, i8* %.tmp4352, i8* %.tmp4354)
%.tmp4356 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4283
%.tmp4357 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4356, i32 0, i32 7
%.tmp4358 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4357
store %m980$.Node.type* %.tmp4358, %m980$.Node.type** %param_ptr.4283
br label %.for.start.4281
.for.end.4281:
ret void
}
define void @m295$compile_block.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp4359 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4361 = getelementptr [6 x i8], [6 x i8]*@.str4360, i32 0, i32 0
%.tmp4362 = bitcast ptr null to i8*
%.tmp4363 = bitcast ptr null to i8*
%.tmp4364 = bitcast ptr null to %m2652$.Type.type*
call void(%m2652$.CompilerCtx.type*,i8*,i8*,i8*,%m2652$.Type.type*) @m295$push_scope.v.m2652$.CompilerCtx.typep.cp.cp.cp.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4359, i8* %.tmp4361, i8* %.tmp4362, i8* %.tmp4363, %m2652$.Type.type* %.tmp4364)
%.tmp4365 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4366 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4365, i32 0, i32 6
%.tmp4367 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4366
%.tmp4369 = getelementptr [12 x i8], [12 x i8]*@.str4368, i32 0, i32 0
%.tmp4370 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4367, i8* %.tmp4369)
%exprs.4371 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4370, %m980$.Node.type** %exprs.4371
%.tmp4372 = load %m980$.Node.type*, %m980$.Node.type** %exprs.4371
%.tmp4373 = icmp ne %m980$.Node.type* %.tmp4372, null
br i1 %.tmp4373, label %.if.true.4374, label %.if.false.4374
.if.true.4374:
%.tmp4376 = load %m980$.Node.type*, %m980$.Node.type** %exprs.4371
%.tmp4377 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4376, i32 0, i32 6
%.tmp4378 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4377
%b.4379 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4378, %m980$.Node.type** %b.4379
br label %.for.start.4375
.for.start.4375:
%.tmp4380 = load %m980$.Node.type*, %m980$.Node.type** %b.4379
%.tmp4381 = icmp ne %m980$.Node.type* %.tmp4380, null
br i1 %.tmp4381, label %.for.continue.4375, label %.for.end.4375
.for.continue.4375:
%.tmp4382 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4383 = load %m980$.Node.type*, %m980$.Node.type** %b.4379
%.tmp4384 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4383, i32 0, i32 6
%.tmp4385 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4384
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_expression.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp4382, %m980$.Node.type* %.tmp4385)
%.tmp4386 = load %m980$.Node.type*, %m980$.Node.type** %b.4379
%.tmp4387 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4386, i32 0, i32 7
%.tmp4388 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4387
store %m980$.Node.type* %.tmp4388, %m980$.Node.type** %b.4379
br label %.for.start.4375
.for.end.4375:
br label %.if.end.4374
.if.false.4374:
br label %.if.end.4374
.if.end.4374:
%.tmp4389 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
call void(%m2652$.CompilerCtx.type*) @m295$pop_scope.v.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp4389)
ret void
}
define %m2652$.AssignableInfo.type* @m295$get_struct_attr.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep.i(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp4390 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4391 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4392 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp4390, %m980$.Node.type* %.tmp4391)
%val.4393 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp4392, %m2652$.AssignableInfo.type** %val.4393
%.tmp4394 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %val.4393
%.tmp4395 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4394, i32 0, i32 4
%.tmp4396 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4395
%.tmp4397 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4396, i32 0, i32 0
%.tmp4398 = load i8*, i8** %.tmp4397
%.tmp4400 = getelementptr [7 x i8], [7 x i8]*@.str4399, i32 0, i32 0
%.tmp4401 = call i32(i8*,i8*) @strcmp(i8* %.tmp4398, i8* %.tmp4400)
%.tmp4402 = icmp ne i32 %.tmp4401, 0
br i1 %.tmp4402, label %.if.true.4403, label %.if.false.4403
.if.true.4403:
%.tmp4405 = getelementptr [7 x i8], [7 x i8]*@.str4404, i32 0, i32 0
%.tmp4406 = call i32(i8*,...) @printf(i8* %.tmp4405)
%.tmp4407 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp4407
br label %.if.end.4403
.if.false.4403:
br label %.if.end.4403
.if.end.4403:
%.tmp4408 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %val.4393
%.tmp4409 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4408, i32 0, i32 4
%.tmp4410 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4409
%.tmp4411 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4410, i32 0, i32 3
%.tmp4412 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4411
%node_type.4413 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp4412, %m2652$.Type.type** %node_type.4413
%i.4415 = alloca i32
store i32 0, i32* %i.4415
br label %.for.start.4414
.for.start.4414:
%.tmp4416 = load i32, i32* %i.4415
%.tmp4417 = load i32, i32* %attr_id
%.tmp4418 = icmp slt i32 %.tmp4416, %.tmp4417
br i1 %.tmp4418, label %.for.continue.4414, label %.for.end.4414
.for.continue.4414:
%.tmp4419 = load %m2652$.Type.type*, %m2652$.Type.type** %node_type.4413
%.tmp4420 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4419, i32 0, i32 4
%.tmp4421 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4420
store %m2652$.Type.type* %.tmp4421, %m2652$.Type.type** %node_type.4413
%.tmp4422 = load i32, i32* %i.4415
%.tmp4423 = add i32 %.tmp4422, 1
store i32 %.tmp4423, i32* %i.4415
br label %.for.start.4414
.for.end.4414:
%.tmp4424 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4425 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4424)
%info.4426 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp4425, %m2652$.AssignableInfo.type** %info.4426
%.tmp4427 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4426
%.tmp4428 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4427, i32 0, i32 4
%.tmp4429 = load %m2652$.Type.type*, %m2652$.Type.type** %node_type.4413
store %m2652$.Type.type* %.tmp4429, %m2652$.Type.type** %.tmp4428
%.tmp4430 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4431 = call i32(%m2652$.CompilerCtx.type*) @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp4430)
%tmp_id.4432 = alloca i32
store i32 %.tmp4431, i32* %tmp_id.4432
%.tmp4433 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4434 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %val.4393
%.tmp4435 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4434, i32 0, i32 4
%.tmp4436 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4435
%.tmp4437 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4433, %m2652$.Type.type* %.tmp4436)
%type_as_str.4438 = alloca i8*
store i8* %.tmp4437, i8** %type_as_str.4438
%.tmp4439 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4440 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4426
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp4439, %m2652$.AssignableInfo.type* %.tmp4440)
%.tmp4441 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4442 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4441, i32 0, i32 1
%.tmp4443 = load %m0$.File.type*, %m0$.File.type** %.tmp4442
%.tmp4445 = getelementptr [52 x i8], [52 x i8]*@.str4444, i32 0, i32 0
%.tmp4446 = load i32, i32* %tmp_id.4432
%.tmp4447 = load i8*, i8** %type_as_str.4438
%.tmp4448 = load i8*, i8** %type_as_str.4438
%.tmp4449 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %val.4393
%.tmp4450 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp4449)
%.tmp4451 = load i32, i32* %attr_id
%.tmp4452 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4443, i8* %.tmp4445, i32 %.tmp4446, i8* %.tmp4447, i8* %.tmp4448, i8* %.tmp4450, i32 %.tmp4451)
%.tmp4453 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4454 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4453, i32 0, i32 1
%.tmp4455 = load %m0$.File.type*, %m0$.File.type** %.tmp4454
%.tmp4457 = getelementptr [28 x i8], [28 x i8]*@.str4456, i32 0, i32 0
%.tmp4458 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4426
%.tmp4459 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp4458)
%.tmp4460 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4461 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4426
%.tmp4462 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4461, i32 0, i32 4
%.tmp4463 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4462
%.tmp4464 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4460, %m2652$.Type.type* %.tmp4463)
%.tmp4465 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4466 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4426
%.tmp4467 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4466, i32 0, i32 4
%.tmp4468 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4467
%.tmp4469 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4465, %m2652$.Type.type* %.tmp4468)
%.tmp4470 = load i32, i32* %tmp_id.4432
%.tmp4471 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4455, i8* %.tmp4457, i8* %.tmp4459, i8* %.tmp4464, i8* %.tmp4469, i32 %.tmp4470)
%.tmp4472 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4426
ret %m2652$.AssignableInfo.type* %.tmp4472
}
define void @m295$set_struct_attr.v.m2652$.CompilerCtx.typep.m980$.Node.typep.i.cp(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i32 %.attr_id.arg, i8* %.attr.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%attr = alloca i8*
store i8* %.attr.arg, i8** %attr
%.tmp4473 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4474 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4475 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp4473, %m980$.Node.type* %.tmp4474)
%val.4476 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp4475, %m2652$.AssignableInfo.type** %val.4476
%.tmp4477 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %val.4476
%.tmp4478 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4477, i32 0, i32 4
%.tmp4479 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4478
%.tmp4480 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4479, i32 0, i32 0
%.tmp4481 = load i8*, i8** %.tmp4480
%.tmp4483 = getelementptr [7 x i8], [7 x i8]*@.str4482, i32 0, i32 0
%.tmp4484 = call i32(i8*,i8*) @strcmp(i8* %.tmp4481, i8* %.tmp4483)
%.tmp4485 = icmp ne i32 %.tmp4484, 0
br i1 %.tmp4485, label %.if.true.4486, label %.if.false.4486
.if.true.4486:
%.tmp4488 = getelementptr [7 x i8], [7 x i8]*@.str4487, i32 0, i32 0
%.tmp4489 = call i32(i8*,...) @printf(i8* %.tmp4488)
ret void
br label %.if.end.4486
.if.false.4486:
br label %.if.end.4486
.if.end.4486:
%.tmp4490 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %val.4476
%.tmp4491 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4490, i32 0, i32 4
%.tmp4492 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4491
%.tmp4493 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4492, i32 0, i32 3
%.tmp4494 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4493
%node_type.4495 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp4494, %m2652$.Type.type** %node_type.4495
%i.4497 = alloca i32
store i32 0, i32* %i.4497
br label %.for.start.4496
.for.start.4496:
%.tmp4498 = load i32, i32* %i.4497
%.tmp4499 = load i32, i32* %attr_id
%.tmp4500 = icmp slt i32 %.tmp4498, %.tmp4499
br i1 %.tmp4500, label %.for.continue.4496, label %.for.end.4496
.for.continue.4496:
%.tmp4501 = load %m2652$.Type.type*, %m2652$.Type.type** %node_type.4495
%.tmp4502 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4501, i32 0, i32 4
%.tmp4503 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4502
store %m2652$.Type.type* %.tmp4503, %m2652$.Type.type** %node_type.4495
%.tmp4504 = load i32, i32* %i.4497
%.tmp4505 = add i32 %.tmp4504, 1
store i32 %.tmp4505, i32* %i.4497
br label %.for.start.4496
.for.end.4496:
%.tmp4506 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4507 = call i32(%m2652$.CompilerCtx.type*) @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp4506)
%tmp_id.4508 = alloca i32
store i32 %.tmp4507, i32* %tmp_id.4508
%.tmp4509 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4510 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %val.4476
%.tmp4511 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4510, i32 0, i32 4
%.tmp4512 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4511
%.tmp4513 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4509, %m2652$.Type.type* %.tmp4512)
%type_as_str.4514 = alloca i8*
store i8* %.tmp4513, i8** %type_as_str.4514
%.tmp4515 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4516 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4515, i32 0, i32 1
%.tmp4517 = load %m0$.File.type*, %m0$.File.type** %.tmp4516
%.tmp4519 = getelementptr [52 x i8], [52 x i8]*@.str4518, i32 0, i32 0
%.tmp4520 = load i32, i32* %tmp_id.4508
%.tmp4521 = load i8*, i8** %type_as_str.4514
%.tmp4522 = load i8*, i8** %type_as_str.4514
%.tmp4523 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %val.4476
%.tmp4524 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp4523)
%.tmp4525 = load i32, i32* %attr_id
%.tmp4526 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4517, i8* %.tmp4519, i32 %.tmp4520, i8* %.tmp4521, i8* %.tmp4522, i8* %.tmp4524, i32 %.tmp4525)
%.tmp4527 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4528 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4527, i32 0, i32 1
%.tmp4529 = load %m0$.File.type*, %m0$.File.type** %.tmp4528
%.tmp4531 = getelementptr [18 x i8], [18 x i8]*@.str4530, i32 0, i32 0
%.tmp4532 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4533 = load %m2652$.Type.type*, %m2652$.Type.type** %node_type.4495
%.tmp4534 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4532, %m2652$.Type.type* %.tmp4533)
%.tmp4535 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4536 = load %m2652$.Type.type*, %m2652$.Type.type** %node_type.4495
%.tmp4537 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4535, %m2652$.Type.type* %.tmp4536)
%.tmp4538 = load i8*, i8** %attr
%.tmp4539 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4529, i8* %.tmp4531, i8* %.tmp4534, i8* %.tmp4537, i8* %.tmp4538)
ret void
}
define %m2652$.AssignableInfo.type* @m295$compile_builtin.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp4540 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4541 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4540, i32 0, i32 6
%.tmp4542 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4541
%.tmp4543 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4542, i32 0, i32 6
%.tmp4544 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4543
%dotted.4545 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4544, %m980$.Node.type** %dotted.4545
%.tmp4546 = load %m980$.Node.type*, %m980$.Node.type** %dotted.4545
%.tmp4547 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4546, i32 0, i32 7
%.tmp4548 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4547
%.tmp4549 = icmp ne %m980$.Node.type* %.tmp4548, null
br i1 %.tmp4549, label %.if.true.4550, label %.if.false.4550
.if.true.4550:
%.tmp4551 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp4551
br label %.if.end.4550
.if.false.4550:
br label %.if.end.4550
.if.end.4550:
%.tmp4552 = load %m980$.Node.type*, %m980$.Node.type** %dotted.4545
%.tmp4553 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4552, i32 0, i32 1
%.tmp4554 = load i8*, i8** %.tmp4553
%.tmp4556 = getelementptr [7 x i8], [7 x i8]*@.str4555, i32 0, i32 0
%.tmp4557 = call i32(i8*,i8*) @strcmp(i8* %.tmp4554, i8* %.tmp4556)
%.tmp4558 = icmp eq i32 %.tmp4557, 0
br i1 %.tmp4558, label %.if.true.4559, label %.if.false.4559
.if.true.4559:
%.tmp4560 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4562 = getelementptr [8 x i8], [8 x i8]*@.str4561, i32 0, i32 0
%.tmp4563 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4560, i8* %.tmp4562)
%args.4564 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4563, %m980$.Node.type** %args.4564
%.tmp4565 = load %m980$.Node.type*, %m980$.Node.type** %args.4564
%.tmp4566 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4565, i32 0, i32 6
%.tmp4567 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4566
%.tmp4569 = getelementptr [11 x i8], [11 x i8]*@.str4568, i32 0, i32 0
%.tmp4570 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4567, i8* %.tmp4569)
%value.4571 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4570, %m980$.Node.type** %value.4571
%.tmp4572 = load %m980$.Node.type*, %m980$.Node.type** %value.4571
%.tmp4573 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4572, i32 0, i32 6
%.tmp4574 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4573
%.tmp4575 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4574, i32 0, i32 6
%.tmp4576 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4575
%.tmp4577 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4576, i32 0, i32 6
%.tmp4578 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4577
%.tmp4579 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4578, i32 0, i32 6
%.tmp4580 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4579
store %m980$.Node.type* %.tmp4580, %m980$.Node.type** %value.4571
%.tmp4581 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4582 = call i32(%m2652$.CompilerCtx.type*) @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp4581)
%tmp_id.4583 = alloca i32
store i32 %.tmp4582, i32* %tmp_id.4583
%.tmp4584 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4585 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4584)
%info.4586 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp4585, %m2652$.AssignableInfo.type** %info.4586
%.tmp4587 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4588 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4586
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp4587, %m2652$.AssignableInfo.type* %.tmp4588)
%.tmp4589 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4586
%.tmp4590 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4589, i32 0, i32 4
%.tmp4591 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp4591, %m2652$.Type.type** %.tmp4590
%.tmp4592 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4586
%.tmp4593 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4592, i32 0, i32 4
%.tmp4594 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4593
%.tmp4595 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4594, i32 0, i32 0
%.tmp4597 = getelementptr [4 x i8], [4 x i8]*@.str4596, i32 0, i32 0
store i8* %.tmp4597, i8** %.tmp4595
%.tmp4598 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4599 = load %m980$.Node.type*, %m980$.Node.type** %value.4571
%.tmp4600 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp4598, %m980$.Node.type* %.tmp4599)
%inspected_type.4601 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp4600, %m2652$.Type.type** %inspected_type.4601
%.tmp4602 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4603 = load %m2652$.Type.type*, %m2652$.Type.type** %inspected_type.4601
%.tmp4604 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4602, %m2652$.Type.type* %.tmp4603)
%type_as_str.4605 = alloca i8*
store i8* %.tmp4604, i8** %type_as_str.4605
%.tmp4606 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4607 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4606, i32 0, i32 1
%.tmp4608 = load %m0$.File.type*, %m0$.File.type** %.tmp4607
%.tmp4610 = getelementptr [46 x i8], [46 x i8]*@.str4609, i32 0, i32 0
%.tmp4611 = load i32, i32* %tmp_id.4583
%.tmp4612 = load i8*, i8** %type_as_str.4605
%.tmp4613 = load i8*, i8** %type_as_str.4605
%.tmp4614 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4608, i8* %.tmp4610, i32 %.tmp4611, i8* %.tmp4612, i8* %.tmp4613)
%.tmp4615 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4616 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4615, i32 0, i32 1
%.tmp4617 = load %m0$.File.type*, %m0$.File.type** %.tmp4616
%.tmp4619 = getelementptr [35 x i8], [35 x i8]*@.str4618, i32 0, i32 0
%.tmp4620 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4586
%.tmp4621 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp4620)
%.tmp4622 = load i8*, i8** %type_as_str.4605
%.tmp4623 = load i32, i32* %tmp_id.4583
%.tmp4624 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4617, i8* %.tmp4619, i8* %.tmp4621, i8* %.tmp4622, i32 %.tmp4623)
%.tmp4625 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4586
ret %m2652$.AssignableInfo.type* %.tmp4625
br label %.if.end.4559
.if.false.4559:
%.tmp4626 = load %m980$.Node.type*, %m980$.Node.type** %dotted.4545
%.tmp4627 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4626, i32 0, i32 1
%.tmp4628 = load i8*, i8** %.tmp4627
%.tmp4630 = getelementptr [7 x i8], [7 x i8]*@.str4629, i32 0, i32 0
%.tmp4631 = call i32(i8*,i8*) @strcmp(i8* %.tmp4628, i8* %.tmp4630)
%.tmp4632 = icmp eq i32 %.tmp4631, 0
br i1 %.tmp4632, label %.if.true.4633, label %.if.false.4633
.if.true.4633:
%.tmp4634 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4636 = getelementptr [8 x i8], [8 x i8]*@.str4635, i32 0, i32 0
%.tmp4637 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4634, i8* %.tmp4636)
%args.4638 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4637, %m980$.Node.type** %args.4638
%.tmp4639 = load %m980$.Node.type*, %m980$.Node.type** %args.4638
%.tmp4640 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4639, i32 0, i32 6
%.tmp4641 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4640
%.tmp4643 = getelementptr [11 x i8], [11 x i8]*@.str4642, i32 0, i32 0
%.tmp4644 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4641, i8* %.tmp4643)
%array.4645 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4644, %m980$.Node.type** %array.4645
%.tmp4646 = load %m980$.Node.type*, %m980$.Node.type** %array.4645
%.tmp4647 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4646, i32 0, i32 7
%.tmp4648 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4647
%.tmp4650 = getelementptr [11 x i8], [11 x i8]*@.str4649, i32 0, i32 0
%.tmp4651 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4648, i8* %.tmp4650)
%value.4652 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4651, %m980$.Node.type** %value.4652
%.tmp4653 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4654 = load %m980$.Node.type*, %m980$.Node.type** %value.4652
%.tmp4655 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp4653, %m980$.Node.type* %.tmp4654)
%value_info.4656 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp4655, %m2652$.AssignableInfo.type** %value_info.4656
%.tmp4657 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4658 = load %m980$.Node.type*, %m980$.Node.type** %array.4645
%.tmp4659 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp4657, %m980$.Node.type* %.tmp4658)
%array_info.4660 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp4659, %m2652$.AssignableInfo.type** %array_info.4660
%.tmp4661 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4662 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4661)
%info.4663 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp4662, %m2652$.AssignableInfo.type** %info.4663
%.tmp4664 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4665 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4663
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp4664, %m2652$.AssignableInfo.type* %.tmp4665)
%.tmp4666 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4663
%.tmp4667 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4666, i32 0, i32 4
%.tmp4668 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %array_info.4660
%.tmp4669 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4668, i32 0, i32 4
%.tmp4670 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4669
store %m2652$.Type.type* %.tmp4670, %m2652$.Type.type** %.tmp4667
%builtin_prefix.4671 = alloca i8*
store i8* null, i8** %builtin_prefix.4671
%.tmp4672 = getelementptr i8*, i8** %builtin_prefix.4671, i32 0
%.tmp4674 = getelementptr [5 x i8], [5 x i8]*@.str4673, i32 0, i32 0
%.tmp4675 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4676 = call i32(%m2652$.CompilerCtx.type*) @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp4675)
%.tmp4677 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4672, i8* %.tmp4674, i32 %.tmp4676)
%.tmp4678 = call i8*() @m2203$append_tmpl.cp()
%tmpl.4679 = alloca i8*
store i8* %.tmp4678, i8** %tmpl.4679
%.tmp4680 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4681 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4680, i32 0, i32 1
%.tmp4682 = load %m0$.File.type*, %m0$.File.type** %.tmp4681
%.tmp4683 = load i8*, i8** %tmpl.4679
%.tmp4684 = load i8*, i8** %builtin_prefix.4671
%.tmp4685 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4686 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %array_info.4660
%.tmp4687 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4686, i32 0, i32 4
%.tmp4688 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4687
%.tmp4689 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4685, %m2652$.Type.type* %.tmp4688)
%.tmp4690 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %array_info.4660
%.tmp4691 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp4690)
%.tmp4692 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4693 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %value_info.4656
%.tmp4694 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4693, i32 0, i32 4
%.tmp4695 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4694
%.tmp4696 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4692, %m2652$.Type.type* %.tmp4695)
%.tmp4697 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %value_info.4656
%.tmp4698 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp4697)
%.tmp4699 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4663
%.tmp4700 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp4699)
%.tmp4701 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4682, i8* %.tmp4683, i8* %.tmp4684, i8* %.tmp4689, i8* %.tmp4691, i8* %.tmp4696, i8* %.tmp4698, i8* %.tmp4700)
%.tmp4702 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4703 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4702)
%info_g.4704 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp4703, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4705 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4706 = load i8, i8* @SCOPE_GLOBAL
%.tmp4708 = getelementptr [8 x i8], [8 x i8]*@.str4707, i32 0, i32 0
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp4705, i8 %.tmp4706, i8* %.tmp4708)
%.tmp4709 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4710 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4709, i32 0, i32 4
%.tmp4711 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp4711, %m2652$.Type.type** %.tmp4710
%.tmp4712 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4713 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4712, i32 0, i32 4
%.tmp4714 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4713
%.tmp4715 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4714, i32 0, i32 0
%.tmp4717 = getelementptr [9 x i8], [9 x i8]*@.str4716, i32 0, i32 0
store i8* %.tmp4717, i8** %.tmp4715
%.tmp4718 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4719 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4718, i32 0, i32 4
%.tmp4720 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4719
%.tmp4721 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4720, i32 0, i32 3
%.tmp4722 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp4722, %m2652$.Type.type** %.tmp4721
%.tmp4723 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4724 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4723, i32 0, i32 4
%.tmp4725 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4724
%.tmp4726 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4725, i32 0, i32 3
%.tmp4727 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4726
%.tmp4728 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4727, i32 0, i32 0
%.tmp4730 = getelementptr [4 x i8], [4 x i8]*@.str4729, i32 0, i32 0
store i8* %.tmp4730, i8** %.tmp4728
%.tmp4731 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4732 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4731, i32 0, i32 4
%.tmp4733 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4732
%.tmp4734 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4733, i32 0, i32 3
%.tmp4735 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4734
%.tmp4736 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4735, i32 0, i32 3
%.tmp4737 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp4737, %m2652$.Type.type** %.tmp4736
%.tmp4738 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4739 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4738, i32 0, i32 4
%.tmp4740 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4739
%.tmp4741 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4740, i32 0, i32 3
%.tmp4742 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4741
%.tmp4743 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4742, i32 0, i32 3
%.tmp4744 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4743
%.tmp4745 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4744, i32 0, i32 0
%.tmp4747 = getelementptr [4 x i8], [4 x i8]*@.str4746, i32 0, i32 0
store i8* %.tmp4747, i8** %.tmp4745
%.tmp4748 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4749 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4748, i32 0, i32 4
%.tmp4750 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4749
%.tmp4751 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4750, i32 0, i32 3
%.tmp4752 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4751
%.tmp4753 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4752, i32 0, i32 4
%.tmp4754 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp4754, %m2652$.Type.type** %.tmp4753
%.tmp4755 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4756 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4755, i32 0, i32 4
%.tmp4757 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4756
%.tmp4758 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4757, i32 0, i32 3
%.tmp4759 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4758
%.tmp4760 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4759, i32 0, i32 4
%.tmp4761 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4760
%.tmp4762 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4761, i32 0, i32 0
%.tmp4764 = getelementptr [4 x i8], [4 x i8]*@.str4763, i32 0, i32 0
store i8* %.tmp4764, i8** %.tmp4762
%.tmp4765 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4766 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4765, i32 0, i32 4
%.tmp4767 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4766
%.tmp4768 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4767, i32 0, i32 3
%.tmp4769 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4768
%.tmp4770 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4769, i32 0, i32 4
%.tmp4771 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4770
%.tmp4772 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4771, i32 0, i32 3
%.tmp4773 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp4773, %m2652$.Type.type** %.tmp4772
%.tmp4774 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4775 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4774, i32 0, i32 4
%.tmp4776 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4775
%.tmp4777 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4776, i32 0, i32 3
%.tmp4778 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4777
%.tmp4779 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4778, i32 0, i32 4
%.tmp4780 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4779
%.tmp4781 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4780, i32 0, i32 3
%.tmp4782 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4781
%.tmp4783 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4782, i32 0, i32 0
%.tmp4785 = getelementptr [4 x i8], [4 x i8]*@.str4784, i32 0, i32 0
store i8* %.tmp4785, i8** %.tmp4783
%.tmp4786 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4787 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4786, i32 0, i32 4
%.tmp4788 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4787
%.tmp4789 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4788, i32 0, i32 3
%.tmp4790 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4789
%.tmp4791 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4790, i32 0, i32 4
%.tmp4792 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4791
%.tmp4793 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4792, i32 0, i32 4
%.tmp4794 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp4794, %m2652$.Type.type** %.tmp4793
%.tmp4795 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
%.tmp4796 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4795, i32 0, i32 4
%.tmp4797 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4796
%.tmp4798 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4797, i32 0, i32 3
%.tmp4799 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4798
%.tmp4800 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4799, i32 0, i32 4
%.tmp4801 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4800
%.tmp4802 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4801, i32 0, i32 4
%.tmp4803 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4802
%.tmp4804 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4803, i32 0, i32 0
%.tmp4806 = getelementptr [4 x i8], [4 x i8]*@.str4805, i32 0, i32 0
store i8* %.tmp4806, i8** %.tmp4804
%.tmp4807 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4809 = getelementptr [8 x i8], [8 x i8]*@.str4808, i32 0, i32 0
%.tmp4811 = getelementptr [7 x i8], [7 x i8]*@.str4810, i32 0, i32 0
%.tmp4812 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_g.4704
call void(%m2652$.CompilerCtx.type*,i8*,i8*,%m2652$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2652$.CompilerCtx.typep.cp.cp.m2652$.AssignableInfo.typep.b.b(%m2652$.CompilerCtx.type* %.tmp4807, i8* %.tmp4809, i8* %.tmp4811, %m2652$.AssignableInfo.type* %.tmp4812, i1 1, i1 0)
%.tmp4813 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4663
ret %m2652$.AssignableInfo.type* %.tmp4813
br label %.if.end.4633
.if.false.4633:
%.tmp4814 = load %m980$.Node.type*, %m980$.Node.type** %dotted.4545
%.tmp4815 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4814, i32 0, i32 1
%.tmp4816 = load i8*, i8** %.tmp4815
%.tmp4818 = getelementptr [4 x i8], [4 x i8]*@.str4817, i32 0, i32 0
%.tmp4819 = call i32(i8*,i8*) @strcmp(i8* %.tmp4816, i8* %.tmp4818)
%.tmp4820 = icmp eq i32 %.tmp4819, 0
br i1 %.tmp4820, label %.if.true.4821, label %.if.false.4821
.if.true.4821:
%.tmp4822 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4824 = getelementptr [8 x i8], [8 x i8]*@.str4823, i32 0, i32 0
%.tmp4825 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4822, i8* %.tmp4824)
%args.4826 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4825, %m980$.Node.type** %args.4826
%.tmp4827 = load %m980$.Node.type*, %m980$.Node.type** %args.4826
%.tmp4828 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4827, i32 0, i32 6
%.tmp4829 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4828
%.tmp4831 = getelementptr [11 x i8], [11 x i8]*@.str4830, i32 0, i32 0
%.tmp4832 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4829, i8* %.tmp4831)
%value.4833 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4832, %m980$.Node.type** %value.4833
%.tmp4834 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4835 = load %m980$.Node.type*, %m980$.Node.type** %value.4833
%.tmp4836 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i32) @m295$get_struct_attr.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep.i(%m2652$.CompilerCtx.type* %.tmp4834, %m980$.Node.type* %.tmp4835, i32 1)
ret %m2652$.AssignableInfo.type* %.tmp4836
br label %.if.end.4821
.if.false.4821:
br label %.if.end.4821
.if.end.4821:
br label %.if.end.4633
.if.end.4633:
br label %.if.end.4559
.if.end.4559:
%.tmp4837 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp4837
}
define i8* @m295$resolve_import_path.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp4839 = getelementptr [1 x i8], [1 x i8]*@.str4838, i32 0, i32 0
%err_buf.4840 = alloca i8*
store i8* %.tmp4839, i8** %err_buf.4840
%.tmp4841 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4842 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4841, i32 0, i32 7
%.tmp4843 = load i8*, i8** %.tmp4842
%mod_abspath.4844 = alloca i8*
store i8* %.tmp4843, i8** %mod_abspath.4844
%.tmp4845 = load i8*, i8** %mod_abspath.4844
%.tmp4846 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp4845)
%dirname.4847 = alloca i8*
store i8* %.tmp4846, i8** %dirname.4847
%.tmp4848 = load i8*, i8** %import_str
%.tmp4849 = getelementptr i8, i8* %.tmp4848, i32 0
%.tmp4850 = load i8, i8* %.tmp4849
%.tmp4851 = icmp eq i8 %.tmp4850, 47
br i1 %.tmp4851, label %.if.true.4852, label %.if.false.4852
.if.true.4852:
%.tmp4853 = getelementptr i8*, i8** %err_buf.4840, i32 0
%.tmp4855 = getelementptr [46 x i8], [46 x i8]*@.str4854, i32 0, i32 0
%.tmp4856 = load i8*, i8** %import_str
%.tmp4857 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4853, i8* %.tmp4855, i8* %.tmp4856)
%.tmp4858 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4859 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4860 = load i8*, i8** %err_buf.4840
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp4858, %m980$.Node.type* %.tmp4859, i8* %.tmp4860)
%.tmp4861 = bitcast ptr null to i8*
ret i8* %.tmp4861
br label %.if.end.4852
.if.false.4852:
br label %.if.end.4852
.if.end.4852:
%.tmp4862 = load i8*, i8** %import_str
%.tmp4863 = getelementptr i8, i8* %.tmp4862, i32 0
%.tmp4864 = load i8, i8* %.tmp4863
%.tmp4865 = icmp ne i8 %.tmp4864, 46
%.tmp4866 = load i8*, i8** %import_str
%.tmp4867 = getelementptr i8, i8* %.tmp4866, i32 1
%.tmp4868 = load i8, i8* %.tmp4867
%.tmp4869 = icmp ne i8 %.tmp4868, 47
%.tmp4870 = and i1 %.tmp4865, %.tmp4869
br i1 %.tmp4870, label %.if.true.4871, label %.if.false.4871
.if.true.4871:
%.tmp4872 = call i8*() @m295$get_root.cp()
%root.4873 = alloca i8*
store i8* %.tmp4872, i8** %root.4873
%.tmp4874 = getelementptr i8*, i8** %mod_abspath.4844, i32 0
%.tmp4876 = getelementptr [13 x i8], [13 x i8]*@.str4875, i32 0, i32 0
%.tmp4877 = load i8*, i8** %root.4873
%.tmp4878 = load i8*, i8** %import_str
%.tmp4879 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4874, i8* %.tmp4876, i8* %.tmp4877, i8* %.tmp4878)
br label %.if.end.4871
.if.false.4871:
%.tmp4880 = load i8*, i8** %dirname.4847
%.tmp4882 = getelementptr [1 x i8], [1 x i8]*@.str4881, i32 0, i32 0
%.tmp4883 = call i32(i8*,i8*) @strcmp(i8* %.tmp4880, i8* %.tmp4882)
%.tmp4884 = icmp eq i32 %.tmp4883, 0
br i1 %.tmp4884, label %.if.true.4885, label %.if.false.4885
.if.true.4885:
%.tmp4886 = getelementptr i8*, i8** %mod_abspath.4844, i32 0
%.tmp4888 = getelementptr [6 x i8], [6 x i8]*@.str4887, i32 0, i32 0
%.tmp4889 = load i8*, i8** %import_str
%.tmp4890 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4886, i8* %.tmp4888, i8* %.tmp4889)
br label %.if.end.4885
.if.false.4885:
%.tmp4891 = getelementptr i8*, i8** %mod_abspath.4844, i32 0
%.tmp4893 = getelementptr [9 x i8], [9 x i8]*@.str4892, i32 0, i32 0
%.tmp4894 = load i8*, i8** %dirname.4847
%.tmp4895 = load i8*, i8** %import_str
%.tmp4896 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4891, i8* %.tmp4893, i8* %.tmp4894, i8* %.tmp4895)
br label %.if.end.4885
.if.end.4885:
br label %.if.end.4871
.if.end.4871:
%.tmp4897 = load i8*, i8** %mod_abspath.4844
ret i8* %.tmp4897
}
define %m2652$.AssignableInfo.type* @m295$compile_fn_call.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp4898 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4899 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4900 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_builtin.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp4898, %m980$.Node.type* %.tmp4899)
%info.4901 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp4900, %m2652$.AssignableInfo.type** %info.4901
%.tmp4902 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp4903 = icmp ne %m2652$.AssignableInfo.type* %.tmp4902, null
br i1 %.tmp4903, label %.if.true.4904, label %.if.false.4904
.if.true.4904:
%.tmp4905 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
ret %m2652$.AssignableInfo.type* %.tmp4905
br label %.if.end.4904
.if.false.4904:
br label %.if.end.4904
.if.end.4904:
%.tmp4906 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4907 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4908 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp4906, %m980$.Node.type* %.tmp4907)
store %m2652$.AssignableInfo.type* %.tmp4908, %m2652$.AssignableInfo.type** %info.4901
%.tmp4909 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp4910 = icmp eq %m2652$.AssignableInfo.type* %.tmp4909, null
br i1 %.tmp4910, label %.if.true.4911, label %.if.false.4911
.if.true.4911:
%.tmp4912 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4912, label %.if.true.4913, label %.if.false.4913
.if.true.4913:
%.tmp4914 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4915 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4917 = getelementptr [35 x i8], [35 x i8]*@.str4916, i32 0, i32 0
%.tmp4918 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp4914, %m980$.Node.type* %.tmp4915, i8* %.tmp4917)
%.tmp4919 = call i32(i8*,...) @printf(i8* %.tmp4918)
br label %.if.end.4913
.if.false.4913:
br label %.if.end.4913
.if.end.4913:
%.tmp4920 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp4920
br label %.if.end.4911
.if.false.4911:
br label %.if.end.4911
.if.end.4911:
%.tmp4921 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4923 = getelementptr [8 x i8], [8 x i8]*@.str4922, i32 0, i32 0
%.tmp4924 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4921, i8* %.tmp4923)
%args.4925 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4924, %m980$.Node.type** %args.4925
%.tmp4927 = getelementptr [1 x i8], [1 x i8]*@.str4926, i32 0, i32 0
%params_buff.4928 = alloca i8*
store i8* %.tmp4927, i8** %params_buff.4928
%tmp.4929 = alloca i8*
store i8* null, i8** %tmp.4929
%.tmp4930 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp4931 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4930, i32 0, i32 4
%.tmp4932 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4931
%.tmp4933 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4932, i32 0, i32 0
%.tmp4934 = load i8*, i8** %.tmp4933
%.tmp4936 = getelementptr [4 x i8], [4 x i8]*@.str4935, i32 0, i32 0
%.tmp4937 = call i32(i8*,i8*) @strcmp(i8* %.tmp4934, i8* %.tmp4936)
%.tmp4938 = icmp eq i32 %.tmp4937, 0
br i1 %.tmp4938, label %.if.true.4939, label %.if.false.4939
.if.true.4939:
%.tmp4940 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4941 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4940)
%new_info.4942 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp4941, %m2652$.AssignableInfo.type** %new_info.4942
%.tmp4943 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4944 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_info.4942
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp4943, %m2652$.AssignableInfo.type* %.tmp4944)
%.tmp4945 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_info.4942
%.tmp4946 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4945, i32 0, i32 4
%.tmp4947 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp4948 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4947, i32 0, i32 4
%.tmp4949 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4948
%.tmp4950 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4949, i32 0, i32 3
%.tmp4951 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4950
store %m2652$.Type.type* %.tmp4951, %m2652$.Type.type** %.tmp4946
%.tmp4952 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4953 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp4952, i32 0, i32 1
%.tmp4954 = load %m0$.File.type*, %m0$.File.type** %.tmp4953
%.tmp4956 = getelementptr [22 x i8], [22 x i8]*@.str4955, i32 0, i32 0
%.tmp4957 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_info.4942
%.tmp4958 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp4957)
%.tmp4959 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4960 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp4961 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4960, i32 0, i32 4
%.tmp4962 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4961
%.tmp4963 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4959, %m2652$.Type.type* %.tmp4962)
%.tmp4964 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp4965 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp4966 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4965, i32 0, i32 4
%.tmp4967 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4966
%.tmp4968 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp4964, %m2652$.Type.type* %.tmp4967)
%.tmp4969 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp4970 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp4969)
%.tmp4971 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4954, i8* %.tmp4956, i8* %.tmp4958, i8* %.tmp4963, i8* %.tmp4968, i8* %.tmp4970)
%.tmp4972 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_info.4942
store %m2652$.AssignableInfo.type* %.tmp4972, %m2652$.AssignableInfo.type** %info.4901
br label %.if.end.4939
.if.false.4939:
br label %.if.end.4939
.if.end.4939:
%.tmp4973 = load %m980$.Node.type*, %m980$.Node.type** %args.4925
%.tmp4974 = icmp ne %m980$.Node.type* %.tmp4973, null
br i1 %.tmp4974, label %.if.true.4975, label %.if.false.4975
.if.true.4975:
%.tmp4976 = load %m980$.Node.type*, %m980$.Node.type** %args.4925
%.tmp4977 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4976, i32 0, i32 6
%.tmp4978 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4977
%.tmp4980 = getelementptr [11 x i8], [11 x i8]*@.str4979, i32 0, i32 0
%.tmp4981 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4978, i8* %.tmp4980)
%start.4982 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4981, %m980$.Node.type** %start.4982
%argno.4983 = alloca i32
store i32 1, i32* %argno.4983
%.tmp4984 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp4985 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp4984, i32 0, i32 4
%.tmp4986 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4985
%.tmp4987 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4986, i32 0, i32 3
%.tmp4988 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4987
%.tmp4989 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp4988, i32 0, i32 4
%.tmp4990 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp4989
%expect_type.4991 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp4990, %m2652$.Type.type** %expect_type.4991
%provided_args.4992 = alloca i32
store i32 0, i32* %provided_args.4992
%.tmp4994 = load %m980$.Node.type*, %m980$.Node.type** %start.4982
%pp.4995 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4994, %m980$.Node.type** %pp.4995
br label %.for.start.4993
.for.start.4993:
%.tmp4996 = load %m980$.Node.type*, %m980$.Node.type** %pp.4995
%.tmp4997 = icmp ne %m980$.Node.type* %.tmp4996, null
br i1 %.tmp4997, label %.for.continue.4993, label %.for.end.4993
.for.continue.4993:
%.tmp4998 = load i32, i32* %provided_args.4992
%.tmp4999 = add i32 %.tmp4998, 1
store i32 %.tmp4999, i32* %provided_args.4992
%.tmp5000 = load %m980$.Node.type*, %m980$.Node.type** %pp.4995
%.tmp5001 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5000, i32 0, i32 7
%.tmp5002 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5001
%.tmp5004 = getelementptr [11 x i8], [11 x i8]*@.str5003, i32 0, i32 0
%.tmp5005 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5002, i8* %.tmp5004)
store %m980$.Node.type* %.tmp5005, %m980$.Node.type** %pp.4995
br label %.for.start.4993
.for.end.4993:
%.tmp5007 = load %m980$.Node.type*, %m980$.Node.type** %start.4982
%pp.5008 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp5007, %m980$.Node.type** %pp.5008
br label %.for.start.5006
.for.start.5006:
%.tmp5009 = load %m980$.Node.type*, %m980$.Node.type** %pp.5008
%.tmp5010 = icmp ne %m980$.Node.type* %.tmp5009, null
br i1 %.tmp5010, label %.for.continue.5006, label %.for.end.5006
.for.continue.5006:
%.tmp5011 = load %m2652$.Type.type*, %m2652$.Type.type** %expect_type.4991
%.tmp5012 = icmp eq %m2652$.Type.type* %.tmp5011, null
br i1 %.tmp5012, label %.if.true.5013, label %.if.false.5013
.if.true.5013:
%.tmp5014 = getelementptr i8*, i8** %tmp.4929, i32 0
%.tmp5016 = getelementptr [43 x i8], [43 x i8]*@.str5015, i32 0, i32 0
%.tmp5017 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp5018 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5017, i32 0, i32 2
%.tmp5019 = load i8*, i8** %.tmp5018
%.tmp5020 = load i32, i32* %argno.4983
%.tmp5021 = sub i32 %.tmp5020, 1
%.tmp5022 = load i32, i32* %provided_args.4992
%.tmp5023 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5014, i8* %.tmp5016, i8* %.tmp5019, i32 %.tmp5021, i32 %.tmp5022)
%.tmp5024 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5025 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5026 = load i8*, i8** %tmp.4929
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp5024, %m980$.Node.type* %.tmp5025, i8* %.tmp5026)
%.tmp5027 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp5027
br label %.if.end.5013
.if.false.5013:
br label %.if.end.5013
.if.end.5013:
%.tmp5028 = load %m980$.Node.type*, %m980$.Node.type** %pp.5008
%.tmp5029 = load %m980$.Node.type*, %m980$.Node.type** %start.4982
%.tmp5030 = icmp ne %m980$.Node.type* %.tmp5028, %.tmp5029
br i1 %.tmp5030, label %.if.true.5031, label %.if.false.5031
.if.true.5031:
%.tmp5032 = getelementptr i8*, i8** %tmp.4929, i32 0
%.tmp5034 = getelementptr [5 x i8], [5 x i8]*@.str5033, i32 0, i32 0
%.tmp5035 = load i8*, i8** %params_buff.4928
%.tmp5036 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5032, i8* %.tmp5034, i8* %.tmp5035)
%.tmp5037 = load i8*, i8** %params_buff.4928
%tmp_buff.5038 = alloca i8*
store i8* %.tmp5037, i8** %tmp_buff.5038
%.tmp5039 = load i8*, i8** %tmp.4929
store i8* %.tmp5039, i8** %params_buff.4928
%.tmp5040 = load i8*, i8** %tmp_buff.5038
store i8* %.tmp5040, i8** %tmp.4929
%.tmp5041 = load i8*, i8** %tmp.4929
call void(i8*) @free(i8* %.tmp5041)
br label %.if.end.5031
.if.false.5031:
br label %.if.end.5031
.if.end.5031:
%.tmp5042 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5043 = load %m980$.Node.type*, %m980$.Node.type** %pp.5008
%.tmp5044 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp5042, %m980$.Node.type* %.tmp5043)
%a_info.5045 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp5044, %m2652$.AssignableInfo.type** %a_info.5045
%.tmp5046 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.5045
%.tmp5047 = icmp eq %m2652$.AssignableInfo.type* %.tmp5046, null
br i1 %.tmp5047, label %.if.true.5048, label %.if.false.5048
.if.true.5048:
%.tmp5049 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp5049
br label %.if.end.5048
.if.false.5048:
br label %.if.end.5048
.if.end.5048:
%.tmp5050 = load %m2652$.Type.type*, %m2652$.Type.type** %expect_type.4991
%.tmp5051 = call %m2652$.Type.type*(%m2652$.Type.type*) @m295$type_clone.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.tmp5050)
%exp.5052 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp5051, %m2652$.Type.type** %exp.5052
%.tmp5053 = load %m2652$.Type.type*, %m2652$.Type.type** %exp.5052
%.tmp5054 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5053, i32 0, i32 4
store %m2652$.Type.type* null, %m2652$.Type.type** %.tmp5054
%.tmp5055 = load %m2652$.Type.type*, %m2652$.Type.type** %expect_type.4991
%.tmp5056 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5055, i32 0, i32 0
%.tmp5057 = load i8*, i8** %.tmp5056
%.tmp5059 = getelementptr [7 x i8], [7 x i8]*@.str5058, i32 0, i32 0
%.tmp5060 = call i32(i8*,i8*) @strcmp(i8* %.tmp5057, i8* %.tmp5059)
%.tmp5061 = icmp ne i32 %.tmp5060, 0
%.tmp5062 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5063 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.5045
%.tmp5064 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5063, i32 0, i32 4
%.tmp5065 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5064
%.tmp5066 = load %m2652$.Type.type*, %m2652$.Type.type** %exp.5052
%.tmp5067 = call i1(%m2652$.CompilerCtx.type*,%m2652$.Type.type*,%m2652$.Type.type*) @m2653$cmp.b.m2652$.CompilerCtx.typep.m2652$.Type.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5062, %m2652$.Type.type* %.tmp5065, %m2652$.Type.type* %.tmp5066)
%.tmp5068 = icmp eq i1 %.tmp5067, 0
%.tmp5069 = and i1 %.tmp5061, %.tmp5068
br i1 %.tmp5069, label %.if.true.5070, label %.if.false.5070
.if.true.5070:
%.tmp5072 = getelementptr [1 x i8], [1 x i8]*@.str5071, i32 0, i32 0
%err_buf.5073 = alloca i8*
store i8* %.tmp5072, i8** %err_buf.5073
%.tmp5074 = getelementptr i8*, i8** %err_buf.5073, i32 0
%.tmp5076 = getelementptr [58 x i8], [58 x i8]*@.str5075, i32 0, i32 0
%.tmp5077 = load i32, i32* %argno.4983
%.tmp5078 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5079 = load %m2652$.Type.type*, %m2652$.Type.type** %exp.5052
%.tmp5080 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5078, %m2652$.Type.type* %.tmp5079)
%.tmp5081 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5082 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.5045
%.tmp5083 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5082, i32 0, i32 4
%.tmp5084 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5083
%.tmp5085 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5081, %m2652$.Type.type* %.tmp5084)
%.tmp5086 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5074, i8* %.tmp5076, i32 %.tmp5077, i8* %.tmp5080, i8* %.tmp5085)
%.tmp5087 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5088 = load %m980$.Node.type*, %m980$.Node.type** %pp.5008
%.tmp5089 = load i8*, i8** %err_buf.5073
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp5087, %m980$.Node.type* %.tmp5088, i8* %.tmp5089)
%.tmp5090 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp5090
br label %.if.end.5070
.if.false.5070:
br label %.if.end.5070
.if.end.5070:
%.tmp5091 = getelementptr i8*, i8** %params_buff.4928, i32 0
%.tmp5093 = getelementptr [8 x i8], [8 x i8]*@.str5092, i32 0, i32 0
%.tmp5094 = load i8*, i8** %params_buff.4928
%.tmp5095 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5096 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.5045
%.tmp5097 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5096, i32 0, i32 4
%.tmp5098 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5097
%.tmp5099 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5095, %m2652$.Type.type* %.tmp5098)
%.tmp5100 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.5045
%.tmp5101 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp5100)
%.tmp5102 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5091, i8* %.tmp5093, i8* %.tmp5094, i8* %.tmp5099, i8* %.tmp5101)
%.tmp5103 = load %m980$.Node.type*, %m980$.Node.type** %pp.5008
%.tmp5104 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5103, i32 0, i32 7
%.tmp5105 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5104
store %m980$.Node.type* %.tmp5105, %m980$.Node.type** %pp.5008
%.tmp5106 = load %m2652$.Type.type*, %m2652$.Type.type** %expect_type.4991
%.tmp5107 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5106, i32 0, i32 0
%.tmp5108 = load i8*, i8** %.tmp5107
%.tmp5110 = getelementptr [7 x i8], [7 x i8]*@.str5109, i32 0, i32 0
%.tmp5111 = call i32(i8*,i8*) @strcmp(i8* %.tmp5108, i8* %.tmp5110)
%.tmp5112 = icmp ne i32 %.tmp5111, 0
br i1 %.tmp5112, label %.if.true.5113, label %.if.false.5113
.if.true.5113:
%.tmp5114 = load %m2652$.Type.type*, %m2652$.Type.type** %expect_type.4991
%.tmp5115 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5114, i32 0, i32 4
%.tmp5116 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5115
store %m2652$.Type.type* %.tmp5116, %m2652$.Type.type** %expect_type.4991
br label %.if.end.5113
.if.false.5113:
br label %.if.end.5113
.if.end.5113:
%.tmp5117 = load i32, i32* %argno.4983
%.tmp5118 = add i32 %.tmp5117, 1
store i32 %.tmp5118, i32* %argno.4983
%.tmp5119 = load %m980$.Node.type*, %m980$.Node.type** %pp.5008
%.tmp5121 = getelementptr [11 x i8], [11 x i8]*@.str5120, i32 0, i32 0
%.tmp5122 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5119, i8* %.tmp5121)
store %m980$.Node.type* %.tmp5122, %m980$.Node.type** %pp.5008
br label %.for.start.5006
.for.end.5006:
%.tmp5123 = load %m2652$.Type.type*, %m2652$.Type.type** %expect_type.4991
%.tmp5124 = icmp ne %m2652$.Type.type* %.tmp5123, null
br i1 %.tmp5124, label %.if.true.5125, label %.if.false.5125
.if.true.5125:
%.tmp5126 = load %m2652$.Type.type*, %m2652$.Type.type** %expect_type.4991
%.tmp5127 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5126, i32 0, i32 0
%.tmp5128 = load i8*, i8** %.tmp5127
%.tmp5130 = getelementptr [7 x i8], [7 x i8]*@.str5129, i32 0, i32 0
%.tmp5131 = call i32(i8*,i8*) @strcmp(i8* %.tmp5128, i8* %.tmp5130)
%.tmp5132 = icmp ne i32 %.tmp5131, 0
br i1 %.tmp5132, label %.if.true.5133, label %.if.false.5133
.if.true.5133:
%.tmp5134 = getelementptr i8*, i8** %tmp.4929, i32 0
%.tmp5136 = getelementptr [43 x i8], [43 x i8]*@.str5135, i32 0, i32 0
%.tmp5137 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp5138 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5137, i32 0, i32 2
%.tmp5139 = load i8*, i8** %.tmp5138
%.tmp5140 = load i32, i32* %argno.4983
%.tmp5141 = load i32, i32* %provided_args.4992
%.tmp5142 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5134, i8* %.tmp5136, i8* %.tmp5139, i32 %.tmp5140, i32 %.tmp5141)
%.tmp5143 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5144 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5145 = load i8*, i8** %tmp.4929
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp5143, %m980$.Node.type* %.tmp5144, i8* %.tmp5145)
%.tmp5146 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp5146
br label %.if.end.5133
.if.false.5133:
br label %.if.end.5133
.if.end.5133:
br label %.if.end.5125
.if.false.5125:
br label %.if.end.5125
.if.end.5125:
br label %.if.end.4975
.if.false.4975:
%.tmp5147 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp5148 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5147, i32 0, i32 4
%.tmp5149 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5148
%.tmp5150 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5149, i32 0, i32 3
%.tmp5151 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5150
%.tmp5152 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5151, i32 0, i32 4
%.tmp5153 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5152
%.tmp5154 = icmp ne %m2652$.Type.type* %.tmp5153, null
br i1 %.tmp5154, label %.if.true.5155, label %.if.false.5155
.if.true.5155:
%args_required.5156 = alloca i32
store i32 0, i32* %args_required.5156
%.tmp5158 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp5159 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5158, i32 0, i32 4
%.tmp5160 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5159
%.tmp5161 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5160, i32 0, i32 3
%.tmp5162 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5161
%.tmp5163 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5162, i32 0, i32 4
%.tmp5164 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5163
%pp.5165 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp5164, %m2652$.Type.type** %pp.5165
br label %.for.start.5157
.for.start.5157:
%.tmp5166 = load %m2652$.Type.type*, %m2652$.Type.type** %pp.5165
%.tmp5167 = icmp ne %m2652$.Type.type* %.tmp5166, null
br i1 %.tmp5167, label %.for.continue.5157, label %.for.else.5157
.for.continue.5157:
%.tmp5168 = load %m2652$.Type.type*, %m2652$.Type.type** %pp.5165
%.tmp5169 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5168, i32 0, i32 0
%.tmp5170 = load i8*, i8** %.tmp5169
%.tmp5172 = getelementptr [7 x i8], [7 x i8]*@.str5171, i32 0, i32 0
%.tmp5173 = call i32(i8*,i8*) @strcmp(i8* %.tmp5170, i8* %.tmp5172)
%.tmp5174 = icmp eq i32 %.tmp5173, 0
br i1 %.tmp5174, label %.if.true.5175, label %.if.false.5175
.if.true.5175:
br label %.for.end.5157
br label %.if.end.5175
.if.false.5175:
br label %.if.end.5175
.if.end.5175:
%.tmp5176 = load i32, i32* %args_required.5156
%.tmp5177 = add i32 %.tmp5176, 1
store i32 %.tmp5177, i32* %args_required.5156
%.tmp5178 = load %m2652$.Type.type*, %m2652$.Type.type** %pp.5165
%.tmp5179 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5178, i32 0, i32 4
%.tmp5180 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5179
store %m2652$.Type.type* %.tmp5180, %m2652$.Type.type** %pp.5165
br label %.for.start.5157
.for.else.5157:
%.tmp5181 = getelementptr i8*, i8** %tmp.4929, i32 0
%.tmp5183 = getelementptr [42 x i8], [42 x i8]*@.str5182, i32 0, i32 0
%.tmp5184 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp5185 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5184, i32 0, i32 2
%.tmp5186 = load i8*, i8** %.tmp5185
%.tmp5187 = load i32, i32* %args_required.5156
%.tmp5188 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5181, i8* %.tmp5183, i8* %.tmp5186, i32 %.tmp5187)
%.tmp5189 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5190 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5191 = load i8*, i8** %tmp.4929
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp5189, %m980$.Node.type* %.tmp5190, i8* %.tmp5191)
%.tmp5192 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp5192
br label %.for.end.5157
.for.end.5157:
br label %.if.end.5155
.if.false.5155:
br label %.if.end.5155
.if.end.5155:
br label %.if.end.4975
.if.end.4975:
%.tmp5193 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5194 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp5195 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5194, i32 0, i32 4
%.tmp5196 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5195
%.tmp5197 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5196, i32 0, i32 3
%.tmp5198 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5197
%.tmp5199 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5193, %m2652$.Type.type* %.tmp5198)
%.tmp5201 = getelementptr [5 x i8], [5 x i8]*@.str5200, i32 0, i32 0
%.tmp5202 = call i32(i8*,i8*) @strcmp(i8* %.tmp5199, i8* %.tmp5201)
%.tmp5203 = icmp eq i32 %.tmp5202, 0
br i1 %.tmp5203, label %.if.true.5204, label %.if.false.5204
.if.true.5204:
%.tmp5205 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5206 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5205, i32 0, i32 1
%.tmp5207 = load %m0$.File.type*, %m0$.File.type** %.tmp5206
%.tmp5209 = getelementptr [16 x i8], [16 x i8]*@.str5208, i32 0, i32 0
%.tmp5210 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5211 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp5212 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5211, i32 0, i32 4
%.tmp5213 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5212
%.tmp5214 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5210, %m2652$.Type.type* %.tmp5213)
%.tmp5215 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp5216 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp5215)
%.tmp5217 = load i8*, i8** %params_buff.4928
%.tmp5218 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5207, i8* %.tmp5209, i8* %.tmp5214, i8* %.tmp5216, i8* %.tmp5217)
%.tmp5219 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp5219
br label %.if.end.5204
.if.false.5204:
br label %.if.end.5204
.if.end.5204:
%.tmp5220 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5221 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5220)
%call_info.5222 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp5221, %m2652$.AssignableInfo.type** %call_info.5222
%.tmp5223 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5224 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %call_info.5222
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp5223, %m2652$.AssignableInfo.type* %.tmp5224)
%.tmp5225 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %call_info.5222
%.tmp5226 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5225, i32 0, i32 4
%.tmp5227 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp5228 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5227, i32 0, i32 4
%.tmp5229 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5228
%.tmp5230 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5229, i32 0, i32 3
%.tmp5231 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5230
%.tmp5232 = call %m2652$.Type.type*(%m2652$.Type.type*) @m295$type_clone.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.tmp5231)
store %m2652$.Type.type* %.tmp5232, %m2652$.Type.type** %.tmp5226
%.tmp5233 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %call_info.5222
%.tmp5234 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5233, i32 0, i32 4
%.tmp5235 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5234
%.tmp5236 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5235, i32 0, i32 4
store %m2652$.Type.type* null, %m2652$.Type.type** %.tmp5236
%.tmp5237 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5238 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5237, i32 0, i32 1
%.tmp5239 = load %m0$.File.type*, %m0$.File.type** %.tmp5238
%.tmp5241 = getelementptr [21 x i8], [21 x i8]*@.str5240, i32 0, i32 0
%.tmp5242 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %call_info.5222
%.tmp5243 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp5242)
%.tmp5244 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5245 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp5246 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5245, i32 0, i32 4
%.tmp5247 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5246
%.tmp5248 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5244, %m2652$.Type.type* %.tmp5247)
%.tmp5249 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.4901
%.tmp5250 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp5249)
%.tmp5251 = load i8*, i8** %params_buff.4928
%.tmp5252 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5239, i8* %.tmp5241, i8* %.tmp5243, i8* %.tmp5248, i8* %.tmp5250, i8* %.tmp5251)
%.tmp5253 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %call_info.5222
%.tmp5254 = bitcast %m2652$.AssignableInfo.type* %.tmp5253 to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp5254
}
define void @m295$compile_expression.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%err_msg.5255 = alloca i8*
store i8* null, i8** %err_msg.5255
%.tmp5256 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5257 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5256, i32 0, i32 0
%.tmp5258 = load i8*, i8** %.tmp5257
%expr_type.5259 = alloca i8*
store i8* %.tmp5258, i8** %expr_type.5259
%.tmp5260 = bitcast ptr null to %m2652$.AssignableInfo.type*
%info.5261 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp5260, %m2652$.AssignableInfo.type** %info.5261
%assignable.5262 = alloca %m980$.Node.type*
store %m980$.Node.type* null, %m980$.Node.type** %assignable.5262
%.tmp5263 = bitcast ptr null to %m2652$.AssignableInfo.type*
%a_info.5264 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp5263, %m2652$.AssignableInfo.type** %a_info.5264
%.tmp5265 = load i8*, i8** %expr_type.5259
%.tmp5267 = getelementptr [7 x i8], [7 x i8]*@.str5266, i32 0, i32 0
%.tmp5268 = call i32(i8*,i8*) @strcmp(i8* %.tmp5265, i8* %.tmp5267)
%.tmp5269 = icmp eq i32 %.tmp5268, 0
br i1 %.tmp5269, label %.if.true.5270, label %.if.false.5270
.if.true.5270:
%.tmp5271 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5273 = getelementptr [9 x i8], [9 x i8]*@.str5272, i32 0, i32 0
%.tmp5274 = call %m2652$.Scope.type*(%m2652$.CompilerCtx.type*,i8*) @m295$get_scope.m2652$.Scope.typep.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.tmp5271, i8* %.tmp5273)
%fn_scope.5275 = alloca %m2652$.Scope.type*
store %m2652$.Scope.type* %.tmp5274, %m2652$.Scope.type** %fn_scope.5275
%.tmp5276 = load %m2652$.Scope.type*, %m2652$.Scope.type** %fn_scope.5275
%.tmp5277 = icmp eq %m2652$.Scope.type* %.tmp5276, null
br i1 %.tmp5277, label %.if.true.5278, label %.if.false.5278
.if.true.5278:
%.tmp5279 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5280 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5282 = getelementptr [40 x i8], [40 x i8]*@.str5281, i32 0, i32 0
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp5279, %m980$.Node.type* %.tmp5280, i8* %.tmp5282)
ret void
br label %.if.end.5278
.if.false.5278:
br label %.if.end.5278
.if.end.5278:
%.tmp5283 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5284 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5283, i32 0, i32 6
%.tmp5285 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5284
%.tmp5286 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5285, i32 0, i32 7
%.tmp5287 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5286
%.tmp5288 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5287, i32 0, i32 0
%.tmp5289 = load i8*, i8** %.tmp5288
%.tmp5291 = getelementptr [3 x i8], [3 x i8]*@.str5290, i32 0, i32 0
%.tmp5292 = call i32(i8*,i8*) @strcmp(i8* %.tmp5289, i8* %.tmp5291)
%.tmp5293 = icmp ne i32 %.tmp5292, 0
br i1 %.tmp5293, label %.if.true.5294, label %.if.false.5294
.if.true.5294:
%.tmp5295 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5296 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5297 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5296, i32 0, i32 6
%.tmp5298 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5297
%.tmp5299 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5298, i32 0, i32 7
%.tmp5300 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5299
%.tmp5301 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp5295, %m980$.Node.type* %.tmp5300)
store %m2652$.AssignableInfo.type* %.tmp5301, %m2652$.AssignableInfo.type** %info.5261
%.tmp5302 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.5261
%.tmp5303 = icmp eq %m2652$.AssignableInfo.type* %.tmp5302, null
br i1 %.tmp5303, label %.if.true.5304, label %.if.false.5304
.if.true.5304:
ret void
br label %.if.end.5304
.if.false.5304:
br label %.if.end.5304
.if.end.5304:
%.tmp5305 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5306 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.5261
%.tmp5307 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5306, i32 0, i32 4
%.tmp5308 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5307
%.tmp5309 = load %m2652$.Scope.type*, %m2652$.Scope.type** %fn_scope.5275
%.tmp5310 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp5309, i32 0, i32 6
%.tmp5311 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5310
%.tmp5312 = call i1(%m2652$.CompilerCtx.type*,%m2652$.Type.type*,%m2652$.Type.type*) @m2653$cmp.b.m2652$.CompilerCtx.typep.m2652$.Type.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5305, %m2652$.Type.type* %.tmp5308, %m2652$.Type.type* %.tmp5311)
%.tmp5313 = icmp eq i1 %.tmp5312, 0
br i1 %.tmp5313, label %.if.true.5314, label %.if.false.5314
.if.true.5314:
%.tmp5316 = getelementptr [1 x i8], [1 x i8]*@.str5315, i32 0, i32 0
%buf.5317 = alloca i8*
store i8* %.tmp5316, i8** %buf.5317
%.tmp5318 = getelementptr i8*, i8** %buf.5317, i32 0
%.tmp5320 = getelementptr [67 x i8], [67 x i8]*@.str5319, i32 0, i32 0
%.tmp5321 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5322 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.5261
%.tmp5323 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5322, i32 0, i32 4
%.tmp5324 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5323
%.tmp5325 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5321, %m2652$.Type.type* %.tmp5324)
%.tmp5326 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5327 = load %m2652$.Scope.type*, %m2652$.Scope.type** %fn_scope.5275
%.tmp5328 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp5327, i32 0, i32 6
%.tmp5329 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5328
%.tmp5330 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5326, %m2652$.Type.type* %.tmp5329)
%.tmp5331 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5318, i8* %.tmp5320, i8* %.tmp5325, i8* %.tmp5330)
%.tmp5332 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5333 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5334 = load i8*, i8** %buf.5317
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp5332, %m980$.Node.type* %.tmp5333, i8* %.tmp5334)
ret void
br label %.if.end.5314
.if.false.5314:
br label %.if.end.5314
.if.end.5314:
%.tmp5335 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5336 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5335, i32 0, i32 1
%.tmp5337 = load %m0$.File.type*, %m0$.File.type** %.tmp5336
%.tmp5339 = getelementptr [11 x i8], [11 x i8]*@.str5338, i32 0, i32 0
%.tmp5340 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5341 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.5261
%.tmp5342 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5341, i32 0, i32 4
%.tmp5343 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5342
%.tmp5344 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5340, %m2652$.Type.type* %.tmp5343)
%.tmp5345 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.5261
%.tmp5346 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp5345)
%.tmp5347 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5337, i8* %.tmp5339, i8* %.tmp5344, i8* %.tmp5346)
br label %.if.end.5294
.if.false.5294:
%.tmp5348 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5349 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5348, i32 0, i32 1
%.tmp5350 = load %m0$.File.type*, %m0$.File.type** %.tmp5349
%.tmp5352 = getelementptr [10 x i8], [10 x i8]*@.str5351, i32 0, i32 0
%.tmp5353 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5350, i8* %.tmp5352)
br label %.if.end.5294
.if.end.5294:
br label %.if.end.5270
.if.false.5270:
%.tmp5354 = load i8*, i8** %expr_type.5259
%.tmp5356 = getelementptr [3 x i8], [3 x i8]*@.str5355, i32 0, i32 0
%.tmp5357 = call i32(i8*,i8*) @strcmp(i8* %.tmp5354, i8* %.tmp5356)
%.tmp5358 = icmp eq i32 %.tmp5357, 0
br i1 %.tmp5358, label %.if.true.5359, label %.if.false.5359
.if.true.5359:
br label %.if.end.5359
.if.false.5359:
%.tmp5360 = load i8*, i8** %expr_type.5259
%.tmp5362 = getelementptr [8 x i8], [8 x i8]*@.str5361, i32 0, i32 0
%.tmp5363 = call i32(i8*,i8*) @strcmp(i8* %.tmp5360, i8* %.tmp5362)
%.tmp5364 = icmp eq i32 %.tmp5363, 0
br i1 %.tmp5364, label %.if.true.5365, label %.if.false.5365
.if.true.5365:
%.tmp5366 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5367 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5368 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5367, i32 0, i32 6
%.tmp5369 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5368
%.tmp5370 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_fn_call.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp5366, %m980$.Node.type* %.tmp5369)
br label %.if.end.5365
.if.false.5365:
%.tmp5371 = load i8*, i8** %expr_type.5259
%.tmp5373 = getelementptr [12 x i8], [12 x i8]*@.str5372, i32 0, i32 0
%.tmp5374 = call i32(i8*,i8*) @strcmp(i8* %.tmp5371, i8* %.tmp5373)
%.tmp5375 = icmp eq i32 %.tmp5374, 0
br i1 %.tmp5375, label %.if.true.5376, label %.if.false.5376
.if.true.5376:
%.tmp5377 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5378 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5379 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_declaration.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp5377, %m980$.Node.type* %.tmp5378)
br label %.if.end.5376
.if.false.5376:
%.tmp5380 = load i8*, i8** %expr_type.5259
%.tmp5382 = getelementptr [11 x i8], [11 x i8]*@.str5381, i32 0, i32 0
%.tmp5383 = call i32(i8*,i8*) @strcmp(i8* %.tmp5380, i8* %.tmp5382)
%.tmp5384 = icmp eq i32 %.tmp5383, 0
br i1 %.tmp5384, label %.if.true.5385, label %.if.false.5385
.if.true.5385:
%.tmp5386 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5387 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5386, i32 0, i32 6
%.tmp5388 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5387
%.tmp5390 = getelementptr [11 x i8], [11 x i8]*@.str5389, i32 0, i32 0
%.tmp5391 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5388, i8* %.tmp5390)
store %m980$.Node.type* %.tmp5391, %m980$.Node.type** %assignable.5262
%.tmp5392 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5393 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5394 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5393, i32 0, i32 6
%.tmp5395 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5394
%.tmp5396 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp5392, %m980$.Node.type* %.tmp5395)
%dest.5397 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp5396, %m2652$.AssignableInfo.type** %dest.5397
%.tmp5398 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %dest.5397
%.tmp5399 = icmp eq %m2652$.AssignableInfo.type* %.tmp5398, null
br i1 %.tmp5399, label %.if.true.5400, label %.if.false.5400
.if.true.5400:
ret void
br label %.if.end.5400
.if.false.5400:
br label %.if.end.5400
.if.end.5400:
%.tmp5401 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5402 = load %m980$.Node.type*, %m980$.Node.type** %assignable.5262
%.tmp5403 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp5401, %m980$.Node.type* %.tmp5402)
store %m2652$.AssignableInfo.type* %.tmp5403, %m2652$.AssignableInfo.type** %a_info.5264
%.tmp5404 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.5264
%.tmp5405 = icmp eq %m2652$.AssignableInfo.type* %.tmp5404, null
br i1 %.tmp5405, label %.if.true.5406, label %.if.false.5406
.if.true.5406:
ret void
br label %.if.end.5406
.if.false.5406:
br label %.if.end.5406
.if.end.5406:
%.tmp5407 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5408 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.5264
%.tmp5409 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5408, i32 0, i32 4
%.tmp5410 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5409
%.tmp5411 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %dest.5397
%.tmp5412 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5411, i32 0, i32 4
%.tmp5413 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5412
%.tmp5414 = call i1(%m2652$.CompilerCtx.type*,%m2652$.Type.type*,%m2652$.Type.type*) @m2653$cmp.b.m2652$.CompilerCtx.typep.m2652$.Type.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5407, %m2652$.Type.type* %.tmp5410, %m2652$.Type.type* %.tmp5413)
%.tmp5415 = icmp eq i1 %.tmp5414, 0
br i1 %.tmp5415, label %.if.true.5416, label %.if.false.5416
.if.true.5416:
%.tmp5418 = getelementptr [1 x i8], [1 x i8]*@.str5417, i32 0, i32 0
%err_buf.5419 = alloca i8*
store i8* %.tmp5418, i8** %err_buf.5419
%.tmp5420 = getelementptr i8*, i8** %err_buf.5419, i32 0
%.tmp5422 = getelementptr [37 x i8], [37 x i8]*@.str5421, i32 0, i32 0
%.tmp5423 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5424 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.5264
%.tmp5425 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5424, i32 0, i32 4
%.tmp5426 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5425
%.tmp5427 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5423, %m2652$.Type.type* %.tmp5426)
%.tmp5428 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5429 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %dest.5397
%.tmp5430 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5429, i32 0, i32 4
%.tmp5431 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5430
%.tmp5432 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5428, %m2652$.Type.type* %.tmp5431)
%.tmp5433 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5420, i8* %.tmp5422, i8* %.tmp5427, i8* %.tmp5432)
%.tmp5434 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5435 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5436 = load i8*, i8** %err_buf.5419
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp5434, %m980$.Node.type* %.tmp5435, i8* %.tmp5436)
br label %.if.end.5416
.if.false.5416:
br label %.if.end.5416
.if.end.5416:
%.tmp5437 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5438 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %dest.5397
%.tmp5439 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5438, i32 0, i32 4
%.tmp5440 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5439
%.tmp5441 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5437, %m2652$.Type.type* %.tmp5440)
%dest_tr.5442 = alloca i8*
store i8* %.tmp5441, i8** %dest_tr.5442
%.tmp5443 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5444 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.5264
%.tmp5445 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5444, i32 0, i32 4
%.tmp5446 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5445
%.tmp5447 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5443, %m2652$.Type.type* %.tmp5446)
%src_tr.5448 = alloca i8*
store i8* %.tmp5447, i8** %src_tr.5448
%.tmp5449 = load i8*, i8** %src_tr.5448
%.tmp5451 = getelementptr [4 x i8], [4 x i8]*@.str5450, i32 0, i32 0
%.tmp5452 = call i32(i8*,i8*) @strcmp(i8* %.tmp5449, i8* %.tmp5451)
%.tmp5453 = icmp eq i32 %.tmp5452, 0
br i1 %.tmp5453, label %.if.true.5454, label %.if.false.5454
.if.true.5454:
%.tmp5455 = load i8*, i8** %dest_tr.5442
store i8* %.tmp5455, i8** %src_tr.5448
br label %.if.end.5454
.if.false.5454:
br label %.if.end.5454
.if.end.5454:
%.tmp5456 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5457 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5456, i32 0, i32 1
%.tmp5458 = load %m0$.File.type*, %m0$.File.type** %.tmp5457
%.tmp5460 = getelementptr [21 x i8], [21 x i8]*@.str5459, i32 0, i32 0
%.tmp5461 = load i8*, i8** %src_tr.5448
%.tmp5462 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.5264
%.tmp5463 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp5462)
%.tmp5464 = load i8*, i8** %dest_tr.5442
%.tmp5465 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %dest.5397
%.tmp5466 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp5465)
%.tmp5467 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5458, i8* %.tmp5460, i8* %.tmp5461, i8* %.tmp5463, i8* %.tmp5464, i8* %.tmp5466)
br label %.if.end.5385
.if.false.5385:
%.tmp5468 = load i8*, i8** %expr_type.5259
%.tmp5470 = getelementptr [9 x i8], [9 x i8]*@.str5469, i32 0, i32 0
%.tmp5471 = call i32(i8*,i8*) @strcmp(i8* %.tmp5468, i8* %.tmp5470)
%.tmp5472 = icmp eq i32 %.tmp5471, 0
br i1 %.tmp5472, label %.if.true.5473, label %.if.false.5473
.if.true.5473:
%.tmp5474 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5475 = load %m980$.Node.type*, %m980$.Node.type** %stmt
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_if_block.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp5474, %m980$.Node.type* %.tmp5475)
br label %.if.end.5473
.if.false.5473:
%.tmp5476 = load i8*, i8** %expr_type.5259
%.tmp5478 = getelementptr [9 x i8], [9 x i8]*@.str5477, i32 0, i32 0
%.tmp5479 = call i32(i8*,i8*) @strcmp(i8* %.tmp5476, i8* %.tmp5478)
%.tmp5480 = icmp eq i32 %.tmp5479, 0
br i1 %.tmp5480, label %.if.true.5481, label %.if.false.5481
.if.true.5481:
%.tmp5482 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5483 = load %m980$.Node.type*, %m980$.Node.type** %stmt
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_for_loop.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp5482, %m980$.Node.type* %.tmp5483)
br label %.if.end.5481
.if.false.5481:
%.tmp5484 = load i8*, i8** %expr_type.5259
%.tmp5486 = getelementptr [8 x i8], [8 x i8]*@.str5485, i32 0, i32 0
%.tmp5487 = call i32(i8*,i8*) @strcmp(i8* %.tmp5484, i8* %.tmp5486)
%.tmp5488 = icmp eq i32 %.tmp5487, 0
br i1 %.tmp5488, label %.if.true.5489, label %.if.false.5489
.if.true.5489:
%.tmp5490 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5492 = getelementptr [4 x i8], [4 x i8]*@.str5491, i32 0, i32 0
%.tmp5493 = call %m2652$.Scope.type*(%m2652$.CompilerCtx.type*,i8*) @m295$get_scope.m2652$.Scope.typep.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.tmp5490, i8* %.tmp5492)
%for_scope.5494 = alloca %m2652$.Scope.type*
store %m2652$.Scope.type* %.tmp5493, %m2652$.Scope.type** %for_scope.5494
%.tmp5495 = load %m2652$.Scope.type*, %m2652$.Scope.type** %for_scope.5494
%.tmp5496 = icmp eq %m2652$.Scope.type* %.tmp5495, null
br i1 %.tmp5496, label %.if.true.5497, label %.if.false.5497
.if.true.5497:
%.tmp5499 = getelementptr [1 x i8], [1 x i8]*@.str5498, i32 0, i32 0
%buf.5500 = alloca i8*
store i8* %.tmp5499, i8** %buf.5500
%.tmp5501 = getelementptr i8*, i8** %buf.5500, i32 0
%.tmp5503 = getelementptr [42 x i8], [42 x i8]*@.str5502, i32 0, i32 0
%.tmp5504 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5505 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5504, i32 0, i32 6
%.tmp5506 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5505
%.tmp5507 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5506, i32 0, i32 1
%.tmp5508 = load i8*, i8** %.tmp5507
%.tmp5509 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5501, i8* %.tmp5503, i8* %.tmp5508)
%.tmp5510 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5511 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5512 = load i8*, i8** %buf.5500
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp5510, %m980$.Node.type* %.tmp5511, i8* %.tmp5512)
ret void
br label %.if.end.5497
.if.false.5497:
br label %.if.end.5497
.if.end.5497:
%.tmp5513 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5514 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5513, i32 0, i32 6
%.tmp5515 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5514
%.tmp5516 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5515, i32 0, i32 1
%.tmp5517 = load i8*, i8** %.tmp5516
%.tmp5519 = getelementptr [6 x i8], [6 x i8]*@.str5518, i32 0, i32 0
%.tmp5520 = call i32(i8*,i8*) @strcmp(i8* %.tmp5517, i8* %.tmp5519)
%.tmp5521 = icmp eq i32 %.tmp5520, 0
br i1 %.tmp5521, label %.if.true.5522, label %.if.false.5522
.if.true.5522:
%.tmp5523 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5524 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5523, i32 0, i32 1
%.tmp5525 = load %m0$.File.type*, %m0$.File.type** %.tmp5524
%.tmp5527 = getelementptr [15 x i8], [15 x i8]*@.str5526, i32 0, i32 0
%.tmp5528 = load %m2652$.Scope.type*, %m2652$.Scope.type** %for_scope.5494
%.tmp5529 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp5528, i32 0, i32 4
%.tmp5530 = load i8*, i8** %.tmp5529
%.tmp5531 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5525, i8* %.tmp5527, i8* %.tmp5530)
br label %.if.end.5522
.if.false.5522:
%.tmp5532 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5533 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5532, i32 0, i32 6
%.tmp5534 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5533
%.tmp5535 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5534, i32 0, i32 1
%.tmp5536 = load i8*, i8** %.tmp5535
%.tmp5538 = getelementptr [9 x i8], [9 x i8]*@.str5537, i32 0, i32 0
%.tmp5539 = call i32(i8*,i8*) @strcmp(i8* %.tmp5536, i8* %.tmp5538)
%.tmp5540 = icmp eq i32 %.tmp5539, 0
br i1 %.tmp5540, label %.if.true.5541, label %.if.false.5541
.if.true.5541:
%.tmp5542 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5543 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5542, i32 0, i32 1
%.tmp5544 = load %m0$.File.type*, %m0$.File.type** %.tmp5543
%.tmp5546 = getelementptr [15 x i8], [15 x i8]*@.str5545, i32 0, i32 0
%.tmp5547 = load %m2652$.Scope.type*, %m2652$.Scope.type** %for_scope.5494
%.tmp5548 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp5547, i32 0, i32 3
%.tmp5549 = load i8*, i8** %.tmp5548
%.tmp5550 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5544, i8* %.tmp5546, i8* %.tmp5549)
br label %.if.end.5541
.if.false.5541:
br label %.if.end.5541
.if.end.5541:
br label %.if.end.5522
.if.end.5522:
br label %.if.end.5489
.if.false.5489:
%.tmp5551 = load i8*, i8** %expr_type.5259
%.tmp5553 = getelementptr [9 x i8], [9 x i8]*@.str5552, i32 0, i32 0
%.tmp5554 = call i32(i8*,i8*) @strcmp(i8* %.tmp5551, i8* %.tmp5553)
%.tmp5555 = icmp eq i32 %.tmp5554, 0
br i1 %.tmp5555, label %.if.true.5556, label %.if.false.5556
.if.true.5556:
%.tmp5557 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5558 = load %m980$.Node.type*, %m980$.Node.type** %stmt
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_closure.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp5557, %m980$.Node.type* %.tmp5558)
br label %.if.end.5556
.if.false.5556:
%.tmp5559 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5560 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5562 = getelementptr [34 x i8], [34 x i8]*@.str5561, i32 0, i32 0
%.tmp5563 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp5559, %m980$.Node.type* %.tmp5560, i8* %.tmp5562)
%.tmp5564 = load i8*, i8** %expr_type.5259
%.tmp5565 = call i32(i8*,...) @printf(i8* %.tmp5563, i8* %.tmp5564)
br label %.if.end.5556
.if.end.5556:
br label %.if.end.5489
.if.end.5489:
br label %.if.end.5481
.if.end.5481:
br label %.if.end.5473
.if.end.5473:
br label %.if.end.5385
.if.end.5385:
br label %.if.end.5376
.if.end.5376:
br label %.if.end.5365
.if.end.5365:
br label %.if.end.5359
.if.end.5359:
br label %.if.end.5270
.if.end.5270:
ret void
}
define %m2652$.Scope.type* @m295$get_scope.m2652$.Scope.typep.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.ctx.arg, i8* %.scope_type.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%scope_type = alloca i8*
store i8* %.scope_type.arg, i8** %scope_type
%.tmp5566 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5567 = call %m2652$.ModuleLookup.type*(%m2652$.CompilerCtx.type*) @m295$get_current_module.m2652$.ModuleLookup.typep.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp5566)
%mod.5568 = alloca %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* %.tmp5567, %m2652$.ModuleLookup.type** %mod.5568
%.tmp5570 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.5568
%.tmp5571 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp5570, i32 0, i32 3
%.tmp5572 = load %m2652$.Scope.type*, %m2652$.Scope.type** %.tmp5571
%s.5573 = alloca %m2652$.Scope.type*
store %m2652$.Scope.type* %.tmp5572, %m2652$.Scope.type** %s.5573
br label %.for.start.5569
.for.start.5569:
%.tmp5574 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.5573
%.tmp5575 = icmp ne %m2652$.Scope.type* %.tmp5574, null
br i1 %.tmp5575, label %.for.continue.5569, label %.for.end.5569
.for.continue.5569:
%.tmp5576 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.5573
%.tmp5577 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp5576, i32 0, i32 2
%.tmp5578 = load i8*, i8** %.tmp5577
%.tmp5579 = load i8*, i8** %scope_type
%.tmp5580 = call i32(i8*,i8*) @strcmp(i8* %.tmp5578, i8* %.tmp5579)
%.tmp5581 = icmp eq i32 %.tmp5580, 0
br i1 %.tmp5581, label %.if.true.5582, label %.if.false.5582
.if.true.5582:
%.tmp5583 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.5573
ret %m2652$.Scope.type* %.tmp5583
br label %.if.end.5582
.if.false.5582:
br label %.if.end.5582
.if.end.5582:
%.tmp5584 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.5573
%.tmp5585 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp5584, i32 0, i32 5
%.tmp5586 = load %m2652$.Scope.type*, %m2652$.Scope.type** %.tmp5585
store %m2652$.Scope.type* %.tmp5586, %m2652$.Scope.type** %s.5573
br label %.for.start.5569
.for.end.5569:
%.tmp5587 = bitcast ptr null to %m2652$.Scope.type*
ret %m2652$.Scope.type* %.tmp5587
}
define %m2652$.Type.type* @m295$type_ptr_of_chr.m2652$.Type.typep() {
%.tmp5588 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%t.5589 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp5588, %m2652$.Type.type** %t.5589
%.tmp5590 = load %m2652$.Type.type*, %m2652$.Type.type** %t.5589
%.tmp5591 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5590, i32 0, i32 0
%.tmp5593 = getelementptr [4 x i8], [4 x i8]*@.str5592, i32 0, i32 0
store i8* %.tmp5593, i8** %.tmp5591
%.tmp5594 = load %m2652$.Type.type*, %m2652$.Type.type** %t.5589
%.tmp5595 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5594, i32 0, i32 3
%.tmp5596 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5596, %m2652$.Type.type** %.tmp5595
%.tmp5597 = load %m2652$.Type.type*, %m2652$.Type.type** %t.5589
%.tmp5598 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5597, i32 0, i32 3
%.tmp5599 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5598
%.tmp5600 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5599, i32 0, i32 0
%.tmp5602 = getelementptr [4 x i8], [4 x i8]*@.str5601, i32 0, i32 0
store i8* %.tmp5602, i8** %.tmp5600
%.tmp5603 = load %m2652$.Type.type*, %m2652$.Type.type** %t.5589
ret %m2652$.Type.type* %.tmp5603
}
define void @m295$compile_closure.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp5604 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5605 = call i32(%m2652$.CompilerCtx.type*) @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp5604)
%cj_id.5606 = alloca i32
store i32 %.tmp5605, i32* %cj_id.5606
%.tmp5607 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5608 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5607)
%info_lit.5609 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp5608, %m2652$.AssignableInfo.type** %info_lit.5609
%.tmp5610 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lit.5609
%.tmp5611 = load i8, i8* @SCOPE_GLOBAL
%.tmp5613 = getelementptr [21 x i8], [21 x i8]*@.str5612, i32 0, i32 0
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp5610, i8 %.tmp5611, i8* %.tmp5613)
%.tmp5614 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lit.5609
%.tmp5615 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5614, i32 0, i32 4
%.tmp5616 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5616, %m2652$.Type.type** %.tmp5615
%.tmp5617 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lit.5609
%.tmp5618 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5617, i32 0, i32 4
%.tmp5619 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5618
%.tmp5620 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5619, i32 0, i32 0
%.tmp5622 = getelementptr [9 x i8], [9 x i8]*@.str5621, i32 0, i32 0
store i8* %.tmp5622, i8** %.tmp5620
%.tmp5623 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lit.5609
%.tmp5624 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5623, i32 0, i32 4
%.tmp5625 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5624
%.tmp5626 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5625, i32 0, i32 3
%.tmp5627 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5627, %m2652$.Type.type** %.tmp5626
%.tmp5628 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lit.5609
%.tmp5629 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5628, i32 0, i32 4
%.tmp5630 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5629
%.tmp5631 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5630, i32 0, i32 3
%.tmp5632 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5631
%.tmp5633 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5632, i32 0, i32 0
%.tmp5635 = getelementptr [5 x i8], [5 x i8]*@.str5634, i32 0, i32 0
store i8* %.tmp5635, i8** %.tmp5633
%.tmp5636 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lit.5609
%.tmp5637 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5636, i32 0, i32 4
%.tmp5638 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5637
%.tmp5639 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5638, i32 0, i32 3
%.tmp5640 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5639
%.tmp5641 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5640, i32 0, i32 4
%.tmp5642 = call %m2652$.Type.type*() @m295$type_ptr_of_chr.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5642, %m2652$.Type.type** %.tmp5641
%.tmp5643 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lit.5609
%.tmp5644 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5643, i32 0, i32 4
%.tmp5645 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5644
%.tmp5646 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5645, i32 0, i32 3
%.tmp5647 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5646
%.tmp5648 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5647, i32 0, i32 4
%.tmp5649 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5648
%.tmp5650 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5649, i32 0, i32 4
%.tmp5651 = call %m2652$.Type.type*() @m295$type_ptr_of_chr.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5651, %m2652$.Type.type** %.tmp5650
%.tmp5652 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lit.5609
%.tmp5653 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5652, i32 0, i32 4
%.tmp5654 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5653
%.tmp5655 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5654, i32 0, i32 3
%.tmp5656 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5655
%.tmp5657 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5656, i32 0, i32 4
%.tmp5658 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5657
%.tmp5659 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5658, i32 0, i32 4
%.tmp5660 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5659
%.tmp5661 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5660, i32 0, i32 4
%.tmp5662 = call %m2652$.Type.type*() @m295$type_ptr_of_chr.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5662, %m2652$.Type.type** %.tmp5661
%.tmp5663 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5665 = getelementptr [21 x i8], [21 x i8]*@.str5664, i32 0, i32 0
%.tmp5667 = getelementptr [7 x i8], [7 x i8]*@.str5666, i32 0, i32 0
%.tmp5668 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lit.5609
call void(%m2652$.CompilerCtx.type*,i8*,i8*,%m2652$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2652$.CompilerCtx.typep.cp.cp.m2652$.AssignableInfo.typep.b.b(%m2652$.CompilerCtx.type* %.tmp5663, i8* %.tmp5665, i8* %.tmp5667, %m2652$.AssignableInfo.type* %.tmp5668, i1 1, i1 0)
%.tmp5669 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5670 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5669)
%info_lat.5671 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp5670, %m2652$.AssignableInfo.type** %info_lat.5671
%.tmp5672 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lat.5671
%.tmp5673 = load i8, i8* @SCOPE_GLOBAL
%.tmp5675 = getelementptr [23 x i8], [23 x i8]*@.str5674, i32 0, i32 0
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp5672, i8 %.tmp5673, i8* %.tmp5675)
%.tmp5676 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lat.5671
%.tmp5677 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5676, i32 0, i32 4
%.tmp5678 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5678, %m2652$.Type.type** %.tmp5677
%.tmp5679 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lat.5671
%.tmp5680 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5679, i32 0, i32 4
%.tmp5681 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5680
%.tmp5682 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5681, i32 0, i32 0
%.tmp5684 = getelementptr [9 x i8], [9 x i8]*@.str5683, i32 0, i32 0
store i8* %.tmp5684, i8** %.tmp5682
%.tmp5685 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lat.5671
%.tmp5686 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5685, i32 0, i32 4
%.tmp5687 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5686
%.tmp5688 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5687, i32 0, i32 3
%.tmp5689 = call %m2652$.Type.type*() @m295$type_ptr_of_chr.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5689, %m2652$.Type.type** %.tmp5688
%.tmp5690 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lat.5671
%.tmp5691 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5690, i32 0, i32 4
%.tmp5692 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5691
%.tmp5693 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5692, i32 0, i32 3
%.tmp5694 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5693
%.tmp5695 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5694, i32 0, i32 4
%.tmp5696 = call %m2652$.Type.type*() @m295$type_ptr_of_chr.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5696, %m2652$.Type.type** %.tmp5695
%.tmp5697 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5699 = getelementptr [23 x i8], [23 x i8]*@.str5698, i32 0, i32 0
%.tmp5701 = getelementptr [7 x i8], [7 x i8]*@.str5700, i32 0, i32 0
%.tmp5702 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_lat.5671
call void(%m2652$.CompilerCtx.type*,i8*,i8*,%m2652$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2652$.CompilerCtx.typep.cp.cp.m2652$.AssignableInfo.typep.b.b(%m2652$.CompilerCtx.type* %.tmp5697, i8* %.tmp5699, i8* %.tmp5701, %m2652$.AssignableInfo.type* %.tmp5702, i1 1, i1 0)
%.tmp5703 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5704 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5703)
%info_mmap.5705 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp5704, %m2652$.AssignableInfo.type** %info_mmap.5705
%.tmp5706 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_mmap.5705
%.tmp5707 = load i8, i8* @SCOPE_GLOBAL
%.tmp5709 = getelementptr [5 x i8], [5 x i8]*@.str5708, i32 0, i32 0
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp5706, i8 %.tmp5707, i8* %.tmp5709)
%.tmp5710 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_mmap.5705
%.tmp5711 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5710, i32 0, i32 4
%.tmp5712 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5712, %m2652$.Type.type** %.tmp5711
%.tmp5713 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_mmap.5705
%.tmp5714 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5713, i32 0, i32 4
%.tmp5715 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5714
%.tmp5716 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5715, i32 0, i32 0
%.tmp5718 = getelementptr [9 x i8], [9 x i8]*@.str5717, i32 0, i32 0
store i8* %.tmp5718, i8** %.tmp5716
%.tmp5719 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_mmap.5705
%.tmp5720 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5719, i32 0, i32 4
%.tmp5721 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5720
%.tmp5722 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5721, i32 0, i32 3
%.tmp5723 = call %m2652$.Type.type*() @m295$type_ptr_of_chr.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5723, %m2652$.Type.type** %.tmp5722
%.tmp5724 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_mmap.5705
%.tmp5725 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5724, i32 0, i32 4
%.tmp5726 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5725
%.tmp5727 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5726, i32 0, i32 3
%.tmp5728 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5727
%lt.5729 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp5728, %m2652$.Type.type** %lt.5729
%.tmp5730 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5731 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5730, i32 0, i32 4
%.tmp5732 = call %m2652$.Type.type*() @m295$type_ptr_of_chr.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5732, %m2652$.Type.type** %.tmp5731
%.tmp5733 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5734 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5733, i32 0, i32 4
%.tmp5735 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5734
store %m2652$.Type.type* %.tmp5735, %m2652$.Type.type** %lt.5729
%.tmp5736 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5737 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5736, i32 0, i32 4
%.tmp5738 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5738, %m2652$.Type.type** %.tmp5737
%.tmp5739 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5740 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5739, i32 0, i32 4
%.tmp5741 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5740
%.tmp5742 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5741, i32 0, i32 0
%.tmp5744 = getelementptr [4 x i8], [4 x i8]*@.str5743, i32 0, i32 0
store i8* %.tmp5744, i8** %.tmp5742
%.tmp5745 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5746 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5745, i32 0, i32 4
%.tmp5747 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5746
store %m2652$.Type.type* %.tmp5747, %m2652$.Type.type** %lt.5729
%.tmp5748 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5749 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5748, i32 0, i32 4
%.tmp5750 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5750, %m2652$.Type.type** %.tmp5749
%.tmp5751 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5752 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5751, i32 0, i32 4
%.tmp5753 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5752
%.tmp5754 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5753, i32 0, i32 0
%.tmp5756 = getelementptr [4 x i8], [4 x i8]*@.str5755, i32 0, i32 0
store i8* %.tmp5756, i8** %.tmp5754
%.tmp5757 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5758 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5757, i32 0, i32 4
%.tmp5759 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5758
store %m2652$.Type.type* %.tmp5759, %m2652$.Type.type** %lt.5729
%.tmp5760 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5761 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5760, i32 0, i32 4
%.tmp5762 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5762, %m2652$.Type.type** %.tmp5761
%.tmp5763 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5764 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5763, i32 0, i32 4
%.tmp5765 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5764
%.tmp5766 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5765, i32 0, i32 0
%.tmp5768 = getelementptr [4 x i8], [4 x i8]*@.str5767, i32 0, i32 0
store i8* %.tmp5768, i8** %.tmp5766
%.tmp5769 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5770 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5769, i32 0, i32 4
%.tmp5771 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5770
store %m2652$.Type.type* %.tmp5771, %m2652$.Type.type** %lt.5729
%.tmp5772 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5773 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5772, i32 0, i32 4
%.tmp5774 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5774, %m2652$.Type.type** %.tmp5773
%.tmp5775 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5776 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5775, i32 0, i32 4
%.tmp5777 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5776
%.tmp5778 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5777, i32 0, i32 0
%.tmp5780 = getelementptr [4 x i8], [4 x i8]*@.str5779, i32 0, i32 0
store i8* %.tmp5780, i8** %.tmp5778
%.tmp5781 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5782 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5781, i32 0, i32 4
%.tmp5783 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5782
store %m2652$.Type.type* %.tmp5783, %m2652$.Type.type** %lt.5729
%.tmp5784 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5785 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5784, i32 0, i32 4
%.tmp5786 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5786, %m2652$.Type.type** %.tmp5785
%.tmp5787 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5788 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5787, i32 0, i32 4
%.tmp5789 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5788
%.tmp5790 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5789, i32 0, i32 0
%.tmp5792 = getelementptr [4 x i8], [4 x i8]*@.str5791, i32 0, i32 0
store i8* %.tmp5792, i8** %.tmp5790
%.tmp5793 = load %m2652$.Type.type*, %m2652$.Type.type** %lt.5729
%.tmp5794 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5793, i32 0, i32 4
%.tmp5795 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5794
store %m2652$.Type.type* %.tmp5795, %m2652$.Type.type** %lt.5729
%.tmp5796 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5798 = getelementptr [5 x i8], [5 x i8]*@.str5797, i32 0, i32 0
%.tmp5800 = getelementptr [7 x i8], [7 x i8]*@.str5799, i32 0, i32 0
%.tmp5801 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info_mmap.5705
call void(%m2652$.CompilerCtx.type*,i8*,i8*,%m2652$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2652$.CompilerCtx.typep.cp.cp.m2652$.AssignableInfo.typep.b.b(%m2652$.CompilerCtx.type* %.tmp5796, i8* %.tmp5798, i8* %.tmp5800, %m2652$.AssignableInfo.type* %.tmp5801, i1 1, i1 0)
%.tmp5802 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5803 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5802, i32 0, i32 6
%.tmp5804 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5803
%.tmp5806 = getelementptr [5 x i8], [5 x i8]*@.str5805, i32 0, i32 0
%.tmp5807 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5804, i8* %.tmp5806)
%fn_name_node.5808 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp5807, %m980$.Node.type** %fn_name_node.5808
%.tmp5809 = load %m980$.Node.type*, %m980$.Node.type** %fn_name_node.5808
%.tmp5810 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5809, i32 0, i32 1
%.tmp5811 = load i8*, i8** %.tmp5810
%fn_name.5812 = alloca i8*
store i8* %.tmp5811, i8** %fn_name.5812
%.tmp5813 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5814 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5813)
%info.5815 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp5814, %m2652$.AssignableInfo.type** %info.5815
%.tmp5816 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.5815
%.tmp5817 = load i8, i8* @SCOPE_LOCAL
%.tmp5818 = load i8*, i8** %fn_name.5812
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp5816, i8 %.tmp5817, i8* %.tmp5818)
%.tmp5819 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.5815
%.tmp5820 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5819, i32 0, i32 4
%.tmp5821 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5822 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5823 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5822, i32 0, i32 6
%.tmp5824 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5823
%.tmp5825 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$syn_function_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp5821, %m980$.Node.type* %.tmp5824)
store %m2652$.Type.type* %.tmp5825, %m2652$.Type.type** %.tmp5820
%.tmp5826 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.5815
%.tmp5827 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5826, i32 0, i32 3
%.tmp5829 = getelementptr [9 x i8], [9 x i8]*@.str5828, i32 0, i32 0
store i8* %.tmp5829, i8** %.tmp5827
%.tmp5830 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5831 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5832 = load i8*, i8** %fn_name.5812
%.tmp5833 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.5815
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2652$.AssignableInfo.type*) @m295$define_assignable.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp5830, %m980$.Node.type* %.tmp5831, i8* %.tmp5832, %m2652$.AssignableInfo.type* %.tmp5833)
%.tmp5834 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5835 = call i32(%m2652$.CompilerCtx.type*) @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp5834)
%closure_id.5836 = alloca i32
store i32 %.tmp5835, i32* %closure_id.5836
%.tmp5837 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.5815
%.tmp5838 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5837, i32 0, i32 4
%.tmp5839 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5838
%.tmp5840 = call %m2652$.Type.type*(%m2652$.Type.type*) @m295$type_clone.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.tmp5839)
%closure_type.5841 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp5840, %m2652$.Type.type** %closure_type.5841
%.tmp5842 = load %m2652$.Type.type*, %m2652$.Type.type** %closure_type.5841
%.tmp5843 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5842, i32 0, i32 3
%.tmp5844 = load %m2652$.Type.type*, %m2652$.Type.type** %closure_type.5841
%.tmp5845 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5844, i32 0, i32 3
%.tmp5846 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5845
%.tmp5847 = call %m2652$.Type.type*(%m2652$.Type.type*) @m295$type_clone.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.tmp5846)
store %m2652$.Type.type* %.tmp5847, %m2652$.Type.type** %.tmp5843
%.tmp5848 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%ctx_param.5849 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp5848, %m2652$.Type.type** %ctx_param.5849
%.tmp5850 = load %m2652$.Type.type*, %m2652$.Type.type** %ctx_param.5849
%.tmp5851 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5850, i32 0, i32 0
%.tmp5853 = getelementptr [4 x i8], [4 x i8]*@.str5852, i32 0, i32 0
store i8* %.tmp5853, i8** %.tmp5851
%.tmp5854 = load %m2652$.Type.type*, %m2652$.Type.type** %ctx_param.5849
%.tmp5855 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5854, i32 0, i32 3
%.tmp5856 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp5856, %m2652$.Type.type** %.tmp5855
%.tmp5857 = load %m2652$.Type.type*, %m2652$.Type.type** %ctx_param.5849
%.tmp5858 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5857, i32 0, i32 3
%.tmp5859 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5858
%.tmp5860 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5859, i32 0, i32 0
%.tmp5862 = getelementptr [7 x i8], [7 x i8]*@.str5861, i32 0, i32 0
store i8* %.tmp5862, i8** %.tmp5860
%.tmp5863 = load %m2652$.Type.type*, %m2652$.Type.type** %ctx_param.5849
%.tmp5864 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5863, i32 0, i32 4
%.tmp5865 = load %m2652$.Type.type*, %m2652$.Type.type** %closure_type.5841
%.tmp5866 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5865, i32 0, i32 3
%.tmp5867 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5866
%.tmp5868 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5867, i32 0, i32 4
%.tmp5869 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5868
store %m2652$.Type.type* %.tmp5869, %m2652$.Type.type** %.tmp5864
%.tmp5870 = load %m2652$.Type.type*, %m2652$.Type.type** %closure_type.5841
%.tmp5871 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5870, i32 0, i32 3
%.tmp5872 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5871
%.tmp5873 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5872, i32 0, i32 4
%.tmp5874 = load %m2652$.Type.type*, %m2652$.Type.type** %ctx_param.5849
store %m2652$.Type.type* %.tmp5874, %m2652$.Type.type** %.tmp5873
%.tmp5876 = getelementptr [1 x i8], [1 x i8]*@.str5875, i32 0, i32 0
%closure_name.5877 = alloca i8*
store i8* %.tmp5876, i8** %closure_name.5877
%.tmp5878 = getelementptr i8*, i8** %closure_name.5877, i32 0
%.tmp5880 = getelementptr [5 x i8], [5 x i8]*@.str5879, i32 0, i32 0
%.tmp5881 = load i32, i32* %closure_id.5836
%.tmp5882 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5878, i8* %.tmp5880, i32 %.tmp5881)
%.tmp5883 = load %m2652$.Type.type*, %m2652$.Type.type** %closure_type.5841
%.tmp5884 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5883, i32 0, i32 3
%.tmp5885 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5884
%.tmp5886 = call %m2652$.Type.type*(%m2652$.Type.type*) @m295$type_clone.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.tmp5885)
%ret_type.5887 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp5886, %m2652$.Type.type** %ret_type.5887
%.tmp5888 = load %m2652$.Type.type*, %m2652$.Type.type** %ret_type.5887
%.tmp5889 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp5888, i32 0, i32 3
store %m2652$.Type.type* null, %m2652$.Type.type** %.tmp5889
%.tmp5890 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5891 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5890, i32 0, i32 1
%.tmp5892 = load %m0$.File.type*, %m0$.File.type** %.tmp5891
%.tmp5894 = getelementptr [101 x i8], [101 x i8]*@.str5893, i32 0, i32 0
%.tmp5895 = load i32, i32* %closure_id.5836
%.tmp5896 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5892, i8* %.tmp5894, i32 %.tmp5895)
%.tmp5897 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5898 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5897, i32 0, i32 1
%.tmp5899 = load %m0$.File.type*, %m0$.File.type** %.tmp5898
%.tmp5901 = getelementptr [100 x i8], [100 x i8]*@.str5900, i32 0, i32 0
%.tmp5902 = load i32, i32* %closure_id.5836
%.tmp5903 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5904 = load %m2652$.Type.type*, %m2652$.Type.type** %closure_type.5841
%.tmp5905 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5903, %m2652$.Type.type* %.tmp5904)
%.tmp5906 = load i8*, i8** %closure_name.5877
%.tmp5907 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5899, i8* %.tmp5901, i32 %.tmp5902, i8* %.tmp5905, i8* %.tmp5906)
%.tmp5908 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5909 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5908, i32 0, i32 1
%.tmp5910 = load %m0$.File.type*, %m0$.File.type** %.tmp5909
%.tmp5912 = getelementptr [66 x i8], [66 x i8]*@.str5911, i32 0, i32 0
%.tmp5913 = load i32, i32* %closure_id.5836
%.tmp5914 = load i32, i32* %closure_id.5836
%.tmp5915 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5910, i8* %.tmp5912, i32 %.tmp5913, i32 %.tmp5914)
%.tmp5916 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5917 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5916, i32 0, i32 1
%.tmp5918 = load %m0$.File.type*, %m0$.File.type** %.tmp5917
%.tmp5920 = getelementptr [35 x i8], [35 x i8]*@.str5919, i32 0, i32 0
%.tmp5921 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.5815
%.tmp5922 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp5921)
%.tmp5923 = load i32, i32* %closure_id.5836
%.tmp5924 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5925 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.5815
%.tmp5926 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp5925, i32 0, i32 4
%.tmp5927 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp5926
%.tmp5928 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5924, %m2652$.Type.type* %.tmp5927)
%.tmp5929 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5918, i8* %.tmp5920, i8* %.tmp5922, i32 %.tmp5923, i8* %.tmp5928)
%.tmp5930 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5931 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5930, i32 0, i32 1
%.tmp5932 = load %m0$.File.type*, %m0$.File.type** %.tmp5931
%bkp_ctx.5933 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp5932, %m0$.File.type** %bkp_ctx.5933
%.tmp5934 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5935 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5934, i32 0, i32 1
%.tmp5936 = call %m0$.File.type*() @tmpfile()
store %m0$.File.type* %.tmp5936, %m0$.File.type** %.tmp5935
%.tmp5937 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5938 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5937, i32 0, i32 1
%.tmp5939 = load %m0$.File.type*, %m0$.File.type** %.tmp5938
%.tmp5941 = getelementptr [14 x i8], [14 x i8]*@.str5940, i32 0, i32 0
%.tmp5942 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5943 = load %m2652$.Type.type*, %m2652$.Type.type** %ret_type.5887
%.tmp5944 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5942, %m2652$.Type.type* %.tmp5943)
%.tmp5945 = load i8*, i8** %closure_name.5877
%.tmp5946 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5939, i8* %.tmp5941, i8* %.tmp5944, i8* %.tmp5945)
%.tmp5947 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5949 = getelementptr [9 x i8], [9 x i8]*@.str5948, i32 0, i32 0
%.tmp5950 = bitcast ptr null to i8*
%.tmp5951 = bitcast ptr null to i8*
%.tmp5952 = load %m2652$.Type.type*, %m2652$.Type.type** %ret_type.5887
call void(%m2652$.CompilerCtx.type*,i8*,i8*,i8*,%m2652$.Type.type*) @m295$push_scope.v.m2652$.CompilerCtx.typep.cp.cp.cp.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5947, i8* %.tmp5949, i8* %.tmp5950, i8* %.tmp5951, %m2652$.Type.type* %.tmp5952)
%.tmp5953 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5954 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5953, i32 0, i32 1
%.tmp5955 = load %m0$.File.type*, %m0$.File.type** %.tmp5954
%.tmp5957 = getelementptr [13 x i8], [13 x i8]*@.str5956, i32 0, i32 0
%.tmp5958 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5959 = load %m2652$.Type.type*, %m2652$.Type.type** %ctx_param.5849
%.tmp5960 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp5958, %m2652$.Type.type* %.tmp5959)
%.tmp5961 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5955, i8* %.tmp5957, i8* %.tmp5960)
%.tmp5962 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5963 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5962, i32 0, i32 6
%.tmp5964 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5963
%.tmp5965 = call %m980$.Node.type*(%m980$.Node.type*) @m295$syn_function_params.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5964)
%params.5966 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp5965, %m980$.Node.type** %params.5966
%param_type.5967 = alloca %m2652$.Type.type*
store %m2652$.Type.type* null, %m2652$.Type.type** %param_type.5967
%.tmp5969 = load %m980$.Node.type*, %m980$.Node.type** %params.5966
%param_ptr.5970 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp5969, %m980$.Node.type** %param_ptr.5970
br label %.for.start.5968
.for.start.5968:
%.tmp5971 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.5970
%.tmp5972 = icmp ne %m980$.Node.type* %.tmp5971, null
br i1 %.tmp5972, label %.for.continue.5968, label %.for.end.5968
.for.continue.5968:
%.tmp5973 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.5970
%.tmp5974 = load %m980$.Node.type*, %m980$.Node.type** %params.5966
%.tmp5975 = icmp ne %m980$.Node.type* %.tmp5973, %.tmp5974
br i1 %.tmp5975, label %.if.true.5976, label %.if.false.5976
.if.true.5976:
%.tmp5977 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.5970
%.tmp5978 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5977, i32 0, i32 7
%.tmp5979 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5978
store %m980$.Node.type* %.tmp5979, %m980$.Node.type** %param_ptr.5970
br label %.if.end.5976
.if.false.5976:
br label %.if.end.5976
.if.end.5976:
%.tmp5980 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5981 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp5980, i32 0, i32 1
%.tmp5982 = load %m0$.File.type*, %m0$.File.type** %.tmp5981
%.tmp5984 = getelementptr [3 x i8], [3 x i8]*@.str5983, i32 0, i32 0
%.tmp5985 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5982, i8* %.tmp5984)
%.tmp5986 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.5970
%.tmp5987 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5986, i32 0, i32 0
%.tmp5988 = load i8*, i8** %.tmp5987
%.tmp5990 = getelementptr [5 x i8], [5 x i8]*@.str5989, i32 0, i32 0
%.tmp5991 = call i32(i8*,i8*) @strcmp(i8* %.tmp5988, i8* %.tmp5990)
%.tmp5992 = icmp eq i32 %.tmp5991, 0
br i1 %.tmp5992, label %.if.true.5993, label %.if.false.5993
.if.true.5993:
%.tmp5994 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp5995 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.5970
%.tmp5996 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5995, i32 0, i32 6
%.tmp5997 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5996
%.tmp5998 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp5994, %m980$.Node.type* %.tmp5997)
store %m2652$.Type.type* %.tmp5998, %m2652$.Type.type** %param_type.5967
%.tmp5999 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.5970
%.tmp6000 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5999, i32 0, i32 7
%.tmp6001 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6000
store %m980$.Node.type* %.tmp6001, %m980$.Node.type** %param_ptr.5970
br label %.if.end.5993
.if.false.5993:
br label %.if.end.5993
.if.end.5993:
%.tmp6002 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6003 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6002, i32 0, i32 1
%.tmp6004 = load %m0$.File.type*, %m0$.File.type** %.tmp6003
%.tmp6006 = getelementptr [13 x i8], [13 x i8]*@.str6005, i32 0, i32 0
%.tmp6007 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6008 = load %m2652$.Type.type*, %m2652$.Type.type** %param_type.5967
%.tmp6009 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp6007, %m2652$.Type.type* %.tmp6008)
%.tmp6010 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.5970
%.tmp6011 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6010, i32 0, i32 1
%.tmp6012 = load i8*, i8** %.tmp6011
%.tmp6013 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6004, i8* %.tmp6006, i8* %.tmp6009, i8* %.tmp6012)
%.tmp6014 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.5970
%.tmp6015 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6014, i32 0, i32 7
%.tmp6016 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6015
store %m980$.Node.type* %.tmp6016, %m980$.Node.type** %param_ptr.5970
br label %.for.start.5968
.for.end.5968:
%.tmp6017 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6018 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6017, i32 0, i32 1
%.tmp6019 = load %m0$.File.type*, %m0$.File.type** %.tmp6018
%.tmp6021 = getelementptr [5 x i8], [5 x i8]*@.str6020, i32 0, i32 0
%.tmp6022 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6019, i8* %.tmp6021)
%.tmp6023 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6024 = load %m980$.Node.type*, %m980$.Node.type** %params.5966
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_fn_params.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6023, %m980$.Node.type* %.tmp6024)
%.tmp6025 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6026 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6025, i32 0, i32 6
%.tmp6027 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6026
%.tmp6029 = getelementptr [6 x i8], [6 x i8]*@.str6028, i32 0, i32 0
%.tmp6030 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6027, i8* %.tmp6029)
%block.6031 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6030, %m980$.Node.type** %block.6031
%.tmp6032 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6033 = load %m980$.Node.type*, %m980$.Node.type** %block.6031
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6032, %m980$.Node.type* %.tmp6033)
%.tmp6034 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6035 = load %m980$.Node.type*, %m980$.Node.type** %block.6031
%.tmp6036 = load %m2652$.Type.type*, %m2652$.Type.type** %ret_type.5887
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,%m2652$.Type.type*) @m295$check_n_add_implicit_return.v.m2652$.CompilerCtx.typep.m980$.Node.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp6034, %m980$.Node.type* %.tmp6035, %m2652$.Type.type* %.tmp6036)
%.tmp6037 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
call void(%m2652$.CompilerCtx.type*) @m295$pop_scope.v.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp6037)
%.tmp6038 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6039 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6038, i32 0, i32 1
%.tmp6040 = load %m0$.File.type*, %m0$.File.type** %.tmp6039
%.tmp6042 = getelementptr [3 x i8], [3 x i8]*@.str6041, i32 0, i32 0
%.tmp6043 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6040, i8* %.tmp6042)
%.tmp6044 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6045 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6044, i32 0, i32 1
%.tmp6046 = load %m0$.File.type*, %m0$.File.type** %.tmp6045
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp6046)
%.tmp6047 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6048 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6047, i32 0, i32 1
%.tmp6049 = load %m0$.File.type*, %m0$.File.type** %.tmp6048
%.tmp6050 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6049)
%.tmp6051 = call i8*(i32) @m1$readall.cp.i(i32 %.tmp6050)
%code.6052 = alloca i8*
store i8* %.tmp6051, i8** %code.6052
%.tmp6053 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6054 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6053, i32 0, i32 1
%.tmp6055 = load %m0$.File.type*, %m0$.File.type** %.tmp6054
%.tmp6056 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp6055)
%.tmp6057 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6058 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6057, i32 0, i32 1
%.tmp6059 = load %m0$.File.type*, %m0$.File.type** %bkp_ctx.5933
store %m0$.File.type* %.tmp6059, %m0$.File.type** %.tmp6058
%.tmp6060 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6061 = load i8*, i8** %code.6052
call void(%m2652$.CompilerCtx.type*,i8*) @m295$append_anon_fn.v.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.tmp6060, i8* %.tmp6061)
ret void
}
define void @m295$check_n_add_implicit_return.v.m2652$.CompilerCtx.typep.m980$.Node.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, %m2652$.Type.type* %.return_type.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%return_type = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.return_type.arg, %m2652$.Type.type** %return_type
%.tmp6062 = bitcast ptr null to %m980$.Node.type*
%li.6063 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6062, %m980$.Node.type** %li.6063
%.tmp6064 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6065 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6064, i32 0, i32 6
%.tmp6066 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6065
%.tmp6068 = getelementptr [12 x i8], [12 x i8]*@.str6067, i32 0, i32 0
%.tmp6069 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6066, i8* %.tmp6068)
%exprs.6070 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6069, %m980$.Node.type** %exprs.6070
%.tmp6072 = load %m980$.Node.type*, %m980$.Node.type** %exprs.6070
%.tmp6073 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6072, i32 0, i32 6
%.tmp6074 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6073
%ci.6075 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6074, %m980$.Node.type** %ci.6075
br label %.for.start.6071
.for.start.6071:
%.tmp6076 = load %m980$.Node.type*, %m980$.Node.type** %ci.6075
%.tmp6077 = icmp ne %m980$.Node.type* %.tmp6076, null
br i1 %.tmp6077, label %.for.continue.6071, label %.for.end.6071
.for.continue.6071:
%.tmp6078 = load %m980$.Node.type*, %m980$.Node.type** %ci.6075
%.tmp6079 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6078, i32 0, i32 6
%.tmp6080 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6079
%.tmp6081 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6080, i32 0, i32 0
%.tmp6082 = load i8*, i8** %.tmp6081
%.tmp6084 = getelementptr [3 x i8], [3 x i8]*@.str6083, i32 0, i32 0
%.tmp6085 = call i32(i8*,i8*) @strcmp(i8* %.tmp6082, i8* %.tmp6084)
%.tmp6086 = icmp ne i32 %.tmp6085, 0
br i1 %.tmp6086, label %.if.true.6087, label %.if.false.6087
.if.true.6087:
%.tmp6088 = load %m980$.Node.type*, %m980$.Node.type** %ci.6075
store %m980$.Node.type* %.tmp6088, %m980$.Node.type** %li.6063
br label %.if.end.6087
.if.false.6087:
br label %.if.end.6087
.if.end.6087:
%.tmp6089 = load %m980$.Node.type*, %m980$.Node.type** %ci.6075
%.tmp6090 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6089, i32 0, i32 7
%.tmp6091 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6090
store %m980$.Node.type* %.tmp6091, %m980$.Node.type** %ci.6075
br label %.for.start.6071
.for.end.6071:
%.tmp6092 = load %m980$.Node.type*, %m980$.Node.type** %li.6063
%.tmp6093 = icmp ne %m980$.Node.type* %.tmp6092, null
br i1 %.tmp6093, label %.if.true.6094, label %.if.false.6094
.if.true.6094:
%.tmp6095 = load %m980$.Node.type*, %m980$.Node.type** %li.6063
%.tmp6096 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6095, i32 0, i32 6
%.tmp6097 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6096
%.tmp6098 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6097, i32 0, i32 0
%.tmp6099 = load i8*, i8** %.tmp6098
%.tmp6101 = getelementptr [7 x i8], [7 x i8]*@.str6100, i32 0, i32 0
%.tmp6102 = call i32(i8*,i8*) @strcmp(i8* %.tmp6099, i8* %.tmp6101)
%.tmp6103 = icmp eq i32 %.tmp6102, 0
br i1 %.tmp6103, label %.if.true.6104, label %.if.false.6104
.if.true.6104:
ret void
br label %.if.end.6104
.if.false.6104:
br label %.if.end.6104
.if.end.6104:
br label %.if.end.6094
.if.false.6094:
br label %.if.end.6094
.if.end.6094:
%.tmp6105 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6106 = load %m2652$.Type.type*, %m2652$.Type.type** %return_type
%.tmp6107 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp6105, %m2652$.Type.type* %.tmp6106)
%.tmp6109 = getelementptr [5 x i8], [5 x i8]*@.str6108, i32 0, i32 0
%.tmp6110 = call i32(i8*,i8*) @strcmp(i8* %.tmp6107, i8* %.tmp6109)
%.tmp6111 = icmp ne i32 %.tmp6110, 0
br i1 %.tmp6111, label %.if.true.6112, label %.if.false.6112
.if.true.6112:
%.tmp6113 = load %m980$.Node.type*, %m980$.Node.type** %li.6063
%.tmp6114 = icmp ne %m980$.Node.type* %.tmp6113, null
br i1 %.tmp6114, label %.if.true.6115, label %.if.false.6115
.if.true.6115:
%.tmp6116 = load %m980$.Node.type*, %m980$.Node.type** %li.6063
store %m980$.Node.type* %.tmp6116, %m980$.Node.type** %stmt
br label %.if.end.6115
.if.false.6115:
br label %.if.end.6115
.if.end.6115:
%.tmp6117 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6118 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6120 = getelementptr [21 x i8], [21 x i8]*@.str6119, i32 0, i32 0
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp6117, %m980$.Node.type* %.tmp6118, i8* %.tmp6120)
br label %.if.end.6112
.if.false.6112:
%.tmp6121 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6122 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6121, i32 0, i32 1
%.tmp6123 = load %m0$.File.type*, %m0$.File.type** %.tmp6122
%.tmp6125 = getelementptr [10 x i8], [10 x i8]*@.str6124, i32 0, i32 0
%.tmp6126 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6123, i8* %.tmp6125)
br label %.if.end.6112
.if.end.6112:
ret void
}
define void @m295$compile_for_loop.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp6127 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6128 = call i32(%m2652$.CompilerCtx.type*) @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp6127)
%for_id.6129 = alloca i32
store i32 %.tmp6128, i32* %for_id.6129
%.tmp6130 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6131 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6130, i32 0, i32 6
%.tmp6132 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6131
%.tmp6133 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6132, i32 0, i32 7
%.tmp6134 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6133
%init_stmt.6135 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6134, %m980$.Node.type** %init_stmt.6135
%.tmp6136 = bitcast ptr null to i8*
%begin_lbl.6137 = alloca i8*
store i8* %.tmp6136, i8** %begin_lbl.6137
%.tmp6138 = bitcast ptr null to i8*
%end_lbl.6139 = alloca i8*
store i8* %.tmp6138, i8** %end_lbl.6139
%.tmp6140 = getelementptr i8*, i8** %begin_lbl.6137, i32 0
%.tmp6142 = getelementptr [14 x i8], [14 x i8]*@.str6141, i32 0, i32 0
%.tmp6143 = load i32, i32* %for_id.6129
%.tmp6144 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6140, i8* %.tmp6142, i32 %.tmp6143)
%.tmp6145 = getelementptr i8*, i8** %end_lbl.6139, i32 0
%.tmp6147 = getelementptr [12 x i8], [12 x i8]*@.str6146, i32 0, i32 0
%.tmp6148 = load i32, i32* %for_id.6129
%.tmp6149 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6145, i8* %.tmp6147, i32 %.tmp6148)
%.tmp6150 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6152 = getelementptr [4 x i8], [4 x i8]*@.str6151, i32 0, i32 0
%.tmp6153 = load i8*, i8** %begin_lbl.6137
%.tmp6154 = load i8*, i8** %end_lbl.6139
%.tmp6155 = bitcast ptr null to %m2652$.Type.type*
call void(%m2652$.CompilerCtx.type*,i8*,i8*,i8*,%m2652$.Type.type*) @m295$push_scope.v.m2652$.CompilerCtx.typep.cp.cp.cp.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp6150, i8* %.tmp6152, i8* %.tmp6153, i8* %.tmp6154, %m2652$.Type.type* %.tmp6155)
%.tmp6156 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6135
%.tmp6157 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6156, i32 0, i32 0
%.tmp6158 = load i8*, i8** %.tmp6157
%.tmp6160 = getelementptr [12 x i8], [12 x i8]*@.str6159, i32 0, i32 0
%.tmp6161 = call i32(i8*,i8*) @strcmp(i8* %.tmp6158, i8* %.tmp6160)
%.tmp6162 = icmp eq i32 %.tmp6161, 0
br i1 %.tmp6162, label %.if.true.6163, label %.if.false.6163
.if.true.6163:
%.tmp6164 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6165 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6135
%.tmp6166 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_declaration.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6164, %m980$.Node.type* %.tmp6165)
br label %.if.end.6163
.if.false.6163:
%.tmp6167 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6135
%.tmp6168 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6167, i32 0, i32 0
%.tmp6169 = load i8*, i8** %.tmp6168
%.tmp6171 = getelementptr [11 x i8], [11 x i8]*@.str6170, i32 0, i32 0
%.tmp6172 = call i32(i8*,i8*) @strcmp(i8* %.tmp6169, i8* %.tmp6171)
%.tmp6173 = icmp eq i32 %.tmp6172, 0
br i1 %.tmp6173, label %.if.true.6174, label %.if.false.6174
.if.true.6174:
%.tmp6175 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6176 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6135
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_expression.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6175, %m980$.Node.type* %.tmp6176)
br label %.if.end.6174
.if.false.6174:
%.tmp6177 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6135
%.tmp6178 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6177, i32 0, i32 0
%.tmp6179 = load i8*, i8** %.tmp6178
%.tmp6181 = getelementptr [9 x i8], [9 x i8]*@.str6180, i32 0, i32 0
%.tmp6182 = call i32(i8*,i8*) @strcmp(i8* %.tmp6179, i8* %.tmp6181)
%.tmp6183 = icmp eq i32 %.tmp6182, 0
br i1 %.tmp6183, label %.if.true.6184, label %.if.false.6184
.if.true.6184:
br label %.if.end.6184
.if.false.6184:
%.tmp6185 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6186 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6135
%.tmp6188 = getelementptr [66 x i8], [66 x i8]*@.str6187, i32 0, i32 0
%.tmp6189 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp6185, %m980$.Node.type* %.tmp6186, i8* %.tmp6188)
%.tmp6190 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6135
%.tmp6191 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6190, i32 0, i32 0
%.tmp6192 = load i8*, i8** %.tmp6191
%.tmp6193 = call i32(i8*,...) @printf(i8* %.tmp6189, i8* %.tmp6192)
%.tmp6194 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
call void(%m2652$.CompilerCtx.type*) @m295$pop_scope.v.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp6194)
ret void
br label %.if.end.6184
.if.end.6184:
br label %.if.end.6174
.if.end.6174:
br label %.if.end.6163
.if.end.6163:
%.tmp6195 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6196 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6195, i32 0, i32 1
%.tmp6197 = load %m0$.File.type*, %m0$.File.type** %.tmp6196
%.tmp6199 = getelementptr [26 x i8], [26 x i8]*@.str6198, i32 0, i32 0
%.tmp6200 = load i32, i32* %for_id.6129
%.tmp6201 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6197, i8* %.tmp6199, i32 %.tmp6200)
%.tmp6202 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6203 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6202, i32 0, i32 1
%.tmp6204 = load %m0$.File.type*, %m0$.File.type** %.tmp6203
%.tmp6206 = getelementptr [16 x i8], [16 x i8]*@.str6205, i32 0, i32 0
%.tmp6207 = load i32, i32* %for_id.6129
%.tmp6208 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6204, i8* %.tmp6206, i32 %.tmp6207)
%.tmp6209 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6210 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6209, i32 0, i32 6
%.tmp6211 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6210
%.tmp6213 = getelementptr [9 x i8], [9 x i8]*@.str6212, i32 0, i32 0
%.tmp6214 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6211, i8* %.tmp6213)
%fst_colon.6215 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6214, %m980$.Node.type** %fst_colon.6215
%.tmp6216 = load %m980$.Node.type*, %m980$.Node.type** %fst_colon.6215
%.tmp6217 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6216, i32 0, i32 7
%.tmp6218 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6217
%condition.6219 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6218, %m980$.Node.type** %condition.6219
%.tmp6220 = load %m980$.Node.type*, %m980$.Node.type** %condition.6219
%.tmp6221 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6220, i32 0, i32 0
%.tmp6222 = load i8*, i8** %.tmp6221
%.tmp6224 = getelementptr [9 x i8], [9 x i8]*@.str6223, i32 0, i32 0
%.tmp6225 = call i32(i8*,i8*) @strcmp(i8* %.tmp6222, i8* %.tmp6224)
%.tmp6226 = icmp eq i32 %.tmp6225, 0
br i1 %.tmp6226, label %.if.true.6227, label %.if.false.6227
.if.true.6227:
%.tmp6228 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6229 = load %m980$.Node.type*, %m980$.Node.type** %condition.6219
%.tmp6231 = getelementptr [39 x i8], [39 x i8]*@.str6230, i32 0, i32 0
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp6228, %m980$.Node.type* %.tmp6229, i8* %.tmp6231)
ret void
br label %.if.end.6227
.if.false.6227:
br label %.if.end.6227
.if.end.6227:
%.tmp6232 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6233 = load %m980$.Node.type*, %m980$.Node.type** %condition.6219
%.tmp6234 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6232, %m980$.Node.type* %.tmp6233)
%condition_info.6235 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp6234, %m2652$.AssignableInfo.type** %condition_info.6235
%.tmp6236 = load %m980$.Node.type*, %m980$.Node.type** %fst_colon.6215
%.tmp6237 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6236, i32 0, i32 7
%.tmp6238 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6237
%.tmp6240 = getelementptr [9 x i8], [9 x i8]*@.str6239, i32 0, i32 0
%.tmp6241 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6238, i8* %.tmp6240)
%snd_colon.6242 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6241, %m980$.Node.type** %snd_colon.6242
%.tmp6243 = load %m980$.Node.type*, %m980$.Node.type** %snd_colon.6242
%.tmp6245 = getelementptr [6 x i8], [6 x i8]*@.str6244, i32 0, i32 0
%.tmp6246 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6243, i8* %.tmp6245)
%for_body.6247 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6246, %m980$.Node.type** %for_body.6247
%.tmp6248 = load %m980$.Node.type*, %m980$.Node.type** %for_body.6247
%.tmp6250 = getelementptr [11 x i8], [11 x i8]*@.str6249, i32 0, i32 0
%.tmp6251 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6248, i8* %.tmp6250)
%else_block.6252 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6251, %m980$.Node.type** %else_block.6252
%.tmp6253 = load i8*, i8** %end_lbl.6139
%on_end.6254 = alloca i8*
store i8* %.tmp6253, i8** %on_end.6254
%.tmp6255 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6252
%.tmp6256 = icmp ne %m980$.Node.type* %.tmp6255, null
br i1 %.tmp6256, label %.if.true.6257, label %.if.false.6257
.if.true.6257:
%.tmp6258 = getelementptr i8*, i8** %on_end.6254, i32 0
%.tmp6260 = getelementptr [13 x i8], [13 x i8]*@.str6259, i32 0, i32 0
%.tmp6261 = load i32, i32* %for_id.6129
%.tmp6262 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6258, i8* %.tmp6260, i32 %.tmp6261)
br label %.if.end.6257
.if.false.6257:
br label %.if.end.6257
.if.end.6257:
%.tmp6263 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6264 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6263, i32 0, i32 1
%.tmp6265 = load %m0$.File.type*, %m0$.File.type** %.tmp6264
%.tmp6267 = getelementptr [48 x i8], [48 x i8]*@.str6266, i32 0, i32 0
%.tmp6268 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6269 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %condition_info.6235
%.tmp6270 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6269, i32 0, i32 4
%.tmp6271 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6270
%.tmp6272 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp6268, %m2652$.Type.type* %.tmp6271)
%.tmp6273 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %condition_info.6235
%.tmp6274 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp6273)
%.tmp6275 = load i32, i32* %for_id.6129
%.tmp6276 = load i8*, i8** %on_end.6254
%.tmp6277 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6265, i8* %.tmp6267, i8* %.tmp6272, i8* %.tmp6274, i32 %.tmp6275, i8* %.tmp6276)
%.tmp6278 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6279 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6278, i32 0, i32 1
%.tmp6280 = load %m0$.File.type*, %m0$.File.type** %.tmp6279
%.tmp6282 = getelementptr [19 x i8], [19 x i8]*@.str6281, i32 0, i32 0
%.tmp6283 = load i32, i32* %for_id.6129
%.tmp6284 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6280, i8* %.tmp6282, i32 %.tmp6283)
%.tmp6285 = load %m980$.Node.type*, %m980$.Node.type** %snd_colon.6242
%.tmp6286 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6285, i32 0, i32 7
%.tmp6287 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6286
%increment.6288 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6287, %m980$.Node.type** %increment.6288
%.tmp6289 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6290 = load %m980$.Node.type*, %m980$.Node.type** %for_body.6247
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6289, %m980$.Node.type* %.tmp6290)
%.tmp6291 = load %m980$.Node.type*, %m980$.Node.type** %increment.6288
%.tmp6292 = load %m980$.Node.type*, %m980$.Node.type** %for_body.6247
%.tmp6293 = icmp ne %m980$.Node.type* %.tmp6291, %.tmp6292
br i1 %.tmp6293, label %.if.true.6294, label %.if.false.6294
.if.true.6294:
%.tmp6295 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6296 = load %m980$.Node.type*, %m980$.Node.type** %increment.6288
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_expression.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6295, %m980$.Node.type* %.tmp6296)
br label %.if.end.6294
.if.false.6294:
br label %.if.end.6294
.if.end.6294:
%.tmp6297 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6298 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6297, i32 0, i32 1
%.tmp6299 = load %m0$.File.type*, %m0$.File.type** %.tmp6298
%.tmp6301 = getelementptr [15 x i8], [15 x i8]*@.str6300, i32 0, i32 0
%.tmp6302 = load i8*, i8** %begin_lbl.6137
%.tmp6303 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6299, i8* %.tmp6301, i8* %.tmp6302)
%.tmp6304 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6252
%.tmp6305 = icmp ne %m980$.Node.type* %.tmp6304, null
br i1 %.tmp6305, label %.if.true.6306, label %.if.false.6306
.if.true.6306:
%.tmp6307 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6308 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6307, i32 0, i32 1
%.tmp6309 = load %m0$.File.type*, %m0$.File.type** %.tmp6308
%.tmp6311 = getelementptr [15 x i8], [15 x i8]*@.str6310, i32 0, i32 0
%.tmp6312 = load i32, i32* %for_id.6129
%.tmp6313 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6309, i8* %.tmp6311, i32 %.tmp6312)
%.tmp6314 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6252
%.tmp6315 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6314, i32 0, i32 6
%.tmp6316 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6315
%.tmp6318 = getelementptr [6 x i8], [6 x i8]*@.str6317, i32 0, i32 0
%.tmp6319 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6316, i8* %.tmp6318)
%block.6320 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6319, %m980$.Node.type** %block.6320
%.tmp6321 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6322 = load %m980$.Node.type*, %m980$.Node.type** %block.6320
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6321, %m980$.Node.type* %.tmp6322)
%.tmp6323 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6324 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6323, i32 0, i32 1
%.tmp6325 = load %m0$.File.type*, %m0$.File.type** %.tmp6324
%.tmp6327 = getelementptr [15 x i8], [15 x i8]*@.str6326, i32 0, i32 0
%.tmp6328 = load i8*, i8** %end_lbl.6139
%.tmp6329 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6325, i8* %.tmp6327, i8* %.tmp6328)
br label %.if.end.6306
.if.false.6306:
br label %.if.end.6306
.if.end.6306:
%.tmp6330 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6331 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6330, i32 0, i32 1
%.tmp6332 = load %m0$.File.type*, %m0$.File.type** %.tmp6331
%.tmp6334 = getelementptr [5 x i8], [5 x i8]*@.str6333, i32 0, i32 0
%.tmp6335 = load i8*, i8** %end_lbl.6139
%.tmp6336 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6332, i8* %.tmp6334, i8* %.tmp6335)
%.tmp6337 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
call void(%m2652$.CompilerCtx.type*) @m295$pop_scope.v.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp6337)
ret void
}
define %m2652$.AssignableInfo.type* @m295$compile_declaration.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp6338 = bitcast ptr null to %m2652$.Type.type*
%decl_type.6339 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp6338, %m2652$.Type.type** %decl_type.6339
%.tmp6340 = bitcast ptr null to %m2652$.AssignableInfo.type*
%a_info.6341 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp6340, %m2652$.AssignableInfo.type** %a_info.6341
%.tmp6342 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6343 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6342, i32 0, i32 6
%.tmp6344 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6343
%.tmp6345 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6344, i32 0, i32 0
%.tmp6346 = load i8*, i8** %.tmp6345
%.tmp6348 = getelementptr [5 x i8], [5 x i8]*@.str6347, i32 0, i32 0
%.tmp6349 = call i32(i8*,i8*) @strcmp(i8* %.tmp6346, i8* %.tmp6348)
%.tmp6350 = icmp eq i32 %.tmp6349, 0
br i1 %.tmp6350, label %.if.true.6351, label %.if.false.6351
.if.true.6351:
%.tmp6352 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6353 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6354 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6353, i32 0, i32 6
%.tmp6355 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6354
%.tmp6356 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6355, i32 0, i32 6
%.tmp6357 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6356
%.tmp6358 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6352, %m980$.Node.type* %.tmp6357)
store %m2652$.Type.type* %.tmp6358, %m2652$.Type.type** %decl_type.6339
br label %.if.end.6351
.if.false.6351:
br label %.if.end.6351
.if.end.6351:
%.tmp6359 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6360 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6359, i32 0, i32 6
%.tmp6361 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6360
%.tmp6363 = getelementptr [11 x i8], [11 x i8]*@.str6362, i32 0, i32 0
%.tmp6364 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6361, i8* %.tmp6363)
%assignable.6365 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6364, %m980$.Node.type** %assignable.6365
%.tmp6366 = load %m980$.Node.type*, %m980$.Node.type** %assignable.6365
%.tmp6367 = icmp ne %m980$.Node.type* %.tmp6366, null
br i1 %.tmp6367, label %.if.true.6368, label %.if.false.6368
.if.true.6368:
%.tmp6369 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6370 = load %m980$.Node.type*, %m980$.Node.type** %assignable.6365
%.tmp6371 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6369, %m980$.Node.type* %.tmp6370)
store %m2652$.AssignableInfo.type* %.tmp6371, %m2652$.AssignableInfo.type** %a_info.6341
br label %.if.end.6368
.if.false.6368:
br label %.if.end.6368
.if.end.6368:
%.tmp6372 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6373 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp6372)
%info.6374 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp6373, %m2652$.AssignableInfo.type** %info.6374
%.tmp6375 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.6374
%.tmp6376 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6375, i32 0, i32 3
%.tmp6378 = getelementptr [9 x i8], [9 x i8]*@.str6377, i32 0, i32 0
store i8* %.tmp6378, i8** %.tmp6376
%.tmp6379 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6380 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6379, i32 0, i32 6
%.tmp6381 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6380
%.tmp6383 = getelementptr [5 x i8], [5 x i8]*@.str6382, i32 0, i32 0
%.tmp6384 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6381, i8* %.tmp6383)
%var_name.6385 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6384, %m980$.Node.type** %var_name.6385
%.tmp6386 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6385
%.tmp6387 = icmp eq %m980$.Node.type* %.tmp6386, null
br i1 %.tmp6387, label %.if.true.6388, label %.if.false.6388
.if.true.6388:
%.tmp6389 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6390 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6392 = getelementptr [31 x i8], [31 x i8]*@.str6391, i32 0, i32 0
%.tmp6393 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp6389, %m980$.Node.type* %.tmp6390, i8* %.tmp6392)
%.tmp6394 = call i32(i8*,...) @printf(i8* %.tmp6393)
%.tmp6395 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp6395
br label %.if.end.6388
.if.false.6388:
br label %.if.end.6388
.if.end.6388:
%.tmp6396 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6397 = call %m2652$.ModuleLookup.type*(%m2652$.CompilerCtx.type*) @m295$get_current_module.m2652$.ModuleLookup.typep.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp6396)
%mod.6398 = alloca %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* %.tmp6397, %m2652$.ModuleLookup.type** %mod.6398
%.tmp6399 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6400 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.6398
%.tmp6401 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp6400, i32 0, i32 3
%.tmp6402 = load %m2652$.Scope.type*, %m2652$.Scope.type** %.tmp6401
%.tmp6403 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6385
%.tmp6404 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6403, i32 0, i32 1
%.tmp6405 = load i8*, i8** %.tmp6404
%.tmp6406 = call %m2652$.ScopeItem.type*(%m2652$.CompilerCtx.type*,%m2652$.Scope.type*,i8*) @m295$find_defined_here.m2652$.ScopeItem.typep.m2652$.CompilerCtx.typep.m2652$.Scope.typep.cp(%m2652$.CompilerCtx.type* %.tmp6399, %m2652$.Scope.type* %.tmp6402, i8* %.tmp6405)
%.tmp6407 = icmp ne %m2652$.ScopeItem.type* %.tmp6406, null
br i1 %.tmp6407, label %.if.true.6408, label %.if.false.6408
.if.true.6408:
%err_buf.6409 = alloca i8*
store i8* null, i8** %err_buf.6409
%.tmp6410 = getelementptr i8*, i8** %err_buf.6409, i32 0
%.tmp6412 = getelementptr [43 x i8], [43 x i8]*@.str6411, i32 0, i32 0
%.tmp6413 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6385
%.tmp6414 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6413, i32 0, i32 1
%.tmp6415 = load i8*, i8** %.tmp6414
%.tmp6416 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6410, i8* %.tmp6412, i8* %.tmp6415)
%.tmp6417 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6418 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6419 = load i8*, i8** %err_buf.6409
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp6417, %m980$.Node.type* %.tmp6418, i8* %.tmp6419)
%.tmp6420 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp6420
br label %.if.end.6408
.if.false.6408:
br label %.if.end.6408
.if.end.6408:
%var_id.6421 = alloca i8*
store i8* null, i8** %var_id.6421
%.tmp6422 = getelementptr i8*, i8** %var_id.6421, i32 0
%.tmp6424 = getelementptr [6 x i8], [6 x i8]*@.str6423, i32 0, i32 0
%.tmp6425 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6385
%.tmp6426 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6425, i32 0, i32 1
%.tmp6427 = load i8*, i8** %.tmp6426
%.tmp6428 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6429 = call i32(%m2652$.CompilerCtx.type*) @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp6428)
%.tmp6430 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6422, i8* %.tmp6424, i8* %.tmp6427, i32 %.tmp6429)
%.tmp6431 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.6374
%.tmp6432 = load i8, i8* @SCOPE_LOCAL
%.tmp6433 = load i8*, i8** %var_id.6421
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp6431, i8 %.tmp6432, i8* %.tmp6433)
%.tmp6434 = load %m2652$.Type.type*, %m2652$.Type.type** %decl_type.6339
%.tmp6435 = icmp ne %m2652$.Type.type* %.tmp6434, null
br i1 %.tmp6435, label %.if.true.6436, label %.if.false.6436
.if.true.6436:
%.tmp6437 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.6374
%.tmp6438 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6437, i32 0, i32 4
%.tmp6439 = load %m2652$.Type.type*, %m2652$.Type.type** %decl_type.6339
store %m2652$.Type.type* %.tmp6439, %m2652$.Type.type** %.tmp6438
br label %.if.end.6436
.if.false.6436:
%.tmp6440 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.6341
%.tmp6441 = icmp ne %m2652$.AssignableInfo.type* %.tmp6440, null
br i1 %.tmp6441, label %.if.true.6442, label %.if.false.6442
.if.true.6442:
%.tmp6443 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.6374
%.tmp6444 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6443, i32 0, i32 4
%.tmp6445 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.6341
%.tmp6446 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6445, i32 0, i32 4
%.tmp6447 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6446
store %m2652$.Type.type* %.tmp6447, %m2652$.Type.type** %.tmp6444
br label %.if.end.6442
.if.false.6442:
br label %.if.end.6442
.if.end.6442:
br label %.if.end.6436
.if.end.6436:
%.tmp6448 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6449 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.6374
%.tmp6450 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6449, i32 0, i32 4
%.tmp6451 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6450
%.tmp6452 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp6448, %m2652$.Type.type* %.tmp6451)
%var_type_repr.6453 = alloca i8*
store i8* %.tmp6452, i8** %var_type_repr.6453
%.tmp6454 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.6341
%.tmp6455 = icmp ne %m2652$.AssignableInfo.type* %.tmp6454, null
br i1 %.tmp6455, label %.if.true.6456, label %.if.false.6456
.if.true.6456:
%.tmp6457 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6458 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.6341
%.tmp6459 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6458, i32 0, i32 4
%.tmp6460 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6459
%.tmp6461 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp6457, %m2652$.Type.type* %.tmp6460)
%a_type_repr.6462 = alloca i8*
store i8* %.tmp6461, i8** %a_type_repr.6462
%.tmp6463 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6464 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.6341
%.tmp6465 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6464, i32 0, i32 4
%.tmp6466 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6465
%.tmp6467 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.6374
%.tmp6468 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6467, i32 0, i32 4
%.tmp6469 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6468
%.tmp6470 = call i1(%m2652$.CompilerCtx.type*,%m2652$.Type.type*,%m2652$.Type.type*) @m2653$cmp.b.m2652$.CompilerCtx.typep.m2652$.Type.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp6463, %m2652$.Type.type* %.tmp6466, %m2652$.Type.type* %.tmp6469)
%.tmp6471 = icmp eq i1 %.tmp6470, 0
br i1 %.tmp6471, label %.if.true.6472, label %.if.false.6472
.if.true.6472:
%.tmp6473 = bitcast ptr null to i8*
%err_msg.6474 = alloca i8*
store i8* %.tmp6473, i8** %err_msg.6474
%.tmp6475 = getelementptr i8*, i8** %err_msg.6474, i32 0
%.tmp6477 = getelementptr [49 x i8], [49 x i8]*@.str6476, i32 0, i32 0
%.tmp6478 = load i8*, i8** %a_type_repr.6462
%.tmp6479 = load i8*, i8** %var_type_repr.6453
%.tmp6480 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6475, i8* %.tmp6477, i8* %.tmp6478, i8* %.tmp6479)
%.tmp6481 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6482 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6483 = load i8*, i8** %err_msg.6474
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp6481, %m980$.Node.type* %.tmp6482, i8* %.tmp6483)
br label %.if.end.6472
.if.false.6472:
br label %.if.end.6472
.if.end.6472:
br label %.if.end.6456
.if.false.6456:
br label %.if.end.6456
.if.end.6456:
%.tmp6484 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6485 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6486 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6385
%.tmp6487 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6486, i32 0, i32 1
%.tmp6488 = load i8*, i8** %.tmp6487
%.tmp6489 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.6374
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2652$.AssignableInfo.type*) @m295$define_assignable.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp6484, %m980$.Node.type* %.tmp6485, i8* %.tmp6488, %m2652$.AssignableInfo.type* %.tmp6489)
%.tmp6490 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6491 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6490, i32 0, i32 1
%.tmp6492 = load %m0$.File.type*, %m0$.File.type** %.tmp6491
%.tmp6494 = getelementptr [16 x i8], [16 x i8]*@.str6493, i32 0, i32 0
%.tmp6495 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.6374
%.tmp6496 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp6495)
%.tmp6497 = load i8*, i8** %var_type_repr.6453
%.tmp6498 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6492, i8* %.tmp6494, i8* %.tmp6496, i8* %.tmp6497)
%.tmp6499 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.6341
%.tmp6500 = icmp ne %m2652$.AssignableInfo.type* %.tmp6499, null
br i1 %.tmp6500, label %.if.true.6501, label %.if.false.6501
.if.true.6501:
%.tmp6502 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6503 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6502, i32 0, i32 1
%.tmp6504 = load %m0$.File.type*, %m0$.File.type** %.tmp6503
%.tmp6506 = getelementptr [21 x i8], [21 x i8]*@.str6505, i32 0, i32 0
%.tmp6507 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6508 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.6341
%.tmp6509 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6508, i32 0, i32 4
%.tmp6510 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6509
%.tmp6511 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp6507, %m2652$.Type.type* %.tmp6510)
%.tmp6512 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.6341
%.tmp6513 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp6512)
%.tmp6514 = load i8*, i8** %var_type_repr.6453
%.tmp6515 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.6374
%.tmp6516 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp6515)
%.tmp6517 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6504, i8* %.tmp6506, i8* %.tmp6511, i8* %.tmp6513, i8* %.tmp6514, i8* %.tmp6516)
br label %.if.end.6501
.if.false.6501:
%.tmp6518 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6519 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6520 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.6374
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,%m2652$.AssignableInfo.type*) @m295$compile_zero_value.v.m2652$.CompilerCtx.typep.m980$.Node.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp6518, %m980$.Node.type* %.tmp6519, %m2652$.AssignableInfo.type* %.tmp6520)
br label %.if.end.6501
.if.end.6501:
%.tmp6521 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.6374
ret %m2652$.AssignableInfo.type* %.tmp6521
}
define void @m295$compile_zero_value.v.m2652$.CompilerCtx.typep.m980$.Node.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, %m2652$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%info = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.info.arg, %m2652$.AssignableInfo.type** %info
%.tmp6522 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp6523 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6522, i32 0, i32 4
%.tmp6524 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6523
%.tmp6525 = icmp eq %m2652$.Type.type* %.tmp6524, null
br i1 %.tmp6525, label %.if.true.6526, label %.if.false.6526
.if.true.6526:
ret void
br label %.if.end.6526
.if.false.6526:
br label %.if.end.6526
.if.end.6526:
%.tmp6527 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6528 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp6529 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6528, i32 0, i32 4
%.tmp6530 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6529
%.tmp6531 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp6527, %m2652$.Type.type* %.tmp6530)
%t_repr.6532 = alloca i8*
store i8* %.tmp6531, i8** %t_repr.6532
%.tmp6533 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp6534 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp6533)
%id.6535 = alloca i8*
store i8* %.tmp6534, i8** %id.6535
%field_id.6536 = alloca i32
store i32 0, i32* %field_id.6536
%field.6537 = alloca %m2652$.Type.type*
store %m2652$.Type.type* null, %m2652$.Type.type** %field.6537
%field_info.6538 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* null, %m2652$.AssignableInfo.type** %field_info.6538
%.tmp6539 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp6540 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6539, i32 0, i32 4
%.tmp6541 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6540
%t.6542 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp6541, %m2652$.Type.type** %t.6542
%.tmp6543 = load %m2652$.Type.type*, %m2652$.Type.type** %t.6542
%.tmp6544 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp6543, i32 0, i32 0
%.tmp6545 = load i8*, i8** %.tmp6544
%.tmp6547 = getelementptr [4 x i8], [4 x i8]*@.str6546, i32 0, i32 0
%.tmp6548 = call i32(i8*,i8*) @strcmp(i8* %.tmp6545, i8* %.tmp6547)
%.tmp6549 = icmp eq i32 %.tmp6548, 0
%.tmp6550 = load %m2652$.Type.type*, %m2652$.Type.type** %t.6542
%.tmp6551 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp6550, i32 0, i32 0
%.tmp6552 = load i8*, i8** %.tmp6551
%.tmp6554 = getelementptr [4 x i8], [4 x i8]*@.str6553, i32 0, i32 0
%.tmp6555 = call i32(i8*,i8*) @strcmp(i8* %.tmp6552, i8* %.tmp6554)
%.tmp6556 = icmp eq i32 %.tmp6555, 0
%.tmp6557 = or i1 %.tmp6549, %.tmp6556
%.tmp6558 = load %m2652$.Type.type*, %m2652$.Type.type** %t.6542
%.tmp6559 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp6558, i32 0, i32 0
%.tmp6560 = load i8*, i8** %.tmp6559
%.tmp6562 = getelementptr [5 x i8], [5 x i8]*@.str6561, i32 0, i32 0
%.tmp6563 = call i32(i8*,i8*) @strcmp(i8* %.tmp6560, i8* %.tmp6562)
%.tmp6564 = icmp eq i32 %.tmp6563, 0
%.tmp6565 = or i1 %.tmp6557, %.tmp6564
br i1 %.tmp6565, label %.if.true.6566, label %.if.false.6566
.if.true.6566:
%.tmp6567 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6568 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6567, i32 0, i32 1
%.tmp6569 = load %m0$.File.type*, %m0$.File.type** %.tmp6568
%.tmp6571 = getelementptr [21 x i8], [21 x i8]*@.str6570, i32 0, i32 0
%.tmp6572 = load i8*, i8** %t_repr.6532
%.tmp6573 = load i8*, i8** %t_repr.6532
%.tmp6574 = load i8*, i8** %id.6535
%.tmp6575 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6569, i8* %.tmp6571, i8* %.tmp6572, i32 0, i8* %.tmp6573, i8* %.tmp6574)
br label %.if.end.6566
.if.false.6566:
%.tmp6576 = load %m2652$.Type.type*, %m2652$.Type.type** %t.6542
%.tmp6577 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp6576, i32 0, i32 0
%.tmp6578 = load i8*, i8** %.tmp6577
%.tmp6580 = getelementptr [4 x i8], [4 x i8]*@.str6579, i32 0, i32 0
%.tmp6581 = call i32(i8*,i8*) @strcmp(i8* %.tmp6578, i8* %.tmp6580)
%.tmp6582 = icmp eq i32 %.tmp6581, 0
br i1 %.tmp6582, label %.if.true.6583, label %.if.false.6583
.if.true.6583:
%.tmp6584 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6585 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6584, i32 0, i32 1
%.tmp6586 = load %m0$.File.type*, %m0$.File.type** %.tmp6585
%.tmp6588 = getelementptr [21 x i8], [21 x i8]*@.str6587, i32 0, i32 0
%.tmp6589 = load i8*, i8** %t_repr.6532
%.tmp6591 = getelementptr [5 x i8], [5 x i8]*@.str6590, i32 0, i32 0
%.tmp6592 = load i8*, i8** %t_repr.6532
%.tmp6593 = load i8*, i8** %id.6535
%.tmp6594 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6586, i8* %.tmp6588, i8* %.tmp6589, i8* %.tmp6591, i8* %.tmp6592, i8* %.tmp6593)
br label %.if.end.6583
.if.false.6583:
%.tmp6595 = load %m2652$.Type.type*, %m2652$.Type.type** %t.6542
%.tmp6596 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp6595, i32 0, i32 0
%.tmp6597 = load i8*, i8** %.tmp6596
%.tmp6599 = getelementptr [7 x i8], [7 x i8]*@.str6598, i32 0, i32 0
%.tmp6600 = call i32(i8*,i8*) @strcmp(i8* %.tmp6597, i8* %.tmp6599)
%.tmp6601 = icmp eq i32 %.tmp6600, 0
br i1 %.tmp6601, label %.if.true.6602, label %.if.false.6602
.if.true.6602:
%.tmp6604 = load %m2652$.Type.type*, %m2652$.Type.type** %t.6542
%.tmp6605 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp6604, i32 0, i32 3
%.tmp6606 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6605
store %m2652$.Type.type* %.tmp6606, %m2652$.Type.type** %field.6537
br label %.for.start.6603
.for.start.6603:
%.tmp6607 = load %m2652$.Type.type*, %m2652$.Type.type** %field.6537
%.tmp6608 = icmp ne %m2652$.Type.type* %.tmp6607, null
br i1 %.tmp6608, label %.for.continue.6603, label %.for.end.6603
.for.continue.6603:
%.tmp6609 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6610 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp6609)
store %m2652$.AssignableInfo.type* %.tmp6610, %m2652$.AssignableInfo.type** %field_info.6538
%.tmp6611 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6612 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %field_info.6538
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp6611, %m2652$.AssignableInfo.type* %.tmp6612)
%.tmp6613 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %field_info.6538
%.tmp6614 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6613, i32 0, i32 4
%.tmp6615 = load %m2652$.Type.type*, %m2652$.Type.type** %field.6537
store %m2652$.Type.type* %.tmp6615, %m2652$.Type.type** %.tmp6614
%.tmp6616 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6617 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6616, i32 0, i32 1
%.tmp6618 = load %m0$.File.type*, %m0$.File.type** %.tmp6617
%.tmp6620 = getelementptr [46 x i8], [46 x i8]*@.str6619, i32 0, i32 0
%.tmp6621 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %field_info.6538
%.tmp6622 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp6621)
%.tmp6623 = load i8*, i8** %t_repr.6532
%.tmp6624 = load i8*, i8** %t_repr.6532
%.tmp6625 = load i8*, i8** %id.6535
%.tmp6626 = load i32, i32* %field_id.6536
%.tmp6627 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6618, i8* %.tmp6620, i8* %.tmp6622, i8* %.tmp6623, i8* %.tmp6624, i8* %.tmp6625, i32 %.tmp6626)
%.tmp6628 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6629 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6630 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %field_info.6538
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,%m2652$.AssignableInfo.type*) @m295$compile_zero_value.v.m2652$.CompilerCtx.typep.m980$.Node.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp6628, %m980$.Node.type* %.tmp6629, %m2652$.AssignableInfo.type* %.tmp6630)
%.tmp6631 = load i32, i32* %field_id.6536
%.tmp6632 = add i32 %.tmp6631, 1
store i32 %.tmp6632, i32* %field_id.6536
%.tmp6633 = load %m2652$.Type.type*, %m2652$.Type.type** %field.6537
%.tmp6634 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp6633, i32 0, i32 4
%.tmp6635 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6634
store %m2652$.Type.type* %.tmp6635, %m2652$.Type.type** %field.6537
br label %.for.start.6603
.for.end.6603:
br label %.if.end.6602
.if.false.6602:
%.tmp6636 = load %m2652$.Type.type*, %m2652$.Type.type** %t.6542
%.tmp6637 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp6636, i32 0, i32 0
%.tmp6638 = load i8*, i8** %.tmp6637
%.tmp6640 = getelementptr [10 x i8], [10 x i8]*@.str6639, i32 0, i32 0
%.tmp6641 = call i32(i8*,i8*) @strcmp(i8* %.tmp6638, i8* %.tmp6640)
%.tmp6642 = icmp eq i32 %.tmp6641, 0
br i1 %.tmp6642, label %.if.true.6643, label %.if.false.6643
.if.true.6643:
%.tmp6645 = load %m2652$.Type.type*, %m2652$.Type.type** %t.6542
%.tmp6646 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp6645, i32 0, i32 3
%.tmp6647 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6646
%.tmp6648 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp6647, i32 0, i32 3
%.tmp6649 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6648
store %m2652$.Type.type* %.tmp6649, %m2652$.Type.type** %field.6537
br label %.for.start.6644
.for.start.6644:
%.tmp6650 = load %m2652$.Type.type*, %m2652$.Type.type** %field.6537
%.tmp6651 = icmp ne %m2652$.Type.type* %.tmp6650, null
br i1 %.tmp6651, label %.for.continue.6644, label %.for.end.6644
.for.continue.6644:
%.tmp6652 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6653 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp6652)
store %m2652$.AssignableInfo.type* %.tmp6653, %m2652$.AssignableInfo.type** %field_info.6538
%.tmp6654 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6655 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %field_info.6538
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp6654, %m2652$.AssignableInfo.type* %.tmp6655)
%.tmp6656 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %field_info.6538
%.tmp6657 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6656, i32 0, i32 4
%.tmp6658 = load %m2652$.Type.type*, %m2652$.Type.type** %field.6537
store %m2652$.Type.type* %.tmp6658, %m2652$.Type.type** %.tmp6657
%.tmp6659 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6660 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6659, i32 0, i32 1
%.tmp6661 = load %m0$.File.type*, %m0$.File.type** %.tmp6660
%.tmp6663 = getelementptr [46 x i8], [46 x i8]*@.str6662, i32 0, i32 0
%.tmp6664 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %field_info.6538
%.tmp6665 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp6664)
%.tmp6666 = load i8*, i8** %t_repr.6532
%.tmp6667 = load i8*, i8** %t_repr.6532
%.tmp6668 = load i8*, i8** %id.6535
%.tmp6669 = load i32, i32* %field_id.6536
%.tmp6670 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6661, i8* %.tmp6663, i8* %.tmp6665, i8* %.tmp6666, i8* %.tmp6667, i8* %.tmp6668, i32 %.tmp6669)
%.tmp6671 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6672 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6673 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %field_info.6538
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,%m2652$.AssignableInfo.type*) @m295$compile_zero_value.v.m2652$.CompilerCtx.typep.m980$.Node.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp6671, %m980$.Node.type* %.tmp6672, %m2652$.AssignableInfo.type* %.tmp6673)
%.tmp6674 = load i32, i32* %field_id.6536
%.tmp6675 = add i32 %.tmp6674, 1
store i32 %.tmp6675, i32* %field_id.6536
%.tmp6676 = load %m2652$.Type.type*, %m2652$.Type.type** %field.6537
%.tmp6677 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp6676, i32 0, i32 4
%.tmp6678 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6677
store %m2652$.Type.type* %.tmp6678, %m2652$.Type.type** %field.6537
br label %.for.start.6644
.for.end.6644:
br label %.if.end.6643
.if.false.6643:
%.tmp6679 = load %m2652$.Type.type*, %m2652$.Type.type** %t.6542
%.tmp6680 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp6679, i32 0, i32 0
%.tmp6681 = load i8*, i8** %.tmp6680
%.tmp6683 = getelementptr [6 x i8], [6 x i8]*@.str6682, i32 0, i32 0
%.tmp6684 = call i32(i8*,i8*) @strcmp(i8* %.tmp6681, i8* %.tmp6683)
%.tmp6685 = icmp eq i32 %.tmp6684, 0
br i1 %.tmp6685, label %.if.true.6686, label %.if.false.6686
.if.true.6686:
ret void
br label %.if.end.6686
.if.false.6686:
%.tmp6687 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6688 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6690 = getelementptr [44 x i8], [44 x i8]*@.str6689, i32 0, i32 0
%.tmp6691 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp6687, %m980$.Node.type* %.tmp6688, i8* %.tmp6690)
%.tmp6692 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp6693 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6692, i32 0, i32 4
%.tmp6694 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6693
%.tmp6695 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp6694, i32 0, i32 0
%.tmp6696 = load i8*, i8** %.tmp6695
%.tmp6697 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6698 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp6699 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6698, i32 0, i32 4
%.tmp6700 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6699
%.tmp6701 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp6697, %m2652$.Type.type* %.tmp6700)
%.tmp6702 = call i32(i8*,...) @printf(i8* %.tmp6691, i8* %.tmp6696, i8* %.tmp6701)
ret void
br label %.if.end.6686
.if.end.6686:
br label %.if.end.6643
.if.end.6643:
br label %.if.end.6602
.if.end.6602:
br label %.if.end.6583
.if.end.6583:
br label %.if.end.6566
.if.end.6566:
ret void
}
define void @m295$compile_if_block.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp6703 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6704 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6703, i32 0, i32 6
%.tmp6705 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6704
%.tmp6707 = getelementptr [11 x i8], [11 x i8]*@.str6706, i32 0, i32 0
%.tmp6708 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6705, i8* %.tmp6707)
%assignable.6709 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6708, %m980$.Node.type** %assignable.6709
%.tmp6710 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6711 = load %m980$.Node.type*, %m980$.Node.type** %assignable.6709
%.tmp6712 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6710, %m980$.Node.type* %.tmp6711)
%a_info.6713 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp6712, %m2652$.AssignableInfo.type** %a_info.6713
%.tmp6714 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.6713
%.tmp6715 = icmp eq %m2652$.AssignableInfo.type* %.tmp6714, null
br i1 %.tmp6715, label %.if.true.6716, label %.if.false.6716
.if.true.6716:
ret void
br label %.if.end.6716
.if.false.6716:
br label %.if.end.6716
.if.end.6716:
%.tmp6717 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6718 = call i32(%m2652$.CompilerCtx.type*) @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp6717)
%if_id.6719 = alloca i32
store i32 %.tmp6718, i32* %if_id.6719
%.tmp6720 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6721 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6720, i32 0, i32 1
%.tmp6722 = load %m0$.File.type*, %m0$.File.type** %.tmp6721
%.tmp6724 = getelementptr [53 x i8], [53 x i8]*@.str6723, i32 0, i32 0
%.tmp6725 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6726 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.6713
%.tmp6727 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6726, i32 0, i32 4
%.tmp6728 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp6727
%.tmp6729 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp6725, %m2652$.Type.type* %.tmp6728)
%.tmp6730 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %a_info.6713
%.tmp6731 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp6730)
%.tmp6732 = load i32, i32* %if_id.6719
%.tmp6733 = load i32, i32* %if_id.6719
%.tmp6734 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6722, i8* %.tmp6724, i8* %.tmp6729, i8* %.tmp6731, i32 %.tmp6732, i32 %.tmp6733)
%.tmp6735 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6736 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6735, i32 0, i32 1
%.tmp6737 = load %m0$.File.type*, %m0$.File.type** %.tmp6736
%.tmp6739 = getelementptr [14 x i8], [14 x i8]*@.str6738, i32 0, i32 0
%.tmp6740 = load i32, i32* %if_id.6719
%.tmp6741 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6737, i8* %.tmp6739, i32 %.tmp6740)
%.tmp6742 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6743 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6742, i32 0, i32 6
%.tmp6744 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6743
%.tmp6746 = getelementptr [6 x i8], [6 x i8]*@.str6745, i32 0, i32 0
%.tmp6747 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6744, i8* %.tmp6746)
%block.6748 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6747, %m980$.Node.type** %block.6748
%.tmp6749 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6750 = load %m980$.Node.type*, %m980$.Node.type** %block.6748
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6749, %m980$.Node.type* %.tmp6750)
%.tmp6751 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6752 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6751, i32 0, i32 1
%.tmp6753 = load %m0$.File.type*, %m0$.File.type** %.tmp6752
%.tmp6755 = getelementptr [23 x i8], [23 x i8]*@.str6754, i32 0, i32 0
%.tmp6756 = load i32, i32* %if_id.6719
%.tmp6757 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6753, i8* %.tmp6755, i32 %.tmp6756)
%.tmp6758 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6759 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6758, i32 0, i32 1
%.tmp6760 = load %m0$.File.type*, %m0$.File.type** %.tmp6759
%.tmp6762 = getelementptr [15 x i8], [15 x i8]*@.str6761, i32 0, i32 0
%.tmp6763 = load i32, i32* %if_id.6719
%.tmp6764 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6760, i8* %.tmp6762, i32 %.tmp6763)
%.tmp6765 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6766 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6765, i32 0, i32 6
%.tmp6767 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6766
%.tmp6769 = getelementptr [11 x i8], [11 x i8]*@.str6768, i32 0, i32 0
%.tmp6770 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6767, i8* %.tmp6769)
%else_block.6771 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6770, %m980$.Node.type** %else_block.6771
%.tmp6772 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6771
%.tmp6773 = icmp ne %m980$.Node.type* %.tmp6772, null
br i1 %.tmp6773, label %.if.true.6774, label %.if.false.6774
.if.true.6774:
%.tmp6775 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6771
%.tmp6776 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6775, i32 0, i32 6
%.tmp6777 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6776
%.tmp6778 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6777, i32 0, i32 0
%.tmp6779 = load i8*, i8** %.tmp6778
%.tmp6781 = getelementptr [11 x i8], [11 x i8]*@.str6780, i32 0, i32 0
%.tmp6782 = call i32(i8*,i8*) @strcmp(i8* %.tmp6779, i8* %.tmp6781)
%.tmp6783 = icmp eq i32 %.tmp6782, 0
br i1 %.tmp6783, label %.if.true.6784, label %.if.false.6784
.if.true.6784:
%.tmp6785 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6771
%.tmp6786 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6785, i32 0, i32 6
%.tmp6787 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6786
%.tmp6788 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6787, i32 0, i32 6
%.tmp6789 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6788
%.tmp6791 = getelementptr [6 x i8], [6 x i8]*@.str6790, i32 0, i32 0
%.tmp6792 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6789, i8* %.tmp6791)
store %m980$.Node.type* %.tmp6792, %m980$.Node.type** %block.6748
%.tmp6793 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6794 = load %m980$.Node.type*, %m980$.Node.type** %block.6748
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6793, %m980$.Node.type* %.tmp6794)
br label %.if.end.6784
.if.false.6784:
%.tmp6795 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6796 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6771
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_if_block.v.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6795, %m980$.Node.type* %.tmp6796)
br label %.if.end.6784
.if.end.6784:
br label %.if.end.6774
.if.false.6774:
br label %.if.end.6774
.if.end.6774:
%.tmp6797 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6798 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6797, i32 0, i32 1
%.tmp6799 = load %m0$.File.type*, %m0$.File.type** %.tmp6798
%.tmp6801 = getelementptr [23 x i8], [23 x i8]*@.str6800, i32 0, i32 0
%.tmp6802 = load i32, i32* %if_id.6719
%.tmp6803 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6799, i8* %.tmp6801, i32 %.tmp6802)
%.tmp6804 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6805 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6804, i32 0, i32 1
%.tmp6806 = load %m0$.File.type*, %m0$.File.type** %.tmp6805
%.tmp6808 = getelementptr [13 x i8], [13 x i8]*@.str6807, i32 0, i32 0
%.tmp6809 = load i32, i32* %if_id.6719
%.tmp6810 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6806, i8* %.tmp6808, i32 %.tmp6809)
ret void
}
define void @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%curr_node = alloca %m980$.Node.type*
store %m980$.Node.type* %.curr_node.arg, %m980$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp6811 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp6812 = icmp ne %m980$.Node.type* %.tmp6811, null
br i1 %.tmp6812, label %.if.true.6813, label %.if.false.6813
.if.true.6813:
%.tmp6814 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6815 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp6814, i32 0, i32 7
%.tmp6816 = load i8*, i8** %.tmp6815
%.tmp6817 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp6818 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6817, i32 0, i32 3
%.tmp6819 = load i32, i32* %.tmp6818
%.tmp6820 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp6821 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6820, i32 0, i32 4
%.tmp6822 = load i32, i32* %.tmp6821
%.tmp6823 = load i8*, i8** %msg
%.tmp6824 = call %m296$.Error.type*(i8*,i32,i32,i8*) @m296$new.m296$.Error.typep.cp.i.i.cp(i8* %.tmp6816, i32 %.tmp6819, i32 %.tmp6822, i8* %.tmp6823)
%err.6825 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp6824, %m296$.Error.type** %err.6825
%.tmp6826 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6827 = load %m296$.Error.type*, %m296$.Error.type** %err.6825
call void(%m2652$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2652$.CompilerCtx.typep.m296$.Error.typep(%m2652$.CompilerCtx.type* %.tmp6826, %m296$.Error.type* %.tmp6827)
br label %.if.end.6813
.if.false.6813:
%.tmp6829 = getelementptr [61 x i8], [61 x i8]*@.str6828, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp6829)
br label %.if.end.6813
.if.end.6813:
ret void
}
define void @m295$define_assignable.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i8* %.name.arg, %m2652$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.info.arg, %m2652$.AssignableInfo.type** %info
%.tmp6830 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6831 = call %m2652$.ModuleLookup.type*(%m2652$.CompilerCtx.type*) @m295$get_current_module.m2652$.ModuleLookup.typep.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp6830)
%mod.6832 = alloca %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* %.tmp6831, %m2652$.ModuleLookup.type** %mod.6832
%.tmp6833 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.6832
%.tmp6834 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp6833, i32 0, i32 3
%.tmp6835 = load %m2652$.Scope.type*, %m2652$.Scope.type** %.tmp6834
%.tmp6836 = icmp ne %m2652$.Scope.type* %.tmp6835, null
%.tmp6838 = getelementptr [82 x i8], [82 x i8]*@.str6837, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6836, i8* %.tmp6838)
%.tmp6839 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.6832
%.tmp6840 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp6839, i32 0, i32 3
%.tmp6841 = load %m2652$.Scope.type*, %m2652$.Scope.type** %.tmp6840
%current_scope.6842 = alloca %m2652$.Scope.type*
store %m2652$.Scope.type* %.tmp6841, %m2652$.Scope.type** %current_scope.6842
%.tmp6843 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* null, i32 1
%.tmp6844 = ptrtoint %m2652$.ScopeItem.type* %.tmp6843 to i32
%.tmp6845 = call i8*(i32) @malloc(i32 %.tmp6844)
%.tmp6846 = bitcast i8* %.tmp6845 to %m2652$.ScopeItem.type*
%newitem.6847 = alloca %m2652$.ScopeItem.type*
store %m2652$.ScopeItem.type* %.tmp6846, %m2652$.ScopeItem.type** %newitem.6847
%.tmp6848 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %newitem.6847
%.tmp6849 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp6848, i32 0, i32 0
%.tmp6850 = load i8*, i8** %name
store i8* %.tmp6850, i8** %.tmp6849
%.tmp6851 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %newitem.6847
%.tmp6852 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp6851, i32 0, i32 1
%.tmp6853 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
store %m2652$.AssignableInfo.type* %.tmp6853, %m2652$.AssignableInfo.type** %.tmp6852
%.tmp6854 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %newitem.6847
%.tmp6855 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp6854, i32 0, i32 2
store %m2652$.ScopeItem.type* null, %m2652$.ScopeItem.type** %.tmp6855
%.tmp6856 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp6857 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6856, i32 0, i32 2
%.tmp6858 = load i8*, i8** %name
store i8* %.tmp6858, i8** %.tmp6857
%.tmp6859 = load %m2652$.Scope.type*, %m2652$.Scope.type** %current_scope.6842
%.tmp6860 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp6859, i32 0, i32 1
%.tmp6861 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %.tmp6860
%.tmp6862 = icmp eq %m2652$.ScopeItem.type* %.tmp6861, null
br i1 %.tmp6862, label %.if.true.6863, label %.if.false.6863
.if.true.6863:
%.tmp6864 = load %m2652$.Scope.type*, %m2652$.Scope.type** %current_scope.6842
%.tmp6865 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp6864, i32 0, i32 1
%.tmp6866 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %newitem.6847
store %m2652$.ScopeItem.type* %.tmp6866, %m2652$.ScopeItem.type** %.tmp6865
ret void
br label %.if.end.6863
.if.false.6863:
br label %.if.end.6863
.if.end.6863:
%.tmp6867 = load %m2652$.Scope.type*, %m2652$.Scope.type** %current_scope.6842
%.tmp6868 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp6867, i32 0, i32 1
%.tmp6869 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %.tmp6868
%last_item.6870 = alloca %m2652$.ScopeItem.type*
store %m2652$.ScopeItem.type* %.tmp6869, %m2652$.ScopeItem.type** %last_item.6870
%.tmp6872 = getelementptr [1 x i8], [1 x i8]*@.str6871, i32 0, i32 0
%err_buf.6873 = alloca i8*
store i8* %.tmp6872, i8** %err_buf.6873
%.tmp6874 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %last_item.6870
%.tmp6875 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp6874, i32 0, i32 0
%.tmp6876 = load i8*, i8** %.tmp6875
%.tmp6877 = load i8*, i8** %name
%.tmp6878 = call i32(i8*,i8*) @strcmp(i8* %.tmp6876, i8* %.tmp6877)
%.tmp6879 = icmp eq i32 %.tmp6878, 0
br i1 %.tmp6879, label %.if.true.6880, label %.if.false.6880
.if.true.6880:
%.tmp6881 = getelementptr i8*, i8** %err_buf.6873, i32 0
%.tmp6883 = getelementptr [43 x i8], [43 x i8]*@.str6882, i32 0, i32 0
%.tmp6884 = load i8*, i8** %name
%.tmp6885 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6881, i8* %.tmp6883, i8* %.tmp6884)
%.tmp6886 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6887 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6888 = load i8*, i8** %err_buf.6873
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp6886, %m980$.Node.type* %.tmp6887, i8* %.tmp6888)
br label %.if.end.6880
.if.false.6880:
br label %.if.end.6880
.if.end.6880:
br label %.for.start.6889
.for.start.6889:
%.tmp6890 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %last_item.6870
%.tmp6891 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp6890, i32 0, i32 2
%.tmp6892 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %.tmp6891
%.tmp6893 = icmp ne %m2652$.ScopeItem.type* %.tmp6892, null
br i1 %.tmp6893, label %.for.continue.6889, label %.for.else.6889
.for.continue.6889:
%.tmp6894 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %last_item.6870
%.tmp6895 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp6894, i32 0, i32 0
%.tmp6896 = load i8*, i8** %.tmp6895
%.tmp6897 = load i8*, i8** %name
%.tmp6898 = call i32(i8*,i8*) @strcmp(i8* %.tmp6896, i8* %.tmp6897)
%.tmp6899 = icmp eq i32 %.tmp6898, 0
br i1 %.tmp6899, label %.if.true.6900, label %.if.false.6900
.if.true.6900:
%.tmp6901 = getelementptr i8*, i8** %err_buf.6873, i32 0
%.tmp6903 = getelementptr [43 x i8], [43 x i8]*@.str6902, i32 0, i32 0
%.tmp6904 = load i8*, i8** %name
%.tmp6905 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6901, i8* %.tmp6903, i8* %.tmp6904)
%.tmp6906 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6907 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6908 = load i8*, i8** %err_buf.6873
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp6906, %m980$.Node.type* %.tmp6907, i8* %.tmp6908)
br label %.for.end.6889
br label %.if.end.6900
.if.false.6900:
br label %.if.end.6900
.if.end.6900:
%.tmp6909 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %last_item.6870
%.tmp6910 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp6909, i32 0, i32 2
%.tmp6911 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %.tmp6910
store %m2652$.ScopeItem.type* %.tmp6911, %m2652$.ScopeItem.type** %last_item.6870
br label %.for.start.6889
.for.else.6889:
%.tmp6912 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %last_item.6870
%.tmp6913 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp6912, i32 0, i32 2
%.tmp6914 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %newitem.6847
store %m2652$.ScopeItem.type* %.tmp6914, %m2652$.ScopeItem.type** %.tmp6913
br label %.for.end.6889
.for.end.6889:
ret void
}
define %m2652$.ScopeItem.type* @m295$find_defined_in.m2652$.ScopeItem.typep.m2652$.CompilerCtx.typep.cp.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m980$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m980$.Node.type*
store %m980$.Node.type* %.dotted_name.arg, %m980$.Node.type** %dotted_name
%err_buf.6915 = alloca i8*
store i8* null, i8** %err_buf.6915
%.tmp6916 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6917 = load i8*, i8** %module
%.tmp6918 = load %m980$.Node.type*, %m980$.Node.type** %dotted_name
%.tmp6919 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6918, i32 0, i32 1
%.tmp6920 = load i8*, i8** %.tmp6919
%.tmp6921 = call %m2652$.ScopeItem.type*(%m2652$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2652$.ScopeItem.typep.m2652$.CompilerCtx.typep.cp.cp(%m2652$.CompilerCtx.type* %.tmp6916, i8* %.tmp6917, i8* %.tmp6920)
%found.6922 = alloca %m2652$.ScopeItem.type*
store %m2652$.ScopeItem.type* %.tmp6921, %m2652$.ScopeItem.type** %found.6922
%.tmp6923 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %found.6922
%.tmp6924 = icmp eq %m2652$.ScopeItem.type* %.tmp6923, null
br i1 %.tmp6924, label %.if.true.6925, label %.if.false.6925
.if.true.6925:
%.tmp6926 = bitcast ptr null to %m2652$.ScopeItem.type*
ret %m2652$.ScopeItem.type* %.tmp6926
br label %.if.end.6925
.if.false.6925:
br label %.if.end.6925
.if.end.6925:
br label %.for.start.6927
.for.start.6927:
%.tmp6928 = load %m980$.Node.type*, %m980$.Node.type** %dotted_name
%.tmp6929 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6928, i32 0, i32 7
%.tmp6930 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6929
%.tmp6931 = icmp ne %m980$.Node.type* %.tmp6930, null
%.tmp6932 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %found.6922
%.tmp6933 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp6932, i32 0, i32 1
%.tmp6934 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %.tmp6933
%.tmp6935 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6934, i32 0, i32 3
%.tmp6936 = load i8*, i8** %.tmp6935
%.tmp6938 = getelementptr [7 x i8], [7 x i8]*@.str6937, i32 0, i32 0
%.tmp6939 = call i32(i8*,i8*) @strcmp(i8* %.tmp6936, i8* %.tmp6938)
%.tmp6940 = icmp eq i32 %.tmp6939, 0
%.tmp6941 = and i1 %.tmp6931, %.tmp6940
br i1 %.tmp6941, label %.for.continue.6927, label %.for.end.6927
.for.continue.6927:
%.tmp6942 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6943 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %found.6922
%.tmp6944 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp6943, i32 0, i32 1
%.tmp6945 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %.tmp6944
%.tmp6946 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp6945, i32 0, i32 0
%.tmp6947 = load i8*, i8** %.tmp6946
%.tmp6948 = load %m980$.Node.type*, %m980$.Node.type** %dotted_name
%.tmp6949 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6948, i32 0, i32 7
%.tmp6950 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6949
%.tmp6951 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6950, i32 0, i32 7
%.tmp6952 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6951
%.tmp6953 = call %m2652$.ScopeItem.type*(%m2652$.CompilerCtx.type*,i8*,%m980$.Node.type*) @m295$find_defined_in.m2652$.ScopeItem.typep.m2652$.CompilerCtx.typep.cp.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp6942, i8* %.tmp6947, %m980$.Node.type* %.tmp6952)
store %m2652$.ScopeItem.type* %.tmp6953, %m2652$.ScopeItem.type** %found.6922
%.tmp6954 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %found.6922
%.tmp6955 = icmp eq %m2652$.ScopeItem.type* %.tmp6954, null
br i1 %.tmp6955, label %.if.true.6956, label %.if.false.6956
.if.true.6956:
%.tmp6957 = bitcast ptr null to %m2652$.ScopeItem.type*
ret %m2652$.ScopeItem.type* %.tmp6957
br label %.if.end.6956
.if.false.6956:
br label %.if.end.6956
.if.end.6956:
br label %.for.start.6927
.for.end.6927:
%.tmp6958 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %found.6922
ret %m2652$.ScopeItem.type* %.tmp6958
}
define %m2652$.ScopeItem.type* @m295$find_defined_here.m2652$.ScopeItem.typep.m2652$.CompilerCtx.typep.m2652$.Scope.typep.cp(%m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%s = alloca %m2652$.Scope.type*
store %m2652$.Scope.type* %.s.arg, %m2652$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp6959 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s
%.tmp6960 = icmp eq %m2652$.Scope.type* %.tmp6959, null
br i1 %.tmp6960, label %.if.true.6961, label %.if.false.6961
.if.true.6961:
%.tmp6962 = bitcast ptr null to %m2652$.ScopeItem.type*
ret %m2652$.ScopeItem.type* %.tmp6962
br label %.if.end.6961
.if.false.6961:
br label %.if.end.6961
.if.end.6961:
%.tmp6964 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s
%.tmp6965 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp6964, i32 0, i32 1
%.tmp6966 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %.tmp6965
%item.6967 = alloca %m2652$.ScopeItem.type*
store %m2652$.ScopeItem.type* %.tmp6966, %m2652$.ScopeItem.type** %item.6967
br label %.for.start.6963
.for.start.6963:
%.tmp6968 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %item.6967
%.tmp6969 = icmp ne %m2652$.ScopeItem.type* %.tmp6968, null
br i1 %.tmp6969, label %.for.continue.6963, label %.for.end.6963
.for.continue.6963:
%.tmp6970 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %item.6967
%.tmp6971 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp6970, i32 0, i32 0
%.tmp6972 = load i8*, i8** %.tmp6971
%.tmp6973 = load i8*, i8** %name
%.tmp6974 = call i32(i8*,i8*) @strcmp(i8* %.tmp6972, i8* %.tmp6973)
%.tmp6975 = icmp eq i32 %.tmp6974, 0
br i1 %.tmp6975, label %.if.true.6976, label %.if.false.6976
.if.true.6976:
%.tmp6977 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %item.6967
ret %m2652$.ScopeItem.type* %.tmp6977
br label %.if.end.6976
.if.false.6976:
br label %.if.end.6976
.if.end.6976:
%.tmp6978 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %item.6967
%.tmp6979 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp6978, i32 0, i32 2
%.tmp6980 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %.tmp6979
store %m2652$.ScopeItem.type* %.tmp6980, %m2652$.ScopeItem.type** %item.6967
br label %.for.start.6963
.for.end.6963:
%.tmp6981 = bitcast ptr null to %m2652$.ScopeItem.type*
ret %m2652$.ScopeItem.type* %.tmp6981
}
define %m2652$.ScopeItem.type* @m295$find_defined_str.m2652$.ScopeItem.typep.m2652$.CompilerCtx.typep.cp.cp(%m2652$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp6982 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp6983 = load i8*, i8** %module
%.tmp6984 = call %m2652$.ModuleLookup.type*(%m2652$.CompilerCtx.type*,i8*) @m295$get_module.m2652$.ModuleLookup.typep.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.tmp6982, i8* %.tmp6983)
%mod.6985 = alloca %m2652$.ModuleLookup.type*
store %m2652$.ModuleLookup.type* %.tmp6984, %m2652$.ModuleLookup.type** %mod.6985
%.tmp6986 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.6985
%.tmp6987 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp6986, i32 0, i32 3
%.tmp6988 = load %m2652$.Scope.type*, %m2652$.Scope.type** %.tmp6987
%.tmp6989 = icmp ne %m2652$.Scope.type* %.tmp6988, null
%.tmp6991 = getelementptr [77 x i8], [77 x i8]*@.str6990, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6989, i8* %.tmp6991)
%.tmp6993 = load %m2652$.ModuleLookup.type*, %m2652$.ModuleLookup.type** %mod.6985
%.tmp6994 = getelementptr %m2652$.ModuleLookup.type, %m2652$.ModuleLookup.type* %.tmp6993, i32 0, i32 3
%.tmp6995 = load %m2652$.Scope.type*, %m2652$.Scope.type** %.tmp6994
%s.6996 = alloca %m2652$.Scope.type*
store %m2652$.Scope.type* %.tmp6995, %m2652$.Scope.type** %s.6996
br label %.for.start.6992
.for.start.6992:
%.tmp6997 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.6996
%.tmp6998 = icmp ne %m2652$.Scope.type* %.tmp6997, null
br i1 %.tmp6998, label %.for.continue.6992, label %.for.end.6992
.for.continue.6992:
%.tmp6999 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7000 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.6996
%.tmp7001 = load i8*, i8** %assignable_name
%.tmp7002 = call %m2652$.ScopeItem.type*(%m2652$.CompilerCtx.type*,%m2652$.Scope.type*,i8*) @m295$find_defined_here.m2652$.ScopeItem.typep.m2652$.CompilerCtx.typep.m2652$.Scope.typep.cp(%m2652$.CompilerCtx.type* %.tmp6999, %m2652$.Scope.type* %.tmp7000, i8* %.tmp7001)
%item.7003 = alloca %m2652$.ScopeItem.type*
store %m2652$.ScopeItem.type* %.tmp7002, %m2652$.ScopeItem.type** %item.7003
%.tmp7004 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %item.7003
%.tmp7005 = icmp ne %m2652$.ScopeItem.type* %.tmp7004, null
br i1 %.tmp7005, label %.if.true.7006, label %.if.false.7006
.if.true.7006:
%.tmp7007 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %item.7003
ret %m2652$.ScopeItem.type* %.tmp7007
br label %.if.end.7006
.if.false.7006:
br label %.if.end.7006
.if.end.7006:
%.tmp7008 = load %m2652$.Scope.type*, %m2652$.Scope.type** %s.6996
%.tmp7009 = getelementptr %m2652$.Scope.type, %m2652$.Scope.type* %.tmp7008, i32 0, i32 5
%.tmp7010 = load %m2652$.Scope.type*, %m2652$.Scope.type** %.tmp7009
store %m2652$.Scope.type* %.tmp7010, %m2652$.Scope.type** %s.6996
br label %.for.start.6992
.for.end.6992:
%.tmp7011 = bitcast ptr null to %m2652$.ScopeItem.type*
ret %m2652$.ScopeItem.type* %.tmp7011
}
define %m2652$.ScopeItem.type* @m295$find_defined.m2652$.ScopeItem.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%dotted_name = alloca %m980$.Node.type*
store %m980$.Node.type* %.dotted_name.arg, %m980$.Node.type** %dotted_name
%.tmp7012 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7013 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7014 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp7013, i32 0, i32 7
%.tmp7015 = load i8*, i8** %.tmp7014
%.tmp7016 = load %m980$.Node.type*, %m980$.Node.type** %dotted_name
%.tmp7017 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7016, i32 0, i32 6
%.tmp7018 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7017
%.tmp7019 = call %m2652$.ScopeItem.type*(%m2652$.CompilerCtx.type*,i8*,%m980$.Node.type*) @m295$find_defined_in.m2652$.ScopeItem.typep.m2652$.CompilerCtx.typep.cp.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp7012, i8* %.tmp7015, %m980$.Node.type* %.tmp7018)
ret %m2652$.ScopeItem.type* %.tmp7019
}
define %m2652$.AssignableInfo.type* @m295$get_dotted_name.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.dot_name_ptr.arg, %m2652$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m980$.Node.type*
store %m980$.Node.type* %.dot_name_ptr.arg, %m980$.Node.type** %dot_name_ptr
%info = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.info.arg, %m2652$.AssignableInfo.type** %info
%err_msg.7020 = alloca i8*
store i8* null, i8** %err_msg.7020
%buf.7021 = alloca i8*
store i8* null, i8** %buf.7021
%.tmp7022 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp7023 = icmp eq %m2652$.AssignableInfo.type* %.tmp7022, null
br i1 %.tmp7023, label %.if.true.7024, label %.if.false.7024
.if.true.7024:
%.tmp7025 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7026 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7028 = getelementptr [54 x i8], [54 x i8]*@.str7027, i32 0, i32 0
%.tmp7029 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp7025, %m980$.Node.type* %.tmp7026, i8* %.tmp7028)
%.tmp7030 = call i32(i8*,...) @printf(i8* %.tmp7029)
%.tmp7031 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp7031
br label %.if.end.7024
.if.false.7024:
br label %.if.end.7024
.if.end.7024:
%.tmp7032 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp7033 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7032, i32 0, i32 3
%.tmp7034 = load i8*, i8** %.tmp7033
%.tmp7036 = getelementptr [9 x i8], [9 x i8]*@.str7035, i32 0, i32 0
%.tmp7037 = call i32(i8*,i8*) @strcmp(i8* %.tmp7034, i8* %.tmp7036)
%.tmp7038 = icmp eq i32 %.tmp7037, 0
%.tmp7039 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp7040 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7039, i32 0, i32 3
%.tmp7041 = load i8*, i8** %.tmp7040
%.tmp7043 = getelementptr [7 x i8], [7 x i8]*@.str7042, i32 0, i32 0
%.tmp7044 = call i32(i8*,i8*) @strcmp(i8* %.tmp7041, i8* %.tmp7043)
%.tmp7045 = icmp eq i32 %.tmp7044, 0
%.tmp7046 = or i1 %.tmp7038, %.tmp7045
br i1 %.tmp7046, label %.if.true.7047, label %.if.false.7047
.if.true.7047:
%.tmp7048 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7049 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7048, i32 0, i32 7
%.tmp7050 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7049
%.tmp7051 = icmp ne %m980$.Node.type* %.tmp7050, null
br i1 %.tmp7051, label %.if.true.7052, label %.if.false.7052
.if.true.7052:
%.tmp7053 = getelementptr i8*, i8** %err_msg.7020, i32 0
%.tmp7055 = getelementptr [46 x i8], [46 x i8]*@.str7054, i32 0, i32 0
%.tmp7056 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7057 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7056, i32 0, i32 7
%.tmp7058 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7057
%.tmp7059 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7058, i32 0, i32 7
%.tmp7060 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7059
%.tmp7061 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7060, i32 0, i32 1
%.tmp7062 = load i8*, i8** %.tmp7061
%.tmp7063 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7064 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7063, i32 0, i32 1
%.tmp7065 = load i8*, i8** %.tmp7064
%.tmp7066 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7053, i8* %.tmp7055, i8* %.tmp7062, i8* %.tmp7065)
%.tmp7067 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7068 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7069 = load i8*, i8** %err_msg.7020
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp7067, %m980$.Node.type* %.tmp7068, i8* %.tmp7069)
%.tmp7070 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp7070
br label %.if.end.7052
.if.false.7052:
br label %.if.end.7052
.if.end.7052:
%.tmp7071 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
ret %m2652$.AssignableInfo.type* %.tmp7071
br label %.if.end.7047
.if.false.7047:
%.tmp7072 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp7073 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7072, i32 0, i32 3
%.tmp7074 = load i8*, i8** %.tmp7073
%.tmp7076 = getelementptr [9 x i8], [9 x i8]*@.str7075, i32 0, i32 0
%.tmp7077 = call i32(i8*,i8*) @strcmp(i8* %.tmp7074, i8* %.tmp7076)
%.tmp7078 = icmp eq i32 %.tmp7077, 0
%.tmp7079 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7080 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7079, i32 0, i32 7
%.tmp7081 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7080
%.tmp7082 = icmp ne %m980$.Node.type* %.tmp7081, null
%.tmp7083 = and i1 %.tmp7078, %.tmp7082
br i1 %.tmp7083, label %.if.true.7084, label %.if.false.7084
.if.true.7084:
%.tmp7085 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%base_var.7086 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp7085, %m2652$.AssignableInfo.type** %base_var.7086
%.tmp7087 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base_var.7086
%.tmp7088 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7087, i32 0, i32 4
%.tmp7089 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7088
%struct_info.7090 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp7089, %m2652$.Type.type** %struct_info.7090
br label %.for.start.7091
.for.start.7091:
%.tmp7092 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base_var.7086
%.tmp7093 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7092, i32 0, i32 4
%.tmp7094 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7093
%.tmp7095 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7094, i32 0, i32 0
%.tmp7096 = load i8*, i8** %.tmp7095
%.tmp7098 = getelementptr [4 x i8], [4 x i8]*@.str7097, i32 0, i32 0
%.tmp7099 = call i32(i8*,i8*) @strcmp(i8* %.tmp7096, i8* %.tmp7098)
%.tmp7100 = icmp eq i32 %.tmp7099, 0
br i1 %.tmp7100, label %.for.continue.7091, label %.for.end.7091
.for.continue.7091:
%.tmp7101 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7102 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7101)
%new_base.7103 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp7102, %m2652$.AssignableInfo.type** %new_base.7103
%.tmp7104 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7105 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7103
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp7104, %m2652$.AssignableInfo.type* %.tmp7105)
%.tmp7106 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7103
%.tmp7107 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7106, i32 0, i32 4
%.tmp7108 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base_var.7086
%.tmp7109 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7108, i32 0, i32 4
%.tmp7110 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7109
%.tmp7111 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7110, i32 0, i32 3
%.tmp7112 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7111
store %m2652$.Type.type* %.tmp7112, %m2652$.Type.type** %.tmp7107
%.tmp7113 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7114 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp7113, i32 0, i32 1
%.tmp7115 = load %m0$.File.type*, %m0$.File.type** %.tmp7114
%.tmp7117 = getelementptr [23 x i8], [23 x i8]*@.str7116, i32 0, i32 0
%.tmp7118 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7103
%.tmp7119 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7118)
%.tmp7120 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7121 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7103
%.tmp7122 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7121, i32 0, i32 4
%.tmp7123 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7122
%.tmp7124 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp7120, %m2652$.Type.type* %.tmp7123)
%.tmp7125 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7126 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base_var.7086
%.tmp7127 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7126, i32 0, i32 4
%.tmp7128 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7127
%.tmp7129 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp7125, %m2652$.Type.type* %.tmp7128)
%.tmp7130 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base_var.7086
%.tmp7131 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7130)
%.tmp7132 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7115, i8* %.tmp7117, i8* %.tmp7119, i8* %.tmp7124, i8* %.tmp7129, i8* %.tmp7131)
%.tmp7133 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7103
store %m2652$.AssignableInfo.type* %.tmp7133, %m2652$.AssignableInfo.type** %base_var.7086
%.tmp7134 = load %m2652$.Type.type*, %m2652$.Type.type** %struct_info.7090
%.tmp7135 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7134, i32 0, i32 3
%.tmp7136 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7135
store %m2652$.Type.type* %.tmp7136, %m2652$.Type.type** %struct_info.7090
br label %.for.start.7091
.for.end.7091:
%.tmp7137 = load %m2652$.Type.type*, %m2652$.Type.type** %struct_info.7090
%.tmp7138 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7137, i32 0, i32 0
%.tmp7139 = load i8*, i8** %.tmp7138
%.tmp7141 = getelementptr [10 x i8], [10 x i8]*@.str7140, i32 0, i32 0
%.tmp7142 = call i32(i8*,i8*) @strcmp(i8* %.tmp7139, i8* %.tmp7141)
%.tmp7143 = icmp eq i32 %.tmp7142, 0
br i1 %.tmp7143, label %.if.true.7144, label %.if.false.7144
.if.true.7144:
%.tmp7145 = load %m2652$.Type.type*, %m2652$.Type.type** %struct_info.7090
%.tmp7146 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7145, i32 0, i32 3
%.tmp7147 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7146
store %m2652$.Type.type* %.tmp7147, %m2652$.Type.type** %struct_info.7090
br label %.if.end.7144
.if.false.7144:
br label %.if.end.7144
.if.end.7144:
%.tmp7148 = load %m2652$.Type.type*, %m2652$.Type.type** %struct_info.7090
%.tmp7149 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7148, i32 0, i32 0
%.tmp7150 = load i8*, i8** %.tmp7149
%.tmp7152 = getelementptr [7 x i8], [7 x i8]*@.str7151, i32 0, i32 0
%.tmp7153 = call i32(i8*,i8*) @strcmp(i8* %.tmp7150, i8* %.tmp7152)
%.tmp7154 = icmp ne i32 %.tmp7153, 0
br i1 %.tmp7154, label %.if.true.7155, label %.if.false.7155
.if.true.7155:
%.tmp7156 = getelementptr i8*, i8** %err_msg.7020, i32 0
%.tmp7158 = getelementptr [48 x i8], [48 x i8]*@.str7157, i32 0, i32 0
%.tmp7159 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7160 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7159, i32 0, i32 7
%.tmp7161 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7160
%.tmp7162 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7161, i32 0, i32 7
%.tmp7163 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7162
%.tmp7164 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7163, i32 0, i32 1
%.tmp7165 = load i8*, i8** %.tmp7164
%.tmp7166 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7167 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7166, i32 0, i32 1
%.tmp7168 = load i8*, i8** %.tmp7167
%.tmp7169 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7156, i8* %.tmp7158, i8* %.tmp7165, i8* %.tmp7168)
%.tmp7170 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7171 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7172 = load i8*, i8** %err_msg.7020
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp7170, %m980$.Node.type* %.tmp7171, i8* %.tmp7172)
%.tmp7173 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp7173
br label %.if.end.7155
.if.false.7155:
br label %.if.end.7155
.if.end.7155:
%.tmp7174 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7175 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7174, i32 0, i32 7
%.tmp7176 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7175
%.tmp7177 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7176, i32 0, i32 7
%.tmp7178 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7177
%.tmp7179 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7178, i32 0, i32 1
%.tmp7180 = load i8*, i8** %.tmp7179
%field_name.7181 = alloca i8*
store i8* %.tmp7180, i8** %field_name.7181
%field_id.7182 = alloca i32
store i32 0, i32* %field_id.7182
%.tmp7183 = bitcast ptr null to %m2652$.Type.type*
%found_field.7184 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp7183, %m2652$.Type.type** %found_field.7184
%.tmp7186 = load %m2652$.Type.type*, %m2652$.Type.type** %struct_info.7090
%.tmp7187 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7186, i32 0, i32 3
%.tmp7188 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7187
%field.7189 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp7188, %m2652$.Type.type** %field.7189
br label %.for.start.7185
.for.start.7185:
%.tmp7190 = load %m2652$.Type.type*, %m2652$.Type.type** %field.7189
%.tmp7191 = icmp ne %m2652$.Type.type* %.tmp7190, null
br i1 %.tmp7191, label %.for.continue.7185, label %.for.end.7185
.for.continue.7185:
%.tmp7192 = load %m2652$.Type.type*, %m2652$.Type.type** %field.7189
%.tmp7193 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7192, i32 0, i32 1
%.tmp7194 = load i8*, i8** %.tmp7193
%.tmp7195 = load i8*, i8** %field_name.7181
%.tmp7196 = call i32(i8*,i8*) @strcmp(i8* %.tmp7194, i8* %.tmp7195)
%.tmp7197 = icmp eq i32 %.tmp7196, 0
br i1 %.tmp7197, label %.if.true.7198, label %.if.false.7198
.if.true.7198:
%.tmp7199 = load %m2652$.Type.type*, %m2652$.Type.type** %field.7189
store %m2652$.Type.type* %.tmp7199, %m2652$.Type.type** %found_field.7184
br label %.for.end.7185
br label %.if.end.7198
.if.false.7198:
%.tmp7200 = load i32, i32* %field_id.7182
%.tmp7201 = add i32 %.tmp7200, 1
store i32 %.tmp7201, i32* %field_id.7182
br label %.if.end.7198
.if.end.7198:
%.tmp7202 = load %m2652$.Type.type*, %m2652$.Type.type** %field.7189
%.tmp7203 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7202, i32 0, i32 4
%.tmp7204 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7203
store %m2652$.Type.type* %.tmp7204, %m2652$.Type.type** %field.7189
br label %.for.start.7185
.for.end.7185:
%.tmp7205 = load %m2652$.Type.type*, %m2652$.Type.type** %found_field.7184
%.tmp7206 = icmp eq %m2652$.Type.type* %.tmp7205, null
br i1 %.tmp7206, label %.if.true.7207, label %.if.false.7207
.if.true.7207:
%.tmp7208 = getelementptr i8*, i8** %err_msg.7020, i32 0
%.tmp7210 = getelementptr [34 x i8], [34 x i8]*@.str7209, i32 0, i32 0
%.tmp7211 = load i8*, i8** %field_name.7181
%.tmp7212 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7213 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7212, i32 0, i32 1
%.tmp7214 = load i8*, i8** %.tmp7213
%.tmp7215 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7208, i8* %.tmp7210, i8* %.tmp7211, i8* %.tmp7214)
%.tmp7216 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7217 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7218 = load i8*, i8** %err_msg.7020
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp7216, %m980$.Node.type* %.tmp7217, i8* %.tmp7218)
%.tmp7219 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp7219
br label %.if.end.7207
.if.false.7207:
br label %.if.end.7207
.if.end.7207:
%.tmp7220 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7221 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7220)
%new_info.7222 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp7221, %m2652$.AssignableInfo.type** %new_info.7222
%.tmp7223 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_info.7222
%.tmp7224 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7223, i32 0, i32 4
%.tmp7225 = load %m2652$.Type.type*, %m2652$.Type.type** %found_field.7184
store %m2652$.Type.type* %.tmp7225, %m2652$.Type.type** %.tmp7224
%.tmp7226 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7227 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_info.7222
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp7226, %m2652$.AssignableInfo.type* %.tmp7227)
%.tmp7228 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_info.7222
%.tmp7229 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7228, i32 0, i32 3
%.tmp7231 = getelementptr [9 x i8], [9 x i8]*@.str7230, i32 0, i32 0
store i8* %.tmp7231, i8** %.tmp7229
%.tmp7232 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7233 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base_var.7086
%.tmp7234 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7233, i32 0, i32 4
%.tmp7235 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7234
%.tmp7236 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp7232, %m2652$.Type.type* %.tmp7235)
%info_tr.7237 = alloca i8*
store i8* %.tmp7236, i8** %info_tr.7237
%.tmp7238 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7239 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp7238, i32 0, i32 1
%.tmp7240 = load %m0$.File.type*, %m0$.File.type** %.tmp7239
%.tmp7242 = getelementptr [46 x i8], [46 x i8]*@.str7241, i32 0, i32 0
%.tmp7243 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_info.7222
%.tmp7244 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7243)
%.tmp7245 = load i8*, i8** %info_tr.7237
%.tmp7246 = load i8*, i8** %info_tr.7237
%.tmp7247 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base_var.7086
%.tmp7248 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7247)
%.tmp7249 = load i32, i32* %field_id.7182
%.tmp7250 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7240, i8* %.tmp7242, i8* %.tmp7244, i8* %.tmp7245, i8* %.tmp7246, i8* %.tmp7248, i32 %.tmp7249)
%.tmp7251 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7252 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7253 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7252, i32 0, i32 7
%.tmp7254 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7253
%.tmp7255 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7254, i32 0, i32 7
%.tmp7256 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7255
%.tmp7257 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_info.7222
%.tmp7258 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,%m2652$.AssignableInfo.type*) @m295$get_dotted_name.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp7251, %m980$.Node.type* %.tmp7256, %m2652$.AssignableInfo.type* %.tmp7257)
ret %m2652$.AssignableInfo.type* %.tmp7258
br label %.if.end.7084
.if.false.7084:
%.tmp7259 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp7260 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7259, i32 0, i32 3
%.tmp7261 = load i8*, i8** %.tmp7260
%.tmp7263 = getelementptr [9 x i8], [9 x i8]*@.str7262, i32 0, i32 0
%.tmp7264 = call i32(i8*,i8*) @strcmp(i8* %.tmp7261, i8* %.tmp7263)
%.tmp7265 = icmp eq i32 %.tmp7264, 0
br i1 %.tmp7265, label %.if.true.7266, label %.if.false.7266
.if.true.7266:
%.tmp7267 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
ret %m2652$.AssignableInfo.type* %.tmp7267
br label %.if.end.7266
.if.false.7266:
br label %.if.end.7266
.if.end.7266:
br label %.if.end.7084
.if.end.7084:
br label %.if.end.7047
.if.end.7047:
%.tmp7268 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7269 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7271 = getelementptr [43 x i8], [43 x i8]*@.str7270, i32 0, i32 0
%.tmp7272 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp7268, %m980$.Node.type* %.tmp7269, i8* %.tmp7271)
%.tmp7273 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
%.tmp7274 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7273, i32 0, i32 3
%.tmp7275 = load i8*, i8** %.tmp7274
%.tmp7276 = call i32(i8*,...) @printf(i8* %.tmp7272, i8* %.tmp7275)
%.tmp7277 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp7277
}
define %m2652$.AssignableInfo.type* @m295$compile_addr.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%err_msg.7278 = alloca i8*
store i8* null, i8** %err_msg.7278
%.tmp7279 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%curr_node.7280 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7279, %m980$.Node.type** %curr_node.7280
%.tmp7281 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7280
%.tmp7282 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7281, i32 0, i32 0
%.tmp7283 = load i8*, i8** %.tmp7282
%.tmp7285 = getelementptr [17 x i8], [17 x i8]*@.str7284, i32 0, i32 0
%.tmp7286 = call i32(i8*,i8*) @strcmp(i8* %.tmp7283, i8* %.tmp7285)
%.tmp7287 = icmp eq i32 %.tmp7286, 0
%.tmp7288 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7280
%.tmp7289 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7288, i32 0, i32 0
%.tmp7290 = load i8*, i8** %.tmp7289
%.tmp7292 = getelementptr [16 x i8], [16 x i8]*@.str7291, i32 0, i32 0
%.tmp7293 = call i32(i8*,i8*) @strcmp(i8* %.tmp7290, i8* %.tmp7292)
%.tmp7294 = icmp eq i32 %.tmp7293, 0
%.tmp7295 = or i1 %.tmp7287, %.tmp7294
%.tmp7296 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7280
%.tmp7297 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7296, i32 0, i32 0
%.tmp7298 = load i8*, i8** %.tmp7297
%.tmp7300 = getelementptr [11 x i8], [11 x i8]*@.str7299, i32 0, i32 0
%.tmp7301 = call i32(i8*,i8*) @strcmp(i8* %.tmp7298, i8* %.tmp7300)
%.tmp7302 = icmp eq i32 %.tmp7301, 0
%.tmp7303 = or i1 %.tmp7295, %.tmp7302
br i1 %.tmp7303, label %.if.true.7304, label %.if.false.7304
.if.true.7304:
%.tmp7305 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7306 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp7307 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7306, i32 0, i32 6
%.tmp7308 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7307
%.tmp7309 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp7305, %m980$.Node.type* %.tmp7308)
ret %m2652$.AssignableInfo.type* %.tmp7309
br label %.if.end.7304
.if.false.7304:
br label %.if.end.7304
.if.end.7304:
%.tmp7310 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7280
%.tmp7311 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7310, i32 0, i32 0
%.tmp7312 = load i8*, i8** %.tmp7311
%.tmp7314 = getelementptr [12 x i8], [12 x i8]*@.str7313, i32 0, i32 0
%.tmp7315 = call i32(i8*,i8*) @strcmp(i8* %.tmp7312, i8* %.tmp7314)
%.tmp7316 = icmp ne i32 %.tmp7315, 0
br i1 %.tmp7316, label %.if.true.7317, label %.if.false.7317
.if.true.7317:
%.tmp7319 = getelementptr [92 x i8], [92 x i8]*@.str7318, i32 0, i32 0
%.tmp7320 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7280
%.tmp7321 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7320, i32 0, i32 0
%.tmp7322 = load i8*, i8** %.tmp7321
%.tmp7323 = call i32(i8*,...) @printf(i8* %.tmp7319, i8* %.tmp7322)
%.tmp7324 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp7325 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7324, i32 0, i32 6
%.tmp7326 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7325
store %m980$.Node.type* %.tmp7326, %m980$.Node.type** %curr_node.7280
br label %.if.end.7317
.if.false.7317:
br label %.if.end.7317
.if.end.7317:
%.tmp7327 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7280
%.tmp7328 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7327, i32 0, i32 6
%.tmp7329 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7328
%assignable_name.7330 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7329, %m980$.Node.type** %assignable_name.7330
%.tmp7331 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7332 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7333 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp7332, i32 0, i32 7
%.tmp7334 = load i8*, i8** %.tmp7333
%.tmp7335 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7330
%.tmp7336 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7335, i32 0, i32 6
%.tmp7337 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7336
%.tmp7338 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7337, i32 0, i32 1
%.tmp7339 = load i8*, i8** %.tmp7338
%.tmp7340 = call %m2652$.ScopeItem.type*(%m2652$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2652$.ScopeItem.typep.m2652$.CompilerCtx.typep.cp.cp(%m2652$.CompilerCtx.type* %.tmp7331, i8* %.tmp7334, i8* %.tmp7339)
%scope_info.7341 = alloca %m2652$.ScopeItem.type*
store %m2652$.ScopeItem.type* %.tmp7340, %m2652$.ScopeItem.type** %scope_info.7341
%.tmp7342 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %scope_info.7341
%.tmp7343 = icmp eq %m2652$.ScopeItem.type* %.tmp7342, null
br i1 %.tmp7343, label %.if.true.7344, label %.if.false.7344
.if.true.7344:
%.tmp7345 = getelementptr i8*, i8** %err_msg.7278, i32 0
%.tmp7347 = getelementptr [41 x i8], [41 x i8]*@.str7346, i32 0, i32 0
%.tmp7348 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7330
%.tmp7349 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7348, i32 0, i32 6
%.tmp7350 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7349
%.tmp7351 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7350, i32 0, i32 1
%.tmp7352 = load i8*, i8** %.tmp7351
%.tmp7353 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7345, i8* %.tmp7347, i8* %.tmp7352)
%.tmp7354 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7355 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7330
%.tmp7356 = load i8*, i8** %err_msg.7278
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp7354, %m980$.Node.type* %.tmp7355, i8* %.tmp7356)
%.tmp7357 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp7357
br label %.if.end.7344
.if.false.7344:
br label %.if.end.7344
.if.end.7344:
%.tmp7358 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %scope_info.7341
%.tmp7359 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp7358, i32 0, i32 1
%.tmp7360 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %.tmp7359
%info.7361 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp7360, %m2652$.AssignableInfo.type** %info.7361
%.tmp7362 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7361
%.tmp7363 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7362, i32 0, i32 3
%.tmp7364 = load i8*, i8** %.tmp7363
%.tmp7366 = getelementptr [7 x i8], [7 x i8]*@.str7365, i32 0, i32 0
%.tmp7367 = call i32(i8*,i8*) @strcmp(i8* %.tmp7364, i8* %.tmp7366)
%.tmp7368 = icmp eq i32 %.tmp7367, 0
br i1 %.tmp7368, label %.if.true.7369, label %.if.false.7369
.if.true.7369:
%.tmp7370 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7371 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7361
%.tmp7372 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7371)
%.tmp7373 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7330
%.tmp7374 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7373, i32 0, i32 6
%.tmp7375 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7374
%.tmp7376 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7375, i32 0, i32 7
%.tmp7377 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7376
%.tmp7378 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7377, i32 0, i32 7
%.tmp7379 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7378
%.tmp7380 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7379, i32 0, i32 1
%.tmp7381 = load i8*, i8** %.tmp7380
%.tmp7382 = call %m2652$.ScopeItem.type*(%m2652$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2652$.ScopeItem.typep.m2652$.CompilerCtx.typep.cp.cp(%m2652$.CompilerCtx.type* %.tmp7370, i8* %.tmp7372, i8* %.tmp7381)
store %m2652$.ScopeItem.type* %.tmp7382, %m2652$.ScopeItem.type** %scope_info.7341
%.tmp7383 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %scope_info.7341
%.tmp7384 = icmp eq %m2652$.ScopeItem.type* %.tmp7383, null
br i1 %.tmp7384, label %.if.true.7385, label %.if.false.7385
.if.true.7385:
%.tmp7386 = getelementptr i8*, i8** %err_msg.7278, i32 0
%.tmp7388 = getelementptr [31 x i8], [31 x i8]*@.str7387, i32 0, i32 0
%.tmp7389 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7330
%.tmp7390 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7389, i32 0, i32 6
%.tmp7391 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7390
%.tmp7392 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7391, i32 0, i32 7
%.tmp7393 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7392
%.tmp7394 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7393, i32 0, i32 7
%.tmp7395 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7394
%.tmp7396 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7395, i32 0, i32 1
%.tmp7397 = load i8*, i8** %.tmp7396
%.tmp7398 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7361
%.tmp7399 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7398)
%.tmp7400 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7386, i8* %.tmp7388, i8* %.tmp7397, i8* %.tmp7399)
%.tmp7401 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7402 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7280
%.tmp7403 = load i8*, i8** %err_msg.7278
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp7401, %m980$.Node.type* %.tmp7402, i8* %.tmp7403)
%.tmp7404 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp7404
br label %.if.end.7385
.if.false.7385:
br label %.if.end.7385
.if.end.7385:
%.tmp7405 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %scope_info.7341
%.tmp7406 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp7405, i32 0, i32 1
%.tmp7407 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %.tmp7406
store %m2652$.AssignableInfo.type* %.tmp7407, %m2652$.AssignableInfo.type** %info.7361
%.tmp7408 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7330
%.tmp7409 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7408, i32 0, i32 6
%.tmp7410 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7409
%.tmp7411 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7410, i32 0, i32 7
%.tmp7412 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7411
%.tmp7413 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7412, i32 0, i32 7
%.tmp7414 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7413
store %m980$.Node.type* %.tmp7414, %m980$.Node.type** %assignable_name.7330
br label %.if.end.7369
.if.false.7369:
%.tmp7415 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7330
%.tmp7416 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7415, i32 0, i32 6
%.tmp7417 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7416
store %m980$.Node.type* %.tmp7417, %m980$.Node.type** %assignable_name.7330
br label %.if.end.7369
.if.end.7369:
%.tmp7418 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7419 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7330
%.tmp7420 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7361
%.tmp7421 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,%m2652$.AssignableInfo.type*) @m295$get_dotted_name.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp7418, %m980$.Node.type* %.tmp7419, %m2652$.AssignableInfo.type* %.tmp7420)
%base.7422 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp7421, %m2652$.AssignableInfo.type** %base.7422
%.tmp7424 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7280
%.tmp7425 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7424, i32 0, i32 6
%.tmp7426 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7425
%.tmp7427 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7426, i32 0, i32 7
%.tmp7428 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7427
%addr.7429 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7428, %m980$.Node.type** %addr.7429
br label %.for.start.7423
.for.start.7423:
%.tmp7430 = load %m980$.Node.type*, %m980$.Node.type** %addr.7429
%.tmp7431 = icmp ne %m980$.Node.type* %.tmp7430, null
br i1 %.tmp7431, label %.for.continue.7423, label %.for.end.7423
.for.continue.7423:
%.tmp7432 = load %m980$.Node.type*, %m980$.Node.type** %addr.7429
%.tmp7433 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7432, i32 0, i32 7
%.tmp7434 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7433
%index.7435 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7434, %m980$.Node.type** %index.7435
%.tmp7436 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7437 = load %m980$.Node.type*, %m980$.Node.type** %index.7435
%.tmp7438 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp7436, %m980$.Node.type* %.tmp7437)
%index_info.7439 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp7438, %m2652$.AssignableInfo.type** %index_info.7439
%.tmp7440 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7441 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %index_info.7439
%.tmp7442 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7441, i32 0, i32 4
%.tmp7443 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7442
%.tmp7444 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp7440, %m2652$.Type.type* %.tmp7443)
%index_type.7445 = alloca i8*
store i8* %.tmp7444, i8** %index_type.7445
%.tmp7446 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base.7422
%.tmp7447 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7446, i32 0, i32 4
%.tmp7448 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7447
%.tmp7449 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7448, i32 0, i32 1
%.tmp7450 = load i8*, i8** %.tmp7449
%.tmp7451 = icmp ne i8* %.tmp7450, null
br i1 %.tmp7451, label %.if.true.7452, label %.if.false.7452
.if.true.7452:
%.tmp7453 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base.7422
%.tmp7454 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7453, i32 0, i32 4
%.tmp7455 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7454
%.tmp7456 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7455, i32 0, i32 1
%.tmp7457 = load i8*, i8** %.tmp7456
%.tmp7459 = getelementptr [6 x i8], [6 x i8]*@.str7458, i32 0, i32 0
%.tmp7460 = call i32(i8*,i8*) @strcmp(i8* %.tmp7457, i8* %.tmp7459)
%.tmp7461 = icmp eq i32 %.tmp7460, 0
br i1 %.tmp7461, label %.if.true.7462, label %.if.false.7462
.if.true.7462:
%.tmp7463 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7280
%.tmp7464 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7463)
%new_base.7465 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp7464, %m2652$.AssignableInfo.type** %new_base.7465
%.tmp7466 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7467 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7465
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp7466, %m2652$.AssignableInfo.type* %.tmp7467)
%.tmp7468 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7469 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp7468, i32 0, i32 1
%.tmp7470 = load %m0$.File.type*, %m0$.File.type** %.tmp7469
%.tmp7472 = getelementptr [45 x i8], [45 x i8]*@.str7471, i32 0, i32 0
%.tmp7473 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7465
%.tmp7474 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7473)
%.tmp7475 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7476 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base.7422
%.tmp7477 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7476, i32 0, i32 4
%.tmp7478 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7477
%.tmp7479 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp7475, %m2652$.Type.type* %.tmp7478)
%.tmp7480 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7481 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base.7422
%.tmp7482 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7481, i32 0, i32 4
%.tmp7483 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7482
%.tmp7484 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp7480, %m2652$.Type.type* %.tmp7483)
%.tmp7485 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base.7422
%.tmp7486 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7485)
%.tmp7487 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7470, i8* %.tmp7472, i8* %.tmp7474, i8* %.tmp7479, i8* %.tmp7484, i8* %.tmp7486)
%.tmp7488 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7465
%.tmp7489 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7488, i32 0, i32 4
%.tmp7490 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base.7422
%.tmp7491 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7490, i32 0, i32 4
%.tmp7492 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7491
%.tmp7493 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7492, i32 0, i32 3
%.tmp7494 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7493
%.tmp7495 = call %m2652$.Type.type*(%m2652$.Type.type*) @m295$type_clone.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.tmp7494)
store %m2652$.Type.type* %.tmp7495, %m2652$.Type.type** %.tmp7489
%.tmp7496 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7465
%.tmp7497 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7496, i32 0, i32 4
%.tmp7498 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7497
%.tmp7499 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7498, i32 0, i32 4
store %m2652$.Type.type* null, %m2652$.Type.type** %.tmp7499
%.tmp7500 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7465
store %m2652$.AssignableInfo.type* %.tmp7500, %m2652$.AssignableInfo.type** %base.7422
br label %.if.end.7462
.if.false.7462:
br label %.if.end.7462
.if.end.7462:
br label %.if.end.7452
.if.false.7452:
br label %.if.end.7452
.if.end.7452:
%.tmp7501 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7502 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base.7422
%.tmp7503 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7502, i32 0, i32 4
%.tmp7504 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7503
%.tmp7505 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp7501, %m2652$.Type.type* %.tmp7504)
%base_type.7506 = alloca i8*
store i8* %.tmp7505, i8** %base_type.7506
%.tmp7507 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7508 = call i32(%m2652$.CompilerCtx.type*) @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp7507)
%tmp_id.7509 = alloca i32
store i32 %.tmp7508, i32* %tmp_id.7509
%.tmp7510 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7511 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp7510, i32 0, i32 1
%.tmp7512 = load %m0$.File.type*, %m0$.File.type** %.tmp7511
%.tmp7514 = getelementptr [28 x i8], [28 x i8]*@.str7513, i32 0, i32 0
%.tmp7515 = load i32, i32* %tmp_id.7509
%.tmp7516 = load i8*, i8** %base_type.7506
%.tmp7517 = load i8*, i8** %base_type.7506
%.tmp7518 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base.7422
%.tmp7519 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7518)
%.tmp7520 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7512, i8* %.tmp7514, i32 %.tmp7515, i8* %.tmp7516, i8* %.tmp7517, i8* %.tmp7519)
%.tmp7521 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7280
%.tmp7522 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7521)
%new_base.7523 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp7522, %m2652$.AssignableInfo.type** %new_base.7523
%.tmp7524 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7525 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7523
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp7524, %m2652$.AssignableInfo.type* %.tmp7525)
%.tmp7526 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base.7422
%.tmp7527 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7526, i32 0, i32 4
%.tmp7528 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7527
%.tmp7529 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7528, i32 0, i32 3
%.tmp7530 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7529
%.tmp7531 = icmp eq %m2652$.Type.type* %.tmp7530, null
br i1 %.tmp7531, label %.if.true.7532, label %.if.false.7532
.if.true.7532:
%.tmp7533 = getelementptr i8*, i8** %err_msg.7278, i32 0
%.tmp7535 = getelementptr [35 x i8], [35 x i8]*@.str7534, i32 0, i32 0
%.tmp7536 = load i8*, i8** %base_type.7506
%.tmp7537 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7533, i8* %.tmp7535, i8* %.tmp7536)
%.tmp7538 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7539 = load %m980$.Node.type*, %m980$.Node.type** %addr.7429
%.tmp7540 = load i8*, i8** %err_msg.7278
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp7538, %m980$.Node.type* %.tmp7539, i8* %.tmp7540)
%.tmp7541 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp7541
br label %.if.end.7532
.if.false.7532:
br label %.if.end.7532
.if.end.7532:
%.tmp7542 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7523
%.tmp7543 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7542, i32 0, i32 4
%.tmp7544 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base.7422
%.tmp7545 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7544, i32 0, i32 4
%.tmp7546 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7545
%.tmp7547 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7546, i32 0, i32 3
%.tmp7548 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7547
store %m2652$.Type.type* %.tmp7548, %m2652$.Type.type** %.tmp7543
%.tmp7549 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7550 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7523
%.tmp7551 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7550, i32 0, i32 4
%.tmp7552 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7551
%.tmp7553 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp7549, %m2652$.Type.type* %.tmp7552)
%base_type_2.7554 = alloca i8*
store i8* %.tmp7553, i8** %base_type_2.7554
%.tmp7555 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7556 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp7555, i32 0, i32 1
%.tmp7557 = load %m0$.File.type*, %m0$.File.type** %.tmp7556
%.tmp7559 = getelementptr [44 x i8], [44 x i8]*@.str7558, i32 0, i32 0
%.tmp7560 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7523
%.tmp7561 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7560)
%.tmp7562 = load i8*, i8** %base_type_2.7554
%.tmp7563 = load i8*, i8** %base_type_2.7554
%.tmp7564 = load i32, i32* %tmp_id.7509
%.tmp7565 = load i8*, i8** %index_type.7445
%.tmp7566 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %index_info.7439
%.tmp7567 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7566)
%.tmp7568 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7557, i8* %.tmp7559, i8* %.tmp7561, i8* %.tmp7562, i8* %.tmp7563, i32 %.tmp7564, i8* %.tmp7565, i8* %.tmp7567)
%.tmp7569 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %new_base.7523
store %m2652$.AssignableInfo.type* %.tmp7569, %m2652$.AssignableInfo.type** %base.7422
%.tmp7570 = load %m980$.Node.type*, %m980$.Node.type** %addr.7429
%.tmp7571 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7570, i32 0, i32 7
%.tmp7572 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7571
%.tmp7573 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7572, i32 0, i32 7
%.tmp7574 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7573
%.tmp7575 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7574, i32 0, i32 7
%.tmp7576 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7575
store %m980$.Node.type* %.tmp7576, %m980$.Node.type** %addr.7429
br label %.for.start.7423
.for.end.7423:
%.tmp7577 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %base.7422
ret %m2652$.AssignableInfo.type* %.tmp7577
}
%m295$.StackHead.type = type {%m2407$.SYStack.type*}
define %m2652$.AssignableInfo.type* @m295$compile_assignable.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%curr_node = alloca %m980$.Node.type*
store %m980$.Node.type* %.curr_node.arg, %m980$.Node.type** %curr_node
%.tmp7578 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp7579 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7578, i32 0, i32 6
%.tmp7580 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7579
%.tmp7582 = getelementptr [16 x i8], [16 x i8]*@.str7581, i32 0, i32 0
%.tmp7583 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp7580, i8* %.tmp7582)
%assignable_start.7584 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7583, %m980$.Node.type** %assignable_start.7584
%.tmp7585 = load %m980$.Node.type*, %m980$.Node.type** %assignable_start.7584
%.tmp7586 = call %m2407$.SYStack.type*(%m980$.Node.type*) @m2407$sy_algorithm.m2407$.SYStack.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7585)
%operator_stack.7587 = alloca %m2407$.SYStack.type*
store %m2407$.SYStack.type* %.tmp7586, %m2407$.SYStack.type** %operator_stack.7587
%.tmp7588 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* null, i32 1
%.tmp7589 = ptrtoint %m295$.StackHead.type* %.tmp7588 to i32
%.tmp7590 = call i8*(i32) @malloc(i32 %.tmp7589)
%.tmp7591 = bitcast i8* %.tmp7590 to %m295$.StackHead.type*
%stack.7592 = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.tmp7591, %m295$.StackHead.type** %stack.7592
%.tmp7593 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7592
%.tmp7594 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7593, i32 0, i32 0
%.tmp7595 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %operator_stack.7587
store %m2407$.SYStack.type* %.tmp7595, %m2407$.SYStack.type** %.tmp7594
%.tmp7596 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7597 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7592
%.tmp7598 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m295$.StackHead.typep(%m2652$.CompilerCtx.type* %.tmp7596, %m295$.StackHead.type* %.tmp7597)
%info.7599 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp7598, %m2652$.AssignableInfo.type** %info.7599
%.tmp7600 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7599
%.tmp7601 = icmp eq %m2652$.AssignableInfo.type* %.tmp7600, null
br i1 %.tmp7601, label %.if.true.7602, label %.if.false.7602
.if.true.7602:
%.tmp7603 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7599
ret %m2652$.AssignableInfo.type* %.tmp7603
br label %.if.end.7602
.if.false.7602:
br label %.if.end.7602
.if.end.7602:
%.tmp7604 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp7605 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7604, i32 0, i32 6
%.tmp7606 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7605
%.tmp7608 = getelementptr [5 x i8], [5 x i8]*@.str7607, i32 0, i32 0
%.tmp7609 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp7606, i8* %.tmp7608)
%cast.7610 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7609, %m980$.Node.type** %cast.7610
%.tmp7611 = load %m980$.Node.type*, %m980$.Node.type** %cast.7610
%.tmp7612 = icmp ne %m980$.Node.type* %.tmp7611, null
br i1 %.tmp7612, label %.if.true.7613, label %.if.false.7613
.if.true.7613:
%.tmp7614 = load %m980$.Node.type*, %m980$.Node.type** %cast.7610
%.tmp7615 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7614, i32 0, i32 6
%.tmp7616 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7615
%.tmp7618 = getelementptr [5 x i8], [5 x i8]*@.str7617, i32 0, i32 0
%.tmp7619 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp7616, i8* %.tmp7618)
%cast_type.7620 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7619, %m980$.Node.type** %cast_type.7620
%.tmp7621 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7622 = load %m980$.Node.type*, %m980$.Node.type** %cast_type.7620
%.tmp7623 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7622, i32 0, i32 6
%.tmp7624 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7623
%.tmp7625 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp7621, %m980$.Node.type* %.tmp7624)
%type.7626 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp7625, %m2652$.Type.type** %type.7626
%.tmp7627 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7599
%.tmp7628 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7627)
%prev_id.7629 = alloca i8*
store i8* %.tmp7628, i8** %prev_id.7629
%.tmp7630 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7631 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7599
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp7630, %m2652$.AssignableInfo.type* %.tmp7631)
%.tmp7632 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7633 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7599
%.tmp7634 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7633, i32 0, i32 4
%.tmp7635 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7634
%.tmp7636 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp7632, %m2652$.Type.type* %.tmp7635)
%from_type.7637 = alloca i8*
store i8* %.tmp7636, i8** %from_type.7637
%.tmp7638 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7639 = load %m2652$.Type.type*, %m2652$.Type.type** %type.7626
%.tmp7640 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp7638, %m2652$.Type.type* %.tmp7639)
%to_type.7641 = alloca i8*
store i8* %.tmp7640, i8** %to_type.7641
%.tmp7643 = getelementptr [8 x i8], [8 x i8]*@.str7642, i32 0, i32 0
%cast_fn.7644 = alloca i8*
store i8* %.tmp7643, i8** %cast_fn.7644
%.tmp7645 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7599
%.tmp7646 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7645, i32 0, i32 4
%.tmp7647 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7646
%.tmp7648 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7647, i32 0, i32 1
%.tmp7649 = load i8*, i8** %.tmp7648
%.tmp7650 = icmp ne i8* %.tmp7649, null
br i1 %.tmp7650, label %.if.true.7651, label %.if.false.7651
.if.true.7651:
%.tmp7652 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7599
%.tmp7653 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7652, i32 0, i32 4
%.tmp7654 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7653
%.tmp7655 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7654, i32 0, i32 1
%.tmp7656 = load i8*, i8** %.tmp7655
%.tmp7658 = getelementptr [6 x i8], [6 x i8]*@.str7657, i32 0, i32 0
%.tmp7659 = call i32(i8*,i8*) @strcmp(i8* %.tmp7656, i8* %.tmp7658)
%.tmp7660 = icmp eq i32 %.tmp7659, 0
br i1 %.tmp7660, label %.if.true.7661, label %.if.false.7661
.if.true.7661:
%.tmp7663 = getelementptr [48 x i8], [48 x i8]*@.str7662, i32 0, i32 0
%.tmp7664 = call i32(i8*,...) @printf(i8* %.tmp7663)
br label %.if.end.7661
.if.false.7661:
br label %.if.end.7661
.if.end.7661:
br label %.if.end.7651
.if.false.7651:
br label %.if.end.7651
.if.end.7651:
%.tmp7665 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7599
%.tmp7666 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7665, i32 0, i32 4
%.tmp7667 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7666
%.tmp7668 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7667, i32 0, i32 0
%.tmp7669 = load i8*, i8** %.tmp7668
%.tmp7671 = getelementptr [4 x i8], [4 x i8]*@.str7670, i32 0, i32 0
%.tmp7672 = call i32(i8*,i8*) @strcmp(i8* %.tmp7669, i8* %.tmp7671)
%.tmp7673 = icmp ne i32 %.tmp7672, 0
%.tmp7674 = load %m2652$.Type.type*, %m2652$.Type.type** %type.7626
%.tmp7675 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp7674, i32 0, i32 0
%.tmp7676 = load i8*, i8** %.tmp7675
%.tmp7678 = getelementptr [4 x i8], [4 x i8]*@.str7677, i32 0, i32 0
%.tmp7679 = call i32(i8*,i8*) @strcmp(i8* %.tmp7676, i8* %.tmp7678)
%.tmp7680 = icmp ne i32 %.tmp7679, 0
%.tmp7681 = and i1 %.tmp7673, %.tmp7680
br i1 %.tmp7681, label %.if.true.7682, label %.if.false.7682
.if.true.7682:
%.tmp7683 = load i8*, i8** %from_type.7637
%.tmp7684 = getelementptr i8, i8* %.tmp7683, i32 0
%.tmp7685 = load i8, i8* %.tmp7684
%.tmp7686 = icmp eq i8 %.tmp7685, 105
%.tmp7687 = load i8*, i8** %to_type.7641
%.tmp7688 = getelementptr i8, i8* %.tmp7687, i32 0
%.tmp7689 = load i8, i8* %.tmp7688
%.tmp7690 = icmp eq i8 %.tmp7689, 105
%.tmp7691 = and i1 %.tmp7686, %.tmp7690
br i1 %.tmp7691, label %.if.true.7692, label %.if.false.7692
.if.true.7692:
%from_size.7693 = alloca i32
store i32 0, i32* %from_size.7693
%to_size.7694 = alloca i32
store i32 0, i32* %to_size.7694
%.tmp7695 = load i8*, i8** %from_type.7637
%.tmp7697 = getelementptr [4 x i8], [4 x i8]*@.str7696, i32 0, i32 0
%.tmp7698 = getelementptr i32, i32* %from_size.7693, i32 0
%.tmp7699 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7695, i8* %.tmp7697, i32* %.tmp7698)
%.tmp7700 = load i8*, i8** %to_type.7641
%.tmp7702 = getelementptr [4 x i8], [4 x i8]*@.str7701, i32 0, i32 0
%.tmp7703 = getelementptr i32, i32* %to_size.7694, i32 0
%.tmp7704 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7700, i8* %.tmp7702, i32* %.tmp7703)
%.tmp7705 = load i32, i32* %from_size.7693
%.tmp7706 = load i32, i32* %to_size.7694
%.tmp7707 = icmp slt i32 %.tmp7705, %.tmp7706
br i1 %.tmp7707, label %.if.true.7708, label %.if.false.7708
.if.true.7708:
%.tmp7710 = getelementptr [5 x i8], [5 x i8]*@.str7709, i32 0, i32 0
store i8* %.tmp7710, i8** %cast_fn.7644
br label %.if.end.7708
.if.false.7708:
%.tmp7712 = getelementptr [6 x i8], [6 x i8]*@.str7711, i32 0, i32 0
store i8* %.tmp7712, i8** %cast_fn.7644
br label %.if.end.7708
.if.end.7708:
br label %.if.end.7692
.if.false.7692:
br label %.if.end.7692
.if.end.7692:
br label %.if.end.7682
.if.false.7682:
br label %.if.end.7682
.if.end.7682:
%.tmp7713 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7714 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp7713, i32 0, i32 1
%.tmp7715 = load %m0$.File.type*, %m0$.File.type** %.tmp7714
%.tmp7717 = getelementptr [21 x i8], [21 x i8]*@.str7716, i32 0, i32 0
%.tmp7718 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7599
%.tmp7719 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7718)
%.tmp7720 = load i8*, i8** %cast_fn.7644
%.tmp7721 = load i8*, i8** %from_type.7637
%.tmp7722 = load i8*, i8** %prev_id.7629
%.tmp7723 = load i8*, i8** %to_type.7641
%.tmp7724 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7715, i8* %.tmp7717, i8* %.tmp7719, i8* %.tmp7720, i8* %.tmp7721, i8* %.tmp7722, i8* %.tmp7723)
%.tmp7725 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7599
%.tmp7726 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7725, i32 0, i32 4
%.tmp7727 = load %m2652$.Type.type*, %m2652$.Type.type** %type.7626
store %m2652$.Type.type* %.tmp7727, %m2652$.Type.type** %.tmp7726
br label %.if.end.7613
.if.false.7613:
br label %.if.end.7613
.if.end.7613:
%.tmp7728 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.7599
ret %m2652$.AssignableInfo.type* %.tmp7728
}
define %m2652$.AssignableInfo.type* @m295$compile_assignable_stack.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m295$.StackHead.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m295$.StackHead.type* %.stack.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stack = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.stack.arg, %m295$.StackHead.type** %stack
%.tmp7729 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7730 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7729, i32 0, i32 0
%.tmp7731 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %.tmp7730
%.tmp7732 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp7731, i32 0, i32 0
%.tmp7733 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7732
%.tmp7734 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7733, i32 0, i32 0
%.tmp7735 = load i8*, i8** %.tmp7734
%.tmp7737 = getelementptr [16 x i8], [16 x i8]*@.str7736, i32 0, i32 0
%.tmp7738 = call i32(i8*,i8*) @strcmp(i8* %.tmp7735, i8* %.tmp7737)
%.tmp7739 = icmp eq i32 %.tmp7738, 0
br i1 %.tmp7739, label %.if.true.7740, label %.if.false.7740
.if.true.7740:
%.tmp7741 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7742 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7743 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7742, i32 0, i32 0
%.tmp7744 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %.tmp7743
%.tmp7745 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp7744, i32 0, i32 0
%.tmp7746 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7745
%.tmp7747 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_mono_assignable.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp7741, %m980$.Node.type* %.tmp7746)
ret %m2652$.AssignableInfo.type* %.tmp7747
br label %.if.end.7740
.if.false.7740:
br label %.if.end.7740
.if.end.7740:
%.tmp7748 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7749 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7748, i32 0, i32 0
%.tmp7750 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %.tmp7749
%.tmp7751 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp7750, i32 0, i32 0
%.tmp7752 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7751
%.tmp7753 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7752, i32 0, i32 6
%.tmp7754 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7753
%operator.7755 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7754, %m980$.Node.type** %operator.7755
%.tmp7756 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7757 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7756, i32 0, i32 0
%.tmp7758 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7759 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7758, i32 0, i32 0
%.tmp7760 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %.tmp7759
%.tmp7761 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp7760, i32 0, i32 1
%.tmp7762 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %.tmp7761
store %m2407$.SYStack.type* %.tmp7762, %m2407$.SYStack.type** %.tmp7757
%.tmp7763 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7764 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7765 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m295$.StackHead.typep(%m2652$.CompilerCtx.type* %.tmp7763, %m295$.StackHead.type* %.tmp7764)
%A.7766 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp7765, %m2652$.AssignableInfo.type** %A.7766
%.tmp7767 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %A.7766
%.tmp7768 = icmp eq %m2652$.AssignableInfo.type* %.tmp7767, null
br i1 %.tmp7768, label %.if.true.7769, label %.if.false.7769
.if.true.7769:
%.tmp7770 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %A.7766
ret %m2652$.AssignableInfo.type* %.tmp7770
br label %.if.end.7769
.if.false.7769:
br label %.if.end.7769
.if.end.7769:
%.tmp7771 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7772 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7771, i32 0, i32 0
%.tmp7773 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7774 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7773, i32 0, i32 0
%.tmp7775 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %.tmp7774
%.tmp7776 = getelementptr %m2407$.SYStack.type, %m2407$.SYStack.type* %.tmp7775, i32 0, i32 1
%.tmp7777 = load %m2407$.SYStack.type*, %m2407$.SYStack.type** %.tmp7776
store %m2407$.SYStack.type* %.tmp7777, %m2407$.SYStack.type** %.tmp7772
%.tmp7778 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7779 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7780 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m295$.StackHead.typep(%m2652$.CompilerCtx.type* %.tmp7778, %m295$.StackHead.type* %.tmp7779)
%B.7781 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp7780, %m2652$.AssignableInfo.type** %B.7781
%.tmp7782 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %B.7781
%.tmp7783 = icmp eq %m2652$.AssignableInfo.type* %.tmp7782, null
br i1 %.tmp7783, label %.if.true.7784, label %.if.false.7784
.if.true.7784:
%.tmp7785 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %B.7781
ret %m2652$.AssignableInfo.type* %.tmp7785
br label %.if.end.7784
.if.false.7784:
br label %.if.end.7784
.if.end.7784:
%.tmp7786 = bitcast ptr null to %m980$.Node.type*
%.tmp7787 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7786)
%op_info.7788 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp7787, %m2652$.AssignableInfo.type** %op_info.7788
%.tmp7789 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %op_info.7788
%.tmp7790 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7789, i32 0, i32 4
%.tmp7791 = load %m980$.Node.type*, %m980$.Node.type** %operator.7755
%.tmp7792 = call %m2652$.Type.type*(%m980$.Node.type*) @m295$operator_type.m2652$.Type.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7791)
store %m2652$.Type.type* %.tmp7792, %m2652$.Type.type** %.tmp7790
%.tmp7793 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7794 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %op_info.7788
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp7793, %m2652$.AssignableInfo.type* %.tmp7794)
%.tmp7795 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7796 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp7795, i32 0, i32 1
%.tmp7797 = load %m0$.File.type*, %m0$.File.type** %.tmp7796
%.tmp7799 = getelementptr [19 x i8], [19 x i8]*@.str7798, i32 0, i32 0
%.tmp7800 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %op_info.7788
%.tmp7801 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7800)
%.tmp7802 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7803 = load %m980$.Node.type*, %m980$.Node.type** %operator.7755
%.tmp7804 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$operator_op.cp.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp7802, %m980$.Node.type* %.tmp7803)
%.tmp7805 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7806 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %A.7766
%.tmp7807 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp7806, i32 0, i32 4
%.tmp7808 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp7807
%.tmp7809 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp7805, %m2652$.Type.type* %.tmp7808)
%.tmp7810 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %A.7766
%.tmp7811 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7810)
%.tmp7812 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %B.7781
%.tmp7813 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp7812)
%.tmp7814 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7797, i8* %.tmp7799, i8* %.tmp7801, i8* %.tmp7804, i8* %.tmp7809, i8* %.tmp7811, i8* %.tmp7813)
%.tmp7815 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %op_info.7788
ret %m2652$.AssignableInfo.type* %.tmp7815
}
define i8* @m295$operator_op.cp.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.op.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%op = alloca %m980$.Node.type*
store %m980$.Node.type* %.op.arg, %m980$.Node.type** %op
%.tmp7816 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7817 = icmp eq %m980$.Node.type* %.tmp7816, null
br i1 %.tmp7817, label %.if.true.7818, label %.if.false.7818
.if.true.7818:
%.tmp7819 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7820 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7822 = getelementptr [31 x i8], [31 x i8]*@.str7821, i32 0, i32 0
%.tmp7823 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp7819, %m980$.Node.type* %.tmp7820, i8* %.tmp7822)
%.tmp7824 = call i32(i8*,...) @printf(i8* %.tmp7823)
br label %.if.end.7818
.if.false.7818:
br label %.if.end.7818
.if.end.7818:
%.tmp7825 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7826 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7825, i32 0, i32 1
%.tmp7827 = load i8*, i8** %.tmp7826
%.tmp7829 = getelementptr [2 x i8], [2 x i8]*@.str7828, i32 0, i32 0
%.tmp7830 = call i32(i8*,i8*) @strcmp(i8* %.tmp7827, i8* %.tmp7829)
%.tmp7831 = icmp eq i32 %.tmp7830, 0
br i1 %.tmp7831, label %.if.true.7832, label %.if.false.7832
.if.true.7832:
%.tmp7834 = getelementptr [4 x i8], [4 x i8]*@.str7833, i32 0, i32 0
ret i8* %.tmp7834
br label %.if.end.7832
.if.false.7832:
%.tmp7835 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7836 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7835, i32 0, i32 1
%.tmp7837 = load i8*, i8** %.tmp7836
%.tmp7839 = getelementptr [2 x i8], [2 x i8]*@.str7838, i32 0, i32 0
%.tmp7840 = call i32(i8*,i8*) @strcmp(i8* %.tmp7837, i8* %.tmp7839)
%.tmp7841 = icmp eq i32 %.tmp7840, 0
br i1 %.tmp7841, label %.if.true.7842, label %.if.false.7842
.if.true.7842:
%.tmp7844 = getelementptr [4 x i8], [4 x i8]*@.str7843, i32 0, i32 0
ret i8* %.tmp7844
br label %.if.end.7842
.if.false.7842:
%.tmp7845 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7846 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7845, i32 0, i32 1
%.tmp7847 = load i8*, i8** %.tmp7846
%.tmp7849 = getelementptr [2 x i8], [2 x i8]*@.str7848, i32 0, i32 0
%.tmp7850 = call i32(i8*,i8*) @strcmp(i8* %.tmp7847, i8* %.tmp7849)
%.tmp7851 = icmp eq i32 %.tmp7850, 0
br i1 %.tmp7851, label %.if.true.7852, label %.if.false.7852
.if.true.7852:
%.tmp7854 = getelementptr [4 x i8], [4 x i8]*@.str7853, i32 0, i32 0
ret i8* %.tmp7854
br label %.if.end.7852
.if.false.7852:
%.tmp7855 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7856 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7855, i32 0, i32 1
%.tmp7857 = load i8*, i8** %.tmp7856
%.tmp7859 = getelementptr [2 x i8], [2 x i8]*@.str7858, i32 0, i32 0
%.tmp7860 = call i32(i8*,i8*) @strcmp(i8* %.tmp7857, i8* %.tmp7859)
%.tmp7861 = icmp eq i32 %.tmp7860, 0
br i1 %.tmp7861, label %.if.true.7862, label %.if.false.7862
.if.true.7862:
%.tmp7864 = getelementptr [5 x i8], [5 x i8]*@.str7863, i32 0, i32 0
ret i8* %.tmp7864
br label %.if.end.7862
.if.false.7862:
%.tmp7865 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7866 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7865, i32 0, i32 1
%.tmp7867 = load i8*, i8** %.tmp7866
%.tmp7869 = getelementptr [3 x i8], [3 x i8]*@.str7868, i32 0, i32 0
%.tmp7870 = call i32(i8*,i8*) @strcmp(i8* %.tmp7867, i8* %.tmp7869)
%.tmp7871 = icmp eq i32 %.tmp7870, 0
br i1 %.tmp7871, label %.if.true.7872, label %.if.false.7872
.if.true.7872:
%.tmp7874 = getelementptr [8 x i8], [8 x i8]*@.str7873, i32 0, i32 0
ret i8* %.tmp7874
br label %.if.end.7872
.if.false.7872:
%.tmp7875 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7876 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7875, i32 0, i32 1
%.tmp7877 = load i8*, i8** %.tmp7876
%.tmp7879 = getelementptr [3 x i8], [3 x i8]*@.str7878, i32 0, i32 0
%.tmp7880 = call i32(i8*,i8*) @strcmp(i8* %.tmp7877, i8* %.tmp7879)
%.tmp7881 = icmp eq i32 %.tmp7880, 0
br i1 %.tmp7881, label %.if.true.7882, label %.if.false.7882
.if.true.7882:
%.tmp7884 = getelementptr [8 x i8], [8 x i8]*@.str7883, i32 0, i32 0
ret i8* %.tmp7884
br label %.if.end.7882
.if.false.7882:
%.tmp7885 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7886 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7885, i32 0, i32 1
%.tmp7887 = load i8*, i8** %.tmp7886
%.tmp7889 = getelementptr [2 x i8], [2 x i8]*@.str7888, i32 0, i32 0
%.tmp7890 = call i32(i8*,i8*) @strcmp(i8* %.tmp7887, i8* %.tmp7889)
%.tmp7891 = icmp eq i32 %.tmp7890, 0
br i1 %.tmp7891, label %.if.true.7892, label %.if.false.7892
.if.true.7892:
%.tmp7894 = getelementptr [9 x i8], [9 x i8]*@.str7893, i32 0, i32 0
ret i8* %.tmp7894
br label %.if.end.7892
.if.false.7892:
%.tmp7895 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7896 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7895, i32 0, i32 1
%.tmp7897 = load i8*, i8** %.tmp7896
%.tmp7899 = getelementptr [2 x i8], [2 x i8]*@.str7898, i32 0, i32 0
%.tmp7900 = call i32(i8*,i8*) @strcmp(i8* %.tmp7897, i8* %.tmp7899)
%.tmp7901 = icmp eq i32 %.tmp7900, 0
br i1 %.tmp7901, label %.if.true.7902, label %.if.false.7902
.if.true.7902:
%.tmp7904 = getelementptr [9 x i8], [9 x i8]*@.str7903, i32 0, i32 0
ret i8* %.tmp7904
br label %.if.end.7902
.if.false.7902:
%.tmp7905 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7906 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7905, i32 0, i32 1
%.tmp7907 = load i8*, i8** %.tmp7906
%.tmp7909 = getelementptr [2 x i8], [2 x i8]*@.str7908, i32 0, i32 0
%.tmp7910 = call i32(i8*,i8*) @strcmp(i8* %.tmp7907, i8* %.tmp7909)
%.tmp7911 = icmp eq i32 %.tmp7910, 0
br i1 %.tmp7911, label %.if.true.7912, label %.if.false.7912
.if.true.7912:
%.tmp7914 = getelementptr [4 x i8], [4 x i8]*@.str7913, i32 0, i32 0
ret i8* %.tmp7914
br label %.if.end.7912
.if.false.7912:
%.tmp7915 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7916 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7915, i32 0, i32 1
%.tmp7917 = load i8*, i8** %.tmp7916
%.tmp7919 = getelementptr [2 x i8], [2 x i8]*@.str7918, i32 0, i32 0
%.tmp7920 = call i32(i8*,i8*) @strcmp(i8* %.tmp7917, i8* %.tmp7919)
%.tmp7921 = icmp eq i32 %.tmp7920, 0
br i1 %.tmp7921, label %.if.true.7922, label %.if.false.7922
.if.true.7922:
%.tmp7924 = getelementptr [3 x i8], [3 x i8]*@.str7923, i32 0, i32 0
ret i8* %.tmp7924
br label %.if.end.7922
.if.false.7922:
%.tmp7925 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7926 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7925, i32 0, i32 1
%.tmp7927 = load i8*, i8** %.tmp7926
%.tmp7929 = getelementptr [3 x i8], [3 x i8]*@.str7928, i32 0, i32 0
%.tmp7930 = call i32(i8*,i8*) @strcmp(i8* %.tmp7927, i8* %.tmp7929)
%.tmp7931 = icmp eq i32 %.tmp7930, 0
br i1 %.tmp7931, label %.if.true.7932, label %.if.false.7932
.if.true.7932:
%.tmp7934 = getelementptr [9 x i8], [9 x i8]*@.str7933, i32 0, i32 0
ret i8* %.tmp7934
br label %.if.end.7932
.if.false.7932:
%.tmp7935 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7936 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7935, i32 0, i32 1
%.tmp7937 = load i8*, i8** %.tmp7936
%.tmp7939 = getelementptr [3 x i8], [3 x i8]*@.str7938, i32 0, i32 0
%.tmp7940 = call i32(i8*,i8*) @strcmp(i8* %.tmp7937, i8* %.tmp7939)
%.tmp7941 = icmp eq i32 %.tmp7940, 0
br i1 %.tmp7941, label %.if.true.7942, label %.if.false.7942
.if.true.7942:
%.tmp7944 = getelementptr [9 x i8], [9 x i8]*@.str7943, i32 0, i32 0
ret i8* %.tmp7944
br label %.if.end.7942
.if.false.7942:
%.tmp7945 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7946 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7945, i32 0, i32 1
%.tmp7947 = load i8*, i8** %.tmp7946
%.tmp7949 = getelementptr [2 x i8], [2 x i8]*@.str7948, i32 0, i32 0
%.tmp7950 = call i32(i8*,i8*) @strcmp(i8* %.tmp7947, i8* %.tmp7949)
%.tmp7951 = icmp eq i32 %.tmp7950, 0
br i1 %.tmp7951, label %.if.true.7952, label %.if.false.7952
.if.true.7952:
%.tmp7954 = getelementptr [5 x i8], [5 x i8]*@.str7953, i32 0, i32 0
ret i8* %.tmp7954
br label %.if.end.7952
.if.false.7952:
%.tmp7955 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp7956 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7958 = getelementptr [30 x i8], [30 x i8]*@.str7957, i32 0, i32 0
%.tmp7959 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp7955, %m980$.Node.type* %.tmp7956, i8* %.tmp7958)
%.tmp7960 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7961 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7960, i32 0, i32 1
%.tmp7962 = load i8*, i8** %.tmp7961
%.tmp7963 = call i32(i8*,...) @printf(i8* %.tmp7959, i8* %.tmp7962)
br label %.if.end.7952
.if.end.7952:
br label %.if.end.7942
.if.end.7942:
br label %.if.end.7932
.if.end.7932:
br label %.if.end.7922
.if.end.7922:
br label %.if.end.7912
.if.end.7912:
br label %.if.end.7902
.if.end.7902:
br label %.if.end.7892
.if.end.7892:
br label %.if.end.7882
.if.end.7882:
br label %.if.end.7872
.if.end.7872:
br label %.if.end.7862
.if.end.7862:
br label %.if.end.7852
.if.end.7852:
br label %.if.end.7842
.if.end.7842:
br label %.if.end.7832
.if.end.7832:
%.tmp7965 = getelementptr [4 x i8], [4 x i8]*@.str7964, i32 0, i32 0
ret i8* %.tmp7965
}
define %m2652$.Type.type* @m295$operator_type.m2652$.Type.typep.m980$.Node.typep(%m980$.Node.type* %.op.arg) {
%op = alloca %m980$.Node.type*
store %m980$.Node.type* %.op.arg, %m980$.Node.type** %op
%.tmp7966 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%type.7967 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp7966, %m2652$.Type.type** %type.7967
%.tmp7968 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7969 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7968, i32 0, i32 1
%.tmp7970 = load i8*, i8** %.tmp7969
%.tmp7972 = getelementptr [3 x i8], [3 x i8]*@.str7971, i32 0, i32 0
%.tmp7973 = call i32(i8*,i8*) @strcmp(i8* %.tmp7970, i8* %.tmp7972)
%.tmp7974 = icmp eq i32 %.tmp7973, 0
%.tmp7975 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7976 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7975, i32 0, i32 1
%.tmp7977 = load i8*, i8** %.tmp7976
%.tmp7979 = getelementptr [3 x i8], [3 x i8]*@.str7978, i32 0, i32 0
%.tmp7980 = call i32(i8*,i8*) @strcmp(i8* %.tmp7977, i8* %.tmp7979)
%.tmp7981 = icmp eq i32 %.tmp7980, 0
%.tmp7982 = or i1 %.tmp7974, %.tmp7981
%.tmp7983 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7984 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7983, i32 0, i32 1
%.tmp7985 = load i8*, i8** %.tmp7984
%.tmp7987 = getelementptr [2 x i8], [2 x i8]*@.str7986, i32 0, i32 0
%.tmp7988 = call i32(i8*,i8*) @strcmp(i8* %.tmp7985, i8* %.tmp7987)
%.tmp7989 = icmp eq i32 %.tmp7988, 0
%.tmp7990 = or i1 %.tmp7982, %.tmp7989
%.tmp7991 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7992 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7991, i32 0, i32 1
%.tmp7993 = load i8*, i8** %.tmp7992
%.tmp7995 = getelementptr [2 x i8], [2 x i8]*@.str7994, i32 0, i32 0
%.tmp7996 = call i32(i8*,i8*) @strcmp(i8* %.tmp7993, i8* %.tmp7995)
%.tmp7997 = icmp eq i32 %.tmp7996, 0
%.tmp7998 = or i1 %.tmp7990, %.tmp7997
%.tmp7999 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8000 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7999, i32 0, i32 1
%.tmp8001 = load i8*, i8** %.tmp8000
%.tmp8003 = getelementptr [2 x i8], [2 x i8]*@.str8002, i32 0, i32 0
%.tmp8004 = call i32(i8*,i8*) @strcmp(i8* %.tmp8001, i8* %.tmp8003)
%.tmp8005 = icmp eq i32 %.tmp8004, 0
%.tmp8006 = or i1 %.tmp7998, %.tmp8005
%.tmp8007 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8008 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8007, i32 0, i32 1
%.tmp8009 = load i8*, i8** %.tmp8008
%.tmp8011 = getelementptr [2 x i8], [2 x i8]*@.str8010, i32 0, i32 0
%.tmp8012 = call i32(i8*,i8*) @strcmp(i8* %.tmp8009, i8* %.tmp8011)
%.tmp8013 = icmp eq i32 %.tmp8012, 0
%.tmp8014 = or i1 %.tmp8006, %.tmp8013
%.tmp8015 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8016 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8015, i32 0, i32 1
%.tmp8017 = load i8*, i8** %.tmp8016
%.tmp8019 = getelementptr [3 x i8], [3 x i8]*@.str8018, i32 0, i32 0
%.tmp8020 = call i32(i8*,i8*) @strcmp(i8* %.tmp8017, i8* %.tmp8019)
%.tmp8021 = icmp eq i32 %.tmp8020, 0
%.tmp8022 = or i1 %.tmp8014, %.tmp8021
%.tmp8023 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8024 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8023, i32 0, i32 1
%.tmp8025 = load i8*, i8** %.tmp8024
%.tmp8027 = getelementptr [3 x i8], [3 x i8]*@.str8026, i32 0, i32 0
%.tmp8028 = call i32(i8*,i8*) @strcmp(i8* %.tmp8025, i8* %.tmp8027)
%.tmp8029 = icmp eq i32 %.tmp8028, 0
%.tmp8030 = or i1 %.tmp8022, %.tmp8029
br i1 %.tmp8030, label %.if.true.8031, label %.if.false.8031
.if.true.8031:
%.tmp8032 = load %m2652$.Type.type*, %m2652$.Type.type** %type.7967
%.tmp8033 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8032, i32 0, i32 0
%.tmp8035 = getelementptr [5 x i8], [5 x i8]*@.str8034, i32 0, i32 0
store i8* %.tmp8035, i8** %.tmp8033
br label %.if.end.8031
.if.false.8031:
%.tmp8036 = load %m2652$.Type.type*, %m2652$.Type.type** %type.7967
%.tmp8037 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8036, i32 0, i32 0
%.tmp8039 = getelementptr [4 x i8], [4 x i8]*@.str8038, i32 0, i32 0
store i8* %.tmp8039, i8** %.tmp8037
br label %.if.end.8031
.if.end.8031:
%.tmp8040 = load %m2652$.Type.type*, %m2652$.Type.type** %type.7967
ret %m2652$.Type.type* %.tmp8040
}
define %m2652$.AssignableInfo.type* @m295$compile_mono_assignable.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%curr_node = alloca %m980$.Node.type*
store %m980$.Node.type* %.curr_node.arg, %m980$.Node.type** %curr_node
%.tmp8041 = bitcast ptr null to %m2652$.AssignableInfo.type*
%assignable_info.8042 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp8041, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8043 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%mono.8044 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8043, %m980$.Node.type** %mono.8044
%err_buf.8045 = alloca i8*
store i8* null, i8** %err_buf.8045
%buf.8046 = alloca i8*
store i8* null, i8** %buf.8046
%.tmp8047 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8048 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8047, i32 0, i32 6
%.tmp8049 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8048
%.tmp8050 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8049, i32 0, i32 0
%.tmp8051 = load i8*, i8** %.tmp8050
%.tmp8053 = getelementptr [7 x i8], [7 x i8]*@.str8052, i32 0, i32 0
%.tmp8054 = call i32(i8*,i8*) @strcmp(i8* %.tmp8051, i8* %.tmp8053)
%.tmp8055 = icmp eq i32 %.tmp8054, 0
br i1 %.tmp8055, label %.if.true.8056, label %.if.false.8056
.if.true.8056:
%.tmp8057 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8058 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8057)
store %m2652$.AssignableInfo.type* %.tmp8058, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8059 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8060 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8059, i32 0, i32 4
%.tmp8061 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp8061, %m2652$.Type.type** %.tmp8060
%.tmp8062 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8063 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8062, i32 0, i32 4
%.tmp8064 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8063
%.tmp8065 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8064, i32 0, i32 0
%.tmp8067 = getelementptr [4 x i8], [4 x i8]*@.str8066, i32 0, i32 0
store i8* %.tmp8067, i8** %.tmp8065
%.tmp8068 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8069 = load i8, i8* @SCOPE_CONST
%.tmp8070 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8071 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8070, i32 0, i32 6
%.tmp8072 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8071
%.tmp8073 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8072, i32 0, i32 1
%.tmp8074 = load i8*, i8** %.tmp8073
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp8068, i8 %.tmp8069, i8* %.tmp8074)
br label %.if.end.8056
.if.false.8056:
%.tmp8075 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8076 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8075, i32 0, i32 6
%.tmp8077 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8076
%.tmp8078 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8077, i32 0, i32 0
%.tmp8079 = load i8*, i8** %.tmp8078
%.tmp8081 = getelementptr [5 x i8], [5 x i8]*@.str8080, i32 0, i32 0
%.tmp8082 = call i32(i8*,i8*) @strcmp(i8* %.tmp8079, i8* %.tmp8081)
%.tmp8083 = icmp eq i32 %.tmp8082, 0
br i1 %.tmp8083, label %.if.true.8084, label %.if.false.8084
.if.true.8084:
%.tmp8085 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8086 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8085, i32 0, i32 6
%.tmp8087 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8086
%.tmp8088 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8087, i32 0, i32 1
%.tmp8089 = load i8*, i8** %.tmp8088
%.tmp8091 = getelementptr [5 x i8], [5 x i8]*@.str8090, i32 0, i32 0
%.tmp8092 = call i32(i8*,i8*) @strcmp(i8* %.tmp8089, i8* %.tmp8091)
%.tmp8093 = icmp ne i32 %.tmp8092, 0
br i1 %.tmp8093, label %.if.true.8094, label %.if.false.8094
.if.true.8094:
%.tmp8095 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8096 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8098 = getelementptr [42 x i8], [42 x i8]*@.str8097, i32 0, i32 0
%.tmp8099 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp8095, %m980$.Node.type* %.tmp8096, i8* %.tmp8098)
%.tmp8100 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8101 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8100, i32 0, i32 6
%.tmp8102 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8101
%.tmp8103 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8102, i32 0, i32 1
%.tmp8104 = load i8*, i8** %.tmp8103
%.tmp8105 = call i32(i8*,...) @printf(i8* %.tmp8099, i8* %.tmp8104)
%.tmp8106 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp8106
br label %.if.end.8094
.if.false.8094:
br label %.if.end.8094
.if.end.8094:
%.tmp8107 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8108 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8107)
store %m2652$.AssignableInfo.type* %.tmp8108, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8109 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8110 = load i8, i8* @SCOPE_CONST
%.tmp8112 = getelementptr [5 x i8], [5 x i8]*@.str8111, i32 0, i32 0
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp8109, i8 %.tmp8110, i8* %.tmp8112)
%.tmp8113 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8114 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8113, i32 0, i32 4
%.tmp8115 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp8115, %m2652$.Type.type** %.tmp8114
%.tmp8116 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8117 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8116, i32 0, i32 4
%.tmp8118 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8117
%.tmp8119 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8118, i32 0, i32 0
%.tmp8121 = getelementptr [8 x i8], [8 x i8]*@.str8120, i32 0, i32 0
store i8* %.tmp8121, i8** %.tmp8119
br label %.if.end.8084
.if.false.8084:
%.tmp8122 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8123 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8122, i32 0, i32 6
%.tmp8124 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8123
%.tmp8125 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8124, i32 0, i32 0
%.tmp8126 = load i8*, i8** %.tmp8125
%.tmp8128 = getelementptr [17 x i8], [17 x i8]*@.str8127, i32 0, i32 0
%.tmp8129 = call i32(i8*,i8*) @strcmp(i8* %.tmp8126, i8* %.tmp8128)
%.tmp8130 = icmp eq i32 %.tmp8129, 0
br i1 %.tmp8130, label %.if.true.8131, label %.if.false.8131
.if.true.8131:
%.tmp8132 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8133 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8132)
store %m2652$.AssignableInfo.type* %.tmp8133, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8134 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8135 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8134, i32 0, i32 6
%.tmp8136 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8135
%.tmp8137 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8136, i32 0, i32 6
%.tmp8138 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8137
%.tmp8140 = getelementptr [12 x i8], [12 x i8]*@.str8139, i32 0, i32 0
%.tmp8141 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp8138, i8* %.tmp8140)
%dest.8142 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8141, %m980$.Node.type** %dest.8142
%.tmp8143 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8144 = load %m980$.Node.type*, %m980$.Node.type** %dest.8142
%.tmp8145 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp8143, %m980$.Node.type* %.tmp8144)
%var_info.8146 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp8145, %m2652$.AssignableInfo.type** %var_info.8146
%.tmp8147 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %var_info.8146
%.tmp8148 = icmp eq %m2652$.AssignableInfo.type* %.tmp8147, null
br i1 %.tmp8148, label %.if.true.8149, label %.if.false.8149
.if.true.8149:
%.tmp8150 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp8150
br label %.if.end.8149
.if.false.8149:
br label %.if.end.8149
.if.end.8149:
%.tmp8151 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %var_info.8146
%.tmp8152 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8151, i32 0, i32 4
%.tmp8153 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8152
%.tmp8154 = icmp eq %m2652$.Type.type* %.tmp8153, null
br i1 %.tmp8154, label %.if.true.8155, label %.if.false.8155
.if.true.8155:
%.tmp8156 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp8156
br label %.if.end.8155
.if.false.8155:
br label %.if.end.8155
.if.end.8155:
%.tmp8157 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8158 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %var_info.8146
%.tmp8159 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8158, i32 0, i32 4
%.tmp8160 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8159
%.tmp8161 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp8157, %m2652$.Type.type* %.tmp8160)
%var_type_repr.8162 = alloca i8*
store i8* %.tmp8161, i8** %var_type_repr.8162
%.tmp8163 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8164 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp8163, %m2652$.AssignableInfo.type* %.tmp8164)
%.tmp8165 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8166 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8165, i32 0, i32 4
%.tmp8167 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %var_info.8146
%.tmp8168 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8167, i32 0, i32 4
%.tmp8169 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8168
store %m2652$.Type.type* %.tmp8169, %m2652$.Type.type** %.tmp8166
%.tmp8171 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8172 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8171, i32 0, i32 6
%.tmp8173 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8172
%.tmp8174 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8173, i32 0, i32 6
%.tmp8175 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8174
%ptr.8176 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8175, %m980$.Node.type** %ptr.8176
br label %.for.start.8170
.for.start.8170:
%.tmp8177 = load %m980$.Node.type*, %m980$.Node.type** %ptr.8176
%.tmp8178 = load %m980$.Node.type*, %m980$.Node.type** %dest.8142
%.tmp8179 = icmp ne %m980$.Node.type* %.tmp8177, %.tmp8178
br i1 %.tmp8179, label %.for.continue.8170, label %.for.end.8170
.for.continue.8170:
%.tmp8180 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%type.8181 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp8180, %m2652$.Type.type** %type.8181
%.tmp8182 = load %m2652$.Type.type*, %m2652$.Type.type** %type.8181
%.tmp8183 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8182, i32 0, i32 3
%.tmp8184 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8185 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8184, i32 0, i32 4
%.tmp8186 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8185
store %m2652$.Type.type* %.tmp8186, %m2652$.Type.type** %.tmp8183
%.tmp8187 = load %m2652$.Type.type*, %m2652$.Type.type** %type.8181
%.tmp8188 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8187, i32 0, i32 0
%.tmp8190 = getelementptr [4 x i8], [4 x i8]*@.str8189, i32 0, i32 0
store i8* %.tmp8190, i8** %.tmp8188
%.tmp8191 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8192 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8191, i32 0, i32 4
%.tmp8193 = load %m2652$.Type.type*, %m2652$.Type.type** %type.8181
store %m2652$.Type.type* %.tmp8193, %m2652$.Type.type** %.tmp8192
%.tmp8194 = load %m980$.Node.type*, %m980$.Node.type** %ptr.8176
%.tmp8195 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8194, i32 0, i32 7
%.tmp8196 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8195
store %m980$.Node.type* %.tmp8196, %m980$.Node.type** %ptr.8176
br label %.for.start.8170
.for.end.8170:
%.tmp8197 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8198 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8197, i32 0, i32 6
%.tmp8199 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8198
%.tmp8200 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8199, i32 0, i32 6
%.tmp8201 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8200
%.tmp8202 = load %m980$.Node.type*, %m980$.Node.type** %dest.8142
%.tmp8203 = icmp ne %m980$.Node.type* %.tmp8201, %.tmp8202
br i1 %.tmp8203, label %.if.true.8204, label %.if.false.8204
.if.true.8204:
%.tmp8205 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8206 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8205, i32 0, i32 1
%.tmp8207 = load %m0$.File.type*, %m0$.File.type** %.tmp8206
%.tmp8209 = getelementptr [38 x i8], [38 x i8]*@.str8208, i32 0, i32 0
%.tmp8210 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8211 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp8210)
%.tmp8212 = load i8*, i8** %var_type_repr.8162
%.tmp8213 = load i8*, i8** %var_type_repr.8162
%.tmp8214 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %var_info.8146
%.tmp8215 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp8214)
%.tmp8216 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8207, i8* %.tmp8209, i8* %.tmp8211, i8* %.tmp8212, i8* %.tmp8213, i8* %.tmp8215)
br label %.if.end.8204
.if.false.8204:
%.tmp8217 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8218 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8217, i32 0, i32 4
%.tmp8219 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8218
%.tmp8220 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8219, i32 0, i32 0
%.tmp8221 = load i8*, i8** %.tmp8220
%.tmp8223 = getelementptr [9 x i8], [9 x i8]*@.str8222, i32 0, i32 0
%.tmp8224 = call i32(i8*,i8*) @strcmp(i8* %.tmp8221, i8* %.tmp8223)
%.tmp8225 = icmp eq i32 %.tmp8224, 0
br i1 %.tmp8225, label %.if.true.8226, label %.if.false.8226
.if.true.8226:
%.tmp8227 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %var_info.8146
store %m2652$.AssignableInfo.type* %.tmp8227, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8228 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%type.8229 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp8228, %m2652$.Type.type** %type.8229
%.tmp8230 = load %m2652$.Type.type*, %m2652$.Type.type** %type.8229
%.tmp8231 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8230, i32 0, i32 3
%.tmp8232 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8233 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8232, i32 0, i32 4
%.tmp8234 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8233
store %m2652$.Type.type* %.tmp8234, %m2652$.Type.type** %.tmp8231
%.tmp8235 = load %m2652$.Type.type*, %m2652$.Type.type** %type.8229
%.tmp8236 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8235, i32 0, i32 0
%.tmp8238 = getelementptr [4 x i8], [4 x i8]*@.str8237, i32 0, i32 0
store i8* %.tmp8238, i8** %.tmp8236
%.tmp8239 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8240 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8239, i32 0, i32 4
%.tmp8241 = load %m2652$.Type.type*, %m2652$.Type.type** %type.8229
store %m2652$.Type.type* %.tmp8241, %m2652$.Type.type** %.tmp8240
br label %.if.end.8226
.if.false.8226:
%.tmp8242 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8243 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8242, i32 0, i32 1
%.tmp8244 = load %m0$.File.type*, %m0$.File.type** %.tmp8243
%.tmp8246 = getelementptr [22 x i8], [22 x i8]*@.str8245, i32 0, i32 0
%.tmp8247 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8248 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp8247)
%.tmp8249 = load i8*, i8** %var_type_repr.8162
%.tmp8250 = load i8*, i8** %var_type_repr.8162
%.tmp8251 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %var_info.8146
%.tmp8252 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp8251)
%.tmp8253 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8244, i8* %.tmp8246, i8* %.tmp8248, i8* %.tmp8249, i8* %.tmp8250, i8* %.tmp8252)
br label %.if.end.8226
.if.end.8226:
br label %.if.end.8204
.if.end.8204:
br label %.if.end.8131
.if.false.8131:
%.tmp8254 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8255 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8254, i32 0, i32 6
%.tmp8256 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8255
%.tmp8257 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8256, i32 0, i32 0
%.tmp8258 = load i8*, i8** %.tmp8257
%.tmp8260 = getelementptr [8 x i8], [8 x i8]*@.str8259, i32 0, i32 0
%.tmp8261 = call i32(i8*,i8*) @strcmp(i8* %.tmp8258, i8* %.tmp8260)
%.tmp8262 = icmp eq i32 %.tmp8261, 0
br i1 %.tmp8262, label %.if.true.8263, label %.if.false.8263
.if.true.8263:
%.tmp8264 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8265 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8264)
store %m2652$.AssignableInfo.type* %.tmp8265, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8266 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8267 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8266, i32 0, i32 4
%.tmp8268 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp8268, %m2652$.Type.type** %.tmp8267
%.tmp8269 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8270 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8269, i32 0, i32 4
%.tmp8271 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8270
%.tmp8272 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8271, i32 0, i32 0
%.tmp8274 = getelementptr [5 x i8], [5 x i8]*@.str8273, i32 0, i32 0
store i8* %.tmp8274, i8** %.tmp8272
%.tmp8275 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8276 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8275, i32 0, i32 6
%.tmp8277 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8276
%.tmp8278 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8277, i32 0, i32 6
%.tmp8279 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8278
%.tmp8280 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8279, i32 0, i32 1
%.tmp8281 = load i8*, i8** %.tmp8280
%.tmp8283 = getelementptr [6 x i8], [6 x i8]*@.str8282, i32 0, i32 0
%.tmp8284 = call i32(i8*,i8*) @strcmp(i8* %.tmp8281, i8* %.tmp8283)
%.tmp8285 = icmp eq i32 %.tmp8284, 0
br i1 %.tmp8285, label %.if.true.8286, label %.if.false.8286
.if.true.8286:
%.tmp8287 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8288 = load i8, i8* @SCOPE_CONST
%.tmp8290 = getelementptr [2 x i8], [2 x i8]*@.str8289, i32 0, i32 0
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp8287, i8 %.tmp8288, i8* %.tmp8290)
br label %.if.end.8286
.if.false.8286:
%.tmp8291 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8292 = load i8, i8* @SCOPE_CONST
%.tmp8294 = getelementptr [2 x i8], [2 x i8]*@.str8293, i32 0, i32 0
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp8291, i8 %.tmp8292, i8* %.tmp8294)
br label %.if.end.8286
.if.end.8286:
br label %.if.end.8263
.if.false.8263:
%.tmp8295 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8296 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8295, i32 0, i32 6
%.tmp8297 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8296
%.tmp8298 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8297, i32 0, i32 0
%.tmp8299 = load i8*, i8** %.tmp8298
%.tmp8301 = getelementptr [8 x i8], [8 x i8]*@.str8300, i32 0, i32 0
%.tmp8302 = call i32(i8*,i8*) @strcmp(i8* %.tmp8299, i8* %.tmp8301)
%.tmp8303 = icmp eq i32 %.tmp8302, 0
br i1 %.tmp8303, label %.if.true.8304, label %.if.false.8304
.if.true.8304:
%.tmp8305 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8306 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8307 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8306, i32 0, i32 6
%.tmp8308 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8307
%.tmp8309 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8308, i32 0, i32 6
%.tmp8310 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8309
%.tmp8311 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_fn_call.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp8305, %m980$.Node.type* %.tmp8310)
store %m2652$.AssignableInfo.type* %.tmp8311, %m2652$.AssignableInfo.type** %assignable_info.8042
br label %.if.end.8304
.if.false.8304:
%.tmp8312 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8313 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8312, i32 0, i32 6
%.tmp8314 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8313
%.tmp8315 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8314, i32 0, i32 0
%.tmp8316 = load i8*, i8** %.tmp8315
%.tmp8318 = getelementptr [7 x i8], [7 x i8]*@.str8317, i32 0, i32 0
%.tmp8319 = call i32(i8*,i8*) @strcmp(i8* %.tmp8316, i8* %.tmp8318)
%.tmp8320 = icmp eq i32 %.tmp8319, 0
br i1 %.tmp8320, label %.if.true.8321, label %.if.false.8321
.if.true.8321:
%.tmp8322 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8323 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8324 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8323, i32 0, i32 6
%.tmp8325 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8324
%.tmp8326 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8325, i32 0, i32 1
%.tmp8327 = load i8*, i8** %.tmp8326
%.tmp8328 = call %m2652$.AssignableInfo.type*(%m2652$.CompilerCtx.type*,i8*) @m295$define_string.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.tmp8322, i8* %.tmp8327)
%string_info.8329 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp8328, %m2652$.AssignableInfo.type** %string_info.8329
%.tmp8330 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8331 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8330)
store %m2652$.AssignableInfo.type* %.tmp8331, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8332 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8333 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
call void(%m2652$.CompilerCtx.type*,%m2652$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2652$.CompilerCtx.typep.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp8332, %m2652$.AssignableInfo.type* %.tmp8333)
%.tmp8334 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8335 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %string_info.8329
%.tmp8336 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8335, i32 0, i32 4
%.tmp8337 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8336
%.tmp8338 = call i8*(%m2652$.CompilerCtx.type*,%m2652$.Type.type*) @m2653$repr.cp.m2652$.CompilerCtx.typep.m2652$.Type.typep(%m2652$.CompilerCtx.type* %.tmp8334, %m2652$.Type.type* %.tmp8337)
%str_tr.8339 = alloca i8*
store i8* %.tmp8338, i8** %str_tr.8339
%.tmp8340 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8341 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8340, i32 0, i32 1
%.tmp8342 = load %m0$.File.type*, %m0$.File.type** %.tmp8341
%.tmp8344 = getelementptr [44 x i8], [44 x i8]*@.str8343, i32 0, i32 0
%.tmp8345 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8346 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp8345)
%.tmp8347 = load i8*, i8** %str_tr.8339
%.tmp8348 = load i8*, i8** %str_tr.8339
%.tmp8349 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %string_info.8329
%.tmp8350 = call i8*(%m2652$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2652$.AssignableInfo.typep(%m2652$.AssignableInfo.type* %.tmp8349)
%.tmp8351 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8342, i8* %.tmp8344, i8* %.tmp8346, i8* %.tmp8347, i8* %.tmp8348, i8* %.tmp8350)
%.tmp8352 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8353 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8352, i32 0, i32 4
%.tmp8354 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp8354, %m2652$.Type.type** %.tmp8353
%.tmp8355 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8356 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8355, i32 0, i32 4
%.tmp8357 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8356
%.tmp8358 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8357, i32 0, i32 0
%.tmp8360 = getelementptr [4 x i8], [4 x i8]*@.str8359, i32 0, i32 0
store i8* %.tmp8360, i8** %.tmp8358
%.tmp8361 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8362 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8361, i32 0, i32 4
%.tmp8363 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8362
%.tmp8364 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8363, i32 0, i32 3
%.tmp8365 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp8365, %m2652$.Type.type** %.tmp8364
%.tmp8366 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8367 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8366, i32 0, i32 4
%.tmp8368 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8367
%.tmp8369 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8368, i32 0, i32 3
%.tmp8370 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8369
%.tmp8371 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8370, i32 0, i32 0
%.tmp8373 = getelementptr [4 x i8], [4 x i8]*@.str8372, i32 0, i32 0
store i8* %.tmp8373, i8** %.tmp8371
br label %.if.end.8321
.if.false.8321:
%.tmp8374 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8375 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8374, i32 0, i32 6
%.tmp8376 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8375
%.tmp8377 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8376, i32 0, i32 0
%.tmp8378 = load i8*, i8** %.tmp8377
%.tmp8380 = getelementptr [4 x i8], [4 x i8]*@.str8379, i32 0, i32 0
%.tmp8381 = call i32(i8*,i8*) @strcmp(i8* %.tmp8378, i8* %.tmp8380)
%.tmp8382 = icmp eq i32 %.tmp8381, 0
br i1 %.tmp8382, label %.if.true.8383, label %.if.false.8383
.if.true.8383:
%.tmp8384 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8385 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8384)
store %m2652$.AssignableInfo.type* %.tmp8385, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8386 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8387 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8386, i32 0, i32 6
%.tmp8388 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8387
%.tmp8389 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8388, i32 0, i32 1
%.tmp8390 = load i8*, i8** %.tmp8389
%.tmp8391 = call i32(i8*) @strlen(i8* %.tmp8390)
%chr_len.8392 = alloca i32
store i32 %.tmp8391, i32* %chr_len.8392
%.tmp8393 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8394 = load i8, i8* @SCOPE_CONST
%.tmp8396 = getelementptr [2 x i8], [2 x i8]*@.str8395, i32 0, i32 0
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp8393, i8 %.tmp8394, i8* %.tmp8396)
%.tmp8397 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8398 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8397, i32 0, i32 0
%.tmp8399 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8400 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8399, i32 0, i32 6
%.tmp8401 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8400
%.tmp8402 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8401, i32 0, i32 1
%.tmp8403 = load i8*, i8** %.tmp8402
%.tmp8404 = call i8*(i8*) @m2206$chr_to_llvm.cp.cp(i8* %.tmp8403)
store i8* %.tmp8404, i8** %.tmp8398
%.tmp8405 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8406 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8405, i32 0, i32 0
%.tmp8407 = load i8*, i8** %.tmp8406
%.tmp8408 = icmp eq i8* %.tmp8407, null
br i1 %.tmp8408, label %.if.true.8409, label %.if.false.8409
.if.true.8409:
%.tmp8410 = getelementptr i8*, i8** %err_buf.8045, i32 0
%.tmp8412 = getelementptr [22 x i8], [22 x i8]*@.str8411, i32 0, i32 0
%.tmp8413 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8414 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8413, i32 0, i32 6
%.tmp8415 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8414
%.tmp8416 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8415, i32 0, i32 1
%.tmp8417 = load i8*, i8** %.tmp8416
%.tmp8418 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8410, i8* %.tmp8412, i8* %.tmp8417)
%.tmp8419 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp8419
br label %.if.end.8409
.if.false.8409:
br label %.if.end.8409
.if.end.8409:
%.tmp8420 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8421 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8420, i32 0, i32 4
%.tmp8422 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp8422, %m2652$.Type.type** %.tmp8421
%.tmp8423 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8424 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8423, i32 0, i32 4
%.tmp8425 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8424
%.tmp8426 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8425, i32 0, i32 0
%.tmp8428 = getelementptr [4 x i8], [4 x i8]*@.str8427, i32 0, i32 0
store i8* %.tmp8428, i8** %.tmp8426
br label %.if.end.8383
.if.false.8383:
%.tmp8429 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8430 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8432 = getelementptr [40 x i8], [40 x i8]*@.str8431, i32 0, i32 0
%.tmp8433 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp8429, %m980$.Node.type* %.tmp8430, i8* %.tmp8432)
%.tmp8434 = load %m980$.Node.type*, %m980$.Node.type** %mono.8044
%.tmp8435 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8434, i32 0, i32 6
%.tmp8436 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8435
%.tmp8437 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8436, i32 0, i32 0
%.tmp8438 = load i8*, i8** %.tmp8437
%.tmp8439 = call i32(i8*,...) @printf(i8* %.tmp8433, i8* %.tmp8438)
%.tmp8440 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp8440
br label %.if.end.8383
.if.end.8383:
br label %.if.end.8321
.if.end.8321:
br label %.if.end.8304
.if.end.8304:
br label %.if.end.8263
.if.end.8263:
br label %.if.end.8131
.if.end.8131:
br label %.if.end.8084
.if.end.8084:
br label %.if.end.8056
.if.end.8056:
%.tmp8441 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8442 = icmp eq %m2652$.AssignableInfo.type* %.tmp8441, null
br i1 %.tmp8442, label %.if.true.8443, label %.if.false.8443
.if.true.8443:
%.tmp8444 = bitcast ptr null to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp8444
br label %.if.end.8443
.if.false.8443:
br label %.if.end.8443
.if.end.8443:
%.tmp8445 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8446 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8445, i32 0, i32 5
%.tmp8447 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8448 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8447, i32 0, i32 3
%.tmp8449 = load i32, i32* %.tmp8448
store i32 %.tmp8449, i32* %.tmp8446
%.tmp8450 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8451 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8450, i32 0, i32 6
%.tmp8452 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8453 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8452, i32 0, i32 4
%.tmp8454 = load i32, i32* %.tmp8453
store i32 %.tmp8454, i32* %.tmp8451
%.tmp8455 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %assignable_info.8042
%.tmp8456 = bitcast %m2652$.AssignableInfo.type* %.tmp8455 to %m2652$.AssignableInfo.type*
ret %m2652$.AssignableInfo.type* %.tmp8456
}
define i8* @m295$type_abbr.cp.m2652$.Type.typep(%m2652$.Type.type* %.type.arg) {
%type = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.type.arg, %m2652$.Type.type** %type
%.tmp8457 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8458 = icmp ne %m2652$.Type.type* %.tmp8457, null
%.tmp8460 = getelementptr [22 x i8], [22 x i8]*@.str8459, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8458, i8* %.tmp8460)
%.tmp8461 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8462 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8461, i32 0, i32 0
%.tmp8463 = load i8*, i8** %.tmp8462
%.tmp8464 = icmp ne i8* %.tmp8463, null
%.tmp8466 = getelementptr [59 x i8], [59 x i8]*@.str8465, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8464, i8* %.tmp8466)
%.tmp8467 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8468 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8467, i32 0, i32 0
%.tmp8469 = load i8*, i8** %.tmp8468
%.tmp8471 = getelementptr [4 x i8], [4 x i8]*@.str8470, i32 0, i32 0
%.tmp8472 = call i32(i8*,i8*) @strcmp(i8* %.tmp8469, i8* %.tmp8471)
%.tmp8473 = icmp eq i32 %.tmp8472, 0
br i1 %.tmp8473, label %.if.true.8474, label %.if.false.8474
.if.true.8474:
%.tmp8476 = getelementptr [2 x i8], [2 x i8]*@.str8475, i32 0, i32 0
ret i8* %.tmp8476
br label %.if.end.8474
.if.false.8474:
%.tmp8477 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8478 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8477, i32 0, i32 0
%.tmp8479 = load i8*, i8** %.tmp8478
%.tmp8481 = getelementptr [5 x i8], [5 x i8]*@.str8480, i32 0, i32 0
%.tmp8482 = call i32(i8*,i8*) @strcmp(i8* %.tmp8479, i8* %.tmp8481)
%.tmp8483 = icmp eq i32 %.tmp8482, 0
br i1 %.tmp8483, label %.if.true.8484, label %.if.false.8484
.if.true.8484:
%.tmp8486 = getelementptr [2 x i8], [2 x i8]*@.str8485, i32 0, i32 0
ret i8* %.tmp8486
br label %.if.end.8484
.if.false.8484:
%.tmp8487 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8488 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8487, i32 0, i32 0
%.tmp8489 = load i8*, i8** %.tmp8488
%.tmp8491 = getelementptr [5 x i8], [5 x i8]*@.str8490, i32 0, i32 0
%.tmp8492 = call i32(i8*,i8*) @strcmp(i8* %.tmp8489, i8* %.tmp8491)
%.tmp8493 = icmp eq i32 %.tmp8492, 0
br i1 %.tmp8493, label %.if.true.8494, label %.if.false.8494
.if.true.8494:
%.tmp8496 = getelementptr [2 x i8], [2 x i8]*@.str8495, i32 0, i32 0
ret i8* %.tmp8496
br label %.if.end.8494
.if.false.8494:
%.tmp8497 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8498 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8497, i32 0, i32 0
%.tmp8499 = load i8*, i8** %.tmp8498
%.tmp8501 = getelementptr [4 x i8], [4 x i8]*@.str8500, i32 0, i32 0
%.tmp8502 = call i32(i8*,i8*) @strcmp(i8* %.tmp8499, i8* %.tmp8501)
%.tmp8503 = icmp eq i32 %.tmp8502, 0
br i1 %.tmp8503, label %.if.true.8504, label %.if.false.8504
.if.true.8504:
%.tmp8506 = getelementptr [2 x i8], [2 x i8]*@.str8505, i32 0, i32 0
ret i8* %.tmp8506
br label %.if.end.8504
.if.false.8504:
%.tmp8507 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8508 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8507, i32 0, i32 0
%.tmp8509 = load i8*, i8** %.tmp8508
%.tmp8511 = getelementptr [4 x i8], [4 x i8]*@.str8510, i32 0, i32 0
%.tmp8512 = call i32(i8*,i8*) @strcmp(i8* %.tmp8509, i8* %.tmp8511)
%.tmp8513 = icmp eq i32 %.tmp8512, 0
br i1 %.tmp8513, label %.if.true.8514, label %.if.false.8514
.if.true.8514:
%buf.8515 = alloca i8*
store i8* null, i8** %buf.8515
%.tmp8516 = getelementptr i8*, i8** %buf.8515, i32 0
%.tmp8518 = getelementptr [4 x i8], [4 x i8]*@.str8517, i32 0, i32 0
%.tmp8519 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8520 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8519, i32 0, i32 3
%.tmp8521 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8520
%.tmp8522 = call i8*(%m2652$.Type.type*) @m295$type_abbr.cp.m2652$.Type.typep(%m2652$.Type.type* %.tmp8521)
%.tmp8523 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8516, i8* %.tmp8518, i8* %.tmp8522)
%.tmp8524 = load i8*, i8** %buf.8515
ret i8* %.tmp8524
br label %.if.end.8514
.if.false.8514:
%.tmp8525 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8526 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8525, i32 0, i32 0
%.tmp8527 = load i8*, i8** %.tmp8526
%.tmp8529 = getelementptr [10 x i8], [10 x i8]*@.str8528, i32 0, i32 0
%.tmp8530 = call i32(i8*,i8*) @strcmp(i8* %.tmp8527, i8* %.tmp8529)
%.tmp8531 = icmp eq i32 %.tmp8530, 0
br i1 %.tmp8531, label %.if.true.8532, label %.if.false.8532
.if.true.8532:
%.tmp8533 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8534 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8533, i32 0, i32 2
%.tmp8535 = load i8*, i8** %.tmp8534
ret i8* %.tmp8535
br label %.if.end.8532
.if.false.8532:
%.tmp8536 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8537 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8536, i32 0, i32 0
%.tmp8538 = load i8*, i8** %.tmp8537
%.tmp8540 = getelementptr [7 x i8], [7 x i8]*@.str8539, i32 0, i32 0
%.tmp8541 = call i32(i8*,i8*) @strcmp(i8* %.tmp8538, i8* %.tmp8540)
%.tmp8542 = icmp eq i32 %.tmp8541, 0
br i1 %.tmp8542, label %.if.true.8543, label %.if.false.8543
.if.true.8543:
%.tmp8545 = getelementptr [2 x i8], [2 x i8]*@.str8544, i32 0, i32 0
%buf.8546 = alloca i8*
store i8* %.tmp8545, i8** %buf.8546
%.tmp8548 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8549 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8548, i32 0, i32 3
%.tmp8550 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8549
%t.8551 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp8550, %m2652$.Type.type** %t.8551
br label %.for.start.8547
.for.start.8547:
%.tmp8552 = load %m2652$.Type.type*, %m2652$.Type.type** %t.8551
%.tmp8553 = icmp ne %m2652$.Type.type* %.tmp8552, null
br i1 %.tmp8553, label %.for.continue.8547, label %.for.end.8547
.for.continue.8547:
%.tmp8554 = getelementptr i8*, i8** %buf.8546, i32 0
%.tmp8556 = getelementptr [5 x i8], [5 x i8]*@.str8555, i32 0, i32 0
%.tmp8557 = load i8*, i8** %buf.8546
%.tmp8558 = load %m2652$.Type.type*, %m2652$.Type.type** %t.8551
%.tmp8559 = call i8*(%m2652$.Type.type*) @m295$type_abbr.cp.m2652$.Type.typep(%m2652$.Type.type* %.tmp8558)
%.tmp8560 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8554, i8* %.tmp8556, i8* %.tmp8557, i8* %.tmp8559)
%.tmp8561 = load %m2652$.Type.type*, %m2652$.Type.type** %t.8551
%.tmp8562 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8561, i32 0, i32 4
%.tmp8563 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8562
store %m2652$.Type.type* %.tmp8563, %m2652$.Type.type** %t.8551
br label %.for.start.8547
.for.end.8547:
%.tmp8564 = load i8*, i8** %buf.8546
ret i8* %.tmp8564
br label %.if.end.8543
.if.false.8543:
%.tmp8565 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8566 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8565, i32 0, i32 0
%.tmp8567 = load i8*, i8** %.tmp8566
%.tmp8569 = getelementptr [9 x i8], [9 x i8]*@.str8568, i32 0, i32 0
%.tmp8570 = call i32(i8*,i8*) @strcmp(i8* %.tmp8567, i8* %.tmp8569)
%.tmp8571 = icmp eq i32 %.tmp8570, 0
br i1 %.tmp8571, label %.if.true.8572, label %.if.false.8572
.if.true.8572:
%.tmp8574 = getelementptr [2 x i8], [2 x i8]*@.str8573, i32 0, i32 0
ret i8* %.tmp8574
br label %.if.end.8572
.if.false.8572:
%.tmp8575 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8576 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8575, i32 0, i32 0
%.tmp8577 = load i8*, i8** %.tmp8576
%.tmp8579 = getelementptr [6 x i8], [6 x i8]*@.str8578, i32 0, i32 0
%.tmp8580 = call i32(i8*,i8*) @strcmp(i8* %.tmp8577, i8* %.tmp8579)
%.tmp8581 = icmp eq i32 %.tmp8580, 0
br i1 %.tmp8581, label %.if.true.8582, label %.if.false.8582
.if.true.8582:
%.tmp8584 = getelementptr [2 x i8], [2 x i8]*@.str8583, i32 0, i32 0
ret i8* %.tmp8584
br label %.if.end.8582
.if.false.8582:
%.tmp8586 = getelementptr [45 x i8], [45 x i8]*@.str8585, i32 0, i32 0
%.tmp8587 = load %m2652$.Type.type*, %m2652$.Type.type** %type
%.tmp8588 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8587, i32 0, i32 0
%.tmp8589 = load i8*, i8** %.tmp8588
%.tmp8590 = call i32(i8*,...) @printf(i8* %.tmp8586, i8* %.tmp8589)
br label %.if.end.8582
.if.end.8582:
br label %.if.end.8572
.if.end.8572:
br label %.if.end.8543
.if.end.8543:
br label %.if.end.8532
.if.end.8532:
br label %.if.end.8514
.if.end.8514:
br label %.if.end.8504
.if.end.8504:
br label %.if.end.8494
.if.end.8494:
br label %.if.end.8484
.if.end.8484:
br label %.if.end.8474
.if.end.8474:
%.tmp8591 = bitcast ptr null to i8*
ret i8* %.tmp8591
}
define %m2652$.AssignableInfo.type* @m295$define_string.m2652$.AssignableInfo.typep.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp8592 = bitcast ptr null to %m980$.Node.type*
%.tmp8593 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8592)
%info.8594 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp8593, %m2652$.AssignableInfo.type** %info.8594
%tmp_buff.8595 = alloca i8*
store i8* null, i8** %tmp_buff.8595
%.tmp8596 = getelementptr i8*, i8** %tmp_buff.8595, i32 0
%.tmp8598 = getelementptr [7 x i8], [7 x i8]*@.str8597, i32 0, i32 0
%.tmp8599 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8600 = call i32(%m2652$.CompilerCtx.type*) @m295$new_uid.i.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.tmp8599)
%.tmp8601 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8596, i8* %.tmp8598, i32 %.tmp8600)
%.tmp8602 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.8594
%.tmp8603 = load i8, i8* @SCOPE_GLOBAL
%.tmp8604 = load i8*, i8** %tmp_buff.8595
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp8602, i8 %.tmp8603, i8* %.tmp8604)
%.tmp8605 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.8594
%.tmp8606 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8605, i32 0, i32 4
%.tmp8607 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp8607, %m2652$.Type.type** %.tmp8606
%.tmp8608 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.8594
%.tmp8609 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8608, i32 0, i32 4
%.tmp8610 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8609
%.tmp8611 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8610, i32 0, i32 0
%.tmp8613 = getelementptr [6 x i8], [6 x i8]*@.str8612, i32 0, i32 0
store i8* %.tmp8613, i8** %.tmp8611
%.tmp8614 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.8594
%.tmp8615 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8614, i32 0, i32 4
%.tmp8616 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8615
%.tmp8617 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8616, i32 0, i32 3
%.tmp8618 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp8618, %m2652$.Type.type** %.tmp8617
%.tmp8619 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.8594
%.tmp8620 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8619, i32 0, i32 4
%.tmp8621 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8620
%.tmp8622 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8621, i32 0, i32 3
%.tmp8623 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8622
%.tmp8624 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8623, i32 0, i32 0
%.tmp8626 = getelementptr [4 x i8], [4 x i8]*@.str8625, i32 0, i32 0
store i8* %.tmp8626, i8** %.tmp8624
%.tmp8627 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.8594
%.tmp8628 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8627, i32 0, i32 4
%.tmp8629 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8628
%.tmp8630 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8629, i32 0, i32 3
%.tmp8631 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8630
%.tmp8632 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8631, i32 0, i32 4
%.tmp8633 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp8633, %m2652$.Type.type** %.tmp8632
%.tmp8634 = load i8*, i8** %text
%.tmp8635 = call i8*(i8*) @m2206$string_to_llvm.cp.cp(i8* %.tmp8634)
%identifier.8636 = alloca i8*
store i8* %.tmp8635, i8** %identifier.8636
%.tmp8637 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.8594
%.tmp8638 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8637, i32 0, i32 4
%.tmp8639 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8638
%.tmp8640 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8639, i32 0, i32 3
%.tmp8641 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8640
%.tmp8642 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8641, i32 0, i32 4
%.tmp8643 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8642
%.tmp8644 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8643, i32 0, i32 0
%.tmp8645 = getelementptr i8*, i8** %.tmp8644, i32 0
%.tmp8647 = getelementptr [3 x i8], [3 x i8]*@.str8646, i32 0, i32 0
%.tmp8648 = load i8*, i8** %identifier.8636
%.tmp8649 = call i32(i8*) @m2206$llvm_str_len.i.cp(i8* %.tmp8648)
%.tmp8650 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8645, i8* %.tmp8647, i32 %.tmp8649)
%.tmp8651 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8652 = load i8*, i8** %identifier.8636
%.tmp8654 = getelementptr [7 x i8], [7 x i8]*@.str8653, i32 0, i32 0
%.tmp8655 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.8594
call void(%m2652$.CompilerCtx.type*,i8*,i8*,%m2652$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2652$.CompilerCtx.typep.cp.cp.m2652$.AssignableInfo.typep.b.b(%m2652$.CompilerCtx.type* %.tmp8651, i8* %.tmp8652, i8* %.tmp8654, %m2652$.AssignableInfo.type* %.tmp8655, i1 0, i1 0)
%.tmp8656 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.8594
ret %m2652$.AssignableInfo.type* %.tmp8656
}
define void @m295$define_global.v.m2652$.CompilerCtx.typep.cp.cp.m2652$.AssignableInfo.typep.b.b(%m2652$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg, i8* %.type.arg, %m2652$.AssignableInfo.type* %.info.arg, i1 %.weak.arg, i1 %.compiled.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%type = alloca i8*
store i8* %.type.arg, i8** %type
%info = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.info.arg, %m2652$.AssignableInfo.type** %info
%weak = alloca i1
store i1 %.weak.arg, i1* %weak
%compiled = alloca i1
store i1 %.compiled.arg, i1* %compiled
%.tmp8657 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* null, i32 1
%.tmp8658 = ptrtoint %m2652$.GlobalName.type* %.tmp8657 to i32
%.tmp8659 = call i8*(i32) @malloc(i32 %.tmp8658)
%.tmp8660 = bitcast i8* %.tmp8659 to %m2652$.GlobalName.type*
%global.8661 = alloca %m2652$.GlobalName.type*
store %m2652$.GlobalName.type* %.tmp8660, %m2652$.GlobalName.type** %global.8661
%.tmp8662 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %global.8661
%.tmp8663 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp8662, i32 0, i32 0
%.tmp8664 = load i8*, i8** %id
store i8* %.tmp8664, i8** %.tmp8663
%.tmp8665 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %global.8661
%.tmp8666 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp8665, i32 0, i32 1
%.tmp8667 = load i8*, i8** %type
store i8* %.tmp8667, i8** %.tmp8666
%.tmp8668 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %global.8661
%.tmp8669 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp8668, i32 0, i32 4
%.tmp8670 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info
store %m2652$.AssignableInfo.type* %.tmp8670, %m2652$.AssignableInfo.type** %.tmp8669
%.tmp8671 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %global.8661
%.tmp8672 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp8671, i32 0, i32 2
%.tmp8673 = load i1, i1* %compiled
store i1 %.tmp8673, i1* %.tmp8672
%.tmp8674 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %global.8661
%.tmp8675 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp8674, i32 0, i32 5
store %m2652$.GlobalName.type* null, %m2652$.GlobalName.type** %.tmp8675
%.tmp8676 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %global.8661
%.tmp8677 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp8676, i32 0, i32 3
%.tmp8678 = load i1, i1* %weak
store i1 %.tmp8678, i1* %.tmp8677
%.tmp8679 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8680 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %global.8661
call void(%m2652$.CompilerCtx.type*,%m2652$.GlobalName.type*) @m295$append_global.v.m2652$.CompilerCtx.typep.m2652$.GlobalName.typep(%m2652$.CompilerCtx.type* %.tmp8679, %m2652$.GlobalName.type* %.tmp8680)
ret void
}
define void @m295$define_module.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.cp(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%mod = alloca %m980$.Node.type*
store %m980$.Node.type* %.mod.arg, %m980$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp8681 = load %m980$.Node.type*, %m980$.Node.type** %mod
%.tmp8682 = call %m2652$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2652$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8681)
%info.8683 = alloca %m2652$.AssignableInfo.type*
store %m2652$.AssignableInfo.type* %.tmp8682, %m2652$.AssignableInfo.type** %info.8683
%.tmp8684 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.8683
%.tmp8685 = load i8, i8* @SCOPE_CONST
%.tmp8686 = load i8*, i8** %abspath
call void(%m2652$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2652$.AssignableInfo.typep.c.cp(%m2652$.AssignableInfo.type* %.tmp8684, i8 %.tmp8685, i8* %.tmp8686)
%.tmp8687 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.8683
%.tmp8688 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8687, i32 0, i32 3
%.tmp8690 = getelementptr [7 x i8], [7 x i8]*@.str8689, i32 0, i32 0
store i8* %.tmp8690, i8** %.tmp8688
%.tmp8691 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.8683
%.tmp8692 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8691, i32 0, i32 4
store %m2652$.Type.type* null, %m2652$.Type.type** %.tmp8692
%.tmp8693 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8694 = load %m980$.Node.type*, %m980$.Node.type** %mod
%.tmp8695 = load i8*, i8** %as_name
%.tmp8696 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %info.8683
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2652$.AssignableInfo.type*) @m295$define_assignable.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp.m2652$.AssignableInfo.typep(%m2652$.CompilerCtx.type* %.tmp8693, %m980$.Node.type* %.tmp8694, i8* %.tmp8695, %m2652$.AssignableInfo.type* %.tmp8696)
ret void
}
define void @m295$append_anon_fn.v.m2652$.CompilerCtx.typep.cp(%m2652$.CompilerCtx.type* %.ctx.arg, i8* %.code.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%code = alloca i8*
store i8* %.code.arg, i8** %code
%.tmp8697 = getelementptr %m2652$.AnonFn.type, %m2652$.AnonFn.type* null, i32 1
%.tmp8698 = ptrtoint %m2652$.AnonFn.type* %.tmp8697 to i32
%.tmp8699 = call i8*(i32) @malloc(i32 %.tmp8698)
%.tmp8700 = bitcast i8* %.tmp8699 to %m2652$.AnonFn.type*
%fn.8701 = alloca %m2652$.AnonFn.type*
store %m2652$.AnonFn.type* %.tmp8700, %m2652$.AnonFn.type** %fn.8701
%.tmp8702 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %fn.8701
%.tmp8703 = getelementptr %m2652$.AnonFn.type, %m2652$.AnonFn.type* %.tmp8702, i32 0, i32 0
%.tmp8704 = load i8*, i8** %code
store i8* %.tmp8704, i8** %.tmp8703
%.tmp8705 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8706 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8705, i32 0, i32 8
%.tmp8707 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %.tmp8706
%.tmp8708 = icmp eq %m2652$.AnonFn.type* %.tmp8707, null
br i1 %.tmp8708, label %.if.true.8709, label %.if.false.8709
.if.true.8709:
%.tmp8710 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8711 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8710, i32 0, i32 8
%.tmp8712 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %fn.8701
store %m2652$.AnonFn.type* %.tmp8712, %m2652$.AnonFn.type** %.tmp8711
%.tmp8713 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %fn.8701
%.tmp8714 = getelementptr %m2652$.AnonFn.type, %m2652$.AnonFn.type* %.tmp8713, i32 0, i32 1
store %m2652$.AnonFn.type* null, %m2652$.AnonFn.type** %.tmp8714
br label %.if.end.8709
.if.false.8709:
%.tmp8715 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8716 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8715, i32 0, i32 8
%.tmp8717 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %.tmp8716
%last.8718 = alloca %m2652$.AnonFn.type*
store %m2652$.AnonFn.type* %.tmp8717, %m2652$.AnonFn.type** %last.8718
br label %.for.start.8719
.for.start.8719:
%.tmp8720 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %last.8718
%.tmp8721 = getelementptr %m2652$.AnonFn.type, %m2652$.AnonFn.type* %.tmp8720, i32 0, i32 1
%.tmp8722 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %.tmp8721
%.tmp8723 = icmp ne %m2652$.AnonFn.type* %.tmp8722, null
br i1 %.tmp8723, label %.for.continue.8719, label %.for.end.8719
.for.continue.8719:
%.tmp8724 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %last.8718
%.tmp8725 = getelementptr %m2652$.AnonFn.type, %m2652$.AnonFn.type* %.tmp8724, i32 0, i32 1
%.tmp8726 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %.tmp8725
store %m2652$.AnonFn.type* %.tmp8726, %m2652$.AnonFn.type** %last.8718
br label %.for.start.8719
.for.end.8719:
%.tmp8727 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %last.8718
%.tmp8728 = getelementptr %m2652$.AnonFn.type, %m2652$.AnonFn.type* %.tmp8727, i32 0, i32 1
%.tmp8729 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %fn.8701
store %m2652$.AnonFn.type* %.tmp8729, %m2652$.AnonFn.type** %.tmp8728
br label %.if.end.8709
.if.end.8709:
ret void
}
define void @m295$compile_anon_fn.v.m2652$.CompilerCtx.typep(%m2652$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%.tmp8731 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8732 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8731, i32 0, i32 8
%.tmp8733 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %.tmp8732
%fn.8734 = alloca %m2652$.AnonFn.type*
store %m2652$.AnonFn.type* %.tmp8733, %m2652$.AnonFn.type** %fn.8734
br label %.for.start.8730
.for.start.8730:
%.tmp8735 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %fn.8734
%.tmp8736 = icmp ne %m2652$.AnonFn.type* %.tmp8735, null
br i1 %.tmp8736, label %.for.continue.8730, label %.for.end.8730
.for.continue.8730:
%.tmp8737 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8738 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8737, i32 0, i32 1
%.tmp8739 = load %m0$.File.type*, %m0$.File.type** %.tmp8738
%.tmp8741 = getelementptr [4 x i8], [4 x i8]*@.str8740, i32 0, i32 0
%.tmp8742 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %fn.8734
%.tmp8743 = getelementptr %m2652$.AnonFn.type, %m2652$.AnonFn.type* %.tmp8742, i32 0, i32 0
%.tmp8744 = load i8*, i8** %.tmp8743
%.tmp8745 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8739, i8* %.tmp8741, i8* %.tmp8744)
%.tmp8746 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %fn.8734
%.tmp8747 = getelementptr %m2652$.AnonFn.type, %m2652$.AnonFn.type* %.tmp8746, i32 0, i32 1
%.tmp8748 = load %m2652$.AnonFn.type*, %m2652$.AnonFn.type** %.tmp8747
store %m2652$.AnonFn.type* %.tmp8748, %m2652$.AnonFn.type** %fn.8734
br label %.for.start.8730
.for.end.8730:
%.tmp8749 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8750 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8749, i32 0, i32 8
store %m2652$.AnonFn.type* null, %m2652$.AnonFn.type** %.tmp8750
ret void
}
define void @m295$append_global.v.m2652$.CompilerCtx.typep.m2652$.GlobalName.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%g = alloca %m2652$.GlobalName.type*
store %m2652$.GlobalName.type* %.g.arg, %m2652$.GlobalName.type** %g
%.tmp8751 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8752 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8751, i32 0, i32 3
%.tmp8753 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %.tmp8752
%.tmp8754 = icmp eq %m2652$.GlobalName.type* %.tmp8753, null
br i1 %.tmp8754, label %.if.true.8755, label %.if.false.8755
.if.true.8755:
%.tmp8756 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8757 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8756, i32 0, i32 3
%.tmp8758 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g
store %m2652$.GlobalName.type* %.tmp8758, %m2652$.GlobalName.type** %.tmp8757
ret void
br label %.if.end.8755
.if.false.8755:
br label %.if.end.8755
.if.end.8755:
%.tmp8759 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8760 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8759, i32 0, i32 3
%.tmp8761 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %.tmp8760
%last_global.8762 = alloca %m2652$.GlobalName.type*
store %m2652$.GlobalName.type* %.tmp8761, %m2652$.GlobalName.type** %last_global.8762
%.tmp8764 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8765 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8764, i32 0, i32 3
%.tmp8766 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %.tmp8765
%curr_global.8767 = alloca %m2652$.GlobalName.type*
store %m2652$.GlobalName.type* %.tmp8766, %m2652$.GlobalName.type** %curr_global.8767
br label %.for.start.8763
.for.start.8763:
%.tmp8768 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %curr_global.8767
%.tmp8769 = icmp ne %m2652$.GlobalName.type* %.tmp8768, null
br i1 %.tmp8769, label %.for.continue.8763, label %.for.end.8763
.for.continue.8763:
%.tmp8770 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %curr_global.8767
%.tmp8771 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp8770, i32 0, i32 4
%.tmp8772 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %.tmp8771
%.tmp8773 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8772, i32 0, i32 0
%.tmp8774 = load i8*, i8** %.tmp8773
%.tmp8775 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g
%.tmp8776 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp8775, i32 0, i32 4
%.tmp8777 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %.tmp8776
%.tmp8778 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp8777, i32 0, i32 0
%.tmp8779 = load i8*, i8** %.tmp8778
%.tmp8780 = call i32(i8*,i8*) @strcmp(i8* %.tmp8774, i8* %.tmp8779)
%.tmp8781 = icmp eq i32 %.tmp8780, 0
br i1 %.tmp8781, label %.if.true.8782, label %.if.false.8782
.if.true.8782:
ret void
br label %.if.end.8782
.if.false.8782:
br label %.if.end.8782
.if.end.8782:
%.tmp8783 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %curr_global.8767
store %m2652$.GlobalName.type* %.tmp8783, %m2652$.GlobalName.type** %last_global.8762
%.tmp8784 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %curr_global.8767
%.tmp8785 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp8784, i32 0, i32 5
%.tmp8786 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %.tmp8785
store %m2652$.GlobalName.type* %.tmp8786, %m2652$.GlobalName.type** %curr_global.8767
br label %.for.start.8763
.for.end.8763:
%.tmp8787 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %last_global.8762
%.tmp8788 = getelementptr %m2652$.GlobalName.type, %m2652$.GlobalName.type* %.tmp8787, i32 0, i32 5
%.tmp8789 = load %m2652$.GlobalName.type*, %m2652$.GlobalName.type** %g
store %m2652$.GlobalName.type* %.tmp8789, %m2652$.GlobalName.type** %.tmp8788
ret void
}
define void @m295$append_error.v.m2652$.CompilerCtx.typep.m296$.Error.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m296$.Error.type* %.e.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp8790 = getelementptr %m2652$.ErrorList.type, %m2652$.ErrorList.type* null, i32 1
%.tmp8791 = ptrtoint %m2652$.ErrorList.type* %.tmp8790 to i32
%.tmp8792 = call i8*(i32) @malloc(i32 %.tmp8791)
%.tmp8793 = bitcast i8* %.tmp8792 to %m2652$.ErrorList.type*
%new_err.8794 = alloca %m2652$.ErrorList.type*
store %m2652$.ErrorList.type* %.tmp8793, %m2652$.ErrorList.type** %new_err.8794
%.tmp8795 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %new_err.8794
%.tmp8796 = getelementptr %m2652$.ErrorList.type, %m2652$.ErrorList.type* %.tmp8795, i32 0, i32 2
store i1 0, i1* %.tmp8796
%.tmp8797 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %new_err.8794
%.tmp8798 = getelementptr %m2652$.ErrorList.type, %m2652$.ErrorList.type* %.tmp8797, i32 0, i32 0
%.tmp8799 = load %m296$.Error.type*, %m296$.Error.type** %e
store %m296$.Error.type* %.tmp8799, %m296$.Error.type** %.tmp8798
%.tmp8800 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %new_err.8794
%.tmp8801 = getelementptr %m2652$.ErrorList.type, %m2652$.ErrorList.type* %.tmp8800, i32 0, i32 1
store %m2652$.ErrorList.type* null, %m2652$.ErrorList.type** %.tmp8801
%.tmp8802 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8803 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8802, i32 0, i32 2
%.tmp8804 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %.tmp8803
%.tmp8805 = icmp eq %m2652$.ErrorList.type* %.tmp8804, null
br i1 %.tmp8805, label %.if.true.8806, label %.if.false.8806
.if.true.8806:
%.tmp8807 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8808 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8807, i32 0, i32 2
%.tmp8809 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %new_err.8794
store %m2652$.ErrorList.type* %.tmp8809, %m2652$.ErrorList.type** %.tmp8808
ret void
br label %.if.end.8806
.if.false.8806:
br label %.if.end.8806
.if.end.8806:
%last.8810 = alloca %m2652$.ErrorList.type*
store %m2652$.ErrorList.type* null, %m2652$.ErrorList.type** %last.8810
%.tmp8812 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8813 = getelementptr %m2652$.CompilerCtx.type, %m2652$.CompilerCtx.type* %.tmp8812, i32 0, i32 2
%.tmp8814 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %.tmp8813
store %m2652$.ErrorList.type* %.tmp8814, %m2652$.ErrorList.type** %last.8810
br label %.for.start.8811
.for.start.8811:
%.tmp8815 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %last.8810
%.tmp8816 = getelementptr %m2652$.ErrorList.type, %m2652$.ErrorList.type* %.tmp8815, i32 0, i32 1
%.tmp8817 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %.tmp8816
%.tmp8818 = icmp ne %m2652$.ErrorList.type* %.tmp8817, null
br i1 %.tmp8818, label %.for.continue.8811, label %.for.end.8811
.for.continue.8811:
%.tmp8819 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %last.8810
%.tmp8820 = getelementptr %m2652$.ErrorList.type, %m2652$.ErrorList.type* %.tmp8819, i32 0, i32 1
%.tmp8821 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %.tmp8820
store %m2652$.ErrorList.type* %.tmp8821, %m2652$.ErrorList.type** %last.8810
br label %.for.start.8811
.for.end.8811:
%.tmp8822 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %last.8810
%.tmp8823 = getelementptr %m2652$.ErrorList.type, %m2652$.ErrorList.type* %.tmp8822, i32 0, i32 1
%.tmp8824 = load %m2652$.ErrorList.type*, %m2652$.ErrorList.type** %new_err.8794
store %m2652$.ErrorList.type* %.tmp8824, %m2652$.ErrorList.type** %.tmp8823
ret void
}
define i8* @m295$syn_function_name.cp.m980$.Node.typep(%m980$.Node.type* %.stmt.arg) {
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp8825 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp8826 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8825, i32 0, i32 6
%.tmp8827 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8826
%.tmp8828 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8827, i32 0, i32 7
%.tmp8829 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8828
%.tmp8830 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8829, i32 0, i32 1
%.tmp8831 = load i8*, i8** %.tmp8830
ret i8* %.tmp8831
}
define %m980$.Node.type* @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m980$.Node.type*
store %m980$.Node.type* %.node.arg, %m980$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp8833 = load %m980$.Node.type*, %m980$.Node.type** %node
%n.8834 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8833, %m980$.Node.type** %n.8834
br label %.for.start.8832
.for.start.8832:
%.tmp8835 = load %m980$.Node.type*, %m980$.Node.type** %n.8834
%.tmp8836 = icmp ne %m980$.Node.type* %.tmp8835, null
br i1 %.tmp8836, label %.for.continue.8832, label %.for.end.8832
.for.continue.8832:
%.tmp8837 = load %m980$.Node.type*, %m980$.Node.type** %n.8834
%.tmp8838 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8837, i32 0, i32 0
%.tmp8839 = load i8*, i8** %.tmp8838
%.tmp8840 = load i8*, i8** %type
%.tmp8841 = call i32(i8*,i8*) @strcmp(i8* %.tmp8839, i8* %.tmp8840)
%.tmp8842 = icmp eq i32 %.tmp8841, 0
br i1 %.tmp8842, label %.if.true.8843, label %.if.false.8843
.if.true.8843:
%.tmp8844 = load %m980$.Node.type*, %m980$.Node.type** %n.8834
ret %m980$.Node.type* %.tmp8844
br label %.if.end.8843
.if.false.8843:
br label %.if.end.8843
.if.end.8843:
%.tmp8845 = load %m980$.Node.type*, %m980$.Node.type** %n.8834
%.tmp8846 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8845, i32 0, i32 7
%.tmp8847 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8846
store %m980$.Node.type* %.tmp8847, %m980$.Node.type** %n.8834
br label %.for.start.8832
.for.end.8832:
%.tmp8848 = bitcast ptr null to %m980$.Node.type*
ret %m980$.Node.type* %.tmp8848
}
define %m2652$.Type.type* @m295$syn_function_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp8849 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%function_type.8850 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp8849, %m2652$.Type.type** %function_type.8850
%.tmp8851 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8852 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp8853 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8852, i32 0, i32 6
%.tmp8854 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8853
%.tmp8855 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp8851, %m980$.Node.type* %.tmp8854)
%return_value_type.8856 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp8855, %m2652$.Type.type** %return_value_type.8856
%.tmp8857 = load %m2652$.Type.type*, %m2652$.Type.type** %function_type.8850
%.tmp8858 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8857, i32 0, i32 0
%.tmp8860 = getelementptr [9 x i8], [9 x i8]*@.str8859, i32 0, i32 0
store i8* %.tmp8860, i8** %.tmp8858
%.tmp8861 = load %m2652$.Type.type*, %m2652$.Type.type** %function_type.8850
%.tmp8862 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8861, i32 0, i32 3
%.tmp8863 = load %m2652$.Type.type*, %m2652$.Type.type** %return_value_type.8856
store %m2652$.Type.type* %.tmp8863, %m2652$.Type.type** %.tmp8862
%.tmp8864 = load %m2652$.Type.type*, %m2652$.Type.type** %return_value_type.8856
%last_type.8865 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp8864, %m2652$.Type.type** %last_type.8865
%.tmp8866 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp8867 = call %m980$.Node.type*(%m980$.Node.type*) @m295$syn_function_params.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8866)
%params.8868 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8867, %m980$.Node.type** %params.8868
%.tmp8870 = load %m980$.Node.type*, %m980$.Node.type** %params.8868
%param_ptr.8871 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8870, %m980$.Node.type** %param_ptr.8871
br label %.for.start.8869
.for.start.8869:
%.tmp8872 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8871
%.tmp8873 = icmp ne %m980$.Node.type* %.tmp8872, null
br i1 %.tmp8873, label %.for.continue.8869, label %.for.end.8869
.for.continue.8869:
%.tmp8874 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8871
%.tmp8875 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8874, i32 0, i32 0
%.tmp8876 = load i8*, i8** %.tmp8875
%.tmp8878 = getelementptr [5 x i8], [5 x i8]*@.str8877, i32 0, i32 0
%.tmp8879 = call i32(i8*,i8*) @strcmp(i8* %.tmp8876, i8* %.tmp8878)
%.tmp8880 = icmp eq i32 %.tmp8879, 0
br i1 %.tmp8880, label %.if.true.8881, label %.if.false.8881
.if.true.8881:
%.tmp8882 = load %m2652$.Type.type*, %m2652$.Type.type** %last_type.8865
%.tmp8883 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8882, i32 0, i32 4
%.tmp8884 = load %m2652$.Type.type*, %m2652$.Type.type** %last_type.8865
%.tmp8885 = call %m2652$.Type.type*(%m2652$.Type.type*) @m295$type_clone.m2652$.Type.typep.m2652$.Type.typep(%m2652$.Type.type* %.tmp8884)
store %m2652$.Type.type* %.tmp8885, %m2652$.Type.type** %.tmp8883
%.tmp8886 = load %m2652$.Type.type*, %m2652$.Type.type** %last_type.8865
%.tmp8887 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8886, i32 0, i32 4
%.tmp8888 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8887
%.tmp8889 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8888, i32 0, i32 4
store %m2652$.Type.type* null, %m2652$.Type.type** %.tmp8889
%.tmp8890 = load %m2652$.Type.type*, %m2652$.Type.type** %last_type.8865
%.tmp8891 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8890, i32 0, i32 4
%.tmp8892 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp8891
store %m2652$.Type.type* %.tmp8892, %m2652$.Type.type** %last_type.8865
%.tmp8893 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8871
%.tmp8894 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8893, i32 0, i32 7
%.tmp8895 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8894
%.tmp8896 = icmp ne %m980$.Node.type* %.tmp8895, null
br i1 %.tmp8896, label %.if.true.8897, label %.if.false.8897
.if.true.8897:
%.tmp8898 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8871
%.tmp8899 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8898, i32 0, i32 7
%.tmp8900 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8899
store %m980$.Node.type* %.tmp8900, %m980$.Node.type** %param_ptr.8871
br label %.if.end.8897
.if.false.8897:
br label %.if.end.8897
.if.end.8897:
%.tmp8901 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8871
%.tmp8902 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8901, i32 0, i32 7
%.tmp8903 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8902
%.tmp8904 = icmp ne %m980$.Node.type* %.tmp8903, null
br i1 %.tmp8904, label %.if.true.8905, label %.if.false.8905
.if.true.8905:
%.tmp8906 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8871
%.tmp8907 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8906, i32 0, i32 7
%.tmp8908 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8907
store %m980$.Node.type* %.tmp8908, %m980$.Node.type** %param_ptr.8871
br label %.if.end.8905
.if.false.8905:
store %m980$.Node.type* null, %m980$.Node.type** %param_ptr.8871
br label %.if.end.8905
.if.end.8905:
br label %.if.end.8881
.if.false.8881:
%.tmp8909 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8910 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8871
%.tmp8911 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8910, i32 0, i32 6
%.tmp8912 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8911
%.tmp8913 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp8909, %m980$.Node.type* %.tmp8912)
%param_type.8914 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp8913, %m2652$.Type.type** %param_type.8914
%.tmp8915 = load %m2652$.Type.type*, %m2652$.Type.type** %last_type.8865
%.tmp8916 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8915, i32 0, i32 4
%.tmp8917 = load %m2652$.Type.type*, %m2652$.Type.type** %param_type.8914
store %m2652$.Type.type* %.tmp8917, %m2652$.Type.type** %.tmp8916
%.tmp8918 = load %m2652$.Type.type*, %m2652$.Type.type** %param_type.8914
store %m2652$.Type.type* %.tmp8918, %m2652$.Type.type** %last_type.8865
%.tmp8919 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8871
%.tmp8920 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8919, i32 0, i32 7
%.tmp8921 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8920
store %m980$.Node.type* %.tmp8921, %m980$.Node.type** %param_ptr.8871
%.tmp8922 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8871
%.tmp8923 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8922, i32 0, i32 7
%.tmp8924 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8923
%.tmp8925 = icmp ne %m980$.Node.type* %.tmp8924, null
br i1 %.tmp8925, label %.if.true.8926, label %.if.false.8926
.if.true.8926:
%.tmp8927 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8871
%.tmp8928 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8927, i32 0, i32 7
%.tmp8929 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8928
%.tmp8930 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8929, i32 0, i32 7
%.tmp8931 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8930
store %m980$.Node.type* %.tmp8931, %m980$.Node.type** %param_ptr.8871
br label %.if.end.8926
.if.false.8926:
store %m980$.Node.type* null, %m980$.Node.type** %param_ptr.8871
br label %.if.end.8926
.if.end.8926:
br label %.if.end.8881
.if.end.8881:
br label %.for.start.8869
.for.end.8869:
%.tmp8932 = load %m2652$.Type.type*, %m2652$.Type.type** %function_type.8850
ret %m2652$.Type.type* %.tmp8932
}
define %m980$.Node.type* @m295$syn_function_params.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.stmt.arg) {
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp8933 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp8935 = getelementptr [10 x i8], [10 x i8]*@.str8934, i32 0, i32 0
%.tmp8936 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp8933, i8* %.tmp8935)
%params.8937 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8936, %m980$.Node.type** %params.8937
%.tmp8938 = load %m980$.Node.type*, %m980$.Node.type** %params.8937
%.tmp8939 = icmp eq %m980$.Node.type* %.tmp8938, null
br i1 %.tmp8939, label %.if.true.8940, label %.if.false.8940
.if.true.8940:
%.tmp8941 = bitcast ptr null to %m980$.Node.type*
ret %m980$.Node.type* %.tmp8941
br label %.if.end.8940
.if.false.8940:
br label %.if.end.8940
.if.end.8940:
%.tmp8942 = load %m980$.Node.type*, %m980$.Node.type** %params.8937
%.tmp8943 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8942, i32 0, i32 6
%.tmp8944 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8943
ret %m980$.Node.type* %.tmp8944
}
define %m2652$.Type.type* @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.ctx.arg, %m2652$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp8945 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp8946 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8945, i32 0, i32 0
%.tmp8947 = load i8*, i8** %.tmp8946
%.tmp8949 = getelementptr [11 x i8], [11 x i8]*@.str8948, i32 0, i32 0
%.tmp8950 = call i32(i8*,i8*) @strcmp(i8* %.tmp8947, i8* %.tmp8949)
%.tmp8951 = icmp eq i32 %.tmp8950, 0
br i1 %.tmp8951, label %.if.true.8952, label %.if.false.8952
.if.true.8952:
%.tmp8953 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp8954 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp8955 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8954, i32 0, i32 6
%.tmp8956 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8955
%.tmp8957 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp8953, %m980$.Node.type* %.tmp8956)
%t.8958 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp8957, %m2652$.Type.type** %t.8958
%.tmp8959 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp8960 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8959, i32 0, i32 7
%.tmp8961 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8960
%.tmp8962 = icmp ne %m980$.Node.type* %.tmp8961, null
br i1 %.tmp8962, label %.if.true.8963, label %.if.false.8963
.if.true.8963:
%.tmp8964 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp8965 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8964, i32 0, i32 7
%.tmp8966 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8965
%.tmp8967 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8966, i32 0, i32 0
%.tmp8968 = load i8*, i8** %.tmp8967
%.tmp8970 = getelementptr [13 x i8], [13 x i8]*@.str8969, i32 0, i32 0
%.tmp8971 = call i32(i8*,i8*) @strcmp(i8* %.tmp8968, i8* %.tmp8970)
%.tmp8972 = icmp eq i32 %.tmp8971, 0
br i1 %.tmp8972, label %.if.true.8973, label %.if.false.8973
.if.true.8973:
%.tmp8974 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%fn_type.8975 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp8974, %m2652$.Type.type** %fn_type.8975
%.tmp8976 = load %m2652$.Type.type*, %m2652$.Type.type** %fn_type.8975
%.tmp8977 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8976, i32 0, i32 0
%.tmp8979 = getelementptr [9 x i8], [9 x i8]*@.str8978, i32 0, i32 0
store i8* %.tmp8979, i8** %.tmp8977
%.tmp8980 = load %m2652$.Type.type*, %m2652$.Type.type** %fn_type.8975
%.tmp8981 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8980, i32 0, i32 3
%.tmp8982 = load %m2652$.Type.type*, %m2652$.Type.type** %t.8958
store %m2652$.Type.type* %.tmp8982, %m2652$.Type.type** %.tmp8981
%.tmp8983 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp8984 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8983, i32 0, i32 7
%.tmp8985 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8984
%.tmp8986 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8985, i32 0, i32 6
%.tmp8987 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8986
%.tmp8988 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8987, i32 0, i32 7
%.tmp8989 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8988
%fst_operator.8990 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8989, %m980$.Node.type** %fst_operator.8990
%.tmp8991 = load %m980$.Node.type*, %m980$.Node.type** %fst_operator.8990
%.tmp8992 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8991, i32 0, i32 0
%.tmp8993 = load i8*, i8** %.tmp8992
%.tmp8995 = getelementptr [15 x i8], [15 x i8]*@.str8994, i32 0, i32 0
%.tmp8996 = call i32(i8*,i8*) @strcmp(i8* %.tmp8993, i8* %.tmp8995)
%.tmp8997 = icmp eq i32 %.tmp8996, 0
br i1 %.tmp8997, label %.if.true.8998, label %.if.false.8998
.if.true.8998:
%.tmp8999 = load %m2652$.Type.type*, %m2652$.Type.type** %fn_type.8975
%.tmp9000 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp8999, i32 0, i32 3
%.tmp9001 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp9000
%last_fn_value.9002 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp9001, %m2652$.Type.type** %last_fn_value.9002
%.tmp9004 = load %m980$.Node.type*, %m980$.Node.type** %fst_operator.8990
%.tmp9005 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9004, i32 0, i32 6
%.tmp9006 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9005
%t.9007 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9006, %m980$.Node.type** %t.9007
br label %.for.start.9003
.for.start.9003:
%.tmp9008 = load %m980$.Node.type*, %m980$.Node.type** %t.9007
%.tmp9009 = icmp ne %m980$.Node.type* %.tmp9008, null
br i1 %.tmp9009, label %.for.continue.9003, label %.for.end.9003
.for.continue.9003:
%.tmp9010 = load %m2652$.Type.type*, %m2652$.Type.type** %last_fn_value.9002
%.tmp9011 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9010, i32 0, i32 4
%.tmp9012 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp9013 = load %m980$.Node.type*, %m980$.Node.type** %t.9007
%.tmp9014 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9013, i32 0, i32 6
%.tmp9015 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9014
%.tmp9016 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp9012, %m980$.Node.type* %.tmp9015)
store %m2652$.Type.type* %.tmp9016, %m2652$.Type.type** %.tmp9011
%.tmp9017 = load %m2652$.Type.type*, %m2652$.Type.type** %last_fn_value.9002
%.tmp9018 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9017, i32 0, i32 4
%.tmp9019 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp9018
store %m2652$.Type.type* %.tmp9019, %m2652$.Type.type** %last_fn_value.9002
%.tmp9020 = load %m980$.Node.type*, %m980$.Node.type** %t.9007
%.tmp9021 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9020, i32 0, i32 7
%.tmp9022 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9021
%.tmp9023 = icmp ne %m980$.Node.type* %.tmp9022, null
br i1 %.tmp9023, label %.if.true.9024, label %.if.false.9024
.if.true.9024:
%.tmp9025 = load %m980$.Node.type*, %m980$.Node.type** %t.9007
%.tmp9026 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9025, i32 0, i32 7
%.tmp9027 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9026
store %m980$.Node.type* %.tmp9027, %m980$.Node.type** %t.9007
br label %.if.end.9024
.if.false.9024:
br label %.if.end.9024
.if.end.9024:
%.tmp9028 = load %m980$.Node.type*, %m980$.Node.type** %t.9007
%.tmp9029 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9028, i32 0, i32 7
%.tmp9030 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9029
store %m980$.Node.type* %.tmp9030, %m980$.Node.type** %t.9007
br label %.for.start.9003
.for.end.9003:
br label %.if.end.8998
.if.false.8998:
br label %.if.end.8998
.if.end.8998:
%.tmp9031 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%t_ptr.9032 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp9031, %m2652$.Type.type** %t_ptr.9032
%.tmp9033 = load %m2652$.Type.type*, %m2652$.Type.type** %t_ptr.9032
%.tmp9034 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9033, i32 0, i32 0
%.tmp9036 = getelementptr [4 x i8], [4 x i8]*@.str9035, i32 0, i32 0
store i8* %.tmp9036, i8** %.tmp9034
%.tmp9037 = load %m2652$.Type.type*, %m2652$.Type.type** %t_ptr.9032
%.tmp9038 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9037, i32 0, i32 3
%.tmp9039 = load %m2652$.Type.type*, %m2652$.Type.type** %fn_type.8975
store %m2652$.Type.type* %.tmp9039, %m2652$.Type.type** %.tmp9038
%.tmp9040 = load %m2652$.Type.type*, %m2652$.Type.type** %t_ptr.9032
store %m2652$.Type.type* %.tmp9040, %m2652$.Type.type** %t.8958
br label %.if.end.8973
.if.false.8973:
br label %.if.end.8973
.if.end.8973:
br label %.if.end.8963
.if.false.8963:
br label %.if.end.8963
.if.end.8963:
%.tmp9041 = load %m2652$.Type.type*, %m2652$.Type.type** %t.8958
ret %m2652$.Type.type* %.tmp9041
br label %.if.end.8952
.if.false.8952:
br label %.if.end.8952
.if.end.8952:
%.tmp9042 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%t.9043 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp9042, %m2652$.Type.type** %t.9043
%.tmp9044 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9045 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9044, i32 0, i32 0
%.tmp9046 = load i8*, i8** %.tmp9045
%.tmp9048 = getelementptr [10 x i8], [10 x i8]*@.str9047, i32 0, i32 0
%.tmp9049 = call i32(i8*,i8*) @strcmp(i8* %.tmp9046, i8* %.tmp9048)
%.tmp9050 = icmp eq i32 %.tmp9049, 0
br i1 %.tmp9050, label %.if.true.9051, label %.if.false.9051
.if.true.9051:
%.tmp9052 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9053 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9052, i32 0, i32 0
%.tmp9055 = getelementptr [7 x i8], [7 x i8]*@.str9054, i32 0, i32 0
store i8* %.tmp9055, i8** %.tmp9053
%.tmp9056 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9057 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9056, i32 0, i32 1
store i8* null, i8** %.tmp9057
%.tmp9058 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9059 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9058, i32 0, i32 6
%.tmp9060 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9059
%.tmp9062 = getelementptr [5 x i8], [5 x i8]*@.str9061, i32 0, i32 0
%.tmp9063 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp9060, i8* %.tmp9062)
%curr_type.9064 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9063, %m980$.Node.type** %curr_type.9064
%.tmp9065 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9064
%.tmp9066 = icmp ne %m980$.Node.type* %.tmp9065, null
br i1 %.tmp9066, label %.if.true.9067, label %.if.false.9067
.if.true.9067:
%.tmp9068 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9069 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9068, i32 0, i32 3
%.tmp9070 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp9071 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9064
%.tmp9072 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9071, i32 0, i32 6
%.tmp9073 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9072
%.tmp9074 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp9070, %m980$.Node.type* %.tmp9073)
store %m2652$.Type.type* %.tmp9074, %m2652$.Type.type** %.tmp9069
%.tmp9075 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9076 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9075, i32 0, i32 3
%.tmp9077 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp9076
%.tmp9078 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9077, i32 0, i32 1
%.tmp9079 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9064
%.tmp9080 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9079, i32 0, i32 7
%.tmp9081 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9080
%.tmp9082 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9081, i32 0, i32 1
%.tmp9083 = load i8*, i8** %.tmp9082
store i8* %.tmp9083, i8** %.tmp9078
%.tmp9084 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9085 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9084, i32 0, i32 3
%.tmp9086 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp9085
%curr_t.9087 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp9086, %m2652$.Type.type** %curr_t.9087
%.tmp9089 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9064
%.tmp9090 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9089, i32 0, i32 7
%.tmp9091 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9090
%.tmp9093 = getelementptr [5 x i8], [5 x i8]*@.str9092, i32 0, i32 0
%.tmp9094 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp9091, i8* %.tmp9093)
store %m980$.Node.type* %.tmp9094, %m980$.Node.type** %curr_type.9064
br label %.for.start.9088
.for.start.9088:
%.tmp9095 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9064
%.tmp9096 = icmp ne %m980$.Node.type* %.tmp9095, null
br i1 %.tmp9096, label %.for.continue.9088, label %.for.end.9088
.for.continue.9088:
%.tmp9097 = load %m2652$.Type.type*, %m2652$.Type.type** %curr_t.9087
%.tmp9098 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9097, i32 0, i32 4
%.tmp9099 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp9100 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9064
%.tmp9101 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9100, i32 0, i32 6
%.tmp9102 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9101
%.tmp9103 = call %m2652$.Type.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2652$.Type.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp9099, %m980$.Node.type* %.tmp9102)
store %m2652$.Type.type* %.tmp9103, %m2652$.Type.type** %.tmp9098
%.tmp9104 = load %m2652$.Type.type*, %m2652$.Type.type** %curr_t.9087
%.tmp9105 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9104, i32 0, i32 4
%.tmp9106 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp9105
%.tmp9107 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9106, i32 0, i32 1
%.tmp9108 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9064
%.tmp9109 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9108, i32 0, i32 7
%.tmp9110 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9109
%.tmp9111 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9110, i32 0, i32 1
%.tmp9112 = load i8*, i8** %.tmp9111
store i8* %.tmp9112, i8** %.tmp9107
%.tmp9113 = load %m2652$.Type.type*, %m2652$.Type.type** %curr_t.9087
%.tmp9114 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9113, i32 0, i32 4
%.tmp9115 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp9114
store %m2652$.Type.type* %.tmp9115, %m2652$.Type.type** %curr_t.9087
%.tmp9116 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9064
%.tmp9117 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9116, i32 0, i32 7
%.tmp9118 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9117
%.tmp9120 = getelementptr [5 x i8], [5 x i8]*@.str9119, i32 0, i32 0
%.tmp9121 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp9118, i8* %.tmp9120)
store %m980$.Node.type* %.tmp9121, %m980$.Node.type** %curr_type.9064
br label %.for.start.9088
.for.end.9088:
br label %.if.end.9067
.if.false.9067:
br label %.if.end.9067
.if.end.9067:
br label %.if.end.9051
.if.false.9051:
%.tmp9122 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9123 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9122, i32 0, i32 0
%.tmp9124 = load i8*, i8** %.tmp9123
%.tmp9126 = getelementptr [12 x i8], [12 x i8]*@.str9125, i32 0, i32 0
%.tmp9127 = call i32(i8*,i8*) @strcmp(i8* %.tmp9124, i8* %.tmp9126)
%.tmp9128 = icmp eq i32 %.tmp9127, 0
br i1 %.tmp9128, label %.if.true.9129, label %.if.false.9129
.if.true.9129:
%err_msg.9130 = alloca i8*
store i8* null, i8** %err_msg.9130
%.tmp9131 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp9132 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9133 = call %m2652$.ScopeItem.type*(%m2652$.CompilerCtx.type*,%m980$.Node.type*) @m295$find_defined.m2652$.ScopeItem.typep.m2652$.CompilerCtx.typep.m980$.Node.typep(%m2652$.CompilerCtx.type* %.tmp9131, %m980$.Node.type* %.tmp9132)
%base.9134 = alloca %m2652$.ScopeItem.type*
store %m2652$.ScopeItem.type* %.tmp9133, %m2652$.ScopeItem.type** %base.9134
%.tmp9135 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %base.9134
%.tmp9136 = icmp eq %m2652$.ScopeItem.type* %.tmp9135, null
br i1 %.tmp9136, label %.if.true.9137, label %.if.false.9137
.if.true.9137:
%.tmp9138 = getelementptr i8*, i8** %err_msg.9130, i32 0
%.tmp9140 = getelementptr [37 x i8], [37 x i8]*@.str9139, i32 0, i32 0
%.tmp9141 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9142 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9141, i32 0, i32 6
%.tmp9143 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9142
%.tmp9144 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9143, i32 0, i32 1
%.tmp9145 = load i8*, i8** %.tmp9144
%.tmp9146 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9138, i8* %.tmp9140, i8* %.tmp9145)
%.tmp9147 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp9148 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9149 = load i8*, i8** %err_msg.9130
call void(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp9147, %m980$.Node.type* %.tmp9148, i8* %.tmp9149)
%.tmp9150 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9151 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9150, i32 0, i32 0
%.tmp9153 = getelementptr [6 x i8], [6 x i8]*@.str9152, i32 0, i32 0
store i8* %.tmp9153, i8** %.tmp9151
%.tmp9154 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
ret %m2652$.Type.type* %.tmp9154
br label %.if.end.9137
.if.false.9137:
br label %.if.end.9137
.if.end.9137:
%.tmp9155 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9156 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9155, i32 0, i32 0
%.tmp9158 = getelementptr [10 x i8], [10 x i8]*@.str9157, i32 0, i32 0
store i8* %.tmp9158, i8** %.tmp9156
%.tmp9159 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9160 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9159, i32 0, i32 1
%.tmp9161 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %base.9134
%.tmp9162 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp9161, i32 0, i32 0
%.tmp9163 = load i8*, i8** %.tmp9162
store i8* %.tmp9163, i8** %.tmp9160
%.tmp9164 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9165 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9164, i32 0, i32 2
%.tmp9166 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %base.9134
%.tmp9167 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp9166, i32 0, i32 1
%.tmp9168 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %.tmp9167
%.tmp9169 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp9168, i32 0, i32 0
%.tmp9170 = load i8*, i8** %.tmp9169
store i8* %.tmp9170, i8** %.tmp9165
%.tmp9171 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9172 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9171, i32 0, i32 3
%.tmp9173 = load %m2652$.ScopeItem.type*, %m2652$.ScopeItem.type** %base.9134
%.tmp9174 = getelementptr %m2652$.ScopeItem.type, %m2652$.ScopeItem.type* %.tmp9173, i32 0, i32 1
%.tmp9175 = load %m2652$.AssignableInfo.type*, %m2652$.AssignableInfo.type** %.tmp9174
%.tmp9176 = getelementptr %m2652$.AssignableInfo.type, %m2652$.AssignableInfo.type* %.tmp9175, i32 0, i32 4
%.tmp9177 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp9176
store %m2652$.Type.type* %.tmp9177, %m2652$.Type.type** %.tmp9172
br label %.if.end.9129
.if.false.9129:
%.tmp9178 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9179 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9178, i32 0, i32 1
%.tmp9180 = load i8*, i8** %.tmp9179
%.tmp9182 = getelementptr [4 x i8], [4 x i8]*@.str9181, i32 0, i32 0
%.tmp9183 = call i32(i8*,i8*) @strcmp(i8* %.tmp9180, i8* %.tmp9182)
%.tmp9184 = icmp eq i32 %.tmp9183, 0
br i1 %.tmp9184, label %.if.true.9185, label %.if.false.9185
.if.true.9185:
%.tmp9186 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9187 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9186, i32 0, i32 0
%.tmp9189 = getelementptr [4 x i8], [4 x i8]*@.str9188, i32 0, i32 0
store i8* %.tmp9189, i8** %.tmp9187
%.tmp9190 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9191 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9190, i32 0, i32 3
%.tmp9192 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
store %m2652$.Type.type* %.tmp9192, %m2652$.Type.type** %.tmp9191
%.tmp9193 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9194 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9193, i32 0, i32 3
%.tmp9195 = load %m2652$.Type.type*, %m2652$.Type.type** %.tmp9194
%.tmp9196 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9195, i32 0, i32 0
%.tmp9198 = getelementptr [4 x i8], [4 x i8]*@.str9197, i32 0, i32 0
store i8* %.tmp9198, i8** %.tmp9196
br label %.if.end.9185
.if.false.9185:
%.tmp9199 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9200 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9199, i32 0, i32 0
%.tmp9201 = load i8*, i8** %.tmp9200
%.tmp9203 = getelementptr [5 x i8], [5 x i8]*@.str9202, i32 0, i32 0
%.tmp9204 = call i32(i8*,i8*) @strcmp(i8* %.tmp9201, i8* %.tmp9203)
%.tmp9205 = icmp eq i32 %.tmp9204, 0
br i1 %.tmp9205, label %.if.true.9206, label %.if.false.9206
.if.true.9206:
%.tmp9207 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9208 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9207, i32 0, i32 0
%.tmp9209 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9210 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9209, i32 0, i32 1
%.tmp9211 = load i8*, i8** %.tmp9210
store i8* %.tmp9211, i8** %.tmp9208
br label %.if.end.9206
.if.false.9206:
%.tmp9212 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9213 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9212, i32 0, i32 1
%.tmp9214 = load i8*, i8** %.tmp9213
%.tmp9216 = getelementptr [4 x i8], [4 x i8]*@.str9215, i32 0, i32 0
%.tmp9217 = call i32(i8*,i8*) @strcmp(i8* %.tmp9214, i8* %.tmp9216)
%.tmp9218 = icmp eq i32 %.tmp9217, 0
br i1 %.tmp9218, label %.if.true.9219, label %.if.false.9219
.if.true.9219:
%.tmp9220 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
%.tmp9221 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9220, i32 0, i32 0
%.tmp9223 = getelementptr [7 x i8], [7 x i8]*@.str9222, i32 0, i32 0
store i8* %.tmp9223, i8** %.tmp9221
br label %.if.end.9219
.if.false.9219:
%.tmp9224 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp9225 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9227 = getelementptr [54 x i8], [54 x i8]*@.str9226, i32 0, i32 0
%.tmp9228 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp9224, %m980$.Node.type* %.tmp9225, i8* %.tmp9227)
%.tmp9229 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9230 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9229, i32 0, i32 0
%.tmp9231 = load i8*, i8** %.tmp9230
%.tmp9232 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9233 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9232, i32 0, i32 1
%.tmp9234 = load i8*, i8** %.tmp9233
%.tmp9235 = call i32(i8*,...) @printf(i8* %.tmp9228, i8* %.tmp9231, i8* %.tmp9234)
%.tmp9236 = bitcast ptr null to %m2652$.Type.type*
ret %m2652$.Type.type* %.tmp9236
br label %.if.end.9219
.if.end.9219:
br label %.if.end.9206
.if.end.9206:
br label %.if.end.9185
.if.end.9185:
br label %.if.end.9129
.if.end.9129:
br label %.if.end.9051
.if.end.9051:
%.tmp9238 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9239 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9238, i32 0, i32 7
%.tmp9240 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9239
%ptr.9241 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9240, %m980$.Node.type** %ptr.9241
br label %.for.start.9237
.for.start.9237:
%.tmp9242 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9241
%.tmp9243 = icmp ne %m980$.Node.type* %.tmp9242, null
br i1 %.tmp9243, label %.for.continue.9237, label %.for.end.9237
.for.continue.9237:
%.tmp9244 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9241
%.tmp9245 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9244, i32 0, i32 1
%.tmp9246 = load i8*, i8** %.tmp9245
%.tmp9248 = getelementptr [2 x i8], [2 x i8]*@.str9247, i32 0, i32 0
%.tmp9249 = call i32(i8*,i8*) @strcmp(i8* %.tmp9246, i8* %.tmp9248)
%.tmp9250 = icmp eq i32 %.tmp9249, 0
br i1 %.tmp9250, label %.if.true.9251, label %.if.false.9251
.if.true.9251:
%.tmp9252 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%pt.9253 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp9252, %m2652$.Type.type** %pt.9253
%.tmp9254 = load %m2652$.Type.type*, %m2652$.Type.type** %pt.9253
%.tmp9255 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9254, i32 0, i32 0
%.tmp9257 = getelementptr [4 x i8], [4 x i8]*@.str9256, i32 0, i32 0
store i8* %.tmp9257, i8** %.tmp9255
%.tmp9258 = load %m2652$.Type.type*, %m2652$.Type.type** %pt.9253
%.tmp9259 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9258, i32 0, i32 3
%.tmp9260 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
store %m2652$.Type.type* %.tmp9260, %m2652$.Type.type** %.tmp9259
%.tmp9261 = load %m2652$.Type.type*, %m2652$.Type.type** %pt.9253
store %m2652$.Type.type* %.tmp9261, %m2652$.Type.type** %t.9043
br label %.if.end.9251
.if.false.9251:
%.tmp9262 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9241
%.tmp9263 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9262, i32 0, i32 1
%.tmp9264 = load i8*, i8** %.tmp9263
%.tmp9266 = getelementptr [2 x i8], [2 x i8]*@.str9265, i32 0, i32 0
%.tmp9267 = call i32(i8*,i8*) @strcmp(i8* %.tmp9264, i8* %.tmp9266)
%.tmp9268 = icmp eq i32 %.tmp9267, 0
br i1 %.tmp9268, label %.if.true.9269, label %.if.false.9269
.if.true.9269:
%.tmp9270 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9241
%.tmp9271 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9270, i32 0, i32 7
%.tmp9272 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9271
%.tmp9273 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9272, i32 0, i32 1
%.tmp9274 = load i8*, i8** %.tmp9273
%.tmp9276 = getelementptr [2 x i8], [2 x i8]*@.str9275, i32 0, i32 0
%.tmp9277 = call i32(i8*,i8*) @strcmp(i8* %.tmp9274, i8* %.tmp9276)
%.tmp9278 = icmp eq i32 %.tmp9277, 0
br i1 %.tmp9278, label %.if.true.9279, label %.if.false.9279
.if.true.9279:
%.tmp9280 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%slice_type.9281 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp9280, %m2652$.Type.type** %slice_type.9281
%.tmp9282 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_type.9281
%.tmp9283 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9282, i32 0, i32 0
%.tmp9285 = getelementptr [7 x i8], [7 x i8]*@.str9284, i32 0, i32 0
store i8* %.tmp9285, i8** %.tmp9283
%.tmp9286 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_type.9281
%.tmp9287 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9286, i32 0, i32 1
%.tmp9289 = getelementptr [6 x i8], [6 x i8]*@.str9288, i32 0, i32 0
store i8* %.tmp9289, i8** %.tmp9287
%.tmp9290 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%slice_c_array.9291 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp9290, %m2652$.Type.type** %slice_c_array.9291
%.tmp9292 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_c_array.9291
%.tmp9293 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9292, i32 0, i32 0
%.tmp9295 = getelementptr [4 x i8], [4 x i8]*@.str9294, i32 0, i32 0
store i8* %.tmp9295, i8** %.tmp9293
%.tmp9296 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_c_array.9291
%.tmp9297 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9296, i32 0, i32 1
%.tmp9299 = getelementptr [6 x i8], [6 x i8]*@.str9298, i32 0, i32 0
store i8* %.tmp9299, i8** %.tmp9297
%.tmp9300 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_c_array.9291
%.tmp9301 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9300, i32 0, i32 3
%.tmp9302 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
store %m2652$.Type.type* %.tmp9302, %m2652$.Type.type** %.tmp9301
%.tmp9303 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_type.9281
%.tmp9304 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9303, i32 0, i32 3
%.tmp9305 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_c_array.9291
store %m2652$.Type.type* %.tmp9305, %m2652$.Type.type** %.tmp9304
%.tmp9306 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%slice_len.9307 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp9306, %m2652$.Type.type** %slice_len.9307
%.tmp9308 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_len.9307
%.tmp9309 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9308, i32 0, i32 0
%.tmp9311 = getelementptr [4 x i8], [4 x i8]*@.str9310, i32 0, i32 0
store i8* %.tmp9311, i8** %.tmp9309
%.tmp9312 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_len.9307
%.tmp9313 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9312, i32 0, i32 1
%.tmp9315 = getelementptr [4 x i8], [4 x i8]*@.str9314, i32 0, i32 0
store i8* %.tmp9315, i8** %.tmp9313
%.tmp9316 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_c_array.9291
%.tmp9317 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9316, i32 0, i32 4
%.tmp9318 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_len.9307
store %m2652$.Type.type* %.tmp9318, %m2652$.Type.type** %.tmp9317
%.tmp9319 = call %m2652$.Type.type*() @m295$new_type.m2652$.Type.typep()
%slice_cap.9320 = alloca %m2652$.Type.type*
store %m2652$.Type.type* %.tmp9319, %m2652$.Type.type** %slice_cap.9320
%.tmp9321 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_cap.9320
%.tmp9322 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9321, i32 0, i32 0
%.tmp9324 = getelementptr [4 x i8], [4 x i8]*@.str9323, i32 0, i32 0
store i8* %.tmp9324, i8** %.tmp9322
%.tmp9325 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_cap.9320
%.tmp9326 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9325, i32 0, i32 1
%.tmp9328 = getelementptr [4 x i8], [4 x i8]*@.str9327, i32 0, i32 0
store i8* %.tmp9328, i8** %.tmp9326
%.tmp9329 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_len.9307
%.tmp9330 = getelementptr %m2652$.Type.type, %m2652$.Type.type* %.tmp9329, i32 0, i32 4
%.tmp9331 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_cap.9320
store %m2652$.Type.type* %.tmp9331, %m2652$.Type.type** %.tmp9330
%.tmp9332 = load %m2652$.Type.type*, %m2652$.Type.type** %slice_type.9281
store %m2652$.Type.type* %.tmp9332, %m2652$.Type.type** %t.9043
%.tmp9333 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9241
%.tmp9334 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9333, i32 0, i32 7
%.tmp9335 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9334
store %m980$.Node.type* %.tmp9335, %m980$.Node.type** %ptr.9241
br label %.if.end.9279
.if.false.9279:
br label %.if.end.9279
.if.end.9279:
br label %.if.end.9269
.if.false.9269:
%.tmp9336 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %ctx
%.tmp9337 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9241
%.tmp9339 = getelementptr [49 x i8], [49 x i8]*@.str9338, i32 0, i32 0
%.tmp9340 = call i8*(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp9336, %m980$.Node.type* %.tmp9337, i8* %.tmp9339)
%.tmp9341 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9241
%.tmp9342 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9341, i32 0, i32 1
%.tmp9343 = load i8*, i8** %.tmp9342
%.tmp9344 = call i32(i8*,...) @printf(i8* %.tmp9340, i8* %.tmp9343)
%.tmp9345 = bitcast ptr null to %m2652$.Type.type*
ret %m2652$.Type.type* %.tmp9345
br label %.if.end.9269
.if.end.9269:
br label %.if.end.9251
.if.end.9251:
%.tmp9346 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9241
%.tmp9347 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9346, i32 0, i32 7
%.tmp9348 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9347
store %m980$.Node.type* %.tmp9348, %m980$.Node.type** %ptr.9241
br label %.for.start.9237
.for.end.9237:
%.tmp9349 = load %m2652$.Type.type*, %m2652$.Type.type** %t.9043
ret %m2652$.Type.type* %.tmp9349
}
define i1 @compile_file.b.cp.cp(i8* %.filename.arg, i8* %.outname.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%outname = alloca i8*
store i8* %.outname.arg, i8** %outname
%.tmp9350 = load i32, i32* @STDERR
%.tmp9352 = getelementptr [2 x i8], [2 x i8]*@.str9351, i32 0, i32 0
%.tmp9353 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp9350, i8* %.tmp9352)
%stderr.9354 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9353, %m0$.File.type** %stderr.9354
%.tmp9355 = call %m0$.File.type*() @tmpfile()
%llvm_code.9356 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9355, %m0$.File.type** %llvm_code.9356
%.tmp9357 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9356
%.tmp9358 = load i8*, i8** %filename
%.tmp9359 = call %m2652$.CompilerCtx.type*(%m0$.File.type*,i8*) @m295$new_context.m2652$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp9357, i8* %.tmp9358)
%compiler_ctx.9360 = alloca %m2652$.CompilerCtx.type*
store %m2652$.CompilerCtx.type* %.tmp9359, %m2652$.CompilerCtx.type** %compiler_ctx.9360
%.tmp9361 = load %m2652$.CompilerCtx.type*, %m2652$.CompilerCtx.type** %compiler_ctx.9360
%.tmp9362 = bitcast ptr null to %m980$.Node.type*
%.tmp9363 = load i8*, i8** %filename
%.tmp9364 = call i1(%m2652$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$compile_file.b.m2652$.CompilerCtx.typep.m980$.Node.typep.cp(%m2652$.CompilerCtx.type* %.tmp9361, %m980$.Node.type* %.tmp9362, i8* %.tmp9363)
br i1 %.tmp9364, label %.if.true.9365, label %.if.false.9365
.if.true.9365:
%.tmp9366 = load %m0$.File.type*, %m0$.File.type** %stderr.9354
%.tmp9368 = getelementptr [34 x i8], [34 x i8]*@.str9367, i32 0, i32 0
%.tmp9369 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9366, i8* %.tmp9368)
ret i1 0
br label %.if.end.9365
.if.false.9365:
br label %.if.end.9365
.if.end.9365:
%.tmp9370 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9356
%.tmp9371 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp9370)
%.tmp9372 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9356
%.tmp9373 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp9372)
%llvm_code_size.9374 = alloca i32
store i32 %.tmp9373, i32* %llvm_code_size.9374
%.tmp9375 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9356
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp9375)
%.tmp9377 = getelementptr [1 x i8], [1 x i8]*@.str9376, i32 0, i32 0
%cmd.9378 = alloca i8*
store i8* %.tmp9377, i8** %cmd.9378
%.tmp9379 = getelementptr i8*, i8** %cmd.9378, i32 0
%.tmp9381 = getelementptr [32 x i8], [32 x i8]*@.str9380, i32 0, i32 0
%.tmp9382 = load i8*, i8** %outname
%.tmp9383 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9379, i8* %.tmp9381, i8* %.tmp9382)
%.tmp9384 = load i8*, i8** %cmd.9378
%.tmp9386 = getelementptr [2 x i8], [2 x i8]*@.str9385, i32 0, i32 0
%.tmp9387 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9384, i8* %.tmp9386)
%proc.9388 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9387, %m0$.File.type** %proc.9388
%.tmp9389 = load %m0$.File.type*, %m0$.File.type** %proc.9388
%.tmp9390 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9389)
%.tmp9391 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9356
%.tmp9392 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9391)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp9390, i32 %.tmp9392)
%.tmp9393 = load %m0$.File.type*, %m0$.File.type** %proc.9388
%.tmp9394 = icmp eq %m0$.File.type* %.tmp9393, null
br i1 %.tmp9394, label %.if.true.9395, label %.if.false.9395
.if.true.9395:
%.tmp9396 = load %m0$.File.type*, %m0$.File.type** %stderr.9354
%.tmp9398 = getelementptr [28 x i8], [28 x i8]*@.str9397, i32 0, i32 0
%.tmp9399 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9396, i8* %.tmp9398)
ret i1 0
br label %.if.end.9395
.if.false.9395:
br label %.if.end.9395
.if.end.9395:
%.tmp9400 = load %m0$.File.type*, %m0$.File.type** %proc.9388
%.tmp9401 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9400)
%.tmp9402 = icmp ne i32 %.tmp9401, 0
br i1 %.tmp9402, label %.if.true.9403, label %.if.false.9403
.if.true.9403:
%.tmp9404 = load %m0$.File.type*, %m0$.File.type** %stderr.9354
%.tmp9406 = getelementptr [24 x i8], [24 x i8]*@.str9405, i32 0, i32 0
%.tmp9407 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9404, i8* %.tmp9406)
ret i1 0
br label %.if.end.9403
.if.false.9403:
br label %.if.end.9403
.if.end.9403:
%.tmp9408 = getelementptr i8*, i8** %cmd.9378, i32 0
%.tmp9410 = getelementptr [17 x i8], [17 x i8]*@.str9409, i32 0, i32 0
%.tmp9411 = load i8*, i8** %outname
%.tmp9412 = load i8*, i8** %outname
%.tmp9413 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9408, i8* %.tmp9410, i8* %.tmp9411, i8* %.tmp9412)
%.tmp9414 = load i8*, i8** %cmd.9378
%.tmp9416 = getelementptr [2 x i8], [2 x i8]*@.str9415, i32 0, i32 0
%.tmp9417 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9414, i8* %.tmp9416)
%cc_proc.9418 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9417, %m0$.File.type** %cc_proc.9418
%.tmp9419 = load %m0$.File.type*, %m0$.File.type** %cc_proc.9418
%.tmp9420 = icmp eq %m0$.File.type* %.tmp9419, null
br i1 %.tmp9420, label %.if.true.9421, label %.if.false.9421
.if.true.9421:
%.tmp9422 = load %m0$.File.type*, %m0$.File.type** %stderr.9354
%.tmp9424 = getelementptr [28 x i8], [28 x i8]*@.str9423, i32 0, i32 0
%.tmp9425 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9422, i8* %.tmp9424)
ret i1 0
br label %.if.end.9421
.if.false.9421:
br label %.if.end.9421
.if.end.9421:
%.tmp9426 = load %m0$.File.type*, %m0$.File.type** %proc.9388
%.tmp9427 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9426)
%.tmp9428 = icmp ne i32 %.tmp9427, 0
br i1 %.tmp9428, label %.if.true.9429, label %.if.false.9429
.if.true.9429:
%.tmp9430 = load %m0$.File.type*, %m0$.File.type** %stderr.9354
%.tmp9432 = getelementptr [22 x i8], [22 x i8]*@.str9431, i32 0, i32 0
%.tmp9433 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9430, i8* %.tmp9432)
br label %.if.end.9429
.if.false.9429:
%.tmp9435 = getelementptr [32 x i8], [32 x i8]*@.str9434, i32 0, i32 0
%.tmp9436 = load i8*, i8** %outname
%.tmp9437 = call i32(i8*,...) @printf(i8* %.tmp9435, i8* %.tmp9436)
br label %.if.end.9429
.if.end.9429:
ret i1 1
}
%.Args.type = type {i8*,i8*,i8*,i8**}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9438 = load i32, i32* %argc
%.tmp9439 = load i8**, i8*** %argv
%.tmp9440 = call %.Args.type(i32,i8**) @check_args..Args.type.i.cpp(i32 %.tmp9438, i8** %.tmp9439)
%args.9441 = alloca %.Args.type
store %.Args.type %.tmp9440, %.Args.type* %args.9441
%.tmp9442 = getelementptr %.Args.type, %.Args.type* %args.9441, i32 0, i32 1
%.tmp9443 = load i8*, i8** %.tmp9442
%.tmp9444 = getelementptr %.Args.type, %.Args.type* %args.9441, i32 0, i32 2
%.tmp9445 = load i8*, i8** %.tmp9444
%.tmp9446 = call i1(i8*,i8*) @compile_file.b.cp.cp(i8* %.tmp9443, i8* %.tmp9445)
%.tmp9447 = icmp eq i1 %.tmp9446, 0
br i1 %.tmp9447, label %.if.true.9448, label %.if.false.9448
.if.true.9448:
ret i32 0
br label %.if.end.9448
.if.false.9448:
br label %.if.end.9448
.if.end.9448:
%.tmp9449 = getelementptr %.Args.type, %.Args.type* %args.9441, i32 0, i32 0
%.tmp9450 = load i8*, i8** %.tmp9449
%.tmp9452 = getelementptr [4 x i8], [4 x i8]*@.str9451, i32 0, i32 0
%.tmp9453 = call i32(i8*,i8*) @strcmp(i8* %.tmp9450, i8* %.tmp9452)
%.tmp9454 = icmp eq i32 %.tmp9453, 0
br i1 %.tmp9454, label %.if.true.9455, label %.if.false.9455
.if.true.9455:
%.tmp9457 = getelementptr [1 x i8], [1 x i8]*@.str9456, i32 0, i32 0
%cmd.9458 = alloca i8*
store i8* %.tmp9457, i8** %cmd.9458
%.tmp9459 = getelementptr i8*, i8** %cmd.9458, i32 0
%.tmp9461 = getelementptr [5 x i8], [5 x i8]*@.str9460, i32 0, i32 0
%.tmp9462 = getelementptr %.Args.type, %.Args.type* %args.9441, i32 0, i32 2
%.tmp9463 = load i8*, i8** %.tmp9462
%.tmp9464 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9459, i8* %.tmp9461, i8* %.tmp9463)
%.tmp9465 = load i8*, i8** %cmd.9458
%.tmp9466 = getelementptr %.Args.type, %.Args.type* %args.9441, i32 0, i32 3
%.tmp9467 = load i8**, i8*** %.tmp9466
%.tmp9468 = call i32(i8*,i8**) @execvp(i8* %.tmp9465, i8** %.tmp9467)
ret i32 %.tmp9468
br label %.if.end.9455
.if.false.9455:
br label %.if.end.9455
.if.end.9455:
ret i32 0
}
define %.Args.type @check_args..Args.type.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9470 = getelementptr [22 x i8], [22 x i8]*@.str9469, i32 0, i32 0
%tmpl.9471 = alloca i8*
store i8* %.tmp9470, i8** %tmpl.9471
%args.9472 = alloca %.Args.type
%.tmp9473 = getelementptr %.Args.type, %.Args.type* %args.9472, i32 0, i32 0
store i8* null, i8** %.tmp9473
%.tmp9474 = getelementptr %.Args.type, %.Args.type* %args.9472, i32 0, i32 1
store i8* null, i8** %.tmp9474
%.tmp9475 = getelementptr %.Args.type, %.Args.type* %args.9472, i32 0, i32 2
store i8* null, i8** %.tmp9475
%.tmp9476 = getelementptr %.Args.type, %.Args.type* %args.9472, i32 0, i32 3
store i8** null, i8*** %.tmp9476
%.tmp9477 = load i32, i32* %argc
%.tmp9478 = icmp slt i32 %.tmp9477, 2
br i1 %.tmp9478, label %.if.true.9479, label %.if.false.9479
.if.true.9479:
%.tmp9480 = load i8*, i8** %tmpl.9471
%.tmp9481 = load i8**, i8*** %argv
%.tmp9482 = getelementptr i8*, i8** %.tmp9481, i32 0
%.tmp9483 = load i8*, i8** %.tmp9482
%.tmp9484 = call i32(i8*,...) @printf(i8* %.tmp9480, i8* %.tmp9483)
call void(i32) @exit(i32 1)
br label %.if.end.9479
.if.false.9479:
br label %.if.end.9479
.if.end.9479:
%fp.9485 = alloca i32
store i32 1, i32* %fp.9485
%.tmp9486 = getelementptr %.Args.type, %.Args.type* %args.9472, i32 0, i32 0
%.tmp9488 = getelementptr [8 x i8], [8 x i8]*@.str9487, i32 0, i32 0
store i8* %.tmp9488, i8** %.tmp9486
%.tmp9489 = load i8**, i8*** %argv
%.tmp9490 = getelementptr i8*, i8** %.tmp9489, i32 1
%.tmp9491 = load i8*, i8** %.tmp9490
%.tmp9493 = getelementptr [4 x i8], [4 x i8]*@.str9492, i32 0, i32 0
%.tmp9494 = call i32(i8*,i8*) @strcmp(i8* %.tmp9491, i8* %.tmp9493)
%.tmp9495 = icmp eq i32 %.tmp9494, 0
br i1 %.tmp9495, label %.if.true.9496, label %.if.false.9496
.if.true.9496:
%.tmp9497 = getelementptr %.Args.type, %.Args.type* %args.9472, i32 0, i32 0
%.tmp9499 = getelementptr [4 x i8], [4 x i8]*@.str9498, i32 0, i32 0
store i8* %.tmp9499, i8** %.tmp9497
store i32 2, i32* %fp.9485
br label %.if.end.9496
.if.false.9496:
br label %.if.end.9496
.if.end.9496:
%.tmp9500 = load i32, i32* %argc
%.tmp9501 = load i32, i32* %fp.9485
%.tmp9502 = add i32 %.tmp9501, 1
%.tmp9503 = icmp slt i32 %.tmp9500, %.tmp9502
br i1 %.tmp9503, label %.if.true.9504, label %.if.false.9504
.if.true.9504:
%.tmp9505 = load i8*, i8** %tmpl.9471
%.tmp9506 = load i8**, i8*** %argv
%.tmp9507 = getelementptr i8*, i8** %.tmp9506, i32 0
%.tmp9508 = load i8*, i8** %.tmp9507
%.tmp9509 = call i32(i8*,...) @printf(i8* %.tmp9505, i8* %.tmp9508)
call void(i32) @exit(i32 1)
br label %.if.end.9504
.if.false.9504:
br label %.if.end.9504
.if.end.9504:
%.tmp9510 = getelementptr %.Args.type, %.Args.type* %args.9472, i32 0, i32 1
%.tmp9511 = load i32, i32* %fp.9485
%.tmp9512 = load i8**, i8*** %argv
%.tmp9513 = getelementptr i8*, i8** %.tmp9512, i32 %.tmp9511
%.tmp9514 = load i8*, i8** %.tmp9513
store i8* %.tmp9514, i8** %.tmp9510
%.tmp9515 = getelementptr %.Args.type, %.Args.type* %args.9472, i32 0, i32 1
%.tmp9516 = load i8*, i8** %.tmp9515
%.tmp9517 = call {i8*,i8*}(i8*) @m2$splitext.scpcp.cp(i8* %.tmp9516)
%ext.9518 = alloca {i8*,i8*}
store {i8*,i8*} %.tmp9517, {i8*,i8*}* %ext.9518
%.tmp9519 = getelementptr %.Args.type, %.Args.type* %args.9472, i32 0, i32 2
%.tmp9520 = getelementptr {i8*,i8*}, {i8*,i8*}* %ext.9518, i32 0, i32 0
%.tmp9521 = load i8*, i8** %.tmp9520
store i8* %.tmp9521, i8** %.tmp9519
%.tmp9522 = load i32, i32* %argc
%.tmp9523 = load i32, i32* %fp.9485
%.tmp9524 = sub i32 %.tmp9522, %.tmp9523
%.tmp9525 = add i32 %.tmp9524, 1
%ac.9526 = alloca i32
store i32 %.tmp9525, i32* %ac.9526
%.tmp9527 = getelementptr %.Args.type, %.Args.type* %args.9472, i32 0, i32 3
%.tmp9528 = load i32, i32* %ac.9526
%.tmp9529 = mul i32 8, %.tmp9528
%.tmp9530 = call i8*(i32) @malloc(i32 %.tmp9529)
%.tmp9531 = bitcast i8* %.tmp9530 to i8**
store i8** %.tmp9531, i8*** %.tmp9527
%.tmp9532 = getelementptr %.Args.type, %.Args.type* %args.9472, i32 0, i32 3
%.tmp9533 = load i8**, i8*** %.tmp9532
%.tmp9534 = getelementptr i8*, i8** %.tmp9533, i32 0
%.tmp9535 = getelementptr %.Args.type, %.Args.type* %args.9472, i32 0, i32 2
%.tmp9536 = load i8*, i8** %.tmp9535
store i8* %.tmp9536, i8** %.tmp9534
%i.9538 = alloca i32
store i32 0, i32* %i.9538
br label %.for.start.9537
.for.start.9537:
%.tmp9539 = load i32, i32* %i.9538
%.tmp9540 = load i32, i32* %argc
%.tmp9541 = load i32, i32* %fp.9485
%.tmp9542 = sub i32 %.tmp9540, %.tmp9541
%.tmp9543 = icmp slt i32 %.tmp9539, %.tmp9542
br i1 %.tmp9543, label %.for.continue.9537, label %.for.end.9537
.for.continue.9537:
%.tmp9544 = getelementptr %.Args.type, %.Args.type* %args.9472, i32 0, i32 3
%.tmp9545 = load i32, i32* %i.9538
%.tmp9546 = add i32 %.tmp9545, 1
%.tmp9547 = load i8**, i8*** %.tmp9544
%.tmp9548 = getelementptr i8*, i8** %.tmp9547, i32 %.tmp9546
%.tmp9549 = load i32, i32* %fp.9485
%.tmp9550 = load i32, i32* %i.9538
%.tmp9551 = add i32 %.tmp9549, %.tmp9550
%.tmp9552 = add i32 %.tmp9551, 1
%.tmp9553 = load i8**, i8*** %argv
%.tmp9554 = getelementptr i8*, i8** %.tmp9553, i32 %.tmp9552
%.tmp9555 = load i8*, i8** %.tmp9554
store i8* %.tmp9555, i8** %.tmp9548
%.tmp9556 = load i32, i32* %i.9538
%.tmp9557 = add i32 %.tmp9556, 1
store i32 %.tmp9557, i32* %i.9538
br label %.for.start.9537
.for.end.9537:
%.tmp9558 = load %.Args.type, %.Args.type* %args.9472
ret %.Args.type %.tmp9558
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
@.str1108 = constant [2 x i8] c"(\00"
@.str1130 = constant [2 x i8] c")\00"
@.str1138 = constant [19 x i8] c"Bracket not closed\00"
@.str1154 = constant [5 x i8] c"WORD\00"
@.str1163 = constant [7 x i8] c"STRING\00"
@.str1185 = constant [2 x i8] c"|\00"
@.str1208 = constant [2 x i8] c"+\00"
@.str1222 = constant [2 x i8] c"*\00"
@.str1236 = constant [2 x i8] c"?\00"
@.str1265 = constant [7 x i8] c"STRING\00"
@.str1290 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1306 = constant [5 x i8] c"WORD\00"
@.str1311 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1325 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1334 = constant [1 x i8] c"\00"
@.str1342 = constant [2 x i8] c"[\00"
@.str1373 = constant [2 x i8] c":\00"
@.str1384 = constant [1 x i8] c"\00"
@.str1388 = constant [35 x i8] c"expected : after rule name, got %s\00"
@.str1434 = constant [3 x i8] c"NL\00"
@.str1442 = constant [4 x i8] c"EOF\00"
@.str1448 = constant [58 x i8] c"[%d, %d]: rule must terminate with newline, got: '%s' %s\0A\00"
@.str1498 = constant [4 x i8] c"EOF\00"
@.str1507 = constant [3 x i8] c"NL\00"
@.str1769 = constant [1 x i8] c"\00"
@.str1809 = constant [22 x i8] c"Matcher type is null\0A\00"
@.str1822 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1836 = constant [43 x i8] c"Unable to match token by value: %s != \22%s\22\00"
@.str1877 = constant [22 x i8] c"Matcher type is null\0A\00"
@.str1892 = constant [54 x i8] c"Unable to match token by type, expecing \22%s\22 got \22%s\22\00"
@.str1944 = constant [26 x i8] c"Unable to find alias rule\00"
@.str1962 = constant [33 x i8] c"CRITICAL: Parser not implemented\00"
@.str2039 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str2059 = constant [4 x i8] c"EOF\00"
@.str2073 = constant [32 x i8] c"SyntaxError: parsing ended here\00"
@.str2108 = constant [2 x i8] c"\0A\00"
@.str2117 = constant [3 x i8] c"  \00"
@.str2126 = constant [7 x i8] c"(null)\00"
@.str2130 = constant [2 x i8] c"{\00"
@.str2136 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str2145 = constant [12 x i8] c"\22value\22: %s\00"
@.str2154 = constant [11 x i8] c"\22line\22: %d\00"
@.str2163 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str2172 = constant [9 x i8] c"\22next\22: \00"
@.str2184 = constant [13 x i8] c"\22children\22: \00"
@.str2197 = constant [2 x i8] c"}\00"
@.str2201 = constant [1886 x i8] c"
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
@.str2204 = constant [1885 x i8] c"%%%1$s.tmp0 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
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
@.str2210 = constant [1 x i8] c"\00"
@.str2226 = constant [6 x i8] c"%s\5C22\00"
@.str2251 = constant [6 x i8] c"%s\5C0A\00"
@.str2265 = constant [6 x i8] c"%s\5C5C\00"
@.str2281 = constant [8 x i8] c"%s\5C%c%c\00"
@.str2299 = constant [5 x i8] c"%s%c\00"
@.str2308 = constant [5 x i8] c"%s%c\00"
@.str2319 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2356 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2361 = constant [3 x i8] c"%d\00"
@.str2369 = constant [6 x i8] c"'\5C%x'\00"
@.str2374 = constant [3 x i8] c"%d\00"
@.str2382 = constant [6 x i8] c"'\5C%c'\00"
@.str2389 = constant [3 x i8] c"10\00"
@.str2396 = constant [5 x i8] c"'%c'\00"
@.str2401 = constant [3 x i8] c"%d\00"
@.str2450 = constant [16 x i8] c"mono_assignable\00"
@.str2461 = constant [9 x i8] c"operator\00"
@.str2498 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2545 = constant [2 x i8] c"+\00"
@.str2552 = constant [2 x i8] c"-\00"
@.str2561 = constant [2 x i8] c"*\00"
@.str2568 = constant [2 x i8] c"/\00"
@.str2576 = constant [2 x i8] c"%\00"
@.str2585 = constant [3 x i8] c"==\00"
@.str2592 = constant [3 x i8] c"!=\00"
@.str2601 = constant [3 x i8] c">=\00"
@.str2608 = constant [3 x i8] c"<=\00"
@.str2617 = constant [2 x i8] c">\00"
@.str2624 = constant [2 x i8] c"<\00"
@.str2633 = constant [2 x i8] c"&\00"
@.str2641 = constant [2 x i8] c"|\00"
@.str2646 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
@.str2657 = constant [2 x i8] c"?\00"
@.str2663 = constant [54 x i8] c"called 'repr' with malformed type, container is null.\00"
@.str2669 = constant [4 x i8] c"int\00"
@.str2674 = constant [4 x i8] c"i32\00"
@.str2679 = constant [5 x i8] c"void\00"
@.str2684 = constant [5 x i8] c"void\00"
@.str2689 = constant [5 x i8] c"bool\00"
@.str2694 = constant [3 x i8] c"i1\00"
@.str2699 = constant [8 x i8] c"nullptr\00"
@.str2704 = constant [4 x i8] c"ptr\00"
@.str2709 = constant [4 x i8] c"chr\00"
@.str2714 = constant [3 x i8] c"i8\00"
@.str2719 = constant [9 x i8] c"function\00"
@.str2725 = constant [4 x i8] c"%s(\00"
@.str2751 = constant [4 x i8] c"%s,\00"
@.str2756 = constant [5 x i8] c"%s%s\00"
@.str2767 = constant [4 x i8] c"%s)\00"
@.str2775 = constant [4 x i8] c"ptr\00"
@.str2781 = constant [4 x i8] c"%s*\00"
@.str2793 = constant [7 x i8] c"struct\00"
@.str2799 = constant [2 x i8] c"{\00"
@.str2816 = constant [4 x i8] c"%s,\00"
@.str2821 = constant [5 x i8] c"%s%s\00"
@.str2832 = constant [4 x i8] c"%s}\00"
@.str2840 = constant [6 x i8] c"array\00"
@.str2846 = constant [10 x i8] c"[%s x %s]\00"
@.str2865 = constant [10 x i8] c"typealias\00"
@.str2871 = constant [5 x i8] c"%%%s\00"
@.str2881 = constant [7 x i8] c"vararg\00"
@.str2886 = constant [4 x i8] c"...\00"
@.str2891 = constant [6 x i8] c"error\00"
@.str2896 = constant [53 x i8] c":coffee-error: 'repr' not implemented for type '%s'\0A\00"
@.str2912 = constant [8 x i8] c"nullptr\00"
@.str2919 = constant [8 x i8] c"nullptr\00"
@.str2928 = constant [4 x i8] c"ptr\00"
@.str2935 = constant [4 x i8] c"ptr\00"
@.str2943 = constant [10 x i8] c"typealias\00"
@.str2957 = constant [10 x i8] c"typealias\00"
@.str3016 = constant [12 x i8] c"COFFEE_ROOT\00"
@.str3023 = constant [5 x i8] c"HOME\00"
@.str3028 = constant [11 x i8] c"%s/.coffee\00"
@.str3116 = constant [1 x i8] c"\00"
@.str3162 = constant [5 x i8] c"%c%s\00"
@.str3174 = constant [7 x i8] c".tmp%d\00"
@.str3260 = constant [39 x i8] c"Grammar error unable to create context\00"
@.str3282 = constant [1 x i8] c"\00"
@.str3327 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str3345 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str3364 = constant [6 x i8] c"start\00"
@.str3443 = constant [6 x i8] c"start\00"
@.str3450 = constant [29 x i8] c"Expecting 'start' expression\00"
@.str3453 = constant [7 x i8] c"global\00"
@.str3465 = constant [13 x i8] c"head_comment\00"
@.str3509 = constant [1 x i8] c"\00"
@.str3533 = constant [7 x i8] c"string\00"
@.str3541 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3561 = constant [7 x i8] c"extern\00"
@.str3575 = constant [15 x i8] c"declare %s %s(\00"
@.str3611 = constant [3 x i8] c", \00"
@.str3617 = constant [3 x i8] c"%s\00"
@.str3629 = constant [3 x i8] c")\0A\00"
@.str3646 = constant [5 x i8] c"%s%s\00"
@.str3654 = constant [9 x i8] c"function\00"
@.str3660 = constant [5 x i8] c"main\00"
@.str3675 = constant [6 x i8] c"%s.%s\00"
@.str3696 = constant [3 x i8] c"NL\00"
@.str3704 = constant [7 x i8] c"global\00"
@.str3712 = constant [11 x i8] c"assignable\00"
@.str3743 = constant [9 x i8] c"variable\00"
@.str3755 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3770 = constant [10 x i8] c"typealias\00"
@.str3792 = constant [11 x i8] c"%s.%s.type\00"
@.str3804 = constant [10 x i8] c"typealias\00"
@.str3826 = constant [5 x i8] c"type\00"
@.str3856 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3869 = constant [7 x i8] c"extern\00"
@.str3887 = constant [7 x i8] c"extern\00"
@.str3928 = constant [7 x i8] c"extern\00"
@.str3940 = constant [9 x i8] c"function\00"
@.str3949 = constant [9 x i8] c"function\00"
@.str3988 = constant [14 x i8] c"define %s %s(\00"
@.str4017 = constant [3 x i8] c", \00"
@.str4023 = constant [5 x i8] c"type\00"
@.str4039 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str4054 = constant [5 x i8] c") {\0A\00"
@.str4058 = constant [9 x i8] c"function\00"
@.str4068 = constant [6 x i8] c"block\00"
@.str4083 = constant [3 x i8] c"}\0A\00"
@.str4089 = constant [7 x i8] c"import\00"
@.str4145 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str4206 = constant [5 x i8] c"m%d$\00"
@.str4257 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str4266 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str4298 = constant [9 x i8] c"variable\00"
@.str4303 = constant [5 x i8] c"type\00"
@.str4335 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4348 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str4360 = constant [6 x i8] c"block\00"
@.str4368 = constant [12 x i8] c"expressions\00"
@.str4399 = constant [7 x i8] c"struct\00"
@.str4404 = constant [7 x i8] c"WhAT!\0A\00"
@.str4444 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4456 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4482 = constant [7 x i8] c"struct\00"
@.str4487 = constant [7 x i8] c"WhAT!\0A\00"
@.str4518 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4530 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4555 = constant [7 x i8] c"sizeof\00"
@.str4561 = constant [8 x i8] c"fn_args\00"
@.str4568 = constant [11 x i8] c"assignable\00"
@.str4596 = constant [4 x i8] c"int\00"
@.str4609 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4618 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4629 = constant [7 x i8] c"append\00"
@.str4635 = constant [8 x i8] c"fn_args\00"
@.str4642 = constant [11 x i8] c"assignable\00"
@.str4649 = constant [11 x i8] c"assignable\00"
@.str4673 = constant [5 x i8] c".b%d\00"
@.str4707 = constant [8 x i8] c"realloc\00"
@.str4716 = constant [9 x i8] c"function\00"
@.str4729 = constant [4 x i8] c"ptr\00"
@.str4746 = constant [4 x i8] c"chr\00"
@.str4763 = constant [4 x i8] c"ptr\00"
@.str4784 = constant [4 x i8] c"chr\00"
@.str4805 = constant [4 x i8] c"int\00"
@.str4808 = constant [8 x i8] c"realloc\00"
@.str4810 = constant [7 x i8] c"extern\00"
@.str4817 = constant [4 x i8] c"len\00"
@.str4823 = constant [8 x i8] c"fn_args\00"
@.str4830 = constant [11 x i8] c"assignable\00"
@.str4838 = constant [1 x i8] c"\00"
@.str4854 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str4875 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str4881 = constant [1 x i8] c"\00"
@.str4887 = constant [6 x i8] c"%s.bn\00"
@.str4892 = constant [9 x i8] c"%s/%s.bn\00"
@.str4916 = constant [35 x i8] c"unable to compile function address\00"
@.str4922 = constant [8 x i8] c"fn_args\00"
@.str4926 = constant [1 x i8] c"\00"
@.str4935 = constant [4 x i8] c"ptr\00"
@.str4955 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str4979 = constant [11 x i8] c"assignable\00"
@.str5003 = constant [11 x i8] c"assignable\00"
@.str5015 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str5033 = constant [5 x i8] c"%s, \00"
@.str5058 = constant [7 x i8] c"vararg\00"
@.str5071 = constant [1 x i8] c"\00"
@.str5075 = constant [58 x i8] c"types.Type for argument %d does not match: '%s', got '%s'\00"
@.str5092 = constant [8 x i8] c"%s%s %s\00"
@.str5109 = constant [7 x i8] c"vararg\00"
@.str5120 = constant [11 x i8] c"assignable\00"
@.str5129 = constant [7 x i8] c"vararg\00"
@.str5135 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str5171 = constant [7 x i8] c"vararg\00"
@.str5182 = constant [42 x i8] c"Function '%s' takes %d arguments, 0 given\00"
@.str5200 = constant [5 x i8] c"void\00"
@.str5208 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str5240 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str5266 = constant [7 x i8] c"return\00"
@.str5272 = constant [9 x i8] c"function\00"
@.str5281 = constant [40 x i8] c"'return' used outside of function scope\00"
@.str5290 = constant [3 x i8] c"NL\00"
@.str5315 = constant [1 x i8] c"\00"
@.str5319 = constant [67 x i8] c"trying to return '%s' from function declared with return type '%s'\00"
@.str5338 = constant [11 x i8] c"ret %s %s\0A\00"
@.str5351 = constant [10 x i8] c"ret void\0A\00"
@.str5355 = constant [3 x i8] c"NL\00"
@.str5361 = constant [8 x i8] c"fn_call\00"
@.str5372 = constant [12 x i8] c"declaration\00"
@.str5381 = constant [11 x i8] c"assignment\00"
@.str5389 = constant [11 x i8] c"assignable\00"
@.str5417 = constant [1 x i8] c"\00"
@.str5421 = constant [37 x i8] c"cannot assign type '%s' to type '%s'\00"
@.str5450 = constant [4 x i8] c"ptr\00"
@.str5459 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5469 = constant [9 x i8] c"if_block\00"
@.str5477 = constant [9 x i8] c"for_loop\00"
@.str5485 = constant [8 x i8] c"keyword\00"
@.str5491 = constant [4 x i8] c"for\00"
@.str5498 = constant [1 x i8] c"\00"
@.str5502 = constant [42 x i8] c"'%s' keyword used outside 'for' statement\00"
@.str5518 = constant [6 x i8] c"break\00"
@.str5526 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5537 = constant [9 x i8] c"continue\00"
@.str5545 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5552 = constant [9 x i8] c"function\00"
@.str5561 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str5592 = constant [4 x i8] c"ptr\00"
@.str5601 = constant [4 x i8] c"chr\00"
@.str5612 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5621 = constant [9 x i8] c"function\00"
@.str5634 = constant [5 x i8] c"void\00"
@.str5664 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5666 = constant [7 x i8] c"extern\00"
@.str5674 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5683 = constant [9 x i8] c"function\00"
@.str5698 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5700 = constant [7 x i8] c"extern\00"
@.str5708 = constant [5 x i8] c"mmap\00"
@.str5717 = constant [9 x i8] c"function\00"
@.str5743 = constant [4 x i8] c"int\00"
@.str5755 = constant [4 x i8] c"int\00"
@.str5767 = constant [4 x i8] c"int\00"
@.str5779 = constant [4 x i8] c"int\00"
@.str5791 = constant [4 x i8] c"int\00"
@.str5797 = constant [5 x i8] c"mmap\00"
@.str5799 = constant [7 x i8] c"extern\00"
@.str5805 = constant [5 x i8] c"WORD\00"
@.str5828 = constant [9 x i8] c"function\00"
@.str5852 = constant [4 x i8] c"ptr\00"
@.str5861 = constant [7 x i8] c"struct\00"
@.str5875 = constant [1 x i8] c"\00"
@.str5879 = constant [5 x i8] c"@.%d\00"
@.str5893 = constant [101 x i8] c"%%.tmem%d = call i8*(i8*,i32,i32,i32,i32,i32) @mmap(i8* null, i32 72, i32 7, i32 34, i32 -1, i32 0)\0A\00"
@.str5900 = constant [100 x i8] c"call void(i8*,i8*,i8*) @llvm.init.trampoline(i8* %%.tmem%d, i8* bitcast (%s* %s to i8*), i8* null)\0A\00"
@.str5911 = constant [66 x i8] c"%%.trmp%d = call i8*(i8*) @llvm.adjust.trampoline(i8* %%.tmem%d)\0A\00"
@.str5919 = constant [35 x i8] c"%s = bitcast i8* %%.trmp%d to %s*\0A\00"
@.str5940 = constant [14 x i8] c"define %s %s(\00"
@.str5948 = constant [9 x i8] c"function\00"
@.str5956 = constant [13 x i8] c"%s nest %%.0\00"
@.str5983 = constant [3 x i8] c", \00"
@.str5989 = constant [5 x i8] c"type\00"
@.str6005 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str6020 = constant [5 x i8] c") {\0A\00"
@.str6028 = constant [6 x i8] c"block\00"
@.str6041 = constant [3 x i8] c"}\0A\00"
@.str6067 = constant [12 x i8] c"expressions\00"
@.str6083 = constant [3 x i8] c"NL\00"
@.str6100 = constant [7 x i8] c"return\00"
@.str6108 = constant [5 x i8] c"void\00"
@.str6119 = constant [21 x i8] c"Missing return value\00"
@.str6124 = constant [10 x i8] c"ret void\0A\00"
@.str6141 = constant [14 x i8] c".for.start.%d\00"
@.str6146 = constant [12 x i8] c".for.end.%d\00"
@.str6151 = constant [4 x i8] c"for\00"
@.str6159 = constant [12 x i8] c"declaration\00"
@.str6170 = constant [11 x i8] c"assignment\00"
@.str6180 = constant [9 x i8] c"OPERATOR\00"
@.str6187 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str6198 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str6205 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str6212 = constant [9 x i8] c"OPERATOR\00"
@.str6223 = constant [9 x i8] c"OPERATOR\00"
@.str6230 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str6239 = constant [9 x i8] c"OPERATOR\00"
@.str6244 = constant [6 x i8] c"block\00"
@.str6249 = constant [11 x i8] c"else_block\00"
@.str6259 = constant [13 x i8] c".for.else.%d\00"
@.str6266 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str6281 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str6300 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6310 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str6317 = constant [6 x i8] c"block\00"
@.str6326 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6333 = constant [5 x i8] c"%s:\0A\00"
@.str6347 = constant [5 x i8] c"type\00"
@.str6362 = constant [11 x i8] c"assignable\00"
@.str6377 = constant [9 x i8] c"variable\00"
@.str6382 = constant [5 x i8] c"WORD\00"
@.str6391 = constant [31 x i8] c"unable to get declaration name\00"
@.str6411 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6423 = constant [6 x i8] c"%s.%d\00"
@.str6476 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str6493 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str6505 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6546 = constant [4 x i8] c"int\00"
@.str6553 = constant [4 x i8] c"chr\00"
@.str6561 = constant [5 x i8] c"bool\00"
@.str6570 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str6579 = constant [4 x i8] c"ptr\00"
@.str6587 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6590 = constant [5 x i8] c"null\00"
@.str6598 = constant [7 x i8] c"struct\00"
@.str6619 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6639 = constant [10 x i8] c"typealias\00"
@.str6662 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6682 = constant [6 x i8] c"error\00"
@.str6689 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str6706 = constant [11 x i8] c"assignable\00"
@.str6723 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str6738 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str6745 = constant [6 x i8] c"block\00"
@.str6754 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6761 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str6768 = constant [11 x i8] c"elif_block\00"
@.str6780 = constant [11 x i8] c"else_block\00"
@.str6790 = constant [6 x i8] c"block\00"
@.str6800 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6807 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str6828 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str6837 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str6871 = constant [1 x i8] c"\00"
@.str6882 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6902 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6937 = constant [7 x i8] c"module\00"
@.str6990 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str7027 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str7035 = constant [9 x i8] c"function\00"
@.str7042 = constant [7 x i8] c"extern\00"
@.str7054 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str7075 = constant [9 x i8] c"variable\00"
@.str7097 = constant [4 x i8] c"ptr\00"
@.str7116 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str7140 = constant [10 x i8] c"typealias\00"
@.str7151 = constant [7 x i8] c"struct\00"
@.str7157 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str7209 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str7230 = constant [9 x i8] c"variable\00"
@.str7241 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str7262 = constant [9 x i8] c"variable\00"
@.str7270 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str7284 = constant [17 x i8] c"addr_destination\00"
@.str7291 = constant [16 x i8] c"mono_assignable\00"
@.str7299 = constant [11 x i8] c"assignable\00"
@.str7313 = constant [12 x i8] c"destination\00"
@.str7318 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str7346 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str7365 = constant [7 x i8] c"module\00"
@.str7387 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str7458 = constant [6 x i8] c"slice\00"
@.str7471 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str7513 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str7534 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str7558 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str7581 = constant [16 x i8] c"mono_assignable\00"
@.str7607 = constant [5 x i8] c"cast\00"
@.str7617 = constant [5 x i8] c"type\00"
@.str7642 = constant [8 x i8] c"bitcast\00"
@.str7657 = constant [6 x i8] c"slice\00"
@.str7662 = constant [48 x i8] c"Casting array to slices is not implemented yet\0A\00"
@.str7670 = constant [4 x i8] c"ptr\00"
@.str7677 = constant [4 x i8] c"ptr\00"
@.str7696 = constant [4 x i8] c"i%d\00"
@.str7701 = constant [4 x i8] c"i%d\00"
@.str7709 = constant [5 x i8] c"sext\00"
@.str7711 = constant [6 x i8] c"trunc\00"
@.str7716 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str7736 = constant [16 x i8] c"mono_assignable\00"
@.str7798 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str7821 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str7828 = constant [2 x i8] c"+\00"
@.str7833 = constant [4 x i8] c"add\00"
@.str7838 = constant [2 x i8] c"-\00"
@.str7843 = constant [4 x i8] c"sub\00"
@.str7848 = constant [2 x i8] c"*\00"
@.str7853 = constant [4 x i8] c"mul\00"
@.str7858 = constant [2 x i8] c"/\00"
@.str7863 = constant [5 x i8] c"sdiv\00"
@.str7868 = constant [3 x i8] c"==\00"
@.str7873 = constant [8 x i8] c"icmp eq\00"
@.str7878 = constant [3 x i8] c"!=\00"
@.str7883 = constant [8 x i8] c"icmp ne\00"
@.str7888 = constant [2 x i8] c">\00"
@.str7893 = constant [9 x i8] c"icmp sgt\00"
@.str7898 = constant [2 x i8] c"<\00"
@.str7903 = constant [9 x i8] c"icmp slt\00"
@.str7908 = constant [2 x i8] c"&\00"
@.str7913 = constant [4 x i8] c"and\00"
@.str7918 = constant [2 x i8] c"|\00"
@.str7923 = constant [3 x i8] c"or\00"
@.str7928 = constant [3 x i8] c">=\00"
@.str7933 = constant [9 x i8] c"icmp sge\00"
@.str7938 = constant [3 x i8] c"<=\00"
@.str7943 = constant [9 x i8] c"icmp sle\00"
@.str7948 = constant [2 x i8] c"%\00"
@.str7953 = constant [5 x i8] c"srem\00"
@.str7957 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str7964 = constant [4 x i8] c"add\00"
@.str7971 = constant [3 x i8] c"==\00"
@.str7978 = constant [3 x i8] c"!=\00"
@.str7986 = constant [2 x i8] c"|\00"
@.str7994 = constant [2 x i8] c"&\00"
@.str8002 = constant [2 x i8] c">\00"
@.str8010 = constant [2 x i8] c"<\00"
@.str8018 = constant [3 x i8] c">=\00"
@.str8026 = constant [3 x i8] c"<=\00"
@.str8034 = constant [5 x i8] c"bool\00"
@.str8038 = constant [4 x i8] c"int\00"
@.str8052 = constant [7 x i8] c"NUMBER\00"
@.str8066 = constant [4 x i8] c"int\00"
@.str8080 = constant [5 x i8] c"WORD\00"
@.str8090 = constant [5 x i8] c"null\00"
@.str8097 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str8111 = constant [5 x i8] c"null\00"
@.str8120 = constant [8 x i8] c"nullptr\00"
@.str8127 = constant [17 x i8] c"addr_destination\00"
@.str8139 = constant [12 x i8] c"destination\00"
@.str8189 = constant [4 x i8] c"ptr\00"
@.str8208 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str8222 = constant [9 x i8] c"function\00"
@.str8237 = constant [4 x i8] c"ptr\00"
@.str8245 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str8259 = constant [8 x i8] c"boolean\00"
@.str8273 = constant [5 x i8] c"bool\00"
@.str8282 = constant [6 x i8] c"false\00"
@.str8289 = constant [2 x i8] c"0\00"
@.str8293 = constant [2 x i8] c"1\00"
@.str8300 = constant [8 x i8] c"fn_call\00"
@.str8317 = constant [7 x i8] c"STRING\00"
@.str8343 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str8359 = constant [4 x i8] c"ptr\00"
@.str8372 = constant [4 x i8] c"chr\00"
@.str8379 = constant [4 x i8] c"CHR\00"
@.str8395 = constant [2 x i8] c"0\00"
@.str8411 = constant [22 x i8] c"Invalid character: %s\00"
@.str8427 = constant [4 x i8] c"chr\00"
@.str8431 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str8459 = constant [22 x i8] c"called 'abbr' on null\00"
@.str8465 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str8470 = constant [4 x i8] c"int\00"
@.str8475 = constant [2 x i8] c"i\00"
@.str8480 = constant [5 x i8] c"bool\00"
@.str8485 = constant [2 x i8] c"b\00"
@.str8490 = constant [5 x i8] c"void\00"
@.str8495 = constant [2 x i8] c"v\00"
@.str8500 = constant [4 x i8] c"chr\00"
@.str8505 = constant [2 x i8] c"c\00"
@.str8510 = constant [4 x i8] c"ptr\00"
@.str8517 = constant [4 x i8] c"%sp\00"
@.str8528 = constant [10 x i8] c"typealias\00"
@.str8539 = constant [7 x i8] c"struct\00"
@.str8544 = constant [2 x i8] c"s\00"
@.str8555 = constant [5 x i8] c"%s%s\00"
@.str8568 = constant [9 x i8] c"function\00"
@.str8573 = constant [2 x i8] c"f\00"
@.str8578 = constant [6 x i8] c"error\00"
@.str8583 = constant [2 x i8] c"?\00"
@.str8585 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str8597 = constant [7 x i8] c".str%d\00"
@.str8612 = constant [6 x i8] c"array\00"
@.str8625 = constant [4 x i8] c"chr\00"
@.str8646 = constant [3 x i8] c"%d\00"
@.str8653 = constant [7 x i8] c"string\00"
@.str8689 = constant [7 x i8] c"module\00"
@.str8740 = constant [4 x i8] c"%s\0A\00"
@.str8859 = constant [9 x i8] c"function\00"
@.str8877 = constant [5 x i8] c"WORD\00"
@.str8934 = constant [10 x i8] c"fn_params\00"
@.str8948 = constant [11 x i8] c"basic_type\00"
@.str8969 = constant [13 x i8] c"type_trailer\00"
@.str8978 = constant [9 x i8] c"function\00"
@.str8994 = constant [15 x i8] c"type_fn_params\00"
@.str9035 = constant [4 x i8] c"ptr\00"
@.str9047 = constant [10 x i8] c"structdef\00"
@.str9054 = constant [7 x i8] c"struct\00"
@.str9061 = constant [5 x i8] c"type\00"
@.str9092 = constant [5 x i8] c"type\00"
@.str9119 = constant [5 x i8] c"type\00"
@.str9125 = constant [12 x i8] c"dotted_name\00"
@.str9139 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str9152 = constant [6 x i8] c"error\00"
@.str9157 = constant [10 x i8] c"typealias\00"
@.str9181 = constant [4 x i8] c"str\00"
@.str9188 = constant [4 x i8] c"ptr\00"
@.str9197 = constant [4 x i8] c"chr\00"
@.str9202 = constant [5 x i8] c"WORD\00"
@.str9215 = constant [4 x i8] c"...\00"
@.str9222 = constant [7 x i8] c"vararg\00"
@.str9226 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str9247 = constant [2 x i8] c"*\00"
@.str9256 = constant [4 x i8] c"ptr\00"
@.str9265 = constant [2 x i8] c"[\00"
@.str9275 = constant [2 x i8] c"]\00"
@.str9284 = constant [7 x i8] c"struct\00"
@.str9288 = constant [6 x i8] c"slice\00"
@.str9294 = constant [4 x i8] c"ptr\00"
@.str9298 = constant [6 x i8] c"c_arr\00"
@.str9310 = constant [4 x i8] c"int\00"
@.str9314 = constant [4 x i8] c"len\00"
@.str9323 = constant [4 x i8] c"int\00"
@.str9327 = constant [4 x i8] c"cap\00"
@.str9338 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str9351 = constant [2 x i8] c"w\00"
@.str9367 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str9376 = constant [1 x i8] c"\00"
@.str9380 = constant [32 x i8] c"tee debug.ll | llc - -o debug.s\00"
@.str9385 = constant [2 x i8] c"w\00"
@.str9397 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9405 = constant [24 x i8] c"error on llc execution\0A\00"
@.str9409 = constant [17 x i8] c"cc debug.s -o %s\00"
@.str9415 = constant [2 x i8] c"w\00"
@.str9423 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9431 = constant [22 x i8] c"error on cc execution\00"
@.str9434 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str9451 = constant [4 x i8] c"run\00"
@.str9456 = constant [1 x i8] c"\00"
@.str9460 = constant [5 x i8] c"./%s\00"
@.str9469 = constant [22 x i8] c"Usage: %s <filename>\0A\00"
@.str9487 = constant [8 x i8] c"compile\00"
@.str9492 = constant [4 x i8] c"run\00"
@.str9498 = constant [4 x i8] c"run\00"
