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
store i32 0, i32* %curline.869
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
%.tmp896 = icmp slt i32 %.tmp890, %.tmp895
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
%.tmp913 = add i32 %.tmp912, 1
%.tmp914 = load i8*, i8** %buf.866
%.tmp915 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp909, i8* %.tmp911, i32 %.tmp913, i8* %.tmp914)
br label %.if.end.898
.if.false.898:
br label %.if.end.898
.if.end.898:
%.tmp916 = load i32, i32* %curline.869
%.tmp917 = add i32 %.tmp916, 1
store i32 %.tmp917, i32* %curline.869
br label %.for.start.868
.for.end.868:
%.tmp918 = load %m0$.File.type*, %m0$.File.type** %fd.857
%.tmp919 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp918)
%.tmp921 = getelementptr [1 x i8], [1 x i8]*@.str920, i32 0, i32 0
store i8* %.tmp921, i8** %buf.866
%i.923 = alloca i32
store i32 0, i32* %i.923
br label %.for.start.922
.for.start.922:
%.tmp924 = load i32, i32* %i.923
%.tmp925 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 1
%.tmp926 = load i32, i32* %.tmp925
%.tmp927 = icmp slt i32 %.tmp924, %.tmp926
br i1 %.tmp927, label %.for.continue.922, label %.for.end.922
.for.continue.922:
%.tmp928 = getelementptr i8*, i8** %buf.866, i32 0
%.tmp930 = getelementptr [5 x i8], [5 x i8]*@.str929, i32 0, i32 0
%.tmp931 = load i8*, i8** %buf.866
%.tmp932 = load i32, i32* %i.923
%.tmp933 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.847, i32 0, i32 0
%.tmp934 = load i8**, i8*** %.tmp933
%.tmp935 = getelementptr i8*, i8** %.tmp934, i32 %.tmp932
%.tmp936 = load i8*, i8** %.tmp935
%.tmp937 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp928, i8* %.tmp930, i8* %.tmp931, i8* %.tmp936)
%.tmp938 = load i32, i32* %i.923
%.tmp939 = add i32 %.tmp938, 1
store i32 %.tmp939, i32* %i.923
br label %.for.start.922
.for.end.922:
%.tmp940 = load i8*, i8** %buf.866
ret i8* %.tmp940
}
define i8* @m296$to_string.cp.m296$.Error.typep(%m296$.Error.type* %.e.arg) {
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp942 = getelementptr [1 x i8], [1 x i8]*@.str941, i32 0, i32 0
%buf.943 = alloca i8*
store i8* %.tmp942, i8** %buf.943
%.tmp944 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp945 = call i8*(%m296$.Error.type*) @m296$_context.cp.m296$.Error.typep(%m296$.Error.type* %.tmp944)
%ctx.946 = alloca i8*
store i8* %.tmp945, i8** %ctx.946
%.tmp947 = getelementptr i8*, i8** %buf.943, i32 0
%.tmp949 = getelementptr [24 x i8], [24 x i8]*@.str948, i32 0, i32 0
%.tmp950 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp951 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp950, i32 0, i32 2
%.tmp952 = load i8*, i8** %.tmp951
%.tmp953 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp954 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp953, i32 0, i32 0
%.tmp955 = load i32, i32* %.tmp954
%.tmp956 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp957 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp956, i32 0, i32 1
%.tmp958 = load i32, i32* %.tmp957
%.tmp959 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp960 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp959, i32 0, i32 3
%.tmp961 = load i8*, i8** %.tmp960
%.tmp962 = load i8*, i8** %ctx.946
%.tmp963 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp947, i8* %.tmp949, i8* %.tmp952, i32 %.tmp955, i32 %.tmp958, i8* %.tmp961, i8* %.tmp962)
%.tmp964 = load i8*, i8** %buf.943
ret i8* %.tmp964
}
define void @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.e.arg) {
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp965 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp966 = call i8*(%m296$.Error.type*) @m296$to_string.cp.m296$.Error.typep(%m296$.Error.type* %.tmp965)
%.tmp967 = call i32(i8*,...) @printf(i8* %.tmp966)
ret void
}
define void @m296$freport.v.m0$.File.typep.m296$.Error.typep(%m0$.File.type* %.fd.arg, %m296$.Error.type* %.e.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp968 = load %m0$.File.type*, %m0$.File.type** %fd
%.tmp969 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp970 = call i8*(%m296$.Error.type*) @m296$to_string.cp.m296$.Error.typep(%m296$.Error.type* %.tmp969)
%.tmp971 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp968, i8* %.tmp970)
ret void
}
%m972$.Query.type = type {i8,i8*,%m972$.Query.type*}
%m972$.Matcher.type = type {%m972$.Query.type*,i8,%m972$.Matcher.type*,%m972$.Matcher.type*}
%m972$.Rule.type = type {i8*,%m972$.Matcher.type*}
%m972$.ParsingContext.type = type {%m297$.Token.type*}
define %m972$.ParsingContext.type* @m972$new_context.m972$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.f.arg) {
%f = alloca %m0$.File.type*
store %m0$.File.type* %.f.arg, %m0$.File.type** %f
%.tmp973 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* null, i32 1
%.tmp974 = ptrtoint %m972$.ParsingContext.type* %.tmp973 to i32
%.tmp975 = call i8*(i32) @malloc(i32 %.tmp974)
%.tmp976 = bitcast i8* %.tmp975 to %m972$.ParsingContext.type*
%ctx.977 = alloca %m972$.ParsingContext.type*
store %m972$.ParsingContext.type* %.tmp976, %m972$.ParsingContext.type** %ctx.977
%.tmp978 = load %m0$.File.type*, %m0$.File.type** %f
%.tmp979 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp978)
%fd.980 = alloca i32
store i32 %.tmp979, i32* %fd.980
%.tmp981 = load i32, i32* %fd.980
%.tmp982 = call %m298$.PeekerInfo.type*(i32) @m298$new.m298$.PeekerInfo.typep.i(i32 %.tmp981)
%p.983 = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.tmp982, %m298$.PeekerInfo.type** %p.983
%.tmp984 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.983
%.tmp985 = call %m297$.Token.type*(%m298$.PeekerInfo.type*,i1) @m297$tokenize.m297$.Token.typep.m298$.PeekerInfo.typep.b(%m298$.PeekerInfo.type* %.tmp984, i1 0)
%token_list.986 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp985, %m297$.Token.type** %token_list.986
%.tmp987 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.983
%.tmp988 = bitcast %m298$.PeekerInfo.type* %.tmp987 to i8*
call void(i8*) @free(i8* %.tmp988)
%.tmp989 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx.977
%.tmp990 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp989, i32 0, i32 0
%.tmp991 = load %m297$.Token.type*, %m297$.Token.type** %token_list.986
store %m297$.Token.type* %.tmp991, %m297$.Token.type** %.tmp990
%.tmp992 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx.977
ret %m972$.ParsingContext.type* %.tmp992
}
define %m972$.Matcher.type* @m972$new_matcher.m972$.Matcher.typep() {
%.tmp993 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* null, i32 1
%.tmp994 = ptrtoint %m972$.Matcher.type* %.tmp993 to i32
%.tmp995 = call i8*(i32) @malloc(i32 %.tmp994)
%.tmp996 = bitcast i8* %.tmp995 to %m972$.Matcher.type*
%m.997 = alloca %m972$.Matcher.type*
store %m972$.Matcher.type* %.tmp996, %m972$.Matcher.type** %m.997
%.tmp998 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.997
%.tmp999 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp998, i32 0, i32 1
store i8 49, i8* %.tmp999
%.tmp1000 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.997
%.tmp1001 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1000, i32 0, i32 2
store %m972$.Matcher.type* null, %m972$.Matcher.type** %.tmp1001
%.tmp1002 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.997
%.tmp1003 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1002, i32 0, i32 3
store %m972$.Matcher.type* null, %m972$.Matcher.type** %.tmp1003
%.tmp1004 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.997
%.tmp1005 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1004, i32 0, i32 0
store %m972$.Query.type* null, %m972$.Query.type** %.tmp1005
%.tmp1006 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.997
ret %m972$.Matcher.type* %.tmp1006
}
define %m972$.Matcher.type* @m972$parse_matcher.m972$.Matcher.typep.m972$.ParsingContext.typep(%m972$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m972$.ParsingContext.type*
store %m972$.ParsingContext.type* %.ctx.arg, %m972$.ParsingContext.type** %ctx
%m.1007 = alloca %m972$.Matcher.type*
store %m972$.Matcher.type* null, %m972$.Matcher.type** %m.1007
%.tmp1008 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1009 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1008, i32 0, i32 0
%.tmp1010 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1009
%.tmp1011 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1010, i32 0, i32 1
%.tmp1012 = load i8*, i8** %.tmp1011
%.tmp1014 = getelementptr [2 x i8], [2 x i8]*@.str1013, i32 0, i32 0
%.tmp1015 = call i32(i8*,i8*) @strcmp(i8* %.tmp1012, i8* %.tmp1014)
%.tmp1016 = icmp eq i32 %.tmp1015, 0
br i1 %.tmp1016, label %.if.true.1017, label %.if.false.1017
.if.true.1017:
%.tmp1018 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1019 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1018, i32 0, i32 0
%.tmp1020 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1021 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1020, i32 0, i32 0
%.tmp1022 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1021
%.tmp1023 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1022, i32 0, i32 5
%.tmp1024 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1023
store %m297$.Token.type* %.tmp1024, %m297$.Token.type** %.tmp1019
%max_matchers.1025 = alloca i32
store i32 10, i32* %max_matchers.1025
%.tmp1026 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1027 = call %m972$.Matcher.type*(%m972$.ParsingContext.type*) @m972$parse_matcher.m972$.Matcher.typep.m972$.ParsingContext.typep(%m972$.ParsingContext.type* %.tmp1026)
store %m972$.Matcher.type* %.tmp1027, %m972$.Matcher.type** %m.1007
%.tmp1028 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1029 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1028, i32 0, i32 0
%.tmp1030 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1029
%.tmp1031 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1030, i32 0, i32 1
%.tmp1032 = load i8*, i8** %.tmp1031
%.tmp1034 = getelementptr [2 x i8], [2 x i8]*@.str1033, i32 0, i32 0
%.tmp1035 = call i32(i8*,i8*) @strcmp(i8* %.tmp1032, i8* %.tmp1034)
%.tmp1036 = icmp eq i32 %.tmp1035, 0
br i1 %.tmp1036, label %.if.true.1037, label %.if.false.1037
.if.true.1037:
%.tmp1038 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1039 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1038, i32 0, i32 0
%.tmp1040 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1041 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1040, i32 0, i32 0
%.tmp1042 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1041
%.tmp1043 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1042, i32 0, i32 5
%.tmp1044 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1043
store %m297$.Token.type* %.tmp1044, %m297$.Token.type** %.tmp1039
%.tmp1045 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.1007
%last_matcher.1046 = alloca %m972$.Matcher.type*
store %m972$.Matcher.type* %.tmp1045, %m972$.Matcher.type** %last_matcher.1046
br label %.for.start.1047
.for.start.1047:
%.tmp1048 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1049 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1048, i32 0, i32 0
%.tmp1050 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1049
%.tmp1051 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1050, i32 0, i32 1
%.tmp1052 = load i8*, i8** %.tmp1051
%.tmp1054 = getelementptr [2 x i8], [2 x i8]*@.str1053, i32 0, i32 0
%.tmp1055 = call i32(i8*,i8*) @strcmp(i8* %.tmp1052, i8* %.tmp1054)
%.tmp1056 = icmp ne i32 %.tmp1055, 0
%.tmp1057 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1058 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1057, i32 0, i32 0
%.tmp1059 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1058
%.tmp1060 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1059, i32 0, i32 0
%.tmp1061 = load i8*, i8** %.tmp1060
%.tmp1063 = getelementptr [4 x i8], [4 x i8]*@.str1062, i32 0, i32 0
%.tmp1064 = call i32(i8*,i8*) @strcmp(i8* %.tmp1061, i8* %.tmp1063)
%.tmp1065 = icmp ne i32 %.tmp1064, 0
%.tmp1066 = and i1 %.tmp1056, %.tmp1065
br i1 %.tmp1066, label %.for.continue.1047, label %.for.end.1047
.for.continue.1047:
%.tmp1067 = load %m972$.Matcher.type*, %m972$.Matcher.type** %last_matcher.1046
%.tmp1068 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1067, i32 0, i32 2
%.tmp1069 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1070 = call %m972$.Matcher.type*(%m972$.ParsingContext.type*) @m972$parse_matcher.m972$.Matcher.typep.m972$.ParsingContext.typep(%m972$.ParsingContext.type* %.tmp1069)
store %m972$.Matcher.type* %.tmp1070, %m972$.Matcher.type** %.tmp1068
%.tmp1071 = load %m972$.Matcher.type*, %m972$.Matcher.type** %last_matcher.1046
%.tmp1072 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1071, i32 0, i32 2
%.tmp1073 = load %m972$.Matcher.type*, %m972$.Matcher.type** %.tmp1072
store %m972$.Matcher.type* %.tmp1073, %m972$.Matcher.type** %last_matcher.1046
%.tmp1074 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1075 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1074, i32 0, i32 0
%.tmp1076 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1075
%.tmp1077 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1076, i32 0, i32 1
%.tmp1078 = load i8*, i8** %.tmp1077
%.tmp1080 = getelementptr [2 x i8], [2 x i8]*@.str1079, i32 0, i32 0
%.tmp1081 = call i32(i8*,i8*) @strcmp(i8* %.tmp1078, i8* %.tmp1080)
%.tmp1082 = icmp ne i32 %.tmp1081, 0
%.tmp1083 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1084 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1083, i32 0, i32 0
%.tmp1085 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1084
%.tmp1086 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1085, i32 0, i32 1
%.tmp1087 = load i8*, i8** %.tmp1086
%.tmp1089 = getelementptr [2 x i8], [2 x i8]*@.str1088, i32 0, i32 0
%.tmp1090 = call i32(i8*,i8*) @strcmp(i8* %.tmp1087, i8* %.tmp1089)
%.tmp1091 = icmp ne i32 %.tmp1090, 0
%.tmp1092 = and i1 %.tmp1082, %.tmp1091
br i1 %.tmp1092, label %.if.true.1093, label %.if.false.1093
.if.true.1093:
%.tmp1095 = getelementptr [48 x i8], [48 x i8]*@.str1094, i32 0, i32 0
%.tmp1096 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1097 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1096, i32 0, i32 0
%.tmp1098 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1097
%.tmp1099 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1098, i32 0, i32 2
%.tmp1100 = load i32, i32* %.tmp1099
%.tmp1101 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1102 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1101, i32 0, i32 0
%.tmp1103 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1102
%.tmp1104 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1103, i32 0, i32 3
%.tmp1105 = load i32, i32* %.tmp1104
%.tmp1106 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1107 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1106, i32 0, i32 0
%.tmp1108 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1107
%.tmp1109 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1108, i32 0, i32 1
%.tmp1110 = load i8*, i8** %.tmp1109
%.tmp1111 = call i32(i8*,...) @printf(i8* %.tmp1095, i32 %.tmp1100, i32 %.tmp1105, i8* %.tmp1110)
call void(i32) @exit(i32 1)
br label %.if.end.1093
.if.false.1093:
br label %.if.end.1093
.if.end.1093:
%.tmp1112 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1113 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1112, i32 0, i32 0
%.tmp1114 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1113
%.tmp1115 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1114, i32 0, i32 1
%.tmp1116 = load i8*, i8** %.tmp1115
%.tmp1118 = getelementptr [2 x i8], [2 x i8]*@.str1117, i32 0, i32 0
%.tmp1119 = call i32(i8*,i8*) @strcmp(i8* %.tmp1116, i8* %.tmp1118)
%.tmp1120 = icmp eq i32 %.tmp1119, 0
br i1 %.tmp1120, label %.if.true.1121, label %.if.false.1121
.if.true.1121:
%.tmp1122 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1123 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1122, i32 0, i32 0
%.tmp1124 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1125 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1124, i32 0, i32 0
%.tmp1126 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1125
%.tmp1127 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1126, i32 0, i32 5
%.tmp1128 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1127
store %m297$.Token.type* %.tmp1128, %m297$.Token.type** %.tmp1123
br label %.if.end.1121
.if.false.1121:
br label %.if.end.1121
.if.end.1121:
br label %.for.start.1047
.for.end.1047:
br label %.if.end.1037
.if.false.1037:
br label %.if.end.1037
.if.end.1037:
%.tmp1129 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1130 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1129, i32 0, i32 0
%.tmp1131 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1130
%.tmp1132 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1131, i32 0, i32 1
%.tmp1133 = load i8*, i8** %.tmp1132
%.tmp1135 = getelementptr [2 x i8], [2 x i8]*@.str1134, i32 0, i32 0
%.tmp1136 = call i32(i8*,i8*) @strcmp(i8* %.tmp1133, i8* %.tmp1135)
%.tmp1137 = icmp ne i32 %.tmp1136, 0
br i1 %.tmp1137, label %.if.true.1138, label %.if.false.1138
.if.true.1138:
%.tmp1139 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1141 = getelementptr [22 x i8], [22 x i8]*@.str1140, i32 0, i32 0
call void(%m972$.ParsingContext.type*,i8*) @m972$parser_error.v.m972$.ParsingContext.typep.cp(%m972$.ParsingContext.type* %.tmp1139, i8* %.tmp1141)
br label %.if.end.1138
.if.false.1138:
br label %.if.end.1138
.if.end.1138:
%.tmp1142 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1143 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1142, i32 0, i32 0
%.tmp1144 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1145 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1144, i32 0, i32 0
%.tmp1146 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1145
%.tmp1147 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1146, i32 0, i32 5
%.tmp1148 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1147
store %m297$.Token.type* %.tmp1148, %m297$.Token.type** %.tmp1143
%.tmp1149 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1150 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1149, i32 0, i32 0
%.tmp1151 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1150
%.tmp1152 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1151, i32 0, i32 1
%.tmp1153 = load i8*, i8** %.tmp1152
%.tmp1155 = getelementptr [2 x i8], [2 x i8]*@.str1154, i32 0, i32 0
%.tmp1156 = call i32(i8*,i8*) @strcmp(i8* %.tmp1153, i8* %.tmp1155)
%.tmp1157 = icmp eq i32 %.tmp1156, 0
br i1 %.tmp1157, label %.if.true.1158, label %.if.false.1158
.if.true.1158:
%.tmp1159 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1160 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1159, i32 0, i32 0
%.tmp1161 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1162 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1161, i32 0, i32 0
%.tmp1163 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1162
%.tmp1164 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1163, i32 0, i32 5
%.tmp1165 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1164
store %m297$.Token.type* %.tmp1165, %m297$.Token.type** %.tmp1160
%.tmp1166 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.1007
%.tmp1167 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1166, i32 0, i32 1
store i8 43, i8* %.tmp1167
br label %.if.end.1158
.if.false.1158:
%.tmp1168 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1169 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1168, i32 0, i32 0
%.tmp1170 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1169
%.tmp1171 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1170, i32 0, i32 1
%.tmp1172 = load i8*, i8** %.tmp1171
%.tmp1174 = getelementptr [2 x i8], [2 x i8]*@.str1173, i32 0, i32 0
%.tmp1175 = call i32(i8*,i8*) @strcmp(i8* %.tmp1172, i8* %.tmp1174)
%.tmp1176 = icmp eq i32 %.tmp1175, 0
br i1 %.tmp1176, label %.if.true.1177, label %.if.false.1177
.if.true.1177:
%.tmp1178 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1179 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1178, i32 0, i32 0
%.tmp1180 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1181 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1180, i32 0, i32 0
%.tmp1182 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1181
%.tmp1183 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1182, i32 0, i32 5
%.tmp1184 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1183
store %m297$.Token.type* %.tmp1184, %m297$.Token.type** %.tmp1179
%.tmp1185 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.1007
%.tmp1186 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1185, i32 0, i32 1
store i8 42, i8* %.tmp1186
br label %.if.end.1177
.if.false.1177:
%.tmp1187 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1188 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1187, i32 0, i32 0
%.tmp1189 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1188
%.tmp1190 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1189, i32 0, i32 1
%.tmp1191 = load i8*, i8** %.tmp1190
%.tmp1193 = getelementptr [2 x i8], [2 x i8]*@.str1192, i32 0, i32 0
%.tmp1194 = call i32(i8*,i8*) @strcmp(i8* %.tmp1191, i8* %.tmp1193)
%.tmp1195 = icmp eq i32 %.tmp1194, 0
br i1 %.tmp1195, label %.if.true.1196, label %.if.false.1196
.if.true.1196:
%.tmp1197 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1198 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1197, i32 0, i32 0
%.tmp1199 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1200 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1199, i32 0, i32 0
%.tmp1201 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1200
%.tmp1202 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1201, i32 0, i32 5
%.tmp1203 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1202
store %m297$.Token.type* %.tmp1203, %m297$.Token.type** %.tmp1198
%.tmp1204 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.1007
%.tmp1205 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1204, i32 0, i32 1
store i8 63, i8* %.tmp1205
br label %.if.end.1196
.if.false.1196:
br label %.if.end.1196
.if.end.1196:
br label %.if.end.1177
.if.end.1177:
br label %.if.end.1158
.if.end.1158:
br label %.if.end.1017
.if.false.1017:
%.tmp1206 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1207 = call %m972$.Matcher.type*(%m972$.ParsingContext.type*) @m972$parse_simple_matcher.m972$.Matcher.typep.m972$.ParsingContext.typep(%m972$.ParsingContext.type* %.tmp1206)
store %m972$.Matcher.type* %.tmp1207, %m972$.Matcher.type** %m.1007
br label %.if.end.1017
.if.end.1017:
%.tmp1208 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1209 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1208, i32 0, i32 0
%.tmp1210 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1209
%.tmp1211 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1210, i32 0, i32 1
%.tmp1212 = load i8*, i8** %.tmp1211
%.tmp1214 = getelementptr [2 x i8], [2 x i8]*@.str1213, i32 0, i32 0
%.tmp1215 = call i32(i8*,i8*) @strcmp(i8* %.tmp1212, i8* %.tmp1214)
%.tmp1216 = icmp eq i32 %.tmp1215, 0
%.tmp1217 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1218 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1217, i32 0, i32 0
%.tmp1219 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1218
%.tmp1220 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1219, i32 0, i32 0
%.tmp1221 = load i8*, i8** %.tmp1220
%.tmp1223 = getelementptr [5 x i8], [5 x i8]*@.str1222, i32 0, i32 0
%.tmp1224 = call i32(i8*,i8*) @strcmp(i8* %.tmp1221, i8* %.tmp1223)
%.tmp1225 = icmp eq i32 %.tmp1224, 0
%.tmp1226 = or i1 %.tmp1216, %.tmp1225
br i1 %.tmp1226, label %.if.true.1227, label %.if.false.1227
.if.true.1227:
%.tmp1228 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.1007
%.tmp1229 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1228, i32 0, i32 3
%.tmp1230 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1231 = call %m972$.Matcher.type*(%m972$.ParsingContext.type*) @m972$parse_matcher.m972$.Matcher.typep.m972$.ParsingContext.typep(%m972$.ParsingContext.type* %.tmp1230)
store %m972$.Matcher.type* %.tmp1231, %m972$.Matcher.type** %.tmp1229
br label %.if.end.1227
.if.false.1227:
br label %.if.end.1227
.if.end.1227:
%.tmp1232 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.1007
ret %m972$.Matcher.type* %.tmp1232
}
define %m972$.Matcher.type* @m972$parse_simple_matcher.m972$.Matcher.typep.m972$.ParsingContext.typep(%m972$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m972$.ParsingContext.type*
store %m972$.ParsingContext.type* %.ctx.arg, %m972$.ParsingContext.type** %ctx
%.tmp1233 = call %m972$.Matcher.type*() @m972$new_matcher.m972$.Matcher.typep()
%m.1234 = alloca %m972$.Matcher.type*
store %m972$.Matcher.type* %.tmp1233, %m972$.Matcher.type** %m.1234
%count.1235 = alloca i32
store i32 0, i32* %count.1235
%.tmp1236 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1237 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1236, i32 0, i32 0
%.tmp1238 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1237
%ptr.1239 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1238, %m297$.Token.type** %ptr.1239
store i32 0, i32* %count.1235
br label %.for.start.1240
.for.start.1240:
%.tmp1241 = load %m297$.Token.type*, %m297$.Token.type** %ptr.1239
%.tmp1242 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1241, i32 0, i32 0
%.tmp1243 = load i8*, i8** %.tmp1242
%.tmp1245 = getelementptr [5 x i8], [5 x i8]*@.str1244, i32 0, i32 0
%.tmp1246 = call i32(i8*,i8*) @strcmp(i8* %.tmp1243, i8* %.tmp1245)
%.tmp1247 = icmp eq i32 %.tmp1246, 0
%.tmp1248 = load %m297$.Token.type*, %m297$.Token.type** %ptr.1239
%.tmp1249 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1248, i32 0, i32 0
%.tmp1250 = load i8*, i8** %.tmp1249
%.tmp1252 = getelementptr [7 x i8], [7 x i8]*@.str1251, i32 0, i32 0
%.tmp1253 = call i32(i8*,i8*) @strcmp(i8* %.tmp1250, i8* %.tmp1252)
%.tmp1254 = icmp eq i32 %.tmp1253, 0
%.tmp1255 = or i1 %.tmp1247, %.tmp1254
br i1 %.tmp1255, label %.for.continue.1240, label %.for.end.1240
.for.continue.1240:
%.tmp1256 = load i32, i32* %count.1235
%.tmp1257 = add i32 %.tmp1256, 1
store i32 %.tmp1257, i32* %count.1235
%.tmp1258 = load %m297$.Token.type*, %m297$.Token.type** %ptr.1239
%.tmp1259 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1258, i32 0, i32 5
%.tmp1260 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1259
store %m297$.Token.type* %.tmp1260, %m297$.Token.type** %ptr.1239
br label %.for.start.1240
.for.end.1240:
%.tmp1261 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.1234
%.tmp1262 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1261, i32 0, i32 0
%.tmp1263 = getelementptr %m972$.Query.type, %m972$.Query.type* null, i32 1
%.tmp1264 = ptrtoint %m972$.Query.type* %.tmp1263 to i32
%.tmp1265 = call i8*(i32) @malloc(i32 %.tmp1264)
%.tmp1266 = bitcast i8* %.tmp1265 to %m972$.Query.type*
store %m972$.Query.type* %.tmp1266, %m972$.Query.type** %.tmp1262
%.tmp1267 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.1234
%.tmp1268 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1267, i32 0, i32 0
%.tmp1269 = load %m972$.Query.type*, %m972$.Query.type** %.tmp1268
%q.1270 = alloca %m972$.Query.type*
store %m972$.Query.type* %.tmp1269, %m972$.Query.type** %q.1270
%i.1272 = alloca i32
store i32 0, i32* %i.1272
br label %.for.start.1271
.for.start.1271:
%.tmp1273 = load i32, i32* %i.1272
%.tmp1274 = load i32, i32* %count.1235
%.tmp1275 = icmp slt i32 %.tmp1273, %.tmp1274
br i1 %.tmp1275, label %.for.continue.1271, label %.for.end.1271
.for.continue.1271:
%.tmp1276 = load i32, i32* %i.1272
%.tmp1277 = icmp sgt i32 %.tmp1276, 0
br i1 %.tmp1277, label %.if.true.1278, label %.if.false.1278
.if.true.1278:
%.tmp1279 = load %m972$.Query.type*, %m972$.Query.type** %q.1270
%.tmp1280 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1279, i32 0, i32 2
%.tmp1281 = getelementptr %m972$.Query.type, %m972$.Query.type* null, i32 1
%.tmp1282 = ptrtoint %m972$.Query.type* %.tmp1281 to i32
%.tmp1283 = call i8*(i32) @malloc(i32 %.tmp1282)
%.tmp1284 = bitcast i8* %.tmp1283 to %m972$.Query.type*
store %m972$.Query.type* %.tmp1284, %m972$.Query.type** %.tmp1280
%.tmp1285 = load %m972$.Query.type*, %m972$.Query.type** %q.1270
%.tmp1286 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1285, i32 0, i32 2
%.tmp1287 = load %m972$.Query.type*, %m972$.Query.type** %.tmp1286
store %m972$.Query.type* %.tmp1287, %m972$.Query.type** %q.1270
br label %.if.end.1278
.if.false.1278:
br label %.if.end.1278
.if.end.1278:
%.tmp1288 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1289 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1288, i32 0, i32 0
%.tmp1290 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1289
%.tmp1291 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1290, i32 0, i32 0
%.tmp1292 = load i8*, i8** %.tmp1291
%.tmp1294 = getelementptr [7 x i8], [7 x i8]*@.str1293, i32 0, i32 0
%.tmp1295 = call i32(i8*,i8*) @strcmp(i8* %.tmp1292, i8* %.tmp1294)
%.tmp1296 = icmp eq i32 %.tmp1295, 0
br i1 %.tmp1296, label %.if.true.1297, label %.if.false.1297
.if.true.1297:
%.tmp1298 = load %m972$.Query.type*, %m972$.Query.type** %q.1270
%.tmp1299 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1298, i32 0, i32 0
store i8 118, i8* %.tmp1299
br label %.if.end.1297
.if.false.1297:
%.tmp1300 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1301 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1300, i32 0, i32 0
%.tmp1302 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1301
%.tmp1303 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1302, i32 0, i32 1
%.tmp1304 = load i8*, i8** %.tmp1303
%.tmp1305 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1304)
br i1 %.tmp1305, label %.if.true.1306, label %.if.false.1306
.if.true.1306:
%.tmp1307 = load %m972$.Query.type*, %m972$.Query.type** %q.1270
%.tmp1308 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1307, i32 0, i32 0
store i8 97, i8* %.tmp1308
br label %.if.end.1306
.if.false.1306:
%.tmp1309 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1310 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1309, i32 0, i32 0
%.tmp1311 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1310
%.tmp1312 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1311, i32 0, i32 1
%.tmp1313 = load i8*, i8** %.tmp1312
%.tmp1314 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1313)
br i1 %.tmp1314, label %.if.true.1315, label %.if.false.1315
.if.true.1315:
%.tmp1316 = load %m972$.Query.type*, %m972$.Query.type** %q.1270
%.tmp1317 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1316, i32 0, i32 0
store i8 116, i8* %.tmp1317
br label %.if.end.1315
.if.false.1315:
%.tmp1319 = getelementptr [17 x i8], [17 x i8]*@.str1318, i32 0, i32 0
%.tmp1320 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1321 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1320, i32 0, i32 0
%.tmp1322 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1321
%.tmp1323 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1322, i32 0, i32 1
%.tmp1324 = load i8*, i8** %.tmp1323
%.tmp1325 = call i32(i8*,...) @printf(i8* %.tmp1319, i8* %.tmp1324)
%.tmp1326 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1328 = getelementptr [50 x i8], [50 x i8]*@.str1327, i32 0, i32 0
call void(%m972$.ParsingContext.type*,i8*) @m972$parser_error.v.m972$.ParsingContext.typep.cp(%m972$.ParsingContext.type* %.tmp1326, i8* %.tmp1328)
br label %.if.end.1315
.if.end.1315:
br label %.if.end.1306
.if.end.1306:
br label %.if.end.1297
.if.end.1297:
%.tmp1329 = load %m972$.Query.type*, %m972$.Query.type** %q.1270
%.tmp1330 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1329, i32 0, i32 1
%.tmp1331 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1332 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1331, i32 0, i32 0
%.tmp1333 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1332
%.tmp1334 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1333, i32 0, i32 1
%.tmp1335 = load i8*, i8** %.tmp1334
store i8* %.tmp1335, i8** %.tmp1330
%.tmp1336 = load %m972$.Query.type*, %m972$.Query.type** %q.1270
%.tmp1337 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1336, i32 0, i32 2
store %m972$.Query.type* null, %m972$.Query.type** %.tmp1337
%.tmp1338 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1339 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1338, i32 0, i32 0
%.tmp1340 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1341 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1340, i32 0, i32 0
%.tmp1342 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1341
%.tmp1343 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1342, i32 0, i32 5
%.tmp1344 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1343
store %m297$.Token.type* %.tmp1344, %m297$.Token.type** %.tmp1339
%.tmp1345 = load i32, i32* %i.1272
%.tmp1346 = add i32 %.tmp1345, 1
store i32 %.tmp1346, i32* %i.1272
br label %.for.start.1271
.for.end.1271:
%.tmp1347 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m.1234
ret %m972$.Matcher.type* %.tmp1347
}
define %m972$.Rule.type* @m972$parse_rule.m972$.Rule.typep.m972$.ParsingContext.typep(%m972$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m972$.ParsingContext.type*
store %m972$.ParsingContext.type* %.ctx.arg, %m972$.ParsingContext.type** %ctx
%.tmp1348 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1349 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1348, i32 0, i32 0
%.tmp1350 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1349
%.tmp1351 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1350, i32 0, i32 1
%.tmp1352 = load i8*, i8** %.tmp1351
%rule_name.1353 = alloca i8*
store i8* %.tmp1352, i8** %rule_name.1353
%.tmp1354 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1355 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1354, i32 0, i32 0
%.tmp1356 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1355
%.tmp1357 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1356, i32 0, i32 0
%.tmp1358 = load i8*, i8** %.tmp1357
%.tmp1360 = getelementptr [5 x i8], [5 x i8]*@.str1359, i32 0, i32 0
%.tmp1361 = call i32(i8*,i8*) @strcmp(i8* %.tmp1358, i8* %.tmp1360)
%.tmp1362 = icmp ne i32 %.tmp1361, 0
br i1 %.tmp1362, label %.if.true.1363, label %.if.false.1363
.if.true.1363:
%.tmp1365 = getelementptr [37 x i8], [37 x i8]*@.str1364, i32 0, i32 0
%.tmp1366 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1367 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1366, i32 0, i32 0
%.tmp1368 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1367
%.tmp1369 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1368, i32 0, i32 0
%.tmp1370 = load i8*, i8** %.tmp1369
%.tmp1371 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1372 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1371, i32 0, i32 0
%.tmp1373 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1372
%.tmp1374 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1373, i32 0, i32 1
%.tmp1375 = load i8*, i8** %.tmp1374
%.tmp1376 = call i32(i8*,...) @printf(i8* %.tmp1365, i8* %.tmp1370, i8* %.tmp1375)
%.tmp1377 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1379 = getelementptr [31 x i8], [31 x i8]*@.str1378, i32 0, i32 0
call void(%m972$.ParsingContext.type*,i8*) @m972$parser_error.v.m972$.ParsingContext.typep.cp(%m972$.ParsingContext.type* %.tmp1377, i8* %.tmp1379)
br label %.if.end.1363
.if.false.1363:
br label %.if.end.1363
.if.end.1363:
%.tmp1380 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1381 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1380, i32 0, i32 0
%.tmp1382 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1383 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1382, i32 0, i32 0
%.tmp1384 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1383
%.tmp1385 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1384, i32 0, i32 5
%.tmp1386 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1385
store %m297$.Token.type* %.tmp1386, %m297$.Token.type** %.tmp1381
%.tmp1387 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1388 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1387, i32 0, i32 0
%.tmp1389 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1388
%.tmp1390 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1389, i32 0, i32 1
%.tmp1391 = load i8*, i8** %.tmp1390
%.tmp1393 = getelementptr [2 x i8], [2 x i8]*@.str1392, i32 0, i32 0
%.tmp1394 = call i32(i8*,i8*) @strcmp(i8* %.tmp1391, i8* %.tmp1393)
%.tmp1395 = icmp eq i32 %.tmp1394, 0
br i1 %.tmp1395, label %.if.true.1396, label %.if.false.1396
.if.true.1396:
br label %.for.start.1397
.for.start.1397:
%.tmp1398 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1399 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1398, i32 0, i32 0
%.tmp1400 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1399
%.tmp1401 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1400, i32 0, i32 1
%.tmp1402 = load i8*, i8** %.tmp1401
%.tmp1404 = getelementptr [2 x i8], [2 x i8]*@.str1403, i32 0, i32 0
%.tmp1405 = call i32(i8*,i8*) @strcmp(i8* %.tmp1402, i8* %.tmp1404)
%.tmp1406 = icmp ne i32 %.tmp1405, 0
br i1 %.tmp1406, label %.for.continue.1397, label %.for.end.1397
.for.continue.1397:
%.tmp1407 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1408 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1407, i32 0, i32 0
%.tmp1409 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1408
%.tmp1410 = icmp eq %m297$.Token.type* %.tmp1409, null
br i1 %.tmp1410, label %.if.true.1411, label %.if.false.1411
.if.true.1411:
br label %.for.end.1397
br label %.if.end.1411
.if.false.1411:
br label %.if.end.1411
.if.end.1411:
%.tmp1412 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1413 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1412, i32 0, i32 0
%.tmp1414 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1415 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1414, i32 0, i32 0
%.tmp1416 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1415
%.tmp1417 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1416, i32 0, i32 5
%.tmp1418 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1417
store %m297$.Token.type* %.tmp1418, %m297$.Token.type** %.tmp1413
br label %.for.start.1397
.for.end.1397:
br label %.if.end.1396
.if.false.1396:
br label %.if.end.1396
.if.end.1396:
%.tmp1419 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1420 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1419, i32 0, i32 0
%.tmp1421 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1420
%.tmp1422 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1421, i32 0, i32 1
%.tmp1423 = load i8*, i8** %.tmp1422
%.tmp1425 = getelementptr [2 x i8], [2 x i8]*@.str1424, i32 0, i32 0
%.tmp1426 = call i32(i8*,i8*) @strcmp(i8* %.tmp1423, i8* %.tmp1425)
%.tmp1427 = icmp ne i32 %.tmp1426, 0
br i1 %.tmp1427, label %.if.true.1428, label %.if.false.1428
.if.true.1428:
%.tmp1429 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1430 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1429, i32 0, i32 0
%.tmp1431 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1430
%.tmp1432 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1431, i32 0, i32 1
%.tmp1433 = load i8*, i8** %.tmp1432
%.tmp1434 = call i32(i8*,...) @printf(i8* %.tmp1433)
%.tmp1436 = getelementptr [1 x i8], [1 x i8]*@.str1435, i32 0, i32 0
%err.1437 = alloca i8*
store i8* %.tmp1436, i8** %err.1437
%.tmp1438 = getelementptr i8*, i8** %err.1437, i32 0
%.tmp1440 = getelementptr [35 x i8], [35 x i8]*@.str1439, i32 0, i32 0
%.tmp1441 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1442 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1441, i32 0, i32 0
%.tmp1443 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1442
%.tmp1444 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1443, i32 0, i32 1
%.tmp1445 = load i8*, i8** %.tmp1444
%.tmp1446 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1438, i8* %.tmp1440, i8* %.tmp1445)
%.tmp1447 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1448 = load i8*, i8** %err.1437
call void(%m972$.ParsingContext.type*,i8*) @m972$parser_error.v.m972$.ParsingContext.typep.cp(%m972$.ParsingContext.type* %.tmp1447, i8* %.tmp1448)
br label %.if.end.1428
.if.false.1428:
br label %.if.end.1428
.if.end.1428:
%.tmp1449 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1450 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1449, i32 0, i32 0
%.tmp1451 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1452 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1451, i32 0, i32 0
%.tmp1453 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1452
%.tmp1454 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1453, i32 0, i32 5
%.tmp1455 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1454
store %m297$.Token.type* %.tmp1455, %m297$.Token.type** %.tmp1450
%.tmp1456 = getelementptr %m972$.Rule.type, %m972$.Rule.type* null, i32 1
%.tmp1457 = ptrtoint %m972$.Rule.type* %.tmp1456 to i32
%.tmp1458 = call i8*(i32) @malloc(i32 %.tmp1457)
%.tmp1459 = bitcast i8* %.tmp1458 to %m972$.Rule.type*
%rule.1460 = alloca %m972$.Rule.type*
store %m972$.Rule.type* %.tmp1459, %m972$.Rule.type** %rule.1460
%.tmp1461 = load %m972$.Rule.type*, %m972$.Rule.type** %rule.1460
%.tmp1462 = getelementptr %m972$.Rule.type, %m972$.Rule.type* %.tmp1461, i32 0, i32 0
%.tmp1463 = load i8*, i8** %rule_name.1353
store i8* %.tmp1463, i8** %.tmp1462
%.tmp1464 = load %m972$.Rule.type*, %m972$.Rule.type** %rule.1460
%.tmp1465 = getelementptr %m972$.Rule.type, %m972$.Rule.type* %.tmp1464, i32 0, i32 1
%.tmp1466 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1467 = call %m972$.Matcher.type*(%m972$.ParsingContext.type*) @m972$parse_matcher.m972$.Matcher.typep.m972$.ParsingContext.typep(%m972$.ParsingContext.type* %.tmp1466)
store %m972$.Matcher.type* %.tmp1467, %m972$.Matcher.type** %.tmp1465
%.tmp1468 = load %m972$.Rule.type*, %m972$.Rule.type** %rule.1460
ret %m972$.Rule.type* %.tmp1468
}
define void @m972$parser_error.v.m972$.ParsingContext.typep.cp(%m972$.ParsingContext.type* %.ctx.arg, i8* %.error.arg) {
%ctx = alloca %m972$.ParsingContext.type*
store %m972$.ParsingContext.type* %.ctx.arg, %m972$.ParsingContext.type** %ctx
%error = alloca i8*
store i8* %.error.arg, i8** %error
%.tmp1469 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1470 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1469, i32 0, i32 0
%.tmp1471 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1470
%.tmp1472 = load i8*, i8** %error
%.tmp1473 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1471, i8* %.tmp1472)
%e.1474 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1473, %m296$.Error.type** %e.1474
%.tmp1475 = load %m296$.Error.type*, %m296$.Error.type** %e.1474
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp1475)
call void(i32) @exit(i32 1)
ret void
}
define %m972$.Rule.type** @m972$parse_grammar.m972$.Rule.typepp.m972$.ParsingContext.typep(%m972$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m972$.ParsingContext.type*
store %m972$.ParsingContext.type* %.ctx.arg, %m972$.ParsingContext.type** %ctx
%max_rules.1476 = alloca i32
store i32 40, i32* %max_rules.1476
%.tmp1477 = load i32, i32* @ptr_size
%.tmp1478 = load i32, i32* %max_rules.1476
%.tmp1479 = mul i32 %.tmp1477, %.tmp1478
%.tmp1480 = call i8*(i32) @malloc(i32 %.tmp1479)
%.tmp1481 = bitcast i8* %.tmp1480 to %m972$.Rule.type**
%grammar.1482 = alloca %m972$.Rule.type**
store %m972$.Rule.type** %.tmp1481, %m972$.Rule.type*** %grammar.1482
%i.1484 = alloca i32
store i32 0, i32* %i.1484
br label %.for.start.1483
.for.start.1483:
%.tmp1485 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1486 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1485, i32 0, i32 0
%.tmp1487 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1486
%.tmp1488 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1487, i32 0, i32 0
%.tmp1489 = load i8*, i8** %.tmp1488
%.tmp1491 = getelementptr [4 x i8], [4 x i8]*@.str1490, i32 0, i32 0
%.tmp1492 = call i32(i8*,i8*) @strcmp(i8* %.tmp1489, i8* %.tmp1491)
%.tmp1493 = icmp ne i32 %.tmp1492, 0
br i1 %.tmp1493, label %.for.continue.1483, label %.for.end.1483
.for.continue.1483:
%.tmp1494 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1495 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1494, i32 0, i32 0
%.tmp1496 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1495
%.tmp1497 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1496, i32 0, i32 0
%.tmp1498 = load i8*, i8** %.tmp1497
%.tmp1500 = getelementptr [3 x i8], [3 x i8]*@.str1499, i32 0, i32 0
%.tmp1501 = call i32(i8*,i8*) @strcmp(i8* %.tmp1498, i8* %.tmp1500)
%.tmp1502 = icmp ne i32 %.tmp1501, 0
br i1 %.tmp1502, label %.if.true.1503, label %.if.false.1503
.if.true.1503:
%.tmp1504 = load i32, i32* %i.1484
%.tmp1505 = load %m972$.Rule.type**, %m972$.Rule.type*** %grammar.1482
%.tmp1506 = getelementptr %m972$.Rule.type*, %m972$.Rule.type** %.tmp1505, i32 %.tmp1504
%.tmp1507 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1508 = call %m972$.Rule.type*(%m972$.ParsingContext.type*) @m972$parse_rule.m972$.Rule.typep.m972$.ParsingContext.typep(%m972$.ParsingContext.type* %.tmp1507)
store %m972$.Rule.type* %.tmp1508, %m972$.Rule.type** %.tmp1506
%.tmp1509 = load i32, i32* %i.1484
%.tmp1510 = add i32 %.tmp1509, 1
store i32 %.tmp1510, i32* %i.1484
br label %.if.end.1503
.if.false.1503:
%.tmp1511 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1512 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1511, i32 0, i32 0
%.tmp1513 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %ctx
%.tmp1514 = getelementptr %m972$.ParsingContext.type, %m972$.ParsingContext.type* %.tmp1513, i32 0, i32 0
%.tmp1515 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1514
%.tmp1516 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1515, i32 0, i32 5
%.tmp1517 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1516
store %m297$.Token.type* %.tmp1517, %m297$.Token.type** %.tmp1512
br label %.if.end.1503
.if.end.1503:
br label %.for.start.1483
.for.end.1483:
%.tmp1518 = load %m972$.Rule.type**, %m972$.Rule.type*** %grammar.1482
%.tmp1519 = bitcast %m972$.Rule.type** %.tmp1518 to %m972$.Rule.type**
ret %m972$.Rule.type** %.tmp1519
}
%m972$.Node.type = type {i8*,i8*,i8*,i32,i32,%m972$.Node.type*,%m972$.Node.type*,%m972$.Node.type*}
define %m972$.Node.type* @m972$new_node.m972$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg) {
%t = alloca %m297$.Token.type*
store %m297$.Token.type* %.t.arg, %m297$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp1520 = getelementptr %m972$.Node.type, %m972$.Node.type* null, i32 1
%.tmp1521 = ptrtoint %m972$.Node.type* %.tmp1520 to i32
%.tmp1522 = call i8*(i32) @malloc(i32 %.tmp1521)
%.tmp1523 = bitcast i8* %.tmp1522 to %m972$.Node.type*
%node.1524 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp1523, %m972$.Node.type** %node.1524
%.tmp1525 = load %m972$.Node.type*, %m972$.Node.type** %node.1524
%.tmp1526 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1525, i32 0, i32 0
%.tmp1527 = load i8*, i8** %type
store i8* %.tmp1527, i8** %.tmp1526
%.tmp1528 = load %m972$.Node.type*, %m972$.Node.type** %node.1524
%.tmp1529 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1528, i32 0, i32 1
%.tmp1530 = load i8*, i8** %value
store i8* %.tmp1530, i8** %.tmp1529
%.tmp1531 = load %m972$.Node.type*, %m972$.Node.type** %node.1524
%.tmp1532 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1531, i32 0, i32 3
%.tmp1533 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1534 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1533, i32 0, i32 2
%.tmp1535 = load i32, i32* %.tmp1534
store i32 %.tmp1535, i32* %.tmp1532
%.tmp1536 = load %m972$.Node.type*, %m972$.Node.type** %node.1524
%.tmp1537 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1536, i32 0, i32 2
%.tmp1538 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1539 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1538, i32 0, i32 4
%.tmp1540 = load i8*, i8** %.tmp1539
store i8* %.tmp1540, i8** %.tmp1537
%.tmp1541 = load %m972$.Node.type*, %m972$.Node.type** %node.1524
%.tmp1542 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1541, i32 0, i32 4
%.tmp1543 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1544 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1543, i32 0, i32 3
%.tmp1545 = load i32, i32* %.tmp1544
store i32 %.tmp1545, i32* %.tmp1542
%.tmp1546 = load %m972$.Node.type*, %m972$.Node.type** %node.1524
%.tmp1547 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1546, i32 0, i32 5
store %m972$.Node.type* null, %m972$.Node.type** %.tmp1547
%.tmp1548 = load %m972$.Node.type*, %m972$.Node.type** %node.1524
%.tmp1549 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1548, i32 0, i32 7
store %m972$.Node.type* null, %m972$.Node.type** %.tmp1549
%.tmp1550 = load %m972$.Node.type*, %m972$.Node.type** %node.1524
%.tmp1551 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1550, i32 0, i32 6
store %m972$.Node.type* null, %m972$.Node.type** %.tmp1551
%.tmp1552 = load %m972$.Node.type*, %m972$.Node.type** %node.1524
ret %m972$.Node.type* %.tmp1552
}
define void @m972$child_append.v.m972$.Node.typep.m972$.Node.typep(%m972$.Node.type* %.parent.arg, %m972$.Node.type* %.child.arg) {
%parent = alloca %m972$.Node.type*
store %m972$.Node.type* %.parent.arg, %m972$.Node.type** %parent
%child = alloca %m972$.Node.type*
store %m972$.Node.type* %.child.arg, %m972$.Node.type** %child
%.tmp1553 = load %m972$.Node.type*, %m972$.Node.type** %parent
%.tmp1554 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1553, i32 0, i32 6
%.tmp1555 = load %m972$.Node.type*, %m972$.Node.type** %.tmp1554
%.tmp1556 = icmp eq %m972$.Node.type* %.tmp1555, null
br i1 %.tmp1556, label %.if.true.1557, label %.if.false.1557
.if.true.1557:
%.tmp1558 = load %m972$.Node.type*, %m972$.Node.type** %parent
%.tmp1559 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1558, i32 0, i32 6
%.tmp1560 = load %m972$.Node.type*, %m972$.Node.type** %child
store %m972$.Node.type* %.tmp1560, %m972$.Node.type** %.tmp1559
br label %.if.end.1557
.if.false.1557:
%.tmp1561 = load %m972$.Node.type*, %m972$.Node.type** %parent
%.tmp1562 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1561, i32 0, i32 6
%.tmp1563 = load %m972$.Node.type*, %m972$.Node.type** %.tmp1562
%c.1564 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp1563, %m972$.Node.type** %c.1564
br label %.for.start.1565
.for.start.1565:
%.tmp1566 = load %m972$.Node.type*, %m972$.Node.type** %c.1564
%.tmp1567 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1566, i32 0, i32 7
%.tmp1568 = load %m972$.Node.type*, %m972$.Node.type** %.tmp1567
%.tmp1569 = icmp ne %m972$.Node.type* %.tmp1568, null
br i1 %.tmp1569, label %.for.continue.1565, label %.for.end.1565
.for.continue.1565:
%.tmp1570 = load %m972$.Node.type*, %m972$.Node.type** %c.1564
%.tmp1571 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1570, i32 0, i32 7
%.tmp1572 = load %m972$.Node.type*, %m972$.Node.type** %.tmp1571
store %m972$.Node.type* %.tmp1572, %m972$.Node.type** %c.1564
br label %.for.start.1565
.for.end.1565:
%.tmp1573 = load %m972$.Node.type*, %m972$.Node.type** %c.1564
%.tmp1574 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1573, i32 0, i32 7
%.tmp1575 = load %m972$.Node.type*, %m972$.Node.type** %child
store %m972$.Node.type* %.tmp1575, %m972$.Node.type** %.tmp1574
br label %.if.end.1557
.if.end.1557:
%.tmp1576 = load %m972$.Node.type*, %m972$.Node.type** %child
%.tmp1577 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1576, i32 0, i32 7
store %m972$.Node.type* null, %m972$.Node.type** %.tmp1577
ret void
}
define void @m972$child_pop.v.m972$.Node.typep(%m972$.Node.type* %.parent.arg) {
%parent = alloca %m972$.Node.type*
store %m972$.Node.type* %.parent.arg, %m972$.Node.type** %parent
%.tmp1578 = load %m972$.Node.type*, %m972$.Node.type** %parent
%.tmp1579 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1578, i32 0, i32 6
%.tmp1580 = load %m972$.Node.type*, %m972$.Node.type** %.tmp1579
%.tmp1581 = icmp eq %m972$.Node.type* %.tmp1580, null
br i1 %.tmp1581, label %.if.true.1582, label %.if.false.1582
.if.true.1582:
ret void
br label %.if.end.1582
.if.false.1582:
br label %.if.end.1582
.if.end.1582:
%.tmp1583 = load %m972$.Node.type*, %m972$.Node.type** %parent
%.tmp1584 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1583, i32 0, i32 6
%.tmp1585 = load %m972$.Node.type*, %m972$.Node.type** %.tmp1584
%c.1586 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp1585, %m972$.Node.type** %c.1586
%.tmp1587 = load %m972$.Node.type*, %m972$.Node.type** %c.1586
%.tmp1588 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1587, i32 0, i32 7
%.tmp1589 = load %m972$.Node.type*, %m972$.Node.type** %.tmp1588
%.tmp1590 = icmp eq %m972$.Node.type* %.tmp1589, null
br i1 %.tmp1590, label %.if.true.1591, label %.if.false.1591
.if.true.1591:
%.tmp1592 = load %m972$.Node.type*, %m972$.Node.type** %c.1586
%.tmp1593 = bitcast %m972$.Node.type* %.tmp1592 to i8*
call void(i8*) @free(i8* %.tmp1593)
%.tmp1594 = load %m972$.Node.type*, %m972$.Node.type** %parent
%.tmp1595 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1594, i32 0, i32 6
store %m972$.Node.type* null, %m972$.Node.type** %.tmp1595
ret void
br label %.if.end.1591
.if.false.1591:
br label %.if.end.1591
.if.end.1591:
br label %.for.start.1596
.for.start.1596:
%.tmp1597 = load %m972$.Node.type*, %m972$.Node.type** %c.1586
%.tmp1598 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1597, i32 0, i32 7
%.tmp1599 = load %m972$.Node.type*, %m972$.Node.type** %.tmp1598
%.tmp1600 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1599, i32 0, i32 7
%.tmp1601 = load %m972$.Node.type*, %m972$.Node.type** %.tmp1600
%.tmp1602 = icmp ne %m972$.Node.type* %.tmp1601, null
br i1 %.tmp1602, label %.for.continue.1596, label %.for.end.1596
.for.continue.1596:
%.tmp1603 = load %m972$.Node.type*, %m972$.Node.type** %c.1586
%.tmp1604 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1603, i32 0, i32 7
%.tmp1605 = load %m972$.Node.type*, %m972$.Node.type** %.tmp1604
store %m972$.Node.type* %.tmp1605, %m972$.Node.type** %c.1586
br label %.for.start.1596
.for.end.1596:
%.tmp1606 = load %m972$.Node.type*, %m972$.Node.type** %c.1586
%.tmp1607 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1606, i32 0, i32 7
%.tmp1608 = load %m972$.Node.type*, %m972$.Node.type** %.tmp1607
%.tmp1609 = bitcast %m972$.Node.type* %.tmp1608 to i8*
call void(i8*) @free(i8* %.tmp1609)
%.tmp1610 = load %m972$.Node.type*, %m972$.Node.type** %c.1586
%.tmp1611 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp1610, i32 0, i32 7
store %m972$.Node.type* null, %m972$.Node.type** %.tmp1611
ret void
}
%m972$.AstContext.type = type {%m297$.Token.type*,%m972$.Rule.type**}
define %m972$.Rule.type* @m972$_find_rule.m972$.Rule.typep.m972$.Rule.typepp.cp(%m972$.Rule.type** %.grammar.arg, i8* %.rule_name.arg) {
%grammar = alloca %m972$.Rule.type**
store %m972$.Rule.type** %.grammar.arg, %m972$.Rule.type*** %grammar
%rule_name = alloca i8*
store i8* %.rule_name.arg, i8** %rule_name
%i.1613 = alloca i32
store i32 0, i32* %i.1613
br label %.for.start.1612
.for.start.1612:
br i1 1, label %.for.continue.1612, label %.for.end.1612
.for.continue.1612:
%.tmp1614 = load i32, i32* %i.1613
%.tmp1615 = load %m972$.Rule.type**, %m972$.Rule.type*** %grammar
%.tmp1616 = getelementptr %m972$.Rule.type*, %m972$.Rule.type** %.tmp1615, i32 %.tmp1614
%.tmp1617 = load %m972$.Rule.type*, %m972$.Rule.type** %.tmp1616
%rule.1618 = alloca %m972$.Rule.type*
store %m972$.Rule.type* %.tmp1617, %m972$.Rule.type** %rule.1618
%.tmp1619 = load %m972$.Rule.type*, %m972$.Rule.type** %rule.1618
%.tmp1620 = getelementptr %m972$.Rule.type, %m972$.Rule.type* %.tmp1619, i32 0, i32 0
%.tmp1621 = load i8*, i8** %.tmp1620
%.tmp1622 = load i8*, i8** %rule_name
%.tmp1623 = call i32(i8*,i8*) @strcmp(i8* %.tmp1621, i8* %.tmp1622)
%.tmp1624 = icmp eq i32 %.tmp1623, 0
br i1 %.tmp1624, label %.if.true.1625, label %.if.false.1625
.if.true.1625:
%.tmp1626 = load %m972$.Rule.type*, %m972$.Rule.type** %rule.1618
ret %m972$.Rule.type* %.tmp1626
br label %.if.end.1625
.if.false.1625:
br label %.if.end.1625
.if.end.1625:
%.tmp1627 = load i32, i32* %i.1613
%.tmp1628 = add i32 %.tmp1627, 1
store i32 %.tmp1628, i32* %i.1613
br label %.for.start.1612
.for.end.1612:
%.tmp1629 = bitcast ptr null to %m972$.Rule.type*
ret %m972$.Rule.type* %.tmp1629
}
%m972$.ParseResult.type = type {%m296$.Error.type*,%m972$.Node.type*}
define %m296$.Error.type* @m972$parse_query.m296$.Error.typep.m972$.AstContext.typep.m972$.Matcher.typep.m972$.Node.typep(%m972$.AstContext.type* %.c.arg, %m972$.Matcher.type* %.m.arg, %m972$.Node.type* %.base.arg) {
%c = alloca %m972$.AstContext.type*
store %m972$.AstContext.type* %.c.arg, %m972$.AstContext.type** %c
%m = alloca %m972$.Matcher.type*
store %m972$.Matcher.type* %.m.arg, %m972$.Matcher.type** %m
%base = alloca %m972$.Node.type*
store %m972$.Node.type* %.base.arg, %m972$.Node.type** %base
%child.1630 = alloca %m972$.Node.type*
store %m972$.Node.type* null, %m972$.Node.type** %child.1630
%.tmp1631 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1632 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1631, i32 0, i32 0
%.tmp1633 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1632
%start_token.1634 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1633, %m297$.Token.type** %start_token.1634
%new_children.1635 = alloca i32
store i32 0, i32* %new_children.1635
%.tmp1636 = bitcast ptr null to %m296$.Error.type*
%err.1637 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1636, %m296$.Error.type** %err.1637
%.tmp1639 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m
%.tmp1640 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1639, i32 0, i32 0
%.tmp1641 = load %m972$.Query.type*, %m972$.Query.type** %.tmp1640
%q.1642 = alloca %m972$.Query.type*
store %m972$.Query.type* %.tmp1641, %m972$.Query.type** %q.1642
br label %.for.start.1638
.for.start.1638:
%.tmp1643 = load %m972$.Query.type*, %m972$.Query.type** %q.1642
%.tmp1644 = icmp ne %m972$.Query.type* %.tmp1643, null
%.tmp1645 = load %m296$.Error.type*, %m296$.Error.type** %err.1637
%.tmp1646 = icmp eq %m296$.Error.type* %.tmp1645, null
%.tmp1647 = and i1 %.tmp1644, %.tmp1646
br i1 %.tmp1647, label %.for.continue.1638, label %.for.end.1638
.for.continue.1638:
%.tmp1648 = load %m972$.Query.type*, %m972$.Query.type** %q.1642
%.tmp1649 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1648, i32 0, i32 0
%.tmp1650 = load i8, i8* %.tmp1649
%.tmp1651 = icmp eq i8 %.tmp1650, 118
br i1 %.tmp1651, label %.if.true.1652, label %.if.false.1652
.if.true.1652:
%.tmp1653 = load %m972$.Query.type*, %m972$.Query.type** %q.1642
%.tmp1654 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1653, i32 0, i32 1
%.tmp1655 = load i8*, i8** %.tmp1654
%.tmp1656 = call i32(i8*) @strlen(i8* %.tmp1655)
%.tmp1657 = sub i32 %.tmp1656, 2
%qv_len.1658 = alloca i32
store i32 %.tmp1657, i32* %qv_len.1658
%.tmp1659 = load i32, i32* %qv_len.1658
%.tmp1660 = add i32 %.tmp1659, 1
%.tmp1661 = call i8*(i32) @malloc(i32 %.tmp1660)
%tmp_buff.1662 = alloca i8*
store i8* %.tmp1661, i8** %tmp_buff.1662
%.tmp1663 = load %m972$.Query.type*, %m972$.Query.type** %q.1642
%.tmp1664 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1663, i32 0, i32 1
%.tmp1665 = load i8*, i8** %.tmp1664
%.tmp1667 = getelementptr [8 x i8], [8 x i8]*@.str1666, i32 0, i32 0
%.tmp1668 = load i8*, i8** %tmp_buff.1662
%.tmp1669 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1665, i8* %.tmp1667, i8* %.tmp1668)
%.tmp1670 = load i8*, i8** %tmp_buff.1662
%.tmp1671 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1672 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1671, i32 0, i32 0
%.tmp1673 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1672
%.tmp1674 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1673, i32 0, i32 1
%.tmp1675 = load i8*, i8** %.tmp1674
%.tmp1676 = load i32, i32* %qv_len.1658
%.tmp1677 = call i32(i8*,i8*,i32) @strncmp(i8* %.tmp1670, i8* %.tmp1675, i32 %.tmp1676)
%.tmp1678 = icmp eq i32 %.tmp1677, 0
%.tmp1679 = load i32, i32* %qv_len.1658
%.tmp1680 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1681 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1680, i32 0, i32 0
%.tmp1682 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1681
%.tmp1683 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1682, i32 0, i32 1
%.tmp1684 = load i8*, i8** %.tmp1683
%.tmp1685 = call i32(i8*) @strlen(i8* %.tmp1684)
%.tmp1686 = icmp eq i32 %.tmp1679, %.tmp1685
%.tmp1687 = and i1 %.tmp1678, %.tmp1686
br i1 %.tmp1687, label %.if.true.1688, label %.if.false.1688
.if.true.1688:
%.tmp1689 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1690 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1689, i32 0, i32 0
%.tmp1691 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1690
%.tmp1692 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1693 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1692, i32 0, i32 0
%.tmp1694 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1693
%.tmp1695 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1694, i32 0, i32 0
%.tmp1696 = load i8*, i8** %.tmp1695
%.tmp1697 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1698 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1697, i32 0, i32 0
%.tmp1699 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1698
%.tmp1700 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1699, i32 0, i32 1
%.tmp1701 = load i8*, i8** %.tmp1700
%.tmp1702 = call %m972$.Node.type*(%m297$.Token.type*,i8*,i8*) @m972$new_node.m972$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1691, i8* %.tmp1696, i8* %.tmp1701)
store %m972$.Node.type* %.tmp1702, %m972$.Node.type** %child.1630
%.tmp1703 = load %m972$.Node.type*, %m972$.Node.type** %base
%.tmp1704 = load %m972$.Node.type*, %m972$.Node.type** %child.1630
call void(%m972$.Node.type*,%m972$.Node.type*) @m972$child_append.v.m972$.Node.typep.m972$.Node.typep(%m972$.Node.type* %.tmp1703, %m972$.Node.type* %.tmp1704)
%.tmp1705 = load i32, i32* %new_children.1635
%.tmp1706 = add i32 %.tmp1705, 1
store i32 %.tmp1706, i32* %new_children.1635
%.tmp1707 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1708 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1707, i32 0, i32 0
%.tmp1709 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1710 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1709, i32 0, i32 0
%.tmp1711 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1710
%.tmp1712 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1711, i32 0, i32 5
%.tmp1713 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1712
store %m297$.Token.type* %.tmp1713, %m297$.Token.type** %.tmp1708
br label %.if.end.1688
.if.false.1688:
%.tmp1714 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1715 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1714, i32 0, i32 0
%.tmp1716 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1715
%.tmp1717 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1716, i32 0, i32 1
%.tmp1718 = load i8*, i8** %.tmp1717
%token_value.1719 = alloca i8*
store i8* %.tmp1718, i8** %token_value.1719
%.tmp1720 = load i8*, i8** %token_value.1719
%.tmp1721 = icmp eq i8* %.tmp1720, null
br i1 %.tmp1721, label %.if.true.1722, label %.if.false.1722
.if.true.1722:
%.tmp1724 = getelementptr [7 x i8], [7 x i8]*@.str1723, i32 0, i32 0
store i8* %.tmp1724, i8** %token_value.1719
br label %.if.end.1722
.if.false.1722:
br label %.if.end.1722
.if.end.1722:
%.tmp1726 = getelementptr [1 x i8], [1 x i8]*@.str1725, i32 0, i32 0
%err_buf.1727 = alloca i8*
store i8* %.tmp1726, i8** %err_buf.1727
%.tmp1728 = getelementptr i8*, i8** %err_buf.1727, i32 0
%.tmp1730 = getelementptr [43 x i8], [43 x i8]*@.str1729, i32 0, i32 0
%.tmp1731 = load %m972$.Query.type*, %m972$.Query.type** %q.1642
%.tmp1732 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1731, i32 0, i32 1
%.tmp1733 = load i8*, i8** %.tmp1732
%.tmp1734 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1735 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1734, i32 0, i32 0
%.tmp1736 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1735
%.tmp1737 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1736, i32 0, i32 1
%.tmp1738 = load i8*, i8** %.tmp1737
%.tmp1739 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1728, i8* %.tmp1730, i8* %.tmp1733, i8* %.tmp1738)
%.tmp1740 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1741 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1740, i32 0, i32 0
%.tmp1742 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1741
%.tmp1743 = load i8*, i8** %err_buf.1727
%.tmp1744 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1742, i8* %.tmp1743)
store %m296$.Error.type* %.tmp1744, %m296$.Error.type** %err.1637
br label %.if.end.1688
.if.end.1688:
%.tmp1745 = load i8*, i8** %tmp_buff.1662
call void(i8*) @free(i8* %.tmp1745)
br label %.if.end.1652
.if.false.1652:
%.tmp1746 = load %m972$.Query.type*, %m972$.Query.type** %q.1642
%.tmp1747 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1746, i32 0, i32 0
%.tmp1748 = load i8, i8* %.tmp1747
%.tmp1749 = icmp eq i8 %.tmp1748, 116
br i1 %.tmp1749, label %.if.true.1750, label %.if.false.1750
.if.true.1750:
%.tmp1751 = load %m972$.Query.type*, %m972$.Query.type** %q.1642
%.tmp1752 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1751, i32 0, i32 1
%.tmp1753 = load i8*, i8** %.tmp1752
%.tmp1754 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1755 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1754, i32 0, i32 0
%.tmp1756 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1755
%.tmp1757 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1756, i32 0, i32 0
%.tmp1758 = load i8*, i8** %.tmp1757
%.tmp1759 = call i32(i8*,i8*) @strcmp(i8* %.tmp1753, i8* %.tmp1758)
%.tmp1760 = icmp eq i32 %.tmp1759, 0
br i1 %.tmp1760, label %.if.true.1761, label %.if.false.1761
.if.true.1761:
%.tmp1762 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1763 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1762, i32 0, i32 0
%.tmp1764 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1763
%.tmp1765 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1766 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1765, i32 0, i32 0
%.tmp1767 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1766
%.tmp1768 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1767, i32 0, i32 0
%.tmp1769 = load i8*, i8** %.tmp1768
%.tmp1770 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1771 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1770, i32 0, i32 0
%.tmp1772 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1771
%.tmp1773 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1772, i32 0, i32 1
%.tmp1774 = load i8*, i8** %.tmp1773
%.tmp1775 = call %m972$.Node.type*(%m297$.Token.type*,i8*,i8*) @m972$new_node.m972$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1764, i8* %.tmp1769, i8* %.tmp1774)
store %m972$.Node.type* %.tmp1775, %m972$.Node.type** %child.1630
%.tmp1776 = load %m972$.Node.type*, %m972$.Node.type** %base
%.tmp1777 = load %m972$.Node.type*, %m972$.Node.type** %child.1630
call void(%m972$.Node.type*,%m972$.Node.type*) @m972$child_append.v.m972$.Node.typep.m972$.Node.typep(%m972$.Node.type* %.tmp1776, %m972$.Node.type* %.tmp1777)
%.tmp1778 = load i32, i32* %new_children.1635
%.tmp1779 = add i32 %.tmp1778, 1
store i32 %.tmp1779, i32* %new_children.1635
%.tmp1780 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1781 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1780, i32 0, i32 0
%.tmp1782 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1783 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1782, i32 0, i32 0
%.tmp1784 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1783
%.tmp1785 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1784, i32 0, i32 5
%.tmp1786 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1785
store %m297$.Token.type* %.tmp1786, %m297$.Token.type** %.tmp1781
br label %.if.end.1761
.if.false.1761:
%.tmp1788 = getelementptr [13 x i8], [13 x i8]*@.str1787, i32 0, i32 0
%err_fmt_t.1789 = alloca i8*
store i8* %.tmp1788, i8** %err_fmt_t.1789
%.tmp1791 = getelementptr [30 x i8], [30 x i8]*@.str1790, i32 0, i32 0
%err_msg_t.1792 = alloca i8*
store i8* %.tmp1791, i8** %err_msg_t.1792
%.tmp1793 = load i8*, i8** %err_fmt_t.1789
%.tmp1794 = call i32(i8*) @strlen(i8* %.tmp1793)
%.tmp1795 = load i8*, i8** %err_msg_t.1792
%.tmp1796 = call i32(i8*) @strlen(i8* %.tmp1795)
%.tmp1797 = add i32 %.tmp1794, %.tmp1796
%.tmp1798 = load %m972$.Query.type*, %m972$.Query.type** %q.1642
%.tmp1799 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1798, i32 0, i32 1
%.tmp1800 = load i8*, i8** %.tmp1799
%.tmp1801 = call i32(i8*) @strlen(i8* %.tmp1800)
%.tmp1802 = add i32 %.tmp1797, %.tmp1801
%.tmp1803 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1804 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1803, i32 0, i32 0
%.tmp1805 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1804
%.tmp1806 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1805, i32 0, i32 0
%.tmp1807 = load i8*, i8** %.tmp1806
%.tmp1808 = call i32(i8*) @strlen(i8* %.tmp1807)
%.tmp1809 = add i32 %.tmp1802, %.tmp1808
%err_len_t.1810 = alloca i32
store i32 %.tmp1809, i32* %err_len_t.1810
%.tmp1811 = load i32, i32* %err_len_t.1810
%.tmp1812 = call i8*(i32) @malloc(i32 %.tmp1811)
%err_buf_t.1813 = alloca i8*
store i8* %.tmp1812, i8** %err_buf_t.1813
%.tmp1814 = load i8*, i8** %err_buf_t.1813
%.tmp1815 = load i32, i32* %err_len_t.1810
%.tmp1816 = load i8*, i8** %err_fmt_t.1789
%.tmp1817 = load i8*, i8** %err_msg_t.1792
%.tmp1818 = load %m972$.Query.type*, %m972$.Query.type** %q.1642
%.tmp1819 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1818, i32 0, i32 1
%.tmp1820 = load i8*, i8** %.tmp1819
%.tmp1821 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1822 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1821, i32 0, i32 0
%.tmp1823 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1822
%.tmp1824 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1823, i32 0, i32 0
%.tmp1825 = load i8*, i8** %.tmp1824
%.tmp1826 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1814, i32 %.tmp1815, i8* %.tmp1816, i8* %.tmp1817, i8* %.tmp1820, i8* %.tmp1825)
%.tmp1827 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1828 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1827, i32 0, i32 0
%.tmp1829 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1828
%.tmp1830 = load i8*, i8** %err_buf_t.1813
%.tmp1831 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1829, i8* %.tmp1830)
store %m296$.Error.type* %.tmp1831, %m296$.Error.type** %err.1637
br label %.if.end.1761
.if.end.1761:
br label %.if.end.1750
.if.false.1750:
%.tmp1832 = load %m972$.Query.type*, %m972$.Query.type** %q.1642
%.tmp1833 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1832, i32 0, i32 0
%.tmp1834 = load i8, i8* %.tmp1833
%.tmp1835 = icmp eq i8 %.tmp1834, 97
br i1 %.tmp1835, label %.if.true.1836, label %.if.false.1836
.if.true.1836:
%.tmp1837 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1838 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1837, i32 0, i32 1
%.tmp1839 = load %m972$.Rule.type**, %m972$.Rule.type*** %.tmp1838
%.tmp1840 = load %m972$.Query.type*, %m972$.Query.type** %q.1642
%.tmp1841 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1840, i32 0, i32 1
%.tmp1842 = load i8*, i8** %.tmp1841
%.tmp1843 = call %m972$.Rule.type*(%m972$.Rule.type**,i8*) @m972$_find_rule.m972$.Rule.typep.m972$.Rule.typepp.cp(%m972$.Rule.type** %.tmp1839, i8* %.tmp1842)
%alias_rule.1844 = alloca %m972$.Rule.type*
store %m972$.Rule.type* %.tmp1843, %m972$.Rule.type** %alias_rule.1844
%.tmp1845 = load %m972$.Rule.type*, %m972$.Rule.type** %alias_rule.1844
%.tmp1846 = icmp eq %m972$.Rule.type* %.tmp1845, null
br i1 %.tmp1846, label %.if.true.1847, label %.if.false.1847
.if.true.1847:
%.tmp1848 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1849 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1848, i32 0, i32 0
%.tmp1850 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1849
%.tmp1852 = getelementptr [30 x i8], [30 x i8]*@.str1851, i32 0, i32 0
%.tmp1853 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1850, i8* %.tmp1852)
store %m296$.Error.type* %.tmp1853, %m296$.Error.type** %err.1637
br label %.if.end.1847
.if.false.1847:
%.tmp1854 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1855 = load %m972$.Rule.type*, %m972$.Rule.type** %alias_rule.1844
%.tmp1856 = call %m972$.ParseResult.type*(%m972$.AstContext.type*,%m972$.Rule.type*) @m972$parse_to_ast.m972$.ParseResult.typep.m972$.AstContext.typep.m972$.Rule.typep(%m972$.AstContext.type* %.tmp1854, %m972$.Rule.type* %.tmp1855)
%parse_result.1857 = alloca %m972$.ParseResult.type*
store %m972$.ParseResult.type* %.tmp1856, %m972$.ParseResult.type** %parse_result.1857
%.tmp1858 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %parse_result.1857
%.tmp1859 = getelementptr %m972$.ParseResult.type, %m972$.ParseResult.type* %.tmp1858, i32 0, i32 0
%.tmp1860 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1859
%.tmp1861 = icmp ne %m296$.Error.type* %.tmp1860, null
br i1 %.tmp1861, label %.if.true.1862, label %.if.false.1862
.if.true.1862:
%.tmp1863 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %parse_result.1857
%.tmp1864 = getelementptr %m972$.ParseResult.type, %m972$.ParseResult.type* %.tmp1863, i32 0, i32 0
%.tmp1865 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1864
store %m296$.Error.type* %.tmp1865, %m296$.Error.type** %err.1637
br label %.if.end.1862
.if.false.1862:
%.tmp1866 = load %m972$.Node.type*, %m972$.Node.type** %base
%.tmp1867 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %parse_result.1857
%.tmp1868 = getelementptr %m972$.ParseResult.type, %m972$.ParseResult.type* %.tmp1867, i32 0, i32 1
%.tmp1869 = load %m972$.Node.type*, %m972$.Node.type** %.tmp1868
call void(%m972$.Node.type*,%m972$.Node.type*) @m972$child_append.v.m972$.Node.typep.m972$.Node.typep(%m972$.Node.type* %.tmp1866, %m972$.Node.type* %.tmp1869)
%.tmp1870 = load i32, i32* %new_children.1635
%.tmp1871 = add i32 %.tmp1870, 1
store i32 %.tmp1871, i32* %new_children.1635
br label %.if.end.1862
.if.end.1862:
%.tmp1872 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %parse_result.1857
%.tmp1873 = bitcast %m972$.ParseResult.type* %.tmp1872 to i8*
call void(i8*) @free(i8* %.tmp1873)
br label %.if.end.1847
.if.end.1847:
br label %.if.end.1836
.if.false.1836:
%.tmp1875 = getelementptr [41 x i8], [41 x i8]*@.str1874, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp1875)
br label %.if.end.1836
.if.end.1836:
br label %.if.end.1750
.if.end.1750:
br label %.if.end.1652
.if.end.1652:
%.tmp1876 = load %m972$.Query.type*, %m972$.Query.type** %q.1642
%.tmp1877 = getelementptr %m972$.Query.type, %m972$.Query.type* %.tmp1876, i32 0, i32 2
%.tmp1878 = load %m972$.Query.type*, %m972$.Query.type** %.tmp1877
store %m972$.Query.type* %.tmp1878, %m972$.Query.type** %q.1642
br label %.for.start.1638
.for.end.1638:
%.tmp1879 = load %m296$.Error.type*, %m296$.Error.type** %err.1637
%.tmp1880 = icmp ne %m296$.Error.type* %.tmp1879, null
br i1 %.tmp1880, label %.if.true.1881, label %.if.false.1881
.if.true.1881:
%.tmp1882 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1883 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1882, i32 0, i32 0
%.tmp1884 = load %m297$.Token.type*, %m297$.Token.type** %start_token.1634
store %m297$.Token.type* %.tmp1884, %m297$.Token.type** %.tmp1883
%i.1886 = alloca i32
store i32 0, i32* %i.1886
br label %.for.start.1885
.for.start.1885:
%.tmp1887 = load i32, i32* %i.1886
%.tmp1888 = load i32, i32* %new_children.1635
%.tmp1889 = icmp slt i32 %.tmp1887, %.tmp1888
br i1 %.tmp1889, label %.for.continue.1885, label %.for.end.1885
.for.continue.1885:
%.tmp1890 = load %m972$.Node.type*, %m972$.Node.type** %base
call void(%m972$.Node.type*) @m972$child_pop.v.m972$.Node.typep(%m972$.Node.type* %.tmp1890)
%.tmp1891 = load i32, i32* %i.1886
%.tmp1892 = add i32 %.tmp1891, 1
store i32 %.tmp1892, i32* %i.1886
br label %.for.start.1885
.for.end.1885:
br label %.if.end.1881
.if.false.1881:
br label %.if.end.1881
.if.end.1881:
%.tmp1893 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m
%.tmp1894 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1893, i32 0, i32 2
%.tmp1895 = load %m972$.Matcher.type*, %m972$.Matcher.type** %.tmp1894
%.tmp1896 = icmp ne %m972$.Matcher.type* %.tmp1895, null
%.tmp1897 = load %m296$.Error.type*, %m296$.Error.type** %err.1637
%.tmp1898 = icmp ne %m296$.Error.type* %.tmp1897, null
%.tmp1899 = and i1 %.tmp1896, %.tmp1898
br i1 %.tmp1899, label %.if.true.1900, label %.if.false.1900
.if.true.1900:
%.tmp1901 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1902 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m
%.tmp1903 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1902, i32 0, i32 2
%.tmp1904 = load %m972$.Matcher.type*, %m972$.Matcher.type** %.tmp1903
%.tmp1905 = load %m972$.Node.type*, %m972$.Node.type** %base
%.tmp1906 = call %m296$.Error.type*(%m972$.AstContext.type*,%m972$.Matcher.type*,%m972$.Node.type*) @m972$parse_query.m296$.Error.typep.m972$.AstContext.typep.m972$.Matcher.typep.m972$.Node.typep(%m972$.AstContext.type* %.tmp1901, %m972$.Matcher.type* %.tmp1904, %m972$.Node.type* %.tmp1905)
%new_err.1907 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1906, %m296$.Error.type** %new_err.1907
%.tmp1908 = load %m296$.Error.type*, %m296$.Error.type** %new_err.1907
%.tmp1909 = icmp eq %m296$.Error.type* %.tmp1908, null
br i1 %.tmp1909, label %.if.true.1910, label %.if.false.1910
.if.true.1910:
store %m296$.Error.type* null, %m296$.Error.type** %err.1637
br label %.if.end.1910
.if.false.1910:
%.tmp1911 = load %m296$.Error.type*, %m296$.Error.type** %new_err.1907
%.tmp1912 = bitcast %m296$.Error.type* %.tmp1911 to i8*
call void(i8*) @free(i8* %.tmp1912)
br label %.if.end.1910
.if.end.1910:
br label %.if.end.1900
.if.false.1900:
br label %.if.end.1900
.if.end.1900:
%.tmp1913 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m
%.tmp1914 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1913, i32 0, i32 1
%.tmp1915 = load i8, i8* %.tmp1914
%.tmp1916 = icmp eq i8 %.tmp1915, 49
br i1 %.tmp1916, label %.if.true.1917, label %.if.false.1917
.if.true.1917:
br label %.if.end.1917
.if.false.1917:
%.tmp1918 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m
%.tmp1919 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1918, i32 0, i32 1
%.tmp1920 = load i8, i8* %.tmp1919
%.tmp1921 = icmp eq i8 %.tmp1920, 43
%.tmp1922 = load %m296$.Error.type*, %m296$.Error.type** %err.1637
%.tmp1923 = icmp eq %m296$.Error.type* %.tmp1922, null
%.tmp1924 = and i1 %.tmp1921, %.tmp1923
br i1 %.tmp1924, label %.if.true.1925, label %.if.false.1925
.if.true.1925:
%.tmp1926 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1927 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m
%.tmp1928 = load %m972$.Node.type*, %m972$.Node.type** %base
%.tmp1929 = call %m296$.Error.type*(%m972$.AstContext.type*,%m972$.Matcher.type*,%m972$.Node.type*) @m972$parse_query.m296$.Error.typep.m972$.AstContext.typep.m972$.Matcher.typep.m972$.Node.typep(%m972$.AstContext.type* %.tmp1926, %m972$.Matcher.type* %.tmp1927, %m972$.Node.type* %.tmp1928)
store %m296$.Error.type* %.tmp1929, %m296$.Error.type** %err.1637
%.tmp1930 = load %m296$.Error.type*, %m296$.Error.type** %err.1637
%.tmp1931 = icmp ne %m296$.Error.type* %.tmp1930, null
br i1 %.tmp1931, label %.if.true.1932, label %.if.false.1932
.if.true.1932:
%.tmp1933 = load %m296$.Error.type*, %m296$.Error.type** %err.1637
%.tmp1934 = bitcast %m296$.Error.type* %.tmp1933 to i8*
call void(i8*) @free(i8* %.tmp1934)
store %m296$.Error.type* null, %m296$.Error.type** %err.1637
br label %.if.end.1932
.if.false.1932:
%.tmp1935 = bitcast ptr null to %m296$.Error.type*
ret %m296$.Error.type* %.tmp1935
br label %.if.end.1932
.if.end.1932:
br label %.if.end.1925
.if.false.1925:
%.tmp1936 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m
%.tmp1937 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1936, i32 0, i32 1
%.tmp1938 = load i8, i8* %.tmp1937
%.tmp1939 = icmp eq i8 %.tmp1938, 63
%.tmp1940 = load %m296$.Error.type*, %m296$.Error.type** %err.1637
%.tmp1941 = icmp ne %m296$.Error.type* %.tmp1940, null
%.tmp1942 = and i1 %.tmp1939, %.tmp1941
br i1 %.tmp1942, label %.if.true.1943, label %.if.false.1943
.if.true.1943:
%.tmp1944 = load %m296$.Error.type*, %m296$.Error.type** %err.1637
%.tmp1945 = bitcast %m296$.Error.type* %.tmp1944 to i8*
call void(i8*) @free(i8* %.tmp1945)
store %m296$.Error.type* null, %m296$.Error.type** %err.1637
br label %.if.end.1943
.if.false.1943:
%.tmp1946 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m
%.tmp1947 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1946, i32 0, i32 1
%.tmp1948 = load i8, i8* %.tmp1947
%.tmp1949 = icmp eq i8 %.tmp1948, 42
br i1 %.tmp1949, label %.if.true.1950, label %.if.false.1950
.if.true.1950:
%.tmp1951 = load %m296$.Error.type*, %m296$.Error.type** %err.1637
%.tmp1952 = icmp ne %m296$.Error.type* %.tmp1951, null
br i1 %.tmp1952, label %.if.true.1953, label %.if.false.1953
.if.true.1953:
%.tmp1954 = load %m296$.Error.type*, %m296$.Error.type** %err.1637
%.tmp1955 = bitcast %m296$.Error.type* %.tmp1954 to i8*
call void(i8*) @free(i8* %.tmp1955)
store %m296$.Error.type* null, %m296$.Error.type** %err.1637
br label %.if.end.1953
.if.false.1953:
%.tmp1956 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1957 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m
%.tmp1958 = load %m972$.Node.type*, %m972$.Node.type** %base
%.tmp1959 = call %m296$.Error.type*(%m972$.AstContext.type*,%m972$.Matcher.type*,%m972$.Node.type*) @m972$parse_query.m296$.Error.typep.m972$.AstContext.typep.m972$.Matcher.typep.m972$.Node.typep(%m972$.AstContext.type* %.tmp1956, %m972$.Matcher.type* %.tmp1957, %m972$.Node.type* %.tmp1958)
ret %m296$.Error.type* %.tmp1959
br label %.if.end.1953
.if.end.1953:
br label %.if.end.1950
.if.false.1950:
br label %.if.end.1950
.if.end.1950:
br label %.if.end.1943
.if.end.1943:
br label %.if.end.1925
.if.end.1925:
br label %.if.end.1917
.if.end.1917:
%.tmp1960 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m
%.tmp1961 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1960, i32 0, i32 3
%.tmp1962 = load %m972$.Matcher.type*, %m972$.Matcher.type** %.tmp1961
%.tmp1963 = icmp ne %m972$.Matcher.type* %.tmp1962, null
%.tmp1964 = load %m296$.Error.type*, %m296$.Error.type** %err.1637
%.tmp1965 = icmp eq %m296$.Error.type* %.tmp1964, null
%.tmp1966 = and i1 %.tmp1963, %.tmp1965
br i1 %.tmp1966, label %.if.true.1967, label %.if.false.1967
.if.true.1967:
%.tmp1968 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1969 = load %m972$.Matcher.type*, %m972$.Matcher.type** %m
%.tmp1970 = getelementptr %m972$.Matcher.type, %m972$.Matcher.type* %.tmp1969, i32 0, i32 3
%.tmp1971 = load %m972$.Matcher.type*, %m972$.Matcher.type** %.tmp1970
%.tmp1972 = load %m972$.Node.type*, %m972$.Node.type** %base
%.tmp1973 = call %m296$.Error.type*(%m972$.AstContext.type*,%m972$.Matcher.type*,%m972$.Node.type*) @m972$parse_query.m296$.Error.typep.m972$.AstContext.typep.m972$.Matcher.typep.m972$.Node.typep(%m972$.AstContext.type* %.tmp1968, %m972$.Matcher.type* %.tmp1971, %m972$.Node.type* %.tmp1972)
store %m296$.Error.type* %.tmp1973, %m296$.Error.type** %err.1637
br label %.if.end.1967
.if.false.1967:
br label %.if.end.1967
.if.end.1967:
%.tmp1974 = load %m296$.Error.type*, %m296$.Error.type** %err.1637
%.tmp1975 = bitcast %m296$.Error.type* %.tmp1974 to %m296$.Error.type*
ret %m296$.Error.type* %.tmp1975
}
define %m972$.ParseResult.type* @m972$parse_to_ast.m972$.ParseResult.typep.m972$.AstContext.typep.m972$.Rule.typep(%m972$.AstContext.type* %.c.arg, %m972$.Rule.type* %.rule.arg) {
%c = alloca %m972$.AstContext.type*
store %m972$.AstContext.type* %.c.arg, %m972$.AstContext.type** %c
%rule = alloca %m972$.Rule.type*
store %m972$.Rule.type* %.rule.arg, %m972$.Rule.type** %rule
%.tmp1976 = getelementptr %m972$.ParseResult.type, %m972$.ParseResult.type* null, i32 1
%.tmp1977 = ptrtoint %m972$.ParseResult.type* %.tmp1976 to i32
%.tmp1978 = call i8*(i32) @malloc(i32 %.tmp1977)
%.tmp1979 = bitcast i8* %.tmp1978 to %m972$.ParseResult.type*
%res.1980 = alloca %m972$.ParseResult.type*
store %m972$.ParseResult.type* %.tmp1979, %m972$.ParseResult.type** %res.1980
%.tmp1981 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %res.1980
%.tmp1982 = getelementptr %m972$.ParseResult.type, %m972$.ParseResult.type* %.tmp1981, i32 0, i32 0
store %m296$.Error.type* null, %m296$.Error.type** %.tmp1982
%.tmp1983 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %res.1980
%.tmp1984 = getelementptr %m972$.ParseResult.type, %m972$.ParseResult.type* %.tmp1983, i32 0, i32 1
%.tmp1985 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1986 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1985, i32 0, i32 0
%.tmp1987 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1986
%.tmp1988 = load %m972$.Rule.type*, %m972$.Rule.type** %rule
%.tmp1989 = getelementptr %m972$.Rule.type, %m972$.Rule.type* %.tmp1988, i32 0, i32 0
%.tmp1990 = load i8*, i8** %.tmp1989
%.tmp1991 = bitcast ptr null to i8*
%.tmp1992 = call %m972$.Node.type*(%m297$.Token.type*,i8*,i8*) @m972$new_node.m972$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1987, i8* %.tmp1990, i8* %.tmp1991)
store %m972$.Node.type* %.tmp1992, %m972$.Node.type** %.tmp1984
%.tmp1993 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp1994 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %.tmp1993, i32 0, i32 0
%.tmp1995 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1994
%start_match.1996 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1995, %m297$.Token.type** %start_match.1996
%.tmp1997 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %res.1980
%.tmp1998 = getelementptr %m972$.ParseResult.type, %m972$.ParseResult.type* %.tmp1997, i32 0, i32 0
%.tmp1999 = load %m972$.AstContext.type*, %m972$.AstContext.type** %c
%.tmp2000 = load %m972$.Rule.type*, %m972$.Rule.type** %rule
%.tmp2001 = getelementptr %m972$.Rule.type, %m972$.Rule.type* %.tmp2000, i32 0, i32 1
%.tmp2002 = load %m972$.Matcher.type*, %m972$.Matcher.type** %.tmp2001
%.tmp2003 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %res.1980
%.tmp2004 = getelementptr %m972$.ParseResult.type, %m972$.ParseResult.type* %.tmp2003, i32 0, i32 1
%.tmp2005 = load %m972$.Node.type*, %m972$.Node.type** %.tmp2004
%.tmp2006 = call %m296$.Error.type*(%m972$.AstContext.type*,%m972$.Matcher.type*,%m972$.Node.type*) @m972$parse_query.m296$.Error.typep.m972$.AstContext.typep.m972$.Matcher.typep.m972$.Node.typep(%m972$.AstContext.type* %.tmp1999, %m972$.Matcher.type* %.tmp2002, %m972$.Node.type* %.tmp2005)
store %m296$.Error.type* %.tmp2006, %m296$.Error.type** %.tmp1998
%.tmp2007 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %res.1980
ret %m972$.ParseResult.type* %.tmp2007
}
define %m972$.ParseResult.type* @m972$ast.m972$.ParseResult.typep.m972$.Rule.typepp.cp.m297$.Token.typep(%m972$.Rule.type** %.grammar.arg, i8* %.start.arg, %m297$.Token.type* %.tokens.arg) {
%grammar = alloca %m972$.Rule.type**
store %m972$.Rule.type** %.grammar.arg, %m972$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m297$.Token.type*
store %m297$.Token.type* %.tokens.arg, %m297$.Token.type** %tokens
%.tmp2008 = load %m972$.Rule.type**, %m972$.Rule.type*** %grammar
%.tmp2009 = load i8*, i8** %start
%.tmp2010 = call %m972$.Rule.type*(%m972$.Rule.type**,i8*) @m972$_find_rule.m972$.Rule.typep.m972$.Rule.typepp.cp(%m972$.Rule.type** %.tmp2008, i8* %.tmp2009)
%start_matcher.2011 = alloca %m972$.Rule.type*
store %m972$.Rule.type* %.tmp2010, %m972$.Rule.type** %start_matcher.2011
%.tmp2012 = load %m972$.Rule.type*, %m972$.Rule.type** %start_matcher.2011
%.tmp2013 = icmp ne %m972$.Rule.type* %.tmp2012, null
%.tmp2015 = getelementptr [44 x i8], [44 x i8]*@.str2014, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2013, i8* %.tmp2015)
%c.2016 = alloca %m972$.AstContext.type
%.tmp2017 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %c.2016, i32 0, i32 0
store %m297$.Token.type* null, %m297$.Token.type** %.tmp2017
%.tmp2018 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %c.2016, i32 0, i32 1
store %m972$.Rule.type** null, %m972$.Rule.type*** %.tmp2018
%.tmp2019 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %c.2016, i32 0, i32 0
%.tmp2020 = load %m297$.Token.type*, %m297$.Token.type** %tokens
store %m297$.Token.type* %.tmp2020, %m297$.Token.type** %.tmp2019
%.tmp2021 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %c.2016, i32 0, i32 1
%.tmp2022 = load %m972$.Rule.type**, %m972$.Rule.type*** %grammar
store %m972$.Rule.type** %.tmp2022, %m972$.Rule.type*** %.tmp2021
%.tmp2023 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %c.2016, i32 0
%.tmp2024 = load %m972$.Rule.type*, %m972$.Rule.type** %start_matcher.2011
%.tmp2025 = call %m972$.ParseResult.type*(%m972$.AstContext.type*,%m972$.Rule.type*) @m972$parse_to_ast.m972$.ParseResult.typep.m972$.AstContext.typep.m972$.Rule.typep(%m972$.AstContext.type* %.tmp2023, %m972$.Rule.type* %.tmp2024)
%res.2026 = alloca %m972$.ParseResult.type*
store %m972$.ParseResult.type* %.tmp2025, %m972$.ParseResult.type** %res.2026
%.tmp2027 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %c.2016, i32 0, i32 0
%.tmp2028 = load %m297$.Token.type*, %m297$.Token.type** %.tmp2027
%.tmp2029 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp2028, i32 0, i32 0
%.tmp2030 = load i8*, i8** %.tmp2029
%.tmp2032 = getelementptr [4 x i8], [4 x i8]*@.str2031, i32 0, i32 0
%.tmp2033 = call i32(i8*,i8*) @strcmp(i8* %.tmp2030, i8* %.tmp2032)
%.tmp2034 = icmp ne i32 %.tmp2033, 0
%.tmp2035 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %res.2026
%.tmp2036 = getelementptr %m972$.ParseResult.type, %m972$.ParseResult.type* %.tmp2035, i32 0, i32 0
%.tmp2037 = load %m296$.Error.type*, %m296$.Error.type** %.tmp2036
%.tmp2038 = icmp eq %m296$.Error.type* %.tmp2037, null
%.tmp2039 = and i1 %.tmp2034, %.tmp2038
br i1 %.tmp2039, label %.if.true.2040, label %.if.false.2040
.if.true.2040:
%.tmp2041 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %res.2026
%.tmp2042 = getelementptr %m972$.ParseResult.type, %m972$.ParseResult.type* %.tmp2041, i32 0, i32 0
%.tmp2043 = getelementptr %m972$.AstContext.type, %m972$.AstContext.type* %c.2016, i32 0, i32 0
%.tmp2044 = load %m297$.Token.type*, %m297$.Token.type** %.tmp2043
%.tmp2046 = getelementptr [26 x i8], [26 x i8]*@.str2045, i32 0, i32 0
%.tmp2047 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp2044, i8* %.tmp2046)
store %m296$.Error.type* %.tmp2047, %m296$.Error.type** %.tmp2042
br label %.if.end.2040
.if.false.2040:
br label %.if.end.2040
.if.end.2040:
%.tmp2048 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %res.2026
ret %m972$.ParseResult.type* %.tmp2048
}
define i8* @m2049$node_to_string.cp.m972$.Node.typep(%m972$.Node.type* %.n.arg) {
%n = alloca %m972$.Node.type*
store %m972$.Node.type* %.n.arg, %m972$.Node.type** %n
%.tmp2050 = call %m0$.File.type*() @tmpfile()
%tmp.2051 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2050, %m0$.File.type** %tmp.2051
%.tmp2052 = load %m972$.Node.type*, %m972$.Node.type** %n
%.tmp2053 = load %m0$.File.type*, %m0$.File.type** %tmp.2051
call void(%m972$.Node.type*,%m0$.File.type*,i32) @m2049$_node_to_string.v.m972$.Node.typep.m0$.File.typep.i(%m972$.Node.type* %.tmp2052, %m0$.File.type* %.tmp2053, i32 1)
%.tmp2054 = load %m0$.File.type*, %m0$.File.type** %tmp.2051
%.tmp2055 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp2054)
%.tmp2056 = load %m0$.File.type*, %m0$.File.type** %tmp.2051
%.tmp2057 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp2056)
%str_len.2058 = alloca i32
store i32 %.tmp2057, i32* %str_len.2058
%.tmp2059 = load %m0$.File.type*, %m0$.File.type** %tmp.2051
%.tmp2060 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp2059)
%tmp_fd.2061 = alloca i32
store i32 %.tmp2060, i32* %tmp_fd.2061
%.tmp2062 = load i32, i32* %tmp_fd.2061
%.tmp2063 = load i32, i32* @SEEK_SET
%.tmp2064 = call i32(i32,i32,i32) @lseek(i32 %.tmp2062, i32 0, i32 %.tmp2063)
%.tmp2065 = load i32, i32* %str_len.2058
%.tmp2066 = call i8*(i32) @malloc(i32 %.tmp2065)
%buf.2067 = alloca i8*
store i8* %.tmp2066, i8** %buf.2067
%.tmp2068 = load i32, i32* %tmp_fd.2061
%.tmp2069 = load i8*, i8** %buf.2067
%.tmp2070 = load i32, i32* %str_len.2058
%.tmp2071 = call i32(i32,i8*,i32) @read(i32 %.tmp2068, i8* %.tmp2069, i32 %.tmp2070)
%read.2072 = alloca i32
store i32 %.tmp2071, i32* %read.2072
%.tmp2073 = load i32, i32* %read.2072
%.tmp2074 = load i32, i32* %str_len.2058
%.tmp2075 = icmp ne i32 %.tmp2073, %.tmp2074
br i1 %.tmp2075, label %.if.true.2076, label %.if.false.2076
.if.true.2076:
%.tmp2077 = load i8*, i8** %buf.2067
call void(i8*) @free(i8* %.tmp2077)
store i8* null, i8** %buf.2067
br label %.if.end.2076
.if.false.2076:
br label %.if.end.2076
.if.end.2076:
%.tmp2078 = load i8*, i8** %buf.2067
ret i8* %.tmp2078
}
define void @m2049$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2079 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2081 = getelementptr [2 x i8], [2 x i8]*@.str2080, i32 0, i32 0
%.tmp2082 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2079, i8* %.tmp2081)
%i.2084 = alloca i32
store i32 0, i32* %i.2084
br label %.for.start.2083
.for.start.2083:
%.tmp2085 = load i32, i32* %i.2084
%.tmp2086 = load i32, i32* %indent
%.tmp2087 = icmp slt i32 %.tmp2085, %.tmp2086
br i1 %.tmp2087, label %.for.continue.2083, label %.for.end.2083
.for.continue.2083:
%.tmp2088 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2090 = getelementptr [3 x i8], [3 x i8]*@.str2089, i32 0, i32 0
%.tmp2091 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2088, i8* %.tmp2090)
%.tmp2092 = load i32, i32* %i.2084
%.tmp2093 = add i32 %.tmp2092, 1
store i32 %.tmp2093, i32* %i.2084
br label %.for.start.2083
.for.end.2083:
ret void
}
define void @m2049$_node_to_string.v.m972$.Node.typep.m0$.File.typep.i(%m972$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m972$.Node.type*
store %m972$.Node.type* %.node.arg, %m972$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2094 = load %m972$.Node.type*, %m972$.Node.type** %node
%.tmp2095 = icmp eq %m972$.Node.type* %.tmp2094, null
br i1 %.tmp2095, label %.if.true.2096, label %.if.false.2096
.if.true.2096:
%.tmp2097 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2099 = getelementptr [7 x i8], [7 x i8]*@.str2098, i32 0, i32 0
%.tmp2100 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2097, i8* %.tmp2099)
ret void
br label %.if.end.2096
.if.false.2096:
br label %.if.end.2096
.if.end.2096:
%.tmp2101 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2103 = getelementptr [2 x i8], [2 x i8]*@.str2102, i32 0, i32 0
%.tmp2104 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2101, i8* %.tmp2103)
%.tmp2105 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2106 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2049$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2105, i32 %.tmp2106)
%.tmp2107 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2109 = getelementptr [13 x i8], [13 x i8]*@.str2108, i32 0, i32 0
%.tmp2110 = load %m972$.Node.type*, %m972$.Node.type** %node
%.tmp2111 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2110, i32 0, i32 0
%.tmp2112 = load i8*, i8** %.tmp2111
%.tmp2113 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2107, i8* %.tmp2109, i8* %.tmp2112)
%.tmp2114 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2115 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2049$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2114, i32 %.tmp2115)
%.tmp2116 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2118 = getelementptr [12 x i8], [12 x i8]*@.str2117, i32 0, i32 0
%.tmp2119 = load %m972$.Node.type*, %m972$.Node.type** %node
%.tmp2120 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2119, i32 0, i32 1
%.tmp2121 = load i8*, i8** %.tmp2120
%.tmp2122 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2116, i8* %.tmp2118, i8* %.tmp2121)
%.tmp2123 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2124 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2049$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2123, i32 %.tmp2124)
%.tmp2125 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2127 = getelementptr [11 x i8], [11 x i8]*@.str2126, i32 0, i32 0
%.tmp2128 = load %m972$.Node.type*, %m972$.Node.type** %node
%.tmp2129 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2128, i32 0, i32 3
%.tmp2130 = load i32, i32* %.tmp2129
%.tmp2131 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2125, i8* %.tmp2127, i32 %.tmp2130)
%.tmp2132 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2133 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2049$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2132, i32 %.tmp2133)
%.tmp2134 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2136 = getelementptr [19 x i8], [19 x i8]*@.str2135, i32 0, i32 0
%.tmp2137 = load %m972$.Node.type*, %m972$.Node.type** %node
%.tmp2138 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2137, i32 0, i32 4
%.tmp2139 = load i32, i32* %.tmp2138
%.tmp2140 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2134, i8* %.tmp2136, i32 %.tmp2139)
%.tmp2141 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2142 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2049$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2141, i32 %.tmp2142)
%.tmp2143 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2145 = getelementptr [9 x i8], [9 x i8]*@.str2144, i32 0, i32 0
%.tmp2146 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2143, i8* %.tmp2145)
%.tmp2147 = load %m972$.Node.type*, %m972$.Node.type** %node
%.tmp2148 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2147, i32 0, i32 7
%.tmp2149 = load %m972$.Node.type*, %m972$.Node.type** %.tmp2148
%.tmp2150 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2151 = load i32, i32* %indent
%.tmp2152 = add i32 %.tmp2151, 1
call void(%m972$.Node.type*,%m0$.File.type*,i32) @m2049$_node_to_string.v.m972$.Node.typep.m0$.File.typep.i(%m972$.Node.type* %.tmp2149, %m0$.File.type* %.tmp2150, i32 %.tmp2152)
%.tmp2153 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2154 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2049$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2153, i32 %.tmp2154)
%.tmp2155 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2157 = getelementptr [13 x i8], [13 x i8]*@.str2156, i32 0, i32 0
%.tmp2158 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2155, i8* %.tmp2157)
%.tmp2159 = load %m972$.Node.type*, %m972$.Node.type** %node
%.tmp2160 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2159, i32 0, i32 6
%.tmp2161 = load %m972$.Node.type*, %m972$.Node.type** %.tmp2160
%.tmp2162 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2163 = load i32, i32* %indent
%.tmp2164 = add i32 %.tmp2163, 1
call void(%m972$.Node.type*,%m0$.File.type*,i32) @m2049$_node_to_string.v.m972$.Node.typep.m0$.File.typep.i(%m972$.Node.type* %.tmp2161, %m0$.File.type* %.tmp2162, i32 %.tmp2164)
%.tmp2165 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2166 = load i32, i32* %indent
%.tmp2167 = sub i32 %.tmp2166, 1
call void(%m0$.File.type*,i32) @m2049$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2165, i32 %.tmp2167)
%.tmp2168 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2170 = getelementptr [2 x i8], [2 x i8]*@.str2169, i32 0, i32 0
%.tmp2171 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2168, i8* %.tmp2170)
ret void
}
define i8* @m2172$grammar.cp() {
%.tmp2174 = getelementptr [1886 x i8], [1886 x i8]*@.str2173, i32 0, i32 0
ret i8* %.tmp2174
}
define i8* @m2175$append_tmpl.cp() {
%.tmp2177 = getelementptr [1885 x i8], [1885 x i8]*@.str2176, i32 0, i32 0
ret i8* %.tmp2177
}
define i8* @m2178$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2179 = load i8*, i8** %text
%.tmp2180 = call i32(i8*) @strlen(i8* %.tmp2179)
%str_len.2181 = alloca i32
store i32 %.tmp2180, i32* %str_len.2181
%.tmp2183 = getelementptr [1 x i8], [1 x i8]*@.str2182, i32 0, i32 0
%buf.2184 = alloca i8*
store i8* %.tmp2183, i8** %buf.2184
%i.2186 = alloca i32
store i32 1, i32* %i.2186
br label %.for.start.2185
.for.start.2185:
%.tmp2187 = load i32, i32* %i.2186
%.tmp2188 = load i32, i32* %str_len.2181
%.tmp2189 = sub i32 %.tmp2188, 1
%.tmp2190 = icmp slt i32 %.tmp2187, %.tmp2189
br i1 %.tmp2190, label %.for.continue.2185, label %.for.end.2185
.for.continue.2185:
%.tmp2191 = load i32, i32* %i.2186
%.tmp2192 = load i8*, i8** %text
%.tmp2193 = getelementptr i8, i8* %.tmp2192, i32 %.tmp2191
%.tmp2194 = load i8, i8* %.tmp2193
%.tmp2195 = icmp eq i8 %.tmp2194, 34
br i1 %.tmp2195, label %.if.true.2196, label %.if.false.2196
.if.true.2196:
%.tmp2197 = getelementptr i8*, i8** %buf.2184, i32 0
%.tmp2199 = getelementptr [6 x i8], [6 x i8]*@.str2198, i32 0, i32 0
%.tmp2200 = load i8*, i8** %buf.2184
%.tmp2201 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2197, i8* %.tmp2199, i8* %.tmp2200)
br label %.if.end.2196
.if.false.2196:
%.tmp2202 = load i32, i32* %i.2186
%.tmp2203 = load i8*, i8** %text
%.tmp2204 = getelementptr i8, i8* %.tmp2203, i32 %.tmp2202
%.tmp2205 = load i8, i8* %.tmp2204
%.tmp2206 = icmp eq i8 %.tmp2205, 92
br i1 %.tmp2206, label %.if.true.2207, label %.if.false.2207
.if.true.2207:
%.tmp2208 = load i32, i32* %i.2186
%.tmp2209 = add i32 %.tmp2208, 1
%.tmp2210 = load i8*, i8** %text
%.tmp2211 = getelementptr i8, i8* %.tmp2210, i32 %.tmp2209
%.tmp2212 = load i8, i8* %.tmp2211
%.tmp2213 = icmp eq i8 %.tmp2212, 110
%.tmp2214 = load i32, i32* %i.2186
%.tmp2215 = add i32 %.tmp2214, 1
%.tmp2216 = load i8*, i8** %text
%.tmp2217 = getelementptr i8, i8* %.tmp2216, i32 %.tmp2215
%.tmp2218 = load i8, i8* %.tmp2217
%.tmp2219 = icmp eq i8 %.tmp2218, 78
%.tmp2220 = or i1 %.tmp2213, %.tmp2219
br i1 %.tmp2220, label %.if.true.2221, label %.if.false.2221
.if.true.2221:
%.tmp2222 = getelementptr i8*, i8** %buf.2184, i32 0
%.tmp2224 = getelementptr [6 x i8], [6 x i8]*@.str2223, i32 0, i32 0
%.tmp2225 = load i8*, i8** %buf.2184
%.tmp2226 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2222, i8* %.tmp2224, i8* %.tmp2225)
%.tmp2227 = load i32, i32* %i.2186
%.tmp2228 = add i32 %.tmp2227, 1
store i32 %.tmp2228, i32* %i.2186
br label %.if.end.2221
.if.false.2221:
%.tmp2229 = load i32, i32* %i.2186
%.tmp2230 = add i32 %.tmp2229, 1
%.tmp2231 = load i8*, i8** %text
%.tmp2232 = getelementptr i8, i8* %.tmp2231, i32 %.tmp2230
%.tmp2233 = load i8, i8* %.tmp2232
%.tmp2234 = icmp eq i8 %.tmp2233, 92
br i1 %.tmp2234, label %.if.true.2235, label %.if.false.2235
.if.true.2235:
%.tmp2236 = getelementptr i8*, i8** %buf.2184, i32 0
%.tmp2238 = getelementptr [6 x i8], [6 x i8]*@.str2237, i32 0, i32 0
%.tmp2239 = load i8*, i8** %buf.2184
%.tmp2240 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2236, i8* %.tmp2238, i8* %.tmp2239)
%.tmp2241 = load i32, i32* %i.2186
%.tmp2242 = add i32 %.tmp2241, 1
store i32 %.tmp2242, i32* %i.2186
br label %.if.end.2235
.if.false.2235:
%.tmp2243 = load i32, i32* %i.2186
%.tmp2244 = add i32 %.tmp2243, 1
%.tmp2245 = load i8*, i8** %text
%.tmp2246 = getelementptr i8, i8* %.tmp2245, i32 %.tmp2244
%.tmp2247 = load i8, i8* %.tmp2246
%.tmp2248 = icmp eq i8 %.tmp2247, 120
br i1 %.tmp2248, label %.if.true.2249, label %.if.false.2249
.if.true.2249:
%.tmp2250 = load i32, i32* %i.2186
%.tmp2251 = add i32 %.tmp2250, 2
store i32 %.tmp2251, i32* %i.2186
%.tmp2252 = getelementptr i8*, i8** %buf.2184, i32 0
%.tmp2254 = getelementptr [8 x i8], [8 x i8]*@.str2253, i32 0, i32 0
%.tmp2255 = load i8*, i8** %buf.2184
%.tmp2256 = load i32, i32* %i.2186
%.tmp2257 = load i8*, i8** %text
%.tmp2258 = getelementptr i8, i8* %.tmp2257, i32 %.tmp2256
%.tmp2259 = load i8, i8* %.tmp2258
%.tmp2260 = call i8(i8) @toupper(i8 %.tmp2259)
%.tmp2261 = load i32, i32* %i.2186
%.tmp2262 = add i32 %.tmp2261, 1
%.tmp2263 = load i8*, i8** %text
%.tmp2264 = getelementptr i8, i8* %.tmp2263, i32 %.tmp2262
%.tmp2265 = load i8, i8* %.tmp2264
%.tmp2266 = call i8(i8) @toupper(i8 %.tmp2265)
%.tmp2267 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2252, i8* %.tmp2254, i8* %.tmp2255, i8 %.tmp2260, i8 %.tmp2266)
%.tmp2268 = load i32, i32* %i.2186
%.tmp2269 = add i32 %.tmp2268, 1
store i32 %.tmp2269, i32* %i.2186
br label %.if.end.2249
.if.false.2249:
%.tmp2270 = getelementptr i8*, i8** %buf.2184, i32 0
%.tmp2272 = getelementptr [5 x i8], [5 x i8]*@.str2271, i32 0, i32 0
%.tmp2273 = load i8*, i8** %buf.2184
%.tmp2274 = load i32, i32* %i.2186
%.tmp2275 = load i8*, i8** %text
%.tmp2276 = getelementptr i8, i8* %.tmp2275, i32 %.tmp2274
%.tmp2277 = load i8, i8* %.tmp2276
%.tmp2278 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2270, i8* %.tmp2272, i8* %.tmp2273, i8 %.tmp2277)
br label %.if.end.2249
.if.end.2249:
br label %.if.end.2235
.if.end.2235:
br label %.if.end.2221
.if.end.2221:
br label %.if.end.2207
.if.false.2207:
%.tmp2279 = getelementptr i8*, i8** %buf.2184, i32 0
%.tmp2281 = getelementptr [5 x i8], [5 x i8]*@.str2280, i32 0, i32 0
%.tmp2282 = load i8*, i8** %buf.2184
%.tmp2283 = load i32, i32* %i.2186
%.tmp2284 = load i8*, i8** %text
%.tmp2285 = getelementptr i8, i8* %.tmp2284, i32 %.tmp2283
%.tmp2286 = load i8, i8* %.tmp2285
%.tmp2287 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2279, i8* %.tmp2281, i8* %.tmp2282, i8 %.tmp2286)
br label %.if.end.2207
.if.end.2207:
br label %.if.end.2196
.if.end.2196:
%.tmp2288 = load i32, i32* %i.2186
%.tmp2289 = add i32 %.tmp2288, 1
store i32 %.tmp2289, i32* %i.2186
br label %.for.start.2185
.for.end.2185:
%.tmp2290 = getelementptr i8*, i8** %buf.2184, i32 0
%.tmp2292 = getelementptr [9 x i8], [9 x i8]*@.str2291, i32 0, i32 0
%.tmp2293 = load i8*, i8** %buf.2184
%.tmp2294 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2290, i8* %.tmp2292, i8* %.tmp2293)
%.tmp2295 = load i8*, i8** %buf.2184
ret i8* %.tmp2295
}
define i32 @m2178$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len.2296 = alloca i32
store i32 0, i32* %len.2296
%i.2298 = alloca i32
store i32 2, i32* %i.2298
br label %.for.start.2297
.for.start.2297:
%.tmp2299 = load i32, i32* %i.2298
%.tmp2300 = load i8*, i8** %text
%.tmp2301 = getelementptr i8, i8* %.tmp2300, i32 %.tmp2299
%.tmp2302 = load i8, i8* %.tmp2301
%.tmp2303 = icmp ne i8 %.tmp2302, 0
br i1 %.tmp2303, label %.for.continue.2297, label %.for.end.2297
.for.continue.2297:
%.tmp2304 = load i32, i32* %i.2298
%.tmp2305 = load i8*, i8** %text
%.tmp2306 = getelementptr i8, i8* %.tmp2305, i32 %.tmp2304
%.tmp2307 = load i8, i8* %.tmp2306
%.tmp2308 = icmp eq i8 %.tmp2307, 92
br i1 %.tmp2308, label %.if.true.2309, label %.if.false.2309
.if.true.2309:
%.tmp2310 = load i32, i32* %i.2298
%.tmp2311 = add i32 %.tmp2310, 2
store i32 %.tmp2311, i32* %i.2298
br label %.if.end.2309
.if.false.2309:
br label %.if.end.2309
.if.end.2309:
%.tmp2312 = load i32, i32* %len.2296
%.tmp2313 = add i32 %.tmp2312, 1
store i32 %.tmp2313, i32* %len.2296
%.tmp2314 = load i32, i32* %i.2298
%.tmp2315 = add i32 %.tmp2314, 1
store i32 %.tmp2315, i32* %i.2298
br label %.for.start.2297
.for.end.2297:
%.tmp2316 = load i32, i32* %len.2296
%.tmp2317 = sub i32 %.tmp2316, 1
ret i32 %.tmp2317
}
define i8* @m2178$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval.2318 = alloca i32
store i32 0, i32* %intval.2318
%buf.2319 = alloca i8*
store i8* null, i8** %buf.2319
%chrval.2320 = alloca i8
store i8 0, i8* %chrval.2320
%.tmp2321 = load i8*, i8** %chr_repr
%.tmp2322 = call i32(i8*) @strlen(i8* %.tmp2321)
%chr_len.2323 = alloca i32
store i32 %.tmp2322, i32* %chr_len.2323
%.tmp2324 = load i32, i32* %chr_len.2323
%.tmp2325 = icmp eq i32 %.tmp2324, 6
br i1 %.tmp2325, label %.if.true.2326, label %.if.false.2326
.if.true.2326:
%.tmp2327 = load i8*, i8** %chr_repr
%.tmp2329 = getelementptr [7 x i8], [7 x i8]*@.str2328, i32 0, i32 0
%.tmp2330 = getelementptr i32, i32* %intval.2318, i32 0
%.tmp2331 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2327, i8* %.tmp2329, i32* %.tmp2330)
%.tmp2332 = getelementptr i8*, i8** %buf.2319, i32 0
%.tmp2334 = getelementptr [3 x i8], [3 x i8]*@.str2333, i32 0, i32 0
%.tmp2335 = load i32, i32* %intval.2318
%.tmp2336 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2332, i8* %.tmp2334, i32 %.tmp2335)
br label %.if.end.2326
.if.false.2326:
%.tmp2337 = load i32, i32* %chr_len.2323
%.tmp2338 = icmp eq i32 %.tmp2337, 5
br i1 %.tmp2338, label %.if.true.2339, label %.if.false.2339
.if.true.2339:
%.tmp2340 = load i8*, i8** %chr_repr
%.tmp2342 = getelementptr [6 x i8], [6 x i8]*@.str2341, i32 0, i32 0
%.tmp2343 = getelementptr i32, i32* %intval.2318, i32 0
%.tmp2344 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2340, i8* %.tmp2342, i32* %.tmp2343)
%.tmp2345 = getelementptr i8*, i8** %buf.2319, i32 0
%.tmp2347 = getelementptr [3 x i8], [3 x i8]*@.str2346, i32 0, i32 0
%.tmp2348 = load i32, i32* %intval.2318
%.tmp2349 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2345, i8* %.tmp2347, i32 %.tmp2348)
br label %.if.end.2339
.if.false.2339:
%.tmp2350 = load i32, i32* %chr_len.2323
%.tmp2351 = icmp eq i32 %.tmp2350, 4
br i1 %.tmp2351, label %.if.true.2352, label %.if.false.2352
.if.true.2352:
%.tmp2353 = load i8*, i8** %chr_repr
%.tmp2355 = getelementptr [6 x i8], [6 x i8]*@.str2354, i32 0, i32 0
%.tmp2356 = getelementptr i8, i8* %chrval.2320, i32 0
%.tmp2357 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2353, i8* %.tmp2355, i8* %.tmp2356)
%.tmp2358 = load i8, i8* %chrval.2320
%.tmp2359 = icmp eq i8 %.tmp2358, 110
br i1 %.tmp2359, label %.if.true.2360, label %.if.false.2360
.if.true.2360:
%.tmp2362 = getelementptr [3 x i8], [3 x i8]*@.str2361, i32 0, i32 0
store i8* %.tmp2362, i8** %buf.2319
br label %.if.end.2360
.if.false.2360:
%.tmp2363 = bitcast ptr null to i8*
ret i8* %.tmp2363
br label %.if.end.2360
.if.end.2360:
br label %.if.end.2352
.if.false.2352:
%.tmp2364 = load i32, i32* %chr_len.2323
%.tmp2365 = icmp eq i32 %.tmp2364, 3
br i1 %.tmp2365, label %.if.true.2366, label %.if.false.2366
.if.true.2366:
%.tmp2367 = load i8*, i8** %chr_repr
%.tmp2369 = getelementptr [5 x i8], [5 x i8]*@.str2368, i32 0, i32 0
%.tmp2370 = getelementptr i32, i32* %intval.2318, i32 0
%.tmp2371 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2367, i8* %.tmp2369, i32* %.tmp2370)
%.tmp2372 = getelementptr i8*, i8** %buf.2319, i32 0
%.tmp2374 = getelementptr [3 x i8], [3 x i8]*@.str2373, i32 0, i32 0
%.tmp2375 = load i32, i32* %intval.2318
%.tmp2376 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2372, i8* %.tmp2374, i32 %.tmp2375)
br label %.if.end.2366
.if.false.2366:
%.tmp2377 = bitcast ptr null to i8*
ret i8* %.tmp2377
br label %.if.end.2366
.if.end.2366:
br label %.if.end.2352
.if.end.2352:
br label %.if.end.2339
.if.end.2339:
br label %.if.end.2326
.if.end.2326:
%.tmp2378 = load i8*, i8** %buf.2319
ret i8* %.tmp2378
}
%m2379$.SYStack.type = type {%m972$.Node.type*,%m2379$.SYStack.type*}
@SYStack_size = constant i32 16
define %m2379$.SYStack.type* @m2379$stack_new.m2379$.SYStack.typep() {
%.tmp2380 = load i32, i32* @SYStack_size
%.tmp2381 = call i8*(i32) @malloc(i32 %.tmp2380)
%.tmp2382 = bitcast i8* %.tmp2381 to %m2379$.SYStack.type*
%s.2383 = alloca %m2379$.SYStack.type*
store %m2379$.SYStack.type* %.tmp2382, %m2379$.SYStack.type** %s.2383
%.tmp2384 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %s.2383
%.tmp2385 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2384, i32 0, i32 0
store %m972$.Node.type* null, %m972$.Node.type** %.tmp2385
%.tmp2386 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %s.2383
%.tmp2387 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2386, i32 0, i32 1
store %m2379$.SYStack.type* null, %m2379$.SYStack.type** %.tmp2387
%.tmp2388 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %s.2383
ret %m2379$.SYStack.type* %.tmp2388
}
define %m2379$.SYStack.type* @m2379$sy_algorithm.m2379$.SYStack.typep.m972$.Node.typep(%m972$.Node.type* %.assignable.arg) {
%assignable = alloca %m972$.Node.type*
store %m972$.Node.type* %.assignable.arg, %m972$.Node.type** %assignable
%.tmp2389 = call %m2379$.SYStack.type*() @m2379$stack_new.m2379$.SYStack.typep()
%out_stack.2390 = alloca %m2379$.SYStack.type*
store %m2379$.SYStack.type* %.tmp2389, %m2379$.SYStack.type** %out_stack.2390
%.tmp2391 = call %m2379$.SYStack.type*() @m2379$stack_new.m2379$.SYStack.typep()
%op_stack.2392 = alloca %m2379$.SYStack.type*
store %m2379$.SYStack.type* %.tmp2391, %m2379$.SYStack.type** %op_stack.2392
%.tmp2393 = call %m2379$.SYStack.type*() @m2379$stack_new.m2379$.SYStack.typep()
%token_stack.2394 = alloca %m2379$.SYStack.type*
store %m2379$.SYStack.type* %.tmp2393, %m2379$.SYStack.type** %token_stack.2394
%ptr.2395 = alloca %m972$.Node.type*
store %m972$.Node.type* null, %m972$.Node.type** %ptr.2395
%.tmp2397 = load %m972$.Node.type*, %m972$.Node.type** %assignable
store %m972$.Node.type* %.tmp2397, %m972$.Node.type** %ptr.2395
br label %.for.start.2396
.for.start.2396:
%.tmp2398 = load %m972$.Node.type*, %m972$.Node.type** %ptr.2395
%.tmp2399 = icmp ne %m972$.Node.type* %.tmp2398, null
br i1 %.tmp2399, label %.for.continue.2396, label %.for.end.2396
.for.continue.2396:
%.tmp2400 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %token_stack.2394
%.tmp2401 = load %m972$.Node.type*, %m972$.Node.type** %ptr.2395
%.tmp2402 = call %m2379$.SYStack.type*(%m2379$.SYStack.type*,%m972$.Node.type*) @m2379$stack_push.m2379$.SYStack.typep.m2379$.SYStack.typep.m972$.Node.typep(%m2379$.SYStack.type* %.tmp2400, %m972$.Node.type* %.tmp2401)
store %m2379$.SYStack.type* %.tmp2402, %m2379$.SYStack.type** %token_stack.2394
%.tmp2403 = load %m972$.Node.type*, %m972$.Node.type** %ptr.2395
%.tmp2404 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2403, i32 0, i32 7
%.tmp2405 = load %m972$.Node.type*, %m972$.Node.type** %.tmp2404
store %m972$.Node.type* %.tmp2405, %m972$.Node.type** %ptr.2395
br label %.for.start.2396
.for.end.2396:
%.tmp2407 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %token_stack.2394
%.tmp2408 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2407, i32 0, i32 0
%.tmp2409 = load %m972$.Node.type*, %m972$.Node.type** %.tmp2408
store %m972$.Node.type* %.tmp2409, %m972$.Node.type** %ptr.2395
br label %.for.start.2406
.for.start.2406:
%.tmp2410 = load %m972$.Node.type*, %m972$.Node.type** %ptr.2395
%.tmp2411 = icmp ne %m972$.Node.type* %.tmp2410, null
br i1 %.tmp2411, label %.for.continue.2406, label %.for.end.2406
.for.continue.2406:
%.tmp2412 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %token_stack.2394
%cs.2413 = alloca %m2379$.SYStack.type*
store %m2379$.SYStack.type* %.tmp2412, %m2379$.SYStack.type** %cs.2413
%.tmp2414 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %token_stack.2394
%.tmp2415 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2414, i32 0, i32 1
%.tmp2416 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %.tmp2415
store %m2379$.SYStack.type* %.tmp2416, %m2379$.SYStack.type** %token_stack.2394
%.tmp2417 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %cs.2413
%.tmp2418 = bitcast %m2379$.SYStack.type* %.tmp2417 to i8*
call void(i8*) @free(i8* %.tmp2418)
%.tmp2419 = load %m972$.Node.type*, %m972$.Node.type** %ptr.2395
%.tmp2420 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2419, i32 0, i32 0
%.tmp2421 = load i8*, i8** %.tmp2420
%.tmp2423 = getelementptr [16 x i8], [16 x i8]*@.str2422, i32 0, i32 0
%.tmp2424 = call i32(i8*,i8*) @strcmp(i8* %.tmp2421, i8* %.tmp2423)
%.tmp2425 = icmp eq i32 %.tmp2424, 0
br i1 %.tmp2425, label %.if.true.2426, label %.if.false.2426
.if.true.2426:
%.tmp2427 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %out_stack.2390
%.tmp2428 = load %m972$.Node.type*, %m972$.Node.type** %ptr.2395
%.tmp2429 = call %m2379$.SYStack.type*(%m2379$.SYStack.type*,%m972$.Node.type*) @m2379$stack_push.m2379$.SYStack.typep.m2379$.SYStack.typep.m972$.Node.typep(%m2379$.SYStack.type* %.tmp2427, %m972$.Node.type* %.tmp2428)
store %m2379$.SYStack.type* %.tmp2429, %m2379$.SYStack.type** %out_stack.2390
br label %.if.end.2426
.if.false.2426:
%.tmp2430 = load %m972$.Node.type*, %m972$.Node.type** %ptr.2395
%.tmp2431 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2430, i32 0, i32 0
%.tmp2432 = load i8*, i8** %.tmp2431
%.tmp2434 = getelementptr [9 x i8], [9 x i8]*@.str2433, i32 0, i32 0
%.tmp2435 = call i32(i8*,i8*) @strcmp(i8* %.tmp2432, i8* %.tmp2434)
%.tmp2436 = icmp eq i32 %.tmp2435, 0
br i1 %.tmp2436, label %.if.true.2437, label %.if.false.2437
.if.true.2437:
%quit.2438 = alloca i1
store i1 0, i1* %quit.2438
br label %.for.start.2439
.for.start.2439:
%.tmp2440 = load i1, i1* %quit.2438
%.tmp2441 = icmp eq i1 %.tmp2440, 0
br i1 %.tmp2441, label %.for.continue.2439, label %.for.end.2439
.for.continue.2439:
%.tmp2442 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %op_stack.2392
%.tmp2443 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2442, i32 0, i32 0
%.tmp2444 = load %m972$.Node.type*, %m972$.Node.type** %.tmp2443
%.tmp2445 = icmp eq %m972$.Node.type* %.tmp2444, null
br i1 %.tmp2445, label %.if.true.2446, label %.if.false.2446
.if.true.2446:
store i1 1, i1* %quit.2438
br label %.if.end.2446
.if.false.2446:
%.tmp2447 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %op_stack.2392
%.tmp2448 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2447, i32 0, i32 0
%.tmp2449 = load %m972$.Node.type*, %m972$.Node.type** %.tmp2448
%.tmp2450 = call i32(%m972$.Node.type*) @m2379$op_precedence.i.m972$.Node.typep(%m972$.Node.type* %.tmp2449)
%.tmp2451 = load %m972$.Node.type*, %m972$.Node.type** %ptr.2395
%.tmp2452 = call i32(%m972$.Node.type*) @m2379$op_precedence.i.m972$.Node.typep(%m972$.Node.type* %.tmp2451)
%.tmp2453 = icmp slt i32 %.tmp2450, %.tmp2452
br i1 %.tmp2453, label %.if.true.2454, label %.if.false.2454
.if.true.2454:
%.tmp2455 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %op_stack.2392
%top.2456 = alloca %m2379$.SYStack.type*
store %m2379$.SYStack.type* %.tmp2455, %m2379$.SYStack.type** %top.2456
%.tmp2457 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %op_stack.2392
%.tmp2458 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2457, i32 0, i32 1
%.tmp2459 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %.tmp2458
store %m2379$.SYStack.type* %.tmp2459, %m2379$.SYStack.type** %op_stack.2392
%.tmp2460 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %out_stack.2390
%.tmp2461 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %top.2456
%.tmp2462 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2461, i32 0, i32 0
%.tmp2463 = load %m972$.Node.type*, %m972$.Node.type** %.tmp2462
%.tmp2464 = call %m2379$.SYStack.type*(%m2379$.SYStack.type*,%m972$.Node.type*) @m2379$stack_push.m2379$.SYStack.typep.m2379$.SYStack.typep.m972$.Node.typep(%m2379$.SYStack.type* %.tmp2460, %m972$.Node.type* %.tmp2463)
store %m2379$.SYStack.type* %.tmp2464, %m2379$.SYStack.type** %out_stack.2390
%.tmp2465 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %top.2456
%.tmp2466 = bitcast %m2379$.SYStack.type* %.tmp2465 to i8*
call void(i8*) @free(i8* %.tmp2466)
br label %.if.end.2454
.if.false.2454:
store i1 1, i1* %quit.2438
br label %.if.end.2454
.if.end.2454:
br label %.if.end.2446
.if.end.2446:
br label %.for.start.2439
.for.end.2439:
%.tmp2467 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %op_stack.2392
%.tmp2468 = load %m972$.Node.type*, %m972$.Node.type** %ptr.2395
%.tmp2469 = call %m2379$.SYStack.type*(%m2379$.SYStack.type*,%m972$.Node.type*) @m2379$stack_push.m2379$.SYStack.typep.m2379$.SYStack.typep.m972$.Node.typep(%m2379$.SYStack.type* %.tmp2467, %m972$.Node.type* %.tmp2468)
store %m2379$.SYStack.type* %.tmp2469, %m2379$.SYStack.type** %op_stack.2392
br label %.if.end.2437
.if.false.2437:
%.tmp2471 = getelementptr [68 x i8], [68 x i8]*@.str2470, i32 0, i32 0
%.tmp2472 = load %m972$.Node.type*, %m972$.Node.type** %ptr.2395
%.tmp2473 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2472, i32 0, i32 0
%.tmp2474 = load i8*, i8** %.tmp2473
%.tmp2475 = call i32(i8*,...) @printf(i8* %.tmp2471, i8* %.tmp2474)
br label %.if.end.2437
.if.end.2437:
br label %.if.end.2426
.if.end.2426:
%.tmp2476 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %token_stack.2394
%.tmp2477 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2476, i32 0, i32 0
%.tmp2478 = load %m972$.Node.type*, %m972$.Node.type** %.tmp2477
store %m972$.Node.type* %.tmp2478, %m972$.Node.type** %ptr.2395
br label %.for.start.2406
.for.end.2406:
br label %.for.start.2479
.for.start.2479:
%.tmp2480 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %op_stack.2392
%.tmp2481 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2480, i32 0, i32 0
%.tmp2482 = load %m972$.Node.type*, %m972$.Node.type** %.tmp2481
%.tmp2483 = icmp ne %m972$.Node.type* %.tmp2482, null
br i1 %.tmp2483, label %.for.continue.2479, label %.for.end.2479
.for.continue.2479:
%.tmp2484 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %op_stack.2392
%.tmp2485 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2484, i32 0, i32 0
%.tmp2486 = load %m972$.Node.type*, %m972$.Node.type** %.tmp2485
%node.2487 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp2486, %m972$.Node.type** %node.2487
%.tmp2488 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %op_stack.2392
%s.2489 = alloca %m2379$.SYStack.type*
store %m2379$.SYStack.type* %.tmp2488, %m2379$.SYStack.type** %s.2489
%.tmp2490 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %op_stack.2392
%.tmp2491 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2490, i32 0, i32 1
%.tmp2492 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %.tmp2491
store %m2379$.SYStack.type* %.tmp2492, %m2379$.SYStack.type** %op_stack.2392
%.tmp2493 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %s.2489
%.tmp2494 = bitcast %m2379$.SYStack.type* %.tmp2493 to i8*
call void(i8*) @free(i8* %.tmp2494)
%.tmp2495 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %out_stack.2390
%.tmp2496 = load %m972$.Node.type*, %m972$.Node.type** %node.2487
%.tmp2497 = call %m2379$.SYStack.type*(%m2379$.SYStack.type*,%m972$.Node.type*) @m2379$stack_push.m2379$.SYStack.typep.m2379$.SYStack.typep.m972$.Node.typep(%m2379$.SYStack.type* %.tmp2495, %m972$.Node.type* %.tmp2496)
store %m2379$.SYStack.type* %.tmp2497, %m2379$.SYStack.type** %out_stack.2390
br label %.for.start.2479
.for.end.2479:
%.tmp2498 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %out_stack.2390
ret %m2379$.SYStack.type* %.tmp2498
}
define %m2379$.SYStack.type* @m2379$stack_push.m2379$.SYStack.typep.m2379$.SYStack.typep.m972$.Node.typep(%m2379$.SYStack.type* %.curr_stack.arg, %m972$.Node.type* %.node.arg) {
%curr_stack = alloca %m2379$.SYStack.type*
store %m2379$.SYStack.type* %.curr_stack.arg, %m2379$.SYStack.type** %curr_stack
%node = alloca %m972$.Node.type*
store %m972$.Node.type* %.node.arg, %m972$.Node.type** %node
%.tmp2499 = load i32, i32* @SYStack_size
%.tmp2500 = call i8*(i32) @malloc(i32 %.tmp2499)
%.tmp2501 = bitcast i8* %.tmp2500 to %m2379$.SYStack.type*
%s.2502 = alloca %m2379$.SYStack.type*
store %m2379$.SYStack.type* %.tmp2501, %m2379$.SYStack.type** %s.2502
%.tmp2503 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %s.2502
%.tmp2504 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2503, i32 0, i32 0
%.tmp2505 = load %m972$.Node.type*, %m972$.Node.type** %node
store %m972$.Node.type* %.tmp2505, %m972$.Node.type** %.tmp2504
%.tmp2506 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %s.2502
%.tmp2507 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp2506, i32 0, i32 1
%.tmp2508 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %curr_stack
store %m2379$.SYStack.type* %.tmp2508, %m2379$.SYStack.type** %.tmp2507
%.tmp2509 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %s.2502
ret %m2379$.SYStack.type* %.tmp2509
}
define i32 @m2379$op_precedence.i.m972$.Node.typep(%m972$.Node.type* %.n.arg) {
%n = alloca %m972$.Node.type*
store %m972$.Node.type* %.n.arg, %m972$.Node.type** %n
%.tmp2510 = load %m972$.Node.type*, %m972$.Node.type** %n
%.tmp2511 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2510, i32 0, i32 6
%.tmp2512 = load %m972$.Node.type*, %m972$.Node.type** %.tmp2511
%op.2513 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp2512, %m972$.Node.type** %op.2513
%.tmp2514 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2515 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2514, i32 0, i32 1
%.tmp2516 = load i8*, i8** %.tmp2515
%.tmp2518 = getelementptr [2 x i8], [2 x i8]*@.str2517, i32 0, i32 0
%.tmp2519 = call i32(i8*,i8*) @strcmp(i8* %.tmp2516, i8* %.tmp2518)
%.tmp2520 = icmp eq i32 %.tmp2519, 0
%.tmp2521 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2522 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2521, i32 0, i32 1
%.tmp2523 = load i8*, i8** %.tmp2522
%.tmp2525 = getelementptr [2 x i8], [2 x i8]*@.str2524, i32 0, i32 0
%.tmp2526 = call i32(i8*,i8*) @strcmp(i8* %.tmp2523, i8* %.tmp2525)
%.tmp2527 = icmp eq i32 %.tmp2526, 0
%.tmp2528 = or i1 %.tmp2520, %.tmp2527
br i1 %.tmp2528, label %.if.true.2529, label %.if.false.2529
.if.true.2529:
ret i32 4
br label %.if.end.2529
.if.false.2529:
%.tmp2530 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2531 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2530, i32 0, i32 1
%.tmp2532 = load i8*, i8** %.tmp2531
%.tmp2534 = getelementptr [2 x i8], [2 x i8]*@.str2533, i32 0, i32 0
%.tmp2535 = call i32(i8*,i8*) @strcmp(i8* %.tmp2532, i8* %.tmp2534)
%.tmp2536 = icmp eq i32 %.tmp2535, 0
%.tmp2537 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2538 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2537, i32 0, i32 1
%.tmp2539 = load i8*, i8** %.tmp2538
%.tmp2541 = getelementptr [2 x i8], [2 x i8]*@.str2540, i32 0, i32 0
%.tmp2542 = call i32(i8*,i8*) @strcmp(i8* %.tmp2539, i8* %.tmp2541)
%.tmp2543 = icmp eq i32 %.tmp2542, 0
%.tmp2544 = or i1 %.tmp2536, %.tmp2543
%.tmp2545 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2546 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2545, i32 0, i32 1
%.tmp2547 = load i8*, i8** %.tmp2546
%.tmp2549 = getelementptr [2 x i8], [2 x i8]*@.str2548, i32 0, i32 0
%.tmp2550 = call i32(i8*,i8*) @strcmp(i8* %.tmp2547, i8* %.tmp2549)
%.tmp2551 = icmp eq i32 %.tmp2550, 0
%.tmp2552 = or i1 %.tmp2544, %.tmp2551
br i1 %.tmp2552, label %.if.true.2553, label %.if.false.2553
.if.true.2553:
ret i32 3
br label %.if.end.2553
.if.false.2553:
%.tmp2554 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2555 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2554, i32 0, i32 1
%.tmp2556 = load i8*, i8** %.tmp2555
%.tmp2558 = getelementptr [3 x i8], [3 x i8]*@.str2557, i32 0, i32 0
%.tmp2559 = call i32(i8*,i8*) @strcmp(i8* %.tmp2556, i8* %.tmp2558)
%.tmp2560 = icmp eq i32 %.tmp2559, 0
%.tmp2561 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2562 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2561, i32 0, i32 1
%.tmp2563 = load i8*, i8** %.tmp2562
%.tmp2565 = getelementptr [3 x i8], [3 x i8]*@.str2564, i32 0, i32 0
%.tmp2566 = call i32(i8*,i8*) @strcmp(i8* %.tmp2563, i8* %.tmp2565)
%.tmp2567 = icmp eq i32 %.tmp2566, 0
%.tmp2568 = or i1 %.tmp2560, %.tmp2567
br i1 %.tmp2568, label %.if.true.2569, label %.if.false.2569
.if.true.2569:
ret i32 7
br label %.if.end.2569
.if.false.2569:
%.tmp2570 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2571 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2570, i32 0, i32 1
%.tmp2572 = load i8*, i8** %.tmp2571
%.tmp2574 = getelementptr [3 x i8], [3 x i8]*@.str2573, i32 0, i32 0
%.tmp2575 = call i32(i8*,i8*) @strcmp(i8* %.tmp2572, i8* %.tmp2574)
%.tmp2576 = icmp eq i32 %.tmp2575, 0
%.tmp2577 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2578 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2577, i32 0, i32 1
%.tmp2579 = load i8*, i8** %.tmp2578
%.tmp2581 = getelementptr [3 x i8], [3 x i8]*@.str2580, i32 0, i32 0
%.tmp2582 = call i32(i8*,i8*) @strcmp(i8* %.tmp2579, i8* %.tmp2581)
%.tmp2583 = icmp eq i32 %.tmp2582, 0
%.tmp2584 = or i1 %.tmp2576, %.tmp2583
br i1 %.tmp2584, label %.if.true.2585, label %.if.false.2585
.if.true.2585:
ret i32 6
br label %.if.end.2585
.if.false.2585:
%.tmp2586 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2587 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2586, i32 0, i32 1
%.tmp2588 = load i8*, i8** %.tmp2587
%.tmp2590 = getelementptr [2 x i8], [2 x i8]*@.str2589, i32 0, i32 0
%.tmp2591 = call i32(i8*,i8*) @strcmp(i8* %.tmp2588, i8* %.tmp2590)
%.tmp2592 = icmp eq i32 %.tmp2591, 0
%.tmp2593 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2594 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2593, i32 0, i32 1
%.tmp2595 = load i8*, i8** %.tmp2594
%.tmp2597 = getelementptr [2 x i8], [2 x i8]*@.str2596, i32 0, i32 0
%.tmp2598 = call i32(i8*,i8*) @strcmp(i8* %.tmp2595, i8* %.tmp2597)
%.tmp2599 = icmp eq i32 %.tmp2598, 0
%.tmp2600 = or i1 %.tmp2592, %.tmp2599
br i1 %.tmp2600, label %.if.true.2601, label %.if.false.2601
.if.true.2601:
ret i32 6
br label %.if.end.2601
.if.false.2601:
%.tmp2602 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2603 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2602, i32 0, i32 1
%.tmp2604 = load i8*, i8** %.tmp2603
%.tmp2606 = getelementptr [2 x i8], [2 x i8]*@.str2605, i32 0, i32 0
%.tmp2607 = call i32(i8*,i8*) @strcmp(i8* %.tmp2604, i8* %.tmp2606)
%.tmp2608 = icmp eq i32 %.tmp2607, 0
br i1 %.tmp2608, label %.if.true.2609, label %.if.false.2609
.if.true.2609:
ret i32 11
br label %.if.end.2609
.if.false.2609:
%.tmp2610 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2611 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2610, i32 0, i32 1
%.tmp2612 = load i8*, i8** %.tmp2611
%.tmp2614 = getelementptr [2 x i8], [2 x i8]*@.str2613, i32 0, i32 0
%.tmp2615 = call i32(i8*,i8*) @strcmp(i8* %.tmp2612, i8* %.tmp2614)
%.tmp2616 = icmp eq i32 %.tmp2615, 0
br i1 %.tmp2616, label %.if.true.2617, label %.if.false.2617
.if.true.2617:
ret i32 12
br label %.if.end.2617
.if.false.2617:
br label %.if.end.2617
.if.end.2617:
br label %.if.end.2609
.if.end.2609:
br label %.if.end.2601
.if.end.2601:
br label %.if.end.2585
.if.end.2585:
br label %.if.end.2569
.if.end.2569:
br label %.if.end.2553
.if.end.2553:
br label %.if.end.2529
.if.end.2529:
%.tmp2619 = getelementptr [65 x i8], [65 x i8]*@.str2618, i32 0, i32 0
%.tmp2620 = load %m972$.Node.type*, %m972$.Node.type** %op.2513
%.tmp2621 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2620, i32 0, i32 1
%.tmp2622 = load i8*, i8** %.tmp2621
%.tmp2623 = call i32(i8*,...) @printf(i8* %.tmp2619, i8* %.tmp2622)
ret i32 4
}
%m2624$.Type.type = type {i8*,i8*,i8*,%m2624$.Type.type*,%m2624$.Type.type*}
%m2624$.ErrorList.type = type {%m296$.Error.type*,%m2624$.ErrorList.type*,i1}
%m2624$.AssignableInfo.type = type {i8*,i8,i8*,i8*,%m2624$.Type.type*,i32,i32,i8*}
%m2624$.ScopeItem.type = type {i8*,%m2624$.AssignableInfo.type*,%m2624$.ScopeItem.type*}
%m2624$.Scope.type = type {i8*,%m2624$.ScopeItem.type*,i8*,i8*,i8*,%m2624$.Scope.type*}
%m2624$.GlobalName.type = type {i8*,i8*,i1,i1,%m2624$.AssignableInfo.type*,%m2624$.GlobalName.type*}
%m2624$.ModuleLookup.type = type {i8*,i8*,%m2624$.ModuleLookup.type*,%m2624$.Scope.type*}
%m2624$.AnonFn.type = type {i8*,%m2624$.AnonFn.type*}
%m2624$.CompilerCtx.type = type {%m972$.Node.type*,%m0$.File.type*,%m2624$.ErrorList.type*,%m2624$.GlobalName.type*,%m972$.Rule.type**,i32,%m2624$.ModuleLookup.type*,i8*,%m2624$.AnonFn.type*}
@DEBUG_INTERNALS = constant i1 0
define %m2624$.Type.type* @m295$type_clone.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.t.arg) {
%t = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.t.arg, %m2624$.Type.type** %t
%.tmp2625 = load %m2624$.Type.type*, %m2624$.Type.type** %t
%.tmp2626 = icmp eq %m2624$.Type.type* %.tmp2625, null
br i1 %.tmp2626, label %.if.true.2627, label %.if.false.2627
.if.true.2627:
%.tmp2628 = bitcast ptr null to %m2624$.Type.type*
ret %m2624$.Type.type* %.tmp2628
br label %.if.end.2627
.if.false.2627:
br label %.if.end.2627
.if.end.2627:
%.tmp2629 = getelementptr %m2624$.Type.type, %m2624$.Type.type* null, i32 1
%.tmp2630 = ptrtoint %m2624$.Type.type* %.tmp2629 to i32
%.tmp2631 = call i8*(i32) @malloc(i32 %.tmp2630)
%.tmp2632 = bitcast i8* %.tmp2631 to %m2624$.Type.type*
%clone.2633 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp2632, %m2624$.Type.type** %clone.2633
%.tmp2634 = load %m2624$.Type.type*, %m2624$.Type.type** %clone.2633
%.tmp2635 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2634, i32 0, i32 3
%.tmp2636 = load %m2624$.Type.type*, %m2624$.Type.type** %t
%.tmp2637 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2636, i32 0, i32 3
%.tmp2638 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp2637
store %m2624$.Type.type* %.tmp2638, %m2624$.Type.type** %.tmp2635
%.tmp2639 = load %m2624$.Type.type*, %m2624$.Type.type** %clone.2633
%.tmp2640 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2639, i32 0, i32 4
%.tmp2641 = load %m2624$.Type.type*, %m2624$.Type.type** %t
%.tmp2642 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2641, i32 0, i32 4
%.tmp2643 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp2642
%.tmp2644 = call %m2624$.Type.type*(%m2624$.Type.type*) @m295$type_clone.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.tmp2643)
store %m2624$.Type.type* %.tmp2644, %m2624$.Type.type** %.tmp2640
%.tmp2645 = load %m2624$.Type.type*, %m2624$.Type.type** %clone.2633
%.tmp2646 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2645, i32 0, i32 2
%.tmp2647 = load %m2624$.Type.type*, %m2624$.Type.type** %t
%.tmp2648 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2647, i32 0, i32 2
%.tmp2649 = load i8*, i8** %.tmp2648
store i8* %.tmp2649, i8** %.tmp2646
%.tmp2650 = load %m2624$.Type.type*, %m2624$.Type.type** %clone.2633
%.tmp2651 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2650, i32 0, i32 0
%.tmp2652 = load %m2624$.Type.type*, %m2624$.Type.type** %t
%.tmp2653 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2652, i32 0, i32 0
%.tmp2654 = load i8*, i8** %.tmp2653
store i8* %.tmp2654, i8** %.tmp2651
%.tmp2655 = load %m2624$.Type.type*, %m2624$.Type.type** %clone.2633
%.tmp2656 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2655, i32 0, i32 1
%.tmp2657 = load %m2624$.Type.type*, %m2624$.Type.type** %t
%.tmp2658 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2657, i32 0, i32 1
%.tmp2659 = load i8*, i8** %.tmp2658
store i8* %.tmp2659, i8** %.tmp2656
%.tmp2660 = load %m2624$.Type.type*, %m2624$.Type.type** %clone.2633
ret %m2624$.Type.type* %.tmp2660
}
define i8* @m295$get_root.cp() {
%.tmp2662 = getelementptr [12 x i8], [12 x i8]*@.str2661, i32 0, i32 0
%.tmp2663 = call i8*(i8*) @getenv(i8* %.tmp2662)
%project_root.2664 = alloca i8*
store i8* %.tmp2663, i8** %project_root.2664
%.tmp2665 = load i8*, i8** %project_root.2664
%.tmp2666 = icmp eq i8* %.tmp2665, null
br i1 %.tmp2666, label %.if.true.2667, label %.if.false.2667
.if.true.2667:
%.tmp2669 = getelementptr [5 x i8], [5 x i8]*@.str2668, i32 0, i32 0
%.tmp2670 = call i8*(i8*) @getenv(i8* %.tmp2669)
%home.2671 = alloca i8*
store i8* %.tmp2670, i8** %home.2671
%.tmp2672 = getelementptr i8*, i8** %project_root.2664, i32 0
%.tmp2674 = getelementptr [11 x i8], [11 x i8]*@.str2673, i32 0, i32 0
%.tmp2675 = load i8*, i8** %home.2671
%.tmp2676 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2672, i8* %.tmp2674, i8* %.tmp2675)
br label %.if.end.2667
.if.false.2667:
br label %.if.end.2667
.if.end.2667:
%.tmp2677 = load i8*, i8** %project_root.2664
ret i8* %.tmp2677
}
define %m2624$.Type.type* @m295$new_type.m2624$.Type.typep() {
%.tmp2678 = getelementptr %m2624$.Type.type, %m2624$.Type.type* null, i32 1
%.tmp2679 = ptrtoint %m2624$.Type.type* %.tmp2678 to i32
%.tmp2680 = call i8*(i32) @malloc(i32 %.tmp2679)
%.tmp2681 = bitcast i8* %.tmp2680 to %m2624$.Type.type*
%type.2682 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp2681, %m2624$.Type.type** %type.2682
%.tmp2683 = load %m2624$.Type.type*, %m2624$.Type.type** %type.2682
%.tmp2684 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2683, i32 0, i32 1
store i8* null, i8** %.tmp2684
%.tmp2685 = load %m2624$.Type.type*, %m2624$.Type.type** %type.2682
%.tmp2686 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2685, i32 0, i32 2
store i8* null, i8** %.tmp2686
%.tmp2687 = load %m2624$.Type.type*, %m2624$.Type.type** %type.2682
%.tmp2688 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2687, i32 0, i32 0
store i8* null, i8** %.tmp2688
%.tmp2689 = load %m2624$.Type.type*, %m2624$.Type.type** %type.2682
%.tmp2690 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2689, i32 0, i32 3
store %m2624$.Type.type* null, %m2624$.Type.type** %.tmp2690
%.tmp2691 = load %m2624$.Type.type*, %m2624$.Type.type** %type.2682
%.tmp2692 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2691, i32 0, i32 4
store %m2624$.Type.type* null, %m2624$.Type.type** %.tmp2692
%.tmp2693 = load %m2624$.Type.type*, %m2624$.Type.type** %type.2682
ret %m2624$.Type.type* %.tmp2693
}
define void @m295$copy_type.v.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.dest.arg, %m2624$.Type.type* %.src.arg) {
%dest = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.dest.arg, %m2624$.Type.type** %dest
%src = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.src.arg, %m2624$.Type.type** %src
%.tmp2694 = load %m2624$.Type.type*, %m2624$.Type.type** %dest
%.tmp2695 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2694, i32 0, i32 0
%.tmp2696 = load %m2624$.Type.type*, %m2624$.Type.type** %src
%.tmp2697 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2696, i32 0, i32 0
%.tmp2698 = load i8*, i8** %.tmp2697
store i8* %.tmp2698, i8** %.tmp2695
%.tmp2699 = load %m2624$.Type.type*, %m2624$.Type.type** %dest
%.tmp2700 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2699, i32 0, i32 1
%.tmp2701 = load %m2624$.Type.type*, %m2624$.Type.type** %src
%.tmp2702 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2701, i32 0, i32 1
%.tmp2703 = load i8*, i8** %.tmp2702
store i8* %.tmp2703, i8** %.tmp2700
%.tmp2704 = load %m2624$.Type.type*, %m2624$.Type.type** %dest
%.tmp2705 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2704, i32 0, i32 2
%.tmp2706 = load %m2624$.Type.type*, %m2624$.Type.type** %src
%.tmp2707 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2706, i32 0, i32 2
%.tmp2708 = load i8*, i8** %.tmp2707
store i8* %.tmp2708, i8** %.tmp2705
%.tmp2709 = load %m2624$.Type.type*, %m2624$.Type.type** %dest
%.tmp2710 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2709, i32 0, i32 3
%.tmp2711 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp2710
%.tmp2712 = load %m2624$.Type.type*, %m2624$.Type.type** %src
%.tmp2713 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2712, i32 0, i32 3
%.tmp2714 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp2713
%.tmp2715 = icmp ne %m2624$.Type.type* %.tmp2711, %.tmp2714
br i1 %.tmp2715, label %.if.true.2716, label %.if.false.2716
.if.true.2716:
%.tmp2717 = load %m2624$.Type.type*, %m2624$.Type.type** %dest
%.tmp2718 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2717, i32 0, i32 3
%.tmp2719 = load %m2624$.Type.type*, %m2624$.Type.type** %src
%.tmp2720 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2719, i32 0, i32 3
%.tmp2721 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp2720
store %m2624$.Type.type* %.tmp2721, %m2624$.Type.type** %.tmp2718
%.tmp2722 = load %m2624$.Type.type*, %m2624$.Type.type** %dest
%.tmp2723 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2722, i32 0, i32 3
%.tmp2724 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp2723
%.tmp2725 = load %m2624$.Type.type*, %m2624$.Type.type** %src
%.tmp2726 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2725, i32 0, i32 3
%.tmp2727 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp2726
call void(%m2624$.Type.type*,%m2624$.Type.type*) @m295$copy_type.v.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.tmp2724, %m2624$.Type.type* %.tmp2727)
br label %.if.end.2716
.if.false.2716:
br label %.if.end.2716
.if.end.2716:
%.tmp2728 = load %m2624$.Type.type*, %m2624$.Type.type** %dest
%.tmp2729 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2728, i32 0, i32 4
%.tmp2730 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp2729
%.tmp2731 = load %m2624$.Type.type*, %m2624$.Type.type** %src
%.tmp2732 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2731, i32 0, i32 4
%.tmp2733 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp2732
%.tmp2734 = icmp ne %m2624$.Type.type* %.tmp2730, %.tmp2733
br i1 %.tmp2734, label %.if.true.2735, label %.if.false.2735
.if.true.2735:
%.tmp2736 = load %m2624$.Type.type*, %m2624$.Type.type** %dest
%.tmp2737 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2736, i32 0, i32 4
%.tmp2738 = load %m2624$.Type.type*, %m2624$.Type.type** %src
%.tmp2739 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2738, i32 0, i32 4
%.tmp2740 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp2739
store %m2624$.Type.type* %.tmp2740, %m2624$.Type.type** %.tmp2737
%.tmp2741 = load %m2624$.Type.type*, %m2624$.Type.type** %dest
%.tmp2742 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2741, i32 0, i32 4
%.tmp2743 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp2742
%.tmp2744 = load %m2624$.Type.type*, %m2624$.Type.type** %src
%.tmp2745 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2744, i32 0, i32 4
%.tmp2746 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp2745
call void(%m2624$.Type.type*,%m2624$.Type.type*) @m295$copy_type.v.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.tmp2743, %m2624$.Type.type* %.tmp2746)
br label %.if.end.2735
.if.false.2735:
br label %.if.end.2735
.if.end.2735:
ret void
}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m2624$.AssignableInfo.type* @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.node.arg) {
%node = alloca %m972$.Node.type*
store %m972$.Node.type* %.node.arg, %m972$.Node.type** %node
%.tmp2747 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* null, i32 1
%.tmp2748 = ptrtoint %m2624$.AssignableInfo.type* %.tmp2747 to i32
%.tmp2749 = call i8*(i32) @malloc(i32 %.tmp2748)
%.tmp2750 = bitcast i8* %.tmp2749 to %m2624$.AssignableInfo.type*
%ptr.2751 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp2750, %m2624$.AssignableInfo.type** %ptr.2751
%.tmp2752 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %ptr.2751
%.tmp2753 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2752, i32 0, i32 1
%.tmp2754 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2754, i8* %.tmp2753
%.tmp2755 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %ptr.2751
%.tmp2756 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2755, i32 0, i32 0
store i8* null, i8** %.tmp2756
%.tmp2757 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %ptr.2751
%.tmp2758 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2757, i32 0, i32 3
store i8* null, i8** %.tmp2758
%.tmp2759 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %ptr.2751
%.tmp2760 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2759, i32 0, i32 2
%.tmp2762 = getelementptr [1 x i8], [1 x i8]*@.str2761, i32 0, i32 0
store i8* %.tmp2762, i8** %.tmp2760
%.tmp2763 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %ptr.2751
%.tmp2764 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2763, i32 0, i32 4
store %m2624$.Type.type* null, %m2624$.Type.type** %.tmp2764
%.tmp2765 = load %m972$.Node.type*, %m972$.Node.type** %node
%.tmp2766 = icmp ne %m972$.Node.type* %.tmp2765, null
br i1 %.tmp2766, label %.if.true.2767, label %.if.false.2767
.if.true.2767:
%.tmp2768 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %ptr.2751
%.tmp2769 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2768, i32 0, i32 5
%.tmp2770 = load %m972$.Node.type*, %m972$.Node.type** %node
%.tmp2771 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2770, i32 0, i32 3
%.tmp2772 = load i32, i32* %.tmp2771
store i32 %.tmp2772, i32* %.tmp2769
%.tmp2773 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %ptr.2751
%.tmp2774 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2773, i32 0, i32 6
%.tmp2775 = load %m972$.Node.type*, %m972$.Node.type** %node
%.tmp2776 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2775, i32 0, i32 4
%.tmp2777 = load i32, i32* %.tmp2776
store i32 %.tmp2777, i32* %.tmp2774
%.tmp2778 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %ptr.2751
%.tmp2779 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2778, i32 0, i32 7
%.tmp2780 = load %m972$.Node.type*, %m972$.Node.type** %node
%.tmp2781 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp2780, i32 0, i32 2
%.tmp2782 = load i8*, i8** %.tmp2781
store i8* %.tmp2782, i8** %.tmp2779
br label %.if.end.2767
.if.false.2767:
%.tmp2783 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %ptr.2751
%.tmp2784 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2783, i32 0, i32 5
store i32 0, i32* %.tmp2784
%.tmp2785 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %ptr.2751
%.tmp2786 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2785, i32 0, i32 6
store i32 0, i32* %.tmp2786
%.tmp2787 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %ptr.2751
%.tmp2788 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2787, i32 0, i32 7
store i8* null, i8** %.tmp2788
br label %.if.end.2767
.if.end.2767:
%.tmp2789 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %ptr.2751
ret %m2624$.AssignableInfo.type* %.tmp2789
}
define void @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.info.arg, %m2624$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2790 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp2791 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2790, i32 0, i32 0
%.tmp2792 = load i8*, i8** %id
store i8* %.tmp2792, i8** %.tmp2791
%.tmp2793 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp2794 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2793, i32 0, i32 1
%.tmp2795 = load i8, i8* %scope
store i8 %.tmp2795, i8* %.tmp2794
ret void
}
define i8* @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.info.arg) {
%info = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.info.arg, %m2624$.AssignableInfo.type** %info
%.tmp2796 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp2797 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2796, i32 0, i32 1
%.tmp2798 = load i8, i8* %.tmp2797
%.tmp2799 = load i8, i8* @SCOPE_CONST
%.tmp2800 = icmp eq i8 %.tmp2798, %.tmp2799
br i1 %.tmp2800, label %.if.true.2801, label %.if.false.2801
.if.true.2801:
%.tmp2802 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp2803 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2802, i32 0, i32 0
%.tmp2804 = load i8*, i8** %.tmp2803
ret i8* %.tmp2804
br label %.if.end.2801
.if.false.2801:
br label %.if.end.2801
.if.end.2801:
%buf.2805 = alloca i8*
store i8* null, i8** %buf.2805
%.tmp2806 = getelementptr i8*, i8** %buf.2805, i32 0
%.tmp2808 = getelementptr [5 x i8], [5 x i8]*@.str2807, i32 0, i32 0
%.tmp2809 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp2810 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2809, i32 0, i32 1
%.tmp2811 = load i8, i8* %.tmp2810
%.tmp2812 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp2813 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp2812, i32 0, i32 0
%.tmp2814 = load i8*, i8** %.tmp2813
%.tmp2815 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2806, i8* %.tmp2808, i8 %.tmp2811, i8* %.tmp2814)
%.tmp2816 = load i8*, i8** %buf.2805
ret i8* %.tmp2816
}
define i1 @m295$is_same_type.b.m2624$.CompilerCtx.typep.m2624$.Type.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.Type.type* %.a.arg, %m2624$.Type.type* %.b.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%a = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.a.arg, %m2624$.Type.type** %a
%b = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.b.arg, %m2624$.Type.type** %b
%.tmp2817 = load %m2624$.Type.type*, %m2624$.Type.type** %a
%.tmp2818 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2817, i32 0, i32 0
%.tmp2819 = load i8*, i8** %.tmp2818
%.tmp2821 = getelementptr [8 x i8], [8 x i8]*@.str2820, i32 0, i32 0
%.tmp2822 = call i32(i8*,i8*) @strcmp(i8* %.tmp2819, i8* %.tmp2821)
%.tmp2823 = icmp eq i32 %.tmp2822, 0
%.tmp2824 = load %m2624$.Type.type*, %m2624$.Type.type** %b
%.tmp2825 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2824, i32 0, i32 0
%.tmp2826 = load i8*, i8** %.tmp2825
%.tmp2828 = getelementptr [8 x i8], [8 x i8]*@.str2827, i32 0, i32 0
%.tmp2829 = call i32(i8*,i8*) @strcmp(i8* %.tmp2826, i8* %.tmp2828)
%.tmp2830 = icmp eq i32 %.tmp2829, 0
%.tmp2831 = or i1 %.tmp2823, %.tmp2830
br i1 %.tmp2831, label %.if.true.2832, label %.if.false.2832
.if.true.2832:
%.tmp2833 = load %m2624$.Type.type*, %m2624$.Type.type** %a
%.tmp2834 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2833, i32 0, i32 0
%.tmp2835 = load i8*, i8** %.tmp2834
%.tmp2837 = getelementptr [4 x i8], [4 x i8]*@.str2836, i32 0, i32 0
%.tmp2838 = call i32(i8*,i8*) @strcmp(i8* %.tmp2835, i8* %.tmp2837)
%.tmp2839 = icmp eq i32 %.tmp2838, 0
%.tmp2840 = load %m2624$.Type.type*, %m2624$.Type.type** %b
%.tmp2841 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp2840, i32 0, i32 0
%.tmp2842 = load i8*, i8** %.tmp2841
%.tmp2844 = getelementptr [4 x i8], [4 x i8]*@.str2843, i32 0, i32 0
%.tmp2845 = call i32(i8*,i8*) @strcmp(i8* %.tmp2842, i8* %.tmp2844)
%.tmp2846 = icmp eq i32 %.tmp2845, 0
%.tmp2847 = or i1 %.tmp2839, %.tmp2846
ret i1 %.tmp2847
br label %.if.end.2832
.if.false.2832:
br label %.if.end.2832
.if.end.2832:
%.tmp2848 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp2849 = load %m2624$.Type.type*, %m2624$.Type.type** %a
%.tmp2850 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp2848, %m2624$.Type.type* %.tmp2849)
%a_repr.2851 = alloca i8*
store i8* %.tmp2850, i8** %a_repr.2851
%.tmp2852 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp2853 = load %m2624$.Type.type*, %m2624$.Type.type** %b
%.tmp2854 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp2852, %m2624$.Type.type* %.tmp2853)
%b_repr.2855 = alloca i8*
store i8* %.tmp2854, i8** %b_repr.2855
%.tmp2856 = load i8*, i8** %a_repr.2851
%.tmp2857 = load i8*, i8** %b_repr.2855
%.tmp2858 = call i32(i8*,i8*) @strcmp(i8* %.tmp2856, i8* %.tmp2857)
%.tmp2859 = icmp eq i32 %.tmp2858, 0
ret i1 %.tmp2859
}
define void @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%info = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.info.arg, %m2624$.AssignableInfo.type** %info
%tmp_buff.2860 = alloca i8*
store i8* null, i8** %tmp_buff.2860
%.tmp2861 = getelementptr i8*, i8** %tmp_buff.2860, i32 0
%.tmp2863 = getelementptr [7 x i8], [7 x i8]*@.str2862, i32 0, i32 0
%.tmp2864 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp2865 = call i32(%m2624$.CompilerCtx.type*) @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp2864)
%.tmp2866 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2861, i8* %.tmp2863, i32 %.tmp2865)
%.tmp2867 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp2868 = load i8, i8* @SCOPE_LOCAL
%.tmp2869 = load i8*, i8** %tmp_buff.2860
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp2867, i8 %.tmp2868, i8* %.tmp2869)
ret void
}
define %m2624$.ModuleLookup.type* @m295$get_module.m2624$.ModuleLookup.typep.m2624$.CompilerCtx.typep.cp(%m2624$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2871 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp2872 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2871, i32 0, i32 6
%.tmp2873 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %.tmp2872
%m.2874 = alloca %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* %.tmp2873, %m2624$.ModuleLookup.type** %m.2874
br label %.for.start.2870
.for.start.2870:
%.tmp2875 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.2874
%.tmp2876 = icmp ne %m2624$.ModuleLookup.type* %.tmp2875, null
br i1 %.tmp2876, label %.for.continue.2870, label %.for.end.2870
.for.continue.2870:
%.tmp2877 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.2874
%.tmp2878 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp2877, i32 0, i32 0
%.tmp2879 = load i8*, i8** %.tmp2878
%.tmp2880 = load i8*, i8** %filename
%.tmp2881 = call i32(i8*,i8*) @strcmp(i8* %.tmp2879, i8* %.tmp2880)
%.tmp2882 = icmp eq i32 %.tmp2881, 0
br i1 %.tmp2882, label %.if.true.2883, label %.if.false.2883
.if.true.2883:
%.tmp2884 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.2874
ret %m2624$.ModuleLookup.type* %.tmp2884
br label %.if.end.2883
.if.false.2883:
br label %.if.end.2883
.if.end.2883:
%.tmp2885 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.2874
%.tmp2886 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp2885, i32 0, i32 2
%.tmp2887 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %.tmp2886
store %m2624$.ModuleLookup.type* %.tmp2887, %m2624$.ModuleLookup.type** %m.2874
br label %.for.start.2870
.for.end.2870:
%.tmp2888 = bitcast ptr null to %m2624$.ModuleLookup.type*
ret %m2624$.ModuleLookup.type* %.tmp2888
}
define %m2624$.ModuleLookup.type* @m295$get_current_module.m2624$.ModuleLookup.typep.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%.tmp2889 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp2890 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp2891 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2890, i32 0, i32 7
%.tmp2892 = load i8*, i8** %.tmp2891
%.tmp2893 = call %m2624$.ModuleLookup.type*(%m2624$.CompilerCtx.type*,i8*) @m295$get_module.m2624$.ModuleLookup.typep.m2624$.CompilerCtx.typep.cp(%m2624$.CompilerCtx.type* %.tmp2889, i8* %.tmp2892)
ret %m2624$.ModuleLookup.type* %.tmp2893
}
define i32 @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%.tmp2894 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp2895 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2894, i32 0, i32 5
%.tmp2896 = load i32, i32* %.tmp2895
%uid.2897 = alloca i32
store i32 %.tmp2896, i32* %uid.2897
%.tmp2898 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp2899 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2898, i32 0, i32 5
%.tmp2900 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp2901 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2900, i32 0, i32 5
%.tmp2902 = load i32, i32* %.tmp2901
%.tmp2903 = add i32 %.tmp2902, 1
store i32 %.tmp2903, i32* %.tmp2899
%.tmp2904 = load i32, i32* %uid.2897
ret i32 %.tmp2904
}
define %m2624$.CompilerCtx.type* @m295$new_context.m2624$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2905 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* null, i32 1
%.tmp2906 = ptrtoint %m2624$.CompilerCtx.type* %.tmp2905 to i32
%.tmp2907 = call i8*(i32) @malloc(i32 %.tmp2906)
%.tmp2908 = bitcast i8* %.tmp2907 to %m2624$.CompilerCtx.type*
%ctx.2909 = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.tmp2908, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2910 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2911 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2910, i32 0, i32 1
%.tmp2912 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2912, %m0$.File.type** %.tmp2911
%.tmp2913 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2914 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2913, i32 0, i32 0
%.tmp2915 = bitcast ptr null to %m972$.Node.type*
store %m972$.Node.type* %.tmp2915, %m972$.Node.type** %.tmp2914
%.tmp2916 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2917 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2916, i32 0, i32 2
store %m2624$.ErrorList.type* null, %m2624$.ErrorList.type** %.tmp2917
%.tmp2918 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2919 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2918, i32 0, i32 5
store i32 0, i32* %.tmp2919
%.tmp2920 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2921 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2920, i32 0, i32 3
store %m2624$.GlobalName.type* null, %m2624$.GlobalName.type** %.tmp2921
%.tmp2922 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2923 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2922, i32 0, i32 8
store %m2624$.AnonFn.type* null, %m2624$.AnonFn.type** %.tmp2923
%.tmp2924 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2925 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2924, i32 0, i32 7
%.tmp2926 = load i8*, i8** %filename
store i8* %.tmp2926, i8** %.tmp2925
%.tmp2927 = call i8*() @m2172$grammar.cp()
%.tmp2928 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp2927)
%grammar_file.2929 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2928, %m0$.File.type** %grammar_file.2929
%.tmp2930 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2929
%.tmp2931 = icmp eq %m0$.File.type* %.tmp2930, null
br i1 %.tmp2931, label %.if.true.2932, label %.if.false.2932
.if.true.2932:
%.tmp2933 = bitcast ptr null to %m2624$.CompilerCtx.type*
ret %m2624$.CompilerCtx.type* %.tmp2933
br label %.if.end.2932
.if.false.2932:
br label %.if.end.2932
.if.end.2932:
%.tmp2934 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2929
%.tmp2935 = call %m972$.ParsingContext.type*(%m0$.File.type*) @m972$new_context.m972$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2934)
%grammar_ctx.2936 = alloca %m972$.ParsingContext.type*
store %m972$.ParsingContext.type* %.tmp2935, %m972$.ParsingContext.type** %grammar_ctx.2936
%.tmp2937 = load %m0$.File.type*, %m0$.File.type** %grammar_file.2929
%.tmp2938 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp2937)
%.tmp2939 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2940 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2939, i32 0, i32 4
%.tmp2941 = load %m972$.ParsingContext.type*, %m972$.ParsingContext.type** %grammar_ctx.2936
%.tmp2942 = call %m972$.Rule.type**(%m972$.ParsingContext.type*) @m972$parse_grammar.m972$.Rule.typepp.m972$.ParsingContext.typep(%m972$.ParsingContext.type* %.tmp2941)
store %m972$.Rule.type** %.tmp2942, %m972$.Rule.type*** %.tmp2940
%.tmp2943 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2944 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2943, i32 0, i32 6
%.tmp2945 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* null, i32 1
%.tmp2946 = ptrtoint %m2624$.ModuleLookup.type* %.tmp2945 to i32
%.tmp2947 = call i8*(i32) @malloc(i32 %.tmp2946)
%.tmp2948 = bitcast i8* %.tmp2947 to %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* %.tmp2948, %m2624$.ModuleLookup.type** %.tmp2944
%.tmp2949 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2950 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2949, i32 0, i32 6
%.tmp2951 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %.tmp2950
%.tmp2952 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp2951, i32 0, i32 0
%.tmp2953 = load i8*, i8** %filename
store i8* %.tmp2953, i8** %.tmp2952
%.tmp2954 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2955 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2954, i32 0, i32 6
%.tmp2956 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %.tmp2955
%.tmp2957 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp2956, i32 0, i32 3
store %m2624$.Scope.type* null, %m2624$.Scope.type** %.tmp2957
%.tmp2958 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2959 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2958, i32 0, i32 6
%.tmp2960 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %.tmp2959
%.tmp2961 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp2960, i32 0, i32 1
%.tmp2963 = getelementptr [1 x i8], [1 x i8]*@.str2962, i32 0, i32 0
store i8* %.tmp2963, i8** %.tmp2961
%.tmp2964 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2965 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp2964, i32 0, i32 6
%.tmp2966 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %.tmp2965
%.tmp2967 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp2966, i32 0, i32 2
store %m2624$.ModuleLookup.type* null, %m2624$.ModuleLookup.type** %.tmp2967
%.tmp2968 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx.2909
%.tmp2969 = bitcast %m2624$.CompilerCtx.type* %.tmp2968 to %m2624$.CompilerCtx.type*
ret %m2624$.CompilerCtx.type* %.tmp2969
}
define void @m295$push_scope.v.m2624$.CompilerCtx.typep.cp.cp.cp(%m2624$.CompilerCtx.type* %.ctx.arg, i8* %.type.arg, i8* %.begin_id.arg, i8* %.end_id.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%type = alloca i8*
store i8* %.type.arg, i8** %type
%begin_id = alloca i8*
store i8* %.begin_id.arg, i8** %begin_id
%end_id = alloca i8*
store i8* %.end_id.arg, i8** %end_id
%.tmp2970 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* null, i32 1
%.tmp2971 = ptrtoint %m2624$.Scope.type* %.tmp2970 to i32
%.tmp2972 = call i8*(i32) @malloc(i32 %.tmp2971)
%.tmp2973 = bitcast i8* %.tmp2972 to %m2624$.Scope.type*
%s.2974 = alloca %m2624$.Scope.type*
store %m2624$.Scope.type* %.tmp2973, %m2624$.Scope.type** %s.2974
%.tmp2975 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp2976 = call %m2624$.ModuleLookup.type*(%m2624$.CompilerCtx.type*) @m295$get_current_module.m2624$.ModuleLookup.typep.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp2975)
%m.2977 = alloca %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* %.tmp2976, %m2624$.ModuleLookup.type** %m.2977
%.tmp2978 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.2974
%.tmp2979 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp2978, i32 0, i32 5
%.tmp2980 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.2977
%.tmp2981 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp2980, i32 0, i32 3
%.tmp2982 = load %m2624$.Scope.type*, %m2624$.Scope.type** %.tmp2981
store %m2624$.Scope.type* %.tmp2982, %m2624$.Scope.type** %.tmp2979
%.tmp2983 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.2974
%.tmp2984 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp2983, i32 0, i32 1
store %m2624$.ScopeItem.type* null, %m2624$.ScopeItem.type** %.tmp2984
%.tmp2985 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.2974
%.tmp2986 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp2985, i32 0, i32 2
%.tmp2987 = load i8*, i8** %type
store i8* %.tmp2987, i8** %.tmp2986
%.tmp2988 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.2974
%.tmp2989 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp2988, i32 0, i32 3
%.tmp2990 = load i8*, i8** %begin_id
store i8* %.tmp2990, i8** %.tmp2989
%.tmp2991 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.2974
%.tmp2992 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp2991, i32 0, i32 4
%.tmp2993 = load i8*, i8** %end_id
store i8* %.tmp2993, i8** %.tmp2992
%.tmp2994 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.2977
%.tmp2995 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp2994, i32 0, i32 3
%.tmp2996 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.2974
store %m2624$.Scope.type* %.tmp2996, %m2624$.Scope.type** %.tmp2995
ret void
}
define void @m295$pop_scope.v.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%.tmp2997 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp2998 = call %m2624$.ModuleLookup.type*(%m2624$.CompilerCtx.type*) @m295$get_current_module.m2624$.ModuleLookup.typep.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp2997)
%m.2999 = alloca %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* %.tmp2998, %m2624$.ModuleLookup.type** %m.2999
%.tmp3000 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.2999
%.tmp3001 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3000, i32 0, i32 3
%.tmp3002 = load %m2624$.Scope.type*, %m2624$.Scope.type** %.tmp3001
%.tmp3003 = icmp ne %m2624$.Scope.type* %.tmp3002, null
%.tmp3005 = getelementptr [61 x i8], [61 x i8]*@.str3004, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp3003, i8* %.tmp3005)
%.tmp3006 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.2999
%.tmp3007 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3006, i32 0, i32 3
%.tmp3008 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.2999
%.tmp3009 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3008, i32 0, i32 3
%.tmp3010 = load %m2624$.Scope.type*, %m2624$.Scope.type** %.tmp3009
%.tmp3011 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp3010, i32 0, i32 5
%.tmp3012 = load %m2624$.Scope.type*, %m2624$.Scope.type** %.tmp3011
store %m2624$.Scope.type* %.tmp3012, %m2624$.Scope.type** %.tmp3007
ret void
}
define i1 @m295$compile_file.b.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp3013 = load i8*, i8** %filepath
%.tmp3014 = load i32, i32* @O_RDONLY
%.tmp3015 = call i32(i8*,i32) @open(i8* %.tmp3013, i32 %.tmp3014)
%input_fd.3016 = alloca i32
store i32 %.tmp3015, i32* %input_fd.3016
%.tmp3017 = load i32, i32* %input_fd.3016
%.tmp3018 = icmp sle i32 %.tmp3017, 0
br i1 %.tmp3018, label %.if.true.3019, label %.if.false.3019
.if.true.3019:
%err_msg.3020 = alloca i8*
store i8* null, i8** %err_msg.3020
%.tmp3021 = getelementptr i8*, i8** %err_msg.3020, i32 0
%.tmp3023 = getelementptr [26 x i8], [26 x i8]*@.str3022, i32 0, i32 0
%.tmp3024 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3025 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3021, i8* %.tmp3023, %m972$.Node.type* %.tmp3024)
%.tmp3026 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3027 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3028 = load i8*, i8** %err_msg.3020
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp3026, %m972$.Node.type* %.tmp3027, i8* %.tmp3028)
ret i1 0
br label %.if.end.3019
.if.false.3019:
br label %.if.end.3019
.if.end.3019:
%.tmp3029 = load i32, i32* %input_fd.3016
%.tmp3030 = call %m298$.PeekerInfo.type*(i32) @m298$new.m298$.PeekerInfo.typep.i(i32 %.tmp3029)
%p.3031 = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.tmp3030, %m298$.PeekerInfo.type** %p.3031
%.tmp3032 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.3031
%.tmp3033 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp3032, i32 0, i32 6
%.tmp3034 = load i8*, i8** %filepath
store i8* %.tmp3034, i8** %.tmp3033
%.tmp3035 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.3031
%.tmp3036 = call %m297$.Token.type*(%m298$.PeekerInfo.type*,i1) @m297$tokenize.m297$.Token.typep.m298$.PeekerInfo.typep.b(%m298$.PeekerInfo.type* %.tmp3035, i1 0)
%tokens.3037 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp3036, %m297$.Token.type** %tokens.3037
%.tmp3038 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3039 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3038, i32 0, i32 4
%.tmp3040 = load %m972$.Rule.type**, %m972$.Rule.type*** %.tmp3039
%.tmp3042 = getelementptr [6 x i8], [6 x i8]*@.str3041, i32 0, i32 0
%.tmp3043 = load %m297$.Token.type*, %m297$.Token.type** %tokens.3037
%.tmp3044 = call %m972$.ParseResult.type*(%m972$.Rule.type**,i8*,%m297$.Token.type*) @m972$ast.m972$.ParseResult.typep.m972$.Rule.typepp.cp.m297$.Token.typep(%m972$.Rule.type** %.tmp3040, i8* %.tmp3042, %m297$.Token.type* %.tmp3043)
%ast.3045 = alloca %m972$.ParseResult.type*
store %m972$.ParseResult.type* %.tmp3044, %m972$.ParseResult.type** %ast.3045
%.tmp3046 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %ast.3045
%.tmp3047 = getelementptr %m972$.ParseResult.type, %m972$.ParseResult.type* %.tmp3046, i32 0, i32 0
%.tmp3048 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3047
%.tmp3049 = icmp ne %m296$.Error.type* %.tmp3048, null
br i1 %.tmp3049, label %.if.true.3050, label %.if.false.3050
.if.true.3050:
%.tmp3051 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3052 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %ast.3045
%.tmp3053 = getelementptr %m972$.ParseResult.type, %m972$.ParseResult.type* %.tmp3052, i32 0, i32 0
%.tmp3054 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3053
call void(%m2624$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2624$.CompilerCtx.typep.m296$.Error.typep(%m2624$.CompilerCtx.type* %.tmp3051, %m296$.Error.type* %.tmp3054)
br label %.if.end.3050
.if.false.3050:
br label %.if.end.3050
.if.end.3050:
%.tmp3055 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3056 = load %m972$.ParseResult.type*, %m972$.ParseResult.type** %ast.3045
%.tmp3057 = getelementptr %m972$.ParseResult.type, %m972$.ParseResult.type* %.tmp3056, i32 0, i32 1
%.tmp3058 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3057
%.tmp3059 = call i1(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile.b.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp3055, %m972$.Node.type* %.tmp3058)
ret i1 %.tmp3059
}
define i1 @m295$compile.b.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.ast.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%ast = alloca %m972$.Node.type*
store %m972$.Node.type* %.ast.arg, %m972$.Node.type** %ast
%.tmp3060 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3061 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3060, i32 0, i32 2
%.tmp3062 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %.tmp3061
%.tmp3063 = icmp eq %m2624$.ErrorList.type* %.tmp3062, null
br i1 %.tmp3063, label %.if.true.3064, label %.if.false.3064
.if.true.3064:
%.tmp3065 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3066 = load %m972$.Node.type*, %m972$.Node.type** %ast
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_ast.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp3065, %m972$.Node.type* %.tmp3066)
br label %.if.end.3064
.if.false.3064:
br label %.if.end.3064
.if.end.3064:
%.tmp3067 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3068 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3067, i32 0, i32 2
%.tmp3069 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %.tmp3068
%.tmp3070 = icmp ne %m2624$.ErrorList.type* %.tmp3069, null
br i1 %.tmp3070, label %.if.true.3071, label %.if.false.3071
.if.true.3071:
%.tmp3073 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3074 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3073, i32 0, i32 2
%.tmp3075 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %.tmp3074
%err.3076 = alloca %m2624$.ErrorList.type*
store %m2624$.ErrorList.type* %.tmp3075, %m2624$.ErrorList.type** %err.3076
br label %.for.start.3072
.for.start.3072:
%.tmp3077 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %err.3076
%.tmp3078 = icmp ne %m2624$.ErrorList.type* %.tmp3077, null
br i1 %.tmp3078, label %.for.continue.3072, label %.for.end.3072
.for.continue.3072:
%.tmp3079 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %err.3076
%.tmp3080 = getelementptr %m2624$.ErrorList.type, %m2624$.ErrorList.type* %.tmp3079, i32 0, i32 2
%.tmp3081 = load i1, i1* %.tmp3080
%.tmp3082 = icmp eq i1 %.tmp3081, 0
br i1 %.tmp3082, label %.if.true.3083, label %.if.false.3083
.if.true.3083:
%.tmp3084 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %err.3076
%.tmp3085 = getelementptr %m2624$.ErrorList.type, %m2624$.ErrorList.type* %.tmp3084, i32 0, i32 0
%.tmp3086 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3085
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp3086)
%.tmp3087 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %err.3076
%.tmp3088 = getelementptr %m2624$.ErrorList.type, %m2624$.ErrorList.type* %.tmp3087, i32 0, i32 2
store i1 1, i1* %.tmp3088
br label %.if.end.3083
.if.false.3083:
br label %.if.end.3083
.if.end.3083:
%.tmp3089 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %err.3076
%.tmp3090 = getelementptr %m2624$.ErrorList.type, %m2624$.ErrorList.type* %.tmp3089, i32 0, i32 1
%.tmp3091 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %.tmp3090
store %m2624$.ErrorList.type* %.tmp3091, %m2624$.ErrorList.type** %err.3076
br label %.for.start.3072
.for.end.3072:
ret i1 1
br label %.if.end.3071
.if.false.3071:
br label %.if.end.3071
.if.end.3071:
ret i1 0
}
define void @m295$mark_weak_global.v.m2624$.CompilerCtx.typep.cp(%m2624$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp3093 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3094 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3093, i32 0, i32 3
%.tmp3095 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %.tmp3094
%g.3096 = alloca %m2624$.GlobalName.type*
store %m2624$.GlobalName.type* %.tmp3095, %m2624$.GlobalName.type** %g.3096
br label %.for.start.3092
.for.start.3092:
%.tmp3097 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g.3096
%.tmp3098 = icmp ne %m2624$.GlobalName.type* %.tmp3097, null
br i1 %.tmp3098, label %.for.continue.3092, label %.for.end.3092
.for.continue.3092:
%.tmp3099 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g.3096
%.tmp3100 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp3099, i32 0, i32 3
%.tmp3101 = load i1, i1* %.tmp3100
%.tmp3102 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g.3096
%.tmp3103 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp3102, i32 0, i32 0
%.tmp3104 = load i8*, i8** %.tmp3103
%.tmp3105 = load i8*, i8** %id
%.tmp3106 = call i32(i8*,i8*) @strcmp(i8* %.tmp3104, i8* %.tmp3105)
%.tmp3107 = icmp eq i32 %.tmp3106, 0
%.tmp3108 = and i1 %.tmp3101, %.tmp3107
br i1 %.tmp3108, label %.if.true.3109, label %.if.false.3109
.if.true.3109:
%.tmp3110 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g.3096
%.tmp3111 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp3110, i32 0, i32 2
store i1 1, i1* %.tmp3111
br label %.for.end.3092
br label %.if.end.3109
.if.false.3109:
br label %.if.end.3109
.if.end.3109:
%.tmp3112 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g.3096
%.tmp3113 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp3112, i32 0, i32 5
%.tmp3114 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %.tmp3113
store %m2624$.GlobalName.type* %.tmp3114, %m2624$.GlobalName.type** %g.3096
br label %.for.start.3092
.for.end.3092:
ret void
}
define void @m295$compile_ast.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.ast.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%ast = alloca %m972$.Node.type*
store %m972$.Node.type* %.ast.arg, %m972$.Node.type** %ast
%.tmp3115 = load %m972$.Node.type*, %m972$.Node.type** %ast
%.tmp3116 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3115, i32 0, i32 0
%.tmp3117 = load i8*, i8** %.tmp3116
%.tmp3119 = getelementptr [6 x i8], [6 x i8]*@.str3118, i32 0, i32 0
%.tmp3120 = call i32(i8*,i8*) @strcmp(i8* %.tmp3117, i8* %.tmp3119)
%.tmp3121 = icmp ne i32 %.tmp3120, 0
br i1 %.tmp3121, label %.if.true.3122, label %.if.false.3122
.if.true.3122:
%.tmp3123 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3124 = load %m972$.Node.type*, %m972$.Node.type** %ast
%.tmp3126 = getelementptr [29 x i8], [29 x i8]*@.str3125, i32 0, i32 0
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp3123, %m972$.Node.type* %.tmp3124, i8* %.tmp3126)
ret void
br label %.if.end.3122
.if.false.3122:
br label %.if.end.3122
.if.end.3122:
%.tmp3127 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3129 = getelementptr [7 x i8], [7 x i8]*@.str3128, i32 0, i32 0
%.tmp3130 = bitcast ptr null to i8*
%.tmp3131 = bitcast ptr null to i8*
call void(%m2624$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2624$.CompilerCtx.typep.cp.cp.cp(%m2624$.CompilerCtx.type* %.tmp3127, i8* %.tmp3129, i8* %.tmp3130, i8* %.tmp3131)
%.tmp3132 = load %m972$.Node.type*, %m972$.Node.type** %ast
%.tmp3133 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3132, i32 0, i32 6
%.tmp3134 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3133
%start.3135 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp3134, %m972$.Node.type** %start.3135
%.tmp3136 = load %m972$.Node.type*, %m972$.Node.type** %start.3135
%.tmp3137 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3136, i32 0, i32 0
%.tmp3138 = load i8*, i8** %.tmp3137
%.tmp3140 = getelementptr [13 x i8], [13 x i8]*@.str3139, i32 0, i32 0
%.tmp3141 = call i32(i8*,i8*) @strcmp(i8* %.tmp3138, i8* %.tmp3140)
%.tmp3142 = icmp eq i32 %.tmp3141, 0
br i1 %.tmp3142, label %.if.true.3143, label %.if.false.3143
.if.true.3143:
%.tmp3144 = load %m972$.Node.type*, %m972$.Node.type** %start.3135
%.tmp3145 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3144, i32 0, i32 7
%.tmp3146 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3145
store %m972$.Node.type* %.tmp3146, %m972$.Node.type** %start.3135
br label %.if.end.3143
.if.false.3143:
br label %.if.end.3143
.if.end.3143:
%.tmp3148 = load %m972$.Node.type*, %m972$.Node.type** %start.3135
%stmt.3149 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp3148, %m972$.Node.type** %stmt.3149
br label %.for.start.3147
.for.start.3147:
%.tmp3150 = load %m972$.Node.type*, %m972$.Node.type** %stmt.3149
%.tmp3151 = icmp ne %m972$.Node.type* %.tmp3150, null
br i1 %.tmp3151, label %.for.continue.3147, label %.for.end.3147
.for.continue.3147:
%.tmp3152 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3153 = load %m972$.Node.type*, %m972$.Node.type** %stmt.3149
%.tmp3154 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3153, i32 0, i32 6
%.tmp3155 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3154
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i1) @m295$compile_statement.v.m2624$.CompilerCtx.typep.m972$.Node.typep.b(%m2624$.CompilerCtx.type* %.tmp3152, %m972$.Node.type* %.tmp3155, i1 1)
%.tmp3156 = load %m972$.Node.type*, %m972$.Node.type** %stmt.3149
%.tmp3157 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3156, i32 0, i32 7
%.tmp3158 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3157
store %m972$.Node.type* %.tmp3158, %m972$.Node.type** %stmt.3149
br label %.for.start.3147
.for.end.3147:
%.tmp3160 = load %m972$.Node.type*, %m972$.Node.type** %start.3135
%s.3161 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp3160, %m972$.Node.type** %s.3161
br label %.for.start.3159
.for.start.3159:
%.tmp3162 = load %m972$.Node.type*, %m972$.Node.type** %s.3161
%.tmp3163 = icmp ne %m972$.Node.type* %.tmp3162, null
br i1 %.tmp3163, label %.for.continue.3159, label %.for.end.3159
.for.continue.3159:
%.tmp3164 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3165 = load %m972$.Node.type*, %m972$.Node.type** %s.3161
%.tmp3166 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3165, i32 0, i32 6
%.tmp3167 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3166
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i1) @m295$compile_statement.v.m2624$.CompilerCtx.typep.m972$.Node.typep.b(%m2624$.CompilerCtx.type* %.tmp3164, %m972$.Node.type* %.tmp3167, i1 0)
%.tmp3168 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
call void(%m2624$.CompilerCtx.type*) @m295$compile_anon_fn.v.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp3168)
%.tmp3169 = load %m972$.Node.type*, %m972$.Node.type** %s.3161
%.tmp3170 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3169, i32 0, i32 7
%.tmp3171 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3170
store %m972$.Node.type* %.tmp3171, %m972$.Node.type** %s.3161
br label %.for.start.3159
.for.end.3159:
%.tmp3172 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3173 = call %m2624$.ModuleLookup.type*(%m2624$.CompilerCtx.type*) @m295$get_current_module.m2624$.ModuleLookup.typep.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp3172)
%mod.3174 = alloca %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* %.tmp3173, %m2624$.ModuleLookup.type** %mod.3174
%.tmp3175 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.3174
%.tmp3176 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3175, i32 0, i32 1
%.tmp3177 = load i8*, i8** %.tmp3176
%.tmp3179 = getelementptr [1 x i8], [1 x i8]*@.str3178, i32 0, i32 0
%.tmp3180 = call i32(i8*,i8*) @strcmp(i8* %.tmp3177, i8* %.tmp3179)
%.tmp3181 = icmp eq i32 %.tmp3180, 0
br i1 %.tmp3181, label %.if.true.3182, label %.if.false.3182
.if.true.3182:
%.tmp3184 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3185 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3184, i32 0, i32 3
%.tmp3186 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %.tmp3185
%g.3187 = alloca %m2624$.GlobalName.type*
store %m2624$.GlobalName.type* %.tmp3186, %m2624$.GlobalName.type** %g.3187
br label %.for.start.3183
.for.start.3183:
%.tmp3188 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g.3187
%.tmp3189 = icmp ne %m2624$.GlobalName.type* %.tmp3188, null
br i1 %.tmp3189, label %.for.continue.3183, label %.for.end.3183
.for.continue.3183:
%.tmp3190 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3191 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g.3187
call void(%m2624$.CompilerCtx.type*,%m2624$.GlobalName.type*) @m295$compile_global.v.m2624$.CompilerCtx.typep.m2624$.GlobalName.typep(%m2624$.CompilerCtx.type* %.tmp3190, %m2624$.GlobalName.type* %.tmp3191)
%.tmp3192 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g.3187
%.tmp3193 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp3192, i32 0, i32 5
%.tmp3194 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %.tmp3193
store %m2624$.GlobalName.type* %.tmp3194, %m2624$.GlobalName.type** %g.3187
br label %.for.start.3183
.for.end.3183:
br label %.if.end.3182
.if.false.3182:
br label %.if.end.3182
.if.end.3182:
ret void
}
define void @m295$compile_global.v.m2624$.CompilerCtx.typep.m2624$.GlobalName.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%g = alloca %m2624$.GlobalName.type*
store %m2624$.GlobalName.type* %.g.arg, %m2624$.GlobalName.type** %g
%.tmp3195 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g
%.tmp3196 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp3195, i32 0, i32 2
%.tmp3197 = load i1, i1* %.tmp3196
br i1 %.tmp3197, label %.if.true.3198, label %.if.false.3198
.if.true.3198:
ret void
br label %.if.end.3198
.if.false.3198:
br label %.if.end.3198
.if.end.3198:
%.tmp3199 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g
%.tmp3200 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp3199, i32 0, i32 1
%.tmp3201 = load i8*, i8** %.tmp3200
%.tmp3203 = getelementptr [7 x i8], [7 x i8]*@.str3202, i32 0, i32 0
%.tmp3204 = call i32(i8*,i8*) @strcmp(i8* %.tmp3201, i8* %.tmp3203)
%.tmp3205 = icmp eq i32 %.tmp3204, 0
br i1 %.tmp3205, label %.if.true.3206, label %.if.false.3206
.if.true.3206:
%.tmp3207 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3208 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3207, i32 0, i32 1
%.tmp3209 = load %m0$.File.type*, %m0$.File.type** %.tmp3208
%.tmp3211 = getelementptr [21 x i8], [21 x i8]*@.str3210, i32 0, i32 0
%.tmp3212 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g
%.tmp3213 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp3212, i32 0, i32 4
%.tmp3214 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %.tmp3213
%.tmp3215 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp3214)
%.tmp3216 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3217 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g
%.tmp3218 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp3217, i32 0, i32 4
%.tmp3219 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %.tmp3218
%.tmp3220 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3219, i32 0, i32 4
%.tmp3221 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3220
%.tmp3222 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp3216, %m2624$.Type.type* %.tmp3221)
%.tmp3223 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g
%.tmp3224 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp3223, i32 0, i32 0
%.tmp3225 = load i8*, i8** %.tmp3224
%.tmp3226 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3209, i8* %.tmp3211, i8* %.tmp3215, i8* %.tmp3222, i8* %.tmp3225)
br label %.if.end.3206
.if.false.3206:
%.tmp3227 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g
%.tmp3228 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp3227, i32 0, i32 1
%.tmp3229 = load i8*, i8** %.tmp3228
%.tmp3231 = getelementptr [7 x i8], [7 x i8]*@.str3230, i32 0, i32 0
%.tmp3232 = call i32(i8*,i8*) @strcmp(i8* %.tmp3229, i8* %.tmp3231)
%.tmp3233 = icmp eq i32 %.tmp3232, 0
br i1 %.tmp3233, label %.if.true.3234, label %.if.false.3234
.if.true.3234:
%.tmp3235 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3236 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g
%.tmp3237 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp3236, i32 0, i32 4
%.tmp3238 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %.tmp3237
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$compile_extern.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp3235, %m2624$.AssignableInfo.type* %.tmp3238)
br label %.if.end.3234
.if.false.3234:
br label %.if.end.3234
.if.end.3234:
br label %.if.end.3206
.if.end.3206:
%.tmp3239 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g
%.tmp3240 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp3239, i32 0, i32 2
store i1 1, i1* %.tmp3240
ret void
}
define void @m295$compile_extern.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%info = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.info.arg, %m2624$.AssignableInfo.type** %info
%.tmp3241 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3242 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3241, i32 0, i32 1
%.tmp3243 = load %m0$.File.type*, %m0$.File.type** %.tmp3242
%.tmp3245 = getelementptr [15 x i8], [15 x i8]*@.str3244, i32 0, i32 0
%.tmp3246 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3247 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp3248 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3247, i32 0, i32 4
%.tmp3249 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3248
%.tmp3250 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3249, i32 0, i32 3
%.tmp3251 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3250
%.tmp3252 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp3246, %m2624$.Type.type* %.tmp3251)
%.tmp3253 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp3254 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp3253)
%.tmp3255 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3243, i8* %.tmp3245, i8* %.tmp3252, i8* %.tmp3254)
%.tmp3257 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp3258 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3257, i32 0, i32 4
%.tmp3259 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3258
%.tmp3260 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3259, i32 0, i32 3
%.tmp3261 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3260
%.tmp3262 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3261, i32 0, i32 4
%.tmp3263 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3262
%pt.3264 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp3263, %m2624$.Type.type** %pt.3264
br label %.for.start.3256
.for.start.3256:
%.tmp3265 = load %m2624$.Type.type*, %m2624$.Type.type** %pt.3264
%.tmp3266 = icmp ne %m2624$.Type.type* %.tmp3265, null
br i1 %.tmp3266, label %.for.continue.3256, label %.for.end.3256
.for.continue.3256:
%.tmp3267 = load %m2624$.Type.type*, %m2624$.Type.type** %pt.3264
%.tmp3268 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp3269 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3268, i32 0, i32 4
%.tmp3270 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3269
%.tmp3271 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3270, i32 0, i32 3
%.tmp3272 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3271
%.tmp3273 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3272, i32 0, i32 4
%.tmp3274 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3273
%.tmp3275 = icmp ne %m2624$.Type.type* %.tmp3267, %.tmp3274
br i1 %.tmp3275, label %.if.true.3276, label %.if.false.3276
.if.true.3276:
%.tmp3277 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3278 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3277, i32 0, i32 1
%.tmp3279 = load %m0$.File.type*, %m0$.File.type** %.tmp3278
%.tmp3281 = getelementptr [3 x i8], [3 x i8]*@.str3280, i32 0, i32 0
%.tmp3282 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3279, i8* %.tmp3281)
br label %.if.end.3276
.if.false.3276:
br label %.if.end.3276
.if.end.3276:
%.tmp3283 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3284 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3283, i32 0, i32 1
%.tmp3285 = load %m0$.File.type*, %m0$.File.type** %.tmp3284
%.tmp3287 = getelementptr [3 x i8], [3 x i8]*@.str3286, i32 0, i32 0
%.tmp3288 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3289 = load %m2624$.Type.type*, %m2624$.Type.type** %pt.3264
%.tmp3290 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp3288, %m2624$.Type.type* %.tmp3289)
%.tmp3291 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3285, i8* %.tmp3287, i8* %.tmp3290)
%.tmp3292 = load %m2624$.Type.type*, %m2624$.Type.type** %pt.3264
%.tmp3293 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3292, i32 0, i32 4
%.tmp3294 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3293
store %m2624$.Type.type* %.tmp3294, %m2624$.Type.type** %pt.3264
br label %.for.start.3256
.for.end.3256:
%.tmp3295 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3296 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3295, i32 0, i32 1
%.tmp3297 = load %m0$.File.type*, %m0$.File.type** %.tmp3296
%.tmp3299 = getelementptr [3 x i8], [3 x i8]*@.str3298, i32 0, i32 0
%.tmp3300 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3297, i8* %.tmp3299)
ret void
}
define i8* @m295$get_mod_prefix.cp.m2624$.CompilerCtx.typep.cp(%m2624$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3301 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3302 = call %m2624$.ModuleLookup.type*(%m2624$.CompilerCtx.type*) @m295$get_current_module.m2624$.ModuleLookup.typep.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp3301)
%m.3303 = alloca %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* %.tmp3302, %m2624$.ModuleLookup.type** %m.3303
%.tmp3304 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.3303
%.tmp3305 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3304, i32 0, i32 1
%.tmp3306 = load i8*, i8** %.tmp3305
ret i8* %.tmp3306
}
define i8* @m295$name_mangle.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.fn.arg, i8* %.original_name.arg, %m2624$.Type.type* %.type.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%fn = alloca %m972$.Node.type*
store %m972$.Node.type* %.fn.arg, %m972$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.type.arg, %m2624$.Type.type** %type
%mangled_name.3307 = alloca i8*
store i8* null, i8** %mangled_name.3307
%.tmp3308 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3309 = load %m972$.Node.type*, %m972$.Node.type** %fn
%.tmp3310 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3309, i32 0, i32 2
%.tmp3311 = load i8*, i8** %.tmp3310
%.tmp3312 = call i8*(%m2624$.CompilerCtx.type*,i8*) @m295$get_mod_prefix.cp.m2624$.CompilerCtx.typep.cp(%m2624$.CompilerCtx.type* %.tmp3308, i8* %.tmp3311)
%prefix.3313 = alloca i8*
store i8* %.tmp3312, i8** %prefix.3313
%.tmp3314 = getelementptr i8*, i8** %mangled_name.3307, i32 0
%.tmp3316 = getelementptr [5 x i8], [5 x i8]*@.str3315, i32 0, i32 0
%.tmp3317 = load i8*, i8** %prefix.3313
%.tmp3318 = load i8*, i8** %original_name
%.tmp3319 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3314, i8* %.tmp3316, i8* %.tmp3317, i8* %.tmp3318)
%.tmp3320 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp3321 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3320, i32 0, i32 0
%.tmp3322 = load i8*, i8** %.tmp3321
%.tmp3324 = getelementptr [9 x i8], [9 x i8]*@.str3323, i32 0, i32 0
%.tmp3325 = call i32(i8*,i8*) @strcmp(i8* %.tmp3322, i8* %.tmp3324)
%.tmp3326 = icmp eq i32 %.tmp3325, 0
br i1 %.tmp3326, label %.if.true.3327, label %.if.false.3327
.if.true.3327:
%.tmp3328 = load i8*, i8** %mangled_name.3307
%.tmp3330 = getelementptr [5 x i8], [5 x i8]*@.str3329, i32 0, i32 0
%.tmp3331 = call i32(i8*,i8*) @strcmp(i8* %.tmp3328, i8* %.tmp3330)
%.tmp3332 = icmp ne i32 %.tmp3331, 0
br i1 %.tmp3332, label %.if.true.3333, label %.if.false.3333
.if.true.3333:
%tmp_buff.3334 = alloca i8*
store i8* null, i8** %tmp_buff.3334
%swap_var.3335 = alloca i8*
store i8* null, i8** %swap_var.3335
%.tmp3337 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp3338 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3337, i32 0, i32 3
%.tmp3339 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3338
%tp.3340 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp3339, %m2624$.Type.type** %tp.3340
br label %.for.start.3336
.for.start.3336:
%.tmp3341 = load %m2624$.Type.type*, %m2624$.Type.type** %tp.3340
%.tmp3342 = icmp ne %m2624$.Type.type* %.tmp3341, null
br i1 %.tmp3342, label %.for.continue.3336, label %.for.end.3336
.for.continue.3336:
%.tmp3343 = getelementptr i8*, i8** %tmp_buff.3334, i32 0
%.tmp3345 = getelementptr [6 x i8], [6 x i8]*@.str3344, i32 0, i32 0
%.tmp3346 = load i8*, i8** %mangled_name.3307
%.tmp3347 = load %m2624$.Type.type*, %m2624$.Type.type** %tp.3340
%.tmp3348 = call i8*(%m2624$.Type.type*) @m295$type_abbr.cp.m2624$.Type.typep(%m2624$.Type.type* %.tmp3347)
%.tmp3349 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3343, i8* %.tmp3345, i8* %.tmp3346, i8* %.tmp3348)
%.tmp3350 = load i8*, i8** %tmp_buff.3334
store i8* %.tmp3350, i8** %swap_var.3335
%.tmp3351 = load i8*, i8** %mangled_name.3307
store i8* %.tmp3351, i8** %tmp_buff.3334
%.tmp3352 = load i8*, i8** %swap_var.3335
store i8* %.tmp3352, i8** %mangled_name.3307
%.tmp3353 = load i8*, i8** %tmp_buff.3334
call void(i8*) @free(i8* %.tmp3353)
%.tmp3354 = load %m2624$.Type.type*, %m2624$.Type.type** %tp.3340
%.tmp3355 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3354, i32 0, i32 4
%.tmp3356 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3355
store %m2624$.Type.type* %.tmp3356, %m2624$.Type.type** %tp.3340
br label %.for.start.3336
.for.end.3336:
br label %.if.end.3333
.if.false.3333:
br label %.if.end.3333
.if.end.3333:
br label %.if.end.3327
.if.false.3327:
br label %.if.end.3327
.if.end.3327:
%.tmp3357 = load i8*, i8** %mangled_name.3307
ret i8* %.tmp3357
}
define void @m295$compile_statement.v.m2624$.CompilerCtx.typep.m972$.Node.typep.b(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3358 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* null, %m2624$.AssignableInfo.type** %info.3358
%return_type.3359 = alloca %m2624$.Type.type*
store %m2624$.Type.type* null, %m2624$.Type.type** %return_type.3359
%err_buf.3360 = alloca i8*
store i8* null, i8** %err_buf.3360
%tmp_buff.3361 = alloca i8*
store i8* null, i8** %tmp_buff.3361
%.tmp3362 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3363 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3362, i32 0, i32 0
%.tmp3364 = load i8*, i8** %.tmp3363
%.tmp3366 = getelementptr [3 x i8], [3 x i8]*@.str3365, i32 0, i32 0
%.tmp3367 = call i32(i8*,i8*) @strcmp(i8* %.tmp3364, i8* %.tmp3366)
%.tmp3368 = icmp eq i32 %.tmp3367, 0
br i1 %.tmp3368, label %.if.true.3369, label %.if.false.3369
.if.true.3369:
ret void
br label %.if.end.3369
.if.false.3369:
%.tmp3370 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3371 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3370, i32 0, i32 0
%.tmp3372 = load i8*, i8** %.tmp3371
%.tmp3374 = getelementptr [7 x i8], [7 x i8]*@.str3373, i32 0, i32 0
%.tmp3375 = call i32(i8*,i8*) @strcmp(i8* %.tmp3372, i8* %.tmp3374)
%.tmp3376 = icmp eq i32 %.tmp3375, 0
br i1 %.tmp3376, label %.if.true.3377, label %.if.false.3377
.if.true.3377:
%.tmp3378 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3379 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3378, i32 0, i32 6
%.tmp3380 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3379
%.tmp3382 = getelementptr [11 x i8], [11 x i8]*@.str3381, i32 0, i32 0
%.tmp3383 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp3380, i8* %.tmp3382)
%assignable.3384 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp3383, %m972$.Node.type** %assignable.3384
%.tmp3385 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3386 = load %m972$.Node.type*, %m972$.Node.type** %assignable.3384
%.tmp3387 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_assignable.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp3385, %m972$.Node.type* %.tmp3386)
%a_info.3388 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp3387, %m2624$.AssignableInfo.type** %a_info.3388
%.tmp3389 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.3388
%.tmp3390 = icmp eq %m2624$.AssignableInfo.type* %.tmp3389, null
br i1 %.tmp3390, label %.if.true.3391, label %.if.false.3391
.if.true.3391:
ret void
br label %.if.end.3391
.if.false.3391:
br label %.if.end.3391
.if.end.3391:
%.tmp3392 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3393 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp3392)
store %m2624$.AssignableInfo.type* %.tmp3393, %m2624$.AssignableInfo.type** %info.3358
%.tmp3394 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3395 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3394, i32 0, i32 6
%.tmp3396 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3395
%.tmp3397 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3396, i32 0, i32 7
%.tmp3398 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3397
%.tmp3399 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3398, i32 0, i32 1
%.tmp3400 = load i8*, i8** %.tmp3399
%global_name.3401 = alloca i8*
store i8* %.tmp3400, i8** %global_name.3401
%.tmp3402 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3403 = load i8, i8* @SCOPE_GLOBAL
%.tmp3404 = load i8*, i8** %global_name.3401
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp3402, i8 %.tmp3403, i8* %.tmp3404)
%.tmp3405 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3406 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3405, i32 0, i32 4
%.tmp3407 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.3388
%.tmp3408 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3407, i32 0, i32 4
%.tmp3409 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3408
store %m2624$.Type.type* %.tmp3409, %m2624$.Type.type** %.tmp3406
%.tmp3410 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3411 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3410, i32 0, i32 3
%.tmp3413 = getelementptr [9 x i8], [9 x i8]*@.str3412, i32 0, i32 0
store i8* %.tmp3413, i8** %.tmp3411
%.tmp3414 = load i1, i1* %shallow
%.tmp3415 = icmp eq i1 %.tmp3414, 1
br i1 %.tmp3415, label %.if.true.3416, label %.if.false.3416
.if.true.3416:
%.tmp3417 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3418 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3419 = load i8*, i8** %global_name.3401
%.tmp3420 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*,%m2624$.AssignableInfo.type*) @m295$define_assignable.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp3417, %m972$.Node.type* %.tmp3418, i8* %.tmp3419, %m2624$.AssignableInfo.type* %.tmp3420)
br label %.if.end.3416
.if.false.3416:
%.tmp3421 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3422 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3421, i32 0, i32 1
%.tmp3423 = load %m0$.File.type*, %m0$.File.type** %.tmp3422
%.tmp3425 = getelementptr [21 x i8], [21 x i8]*@.str3424, i32 0, i32 0
%.tmp3426 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3427 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp3426)
%.tmp3428 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3429 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3430 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3429, i32 0, i32 4
%.tmp3431 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3430
%.tmp3432 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp3428, %m2624$.Type.type* %.tmp3431)
%.tmp3433 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.3388
%.tmp3434 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp3433)
%.tmp3435 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3423, i8* %.tmp3425, i8* %.tmp3427, i8* %.tmp3432, i8* %.tmp3434)
br label %.if.end.3416
.if.end.3416:
br label %.if.end.3377
.if.false.3377:
%.tmp3436 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3437 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3436, i32 0, i32 0
%.tmp3438 = load i8*, i8** %.tmp3437
%.tmp3440 = getelementptr [10 x i8], [10 x i8]*@.str3439, i32 0, i32 0
%.tmp3441 = call i32(i8*,i8*) @strcmp(i8* %.tmp3438, i8* %.tmp3440)
%.tmp3442 = icmp eq i32 %.tmp3441, 0
br i1 %.tmp3442, label %.if.true.3443, label %.if.false.3443
.if.true.3443:
%.tmp3444 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3445 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3444, i32 0, i32 6
%.tmp3446 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3445
%.tmp3447 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3446, i32 0, i32 7
%.tmp3448 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3447
%.tmp3449 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3448, i32 0, i32 1
%.tmp3450 = load i8*, i8** %.tmp3449
%type_name.3451 = alloca i8*
store i8* %.tmp3450, i8** %type_name.3451
%.tmp3452 = load i1, i1* %shallow
%.tmp3453 = icmp eq i1 %.tmp3452, 1
br i1 %.tmp3453, label %.if.true.3454, label %.if.false.3454
.if.true.3454:
%.tmp3455 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3456 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp3455)
store %m2624$.AssignableInfo.type* %.tmp3456, %m2624$.AssignableInfo.type** %info.3358
%.tmp3457 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3458 = call %m2624$.ModuleLookup.type*(%m2624$.CompilerCtx.type*) @m295$get_current_module.m2624$.ModuleLookup.typep.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp3457)
%mod_from.3459 = alloca %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* %.tmp3458, %m2624$.ModuleLookup.type** %mod_from.3459
%.tmp3460 = getelementptr i8*, i8** %tmp_buff.3361, i32 0
%.tmp3462 = getelementptr [11 x i8], [11 x i8]*@.str3461, i32 0, i32 0
%.tmp3463 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod_from.3459
%.tmp3464 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3463, i32 0, i32 1
%.tmp3465 = load i8*, i8** %.tmp3464
%.tmp3466 = load i8*, i8** %type_name.3451
%.tmp3467 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3460, i8* %.tmp3462, i8* %.tmp3465, i8* %.tmp3466)
%.tmp3468 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3469 = load i8, i8* @SCOPE_LOCAL
%.tmp3470 = load i8*, i8** %tmp_buff.3361
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp3468, i8 %.tmp3469, i8* %.tmp3470)
%.tmp3471 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3472 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3471, i32 0, i32 3
%.tmp3474 = getelementptr [10 x i8], [10 x i8]*@.str3473, i32 0, i32 0
store i8* %.tmp3474, i8** %.tmp3472
%.tmp3475 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3476 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3475, i32 0, i32 5
%.tmp3477 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3478 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3477, i32 0, i32 3
%.tmp3479 = load i32, i32* %.tmp3478
store i32 %.tmp3479, i32* %.tmp3476
%.tmp3480 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3481 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3480, i32 0, i32 6
%.tmp3482 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3483 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3482, i32 0, i32 4
%.tmp3484 = load i32, i32* %.tmp3483
store i32 %.tmp3484, i32* %.tmp3481
%.tmp3485 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3486 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3485, i32 0, i32 4
%.tmp3487 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp3487, %m2624$.Type.type** %.tmp3486
%.tmp3488 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3489 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3490 = load i8*, i8** %type_name.3451
%.tmp3491 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*,%m2624$.AssignableInfo.type*) @m295$define_assignable.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp3488, %m972$.Node.type* %.tmp3489, i8* %.tmp3490, %m2624$.AssignableInfo.type* %.tmp3491)
%.tmp3492 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3493 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3492, i32 0, i32 6
%.tmp3494 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3493
%.tmp3496 = getelementptr [5 x i8], [5 x i8]*@.str3495, i32 0, i32 0
%.tmp3497 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp3494, i8* %.tmp3496)
%type_decl.3498 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp3497, %m972$.Node.type** %type_decl.3498
%.tmp3499 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3500 = load %m972$.Node.type*, %m972$.Node.type** %type_decl.3498
%.tmp3501 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3500, i32 0, i32 6
%.tmp3502 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3501
%.tmp3503 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp3499, %m972$.Node.type* %.tmp3502)
%type_struct.3504 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp3503, %m2624$.Type.type** %type_struct.3504
%.tmp3505 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3506 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3505, i32 0, i32 4
%.tmp3507 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3506
%.tmp3508 = load %m2624$.Type.type*, %m2624$.Type.type** %type_struct.3504
call void(%m2624$.Type.type*,%m2624$.Type.type*) @m295$copy_type.v.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.tmp3507, %m2624$.Type.type* %.tmp3508)
%.tmp3509 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3510 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3509, i32 0, i32 4
%.tmp3511 = load %m2624$.Type.type*, %m2624$.Type.type** %type_struct.3504
store %m2624$.Type.type* %.tmp3511, %m2624$.Type.type** %.tmp3510
br label %.if.end.3454
.if.false.3454:
%.tmp3512 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3513 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3514 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3513, i32 0, i32 7
%.tmp3515 = load i8*, i8** %.tmp3514
%.tmp3516 = load i8*, i8** %type_name.3451
%.tmp3517 = call %m2624$.ScopeItem.type*(%m2624$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2624$.ScopeItem.typep.m2624$.CompilerCtx.typep.cp.cp(%m2624$.CompilerCtx.type* %.tmp3512, i8* %.tmp3515, i8* %.tmp3516)
%scope.3518 = alloca %m2624$.ScopeItem.type*
store %m2624$.ScopeItem.type* %.tmp3517, %m2624$.ScopeItem.type** %scope.3518
%.tmp3519 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %scope.3518
%.tmp3520 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp3519, i32 0, i32 1
%.tmp3521 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %.tmp3520
store %m2624$.AssignableInfo.type* %.tmp3521, %m2624$.AssignableInfo.type** %info.3358
%.tmp3522 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3523 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3522, i32 0, i32 1
%.tmp3524 = load %m0$.File.type*, %m0$.File.type** %.tmp3523
%.tmp3526 = getelementptr [14 x i8], [14 x i8]*@.str3525, i32 0, i32 0
%.tmp3527 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3528 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp3527)
%.tmp3529 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3530 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3531 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3530, i32 0, i32 4
%.tmp3532 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3531
%.tmp3533 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp3529, %m2624$.Type.type* %.tmp3532)
%.tmp3534 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3524, i8* %.tmp3526, i8* %.tmp3528, i8* %.tmp3533)
br label %.if.end.3454
.if.end.3454:
br label %.if.end.3443
.if.false.3443:
%.tmp3535 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3536 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3535, i32 0, i32 0
%.tmp3537 = load i8*, i8** %.tmp3536
%.tmp3539 = getelementptr [7 x i8], [7 x i8]*@.str3538, i32 0, i32 0
%.tmp3540 = call i32(i8*,i8*) @strcmp(i8* %.tmp3537, i8* %.tmp3539)
%.tmp3541 = icmp eq i32 %.tmp3540, 0
br i1 %.tmp3541, label %.if.true.3542, label %.if.false.3542
.if.true.3542:
%.tmp3543 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3544 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp3543)
store %m2624$.AssignableInfo.type* %.tmp3544, %m2624$.AssignableInfo.type** %info.3358
%.tmp3545 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3546 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3545, i32 0, i32 4
%.tmp3547 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3548 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3549 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3548, i32 0, i32 6
%.tmp3550 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3549
%.tmp3551 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3550, i32 0, i32 7
%.tmp3552 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3551
%.tmp3553 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$syn_function_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp3547, %m972$.Node.type* %.tmp3552)
store %m2624$.Type.type* %.tmp3553, %m2624$.Type.type** %.tmp3546
%.tmp3554 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3555 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3554, i32 0, i32 3
%.tmp3557 = getelementptr [7 x i8], [7 x i8]*@.str3556, i32 0, i32 0
store i8* %.tmp3557, i8** %.tmp3555
%.tmp3558 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3559 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3558, i32 0, i32 6
%.tmp3560 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3559
%.tmp3561 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3560, i32 0, i32 7
%.tmp3562 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3561
%.tmp3563 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3562, i32 0, i32 7
%.tmp3564 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3563
%.tmp3565 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3564, i32 0, i32 1
%.tmp3566 = load i8*, i8** %.tmp3565
%fn_name.3567 = alloca i8*
store i8* %.tmp3566, i8** %fn_name.3567
%.tmp3568 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3569 = load i8, i8* @SCOPE_GLOBAL
%.tmp3570 = load i8*, i8** %fn_name.3567
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp3568, i8 %.tmp3569, i8* %.tmp3570)
%.tmp3571 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp3571, %m2624$.Type.type** %return_type.3359
%.tmp3572 = load %m2624$.Type.type*, %m2624$.Type.type** %return_type.3359
%.tmp3573 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3572, i32 0, i32 0
%.tmp3574 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3575 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3574, i32 0, i32 4
%.tmp3576 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3575
%.tmp3577 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3576, i32 0, i32 3
%.tmp3578 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3577
%.tmp3579 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3578, i32 0, i32 0
%.tmp3580 = load i8*, i8** %.tmp3579
store i8* %.tmp3580, i8** %.tmp3573
%.tmp3581 = load %m2624$.Type.type*, %m2624$.Type.type** %return_type.3359
%.tmp3582 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3581, i32 0, i32 3
%.tmp3583 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3584 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3583, i32 0, i32 4
%.tmp3585 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3584
%.tmp3586 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3585, i32 0, i32 3
%.tmp3587 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3586
%.tmp3588 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3587, i32 0, i32 3
%.tmp3589 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3588
store %m2624$.Type.type* %.tmp3589, %m2624$.Type.type** %.tmp3582
%.tmp3590 = load i1, i1* %shallow
%.tmp3591 = icmp eq i1 %.tmp3590, 0
br i1 %.tmp3591, label %.if.true.3592, label %.if.false.3592
.if.true.3592:
%.tmp3593 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3594 = load i8*, i8** %fn_name.3567
call void(%m2624$.CompilerCtx.type*,i8*) @m295$mark_weak_global.v.m2624$.CompilerCtx.typep.cp(%m2624$.CompilerCtx.type* %.tmp3593, i8* %.tmp3594)
%.tmp3595 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3596 = load i8*, i8** %fn_name.3567
%.tmp3598 = getelementptr [7 x i8], [7 x i8]*@.str3597, i32 0, i32 0
%.tmp3599 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
call void(%m2624$.CompilerCtx.type*,i8*,i8*,%m2624$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2624$.CompilerCtx.typep.cp.cp.m2624$.AssignableInfo.typep.b.b(%m2624$.CompilerCtx.type* %.tmp3595, i8* %.tmp3596, i8* %.tmp3598, %m2624$.AssignableInfo.type* %.tmp3599, i1 1, i1 1)
%.tmp3600 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3601 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$compile_extern.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp3600, %m2624$.AssignableInfo.type* %.tmp3601)
br label %.if.end.3592
.if.false.3592:
%.tmp3602 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3603 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3604 = load i8*, i8** %fn_name.3567
%.tmp3605 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*,%m2624$.AssignableInfo.type*) @m295$define_assignable.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp3602, %m972$.Node.type* %.tmp3603, i8* %.tmp3604, %m2624$.AssignableInfo.type* %.tmp3605)
br label %.if.end.3592
.if.end.3592:
br label %.if.end.3542
.if.false.3542:
%.tmp3606 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3607 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3606, i32 0, i32 0
%.tmp3608 = load i8*, i8** %.tmp3607
%.tmp3610 = getelementptr [9 x i8], [9 x i8]*@.str3609, i32 0, i32 0
%.tmp3611 = call i32(i8*,i8*) @strcmp(i8* %.tmp3608, i8* %.tmp3610)
%.tmp3612 = icmp eq i32 %.tmp3611, 0
br i1 %.tmp3612, label %.if.true.3613, label %.if.false.3613
.if.true.3613:
%.tmp3614 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3615 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp3614)
store %m2624$.AssignableInfo.type* %.tmp3615, %m2624$.AssignableInfo.type** %info.3358
%.tmp3616 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3617 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3616, i32 0, i32 3
%.tmp3619 = getelementptr [9 x i8], [9 x i8]*@.str3618, i32 0, i32 0
store i8* %.tmp3619, i8** %.tmp3617
%.tmp3620 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3621 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3620, i32 0, i32 4
%.tmp3622 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3623 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3624 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3623, i32 0, i32 6
%.tmp3625 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3624
%.tmp3626 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$syn_function_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp3622, %m972$.Node.type* %.tmp3625)
store %m2624$.Type.type* %.tmp3626, %m2624$.Type.type** %.tmp3621
%.tmp3627 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3628 = call i8*(%m972$.Node.type*) @m295$syn_function_name.cp.m972$.Node.typep(%m972$.Node.type* %.tmp3627)
%name.3629 = alloca i8*
store i8* %.tmp3628, i8** %name.3629
%.tmp3630 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3631 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3632 = load i8*, i8** %name.3629
%.tmp3633 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3634 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3633, i32 0, i32 4
%.tmp3635 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3634
%.tmp3636 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*,%m2624$.Type.type*) @m295$name_mangle.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp3630, %m972$.Node.type* %.tmp3631, i8* %.tmp3632, %m2624$.Type.type* %.tmp3635)
store i8* %.tmp3636, i8** %tmp_buff.3361
%.tmp3637 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3638 = load i8, i8* @SCOPE_GLOBAL
%.tmp3639 = load i8*, i8** %tmp_buff.3361
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp3637, i8 %.tmp3638, i8* %.tmp3639)
%.tmp3640 = load i1, i1* %shallow
%.tmp3641 = icmp eq i1 %.tmp3640, 1
br i1 %.tmp3641, label %.if.true.3642, label %.if.false.3642
.if.true.3642:
%.tmp3643 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3644 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3645 = load i8*, i8** %name.3629
%.tmp3646 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*,%m2624$.AssignableInfo.type*) @m295$define_assignable.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp3643, %m972$.Node.type* %.tmp3644, i8* %.tmp3645, %m2624$.AssignableInfo.type* %.tmp3646)
br label %.if.end.3642
.if.false.3642:
%.tmp3647 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp3647, %m2624$.Type.type** %return_type.3359
%.tmp3648 = load %m2624$.Type.type*, %m2624$.Type.type** %return_type.3359
%.tmp3649 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3650 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3649, i32 0, i32 4
%.tmp3651 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3650
%.tmp3652 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp3651, i32 0, i32 3
%.tmp3653 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3652
call void(%m2624$.Type.type*,%m2624$.Type.type*) @m295$copy_type.v.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.tmp3648, %m2624$.Type.type* %.tmp3653)
%.tmp3654 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3655 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3654, i32 0, i32 1
%.tmp3656 = load %m0$.File.type*, %m0$.File.type** %.tmp3655
%.tmp3658 = getelementptr [14 x i8], [14 x i8]*@.str3657, i32 0, i32 0
%.tmp3659 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3660 = load %m2624$.Type.type*, %m2624$.Type.type** %return_type.3359
%.tmp3661 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp3659, %m2624$.Type.type* %.tmp3660)
%.tmp3662 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.3358
%.tmp3663 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp3662)
%.tmp3664 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3656, i8* %.tmp3658, i8* %.tmp3661, i8* %.tmp3663)
%.tmp3665 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3666 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3665, i32 0, i32 6
%.tmp3667 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3666
%.tmp3668 = call %m972$.Node.type*(%m972$.Node.type*) @m295$syn_function_params.m972$.Node.typep.m972$.Node.typep(%m972$.Node.type* %.tmp3667)
%params.3669 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp3668, %m972$.Node.type** %params.3669
%param_type.3670 = alloca %m2624$.Type.type*
store %m2624$.Type.type* null, %m2624$.Type.type** %param_type.3670
%.tmp3672 = load %m972$.Node.type*, %m972$.Node.type** %params.3669
%param_ptr.3673 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp3672, %m972$.Node.type** %param_ptr.3673
br label %.for.start.3671
.for.start.3671:
%.tmp3674 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3673
%.tmp3675 = icmp ne %m972$.Node.type* %.tmp3674, null
br i1 %.tmp3675, label %.for.continue.3671, label %.for.end.3671
.for.continue.3671:
%.tmp3676 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3673
%.tmp3677 = load %m972$.Node.type*, %m972$.Node.type** %params.3669
%.tmp3678 = icmp ne %m972$.Node.type* %.tmp3676, %.tmp3677
br i1 %.tmp3678, label %.if.true.3679, label %.if.false.3679
.if.true.3679:
%.tmp3680 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3673
%.tmp3681 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3680, i32 0, i32 7
%.tmp3682 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3681
store %m972$.Node.type* %.tmp3682, %m972$.Node.type** %param_ptr.3673
%.tmp3683 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3684 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3683, i32 0, i32 1
%.tmp3685 = load %m0$.File.type*, %m0$.File.type** %.tmp3684
%.tmp3687 = getelementptr [3 x i8], [3 x i8]*@.str3686, i32 0, i32 0
%.tmp3688 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3685, i8* %.tmp3687)
br label %.if.end.3679
.if.false.3679:
br label %.if.end.3679
.if.end.3679:
%.tmp3689 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3673
%.tmp3690 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3689, i32 0, i32 0
%.tmp3691 = load i8*, i8** %.tmp3690
%.tmp3693 = getelementptr [5 x i8], [5 x i8]*@.str3692, i32 0, i32 0
%.tmp3694 = call i32(i8*,i8*) @strcmp(i8* %.tmp3691, i8* %.tmp3693)
%.tmp3695 = icmp eq i32 %.tmp3694, 0
br i1 %.tmp3695, label %.if.true.3696, label %.if.false.3696
.if.true.3696:
%.tmp3697 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3698 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3673
%.tmp3699 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3698, i32 0, i32 6
%.tmp3700 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3699
%.tmp3701 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp3697, %m972$.Node.type* %.tmp3700)
store %m2624$.Type.type* %.tmp3701, %m2624$.Type.type** %param_type.3670
%.tmp3702 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3673
%.tmp3703 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3702, i32 0, i32 7
%.tmp3704 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3703
store %m972$.Node.type* %.tmp3704, %m972$.Node.type** %param_ptr.3673
br label %.if.end.3696
.if.false.3696:
br label %.if.end.3696
.if.end.3696:
%.tmp3705 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3706 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3705, i32 0, i32 1
%.tmp3707 = load %m0$.File.type*, %m0$.File.type** %.tmp3706
%.tmp3709 = getelementptr [13 x i8], [13 x i8]*@.str3708, i32 0, i32 0
%.tmp3710 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3711 = load %m2624$.Type.type*, %m2624$.Type.type** %param_type.3670
%.tmp3712 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp3710, %m2624$.Type.type* %.tmp3711)
%.tmp3713 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3673
%.tmp3714 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3713, i32 0, i32 1
%.tmp3715 = load i8*, i8** %.tmp3714
%.tmp3716 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3707, i8* %.tmp3709, i8* %.tmp3712, i8* %.tmp3715)
%.tmp3717 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3673
%.tmp3718 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3717, i32 0, i32 7
%.tmp3719 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3718
store %m972$.Node.type* %.tmp3719, %m972$.Node.type** %param_ptr.3673
br label %.for.start.3671
.for.end.3671:
%.tmp3720 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3721 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3720, i32 0, i32 1
%.tmp3722 = load %m0$.File.type*, %m0$.File.type** %.tmp3721
%.tmp3724 = getelementptr [5 x i8], [5 x i8]*@.str3723, i32 0, i32 0
%.tmp3725 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3722, i8* %.tmp3724)
%.tmp3726 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3728 = getelementptr [9 x i8], [9 x i8]*@.str3727, i32 0, i32 0
%.tmp3729 = bitcast ptr null to i8*
%.tmp3730 = bitcast ptr null to i8*
call void(%m2624$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2624$.CompilerCtx.typep.cp.cp.cp(%m2624$.CompilerCtx.type* %.tmp3726, i8* %.tmp3728, i8* %.tmp3729, i8* %.tmp3730)
%.tmp3731 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3732 = load %m972$.Node.type*, %m972$.Node.type** %params.3669
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_fn_params.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp3731, %m972$.Node.type* %.tmp3732)
%.tmp3733 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3734 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3733, i32 0, i32 6
%.tmp3735 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3734
%.tmp3737 = getelementptr [6 x i8], [6 x i8]*@.str3736, i32 0, i32 0
%.tmp3738 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp3735, i8* %.tmp3737)
%fn_block.3739 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp3738, %m972$.Node.type** %fn_block.3739
%.tmp3740 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3741 = load %m972$.Node.type*, %m972$.Node.type** %fn_block.3739
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_block.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp3740, %m972$.Node.type* %.tmp3741)
%.tmp3742 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
call void(%m2624$.CompilerCtx.type*) @m295$pop_scope.v.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp3742)
%.tmp3743 = bitcast ptr null to %m972$.Node.type*
%last_valid_instruction.3744 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp3743, %m972$.Node.type** %last_valid_instruction.3744
%.tmp3745 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3746 = load %m972$.Node.type*, %m972$.Node.type** %fn_block.3739
%.tmp3747 = load %m2624$.Type.type*, %m2624$.Type.type** %return_type.3359
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,%m2624$.Type.type*) @m295$check_n_add_implicit_return.v.m2624$.CompilerCtx.typep.m972$.Node.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp3745, %m972$.Node.type* %.tmp3746, %m2624$.Type.type* %.tmp3747)
%.tmp3748 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3749 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3748, i32 0, i32 1
%.tmp3750 = load %m0$.File.type*, %m0$.File.type** %.tmp3749
%.tmp3752 = getelementptr [3 x i8], [3 x i8]*@.str3751, i32 0, i32 0
%.tmp3753 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3750, i8* %.tmp3752)
br label %.if.end.3642
.if.end.3642:
br label %.if.end.3613
.if.false.3613:
%.tmp3754 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3755 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3754, i32 0, i32 0
%.tmp3756 = load i8*, i8** %.tmp3755
%.tmp3758 = getelementptr [7 x i8], [7 x i8]*@.str3757, i32 0, i32 0
%.tmp3759 = call i32(i8*,i8*) @strcmp(i8* %.tmp3756, i8* %.tmp3758)
%.tmp3760 = icmp eq i32 %.tmp3759, 0
br i1 %.tmp3760, label %.if.true.3761, label %.if.false.3761
.if.true.3761:
%.tmp3762 = load i1, i1* %shallow
%.tmp3763 = icmp eq i1 %.tmp3762, 1
br i1 %.tmp3763, label %.if.true.3764, label %.if.false.3764
.if.true.3764:
%.tmp3765 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3766 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3765, i32 0, i32 6
%.tmp3767 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3766
%.tmp3768 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3767, i32 0, i32 7
%.tmp3769 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3768
%.tmp3770 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3769, i32 0, i32 1
%.tmp3771 = load i8*, i8** %.tmp3770
%mod_name.3772 = alloca i8*
store i8* %.tmp3771, i8** %mod_name.3772
%.tmp3773 = load i8*, i8** %mod_name.3772
%.tmp3774 = call i32(i8*) @strlen(i8* %.tmp3773)
%mod_name_len.3775 = alloca i32
store i32 %.tmp3774, i32* %mod_name_len.3775
%.tmp3776 = load i32, i32* %mod_name_len.3775
%.tmp3777 = sub i32 %.tmp3776, 1
%.tmp3778 = call i8*(i32) @malloc(i32 %.tmp3777)
%trimmed_path.3779 = alloca i8*
store i8* %.tmp3778, i8** %trimmed_path.3779
%i.3781 = alloca i32
store i32 1, i32* %i.3781
br label %.for.start.3780
.for.start.3780:
%.tmp3782 = load i32, i32* %i.3781
%.tmp3783 = load i32, i32* %mod_name_len.3775
%.tmp3784 = sub i32 %.tmp3783, 1
%.tmp3785 = icmp slt i32 %.tmp3782, %.tmp3784
br i1 %.tmp3785, label %.for.continue.3780, label %.for.end.3780
.for.continue.3780:
%.tmp3786 = load i32, i32* %i.3781
%.tmp3787 = sub i32 %.tmp3786, 1
%.tmp3788 = load i8*, i8** %trimmed_path.3779
%.tmp3789 = getelementptr i8, i8* %.tmp3788, i32 %.tmp3787
%.tmp3790 = load i32, i32* %i.3781
%.tmp3791 = load i8*, i8** %mod_name.3772
%.tmp3792 = getelementptr i8, i8* %.tmp3791, i32 %.tmp3790
%.tmp3793 = load i8, i8* %.tmp3792
store i8 %.tmp3793, i8* %.tmp3789
%.tmp3794 = load i32, i32* %i.3781
%.tmp3795 = add i32 %.tmp3794, 1
store i32 %.tmp3795, i32* %i.3781
br label %.for.start.3780
.for.end.3780:
%.tmp3796 = load i32, i32* %mod_name_len.3775
%.tmp3797 = sub i32 %.tmp3796, 2
%.tmp3798 = load i8*, i8** %trimmed_path.3779
%.tmp3799 = getelementptr i8, i8* %.tmp3798, i32 %.tmp3797
store i8 0, i8* %.tmp3799
%.tmp3800 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3801 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3802 = load i8*, i8** %trimmed_path.3779
%.tmp3803 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$resolve_import_path.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp3800, %m972$.Node.type* %.tmp3801, i8* %.tmp3802)
%mod_abspath.3804 = alloca i8*
store i8* %.tmp3803, i8** %mod_abspath.3804
%.tmp3805 = load i8*, i8** %mod_abspath.3804
%.tmp3806 = call i8*(i32) @malloc(i32 4096)
%.tmp3807 = call i8*(i8*,i8*) @realpath(i8* %.tmp3805, i8* %.tmp3806)
%relpath.3808 = alloca i8*
store i8* %.tmp3807, i8** %relpath.3808
%.tmp3809 = load i8*, i8** %relpath.3808
%.tmp3810 = icmp eq i8* %.tmp3809, null
br i1 %.tmp3810, label %.if.true.3811, label %.if.false.3811
.if.true.3811:
%.tmp3812 = getelementptr i8*, i8** %err_buf.3360, i32 0
%.tmp3814 = getelementptr [54 x i8], [54 x i8]*@.str3813, i32 0, i32 0
%.tmp3815 = load i8*, i8** %mod_name.3772
%.tmp3816 = load i8*, i8** %mod_abspath.3804
%.tmp3817 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3812, i8* %.tmp3814, i8* %.tmp3815, i8* %.tmp3816)
%.tmp3818 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3819 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3820 = load i8*, i8** %err_buf.3360
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp3818, %m972$.Node.type* %.tmp3819, i8* %.tmp3820)
ret void
br label %.if.end.3811
.if.false.3811:
br label %.if.end.3811
.if.end.3811:
%.tmp3821 = load i8*, i8** %relpath.3808
store i8* %.tmp3821, i8** %mod_abspath.3804
%m.3822 = alloca %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* null, %m2624$.ModuleLookup.type** %m.3822
%.tmp3823 = bitcast ptr null to %m2624$.ModuleLookup.type*
%mod.3824 = alloca %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* %.tmp3823, %m2624$.ModuleLookup.type** %mod.3824
%.tmp3826 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3827 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3826, i32 0, i32 6
%.tmp3828 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %.tmp3827
store %m2624$.ModuleLookup.type* %.tmp3828, %m2624$.ModuleLookup.type** %m.3822
br label %.for.start.3825
.for.start.3825:
%.tmp3829 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.3822
%.tmp3830 = icmp ne %m2624$.ModuleLookup.type* %.tmp3829, null
%.tmp3831 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.3824
%.tmp3832 = icmp eq %m2624$.ModuleLookup.type* %.tmp3831, null
%.tmp3833 = and i1 %.tmp3830, %.tmp3832
br i1 %.tmp3833, label %.for.continue.3825, label %.for.end.3825
.for.continue.3825:
%.tmp3834 = load i8*, i8** %mod_abspath.3804
%.tmp3835 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.3822
%.tmp3836 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3835, i32 0, i32 0
%.tmp3837 = load i8*, i8** %.tmp3836
%.tmp3838 = call i32(i8*,i8*) @strcmp(i8* %.tmp3834, i8* %.tmp3837)
%.tmp3839 = icmp eq i32 %.tmp3838, 0
br i1 %.tmp3839, label %.if.true.3840, label %.if.false.3840
.if.true.3840:
%.tmp3841 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.3822
store %m2624$.ModuleLookup.type* %.tmp3841, %m2624$.ModuleLookup.type** %mod.3824
br label %.if.end.3840
.if.false.3840:
br label %.if.end.3840
.if.end.3840:
%.tmp3842 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.3822
%.tmp3843 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3842, i32 0, i32 2
%.tmp3844 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %.tmp3843
store %m2624$.ModuleLookup.type* %.tmp3844, %m2624$.ModuleLookup.type** %m.3822
br label %.for.start.3825
.for.end.3825:
%.tmp3845 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3846 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3845, i32 0, i32 6
%.tmp3847 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3846
%.tmp3848 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3847, i32 0, i32 7
%.tmp3849 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3848
%.tmp3850 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3849, i32 0, i32 7
%.tmp3851 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3850
%.tmp3852 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3851, i32 0, i32 7
%.tmp3853 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3852
%.tmp3854 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3853, i32 0, i32 1
%.tmp3855 = load i8*, i8** %.tmp3854
%asname.3856 = alloca i8*
store i8* %.tmp3855, i8** %asname.3856
%.tmp3857 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.3824
%.tmp3858 = icmp eq %m2624$.ModuleLookup.type* %.tmp3857, null
br i1 %.tmp3858, label %.if.true.3859, label %.if.false.3859
.if.true.3859:
%.tmp3860 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* null, i32 1
%.tmp3861 = ptrtoint %m2624$.ModuleLookup.type* %.tmp3860 to i32
%.tmp3862 = call i8*(i32) @malloc(i32 %.tmp3861)
%.tmp3863 = bitcast i8* %.tmp3862 to %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* %.tmp3863, %m2624$.ModuleLookup.type** %mod.3824
%.tmp3864 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.3824
%.tmp3865 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3864, i32 0, i32 0
%.tmp3866 = load i8*, i8** %mod_abspath.3804
store i8* %.tmp3866, i8** %.tmp3865
%.tmp3867 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.3824
%.tmp3868 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3867, i32 0, i32 2
store %m2624$.ModuleLookup.type* null, %m2624$.ModuleLookup.type** %.tmp3868
%.tmp3869 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.3824
%.tmp3870 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3869, i32 0, i32 3
store %m2624$.Scope.type* null, %m2624$.Scope.type** %.tmp3870
%.tmp3871 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.3824
%.tmp3872 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3871, i32 0, i32 1
%.tmp3873 = getelementptr i8*, i8** %.tmp3872, i32 0
%.tmp3875 = getelementptr [5 x i8], [5 x i8]*@.str3874, i32 0, i32 0
%.tmp3876 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3877 = call i32(%m2624$.CompilerCtx.type*) @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp3876)
%.tmp3878 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3873, i8* %.tmp3875, i32 %.tmp3877)
%.tmp3880 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3881 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3880, i32 0, i32 6
%.tmp3882 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %.tmp3881
store %m2624$.ModuleLookup.type* %.tmp3882, %m2624$.ModuleLookup.type** %m.3822
br label %.for.start.3879
.for.start.3879:
%.tmp3883 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.3822
%.tmp3884 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3883, i32 0, i32 2
%.tmp3885 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %.tmp3884
%.tmp3886 = icmp ne %m2624$.ModuleLookup.type* %.tmp3885, null
br i1 %.tmp3886, label %.for.continue.3879, label %.for.end.3879
.for.continue.3879:
%.tmp3887 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.3822
%.tmp3888 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3887, i32 0, i32 2
%.tmp3889 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %.tmp3888
store %m2624$.ModuleLookup.type* %.tmp3889, %m2624$.ModuleLookup.type** %m.3822
br label %.for.start.3879
.for.end.3879:
%.tmp3890 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %m.3822
%.tmp3891 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3890, i32 0, i32 2
%.tmp3892 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.3824
store %m2624$.ModuleLookup.type* %.tmp3892, %m2624$.ModuleLookup.type** %.tmp3891
%.tmp3893 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3894 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3895 = load i8*, i8** %asname.3856
%.tmp3896 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.3824
%.tmp3897 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3896, i32 0, i32 0
%.tmp3898 = load i8*, i8** %.tmp3897
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*,i8*) @m295$define_module.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.cp(%m2624$.CompilerCtx.type* %.tmp3893, %m972$.Node.type* %.tmp3894, i8* %.tmp3895, i8* %.tmp3898)
%.tmp3899 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3900 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3899, i32 0, i32 7
%.tmp3901 = load i8*, i8** %.tmp3900
%curr_mod.3902 = alloca i8*
store i8* %.tmp3901, i8** %curr_mod.3902
%.tmp3903 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3904 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3903, i32 0, i32 7
%.tmp3905 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.3824
%.tmp3906 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3905, i32 0, i32 0
%.tmp3907 = load i8*, i8** %.tmp3906
store i8* %.tmp3907, i8** %.tmp3904
%.tmp3908 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3909 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3910 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.3824
%.tmp3911 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3910, i32 0, i32 0
%.tmp3912 = load i8*, i8** %.tmp3911
%.tmp3913 = call i1(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$compile_file.b.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp3908, %m972$.Node.type* %.tmp3909, i8* %.tmp3912)
%.tmp3914 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3915 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3914, i32 0, i32 7
%.tmp3916 = load i8*, i8** %curr_mod.3902
store i8* %.tmp3916, i8** %.tmp3915
br label %.if.end.3859
.if.false.3859:
%.tmp3917 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3918 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3919 = load i8*, i8** %asname.3856
%.tmp3920 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.3824
%.tmp3921 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp3920, i32 0, i32 0
%.tmp3922 = load i8*, i8** %.tmp3921
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*,i8*) @m295$define_module.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.cp(%m2624$.CompilerCtx.type* %.tmp3917, %m972$.Node.type* %.tmp3918, i8* %.tmp3919, i8* %.tmp3922)
br label %.if.end.3859
.if.end.3859:
br label %.if.end.3764
.if.false.3764:
br label %.if.end.3764
.if.end.3764:
br label %.if.end.3761
.if.false.3761:
%.tmp3923 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3924 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3926 = getelementptr [40 x i8], [40 x i8]*@.str3925, i32 0, i32 0
%.tmp3927 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp3923, %m972$.Node.type* %.tmp3924, i8* %.tmp3926)
%.tmp3928 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3929 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3928, i32 0, i32 0
%.tmp3930 = load i8*, i8** %.tmp3929
%.tmp3931 = call i32(i8*,...) @printf(i8* %.tmp3927, i8* %.tmp3930)
br label %.if.end.3761
.if.end.3761:
br label %.if.end.3613
.if.end.3613:
br label %.if.end.3542
.if.end.3542:
br label %.if.end.3443
.if.end.3443:
br label %.if.end.3377
.if.end.3377:
br label %.if.end.3369
.if.end.3369:
ret void
}
define i8* @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf.3932 = alloca i8*
store i8* null, i8** %buf.3932
%.tmp3933 = getelementptr i8*, i8** %buf.3932, i32 0
%.tmp3935 = getelementptr [31 x i8], [31 x i8]*@.str3934, i32 0, i32 0
%.tmp3936 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3937 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp3936, i32 0, i32 7
%.tmp3938 = load i8*, i8** %.tmp3937
%.tmp3939 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3940 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3939, i32 0, i32 3
%.tmp3941 = load i32, i32* %.tmp3940
%.tmp3942 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp3943 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3942, i32 0, i32 4
%.tmp3944 = load i32, i32* %.tmp3943
%.tmp3945 = load i8*, i8** %msg
%.tmp3946 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3933, i8* %.tmp3935, i8* %.tmp3938, i32 %.tmp3941, i32 %.tmp3944, i8* %.tmp3945)
%.tmp3947 = load i8*, i8** %buf.3932
ret i8* %.tmp3947
}
define void @m295$compile_fn_params.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.fn_params.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%fn_params = alloca %m972$.Node.type*
store %m972$.Node.type* %.fn_params.arg, %m972$.Node.type** %fn_params
%param_type.3948 = alloca %m2624$.Type.type*
store %m2624$.Type.type* null, %m2624$.Type.type** %param_type.3948
%.tmp3950 = load %m972$.Node.type*, %m972$.Node.type** %fn_params
%param_ptr.3951 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp3950, %m972$.Node.type** %param_ptr.3951
br label %.for.start.3949
.for.start.3949:
%.tmp3952 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3951
%.tmp3953 = icmp ne %m972$.Node.type* %.tmp3952, null
br i1 %.tmp3953, label %.for.continue.3949, label %.for.end.3949
.for.continue.3949:
%.tmp3954 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3951
%.tmp3955 = load %m972$.Node.type*, %m972$.Node.type** %fn_params
%.tmp3956 = icmp ne %m972$.Node.type* %.tmp3954, %.tmp3955
br i1 %.tmp3956, label %.if.true.3957, label %.if.false.3957
.if.true.3957:
%.tmp3958 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3951
%.tmp3959 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3958, i32 0, i32 7
%.tmp3960 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3959
store %m972$.Node.type* %.tmp3960, %m972$.Node.type** %param_ptr.3951
br label %.if.end.3957
.if.false.3957:
br label %.if.end.3957
.if.end.3957:
%.tmp3961 = load %m972$.Node.type*, %m972$.Node.type** %fn_params
%.tmp3962 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp3961)
%param_info.3963 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp3962, %m2624$.AssignableInfo.type** %param_info.3963
%.tmp3964 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %param_info.3963
%.tmp3965 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3964, i32 0, i32 3
%.tmp3967 = getelementptr [9 x i8], [9 x i8]*@.str3966, i32 0, i32 0
store i8* %.tmp3967, i8** %.tmp3965
%.tmp3968 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3951
%.tmp3969 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3968, i32 0, i32 0
%.tmp3970 = load i8*, i8** %.tmp3969
%.tmp3972 = getelementptr [5 x i8], [5 x i8]*@.str3971, i32 0, i32 0
%.tmp3973 = call i32(i8*,i8*) @strcmp(i8* %.tmp3970, i8* %.tmp3972)
%.tmp3974 = icmp eq i32 %.tmp3973, 0
br i1 %.tmp3974, label %.if.true.3975, label %.if.false.3975
.if.true.3975:
%.tmp3976 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3977 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3951
%.tmp3978 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3977, i32 0, i32 6
%.tmp3979 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3978
%.tmp3980 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp3976, %m972$.Node.type* %.tmp3979)
store %m2624$.Type.type* %.tmp3980, %m2624$.Type.type** %param_type.3948
%.tmp3981 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3951
%.tmp3982 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3981, i32 0, i32 7
%.tmp3983 = load %m972$.Node.type*, %m972$.Node.type** %.tmp3982
store %m972$.Node.type* %.tmp3983, %m972$.Node.type** %param_ptr.3951
br label %.if.end.3975
.if.false.3975:
br label %.if.end.3975
.if.end.3975:
%.tmp3984 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %param_info.3963
%.tmp3985 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3984, i32 0, i32 4
%.tmp3986 = load %m2624$.Type.type*, %m2624$.Type.type** %param_type.3948
store %m2624$.Type.type* %.tmp3986, %m2624$.Type.type** %.tmp3985
%.tmp3987 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3951
%.tmp3988 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp3987, i32 0, i32 1
%.tmp3989 = load i8*, i8** %.tmp3988
%var_name.3990 = alloca i8*
store i8* %.tmp3989, i8** %var_name.3990
%.tmp3991 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %param_info.3963
%.tmp3992 = load i8, i8* @SCOPE_LOCAL
%.tmp3993 = load i8*, i8** %var_name.3990
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp3991, i8 %.tmp3992, i8* %.tmp3993)
%.tmp3994 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp3995 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %param_info.3963
%.tmp3996 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp3995, i32 0, i32 4
%.tmp3997 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp3996
%.tmp3998 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp3994, %m2624$.Type.type* %.tmp3997)
%param_info_tr.3999 = alloca i8*
store i8* %.tmp3998, i8** %param_info_tr.3999
%.tmp4000 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4001 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4000, i32 0, i32 1
%.tmp4002 = load %m0$.File.type*, %m0$.File.type** %.tmp4001
%.tmp4004 = getelementptr [16 x i8], [16 x i8]*@.str4003, i32 0, i32 0
%.tmp4005 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %param_info.3963
%.tmp4006 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4005)
%.tmp4007 = load i8*, i8** %param_info_tr.3999
%.tmp4008 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4002, i8* %.tmp4004, i8* %.tmp4006, i8* %.tmp4007)
%.tmp4009 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4010 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3951
%.tmp4011 = load i8*, i8** %var_name.3990
%.tmp4012 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %param_info.3963
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*,%m2624$.AssignableInfo.type*) @m295$define_assignable.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp4009, %m972$.Node.type* %.tmp4010, i8* %.tmp4011, %m2624$.AssignableInfo.type* %.tmp4012)
%.tmp4013 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4014 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4013, i32 0, i32 1
%.tmp4015 = load %m0$.File.type*, %m0$.File.type** %.tmp4014
%.tmp4017 = getelementptr [28 x i8], [28 x i8]*@.str4016, i32 0, i32 0
%.tmp4018 = load i8*, i8** %param_info_tr.3999
%.tmp4019 = load i8*, i8** %var_name.3990
%.tmp4020 = load i8*, i8** %param_info_tr.3999
%.tmp4021 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %param_info.3963
%.tmp4022 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4021)
%.tmp4023 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4015, i8* %.tmp4017, i8* %.tmp4018, i8* %.tmp4019, i8* %.tmp4020, i8* %.tmp4022)
%.tmp4024 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.3951
%.tmp4025 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4024, i32 0, i32 7
%.tmp4026 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4025
store %m972$.Node.type* %.tmp4026, %m972$.Node.type** %param_ptr.3951
br label %.for.start.3949
.for.end.3949:
ret void
}
define void @m295$compile_block.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%.tmp4027 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4029 = getelementptr [6 x i8], [6 x i8]*@.str4028, i32 0, i32 0
%.tmp4030 = bitcast ptr null to i8*
%.tmp4031 = bitcast ptr null to i8*
call void(%m2624$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2624$.CompilerCtx.typep.cp.cp.cp(%m2624$.CompilerCtx.type* %.tmp4027, i8* %.tmp4029, i8* %.tmp4030, i8* %.tmp4031)
%.tmp4032 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4033 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4032, i32 0, i32 6
%.tmp4034 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4033
%.tmp4036 = getelementptr [12 x i8], [12 x i8]*@.str4035, i32 0, i32 0
%.tmp4037 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp4034, i8* %.tmp4036)
%exprs.4038 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4037, %m972$.Node.type** %exprs.4038
%.tmp4039 = load %m972$.Node.type*, %m972$.Node.type** %exprs.4038
%.tmp4040 = icmp ne %m972$.Node.type* %.tmp4039, null
br i1 %.tmp4040, label %.if.true.4041, label %.if.false.4041
.if.true.4041:
%.tmp4043 = load %m972$.Node.type*, %m972$.Node.type** %exprs.4038
%.tmp4044 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4043, i32 0, i32 6
%.tmp4045 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4044
%b.4046 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4045, %m972$.Node.type** %b.4046
br label %.for.start.4042
.for.start.4042:
%.tmp4047 = load %m972$.Node.type*, %m972$.Node.type** %b.4046
%.tmp4048 = icmp ne %m972$.Node.type* %.tmp4047, null
br i1 %.tmp4048, label %.for.continue.4042, label %.for.end.4042
.for.continue.4042:
%.tmp4049 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4050 = load %m972$.Node.type*, %m972$.Node.type** %b.4046
%.tmp4051 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4050, i32 0, i32 6
%.tmp4052 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4051
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_expression.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp4049, %m972$.Node.type* %.tmp4052)
%.tmp4053 = load %m972$.Node.type*, %m972$.Node.type** %b.4046
%.tmp4054 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4053, i32 0, i32 7
%.tmp4055 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4054
store %m972$.Node.type* %.tmp4055, %m972$.Node.type** %b.4046
br label %.for.start.4042
.for.end.4042:
br label %.if.end.4041
.if.false.4041:
br label %.if.end.4041
.if.end.4041:
%.tmp4056 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
call void(%m2624$.CompilerCtx.type*) @m295$pop_scope.v.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp4056)
ret void
}
define %m2624$.AssignableInfo.type* @m295$get_struct_attr.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep.i(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp4057 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4058 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4059 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_addr.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp4057, %m972$.Node.type* %.tmp4058)
%val.4060 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4059, %m2624$.AssignableInfo.type** %val.4060
%.tmp4061 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %val.4060
%.tmp4062 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4061, i32 0, i32 4
%.tmp4063 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4062
%.tmp4064 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4063, i32 0, i32 0
%.tmp4065 = load i8*, i8** %.tmp4064
%.tmp4067 = getelementptr [7 x i8], [7 x i8]*@.str4066, i32 0, i32 0
%.tmp4068 = call i32(i8*,i8*) @strcmp(i8* %.tmp4065, i8* %.tmp4067)
%.tmp4069 = icmp ne i32 %.tmp4068, 0
br i1 %.tmp4069, label %.if.true.4070, label %.if.false.4070
.if.true.4070:
%.tmp4072 = getelementptr [7 x i8], [7 x i8]*@.str4071, i32 0, i32 0
%.tmp4073 = call i32(i8*,...) @printf(i8* %.tmp4072)
%.tmp4074 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp4074
br label %.if.end.4070
.if.false.4070:
br label %.if.end.4070
.if.end.4070:
%.tmp4075 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %val.4060
%.tmp4076 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4075, i32 0, i32 4
%.tmp4077 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4076
%.tmp4078 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4077, i32 0, i32 3
%.tmp4079 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4078
%node_type.4080 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp4079, %m2624$.Type.type** %node_type.4080
%i.4082 = alloca i32
store i32 0, i32* %i.4082
br label %.for.start.4081
.for.start.4081:
%.tmp4083 = load i32, i32* %i.4082
%.tmp4084 = load i32, i32* %attr_id
%.tmp4085 = icmp slt i32 %.tmp4083, %.tmp4084
br i1 %.tmp4085, label %.for.continue.4081, label %.for.end.4081
.for.continue.4081:
%.tmp4086 = load %m2624$.Type.type*, %m2624$.Type.type** %node_type.4080
%.tmp4087 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4086, i32 0, i32 4
%.tmp4088 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4087
store %m2624$.Type.type* %.tmp4088, %m2624$.Type.type** %node_type.4080
%.tmp4089 = load i32, i32* %i.4082
%.tmp4090 = add i32 %.tmp4089, 1
store i32 %.tmp4090, i32* %i.4082
br label %.for.start.4081
.for.end.4081:
%.tmp4091 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4092 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp4091)
%info.4093 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4092, %m2624$.AssignableInfo.type** %info.4093
%.tmp4094 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4093
%.tmp4095 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4094, i32 0, i32 4
%.tmp4096 = load %m2624$.Type.type*, %m2624$.Type.type** %node_type.4080
store %m2624$.Type.type* %.tmp4096, %m2624$.Type.type** %.tmp4095
%.tmp4097 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4098 = call i32(%m2624$.CompilerCtx.type*) @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp4097)
%tmp_id.4099 = alloca i32
store i32 %.tmp4098, i32* %tmp_id.4099
%.tmp4100 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4101 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %val.4060
%.tmp4102 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4101, i32 0, i32 4
%.tmp4103 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4102
%.tmp4104 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4100, %m2624$.Type.type* %.tmp4103)
%type_as_str.4105 = alloca i8*
store i8* %.tmp4104, i8** %type_as_str.4105
%.tmp4106 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4107 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4093
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp4106, %m2624$.AssignableInfo.type* %.tmp4107)
%.tmp4108 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4109 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4108, i32 0, i32 1
%.tmp4110 = load %m0$.File.type*, %m0$.File.type** %.tmp4109
%.tmp4112 = getelementptr [52 x i8], [52 x i8]*@.str4111, i32 0, i32 0
%.tmp4113 = load i32, i32* %tmp_id.4099
%.tmp4114 = load i8*, i8** %type_as_str.4105
%.tmp4115 = load i8*, i8** %type_as_str.4105
%.tmp4116 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %val.4060
%.tmp4117 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4116)
%.tmp4118 = load i32, i32* %attr_id
%.tmp4119 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4110, i8* %.tmp4112, i32 %.tmp4113, i8* %.tmp4114, i8* %.tmp4115, i8* %.tmp4117, i32 %.tmp4118)
%.tmp4120 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4121 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4120, i32 0, i32 1
%.tmp4122 = load %m0$.File.type*, %m0$.File.type** %.tmp4121
%.tmp4124 = getelementptr [28 x i8], [28 x i8]*@.str4123, i32 0, i32 0
%.tmp4125 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4093
%.tmp4126 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4125)
%.tmp4127 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4128 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4093
%.tmp4129 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4128, i32 0, i32 4
%.tmp4130 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4129
%.tmp4131 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4127, %m2624$.Type.type* %.tmp4130)
%.tmp4132 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4133 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4093
%.tmp4134 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4133, i32 0, i32 4
%.tmp4135 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4134
%.tmp4136 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4132, %m2624$.Type.type* %.tmp4135)
%.tmp4137 = load i32, i32* %tmp_id.4099
%.tmp4138 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4122, i8* %.tmp4124, i8* %.tmp4126, i8* %.tmp4131, i8* %.tmp4136, i32 %.tmp4137)
%.tmp4139 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4093
ret %m2624$.AssignableInfo.type* %.tmp4139
}
define void @m295$set_struct_attr.v.m2624$.CompilerCtx.typep.m972$.Node.typep.i.cp(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg, i32 %.attr_id.arg, i8* %.attr.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%attr = alloca i8*
store i8* %.attr.arg, i8** %attr
%.tmp4140 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4141 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4142 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_addr.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp4140, %m972$.Node.type* %.tmp4141)
%val.4143 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4142, %m2624$.AssignableInfo.type** %val.4143
%.tmp4144 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %val.4143
%.tmp4145 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4144, i32 0, i32 4
%.tmp4146 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4145
%.tmp4147 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4146, i32 0, i32 0
%.tmp4148 = load i8*, i8** %.tmp4147
%.tmp4150 = getelementptr [7 x i8], [7 x i8]*@.str4149, i32 0, i32 0
%.tmp4151 = call i32(i8*,i8*) @strcmp(i8* %.tmp4148, i8* %.tmp4150)
%.tmp4152 = icmp ne i32 %.tmp4151, 0
br i1 %.tmp4152, label %.if.true.4153, label %.if.false.4153
.if.true.4153:
%.tmp4155 = getelementptr [7 x i8], [7 x i8]*@.str4154, i32 0, i32 0
%.tmp4156 = call i32(i8*,...) @printf(i8* %.tmp4155)
ret void
br label %.if.end.4153
.if.false.4153:
br label %.if.end.4153
.if.end.4153:
%.tmp4157 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %val.4143
%.tmp4158 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4157, i32 0, i32 4
%.tmp4159 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4158
%.tmp4160 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4159, i32 0, i32 3
%.tmp4161 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4160
%node_type.4162 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp4161, %m2624$.Type.type** %node_type.4162
%i.4164 = alloca i32
store i32 0, i32* %i.4164
br label %.for.start.4163
.for.start.4163:
%.tmp4165 = load i32, i32* %i.4164
%.tmp4166 = load i32, i32* %attr_id
%.tmp4167 = icmp slt i32 %.tmp4165, %.tmp4166
br i1 %.tmp4167, label %.for.continue.4163, label %.for.end.4163
.for.continue.4163:
%.tmp4168 = load %m2624$.Type.type*, %m2624$.Type.type** %node_type.4162
%.tmp4169 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4168, i32 0, i32 4
%.tmp4170 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4169
store %m2624$.Type.type* %.tmp4170, %m2624$.Type.type** %node_type.4162
%.tmp4171 = load i32, i32* %i.4164
%.tmp4172 = add i32 %.tmp4171, 1
store i32 %.tmp4172, i32* %i.4164
br label %.for.start.4163
.for.end.4163:
%.tmp4173 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4174 = call i32(%m2624$.CompilerCtx.type*) @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp4173)
%tmp_id.4175 = alloca i32
store i32 %.tmp4174, i32* %tmp_id.4175
%.tmp4176 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4177 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %val.4143
%.tmp4178 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4177, i32 0, i32 4
%.tmp4179 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4178
%.tmp4180 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4176, %m2624$.Type.type* %.tmp4179)
%type_as_str.4181 = alloca i8*
store i8* %.tmp4180, i8** %type_as_str.4181
%.tmp4182 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4183 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4182, i32 0, i32 1
%.tmp4184 = load %m0$.File.type*, %m0$.File.type** %.tmp4183
%.tmp4186 = getelementptr [52 x i8], [52 x i8]*@.str4185, i32 0, i32 0
%.tmp4187 = load i32, i32* %tmp_id.4175
%.tmp4188 = load i8*, i8** %type_as_str.4181
%.tmp4189 = load i8*, i8** %type_as_str.4181
%.tmp4190 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %val.4143
%.tmp4191 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4190)
%.tmp4192 = load i32, i32* %attr_id
%.tmp4193 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4184, i8* %.tmp4186, i32 %.tmp4187, i8* %.tmp4188, i8* %.tmp4189, i8* %.tmp4191, i32 %.tmp4192)
%.tmp4194 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4195 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4194, i32 0, i32 1
%.tmp4196 = load %m0$.File.type*, %m0$.File.type** %.tmp4195
%.tmp4198 = getelementptr [18 x i8], [18 x i8]*@.str4197, i32 0, i32 0
%.tmp4199 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4200 = load %m2624$.Type.type*, %m2624$.Type.type** %node_type.4162
%.tmp4201 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4199, %m2624$.Type.type* %.tmp4200)
%.tmp4202 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4203 = load %m2624$.Type.type*, %m2624$.Type.type** %node_type.4162
%.tmp4204 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4202, %m2624$.Type.type* %.tmp4203)
%.tmp4205 = load i8*, i8** %attr
%.tmp4206 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4196, i8* %.tmp4198, i8* %.tmp4201, i8* %.tmp4204, i8* %.tmp4205)
ret void
}
define %m2624$.AssignableInfo.type* @m295$compile_builtin.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%.tmp4207 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4208 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4207, i32 0, i32 6
%.tmp4209 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4208
%.tmp4210 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4209, i32 0, i32 6
%.tmp4211 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4210
%dotted.4212 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4211, %m972$.Node.type** %dotted.4212
%.tmp4213 = load %m972$.Node.type*, %m972$.Node.type** %dotted.4212
%.tmp4214 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4213, i32 0, i32 7
%.tmp4215 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4214
%.tmp4216 = icmp ne %m972$.Node.type* %.tmp4215, null
br i1 %.tmp4216, label %.if.true.4217, label %.if.false.4217
.if.true.4217:
%.tmp4218 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp4218
br label %.if.end.4217
.if.false.4217:
br label %.if.end.4217
.if.end.4217:
%.tmp4219 = load %m972$.Node.type*, %m972$.Node.type** %dotted.4212
%.tmp4220 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4219, i32 0, i32 1
%.tmp4221 = load i8*, i8** %.tmp4220
%.tmp4223 = getelementptr [7 x i8], [7 x i8]*@.str4222, i32 0, i32 0
%.tmp4224 = call i32(i8*,i8*) @strcmp(i8* %.tmp4221, i8* %.tmp4223)
%.tmp4225 = icmp eq i32 %.tmp4224, 0
br i1 %.tmp4225, label %.if.true.4226, label %.if.false.4226
.if.true.4226:
%.tmp4227 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4229 = getelementptr [8 x i8], [8 x i8]*@.str4228, i32 0, i32 0
%.tmp4230 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp4227, i8* %.tmp4229)
%args.4231 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4230, %m972$.Node.type** %args.4231
%.tmp4232 = load %m972$.Node.type*, %m972$.Node.type** %args.4231
%.tmp4233 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4232, i32 0, i32 6
%.tmp4234 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4233
%.tmp4236 = getelementptr [11 x i8], [11 x i8]*@.str4235, i32 0, i32 0
%.tmp4237 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp4234, i8* %.tmp4236)
%value.4238 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4237, %m972$.Node.type** %value.4238
%.tmp4239 = load %m972$.Node.type*, %m972$.Node.type** %value.4238
%.tmp4240 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4239, i32 0, i32 6
%.tmp4241 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4240
%.tmp4242 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4241, i32 0, i32 6
%.tmp4243 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4242
%.tmp4244 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4243, i32 0, i32 6
%.tmp4245 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4244
%.tmp4246 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4245, i32 0, i32 6
%.tmp4247 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4246
store %m972$.Node.type* %.tmp4247, %m972$.Node.type** %value.4238
%.tmp4248 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4249 = call i32(%m2624$.CompilerCtx.type*) @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp4248)
%tmp_id.4250 = alloca i32
store i32 %.tmp4249, i32* %tmp_id.4250
%.tmp4251 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4252 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp4251)
%info.4253 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4252, %m2624$.AssignableInfo.type** %info.4253
%.tmp4254 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4255 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4253
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp4254, %m2624$.AssignableInfo.type* %.tmp4255)
%.tmp4256 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4253
%.tmp4257 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4256, i32 0, i32 4
%.tmp4258 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp4258, %m2624$.Type.type** %.tmp4257
%.tmp4259 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4253
%.tmp4260 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4259, i32 0, i32 4
%.tmp4261 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4260
%.tmp4262 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4261, i32 0, i32 0
%.tmp4264 = getelementptr [4 x i8], [4 x i8]*@.str4263, i32 0, i32 0
store i8* %.tmp4264, i8** %.tmp4262
%.tmp4265 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4266 = load %m972$.Node.type*, %m972$.Node.type** %value.4238
%.tmp4267 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp4265, %m972$.Node.type* %.tmp4266)
%inspected_type.4268 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp4267, %m2624$.Type.type** %inspected_type.4268
%.tmp4269 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4270 = load %m2624$.Type.type*, %m2624$.Type.type** %inspected_type.4268
%.tmp4271 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4269, %m2624$.Type.type* %.tmp4270)
%type_as_str.4272 = alloca i8*
store i8* %.tmp4271, i8** %type_as_str.4272
%.tmp4273 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4274 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4273, i32 0, i32 1
%.tmp4275 = load %m0$.File.type*, %m0$.File.type** %.tmp4274
%.tmp4277 = getelementptr [46 x i8], [46 x i8]*@.str4276, i32 0, i32 0
%.tmp4278 = load i32, i32* %tmp_id.4250
%.tmp4279 = load i8*, i8** %type_as_str.4272
%.tmp4280 = load i8*, i8** %type_as_str.4272
%.tmp4281 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4275, i8* %.tmp4277, i32 %.tmp4278, i8* %.tmp4279, i8* %.tmp4280)
%.tmp4282 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4283 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4282, i32 0, i32 1
%.tmp4284 = load %m0$.File.type*, %m0$.File.type** %.tmp4283
%.tmp4286 = getelementptr [35 x i8], [35 x i8]*@.str4285, i32 0, i32 0
%.tmp4287 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4253
%.tmp4288 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4287)
%.tmp4289 = load i8*, i8** %type_as_str.4272
%.tmp4290 = load i32, i32* %tmp_id.4250
%.tmp4291 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4284, i8* %.tmp4286, i8* %.tmp4288, i8* %.tmp4289, i32 %.tmp4290)
%.tmp4292 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4253
ret %m2624$.AssignableInfo.type* %.tmp4292
br label %.if.end.4226
.if.false.4226:
%.tmp4293 = load %m972$.Node.type*, %m972$.Node.type** %dotted.4212
%.tmp4294 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4293, i32 0, i32 1
%.tmp4295 = load i8*, i8** %.tmp4294
%.tmp4297 = getelementptr [7 x i8], [7 x i8]*@.str4296, i32 0, i32 0
%.tmp4298 = call i32(i8*,i8*) @strcmp(i8* %.tmp4295, i8* %.tmp4297)
%.tmp4299 = icmp eq i32 %.tmp4298, 0
br i1 %.tmp4299, label %.if.true.4300, label %.if.false.4300
.if.true.4300:
%.tmp4301 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4303 = getelementptr [8 x i8], [8 x i8]*@.str4302, i32 0, i32 0
%.tmp4304 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp4301, i8* %.tmp4303)
%args.4305 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4304, %m972$.Node.type** %args.4305
%.tmp4306 = load %m972$.Node.type*, %m972$.Node.type** %args.4305
%.tmp4307 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4306, i32 0, i32 6
%.tmp4308 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4307
%.tmp4310 = getelementptr [11 x i8], [11 x i8]*@.str4309, i32 0, i32 0
%.tmp4311 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp4308, i8* %.tmp4310)
%array.4312 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4311, %m972$.Node.type** %array.4312
%.tmp4313 = load %m972$.Node.type*, %m972$.Node.type** %array.4312
%.tmp4314 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4313, i32 0, i32 7
%.tmp4315 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4314
%.tmp4317 = getelementptr [11 x i8], [11 x i8]*@.str4316, i32 0, i32 0
%.tmp4318 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp4315, i8* %.tmp4317)
%value.4319 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4318, %m972$.Node.type** %value.4319
%.tmp4320 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4321 = load %m972$.Node.type*, %m972$.Node.type** %value.4319
%.tmp4322 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_assignable.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp4320, %m972$.Node.type* %.tmp4321)
%value_info.4323 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4322, %m2624$.AssignableInfo.type** %value_info.4323
%.tmp4324 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4325 = load %m972$.Node.type*, %m972$.Node.type** %array.4312
%.tmp4326 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_addr.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp4324, %m972$.Node.type* %.tmp4325)
%array_info.4327 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4326, %m2624$.AssignableInfo.type** %array_info.4327
%.tmp4328 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4329 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp4328)
%info.4330 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4329, %m2624$.AssignableInfo.type** %info.4330
%.tmp4331 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4332 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4330
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp4331, %m2624$.AssignableInfo.type* %.tmp4332)
%.tmp4333 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4330
%.tmp4334 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4333, i32 0, i32 4
%.tmp4335 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %array_info.4327
%.tmp4336 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4335, i32 0, i32 4
%.tmp4337 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4336
store %m2624$.Type.type* %.tmp4337, %m2624$.Type.type** %.tmp4334
%builtin_prefix.4338 = alloca i8*
store i8* null, i8** %builtin_prefix.4338
%.tmp4339 = getelementptr i8*, i8** %builtin_prefix.4338, i32 0
%.tmp4341 = getelementptr [5 x i8], [5 x i8]*@.str4340, i32 0, i32 0
%.tmp4342 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4343 = call i32(%m2624$.CompilerCtx.type*) @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp4342)
%.tmp4344 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4339, i8* %.tmp4341, i32 %.tmp4343)
%.tmp4345 = call i8*() @m2175$append_tmpl.cp()
%tmpl.4346 = alloca i8*
store i8* %.tmp4345, i8** %tmpl.4346
%.tmp4347 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4348 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4347, i32 0, i32 1
%.tmp4349 = load %m0$.File.type*, %m0$.File.type** %.tmp4348
%.tmp4350 = load i8*, i8** %tmpl.4346
%.tmp4351 = load i8*, i8** %builtin_prefix.4338
%.tmp4352 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4353 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %array_info.4327
%.tmp4354 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4353, i32 0, i32 4
%.tmp4355 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4354
%.tmp4356 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4352, %m2624$.Type.type* %.tmp4355)
%.tmp4357 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %array_info.4327
%.tmp4358 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4357)
%.tmp4359 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4360 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %value_info.4323
%.tmp4361 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4360, i32 0, i32 4
%.tmp4362 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4361
%.tmp4363 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4359, %m2624$.Type.type* %.tmp4362)
%.tmp4364 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %value_info.4323
%.tmp4365 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4364)
%.tmp4366 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4330
%.tmp4367 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4366)
%.tmp4368 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4349, i8* %.tmp4350, i8* %.tmp4351, i8* %.tmp4356, i8* %.tmp4358, i8* %.tmp4363, i8* %.tmp4365, i8* %.tmp4367)
%.tmp4369 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4370 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp4369)
%info_g.4371 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4370, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4372 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4373 = load i8, i8* @SCOPE_GLOBAL
%.tmp4375 = getelementptr [8 x i8], [8 x i8]*@.str4374, i32 0, i32 0
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp4372, i8 %.tmp4373, i8* %.tmp4375)
%.tmp4376 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4377 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4376, i32 0, i32 4
%.tmp4378 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp4378, %m2624$.Type.type** %.tmp4377
%.tmp4379 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4380 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4379, i32 0, i32 4
%.tmp4381 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4380
%.tmp4382 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4381, i32 0, i32 0
%.tmp4384 = getelementptr [9 x i8], [9 x i8]*@.str4383, i32 0, i32 0
store i8* %.tmp4384, i8** %.tmp4382
%.tmp4385 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4386 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4385, i32 0, i32 4
%.tmp4387 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4386
%.tmp4388 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4387, i32 0, i32 3
%.tmp4389 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp4389, %m2624$.Type.type** %.tmp4388
%.tmp4390 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4391 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4390, i32 0, i32 4
%.tmp4392 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4391
%.tmp4393 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4392, i32 0, i32 3
%.tmp4394 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4393
%.tmp4395 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4394, i32 0, i32 0
%.tmp4397 = getelementptr [4 x i8], [4 x i8]*@.str4396, i32 0, i32 0
store i8* %.tmp4397, i8** %.tmp4395
%.tmp4398 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4399 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4398, i32 0, i32 4
%.tmp4400 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4399
%.tmp4401 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4400, i32 0, i32 3
%.tmp4402 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4401
%.tmp4403 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4402, i32 0, i32 3
%.tmp4404 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp4404, %m2624$.Type.type** %.tmp4403
%.tmp4405 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4406 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4405, i32 0, i32 4
%.tmp4407 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4406
%.tmp4408 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4407, i32 0, i32 3
%.tmp4409 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4408
%.tmp4410 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4409, i32 0, i32 3
%.tmp4411 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4410
%.tmp4412 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4411, i32 0, i32 0
%.tmp4414 = getelementptr [4 x i8], [4 x i8]*@.str4413, i32 0, i32 0
store i8* %.tmp4414, i8** %.tmp4412
%.tmp4415 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4416 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4415, i32 0, i32 4
%.tmp4417 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4416
%.tmp4418 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4417, i32 0, i32 3
%.tmp4419 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4418
%.tmp4420 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4419, i32 0, i32 4
%.tmp4421 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp4421, %m2624$.Type.type** %.tmp4420
%.tmp4422 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4423 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4422, i32 0, i32 4
%.tmp4424 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4423
%.tmp4425 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4424, i32 0, i32 3
%.tmp4426 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4425
%.tmp4427 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4426, i32 0, i32 4
%.tmp4428 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4427
%.tmp4429 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4428, i32 0, i32 0
%.tmp4431 = getelementptr [4 x i8], [4 x i8]*@.str4430, i32 0, i32 0
store i8* %.tmp4431, i8** %.tmp4429
%.tmp4432 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4433 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4432, i32 0, i32 4
%.tmp4434 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4433
%.tmp4435 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4434, i32 0, i32 3
%.tmp4436 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4435
%.tmp4437 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4436, i32 0, i32 4
%.tmp4438 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4437
%.tmp4439 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4438, i32 0, i32 3
%.tmp4440 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp4440, %m2624$.Type.type** %.tmp4439
%.tmp4441 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4442 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4441, i32 0, i32 4
%.tmp4443 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4442
%.tmp4444 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4443, i32 0, i32 3
%.tmp4445 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4444
%.tmp4446 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4445, i32 0, i32 4
%.tmp4447 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4446
%.tmp4448 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4447, i32 0, i32 3
%.tmp4449 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4448
%.tmp4450 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4449, i32 0, i32 0
%.tmp4452 = getelementptr [4 x i8], [4 x i8]*@.str4451, i32 0, i32 0
store i8* %.tmp4452, i8** %.tmp4450
%.tmp4453 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4454 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4453, i32 0, i32 4
%.tmp4455 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4454
%.tmp4456 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4455, i32 0, i32 3
%.tmp4457 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4456
%.tmp4458 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4457, i32 0, i32 4
%.tmp4459 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4458
%.tmp4460 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4459, i32 0, i32 4
%.tmp4461 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp4461, %m2624$.Type.type** %.tmp4460
%.tmp4462 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
%.tmp4463 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4462, i32 0, i32 4
%.tmp4464 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4463
%.tmp4465 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4464, i32 0, i32 3
%.tmp4466 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4465
%.tmp4467 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4466, i32 0, i32 4
%.tmp4468 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4467
%.tmp4469 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4468, i32 0, i32 4
%.tmp4470 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4469
%.tmp4471 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4470, i32 0, i32 0
%.tmp4473 = getelementptr [4 x i8], [4 x i8]*@.str4472, i32 0, i32 0
store i8* %.tmp4473, i8** %.tmp4471
%.tmp4474 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4476 = getelementptr [8 x i8], [8 x i8]*@.str4475, i32 0, i32 0
%.tmp4478 = getelementptr [7 x i8], [7 x i8]*@.str4477, i32 0, i32 0
%.tmp4479 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_g.4371
call void(%m2624$.CompilerCtx.type*,i8*,i8*,%m2624$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2624$.CompilerCtx.typep.cp.cp.m2624$.AssignableInfo.typep.b.b(%m2624$.CompilerCtx.type* %.tmp4474, i8* %.tmp4476, i8* %.tmp4478, %m2624$.AssignableInfo.type* %.tmp4479, i1 1, i1 0)
%.tmp4480 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4330
ret %m2624$.AssignableInfo.type* %.tmp4480
br label %.if.end.4300
.if.false.4300:
%.tmp4481 = load %m972$.Node.type*, %m972$.Node.type** %dotted.4212
%.tmp4482 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4481, i32 0, i32 1
%.tmp4483 = load i8*, i8** %.tmp4482
%.tmp4485 = getelementptr [4 x i8], [4 x i8]*@.str4484, i32 0, i32 0
%.tmp4486 = call i32(i8*,i8*) @strcmp(i8* %.tmp4483, i8* %.tmp4485)
%.tmp4487 = icmp eq i32 %.tmp4486, 0
br i1 %.tmp4487, label %.if.true.4488, label %.if.false.4488
.if.true.4488:
%.tmp4489 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4491 = getelementptr [8 x i8], [8 x i8]*@.str4490, i32 0, i32 0
%.tmp4492 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp4489, i8* %.tmp4491)
%args.4493 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4492, %m972$.Node.type** %args.4493
%.tmp4494 = load %m972$.Node.type*, %m972$.Node.type** %args.4493
%.tmp4495 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4494, i32 0, i32 6
%.tmp4496 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4495
%.tmp4498 = getelementptr [11 x i8], [11 x i8]*@.str4497, i32 0, i32 0
%.tmp4499 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp4496, i8* %.tmp4498)
%value.4500 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4499, %m972$.Node.type** %value.4500
%.tmp4501 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4502 = load %m972$.Node.type*, %m972$.Node.type** %value.4500
%.tmp4503 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i32) @m295$get_struct_attr.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep.i(%m2624$.CompilerCtx.type* %.tmp4501, %m972$.Node.type* %.tmp4502, i32 1)
ret %m2624$.AssignableInfo.type* %.tmp4503
br label %.if.end.4488
.if.false.4488:
br label %.if.end.4488
.if.end.4488:
br label %.if.end.4300
.if.end.4300:
br label %.if.end.4226
.if.end.4226:
%.tmp4504 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp4504
}
define i8* @m295$resolve_import_path.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp4506 = getelementptr [1 x i8], [1 x i8]*@.str4505, i32 0, i32 0
%err_buf.4507 = alloca i8*
store i8* %.tmp4506, i8** %err_buf.4507
%.tmp4508 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4509 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4508, i32 0, i32 7
%.tmp4510 = load i8*, i8** %.tmp4509
%mod_abspath.4511 = alloca i8*
store i8* %.tmp4510, i8** %mod_abspath.4511
%.tmp4512 = load i8*, i8** %mod_abspath.4511
%.tmp4513 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp4512)
%dirname.4514 = alloca i8*
store i8* %.tmp4513, i8** %dirname.4514
%.tmp4515 = load i8*, i8** %import_str
%.tmp4516 = getelementptr i8, i8* %.tmp4515, i32 0
%.tmp4517 = load i8, i8* %.tmp4516
%.tmp4518 = icmp eq i8 %.tmp4517, 47
br i1 %.tmp4518, label %.if.true.4519, label %.if.false.4519
.if.true.4519:
%.tmp4520 = getelementptr i8*, i8** %err_buf.4507, i32 0
%.tmp4522 = getelementptr [46 x i8], [46 x i8]*@.str4521, i32 0, i32 0
%.tmp4523 = load i8*, i8** %import_str
%.tmp4524 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4520, i8* %.tmp4522, i8* %.tmp4523)
%.tmp4525 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4526 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4527 = load i8*, i8** %err_buf.4507
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp4525, %m972$.Node.type* %.tmp4526, i8* %.tmp4527)
%.tmp4528 = bitcast ptr null to i8*
ret i8* %.tmp4528
br label %.if.end.4519
.if.false.4519:
br label %.if.end.4519
.if.end.4519:
%.tmp4529 = load i8*, i8** %import_str
%.tmp4530 = getelementptr i8, i8* %.tmp4529, i32 0
%.tmp4531 = load i8, i8* %.tmp4530
%.tmp4532 = icmp ne i8 %.tmp4531, 46
%.tmp4533 = load i8*, i8** %import_str
%.tmp4534 = getelementptr i8, i8* %.tmp4533, i32 1
%.tmp4535 = load i8, i8* %.tmp4534
%.tmp4536 = icmp ne i8 %.tmp4535, 47
%.tmp4537 = and i1 %.tmp4532, %.tmp4536
br i1 %.tmp4537, label %.if.true.4538, label %.if.false.4538
.if.true.4538:
%.tmp4539 = call i8*() @m295$get_root.cp()
%root.4540 = alloca i8*
store i8* %.tmp4539, i8** %root.4540
%.tmp4541 = getelementptr i8*, i8** %mod_abspath.4511, i32 0
%.tmp4543 = getelementptr [13 x i8], [13 x i8]*@.str4542, i32 0, i32 0
%.tmp4544 = load i8*, i8** %root.4540
%.tmp4545 = load i8*, i8** %import_str
%.tmp4546 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4541, i8* %.tmp4543, i8* %.tmp4544, i8* %.tmp4545)
br label %.if.end.4538
.if.false.4538:
%.tmp4547 = load i8*, i8** %dirname.4514
%.tmp4549 = getelementptr [1 x i8], [1 x i8]*@.str4548, i32 0, i32 0
%.tmp4550 = call i32(i8*,i8*) @strcmp(i8* %.tmp4547, i8* %.tmp4549)
%.tmp4551 = icmp eq i32 %.tmp4550, 0
br i1 %.tmp4551, label %.if.true.4552, label %.if.false.4552
.if.true.4552:
%.tmp4553 = getelementptr i8*, i8** %mod_abspath.4511, i32 0
%.tmp4555 = getelementptr [6 x i8], [6 x i8]*@.str4554, i32 0, i32 0
%.tmp4556 = load i8*, i8** %import_str
%.tmp4557 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4553, i8* %.tmp4555, i8* %.tmp4556)
br label %.if.end.4552
.if.false.4552:
%.tmp4558 = getelementptr i8*, i8** %mod_abspath.4511, i32 0
%.tmp4560 = getelementptr [9 x i8], [9 x i8]*@.str4559, i32 0, i32 0
%.tmp4561 = load i8*, i8** %dirname.4514
%.tmp4562 = load i8*, i8** %import_str
%.tmp4563 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4558, i8* %.tmp4560, i8* %.tmp4561, i8* %.tmp4562)
br label %.if.end.4552
.if.end.4552:
br label %.if.end.4538
.if.end.4538:
%.tmp4564 = load i8*, i8** %mod_abspath.4511
ret i8* %.tmp4564
}
define %m2624$.AssignableInfo.type* @m295$compile_fn_call.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%.tmp4565 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4566 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4567 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_builtin.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp4565, %m972$.Node.type* %.tmp4566)
%info.4568 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4567, %m2624$.AssignableInfo.type** %info.4568
%.tmp4569 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4570 = icmp ne %m2624$.AssignableInfo.type* %.tmp4569, null
br i1 %.tmp4570, label %.if.true.4571, label %.if.false.4571
.if.true.4571:
%.tmp4572 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
ret %m2624$.AssignableInfo.type* %.tmp4572
br label %.if.end.4571
.if.false.4571:
br label %.if.end.4571
.if.end.4571:
%.tmp4573 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4574 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4575 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_addr.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp4573, %m972$.Node.type* %.tmp4574)
store %m2624$.AssignableInfo.type* %.tmp4575, %m2624$.AssignableInfo.type** %info.4568
%.tmp4576 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4577 = icmp eq %m2624$.AssignableInfo.type* %.tmp4576, null
br i1 %.tmp4577, label %.if.true.4578, label %.if.false.4578
.if.true.4578:
%.tmp4579 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4579, label %.if.true.4580, label %.if.false.4580
.if.true.4580:
%.tmp4581 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4582 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4584 = getelementptr [35 x i8], [35 x i8]*@.str4583, i32 0, i32 0
%.tmp4585 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp4581, %m972$.Node.type* %.tmp4582, i8* %.tmp4584)
%.tmp4586 = call i32(i8*,...) @printf(i8* %.tmp4585)
br label %.if.end.4580
.if.false.4580:
br label %.if.end.4580
.if.end.4580:
%.tmp4587 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp4587
br label %.if.end.4578
.if.false.4578:
br label %.if.end.4578
.if.end.4578:
%.tmp4588 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4590 = getelementptr [8 x i8], [8 x i8]*@.str4589, i32 0, i32 0
%.tmp4591 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp4588, i8* %.tmp4590)
%args.4592 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4591, %m972$.Node.type** %args.4592
%.tmp4594 = getelementptr [1 x i8], [1 x i8]*@.str4593, i32 0, i32 0
%params_buff.4595 = alloca i8*
store i8* %.tmp4594, i8** %params_buff.4595
%tmp.4596 = alloca i8*
store i8* null, i8** %tmp.4596
%.tmp4597 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4598 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4597, i32 0, i32 4
%.tmp4599 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4598
%.tmp4600 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4599, i32 0, i32 0
%.tmp4601 = load i8*, i8** %.tmp4600
%.tmp4603 = getelementptr [4 x i8], [4 x i8]*@.str4602, i32 0, i32 0
%.tmp4604 = call i32(i8*,i8*) @strcmp(i8* %.tmp4601, i8* %.tmp4603)
%.tmp4605 = icmp eq i32 %.tmp4604, 0
br i1 %.tmp4605, label %.if.true.4606, label %.if.false.4606
.if.true.4606:
%.tmp4607 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4608 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp4607)
%new_info.4609 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4608, %m2624$.AssignableInfo.type** %new_info.4609
%.tmp4610 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4611 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_info.4609
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp4610, %m2624$.AssignableInfo.type* %.tmp4611)
%.tmp4612 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_info.4609
%.tmp4613 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4612, i32 0, i32 4
%.tmp4614 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4615 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4614, i32 0, i32 4
%.tmp4616 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4615
%.tmp4617 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4616, i32 0, i32 3
%.tmp4618 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4617
store %m2624$.Type.type* %.tmp4618, %m2624$.Type.type** %.tmp4613
%.tmp4619 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4620 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4619, i32 0, i32 1
%.tmp4621 = load %m0$.File.type*, %m0$.File.type** %.tmp4620
%.tmp4623 = getelementptr [22 x i8], [22 x i8]*@.str4622, i32 0, i32 0
%.tmp4624 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_info.4609
%.tmp4625 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4624)
%.tmp4626 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4627 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4628 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4627, i32 0, i32 4
%.tmp4629 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4628
%.tmp4630 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4626, %m2624$.Type.type* %.tmp4629)
%.tmp4631 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4632 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4633 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4632, i32 0, i32 4
%.tmp4634 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4633
%.tmp4635 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4631, %m2624$.Type.type* %.tmp4634)
%.tmp4636 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4637 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4636)
%.tmp4638 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4621, i8* %.tmp4623, i8* %.tmp4625, i8* %.tmp4630, i8* %.tmp4635, i8* %.tmp4637)
%.tmp4639 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_info.4609
store %m2624$.AssignableInfo.type* %.tmp4639, %m2624$.AssignableInfo.type** %info.4568
br label %.if.end.4606
.if.false.4606:
br label %.if.end.4606
.if.end.4606:
%.tmp4640 = load %m972$.Node.type*, %m972$.Node.type** %args.4592
%.tmp4641 = icmp ne %m972$.Node.type* %.tmp4640, null
br i1 %.tmp4641, label %.if.true.4642, label %.if.false.4642
.if.true.4642:
%.tmp4643 = load %m972$.Node.type*, %m972$.Node.type** %args.4592
%.tmp4644 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4643, i32 0, i32 6
%.tmp4645 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4644
%.tmp4647 = getelementptr [11 x i8], [11 x i8]*@.str4646, i32 0, i32 0
%.tmp4648 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp4645, i8* %.tmp4647)
%start.4649 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4648, %m972$.Node.type** %start.4649
%argno.4650 = alloca i32
store i32 1, i32* %argno.4650
%.tmp4651 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4652 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4651, i32 0, i32 4
%.tmp4653 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4652
%.tmp4654 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4653, i32 0, i32 3
%.tmp4655 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4654
%.tmp4656 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4655, i32 0, i32 4
%.tmp4657 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4656
%expect_type.4658 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp4657, %m2624$.Type.type** %expect_type.4658
%provided_args.4659 = alloca i32
store i32 0, i32* %provided_args.4659
%.tmp4661 = load %m972$.Node.type*, %m972$.Node.type** %start.4649
%pp.4662 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4661, %m972$.Node.type** %pp.4662
br label %.for.start.4660
.for.start.4660:
%.tmp4663 = load %m972$.Node.type*, %m972$.Node.type** %pp.4662
%.tmp4664 = icmp ne %m972$.Node.type* %.tmp4663, null
br i1 %.tmp4664, label %.for.continue.4660, label %.for.end.4660
.for.continue.4660:
%.tmp4665 = load i32, i32* %provided_args.4659
%.tmp4666 = add i32 %.tmp4665, 1
store i32 %.tmp4666, i32* %provided_args.4659
%.tmp4667 = load %m972$.Node.type*, %m972$.Node.type** %pp.4662
%.tmp4668 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4667, i32 0, i32 7
%.tmp4669 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4668
%.tmp4671 = getelementptr [11 x i8], [11 x i8]*@.str4670, i32 0, i32 0
%.tmp4672 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp4669, i8* %.tmp4671)
store %m972$.Node.type* %.tmp4672, %m972$.Node.type** %pp.4662
br label %.for.start.4660
.for.end.4660:
%.tmp4674 = load %m972$.Node.type*, %m972$.Node.type** %start.4649
%pp.4675 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp4674, %m972$.Node.type** %pp.4675
br label %.for.start.4673
.for.start.4673:
%.tmp4676 = load %m972$.Node.type*, %m972$.Node.type** %pp.4675
%.tmp4677 = icmp ne %m972$.Node.type* %.tmp4676, null
br i1 %.tmp4677, label %.for.continue.4673, label %.for.end.4673
.for.continue.4673:
%.tmp4678 = load %m2624$.Type.type*, %m2624$.Type.type** %expect_type.4658
%.tmp4679 = icmp eq %m2624$.Type.type* %.tmp4678, null
br i1 %.tmp4679, label %.if.true.4680, label %.if.false.4680
.if.true.4680:
%.tmp4681 = getelementptr i8*, i8** %tmp.4596, i32 0
%.tmp4683 = getelementptr [43 x i8], [43 x i8]*@.str4682, i32 0, i32 0
%.tmp4684 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4685 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4684, i32 0, i32 2
%.tmp4686 = load i8*, i8** %.tmp4685
%.tmp4687 = load i32, i32* %argno.4650
%.tmp4688 = sub i32 %.tmp4687, 1
%.tmp4689 = load i32, i32* %provided_args.4659
%.tmp4690 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4681, i8* %.tmp4683, i8* %.tmp4686, i32 %.tmp4688, i32 %.tmp4689)
%.tmp4691 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4692 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4693 = load i8*, i8** %tmp.4596
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp4691, %m972$.Node.type* %.tmp4692, i8* %.tmp4693)
%.tmp4694 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp4694
br label %.if.end.4680
.if.false.4680:
br label %.if.end.4680
.if.end.4680:
%.tmp4695 = load %m972$.Node.type*, %m972$.Node.type** %pp.4675
%.tmp4696 = load %m972$.Node.type*, %m972$.Node.type** %start.4649
%.tmp4697 = icmp ne %m972$.Node.type* %.tmp4695, %.tmp4696
br i1 %.tmp4697, label %.if.true.4698, label %.if.false.4698
.if.true.4698:
%.tmp4699 = getelementptr i8*, i8** %tmp.4596, i32 0
%.tmp4701 = getelementptr [5 x i8], [5 x i8]*@.str4700, i32 0, i32 0
%.tmp4702 = load i8*, i8** %params_buff.4595
%.tmp4703 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4699, i8* %.tmp4701, i8* %.tmp4702)
%.tmp4704 = load i8*, i8** %params_buff.4595
%tmp_buff.4705 = alloca i8*
store i8* %.tmp4704, i8** %tmp_buff.4705
%.tmp4706 = load i8*, i8** %tmp.4596
store i8* %.tmp4706, i8** %params_buff.4595
%.tmp4707 = load i8*, i8** %tmp_buff.4705
store i8* %.tmp4707, i8** %tmp.4596
%.tmp4708 = load i8*, i8** %tmp.4596
call void(i8*) @free(i8* %.tmp4708)
br label %.if.end.4698
.if.false.4698:
br label %.if.end.4698
.if.end.4698:
%.tmp4709 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4710 = load %m972$.Node.type*, %m972$.Node.type** %pp.4675
%.tmp4711 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_assignable.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp4709, %m972$.Node.type* %.tmp4710)
%a_info.4712 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4711, %m2624$.AssignableInfo.type** %a_info.4712
%.tmp4713 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.4712
%.tmp4714 = icmp eq %m2624$.AssignableInfo.type* %.tmp4713, null
br i1 %.tmp4714, label %.if.true.4715, label %.if.false.4715
.if.true.4715:
%.tmp4716 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp4716
br label %.if.end.4715
.if.false.4715:
br label %.if.end.4715
.if.end.4715:
%.tmp4717 = load %m2624$.Type.type*, %m2624$.Type.type** %expect_type.4658
%.tmp4718 = call %m2624$.Type.type*(%m2624$.Type.type*) @m295$type_clone.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.tmp4717)
%exp.4719 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp4718, %m2624$.Type.type** %exp.4719
%.tmp4720 = load %m2624$.Type.type*, %m2624$.Type.type** %exp.4719
%.tmp4721 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4720, i32 0, i32 4
store %m2624$.Type.type* null, %m2624$.Type.type** %.tmp4721
%.tmp4722 = load %m2624$.Type.type*, %m2624$.Type.type** %expect_type.4658
%.tmp4723 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4722, i32 0, i32 0
%.tmp4724 = load i8*, i8** %.tmp4723
%.tmp4726 = getelementptr [7 x i8], [7 x i8]*@.str4725, i32 0, i32 0
%.tmp4727 = call i32(i8*,i8*) @strcmp(i8* %.tmp4724, i8* %.tmp4726)
%.tmp4728 = icmp ne i32 %.tmp4727, 0
%.tmp4729 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4730 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.4712
%.tmp4731 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4730, i32 0, i32 4
%.tmp4732 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4731
%.tmp4733 = load %m2624$.Type.type*, %m2624$.Type.type** %exp.4719
%.tmp4734 = call i1(%m2624$.CompilerCtx.type*,%m2624$.Type.type*,%m2624$.Type.type*) @m295$is_same_type.b.m2624$.CompilerCtx.typep.m2624$.Type.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4729, %m2624$.Type.type* %.tmp4732, %m2624$.Type.type* %.tmp4733)
%.tmp4735 = icmp eq i1 %.tmp4734, 0
%.tmp4736 = and i1 %.tmp4728, %.tmp4735
br i1 %.tmp4736, label %.if.true.4737, label %.if.false.4737
.if.true.4737:
%.tmp4739 = getelementptr [1 x i8], [1 x i8]*@.str4738, i32 0, i32 0
%err_buf.4740 = alloca i8*
store i8* %.tmp4739, i8** %err_buf.4740
%.tmp4741 = getelementptr i8*, i8** %err_buf.4740, i32 0
%.tmp4743 = getelementptr [58 x i8], [58 x i8]*@.str4742, i32 0, i32 0
%.tmp4744 = load i32, i32* %argno.4650
%.tmp4745 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4746 = load %m2624$.Type.type*, %m2624$.Type.type** %exp.4719
%.tmp4747 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4745, %m2624$.Type.type* %.tmp4746)
%.tmp4748 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4749 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.4712
%.tmp4750 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4749, i32 0, i32 4
%.tmp4751 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4750
%.tmp4752 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4748, %m2624$.Type.type* %.tmp4751)
%.tmp4753 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4741, i8* %.tmp4743, i32 %.tmp4744, i8* %.tmp4747, i8* %.tmp4752)
%.tmp4754 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4755 = load %m972$.Node.type*, %m972$.Node.type** %pp.4675
%.tmp4756 = load i8*, i8** %err_buf.4740
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp4754, %m972$.Node.type* %.tmp4755, i8* %.tmp4756)
%.tmp4757 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp4757
br label %.if.end.4737
.if.false.4737:
br label %.if.end.4737
.if.end.4737:
%.tmp4758 = getelementptr i8*, i8** %params_buff.4595, i32 0
%.tmp4760 = getelementptr [8 x i8], [8 x i8]*@.str4759, i32 0, i32 0
%.tmp4761 = load i8*, i8** %params_buff.4595
%.tmp4762 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4763 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.4712
%.tmp4764 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4763, i32 0, i32 4
%.tmp4765 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4764
%.tmp4766 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4762, %m2624$.Type.type* %.tmp4765)
%.tmp4767 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.4712
%.tmp4768 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4767)
%.tmp4769 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4758, i8* %.tmp4760, i8* %.tmp4761, i8* %.tmp4766, i8* %.tmp4768)
%.tmp4770 = load %m972$.Node.type*, %m972$.Node.type** %pp.4675
%.tmp4771 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4770, i32 0, i32 7
%.tmp4772 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4771
store %m972$.Node.type* %.tmp4772, %m972$.Node.type** %pp.4675
%.tmp4773 = load %m2624$.Type.type*, %m2624$.Type.type** %expect_type.4658
%.tmp4774 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4773, i32 0, i32 0
%.tmp4775 = load i8*, i8** %.tmp4774
%.tmp4777 = getelementptr [7 x i8], [7 x i8]*@.str4776, i32 0, i32 0
%.tmp4778 = call i32(i8*,i8*) @strcmp(i8* %.tmp4775, i8* %.tmp4777)
%.tmp4779 = icmp ne i32 %.tmp4778, 0
br i1 %.tmp4779, label %.if.true.4780, label %.if.false.4780
.if.true.4780:
%.tmp4781 = load %m2624$.Type.type*, %m2624$.Type.type** %expect_type.4658
%.tmp4782 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4781, i32 0, i32 4
%.tmp4783 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4782
store %m2624$.Type.type* %.tmp4783, %m2624$.Type.type** %expect_type.4658
br label %.if.end.4780
.if.false.4780:
br label %.if.end.4780
.if.end.4780:
%.tmp4784 = load i32, i32* %argno.4650
%.tmp4785 = add i32 %.tmp4784, 1
store i32 %.tmp4785, i32* %argno.4650
%.tmp4786 = load %m972$.Node.type*, %m972$.Node.type** %pp.4675
%.tmp4788 = getelementptr [11 x i8], [11 x i8]*@.str4787, i32 0, i32 0
%.tmp4789 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp4786, i8* %.tmp4788)
store %m972$.Node.type* %.tmp4789, %m972$.Node.type** %pp.4675
br label %.for.start.4673
.for.end.4673:
%.tmp4790 = load %m2624$.Type.type*, %m2624$.Type.type** %expect_type.4658
%.tmp4791 = icmp ne %m2624$.Type.type* %.tmp4790, null
br i1 %.tmp4791, label %.if.true.4792, label %.if.false.4792
.if.true.4792:
%.tmp4793 = load %m2624$.Type.type*, %m2624$.Type.type** %expect_type.4658
%.tmp4794 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4793, i32 0, i32 0
%.tmp4795 = load i8*, i8** %.tmp4794
%.tmp4797 = getelementptr [7 x i8], [7 x i8]*@.str4796, i32 0, i32 0
%.tmp4798 = call i32(i8*,i8*) @strcmp(i8* %.tmp4795, i8* %.tmp4797)
%.tmp4799 = icmp ne i32 %.tmp4798, 0
br i1 %.tmp4799, label %.if.true.4800, label %.if.false.4800
.if.true.4800:
%.tmp4801 = getelementptr i8*, i8** %tmp.4596, i32 0
%.tmp4803 = getelementptr [43 x i8], [43 x i8]*@.str4802, i32 0, i32 0
%.tmp4804 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4805 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4804, i32 0, i32 2
%.tmp4806 = load i8*, i8** %.tmp4805
%.tmp4807 = load i32, i32* %argno.4650
%.tmp4808 = load i32, i32* %provided_args.4659
%.tmp4809 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4801, i8* %.tmp4803, i8* %.tmp4806, i32 %.tmp4807, i32 %.tmp4808)
%.tmp4810 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4811 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4812 = load i8*, i8** %tmp.4596
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp4810, %m972$.Node.type* %.tmp4811, i8* %.tmp4812)
%.tmp4813 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp4813
br label %.if.end.4800
.if.false.4800:
br label %.if.end.4800
.if.end.4800:
br label %.if.end.4792
.if.false.4792:
br label %.if.end.4792
.if.end.4792:
br label %.if.end.4642
.if.false.4642:
%.tmp4814 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4815 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4814, i32 0, i32 4
%.tmp4816 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4815
%.tmp4817 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4816, i32 0, i32 3
%.tmp4818 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4817
%.tmp4819 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4818, i32 0, i32 4
%.tmp4820 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4819
%.tmp4821 = icmp ne %m2624$.Type.type* %.tmp4820, null
br i1 %.tmp4821, label %.if.true.4822, label %.if.false.4822
.if.true.4822:
%args_required.4823 = alloca i32
store i32 0, i32* %args_required.4823
%.tmp4825 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4826 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4825, i32 0, i32 4
%.tmp4827 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4826
%.tmp4828 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4827, i32 0, i32 3
%.tmp4829 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4828
%.tmp4830 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4829, i32 0, i32 4
%.tmp4831 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4830
%pp.4832 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp4831, %m2624$.Type.type** %pp.4832
br label %.for.start.4824
.for.start.4824:
%.tmp4833 = load %m2624$.Type.type*, %m2624$.Type.type** %pp.4832
%.tmp4834 = icmp ne %m2624$.Type.type* %.tmp4833, null
br i1 %.tmp4834, label %.for.continue.4824, label %.for.else.4824
.for.continue.4824:
%.tmp4835 = load %m2624$.Type.type*, %m2624$.Type.type** %pp.4832
%.tmp4836 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4835, i32 0, i32 0
%.tmp4837 = load i8*, i8** %.tmp4836
%.tmp4839 = getelementptr [7 x i8], [7 x i8]*@.str4838, i32 0, i32 0
%.tmp4840 = call i32(i8*,i8*) @strcmp(i8* %.tmp4837, i8* %.tmp4839)
%.tmp4841 = icmp eq i32 %.tmp4840, 0
br i1 %.tmp4841, label %.if.true.4842, label %.if.false.4842
.if.true.4842:
br label %.for.end.4824
br label %.if.end.4842
.if.false.4842:
br label %.if.end.4842
.if.end.4842:
%.tmp4843 = load i32, i32* %args_required.4823
%.tmp4844 = add i32 %.tmp4843, 1
store i32 %.tmp4844, i32* %args_required.4823
%.tmp4845 = load %m2624$.Type.type*, %m2624$.Type.type** %pp.4832
%.tmp4846 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4845, i32 0, i32 4
%.tmp4847 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4846
store %m2624$.Type.type* %.tmp4847, %m2624$.Type.type** %pp.4832
br label %.for.start.4824
.for.else.4824:
%.tmp4848 = getelementptr i8*, i8** %tmp.4596, i32 0
%.tmp4850 = getelementptr [42 x i8], [42 x i8]*@.str4849, i32 0, i32 0
%.tmp4851 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4852 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4851, i32 0, i32 2
%.tmp4853 = load i8*, i8** %.tmp4852
%.tmp4854 = load i32, i32* %args_required.4823
%.tmp4855 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4848, i8* %.tmp4850, i8* %.tmp4853, i32 %.tmp4854)
%.tmp4856 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4857 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4858 = load i8*, i8** %tmp.4596
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp4856, %m972$.Node.type* %.tmp4857, i8* %.tmp4858)
%.tmp4859 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp4859
br label %.for.end.4824
.for.end.4824:
br label %.if.end.4822
.if.false.4822:
br label %.if.end.4822
.if.end.4822:
br label %.if.end.4642
.if.end.4642:
%.tmp4860 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4861 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4862 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4861, i32 0, i32 4
%.tmp4863 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4862
%.tmp4864 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4863, i32 0, i32 3
%.tmp4865 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4864
%.tmp4866 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4860, %m2624$.Type.type* %.tmp4865)
%.tmp4868 = getelementptr [5 x i8], [5 x i8]*@.str4867, i32 0, i32 0
%.tmp4869 = call i32(i8*,i8*) @strcmp(i8* %.tmp4866, i8* %.tmp4868)
%.tmp4870 = icmp eq i32 %.tmp4869, 0
br i1 %.tmp4870, label %.if.true.4871, label %.if.false.4871
.if.true.4871:
%.tmp4872 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4873 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4872, i32 0, i32 1
%.tmp4874 = load %m0$.File.type*, %m0$.File.type** %.tmp4873
%.tmp4876 = getelementptr [16 x i8], [16 x i8]*@.str4875, i32 0, i32 0
%.tmp4877 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4878 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4879 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4878, i32 0, i32 4
%.tmp4880 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4879
%.tmp4881 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4877, %m2624$.Type.type* %.tmp4880)
%.tmp4882 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4883 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4882)
%.tmp4884 = load i8*, i8** %params_buff.4595
%.tmp4885 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4874, i8* %.tmp4876, i8* %.tmp4881, i8* %.tmp4883, i8* %.tmp4884)
%.tmp4886 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp4886
br label %.if.end.4871
.if.false.4871:
br label %.if.end.4871
.if.end.4871:
%.tmp4887 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4888 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp4887)
%call_info.4889 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4888, %m2624$.AssignableInfo.type** %call_info.4889
%.tmp4890 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4891 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %call_info.4889
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp4890, %m2624$.AssignableInfo.type* %.tmp4891)
%.tmp4892 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %call_info.4889
%.tmp4893 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4892, i32 0, i32 4
%.tmp4894 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4895 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4894, i32 0, i32 4
%.tmp4896 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4895
%.tmp4897 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4896, i32 0, i32 3
%.tmp4898 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4897
%.tmp4899 = call %m2624$.Type.type*(%m2624$.Type.type*) @m295$type_clone.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.tmp4898)
store %m2624$.Type.type* %.tmp4899, %m2624$.Type.type** %.tmp4893
%.tmp4900 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %call_info.4889
%.tmp4901 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4900, i32 0, i32 4
%.tmp4902 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4901
%.tmp4903 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp4902, i32 0, i32 4
store %m2624$.Type.type* null, %m2624$.Type.type** %.tmp4903
%.tmp4904 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4905 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4904, i32 0, i32 1
%.tmp4906 = load %m0$.File.type*, %m0$.File.type** %.tmp4905
%.tmp4908 = getelementptr [21 x i8], [21 x i8]*@.str4907, i32 0, i32 0
%.tmp4909 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %call_info.4889
%.tmp4910 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4909)
%.tmp4911 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4912 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4913 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4912, i32 0, i32 4
%.tmp4914 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4913
%.tmp4915 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4911, %m2624$.Type.type* %.tmp4914)
%.tmp4916 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4568
%.tmp4917 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4916)
%.tmp4918 = load i8*, i8** %params_buff.4595
%.tmp4919 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4906, i8* %.tmp4908, i8* %.tmp4910, i8* %.tmp4915, i8* %.tmp4917, i8* %.tmp4918)
%.tmp4920 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %call_info.4889
%.tmp4921 = bitcast %m2624$.AssignableInfo.type* %.tmp4920 to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp4921
}
define void @m295$compile_expression.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%err_msg.4922 = alloca i8*
store i8* null, i8** %err_msg.4922
%.tmp4923 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4924 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4923, i32 0, i32 0
%.tmp4925 = load i8*, i8** %.tmp4924
%expr_type.4926 = alloca i8*
store i8* %.tmp4925, i8** %expr_type.4926
%.tmp4927 = bitcast ptr null to %m2624$.AssignableInfo.type*
%info.4928 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4927, %m2624$.AssignableInfo.type** %info.4928
%assignable.4929 = alloca %m972$.Node.type*
store %m972$.Node.type* null, %m972$.Node.type** %assignable.4929
%.tmp4930 = bitcast ptr null to %m2624$.AssignableInfo.type*
%a_info.4931 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp4930, %m2624$.AssignableInfo.type** %a_info.4931
%.tmp4932 = load i8*, i8** %expr_type.4926
%.tmp4934 = getelementptr [7 x i8], [7 x i8]*@.str4933, i32 0, i32 0
%.tmp4935 = call i32(i8*,i8*) @strcmp(i8* %.tmp4932, i8* %.tmp4934)
%.tmp4936 = icmp eq i32 %.tmp4935, 0
br i1 %.tmp4936, label %.if.true.4937, label %.if.false.4937
.if.true.4937:
%.tmp4938 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4939 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4938, i32 0, i32 6
%.tmp4940 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4939
%.tmp4941 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4940, i32 0, i32 7
%.tmp4942 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4941
%.tmp4943 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4942, i32 0, i32 0
%.tmp4944 = load i8*, i8** %.tmp4943
%.tmp4946 = getelementptr [3 x i8], [3 x i8]*@.str4945, i32 0, i32 0
%.tmp4947 = call i32(i8*,i8*) @strcmp(i8* %.tmp4944, i8* %.tmp4946)
%.tmp4948 = icmp ne i32 %.tmp4947, 0
br i1 %.tmp4948, label %.if.true.4949, label %.if.false.4949
.if.true.4949:
%.tmp4950 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4951 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4952 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4951, i32 0, i32 6
%.tmp4953 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4952
%.tmp4954 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4953, i32 0, i32 7
%.tmp4955 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4954
%.tmp4956 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_assignable.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp4950, %m972$.Node.type* %.tmp4955)
store %m2624$.AssignableInfo.type* %.tmp4956, %m2624$.AssignableInfo.type** %info.4928
%.tmp4957 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4928
%.tmp4958 = icmp eq %m2624$.AssignableInfo.type* %.tmp4957, null
br i1 %.tmp4958, label %.if.true.4959, label %.if.false.4959
.if.true.4959:
ret void
br label %.if.end.4959
.if.false.4959:
br label %.if.end.4959
.if.end.4959:
%.tmp4960 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4961 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4960, i32 0, i32 1
%.tmp4962 = load %m0$.File.type*, %m0$.File.type** %.tmp4961
%.tmp4964 = getelementptr [11 x i8], [11 x i8]*@.str4963, i32 0, i32 0
%.tmp4965 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4966 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4928
%.tmp4967 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp4966, i32 0, i32 4
%.tmp4968 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp4967
%.tmp4969 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp4965, %m2624$.Type.type* %.tmp4968)
%.tmp4970 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.4928
%.tmp4971 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp4970)
%.tmp4972 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4962, i8* %.tmp4964, i8* %.tmp4969, i8* %.tmp4971)
br label %.if.end.4949
.if.false.4949:
%.tmp4973 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4974 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp4973, i32 0, i32 1
%.tmp4975 = load %m0$.File.type*, %m0$.File.type** %.tmp4974
%.tmp4977 = getelementptr [10 x i8], [10 x i8]*@.str4976, i32 0, i32 0
%.tmp4978 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4975, i8* %.tmp4977)
br label %.if.end.4949
.if.end.4949:
br label %.if.end.4937
.if.false.4937:
%.tmp4979 = load i8*, i8** %expr_type.4926
%.tmp4981 = getelementptr [3 x i8], [3 x i8]*@.str4980, i32 0, i32 0
%.tmp4982 = call i32(i8*,i8*) @strcmp(i8* %.tmp4979, i8* %.tmp4981)
%.tmp4983 = icmp eq i32 %.tmp4982, 0
br i1 %.tmp4983, label %.if.true.4984, label %.if.false.4984
.if.true.4984:
br label %.if.end.4984
.if.false.4984:
%.tmp4985 = load i8*, i8** %expr_type.4926
%.tmp4987 = getelementptr [8 x i8], [8 x i8]*@.str4986, i32 0, i32 0
%.tmp4988 = call i32(i8*,i8*) @strcmp(i8* %.tmp4985, i8* %.tmp4987)
%.tmp4989 = icmp eq i32 %.tmp4988, 0
br i1 %.tmp4989, label %.if.true.4990, label %.if.false.4990
.if.true.4990:
%.tmp4991 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp4992 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp4993 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp4992, i32 0, i32 6
%.tmp4994 = load %m972$.Node.type*, %m972$.Node.type** %.tmp4993
%.tmp4995 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_fn_call.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp4991, %m972$.Node.type* %.tmp4994)
br label %.if.end.4990
.if.false.4990:
%.tmp4996 = load i8*, i8** %expr_type.4926
%.tmp4998 = getelementptr [12 x i8], [12 x i8]*@.str4997, i32 0, i32 0
%.tmp4999 = call i32(i8*,i8*) @strcmp(i8* %.tmp4996, i8* %.tmp4998)
%.tmp5000 = icmp eq i32 %.tmp4999, 0
br i1 %.tmp5000, label %.if.true.5001, label %.if.false.5001
.if.true.5001:
%.tmp5002 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5003 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5004 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_declaration.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5002, %m972$.Node.type* %.tmp5003)
br label %.if.end.5001
.if.false.5001:
%.tmp5005 = load i8*, i8** %expr_type.4926
%.tmp5007 = getelementptr [11 x i8], [11 x i8]*@.str5006, i32 0, i32 0
%.tmp5008 = call i32(i8*,i8*) @strcmp(i8* %.tmp5005, i8* %.tmp5007)
%.tmp5009 = icmp eq i32 %.tmp5008, 0
br i1 %.tmp5009, label %.if.true.5010, label %.if.false.5010
.if.true.5010:
%.tmp5011 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5012 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5011, i32 0, i32 6
%.tmp5013 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5012
%.tmp5015 = getelementptr [11 x i8], [11 x i8]*@.str5014, i32 0, i32 0
%.tmp5016 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp5013, i8* %.tmp5015)
store %m972$.Node.type* %.tmp5016, %m972$.Node.type** %assignable.4929
%.tmp5017 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5018 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5019 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5018, i32 0, i32 6
%.tmp5020 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5019
%.tmp5021 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_addr.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5017, %m972$.Node.type* %.tmp5020)
%dest.5022 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp5021, %m2624$.AssignableInfo.type** %dest.5022
%.tmp5023 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %dest.5022
%.tmp5024 = icmp eq %m2624$.AssignableInfo.type* %.tmp5023, null
br i1 %.tmp5024, label %.if.true.5025, label %.if.false.5025
.if.true.5025:
ret void
br label %.if.end.5025
.if.false.5025:
br label %.if.end.5025
.if.end.5025:
%.tmp5026 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5027 = load %m972$.Node.type*, %m972$.Node.type** %assignable.4929
%.tmp5028 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_assignable.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5026, %m972$.Node.type* %.tmp5027)
store %m2624$.AssignableInfo.type* %.tmp5028, %m2624$.AssignableInfo.type** %a_info.4931
%.tmp5029 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.4931
%.tmp5030 = icmp eq %m2624$.AssignableInfo.type* %.tmp5029, null
br i1 %.tmp5030, label %.if.true.5031, label %.if.false.5031
.if.true.5031:
ret void
br label %.if.end.5031
.if.false.5031:
br label %.if.end.5031
.if.end.5031:
%.tmp5032 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5033 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.4931
%.tmp5034 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5033, i32 0, i32 4
%.tmp5035 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5034
%.tmp5036 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %dest.5022
%.tmp5037 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5036, i32 0, i32 4
%.tmp5038 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5037
%.tmp5039 = call i1(%m2624$.CompilerCtx.type*,%m2624$.Type.type*,%m2624$.Type.type*) @m295$is_same_type.b.m2624$.CompilerCtx.typep.m2624$.Type.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp5032, %m2624$.Type.type* %.tmp5035, %m2624$.Type.type* %.tmp5038)
%.tmp5040 = icmp eq i1 %.tmp5039, 0
br i1 %.tmp5040, label %.if.true.5041, label %.if.false.5041
.if.true.5041:
%.tmp5043 = getelementptr [1 x i8], [1 x i8]*@.str5042, i32 0, i32 0
%err_buf.5044 = alloca i8*
store i8* %.tmp5043, i8** %err_buf.5044
%.tmp5045 = getelementptr i8*, i8** %err_buf.5044, i32 0
%.tmp5047 = getelementptr [37 x i8], [37 x i8]*@.str5046, i32 0, i32 0
%.tmp5048 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5049 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.4931
%.tmp5050 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5049, i32 0, i32 4
%.tmp5051 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5050
%.tmp5052 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp5048, %m2624$.Type.type* %.tmp5051)
%.tmp5053 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5054 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %dest.5022
%.tmp5055 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5054, i32 0, i32 4
%.tmp5056 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5055
%.tmp5057 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp5053, %m2624$.Type.type* %.tmp5056)
%.tmp5058 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5045, i8* %.tmp5047, i8* %.tmp5052, i8* %.tmp5057)
%.tmp5059 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5060 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5061 = load i8*, i8** %err_buf.5044
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp5059, %m972$.Node.type* %.tmp5060, i8* %.tmp5061)
br label %.if.end.5041
.if.false.5041:
br label %.if.end.5041
.if.end.5041:
%.tmp5062 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5063 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %dest.5022
%.tmp5064 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5063, i32 0, i32 4
%.tmp5065 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5064
%.tmp5066 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp5062, %m2624$.Type.type* %.tmp5065)
%dest_tr.5067 = alloca i8*
store i8* %.tmp5066, i8** %dest_tr.5067
%.tmp5068 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5069 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.4931
%.tmp5070 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5069, i32 0, i32 4
%.tmp5071 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5070
%.tmp5072 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp5068, %m2624$.Type.type* %.tmp5071)
%src_tr.5073 = alloca i8*
store i8* %.tmp5072, i8** %src_tr.5073
%.tmp5074 = load i8*, i8** %src_tr.5073
%.tmp5076 = getelementptr [4 x i8], [4 x i8]*@.str5075, i32 0, i32 0
%.tmp5077 = call i32(i8*,i8*) @strcmp(i8* %.tmp5074, i8* %.tmp5076)
%.tmp5078 = icmp eq i32 %.tmp5077, 0
br i1 %.tmp5078, label %.if.true.5079, label %.if.false.5079
.if.true.5079:
%.tmp5080 = load i8*, i8** %dest_tr.5067
store i8* %.tmp5080, i8** %src_tr.5073
br label %.if.end.5079
.if.false.5079:
br label %.if.end.5079
.if.end.5079:
%.tmp5081 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5082 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5081, i32 0, i32 1
%.tmp5083 = load %m0$.File.type*, %m0$.File.type** %.tmp5082
%.tmp5085 = getelementptr [21 x i8], [21 x i8]*@.str5084, i32 0, i32 0
%.tmp5086 = load i8*, i8** %src_tr.5073
%.tmp5087 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.4931
%.tmp5088 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp5087)
%.tmp5089 = load i8*, i8** %dest_tr.5067
%.tmp5090 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %dest.5022
%.tmp5091 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp5090)
%.tmp5092 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5083, i8* %.tmp5085, i8* %.tmp5086, i8* %.tmp5088, i8* %.tmp5089, i8* %.tmp5091)
br label %.if.end.5010
.if.false.5010:
%.tmp5093 = load i8*, i8** %expr_type.4926
%.tmp5095 = getelementptr [9 x i8], [9 x i8]*@.str5094, i32 0, i32 0
%.tmp5096 = call i32(i8*,i8*) @strcmp(i8* %.tmp5093, i8* %.tmp5095)
%.tmp5097 = icmp eq i32 %.tmp5096, 0
br i1 %.tmp5097, label %.if.true.5098, label %.if.false.5098
.if.true.5098:
%.tmp5099 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5100 = load %m972$.Node.type*, %m972$.Node.type** %stmt
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_if_block.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5099, %m972$.Node.type* %.tmp5100)
br label %.if.end.5098
.if.false.5098:
%.tmp5101 = load i8*, i8** %expr_type.4926
%.tmp5103 = getelementptr [9 x i8], [9 x i8]*@.str5102, i32 0, i32 0
%.tmp5104 = call i32(i8*,i8*) @strcmp(i8* %.tmp5101, i8* %.tmp5103)
%.tmp5105 = icmp eq i32 %.tmp5104, 0
br i1 %.tmp5105, label %.if.true.5106, label %.if.false.5106
.if.true.5106:
%.tmp5107 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5108 = load %m972$.Node.type*, %m972$.Node.type** %stmt
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_for_loop.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5107, %m972$.Node.type* %.tmp5108)
br label %.if.end.5106
.if.false.5106:
%.tmp5109 = load i8*, i8** %expr_type.4926
%.tmp5111 = getelementptr [8 x i8], [8 x i8]*@.str5110, i32 0, i32 0
%.tmp5112 = call i32(i8*,i8*) @strcmp(i8* %.tmp5109, i8* %.tmp5111)
%.tmp5113 = icmp eq i32 %.tmp5112, 0
br i1 %.tmp5113, label %.if.true.5114, label %.if.false.5114
.if.true.5114:
%.tmp5115 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5116 = call %m2624$.ModuleLookup.type*(%m2624$.CompilerCtx.type*) @m295$get_current_module.m2624$.ModuleLookup.typep.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp5115)
%mod.5117 = alloca %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* %.tmp5116, %m2624$.ModuleLookup.type** %mod.5117
%.tmp5118 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.5117
%.tmp5119 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp5118, i32 0, i32 3
%.tmp5120 = load %m2624$.Scope.type*, %m2624$.Scope.type** %.tmp5119
%s.5121 = alloca %m2624$.Scope.type*
store %m2624$.Scope.type* %.tmp5120, %m2624$.Scope.type** %s.5121
%.tmp5122 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5123 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5122, i32 0, i32 6
%.tmp5124 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5123
%.tmp5125 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5124, i32 0, i32 1
%.tmp5126 = load i8*, i8** %.tmp5125
%.tmp5128 = getelementptr [6 x i8], [6 x i8]*@.str5127, i32 0, i32 0
%.tmp5129 = call i32(i8*,i8*) @strcmp(i8* %.tmp5126, i8* %.tmp5128)
%.tmp5130 = icmp eq i32 %.tmp5129, 0
br i1 %.tmp5130, label %.if.true.5131, label %.if.false.5131
.if.true.5131:
br label %.for.start.5132
.for.start.5132:
%.tmp5133 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.5121
%.tmp5134 = icmp ne %m2624$.Scope.type* %.tmp5133, null
br i1 %.tmp5134, label %.for.continue.5132, label %.for.else.5132
.for.continue.5132:
%.tmp5135 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.5121
%.tmp5136 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp5135, i32 0, i32 2
%.tmp5137 = load i8*, i8** %.tmp5136
%.tmp5139 = getelementptr [4 x i8], [4 x i8]*@.str5138, i32 0, i32 0
%.tmp5140 = call i32(i8*,i8*) @strcmp(i8* %.tmp5137, i8* %.tmp5139)
%.tmp5141 = icmp eq i32 %.tmp5140, 0
br i1 %.tmp5141, label %.if.true.5142, label %.if.false.5142
.if.true.5142:
%.tmp5143 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5144 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5143, i32 0, i32 1
%.tmp5145 = load %m0$.File.type*, %m0$.File.type** %.tmp5144
%.tmp5147 = getelementptr [15 x i8], [15 x i8]*@.str5146, i32 0, i32 0
%.tmp5148 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.5121
%.tmp5149 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp5148, i32 0, i32 4
%.tmp5150 = load i8*, i8** %.tmp5149
%.tmp5151 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5145, i8* %.tmp5147, i8* %.tmp5150)
br label %.for.end.5132
br label %.if.end.5142
.if.false.5142:
br label %.if.end.5142
.if.end.5142:
%.tmp5152 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.5121
%.tmp5153 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp5152, i32 0, i32 5
%.tmp5154 = load %m2624$.Scope.type*, %m2624$.Scope.type** %.tmp5153
store %m2624$.Scope.type* %.tmp5154, %m2624$.Scope.type** %s.5121
br label %.for.start.5132
.for.else.5132:
%.tmp5155 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5156 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5158 = getelementptr [48 x i8], [48 x i8]*@.str5157, i32 0, i32 0
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp5155, %m972$.Node.type* %.tmp5156, i8* %.tmp5158)
br label %.for.end.5132
.for.end.5132:
br label %.if.end.5131
.if.false.5131:
%.tmp5159 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5160 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5159, i32 0, i32 6
%.tmp5161 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5160
%.tmp5162 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5161, i32 0, i32 1
%.tmp5163 = load i8*, i8** %.tmp5162
%.tmp5165 = getelementptr [9 x i8], [9 x i8]*@.str5164, i32 0, i32 0
%.tmp5166 = call i32(i8*,i8*) @strcmp(i8* %.tmp5163, i8* %.tmp5165)
%.tmp5167 = icmp eq i32 %.tmp5166, 0
br i1 %.tmp5167, label %.if.true.5168, label %.if.false.5168
.if.true.5168:
br label %.for.start.5169
.for.start.5169:
%.tmp5170 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.5121
%.tmp5171 = icmp ne %m2624$.Scope.type* %.tmp5170, null
br i1 %.tmp5171, label %.for.continue.5169, label %.for.else.5169
.for.continue.5169:
%.tmp5172 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.5121
%.tmp5173 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp5172, i32 0, i32 2
%.tmp5174 = load i8*, i8** %.tmp5173
%.tmp5176 = getelementptr [4 x i8], [4 x i8]*@.str5175, i32 0, i32 0
%.tmp5177 = call i32(i8*,i8*) @strcmp(i8* %.tmp5174, i8* %.tmp5176)
%.tmp5178 = icmp eq i32 %.tmp5177, 0
br i1 %.tmp5178, label %.if.true.5179, label %.if.false.5179
.if.true.5179:
%.tmp5180 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5181 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5180, i32 0, i32 1
%.tmp5182 = load %m0$.File.type*, %m0$.File.type** %.tmp5181
%.tmp5184 = getelementptr [15 x i8], [15 x i8]*@.str5183, i32 0, i32 0
%.tmp5185 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.5121
%.tmp5186 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp5185, i32 0, i32 3
%.tmp5187 = load i8*, i8** %.tmp5186
%.tmp5188 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5182, i8* %.tmp5184, i8* %.tmp5187)
br label %.for.end.5169
br label %.if.end.5179
.if.false.5179:
br label %.if.end.5179
.if.end.5179:
%.tmp5189 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.5121
%.tmp5190 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp5189, i32 0, i32 5
%.tmp5191 = load %m2624$.Scope.type*, %m2624$.Scope.type** %.tmp5190
store %m2624$.Scope.type* %.tmp5191, %m2624$.Scope.type** %s.5121
br label %.for.start.5169
.for.else.5169:
%.tmp5192 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5193 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5195 = getelementptr [51 x i8], [51 x i8]*@.str5194, i32 0, i32 0
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp5192, %m972$.Node.type* %.tmp5193, i8* %.tmp5195)
br label %.for.end.5169
.for.end.5169:
br label %.if.end.5168
.if.false.5168:
%.tmp5196 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5197 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5199 = getelementptr [40 x i8], [40 x i8]*@.str5198, i32 0, i32 0
%.tmp5200 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp5196, %m972$.Node.type* %.tmp5197, i8* %.tmp5199)
%.tmp5201 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5202 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5201, i32 0, i32 6
%.tmp5203 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5202
%.tmp5204 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5203, i32 0, i32 1
%.tmp5205 = load i8*, i8** %.tmp5204
%.tmp5206 = call i32(i8*,...) @printf(i8* %.tmp5200, i8* %.tmp5205)
br label %.if.end.5168
.if.end.5168:
br label %.if.end.5131
.if.end.5131:
br label %.if.end.5114
.if.false.5114:
%.tmp5207 = load i8*, i8** %expr_type.4926
%.tmp5209 = getelementptr [9 x i8], [9 x i8]*@.str5208, i32 0, i32 0
%.tmp5210 = call i32(i8*,i8*) @strcmp(i8* %.tmp5207, i8* %.tmp5209)
%.tmp5211 = icmp eq i32 %.tmp5210, 0
br i1 %.tmp5211, label %.if.true.5212, label %.if.false.5212
.if.true.5212:
%.tmp5213 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5214 = load %m972$.Node.type*, %m972$.Node.type** %stmt
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_closure.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5213, %m972$.Node.type* %.tmp5214)
br label %.if.end.5212
.if.false.5212:
%.tmp5215 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5216 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5218 = getelementptr [34 x i8], [34 x i8]*@.str5217, i32 0, i32 0
%.tmp5219 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp5215, %m972$.Node.type* %.tmp5216, i8* %.tmp5218)
%.tmp5220 = load i8*, i8** %expr_type.4926
%.tmp5221 = call i32(i8*,...) @printf(i8* %.tmp5219, i8* %.tmp5220)
br label %.if.end.5212
.if.end.5212:
br label %.if.end.5114
.if.end.5114:
br label %.if.end.5106
.if.end.5106:
br label %.if.end.5098
.if.end.5098:
br label %.if.end.5010
.if.end.5010:
br label %.if.end.5001
.if.end.5001:
br label %.if.end.4990
.if.end.4990:
br label %.if.end.4984
.if.end.4984:
br label %.if.end.4937
.if.end.4937:
ret void
}
define %m2624$.Type.type* @m295$type_ptr_of_chr.m2624$.Type.typep() {
%.tmp5222 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%t.5223 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp5222, %m2624$.Type.type** %t.5223
%.tmp5224 = load %m2624$.Type.type*, %m2624$.Type.type** %t.5223
%.tmp5225 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5224, i32 0, i32 0
%.tmp5227 = getelementptr [4 x i8], [4 x i8]*@.str5226, i32 0, i32 0
store i8* %.tmp5227, i8** %.tmp5225
%.tmp5228 = load %m2624$.Type.type*, %m2624$.Type.type** %t.5223
%.tmp5229 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5228, i32 0, i32 3
%.tmp5230 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5230, %m2624$.Type.type** %.tmp5229
%.tmp5231 = load %m2624$.Type.type*, %m2624$.Type.type** %t.5223
%.tmp5232 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5231, i32 0, i32 3
%.tmp5233 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5232
%.tmp5234 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5233, i32 0, i32 0
%.tmp5236 = getelementptr [4 x i8], [4 x i8]*@.str5235, i32 0, i32 0
store i8* %.tmp5236, i8** %.tmp5234
%.tmp5237 = load %m2624$.Type.type*, %m2624$.Type.type** %t.5223
ret %m2624$.Type.type* %.tmp5237
}
define void @m295$compile_closure.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%.tmp5238 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5239 = call i32(%m2624$.CompilerCtx.type*) @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp5238)
%cj_id.5240 = alloca i32
store i32 %.tmp5239, i32* %cj_id.5240
%.tmp5241 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5242 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp5241)
%info_lit.5243 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp5242, %m2624$.AssignableInfo.type** %info_lit.5243
%.tmp5244 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lit.5243
%.tmp5245 = load i8, i8* @SCOPE_GLOBAL
%.tmp5247 = getelementptr [21 x i8], [21 x i8]*@.str5246, i32 0, i32 0
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp5244, i8 %.tmp5245, i8* %.tmp5247)
%.tmp5248 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lit.5243
%.tmp5249 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5248, i32 0, i32 4
%.tmp5250 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5250, %m2624$.Type.type** %.tmp5249
%.tmp5251 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lit.5243
%.tmp5252 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5251, i32 0, i32 4
%.tmp5253 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5252
%.tmp5254 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5253, i32 0, i32 0
%.tmp5256 = getelementptr [9 x i8], [9 x i8]*@.str5255, i32 0, i32 0
store i8* %.tmp5256, i8** %.tmp5254
%.tmp5257 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lit.5243
%.tmp5258 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5257, i32 0, i32 4
%.tmp5259 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5258
%.tmp5260 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5259, i32 0, i32 3
%.tmp5261 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5261, %m2624$.Type.type** %.tmp5260
%.tmp5262 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lit.5243
%.tmp5263 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5262, i32 0, i32 4
%.tmp5264 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5263
%.tmp5265 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5264, i32 0, i32 3
%.tmp5266 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5265
%.tmp5267 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5266, i32 0, i32 0
%.tmp5269 = getelementptr [5 x i8], [5 x i8]*@.str5268, i32 0, i32 0
store i8* %.tmp5269, i8** %.tmp5267
%.tmp5270 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lit.5243
%.tmp5271 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5270, i32 0, i32 4
%.tmp5272 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5271
%.tmp5273 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5272, i32 0, i32 3
%.tmp5274 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5273
%.tmp5275 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5274, i32 0, i32 4
%.tmp5276 = call %m2624$.Type.type*() @m295$type_ptr_of_chr.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5276, %m2624$.Type.type** %.tmp5275
%.tmp5277 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lit.5243
%.tmp5278 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5277, i32 0, i32 4
%.tmp5279 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5278
%.tmp5280 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5279, i32 0, i32 3
%.tmp5281 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5280
%.tmp5282 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5281, i32 0, i32 4
%.tmp5283 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5282
%.tmp5284 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5283, i32 0, i32 4
%.tmp5285 = call %m2624$.Type.type*() @m295$type_ptr_of_chr.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5285, %m2624$.Type.type** %.tmp5284
%.tmp5286 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lit.5243
%.tmp5287 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5286, i32 0, i32 4
%.tmp5288 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5287
%.tmp5289 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5288, i32 0, i32 3
%.tmp5290 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5289
%.tmp5291 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5290, i32 0, i32 4
%.tmp5292 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5291
%.tmp5293 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5292, i32 0, i32 4
%.tmp5294 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5293
%.tmp5295 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5294, i32 0, i32 4
%.tmp5296 = call %m2624$.Type.type*() @m295$type_ptr_of_chr.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5296, %m2624$.Type.type** %.tmp5295
%.tmp5297 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5299 = getelementptr [21 x i8], [21 x i8]*@.str5298, i32 0, i32 0
%.tmp5301 = getelementptr [7 x i8], [7 x i8]*@.str5300, i32 0, i32 0
%.tmp5302 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lit.5243
call void(%m2624$.CompilerCtx.type*,i8*,i8*,%m2624$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2624$.CompilerCtx.typep.cp.cp.m2624$.AssignableInfo.typep.b.b(%m2624$.CompilerCtx.type* %.tmp5297, i8* %.tmp5299, i8* %.tmp5301, %m2624$.AssignableInfo.type* %.tmp5302, i1 1, i1 0)
%.tmp5303 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5304 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp5303)
%info_lat.5305 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp5304, %m2624$.AssignableInfo.type** %info_lat.5305
%.tmp5306 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lat.5305
%.tmp5307 = load i8, i8* @SCOPE_GLOBAL
%.tmp5309 = getelementptr [23 x i8], [23 x i8]*@.str5308, i32 0, i32 0
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp5306, i8 %.tmp5307, i8* %.tmp5309)
%.tmp5310 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lat.5305
%.tmp5311 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5310, i32 0, i32 4
%.tmp5312 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5312, %m2624$.Type.type** %.tmp5311
%.tmp5313 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lat.5305
%.tmp5314 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5313, i32 0, i32 4
%.tmp5315 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5314
%.tmp5316 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5315, i32 0, i32 0
%.tmp5318 = getelementptr [9 x i8], [9 x i8]*@.str5317, i32 0, i32 0
store i8* %.tmp5318, i8** %.tmp5316
%.tmp5319 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lat.5305
%.tmp5320 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5319, i32 0, i32 4
%.tmp5321 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5320
%.tmp5322 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5321, i32 0, i32 3
%.tmp5323 = call %m2624$.Type.type*() @m295$type_ptr_of_chr.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5323, %m2624$.Type.type** %.tmp5322
%.tmp5324 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lat.5305
%.tmp5325 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5324, i32 0, i32 4
%.tmp5326 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5325
%.tmp5327 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5326, i32 0, i32 3
%.tmp5328 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5327
%.tmp5329 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5328, i32 0, i32 4
%.tmp5330 = call %m2624$.Type.type*() @m295$type_ptr_of_chr.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5330, %m2624$.Type.type** %.tmp5329
%.tmp5331 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5333 = getelementptr [23 x i8], [23 x i8]*@.str5332, i32 0, i32 0
%.tmp5335 = getelementptr [7 x i8], [7 x i8]*@.str5334, i32 0, i32 0
%.tmp5336 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_lat.5305
call void(%m2624$.CompilerCtx.type*,i8*,i8*,%m2624$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2624$.CompilerCtx.typep.cp.cp.m2624$.AssignableInfo.typep.b.b(%m2624$.CompilerCtx.type* %.tmp5331, i8* %.tmp5333, i8* %.tmp5335, %m2624$.AssignableInfo.type* %.tmp5336, i1 1, i1 0)
%.tmp5337 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5338 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp5337)
%info_mmap.5339 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp5338, %m2624$.AssignableInfo.type** %info_mmap.5339
%.tmp5340 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_mmap.5339
%.tmp5341 = load i8, i8* @SCOPE_GLOBAL
%.tmp5343 = getelementptr [5 x i8], [5 x i8]*@.str5342, i32 0, i32 0
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp5340, i8 %.tmp5341, i8* %.tmp5343)
%.tmp5344 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_mmap.5339
%.tmp5345 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5344, i32 0, i32 4
%.tmp5346 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5346, %m2624$.Type.type** %.tmp5345
%.tmp5347 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_mmap.5339
%.tmp5348 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5347, i32 0, i32 4
%.tmp5349 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5348
%.tmp5350 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5349, i32 0, i32 0
%.tmp5352 = getelementptr [9 x i8], [9 x i8]*@.str5351, i32 0, i32 0
store i8* %.tmp5352, i8** %.tmp5350
%.tmp5353 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_mmap.5339
%.tmp5354 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5353, i32 0, i32 4
%.tmp5355 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5354
%.tmp5356 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5355, i32 0, i32 3
%.tmp5357 = call %m2624$.Type.type*() @m295$type_ptr_of_chr.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5357, %m2624$.Type.type** %.tmp5356
%.tmp5358 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_mmap.5339
%.tmp5359 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5358, i32 0, i32 4
%.tmp5360 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5359
%.tmp5361 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5360, i32 0, i32 3
%.tmp5362 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5361
%lt.5363 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp5362, %m2624$.Type.type** %lt.5363
%.tmp5364 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5365 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5364, i32 0, i32 4
%.tmp5366 = call %m2624$.Type.type*() @m295$type_ptr_of_chr.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5366, %m2624$.Type.type** %.tmp5365
%.tmp5367 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5368 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5367, i32 0, i32 4
%.tmp5369 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5368
store %m2624$.Type.type* %.tmp5369, %m2624$.Type.type** %lt.5363
%.tmp5370 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5371 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5370, i32 0, i32 4
%.tmp5372 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5372, %m2624$.Type.type** %.tmp5371
%.tmp5373 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5374 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5373, i32 0, i32 4
%.tmp5375 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5374
%.tmp5376 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5375, i32 0, i32 0
%.tmp5378 = getelementptr [4 x i8], [4 x i8]*@.str5377, i32 0, i32 0
store i8* %.tmp5378, i8** %.tmp5376
%.tmp5379 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5380 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5379, i32 0, i32 4
%.tmp5381 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5380
store %m2624$.Type.type* %.tmp5381, %m2624$.Type.type** %lt.5363
%.tmp5382 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5383 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5382, i32 0, i32 4
%.tmp5384 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5384, %m2624$.Type.type** %.tmp5383
%.tmp5385 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5386 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5385, i32 0, i32 4
%.tmp5387 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5386
%.tmp5388 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5387, i32 0, i32 0
%.tmp5390 = getelementptr [4 x i8], [4 x i8]*@.str5389, i32 0, i32 0
store i8* %.tmp5390, i8** %.tmp5388
%.tmp5391 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5392 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5391, i32 0, i32 4
%.tmp5393 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5392
store %m2624$.Type.type* %.tmp5393, %m2624$.Type.type** %lt.5363
%.tmp5394 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5395 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5394, i32 0, i32 4
%.tmp5396 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5396, %m2624$.Type.type** %.tmp5395
%.tmp5397 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5398 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5397, i32 0, i32 4
%.tmp5399 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5398
%.tmp5400 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5399, i32 0, i32 0
%.tmp5402 = getelementptr [4 x i8], [4 x i8]*@.str5401, i32 0, i32 0
store i8* %.tmp5402, i8** %.tmp5400
%.tmp5403 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5404 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5403, i32 0, i32 4
%.tmp5405 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5404
store %m2624$.Type.type* %.tmp5405, %m2624$.Type.type** %lt.5363
%.tmp5406 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5407 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5406, i32 0, i32 4
%.tmp5408 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5408, %m2624$.Type.type** %.tmp5407
%.tmp5409 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5410 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5409, i32 0, i32 4
%.tmp5411 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5410
%.tmp5412 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5411, i32 0, i32 0
%.tmp5414 = getelementptr [4 x i8], [4 x i8]*@.str5413, i32 0, i32 0
store i8* %.tmp5414, i8** %.tmp5412
%.tmp5415 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5416 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5415, i32 0, i32 4
%.tmp5417 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5416
store %m2624$.Type.type* %.tmp5417, %m2624$.Type.type** %lt.5363
%.tmp5418 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5419 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5418, i32 0, i32 4
%.tmp5420 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5420, %m2624$.Type.type** %.tmp5419
%.tmp5421 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5422 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5421, i32 0, i32 4
%.tmp5423 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5422
%.tmp5424 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5423, i32 0, i32 0
%.tmp5426 = getelementptr [4 x i8], [4 x i8]*@.str5425, i32 0, i32 0
store i8* %.tmp5426, i8** %.tmp5424
%.tmp5427 = load %m2624$.Type.type*, %m2624$.Type.type** %lt.5363
%.tmp5428 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5427, i32 0, i32 4
%.tmp5429 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5428
store %m2624$.Type.type* %.tmp5429, %m2624$.Type.type** %lt.5363
%.tmp5430 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5432 = getelementptr [5 x i8], [5 x i8]*@.str5431, i32 0, i32 0
%.tmp5434 = getelementptr [7 x i8], [7 x i8]*@.str5433, i32 0, i32 0
%.tmp5435 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info_mmap.5339
call void(%m2624$.CompilerCtx.type*,i8*,i8*,%m2624$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2624$.CompilerCtx.typep.cp.cp.m2624$.AssignableInfo.typep.b.b(%m2624$.CompilerCtx.type* %.tmp5430, i8* %.tmp5432, i8* %.tmp5434, %m2624$.AssignableInfo.type* %.tmp5435, i1 1, i1 0)
%.tmp5436 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5437 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5436, i32 0, i32 6
%.tmp5438 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5437
%.tmp5440 = getelementptr [5 x i8], [5 x i8]*@.str5439, i32 0, i32 0
%.tmp5441 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp5438, i8* %.tmp5440)
%fn_name_node.5442 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5441, %m972$.Node.type** %fn_name_node.5442
%.tmp5443 = load %m972$.Node.type*, %m972$.Node.type** %fn_name_node.5442
%.tmp5444 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5443, i32 0, i32 1
%.tmp5445 = load i8*, i8** %.tmp5444
%fn_name.5446 = alloca i8*
store i8* %.tmp5445, i8** %fn_name.5446
%.tmp5447 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5448 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp5447)
%info.5449 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp5448, %m2624$.AssignableInfo.type** %info.5449
%.tmp5450 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.5449
%.tmp5451 = load i8, i8* @SCOPE_LOCAL
%.tmp5452 = load i8*, i8** %fn_name.5446
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp5450, i8 %.tmp5451, i8* %.tmp5452)
%.tmp5453 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.5449
%.tmp5454 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5453, i32 0, i32 4
%.tmp5455 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5456 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5457 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5456, i32 0, i32 6
%.tmp5458 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5457
%.tmp5459 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$syn_function_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5455, %m972$.Node.type* %.tmp5458)
store %m2624$.Type.type* %.tmp5459, %m2624$.Type.type** %.tmp5454
%.tmp5460 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.5449
%.tmp5461 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5460, i32 0, i32 3
%.tmp5463 = getelementptr [9 x i8], [9 x i8]*@.str5462, i32 0, i32 0
store i8* %.tmp5463, i8** %.tmp5461
%.tmp5464 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5465 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5466 = load i8*, i8** %fn_name.5446
%.tmp5467 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.5449
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*,%m2624$.AssignableInfo.type*) @m295$define_assignable.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp5464, %m972$.Node.type* %.tmp5465, i8* %.tmp5466, %m2624$.AssignableInfo.type* %.tmp5467)
%.tmp5468 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5469 = call i32(%m2624$.CompilerCtx.type*) @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp5468)
%closure_id.5470 = alloca i32
store i32 %.tmp5469, i32* %closure_id.5470
%.tmp5471 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.5449
%.tmp5472 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5471, i32 0, i32 4
%.tmp5473 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5472
%.tmp5474 = call %m2624$.Type.type*(%m2624$.Type.type*) @m295$type_clone.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.tmp5473)
%closure_type.5475 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp5474, %m2624$.Type.type** %closure_type.5475
%.tmp5476 = load %m2624$.Type.type*, %m2624$.Type.type** %closure_type.5475
%.tmp5477 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5476, i32 0, i32 3
%.tmp5478 = load %m2624$.Type.type*, %m2624$.Type.type** %closure_type.5475
%.tmp5479 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5478, i32 0, i32 3
%.tmp5480 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5479
%.tmp5481 = call %m2624$.Type.type*(%m2624$.Type.type*) @m295$type_clone.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.tmp5480)
store %m2624$.Type.type* %.tmp5481, %m2624$.Type.type** %.tmp5477
%.tmp5482 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%ctx_param.5483 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp5482, %m2624$.Type.type** %ctx_param.5483
%.tmp5484 = load %m2624$.Type.type*, %m2624$.Type.type** %ctx_param.5483
%.tmp5485 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5484, i32 0, i32 0
%.tmp5487 = getelementptr [4 x i8], [4 x i8]*@.str5486, i32 0, i32 0
store i8* %.tmp5487, i8** %.tmp5485
%.tmp5488 = load %m2624$.Type.type*, %m2624$.Type.type** %ctx_param.5483
%.tmp5489 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5488, i32 0, i32 3
%.tmp5490 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp5490, %m2624$.Type.type** %.tmp5489
%.tmp5491 = load %m2624$.Type.type*, %m2624$.Type.type** %ctx_param.5483
%.tmp5492 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5491, i32 0, i32 3
%.tmp5493 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5492
%.tmp5494 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5493, i32 0, i32 0
%.tmp5496 = getelementptr [7 x i8], [7 x i8]*@.str5495, i32 0, i32 0
store i8* %.tmp5496, i8** %.tmp5494
%.tmp5497 = load %m2624$.Type.type*, %m2624$.Type.type** %ctx_param.5483
%.tmp5498 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5497, i32 0, i32 4
%.tmp5499 = load %m2624$.Type.type*, %m2624$.Type.type** %closure_type.5475
%.tmp5500 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5499, i32 0, i32 3
%.tmp5501 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5500
%.tmp5502 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5501, i32 0, i32 4
%.tmp5503 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5502
store %m2624$.Type.type* %.tmp5503, %m2624$.Type.type** %.tmp5498
%.tmp5504 = load %m2624$.Type.type*, %m2624$.Type.type** %closure_type.5475
%.tmp5505 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5504, i32 0, i32 3
%.tmp5506 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5505
%.tmp5507 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5506, i32 0, i32 4
%.tmp5508 = load %m2624$.Type.type*, %m2624$.Type.type** %ctx_param.5483
store %m2624$.Type.type* %.tmp5508, %m2624$.Type.type** %.tmp5507
%.tmp5510 = getelementptr [1 x i8], [1 x i8]*@.str5509, i32 0, i32 0
%closure_name.5511 = alloca i8*
store i8* %.tmp5510, i8** %closure_name.5511
%.tmp5512 = getelementptr i8*, i8** %closure_name.5511, i32 0
%.tmp5514 = getelementptr [5 x i8], [5 x i8]*@.str5513, i32 0, i32 0
%.tmp5515 = load i32, i32* %closure_id.5470
%.tmp5516 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5512, i8* %.tmp5514, i32 %.tmp5515)
%.tmp5517 = load %m2624$.Type.type*, %m2624$.Type.type** %closure_type.5475
%.tmp5518 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5517, i32 0, i32 3
%.tmp5519 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5518
%.tmp5520 = call %m2624$.Type.type*(%m2624$.Type.type*) @m295$type_clone.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.tmp5519)
%ret_type.5521 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp5520, %m2624$.Type.type** %ret_type.5521
%.tmp5522 = load %m2624$.Type.type*, %m2624$.Type.type** %ret_type.5521
%.tmp5523 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp5522, i32 0, i32 3
store %m2624$.Type.type* null, %m2624$.Type.type** %.tmp5523
%.tmp5524 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5525 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5524, i32 0, i32 1
%.tmp5526 = load %m0$.File.type*, %m0$.File.type** %.tmp5525
%.tmp5528 = getelementptr [101 x i8], [101 x i8]*@.str5527, i32 0, i32 0
%.tmp5529 = load i32, i32* %closure_id.5470
%.tmp5530 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5526, i8* %.tmp5528, i32 %.tmp5529)
%.tmp5531 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5532 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5531, i32 0, i32 1
%.tmp5533 = load %m0$.File.type*, %m0$.File.type** %.tmp5532
%.tmp5535 = getelementptr [100 x i8], [100 x i8]*@.str5534, i32 0, i32 0
%.tmp5536 = load i32, i32* %closure_id.5470
%.tmp5537 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5538 = load %m2624$.Type.type*, %m2624$.Type.type** %closure_type.5475
%.tmp5539 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp5537, %m2624$.Type.type* %.tmp5538)
%.tmp5540 = load i8*, i8** %closure_name.5511
%.tmp5541 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5533, i8* %.tmp5535, i32 %.tmp5536, i8* %.tmp5539, i8* %.tmp5540)
%.tmp5542 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5543 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5542, i32 0, i32 1
%.tmp5544 = load %m0$.File.type*, %m0$.File.type** %.tmp5543
%.tmp5546 = getelementptr [66 x i8], [66 x i8]*@.str5545, i32 0, i32 0
%.tmp5547 = load i32, i32* %closure_id.5470
%.tmp5548 = load i32, i32* %closure_id.5470
%.tmp5549 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5544, i8* %.tmp5546, i32 %.tmp5547, i32 %.tmp5548)
%.tmp5550 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5551 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5550, i32 0, i32 1
%.tmp5552 = load %m0$.File.type*, %m0$.File.type** %.tmp5551
%.tmp5554 = getelementptr [35 x i8], [35 x i8]*@.str5553, i32 0, i32 0
%.tmp5555 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.5449
%.tmp5556 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp5555)
%.tmp5557 = load i32, i32* %closure_id.5470
%.tmp5558 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5559 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.5449
%.tmp5560 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5559, i32 0, i32 4
%.tmp5561 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5560
%.tmp5562 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp5558, %m2624$.Type.type* %.tmp5561)
%.tmp5563 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5552, i8* %.tmp5554, i8* %.tmp5556, i32 %.tmp5557, i8* %.tmp5562)
%.tmp5564 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5565 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5564, i32 0, i32 1
%.tmp5566 = load %m0$.File.type*, %m0$.File.type** %.tmp5565
%bkp_ctx.5567 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp5566, %m0$.File.type** %bkp_ctx.5567
%.tmp5568 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5569 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5568, i32 0, i32 1
%.tmp5570 = call %m0$.File.type*() @tmpfile()
store %m0$.File.type* %.tmp5570, %m0$.File.type** %.tmp5569
%.tmp5571 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5572 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5571, i32 0, i32 1
%.tmp5573 = load %m0$.File.type*, %m0$.File.type** %.tmp5572
%.tmp5575 = getelementptr [14 x i8], [14 x i8]*@.str5574, i32 0, i32 0
%.tmp5576 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5577 = load %m2624$.Type.type*, %m2624$.Type.type** %ret_type.5521
%.tmp5578 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp5576, %m2624$.Type.type* %.tmp5577)
%.tmp5579 = load i8*, i8** %closure_name.5511
%.tmp5580 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5573, i8* %.tmp5575, i8* %.tmp5578, i8* %.tmp5579)
%.tmp5581 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5583 = getelementptr [9 x i8], [9 x i8]*@.str5582, i32 0, i32 0
%.tmp5584 = bitcast ptr null to i8*
%.tmp5585 = bitcast ptr null to i8*
call void(%m2624$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2624$.CompilerCtx.typep.cp.cp.cp(%m2624$.CompilerCtx.type* %.tmp5581, i8* %.tmp5583, i8* %.tmp5584, i8* %.tmp5585)
%.tmp5586 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5587 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5586, i32 0, i32 1
%.tmp5588 = load %m0$.File.type*, %m0$.File.type** %.tmp5587
%.tmp5590 = getelementptr [13 x i8], [13 x i8]*@.str5589, i32 0, i32 0
%.tmp5591 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5592 = load %m2624$.Type.type*, %m2624$.Type.type** %ctx_param.5483
%.tmp5593 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp5591, %m2624$.Type.type* %.tmp5592)
%.tmp5594 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5588, i8* %.tmp5590, i8* %.tmp5593)
%.tmp5595 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5596 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5595, i32 0, i32 6
%.tmp5597 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5596
%.tmp5598 = call %m972$.Node.type*(%m972$.Node.type*) @m295$syn_function_params.m972$.Node.typep.m972$.Node.typep(%m972$.Node.type* %.tmp5597)
%params.5599 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5598, %m972$.Node.type** %params.5599
%param_type.5600 = alloca %m2624$.Type.type*
store %m2624$.Type.type* null, %m2624$.Type.type** %param_type.5600
%.tmp5602 = load %m972$.Node.type*, %m972$.Node.type** %params.5599
%param_ptr.5603 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5602, %m972$.Node.type** %param_ptr.5603
br label %.for.start.5601
.for.start.5601:
%.tmp5604 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.5603
%.tmp5605 = icmp ne %m972$.Node.type* %.tmp5604, null
br i1 %.tmp5605, label %.for.continue.5601, label %.for.end.5601
.for.continue.5601:
%.tmp5606 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.5603
%.tmp5607 = load %m972$.Node.type*, %m972$.Node.type** %params.5599
%.tmp5608 = icmp ne %m972$.Node.type* %.tmp5606, %.tmp5607
br i1 %.tmp5608, label %.if.true.5609, label %.if.false.5609
.if.true.5609:
%.tmp5610 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.5603
%.tmp5611 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5610, i32 0, i32 7
%.tmp5612 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5611
store %m972$.Node.type* %.tmp5612, %m972$.Node.type** %param_ptr.5603
br label %.if.end.5609
.if.false.5609:
br label %.if.end.5609
.if.end.5609:
%.tmp5613 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5614 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5613, i32 0, i32 1
%.tmp5615 = load %m0$.File.type*, %m0$.File.type** %.tmp5614
%.tmp5617 = getelementptr [3 x i8], [3 x i8]*@.str5616, i32 0, i32 0
%.tmp5618 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5615, i8* %.tmp5617)
%.tmp5619 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.5603
%.tmp5620 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5619, i32 0, i32 0
%.tmp5621 = load i8*, i8** %.tmp5620
%.tmp5623 = getelementptr [5 x i8], [5 x i8]*@.str5622, i32 0, i32 0
%.tmp5624 = call i32(i8*,i8*) @strcmp(i8* %.tmp5621, i8* %.tmp5623)
%.tmp5625 = icmp eq i32 %.tmp5624, 0
br i1 %.tmp5625, label %.if.true.5626, label %.if.false.5626
.if.true.5626:
%.tmp5627 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5628 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.5603
%.tmp5629 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5628, i32 0, i32 6
%.tmp5630 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5629
%.tmp5631 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5627, %m972$.Node.type* %.tmp5630)
store %m2624$.Type.type* %.tmp5631, %m2624$.Type.type** %param_type.5600
%.tmp5632 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.5603
%.tmp5633 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5632, i32 0, i32 7
%.tmp5634 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5633
store %m972$.Node.type* %.tmp5634, %m972$.Node.type** %param_ptr.5603
br label %.if.end.5626
.if.false.5626:
br label %.if.end.5626
.if.end.5626:
%.tmp5635 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5636 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5635, i32 0, i32 1
%.tmp5637 = load %m0$.File.type*, %m0$.File.type** %.tmp5636
%.tmp5639 = getelementptr [13 x i8], [13 x i8]*@.str5638, i32 0, i32 0
%.tmp5640 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5641 = load %m2624$.Type.type*, %m2624$.Type.type** %param_type.5600
%.tmp5642 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp5640, %m2624$.Type.type* %.tmp5641)
%.tmp5643 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.5603
%.tmp5644 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5643, i32 0, i32 1
%.tmp5645 = load i8*, i8** %.tmp5644
%.tmp5646 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5637, i8* %.tmp5639, i8* %.tmp5642, i8* %.tmp5645)
%.tmp5647 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.5603
%.tmp5648 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5647, i32 0, i32 7
%.tmp5649 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5648
store %m972$.Node.type* %.tmp5649, %m972$.Node.type** %param_ptr.5603
br label %.for.start.5601
.for.end.5601:
%.tmp5650 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5651 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5650, i32 0, i32 1
%.tmp5652 = load %m0$.File.type*, %m0$.File.type** %.tmp5651
%.tmp5654 = getelementptr [5 x i8], [5 x i8]*@.str5653, i32 0, i32 0
%.tmp5655 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5652, i8* %.tmp5654)
%.tmp5656 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5657 = load %m972$.Node.type*, %m972$.Node.type** %params.5599
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_fn_params.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5656, %m972$.Node.type* %.tmp5657)
%.tmp5658 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5659 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5658, i32 0, i32 6
%.tmp5660 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5659
%.tmp5662 = getelementptr [6 x i8], [6 x i8]*@.str5661, i32 0, i32 0
%.tmp5663 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp5660, i8* %.tmp5662)
%block.5664 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5663, %m972$.Node.type** %block.5664
%.tmp5665 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5666 = load %m972$.Node.type*, %m972$.Node.type** %block.5664
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_block.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5665, %m972$.Node.type* %.tmp5666)
%.tmp5667 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5668 = load %m972$.Node.type*, %m972$.Node.type** %block.5664
%.tmp5669 = load %m2624$.Type.type*, %m2624$.Type.type** %ret_type.5521
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,%m2624$.Type.type*) @m295$check_n_add_implicit_return.v.m2624$.CompilerCtx.typep.m972$.Node.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp5667, %m972$.Node.type* %.tmp5668, %m2624$.Type.type* %.tmp5669)
%.tmp5670 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
call void(%m2624$.CompilerCtx.type*) @m295$pop_scope.v.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp5670)
%.tmp5671 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5672 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5671, i32 0, i32 1
%.tmp5673 = load %m0$.File.type*, %m0$.File.type** %.tmp5672
%.tmp5675 = getelementptr [3 x i8], [3 x i8]*@.str5674, i32 0, i32 0
%.tmp5676 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5673, i8* %.tmp5675)
%.tmp5677 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5678 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5677, i32 0, i32 1
%.tmp5679 = load %m0$.File.type*, %m0$.File.type** %.tmp5678
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp5679)
%.tmp5680 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5681 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5680, i32 0, i32 1
%.tmp5682 = load %m0$.File.type*, %m0$.File.type** %.tmp5681
%.tmp5683 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp5682)
%.tmp5684 = call i8*(i32) @m1$readall.cp.i(i32 %.tmp5683)
%code.5685 = alloca i8*
store i8* %.tmp5684, i8** %code.5685
%.tmp5686 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5687 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5686, i32 0, i32 1
%.tmp5688 = load %m0$.File.type*, %m0$.File.type** %.tmp5687
%.tmp5689 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp5688)
%.tmp5690 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5691 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5690, i32 0, i32 1
%.tmp5692 = load %m0$.File.type*, %m0$.File.type** %bkp_ctx.5567
store %m0$.File.type* %.tmp5692, %m0$.File.type** %.tmp5691
%.tmp5693 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5694 = load i8*, i8** %code.5685
call void(%m2624$.CompilerCtx.type*,i8*) @m295$append_anon_fn.v.m2624$.CompilerCtx.typep.cp(%m2624$.CompilerCtx.type* %.tmp5693, i8* %.tmp5694)
ret void
}
define void @m295$check_n_add_implicit_return.v.m2624$.CompilerCtx.typep.m972$.Node.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg, %m2624$.Type.type* %.return_type.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%return_type = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.return_type.arg, %m2624$.Type.type** %return_type
%.tmp5695 = bitcast ptr null to %m972$.Node.type*
%li.5696 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5695, %m972$.Node.type** %li.5696
%.tmp5697 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5698 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5697, i32 0, i32 6
%.tmp5699 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5698
%.tmp5701 = getelementptr [12 x i8], [12 x i8]*@.str5700, i32 0, i32 0
%.tmp5702 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp5699, i8* %.tmp5701)
%exprs.5703 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5702, %m972$.Node.type** %exprs.5703
%.tmp5705 = load %m972$.Node.type*, %m972$.Node.type** %exprs.5703
%.tmp5706 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5705, i32 0, i32 6
%.tmp5707 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5706
%ci.5708 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5707, %m972$.Node.type** %ci.5708
br label %.for.start.5704
.for.start.5704:
%.tmp5709 = load %m972$.Node.type*, %m972$.Node.type** %ci.5708
%.tmp5710 = icmp ne %m972$.Node.type* %.tmp5709, null
br i1 %.tmp5710, label %.for.continue.5704, label %.for.end.5704
.for.continue.5704:
%.tmp5711 = load %m972$.Node.type*, %m972$.Node.type** %ci.5708
%.tmp5712 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5711, i32 0, i32 0
%.tmp5713 = load i8*, i8** %.tmp5712
%.tmp5715 = getelementptr [3 x i8], [3 x i8]*@.str5714, i32 0, i32 0
%.tmp5716 = call i32(i8*,i8*) @strcmp(i8* %.tmp5713, i8* %.tmp5715)
%.tmp5717 = icmp ne i32 %.tmp5716, 0
br i1 %.tmp5717, label %.if.true.5718, label %.if.false.5718
.if.true.5718:
%.tmp5719 = load %m972$.Node.type*, %m972$.Node.type** %ci.5708
store %m972$.Node.type* %.tmp5719, %m972$.Node.type** %li.5696
br label %.if.end.5718
.if.false.5718:
br label %.if.end.5718
.if.end.5718:
%.tmp5720 = load %m972$.Node.type*, %m972$.Node.type** %ci.5708
%.tmp5721 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5720, i32 0, i32 7
%.tmp5722 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5721
store %m972$.Node.type* %.tmp5722, %m972$.Node.type** %ci.5708
br label %.for.start.5704
.for.end.5704:
%.tmp5723 = load %m972$.Node.type*, %m972$.Node.type** %li.5696
%.tmp5724 = icmp ne %m972$.Node.type* %.tmp5723, null
br i1 %.tmp5724, label %.if.true.5725, label %.if.false.5725
.if.true.5725:
%.tmp5726 = load %m972$.Node.type*, %m972$.Node.type** %li.5696
%.tmp5727 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5726, i32 0, i32 6
%.tmp5728 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5727
%.tmp5729 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5728, i32 0, i32 0
%.tmp5730 = load i8*, i8** %.tmp5729
%.tmp5732 = getelementptr [7 x i8], [7 x i8]*@.str5731, i32 0, i32 0
%.tmp5733 = call i32(i8*,i8*) @strcmp(i8* %.tmp5730, i8* %.tmp5732)
%.tmp5734 = icmp eq i32 %.tmp5733, 0
br i1 %.tmp5734, label %.if.true.5735, label %.if.false.5735
.if.true.5735:
ret void
br label %.if.end.5735
.if.false.5735:
br label %.if.end.5735
.if.end.5735:
br label %.if.end.5725
.if.false.5725:
br label %.if.end.5725
.if.end.5725:
%.tmp5736 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5737 = load %m2624$.Type.type*, %m2624$.Type.type** %return_type
%.tmp5738 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp5736, %m2624$.Type.type* %.tmp5737)
%.tmp5740 = getelementptr [5 x i8], [5 x i8]*@.str5739, i32 0, i32 0
%.tmp5741 = call i32(i8*,i8*) @strcmp(i8* %.tmp5738, i8* %.tmp5740)
%.tmp5742 = icmp ne i32 %.tmp5741, 0
br i1 %.tmp5742, label %.if.true.5743, label %.if.false.5743
.if.true.5743:
%.tmp5744 = load %m972$.Node.type*, %m972$.Node.type** %li.5696
%.tmp5745 = icmp ne %m972$.Node.type* %.tmp5744, null
br i1 %.tmp5745, label %.if.true.5746, label %.if.false.5746
.if.true.5746:
%.tmp5747 = load %m972$.Node.type*, %m972$.Node.type** %li.5696
store %m972$.Node.type* %.tmp5747, %m972$.Node.type** %stmt
br label %.if.end.5746
.if.false.5746:
br label %.if.end.5746
.if.end.5746:
%.tmp5748 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5749 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5751 = getelementptr [21 x i8], [21 x i8]*@.str5750, i32 0, i32 0
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp5748, %m972$.Node.type* %.tmp5749, i8* %.tmp5751)
br label %.if.end.5743
.if.false.5743:
%.tmp5752 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5753 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5752, i32 0, i32 1
%.tmp5754 = load %m0$.File.type*, %m0$.File.type** %.tmp5753
%.tmp5756 = getelementptr [10 x i8], [10 x i8]*@.str5755, i32 0, i32 0
%.tmp5757 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5754, i8* %.tmp5756)
br label %.if.end.5743
.if.end.5743:
ret void
}
define void @m295$compile_for_loop.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%.tmp5758 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5759 = call i32(%m2624$.CompilerCtx.type*) @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp5758)
%for_id.5760 = alloca i32
store i32 %.tmp5759, i32* %for_id.5760
%.tmp5761 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5762 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5761, i32 0, i32 6
%.tmp5763 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5762
%.tmp5764 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5763, i32 0, i32 7
%.tmp5765 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5764
%init_stmt.5766 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5765, %m972$.Node.type** %init_stmt.5766
%.tmp5767 = bitcast ptr null to i8*
%begin_lbl.5768 = alloca i8*
store i8* %.tmp5767, i8** %begin_lbl.5768
%.tmp5769 = bitcast ptr null to i8*
%end_lbl.5770 = alloca i8*
store i8* %.tmp5769, i8** %end_lbl.5770
%.tmp5771 = getelementptr i8*, i8** %begin_lbl.5768, i32 0
%.tmp5773 = getelementptr [14 x i8], [14 x i8]*@.str5772, i32 0, i32 0
%.tmp5774 = load i32, i32* %for_id.5760
%.tmp5775 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5771, i8* %.tmp5773, i32 %.tmp5774)
%.tmp5776 = getelementptr i8*, i8** %end_lbl.5770, i32 0
%.tmp5778 = getelementptr [12 x i8], [12 x i8]*@.str5777, i32 0, i32 0
%.tmp5779 = load i32, i32* %for_id.5760
%.tmp5780 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5776, i8* %.tmp5778, i32 %.tmp5779)
%.tmp5781 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5783 = getelementptr [4 x i8], [4 x i8]*@.str5782, i32 0, i32 0
%.tmp5784 = load i8*, i8** %begin_lbl.5768
%.tmp5785 = load i8*, i8** %end_lbl.5770
call void(%m2624$.CompilerCtx.type*,i8*,i8*,i8*) @m295$push_scope.v.m2624$.CompilerCtx.typep.cp.cp.cp(%m2624$.CompilerCtx.type* %.tmp5781, i8* %.tmp5783, i8* %.tmp5784, i8* %.tmp5785)
%.tmp5786 = load %m972$.Node.type*, %m972$.Node.type** %init_stmt.5766
%.tmp5787 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5786, i32 0, i32 0
%.tmp5788 = load i8*, i8** %.tmp5787
%.tmp5790 = getelementptr [12 x i8], [12 x i8]*@.str5789, i32 0, i32 0
%.tmp5791 = call i32(i8*,i8*) @strcmp(i8* %.tmp5788, i8* %.tmp5790)
%.tmp5792 = icmp eq i32 %.tmp5791, 0
br i1 %.tmp5792, label %.if.true.5793, label %.if.false.5793
.if.true.5793:
%.tmp5794 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5795 = load %m972$.Node.type*, %m972$.Node.type** %init_stmt.5766
%.tmp5796 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_declaration.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5794, %m972$.Node.type* %.tmp5795)
br label %.if.end.5793
.if.false.5793:
%.tmp5797 = load %m972$.Node.type*, %m972$.Node.type** %init_stmt.5766
%.tmp5798 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5797, i32 0, i32 0
%.tmp5799 = load i8*, i8** %.tmp5798
%.tmp5801 = getelementptr [11 x i8], [11 x i8]*@.str5800, i32 0, i32 0
%.tmp5802 = call i32(i8*,i8*) @strcmp(i8* %.tmp5799, i8* %.tmp5801)
%.tmp5803 = icmp eq i32 %.tmp5802, 0
br i1 %.tmp5803, label %.if.true.5804, label %.if.false.5804
.if.true.5804:
%.tmp5805 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5806 = load %m972$.Node.type*, %m972$.Node.type** %init_stmt.5766
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_expression.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5805, %m972$.Node.type* %.tmp5806)
br label %.if.end.5804
.if.false.5804:
%.tmp5807 = load %m972$.Node.type*, %m972$.Node.type** %init_stmt.5766
%.tmp5808 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5807, i32 0, i32 0
%.tmp5809 = load i8*, i8** %.tmp5808
%.tmp5811 = getelementptr [9 x i8], [9 x i8]*@.str5810, i32 0, i32 0
%.tmp5812 = call i32(i8*,i8*) @strcmp(i8* %.tmp5809, i8* %.tmp5811)
%.tmp5813 = icmp eq i32 %.tmp5812, 0
br i1 %.tmp5813, label %.if.true.5814, label %.if.false.5814
.if.true.5814:
br label %.if.end.5814
.if.false.5814:
%.tmp5815 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5816 = load %m972$.Node.type*, %m972$.Node.type** %init_stmt.5766
%.tmp5818 = getelementptr [66 x i8], [66 x i8]*@.str5817, i32 0, i32 0
%.tmp5819 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp5815, %m972$.Node.type* %.tmp5816, i8* %.tmp5818)
%.tmp5820 = load %m972$.Node.type*, %m972$.Node.type** %init_stmt.5766
%.tmp5821 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5820, i32 0, i32 0
%.tmp5822 = load i8*, i8** %.tmp5821
%.tmp5823 = call i32(i8*,...) @printf(i8* %.tmp5819, i8* %.tmp5822)
%.tmp5824 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
call void(%m2624$.CompilerCtx.type*) @m295$pop_scope.v.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp5824)
ret void
br label %.if.end.5814
.if.end.5814:
br label %.if.end.5804
.if.end.5804:
br label %.if.end.5793
.if.end.5793:
%.tmp5825 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5826 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5825, i32 0, i32 1
%.tmp5827 = load %m0$.File.type*, %m0$.File.type** %.tmp5826
%.tmp5829 = getelementptr [26 x i8], [26 x i8]*@.str5828, i32 0, i32 0
%.tmp5830 = load i32, i32* %for_id.5760
%.tmp5831 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5827, i8* %.tmp5829, i32 %.tmp5830)
%.tmp5832 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5833 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5832, i32 0, i32 1
%.tmp5834 = load %m0$.File.type*, %m0$.File.type** %.tmp5833
%.tmp5836 = getelementptr [16 x i8], [16 x i8]*@.str5835, i32 0, i32 0
%.tmp5837 = load i32, i32* %for_id.5760
%.tmp5838 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5834, i8* %.tmp5836, i32 %.tmp5837)
%.tmp5839 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5840 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5839, i32 0, i32 6
%.tmp5841 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5840
%.tmp5843 = getelementptr [9 x i8], [9 x i8]*@.str5842, i32 0, i32 0
%.tmp5844 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp5841, i8* %.tmp5843)
%fst_colon.5845 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5844, %m972$.Node.type** %fst_colon.5845
%.tmp5846 = load %m972$.Node.type*, %m972$.Node.type** %fst_colon.5845
%.tmp5847 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5846, i32 0, i32 7
%.tmp5848 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5847
%condition.5849 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5848, %m972$.Node.type** %condition.5849
%.tmp5850 = load %m972$.Node.type*, %m972$.Node.type** %condition.5849
%.tmp5851 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5850, i32 0, i32 0
%.tmp5852 = load i8*, i8** %.tmp5851
%.tmp5854 = getelementptr [9 x i8], [9 x i8]*@.str5853, i32 0, i32 0
%.tmp5855 = call i32(i8*,i8*) @strcmp(i8* %.tmp5852, i8* %.tmp5854)
%.tmp5856 = icmp eq i32 %.tmp5855, 0
br i1 %.tmp5856, label %.if.true.5857, label %.if.false.5857
.if.true.5857:
%.tmp5858 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5859 = load %m972$.Node.type*, %m972$.Node.type** %condition.5849
%.tmp5861 = getelementptr [39 x i8], [39 x i8]*@.str5860, i32 0, i32 0
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp5858, %m972$.Node.type* %.tmp5859, i8* %.tmp5861)
ret void
br label %.if.end.5857
.if.false.5857:
br label %.if.end.5857
.if.end.5857:
%.tmp5862 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5863 = load %m972$.Node.type*, %m972$.Node.type** %condition.5849
%.tmp5864 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_assignable.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5862, %m972$.Node.type* %.tmp5863)
%condition_info.5865 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp5864, %m2624$.AssignableInfo.type** %condition_info.5865
%.tmp5866 = load %m972$.Node.type*, %m972$.Node.type** %fst_colon.5845
%.tmp5867 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5866, i32 0, i32 7
%.tmp5868 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5867
%.tmp5870 = getelementptr [9 x i8], [9 x i8]*@.str5869, i32 0, i32 0
%.tmp5871 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp5868, i8* %.tmp5870)
%snd_colon.5872 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5871, %m972$.Node.type** %snd_colon.5872
%.tmp5873 = load %m972$.Node.type*, %m972$.Node.type** %snd_colon.5872
%.tmp5875 = getelementptr [6 x i8], [6 x i8]*@.str5874, i32 0, i32 0
%.tmp5876 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp5873, i8* %.tmp5875)
%for_body.5877 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5876, %m972$.Node.type** %for_body.5877
%.tmp5878 = load %m972$.Node.type*, %m972$.Node.type** %for_body.5877
%.tmp5880 = getelementptr [11 x i8], [11 x i8]*@.str5879, i32 0, i32 0
%.tmp5881 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp5878, i8* %.tmp5880)
%else_block.5882 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5881, %m972$.Node.type** %else_block.5882
%.tmp5883 = load i8*, i8** %end_lbl.5770
%on_end.5884 = alloca i8*
store i8* %.tmp5883, i8** %on_end.5884
%.tmp5885 = load %m972$.Node.type*, %m972$.Node.type** %else_block.5882
%.tmp5886 = icmp ne %m972$.Node.type* %.tmp5885, null
br i1 %.tmp5886, label %.if.true.5887, label %.if.false.5887
.if.true.5887:
%.tmp5888 = getelementptr i8*, i8** %on_end.5884, i32 0
%.tmp5890 = getelementptr [13 x i8], [13 x i8]*@.str5889, i32 0, i32 0
%.tmp5891 = load i32, i32* %for_id.5760
%.tmp5892 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5888, i8* %.tmp5890, i32 %.tmp5891)
br label %.if.end.5887
.if.false.5887:
br label %.if.end.5887
.if.end.5887:
%.tmp5893 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5894 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5893, i32 0, i32 1
%.tmp5895 = load %m0$.File.type*, %m0$.File.type** %.tmp5894
%.tmp5897 = getelementptr [48 x i8], [48 x i8]*@.str5896, i32 0, i32 0
%.tmp5898 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5899 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %condition_info.5865
%.tmp5900 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp5899, i32 0, i32 4
%.tmp5901 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp5900
%.tmp5902 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp5898, %m2624$.Type.type* %.tmp5901)
%.tmp5903 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %condition_info.5865
%.tmp5904 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp5903)
%.tmp5905 = load i32, i32* %for_id.5760
%.tmp5906 = load i8*, i8** %on_end.5884
%.tmp5907 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5895, i8* %.tmp5897, i8* %.tmp5902, i8* %.tmp5904, i32 %.tmp5905, i8* %.tmp5906)
%.tmp5908 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5909 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5908, i32 0, i32 1
%.tmp5910 = load %m0$.File.type*, %m0$.File.type** %.tmp5909
%.tmp5912 = getelementptr [19 x i8], [19 x i8]*@.str5911, i32 0, i32 0
%.tmp5913 = load i32, i32* %for_id.5760
%.tmp5914 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5910, i8* %.tmp5912, i32 %.tmp5913)
%.tmp5915 = load %m972$.Node.type*, %m972$.Node.type** %snd_colon.5872
%.tmp5916 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5915, i32 0, i32 7
%.tmp5917 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5916
%increment.5918 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5917, %m972$.Node.type** %increment.5918
%.tmp5919 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5920 = load %m972$.Node.type*, %m972$.Node.type** %for_body.5877
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_block.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5919, %m972$.Node.type* %.tmp5920)
%.tmp5921 = load %m972$.Node.type*, %m972$.Node.type** %increment.5918
%.tmp5922 = load %m972$.Node.type*, %m972$.Node.type** %for_body.5877
%.tmp5923 = icmp ne %m972$.Node.type* %.tmp5921, %.tmp5922
br i1 %.tmp5923, label %.if.true.5924, label %.if.false.5924
.if.true.5924:
%.tmp5925 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5926 = load %m972$.Node.type*, %m972$.Node.type** %increment.5918
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_expression.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5925, %m972$.Node.type* %.tmp5926)
br label %.if.end.5924
.if.false.5924:
br label %.if.end.5924
.if.end.5924:
%.tmp5927 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5928 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5927, i32 0, i32 1
%.tmp5929 = load %m0$.File.type*, %m0$.File.type** %.tmp5928
%.tmp5931 = getelementptr [15 x i8], [15 x i8]*@.str5930, i32 0, i32 0
%.tmp5932 = load i8*, i8** %begin_lbl.5768
%.tmp5933 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5929, i8* %.tmp5931, i8* %.tmp5932)
%.tmp5934 = load %m972$.Node.type*, %m972$.Node.type** %else_block.5882
%.tmp5935 = icmp ne %m972$.Node.type* %.tmp5934, null
br i1 %.tmp5935, label %.if.true.5936, label %.if.false.5936
.if.true.5936:
%.tmp5937 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5938 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5937, i32 0, i32 1
%.tmp5939 = load %m0$.File.type*, %m0$.File.type** %.tmp5938
%.tmp5941 = getelementptr [15 x i8], [15 x i8]*@.str5940, i32 0, i32 0
%.tmp5942 = load i32, i32* %for_id.5760
%.tmp5943 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5939, i8* %.tmp5941, i32 %.tmp5942)
%.tmp5944 = load %m972$.Node.type*, %m972$.Node.type** %else_block.5882
%.tmp5945 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5944, i32 0, i32 6
%.tmp5946 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5945
%.tmp5948 = getelementptr [6 x i8], [6 x i8]*@.str5947, i32 0, i32 0
%.tmp5949 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp5946, i8* %.tmp5948)
%block.5950 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5949, %m972$.Node.type** %block.5950
%.tmp5951 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5952 = load %m972$.Node.type*, %m972$.Node.type** %block.5950
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_block.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5951, %m972$.Node.type* %.tmp5952)
%.tmp5953 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5954 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5953, i32 0, i32 1
%.tmp5955 = load %m0$.File.type*, %m0$.File.type** %.tmp5954
%.tmp5957 = getelementptr [15 x i8], [15 x i8]*@.str5956, i32 0, i32 0
%.tmp5958 = load i8*, i8** %end_lbl.5770
%.tmp5959 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5955, i8* %.tmp5957, i8* %.tmp5958)
br label %.if.end.5936
.if.false.5936:
br label %.if.end.5936
.if.end.5936:
%.tmp5960 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5961 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp5960, i32 0, i32 1
%.tmp5962 = load %m0$.File.type*, %m0$.File.type** %.tmp5961
%.tmp5964 = getelementptr [5 x i8], [5 x i8]*@.str5963, i32 0, i32 0
%.tmp5965 = load i8*, i8** %end_lbl.5770
%.tmp5966 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5962, i8* %.tmp5964, i8* %.tmp5965)
%.tmp5967 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
call void(%m2624$.CompilerCtx.type*) @m295$pop_scope.v.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp5967)
ret void
}
define %m2624$.AssignableInfo.type* @m295$compile_declaration.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%.tmp5968 = bitcast ptr null to %m2624$.Type.type*
%decl_type.5969 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp5968, %m2624$.Type.type** %decl_type.5969
%.tmp5970 = bitcast ptr null to %m2624$.AssignableInfo.type*
%a_info.5971 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp5970, %m2624$.AssignableInfo.type** %a_info.5971
%.tmp5972 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5973 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5972, i32 0, i32 6
%.tmp5974 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5973
%.tmp5975 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5974, i32 0, i32 0
%.tmp5976 = load i8*, i8** %.tmp5975
%.tmp5978 = getelementptr [5 x i8], [5 x i8]*@.str5977, i32 0, i32 0
%.tmp5979 = call i32(i8*,i8*) @strcmp(i8* %.tmp5976, i8* %.tmp5978)
%.tmp5980 = icmp eq i32 %.tmp5979, 0
br i1 %.tmp5980, label %.if.true.5981, label %.if.false.5981
.if.true.5981:
%.tmp5982 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp5983 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5984 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5983, i32 0, i32 6
%.tmp5985 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5984
%.tmp5986 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5985, i32 0, i32 6
%.tmp5987 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5986
%.tmp5988 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5982, %m972$.Node.type* %.tmp5987)
store %m2624$.Type.type* %.tmp5988, %m2624$.Type.type** %decl_type.5969
br label %.if.end.5981
.if.false.5981:
br label %.if.end.5981
.if.end.5981:
%.tmp5989 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp5990 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp5989, i32 0, i32 6
%.tmp5991 = load %m972$.Node.type*, %m972$.Node.type** %.tmp5990
%.tmp5993 = getelementptr [11 x i8], [11 x i8]*@.str5992, i32 0, i32 0
%.tmp5994 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp5991, i8* %.tmp5993)
%assignable.5995 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp5994, %m972$.Node.type** %assignable.5995
%.tmp5996 = load %m972$.Node.type*, %m972$.Node.type** %assignable.5995
%.tmp5997 = icmp ne %m972$.Node.type* %.tmp5996, null
br i1 %.tmp5997, label %.if.true.5998, label %.if.false.5998
.if.true.5998:
%.tmp5999 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6000 = load %m972$.Node.type*, %m972$.Node.type** %assignable.5995
%.tmp6001 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_assignable.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp5999, %m972$.Node.type* %.tmp6000)
store %m2624$.AssignableInfo.type* %.tmp6001, %m2624$.AssignableInfo.type** %a_info.5971
br label %.if.end.5998
.if.false.5998:
br label %.if.end.5998
.if.end.5998:
%.tmp6002 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6003 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp6002)
%info.6004 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp6003, %m2624$.AssignableInfo.type** %info.6004
%.tmp6005 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6004
%.tmp6006 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6005, i32 0, i32 3
%.tmp6008 = getelementptr [9 x i8], [9 x i8]*@.str6007, i32 0, i32 0
store i8* %.tmp6008, i8** %.tmp6006
%.tmp6009 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6010 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6009, i32 0, i32 6
%.tmp6011 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6010
%.tmp6013 = getelementptr [5 x i8], [5 x i8]*@.str6012, i32 0, i32 0
%.tmp6014 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp6011, i8* %.tmp6013)
%var_name.6015 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp6014, %m972$.Node.type** %var_name.6015
%.tmp6016 = load %m972$.Node.type*, %m972$.Node.type** %var_name.6015
%.tmp6017 = icmp eq %m972$.Node.type* %.tmp6016, null
br i1 %.tmp6017, label %.if.true.6018, label %.if.false.6018
.if.true.6018:
%.tmp6019 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6020 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6022 = getelementptr [31 x i8], [31 x i8]*@.str6021, i32 0, i32 0
%.tmp6023 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp6019, %m972$.Node.type* %.tmp6020, i8* %.tmp6022)
%.tmp6024 = call i32(i8*,...) @printf(i8* %.tmp6023)
%.tmp6025 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp6025
br label %.if.end.6018
.if.false.6018:
br label %.if.end.6018
.if.end.6018:
%.tmp6026 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6027 = call %m2624$.ModuleLookup.type*(%m2624$.CompilerCtx.type*) @m295$get_current_module.m2624$.ModuleLookup.typep.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp6026)
%mod.6028 = alloca %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* %.tmp6027, %m2624$.ModuleLookup.type** %mod.6028
%.tmp6029 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6030 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.6028
%.tmp6031 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp6030, i32 0, i32 3
%.tmp6032 = load %m2624$.Scope.type*, %m2624$.Scope.type** %.tmp6031
%.tmp6033 = load %m972$.Node.type*, %m972$.Node.type** %var_name.6015
%.tmp6034 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6033, i32 0, i32 1
%.tmp6035 = load i8*, i8** %.tmp6034
%.tmp6036 = call %m2624$.ScopeItem.type*(%m2624$.CompilerCtx.type*,%m2624$.Scope.type*,i8*) @m295$find_defined_here.m2624$.ScopeItem.typep.m2624$.CompilerCtx.typep.m2624$.Scope.typep.cp(%m2624$.CompilerCtx.type* %.tmp6029, %m2624$.Scope.type* %.tmp6032, i8* %.tmp6035)
%.tmp6037 = icmp ne %m2624$.ScopeItem.type* %.tmp6036, null
br i1 %.tmp6037, label %.if.true.6038, label %.if.false.6038
.if.true.6038:
%err_buf.6039 = alloca i8*
store i8* null, i8** %err_buf.6039
%.tmp6040 = getelementptr i8*, i8** %err_buf.6039, i32 0
%.tmp6042 = getelementptr [43 x i8], [43 x i8]*@.str6041, i32 0, i32 0
%.tmp6043 = load %m972$.Node.type*, %m972$.Node.type** %var_name.6015
%.tmp6044 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6043, i32 0, i32 1
%.tmp6045 = load i8*, i8** %.tmp6044
%.tmp6046 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6040, i8* %.tmp6042, i8* %.tmp6045)
%.tmp6047 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6048 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6049 = load i8*, i8** %err_buf.6039
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp6047, %m972$.Node.type* %.tmp6048, i8* %.tmp6049)
%.tmp6050 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp6050
br label %.if.end.6038
.if.false.6038:
br label %.if.end.6038
.if.end.6038:
%var_id.6051 = alloca i8*
store i8* null, i8** %var_id.6051
%.tmp6052 = getelementptr i8*, i8** %var_id.6051, i32 0
%.tmp6054 = getelementptr [6 x i8], [6 x i8]*@.str6053, i32 0, i32 0
%.tmp6055 = load %m972$.Node.type*, %m972$.Node.type** %var_name.6015
%.tmp6056 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6055, i32 0, i32 1
%.tmp6057 = load i8*, i8** %.tmp6056
%.tmp6058 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6059 = call i32(%m2624$.CompilerCtx.type*) @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp6058)
%.tmp6060 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6052, i8* %.tmp6054, i8* %.tmp6057, i32 %.tmp6059)
%.tmp6061 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6004
%.tmp6062 = load i8, i8* @SCOPE_LOCAL
%.tmp6063 = load i8*, i8** %var_id.6051
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp6061, i8 %.tmp6062, i8* %.tmp6063)
%.tmp6064 = load %m2624$.Type.type*, %m2624$.Type.type** %decl_type.5969
%.tmp6065 = icmp ne %m2624$.Type.type* %.tmp6064, null
br i1 %.tmp6065, label %.if.true.6066, label %.if.false.6066
.if.true.6066:
%.tmp6067 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6004
%.tmp6068 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6067, i32 0, i32 4
%.tmp6069 = load %m2624$.Type.type*, %m2624$.Type.type** %decl_type.5969
store %m2624$.Type.type* %.tmp6069, %m2624$.Type.type** %.tmp6068
br label %.if.end.6066
.if.false.6066:
%.tmp6070 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.5971
%.tmp6071 = icmp ne %m2624$.AssignableInfo.type* %.tmp6070, null
br i1 %.tmp6071, label %.if.true.6072, label %.if.false.6072
.if.true.6072:
%.tmp6073 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6004
%.tmp6074 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6073, i32 0, i32 4
%.tmp6075 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.5971
%.tmp6076 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6075, i32 0, i32 4
%.tmp6077 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6076
store %m2624$.Type.type* %.tmp6077, %m2624$.Type.type** %.tmp6074
br label %.if.end.6072
.if.false.6072:
br label %.if.end.6072
.if.end.6072:
br label %.if.end.6066
.if.end.6066:
%.tmp6078 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6079 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6004
%.tmp6080 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6079, i32 0, i32 4
%.tmp6081 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6080
%.tmp6082 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp6078, %m2624$.Type.type* %.tmp6081)
%var_type_repr.6083 = alloca i8*
store i8* %.tmp6082, i8** %var_type_repr.6083
%.tmp6084 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.5971
%.tmp6085 = icmp ne %m2624$.AssignableInfo.type* %.tmp6084, null
br i1 %.tmp6085, label %.if.true.6086, label %.if.false.6086
.if.true.6086:
%.tmp6087 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6088 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.5971
%.tmp6089 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6088, i32 0, i32 4
%.tmp6090 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6089
%.tmp6091 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp6087, %m2624$.Type.type* %.tmp6090)
%a_type_repr.6092 = alloca i8*
store i8* %.tmp6091, i8** %a_type_repr.6092
%.tmp6093 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6094 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.5971
%.tmp6095 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6094, i32 0, i32 4
%.tmp6096 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6095
%.tmp6097 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6004
%.tmp6098 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6097, i32 0, i32 4
%.tmp6099 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6098
%.tmp6100 = call i1(%m2624$.CompilerCtx.type*,%m2624$.Type.type*,%m2624$.Type.type*) @m295$is_same_type.b.m2624$.CompilerCtx.typep.m2624$.Type.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp6093, %m2624$.Type.type* %.tmp6096, %m2624$.Type.type* %.tmp6099)
%.tmp6101 = icmp eq i1 %.tmp6100, 0
br i1 %.tmp6101, label %.if.true.6102, label %.if.false.6102
.if.true.6102:
%.tmp6103 = bitcast ptr null to i8*
%err_msg.6104 = alloca i8*
store i8* %.tmp6103, i8** %err_msg.6104
%.tmp6105 = getelementptr i8*, i8** %err_msg.6104, i32 0
%.tmp6107 = getelementptr [49 x i8], [49 x i8]*@.str6106, i32 0, i32 0
%.tmp6108 = load i8*, i8** %a_type_repr.6092
%.tmp6109 = load i8*, i8** %var_type_repr.6083
%.tmp6110 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6105, i8* %.tmp6107, i8* %.tmp6108, i8* %.tmp6109)
%.tmp6111 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6112 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6113 = load i8*, i8** %err_msg.6104
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp6111, %m972$.Node.type* %.tmp6112, i8* %.tmp6113)
br label %.if.end.6102
.if.false.6102:
br label %.if.end.6102
.if.end.6102:
br label %.if.end.6086
.if.false.6086:
br label %.if.end.6086
.if.end.6086:
%.tmp6114 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6115 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6116 = load %m972$.Node.type*, %m972$.Node.type** %var_name.6015
%.tmp6117 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6116, i32 0, i32 1
%.tmp6118 = load i8*, i8** %.tmp6117
%.tmp6119 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6004
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*,%m2624$.AssignableInfo.type*) @m295$define_assignable.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp6114, %m972$.Node.type* %.tmp6115, i8* %.tmp6118, %m2624$.AssignableInfo.type* %.tmp6119)
%.tmp6120 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6121 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6120, i32 0, i32 1
%.tmp6122 = load %m0$.File.type*, %m0$.File.type** %.tmp6121
%.tmp6124 = getelementptr [16 x i8], [16 x i8]*@.str6123, i32 0, i32 0
%.tmp6125 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6004
%.tmp6126 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp6125)
%.tmp6127 = load i8*, i8** %var_type_repr.6083
%.tmp6128 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6122, i8* %.tmp6124, i8* %.tmp6126, i8* %.tmp6127)
%.tmp6129 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.5971
%.tmp6130 = icmp ne %m2624$.AssignableInfo.type* %.tmp6129, null
br i1 %.tmp6130, label %.if.true.6131, label %.if.false.6131
.if.true.6131:
%.tmp6132 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6133 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6132, i32 0, i32 1
%.tmp6134 = load %m0$.File.type*, %m0$.File.type** %.tmp6133
%.tmp6136 = getelementptr [21 x i8], [21 x i8]*@.str6135, i32 0, i32 0
%.tmp6137 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6138 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.5971
%.tmp6139 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6138, i32 0, i32 4
%.tmp6140 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6139
%.tmp6141 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp6137, %m2624$.Type.type* %.tmp6140)
%.tmp6142 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.5971
%.tmp6143 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp6142)
%.tmp6144 = load i8*, i8** %var_type_repr.6083
%.tmp6145 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6004
%.tmp6146 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp6145)
%.tmp6147 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6134, i8* %.tmp6136, i8* %.tmp6141, i8* %.tmp6143, i8* %.tmp6144, i8* %.tmp6146)
br label %.if.end.6131
.if.false.6131:
%.tmp6148 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6149 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6150 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6004
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,%m2624$.AssignableInfo.type*) @m295$compile_zero_value.v.m2624$.CompilerCtx.typep.m972$.Node.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp6148, %m972$.Node.type* %.tmp6149, %m2624$.AssignableInfo.type* %.tmp6150)
br label %.if.end.6131
.if.end.6131:
%.tmp6151 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6004
ret %m2624$.AssignableInfo.type* %.tmp6151
}
define void @m295$compile_zero_value.v.m2624$.CompilerCtx.typep.m972$.Node.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg, %m2624$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%info = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.info.arg, %m2624$.AssignableInfo.type** %info
%.tmp6152 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp6153 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6152, i32 0, i32 4
%.tmp6154 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6153
%.tmp6155 = icmp eq %m2624$.Type.type* %.tmp6154, null
br i1 %.tmp6155, label %.if.true.6156, label %.if.false.6156
.if.true.6156:
ret void
br label %.if.end.6156
.if.false.6156:
br label %.if.end.6156
.if.end.6156:
%.tmp6157 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6158 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp6159 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6158, i32 0, i32 4
%.tmp6160 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6159
%.tmp6161 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp6157, %m2624$.Type.type* %.tmp6160)
%t_repr.6162 = alloca i8*
store i8* %.tmp6161, i8** %t_repr.6162
%.tmp6163 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp6164 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp6163)
%id.6165 = alloca i8*
store i8* %.tmp6164, i8** %id.6165
%field_id.6166 = alloca i32
store i32 0, i32* %field_id.6166
%field.6167 = alloca %m2624$.Type.type*
store %m2624$.Type.type* null, %m2624$.Type.type** %field.6167
%field_info.6168 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* null, %m2624$.AssignableInfo.type** %field_info.6168
%.tmp6169 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp6170 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6169, i32 0, i32 4
%.tmp6171 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6170
%t.6172 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp6171, %m2624$.Type.type** %t.6172
%.tmp6173 = load %m2624$.Type.type*, %m2624$.Type.type** %t.6172
%.tmp6174 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6173, i32 0, i32 0
%.tmp6175 = load i8*, i8** %.tmp6174
%.tmp6177 = getelementptr [4 x i8], [4 x i8]*@.str6176, i32 0, i32 0
%.tmp6178 = call i32(i8*,i8*) @strcmp(i8* %.tmp6175, i8* %.tmp6177)
%.tmp6179 = icmp eq i32 %.tmp6178, 0
%.tmp6180 = load %m2624$.Type.type*, %m2624$.Type.type** %t.6172
%.tmp6181 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6180, i32 0, i32 0
%.tmp6182 = load i8*, i8** %.tmp6181
%.tmp6184 = getelementptr [4 x i8], [4 x i8]*@.str6183, i32 0, i32 0
%.tmp6185 = call i32(i8*,i8*) @strcmp(i8* %.tmp6182, i8* %.tmp6184)
%.tmp6186 = icmp eq i32 %.tmp6185, 0
%.tmp6187 = or i1 %.tmp6179, %.tmp6186
%.tmp6188 = load %m2624$.Type.type*, %m2624$.Type.type** %t.6172
%.tmp6189 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6188, i32 0, i32 0
%.tmp6190 = load i8*, i8** %.tmp6189
%.tmp6192 = getelementptr [5 x i8], [5 x i8]*@.str6191, i32 0, i32 0
%.tmp6193 = call i32(i8*,i8*) @strcmp(i8* %.tmp6190, i8* %.tmp6192)
%.tmp6194 = icmp eq i32 %.tmp6193, 0
%.tmp6195 = or i1 %.tmp6187, %.tmp6194
br i1 %.tmp6195, label %.if.true.6196, label %.if.false.6196
.if.true.6196:
%.tmp6197 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6198 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6197, i32 0, i32 1
%.tmp6199 = load %m0$.File.type*, %m0$.File.type** %.tmp6198
%.tmp6201 = getelementptr [21 x i8], [21 x i8]*@.str6200, i32 0, i32 0
%.tmp6202 = load i8*, i8** %t_repr.6162
%.tmp6203 = load i8*, i8** %t_repr.6162
%.tmp6204 = load i8*, i8** %id.6165
%.tmp6205 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6199, i8* %.tmp6201, i8* %.tmp6202, i32 0, i8* %.tmp6203, i8* %.tmp6204)
br label %.if.end.6196
.if.false.6196:
%.tmp6206 = load %m2624$.Type.type*, %m2624$.Type.type** %t.6172
%.tmp6207 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6206, i32 0, i32 0
%.tmp6208 = load i8*, i8** %.tmp6207
%.tmp6210 = getelementptr [4 x i8], [4 x i8]*@.str6209, i32 0, i32 0
%.tmp6211 = call i32(i8*,i8*) @strcmp(i8* %.tmp6208, i8* %.tmp6210)
%.tmp6212 = icmp eq i32 %.tmp6211, 0
br i1 %.tmp6212, label %.if.true.6213, label %.if.false.6213
.if.true.6213:
%.tmp6214 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6215 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6214, i32 0, i32 1
%.tmp6216 = load %m0$.File.type*, %m0$.File.type** %.tmp6215
%.tmp6218 = getelementptr [21 x i8], [21 x i8]*@.str6217, i32 0, i32 0
%.tmp6219 = load i8*, i8** %t_repr.6162
%.tmp6221 = getelementptr [5 x i8], [5 x i8]*@.str6220, i32 0, i32 0
%.tmp6222 = load i8*, i8** %t_repr.6162
%.tmp6223 = load i8*, i8** %id.6165
%.tmp6224 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6216, i8* %.tmp6218, i8* %.tmp6219, i8* %.tmp6221, i8* %.tmp6222, i8* %.tmp6223)
br label %.if.end.6213
.if.false.6213:
%.tmp6225 = load %m2624$.Type.type*, %m2624$.Type.type** %t.6172
%.tmp6226 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6225, i32 0, i32 0
%.tmp6227 = load i8*, i8** %.tmp6226
%.tmp6229 = getelementptr [7 x i8], [7 x i8]*@.str6228, i32 0, i32 0
%.tmp6230 = call i32(i8*,i8*) @strcmp(i8* %.tmp6227, i8* %.tmp6229)
%.tmp6231 = icmp eq i32 %.tmp6230, 0
br i1 %.tmp6231, label %.if.true.6232, label %.if.false.6232
.if.true.6232:
%.tmp6234 = load %m2624$.Type.type*, %m2624$.Type.type** %t.6172
%.tmp6235 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6234, i32 0, i32 3
%.tmp6236 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6235
store %m2624$.Type.type* %.tmp6236, %m2624$.Type.type** %field.6167
br label %.for.start.6233
.for.start.6233:
%.tmp6237 = load %m2624$.Type.type*, %m2624$.Type.type** %field.6167
%.tmp6238 = icmp ne %m2624$.Type.type* %.tmp6237, null
br i1 %.tmp6238, label %.for.continue.6233, label %.for.end.6233
.for.continue.6233:
%.tmp6239 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6240 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp6239)
store %m2624$.AssignableInfo.type* %.tmp6240, %m2624$.AssignableInfo.type** %field_info.6168
%.tmp6241 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6242 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %field_info.6168
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp6241, %m2624$.AssignableInfo.type* %.tmp6242)
%.tmp6243 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %field_info.6168
%.tmp6244 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6243, i32 0, i32 4
%.tmp6245 = load %m2624$.Type.type*, %m2624$.Type.type** %field.6167
store %m2624$.Type.type* %.tmp6245, %m2624$.Type.type** %.tmp6244
%.tmp6246 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6247 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6246, i32 0, i32 1
%.tmp6248 = load %m0$.File.type*, %m0$.File.type** %.tmp6247
%.tmp6250 = getelementptr [46 x i8], [46 x i8]*@.str6249, i32 0, i32 0
%.tmp6251 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %field_info.6168
%.tmp6252 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp6251)
%.tmp6253 = load i8*, i8** %t_repr.6162
%.tmp6254 = load i8*, i8** %t_repr.6162
%.tmp6255 = load i8*, i8** %id.6165
%.tmp6256 = load i32, i32* %field_id.6166
%.tmp6257 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6248, i8* %.tmp6250, i8* %.tmp6252, i8* %.tmp6253, i8* %.tmp6254, i8* %.tmp6255, i32 %.tmp6256)
%.tmp6258 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6259 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6260 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %field_info.6168
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,%m2624$.AssignableInfo.type*) @m295$compile_zero_value.v.m2624$.CompilerCtx.typep.m972$.Node.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp6258, %m972$.Node.type* %.tmp6259, %m2624$.AssignableInfo.type* %.tmp6260)
%.tmp6261 = load i32, i32* %field_id.6166
%.tmp6262 = add i32 %.tmp6261, 1
store i32 %.tmp6262, i32* %field_id.6166
%.tmp6263 = load %m2624$.Type.type*, %m2624$.Type.type** %field.6167
%.tmp6264 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6263, i32 0, i32 4
%.tmp6265 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6264
store %m2624$.Type.type* %.tmp6265, %m2624$.Type.type** %field.6167
br label %.for.start.6233
.for.end.6233:
br label %.if.end.6232
.if.false.6232:
%.tmp6266 = load %m2624$.Type.type*, %m2624$.Type.type** %t.6172
%.tmp6267 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6266, i32 0, i32 0
%.tmp6268 = load i8*, i8** %.tmp6267
%.tmp6270 = getelementptr [10 x i8], [10 x i8]*@.str6269, i32 0, i32 0
%.tmp6271 = call i32(i8*,i8*) @strcmp(i8* %.tmp6268, i8* %.tmp6270)
%.tmp6272 = icmp eq i32 %.tmp6271, 0
br i1 %.tmp6272, label %.if.true.6273, label %.if.false.6273
.if.true.6273:
%.tmp6275 = load %m2624$.Type.type*, %m2624$.Type.type** %t.6172
%.tmp6276 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6275, i32 0, i32 3
%.tmp6277 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6276
%.tmp6278 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6277, i32 0, i32 3
%.tmp6279 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6278
store %m2624$.Type.type* %.tmp6279, %m2624$.Type.type** %field.6167
br label %.for.start.6274
.for.start.6274:
%.tmp6280 = load %m2624$.Type.type*, %m2624$.Type.type** %field.6167
%.tmp6281 = icmp ne %m2624$.Type.type* %.tmp6280, null
br i1 %.tmp6281, label %.for.continue.6274, label %.for.end.6274
.for.continue.6274:
%.tmp6282 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6283 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp6282)
store %m2624$.AssignableInfo.type* %.tmp6283, %m2624$.AssignableInfo.type** %field_info.6168
%.tmp6284 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6285 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %field_info.6168
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp6284, %m2624$.AssignableInfo.type* %.tmp6285)
%.tmp6286 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %field_info.6168
%.tmp6287 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6286, i32 0, i32 4
%.tmp6288 = load %m2624$.Type.type*, %m2624$.Type.type** %field.6167
store %m2624$.Type.type* %.tmp6288, %m2624$.Type.type** %.tmp6287
%.tmp6289 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6290 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6289, i32 0, i32 1
%.tmp6291 = load %m0$.File.type*, %m0$.File.type** %.tmp6290
%.tmp6293 = getelementptr [46 x i8], [46 x i8]*@.str6292, i32 0, i32 0
%.tmp6294 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %field_info.6168
%.tmp6295 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp6294)
%.tmp6296 = load i8*, i8** %t_repr.6162
%.tmp6297 = load i8*, i8** %t_repr.6162
%.tmp6298 = load i8*, i8** %id.6165
%.tmp6299 = load i32, i32* %field_id.6166
%.tmp6300 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6291, i8* %.tmp6293, i8* %.tmp6295, i8* %.tmp6296, i8* %.tmp6297, i8* %.tmp6298, i32 %.tmp6299)
%.tmp6301 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6302 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6303 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %field_info.6168
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,%m2624$.AssignableInfo.type*) @m295$compile_zero_value.v.m2624$.CompilerCtx.typep.m972$.Node.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp6301, %m972$.Node.type* %.tmp6302, %m2624$.AssignableInfo.type* %.tmp6303)
%.tmp6304 = load i32, i32* %field_id.6166
%.tmp6305 = add i32 %.tmp6304, 1
store i32 %.tmp6305, i32* %field_id.6166
%.tmp6306 = load %m2624$.Type.type*, %m2624$.Type.type** %field.6167
%.tmp6307 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6306, i32 0, i32 4
%.tmp6308 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6307
store %m2624$.Type.type* %.tmp6308, %m2624$.Type.type** %field.6167
br label %.for.start.6274
.for.end.6274:
br label %.if.end.6273
.if.false.6273:
%.tmp6309 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6310 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6312 = getelementptr [44 x i8], [44 x i8]*@.str6311, i32 0, i32 0
%.tmp6313 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp6309, %m972$.Node.type* %.tmp6310, i8* %.tmp6312)
%.tmp6314 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp6315 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6314, i32 0, i32 4
%.tmp6316 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6315
%.tmp6317 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6316, i32 0, i32 0
%.tmp6318 = load i8*, i8** %.tmp6317
%.tmp6319 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6320 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp6321 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6320, i32 0, i32 4
%.tmp6322 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6321
%.tmp6323 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp6319, %m2624$.Type.type* %.tmp6322)
%.tmp6324 = call i32(i8*,...) @printf(i8* %.tmp6313, i8* %.tmp6318, i8* %.tmp6323)
ret void
br label %.if.end.6273
.if.end.6273:
br label %.if.end.6232
.if.end.6232:
br label %.if.end.6213
.if.end.6213:
br label %.if.end.6196
.if.end.6196:
ret void
}
define void @m295$compile_if_block.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%.tmp6325 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6326 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6325, i32 0, i32 6
%.tmp6327 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6326
%.tmp6329 = getelementptr [11 x i8], [11 x i8]*@.str6328, i32 0, i32 0
%.tmp6330 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp6327, i8* %.tmp6329)
%assignable.6331 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp6330, %m972$.Node.type** %assignable.6331
%.tmp6332 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6333 = load %m972$.Node.type*, %m972$.Node.type** %assignable.6331
%.tmp6334 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_assignable.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp6332, %m972$.Node.type* %.tmp6333)
%a_info.6335 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp6334, %m2624$.AssignableInfo.type** %a_info.6335
%.tmp6336 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.6335
%.tmp6337 = icmp eq %m2624$.AssignableInfo.type* %.tmp6336, null
br i1 %.tmp6337, label %.if.true.6338, label %.if.false.6338
.if.true.6338:
ret void
br label %.if.end.6338
.if.false.6338:
br label %.if.end.6338
.if.end.6338:
%.tmp6339 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6340 = call i32(%m2624$.CompilerCtx.type*) @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp6339)
%if_id.6341 = alloca i32
store i32 %.tmp6340, i32* %if_id.6341
%.tmp6342 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6343 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6342, i32 0, i32 1
%.tmp6344 = load %m0$.File.type*, %m0$.File.type** %.tmp6343
%.tmp6346 = getelementptr [53 x i8], [53 x i8]*@.str6345, i32 0, i32 0
%.tmp6347 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6348 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.6335
%.tmp6349 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6348, i32 0, i32 4
%.tmp6350 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6349
%.tmp6351 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp6347, %m2624$.Type.type* %.tmp6350)
%.tmp6352 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %a_info.6335
%.tmp6353 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp6352)
%.tmp6354 = load i32, i32* %if_id.6341
%.tmp6355 = load i32, i32* %if_id.6341
%.tmp6356 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6344, i8* %.tmp6346, i8* %.tmp6351, i8* %.tmp6353, i32 %.tmp6354, i32 %.tmp6355)
%.tmp6357 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6358 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6357, i32 0, i32 1
%.tmp6359 = load %m0$.File.type*, %m0$.File.type** %.tmp6358
%.tmp6361 = getelementptr [14 x i8], [14 x i8]*@.str6360, i32 0, i32 0
%.tmp6362 = load i32, i32* %if_id.6341
%.tmp6363 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6359, i8* %.tmp6361, i32 %.tmp6362)
%.tmp6364 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6365 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6364, i32 0, i32 6
%.tmp6366 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6365
%.tmp6368 = getelementptr [6 x i8], [6 x i8]*@.str6367, i32 0, i32 0
%.tmp6369 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp6366, i8* %.tmp6368)
%block.6370 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp6369, %m972$.Node.type** %block.6370
%.tmp6371 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6372 = load %m972$.Node.type*, %m972$.Node.type** %block.6370
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_block.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp6371, %m972$.Node.type* %.tmp6372)
%.tmp6373 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6374 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6373, i32 0, i32 1
%.tmp6375 = load %m0$.File.type*, %m0$.File.type** %.tmp6374
%.tmp6377 = getelementptr [23 x i8], [23 x i8]*@.str6376, i32 0, i32 0
%.tmp6378 = load i32, i32* %if_id.6341
%.tmp6379 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6375, i8* %.tmp6377, i32 %.tmp6378)
%.tmp6380 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6381 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6380, i32 0, i32 1
%.tmp6382 = load %m0$.File.type*, %m0$.File.type** %.tmp6381
%.tmp6384 = getelementptr [15 x i8], [15 x i8]*@.str6383, i32 0, i32 0
%.tmp6385 = load i32, i32* %if_id.6341
%.tmp6386 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6382, i8* %.tmp6384, i32 %.tmp6385)
%.tmp6387 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6388 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6387, i32 0, i32 6
%.tmp6389 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6388
%.tmp6391 = getelementptr [11 x i8], [11 x i8]*@.str6390, i32 0, i32 0
%.tmp6392 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp6389, i8* %.tmp6391)
%else_block.6393 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp6392, %m972$.Node.type** %else_block.6393
%.tmp6394 = load %m972$.Node.type*, %m972$.Node.type** %else_block.6393
%.tmp6395 = icmp ne %m972$.Node.type* %.tmp6394, null
br i1 %.tmp6395, label %.if.true.6396, label %.if.false.6396
.if.true.6396:
%.tmp6397 = load %m972$.Node.type*, %m972$.Node.type** %else_block.6393
%.tmp6398 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6397, i32 0, i32 6
%.tmp6399 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6398
%.tmp6400 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6399, i32 0, i32 0
%.tmp6401 = load i8*, i8** %.tmp6400
%.tmp6403 = getelementptr [11 x i8], [11 x i8]*@.str6402, i32 0, i32 0
%.tmp6404 = call i32(i8*,i8*) @strcmp(i8* %.tmp6401, i8* %.tmp6403)
%.tmp6405 = icmp eq i32 %.tmp6404, 0
br i1 %.tmp6405, label %.if.true.6406, label %.if.false.6406
.if.true.6406:
%.tmp6407 = load %m972$.Node.type*, %m972$.Node.type** %else_block.6393
%.tmp6408 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6407, i32 0, i32 6
%.tmp6409 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6408
%.tmp6410 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6409, i32 0, i32 6
%.tmp6411 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6410
%.tmp6413 = getelementptr [6 x i8], [6 x i8]*@.str6412, i32 0, i32 0
%.tmp6414 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp6411, i8* %.tmp6413)
store %m972$.Node.type* %.tmp6414, %m972$.Node.type** %block.6370
%.tmp6415 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6416 = load %m972$.Node.type*, %m972$.Node.type** %block.6370
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_block.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp6415, %m972$.Node.type* %.tmp6416)
br label %.if.end.6406
.if.false.6406:
%.tmp6417 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6418 = load %m972$.Node.type*, %m972$.Node.type** %else_block.6393
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_if_block.v.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp6417, %m972$.Node.type* %.tmp6418)
br label %.if.end.6406
.if.end.6406:
br label %.if.end.6396
.if.false.6396:
br label %.if.end.6396
.if.end.6396:
%.tmp6419 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6420 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6419, i32 0, i32 1
%.tmp6421 = load %m0$.File.type*, %m0$.File.type** %.tmp6420
%.tmp6423 = getelementptr [23 x i8], [23 x i8]*@.str6422, i32 0, i32 0
%.tmp6424 = load i32, i32* %if_id.6341
%.tmp6425 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6421, i8* %.tmp6423, i32 %.tmp6424)
%.tmp6426 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6427 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6426, i32 0, i32 1
%.tmp6428 = load %m0$.File.type*, %m0$.File.type** %.tmp6427
%.tmp6430 = getelementptr [13 x i8], [13 x i8]*@.str6429, i32 0, i32 0
%.tmp6431 = load i32, i32* %if_id.6341
%.tmp6432 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6428, i8* %.tmp6430, i32 %.tmp6431)
ret void
}
define void @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%curr_node = alloca %m972$.Node.type*
store %m972$.Node.type* %.curr_node.arg, %m972$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp6433 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp6434 = icmp ne %m972$.Node.type* %.tmp6433, null
br i1 %.tmp6434, label %.if.true.6435, label %.if.false.6435
.if.true.6435:
%.tmp6436 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6437 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6436, i32 0, i32 7
%.tmp6438 = load i8*, i8** %.tmp6437
%.tmp6439 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp6440 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6439, i32 0, i32 3
%.tmp6441 = load i32, i32* %.tmp6440
%.tmp6442 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp6443 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6442, i32 0, i32 4
%.tmp6444 = load i32, i32* %.tmp6443
%.tmp6445 = load i8*, i8** %msg
%.tmp6446 = call %m296$.Error.type*(i8*,i32,i32,i8*) @m296$new.m296$.Error.typep.cp.i.i.cp(i8* %.tmp6438, i32 %.tmp6441, i32 %.tmp6444, i8* %.tmp6445)
%err.6447 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp6446, %m296$.Error.type** %err.6447
%.tmp6448 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6449 = load %m296$.Error.type*, %m296$.Error.type** %err.6447
call void(%m2624$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2624$.CompilerCtx.typep.m296$.Error.typep(%m2624$.CompilerCtx.type* %.tmp6448, %m296$.Error.type* %.tmp6449)
br label %.if.end.6435
.if.false.6435:
%.tmp6451 = getelementptr [61 x i8], [61 x i8]*@.str6450, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp6451)
br label %.if.end.6435
.if.end.6435:
ret void
}
define void @m295$define_assignable.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg, i8* %.name.arg, %m2624$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.info.arg, %m2624$.AssignableInfo.type** %info
%.tmp6452 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6453 = call %m2624$.ModuleLookup.type*(%m2624$.CompilerCtx.type*) @m295$get_current_module.m2624$.ModuleLookup.typep.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp6452)
%mod.6454 = alloca %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* %.tmp6453, %m2624$.ModuleLookup.type** %mod.6454
%.tmp6455 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.6454
%.tmp6456 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp6455, i32 0, i32 3
%.tmp6457 = load %m2624$.Scope.type*, %m2624$.Scope.type** %.tmp6456
%.tmp6458 = icmp ne %m2624$.Scope.type* %.tmp6457, null
%.tmp6460 = getelementptr [82 x i8], [82 x i8]*@.str6459, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6458, i8* %.tmp6460)
%.tmp6461 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.6454
%.tmp6462 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp6461, i32 0, i32 3
%.tmp6463 = load %m2624$.Scope.type*, %m2624$.Scope.type** %.tmp6462
%current_scope.6464 = alloca %m2624$.Scope.type*
store %m2624$.Scope.type* %.tmp6463, %m2624$.Scope.type** %current_scope.6464
%.tmp6465 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* null, i32 1
%.tmp6466 = ptrtoint %m2624$.ScopeItem.type* %.tmp6465 to i32
%.tmp6467 = call i8*(i32) @malloc(i32 %.tmp6466)
%.tmp6468 = bitcast i8* %.tmp6467 to %m2624$.ScopeItem.type*
%newitem.6469 = alloca %m2624$.ScopeItem.type*
store %m2624$.ScopeItem.type* %.tmp6468, %m2624$.ScopeItem.type** %newitem.6469
%.tmp6470 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %newitem.6469
%.tmp6471 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp6470, i32 0, i32 0
%.tmp6472 = load i8*, i8** %name
store i8* %.tmp6472, i8** %.tmp6471
%.tmp6473 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %newitem.6469
%.tmp6474 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp6473, i32 0, i32 1
%.tmp6475 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
store %m2624$.AssignableInfo.type* %.tmp6475, %m2624$.AssignableInfo.type** %.tmp6474
%.tmp6476 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %newitem.6469
%.tmp6477 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp6476, i32 0, i32 2
store %m2624$.ScopeItem.type* null, %m2624$.ScopeItem.type** %.tmp6477
%.tmp6478 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp6479 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6478, i32 0, i32 2
%.tmp6480 = load i8*, i8** %name
store i8* %.tmp6480, i8** %.tmp6479
%.tmp6481 = load %m2624$.Scope.type*, %m2624$.Scope.type** %current_scope.6464
%.tmp6482 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp6481, i32 0, i32 1
%.tmp6483 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %.tmp6482
%.tmp6484 = icmp eq %m2624$.ScopeItem.type* %.tmp6483, null
br i1 %.tmp6484, label %.if.true.6485, label %.if.false.6485
.if.true.6485:
%.tmp6486 = load %m2624$.Scope.type*, %m2624$.Scope.type** %current_scope.6464
%.tmp6487 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp6486, i32 0, i32 1
%.tmp6488 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %newitem.6469
store %m2624$.ScopeItem.type* %.tmp6488, %m2624$.ScopeItem.type** %.tmp6487
ret void
br label %.if.end.6485
.if.false.6485:
br label %.if.end.6485
.if.end.6485:
%.tmp6489 = load %m2624$.Scope.type*, %m2624$.Scope.type** %current_scope.6464
%.tmp6490 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp6489, i32 0, i32 1
%.tmp6491 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %.tmp6490
%last_item.6492 = alloca %m2624$.ScopeItem.type*
store %m2624$.ScopeItem.type* %.tmp6491, %m2624$.ScopeItem.type** %last_item.6492
%.tmp6494 = getelementptr [1 x i8], [1 x i8]*@.str6493, i32 0, i32 0
%err_buf.6495 = alloca i8*
store i8* %.tmp6494, i8** %err_buf.6495
%.tmp6496 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %last_item.6492
%.tmp6497 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp6496, i32 0, i32 0
%.tmp6498 = load i8*, i8** %.tmp6497
%.tmp6499 = load i8*, i8** %name
%.tmp6500 = call i32(i8*,i8*) @strcmp(i8* %.tmp6498, i8* %.tmp6499)
%.tmp6501 = icmp eq i32 %.tmp6500, 0
br i1 %.tmp6501, label %.if.true.6502, label %.if.false.6502
.if.true.6502:
%.tmp6503 = getelementptr i8*, i8** %err_buf.6495, i32 0
%.tmp6505 = getelementptr [43 x i8], [43 x i8]*@.str6504, i32 0, i32 0
%.tmp6506 = load i8*, i8** %name
%.tmp6507 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6503, i8* %.tmp6505, i8* %.tmp6506)
%.tmp6508 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6509 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6510 = load i8*, i8** %err_buf.6495
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp6508, %m972$.Node.type* %.tmp6509, i8* %.tmp6510)
br label %.if.end.6502
.if.false.6502:
br label %.if.end.6502
.if.end.6502:
br label %.for.start.6511
.for.start.6511:
%.tmp6512 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %last_item.6492
%.tmp6513 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp6512, i32 0, i32 2
%.tmp6514 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %.tmp6513
%.tmp6515 = icmp ne %m2624$.ScopeItem.type* %.tmp6514, null
br i1 %.tmp6515, label %.for.continue.6511, label %.for.else.6511
.for.continue.6511:
%.tmp6516 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %last_item.6492
%.tmp6517 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp6516, i32 0, i32 0
%.tmp6518 = load i8*, i8** %.tmp6517
%.tmp6519 = load i8*, i8** %name
%.tmp6520 = call i32(i8*,i8*) @strcmp(i8* %.tmp6518, i8* %.tmp6519)
%.tmp6521 = icmp eq i32 %.tmp6520, 0
br i1 %.tmp6521, label %.if.true.6522, label %.if.false.6522
.if.true.6522:
%.tmp6523 = getelementptr i8*, i8** %err_buf.6495, i32 0
%.tmp6525 = getelementptr [43 x i8], [43 x i8]*@.str6524, i32 0, i32 0
%.tmp6526 = load i8*, i8** %name
%.tmp6527 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6523, i8* %.tmp6525, i8* %.tmp6526)
%.tmp6528 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6529 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6530 = load i8*, i8** %err_buf.6495
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp6528, %m972$.Node.type* %.tmp6529, i8* %.tmp6530)
br label %.for.end.6511
br label %.if.end.6522
.if.false.6522:
br label %.if.end.6522
.if.end.6522:
%.tmp6531 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %last_item.6492
%.tmp6532 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp6531, i32 0, i32 2
%.tmp6533 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %.tmp6532
store %m2624$.ScopeItem.type* %.tmp6533, %m2624$.ScopeItem.type** %last_item.6492
br label %.for.start.6511
.for.else.6511:
%.tmp6534 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %last_item.6492
%.tmp6535 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp6534, i32 0, i32 2
%.tmp6536 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %newitem.6469
store %m2624$.ScopeItem.type* %.tmp6536, %m2624$.ScopeItem.type** %.tmp6535
br label %.for.end.6511
.for.end.6511:
ret void
}
define %m2624$.ScopeItem.type* @m295$find_defined_in.m2624$.ScopeItem.typep.m2624$.CompilerCtx.typep.cp.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m972$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m972$.Node.type*
store %m972$.Node.type* %.dotted_name.arg, %m972$.Node.type** %dotted_name
%err_buf.6537 = alloca i8*
store i8* null, i8** %err_buf.6537
%.tmp6538 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6539 = load i8*, i8** %module
%.tmp6540 = load %m972$.Node.type*, %m972$.Node.type** %dotted_name
%.tmp6541 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6540, i32 0, i32 1
%.tmp6542 = load i8*, i8** %.tmp6541
%.tmp6543 = call %m2624$.ScopeItem.type*(%m2624$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2624$.ScopeItem.typep.m2624$.CompilerCtx.typep.cp.cp(%m2624$.CompilerCtx.type* %.tmp6538, i8* %.tmp6539, i8* %.tmp6542)
%found.6544 = alloca %m2624$.ScopeItem.type*
store %m2624$.ScopeItem.type* %.tmp6543, %m2624$.ScopeItem.type** %found.6544
%.tmp6545 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %found.6544
%.tmp6546 = icmp eq %m2624$.ScopeItem.type* %.tmp6545, null
br i1 %.tmp6546, label %.if.true.6547, label %.if.false.6547
.if.true.6547:
%.tmp6548 = getelementptr i8*, i8** %err_buf.6537, i32 0
%.tmp6550 = getelementptr [31 x i8], [31 x i8]*@.str6549, i32 0, i32 0
%.tmp6551 = load %m972$.Node.type*, %m972$.Node.type** %dotted_name
%.tmp6552 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6551, i32 0, i32 1
%.tmp6553 = load i8*, i8** %.tmp6552
%.tmp6554 = load i8*, i8** %module
%.tmp6555 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6548, i8* %.tmp6550, i8* %.tmp6553, i8* %.tmp6554)
%.tmp6556 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6557 = load %m972$.Node.type*, %m972$.Node.type** %dotted_name
%.tmp6558 = load i8*, i8** %err_buf.6537
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp6556, %m972$.Node.type* %.tmp6557, i8* %.tmp6558)
%.tmp6559 = bitcast ptr null to %m2624$.ScopeItem.type*
ret %m2624$.ScopeItem.type* %.tmp6559
br label %.if.end.6547
.if.false.6547:
br label %.if.end.6547
.if.end.6547:
br label %.for.start.6560
.for.start.6560:
%.tmp6561 = load %m972$.Node.type*, %m972$.Node.type** %dotted_name
%.tmp6562 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6561, i32 0, i32 7
%.tmp6563 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6562
%.tmp6564 = icmp ne %m972$.Node.type* %.tmp6563, null
%.tmp6565 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %found.6544
%.tmp6566 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp6565, i32 0, i32 1
%.tmp6567 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %.tmp6566
%.tmp6568 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6567, i32 0, i32 3
%.tmp6569 = load i8*, i8** %.tmp6568
%.tmp6571 = getelementptr [7 x i8], [7 x i8]*@.str6570, i32 0, i32 0
%.tmp6572 = call i32(i8*,i8*) @strcmp(i8* %.tmp6569, i8* %.tmp6571)
%.tmp6573 = icmp eq i32 %.tmp6572, 0
%.tmp6574 = and i1 %.tmp6564, %.tmp6573
br i1 %.tmp6574, label %.for.continue.6560, label %.for.end.6560
.for.continue.6560:
%.tmp6575 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6576 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %found.6544
%.tmp6577 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp6576, i32 0, i32 1
%.tmp6578 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %.tmp6577
%.tmp6579 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6578, i32 0, i32 0
%.tmp6580 = load i8*, i8** %.tmp6579
%.tmp6581 = load %m972$.Node.type*, %m972$.Node.type** %dotted_name
%.tmp6582 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6581, i32 0, i32 7
%.tmp6583 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6582
%.tmp6584 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6583, i32 0, i32 7
%.tmp6585 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6584
%.tmp6586 = call %m2624$.ScopeItem.type*(%m2624$.CompilerCtx.type*,i8*,%m972$.Node.type*) @m295$find_defined_in.m2624$.ScopeItem.typep.m2624$.CompilerCtx.typep.cp.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp6575, i8* %.tmp6580, %m972$.Node.type* %.tmp6585)
store %m2624$.ScopeItem.type* %.tmp6586, %m2624$.ScopeItem.type** %found.6544
%.tmp6587 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %found.6544
%.tmp6588 = icmp eq %m2624$.ScopeItem.type* %.tmp6587, null
br i1 %.tmp6588, label %.if.true.6589, label %.if.false.6589
.if.true.6589:
%.tmp6590 = bitcast ptr null to %m2624$.ScopeItem.type*
ret %m2624$.ScopeItem.type* %.tmp6590
br label %.if.end.6589
.if.false.6589:
br label %.if.end.6589
.if.end.6589:
br label %.for.start.6560
.for.end.6560:
%.tmp6591 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %found.6544
ret %m2624$.ScopeItem.type* %.tmp6591
}
define %m2624$.ScopeItem.type* @m295$find_defined_here.m2624$.ScopeItem.typep.m2624$.CompilerCtx.typep.m2624$.Scope.typep.cp(%m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%s = alloca %m2624$.Scope.type*
store %m2624$.Scope.type* %.s.arg, %m2624$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp6592 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s
%.tmp6593 = icmp eq %m2624$.Scope.type* %.tmp6592, null
br i1 %.tmp6593, label %.if.true.6594, label %.if.false.6594
.if.true.6594:
%.tmp6595 = bitcast ptr null to %m2624$.ScopeItem.type*
ret %m2624$.ScopeItem.type* %.tmp6595
br label %.if.end.6594
.if.false.6594:
br label %.if.end.6594
.if.end.6594:
%.tmp6597 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s
%.tmp6598 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp6597, i32 0, i32 1
%.tmp6599 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %.tmp6598
%item.6600 = alloca %m2624$.ScopeItem.type*
store %m2624$.ScopeItem.type* %.tmp6599, %m2624$.ScopeItem.type** %item.6600
br label %.for.start.6596
.for.start.6596:
%.tmp6601 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %item.6600
%.tmp6602 = icmp ne %m2624$.ScopeItem.type* %.tmp6601, null
br i1 %.tmp6602, label %.for.continue.6596, label %.for.end.6596
.for.continue.6596:
%.tmp6603 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %item.6600
%.tmp6604 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp6603, i32 0, i32 0
%.tmp6605 = load i8*, i8** %.tmp6604
%.tmp6606 = load i8*, i8** %name
%.tmp6607 = call i32(i8*,i8*) @strcmp(i8* %.tmp6605, i8* %.tmp6606)
%.tmp6608 = icmp eq i32 %.tmp6607, 0
br i1 %.tmp6608, label %.if.true.6609, label %.if.false.6609
.if.true.6609:
%.tmp6610 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %item.6600
ret %m2624$.ScopeItem.type* %.tmp6610
br label %.if.end.6609
.if.false.6609:
br label %.if.end.6609
.if.end.6609:
%.tmp6611 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %item.6600
%.tmp6612 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp6611, i32 0, i32 2
%.tmp6613 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %.tmp6612
store %m2624$.ScopeItem.type* %.tmp6613, %m2624$.ScopeItem.type** %item.6600
br label %.for.start.6596
.for.end.6596:
%.tmp6614 = bitcast ptr null to %m2624$.ScopeItem.type*
ret %m2624$.ScopeItem.type* %.tmp6614
}
define %m2624$.ScopeItem.type* @m295$find_defined_str.m2624$.ScopeItem.typep.m2624$.CompilerCtx.typep.cp.cp(%m2624$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp6615 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6616 = load i8*, i8** %module
%.tmp6617 = call %m2624$.ModuleLookup.type*(%m2624$.CompilerCtx.type*,i8*) @m295$get_module.m2624$.ModuleLookup.typep.m2624$.CompilerCtx.typep.cp(%m2624$.CompilerCtx.type* %.tmp6615, i8* %.tmp6616)
%mod.6618 = alloca %m2624$.ModuleLookup.type*
store %m2624$.ModuleLookup.type* %.tmp6617, %m2624$.ModuleLookup.type** %mod.6618
%.tmp6619 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.6618
%.tmp6620 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp6619, i32 0, i32 3
%.tmp6621 = load %m2624$.Scope.type*, %m2624$.Scope.type** %.tmp6620
%.tmp6622 = icmp ne %m2624$.Scope.type* %.tmp6621, null
%.tmp6624 = getelementptr [77 x i8], [77 x i8]*@.str6623, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6622, i8* %.tmp6624)
%.tmp6626 = load %m2624$.ModuleLookup.type*, %m2624$.ModuleLookup.type** %mod.6618
%.tmp6627 = getelementptr %m2624$.ModuleLookup.type, %m2624$.ModuleLookup.type* %.tmp6626, i32 0, i32 3
%.tmp6628 = load %m2624$.Scope.type*, %m2624$.Scope.type** %.tmp6627
%s.6629 = alloca %m2624$.Scope.type*
store %m2624$.Scope.type* %.tmp6628, %m2624$.Scope.type** %s.6629
br label %.for.start.6625
.for.start.6625:
%.tmp6630 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.6629
%.tmp6631 = icmp ne %m2624$.Scope.type* %.tmp6630, null
br i1 %.tmp6631, label %.for.continue.6625, label %.for.end.6625
.for.continue.6625:
%.tmp6632 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6633 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.6629
%.tmp6634 = load i8*, i8** %assignable_name
%.tmp6635 = call %m2624$.ScopeItem.type*(%m2624$.CompilerCtx.type*,%m2624$.Scope.type*,i8*) @m295$find_defined_here.m2624$.ScopeItem.typep.m2624$.CompilerCtx.typep.m2624$.Scope.typep.cp(%m2624$.CompilerCtx.type* %.tmp6632, %m2624$.Scope.type* %.tmp6633, i8* %.tmp6634)
%item.6636 = alloca %m2624$.ScopeItem.type*
store %m2624$.ScopeItem.type* %.tmp6635, %m2624$.ScopeItem.type** %item.6636
%.tmp6637 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %item.6636
%.tmp6638 = icmp ne %m2624$.ScopeItem.type* %.tmp6637, null
br i1 %.tmp6638, label %.if.true.6639, label %.if.false.6639
.if.true.6639:
%.tmp6640 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %item.6636
ret %m2624$.ScopeItem.type* %.tmp6640
br label %.if.end.6639
.if.false.6639:
br label %.if.end.6639
.if.end.6639:
%.tmp6641 = load %m2624$.Scope.type*, %m2624$.Scope.type** %s.6629
%.tmp6642 = getelementptr %m2624$.Scope.type, %m2624$.Scope.type* %.tmp6641, i32 0, i32 5
%.tmp6643 = load %m2624$.Scope.type*, %m2624$.Scope.type** %.tmp6642
store %m2624$.Scope.type* %.tmp6643, %m2624$.Scope.type** %s.6629
br label %.for.start.6625
.for.end.6625:
%.tmp6644 = bitcast ptr null to %m2624$.ScopeItem.type*
ret %m2624$.ScopeItem.type* %.tmp6644
}
define %m2624$.ScopeItem.type* @m295$find_defined.m2624$.ScopeItem.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%dotted_name = alloca %m972$.Node.type*
store %m972$.Node.type* %.dotted_name.arg, %m972$.Node.type** %dotted_name
%.tmp6645 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6646 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6647 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6646, i32 0, i32 7
%.tmp6648 = load i8*, i8** %.tmp6647
%.tmp6649 = load %m972$.Node.type*, %m972$.Node.type** %dotted_name
%.tmp6650 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6649, i32 0, i32 6
%.tmp6651 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6650
%.tmp6652 = call %m2624$.ScopeItem.type*(%m2624$.CompilerCtx.type*,i8*,%m972$.Node.type*) @m295$find_defined_in.m2624$.ScopeItem.typep.m2624$.CompilerCtx.typep.cp.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp6645, i8* %.tmp6648, %m972$.Node.type* %.tmp6651)
ret %m2624$.ScopeItem.type* %.tmp6652
}
define %m2624$.AssignableInfo.type* @m295$get_dotted_name.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.dot_name_ptr.arg, %m2624$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m972$.Node.type*
store %m972$.Node.type* %.dot_name_ptr.arg, %m972$.Node.type** %dot_name_ptr
%info = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.info.arg, %m2624$.AssignableInfo.type** %info
%err_msg.6653 = alloca i8*
store i8* null, i8** %err_msg.6653
%buf.6654 = alloca i8*
store i8* null, i8** %buf.6654
%.tmp6655 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp6656 = icmp eq %m2624$.AssignableInfo.type* %.tmp6655, null
br i1 %.tmp6656, label %.if.true.6657, label %.if.false.6657
.if.true.6657:
%.tmp6658 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6659 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6661 = getelementptr [54 x i8], [54 x i8]*@.str6660, i32 0, i32 0
%.tmp6662 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp6658, %m972$.Node.type* %.tmp6659, i8* %.tmp6661)
%.tmp6663 = call i32(i8*,...) @printf(i8* %.tmp6662)
%.tmp6664 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp6664
br label %.if.end.6657
.if.false.6657:
br label %.if.end.6657
.if.end.6657:
%.tmp6665 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp6666 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6665, i32 0, i32 3
%.tmp6667 = load i8*, i8** %.tmp6666
%.tmp6669 = getelementptr [9 x i8], [9 x i8]*@.str6668, i32 0, i32 0
%.tmp6670 = call i32(i8*,i8*) @strcmp(i8* %.tmp6667, i8* %.tmp6669)
%.tmp6671 = icmp eq i32 %.tmp6670, 0
%.tmp6672 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp6673 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6672, i32 0, i32 3
%.tmp6674 = load i8*, i8** %.tmp6673
%.tmp6676 = getelementptr [7 x i8], [7 x i8]*@.str6675, i32 0, i32 0
%.tmp6677 = call i32(i8*,i8*) @strcmp(i8* %.tmp6674, i8* %.tmp6676)
%.tmp6678 = icmp eq i32 %.tmp6677, 0
%.tmp6679 = or i1 %.tmp6671, %.tmp6678
br i1 %.tmp6679, label %.if.true.6680, label %.if.false.6680
.if.true.6680:
%.tmp6681 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6682 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6681, i32 0, i32 7
%.tmp6683 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6682
%.tmp6684 = icmp ne %m972$.Node.type* %.tmp6683, null
br i1 %.tmp6684, label %.if.true.6685, label %.if.false.6685
.if.true.6685:
%.tmp6686 = getelementptr i8*, i8** %err_msg.6653, i32 0
%.tmp6688 = getelementptr [46 x i8], [46 x i8]*@.str6687, i32 0, i32 0
%.tmp6689 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6690 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6689, i32 0, i32 7
%.tmp6691 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6690
%.tmp6692 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6691, i32 0, i32 7
%.tmp6693 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6692
%.tmp6694 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6693, i32 0, i32 1
%.tmp6695 = load i8*, i8** %.tmp6694
%.tmp6696 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6697 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6696, i32 0, i32 1
%.tmp6698 = load i8*, i8** %.tmp6697
%.tmp6699 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6686, i8* %.tmp6688, i8* %.tmp6695, i8* %.tmp6698)
%.tmp6700 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6701 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6702 = load i8*, i8** %err_msg.6653
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp6700, %m972$.Node.type* %.tmp6701, i8* %.tmp6702)
%.tmp6703 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp6703
br label %.if.end.6685
.if.false.6685:
br label %.if.end.6685
.if.end.6685:
%.tmp6704 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
ret %m2624$.AssignableInfo.type* %.tmp6704
br label %.if.end.6680
.if.false.6680:
%.tmp6705 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp6706 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6705, i32 0, i32 3
%.tmp6707 = load i8*, i8** %.tmp6706
%.tmp6709 = getelementptr [9 x i8], [9 x i8]*@.str6708, i32 0, i32 0
%.tmp6710 = call i32(i8*,i8*) @strcmp(i8* %.tmp6707, i8* %.tmp6709)
%.tmp6711 = icmp eq i32 %.tmp6710, 0
%.tmp6712 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6713 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6712, i32 0, i32 7
%.tmp6714 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6713
%.tmp6715 = icmp ne %m972$.Node.type* %.tmp6714, null
%.tmp6716 = and i1 %.tmp6711, %.tmp6715
br i1 %.tmp6716, label %.if.true.6717, label %.if.false.6717
.if.true.6717:
%.tmp6718 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%base_var.6719 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp6718, %m2624$.AssignableInfo.type** %base_var.6719
%.tmp6720 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base_var.6719
%.tmp6721 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6720, i32 0, i32 4
%.tmp6722 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6721
%struct_info.6723 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp6722, %m2624$.Type.type** %struct_info.6723
br label %.for.start.6724
.for.start.6724:
%.tmp6725 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base_var.6719
%.tmp6726 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6725, i32 0, i32 4
%.tmp6727 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6726
%.tmp6728 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6727, i32 0, i32 0
%.tmp6729 = load i8*, i8** %.tmp6728
%.tmp6731 = getelementptr [4 x i8], [4 x i8]*@.str6730, i32 0, i32 0
%.tmp6732 = call i32(i8*,i8*) @strcmp(i8* %.tmp6729, i8* %.tmp6731)
%.tmp6733 = icmp eq i32 %.tmp6732, 0
br i1 %.tmp6733, label %.for.continue.6724, label %.for.end.6724
.for.continue.6724:
%.tmp6734 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6735 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp6734)
%new_base.6736 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp6735, %m2624$.AssignableInfo.type** %new_base.6736
%.tmp6737 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6738 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.6736
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp6737, %m2624$.AssignableInfo.type* %.tmp6738)
%.tmp6739 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.6736
%.tmp6740 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6739, i32 0, i32 4
%.tmp6741 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base_var.6719
%.tmp6742 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6741, i32 0, i32 4
%.tmp6743 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6742
%.tmp6744 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6743, i32 0, i32 3
%.tmp6745 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6744
store %m2624$.Type.type* %.tmp6745, %m2624$.Type.type** %.tmp6740
%.tmp6746 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6747 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6746, i32 0, i32 1
%.tmp6748 = load %m0$.File.type*, %m0$.File.type** %.tmp6747
%.tmp6750 = getelementptr [23 x i8], [23 x i8]*@.str6749, i32 0, i32 0
%.tmp6751 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.6736
%.tmp6752 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp6751)
%.tmp6753 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6754 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.6736
%.tmp6755 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6754, i32 0, i32 4
%.tmp6756 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6755
%.tmp6757 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp6753, %m2624$.Type.type* %.tmp6756)
%.tmp6758 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6759 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base_var.6719
%.tmp6760 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6759, i32 0, i32 4
%.tmp6761 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6760
%.tmp6762 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp6758, %m2624$.Type.type* %.tmp6761)
%.tmp6763 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base_var.6719
%.tmp6764 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp6763)
%.tmp6765 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6748, i8* %.tmp6750, i8* %.tmp6752, i8* %.tmp6757, i8* %.tmp6762, i8* %.tmp6764)
%.tmp6766 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.6736
store %m2624$.AssignableInfo.type* %.tmp6766, %m2624$.AssignableInfo.type** %base_var.6719
%.tmp6767 = load %m2624$.Type.type*, %m2624$.Type.type** %struct_info.6723
%.tmp6768 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6767, i32 0, i32 3
%.tmp6769 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6768
store %m2624$.Type.type* %.tmp6769, %m2624$.Type.type** %struct_info.6723
br label %.for.start.6724
.for.end.6724:
%.tmp6770 = load %m2624$.Type.type*, %m2624$.Type.type** %struct_info.6723
%.tmp6771 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6770, i32 0, i32 0
%.tmp6772 = load i8*, i8** %.tmp6771
%.tmp6774 = getelementptr [10 x i8], [10 x i8]*@.str6773, i32 0, i32 0
%.tmp6775 = call i32(i8*,i8*) @strcmp(i8* %.tmp6772, i8* %.tmp6774)
%.tmp6776 = icmp eq i32 %.tmp6775, 0
br i1 %.tmp6776, label %.if.true.6777, label %.if.false.6777
.if.true.6777:
%.tmp6778 = load %m2624$.Type.type*, %m2624$.Type.type** %struct_info.6723
%.tmp6779 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6778, i32 0, i32 3
%.tmp6780 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6779
store %m2624$.Type.type* %.tmp6780, %m2624$.Type.type** %struct_info.6723
br label %.if.end.6777
.if.false.6777:
br label %.if.end.6777
.if.end.6777:
%.tmp6781 = load %m2624$.Type.type*, %m2624$.Type.type** %struct_info.6723
%.tmp6782 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6781, i32 0, i32 0
%.tmp6783 = load i8*, i8** %.tmp6782
%.tmp6785 = getelementptr [7 x i8], [7 x i8]*@.str6784, i32 0, i32 0
%.tmp6786 = call i32(i8*,i8*) @strcmp(i8* %.tmp6783, i8* %.tmp6785)
%.tmp6787 = icmp ne i32 %.tmp6786, 0
br i1 %.tmp6787, label %.if.true.6788, label %.if.false.6788
.if.true.6788:
%.tmp6789 = getelementptr i8*, i8** %err_msg.6653, i32 0
%.tmp6791 = getelementptr [48 x i8], [48 x i8]*@.str6790, i32 0, i32 0
%.tmp6792 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6793 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6792, i32 0, i32 7
%.tmp6794 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6793
%.tmp6795 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6794, i32 0, i32 7
%.tmp6796 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6795
%.tmp6797 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6796, i32 0, i32 1
%.tmp6798 = load i8*, i8** %.tmp6797
%.tmp6799 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6800 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6799, i32 0, i32 1
%.tmp6801 = load i8*, i8** %.tmp6800
%.tmp6802 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6789, i8* %.tmp6791, i8* %.tmp6798, i8* %.tmp6801)
%.tmp6803 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6804 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6805 = load i8*, i8** %err_msg.6653
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp6803, %m972$.Node.type* %.tmp6804, i8* %.tmp6805)
%.tmp6806 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp6806
br label %.if.end.6788
.if.false.6788:
br label %.if.end.6788
.if.end.6788:
%.tmp6807 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6808 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6807, i32 0, i32 7
%.tmp6809 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6808
%.tmp6810 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6809, i32 0, i32 7
%.tmp6811 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6810
%.tmp6812 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6811, i32 0, i32 1
%.tmp6813 = load i8*, i8** %.tmp6812
%field_name.6814 = alloca i8*
store i8* %.tmp6813, i8** %field_name.6814
%field_id.6815 = alloca i32
store i32 0, i32* %field_id.6815
%.tmp6816 = bitcast ptr null to %m2624$.Type.type*
%found_field.6817 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp6816, %m2624$.Type.type** %found_field.6817
%.tmp6819 = load %m2624$.Type.type*, %m2624$.Type.type** %struct_info.6723
%.tmp6820 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6819, i32 0, i32 3
%.tmp6821 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6820
%field.6822 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp6821, %m2624$.Type.type** %field.6822
br label %.for.start.6818
.for.start.6818:
%.tmp6823 = load %m2624$.Type.type*, %m2624$.Type.type** %field.6822
%.tmp6824 = icmp ne %m2624$.Type.type* %.tmp6823, null
br i1 %.tmp6824, label %.for.continue.6818, label %.for.end.6818
.for.continue.6818:
%.tmp6825 = load %m2624$.Type.type*, %m2624$.Type.type** %field.6822
%.tmp6826 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6825, i32 0, i32 1
%.tmp6827 = load i8*, i8** %.tmp6826
%.tmp6828 = load i8*, i8** %field_name.6814
%.tmp6829 = call i32(i8*,i8*) @strcmp(i8* %.tmp6827, i8* %.tmp6828)
%.tmp6830 = icmp eq i32 %.tmp6829, 0
br i1 %.tmp6830, label %.if.true.6831, label %.if.false.6831
.if.true.6831:
%.tmp6832 = load %m2624$.Type.type*, %m2624$.Type.type** %field.6822
store %m2624$.Type.type* %.tmp6832, %m2624$.Type.type** %found_field.6817
br label %.for.end.6818
br label %.if.end.6831
.if.false.6831:
%.tmp6833 = load i32, i32* %field_id.6815
%.tmp6834 = add i32 %.tmp6833, 1
store i32 %.tmp6834, i32* %field_id.6815
br label %.if.end.6831
.if.end.6831:
%.tmp6835 = load %m2624$.Type.type*, %m2624$.Type.type** %field.6822
%.tmp6836 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp6835, i32 0, i32 4
%.tmp6837 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6836
store %m2624$.Type.type* %.tmp6837, %m2624$.Type.type** %field.6822
br label %.for.start.6818
.for.end.6818:
%.tmp6838 = load %m2624$.Type.type*, %m2624$.Type.type** %found_field.6817
%.tmp6839 = icmp eq %m2624$.Type.type* %.tmp6838, null
br i1 %.tmp6839, label %.if.true.6840, label %.if.false.6840
.if.true.6840:
%.tmp6841 = getelementptr i8*, i8** %err_msg.6653, i32 0
%.tmp6843 = getelementptr [34 x i8], [34 x i8]*@.str6842, i32 0, i32 0
%.tmp6844 = load i8*, i8** %field_name.6814
%.tmp6845 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6846 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6845, i32 0, i32 1
%.tmp6847 = load i8*, i8** %.tmp6846
%.tmp6848 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6841, i8* %.tmp6843, i8* %.tmp6844, i8* %.tmp6847)
%.tmp6849 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6850 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6851 = load i8*, i8** %err_msg.6653
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp6849, %m972$.Node.type* %.tmp6850, i8* %.tmp6851)
%.tmp6852 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp6852
br label %.if.end.6840
.if.false.6840:
br label %.if.end.6840
.if.end.6840:
%.tmp6853 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6854 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp6853)
%new_info.6855 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp6854, %m2624$.AssignableInfo.type** %new_info.6855
%.tmp6856 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_info.6855
%.tmp6857 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6856, i32 0, i32 4
%.tmp6858 = load %m2624$.Type.type*, %m2624$.Type.type** %found_field.6817
store %m2624$.Type.type* %.tmp6858, %m2624$.Type.type** %.tmp6857
%.tmp6859 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6860 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_info.6855
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp6859, %m2624$.AssignableInfo.type* %.tmp6860)
%.tmp6861 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_info.6855
%.tmp6862 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6861, i32 0, i32 3
%.tmp6864 = getelementptr [9 x i8], [9 x i8]*@.str6863, i32 0, i32 0
store i8* %.tmp6864, i8** %.tmp6862
%.tmp6865 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6866 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base_var.6719
%.tmp6867 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6866, i32 0, i32 4
%.tmp6868 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp6867
%.tmp6869 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp6865, %m2624$.Type.type* %.tmp6868)
%info_tr.6870 = alloca i8*
store i8* %.tmp6869, i8** %info_tr.6870
%.tmp6871 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6872 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6871, i32 0, i32 1
%.tmp6873 = load %m0$.File.type*, %m0$.File.type** %.tmp6872
%.tmp6875 = getelementptr [46 x i8], [46 x i8]*@.str6874, i32 0, i32 0
%.tmp6876 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_info.6855
%.tmp6877 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp6876)
%.tmp6878 = load i8*, i8** %info_tr.6870
%.tmp6879 = load i8*, i8** %info_tr.6870
%.tmp6880 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base_var.6719
%.tmp6881 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp6880)
%.tmp6882 = load i32, i32* %field_id.6815
%.tmp6883 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6873, i8* %.tmp6875, i8* %.tmp6877, i8* %.tmp6878, i8* %.tmp6879, i8* %.tmp6881, i32 %.tmp6882)
%.tmp6884 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6885 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6886 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6885, i32 0, i32 7
%.tmp6887 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6886
%.tmp6888 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6887, i32 0, i32 7
%.tmp6889 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6888
%.tmp6890 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_info.6855
%.tmp6891 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,%m2624$.AssignableInfo.type*) @m295$get_dotted_name.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp6884, %m972$.Node.type* %.tmp6889, %m2624$.AssignableInfo.type* %.tmp6890)
ret %m2624$.AssignableInfo.type* %.tmp6891
br label %.if.end.6717
.if.false.6717:
%.tmp6892 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp6893 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6892, i32 0, i32 3
%.tmp6894 = load i8*, i8** %.tmp6893
%.tmp6896 = getelementptr [9 x i8], [9 x i8]*@.str6895, i32 0, i32 0
%.tmp6897 = call i32(i8*,i8*) @strcmp(i8* %.tmp6894, i8* %.tmp6896)
%.tmp6898 = icmp eq i32 %.tmp6897, 0
br i1 %.tmp6898, label %.if.true.6899, label %.if.false.6899
.if.true.6899:
%.tmp6900 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
ret %m2624$.AssignableInfo.type* %.tmp6900
br label %.if.end.6899
.if.false.6899:
br label %.if.end.6899
.if.end.6899:
br label %.if.end.6717
.if.end.6717:
br label %.if.end.6680
.if.end.6680:
%.tmp6901 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6902 = load %m972$.Node.type*, %m972$.Node.type** %dot_name_ptr
%.tmp6904 = getelementptr [43 x i8], [43 x i8]*@.str6903, i32 0, i32 0
%.tmp6905 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp6901, %m972$.Node.type* %.tmp6902, i8* %.tmp6904)
%.tmp6906 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
%.tmp6907 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6906, i32 0, i32 3
%.tmp6908 = load i8*, i8** %.tmp6907
%.tmp6909 = call i32(i8*,...) @printf(i8* %.tmp6905, i8* %.tmp6908)
%.tmp6910 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp6910
}
define %m2624$.AssignableInfo.type* @m295$compile_addr.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%err_msg.6911 = alloca i8*
store i8* null, i8** %err_msg.6911
%.tmp6912 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%curr_node.6913 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp6912, %m972$.Node.type** %curr_node.6913
%.tmp6914 = load %m972$.Node.type*, %m972$.Node.type** %curr_node.6913
%.tmp6915 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6914, i32 0, i32 0
%.tmp6916 = load i8*, i8** %.tmp6915
%.tmp6918 = getelementptr [17 x i8], [17 x i8]*@.str6917, i32 0, i32 0
%.tmp6919 = call i32(i8*,i8*) @strcmp(i8* %.tmp6916, i8* %.tmp6918)
%.tmp6920 = icmp eq i32 %.tmp6919, 0
%.tmp6921 = load %m972$.Node.type*, %m972$.Node.type** %curr_node.6913
%.tmp6922 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6921, i32 0, i32 0
%.tmp6923 = load i8*, i8** %.tmp6922
%.tmp6925 = getelementptr [16 x i8], [16 x i8]*@.str6924, i32 0, i32 0
%.tmp6926 = call i32(i8*,i8*) @strcmp(i8* %.tmp6923, i8* %.tmp6925)
%.tmp6927 = icmp eq i32 %.tmp6926, 0
%.tmp6928 = or i1 %.tmp6920, %.tmp6927
%.tmp6929 = load %m972$.Node.type*, %m972$.Node.type** %curr_node.6913
%.tmp6930 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6929, i32 0, i32 0
%.tmp6931 = load i8*, i8** %.tmp6930
%.tmp6933 = getelementptr [11 x i8], [11 x i8]*@.str6932, i32 0, i32 0
%.tmp6934 = call i32(i8*,i8*) @strcmp(i8* %.tmp6931, i8* %.tmp6933)
%.tmp6935 = icmp eq i32 %.tmp6934, 0
%.tmp6936 = or i1 %.tmp6928, %.tmp6935
br i1 %.tmp6936, label %.if.true.6937, label %.if.false.6937
.if.true.6937:
%.tmp6938 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6939 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6940 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6939, i32 0, i32 6
%.tmp6941 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6940
%.tmp6942 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_addr.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp6938, %m972$.Node.type* %.tmp6941)
ret %m2624$.AssignableInfo.type* %.tmp6942
br label %.if.end.6937
.if.false.6937:
br label %.if.end.6937
.if.end.6937:
%.tmp6943 = load %m972$.Node.type*, %m972$.Node.type** %curr_node.6913
%.tmp6944 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6943, i32 0, i32 0
%.tmp6945 = load i8*, i8** %.tmp6944
%.tmp6947 = getelementptr [12 x i8], [12 x i8]*@.str6946, i32 0, i32 0
%.tmp6948 = call i32(i8*,i8*) @strcmp(i8* %.tmp6945, i8* %.tmp6947)
%.tmp6949 = icmp ne i32 %.tmp6948, 0
br i1 %.tmp6949, label %.if.true.6950, label %.if.false.6950
.if.true.6950:
%.tmp6952 = getelementptr [92 x i8], [92 x i8]*@.str6951, i32 0, i32 0
%.tmp6953 = load %m972$.Node.type*, %m972$.Node.type** %curr_node.6913
%.tmp6954 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6953, i32 0, i32 0
%.tmp6955 = load i8*, i8** %.tmp6954
%.tmp6956 = call i32(i8*,...) @printf(i8* %.tmp6952, i8* %.tmp6955)
%.tmp6957 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp6958 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6957, i32 0, i32 6
%.tmp6959 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6958
store %m972$.Node.type* %.tmp6959, %m972$.Node.type** %curr_node.6913
br label %.if.end.6950
.if.false.6950:
br label %.if.end.6950
.if.end.6950:
%.tmp6960 = load %m972$.Node.type*, %m972$.Node.type** %curr_node.6913
%.tmp6961 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6960, i32 0, i32 6
%.tmp6962 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6961
%assignable_name.6963 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp6962, %m972$.Node.type** %assignable_name.6963
%.tmp6964 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6965 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6966 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp6965, i32 0, i32 7
%.tmp6967 = load i8*, i8** %.tmp6966
%.tmp6968 = load %m972$.Node.type*, %m972$.Node.type** %assignable_name.6963
%.tmp6969 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6968, i32 0, i32 6
%.tmp6970 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6969
%.tmp6971 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6970, i32 0, i32 1
%.tmp6972 = load i8*, i8** %.tmp6971
%.tmp6973 = call %m2624$.ScopeItem.type*(%m2624$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2624$.ScopeItem.typep.m2624$.CompilerCtx.typep.cp.cp(%m2624$.CompilerCtx.type* %.tmp6964, i8* %.tmp6967, i8* %.tmp6972)
%scope_info.6974 = alloca %m2624$.ScopeItem.type*
store %m2624$.ScopeItem.type* %.tmp6973, %m2624$.ScopeItem.type** %scope_info.6974
%.tmp6975 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %scope_info.6974
%.tmp6976 = icmp eq %m2624$.ScopeItem.type* %.tmp6975, null
br i1 %.tmp6976, label %.if.true.6977, label %.if.false.6977
.if.true.6977:
%.tmp6978 = getelementptr i8*, i8** %err_msg.6911, i32 0
%.tmp6980 = getelementptr [41 x i8], [41 x i8]*@.str6979, i32 0, i32 0
%.tmp6981 = load %m972$.Node.type*, %m972$.Node.type** %assignable_name.6963
%.tmp6982 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6981, i32 0, i32 6
%.tmp6983 = load %m972$.Node.type*, %m972$.Node.type** %.tmp6982
%.tmp6984 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp6983, i32 0, i32 1
%.tmp6985 = load i8*, i8** %.tmp6984
%.tmp6986 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6978, i8* %.tmp6980, i8* %.tmp6985)
%.tmp6987 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp6988 = load %m972$.Node.type*, %m972$.Node.type** %assignable_name.6963
%.tmp6989 = load i8*, i8** %err_msg.6911
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp6987, %m972$.Node.type* %.tmp6988, i8* %.tmp6989)
%.tmp6990 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp6990
br label %.if.end.6977
.if.false.6977:
br label %.if.end.6977
.if.end.6977:
%.tmp6991 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %scope_info.6974
%.tmp6992 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp6991, i32 0, i32 1
%.tmp6993 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %.tmp6992
%info.6994 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp6993, %m2624$.AssignableInfo.type** %info.6994
%.tmp6995 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6994
%.tmp6996 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp6995, i32 0, i32 3
%.tmp6997 = load i8*, i8** %.tmp6996
%.tmp6999 = getelementptr [7 x i8], [7 x i8]*@.str6998, i32 0, i32 0
%.tmp7000 = call i32(i8*,i8*) @strcmp(i8* %.tmp6997, i8* %.tmp6999)
%.tmp7001 = icmp eq i32 %.tmp7000, 0
br i1 %.tmp7001, label %.if.true.7002, label %.if.false.7002
.if.true.7002:
%.tmp7003 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7004 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6994
%.tmp7005 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7004)
%.tmp7006 = load %m972$.Node.type*, %m972$.Node.type** %assignable_name.6963
%.tmp7007 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7006, i32 0, i32 6
%.tmp7008 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7007
%.tmp7009 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7008, i32 0, i32 7
%.tmp7010 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7009
%.tmp7011 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7010, i32 0, i32 7
%.tmp7012 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7011
%.tmp7013 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7012, i32 0, i32 1
%.tmp7014 = load i8*, i8** %.tmp7013
%.tmp7015 = call %m2624$.ScopeItem.type*(%m2624$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2624$.ScopeItem.typep.m2624$.CompilerCtx.typep.cp.cp(%m2624$.CompilerCtx.type* %.tmp7003, i8* %.tmp7005, i8* %.tmp7014)
store %m2624$.ScopeItem.type* %.tmp7015, %m2624$.ScopeItem.type** %scope_info.6974
%.tmp7016 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %scope_info.6974
%.tmp7017 = icmp eq %m2624$.ScopeItem.type* %.tmp7016, null
br i1 %.tmp7017, label %.if.true.7018, label %.if.false.7018
.if.true.7018:
%.tmp7019 = getelementptr i8*, i8** %err_msg.6911, i32 0
%.tmp7021 = getelementptr [31 x i8], [31 x i8]*@.str7020, i32 0, i32 0
%.tmp7022 = load %m972$.Node.type*, %m972$.Node.type** %assignable_name.6963
%.tmp7023 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7022, i32 0, i32 6
%.tmp7024 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7023
%.tmp7025 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7024, i32 0, i32 7
%.tmp7026 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7025
%.tmp7027 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7026, i32 0, i32 7
%.tmp7028 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7027
%.tmp7029 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7028, i32 0, i32 1
%.tmp7030 = load i8*, i8** %.tmp7029
%.tmp7031 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6994
%.tmp7032 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7031)
%.tmp7033 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7019, i8* %.tmp7021, i8* %.tmp7030, i8* %.tmp7032)
%.tmp7034 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7035 = load %m972$.Node.type*, %m972$.Node.type** %curr_node.6913
%.tmp7036 = load i8*, i8** %err_msg.6911
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp7034, %m972$.Node.type* %.tmp7035, i8* %.tmp7036)
%.tmp7037 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp7037
br label %.if.end.7018
.if.false.7018:
br label %.if.end.7018
.if.end.7018:
%.tmp7038 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %scope_info.6974
%.tmp7039 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp7038, i32 0, i32 1
%.tmp7040 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %.tmp7039
store %m2624$.AssignableInfo.type* %.tmp7040, %m2624$.AssignableInfo.type** %info.6994
%.tmp7041 = load %m972$.Node.type*, %m972$.Node.type** %assignable_name.6963
%.tmp7042 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7041, i32 0, i32 6
%.tmp7043 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7042
%.tmp7044 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7043, i32 0, i32 7
%.tmp7045 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7044
%.tmp7046 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7045, i32 0, i32 7
%.tmp7047 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7046
store %m972$.Node.type* %.tmp7047, %m972$.Node.type** %assignable_name.6963
br label %.if.end.7002
.if.false.7002:
%.tmp7048 = load %m972$.Node.type*, %m972$.Node.type** %assignable_name.6963
%.tmp7049 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7048, i32 0, i32 6
%.tmp7050 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7049
store %m972$.Node.type* %.tmp7050, %m972$.Node.type** %assignable_name.6963
br label %.if.end.7002
.if.end.7002:
%.tmp7051 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7052 = load %m972$.Node.type*, %m972$.Node.type** %assignable_name.6963
%.tmp7053 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.6994
%.tmp7054 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,%m2624$.AssignableInfo.type*) @m295$get_dotted_name.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp7051, %m972$.Node.type* %.tmp7052, %m2624$.AssignableInfo.type* %.tmp7053)
%base.7055 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp7054, %m2624$.AssignableInfo.type** %base.7055
%.tmp7057 = load %m972$.Node.type*, %m972$.Node.type** %curr_node.6913
%.tmp7058 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7057, i32 0, i32 6
%.tmp7059 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7058
%.tmp7060 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7059, i32 0, i32 7
%.tmp7061 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7060
%addr.7062 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp7061, %m972$.Node.type** %addr.7062
br label %.for.start.7056
.for.start.7056:
%.tmp7063 = load %m972$.Node.type*, %m972$.Node.type** %addr.7062
%.tmp7064 = icmp ne %m972$.Node.type* %.tmp7063, null
br i1 %.tmp7064, label %.for.continue.7056, label %.for.end.7056
.for.continue.7056:
%.tmp7065 = load %m972$.Node.type*, %m972$.Node.type** %addr.7062
%.tmp7066 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7065, i32 0, i32 7
%.tmp7067 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7066
%index.7068 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp7067, %m972$.Node.type** %index.7068
%.tmp7069 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7070 = load %m972$.Node.type*, %m972$.Node.type** %index.7068
%.tmp7071 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_assignable.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp7069, %m972$.Node.type* %.tmp7070)
%index_info.7072 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp7071, %m2624$.AssignableInfo.type** %index_info.7072
%.tmp7073 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7074 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %index_info.7072
%.tmp7075 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7074, i32 0, i32 4
%.tmp7076 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7075
%.tmp7077 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp7073, %m2624$.Type.type* %.tmp7076)
%index_type.7078 = alloca i8*
store i8* %.tmp7077, i8** %index_type.7078
%.tmp7079 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base.7055
%.tmp7080 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7079, i32 0, i32 4
%.tmp7081 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7080
%.tmp7082 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7081, i32 0, i32 1
%.tmp7083 = load i8*, i8** %.tmp7082
%.tmp7084 = icmp ne i8* %.tmp7083, null
br i1 %.tmp7084, label %.if.true.7085, label %.if.false.7085
.if.true.7085:
%.tmp7086 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base.7055
%.tmp7087 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7086, i32 0, i32 4
%.tmp7088 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7087
%.tmp7089 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7088, i32 0, i32 1
%.tmp7090 = load i8*, i8** %.tmp7089
%.tmp7092 = getelementptr [6 x i8], [6 x i8]*@.str7091, i32 0, i32 0
%.tmp7093 = call i32(i8*,i8*) @strcmp(i8* %.tmp7090, i8* %.tmp7092)
%.tmp7094 = icmp eq i32 %.tmp7093, 0
br i1 %.tmp7094, label %.if.true.7095, label %.if.false.7095
.if.true.7095:
%.tmp7096 = load %m972$.Node.type*, %m972$.Node.type** %curr_node.6913
%.tmp7097 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp7096)
%new_base.7098 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp7097, %m2624$.AssignableInfo.type** %new_base.7098
%.tmp7099 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7100 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.7098
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp7099, %m2624$.AssignableInfo.type* %.tmp7100)
%.tmp7101 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7102 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp7101, i32 0, i32 1
%.tmp7103 = load %m0$.File.type*, %m0$.File.type** %.tmp7102
%.tmp7105 = getelementptr [45 x i8], [45 x i8]*@.str7104, i32 0, i32 0
%.tmp7106 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.7098
%.tmp7107 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7106)
%.tmp7108 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7109 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base.7055
%.tmp7110 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7109, i32 0, i32 4
%.tmp7111 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7110
%.tmp7112 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp7108, %m2624$.Type.type* %.tmp7111)
%.tmp7113 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7114 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base.7055
%.tmp7115 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7114, i32 0, i32 4
%.tmp7116 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7115
%.tmp7117 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp7113, %m2624$.Type.type* %.tmp7116)
%.tmp7118 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base.7055
%.tmp7119 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7118)
%.tmp7120 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7103, i8* %.tmp7105, i8* %.tmp7107, i8* %.tmp7112, i8* %.tmp7117, i8* %.tmp7119)
%.tmp7121 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.7098
%.tmp7122 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7121, i32 0, i32 4
%.tmp7123 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base.7055
%.tmp7124 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7123, i32 0, i32 4
%.tmp7125 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7124
%.tmp7126 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7125, i32 0, i32 3
%.tmp7127 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7126
%.tmp7128 = call %m2624$.Type.type*(%m2624$.Type.type*) @m295$type_clone.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.tmp7127)
store %m2624$.Type.type* %.tmp7128, %m2624$.Type.type** %.tmp7122
%.tmp7129 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.7098
%.tmp7130 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7129, i32 0, i32 4
%.tmp7131 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7130
%.tmp7132 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7131, i32 0, i32 4
store %m2624$.Type.type* null, %m2624$.Type.type** %.tmp7132
%.tmp7133 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.7098
store %m2624$.AssignableInfo.type* %.tmp7133, %m2624$.AssignableInfo.type** %base.7055
br label %.if.end.7095
.if.false.7095:
br label %.if.end.7095
.if.end.7095:
br label %.if.end.7085
.if.false.7085:
br label %.if.end.7085
.if.end.7085:
%.tmp7134 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7135 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base.7055
%.tmp7136 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7135, i32 0, i32 4
%.tmp7137 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7136
%.tmp7138 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp7134, %m2624$.Type.type* %.tmp7137)
%base_type.7139 = alloca i8*
store i8* %.tmp7138, i8** %base_type.7139
%.tmp7140 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7141 = call i32(%m2624$.CompilerCtx.type*) @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp7140)
%tmp_id.7142 = alloca i32
store i32 %.tmp7141, i32* %tmp_id.7142
%.tmp7143 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7144 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp7143, i32 0, i32 1
%.tmp7145 = load %m0$.File.type*, %m0$.File.type** %.tmp7144
%.tmp7147 = getelementptr [28 x i8], [28 x i8]*@.str7146, i32 0, i32 0
%.tmp7148 = load i32, i32* %tmp_id.7142
%.tmp7149 = load i8*, i8** %base_type.7139
%.tmp7150 = load i8*, i8** %base_type.7139
%.tmp7151 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base.7055
%.tmp7152 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7151)
%.tmp7153 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7145, i8* %.tmp7147, i32 %.tmp7148, i8* %.tmp7149, i8* %.tmp7150, i8* %.tmp7152)
%.tmp7154 = load %m972$.Node.type*, %m972$.Node.type** %curr_node.6913
%.tmp7155 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp7154)
%new_base.7156 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp7155, %m2624$.AssignableInfo.type** %new_base.7156
%.tmp7157 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7158 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.7156
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp7157, %m2624$.AssignableInfo.type* %.tmp7158)
%.tmp7159 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base.7055
%.tmp7160 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7159, i32 0, i32 4
%.tmp7161 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7160
%.tmp7162 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7161, i32 0, i32 3
%.tmp7163 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7162
%.tmp7164 = icmp eq %m2624$.Type.type* %.tmp7163, null
br i1 %.tmp7164, label %.if.true.7165, label %.if.false.7165
.if.true.7165:
%.tmp7166 = getelementptr i8*, i8** %err_msg.6911, i32 0
%.tmp7168 = getelementptr [35 x i8], [35 x i8]*@.str7167, i32 0, i32 0
%.tmp7169 = load i8*, i8** %base_type.7139
%.tmp7170 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7166, i8* %.tmp7168, i8* %.tmp7169)
%.tmp7171 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7172 = load %m972$.Node.type*, %m972$.Node.type** %addr.7062
%.tmp7173 = load i8*, i8** %err_msg.6911
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp7171, %m972$.Node.type* %.tmp7172, i8* %.tmp7173)
%.tmp7174 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base.7055
ret %m2624$.AssignableInfo.type* %.tmp7174
br label %.if.end.7165
.if.false.7165:
br label %.if.end.7165
.if.end.7165:
%.tmp7175 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.7156
%.tmp7176 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7175, i32 0, i32 4
%.tmp7177 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base.7055
%.tmp7178 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7177, i32 0, i32 4
%.tmp7179 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7178
%.tmp7180 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7179, i32 0, i32 3
%.tmp7181 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7180
store %m2624$.Type.type* %.tmp7181, %m2624$.Type.type** %.tmp7176
%.tmp7182 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7183 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.7156
%.tmp7184 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7183, i32 0, i32 4
%.tmp7185 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7184
%.tmp7186 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp7182, %m2624$.Type.type* %.tmp7185)
%base_type_2.7187 = alloca i8*
store i8* %.tmp7186, i8** %base_type_2.7187
%.tmp7188 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7189 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp7188, i32 0, i32 1
%.tmp7190 = load %m0$.File.type*, %m0$.File.type** %.tmp7189
%.tmp7192 = getelementptr [44 x i8], [44 x i8]*@.str7191, i32 0, i32 0
%.tmp7193 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.7156
%.tmp7194 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7193)
%.tmp7195 = load i8*, i8** %base_type_2.7187
%.tmp7196 = load i8*, i8** %base_type_2.7187
%.tmp7197 = load i32, i32* %tmp_id.7142
%.tmp7198 = load i8*, i8** %index_type.7078
%.tmp7199 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %index_info.7072
%.tmp7200 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7199)
%.tmp7201 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7190, i8* %.tmp7192, i8* %.tmp7194, i8* %.tmp7195, i8* %.tmp7196, i32 %.tmp7197, i8* %.tmp7198, i8* %.tmp7200)
%.tmp7202 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %new_base.7156
store %m2624$.AssignableInfo.type* %.tmp7202, %m2624$.AssignableInfo.type** %base.7055
%.tmp7203 = load %m972$.Node.type*, %m972$.Node.type** %addr.7062
%.tmp7204 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7203, i32 0, i32 7
%.tmp7205 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7204
%.tmp7206 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7205, i32 0, i32 7
%.tmp7207 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7206
%.tmp7208 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7207, i32 0, i32 7
%.tmp7209 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7208
store %m972$.Node.type* %.tmp7209, %m972$.Node.type** %addr.7062
br label %.for.start.7056
.for.end.7056:
%.tmp7210 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %base.7055
ret %m2624$.AssignableInfo.type* %.tmp7210
}
%m295$.StackHead.type = type {%m2379$.SYStack.type*}
define %m2624$.AssignableInfo.type* @m295$compile_assignable.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%curr_node = alloca %m972$.Node.type*
store %m972$.Node.type* %.curr_node.arg, %m972$.Node.type** %curr_node
%.tmp7211 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp7212 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7211, i32 0, i32 6
%.tmp7213 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7212
%.tmp7215 = getelementptr [16 x i8], [16 x i8]*@.str7214, i32 0, i32 0
%.tmp7216 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp7213, i8* %.tmp7215)
%assignable_start.7217 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp7216, %m972$.Node.type** %assignable_start.7217
%.tmp7218 = load %m972$.Node.type*, %m972$.Node.type** %assignable_start.7217
%.tmp7219 = call %m2379$.SYStack.type*(%m972$.Node.type*) @m2379$sy_algorithm.m2379$.SYStack.typep.m972$.Node.typep(%m972$.Node.type* %.tmp7218)
%operator_stack.7220 = alloca %m2379$.SYStack.type*
store %m2379$.SYStack.type* %.tmp7219, %m2379$.SYStack.type** %operator_stack.7220
%.tmp7221 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* null, i32 1
%.tmp7222 = ptrtoint %m295$.StackHead.type* %.tmp7221 to i32
%.tmp7223 = call i8*(i32) @malloc(i32 %.tmp7222)
%.tmp7224 = bitcast i8* %.tmp7223 to %m295$.StackHead.type*
%stack.7225 = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.tmp7224, %m295$.StackHead.type** %stack.7225
%.tmp7226 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7225
%.tmp7227 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7226, i32 0, i32 0
%.tmp7228 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %operator_stack.7220
store %m2379$.SYStack.type* %.tmp7228, %m2379$.SYStack.type** %.tmp7227
%.tmp7229 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7230 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7225
%.tmp7231 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m295$.StackHead.typep(%m2624$.CompilerCtx.type* %.tmp7229, %m295$.StackHead.type* %.tmp7230)
%info.7232 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp7231, %m2624$.AssignableInfo.type** %info.7232
%.tmp7233 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.7232
%.tmp7234 = icmp eq %m2624$.AssignableInfo.type* %.tmp7233, null
br i1 %.tmp7234, label %.if.true.7235, label %.if.false.7235
.if.true.7235:
%.tmp7236 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.7232
ret %m2624$.AssignableInfo.type* %.tmp7236
br label %.if.end.7235
.if.false.7235:
br label %.if.end.7235
.if.end.7235:
%.tmp7237 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp7238 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7237, i32 0, i32 6
%.tmp7239 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7238
%.tmp7241 = getelementptr [5 x i8], [5 x i8]*@.str7240, i32 0, i32 0
%.tmp7242 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp7239, i8* %.tmp7241)
%cast.7243 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp7242, %m972$.Node.type** %cast.7243
%.tmp7244 = load %m972$.Node.type*, %m972$.Node.type** %cast.7243
%.tmp7245 = icmp ne %m972$.Node.type* %.tmp7244, null
br i1 %.tmp7245, label %.if.true.7246, label %.if.false.7246
.if.true.7246:
%.tmp7247 = load %m972$.Node.type*, %m972$.Node.type** %cast.7243
%.tmp7248 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7247, i32 0, i32 6
%.tmp7249 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7248
%.tmp7251 = getelementptr [5 x i8], [5 x i8]*@.str7250, i32 0, i32 0
%.tmp7252 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp7249, i8* %.tmp7251)
%cast_type.7253 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp7252, %m972$.Node.type** %cast_type.7253
%.tmp7254 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7255 = load %m972$.Node.type*, %m972$.Node.type** %cast_type.7253
%.tmp7256 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7255, i32 0, i32 6
%.tmp7257 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7256
%.tmp7258 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp7254, %m972$.Node.type* %.tmp7257)
%type.7259 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp7258, %m2624$.Type.type** %type.7259
%.tmp7260 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.7232
%.tmp7261 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7260)
%prev_id.7262 = alloca i8*
store i8* %.tmp7261, i8** %prev_id.7262
%.tmp7263 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7264 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.7232
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp7263, %m2624$.AssignableInfo.type* %.tmp7264)
%.tmp7265 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7266 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.7232
%.tmp7267 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7266, i32 0, i32 4
%.tmp7268 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7267
%.tmp7269 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp7265, %m2624$.Type.type* %.tmp7268)
%from_type.7270 = alloca i8*
store i8* %.tmp7269, i8** %from_type.7270
%.tmp7271 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7272 = load %m2624$.Type.type*, %m2624$.Type.type** %type.7259
%.tmp7273 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp7271, %m2624$.Type.type* %.tmp7272)
%to_type.7274 = alloca i8*
store i8* %.tmp7273, i8** %to_type.7274
%.tmp7276 = getelementptr [8 x i8], [8 x i8]*@.str7275, i32 0, i32 0
%cast_fn.7277 = alloca i8*
store i8* %.tmp7276, i8** %cast_fn.7277
%.tmp7278 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.7232
%.tmp7279 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7278, i32 0, i32 4
%.tmp7280 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7279
%.tmp7281 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7280, i32 0, i32 1
%.tmp7282 = load i8*, i8** %.tmp7281
%.tmp7283 = icmp ne i8* %.tmp7282, null
br i1 %.tmp7283, label %.if.true.7284, label %.if.false.7284
.if.true.7284:
%.tmp7285 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.7232
%.tmp7286 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7285, i32 0, i32 4
%.tmp7287 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7286
%.tmp7288 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7287, i32 0, i32 1
%.tmp7289 = load i8*, i8** %.tmp7288
%.tmp7291 = getelementptr [6 x i8], [6 x i8]*@.str7290, i32 0, i32 0
%.tmp7292 = call i32(i8*,i8*) @strcmp(i8* %.tmp7289, i8* %.tmp7291)
%.tmp7293 = icmp eq i32 %.tmp7292, 0
br i1 %.tmp7293, label %.if.true.7294, label %.if.false.7294
.if.true.7294:
%.tmp7296 = getelementptr [48 x i8], [48 x i8]*@.str7295, i32 0, i32 0
%.tmp7297 = call i32(i8*,...) @printf(i8* %.tmp7296)
br label %.if.end.7294
.if.false.7294:
br label %.if.end.7294
.if.end.7294:
br label %.if.end.7284
.if.false.7284:
br label %.if.end.7284
.if.end.7284:
%.tmp7298 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.7232
%.tmp7299 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7298, i32 0, i32 4
%.tmp7300 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7299
%.tmp7301 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7300, i32 0, i32 0
%.tmp7302 = load i8*, i8** %.tmp7301
%.tmp7304 = getelementptr [4 x i8], [4 x i8]*@.str7303, i32 0, i32 0
%.tmp7305 = call i32(i8*,i8*) @strcmp(i8* %.tmp7302, i8* %.tmp7304)
%.tmp7306 = icmp ne i32 %.tmp7305, 0
%.tmp7307 = load %m2624$.Type.type*, %m2624$.Type.type** %type.7259
%.tmp7308 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7307, i32 0, i32 0
%.tmp7309 = load i8*, i8** %.tmp7308
%.tmp7311 = getelementptr [4 x i8], [4 x i8]*@.str7310, i32 0, i32 0
%.tmp7312 = call i32(i8*,i8*) @strcmp(i8* %.tmp7309, i8* %.tmp7311)
%.tmp7313 = icmp ne i32 %.tmp7312, 0
%.tmp7314 = and i1 %.tmp7306, %.tmp7313
br i1 %.tmp7314, label %.if.true.7315, label %.if.false.7315
.if.true.7315:
%.tmp7316 = load i8*, i8** %from_type.7270
%.tmp7317 = getelementptr i8, i8* %.tmp7316, i32 0
%.tmp7318 = load i8, i8* %.tmp7317
%.tmp7319 = icmp eq i8 %.tmp7318, 105
%.tmp7320 = load i8*, i8** %to_type.7274
%.tmp7321 = getelementptr i8, i8* %.tmp7320, i32 0
%.tmp7322 = load i8, i8* %.tmp7321
%.tmp7323 = icmp eq i8 %.tmp7322, 105
%.tmp7324 = and i1 %.tmp7319, %.tmp7323
br i1 %.tmp7324, label %.if.true.7325, label %.if.false.7325
.if.true.7325:
%from_size.7326 = alloca i32
store i32 0, i32* %from_size.7326
%to_size.7327 = alloca i32
store i32 0, i32* %to_size.7327
%.tmp7328 = load i8*, i8** %from_type.7270
%.tmp7330 = getelementptr [4 x i8], [4 x i8]*@.str7329, i32 0, i32 0
%.tmp7331 = getelementptr i32, i32* %from_size.7326, i32 0
%.tmp7332 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7328, i8* %.tmp7330, i32* %.tmp7331)
%.tmp7333 = load i8*, i8** %to_type.7274
%.tmp7335 = getelementptr [4 x i8], [4 x i8]*@.str7334, i32 0, i32 0
%.tmp7336 = getelementptr i32, i32* %to_size.7327, i32 0
%.tmp7337 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7333, i8* %.tmp7335, i32* %.tmp7336)
%.tmp7338 = load i32, i32* %from_size.7326
%.tmp7339 = load i32, i32* %to_size.7327
%.tmp7340 = icmp slt i32 %.tmp7338, %.tmp7339
br i1 %.tmp7340, label %.if.true.7341, label %.if.false.7341
.if.true.7341:
%.tmp7343 = getelementptr [5 x i8], [5 x i8]*@.str7342, i32 0, i32 0
store i8* %.tmp7343, i8** %cast_fn.7277
br label %.if.end.7341
.if.false.7341:
%.tmp7345 = getelementptr [6 x i8], [6 x i8]*@.str7344, i32 0, i32 0
store i8* %.tmp7345, i8** %cast_fn.7277
br label %.if.end.7341
.if.end.7341:
br label %.if.end.7325
.if.false.7325:
br label %.if.end.7325
.if.end.7325:
br label %.if.end.7315
.if.false.7315:
br label %.if.end.7315
.if.end.7315:
%.tmp7346 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7347 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp7346, i32 0, i32 1
%.tmp7348 = load %m0$.File.type*, %m0$.File.type** %.tmp7347
%.tmp7350 = getelementptr [21 x i8], [21 x i8]*@.str7349, i32 0, i32 0
%.tmp7351 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.7232
%.tmp7352 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7351)
%.tmp7353 = load i8*, i8** %cast_fn.7277
%.tmp7354 = load i8*, i8** %from_type.7270
%.tmp7355 = load i8*, i8** %prev_id.7262
%.tmp7356 = load i8*, i8** %to_type.7274
%.tmp7357 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7348, i8* %.tmp7350, i8* %.tmp7352, i8* %.tmp7353, i8* %.tmp7354, i8* %.tmp7355, i8* %.tmp7356)
%.tmp7358 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.7232
%.tmp7359 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7358, i32 0, i32 4
%.tmp7360 = load %m2624$.Type.type*, %m2624$.Type.type** %type.7259
store %m2624$.Type.type* %.tmp7360, %m2624$.Type.type** %.tmp7359
br label %.if.end.7246
.if.false.7246:
br label %.if.end.7246
.if.end.7246:
%.tmp7361 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.7232
ret %m2624$.AssignableInfo.type* %.tmp7361
}
define %m2624$.AssignableInfo.type* @m295$compile_assignable_stack.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m295$.StackHead.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m295$.StackHead.type* %.stack.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stack = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.stack.arg, %m295$.StackHead.type** %stack
%.tmp7362 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7363 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7362, i32 0, i32 0
%.tmp7364 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %.tmp7363
%.tmp7365 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp7364, i32 0, i32 0
%.tmp7366 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7365
%.tmp7367 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7366, i32 0, i32 0
%.tmp7368 = load i8*, i8** %.tmp7367
%.tmp7370 = getelementptr [16 x i8], [16 x i8]*@.str7369, i32 0, i32 0
%.tmp7371 = call i32(i8*,i8*) @strcmp(i8* %.tmp7368, i8* %.tmp7370)
%.tmp7372 = icmp eq i32 %.tmp7371, 0
br i1 %.tmp7372, label %.if.true.7373, label %.if.false.7373
.if.true.7373:
%.tmp7374 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7375 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7376 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7375, i32 0, i32 0
%.tmp7377 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %.tmp7376
%.tmp7378 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp7377, i32 0, i32 0
%.tmp7379 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7378
%.tmp7380 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_mono_assignable.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp7374, %m972$.Node.type* %.tmp7379)
ret %m2624$.AssignableInfo.type* %.tmp7380
br label %.if.end.7373
.if.false.7373:
br label %.if.end.7373
.if.end.7373:
%.tmp7381 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7382 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7381, i32 0, i32 0
%.tmp7383 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %.tmp7382
%.tmp7384 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp7383, i32 0, i32 0
%.tmp7385 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7384
%.tmp7386 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7385, i32 0, i32 6
%.tmp7387 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7386
%operator.7388 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp7387, %m972$.Node.type** %operator.7388
%.tmp7389 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7390 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7389, i32 0, i32 0
%.tmp7391 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7392 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7391, i32 0, i32 0
%.tmp7393 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %.tmp7392
%.tmp7394 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp7393, i32 0, i32 1
%.tmp7395 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %.tmp7394
store %m2379$.SYStack.type* %.tmp7395, %m2379$.SYStack.type** %.tmp7390
%.tmp7396 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7397 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7398 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m295$.StackHead.typep(%m2624$.CompilerCtx.type* %.tmp7396, %m295$.StackHead.type* %.tmp7397)
%A.7399 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp7398, %m2624$.AssignableInfo.type** %A.7399
%.tmp7400 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %A.7399
%.tmp7401 = icmp eq %m2624$.AssignableInfo.type* %.tmp7400, null
br i1 %.tmp7401, label %.if.true.7402, label %.if.false.7402
.if.true.7402:
%.tmp7403 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %A.7399
ret %m2624$.AssignableInfo.type* %.tmp7403
br label %.if.end.7402
.if.false.7402:
br label %.if.end.7402
.if.end.7402:
%.tmp7404 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7405 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7404, i32 0, i32 0
%.tmp7406 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7407 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7406, i32 0, i32 0
%.tmp7408 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %.tmp7407
%.tmp7409 = getelementptr %m2379$.SYStack.type, %m2379$.SYStack.type* %.tmp7408, i32 0, i32 1
%.tmp7410 = load %m2379$.SYStack.type*, %m2379$.SYStack.type** %.tmp7409
store %m2379$.SYStack.type* %.tmp7410, %m2379$.SYStack.type** %.tmp7405
%.tmp7411 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7412 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7413 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m295$.StackHead.typep(%m2624$.CompilerCtx.type* %.tmp7411, %m295$.StackHead.type* %.tmp7412)
%B.7414 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp7413, %m2624$.AssignableInfo.type** %B.7414
%.tmp7415 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %B.7414
%.tmp7416 = icmp eq %m2624$.AssignableInfo.type* %.tmp7415, null
br i1 %.tmp7416, label %.if.true.7417, label %.if.false.7417
.if.true.7417:
%.tmp7418 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %B.7414
ret %m2624$.AssignableInfo.type* %.tmp7418
br label %.if.end.7417
.if.false.7417:
br label %.if.end.7417
.if.end.7417:
%.tmp7419 = bitcast ptr null to %m972$.Node.type*
%.tmp7420 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp7419)
%op_info.7421 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp7420, %m2624$.AssignableInfo.type** %op_info.7421
%.tmp7422 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %op_info.7421
%.tmp7423 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7422, i32 0, i32 4
%.tmp7424 = load %m972$.Node.type*, %m972$.Node.type** %operator.7388
%.tmp7425 = call %m2624$.Type.type*(%m972$.Node.type*) @m295$operator_type.m2624$.Type.typep.m972$.Node.typep(%m972$.Node.type* %.tmp7424)
store %m2624$.Type.type* %.tmp7425, %m2624$.Type.type** %.tmp7423
%.tmp7426 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7427 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %op_info.7421
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp7426, %m2624$.AssignableInfo.type* %.tmp7427)
%.tmp7428 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7429 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp7428, i32 0, i32 1
%.tmp7430 = load %m0$.File.type*, %m0$.File.type** %.tmp7429
%.tmp7432 = getelementptr [19 x i8], [19 x i8]*@.str7431, i32 0, i32 0
%.tmp7433 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %op_info.7421
%.tmp7434 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7433)
%.tmp7435 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7436 = load %m972$.Node.type*, %m972$.Node.type** %operator.7388
%.tmp7437 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$operator_op.cp.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp7435, %m972$.Node.type* %.tmp7436)
%.tmp7438 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7439 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %A.7399
%.tmp7440 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7439, i32 0, i32 4
%.tmp7441 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7440
%.tmp7442 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp7438, %m2624$.Type.type* %.tmp7441)
%.tmp7443 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %A.7399
%.tmp7444 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7443)
%.tmp7445 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %B.7414
%.tmp7446 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7445)
%.tmp7447 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7430, i8* %.tmp7432, i8* %.tmp7434, i8* %.tmp7437, i8* %.tmp7442, i8* %.tmp7444, i8* %.tmp7446)
%.tmp7448 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %op_info.7421
ret %m2624$.AssignableInfo.type* %.tmp7448
}
define i8* @m295$operator_op.cp.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.op.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%op = alloca %m972$.Node.type*
store %m972$.Node.type* %.op.arg, %m972$.Node.type** %op
%.tmp7449 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7450 = icmp eq %m972$.Node.type* %.tmp7449, null
br i1 %.tmp7450, label %.if.true.7451, label %.if.false.7451
.if.true.7451:
%.tmp7452 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7453 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7455 = getelementptr [31 x i8], [31 x i8]*@.str7454, i32 0, i32 0
%.tmp7456 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp7452, %m972$.Node.type* %.tmp7453, i8* %.tmp7455)
%.tmp7457 = call i32(i8*,...) @printf(i8* %.tmp7456)
br label %.if.end.7451
.if.false.7451:
br label %.if.end.7451
.if.end.7451:
%.tmp7458 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7459 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7458, i32 0, i32 1
%.tmp7460 = load i8*, i8** %.tmp7459
%.tmp7462 = getelementptr [2 x i8], [2 x i8]*@.str7461, i32 0, i32 0
%.tmp7463 = call i32(i8*,i8*) @strcmp(i8* %.tmp7460, i8* %.tmp7462)
%.tmp7464 = icmp eq i32 %.tmp7463, 0
br i1 %.tmp7464, label %.if.true.7465, label %.if.false.7465
.if.true.7465:
%.tmp7467 = getelementptr [4 x i8], [4 x i8]*@.str7466, i32 0, i32 0
ret i8* %.tmp7467
br label %.if.end.7465
.if.false.7465:
%.tmp7468 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7469 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7468, i32 0, i32 1
%.tmp7470 = load i8*, i8** %.tmp7469
%.tmp7472 = getelementptr [2 x i8], [2 x i8]*@.str7471, i32 0, i32 0
%.tmp7473 = call i32(i8*,i8*) @strcmp(i8* %.tmp7470, i8* %.tmp7472)
%.tmp7474 = icmp eq i32 %.tmp7473, 0
br i1 %.tmp7474, label %.if.true.7475, label %.if.false.7475
.if.true.7475:
%.tmp7477 = getelementptr [4 x i8], [4 x i8]*@.str7476, i32 0, i32 0
ret i8* %.tmp7477
br label %.if.end.7475
.if.false.7475:
%.tmp7478 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7479 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7478, i32 0, i32 1
%.tmp7480 = load i8*, i8** %.tmp7479
%.tmp7482 = getelementptr [2 x i8], [2 x i8]*@.str7481, i32 0, i32 0
%.tmp7483 = call i32(i8*,i8*) @strcmp(i8* %.tmp7480, i8* %.tmp7482)
%.tmp7484 = icmp eq i32 %.tmp7483, 0
br i1 %.tmp7484, label %.if.true.7485, label %.if.false.7485
.if.true.7485:
%.tmp7487 = getelementptr [4 x i8], [4 x i8]*@.str7486, i32 0, i32 0
ret i8* %.tmp7487
br label %.if.end.7485
.if.false.7485:
%.tmp7488 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7489 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7488, i32 0, i32 1
%.tmp7490 = load i8*, i8** %.tmp7489
%.tmp7492 = getelementptr [2 x i8], [2 x i8]*@.str7491, i32 0, i32 0
%.tmp7493 = call i32(i8*,i8*) @strcmp(i8* %.tmp7490, i8* %.tmp7492)
%.tmp7494 = icmp eq i32 %.tmp7493, 0
br i1 %.tmp7494, label %.if.true.7495, label %.if.false.7495
.if.true.7495:
%.tmp7497 = getelementptr [5 x i8], [5 x i8]*@.str7496, i32 0, i32 0
ret i8* %.tmp7497
br label %.if.end.7495
.if.false.7495:
%.tmp7498 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7499 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7498, i32 0, i32 1
%.tmp7500 = load i8*, i8** %.tmp7499
%.tmp7502 = getelementptr [3 x i8], [3 x i8]*@.str7501, i32 0, i32 0
%.tmp7503 = call i32(i8*,i8*) @strcmp(i8* %.tmp7500, i8* %.tmp7502)
%.tmp7504 = icmp eq i32 %.tmp7503, 0
br i1 %.tmp7504, label %.if.true.7505, label %.if.false.7505
.if.true.7505:
%.tmp7507 = getelementptr [8 x i8], [8 x i8]*@.str7506, i32 0, i32 0
ret i8* %.tmp7507
br label %.if.end.7505
.if.false.7505:
%.tmp7508 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7509 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7508, i32 0, i32 1
%.tmp7510 = load i8*, i8** %.tmp7509
%.tmp7512 = getelementptr [3 x i8], [3 x i8]*@.str7511, i32 0, i32 0
%.tmp7513 = call i32(i8*,i8*) @strcmp(i8* %.tmp7510, i8* %.tmp7512)
%.tmp7514 = icmp eq i32 %.tmp7513, 0
br i1 %.tmp7514, label %.if.true.7515, label %.if.false.7515
.if.true.7515:
%.tmp7517 = getelementptr [8 x i8], [8 x i8]*@.str7516, i32 0, i32 0
ret i8* %.tmp7517
br label %.if.end.7515
.if.false.7515:
%.tmp7518 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7519 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7518, i32 0, i32 1
%.tmp7520 = load i8*, i8** %.tmp7519
%.tmp7522 = getelementptr [2 x i8], [2 x i8]*@.str7521, i32 0, i32 0
%.tmp7523 = call i32(i8*,i8*) @strcmp(i8* %.tmp7520, i8* %.tmp7522)
%.tmp7524 = icmp eq i32 %.tmp7523, 0
br i1 %.tmp7524, label %.if.true.7525, label %.if.false.7525
.if.true.7525:
%.tmp7527 = getelementptr [9 x i8], [9 x i8]*@.str7526, i32 0, i32 0
ret i8* %.tmp7527
br label %.if.end.7525
.if.false.7525:
%.tmp7528 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7529 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7528, i32 0, i32 1
%.tmp7530 = load i8*, i8** %.tmp7529
%.tmp7532 = getelementptr [2 x i8], [2 x i8]*@.str7531, i32 0, i32 0
%.tmp7533 = call i32(i8*,i8*) @strcmp(i8* %.tmp7530, i8* %.tmp7532)
%.tmp7534 = icmp eq i32 %.tmp7533, 0
br i1 %.tmp7534, label %.if.true.7535, label %.if.false.7535
.if.true.7535:
%.tmp7537 = getelementptr [9 x i8], [9 x i8]*@.str7536, i32 0, i32 0
ret i8* %.tmp7537
br label %.if.end.7535
.if.false.7535:
%.tmp7538 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7539 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7538, i32 0, i32 1
%.tmp7540 = load i8*, i8** %.tmp7539
%.tmp7542 = getelementptr [2 x i8], [2 x i8]*@.str7541, i32 0, i32 0
%.tmp7543 = call i32(i8*,i8*) @strcmp(i8* %.tmp7540, i8* %.tmp7542)
%.tmp7544 = icmp eq i32 %.tmp7543, 0
br i1 %.tmp7544, label %.if.true.7545, label %.if.false.7545
.if.true.7545:
%.tmp7547 = getelementptr [4 x i8], [4 x i8]*@.str7546, i32 0, i32 0
ret i8* %.tmp7547
br label %.if.end.7545
.if.false.7545:
%.tmp7548 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7549 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7548, i32 0, i32 1
%.tmp7550 = load i8*, i8** %.tmp7549
%.tmp7552 = getelementptr [2 x i8], [2 x i8]*@.str7551, i32 0, i32 0
%.tmp7553 = call i32(i8*,i8*) @strcmp(i8* %.tmp7550, i8* %.tmp7552)
%.tmp7554 = icmp eq i32 %.tmp7553, 0
br i1 %.tmp7554, label %.if.true.7555, label %.if.false.7555
.if.true.7555:
%.tmp7557 = getelementptr [3 x i8], [3 x i8]*@.str7556, i32 0, i32 0
ret i8* %.tmp7557
br label %.if.end.7555
.if.false.7555:
%.tmp7558 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7559 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7558, i32 0, i32 1
%.tmp7560 = load i8*, i8** %.tmp7559
%.tmp7562 = getelementptr [3 x i8], [3 x i8]*@.str7561, i32 0, i32 0
%.tmp7563 = call i32(i8*,i8*) @strcmp(i8* %.tmp7560, i8* %.tmp7562)
%.tmp7564 = icmp eq i32 %.tmp7563, 0
br i1 %.tmp7564, label %.if.true.7565, label %.if.false.7565
.if.true.7565:
%.tmp7567 = getelementptr [9 x i8], [9 x i8]*@.str7566, i32 0, i32 0
ret i8* %.tmp7567
br label %.if.end.7565
.if.false.7565:
%.tmp7568 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7569 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7568, i32 0, i32 1
%.tmp7570 = load i8*, i8** %.tmp7569
%.tmp7572 = getelementptr [3 x i8], [3 x i8]*@.str7571, i32 0, i32 0
%.tmp7573 = call i32(i8*,i8*) @strcmp(i8* %.tmp7570, i8* %.tmp7572)
%.tmp7574 = icmp eq i32 %.tmp7573, 0
br i1 %.tmp7574, label %.if.true.7575, label %.if.false.7575
.if.true.7575:
%.tmp7577 = getelementptr [9 x i8], [9 x i8]*@.str7576, i32 0, i32 0
ret i8* %.tmp7577
br label %.if.end.7575
.if.false.7575:
%.tmp7578 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7579 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7578, i32 0, i32 1
%.tmp7580 = load i8*, i8** %.tmp7579
%.tmp7582 = getelementptr [2 x i8], [2 x i8]*@.str7581, i32 0, i32 0
%.tmp7583 = call i32(i8*,i8*) @strcmp(i8* %.tmp7580, i8* %.tmp7582)
%.tmp7584 = icmp eq i32 %.tmp7583, 0
br i1 %.tmp7584, label %.if.true.7585, label %.if.false.7585
.if.true.7585:
%.tmp7587 = getelementptr [5 x i8], [5 x i8]*@.str7586, i32 0, i32 0
ret i8* %.tmp7587
br label %.if.end.7585
.if.false.7585:
%.tmp7588 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7589 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7591 = getelementptr [30 x i8], [30 x i8]*@.str7590, i32 0, i32 0
%.tmp7592 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp7588, %m972$.Node.type* %.tmp7589, i8* %.tmp7591)
%.tmp7593 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7594 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7593, i32 0, i32 1
%.tmp7595 = load i8*, i8** %.tmp7594
%.tmp7596 = call i32(i8*,...) @printf(i8* %.tmp7592, i8* %.tmp7595)
br label %.if.end.7585
.if.end.7585:
br label %.if.end.7575
.if.end.7575:
br label %.if.end.7565
.if.end.7565:
br label %.if.end.7555
.if.end.7555:
br label %.if.end.7545
.if.end.7545:
br label %.if.end.7535
.if.end.7535:
br label %.if.end.7525
.if.end.7525:
br label %.if.end.7515
.if.end.7515:
br label %.if.end.7505
.if.end.7505:
br label %.if.end.7495
.if.end.7495:
br label %.if.end.7485
.if.end.7485:
br label %.if.end.7475
.if.end.7475:
br label %.if.end.7465
.if.end.7465:
%.tmp7598 = getelementptr [4 x i8], [4 x i8]*@.str7597, i32 0, i32 0
ret i8* %.tmp7598
}
define %m2624$.Type.type* @m295$operator_type.m2624$.Type.typep.m972$.Node.typep(%m972$.Node.type* %.op.arg) {
%op = alloca %m972$.Node.type*
store %m972$.Node.type* %.op.arg, %m972$.Node.type** %op
%.tmp7599 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%type.7600 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp7599, %m2624$.Type.type** %type.7600
%.tmp7601 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7602 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7601, i32 0, i32 1
%.tmp7603 = load i8*, i8** %.tmp7602
%.tmp7605 = getelementptr [3 x i8], [3 x i8]*@.str7604, i32 0, i32 0
%.tmp7606 = call i32(i8*,i8*) @strcmp(i8* %.tmp7603, i8* %.tmp7605)
%.tmp7607 = icmp eq i32 %.tmp7606, 0
%.tmp7608 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7609 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7608, i32 0, i32 1
%.tmp7610 = load i8*, i8** %.tmp7609
%.tmp7612 = getelementptr [3 x i8], [3 x i8]*@.str7611, i32 0, i32 0
%.tmp7613 = call i32(i8*,i8*) @strcmp(i8* %.tmp7610, i8* %.tmp7612)
%.tmp7614 = icmp eq i32 %.tmp7613, 0
%.tmp7615 = or i1 %.tmp7607, %.tmp7614
%.tmp7616 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7617 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7616, i32 0, i32 1
%.tmp7618 = load i8*, i8** %.tmp7617
%.tmp7620 = getelementptr [2 x i8], [2 x i8]*@.str7619, i32 0, i32 0
%.tmp7621 = call i32(i8*,i8*) @strcmp(i8* %.tmp7618, i8* %.tmp7620)
%.tmp7622 = icmp eq i32 %.tmp7621, 0
%.tmp7623 = or i1 %.tmp7615, %.tmp7622
%.tmp7624 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7625 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7624, i32 0, i32 1
%.tmp7626 = load i8*, i8** %.tmp7625
%.tmp7628 = getelementptr [2 x i8], [2 x i8]*@.str7627, i32 0, i32 0
%.tmp7629 = call i32(i8*,i8*) @strcmp(i8* %.tmp7626, i8* %.tmp7628)
%.tmp7630 = icmp eq i32 %.tmp7629, 0
%.tmp7631 = or i1 %.tmp7623, %.tmp7630
%.tmp7632 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7633 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7632, i32 0, i32 1
%.tmp7634 = load i8*, i8** %.tmp7633
%.tmp7636 = getelementptr [2 x i8], [2 x i8]*@.str7635, i32 0, i32 0
%.tmp7637 = call i32(i8*,i8*) @strcmp(i8* %.tmp7634, i8* %.tmp7636)
%.tmp7638 = icmp eq i32 %.tmp7637, 0
%.tmp7639 = or i1 %.tmp7631, %.tmp7638
%.tmp7640 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7641 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7640, i32 0, i32 1
%.tmp7642 = load i8*, i8** %.tmp7641
%.tmp7644 = getelementptr [2 x i8], [2 x i8]*@.str7643, i32 0, i32 0
%.tmp7645 = call i32(i8*,i8*) @strcmp(i8* %.tmp7642, i8* %.tmp7644)
%.tmp7646 = icmp eq i32 %.tmp7645, 0
%.tmp7647 = or i1 %.tmp7639, %.tmp7646
%.tmp7648 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7649 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7648, i32 0, i32 1
%.tmp7650 = load i8*, i8** %.tmp7649
%.tmp7652 = getelementptr [3 x i8], [3 x i8]*@.str7651, i32 0, i32 0
%.tmp7653 = call i32(i8*,i8*) @strcmp(i8* %.tmp7650, i8* %.tmp7652)
%.tmp7654 = icmp eq i32 %.tmp7653, 0
%.tmp7655 = or i1 %.tmp7647, %.tmp7654
%.tmp7656 = load %m972$.Node.type*, %m972$.Node.type** %op
%.tmp7657 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7656, i32 0, i32 1
%.tmp7658 = load i8*, i8** %.tmp7657
%.tmp7660 = getelementptr [3 x i8], [3 x i8]*@.str7659, i32 0, i32 0
%.tmp7661 = call i32(i8*,i8*) @strcmp(i8* %.tmp7658, i8* %.tmp7660)
%.tmp7662 = icmp eq i32 %.tmp7661, 0
%.tmp7663 = or i1 %.tmp7655, %.tmp7662
br i1 %.tmp7663, label %.if.true.7664, label %.if.false.7664
.if.true.7664:
%.tmp7665 = load %m2624$.Type.type*, %m2624$.Type.type** %type.7600
%.tmp7666 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7665, i32 0, i32 0
%.tmp7668 = getelementptr [5 x i8], [5 x i8]*@.str7667, i32 0, i32 0
store i8* %.tmp7668, i8** %.tmp7666
br label %.if.end.7664
.if.false.7664:
%.tmp7669 = load %m2624$.Type.type*, %m2624$.Type.type** %type.7600
%.tmp7670 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7669, i32 0, i32 0
%.tmp7672 = getelementptr [4 x i8], [4 x i8]*@.str7671, i32 0, i32 0
store i8* %.tmp7672, i8** %.tmp7670
br label %.if.end.7664
.if.end.7664:
%.tmp7673 = load %m2624$.Type.type*, %m2624$.Type.type** %type.7600
ret %m2624$.Type.type* %.tmp7673
}
define %m2624$.AssignableInfo.type* @m295$compile_mono_assignable.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%curr_node = alloca %m972$.Node.type*
store %m972$.Node.type* %.curr_node.arg, %m972$.Node.type** %curr_node
%.tmp7674 = bitcast ptr null to %m2624$.AssignableInfo.type*
%assignable_info.7675 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp7674, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7676 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%mono.7677 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp7676, %m972$.Node.type** %mono.7677
%err_buf.7678 = alloca i8*
store i8* null, i8** %err_buf.7678
%buf.7679 = alloca i8*
store i8* null, i8** %buf.7679
%.tmp7680 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7681 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7680, i32 0, i32 6
%.tmp7682 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7681
%.tmp7683 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7682, i32 0, i32 0
%.tmp7684 = load i8*, i8** %.tmp7683
%.tmp7686 = getelementptr [7 x i8], [7 x i8]*@.str7685, i32 0, i32 0
%.tmp7687 = call i32(i8*,i8*) @strcmp(i8* %.tmp7684, i8* %.tmp7686)
%.tmp7688 = icmp eq i32 %.tmp7687, 0
br i1 %.tmp7688, label %.if.true.7689, label %.if.false.7689
.if.true.7689:
%.tmp7690 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp7691 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp7690)
store %m2624$.AssignableInfo.type* %.tmp7691, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7692 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7693 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7692, i32 0, i32 4
%.tmp7694 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp7694, %m2624$.Type.type** %.tmp7693
%.tmp7695 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7696 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7695, i32 0, i32 4
%.tmp7697 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7696
%.tmp7698 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7697, i32 0, i32 0
%.tmp7700 = getelementptr [4 x i8], [4 x i8]*@.str7699, i32 0, i32 0
store i8* %.tmp7700, i8** %.tmp7698
%.tmp7701 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7702 = load i8, i8* @SCOPE_CONST
%.tmp7703 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7704 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7703, i32 0, i32 6
%.tmp7705 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7704
%.tmp7706 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7705, i32 0, i32 1
%.tmp7707 = load i8*, i8** %.tmp7706
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp7701, i8 %.tmp7702, i8* %.tmp7707)
br label %.if.end.7689
.if.false.7689:
%.tmp7708 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7709 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7708, i32 0, i32 6
%.tmp7710 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7709
%.tmp7711 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7710, i32 0, i32 0
%.tmp7712 = load i8*, i8** %.tmp7711
%.tmp7714 = getelementptr [5 x i8], [5 x i8]*@.str7713, i32 0, i32 0
%.tmp7715 = call i32(i8*,i8*) @strcmp(i8* %.tmp7712, i8* %.tmp7714)
%.tmp7716 = icmp eq i32 %.tmp7715, 0
br i1 %.tmp7716, label %.if.true.7717, label %.if.false.7717
.if.true.7717:
%.tmp7718 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7719 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7718, i32 0, i32 6
%.tmp7720 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7719
%.tmp7721 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7720, i32 0, i32 1
%.tmp7722 = load i8*, i8** %.tmp7721
%.tmp7724 = getelementptr [5 x i8], [5 x i8]*@.str7723, i32 0, i32 0
%.tmp7725 = call i32(i8*,i8*) @strcmp(i8* %.tmp7722, i8* %.tmp7724)
%.tmp7726 = icmp ne i32 %.tmp7725, 0
br i1 %.tmp7726, label %.if.true.7727, label %.if.false.7727
.if.true.7727:
%.tmp7728 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7729 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp7731 = getelementptr [42 x i8], [42 x i8]*@.str7730, i32 0, i32 0
%.tmp7732 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp7728, %m972$.Node.type* %.tmp7729, i8* %.tmp7731)
%.tmp7733 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7734 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7733, i32 0, i32 6
%.tmp7735 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7734
%.tmp7736 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7735, i32 0, i32 1
%.tmp7737 = load i8*, i8** %.tmp7736
%.tmp7738 = call i32(i8*,...) @printf(i8* %.tmp7732, i8* %.tmp7737)
%.tmp7739 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp7739
br label %.if.end.7727
.if.false.7727:
br label %.if.end.7727
.if.end.7727:
%.tmp7740 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp7741 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp7740)
store %m2624$.AssignableInfo.type* %.tmp7741, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7742 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7743 = load i8, i8* @SCOPE_CONST
%.tmp7745 = getelementptr [5 x i8], [5 x i8]*@.str7744, i32 0, i32 0
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp7742, i8 %.tmp7743, i8* %.tmp7745)
%.tmp7746 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7747 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7746, i32 0, i32 4
%.tmp7748 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp7748, %m2624$.Type.type** %.tmp7747
%.tmp7749 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7750 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7749, i32 0, i32 4
%.tmp7751 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7750
%.tmp7752 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7751, i32 0, i32 0
%.tmp7754 = getelementptr [8 x i8], [8 x i8]*@.str7753, i32 0, i32 0
store i8* %.tmp7754, i8** %.tmp7752
br label %.if.end.7717
.if.false.7717:
%.tmp7755 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7756 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7755, i32 0, i32 6
%.tmp7757 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7756
%.tmp7758 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7757, i32 0, i32 0
%.tmp7759 = load i8*, i8** %.tmp7758
%.tmp7761 = getelementptr [17 x i8], [17 x i8]*@.str7760, i32 0, i32 0
%.tmp7762 = call i32(i8*,i8*) @strcmp(i8* %.tmp7759, i8* %.tmp7761)
%.tmp7763 = icmp eq i32 %.tmp7762, 0
br i1 %.tmp7763, label %.if.true.7764, label %.if.false.7764
.if.true.7764:
%.tmp7765 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp7766 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp7765)
store %m2624$.AssignableInfo.type* %.tmp7766, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7767 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7768 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7767, i32 0, i32 6
%.tmp7769 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7768
%.tmp7770 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7769, i32 0, i32 6
%.tmp7771 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7770
%.tmp7773 = getelementptr [12 x i8], [12 x i8]*@.str7772, i32 0, i32 0
%.tmp7774 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp7771, i8* %.tmp7773)
%dest.7775 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp7774, %m972$.Node.type** %dest.7775
%.tmp7776 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7777 = load %m972$.Node.type*, %m972$.Node.type** %dest.7775
%.tmp7778 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_addr.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp7776, %m972$.Node.type* %.tmp7777)
%var_info.7779 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp7778, %m2624$.AssignableInfo.type** %var_info.7779
%.tmp7780 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %var_info.7779
%.tmp7781 = icmp eq %m2624$.AssignableInfo.type* %.tmp7780, null
br i1 %.tmp7781, label %.if.true.7782, label %.if.false.7782
.if.true.7782:
%.tmp7783 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
ret %m2624$.AssignableInfo.type* %.tmp7783
br label %.if.end.7782
.if.false.7782:
br label %.if.end.7782
.if.end.7782:
%.tmp7784 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7785 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %var_info.7779
%.tmp7786 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7785, i32 0, i32 4
%.tmp7787 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7786
%.tmp7788 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp7784, %m2624$.Type.type* %.tmp7787)
%var_type_repr.7789 = alloca i8*
store i8* %.tmp7788, i8** %var_type_repr.7789
%.tmp7790 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7791 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp7790, %m2624$.AssignableInfo.type* %.tmp7791)
%.tmp7792 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7793 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7792, i32 0, i32 4
%.tmp7794 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %var_info.7779
%.tmp7795 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7794, i32 0, i32 4
%.tmp7796 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7795
store %m2624$.Type.type* %.tmp7796, %m2624$.Type.type** %.tmp7793
%.tmp7798 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7799 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7798, i32 0, i32 6
%.tmp7800 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7799
%.tmp7801 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7800, i32 0, i32 6
%.tmp7802 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7801
%ptr.7803 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp7802, %m972$.Node.type** %ptr.7803
br label %.for.start.7797
.for.start.7797:
%.tmp7804 = load %m972$.Node.type*, %m972$.Node.type** %ptr.7803
%.tmp7805 = load %m972$.Node.type*, %m972$.Node.type** %dest.7775
%.tmp7806 = icmp ne %m972$.Node.type* %.tmp7804, %.tmp7805
br i1 %.tmp7806, label %.for.continue.7797, label %.for.end.7797
.for.continue.7797:
%.tmp7807 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%type.7808 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp7807, %m2624$.Type.type** %type.7808
%.tmp7809 = load %m2624$.Type.type*, %m2624$.Type.type** %type.7808
%.tmp7810 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7809, i32 0, i32 3
%.tmp7811 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7812 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7811, i32 0, i32 4
%.tmp7813 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7812
store %m2624$.Type.type* %.tmp7813, %m2624$.Type.type** %.tmp7810
%.tmp7814 = load %m2624$.Type.type*, %m2624$.Type.type** %type.7808
%.tmp7815 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7814, i32 0, i32 0
%.tmp7817 = getelementptr [4 x i8], [4 x i8]*@.str7816, i32 0, i32 0
store i8* %.tmp7817, i8** %.tmp7815
%.tmp7818 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7819 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7818, i32 0, i32 4
%.tmp7820 = load %m2624$.Type.type*, %m2624$.Type.type** %type.7808
store %m2624$.Type.type* %.tmp7820, %m2624$.Type.type** %.tmp7819
%.tmp7821 = load %m972$.Node.type*, %m972$.Node.type** %ptr.7803
%.tmp7822 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7821, i32 0, i32 7
%.tmp7823 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7822
store %m972$.Node.type* %.tmp7823, %m972$.Node.type** %ptr.7803
br label %.for.start.7797
.for.end.7797:
%.tmp7824 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7825 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7824, i32 0, i32 6
%.tmp7826 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7825
%.tmp7827 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7826, i32 0, i32 6
%.tmp7828 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7827
%.tmp7829 = load %m972$.Node.type*, %m972$.Node.type** %dest.7775
%.tmp7830 = icmp ne %m972$.Node.type* %.tmp7828, %.tmp7829
br i1 %.tmp7830, label %.if.true.7831, label %.if.false.7831
.if.true.7831:
%.tmp7832 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7833 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp7832, i32 0, i32 1
%.tmp7834 = load %m0$.File.type*, %m0$.File.type** %.tmp7833
%.tmp7836 = getelementptr [38 x i8], [38 x i8]*@.str7835, i32 0, i32 0
%.tmp7837 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7838 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7837)
%.tmp7839 = load i8*, i8** %var_type_repr.7789
%.tmp7840 = load i8*, i8** %var_type_repr.7789
%.tmp7841 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %var_info.7779
%.tmp7842 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7841)
%.tmp7843 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7834, i8* %.tmp7836, i8* %.tmp7838, i8* %.tmp7839, i8* %.tmp7840, i8* %.tmp7842)
br label %.if.end.7831
.if.false.7831:
%.tmp7844 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7845 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7844, i32 0, i32 4
%.tmp7846 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7845
%.tmp7847 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7846, i32 0, i32 0
%.tmp7848 = load i8*, i8** %.tmp7847
%.tmp7850 = getelementptr [9 x i8], [9 x i8]*@.str7849, i32 0, i32 0
%.tmp7851 = call i32(i8*,i8*) @strcmp(i8* %.tmp7848, i8* %.tmp7850)
%.tmp7852 = icmp eq i32 %.tmp7851, 0
br i1 %.tmp7852, label %.if.true.7853, label %.if.false.7853
.if.true.7853:
%.tmp7854 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %var_info.7779
store %m2624$.AssignableInfo.type* %.tmp7854, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7855 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%type.7856 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp7855, %m2624$.Type.type** %type.7856
%.tmp7857 = load %m2624$.Type.type*, %m2624$.Type.type** %type.7856
%.tmp7858 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7857, i32 0, i32 3
%.tmp7859 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7860 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7859, i32 0, i32 4
%.tmp7861 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7860
store %m2624$.Type.type* %.tmp7861, %m2624$.Type.type** %.tmp7858
%.tmp7862 = load %m2624$.Type.type*, %m2624$.Type.type** %type.7856
%.tmp7863 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7862, i32 0, i32 0
%.tmp7865 = getelementptr [4 x i8], [4 x i8]*@.str7864, i32 0, i32 0
store i8* %.tmp7865, i8** %.tmp7863
%.tmp7866 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7867 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7866, i32 0, i32 4
%.tmp7868 = load %m2624$.Type.type*, %m2624$.Type.type** %type.7856
store %m2624$.Type.type* %.tmp7868, %m2624$.Type.type** %.tmp7867
br label %.if.end.7853
.if.false.7853:
%.tmp7869 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7870 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp7869, i32 0, i32 1
%.tmp7871 = load %m0$.File.type*, %m0$.File.type** %.tmp7870
%.tmp7873 = getelementptr [22 x i8], [22 x i8]*@.str7872, i32 0, i32 0
%.tmp7874 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7875 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7874)
%.tmp7876 = load i8*, i8** %var_type_repr.7789
%.tmp7877 = load i8*, i8** %var_type_repr.7789
%.tmp7878 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %var_info.7779
%.tmp7879 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7878)
%.tmp7880 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7871, i8* %.tmp7873, i8* %.tmp7875, i8* %.tmp7876, i8* %.tmp7877, i8* %.tmp7879)
br label %.if.end.7853
.if.end.7853:
br label %.if.end.7831
.if.end.7831:
br label %.if.end.7764
.if.false.7764:
%.tmp7881 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7882 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7881, i32 0, i32 6
%.tmp7883 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7882
%.tmp7884 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7883, i32 0, i32 0
%.tmp7885 = load i8*, i8** %.tmp7884
%.tmp7887 = getelementptr [8 x i8], [8 x i8]*@.str7886, i32 0, i32 0
%.tmp7888 = call i32(i8*,i8*) @strcmp(i8* %.tmp7885, i8* %.tmp7887)
%.tmp7889 = icmp eq i32 %.tmp7888, 0
br i1 %.tmp7889, label %.if.true.7890, label %.if.false.7890
.if.true.7890:
%.tmp7891 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp7892 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp7891)
store %m2624$.AssignableInfo.type* %.tmp7892, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7893 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7894 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7893, i32 0, i32 4
%.tmp7895 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp7895, %m2624$.Type.type** %.tmp7894
%.tmp7896 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7897 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7896, i32 0, i32 4
%.tmp7898 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7897
%.tmp7899 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7898, i32 0, i32 0
%.tmp7901 = getelementptr [5 x i8], [5 x i8]*@.str7900, i32 0, i32 0
store i8* %.tmp7901, i8** %.tmp7899
%.tmp7902 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7903 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7902, i32 0, i32 6
%.tmp7904 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7903
%.tmp7905 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7904, i32 0, i32 6
%.tmp7906 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7905
%.tmp7907 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7906, i32 0, i32 1
%.tmp7908 = load i8*, i8** %.tmp7907
%.tmp7910 = getelementptr [6 x i8], [6 x i8]*@.str7909, i32 0, i32 0
%.tmp7911 = call i32(i8*,i8*) @strcmp(i8* %.tmp7908, i8* %.tmp7910)
%.tmp7912 = icmp eq i32 %.tmp7911, 0
br i1 %.tmp7912, label %.if.true.7913, label %.if.false.7913
.if.true.7913:
%.tmp7914 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7915 = load i8, i8* @SCOPE_CONST
%.tmp7917 = getelementptr [2 x i8], [2 x i8]*@.str7916, i32 0, i32 0
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp7914, i8 %.tmp7915, i8* %.tmp7917)
br label %.if.end.7913
.if.false.7913:
%.tmp7918 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7919 = load i8, i8* @SCOPE_CONST
%.tmp7921 = getelementptr [2 x i8], [2 x i8]*@.str7920, i32 0, i32 0
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp7918, i8 %.tmp7919, i8* %.tmp7921)
br label %.if.end.7913
.if.end.7913:
br label %.if.end.7890
.if.false.7890:
%.tmp7922 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7923 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7922, i32 0, i32 6
%.tmp7924 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7923
%.tmp7925 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7924, i32 0, i32 0
%.tmp7926 = load i8*, i8** %.tmp7925
%.tmp7928 = getelementptr [8 x i8], [8 x i8]*@.str7927, i32 0, i32 0
%.tmp7929 = call i32(i8*,i8*) @strcmp(i8* %.tmp7926, i8* %.tmp7928)
%.tmp7930 = icmp eq i32 %.tmp7929, 0
br i1 %.tmp7930, label %.if.true.7931, label %.if.false.7931
.if.true.7931:
%.tmp7932 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7933 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7934 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7933, i32 0, i32 6
%.tmp7935 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7934
%.tmp7936 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7935, i32 0, i32 6
%.tmp7937 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7936
%.tmp7938 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$compile_fn_call.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp7932, %m972$.Node.type* %.tmp7937)
store %m2624$.AssignableInfo.type* %.tmp7938, %m2624$.AssignableInfo.type** %assignable_info.7675
br label %.if.end.7931
.if.false.7931:
%.tmp7939 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7940 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7939, i32 0, i32 6
%.tmp7941 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7940
%.tmp7942 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7941, i32 0, i32 0
%.tmp7943 = load i8*, i8** %.tmp7942
%.tmp7945 = getelementptr [7 x i8], [7 x i8]*@.str7944, i32 0, i32 0
%.tmp7946 = call i32(i8*,i8*) @strcmp(i8* %.tmp7943, i8* %.tmp7945)
%.tmp7947 = icmp eq i32 %.tmp7946, 0
br i1 %.tmp7947, label %.if.true.7948, label %.if.false.7948
.if.true.7948:
%.tmp7949 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7950 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp7951 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7950, i32 0, i32 6
%.tmp7952 = load %m972$.Node.type*, %m972$.Node.type** %.tmp7951
%.tmp7953 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp7952, i32 0, i32 1
%.tmp7954 = load i8*, i8** %.tmp7953
%.tmp7955 = call %m2624$.AssignableInfo.type*(%m2624$.CompilerCtx.type*,i8*) @m295$define_string.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.cp(%m2624$.CompilerCtx.type* %.tmp7949, i8* %.tmp7954)
%string_info.7956 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp7955, %m2624$.AssignableInfo.type** %string_info.7956
%.tmp7957 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp7958 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp7957)
store %m2624$.AssignableInfo.type* %.tmp7958, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7959 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7960 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
call void(%m2624$.CompilerCtx.type*,%m2624$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2624$.CompilerCtx.typep.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp7959, %m2624$.AssignableInfo.type* %.tmp7960)
%.tmp7961 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7962 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %string_info.7956
%.tmp7963 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7962, i32 0, i32 4
%.tmp7964 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7963
%.tmp7965 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp7961, %m2624$.Type.type* %.tmp7964)
%str_tr.7966 = alloca i8*
store i8* %.tmp7965, i8** %str_tr.7966
%.tmp7967 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp7968 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp7967, i32 0, i32 1
%.tmp7969 = load %m0$.File.type*, %m0$.File.type** %.tmp7968
%.tmp7971 = getelementptr [44 x i8], [44 x i8]*@.str7970, i32 0, i32 0
%.tmp7972 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7973 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7972)
%.tmp7974 = load i8*, i8** %str_tr.7966
%.tmp7975 = load i8*, i8** %str_tr.7966
%.tmp7976 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %string_info.7956
%.tmp7977 = call i8*(%m2624$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2624$.AssignableInfo.typep(%m2624$.AssignableInfo.type* %.tmp7976)
%.tmp7978 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7969, i8* %.tmp7971, i8* %.tmp7973, i8* %.tmp7974, i8* %.tmp7975, i8* %.tmp7977)
%.tmp7979 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7980 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7979, i32 0, i32 4
%.tmp7981 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp7981, %m2624$.Type.type** %.tmp7980
%.tmp7982 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7983 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7982, i32 0, i32 4
%.tmp7984 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7983
%.tmp7985 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7984, i32 0, i32 0
%.tmp7987 = getelementptr [4 x i8], [4 x i8]*@.str7986, i32 0, i32 0
store i8* %.tmp7987, i8** %.tmp7985
%.tmp7988 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7989 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7988, i32 0, i32 4
%.tmp7990 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7989
%.tmp7991 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7990, i32 0, i32 3
%.tmp7992 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp7992, %m2624$.Type.type** %.tmp7991
%.tmp7993 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp7994 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp7993, i32 0, i32 4
%.tmp7995 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7994
%.tmp7996 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7995, i32 0, i32 3
%.tmp7997 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp7996
%.tmp7998 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp7997, i32 0, i32 0
%.tmp8000 = getelementptr [4 x i8], [4 x i8]*@.str7999, i32 0, i32 0
store i8* %.tmp8000, i8** %.tmp7998
br label %.if.end.7948
.if.false.7948:
%.tmp8001 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp8002 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8001, i32 0, i32 6
%.tmp8003 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8002
%.tmp8004 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8003, i32 0, i32 0
%.tmp8005 = load i8*, i8** %.tmp8004
%.tmp8007 = getelementptr [4 x i8], [4 x i8]*@.str8006, i32 0, i32 0
%.tmp8008 = call i32(i8*,i8*) @strcmp(i8* %.tmp8005, i8* %.tmp8007)
%.tmp8009 = icmp eq i32 %.tmp8008, 0
br i1 %.tmp8009, label %.if.true.8010, label %.if.false.8010
.if.true.8010:
%.tmp8011 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp8012 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp8011)
store %m2624$.AssignableInfo.type* %.tmp8012, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp8013 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp8014 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8013, i32 0, i32 6
%.tmp8015 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8014
%.tmp8016 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8015, i32 0, i32 1
%.tmp8017 = load i8*, i8** %.tmp8016
%.tmp8018 = call i32(i8*) @strlen(i8* %.tmp8017)
%chr_len.8019 = alloca i32
store i32 %.tmp8018, i32* %chr_len.8019
%.tmp8020 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp8021 = load i8, i8* @SCOPE_CONST
%.tmp8023 = getelementptr [2 x i8], [2 x i8]*@.str8022, i32 0, i32 0
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp8020, i8 %.tmp8021, i8* %.tmp8023)
%.tmp8024 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp8025 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8024, i32 0, i32 0
%.tmp8026 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp8027 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8026, i32 0, i32 6
%.tmp8028 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8027
%.tmp8029 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8028, i32 0, i32 1
%.tmp8030 = load i8*, i8** %.tmp8029
%.tmp8031 = call i8*(i8*) @m2178$chr_to_llvm.cp.cp(i8* %.tmp8030)
store i8* %.tmp8031, i8** %.tmp8025
%.tmp8032 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp8033 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8032, i32 0, i32 0
%.tmp8034 = load i8*, i8** %.tmp8033
%.tmp8035 = icmp eq i8* %.tmp8034, null
br i1 %.tmp8035, label %.if.true.8036, label %.if.false.8036
.if.true.8036:
%.tmp8037 = getelementptr i8*, i8** %err_buf.7678, i32 0
%.tmp8039 = getelementptr [22 x i8], [22 x i8]*@.str8038, i32 0, i32 0
%.tmp8040 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp8041 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8040, i32 0, i32 6
%.tmp8042 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8041
%.tmp8043 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8042, i32 0, i32 1
%.tmp8044 = load i8*, i8** %.tmp8043
%.tmp8045 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8037, i8* %.tmp8039, i8* %.tmp8044)
%.tmp8046 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp8046
br label %.if.end.8036
.if.false.8036:
br label %.if.end.8036
.if.end.8036:
%.tmp8047 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp8048 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8047, i32 0, i32 4
%.tmp8049 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp8049, %m2624$.Type.type** %.tmp8048
%.tmp8050 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp8051 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8050, i32 0, i32 4
%.tmp8052 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8051
%.tmp8053 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8052, i32 0, i32 0
%.tmp8055 = getelementptr [4 x i8], [4 x i8]*@.str8054, i32 0, i32 0
store i8* %.tmp8055, i8** %.tmp8053
br label %.if.end.8010
.if.false.8010:
%.tmp8056 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8057 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp8059 = getelementptr [40 x i8], [40 x i8]*@.str8058, i32 0, i32 0
%.tmp8060 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp8056, %m972$.Node.type* %.tmp8057, i8* %.tmp8059)
%.tmp8061 = load %m972$.Node.type*, %m972$.Node.type** %mono.7677
%.tmp8062 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8061, i32 0, i32 6
%.tmp8063 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8062
%.tmp8064 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8063, i32 0, i32 0
%.tmp8065 = load i8*, i8** %.tmp8064
%.tmp8066 = call i32(i8*,...) @printf(i8* %.tmp8060, i8* %.tmp8065)
%.tmp8067 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp8067
br label %.if.end.8010
.if.end.8010:
br label %.if.end.7948
.if.end.7948:
br label %.if.end.7931
.if.end.7931:
br label %.if.end.7890
.if.end.7890:
br label %.if.end.7764
.if.end.7764:
br label %.if.end.7717
.if.end.7717:
br label %.if.end.7689
.if.end.7689:
%.tmp8068 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp8069 = icmp eq %m2624$.AssignableInfo.type* %.tmp8068, null
br i1 %.tmp8069, label %.if.true.8070, label %.if.false.8070
.if.true.8070:
%.tmp8071 = bitcast ptr null to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp8071
br label %.if.end.8070
.if.false.8070:
br label %.if.end.8070
.if.end.8070:
%.tmp8072 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp8073 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8072, i32 0, i32 5
%.tmp8074 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp8075 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8074, i32 0, i32 3
%.tmp8076 = load i32, i32* %.tmp8075
store i32 %.tmp8076, i32* %.tmp8073
%.tmp8077 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp8078 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8077, i32 0, i32 6
%.tmp8079 = load %m972$.Node.type*, %m972$.Node.type** %curr_node
%.tmp8080 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8079, i32 0, i32 4
%.tmp8081 = load i32, i32* %.tmp8080
store i32 %.tmp8081, i32* %.tmp8078
%.tmp8082 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %assignable_info.7675
%.tmp8083 = bitcast %m2624$.AssignableInfo.type* %.tmp8082 to %m2624$.AssignableInfo.type*
ret %m2624$.AssignableInfo.type* %.tmp8083
}
define i8* @m295$type_abbr.cp.m2624$.Type.typep(%m2624$.Type.type* %.type.arg) {
%type = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.type.arg, %m2624$.Type.type** %type
%.tmp8084 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8085 = icmp ne %m2624$.Type.type* %.tmp8084, null
%.tmp8087 = getelementptr [22 x i8], [22 x i8]*@.str8086, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8085, i8* %.tmp8087)
%.tmp8088 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8089 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8088, i32 0, i32 0
%.tmp8090 = load i8*, i8** %.tmp8089
%.tmp8091 = icmp ne i8* %.tmp8090, null
%.tmp8093 = getelementptr [59 x i8], [59 x i8]*@.str8092, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8091, i8* %.tmp8093)
%.tmp8094 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8095 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8094, i32 0, i32 0
%.tmp8096 = load i8*, i8** %.tmp8095
%.tmp8098 = getelementptr [4 x i8], [4 x i8]*@.str8097, i32 0, i32 0
%.tmp8099 = call i32(i8*,i8*) @strcmp(i8* %.tmp8096, i8* %.tmp8098)
%.tmp8100 = icmp eq i32 %.tmp8099, 0
br i1 %.tmp8100, label %.if.true.8101, label %.if.false.8101
.if.true.8101:
%.tmp8103 = getelementptr [2 x i8], [2 x i8]*@.str8102, i32 0, i32 0
ret i8* %.tmp8103
br label %.if.end.8101
.if.false.8101:
%.tmp8104 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8105 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8104, i32 0, i32 0
%.tmp8106 = load i8*, i8** %.tmp8105
%.tmp8108 = getelementptr [5 x i8], [5 x i8]*@.str8107, i32 0, i32 0
%.tmp8109 = call i32(i8*,i8*) @strcmp(i8* %.tmp8106, i8* %.tmp8108)
%.tmp8110 = icmp eq i32 %.tmp8109, 0
br i1 %.tmp8110, label %.if.true.8111, label %.if.false.8111
.if.true.8111:
%.tmp8113 = getelementptr [2 x i8], [2 x i8]*@.str8112, i32 0, i32 0
ret i8* %.tmp8113
br label %.if.end.8111
.if.false.8111:
%.tmp8114 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8115 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8114, i32 0, i32 0
%.tmp8116 = load i8*, i8** %.tmp8115
%.tmp8118 = getelementptr [5 x i8], [5 x i8]*@.str8117, i32 0, i32 0
%.tmp8119 = call i32(i8*,i8*) @strcmp(i8* %.tmp8116, i8* %.tmp8118)
%.tmp8120 = icmp eq i32 %.tmp8119, 0
br i1 %.tmp8120, label %.if.true.8121, label %.if.false.8121
.if.true.8121:
%.tmp8123 = getelementptr [2 x i8], [2 x i8]*@.str8122, i32 0, i32 0
ret i8* %.tmp8123
br label %.if.end.8121
.if.false.8121:
%.tmp8124 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8125 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8124, i32 0, i32 0
%.tmp8126 = load i8*, i8** %.tmp8125
%.tmp8128 = getelementptr [4 x i8], [4 x i8]*@.str8127, i32 0, i32 0
%.tmp8129 = call i32(i8*,i8*) @strcmp(i8* %.tmp8126, i8* %.tmp8128)
%.tmp8130 = icmp eq i32 %.tmp8129, 0
br i1 %.tmp8130, label %.if.true.8131, label %.if.false.8131
.if.true.8131:
%.tmp8133 = getelementptr [2 x i8], [2 x i8]*@.str8132, i32 0, i32 0
ret i8* %.tmp8133
br label %.if.end.8131
.if.false.8131:
%.tmp8134 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8135 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8134, i32 0, i32 0
%.tmp8136 = load i8*, i8** %.tmp8135
%.tmp8138 = getelementptr [4 x i8], [4 x i8]*@.str8137, i32 0, i32 0
%.tmp8139 = call i32(i8*,i8*) @strcmp(i8* %.tmp8136, i8* %.tmp8138)
%.tmp8140 = icmp eq i32 %.tmp8139, 0
br i1 %.tmp8140, label %.if.true.8141, label %.if.false.8141
.if.true.8141:
%buf.8142 = alloca i8*
store i8* null, i8** %buf.8142
%.tmp8143 = getelementptr i8*, i8** %buf.8142, i32 0
%.tmp8145 = getelementptr [4 x i8], [4 x i8]*@.str8144, i32 0, i32 0
%.tmp8146 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8147 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8146, i32 0, i32 3
%.tmp8148 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8147
%.tmp8149 = call i8*(%m2624$.Type.type*) @m295$type_abbr.cp.m2624$.Type.typep(%m2624$.Type.type* %.tmp8148)
%.tmp8150 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8143, i8* %.tmp8145, i8* %.tmp8149)
%.tmp8151 = load i8*, i8** %buf.8142
ret i8* %.tmp8151
br label %.if.end.8141
.if.false.8141:
%.tmp8152 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8153 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8152, i32 0, i32 0
%.tmp8154 = load i8*, i8** %.tmp8153
%.tmp8156 = getelementptr [10 x i8], [10 x i8]*@.str8155, i32 0, i32 0
%.tmp8157 = call i32(i8*,i8*) @strcmp(i8* %.tmp8154, i8* %.tmp8156)
%.tmp8158 = icmp eq i32 %.tmp8157, 0
br i1 %.tmp8158, label %.if.true.8159, label %.if.false.8159
.if.true.8159:
%.tmp8160 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8161 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8160, i32 0, i32 2
%.tmp8162 = load i8*, i8** %.tmp8161
ret i8* %.tmp8162
br label %.if.end.8159
.if.false.8159:
%.tmp8163 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8164 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8163, i32 0, i32 0
%.tmp8165 = load i8*, i8** %.tmp8164
%.tmp8167 = getelementptr [7 x i8], [7 x i8]*@.str8166, i32 0, i32 0
%.tmp8168 = call i32(i8*,i8*) @strcmp(i8* %.tmp8165, i8* %.tmp8167)
%.tmp8169 = icmp eq i32 %.tmp8168, 0
br i1 %.tmp8169, label %.if.true.8170, label %.if.false.8170
.if.true.8170:
%.tmp8172 = getelementptr [2 x i8], [2 x i8]*@.str8171, i32 0, i32 0
%buf.8173 = alloca i8*
store i8* %.tmp8172, i8** %buf.8173
%.tmp8175 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8176 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8175, i32 0, i32 3
%.tmp8177 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8176
%t.8178 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp8177, %m2624$.Type.type** %t.8178
br label %.for.start.8174
.for.start.8174:
%.tmp8179 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8178
%.tmp8180 = icmp ne %m2624$.Type.type* %.tmp8179, null
br i1 %.tmp8180, label %.for.continue.8174, label %.for.end.8174
.for.continue.8174:
%.tmp8181 = getelementptr i8*, i8** %buf.8173, i32 0
%.tmp8183 = getelementptr [5 x i8], [5 x i8]*@.str8182, i32 0, i32 0
%.tmp8184 = load i8*, i8** %buf.8173
%.tmp8185 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8178
%.tmp8186 = call i8*(%m2624$.Type.type*) @m295$type_abbr.cp.m2624$.Type.typep(%m2624$.Type.type* %.tmp8185)
%.tmp8187 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8181, i8* %.tmp8183, i8* %.tmp8184, i8* %.tmp8186)
%.tmp8188 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8178
%.tmp8189 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8188, i32 0, i32 4
%.tmp8190 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8189
store %m2624$.Type.type* %.tmp8190, %m2624$.Type.type** %t.8178
br label %.for.start.8174
.for.end.8174:
%.tmp8191 = load i8*, i8** %buf.8173
ret i8* %.tmp8191
br label %.if.end.8170
.if.false.8170:
%.tmp8192 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8193 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8192, i32 0, i32 0
%.tmp8194 = load i8*, i8** %.tmp8193
%.tmp8196 = getelementptr [9 x i8], [9 x i8]*@.str8195, i32 0, i32 0
%.tmp8197 = call i32(i8*,i8*) @strcmp(i8* %.tmp8194, i8* %.tmp8196)
%.tmp8198 = icmp eq i32 %.tmp8197, 0
br i1 %.tmp8198, label %.if.true.8199, label %.if.false.8199
.if.true.8199:
%.tmp8201 = getelementptr [2 x i8], [2 x i8]*@.str8200, i32 0, i32 0
ret i8* %.tmp8201
br label %.if.end.8199
.if.false.8199:
%.tmp8202 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8203 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8202, i32 0, i32 0
%.tmp8204 = load i8*, i8** %.tmp8203
%.tmp8206 = getelementptr [6 x i8], [6 x i8]*@.str8205, i32 0, i32 0
%.tmp8207 = call i32(i8*,i8*) @strcmp(i8* %.tmp8204, i8* %.tmp8206)
%.tmp8208 = icmp eq i32 %.tmp8207, 0
br i1 %.tmp8208, label %.if.true.8209, label %.if.false.8209
.if.true.8209:
%.tmp8211 = getelementptr [2 x i8], [2 x i8]*@.str8210, i32 0, i32 0
ret i8* %.tmp8211
br label %.if.end.8209
.if.false.8209:
%.tmp8213 = getelementptr [45 x i8], [45 x i8]*@.str8212, i32 0, i32 0
%.tmp8214 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8215 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8214, i32 0, i32 0
%.tmp8216 = load i8*, i8** %.tmp8215
%.tmp8217 = call i32(i8*,...) @printf(i8* %.tmp8213, i8* %.tmp8216)
br label %.if.end.8209
.if.end.8209:
br label %.if.end.8199
.if.end.8199:
br label %.if.end.8170
.if.end.8170:
br label %.if.end.8159
.if.end.8159:
br label %.if.end.8141
.if.end.8141:
br label %.if.end.8131
.if.end.8131:
br label %.if.end.8121
.if.end.8121:
br label %.if.end.8111
.if.end.8111:
br label %.if.end.8101
.if.end.8101:
%.tmp8218 = bitcast ptr null to i8*
ret i8* %.tmp8218
}
define %m2624$.AssignableInfo.type* @m295$define_string.m2624$.AssignableInfo.typep.m2624$.CompilerCtx.typep.cp(%m2624$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp8219 = bitcast ptr null to %m972$.Node.type*
%.tmp8220 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp8219)
%info.8221 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp8220, %m2624$.AssignableInfo.type** %info.8221
%tmp_buff.8222 = alloca i8*
store i8* null, i8** %tmp_buff.8222
%.tmp8223 = getelementptr i8*, i8** %tmp_buff.8222, i32 0
%.tmp8225 = getelementptr [7 x i8], [7 x i8]*@.str8224, i32 0, i32 0
%.tmp8226 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8227 = call i32(%m2624$.CompilerCtx.type*) @m295$new_uid.i.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.tmp8226)
%.tmp8228 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8223, i8* %.tmp8225, i32 %.tmp8227)
%.tmp8229 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.8221
%.tmp8230 = load i8, i8* @SCOPE_GLOBAL
%.tmp8231 = load i8*, i8** %tmp_buff.8222
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp8229, i8 %.tmp8230, i8* %.tmp8231)
%.tmp8232 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.8221
%.tmp8233 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8232, i32 0, i32 4
%.tmp8234 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp8234, %m2624$.Type.type** %.tmp8233
%.tmp8235 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.8221
%.tmp8236 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8235, i32 0, i32 4
%.tmp8237 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8236
%.tmp8238 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8237, i32 0, i32 0
%.tmp8240 = getelementptr [6 x i8], [6 x i8]*@.str8239, i32 0, i32 0
store i8* %.tmp8240, i8** %.tmp8238
%.tmp8241 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.8221
%.tmp8242 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8241, i32 0, i32 4
%.tmp8243 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8242
%.tmp8244 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8243, i32 0, i32 3
%.tmp8245 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp8245, %m2624$.Type.type** %.tmp8244
%.tmp8246 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.8221
%.tmp8247 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8246, i32 0, i32 4
%.tmp8248 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8247
%.tmp8249 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8248, i32 0, i32 3
%.tmp8250 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8249
%.tmp8251 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8250, i32 0, i32 0
%.tmp8253 = getelementptr [4 x i8], [4 x i8]*@.str8252, i32 0, i32 0
store i8* %.tmp8253, i8** %.tmp8251
%.tmp8254 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.8221
%.tmp8255 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8254, i32 0, i32 4
%.tmp8256 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8255
%.tmp8257 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8256, i32 0, i32 3
%.tmp8258 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8257
%.tmp8259 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8258, i32 0, i32 4
%.tmp8260 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp8260, %m2624$.Type.type** %.tmp8259
%.tmp8261 = load i8*, i8** %text
%.tmp8262 = call i8*(i8*) @m2178$string_to_llvm.cp.cp(i8* %.tmp8261)
%identifier.8263 = alloca i8*
store i8* %.tmp8262, i8** %identifier.8263
%.tmp8264 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.8221
%.tmp8265 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8264, i32 0, i32 4
%.tmp8266 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8265
%.tmp8267 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8266, i32 0, i32 3
%.tmp8268 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8267
%.tmp8269 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8268, i32 0, i32 4
%.tmp8270 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8269
%.tmp8271 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8270, i32 0, i32 0
%.tmp8272 = getelementptr i8*, i8** %.tmp8271, i32 0
%.tmp8274 = getelementptr [3 x i8], [3 x i8]*@.str8273, i32 0, i32 0
%.tmp8275 = load i8*, i8** %identifier.8263
%.tmp8276 = call i32(i8*) @m2178$llvm_str_len.i.cp(i8* %.tmp8275)
%.tmp8277 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8272, i8* %.tmp8274, i32 %.tmp8276)
%.tmp8278 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8279 = load i8*, i8** %identifier.8263
%.tmp8281 = getelementptr [7 x i8], [7 x i8]*@.str8280, i32 0, i32 0
%.tmp8282 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.8221
call void(%m2624$.CompilerCtx.type*,i8*,i8*,%m2624$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2624$.CompilerCtx.typep.cp.cp.m2624$.AssignableInfo.typep.b.b(%m2624$.CompilerCtx.type* %.tmp8278, i8* %.tmp8279, i8* %.tmp8281, %m2624$.AssignableInfo.type* %.tmp8282, i1 0, i1 0)
%.tmp8283 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.8221
ret %m2624$.AssignableInfo.type* %.tmp8283
}
define void @m295$define_global.v.m2624$.CompilerCtx.typep.cp.cp.m2624$.AssignableInfo.typep.b.b(%m2624$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg, i8* %.type.arg, %m2624$.AssignableInfo.type* %.info.arg, i1 %.weak.arg, i1 %.compiled.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%type = alloca i8*
store i8* %.type.arg, i8** %type
%info = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.info.arg, %m2624$.AssignableInfo.type** %info
%weak = alloca i1
store i1 %.weak.arg, i1* %weak
%compiled = alloca i1
store i1 %.compiled.arg, i1* %compiled
%.tmp8284 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* null, i32 1
%.tmp8285 = ptrtoint %m2624$.GlobalName.type* %.tmp8284 to i32
%.tmp8286 = call i8*(i32) @malloc(i32 %.tmp8285)
%.tmp8287 = bitcast i8* %.tmp8286 to %m2624$.GlobalName.type*
%global.8288 = alloca %m2624$.GlobalName.type*
store %m2624$.GlobalName.type* %.tmp8287, %m2624$.GlobalName.type** %global.8288
%.tmp8289 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %global.8288
%.tmp8290 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp8289, i32 0, i32 0
%.tmp8291 = load i8*, i8** %id
store i8* %.tmp8291, i8** %.tmp8290
%.tmp8292 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %global.8288
%.tmp8293 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp8292, i32 0, i32 1
%.tmp8294 = load i8*, i8** %type
store i8* %.tmp8294, i8** %.tmp8293
%.tmp8295 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %global.8288
%.tmp8296 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp8295, i32 0, i32 4
%.tmp8297 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info
store %m2624$.AssignableInfo.type* %.tmp8297, %m2624$.AssignableInfo.type** %.tmp8296
%.tmp8298 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %global.8288
%.tmp8299 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp8298, i32 0, i32 2
%.tmp8300 = load i1, i1* %compiled
store i1 %.tmp8300, i1* %.tmp8299
%.tmp8301 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %global.8288
%.tmp8302 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp8301, i32 0, i32 5
store %m2624$.GlobalName.type* null, %m2624$.GlobalName.type** %.tmp8302
%.tmp8303 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %global.8288
%.tmp8304 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp8303, i32 0, i32 3
%.tmp8305 = load i1, i1* %weak
store i1 %.tmp8305, i1* %.tmp8304
%.tmp8306 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8307 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %global.8288
call void(%m2624$.CompilerCtx.type*,%m2624$.GlobalName.type*) @m295$append_global.v.m2624$.CompilerCtx.typep.m2624$.GlobalName.typep(%m2624$.CompilerCtx.type* %.tmp8306, %m2624$.GlobalName.type* %.tmp8307)
ret void
}
define void @m295$define_module.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.cp(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%mod = alloca %m972$.Node.type*
store %m972$.Node.type* %.mod.arg, %m972$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp8308 = load %m972$.Node.type*, %m972$.Node.type** %mod
%.tmp8309 = call %m2624$.AssignableInfo.type*(%m972$.Node.type*) @m295$new_assignable_info.m2624$.AssignableInfo.typep.m972$.Node.typep(%m972$.Node.type* %.tmp8308)
%info.8310 = alloca %m2624$.AssignableInfo.type*
store %m2624$.AssignableInfo.type* %.tmp8309, %m2624$.AssignableInfo.type** %info.8310
%.tmp8311 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.8310
%.tmp8312 = load i8, i8* @SCOPE_CONST
%.tmp8313 = load i8*, i8** %abspath
call void(%m2624$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2624$.AssignableInfo.typep.c.cp(%m2624$.AssignableInfo.type* %.tmp8311, i8 %.tmp8312, i8* %.tmp8313)
%.tmp8314 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.8310
%.tmp8315 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8314, i32 0, i32 3
%.tmp8317 = getelementptr [7 x i8], [7 x i8]*@.str8316, i32 0, i32 0
store i8* %.tmp8317, i8** %.tmp8315
%.tmp8318 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.8310
%.tmp8319 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8318, i32 0, i32 4
store %m2624$.Type.type* null, %m2624$.Type.type** %.tmp8319
%.tmp8320 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8321 = load %m972$.Node.type*, %m972$.Node.type** %mod
%.tmp8322 = load i8*, i8** %as_name
%.tmp8323 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %info.8310
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*,%m2624$.AssignableInfo.type*) @m295$define_assignable.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp.m2624$.AssignableInfo.typep(%m2624$.CompilerCtx.type* %.tmp8320, %m972$.Node.type* %.tmp8321, i8* %.tmp8322, %m2624$.AssignableInfo.type* %.tmp8323)
ret void
}
define void @m295$append_anon_fn.v.m2624$.CompilerCtx.typep.cp(%m2624$.CompilerCtx.type* %.ctx.arg, i8* %.code.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%code = alloca i8*
store i8* %.code.arg, i8** %code
%.tmp8324 = getelementptr %m2624$.AnonFn.type, %m2624$.AnonFn.type* null, i32 1
%.tmp8325 = ptrtoint %m2624$.AnonFn.type* %.tmp8324 to i32
%.tmp8326 = call i8*(i32) @malloc(i32 %.tmp8325)
%.tmp8327 = bitcast i8* %.tmp8326 to %m2624$.AnonFn.type*
%fn.8328 = alloca %m2624$.AnonFn.type*
store %m2624$.AnonFn.type* %.tmp8327, %m2624$.AnonFn.type** %fn.8328
%.tmp8329 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %fn.8328
%.tmp8330 = getelementptr %m2624$.AnonFn.type, %m2624$.AnonFn.type* %.tmp8329, i32 0, i32 0
%.tmp8331 = load i8*, i8** %code
store i8* %.tmp8331, i8** %.tmp8330
%.tmp8332 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8333 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8332, i32 0, i32 8
%.tmp8334 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %.tmp8333
%.tmp8335 = icmp eq %m2624$.AnonFn.type* %.tmp8334, null
br i1 %.tmp8335, label %.if.true.8336, label %.if.false.8336
.if.true.8336:
%.tmp8337 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8338 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8337, i32 0, i32 8
%.tmp8339 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %fn.8328
store %m2624$.AnonFn.type* %.tmp8339, %m2624$.AnonFn.type** %.tmp8338
%.tmp8340 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %fn.8328
%.tmp8341 = getelementptr %m2624$.AnonFn.type, %m2624$.AnonFn.type* %.tmp8340, i32 0, i32 1
store %m2624$.AnonFn.type* null, %m2624$.AnonFn.type** %.tmp8341
br label %.if.end.8336
.if.false.8336:
%.tmp8342 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8343 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8342, i32 0, i32 8
%.tmp8344 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %.tmp8343
%last.8345 = alloca %m2624$.AnonFn.type*
store %m2624$.AnonFn.type* %.tmp8344, %m2624$.AnonFn.type** %last.8345
br label %.for.start.8346
.for.start.8346:
%.tmp8347 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %last.8345
%.tmp8348 = getelementptr %m2624$.AnonFn.type, %m2624$.AnonFn.type* %.tmp8347, i32 0, i32 1
%.tmp8349 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %.tmp8348
%.tmp8350 = icmp ne %m2624$.AnonFn.type* %.tmp8349, null
br i1 %.tmp8350, label %.for.continue.8346, label %.for.end.8346
.for.continue.8346:
%.tmp8351 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %last.8345
%.tmp8352 = getelementptr %m2624$.AnonFn.type, %m2624$.AnonFn.type* %.tmp8351, i32 0, i32 1
%.tmp8353 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %.tmp8352
store %m2624$.AnonFn.type* %.tmp8353, %m2624$.AnonFn.type** %last.8345
br label %.for.start.8346
.for.end.8346:
%.tmp8354 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %last.8345
%.tmp8355 = getelementptr %m2624$.AnonFn.type, %m2624$.AnonFn.type* %.tmp8354, i32 0, i32 1
%.tmp8356 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %fn.8328
store %m2624$.AnonFn.type* %.tmp8356, %m2624$.AnonFn.type** %.tmp8355
br label %.if.end.8336
.if.end.8336:
ret void
}
define void @m295$compile_anon_fn.v.m2624$.CompilerCtx.typep(%m2624$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%.tmp8358 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8359 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8358, i32 0, i32 8
%.tmp8360 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %.tmp8359
%fn.8361 = alloca %m2624$.AnonFn.type*
store %m2624$.AnonFn.type* %.tmp8360, %m2624$.AnonFn.type** %fn.8361
br label %.for.start.8357
.for.start.8357:
%.tmp8362 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %fn.8361
%.tmp8363 = icmp ne %m2624$.AnonFn.type* %.tmp8362, null
br i1 %.tmp8363, label %.for.continue.8357, label %.for.end.8357
.for.continue.8357:
%.tmp8364 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8365 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8364, i32 0, i32 1
%.tmp8366 = load %m0$.File.type*, %m0$.File.type** %.tmp8365
%.tmp8368 = getelementptr [4 x i8], [4 x i8]*@.str8367, i32 0, i32 0
%.tmp8369 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %fn.8361
%.tmp8370 = getelementptr %m2624$.AnonFn.type, %m2624$.AnonFn.type* %.tmp8369, i32 0, i32 0
%.tmp8371 = load i8*, i8** %.tmp8370
%.tmp8372 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8366, i8* %.tmp8368, i8* %.tmp8371)
%.tmp8373 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %fn.8361
%.tmp8374 = getelementptr %m2624$.AnonFn.type, %m2624$.AnonFn.type* %.tmp8373, i32 0, i32 1
%.tmp8375 = load %m2624$.AnonFn.type*, %m2624$.AnonFn.type** %.tmp8374
store %m2624$.AnonFn.type* %.tmp8375, %m2624$.AnonFn.type** %fn.8361
br label %.for.start.8357
.for.end.8357:
%.tmp8376 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8377 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8376, i32 0, i32 8
store %m2624$.AnonFn.type* null, %m2624$.AnonFn.type** %.tmp8377
ret void
}
define void @m295$append_global.v.m2624$.CompilerCtx.typep.m2624$.GlobalName.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%g = alloca %m2624$.GlobalName.type*
store %m2624$.GlobalName.type* %.g.arg, %m2624$.GlobalName.type** %g
%.tmp8378 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8379 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8378, i32 0, i32 3
%.tmp8380 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %.tmp8379
%.tmp8381 = icmp eq %m2624$.GlobalName.type* %.tmp8380, null
br i1 %.tmp8381, label %.if.true.8382, label %.if.false.8382
.if.true.8382:
%.tmp8383 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8384 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8383, i32 0, i32 3
%.tmp8385 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g
store %m2624$.GlobalName.type* %.tmp8385, %m2624$.GlobalName.type** %.tmp8384
ret void
br label %.if.end.8382
.if.false.8382:
br label %.if.end.8382
.if.end.8382:
%.tmp8386 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8387 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8386, i32 0, i32 3
%.tmp8388 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %.tmp8387
%last_global.8389 = alloca %m2624$.GlobalName.type*
store %m2624$.GlobalName.type* %.tmp8388, %m2624$.GlobalName.type** %last_global.8389
%.tmp8391 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8392 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8391, i32 0, i32 3
%.tmp8393 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %.tmp8392
%curr_global.8394 = alloca %m2624$.GlobalName.type*
store %m2624$.GlobalName.type* %.tmp8393, %m2624$.GlobalName.type** %curr_global.8394
br label %.for.start.8390
.for.start.8390:
%.tmp8395 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %curr_global.8394
%.tmp8396 = icmp ne %m2624$.GlobalName.type* %.tmp8395, null
br i1 %.tmp8396, label %.for.continue.8390, label %.for.end.8390
.for.continue.8390:
%.tmp8397 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %curr_global.8394
%.tmp8398 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp8397, i32 0, i32 4
%.tmp8399 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %.tmp8398
%.tmp8400 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8399, i32 0, i32 0
%.tmp8401 = load i8*, i8** %.tmp8400
%.tmp8402 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g
%.tmp8403 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp8402, i32 0, i32 4
%.tmp8404 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %.tmp8403
%.tmp8405 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp8404, i32 0, i32 0
%.tmp8406 = load i8*, i8** %.tmp8405
%.tmp8407 = call i32(i8*,i8*) @strcmp(i8* %.tmp8401, i8* %.tmp8406)
%.tmp8408 = icmp eq i32 %.tmp8407, 0
br i1 %.tmp8408, label %.if.true.8409, label %.if.false.8409
.if.true.8409:
ret void
br label %.if.end.8409
.if.false.8409:
br label %.if.end.8409
.if.end.8409:
%.tmp8410 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %curr_global.8394
store %m2624$.GlobalName.type* %.tmp8410, %m2624$.GlobalName.type** %last_global.8389
%.tmp8411 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %curr_global.8394
%.tmp8412 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp8411, i32 0, i32 5
%.tmp8413 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %.tmp8412
store %m2624$.GlobalName.type* %.tmp8413, %m2624$.GlobalName.type** %curr_global.8394
br label %.for.start.8390
.for.end.8390:
%.tmp8414 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %last_global.8389
%.tmp8415 = getelementptr %m2624$.GlobalName.type, %m2624$.GlobalName.type* %.tmp8414, i32 0, i32 5
%.tmp8416 = load %m2624$.GlobalName.type*, %m2624$.GlobalName.type** %g
store %m2624$.GlobalName.type* %.tmp8416, %m2624$.GlobalName.type** %.tmp8415
ret void
}
define i8* @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.Type.type* %.type.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%type = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.type.arg, %m2624$.Type.type** %type
%.tmp8417 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8418 = icmp eq %m2624$.Type.type* %.tmp8417, null
br i1 %.tmp8418, label %.if.true.8419, label %.if.false.8419
.if.true.8419:
%.tmp8420 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp8420, label %.if.true.8421, label %.if.false.8421
.if.true.8421:
%.tmp8423 = getelementptr [44 x i8], [44 x i8]*@.str8422, i32 0, i32 0
%.tmp8424 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8425 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8424, i32 0, i32 7
%.tmp8426 = load i8*, i8** %.tmp8425
%.tmp8427 = call i32(i8*,...) @printf(i8* %.tmp8423, i8* %.tmp8426)
br label %.if.end.8421
.if.false.8421:
br label %.if.end.8421
.if.end.8421:
%.tmp8429 = getelementptr [2 x i8], [2 x i8]*@.str8428, i32 0, i32 0
ret i8* %.tmp8429
br label %.if.end.8419
.if.false.8419:
br label %.if.end.8419
.if.end.8419:
%.tmp8430 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8431 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8430, i32 0, i32 0
%.tmp8432 = load i8*, i8** %.tmp8431
%.tmp8433 = icmp ne i8* %.tmp8432, null
%.tmp8435 = getelementptr [59 x i8], [59 x i8]*@.str8434, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8433, i8* %.tmp8435)
%buf.8436 = alloca i8*
store i8* null, i8** %buf.8436
%.tmp8437 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8438 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8437, i32 0, i32 0
%.tmp8439 = load i8*, i8** %.tmp8438
%.tmp8441 = getelementptr [4 x i8], [4 x i8]*@.str8440, i32 0, i32 0
%.tmp8442 = call i32(i8*,i8*) @strcmp(i8* %.tmp8439, i8* %.tmp8441)
%.tmp8443 = icmp eq i32 %.tmp8442, 0
br i1 %.tmp8443, label %.if.true.8444, label %.if.false.8444
.if.true.8444:
%.tmp8446 = getelementptr [4 x i8], [4 x i8]*@.str8445, i32 0, i32 0
ret i8* %.tmp8446
br label %.if.end.8444
.if.false.8444:
%.tmp8447 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8448 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8447, i32 0, i32 0
%.tmp8449 = load i8*, i8** %.tmp8448
%.tmp8451 = getelementptr [5 x i8], [5 x i8]*@.str8450, i32 0, i32 0
%.tmp8452 = call i32(i8*,i8*) @strcmp(i8* %.tmp8449, i8* %.tmp8451)
%.tmp8453 = icmp eq i32 %.tmp8452, 0
br i1 %.tmp8453, label %.if.true.8454, label %.if.false.8454
.if.true.8454:
%.tmp8456 = getelementptr [5 x i8], [5 x i8]*@.str8455, i32 0, i32 0
ret i8* %.tmp8456
br label %.if.end.8454
.if.false.8454:
%.tmp8457 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8458 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8457, i32 0, i32 0
%.tmp8459 = load i8*, i8** %.tmp8458
%.tmp8461 = getelementptr [5 x i8], [5 x i8]*@.str8460, i32 0, i32 0
%.tmp8462 = call i32(i8*,i8*) @strcmp(i8* %.tmp8459, i8* %.tmp8461)
%.tmp8463 = icmp eq i32 %.tmp8462, 0
br i1 %.tmp8463, label %.if.true.8464, label %.if.false.8464
.if.true.8464:
%.tmp8466 = getelementptr [3 x i8], [3 x i8]*@.str8465, i32 0, i32 0
ret i8* %.tmp8466
br label %.if.end.8464
.if.false.8464:
%.tmp8467 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8468 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8467, i32 0, i32 0
%.tmp8469 = load i8*, i8** %.tmp8468
%.tmp8471 = getelementptr [8 x i8], [8 x i8]*@.str8470, i32 0, i32 0
%.tmp8472 = call i32(i8*,i8*) @strcmp(i8* %.tmp8469, i8* %.tmp8471)
%.tmp8473 = icmp eq i32 %.tmp8472, 0
br i1 %.tmp8473, label %.if.true.8474, label %.if.false.8474
.if.true.8474:
%.tmp8476 = getelementptr [4 x i8], [4 x i8]*@.str8475, i32 0, i32 0
ret i8* %.tmp8476
br label %.if.end.8474
.if.false.8474:
%.tmp8477 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8478 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8477, i32 0, i32 0
%.tmp8479 = load i8*, i8** %.tmp8478
%.tmp8481 = getelementptr [4 x i8], [4 x i8]*@.str8480, i32 0, i32 0
%.tmp8482 = call i32(i8*,i8*) @strcmp(i8* %.tmp8479, i8* %.tmp8481)
%.tmp8483 = icmp eq i32 %.tmp8482, 0
br i1 %.tmp8483, label %.if.true.8484, label %.if.false.8484
.if.true.8484:
%.tmp8486 = getelementptr [3 x i8], [3 x i8]*@.str8485, i32 0, i32 0
ret i8* %.tmp8486
br label %.if.end.8484
.if.false.8484:
%.tmp8487 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8488 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8487, i32 0, i32 0
%.tmp8489 = load i8*, i8** %.tmp8488
%.tmp8491 = getelementptr [9 x i8], [9 x i8]*@.str8490, i32 0, i32 0
%.tmp8492 = call i32(i8*,i8*) @strcmp(i8* %.tmp8489, i8* %.tmp8491)
%.tmp8493 = icmp eq i32 %.tmp8492, 0
br i1 %.tmp8493, label %.if.true.8494, label %.if.false.8494
.if.true.8494:
%.tmp8495 = getelementptr i8*, i8** %buf.8436, i32 0
%.tmp8497 = getelementptr [4 x i8], [4 x i8]*@.str8496, i32 0, i32 0
%.tmp8498 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8499 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8500 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8499, i32 0, i32 3
%.tmp8501 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8500
%.tmp8502 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp8498, %m2624$.Type.type* %.tmp8501)
%.tmp8503 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8495, i8* %.tmp8497, i8* %.tmp8502)
%.tmp8505 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8506 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8505, i32 0, i32 3
%.tmp8507 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8506
%.tmp8508 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8507, i32 0, i32 4
%.tmp8509 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8508
%p.8510 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp8509, %m2624$.Type.type** %p.8510
br label %.for.start.8504
.for.start.8504:
%.tmp8511 = load %m2624$.Type.type*, %m2624$.Type.type** %p.8510
%.tmp8512 = icmp ne %m2624$.Type.type* %.tmp8511, null
br i1 %.tmp8512, label %.for.continue.8504, label %.for.end.8504
.for.continue.8504:
%.tmp8513 = load %m2624$.Type.type*, %m2624$.Type.type** %p.8510
%.tmp8514 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8515 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8514, i32 0, i32 3
%.tmp8516 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8515
%.tmp8517 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8516, i32 0, i32 4
%.tmp8518 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8517
%.tmp8519 = icmp ne %m2624$.Type.type* %.tmp8513, %.tmp8518
br i1 %.tmp8519, label %.if.true.8520, label %.if.false.8520
.if.true.8520:
%.tmp8521 = getelementptr i8*, i8** %buf.8436, i32 0
%.tmp8523 = getelementptr [4 x i8], [4 x i8]*@.str8522, i32 0, i32 0
%.tmp8524 = load i8*, i8** %buf.8436
%.tmp8525 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8521, i8* %.tmp8523, i8* %.tmp8524)
br label %.if.end.8520
.if.false.8520:
br label %.if.end.8520
.if.end.8520:
%.tmp8526 = getelementptr i8*, i8** %buf.8436, i32 0
%.tmp8528 = getelementptr [5 x i8], [5 x i8]*@.str8527, i32 0, i32 0
%.tmp8529 = load i8*, i8** %buf.8436
%.tmp8530 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8531 = load %m2624$.Type.type*, %m2624$.Type.type** %p.8510
%.tmp8532 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp8530, %m2624$.Type.type* %.tmp8531)
%.tmp8533 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8526, i8* %.tmp8528, i8* %.tmp8529, i8* %.tmp8532)
%.tmp8534 = load %m2624$.Type.type*, %m2624$.Type.type** %p.8510
%.tmp8535 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8534, i32 0, i32 4
%.tmp8536 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8535
store %m2624$.Type.type* %.tmp8536, %m2624$.Type.type** %p.8510
br label %.for.start.8504
.for.end.8504:
%.tmp8537 = getelementptr i8*, i8** %buf.8436, i32 0
%.tmp8539 = getelementptr [4 x i8], [4 x i8]*@.str8538, i32 0, i32 0
%.tmp8540 = load i8*, i8** %buf.8436
%.tmp8541 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8537, i8* %.tmp8539, i8* %.tmp8540)
%.tmp8542 = load i8*, i8** %buf.8436
ret i8* %.tmp8542
br label %.if.end.8494
.if.false.8494:
%.tmp8543 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8544 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8543, i32 0, i32 0
%.tmp8545 = load i8*, i8** %.tmp8544
%.tmp8547 = getelementptr [4 x i8], [4 x i8]*@.str8546, i32 0, i32 0
%.tmp8548 = call i32(i8*,i8*) @strcmp(i8* %.tmp8545, i8* %.tmp8547)
%.tmp8549 = icmp eq i32 %.tmp8548, 0
br i1 %.tmp8549, label %.if.true.8550, label %.if.false.8550
.if.true.8550:
%.tmp8551 = getelementptr i8*, i8** %buf.8436, i32 0
%.tmp8553 = getelementptr [4 x i8], [4 x i8]*@.str8552, i32 0, i32 0
%.tmp8554 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8555 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8556 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8555, i32 0, i32 3
%.tmp8557 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8556
%.tmp8558 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp8554, %m2624$.Type.type* %.tmp8557)
%.tmp8559 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8551, i8* %.tmp8553, i8* %.tmp8558)
%.tmp8560 = load i8*, i8** %buf.8436
ret i8* %.tmp8560
br label %.if.end.8550
.if.false.8550:
%.tmp8561 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8562 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8561, i32 0, i32 0
%.tmp8563 = load i8*, i8** %.tmp8562
%.tmp8565 = getelementptr [7 x i8], [7 x i8]*@.str8564, i32 0, i32 0
%.tmp8566 = call i32(i8*,i8*) @strcmp(i8* %.tmp8563, i8* %.tmp8565)
%.tmp8567 = icmp eq i32 %.tmp8566, 0
br i1 %.tmp8567, label %.if.true.8568, label %.if.false.8568
.if.true.8568:
%.tmp8569 = getelementptr i8*, i8** %buf.8436, i32 0
%.tmp8571 = getelementptr [2 x i8], [2 x i8]*@.str8570, i32 0, i32 0
%.tmp8572 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8569, i8* %.tmp8571)
%.tmp8574 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8575 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8574, i32 0, i32 3
%.tmp8576 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8575
%t.8577 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp8576, %m2624$.Type.type** %t.8577
br label %.for.start.8573
.for.start.8573:
%.tmp8578 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8577
%.tmp8579 = icmp ne %m2624$.Type.type* %.tmp8578, null
br i1 %.tmp8579, label %.for.continue.8573, label %.for.end.8573
.for.continue.8573:
%.tmp8580 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8577
%.tmp8581 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8582 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8581, i32 0, i32 3
%.tmp8583 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8582
%.tmp8584 = icmp ne %m2624$.Type.type* %.tmp8580, %.tmp8583
br i1 %.tmp8584, label %.if.true.8585, label %.if.false.8585
.if.true.8585:
%.tmp8586 = getelementptr i8*, i8** %buf.8436, i32 0
%.tmp8588 = getelementptr [4 x i8], [4 x i8]*@.str8587, i32 0, i32 0
%.tmp8589 = load i8*, i8** %buf.8436
%.tmp8590 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8586, i8* %.tmp8588, i8* %.tmp8589)
br label %.if.end.8585
.if.false.8585:
br label %.if.end.8585
.if.end.8585:
%.tmp8591 = getelementptr i8*, i8** %buf.8436, i32 0
%.tmp8593 = getelementptr [5 x i8], [5 x i8]*@.str8592, i32 0, i32 0
%.tmp8594 = load i8*, i8** %buf.8436
%.tmp8595 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8596 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8577
%.tmp8597 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp8595, %m2624$.Type.type* %.tmp8596)
%.tmp8598 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8591, i8* %.tmp8593, i8* %.tmp8594, i8* %.tmp8597)
%.tmp8599 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8577
%.tmp8600 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8599, i32 0, i32 4
%.tmp8601 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8600
store %m2624$.Type.type* %.tmp8601, %m2624$.Type.type** %t.8577
br label %.for.start.8573
.for.end.8573:
%.tmp8602 = getelementptr i8*, i8** %buf.8436, i32 0
%.tmp8604 = getelementptr [4 x i8], [4 x i8]*@.str8603, i32 0, i32 0
%.tmp8605 = load i8*, i8** %buf.8436
%.tmp8606 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8602, i8* %.tmp8604, i8* %.tmp8605)
%.tmp8607 = load i8*, i8** %buf.8436
ret i8* %.tmp8607
br label %.if.end.8568
.if.false.8568:
%.tmp8608 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8609 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8608, i32 0, i32 0
%.tmp8610 = load i8*, i8** %.tmp8609
%.tmp8612 = getelementptr [6 x i8], [6 x i8]*@.str8611, i32 0, i32 0
%.tmp8613 = call i32(i8*,i8*) @strcmp(i8* %.tmp8610, i8* %.tmp8612)
%.tmp8614 = icmp eq i32 %.tmp8613, 0
br i1 %.tmp8614, label %.if.true.8615, label %.if.false.8615
.if.true.8615:
%.tmp8616 = getelementptr i8*, i8** %buf.8436, i32 0
%.tmp8618 = getelementptr [10 x i8], [10 x i8]*@.str8617, i32 0, i32 0
%.tmp8619 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8620 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8619, i32 0, i32 3
%.tmp8621 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8620
%.tmp8622 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8621, i32 0, i32 4
%.tmp8623 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8622
%.tmp8624 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8623, i32 0, i32 0
%.tmp8625 = load i8*, i8** %.tmp8624
%.tmp8626 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8627 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8628 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8627, i32 0, i32 3
%.tmp8629 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8628
%.tmp8630 = call i8*(%m2624$.CompilerCtx.type*,%m2624$.Type.type*) @m295$type_repr.cp.m2624$.CompilerCtx.typep.m2624$.Type.typep(%m2624$.CompilerCtx.type* %.tmp8626, %m2624$.Type.type* %.tmp8629)
%.tmp8631 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8616, i8* %.tmp8618, i8* %.tmp8625, i8* %.tmp8630)
%.tmp8632 = load i8*, i8** %buf.8436
ret i8* %.tmp8632
br label %.if.end.8615
.if.false.8615:
%.tmp8633 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8634 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8633, i32 0, i32 0
%.tmp8635 = load i8*, i8** %.tmp8634
%.tmp8637 = getelementptr [10 x i8], [10 x i8]*@.str8636, i32 0, i32 0
%.tmp8638 = call i32(i8*,i8*) @strcmp(i8* %.tmp8635, i8* %.tmp8637)
%.tmp8639 = icmp eq i32 %.tmp8638, 0
br i1 %.tmp8639, label %.if.true.8640, label %.if.false.8640
.if.true.8640:
%.tmp8641 = getelementptr i8*, i8** %buf.8436, i32 0
%.tmp8643 = getelementptr [5 x i8], [5 x i8]*@.str8642, i32 0, i32 0
%.tmp8644 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8645 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8644, i32 0, i32 2
%.tmp8646 = load i8*, i8** %.tmp8645
%.tmp8647 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8641, i8* %.tmp8643, i8* %.tmp8646)
%.tmp8648 = load i8*, i8** %buf.8436
ret i8* %.tmp8648
br label %.if.end.8640
.if.false.8640:
%.tmp8649 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8650 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8649, i32 0, i32 0
%.tmp8651 = load i8*, i8** %.tmp8650
%.tmp8653 = getelementptr [7 x i8], [7 x i8]*@.str8652, i32 0, i32 0
%.tmp8654 = call i32(i8*,i8*) @strcmp(i8* %.tmp8651, i8* %.tmp8653)
%.tmp8655 = icmp eq i32 %.tmp8654, 0
br i1 %.tmp8655, label %.if.true.8656, label %.if.false.8656
.if.true.8656:
%.tmp8658 = getelementptr [4 x i8], [4 x i8]*@.str8657, i32 0, i32 0
ret i8* %.tmp8658
br label %.if.end.8656
.if.false.8656:
%.tmp8659 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8660 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8659, i32 0, i32 0
%.tmp8661 = load i8*, i8** %.tmp8660
%.tmp8663 = getelementptr [6 x i8], [6 x i8]*@.str8662, i32 0, i32 0
%.tmp8664 = call i32(i8*,i8*) @strcmp(i8* %.tmp8661, i8* %.tmp8663)
%.tmp8665 = icmp eq i32 %.tmp8664, 0
br i1 %.tmp8665, label %.if.true.8666, label %.if.false.8666
.if.true.8666:
br label %.if.end.8666
.if.false.8666:
%.tmp8668 = getelementptr [58 x i8], [58 x i8]*@.str8667, i32 0, i32 0
%.tmp8669 = load %m2624$.Type.type*, %m2624$.Type.type** %type
%.tmp8670 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8669, i32 0, i32 0
%.tmp8671 = load i8*, i8** %.tmp8670
%.tmp8672 = call i32(i8*,...) @printf(i8* %.tmp8668, i8* %.tmp8671)
br label %.if.end.8666
.if.end.8666:
br label %.if.end.8656
.if.end.8656:
br label %.if.end.8640
.if.end.8640:
br label %.if.end.8615
.if.end.8615:
br label %.if.end.8568
.if.end.8568:
br label %.if.end.8550
.if.end.8550:
br label %.if.end.8494
.if.end.8494:
br label %.if.end.8484
.if.end.8484:
br label %.if.end.8474
.if.end.8474:
br label %.if.end.8464
.if.end.8464:
br label %.if.end.8454
.if.end.8454:
br label %.if.end.8444
.if.end.8444:
%.tmp8673 = bitcast ptr null to i8*
ret i8* %.tmp8673
}
define void @m295$append_error.v.m2624$.CompilerCtx.typep.m296$.Error.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m296$.Error.type* %.e.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp8674 = getelementptr %m2624$.ErrorList.type, %m2624$.ErrorList.type* null, i32 1
%.tmp8675 = ptrtoint %m2624$.ErrorList.type* %.tmp8674 to i32
%.tmp8676 = call i8*(i32) @malloc(i32 %.tmp8675)
%.tmp8677 = bitcast i8* %.tmp8676 to %m2624$.ErrorList.type*
%new_err.8678 = alloca %m2624$.ErrorList.type*
store %m2624$.ErrorList.type* %.tmp8677, %m2624$.ErrorList.type** %new_err.8678
%.tmp8679 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %new_err.8678
%.tmp8680 = getelementptr %m2624$.ErrorList.type, %m2624$.ErrorList.type* %.tmp8679, i32 0, i32 2
store i1 0, i1* %.tmp8680
%.tmp8681 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %new_err.8678
%.tmp8682 = getelementptr %m2624$.ErrorList.type, %m2624$.ErrorList.type* %.tmp8681, i32 0, i32 0
%.tmp8683 = load %m296$.Error.type*, %m296$.Error.type** %e
store %m296$.Error.type* %.tmp8683, %m296$.Error.type** %.tmp8682
%.tmp8684 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %new_err.8678
%.tmp8685 = getelementptr %m2624$.ErrorList.type, %m2624$.ErrorList.type* %.tmp8684, i32 0, i32 1
store %m2624$.ErrorList.type* null, %m2624$.ErrorList.type** %.tmp8685
%.tmp8686 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8687 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8686, i32 0, i32 2
%.tmp8688 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %.tmp8687
%.tmp8689 = icmp eq %m2624$.ErrorList.type* %.tmp8688, null
br i1 %.tmp8689, label %.if.true.8690, label %.if.false.8690
.if.true.8690:
%.tmp8691 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8692 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8691, i32 0, i32 2
%.tmp8693 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %new_err.8678
store %m2624$.ErrorList.type* %.tmp8693, %m2624$.ErrorList.type** %.tmp8692
ret void
br label %.if.end.8690
.if.false.8690:
br label %.if.end.8690
.if.end.8690:
%last.8694 = alloca %m2624$.ErrorList.type*
store %m2624$.ErrorList.type* null, %m2624$.ErrorList.type** %last.8694
%.tmp8696 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8697 = getelementptr %m2624$.CompilerCtx.type, %m2624$.CompilerCtx.type* %.tmp8696, i32 0, i32 2
%.tmp8698 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %.tmp8697
store %m2624$.ErrorList.type* %.tmp8698, %m2624$.ErrorList.type** %last.8694
br label %.for.start.8695
.for.start.8695:
%.tmp8699 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %last.8694
%.tmp8700 = getelementptr %m2624$.ErrorList.type, %m2624$.ErrorList.type* %.tmp8699, i32 0, i32 1
%.tmp8701 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %.tmp8700
%.tmp8702 = icmp ne %m2624$.ErrorList.type* %.tmp8701, null
br i1 %.tmp8702, label %.for.continue.8695, label %.for.end.8695
.for.continue.8695:
%.tmp8703 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %last.8694
%.tmp8704 = getelementptr %m2624$.ErrorList.type, %m2624$.ErrorList.type* %.tmp8703, i32 0, i32 1
%.tmp8705 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %.tmp8704
store %m2624$.ErrorList.type* %.tmp8705, %m2624$.ErrorList.type** %last.8694
br label %.for.start.8695
.for.end.8695:
%.tmp8706 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %last.8694
%.tmp8707 = getelementptr %m2624$.ErrorList.type, %m2624$.ErrorList.type* %.tmp8706, i32 0, i32 1
%.tmp8708 = load %m2624$.ErrorList.type*, %m2624$.ErrorList.type** %new_err.8678
store %m2624$.ErrorList.type* %.tmp8708, %m2624$.ErrorList.type** %.tmp8707
ret void
}
define i8* @m295$syn_function_name.cp.m972$.Node.typep(%m972$.Node.type* %.stmt.arg) {
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%.tmp8709 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp8710 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8709, i32 0, i32 6
%.tmp8711 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8710
%.tmp8712 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8711, i32 0, i32 7
%.tmp8713 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8712
%.tmp8714 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8713, i32 0, i32 1
%.tmp8715 = load i8*, i8** %.tmp8714
ret i8* %.tmp8715
}
define %m972$.Node.type* @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m972$.Node.type*
store %m972$.Node.type* %.node.arg, %m972$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp8717 = load %m972$.Node.type*, %m972$.Node.type** %node
%n.8718 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp8717, %m972$.Node.type** %n.8718
br label %.for.start.8716
.for.start.8716:
%.tmp8719 = load %m972$.Node.type*, %m972$.Node.type** %n.8718
%.tmp8720 = icmp ne %m972$.Node.type* %.tmp8719, null
br i1 %.tmp8720, label %.for.continue.8716, label %.for.end.8716
.for.continue.8716:
%.tmp8721 = load %m972$.Node.type*, %m972$.Node.type** %n.8718
%.tmp8722 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8721, i32 0, i32 0
%.tmp8723 = load i8*, i8** %.tmp8722
%.tmp8724 = load i8*, i8** %type
%.tmp8725 = call i32(i8*,i8*) @strcmp(i8* %.tmp8723, i8* %.tmp8724)
%.tmp8726 = icmp eq i32 %.tmp8725, 0
br i1 %.tmp8726, label %.if.true.8727, label %.if.false.8727
.if.true.8727:
%.tmp8728 = load %m972$.Node.type*, %m972$.Node.type** %n.8718
ret %m972$.Node.type* %.tmp8728
br label %.if.end.8727
.if.false.8727:
br label %.if.end.8727
.if.end.8727:
%.tmp8729 = load %m972$.Node.type*, %m972$.Node.type** %n.8718
%.tmp8730 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8729, i32 0, i32 7
%.tmp8731 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8730
store %m972$.Node.type* %.tmp8731, %m972$.Node.type** %n.8718
br label %.for.start.8716
.for.end.8716:
%.tmp8732 = bitcast ptr null to %m972$.Node.type*
ret %m972$.Node.type* %.tmp8732
}
define %m2624$.Type.type* @m295$syn_function_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%.tmp8733 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%function_type.8734 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp8733, %m2624$.Type.type** %function_type.8734
%.tmp8735 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8736 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp8737 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8736, i32 0, i32 6
%.tmp8738 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8737
%.tmp8739 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp8735, %m972$.Node.type* %.tmp8738)
%return_value_type.8740 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp8739, %m2624$.Type.type** %return_value_type.8740
%.tmp8741 = load %m2624$.Type.type*, %m2624$.Type.type** %function_type.8734
%.tmp8742 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8741, i32 0, i32 0
%.tmp8744 = getelementptr [9 x i8], [9 x i8]*@.str8743, i32 0, i32 0
store i8* %.tmp8744, i8** %.tmp8742
%.tmp8745 = load %m2624$.Type.type*, %m2624$.Type.type** %function_type.8734
%.tmp8746 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8745, i32 0, i32 3
%.tmp8747 = load %m2624$.Type.type*, %m2624$.Type.type** %return_value_type.8740
store %m2624$.Type.type* %.tmp8747, %m2624$.Type.type** %.tmp8746
%.tmp8748 = load %m2624$.Type.type*, %m2624$.Type.type** %return_value_type.8740
%last_type.8749 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp8748, %m2624$.Type.type** %last_type.8749
%.tmp8750 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp8751 = call %m972$.Node.type*(%m972$.Node.type*) @m295$syn_function_params.m972$.Node.typep.m972$.Node.typep(%m972$.Node.type* %.tmp8750)
%params.8752 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp8751, %m972$.Node.type** %params.8752
%.tmp8754 = load %m972$.Node.type*, %m972$.Node.type** %params.8752
%param_ptr.8755 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp8754, %m972$.Node.type** %param_ptr.8755
br label %.for.start.8753
.for.start.8753:
%.tmp8756 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.8755
%.tmp8757 = icmp ne %m972$.Node.type* %.tmp8756, null
br i1 %.tmp8757, label %.for.continue.8753, label %.for.end.8753
.for.continue.8753:
%.tmp8758 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.8755
%.tmp8759 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8758, i32 0, i32 0
%.tmp8760 = load i8*, i8** %.tmp8759
%.tmp8762 = getelementptr [5 x i8], [5 x i8]*@.str8761, i32 0, i32 0
%.tmp8763 = call i32(i8*,i8*) @strcmp(i8* %.tmp8760, i8* %.tmp8762)
%.tmp8764 = icmp eq i32 %.tmp8763, 0
br i1 %.tmp8764, label %.if.true.8765, label %.if.false.8765
.if.true.8765:
%.tmp8766 = load %m2624$.Type.type*, %m2624$.Type.type** %last_type.8749
%.tmp8767 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8766, i32 0, i32 4
%.tmp8768 = load %m2624$.Type.type*, %m2624$.Type.type** %last_type.8749
%.tmp8769 = call %m2624$.Type.type*(%m2624$.Type.type*) @m295$type_clone.m2624$.Type.typep.m2624$.Type.typep(%m2624$.Type.type* %.tmp8768)
store %m2624$.Type.type* %.tmp8769, %m2624$.Type.type** %.tmp8767
%.tmp8770 = load %m2624$.Type.type*, %m2624$.Type.type** %last_type.8749
%.tmp8771 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8770, i32 0, i32 4
%.tmp8772 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8771
%.tmp8773 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8772, i32 0, i32 4
store %m2624$.Type.type* null, %m2624$.Type.type** %.tmp8773
%.tmp8774 = load %m2624$.Type.type*, %m2624$.Type.type** %last_type.8749
%.tmp8775 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8774, i32 0, i32 4
%.tmp8776 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8775
store %m2624$.Type.type* %.tmp8776, %m2624$.Type.type** %last_type.8749
%.tmp8777 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.8755
%.tmp8778 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8777, i32 0, i32 7
%.tmp8779 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8778
%.tmp8780 = icmp ne %m972$.Node.type* %.tmp8779, null
br i1 %.tmp8780, label %.if.true.8781, label %.if.false.8781
.if.true.8781:
%.tmp8782 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.8755
%.tmp8783 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8782, i32 0, i32 7
%.tmp8784 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8783
store %m972$.Node.type* %.tmp8784, %m972$.Node.type** %param_ptr.8755
br label %.if.end.8781
.if.false.8781:
br label %.if.end.8781
.if.end.8781:
%.tmp8785 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.8755
%.tmp8786 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8785, i32 0, i32 7
%.tmp8787 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8786
%.tmp8788 = icmp ne %m972$.Node.type* %.tmp8787, null
br i1 %.tmp8788, label %.if.true.8789, label %.if.false.8789
.if.true.8789:
%.tmp8790 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.8755
%.tmp8791 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8790, i32 0, i32 7
%.tmp8792 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8791
store %m972$.Node.type* %.tmp8792, %m972$.Node.type** %param_ptr.8755
br label %.if.end.8789
.if.false.8789:
store %m972$.Node.type* null, %m972$.Node.type** %param_ptr.8755
br label %.if.end.8789
.if.end.8789:
br label %.if.end.8765
.if.false.8765:
%.tmp8793 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8794 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.8755
%.tmp8795 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8794, i32 0, i32 6
%.tmp8796 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8795
%.tmp8797 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp8793, %m972$.Node.type* %.tmp8796)
%param_type.8798 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp8797, %m2624$.Type.type** %param_type.8798
%.tmp8799 = load %m2624$.Type.type*, %m2624$.Type.type** %last_type.8749
%.tmp8800 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8799, i32 0, i32 4
%.tmp8801 = load %m2624$.Type.type*, %m2624$.Type.type** %param_type.8798
store %m2624$.Type.type* %.tmp8801, %m2624$.Type.type** %.tmp8800
%.tmp8802 = load %m2624$.Type.type*, %m2624$.Type.type** %param_type.8798
store %m2624$.Type.type* %.tmp8802, %m2624$.Type.type** %last_type.8749
%.tmp8803 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.8755
%.tmp8804 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8803, i32 0, i32 7
%.tmp8805 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8804
store %m972$.Node.type* %.tmp8805, %m972$.Node.type** %param_ptr.8755
%.tmp8806 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.8755
%.tmp8807 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8806, i32 0, i32 7
%.tmp8808 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8807
%.tmp8809 = icmp ne %m972$.Node.type* %.tmp8808, null
br i1 %.tmp8809, label %.if.true.8810, label %.if.false.8810
.if.true.8810:
%.tmp8811 = load %m972$.Node.type*, %m972$.Node.type** %param_ptr.8755
%.tmp8812 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8811, i32 0, i32 7
%.tmp8813 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8812
%.tmp8814 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8813, i32 0, i32 7
%.tmp8815 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8814
store %m972$.Node.type* %.tmp8815, %m972$.Node.type** %param_ptr.8755
br label %.if.end.8810
.if.false.8810:
store %m972$.Node.type* null, %m972$.Node.type** %param_ptr.8755
br label %.if.end.8810
.if.end.8810:
br label %.if.end.8765
.if.end.8765:
br label %.for.start.8753
.for.end.8753:
%.tmp8816 = load %m2624$.Type.type*, %m2624$.Type.type** %function_type.8734
ret %m2624$.Type.type* %.tmp8816
}
define %m972$.Node.type* @m295$syn_function_params.m972$.Node.typep.m972$.Node.typep(%m972$.Node.type* %.stmt.arg) {
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%.tmp8817 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp8819 = getelementptr [10 x i8], [10 x i8]*@.str8818, i32 0, i32 0
%.tmp8820 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp8817, i8* %.tmp8819)
%params.8821 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp8820, %m972$.Node.type** %params.8821
%.tmp8822 = load %m972$.Node.type*, %m972$.Node.type** %params.8821
%.tmp8823 = icmp eq %m972$.Node.type* %.tmp8822, null
br i1 %.tmp8823, label %.if.true.8824, label %.if.false.8824
.if.true.8824:
%.tmp8825 = bitcast ptr null to %m972$.Node.type*
ret %m972$.Node.type* %.tmp8825
br label %.if.end.8824
.if.false.8824:
br label %.if.end.8824
.if.end.8824:
%.tmp8826 = load %m972$.Node.type*, %m972$.Node.type** %params.8821
%.tmp8827 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8826, i32 0, i32 6
%.tmp8828 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8827
ret %m972$.Node.type* %.tmp8828
}
define %m2624$.Type.type* @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.ctx.arg, %m972$.Node.type* %.stmt.arg) {
%ctx = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.ctx.arg, %m2624$.CompilerCtx.type** %ctx
%stmt = alloca %m972$.Node.type*
store %m972$.Node.type* %.stmt.arg, %m972$.Node.type** %stmt
%.tmp8829 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp8830 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8829, i32 0, i32 0
%.tmp8831 = load i8*, i8** %.tmp8830
%.tmp8833 = getelementptr [11 x i8], [11 x i8]*@.str8832, i32 0, i32 0
%.tmp8834 = call i32(i8*,i8*) @strcmp(i8* %.tmp8831, i8* %.tmp8833)
%.tmp8835 = icmp eq i32 %.tmp8834, 0
br i1 %.tmp8835, label %.if.true.8836, label %.if.false.8836
.if.true.8836:
%.tmp8837 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8838 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp8839 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8838, i32 0, i32 6
%.tmp8840 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8839
%.tmp8841 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp8837, %m972$.Node.type* %.tmp8840)
%t.8842 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp8841, %m2624$.Type.type** %t.8842
%.tmp8843 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp8844 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8843, i32 0, i32 7
%.tmp8845 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8844
%.tmp8846 = icmp ne %m972$.Node.type* %.tmp8845, null
br i1 %.tmp8846, label %.if.true.8847, label %.if.false.8847
.if.true.8847:
%.tmp8848 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp8849 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8848, i32 0, i32 7
%.tmp8850 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8849
%.tmp8851 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8850, i32 0, i32 0
%.tmp8852 = load i8*, i8** %.tmp8851
%.tmp8854 = getelementptr [13 x i8], [13 x i8]*@.str8853, i32 0, i32 0
%.tmp8855 = call i32(i8*,i8*) @strcmp(i8* %.tmp8852, i8* %.tmp8854)
%.tmp8856 = icmp eq i32 %.tmp8855, 0
br i1 %.tmp8856, label %.if.true.8857, label %.if.false.8857
.if.true.8857:
%.tmp8858 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%fn_type.8859 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp8858, %m2624$.Type.type** %fn_type.8859
%.tmp8860 = load %m2624$.Type.type*, %m2624$.Type.type** %fn_type.8859
%.tmp8861 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8860, i32 0, i32 0
%.tmp8863 = getelementptr [9 x i8], [9 x i8]*@.str8862, i32 0, i32 0
store i8* %.tmp8863, i8** %.tmp8861
%.tmp8864 = load %m2624$.Type.type*, %m2624$.Type.type** %fn_type.8859
%.tmp8865 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8864, i32 0, i32 3
%.tmp8866 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8842
store %m2624$.Type.type* %.tmp8866, %m2624$.Type.type** %.tmp8865
%.tmp8867 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp8868 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8867, i32 0, i32 7
%.tmp8869 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8868
%.tmp8870 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8869, i32 0, i32 6
%.tmp8871 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8870
%.tmp8872 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8871, i32 0, i32 7
%.tmp8873 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8872
%fst_operator.8874 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp8873, %m972$.Node.type** %fst_operator.8874
%.tmp8875 = load %m972$.Node.type*, %m972$.Node.type** %fst_operator.8874
%.tmp8876 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8875, i32 0, i32 0
%.tmp8877 = load i8*, i8** %.tmp8876
%.tmp8879 = getelementptr [15 x i8], [15 x i8]*@.str8878, i32 0, i32 0
%.tmp8880 = call i32(i8*,i8*) @strcmp(i8* %.tmp8877, i8* %.tmp8879)
%.tmp8881 = icmp eq i32 %.tmp8880, 0
br i1 %.tmp8881, label %.if.true.8882, label %.if.false.8882
.if.true.8882:
%.tmp8883 = load %m2624$.Type.type*, %m2624$.Type.type** %fn_type.8859
%.tmp8884 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8883, i32 0, i32 3
%.tmp8885 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8884
%last_fn_value.8886 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp8885, %m2624$.Type.type** %last_fn_value.8886
%.tmp8888 = load %m972$.Node.type*, %m972$.Node.type** %fst_operator.8874
%.tmp8889 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8888, i32 0, i32 6
%.tmp8890 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8889
%t.8891 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp8890, %m972$.Node.type** %t.8891
br label %.for.start.8887
.for.start.8887:
%.tmp8892 = load %m972$.Node.type*, %m972$.Node.type** %t.8891
%.tmp8893 = icmp ne %m972$.Node.type* %.tmp8892, null
br i1 %.tmp8893, label %.for.continue.8887, label %.for.end.8887
.for.continue.8887:
%.tmp8894 = load %m2624$.Type.type*, %m2624$.Type.type** %last_fn_value.8886
%.tmp8895 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8894, i32 0, i32 4
%.tmp8896 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8897 = load %m972$.Node.type*, %m972$.Node.type** %t.8891
%.tmp8898 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8897, i32 0, i32 6
%.tmp8899 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8898
%.tmp8900 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp8896, %m972$.Node.type* %.tmp8899)
store %m2624$.Type.type* %.tmp8900, %m2624$.Type.type** %.tmp8895
%.tmp8901 = load %m2624$.Type.type*, %m2624$.Type.type** %last_fn_value.8886
%.tmp8902 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8901, i32 0, i32 4
%.tmp8903 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8902
store %m2624$.Type.type* %.tmp8903, %m2624$.Type.type** %last_fn_value.8886
%.tmp8904 = load %m972$.Node.type*, %m972$.Node.type** %t.8891
%.tmp8905 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8904, i32 0, i32 7
%.tmp8906 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8905
%.tmp8907 = icmp ne %m972$.Node.type* %.tmp8906, null
br i1 %.tmp8907, label %.if.true.8908, label %.if.false.8908
.if.true.8908:
%.tmp8909 = load %m972$.Node.type*, %m972$.Node.type** %t.8891
%.tmp8910 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8909, i32 0, i32 7
%.tmp8911 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8910
store %m972$.Node.type* %.tmp8911, %m972$.Node.type** %t.8891
br label %.if.end.8908
.if.false.8908:
br label %.if.end.8908
.if.end.8908:
%.tmp8912 = load %m972$.Node.type*, %m972$.Node.type** %t.8891
%.tmp8913 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8912, i32 0, i32 7
%.tmp8914 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8913
store %m972$.Node.type* %.tmp8914, %m972$.Node.type** %t.8891
br label %.for.start.8887
.for.end.8887:
br label %.if.end.8882
.if.false.8882:
br label %.if.end.8882
.if.end.8882:
%.tmp8915 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%t_ptr.8916 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp8915, %m2624$.Type.type** %t_ptr.8916
%.tmp8917 = load %m2624$.Type.type*, %m2624$.Type.type** %t_ptr.8916
%.tmp8918 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8917, i32 0, i32 0
%.tmp8920 = getelementptr [4 x i8], [4 x i8]*@.str8919, i32 0, i32 0
store i8* %.tmp8920, i8** %.tmp8918
%.tmp8921 = load %m2624$.Type.type*, %m2624$.Type.type** %t_ptr.8916
%.tmp8922 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8921, i32 0, i32 3
%.tmp8923 = load %m2624$.Type.type*, %m2624$.Type.type** %fn_type.8859
store %m2624$.Type.type* %.tmp8923, %m2624$.Type.type** %.tmp8922
%.tmp8924 = load %m2624$.Type.type*, %m2624$.Type.type** %t_ptr.8916
store %m2624$.Type.type* %.tmp8924, %m2624$.Type.type** %t.8842
br label %.if.end.8857
.if.false.8857:
br label %.if.end.8857
.if.end.8857:
br label %.if.end.8847
.if.false.8847:
br label %.if.end.8847
.if.end.8847:
%.tmp8925 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8842
ret %m2624$.Type.type* %.tmp8925
br label %.if.end.8836
.if.false.8836:
br label %.if.end.8836
.if.end.8836:
%.tmp8926 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%t.8927 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp8926, %m2624$.Type.type** %t.8927
%.tmp8928 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp8929 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8928, i32 0, i32 0
%.tmp8930 = load i8*, i8** %.tmp8929
%.tmp8932 = getelementptr [10 x i8], [10 x i8]*@.str8931, i32 0, i32 0
%.tmp8933 = call i32(i8*,i8*) @strcmp(i8* %.tmp8930, i8* %.tmp8932)
%.tmp8934 = icmp eq i32 %.tmp8933, 0
br i1 %.tmp8934, label %.if.true.8935, label %.if.false.8935
.if.true.8935:
%.tmp8936 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp8937 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8936, i32 0, i32 0
%.tmp8939 = getelementptr [7 x i8], [7 x i8]*@.str8938, i32 0, i32 0
store i8* %.tmp8939, i8** %.tmp8937
%.tmp8940 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp8941 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8940, i32 0, i32 1
store i8* null, i8** %.tmp8941
%.tmp8942 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp8943 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8942, i32 0, i32 6
%.tmp8944 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8943
%.tmp8946 = getelementptr [5 x i8], [5 x i8]*@.str8945, i32 0, i32 0
%.tmp8947 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp8944, i8* %.tmp8946)
%curr_type.8948 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp8947, %m972$.Node.type** %curr_type.8948
%.tmp8949 = load %m972$.Node.type*, %m972$.Node.type** %curr_type.8948
%.tmp8950 = icmp ne %m972$.Node.type* %.tmp8949, null
br i1 %.tmp8950, label %.if.true.8951, label %.if.false.8951
.if.true.8951:
%.tmp8952 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp8953 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8952, i32 0, i32 3
%.tmp8954 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8955 = load %m972$.Node.type*, %m972$.Node.type** %curr_type.8948
%.tmp8956 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8955, i32 0, i32 6
%.tmp8957 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8956
%.tmp8958 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp8954, %m972$.Node.type* %.tmp8957)
store %m2624$.Type.type* %.tmp8958, %m2624$.Type.type** %.tmp8953
%.tmp8959 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp8960 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8959, i32 0, i32 3
%.tmp8961 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8960
%.tmp8962 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8961, i32 0, i32 1
%.tmp8963 = load %m972$.Node.type*, %m972$.Node.type** %curr_type.8948
%.tmp8964 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8963, i32 0, i32 7
%.tmp8965 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8964
%.tmp8966 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8965, i32 0, i32 1
%.tmp8967 = load i8*, i8** %.tmp8966
store i8* %.tmp8967, i8** %.tmp8962
%.tmp8968 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp8969 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8968, i32 0, i32 3
%.tmp8970 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8969
%curr_t.8971 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp8970, %m2624$.Type.type** %curr_t.8971
%.tmp8973 = load %m972$.Node.type*, %m972$.Node.type** %curr_type.8948
%.tmp8974 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8973, i32 0, i32 7
%.tmp8975 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8974
%.tmp8977 = getelementptr [5 x i8], [5 x i8]*@.str8976, i32 0, i32 0
%.tmp8978 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp8975, i8* %.tmp8977)
store %m972$.Node.type* %.tmp8978, %m972$.Node.type** %curr_type.8948
br label %.for.start.8972
.for.start.8972:
%.tmp8979 = load %m972$.Node.type*, %m972$.Node.type** %curr_type.8948
%.tmp8980 = icmp ne %m972$.Node.type* %.tmp8979, null
br i1 %.tmp8980, label %.for.continue.8972, label %.for.end.8972
.for.continue.8972:
%.tmp8981 = load %m2624$.Type.type*, %m2624$.Type.type** %curr_t.8971
%.tmp8982 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8981, i32 0, i32 4
%.tmp8983 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp8984 = load %m972$.Node.type*, %m972$.Node.type** %curr_type.8948
%.tmp8985 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8984, i32 0, i32 6
%.tmp8986 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8985
%.tmp8987 = call %m2624$.Type.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$node_to_type.m2624$.Type.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp8983, %m972$.Node.type* %.tmp8986)
store %m2624$.Type.type* %.tmp8987, %m2624$.Type.type** %.tmp8982
%.tmp8988 = load %m2624$.Type.type*, %m2624$.Type.type** %curr_t.8971
%.tmp8989 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8988, i32 0, i32 4
%.tmp8990 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8989
%.tmp8991 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8990, i32 0, i32 1
%.tmp8992 = load %m972$.Node.type*, %m972$.Node.type** %curr_type.8948
%.tmp8993 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8992, i32 0, i32 7
%.tmp8994 = load %m972$.Node.type*, %m972$.Node.type** %.tmp8993
%.tmp8995 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp8994, i32 0, i32 1
%.tmp8996 = load i8*, i8** %.tmp8995
store i8* %.tmp8996, i8** %.tmp8991
%.tmp8997 = load %m2624$.Type.type*, %m2624$.Type.type** %curr_t.8971
%.tmp8998 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp8997, i32 0, i32 4
%.tmp8999 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp8998
store %m2624$.Type.type* %.tmp8999, %m2624$.Type.type** %curr_t.8971
%.tmp9000 = load %m972$.Node.type*, %m972$.Node.type** %curr_type.8948
%.tmp9001 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9000, i32 0, i32 7
%.tmp9002 = load %m972$.Node.type*, %m972$.Node.type** %.tmp9001
%.tmp9004 = getelementptr [5 x i8], [5 x i8]*@.str9003, i32 0, i32 0
%.tmp9005 = call %m972$.Node.type*(%m972$.Node.type*,i8*) @m295$skip_to_type.m972$.Node.typep.m972$.Node.typep.cp(%m972$.Node.type* %.tmp9002, i8* %.tmp9004)
store %m972$.Node.type* %.tmp9005, %m972$.Node.type** %curr_type.8948
br label %.for.start.8972
.for.end.8972:
br label %.if.end.8951
.if.false.8951:
br label %.if.end.8951
.if.end.8951:
br label %.if.end.8935
.if.false.8935:
%.tmp9006 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp9007 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9006, i32 0, i32 0
%.tmp9008 = load i8*, i8** %.tmp9007
%.tmp9010 = getelementptr [12 x i8], [12 x i8]*@.str9009, i32 0, i32 0
%.tmp9011 = call i32(i8*,i8*) @strcmp(i8* %.tmp9008, i8* %.tmp9010)
%.tmp9012 = icmp eq i32 %.tmp9011, 0
br i1 %.tmp9012, label %.if.true.9013, label %.if.false.9013
.if.true.9013:
%err_msg.9014 = alloca i8*
store i8* null, i8** %err_msg.9014
%.tmp9015 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp9016 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp9017 = call %m2624$.ScopeItem.type*(%m2624$.CompilerCtx.type*,%m972$.Node.type*) @m295$find_defined.m2624$.ScopeItem.typep.m2624$.CompilerCtx.typep.m972$.Node.typep(%m2624$.CompilerCtx.type* %.tmp9015, %m972$.Node.type* %.tmp9016)
%base.9018 = alloca %m2624$.ScopeItem.type*
store %m2624$.ScopeItem.type* %.tmp9017, %m2624$.ScopeItem.type** %base.9018
%.tmp9019 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %base.9018
%.tmp9020 = icmp eq %m2624$.ScopeItem.type* %.tmp9019, null
br i1 %.tmp9020, label %.if.true.9021, label %.if.false.9021
.if.true.9021:
%.tmp9022 = getelementptr i8*, i8** %err_msg.9014, i32 0
%.tmp9024 = getelementptr [37 x i8], [37 x i8]*@.str9023, i32 0, i32 0
%.tmp9025 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp9026 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9025, i32 0, i32 6
%.tmp9027 = load %m972$.Node.type*, %m972$.Node.type** %.tmp9026
%.tmp9028 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9027, i32 0, i32 1
%.tmp9029 = load i8*, i8** %.tmp9028
%.tmp9030 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9022, i8* %.tmp9024, i8* %.tmp9029)
%.tmp9031 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp9032 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp9033 = load i8*, i8** %err_msg.9014
call void(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$new_error.v.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp9031, %m972$.Node.type* %.tmp9032, i8* %.tmp9033)
%.tmp9034 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp9035 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9034, i32 0, i32 0
%.tmp9037 = getelementptr [6 x i8], [6 x i8]*@.str9036, i32 0, i32 0
store i8* %.tmp9037, i8** %.tmp9035
%.tmp9038 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
ret %m2624$.Type.type* %.tmp9038
br label %.if.end.9021
.if.false.9021:
br label %.if.end.9021
.if.end.9021:
%.tmp9039 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp9040 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9039, i32 0, i32 0
%.tmp9042 = getelementptr [10 x i8], [10 x i8]*@.str9041, i32 0, i32 0
store i8* %.tmp9042, i8** %.tmp9040
%.tmp9043 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp9044 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9043, i32 0, i32 1
%.tmp9045 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %base.9018
%.tmp9046 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp9045, i32 0, i32 0
%.tmp9047 = load i8*, i8** %.tmp9046
store i8* %.tmp9047, i8** %.tmp9044
%.tmp9048 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp9049 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9048, i32 0, i32 2
%.tmp9050 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %base.9018
%.tmp9051 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp9050, i32 0, i32 1
%.tmp9052 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %.tmp9051
%.tmp9053 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp9052, i32 0, i32 0
%.tmp9054 = load i8*, i8** %.tmp9053
store i8* %.tmp9054, i8** %.tmp9049
%.tmp9055 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp9056 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9055, i32 0, i32 3
%.tmp9057 = load %m2624$.ScopeItem.type*, %m2624$.ScopeItem.type** %base.9018
%.tmp9058 = getelementptr %m2624$.ScopeItem.type, %m2624$.ScopeItem.type* %.tmp9057, i32 0, i32 1
%.tmp9059 = load %m2624$.AssignableInfo.type*, %m2624$.AssignableInfo.type** %.tmp9058
%.tmp9060 = getelementptr %m2624$.AssignableInfo.type, %m2624$.AssignableInfo.type* %.tmp9059, i32 0, i32 4
%.tmp9061 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp9060
store %m2624$.Type.type* %.tmp9061, %m2624$.Type.type** %.tmp9056
br label %.if.end.9013
.if.false.9013:
%.tmp9062 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp9063 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9062, i32 0, i32 1
%.tmp9064 = load i8*, i8** %.tmp9063
%.tmp9066 = getelementptr [4 x i8], [4 x i8]*@.str9065, i32 0, i32 0
%.tmp9067 = call i32(i8*,i8*) @strcmp(i8* %.tmp9064, i8* %.tmp9066)
%.tmp9068 = icmp eq i32 %.tmp9067, 0
br i1 %.tmp9068, label %.if.true.9069, label %.if.false.9069
.if.true.9069:
%.tmp9070 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp9071 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9070, i32 0, i32 0
%.tmp9073 = getelementptr [4 x i8], [4 x i8]*@.str9072, i32 0, i32 0
store i8* %.tmp9073, i8** %.tmp9071
%.tmp9074 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp9075 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9074, i32 0, i32 3
%.tmp9076 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
store %m2624$.Type.type* %.tmp9076, %m2624$.Type.type** %.tmp9075
%.tmp9077 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp9078 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9077, i32 0, i32 3
%.tmp9079 = load %m2624$.Type.type*, %m2624$.Type.type** %.tmp9078
%.tmp9080 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9079, i32 0, i32 0
%.tmp9082 = getelementptr [4 x i8], [4 x i8]*@.str9081, i32 0, i32 0
store i8* %.tmp9082, i8** %.tmp9080
br label %.if.end.9069
.if.false.9069:
%.tmp9083 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp9084 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9083, i32 0, i32 0
%.tmp9085 = load i8*, i8** %.tmp9084
%.tmp9087 = getelementptr [5 x i8], [5 x i8]*@.str9086, i32 0, i32 0
%.tmp9088 = call i32(i8*,i8*) @strcmp(i8* %.tmp9085, i8* %.tmp9087)
%.tmp9089 = icmp eq i32 %.tmp9088, 0
br i1 %.tmp9089, label %.if.true.9090, label %.if.false.9090
.if.true.9090:
%.tmp9091 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp9092 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9091, i32 0, i32 0
%.tmp9093 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp9094 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9093, i32 0, i32 1
%.tmp9095 = load i8*, i8** %.tmp9094
store i8* %.tmp9095, i8** %.tmp9092
br label %.if.end.9090
.if.false.9090:
%.tmp9096 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp9097 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9096, i32 0, i32 1
%.tmp9098 = load i8*, i8** %.tmp9097
%.tmp9100 = getelementptr [4 x i8], [4 x i8]*@.str9099, i32 0, i32 0
%.tmp9101 = call i32(i8*,i8*) @strcmp(i8* %.tmp9098, i8* %.tmp9100)
%.tmp9102 = icmp eq i32 %.tmp9101, 0
br i1 %.tmp9102, label %.if.true.9103, label %.if.false.9103
.if.true.9103:
%.tmp9104 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
%.tmp9105 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9104, i32 0, i32 0
%.tmp9107 = getelementptr [7 x i8], [7 x i8]*@.str9106, i32 0, i32 0
store i8* %.tmp9107, i8** %.tmp9105
br label %.if.end.9103
.if.false.9103:
%.tmp9108 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp9109 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp9111 = getelementptr [54 x i8], [54 x i8]*@.str9110, i32 0, i32 0
%.tmp9112 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp9108, %m972$.Node.type* %.tmp9109, i8* %.tmp9111)
%.tmp9113 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp9114 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9113, i32 0, i32 0
%.tmp9115 = load i8*, i8** %.tmp9114
%.tmp9116 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp9117 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9116, i32 0, i32 1
%.tmp9118 = load i8*, i8** %.tmp9117
%.tmp9119 = call i32(i8*,...) @printf(i8* %.tmp9112, i8* %.tmp9115, i8* %.tmp9118)
%.tmp9120 = bitcast ptr null to %m2624$.Type.type*
ret %m2624$.Type.type* %.tmp9120
br label %.if.end.9103
.if.end.9103:
br label %.if.end.9090
.if.end.9090:
br label %.if.end.9069
.if.end.9069:
br label %.if.end.9013
.if.end.9013:
br label %.if.end.8935
.if.end.8935:
%.tmp9122 = load %m972$.Node.type*, %m972$.Node.type** %stmt
%.tmp9123 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9122, i32 0, i32 7
%.tmp9124 = load %m972$.Node.type*, %m972$.Node.type** %.tmp9123
%ptr.9125 = alloca %m972$.Node.type*
store %m972$.Node.type* %.tmp9124, %m972$.Node.type** %ptr.9125
br label %.for.start.9121
.for.start.9121:
%.tmp9126 = load %m972$.Node.type*, %m972$.Node.type** %ptr.9125
%.tmp9127 = icmp ne %m972$.Node.type* %.tmp9126, null
br i1 %.tmp9127, label %.for.continue.9121, label %.for.end.9121
.for.continue.9121:
%.tmp9128 = load %m972$.Node.type*, %m972$.Node.type** %ptr.9125
%.tmp9129 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9128, i32 0, i32 1
%.tmp9130 = load i8*, i8** %.tmp9129
%.tmp9132 = getelementptr [2 x i8], [2 x i8]*@.str9131, i32 0, i32 0
%.tmp9133 = call i32(i8*,i8*) @strcmp(i8* %.tmp9130, i8* %.tmp9132)
%.tmp9134 = icmp eq i32 %.tmp9133, 0
br i1 %.tmp9134, label %.if.true.9135, label %.if.false.9135
.if.true.9135:
%.tmp9136 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%pt.9137 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp9136, %m2624$.Type.type** %pt.9137
%.tmp9138 = load %m2624$.Type.type*, %m2624$.Type.type** %pt.9137
%.tmp9139 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9138, i32 0, i32 0
%.tmp9141 = getelementptr [4 x i8], [4 x i8]*@.str9140, i32 0, i32 0
store i8* %.tmp9141, i8** %.tmp9139
%.tmp9142 = load %m2624$.Type.type*, %m2624$.Type.type** %pt.9137
%.tmp9143 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9142, i32 0, i32 3
%.tmp9144 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
store %m2624$.Type.type* %.tmp9144, %m2624$.Type.type** %.tmp9143
%.tmp9145 = load %m2624$.Type.type*, %m2624$.Type.type** %pt.9137
store %m2624$.Type.type* %.tmp9145, %m2624$.Type.type** %t.8927
br label %.if.end.9135
.if.false.9135:
%.tmp9146 = load %m972$.Node.type*, %m972$.Node.type** %ptr.9125
%.tmp9147 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9146, i32 0, i32 1
%.tmp9148 = load i8*, i8** %.tmp9147
%.tmp9150 = getelementptr [2 x i8], [2 x i8]*@.str9149, i32 0, i32 0
%.tmp9151 = call i32(i8*,i8*) @strcmp(i8* %.tmp9148, i8* %.tmp9150)
%.tmp9152 = icmp eq i32 %.tmp9151, 0
br i1 %.tmp9152, label %.if.true.9153, label %.if.false.9153
.if.true.9153:
%.tmp9154 = load %m972$.Node.type*, %m972$.Node.type** %ptr.9125
%.tmp9155 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9154, i32 0, i32 7
%.tmp9156 = load %m972$.Node.type*, %m972$.Node.type** %.tmp9155
%.tmp9157 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9156, i32 0, i32 1
%.tmp9158 = load i8*, i8** %.tmp9157
%.tmp9160 = getelementptr [2 x i8], [2 x i8]*@.str9159, i32 0, i32 0
%.tmp9161 = call i32(i8*,i8*) @strcmp(i8* %.tmp9158, i8* %.tmp9160)
%.tmp9162 = icmp eq i32 %.tmp9161, 0
br i1 %.tmp9162, label %.if.true.9163, label %.if.false.9163
.if.true.9163:
%.tmp9164 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%slice_type.9165 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp9164, %m2624$.Type.type** %slice_type.9165
%.tmp9166 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_type.9165
%.tmp9167 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9166, i32 0, i32 0
%.tmp9169 = getelementptr [7 x i8], [7 x i8]*@.str9168, i32 0, i32 0
store i8* %.tmp9169, i8** %.tmp9167
%.tmp9170 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_type.9165
%.tmp9171 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9170, i32 0, i32 1
%.tmp9173 = getelementptr [6 x i8], [6 x i8]*@.str9172, i32 0, i32 0
store i8* %.tmp9173, i8** %.tmp9171
%.tmp9174 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%slice_c_array.9175 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp9174, %m2624$.Type.type** %slice_c_array.9175
%.tmp9176 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_c_array.9175
%.tmp9177 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9176, i32 0, i32 0
%.tmp9179 = getelementptr [4 x i8], [4 x i8]*@.str9178, i32 0, i32 0
store i8* %.tmp9179, i8** %.tmp9177
%.tmp9180 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_c_array.9175
%.tmp9181 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9180, i32 0, i32 1
%.tmp9183 = getelementptr [6 x i8], [6 x i8]*@.str9182, i32 0, i32 0
store i8* %.tmp9183, i8** %.tmp9181
%.tmp9184 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_c_array.9175
%.tmp9185 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9184, i32 0, i32 3
%.tmp9186 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
store %m2624$.Type.type* %.tmp9186, %m2624$.Type.type** %.tmp9185
%.tmp9187 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_type.9165
%.tmp9188 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9187, i32 0, i32 3
%.tmp9189 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_c_array.9175
store %m2624$.Type.type* %.tmp9189, %m2624$.Type.type** %.tmp9188
%.tmp9190 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%slice_len.9191 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp9190, %m2624$.Type.type** %slice_len.9191
%.tmp9192 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_len.9191
%.tmp9193 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9192, i32 0, i32 0
%.tmp9195 = getelementptr [4 x i8], [4 x i8]*@.str9194, i32 0, i32 0
store i8* %.tmp9195, i8** %.tmp9193
%.tmp9196 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_len.9191
%.tmp9197 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9196, i32 0, i32 1
%.tmp9199 = getelementptr [4 x i8], [4 x i8]*@.str9198, i32 0, i32 0
store i8* %.tmp9199, i8** %.tmp9197
%.tmp9200 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_c_array.9175
%.tmp9201 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9200, i32 0, i32 4
%.tmp9202 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_len.9191
store %m2624$.Type.type* %.tmp9202, %m2624$.Type.type** %.tmp9201
%.tmp9203 = call %m2624$.Type.type*() @m295$new_type.m2624$.Type.typep()
%slice_cap.9204 = alloca %m2624$.Type.type*
store %m2624$.Type.type* %.tmp9203, %m2624$.Type.type** %slice_cap.9204
%.tmp9205 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_cap.9204
%.tmp9206 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9205, i32 0, i32 0
%.tmp9208 = getelementptr [4 x i8], [4 x i8]*@.str9207, i32 0, i32 0
store i8* %.tmp9208, i8** %.tmp9206
%.tmp9209 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_cap.9204
%.tmp9210 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9209, i32 0, i32 1
%.tmp9212 = getelementptr [4 x i8], [4 x i8]*@.str9211, i32 0, i32 0
store i8* %.tmp9212, i8** %.tmp9210
%.tmp9213 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_len.9191
%.tmp9214 = getelementptr %m2624$.Type.type, %m2624$.Type.type* %.tmp9213, i32 0, i32 4
%.tmp9215 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_cap.9204
store %m2624$.Type.type* %.tmp9215, %m2624$.Type.type** %.tmp9214
%.tmp9216 = load %m2624$.Type.type*, %m2624$.Type.type** %slice_type.9165
store %m2624$.Type.type* %.tmp9216, %m2624$.Type.type** %t.8927
%.tmp9217 = load %m972$.Node.type*, %m972$.Node.type** %ptr.9125
%.tmp9218 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9217, i32 0, i32 7
%.tmp9219 = load %m972$.Node.type*, %m972$.Node.type** %.tmp9218
store %m972$.Node.type* %.tmp9219, %m972$.Node.type** %ptr.9125
br label %.if.end.9163
.if.false.9163:
br label %.if.end.9163
.if.end.9163:
br label %.if.end.9153
.if.false.9153:
%.tmp9220 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %ctx
%.tmp9221 = load %m972$.Node.type*, %m972$.Node.type** %ptr.9125
%.tmp9223 = getelementptr [49 x i8], [49 x i8]*@.str9222, i32 0, i32 0
%.tmp9224 = call i8*(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$err_tmpl.cp.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp9220, %m972$.Node.type* %.tmp9221, i8* %.tmp9223)
%.tmp9225 = load %m972$.Node.type*, %m972$.Node.type** %ptr.9125
%.tmp9226 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9225, i32 0, i32 1
%.tmp9227 = load i8*, i8** %.tmp9226
%.tmp9228 = call i32(i8*,...) @printf(i8* %.tmp9224, i8* %.tmp9227)
%.tmp9229 = bitcast ptr null to %m2624$.Type.type*
ret %m2624$.Type.type* %.tmp9229
br label %.if.end.9153
.if.end.9153:
br label %.if.end.9135
.if.end.9135:
%.tmp9230 = load %m972$.Node.type*, %m972$.Node.type** %ptr.9125
%.tmp9231 = getelementptr %m972$.Node.type, %m972$.Node.type* %.tmp9230, i32 0, i32 7
%.tmp9232 = load %m972$.Node.type*, %m972$.Node.type** %.tmp9231
store %m972$.Node.type* %.tmp9232, %m972$.Node.type** %ptr.9125
br label %.for.start.9121
.for.end.9121:
%.tmp9233 = load %m2624$.Type.type*, %m2624$.Type.type** %t.8927
ret %m2624$.Type.type* %.tmp9233
}
define i1 @compile_file.b.cp.cp(i8* %.filename.arg, i8* %.outname.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%outname = alloca i8*
store i8* %.outname.arg, i8** %outname
%.tmp9234 = load i32, i32* @STDERR
%.tmp9236 = getelementptr [2 x i8], [2 x i8]*@.str9235, i32 0, i32 0
%.tmp9237 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp9234, i8* %.tmp9236)
%stderr.9238 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9237, %m0$.File.type** %stderr.9238
%.tmp9239 = call %m0$.File.type*() @tmpfile()
%llvm_code.9240 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9239, %m0$.File.type** %llvm_code.9240
%.tmp9241 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9240
%.tmp9242 = load i8*, i8** %filename
%.tmp9243 = call %m2624$.CompilerCtx.type*(%m0$.File.type*,i8*) @m295$new_context.m2624$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp9241, i8* %.tmp9242)
%compiler_ctx.9244 = alloca %m2624$.CompilerCtx.type*
store %m2624$.CompilerCtx.type* %.tmp9243, %m2624$.CompilerCtx.type** %compiler_ctx.9244
%.tmp9245 = load %m2624$.CompilerCtx.type*, %m2624$.CompilerCtx.type** %compiler_ctx.9244
%.tmp9246 = bitcast ptr null to %m972$.Node.type*
%.tmp9247 = load i8*, i8** %filename
%.tmp9248 = call i1(%m2624$.CompilerCtx.type*,%m972$.Node.type*,i8*) @m295$compile_file.b.m2624$.CompilerCtx.typep.m972$.Node.typep.cp(%m2624$.CompilerCtx.type* %.tmp9245, %m972$.Node.type* %.tmp9246, i8* %.tmp9247)
br i1 %.tmp9248, label %.if.true.9249, label %.if.false.9249
.if.true.9249:
%.tmp9250 = load %m0$.File.type*, %m0$.File.type** %stderr.9238
%.tmp9252 = getelementptr [34 x i8], [34 x i8]*@.str9251, i32 0, i32 0
%.tmp9253 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9250, i8* %.tmp9252)
ret i1 0
br label %.if.end.9249
.if.false.9249:
br label %.if.end.9249
.if.end.9249:
%.tmp9254 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9240
%.tmp9255 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp9254)
%.tmp9256 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9240
%.tmp9257 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp9256)
%llvm_code_size.9258 = alloca i32
store i32 %.tmp9257, i32* %llvm_code_size.9258
%.tmp9259 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9240
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp9259)
%.tmp9261 = getelementptr [1 x i8], [1 x i8]*@.str9260, i32 0, i32 0
%cmd.9262 = alloca i8*
store i8* %.tmp9261, i8** %cmd.9262
%.tmp9263 = getelementptr i8*, i8** %cmd.9262, i32 0
%.tmp9265 = getelementptr [32 x i8], [32 x i8]*@.str9264, i32 0, i32 0
%.tmp9266 = load i8*, i8** %outname
%.tmp9267 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9263, i8* %.tmp9265, i8* %.tmp9266)
%.tmp9268 = load i8*, i8** %cmd.9262
%.tmp9270 = getelementptr [2 x i8], [2 x i8]*@.str9269, i32 0, i32 0
%.tmp9271 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9268, i8* %.tmp9270)
%proc.9272 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9271, %m0$.File.type** %proc.9272
%.tmp9273 = load %m0$.File.type*, %m0$.File.type** %proc.9272
%.tmp9274 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9273)
%.tmp9275 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9240
%.tmp9276 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9275)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp9274, i32 %.tmp9276)
%.tmp9277 = load %m0$.File.type*, %m0$.File.type** %proc.9272
%.tmp9278 = icmp eq %m0$.File.type* %.tmp9277, null
br i1 %.tmp9278, label %.if.true.9279, label %.if.false.9279
.if.true.9279:
%.tmp9280 = load %m0$.File.type*, %m0$.File.type** %stderr.9238
%.tmp9282 = getelementptr [28 x i8], [28 x i8]*@.str9281, i32 0, i32 0
%.tmp9283 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9280, i8* %.tmp9282)
ret i1 0
br label %.if.end.9279
.if.false.9279:
br label %.if.end.9279
.if.end.9279:
%.tmp9284 = load %m0$.File.type*, %m0$.File.type** %proc.9272
%.tmp9285 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9284)
%.tmp9286 = icmp ne i32 %.tmp9285, 0
br i1 %.tmp9286, label %.if.true.9287, label %.if.false.9287
.if.true.9287:
%.tmp9288 = load %m0$.File.type*, %m0$.File.type** %stderr.9238
%.tmp9290 = getelementptr [24 x i8], [24 x i8]*@.str9289, i32 0, i32 0
%.tmp9291 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9288, i8* %.tmp9290)
ret i1 0
br label %.if.end.9287
.if.false.9287:
br label %.if.end.9287
.if.end.9287:
%.tmp9292 = getelementptr i8*, i8** %cmd.9262, i32 0
%.tmp9294 = getelementptr [17 x i8], [17 x i8]*@.str9293, i32 0, i32 0
%.tmp9295 = load i8*, i8** %outname
%.tmp9296 = load i8*, i8** %outname
%.tmp9297 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9292, i8* %.tmp9294, i8* %.tmp9295, i8* %.tmp9296)
%.tmp9298 = load i8*, i8** %cmd.9262
%.tmp9300 = getelementptr [2 x i8], [2 x i8]*@.str9299, i32 0, i32 0
%.tmp9301 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9298, i8* %.tmp9300)
%cc_proc.9302 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9301, %m0$.File.type** %cc_proc.9302
%.tmp9303 = load %m0$.File.type*, %m0$.File.type** %cc_proc.9302
%.tmp9304 = icmp eq %m0$.File.type* %.tmp9303, null
br i1 %.tmp9304, label %.if.true.9305, label %.if.false.9305
.if.true.9305:
%.tmp9306 = load %m0$.File.type*, %m0$.File.type** %stderr.9238
%.tmp9308 = getelementptr [28 x i8], [28 x i8]*@.str9307, i32 0, i32 0
%.tmp9309 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9306, i8* %.tmp9308)
ret i1 0
br label %.if.end.9305
.if.false.9305:
br label %.if.end.9305
.if.end.9305:
%.tmp9310 = load %m0$.File.type*, %m0$.File.type** %proc.9272
%.tmp9311 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9310)
%.tmp9312 = icmp ne i32 %.tmp9311, 0
br i1 %.tmp9312, label %.if.true.9313, label %.if.false.9313
.if.true.9313:
%.tmp9314 = load %m0$.File.type*, %m0$.File.type** %stderr.9238
%.tmp9316 = getelementptr [22 x i8], [22 x i8]*@.str9315, i32 0, i32 0
%.tmp9317 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9314, i8* %.tmp9316)
br label %.if.end.9313
.if.false.9313:
%.tmp9319 = getelementptr [32 x i8], [32 x i8]*@.str9318, i32 0, i32 0
%.tmp9320 = load i8*, i8** %outname
%.tmp9321 = call i32(i8*,...) @printf(i8* %.tmp9319, i8* %.tmp9320)
br label %.if.end.9313
.if.end.9313:
ret i1 1
}
%.Args.type = type {i8*,i8*,i8*,i8**}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9322 = load i32, i32* %argc
%.tmp9323 = load i8**, i8*** %argv
%.tmp9324 = call %.Args.type(i32,i8**) @check_args..Args.type.i.cpp(i32 %.tmp9322, i8** %.tmp9323)
%args.9325 = alloca %.Args.type
store %.Args.type %.tmp9324, %.Args.type* %args.9325
%.tmp9326 = getelementptr %.Args.type, %.Args.type* %args.9325, i32 0, i32 1
%.tmp9327 = load i8*, i8** %.tmp9326
%.tmp9328 = getelementptr %.Args.type, %.Args.type* %args.9325, i32 0, i32 2
%.tmp9329 = load i8*, i8** %.tmp9328
%.tmp9330 = call i1(i8*,i8*) @compile_file.b.cp.cp(i8* %.tmp9327, i8* %.tmp9329)
%.tmp9331 = icmp eq i1 %.tmp9330, 0
br i1 %.tmp9331, label %.if.true.9332, label %.if.false.9332
.if.true.9332:
ret i32 0
br label %.if.end.9332
.if.false.9332:
br label %.if.end.9332
.if.end.9332:
%.tmp9333 = getelementptr %.Args.type, %.Args.type* %args.9325, i32 0, i32 0
%.tmp9334 = load i8*, i8** %.tmp9333
%.tmp9336 = getelementptr [4 x i8], [4 x i8]*@.str9335, i32 0, i32 0
%.tmp9337 = call i32(i8*,i8*) @strcmp(i8* %.tmp9334, i8* %.tmp9336)
%.tmp9338 = icmp eq i32 %.tmp9337, 0
br i1 %.tmp9338, label %.if.true.9339, label %.if.false.9339
.if.true.9339:
%.tmp9341 = getelementptr [1 x i8], [1 x i8]*@.str9340, i32 0, i32 0
%cmd.9342 = alloca i8*
store i8* %.tmp9341, i8** %cmd.9342
%.tmp9343 = getelementptr i8*, i8** %cmd.9342, i32 0
%.tmp9345 = getelementptr [5 x i8], [5 x i8]*@.str9344, i32 0, i32 0
%.tmp9346 = getelementptr %.Args.type, %.Args.type* %args.9325, i32 0, i32 2
%.tmp9347 = load i8*, i8** %.tmp9346
%.tmp9348 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9343, i8* %.tmp9345, i8* %.tmp9347)
%.tmp9349 = load i8*, i8** %cmd.9342
%.tmp9350 = getelementptr %.Args.type, %.Args.type* %args.9325, i32 0, i32 3
%.tmp9351 = load i8**, i8*** %.tmp9350
%.tmp9352 = call i32(i8*,i8**) @execvp(i8* %.tmp9349, i8** %.tmp9351)
ret i32 %.tmp9352
br label %.if.end.9339
.if.false.9339:
br label %.if.end.9339
.if.end.9339:
ret i32 0
}
define %.Args.type @check_args..Args.type.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9354 = getelementptr [22 x i8], [22 x i8]*@.str9353, i32 0, i32 0
%tmpl.9355 = alloca i8*
store i8* %.tmp9354, i8** %tmpl.9355
%args.9356 = alloca %.Args.type
%.tmp9357 = getelementptr %.Args.type, %.Args.type* %args.9356, i32 0, i32 0
store i8* null, i8** %.tmp9357
%.tmp9358 = getelementptr %.Args.type, %.Args.type* %args.9356, i32 0, i32 1
store i8* null, i8** %.tmp9358
%.tmp9359 = getelementptr %.Args.type, %.Args.type* %args.9356, i32 0, i32 2
store i8* null, i8** %.tmp9359
%.tmp9360 = getelementptr %.Args.type, %.Args.type* %args.9356, i32 0, i32 3
store i8** null, i8*** %.tmp9360
%.tmp9361 = load i32, i32* %argc
%.tmp9362 = icmp slt i32 %.tmp9361, 2
br i1 %.tmp9362, label %.if.true.9363, label %.if.false.9363
.if.true.9363:
%.tmp9364 = load i8*, i8** %tmpl.9355
%.tmp9365 = load i8**, i8*** %argv
%.tmp9366 = getelementptr i8*, i8** %.tmp9365, i32 0
%.tmp9367 = load i8*, i8** %.tmp9366
%.tmp9368 = call i32(i8*,...) @printf(i8* %.tmp9364, i8* %.tmp9367)
call void(i32) @exit(i32 1)
br label %.if.end.9363
.if.false.9363:
br label %.if.end.9363
.if.end.9363:
%fp.9369 = alloca i32
store i32 1, i32* %fp.9369
%.tmp9370 = getelementptr %.Args.type, %.Args.type* %args.9356, i32 0, i32 0
%.tmp9372 = getelementptr [8 x i8], [8 x i8]*@.str9371, i32 0, i32 0
store i8* %.tmp9372, i8** %.tmp9370
%.tmp9373 = load i8**, i8*** %argv
%.tmp9374 = getelementptr i8*, i8** %.tmp9373, i32 1
%.tmp9375 = load i8*, i8** %.tmp9374
%.tmp9377 = getelementptr [4 x i8], [4 x i8]*@.str9376, i32 0, i32 0
%.tmp9378 = call i32(i8*,i8*) @strcmp(i8* %.tmp9375, i8* %.tmp9377)
%.tmp9379 = icmp eq i32 %.tmp9378, 0
br i1 %.tmp9379, label %.if.true.9380, label %.if.false.9380
.if.true.9380:
%.tmp9381 = getelementptr %.Args.type, %.Args.type* %args.9356, i32 0, i32 0
%.tmp9383 = getelementptr [4 x i8], [4 x i8]*@.str9382, i32 0, i32 0
store i8* %.tmp9383, i8** %.tmp9381
store i32 2, i32* %fp.9369
br label %.if.end.9380
.if.false.9380:
br label %.if.end.9380
.if.end.9380:
%.tmp9384 = load i32, i32* %argc
%.tmp9385 = load i32, i32* %fp.9369
%.tmp9386 = add i32 %.tmp9385, 1
%.tmp9387 = icmp slt i32 %.tmp9384, %.tmp9386
br i1 %.tmp9387, label %.if.true.9388, label %.if.false.9388
.if.true.9388:
%.tmp9389 = load i8*, i8** %tmpl.9355
%.tmp9390 = load i8**, i8*** %argv
%.tmp9391 = getelementptr i8*, i8** %.tmp9390, i32 0
%.tmp9392 = load i8*, i8** %.tmp9391
%.tmp9393 = call i32(i8*,...) @printf(i8* %.tmp9389, i8* %.tmp9392)
call void(i32) @exit(i32 1)
br label %.if.end.9388
.if.false.9388:
br label %.if.end.9388
.if.end.9388:
%.tmp9394 = getelementptr %.Args.type, %.Args.type* %args.9356, i32 0, i32 1
%.tmp9395 = load i32, i32* %fp.9369
%.tmp9396 = load i8**, i8*** %argv
%.tmp9397 = getelementptr i8*, i8** %.tmp9396, i32 %.tmp9395
%.tmp9398 = load i8*, i8** %.tmp9397
store i8* %.tmp9398, i8** %.tmp9394
%.tmp9399 = getelementptr %.Args.type, %.Args.type* %args.9356, i32 0, i32 1
%.tmp9400 = load i8*, i8** %.tmp9399
%.tmp9401 = call {i8*,i8*}(i8*) @m2$splitext.scpcp.cp(i8* %.tmp9400)
%ext.9402 = alloca {i8*,i8*}
store {i8*,i8*} %.tmp9401, {i8*,i8*}* %ext.9402
%.tmp9403 = getelementptr %.Args.type, %.Args.type* %args.9356, i32 0, i32 2
%.tmp9404 = getelementptr {i8*,i8*}, {i8*,i8*}* %ext.9402, i32 0, i32 0
%.tmp9405 = load i8*, i8** %.tmp9404
store i8* %.tmp9405, i8** %.tmp9403
%.tmp9406 = load i32, i32* %argc
%.tmp9407 = load i32, i32* %fp.9369
%.tmp9408 = sub i32 %.tmp9406, %.tmp9407
%.tmp9409 = add i32 %.tmp9408, 1
%ac.9410 = alloca i32
store i32 %.tmp9409, i32* %ac.9410
%.tmp9411 = getelementptr %.Args.type, %.Args.type* %args.9356, i32 0, i32 3
%.tmp9412 = load i32, i32* %ac.9410
%.tmp9413 = mul i32 8, %.tmp9412
%.tmp9414 = call i8*(i32) @malloc(i32 %.tmp9413)
%.tmp9415 = bitcast i8* %.tmp9414 to i8**
store i8** %.tmp9415, i8*** %.tmp9411
%.tmp9416 = getelementptr %.Args.type, %.Args.type* %args.9356, i32 0, i32 3
%.tmp9417 = load i8**, i8*** %.tmp9416
%.tmp9418 = getelementptr i8*, i8** %.tmp9417, i32 0
%.tmp9419 = getelementptr %.Args.type, %.Args.type* %args.9356, i32 0, i32 2
%.tmp9420 = load i8*, i8** %.tmp9419
store i8* %.tmp9420, i8** %.tmp9418
%i.9422 = alloca i32
store i32 0, i32* %i.9422
br label %.for.start.9421
.for.start.9421:
%.tmp9423 = load i32, i32* %i.9422
%.tmp9424 = load i32, i32* %argc
%.tmp9425 = load i32, i32* %fp.9369
%.tmp9426 = sub i32 %.tmp9424, %.tmp9425
%.tmp9427 = icmp slt i32 %.tmp9423, %.tmp9426
br i1 %.tmp9427, label %.for.continue.9421, label %.for.end.9421
.for.continue.9421:
%.tmp9428 = getelementptr %.Args.type, %.Args.type* %args.9356, i32 0, i32 3
%.tmp9429 = load i32, i32* %i.9422
%.tmp9430 = add i32 %.tmp9429, 1
%.tmp9431 = load i8**, i8*** %.tmp9428
%.tmp9432 = getelementptr i8*, i8** %.tmp9431, i32 %.tmp9430
%.tmp9433 = load i32, i32* %fp.9369
%.tmp9434 = load i32, i32* %i.9422
%.tmp9435 = add i32 %.tmp9433, %.tmp9434
%.tmp9436 = add i32 %.tmp9435, 1
%.tmp9437 = load i8**, i8*** %argv
%.tmp9438 = getelementptr i8*, i8** %.tmp9437, i32 %.tmp9436
%.tmp9439 = load i8*, i8** %.tmp9438
store i8* %.tmp9439, i8** %.tmp9432
%.tmp9440 = load i32, i32* %i.9422
%.tmp9441 = add i32 %.tmp9440, 1
store i32 %.tmp9441, i32* %i.9422
br label %.for.start.9421
.for.end.9421:
%.tmp9442 = load %.Args.type, %.Args.type* %args.9356
ret %.Args.type %.tmp9442
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
@.str920 = constant [1 x i8] c"\00"
@.str929 = constant [5 x i8] c"%s%s\00"
@.str941 = constant [1 x i8] c"\00"
@.str948 = constant [24 x i8] c"[%s %d:%d] error: %s\0A%s\00"
@.str1013 = constant [2 x i8] c"(\00"
@.str1033 = constant [2 x i8] c"|\00"
@.str1053 = constant [2 x i8] c")\00"
@.str1062 = constant [4 x i8] c"EOF\00"
@.str1079 = constant [2 x i8] c"|\00"
@.str1088 = constant [2 x i8] c")\00"
@.str1094 = constant [48 x i8] c"[%d:%d] malformed grammar, expected | got '%s'\0A\00"
@.str1117 = constant [2 x i8] c"|\00"
@.str1134 = constant [2 x i8] c")\00"
@.str1140 = constant [22 x i8] c"open brace not closed\00"
@.str1154 = constant [2 x i8] c"+\00"
@.str1173 = constant [2 x i8] c"*\00"
@.str1192 = constant [2 x i8] c"?\00"
@.str1213 = constant [2 x i8] c"(\00"
@.str1222 = constant [5 x i8] c"WORD\00"
@.str1244 = constant [5 x i8] c"WORD\00"
@.str1251 = constant [7 x i8] c"STRING\00"
@.str1293 = constant [7 x i8] c"STRING\00"
@.str1318 = constant [17 x i8] c"rule name: '%s'\0A\00"
@.str1327 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1359 = constant [5 x i8] c"WORD\00"
@.str1364 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1378 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1392 = constant [2 x i8] c"[\00"
@.str1403 = constant [2 x i8] c":\00"
@.str1424 = constant [2 x i8] c":\00"
@.str1435 = constant [1 x i8] c"\00"
@.str1439 = constant [35 x i8] c"expected : after rule name, got %s\00"
@.str1490 = constant [4 x i8] c"EOF\00"
@.str1499 = constant [3 x i8] c"NL\00"
@.str1666 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1723 = constant [7 x i8] c"(null)\00"
@.str1725 = constant [1 x i8] c"\00"
@.str1729 = constant [43 x i8] c"Unable to match token by value: %s != \22%s\22\00"
@.str1787 = constant [13 x i8] c"%s: %s != %s\00"
@.str1790 = constant [30 x i8] c"unable to match token by type\00"
@.str1851 = constant [30 x i8] c"unable to retrieve alias rule\00"
@.str1874 = constant [41 x i8] c"parser.bn: query matcher not implemented\00"
@.str2014 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str2031 = constant [4 x i8] c"EOF\00"
@.str2045 = constant [26 x i8] c"syntax parsing ended here\00"
@.str2080 = constant [2 x i8] c"\0A\00"
@.str2089 = constant [3 x i8] c"  \00"
@.str2098 = constant [7 x i8] c"(null)\00"
@.str2102 = constant [2 x i8] c"{\00"
@.str2108 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str2117 = constant [12 x i8] c"\22value\22: %s\00"
@.str2126 = constant [11 x i8] c"\22line\22: %d\00"
@.str2135 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str2144 = constant [9 x i8] c"\22next\22: \00"
@.str2156 = constant [13 x i8] c"\22children\22: \00"
@.str2169 = constant [2 x i8] c"}\00"
@.str2173 = constant [1886 x i8] c"
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
@.str2176 = constant [1885 x i8] c"%%%1$s.tmp0 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
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
@.str2182 = constant [1 x i8] c"\00"
@.str2198 = constant [6 x i8] c"%s\5C22\00"
@.str2223 = constant [6 x i8] c"%s\5C0A\00"
@.str2237 = constant [6 x i8] c"%s\5C5C\00"
@.str2253 = constant [8 x i8] c"%s\5C%c%c\00"
@.str2271 = constant [5 x i8] c"%s%c\00"
@.str2280 = constant [5 x i8] c"%s%c\00"
@.str2291 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2328 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2333 = constant [3 x i8] c"%d\00"
@.str2341 = constant [6 x i8] c"'\5C%x'\00"
@.str2346 = constant [3 x i8] c"%d\00"
@.str2354 = constant [6 x i8] c"'\5C%c'\00"
@.str2361 = constant [3 x i8] c"10\00"
@.str2368 = constant [5 x i8] c"'%c'\00"
@.str2373 = constant [3 x i8] c"%d\00"
@.str2422 = constant [16 x i8] c"mono_assignable\00"
@.str2433 = constant [9 x i8] c"operator\00"
@.str2470 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2517 = constant [2 x i8] c"+\00"
@.str2524 = constant [2 x i8] c"-\00"
@.str2533 = constant [2 x i8] c"*\00"
@.str2540 = constant [2 x i8] c"/\00"
@.str2548 = constant [2 x i8] c"%\00"
@.str2557 = constant [3 x i8] c"==\00"
@.str2564 = constant [3 x i8] c"!=\00"
@.str2573 = constant [3 x i8] c">=\00"
@.str2580 = constant [3 x i8] c"<=\00"
@.str2589 = constant [2 x i8] c">\00"
@.str2596 = constant [2 x i8] c"<\00"
@.str2605 = constant [2 x i8] c"&\00"
@.str2613 = constant [2 x i8] c"|\00"
@.str2618 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
@.str2661 = constant [12 x i8] c"COFFEE_ROOT\00"
@.str2668 = constant [5 x i8] c"HOME\00"
@.str2673 = constant [11 x i8] c"%s/.coffee\00"
@.str2761 = constant [1 x i8] c"\00"
@.str2807 = constant [5 x i8] c"%c%s\00"
@.str2820 = constant [8 x i8] c"nullptr\00"
@.str2827 = constant [8 x i8] c"nullptr\00"
@.str2836 = constant [4 x i8] c"ptr\00"
@.str2843 = constant [4 x i8] c"ptr\00"
@.str2862 = constant [7 x i8] c".tmp%d\00"
@.str2962 = constant [1 x i8] c"\00"
@.str3004 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str3022 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str3041 = constant [6 x i8] c"start\00"
@.str3118 = constant [6 x i8] c"start\00"
@.str3125 = constant [29 x i8] c"Expecting 'start' expression\00"
@.str3128 = constant [7 x i8] c"global\00"
@.str3139 = constant [13 x i8] c"head_comment\00"
@.str3178 = constant [1 x i8] c"\00"
@.str3202 = constant [7 x i8] c"string\00"
@.str3210 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3230 = constant [7 x i8] c"extern\00"
@.str3244 = constant [15 x i8] c"declare %s %s(\00"
@.str3280 = constant [3 x i8] c", \00"
@.str3286 = constant [3 x i8] c"%s\00"
@.str3298 = constant [3 x i8] c")\0A\00"
@.str3315 = constant [5 x i8] c"%s%s\00"
@.str3323 = constant [9 x i8] c"function\00"
@.str3329 = constant [5 x i8] c"main\00"
@.str3344 = constant [6 x i8] c"%s.%s\00"
@.str3365 = constant [3 x i8] c"NL\00"
@.str3373 = constant [7 x i8] c"global\00"
@.str3381 = constant [11 x i8] c"assignable\00"
@.str3412 = constant [9 x i8] c"variable\00"
@.str3424 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3439 = constant [10 x i8] c"typealias\00"
@.str3461 = constant [11 x i8] c"%s.%s.type\00"
@.str3473 = constant [10 x i8] c"typealias\00"
@.str3495 = constant [5 x i8] c"type\00"
@.str3525 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3538 = constant [7 x i8] c"extern\00"
@.str3556 = constant [7 x i8] c"extern\00"
@.str3597 = constant [7 x i8] c"extern\00"
@.str3609 = constant [9 x i8] c"function\00"
@.str3618 = constant [9 x i8] c"function\00"
@.str3657 = constant [14 x i8] c"define %s %s(\00"
@.str3686 = constant [3 x i8] c", \00"
@.str3692 = constant [5 x i8] c"type\00"
@.str3708 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3723 = constant [5 x i8] c") {\0A\00"
@.str3727 = constant [9 x i8] c"function\00"
@.str3736 = constant [6 x i8] c"block\00"
@.str3751 = constant [3 x i8] c"}\0A\00"
@.str3757 = constant [7 x i8] c"import\00"
@.str3813 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str3874 = constant [5 x i8] c"m%d$\00"
@.str3925 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3934 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3966 = constant [9 x i8] c"variable\00"
@.str3971 = constant [5 x i8] c"type\00"
@.str4003 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4016 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str4028 = constant [6 x i8] c"block\00"
@.str4035 = constant [12 x i8] c"expressions\00"
@.str4066 = constant [7 x i8] c"struct\00"
@.str4071 = constant [7 x i8] c"WhAT!\0A\00"
@.str4111 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4123 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4149 = constant [7 x i8] c"struct\00"
@.str4154 = constant [7 x i8] c"WhAT!\0A\00"
@.str4185 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4197 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4222 = constant [7 x i8] c"sizeof\00"
@.str4228 = constant [8 x i8] c"fn_args\00"
@.str4235 = constant [11 x i8] c"assignable\00"
@.str4263 = constant [4 x i8] c"int\00"
@.str4276 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4285 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4296 = constant [7 x i8] c"append\00"
@.str4302 = constant [8 x i8] c"fn_args\00"
@.str4309 = constant [11 x i8] c"assignable\00"
@.str4316 = constant [11 x i8] c"assignable\00"
@.str4340 = constant [5 x i8] c".b%d\00"
@.str4374 = constant [8 x i8] c"realloc\00"
@.str4383 = constant [9 x i8] c"function\00"
@.str4396 = constant [4 x i8] c"ptr\00"
@.str4413 = constant [4 x i8] c"chr\00"
@.str4430 = constant [4 x i8] c"ptr\00"
@.str4451 = constant [4 x i8] c"chr\00"
@.str4472 = constant [4 x i8] c"int\00"
@.str4475 = constant [8 x i8] c"realloc\00"
@.str4477 = constant [7 x i8] c"extern\00"
@.str4484 = constant [4 x i8] c"len\00"
@.str4490 = constant [8 x i8] c"fn_args\00"
@.str4497 = constant [11 x i8] c"assignable\00"
@.str4505 = constant [1 x i8] c"\00"
@.str4521 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str4542 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str4548 = constant [1 x i8] c"\00"
@.str4554 = constant [6 x i8] c"%s.bn\00"
@.str4559 = constant [9 x i8] c"%s/%s.bn\00"
@.str4583 = constant [35 x i8] c"unable to compile function address\00"
@.str4589 = constant [8 x i8] c"fn_args\00"
@.str4593 = constant [1 x i8] c"\00"
@.str4602 = constant [4 x i8] c"ptr\00"
@.str4622 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str4646 = constant [11 x i8] c"assignable\00"
@.str4670 = constant [11 x i8] c"assignable\00"
@.str4682 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4700 = constant [5 x i8] c"%s, \00"
@.str4725 = constant [7 x i8] c"vararg\00"
@.str4738 = constant [1 x i8] c"\00"
@.str4742 = constant [58 x i8] c"types.Type for argument %d does not match: '%s', got '%s'\00"
@.str4759 = constant [8 x i8] c"%s%s %s\00"
@.str4776 = constant [7 x i8] c"vararg\00"
@.str4787 = constant [11 x i8] c"assignable\00"
@.str4796 = constant [7 x i8] c"vararg\00"
@.str4802 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str4838 = constant [7 x i8] c"vararg\00"
@.str4849 = constant [42 x i8] c"Function '%s' takes %d arguments, 0 given\00"
@.str4867 = constant [5 x i8] c"void\00"
@.str4875 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str4907 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str4933 = constant [7 x i8] c"return\00"
@.str4945 = constant [3 x i8] c"NL\00"
@.str4963 = constant [11 x i8] c"ret %s %s\0A\00"
@.str4976 = constant [10 x i8] c"ret void\0A\00"
@.str4980 = constant [3 x i8] c"NL\00"
@.str4986 = constant [8 x i8] c"fn_call\00"
@.str4997 = constant [12 x i8] c"declaration\00"
@.str5006 = constant [11 x i8] c"assignment\00"
@.str5014 = constant [11 x i8] c"assignable\00"
@.str5042 = constant [1 x i8] c"\00"
@.str5046 = constant [37 x i8] c"cannot assign type '%s' to type '%s'\00"
@.str5075 = constant [4 x i8] c"ptr\00"
@.str5084 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5094 = constant [9 x i8] c"if_block\00"
@.str5102 = constant [9 x i8] c"for_loop\00"
@.str5110 = constant [8 x i8] c"keyword\00"
@.str5127 = constant [6 x i8] c"break\00"
@.str5138 = constant [4 x i8] c"for\00"
@.str5146 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5157 = constant [48 x i8] c"'break' keyword used outside of 'for' statement\00"
@.str5164 = constant [9 x i8] c"continue\00"
@.str5175 = constant [4 x i8] c"for\00"
@.str5183 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5194 = constant [51 x i8] c"'continue' keyword used outside of 'for' statement\00"
@.str5198 = constant [40 x i8] c"Keyword '%s': behaviour not implemented\00"
@.str5208 = constant [9 x i8] c"function\00"
@.str5217 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str5226 = constant [4 x i8] c"ptr\00"
@.str5235 = constant [4 x i8] c"chr\00"
@.str5246 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5255 = constant [9 x i8] c"function\00"
@.str5268 = constant [5 x i8] c"void\00"
@.str5298 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5300 = constant [7 x i8] c"extern\00"
@.str5308 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5317 = constant [9 x i8] c"function\00"
@.str5332 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5334 = constant [7 x i8] c"extern\00"
@.str5342 = constant [5 x i8] c"mmap\00"
@.str5351 = constant [9 x i8] c"function\00"
@.str5377 = constant [4 x i8] c"int\00"
@.str5389 = constant [4 x i8] c"int\00"
@.str5401 = constant [4 x i8] c"int\00"
@.str5413 = constant [4 x i8] c"int\00"
@.str5425 = constant [4 x i8] c"int\00"
@.str5431 = constant [5 x i8] c"mmap\00"
@.str5433 = constant [7 x i8] c"extern\00"
@.str5439 = constant [5 x i8] c"WORD\00"
@.str5462 = constant [9 x i8] c"function\00"
@.str5486 = constant [4 x i8] c"ptr\00"
@.str5495 = constant [7 x i8] c"struct\00"
@.str5509 = constant [1 x i8] c"\00"
@.str5513 = constant [5 x i8] c"@.%d\00"
@.str5527 = constant [101 x i8] c"%%.tmem%d = call i8*(i8*,i32,i32,i32,i32,i32) @mmap(i8* null, i32 72, i32 7, i32 34, i32 -1, i32 0)\0A\00"
@.str5534 = constant [100 x i8] c"call void(i8*,i8*,i8*) @llvm.init.trampoline(i8* %%.tmem%d, i8* bitcast (%s* %s to i8*), i8* null)\0A\00"
@.str5545 = constant [66 x i8] c"%%.trmp%d = call i8*(i8*) @llvm.adjust.trampoline(i8* %%.tmem%d)\0A\00"
@.str5553 = constant [35 x i8] c"%s = bitcast i8* %%.trmp%d to %s*\0A\00"
@.str5574 = constant [14 x i8] c"define %s %s(\00"
@.str5582 = constant [9 x i8] c"function\00"
@.str5589 = constant [13 x i8] c"%s nest %%.0\00"
@.str5616 = constant [3 x i8] c", \00"
@.str5622 = constant [5 x i8] c"type\00"
@.str5638 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str5653 = constant [5 x i8] c") {\0A\00"
@.str5661 = constant [6 x i8] c"block\00"
@.str5674 = constant [3 x i8] c"}\0A\00"
@.str5700 = constant [12 x i8] c"expressions\00"
@.str5714 = constant [3 x i8] c"NL\00"
@.str5731 = constant [7 x i8] c"return\00"
@.str5739 = constant [5 x i8] c"void\00"
@.str5750 = constant [21 x i8] c"Missing return value\00"
@.str5755 = constant [10 x i8] c"ret void\0A\00"
@.str5772 = constant [14 x i8] c".for.start.%d\00"
@.str5777 = constant [12 x i8] c".for.end.%d\00"
@.str5782 = constant [4 x i8] c"for\00"
@.str5789 = constant [12 x i8] c"declaration\00"
@.str5800 = constant [11 x i8] c"assignment\00"
@.str5810 = constant [9 x i8] c"OPERATOR\00"
@.str5817 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str5828 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str5835 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str5842 = constant [9 x i8] c"OPERATOR\00"
@.str5853 = constant [9 x i8] c"OPERATOR\00"
@.str5860 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str5869 = constant [9 x i8] c"OPERATOR\00"
@.str5874 = constant [6 x i8] c"block\00"
@.str5879 = constant [11 x i8] c"else_block\00"
@.str5889 = constant [13 x i8] c".for.else.%d\00"
@.str5896 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str5911 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str5930 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5940 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str5947 = constant [6 x i8] c"block\00"
@.str5956 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5963 = constant [5 x i8] c"%s:\0A\00"
@.str5977 = constant [5 x i8] c"type\00"
@.str5992 = constant [11 x i8] c"assignable\00"
@.str6007 = constant [9 x i8] c"variable\00"
@.str6012 = constant [5 x i8] c"WORD\00"
@.str6021 = constant [31 x i8] c"unable to get declaration name\00"
@.str6041 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6053 = constant [6 x i8] c"%s.%d\00"
@.str6106 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str6123 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str6135 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6176 = constant [4 x i8] c"int\00"
@.str6183 = constant [4 x i8] c"chr\00"
@.str6191 = constant [5 x i8] c"bool\00"
@.str6200 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str6209 = constant [4 x i8] c"ptr\00"
@.str6217 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6220 = constant [5 x i8] c"null\00"
@.str6228 = constant [7 x i8] c"struct\00"
@.str6249 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6269 = constant [10 x i8] c"typealias\00"
@.str6292 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6311 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str6328 = constant [11 x i8] c"assignable\00"
@.str6345 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str6360 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str6367 = constant [6 x i8] c"block\00"
@.str6376 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6383 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str6390 = constant [11 x i8] c"elif_block\00"
@.str6402 = constant [11 x i8] c"else_block\00"
@.str6412 = constant [6 x i8] c"block\00"
@.str6422 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6429 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str6450 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str6459 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str6493 = constant [1 x i8] c"\00"
@.str6504 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6524 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6549 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str6570 = constant [7 x i8] c"module\00"
@.str6623 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str6660 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str6668 = constant [9 x i8] c"function\00"
@.str6675 = constant [7 x i8] c"extern\00"
@.str6687 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str6708 = constant [9 x i8] c"variable\00"
@.str6730 = constant [4 x i8] c"ptr\00"
@.str6749 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str6773 = constant [10 x i8] c"typealias\00"
@.str6784 = constant [7 x i8] c"struct\00"
@.str6790 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str6842 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str6863 = constant [9 x i8] c"variable\00"
@.str6874 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6895 = constant [9 x i8] c"variable\00"
@.str6903 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str6917 = constant [17 x i8] c"addr_destination\00"
@.str6924 = constant [16 x i8] c"mono_assignable\00"
@.str6932 = constant [11 x i8] c"assignable\00"
@.str6946 = constant [12 x i8] c"destination\00"
@.str6951 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str6979 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str6998 = constant [7 x i8] c"module\00"
@.str7020 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str7091 = constant [6 x i8] c"slice\00"
@.str7104 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str7146 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str7167 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str7191 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str7214 = constant [16 x i8] c"mono_assignable\00"
@.str7240 = constant [5 x i8] c"cast\00"
@.str7250 = constant [5 x i8] c"type\00"
@.str7275 = constant [8 x i8] c"bitcast\00"
@.str7290 = constant [6 x i8] c"slice\00"
@.str7295 = constant [48 x i8] c"Casting array to slices is not implemented yet\0A\00"
@.str7303 = constant [4 x i8] c"ptr\00"
@.str7310 = constant [4 x i8] c"ptr\00"
@.str7329 = constant [4 x i8] c"i%d\00"
@.str7334 = constant [4 x i8] c"i%d\00"
@.str7342 = constant [5 x i8] c"sext\00"
@.str7344 = constant [6 x i8] c"trunc\00"
@.str7349 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str7369 = constant [16 x i8] c"mono_assignable\00"
@.str7431 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str7454 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str7461 = constant [2 x i8] c"+\00"
@.str7466 = constant [4 x i8] c"add\00"
@.str7471 = constant [2 x i8] c"-\00"
@.str7476 = constant [4 x i8] c"sub\00"
@.str7481 = constant [2 x i8] c"*\00"
@.str7486 = constant [4 x i8] c"mul\00"
@.str7491 = constant [2 x i8] c"/\00"
@.str7496 = constant [5 x i8] c"sdiv\00"
@.str7501 = constant [3 x i8] c"==\00"
@.str7506 = constant [8 x i8] c"icmp eq\00"
@.str7511 = constant [3 x i8] c"!=\00"
@.str7516 = constant [8 x i8] c"icmp ne\00"
@.str7521 = constant [2 x i8] c">\00"
@.str7526 = constant [9 x i8] c"icmp sgt\00"
@.str7531 = constant [2 x i8] c"<\00"
@.str7536 = constant [9 x i8] c"icmp slt\00"
@.str7541 = constant [2 x i8] c"&\00"
@.str7546 = constant [4 x i8] c"and\00"
@.str7551 = constant [2 x i8] c"|\00"
@.str7556 = constant [3 x i8] c"or\00"
@.str7561 = constant [3 x i8] c">=\00"
@.str7566 = constant [9 x i8] c"icmp sge\00"
@.str7571 = constant [3 x i8] c"<=\00"
@.str7576 = constant [9 x i8] c"icmp sle\00"
@.str7581 = constant [2 x i8] c"%\00"
@.str7586 = constant [5 x i8] c"srem\00"
@.str7590 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str7597 = constant [4 x i8] c"add\00"
@.str7604 = constant [3 x i8] c"==\00"
@.str7611 = constant [3 x i8] c"!=\00"
@.str7619 = constant [2 x i8] c"|\00"
@.str7627 = constant [2 x i8] c"&\00"
@.str7635 = constant [2 x i8] c">\00"
@.str7643 = constant [2 x i8] c"<\00"
@.str7651 = constant [3 x i8] c">=\00"
@.str7659 = constant [3 x i8] c"<=\00"
@.str7667 = constant [5 x i8] c"bool\00"
@.str7671 = constant [4 x i8] c"int\00"
@.str7685 = constant [7 x i8] c"NUMBER\00"
@.str7699 = constant [4 x i8] c"int\00"
@.str7713 = constant [5 x i8] c"WORD\00"
@.str7723 = constant [5 x i8] c"null\00"
@.str7730 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str7744 = constant [5 x i8] c"null\00"
@.str7753 = constant [8 x i8] c"nullptr\00"
@.str7760 = constant [17 x i8] c"addr_destination\00"
@.str7772 = constant [12 x i8] c"destination\00"
@.str7816 = constant [4 x i8] c"ptr\00"
@.str7835 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str7849 = constant [9 x i8] c"function\00"
@.str7864 = constant [4 x i8] c"ptr\00"
@.str7872 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str7886 = constant [8 x i8] c"boolean\00"
@.str7900 = constant [5 x i8] c"bool\00"
@.str7909 = constant [6 x i8] c"false\00"
@.str7916 = constant [2 x i8] c"0\00"
@.str7920 = constant [2 x i8] c"1\00"
@.str7927 = constant [8 x i8] c"fn_call\00"
@.str7944 = constant [7 x i8] c"STRING\00"
@.str7970 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str7986 = constant [4 x i8] c"ptr\00"
@.str7999 = constant [4 x i8] c"chr\00"
@.str8006 = constant [4 x i8] c"CHR\00"
@.str8022 = constant [2 x i8] c"0\00"
@.str8038 = constant [22 x i8] c"Invalid character: %s\00"
@.str8054 = constant [4 x i8] c"chr\00"
@.str8058 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str8086 = constant [22 x i8] c"called 'abbr' on null\00"
@.str8092 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str8097 = constant [4 x i8] c"int\00"
@.str8102 = constant [2 x i8] c"i\00"
@.str8107 = constant [5 x i8] c"bool\00"
@.str8112 = constant [2 x i8] c"b\00"
@.str8117 = constant [5 x i8] c"void\00"
@.str8122 = constant [2 x i8] c"v\00"
@.str8127 = constant [4 x i8] c"chr\00"
@.str8132 = constant [2 x i8] c"c\00"
@.str8137 = constant [4 x i8] c"ptr\00"
@.str8144 = constant [4 x i8] c"%sp\00"
@.str8155 = constant [10 x i8] c"typealias\00"
@.str8166 = constant [7 x i8] c"struct\00"
@.str8171 = constant [2 x i8] c"s\00"
@.str8182 = constant [5 x i8] c"%s%s\00"
@.str8195 = constant [9 x i8] c"function\00"
@.str8200 = constant [2 x i8] c"f\00"
@.str8205 = constant [6 x i8] c"error\00"
@.str8210 = constant [2 x i8] c"?\00"
@.str8212 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str8224 = constant [7 x i8] c".str%d\00"
@.str8239 = constant [6 x i8] c"array\00"
@.str8252 = constant [4 x i8] c"chr\00"
@.str8273 = constant [3 x i8] c"%d\00"
@.str8280 = constant [7 x i8] c"string\00"
@.str8316 = constant [7 x i8] c"module\00"
@.str8367 = constant [4 x i8] c"%s\0A\00"
@.str8422 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str8428 = constant [2 x i8] c"?\00"
@.str8434 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str8440 = constant [4 x i8] c"int\00"
@.str8445 = constant [4 x i8] c"i32\00"
@.str8450 = constant [5 x i8] c"void\00"
@.str8455 = constant [5 x i8] c"void\00"
@.str8460 = constant [5 x i8] c"bool\00"
@.str8465 = constant [3 x i8] c"i1\00"
@.str8470 = constant [8 x i8] c"nullptr\00"
@.str8475 = constant [4 x i8] c"ptr\00"
@.str8480 = constant [4 x i8] c"chr\00"
@.str8485 = constant [3 x i8] c"i8\00"
@.str8490 = constant [9 x i8] c"function\00"
@.str8496 = constant [4 x i8] c"%s(\00"
@.str8522 = constant [4 x i8] c"%s,\00"
@.str8527 = constant [5 x i8] c"%s%s\00"
@.str8538 = constant [4 x i8] c"%s)\00"
@.str8546 = constant [4 x i8] c"ptr\00"
@.str8552 = constant [4 x i8] c"%s*\00"
@.str8564 = constant [7 x i8] c"struct\00"
@.str8570 = constant [2 x i8] c"{\00"
@.str8587 = constant [4 x i8] c"%s,\00"
@.str8592 = constant [5 x i8] c"%s%s\00"
@.str8603 = constant [4 x i8] c"%s}\00"
@.str8611 = constant [6 x i8] c"array\00"
@.str8617 = constant [10 x i8] c"[%s x %s]\00"
@.str8636 = constant [10 x i8] c"typealias\00"
@.str8642 = constant [5 x i8] c"%%%s\00"
@.str8652 = constant [7 x i8] c"vararg\00"
@.str8657 = constant [4 x i8] c"...\00"
@.str8662 = constant [6 x i8] c"error\00"
@.str8667 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str8743 = constant [9 x i8] c"function\00"
@.str8761 = constant [5 x i8] c"WORD\00"
@.str8818 = constant [10 x i8] c"fn_params\00"
@.str8832 = constant [11 x i8] c"basic_type\00"
@.str8853 = constant [13 x i8] c"type_trailer\00"
@.str8862 = constant [9 x i8] c"function\00"
@.str8878 = constant [15 x i8] c"type_fn_params\00"
@.str8919 = constant [4 x i8] c"ptr\00"
@.str8931 = constant [10 x i8] c"structdef\00"
@.str8938 = constant [7 x i8] c"struct\00"
@.str8945 = constant [5 x i8] c"type\00"
@.str8976 = constant [5 x i8] c"type\00"
@.str9003 = constant [5 x i8] c"type\00"
@.str9009 = constant [12 x i8] c"dotted_name\00"
@.str9023 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str9036 = constant [6 x i8] c"error\00"
@.str9041 = constant [10 x i8] c"typealias\00"
@.str9065 = constant [4 x i8] c"str\00"
@.str9072 = constant [4 x i8] c"ptr\00"
@.str9081 = constant [4 x i8] c"chr\00"
@.str9086 = constant [5 x i8] c"WORD\00"
@.str9099 = constant [4 x i8] c"...\00"
@.str9106 = constant [7 x i8] c"vararg\00"
@.str9110 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str9131 = constant [2 x i8] c"*\00"
@.str9140 = constant [4 x i8] c"ptr\00"
@.str9149 = constant [2 x i8] c"[\00"
@.str9159 = constant [2 x i8] c"]\00"
@.str9168 = constant [7 x i8] c"struct\00"
@.str9172 = constant [6 x i8] c"slice\00"
@.str9178 = constant [4 x i8] c"ptr\00"
@.str9182 = constant [6 x i8] c"c_arr\00"
@.str9194 = constant [4 x i8] c"int\00"
@.str9198 = constant [4 x i8] c"len\00"
@.str9207 = constant [4 x i8] c"int\00"
@.str9211 = constant [4 x i8] c"cap\00"
@.str9222 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str9235 = constant [2 x i8] c"w\00"
@.str9251 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str9260 = constant [1 x i8] c"\00"
@.str9264 = constant [32 x i8] c"tee debug.ll | llc - -o debug.s\00"
@.str9269 = constant [2 x i8] c"w\00"
@.str9281 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9289 = constant [24 x i8] c"error on llc execution\0A\00"
@.str9293 = constant [17 x i8] c"cc debug.s -o %s\00"
@.str9299 = constant [2 x i8] c"w\00"
@.str9307 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9315 = constant [22 x i8] c"error on cc execution\00"
@.str9318 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str9335 = constant [4 x i8] c"run\00"
@.str9340 = constant [1 x i8] c"\00"
@.str9344 = constant [5 x i8] c"./%s\00"
@.str9353 = constant [22 x i8] c"Usage: %s <filename>\0A\00"
@.str9371 = constant [8 x i8] c"compile\00"
@.str9376 = constant [4 x i8] c"run\00"
@.str9382 = constant [4 x i8] c"run\00"
