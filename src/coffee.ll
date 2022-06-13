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
%m980$.Node.type = type {i8*,i8*,i8*,i32,i32,%m980$.Node.type*,%m980$.Node.type*,%m980$.Node.type*}
define %m980$.Node.type* @m980$new_node.m980$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg) {
%t = alloca %m297$.Token.type*
store %m297$.Token.type* %.t.arg, %m297$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
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
%.tmp1595 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1594, i32 0, i32 2
%.tmp1596 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1597 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1596, i32 0, i32 4
%.tmp1598 = load i8*, i8** %.tmp1597
store i8* %.tmp1598, i8** %.tmp1595
%.tmp1599 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
%.tmp1600 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1599, i32 0, i32 4
%.tmp1601 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1602 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1601, i32 0, i32 3
%.tmp1603 = load i32, i32* %.tmp1602
store i32 %.tmp1603, i32* %.tmp1600
%.tmp1604 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
%.tmp1605 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1604, i32 0, i32 5
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1605
%.tmp1606 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
%.tmp1607 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1606, i32 0, i32 7
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1607
%.tmp1608 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
%.tmp1609 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1608, i32 0, i32 6
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1609
%.tmp1610 = load %m980$.Node.type*, %m980$.Node.type** %node.1582
ret %m980$.Node.type* %.tmp1610
}
define void @m980$child_append.v.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.parent.arg, %m980$.Node.type* %.child.arg) {
%parent = alloca %m980$.Node.type*
store %m980$.Node.type* %.parent.arg, %m980$.Node.type** %parent
%child = alloca %m980$.Node.type*
store %m980$.Node.type* %.child.arg, %m980$.Node.type** %child
%.tmp1611 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1612 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1611, i32 0, i32 6
%.tmp1613 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1612
%.tmp1614 = icmp eq %m980$.Node.type* %.tmp1613, null
br i1 %.tmp1614, label %.if.true.1615, label %.if.false.1615
.if.true.1615:
%.tmp1616 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1617 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1616, i32 0, i32 6
%.tmp1618 = load %m980$.Node.type*, %m980$.Node.type** %child
store %m980$.Node.type* %.tmp1618, %m980$.Node.type** %.tmp1617
br label %.if.end.1615
.if.false.1615:
%.tmp1619 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1620 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1619, i32 0, i32 6
%.tmp1621 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1620
%c.1622 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp1621, %m980$.Node.type** %c.1622
br label %.for.start.1623
.for.start.1623:
%.tmp1624 = load %m980$.Node.type*, %m980$.Node.type** %c.1622
%.tmp1625 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1624, i32 0, i32 7
%.tmp1626 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1625
%.tmp1627 = icmp ne %m980$.Node.type* %.tmp1626, null
br i1 %.tmp1627, label %.for.continue.1623, label %.for.end.1623
.for.continue.1623:
%.tmp1628 = load %m980$.Node.type*, %m980$.Node.type** %c.1622
%.tmp1629 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1628, i32 0, i32 7
%.tmp1630 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1629
store %m980$.Node.type* %.tmp1630, %m980$.Node.type** %c.1622
br label %.for.start.1623
.for.end.1623:
%.tmp1631 = load %m980$.Node.type*, %m980$.Node.type** %c.1622
%.tmp1632 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1631, i32 0, i32 7
%.tmp1633 = load %m980$.Node.type*, %m980$.Node.type** %child
store %m980$.Node.type* %.tmp1633, %m980$.Node.type** %.tmp1632
br label %.if.end.1615
.if.end.1615:
%.tmp1634 = load %m980$.Node.type*, %m980$.Node.type** %child
%.tmp1635 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1634, i32 0, i32 7
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1635
ret void
}
define void @m980$child_pop.v.m980$.Node.typep(%m980$.Node.type* %.parent.arg) {
%parent = alloca %m980$.Node.type*
store %m980$.Node.type* %.parent.arg, %m980$.Node.type** %parent
%.tmp1636 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1637 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1636, i32 0, i32 6
%.tmp1638 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1637
%.tmp1639 = icmp eq %m980$.Node.type* %.tmp1638, null
br i1 %.tmp1639, label %.if.true.1640, label %.if.false.1640
.if.true.1640:
ret void
br label %.if.end.1640
.if.false.1640:
br label %.if.end.1640
.if.end.1640:
%.tmp1641 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1642 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1641, i32 0, i32 6
%.tmp1643 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1642
%c.1644 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp1643, %m980$.Node.type** %c.1644
%.tmp1645 = load %m980$.Node.type*, %m980$.Node.type** %c.1644
%.tmp1646 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1645, i32 0, i32 7
%.tmp1647 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1646
%.tmp1648 = icmp eq %m980$.Node.type* %.tmp1647, null
br i1 %.tmp1648, label %.if.true.1649, label %.if.false.1649
.if.true.1649:
%.tmp1650 = load %m980$.Node.type*, %m980$.Node.type** %c.1644
%.tmp1651 = bitcast %m980$.Node.type* %.tmp1650 to i8*
call void(i8*) @free(i8* %.tmp1651)
%.tmp1652 = load %m980$.Node.type*, %m980$.Node.type** %parent
%.tmp1653 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1652, i32 0, i32 6
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1653
ret void
br label %.if.end.1649
.if.false.1649:
br label %.if.end.1649
.if.end.1649:
br label %.for.start.1654
.for.start.1654:
%.tmp1655 = load %m980$.Node.type*, %m980$.Node.type** %c.1644
%.tmp1656 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1655, i32 0, i32 7
%.tmp1657 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1656
%.tmp1658 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1657, i32 0, i32 7
%.tmp1659 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1658
%.tmp1660 = icmp ne %m980$.Node.type* %.tmp1659, null
br i1 %.tmp1660, label %.for.continue.1654, label %.for.end.1654
.for.continue.1654:
%.tmp1661 = load %m980$.Node.type*, %m980$.Node.type** %c.1644
%.tmp1662 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1661, i32 0, i32 7
%.tmp1663 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1662
store %m980$.Node.type* %.tmp1663, %m980$.Node.type** %c.1644
br label %.for.start.1654
.for.end.1654:
%.tmp1664 = load %m980$.Node.type*, %m980$.Node.type** %c.1644
%.tmp1665 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1664, i32 0, i32 7
%.tmp1666 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1665
%.tmp1667 = bitcast %m980$.Node.type* %.tmp1666 to i8*
call void(i8*) @free(i8* %.tmp1667)
%.tmp1668 = load %m980$.Node.type*, %m980$.Node.type** %c.1644
%.tmp1669 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp1668, i32 0, i32 7
store %m980$.Node.type* null, %m980$.Node.type** %.tmp1669
ret void
}
%m980$.AstContext.type = type {%m297$.Token.type*,%m980$.Rule.type**,%m296$.Error.type*,i32,i32}
define %m980$.AstContext.type* @m980$next_token.m980$.AstContext.typep.m980$.AstContext.typep(%m980$.AstContext.type* %.ctx.arg) {
%ctx = alloca %m980$.AstContext.type*
store %m980$.AstContext.type* %.ctx.arg, %m980$.AstContext.type** %ctx
%.tmp1670 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1671 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1670, i32 0, i32 0
%.tmp1672 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1673 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1672, i32 0, i32 0
%.tmp1674 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1673
%.tmp1675 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1674, i32 0, i32 5
%.tmp1676 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1675
store %m297$.Token.type* %.tmp1676, %m297$.Token.type** %.tmp1671
%.tmp1677 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1678 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1677, i32 0, i32 0
%.tmp1679 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1678
%ct.1680 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1679, %m297$.Token.type** %ct.1680
%.tmp1681 = load %m297$.Token.type*, %m297$.Token.type** %ct.1680
%.tmp1682 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1681, i32 0, i32 2
%.tmp1683 = load i32, i32* %.tmp1682
%.tmp1684 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1685 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1684, i32 0, i32 3
%.tmp1686 = load i32, i32* %.tmp1685
%.tmp1687 = icmp sgt i32 %.tmp1683, %.tmp1686
br i1 %.tmp1687, label %.if.true.1688, label %.if.false.1688
.if.true.1688:
%.tmp1689 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1690 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1689, i32 0, i32 3
%.tmp1691 = load %m297$.Token.type*, %m297$.Token.type** %ct.1680
%.tmp1692 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1691, i32 0, i32 2
%.tmp1693 = load i32, i32* %.tmp1692
store i32 %.tmp1693, i32* %.tmp1690
%.tmp1694 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1695 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1694, i32 0, i32 4
%.tmp1696 = load %m297$.Token.type*, %m297$.Token.type** %ct.1680
%.tmp1697 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1696, i32 0, i32 3
%.tmp1698 = load i32, i32* %.tmp1697
store i32 %.tmp1698, i32* %.tmp1695
br label %.if.end.1688
.if.false.1688:
%.tmp1699 = load %m297$.Token.type*, %m297$.Token.type** %ct.1680
%.tmp1700 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1699, i32 0, i32 2
%.tmp1701 = load i32, i32* %.tmp1700
%.tmp1702 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1703 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1702, i32 0, i32 3
%.tmp1704 = load i32, i32* %.tmp1703
%.tmp1705 = icmp eq i32 %.tmp1701, %.tmp1704
br i1 %.tmp1705, label %.if.true.1706, label %.if.false.1706
.if.true.1706:
%.tmp1707 = load %m297$.Token.type*, %m297$.Token.type** %ct.1680
%.tmp1708 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1707, i32 0, i32 3
%.tmp1709 = load i32, i32* %.tmp1708
%.tmp1710 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1711 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1710, i32 0, i32 4
%.tmp1712 = load i32, i32* %.tmp1711
%.tmp1713 = icmp sgt i32 %.tmp1709, %.tmp1712
br i1 %.tmp1713, label %.if.true.1714, label %.if.false.1714
.if.true.1714:
%.tmp1715 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1716 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1715, i32 0, i32 4
%.tmp1717 = load %m297$.Token.type*, %m297$.Token.type** %ct.1680
%.tmp1718 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1717, i32 0, i32 3
%.tmp1719 = load i32, i32* %.tmp1718
store i32 %.tmp1719, i32* %.tmp1716
br label %.if.end.1714
.if.false.1714:
br label %.if.end.1714
.if.end.1714:
br label %.if.end.1706
.if.false.1706:
br label %.if.end.1706
.if.end.1706:
br label %.if.end.1688
.if.end.1688:
%.tmp1720 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
ret %m980$.AstContext.type* %.tmp1720
}
define %m980$.Rule.type* @m980$find_rule.m980$.Rule.typep.m980$.Rule.typepp.cp(%m980$.Rule.type** %.grammar.arg, i8* %.rule_name.arg) {
%grammar = alloca %m980$.Rule.type**
store %m980$.Rule.type** %.grammar.arg, %m980$.Rule.type*** %grammar
%rule_name = alloca i8*
store i8* %.rule_name.arg, i8** %rule_name
%i.1722 = alloca i32
store i32 0, i32* %i.1722
br label %.for.start.1721
.for.start.1721:
br i1 1, label %.for.continue.1721, label %.for.end.1721
.for.continue.1721:
%.tmp1723 = load i32, i32* %i.1722
%.tmp1724 = load %m980$.Rule.type**, %m980$.Rule.type*** %grammar
%.tmp1725 = getelementptr %m980$.Rule.type*, %m980$.Rule.type** %.tmp1724, i32 %.tmp1723
%.tmp1726 = load %m980$.Rule.type*, %m980$.Rule.type** %.tmp1725
%rule.1727 = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.tmp1726, %m980$.Rule.type** %rule.1727
%.tmp1728 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1727
%.tmp1729 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1728, i32 0, i32 0
%.tmp1730 = load i8*, i8** %.tmp1729
%.tmp1731 = load i8*, i8** %rule_name
%.tmp1732 = call i32(i8*,i8*) @strcmp(i8* %.tmp1730, i8* %.tmp1731)
%.tmp1733 = icmp eq i32 %.tmp1732, 0
br i1 %.tmp1733, label %.if.true.1734, label %.if.false.1734
.if.true.1734:
%.tmp1735 = load %m980$.Rule.type*, %m980$.Rule.type** %rule.1727
ret %m980$.Rule.type* %.tmp1735
br label %.if.end.1734
.if.false.1734:
br label %.if.end.1734
.if.end.1734:
%.tmp1736 = load i32, i32* %i.1722
%.tmp1737 = add i32 %.tmp1736, 1
store i32 %.tmp1737, i32* %i.1722
br label %.for.start.1721
.for.end.1721:
%.tmp1738 = bitcast ptr null to %m980$.Rule.type*
ret %m980$.Rule.type* %.tmp1738
}
%m980$.ParseResult.type = type {%m296$.Error.type*,%m980$.Node.type*}
define %m980$.ParseResult.type* @m980$parse_to_ast.m980$.ParseResult.typep.m980$.AstContext.typep.m980$.Rule.typep(%m980$.AstContext.type* %.c.arg, %m980$.Rule.type* %.rule.arg) {
%c = alloca %m980$.AstContext.type*
store %m980$.AstContext.type* %.c.arg, %m980$.AstContext.type** %c
%rule = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.rule.arg, %m980$.Rule.type** %rule
%.tmp1739 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* null, i32 1
%.tmp1740 = ptrtoint %m980$.ParseResult.type* %.tmp1739 to i32
%.tmp1741 = call i8*(i32) @malloc(i32 %.tmp1740)
%.tmp1742 = bitcast i8* %.tmp1741 to %m980$.ParseResult.type*
%res.1743 = alloca %m980$.ParseResult.type*
store %m980$.ParseResult.type* %.tmp1742, %m980$.ParseResult.type** %res.1743
%.tmp1744 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1743
%.tmp1745 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1744, i32 0, i32 0
store %m296$.Error.type* null, %m296$.Error.type** %.tmp1745
%.tmp1746 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1743
%.tmp1747 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1746, i32 0, i32 1
%.tmp1748 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1749 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1748, i32 0, i32 0
%.tmp1750 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1749
%.tmp1751 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1752 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1751, i32 0, i32 0
%.tmp1753 = load i8*, i8** %.tmp1752
%.tmp1754 = bitcast ptr null to i8*
%.tmp1755 = call %m980$.Node.type*(%m297$.Token.type*,i8*,i8*) @m980$new_node.m980$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1750, i8* %.tmp1753, i8* %.tmp1754)
store %m980$.Node.type* %.tmp1755, %m980$.Node.type** %.tmp1747
%.tmp1756 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1757 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1756, i32 0, i32 0
%.tmp1758 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1757
%start_match.1759 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1758, %m297$.Token.type** %start_match.1759
%.tmp1760 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1743
%.tmp1761 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1760, i32 0, i32 0
%.tmp1762 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1763 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1764 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1765 = getelementptr %m980$.Rule.type, %m980$.Rule.type* %.tmp1764, i32 0, i32 2
%.tmp1766 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1765
%.tmp1767 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1743
%.tmp1768 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1767, i32 0, i32 1
%.tmp1769 = load %m980$.Node.type*, %m980$.Node.type** %.tmp1768
%.tmp1770 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp1762, %m980$.Rule.type* %.tmp1763, %m980$.Matcher.type* %.tmp1766, %m980$.Node.type* %.tmp1769)
store %m296$.Error.type* %.tmp1770, %m296$.Error.type** %.tmp1761
%.tmp1771 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1743
%.tmp1772 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1771, i32 0, i32 0
%.tmp1773 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1772
%.tmp1774 = icmp ne %m296$.Error.type* %.tmp1773, null
br i1 %.tmp1774, label %.if.true.1775, label %.if.false.1775
.if.true.1775:
%.tmp1776 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1743
%.tmp1777 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1776, i32 0, i32 0
%.tmp1778 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1777
%.tmp1779 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp1778, i32 0, i32 0
%.tmp1780 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1781 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1780, i32 0, i32 3
%.tmp1782 = load i32, i32* %.tmp1781
store i32 %.tmp1782, i32* %.tmp1779
%.tmp1783 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1743
%.tmp1784 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1783, i32 0, i32 0
%.tmp1785 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1784
%.tmp1786 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp1785, i32 0, i32 1
%.tmp1787 = load %m980$.AstContext.type*, %m980$.AstContext.type** %c
%.tmp1788 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1787, i32 0, i32 4
%.tmp1789 = load i32, i32* %.tmp1788
store i32 %.tmp1789, i32* %.tmp1786
br label %.if.end.1775
.if.false.1775:
br label %.if.end.1775
.if.end.1775:
%.tmp1790 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.1743
ret %m980$.ParseResult.type* %.tmp1790
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
%.tmp1791 = bitcast ptr null to %m296$.Error.type*
%err.1792 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1791, %m296$.Error.type** %err.1792
%.tmp1794 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%m.1795 = alloca %m980$.Matcher.type*
store %m980$.Matcher.type* %.tmp1794, %m980$.Matcher.type** %m.1795
br label %.for.start.1793
.for.start.1793:
%.tmp1796 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1795
%.tmp1797 = icmp ne %m980$.Matcher.type* %.tmp1796, null
br i1 %.tmp1797, label %.for.continue.1793, label %.for.end.1793
.for.continue.1793:
%.tmp1798 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1799 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1800 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1795
%.tmp1801 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp1802 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher_straight.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp1798, %m980$.Rule.type* %.tmp1799, %m980$.Matcher.type* %.tmp1800, %m980$.Node.type* %.tmp1801)
store %m296$.Error.type* %.tmp1802, %m296$.Error.type** %err.1792
%.tmp1803 = load %m296$.Error.type*, %m296$.Error.type** %err.1792
%.tmp1804 = icmp eq %m296$.Error.type* %.tmp1803, null
br i1 %.tmp1804, label %.if.true.1805, label %.if.false.1805
.if.true.1805:
br label %.for.end.1793
br label %.if.end.1805
.if.false.1805:
br label %.if.end.1805
.if.end.1805:
%.tmp1806 = load %m980$.Matcher.type*, %m980$.Matcher.type** %m.1795
%.tmp1807 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1806, i32 0, i32 2
%.tmp1808 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1807
store %m980$.Matcher.type* %.tmp1808, %m980$.Matcher.type** %m.1795
br label %.for.start.1793
.for.end.1793:
%.tmp1809 = load %m296$.Error.type*, %m296$.Error.type** %err.1792
ret %m296$.Error.type* %.tmp1809
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
%.tmp1811 = getelementptr [1 x i8], [1 x i8]*@.str1810, i32 0, i32 0
%buf.1812 = alloca i8*
store i8* %.tmp1811, i8** %buf.1812
%.tmp1813 = bitcast ptr null to %m296$.Error.type*
%err.1814 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1813, %m296$.Error.type** %err.1814
%.tmp1815 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1816 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1815, i32 0, i32 0
%.tmp1817 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1816
%anchor.1818 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1817, %m297$.Token.type** %anchor.1818
%.tmp1819 = bitcast ptr null to %m980$.Node.type*
%child.1820 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp1819, %m980$.Node.type** %child.1820
%.tmp1821 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1822 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1821, i32 0, i32 5
%.tmp1823 = load i8, i8* %.tmp1822
%.tmp1824 = load i8, i8* @TYPE_IGNORE
%.tmp1825 = icmp eq i8 %.tmp1823, %.tmp1824
br i1 %.tmp1825, label %.if.true.1826, label %.if.false.1826
.if.true.1826:
%.tmp1827 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1828 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1827, i32 0, i32 4
%.tmp1829 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1828
%.tmp1830 = icmp ne %m980$.Matcher.type* %.tmp1829, null
br i1 %.tmp1830, label %.if.true.1831, label %.if.false.1831
.if.true.1831:
%.tmp1832 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1833 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp1834 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1835 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1834, i32 0, i32 4
%.tmp1836 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp1835
%.tmp1837 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp1838 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp1832, %m980$.Rule.type* %.tmp1833, %m980$.Matcher.type* %.tmp1836, %m980$.Node.type* %.tmp1837)
store %m296$.Error.type* %.tmp1838, %m296$.Error.type** %err.1814
br label %.if.end.1831
.if.false.1831:
br label %.if.end.1831
.if.end.1831:
br label %.if.end.1826
.if.false.1826:
%.tmp1839 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1840 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1839, i32 0, i32 5
%.tmp1841 = load i8, i8* %.tmp1840
%.tmp1842 = load i8, i8* @TYPE_VALUE
%.tmp1843 = icmp eq i8 %.tmp1841, %.tmp1842
br i1 %.tmp1843, label %.if.true.1844, label %.if.false.1844
.if.true.1844:
%.tmp1845 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1846 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1845, i32 0, i32 6
%.tmp1847 = load i8*, i8** %.tmp1846
%.tmp1848 = icmp eq i8* %.tmp1847, null
br i1 %.tmp1848, label %.if.true.1849, label %.if.false.1849
.if.true.1849:
%.tmp1851 = getelementptr [22 x i8], [22 x i8]*@.str1850, i32 0, i32 0
%.tmp1852 = call i32(i8*,...) @printf(i8* %.tmp1851)
br label %.if.end.1849
.if.false.1849:
br label %.if.end.1849
.if.end.1849:
%.tmp1853 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1854 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1853, i32 0, i32 6
%.tmp1855 = load i8*, i8** %.tmp1854
%.tmp1856 = call i32(i8*) @strlen(i8* %.tmp1855)
%.tmp1857 = sub i32 %.tmp1856, 1
%.tmp1858 = call i8*(i32) @malloc(i32 %.tmp1857)
%buf.1859 = alloca i8*
store i8* %.tmp1858, i8** %buf.1859
%.tmp1860 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1861 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1860, i32 0, i32 6
%.tmp1862 = load i8*, i8** %.tmp1861
%.tmp1864 = getelementptr [8 x i8], [8 x i8]*@.str1863, i32 0, i32 0
%.tmp1865 = load i8*, i8** %buf.1859
%.tmp1866 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1862, i8* %.tmp1864, i8* %.tmp1865)
%.tmp1867 = load i8*, i8** %buf.1859
%.tmp1868 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1869 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1868, i32 0, i32 0
%.tmp1870 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1869
%.tmp1871 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1870, i32 0, i32 1
%.tmp1872 = load i8*, i8** %.tmp1871
%.tmp1873 = call i32(i8*,i8*) @strcmp(i8* %.tmp1867, i8* %.tmp1872)
%.tmp1874 = icmp ne i32 %.tmp1873, 0
br i1 %.tmp1874, label %.if.true.1875, label %.if.false.1875
.if.true.1875:
%.tmp1876 = getelementptr i8*, i8** %buf.1859, i32 0
%.tmp1878 = getelementptr [43 x i8], [43 x i8]*@.str1877, i32 0, i32 0
%.tmp1879 = load i8*, i8** %buf.1859
%.tmp1880 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1881 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1880, i32 0, i32 0
%.tmp1882 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1881
%.tmp1883 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1882, i32 0, i32 1
%.tmp1884 = load i8*, i8** %.tmp1883
%.tmp1885 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1876, i8* %.tmp1878, i8* %.tmp1879, i8* %.tmp1884)
%.tmp1886 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1887 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1886, i32 0, i32 0
%.tmp1888 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1887
%.tmp1889 = load i8*, i8** %buf.1859
%.tmp1890 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1888, i8* %.tmp1889)
ret %m296$.Error.type* %.tmp1890
br label %.if.end.1875
.if.false.1875:
br label %.if.end.1875
.if.end.1875:
%.tmp1891 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1892 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1891, i32 0, i32 0
%.tmp1893 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1892
%.tmp1894 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1895 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1894, i32 0, i32 0
%.tmp1896 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1895
%.tmp1897 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1896, i32 0, i32 0
%.tmp1898 = load i8*, i8** %.tmp1897
%.tmp1899 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1900 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1899, i32 0, i32 0
%.tmp1901 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1900
%.tmp1902 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1901, i32 0, i32 1
%.tmp1903 = load i8*, i8** %.tmp1902
%.tmp1904 = call %m980$.Node.type*(%m297$.Token.type*,i8*,i8*) @m980$new_node.m980$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1893, i8* %.tmp1898, i8* %.tmp1903)
store %m980$.Node.type* %.tmp1904, %m980$.Node.type** %child.1820
%.tmp1905 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1906 = call %m980$.AstContext.type*(%m980$.AstContext.type*) @m980$next_token.m980$.AstContext.typep.m980$.AstContext.typep(%m980$.AstContext.type* %.tmp1905)
store %m980$.AstContext.type* %.tmp1906, %m980$.AstContext.type** %ctx
br label %.if.end.1844
.if.false.1844:
%.tmp1907 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1908 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1907, i32 0, i32 5
%.tmp1909 = load i8, i8* %.tmp1908
%.tmp1910 = load i8, i8* @TYPE_TYPE
%.tmp1911 = icmp eq i8 %.tmp1909, %.tmp1910
br i1 %.tmp1911, label %.if.true.1912, label %.if.false.1912
.if.true.1912:
%.tmp1913 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1914 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1913, i32 0, i32 6
%.tmp1915 = load i8*, i8** %.tmp1914
%.tmp1916 = icmp eq i8* %.tmp1915, null
br i1 %.tmp1916, label %.if.true.1917, label %.if.false.1917
.if.true.1917:
%.tmp1919 = getelementptr [22 x i8], [22 x i8]*@.str1918, i32 0, i32 0
%.tmp1920 = call i32(i8*,...) @printf(i8* %.tmp1919)
br label %.if.end.1917
.if.false.1917:
br label %.if.end.1917
.if.end.1917:
%.tmp1921 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1922 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1921, i32 0, i32 6
%.tmp1923 = load i8*, i8** %.tmp1922
%.tmp1924 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1925 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1924, i32 0, i32 0
%.tmp1926 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1925
%.tmp1927 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1926, i32 0, i32 0
%.tmp1928 = load i8*, i8** %.tmp1927
%.tmp1929 = call i32(i8*,i8*) @strcmp(i8* %.tmp1923, i8* %.tmp1928)
%.tmp1930 = icmp ne i32 %.tmp1929, 0
br i1 %.tmp1930, label %.if.true.1931, label %.if.false.1931
.if.true.1931:
%.tmp1932 = getelementptr i8*, i8** %buf.1812, i32 0
%.tmp1934 = getelementptr [54 x i8], [54 x i8]*@.str1933, i32 0, i32 0
%.tmp1935 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1936 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1935, i32 0, i32 6
%.tmp1937 = load i8*, i8** %.tmp1936
%.tmp1938 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1939 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1938, i32 0, i32 0
%.tmp1940 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1939
%.tmp1941 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1940, i32 0, i32 0
%.tmp1942 = load i8*, i8** %.tmp1941
%.tmp1943 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1932, i8* %.tmp1934, i8* %.tmp1937, i8* %.tmp1942)
%.tmp1944 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1945 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1944, i32 0, i32 0
%.tmp1946 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1945
%.tmp1947 = load i8*, i8** %buf.1812
%.tmp1948 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1946, i8* %.tmp1947)
ret %m296$.Error.type* %.tmp1948
br label %.if.end.1931
.if.false.1931:
br label %.if.end.1931
.if.end.1931:
%.tmp1949 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1950 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1949, i32 0, i32 0
%.tmp1951 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1950
%.tmp1952 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1953 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1952, i32 0, i32 0
%.tmp1954 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1953
%.tmp1955 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1954, i32 0, i32 0
%.tmp1956 = load i8*, i8** %.tmp1955
%.tmp1957 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1958 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1957, i32 0, i32 0
%.tmp1959 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1958
%.tmp1960 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1959, i32 0, i32 1
%.tmp1961 = load i8*, i8** %.tmp1960
%.tmp1962 = call %m980$.Node.type*(%m297$.Token.type*,i8*,i8*) @m980$new_node.m980$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1951, i8* %.tmp1956, i8* %.tmp1961)
store %m980$.Node.type* %.tmp1962, %m980$.Node.type** %child.1820
%.tmp1963 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1964 = call %m980$.AstContext.type*(%m980$.AstContext.type*) @m980$next_token.m980$.AstContext.typep.m980$.AstContext.typep(%m980$.AstContext.type* %.tmp1963)
store %m980$.AstContext.type* %.tmp1964, %m980$.AstContext.type** %ctx
br label %.if.end.1912
.if.false.1912:
%.tmp1965 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1966 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1965, i32 0, i32 5
%.tmp1967 = load i8, i8* %.tmp1966
%.tmp1968 = load i8, i8* @TYPE_ALIAS
%.tmp1969 = icmp eq i8 %.tmp1967, %.tmp1968
br i1 %.tmp1969, label %.if.true.1970, label %.if.false.1970
.if.true.1970:
%.tmp1971 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1972 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1971, i32 0, i32 1
%.tmp1973 = load %m980$.Rule.type**, %m980$.Rule.type*** %.tmp1972
%.tmp1974 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp1975 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp1974, i32 0, i32 6
%.tmp1976 = load i8*, i8** %.tmp1975
%.tmp1977 = call %m980$.Rule.type*(%m980$.Rule.type**,i8*) @m980$find_rule.m980$.Rule.typep.m980$.Rule.typepp.cp(%m980$.Rule.type** %.tmp1973, i8* %.tmp1976)
%alias_rule.1978 = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.tmp1977, %m980$.Rule.type** %alias_rule.1978
%.tmp1979 = load %m980$.Rule.type*, %m980$.Rule.type** %alias_rule.1978
%.tmp1980 = icmp eq %m980$.Rule.type* %.tmp1979, null
br i1 %.tmp1980, label %.if.true.1981, label %.if.false.1981
.if.true.1981:
%.tmp1982 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1983 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp1982, i32 0, i32 0
%.tmp1984 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1983
%.tmp1986 = getelementptr [26 x i8], [26 x i8]*@.str1985, i32 0, i32 0
%.tmp1987 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1984, i8* %.tmp1986)
ret %m296$.Error.type* %.tmp1987
br label %.if.end.1981
.if.false.1981:
br label %.if.end.1981
.if.end.1981:
%.tmp1988 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp1989 = load %m980$.Rule.type*, %m980$.Rule.type** %alias_rule.1978
%.tmp1990 = call %m980$.ParseResult.type*(%m980$.AstContext.type*,%m980$.Rule.type*) @m980$parse_to_ast.m980$.ParseResult.typep.m980$.AstContext.typep.m980$.Rule.typep(%m980$.AstContext.type* %.tmp1988, %m980$.Rule.type* %.tmp1989)
%parse_result.1991 = alloca %m980$.ParseResult.type*
store %m980$.ParseResult.type* %.tmp1990, %m980$.ParseResult.type** %parse_result.1991
%.tmp1992 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %parse_result.1991
%.tmp1993 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1992, i32 0, i32 0
%.tmp1994 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1993
%.tmp1995 = icmp ne %m296$.Error.type* %.tmp1994, null
br i1 %.tmp1995, label %.if.true.1996, label %.if.false.1996
.if.true.1996:
%.tmp1997 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %parse_result.1991
%.tmp1998 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp1997, i32 0, i32 0
%.tmp1999 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1998
ret %m296$.Error.type* %.tmp1999
br label %.if.end.1996
.if.false.1996:
br label %.if.end.1996
.if.end.1996:
%.tmp2000 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %parse_result.1991
%.tmp2001 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp2000, i32 0, i32 1
%.tmp2002 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2001
store %m980$.Node.type* %.tmp2002, %m980$.Node.type** %child.1820
br label %.if.end.1970
.if.false.1970:
%.tmp2004 = getelementptr [33 x i8], [33 x i8]*@.str2003, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp2004)
br label %.if.end.1970
.if.end.1970:
br label %.if.end.1912
.if.end.1912:
br label %.if.end.1844
.if.end.1844:
br label %.if.end.1826
.if.end.1826:
%.tmp2005 = load %m980$.Node.type*, %m980$.Node.type** %child.1820
%.tmp2006 = icmp ne %m980$.Node.type* %.tmp2005, null
br i1 %.tmp2006, label %.if.true.2007, label %.if.false.2007
.if.true.2007:
%.tmp2008 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2009 = load %m980$.Node.type*, %m980$.Node.type** %child.1820
call void(%m980$.Node.type*,%m980$.Node.type*) @m980$child_append.v.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.tmp2008, %m980$.Node.type* %.tmp2009)
br label %.if.end.2007
.if.false.2007:
br label %.if.end.2007
.if.end.2007:
%.tmp2010 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2011 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp2010, i32 0, i32 0
%.tmp2012 = load i8, i8* %.tmp2011
%.tmp2013 = icmp eq i8 %.tmp2012, 63
%.tmp2014 = load %m296$.Error.type*, %m296$.Error.type** %err.1814
%.tmp2015 = icmp ne %m296$.Error.type* %.tmp2014, null
%.tmp2016 = and i1 %.tmp2013, %.tmp2015
br i1 %.tmp2016, label %.if.true.2017, label %.if.false.2017
.if.true.2017:
store %m296$.Error.type* null, %m296$.Error.type** %err.1814
br label %.if.end.2017
.if.false.2017:
%.tmp2018 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2019 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp2018, i32 0, i32 0
%.tmp2020 = load i8, i8* %.tmp2019
%.tmp2021 = icmp eq i8 %.tmp2020, 42
br i1 %.tmp2021, label %.if.true.2022, label %.if.false.2022
.if.true.2022:
%.tmp2023 = load %m296$.Error.type*, %m296$.Error.type** %err.1814
%.tmp2024 = icmp ne %m296$.Error.type* %.tmp2023, null
br i1 %.tmp2024, label %.if.true.2025, label %.if.false.2025
.if.true.2025:
store %m296$.Error.type* null, %m296$.Error.type** %err.1814
br label %.if.end.2025
.if.false.2025:
%.tmp2026 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp2027 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp2028 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2029 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2030 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp2026, %m980$.Rule.type* %.tmp2027, %m980$.Matcher.type* %.tmp2028, %m980$.Node.type* %.tmp2029)
ret %m296$.Error.type* %.tmp2030
br label %.if.end.2025
.if.end.2025:
br label %.if.end.2022
.if.false.2022:
%.tmp2031 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2032 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp2031, i32 0, i32 0
%.tmp2033 = load i8, i8* %.tmp2032
%.tmp2034 = icmp eq i8 %.tmp2033, 43
%.tmp2035 = load %m296$.Error.type*, %m296$.Error.type** %err.1814
%.tmp2036 = icmp eq %m296$.Error.type* %.tmp2035, null
%.tmp2037 = and i1 %.tmp2034, %.tmp2036
br i1 %.tmp2037, label %.if.true.2038, label %.if.false.2038
.if.true.2038:
%.tmp2039 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp2040 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp2041 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2042 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2043 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp2039, %m980$.Rule.type* %.tmp2040, %m980$.Matcher.type* %.tmp2041, %m980$.Node.type* %.tmp2042)
store %m296$.Error.type* %.tmp2043, %m296$.Error.type** %err.1814
%.tmp2044 = load %m296$.Error.type*, %m296$.Error.type** %err.1814
%.tmp2045 = icmp ne %m296$.Error.type* %.tmp2044, null
br i1 %.tmp2045, label %.if.true.2046, label %.if.false.2046
.if.true.2046:
store %m296$.Error.type* null, %m296$.Error.type** %err.1814
br label %.if.end.2046
.if.false.2046:
%.tmp2047 = bitcast ptr null to %m296$.Error.type*
ret %m296$.Error.type* %.tmp2047
br label %.if.end.2046
.if.end.2046:
br label %.if.end.2038
.if.false.2038:
br label %.if.end.2038
.if.end.2038:
br label %.if.end.2022
.if.end.2022:
br label %.if.end.2017
.if.end.2017:
%.tmp2048 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2049 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp2048, i32 0, i32 3
%.tmp2050 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp2049
%.tmp2051 = icmp ne %m980$.Matcher.type* %.tmp2050, null
%.tmp2052 = load %m296$.Error.type*, %m296$.Error.type** %err.1814
%.tmp2053 = icmp eq %m296$.Error.type* %.tmp2052, null
%.tmp2054 = and i1 %.tmp2051, %.tmp2053
br i1 %.tmp2054, label %.if.true.2055, label %.if.false.2055
.if.true.2055:
%.tmp2056 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp2057 = load %m980$.Rule.type*, %m980$.Rule.type** %rule
%.tmp2058 = load %m980$.Matcher.type*, %m980$.Matcher.type** %matcher
%.tmp2059 = getelementptr %m980$.Matcher.type, %m980$.Matcher.type* %.tmp2058, i32 0, i32 3
%.tmp2060 = load %m980$.Matcher.type*, %m980$.Matcher.type** %.tmp2059
%.tmp2061 = load %m980$.Node.type*, %m980$.Node.type** %root
%.tmp2062 = call %m296$.Error.type*(%m980$.AstContext.type*,%m980$.Rule.type*,%m980$.Matcher.type*,%m980$.Node.type*) @m980$execute_matcher.m296$.Error.typep.m980$.AstContext.typep.m980$.Rule.typep.m980$.Matcher.typep.m980$.Node.typep(%m980$.AstContext.type* %.tmp2056, %m980$.Rule.type* %.tmp2057, %m980$.Matcher.type* %.tmp2060, %m980$.Node.type* %.tmp2061)
store %m296$.Error.type* %.tmp2062, %m296$.Error.type** %err.1814
br label %.if.end.2055
.if.false.2055:
br label %.if.end.2055
.if.end.2055:
%.tmp2063 = load %m296$.Error.type*, %m296$.Error.type** %err.1814
%.tmp2064 = icmp ne %m296$.Error.type* %.tmp2063, null
br i1 %.tmp2064, label %.if.true.2065, label %.if.false.2065
.if.true.2065:
%.tmp2066 = load %m980$.AstContext.type*, %m980$.AstContext.type** %ctx
%.tmp2067 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %.tmp2066, i32 0, i32 0
%.tmp2068 = load %m297$.Token.type*, %m297$.Token.type** %anchor.1818
store %m297$.Token.type* %.tmp2068, %m297$.Token.type** %.tmp2067
%.tmp2069 = load %m980$.Node.type*, %m980$.Node.type** %child.1820
%.tmp2070 = icmp ne %m980$.Node.type* %.tmp2069, null
br i1 %.tmp2070, label %.if.true.2071, label %.if.false.2071
.if.true.2071:
%.tmp2072 = load %m980$.Node.type*, %m980$.Node.type** %root
call void(%m980$.Node.type*) @m980$child_pop.v.m980$.Node.typep(%m980$.Node.type* %.tmp2072)
br label %.if.end.2071
.if.false.2071:
br label %.if.end.2071
.if.end.2071:
br label %.if.end.2065
.if.false.2065:
br label %.if.end.2065
.if.end.2065:
%.tmp2073 = load %m296$.Error.type*, %m296$.Error.type** %err.1814
ret %m296$.Error.type* %.tmp2073
}
define %m980$.ParseResult.type* @m980$ast.m980$.ParseResult.typep.m980$.Rule.typepp.cp.m297$.Token.typep(%m980$.Rule.type** %.grammar.arg, i8* %.start.arg, %m297$.Token.type* %.tokens.arg) {
%grammar = alloca %m980$.Rule.type**
store %m980$.Rule.type** %.grammar.arg, %m980$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m297$.Token.type*
store %m297$.Token.type* %.tokens.arg, %m297$.Token.type** %tokens
%.tmp2074 = load %m980$.Rule.type**, %m980$.Rule.type*** %grammar
%.tmp2075 = load i8*, i8** %start
%.tmp2076 = call %m980$.Rule.type*(%m980$.Rule.type**,i8*) @m980$find_rule.m980$.Rule.typep.m980$.Rule.typepp.cp(%m980$.Rule.type** %.tmp2074, i8* %.tmp2075)
%start_matcher.2077 = alloca %m980$.Rule.type*
store %m980$.Rule.type* %.tmp2076, %m980$.Rule.type** %start_matcher.2077
%.tmp2078 = load %m980$.Rule.type*, %m980$.Rule.type** %start_matcher.2077
%.tmp2079 = icmp ne %m980$.Rule.type* %.tmp2078, null
%.tmp2081 = getelementptr [44 x i8], [44 x i8]*@.str2080, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2079, i8* %.tmp2081)
%c.2082 = alloca %m980$.AstContext.type
%.tmp2083 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2082, i32 0, i32 0
store %m297$.Token.type* null, %m297$.Token.type** %.tmp2083
%.tmp2084 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2082, i32 0, i32 1
store %m980$.Rule.type** null, %m980$.Rule.type*** %.tmp2084
%.tmp2085 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2082, i32 0, i32 2
store %m296$.Error.type* null, %m296$.Error.type** %.tmp2085
%.tmp2086 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2082, i32 0, i32 3
store i32 0, i32* %.tmp2086
%.tmp2087 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2082, i32 0, i32 4
store i32 0, i32* %.tmp2087
%.tmp2088 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2082, i32 0, i32 0
%.tmp2089 = load %m297$.Token.type*, %m297$.Token.type** %tokens
store %m297$.Token.type* %.tmp2089, %m297$.Token.type** %.tmp2088
%.tmp2090 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2082, i32 0, i32 1
%.tmp2091 = load %m980$.Rule.type**, %m980$.Rule.type*** %grammar
store %m980$.Rule.type** %.tmp2091, %m980$.Rule.type*** %.tmp2090
%.tmp2092 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2082, i32 0
%.tmp2093 = load %m980$.Rule.type*, %m980$.Rule.type** %start_matcher.2077
%.tmp2094 = call %m980$.ParseResult.type*(%m980$.AstContext.type*,%m980$.Rule.type*) @m980$parse_to_ast.m980$.ParseResult.typep.m980$.AstContext.typep.m980$.Rule.typep(%m980$.AstContext.type* %.tmp2092, %m980$.Rule.type* %.tmp2093)
%res.2095 = alloca %m980$.ParseResult.type*
store %m980$.ParseResult.type* %.tmp2094, %m980$.ParseResult.type** %res.2095
%.tmp2096 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2082, i32 0, i32 0
%.tmp2097 = load %m297$.Token.type*, %m297$.Token.type** %.tmp2096
%.tmp2098 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp2097, i32 0, i32 0
%.tmp2099 = load i8*, i8** %.tmp2098
%.tmp2101 = getelementptr [4 x i8], [4 x i8]*@.str2100, i32 0, i32 0
%.tmp2102 = call i32(i8*,i8*) @strcmp(i8* %.tmp2099, i8* %.tmp2101)
%.tmp2103 = icmp ne i32 %.tmp2102, 0
%.tmp2104 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.2095
%.tmp2105 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp2104, i32 0, i32 0
%.tmp2106 = load %m296$.Error.type*, %m296$.Error.type** %.tmp2105
%.tmp2107 = icmp eq %m296$.Error.type* %.tmp2106, null
%.tmp2108 = and i1 %.tmp2103, %.tmp2107
br i1 %.tmp2108, label %.if.true.2109, label %.if.false.2109
.if.true.2109:
%.tmp2110 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.2095
%.tmp2111 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp2110, i32 0, i32 0
%.tmp2112 = getelementptr %m980$.AstContext.type, %m980$.AstContext.type* %c.2082, i32 0, i32 0
%.tmp2113 = load %m297$.Token.type*, %m297$.Token.type** %.tmp2112
%.tmp2115 = getelementptr [32 x i8], [32 x i8]*@.str2114, i32 0, i32 0
%.tmp2116 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp2113, i8* %.tmp2115)
store %m296$.Error.type* %.tmp2116, %m296$.Error.type** %.tmp2111
br label %.if.end.2109
.if.false.2109:
br label %.if.end.2109
.if.end.2109:
%.tmp2117 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %res.2095
ret %m980$.ParseResult.type* %.tmp2117
}
define i8* @m2118$node_to_string.cp.m980$.Node.typep(%m980$.Node.type* %.n.arg) {
%n = alloca %m980$.Node.type*
store %m980$.Node.type* %.n.arg, %m980$.Node.type** %n
%.tmp2119 = call %m0$.File.type*() @tmpfile()
%tmp.2120 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2119, %m0$.File.type** %tmp.2120
%.tmp2121 = load %m980$.Node.type*, %m980$.Node.type** %n
%.tmp2122 = load %m0$.File.type*, %m0$.File.type** %tmp.2120
call void(%m980$.Node.type*,%m0$.File.type*,i32) @m2118$_node_to_string.v.m980$.Node.typep.m0$.File.typep.i(%m980$.Node.type* %.tmp2121, %m0$.File.type* %.tmp2122, i32 1)
%.tmp2123 = load %m0$.File.type*, %m0$.File.type** %tmp.2120
%.tmp2124 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp2123)
%.tmp2125 = load %m0$.File.type*, %m0$.File.type** %tmp.2120
%.tmp2126 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp2125)
%str_len.2127 = alloca i32
store i32 %.tmp2126, i32* %str_len.2127
%.tmp2128 = load %m0$.File.type*, %m0$.File.type** %tmp.2120
%.tmp2129 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp2128)
%tmp_fd.2130 = alloca i32
store i32 %.tmp2129, i32* %tmp_fd.2130
%.tmp2131 = load i32, i32* %tmp_fd.2130
%.tmp2132 = load i32, i32* @SEEK_SET
%.tmp2133 = call i32(i32,i32,i32) @lseek(i32 %.tmp2131, i32 0, i32 %.tmp2132)
%.tmp2134 = load i32, i32* %str_len.2127
%.tmp2135 = call i8*(i32) @malloc(i32 %.tmp2134)
%buf.2136 = alloca i8*
store i8* %.tmp2135, i8** %buf.2136
%.tmp2137 = load i32, i32* %tmp_fd.2130
%.tmp2138 = load i8*, i8** %buf.2136
%.tmp2139 = load i32, i32* %str_len.2127
%.tmp2140 = call i32(i32,i8*,i32) @read(i32 %.tmp2137, i8* %.tmp2138, i32 %.tmp2139)
%read.2141 = alloca i32
store i32 %.tmp2140, i32* %read.2141
%.tmp2142 = load i32, i32* %read.2141
%.tmp2143 = load i32, i32* %str_len.2127
%.tmp2144 = icmp ne i32 %.tmp2142, %.tmp2143
br i1 %.tmp2144, label %.if.true.2145, label %.if.false.2145
.if.true.2145:
%.tmp2146 = load i8*, i8** %buf.2136
call void(i8*) @free(i8* %.tmp2146)
store i8* null, i8** %buf.2136
br label %.if.end.2145
.if.false.2145:
br label %.if.end.2145
.if.end.2145:
%.tmp2147 = load i8*, i8** %buf.2136
ret i8* %.tmp2147
}
define void @m2118$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2148 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2150 = getelementptr [2 x i8], [2 x i8]*@.str2149, i32 0, i32 0
%.tmp2151 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2148, i8* %.tmp2150)
%i.2153 = alloca i32
store i32 0, i32* %i.2153
br label %.for.start.2152
.for.start.2152:
%.tmp2154 = load i32, i32* %i.2153
%.tmp2155 = load i32, i32* %indent
%.tmp2156 = icmp slt i32 %.tmp2154, %.tmp2155
br i1 %.tmp2156, label %.for.continue.2152, label %.for.end.2152
.for.continue.2152:
%.tmp2157 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2159 = getelementptr [3 x i8], [3 x i8]*@.str2158, i32 0, i32 0
%.tmp2160 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2157, i8* %.tmp2159)
%.tmp2161 = load i32, i32* %i.2153
%.tmp2162 = add i32 %.tmp2161, 1
store i32 %.tmp2162, i32* %i.2153
br label %.for.start.2152
.for.end.2152:
ret void
}
define void @m2118$_node_to_string.v.m980$.Node.typep.m0$.File.typep.i(%m980$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m980$.Node.type*
store %m980$.Node.type* %.node.arg, %m980$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2163 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2164 = icmp eq %m980$.Node.type* %.tmp2163, null
br i1 %.tmp2164, label %.if.true.2165, label %.if.false.2165
.if.true.2165:
%.tmp2166 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2168 = getelementptr [7 x i8], [7 x i8]*@.str2167, i32 0, i32 0
%.tmp2169 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2166, i8* %.tmp2168)
ret void
br label %.if.end.2165
.if.false.2165:
br label %.if.end.2165
.if.end.2165:
%.tmp2170 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2172 = getelementptr [2 x i8], [2 x i8]*@.str2171, i32 0, i32 0
%.tmp2173 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2170, i8* %.tmp2172)
%.tmp2174 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2175 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2118$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2174, i32 %.tmp2175)
%.tmp2176 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2178 = getelementptr [13 x i8], [13 x i8]*@.str2177, i32 0, i32 0
%.tmp2179 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2180 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2179, i32 0, i32 0
%.tmp2181 = load i8*, i8** %.tmp2180
%.tmp2182 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2176, i8* %.tmp2178, i8* %.tmp2181)
%.tmp2183 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2184 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2118$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2183, i32 %.tmp2184)
%.tmp2185 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2187 = getelementptr [12 x i8], [12 x i8]*@.str2186, i32 0, i32 0
%.tmp2188 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2189 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2188, i32 0, i32 1
%.tmp2190 = load i8*, i8** %.tmp2189
%.tmp2191 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2185, i8* %.tmp2187, i8* %.tmp2190)
%.tmp2192 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2193 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2118$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2192, i32 %.tmp2193)
%.tmp2194 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2196 = getelementptr [11 x i8], [11 x i8]*@.str2195, i32 0, i32 0
%.tmp2197 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2198 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2197, i32 0, i32 3
%.tmp2199 = load i32, i32* %.tmp2198
%.tmp2200 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2194, i8* %.tmp2196, i32 %.tmp2199)
%.tmp2201 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2202 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2118$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2201, i32 %.tmp2202)
%.tmp2203 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2205 = getelementptr [19 x i8], [19 x i8]*@.str2204, i32 0, i32 0
%.tmp2206 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2207 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2206, i32 0, i32 4
%.tmp2208 = load i32, i32* %.tmp2207
%.tmp2209 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2203, i8* %.tmp2205, i32 %.tmp2208)
%.tmp2210 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2211 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2118$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2210, i32 %.tmp2211)
%.tmp2212 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2214 = getelementptr [9 x i8], [9 x i8]*@.str2213, i32 0, i32 0
%.tmp2215 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2212, i8* %.tmp2214)
%.tmp2216 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2217 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2216, i32 0, i32 7
%.tmp2218 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2217
%.tmp2219 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2220 = load i32, i32* %indent
%.tmp2221 = add i32 %.tmp2220, 1
call void(%m980$.Node.type*,%m0$.File.type*,i32) @m2118$_node_to_string.v.m980$.Node.typep.m0$.File.typep.i(%m980$.Node.type* %.tmp2218, %m0$.File.type* %.tmp2219, i32 %.tmp2221)
%.tmp2222 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2223 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2118$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2222, i32 %.tmp2223)
%.tmp2224 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2226 = getelementptr [13 x i8], [13 x i8]*@.str2225, i32 0, i32 0
%.tmp2227 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2224, i8* %.tmp2226)
%.tmp2228 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp2229 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2228, i32 0, i32 6
%.tmp2230 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2229
%.tmp2231 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2232 = load i32, i32* %indent
%.tmp2233 = add i32 %.tmp2232, 1
call void(%m980$.Node.type*,%m0$.File.type*,i32) @m2118$_node_to_string.v.m980$.Node.typep.m0$.File.typep.i(%m980$.Node.type* %.tmp2230, %m0$.File.type* %.tmp2231, i32 %.tmp2233)
%.tmp2234 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2235 = load i32, i32* %indent
%.tmp2236 = sub i32 %.tmp2235, 1
call void(%m0$.File.type*,i32) @m2118$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2234, i32 %.tmp2236)
%.tmp2237 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2239 = getelementptr [2 x i8], [2 x i8]*@.str2238, i32 0, i32 0
%.tmp2240 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2237, i8* %.tmp2239)
ret void
}
define i8* @m2241$grammar.cp() {
%.tmp2243 = getelementptr [1886 x i8], [1886 x i8]*@.str2242, i32 0, i32 0
ret i8* %.tmp2243
}
define i8* @m2244$append_tmpl.cp() {
%.tmp2246 = getelementptr [1885 x i8], [1885 x i8]*@.str2245, i32 0, i32 0
ret i8* %.tmp2246
}
define i8* @m2247$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2248 = load i8*, i8** %text
%.tmp2249 = call i32(i8*) @strlen(i8* %.tmp2248)
%str_len.2250 = alloca i32
store i32 %.tmp2249, i32* %str_len.2250
%.tmp2252 = getelementptr [1 x i8], [1 x i8]*@.str2251, i32 0, i32 0
%buf.2253 = alloca i8*
store i8* %.tmp2252, i8** %buf.2253
%i.2255 = alloca i32
store i32 1, i32* %i.2255
br label %.for.start.2254
.for.start.2254:
%.tmp2256 = load i32, i32* %i.2255
%.tmp2257 = load i32, i32* %str_len.2250
%.tmp2258 = sub i32 %.tmp2257, 1
%.tmp2259 = icmp slt i32 %.tmp2256, %.tmp2258
br i1 %.tmp2259, label %.for.continue.2254, label %.for.end.2254
.for.continue.2254:
%.tmp2260 = load i32, i32* %i.2255
%.tmp2261 = load i8*, i8** %text
%.tmp2262 = getelementptr i8, i8* %.tmp2261, i32 %.tmp2260
%.tmp2263 = load i8, i8* %.tmp2262
%.tmp2264 = icmp eq i8 %.tmp2263, 34
br i1 %.tmp2264, label %.if.true.2265, label %.if.false.2265
.if.true.2265:
%.tmp2266 = getelementptr i8*, i8** %buf.2253, i32 0
%.tmp2268 = getelementptr [6 x i8], [6 x i8]*@.str2267, i32 0, i32 0
%.tmp2269 = load i8*, i8** %buf.2253
%.tmp2270 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2266, i8* %.tmp2268, i8* %.tmp2269)
br label %.if.end.2265
.if.false.2265:
%.tmp2271 = load i32, i32* %i.2255
%.tmp2272 = load i8*, i8** %text
%.tmp2273 = getelementptr i8, i8* %.tmp2272, i32 %.tmp2271
%.tmp2274 = load i8, i8* %.tmp2273
%.tmp2275 = icmp eq i8 %.tmp2274, 92
br i1 %.tmp2275, label %.if.true.2276, label %.if.false.2276
.if.true.2276:
%.tmp2277 = load i32, i32* %i.2255
%.tmp2278 = add i32 %.tmp2277, 1
%.tmp2279 = load i8*, i8** %text
%.tmp2280 = getelementptr i8, i8* %.tmp2279, i32 %.tmp2278
%.tmp2281 = load i8, i8* %.tmp2280
%.tmp2282 = icmp eq i8 %.tmp2281, 110
%.tmp2283 = load i32, i32* %i.2255
%.tmp2284 = add i32 %.tmp2283, 1
%.tmp2285 = load i8*, i8** %text
%.tmp2286 = getelementptr i8, i8* %.tmp2285, i32 %.tmp2284
%.tmp2287 = load i8, i8* %.tmp2286
%.tmp2288 = icmp eq i8 %.tmp2287, 78
%.tmp2289 = or i1 %.tmp2282, %.tmp2288
br i1 %.tmp2289, label %.if.true.2290, label %.if.false.2290
.if.true.2290:
%.tmp2291 = getelementptr i8*, i8** %buf.2253, i32 0
%.tmp2293 = getelementptr [6 x i8], [6 x i8]*@.str2292, i32 0, i32 0
%.tmp2294 = load i8*, i8** %buf.2253
%.tmp2295 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2291, i8* %.tmp2293, i8* %.tmp2294)
%.tmp2296 = load i32, i32* %i.2255
%.tmp2297 = add i32 %.tmp2296, 1
store i32 %.tmp2297, i32* %i.2255
br label %.if.end.2290
.if.false.2290:
%.tmp2298 = load i32, i32* %i.2255
%.tmp2299 = add i32 %.tmp2298, 1
%.tmp2300 = load i8*, i8** %text
%.tmp2301 = getelementptr i8, i8* %.tmp2300, i32 %.tmp2299
%.tmp2302 = load i8, i8* %.tmp2301
%.tmp2303 = icmp eq i8 %.tmp2302, 92
br i1 %.tmp2303, label %.if.true.2304, label %.if.false.2304
.if.true.2304:
%.tmp2305 = getelementptr i8*, i8** %buf.2253, i32 0
%.tmp2307 = getelementptr [6 x i8], [6 x i8]*@.str2306, i32 0, i32 0
%.tmp2308 = load i8*, i8** %buf.2253
%.tmp2309 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2305, i8* %.tmp2307, i8* %.tmp2308)
%.tmp2310 = load i32, i32* %i.2255
%.tmp2311 = add i32 %.tmp2310, 1
store i32 %.tmp2311, i32* %i.2255
br label %.if.end.2304
.if.false.2304:
%.tmp2312 = load i32, i32* %i.2255
%.tmp2313 = add i32 %.tmp2312, 1
%.tmp2314 = load i8*, i8** %text
%.tmp2315 = getelementptr i8, i8* %.tmp2314, i32 %.tmp2313
%.tmp2316 = load i8, i8* %.tmp2315
%.tmp2317 = icmp eq i8 %.tmp2316, 120
br i1 %.tmp2317, label %.if.true.2318, label %.if.false.2318
.if.true.2318:
%.tmp2319 = load i32, i32* %i.2255
%.tmp2320 = add i32 %.tmp2319, 2
store i32 %.tmp2320, i32* %i.2255
%.tmp2321 = getelementptr i8*, i8** %buf.2253, i32 0
%.tmp2323 = getelementptr [8 x i8], [8 x i8]*@.str2322, i32 0, i32 0
%.tmp2324 = load i8*, i8** %buf.2253
%.tmp2325 = load i32, i32* %i.2255
%.tmp2326 = load i8*, i8** %text
%.tmp2327 = getelementptr i8, i8* %.tmp2326, i32 %.tmp2325
%.tmp2328 = load i8, i8* %.tmp2327
%.tmp2329 = call i8(i8) @toupper(i8 %.tmp2328)
%.tmp2330 = load i32, i32* %i.2255
%.tmp2331 = add i32 %.tmp2330, 1
%.tmp2332 = load i8*, i8** %text
%.tmp2333 = getelementptr i8, i8* %.tmp2332, i32 %.tmp2331
%.tmp2334 = load i8, i8* %.tmp2333
%.tmp2335 = call i8(i8) @toupper(i8 %.tmp2334)
%.tmp2336 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2321, i8* %.tmp2323, i8* %.tmp2324, i8 %.tmp2329, i8 %.tmp2335)
%.tmp2337 = load i32, i32* %i.2255
%.tmp2338 = add i32 %.tmp2337, 1
store i32 %.tmp2338, i32* %i.2255
br label %.if.end.2318
.if.false.2318:
%.tmp2339 = getelementptr i8*, i8** %buf.2253, i32 0
%.tmp2341 = getelementptr [5 x i8], [5 x i8]*@.str2340, i32 0, i32 0
%.tmp2342 = load i8*, i8** %buf.2253
%.tmp2343 = load i32, i32* %i.2255
%.tmp2344 = load i8*, i8** %text
%.tmp2345 = getelementptr i8, i8* %.tmp2344, i32 %.tmp2343
%.tmp2346 = load i8, i8* %.tmp2345
%.tmp2347 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2339, i8* %.tmp2341, i8* %.tmp2342, i8 %.tmp2346)
br label %.if.end.2318
.if.end.2318:
br label %.if.end.2304
.if.end.2304:
br label %.if.end.2290
.if.end.2290:
br label %.if.end.2276
.if.false.2276:
%.tmp2348 = getelementptr i8*, i8** %buf.2253, i32 0
%.tmp2350 = getelementptr [5 x i8], [5 x i8]*@.str2349, i32 0, i32 0
%.tmp2351 = load i8*, i8** %buf.2253
%.tmp2352 = load i32, i32* %i.2255
%.tmp2353 = load i8*, i8** %text
%.tmp2354 = getelementptr i8, i8* %.tmp2353, i32 %.tmp2352
%.tmp2355 = load i8, i8* %.tmp2354
%.tmp2356 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2348, i8* %.tmp2350, i8* %.tmp2351, i8 %.tmp2355)
br label %.if.end.2276
.if.end.2276:
br label %.if.end.2265
.if.end.2265:
%.tmp2357 = load i32, i32* %i.2255
%.tmp2358 = add i32 %.tmp2357, 1
store i32 %.tmp2358, i32* %i.2255
br label %.for.start.2254
.for.end.2254:
%.tmp2359 = getelementptr i8*, i8** %buf.2253, i32 0
%.tmp2361 = getelementptr [9 x i8], [9 x i8]*@.str2360, i32 0, i32 0
%.tmp2362 = load i8*, i8** %buf.2253
%.tmp2363 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2359, i8* %.tmp2361, i8* %.tmp2362)
%.tmp2364 = load i8*, i8** %buf.2253
ret i8* %.tmp2364
}
define i32 @m2247$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len.2365 = alloca i32
store i32 0, i32* %len.2365
%i.2367 = alloca i32
store i32 2, i32* %i.2367
br label %.for.start.2366
.for.start.2366:
%.tmp2368 = load i32, i32* %i.2367
%.tmp2369 = load i8*, i8** %text
%.tmp2370 = getelementptr i8, i8* %.tmp2369, i32 %.tmp2368
%.tmp2371 = load i8, i8* %.tmp2370
%.tmp2372 = icmp ne i8 %.tmp2371, 0
br i1 %.tmp2372, label %.for.continue.2366, label %.for.end.2366
.for.continue.2366:
%.tmp2373 = load i32, i32* %i.2367
%.tmp2374 = load i8*, i8** %text
%.tmp2375 = getelementptr i8, i8* %.tmp2374, i32 %.tmp2373
%.tmp2376 = load i8, i8* %.tmp2375
%.tmp2377 = icmp eq i8 %.tmp2376, 92
br i1 %.tmp2377, label %.if.true.2378, label %.if.false.2378
.if.true.2378:
%.tmp2379 = load i32, i32* %i.2367
%.tmp2380 = add i32 %.tmp2379, 2
store i32 %.tmp2380, i32* %i.2367
br label %.if.end.2378
.if.false.2378:
br label %.if.end.2378
.if.end.2378:
%.tmp2381 = load i32, i32* %len.2365
%.tmp2382 = add i32 %.tmp2381, 1
store i32 %.tmp2382, i32* %len.2365
%.tmp2383 = load i32, i32* %i.2367
%.tmp2384 = add i32 %.tmp2383, 1
store i32 %.tmp2384, i32* %i.2367
br label %.for.start.2366
.for.end.2366:
%.tmp2385 = load i32, i32* %len.2365
%.tmp2386 = sub i32 %.tmp2385, 1
ret i32 %.tmp2386
}
define i8* @m2247$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval.2387 = alloca i32
store i32 0, i32* %intval.2387
%buf.2388 = alloca i8*
store i8* null, i8** %buf.2388
%chrval.2389 = alloca i8
store i8 0, i8* %chrval.2389
%.tmp2390 = load i8*, i8** %chr_repr
%.tmp2391 = call i32(i8*) @strlen(i8* %.tmp2390)
%chr_len.2392 = alloca i32
store i32 %.tmp2391, i32* %chr_len.2392
%.tmp2393 = load i32, i32* %chr_len.2392
%.tmp2394 = icmp eq i32 %.tmp2393, 6
br i1 %.tmp2394, label %.if.true.2395, label %.if.false.2395
.if.true.2395:
%.tmp2396 = load i8*, i8** %chr_repr
%.tmp2398 = getelementptr [7 x i8], [7 x i8]*@.str2397, i32 0, i32 0
%.tmp2399 = getelementptr i32, i32* %intval.2387, i32 0
%.tmp2400 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2396, i8* %.tmp2398, i32* %.tmp2399)
%.tmp2401 = getelementptr i8*, i8** %buf.2388, i32 0
%.tmp2403 = getelementptr [3 x i8], [3 x i8]*@.str2402, i32 0, i32 0
%.tmp2404 = load i32, i32* %intval.2387
%.tmp2405 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2401, i8* %.tmp2403, i32 %.tmp2404)
br label %.if.end.2395
.if.false.2395:
%.tmp2406 = load i32, i32* %chr_len.2392
%.tmp2407 = icmp eq i32 %.tmp2406, 5
br i1 %.tmp2407, label %.if.true.2408, label %.if.false.2408
.if.true.2408:
%.tmp2409 = load i8*, i8** %chr_repr
%.tmp2411 = getelementptr [6 x i8], [6 x i8]*@.str2410, i32 0, i32 0
%.tmp2412 = getelementptr i32, i32* %intval.2387, i32 0
%.tmp2413 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2409, i8* %.tmp2411, i32* %.tmp2412)
%.tmp2414 = getelementptr i8*, i8** %buf.2388, i32 0
%.tmp2416 = getelementptr [3 x i8], [3 x i8]*@.str2415, i32 0, i32 0
%.tmp2417 = load i32, i32* %intval.2387
%.tmp2418 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2414, i8* %.tmp2416, i32 %.tmp2417)
br label %.if.end.2408
.if.false.2408:
%.tmp2419 = load i32, i32* %chr_len.2392
%.tmp2420 = icmp eq i32 %.tmp2419, 4
br i1 %.tmp2420, label %.if.true.2421, label %.if.false.2421
.if.true.2421:
%.tmp2422 = load i8*, i8** %chr_repr
%.tmp2424 = getelementptr [6 x i8], [6 x i8]*@.str2423, i32 0, i32 0
%.tmp2425 = getelementptr i8, i8* %chrval.2389, i32 0
%.tmp2426 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2422, i8* %.tmp2424, i8* %.tmp2425)
%.tmp2427 = load i8, i8* %chrval.2389
%.tmp2428 = icmp eq i8 %.tmp2427, 110
br i1 %.tmp2428, label %.if.true.2429, label %.if.false.2429
.if.true.2429:
%.tmp2431 = getelementptr [3 x i8], [3 x i8]*@.str2430, i32 0, i32 0
store i8* %.tmp2431, i8** %buf.2388
br label %.if.end.2429
.if.false.2429:
%.tmp2432 = bitcast ptr null to i8*
ret i8* %.tmp2432
br label %.if.end.2429
.if.end.2429:
br label %.if.end.2421
.if.false.2421:
%.tmp2433 = load i32, i32* %chr_len.2392
%.tmp2434 = icmp eq i32 %.tmp2433, 3
br i1 %.tmp2434, label %.if.true.2435, label %.if.false.2435
.if.true.2435:
%.tmp2436 = load i8*, i8** %chr_repr
%.tmp2438 = getelementptr [5 x i8], [5 x i8]*@.str2437, i32 0, i32 0
%.tmp2439 = getelementptr i32, i32* %intval.2387, i32 0
%.tmp2440 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2436, i8* %.tmp2438, i32* %.tmp2439)
%.tmp2441 = getelementptr i8*, i8** %buf.2388, i32 0
%.tmp2443 = getelementptr [3 x i8], [3 x i8]*@.str2442, i32 0, i32 0
%.tmp2444 = load i32, i32* %intval.2387
%.tmp2445 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2441, i8* %.tmp2443, i32 %.tmp2444)
br label %.if.end.2435
.if.false.2435:
%.tmp2446 = bitcast ptr null to i8*
ret i8* %.tmp2446
br label %.if.end.2435
.if.end.2435:
br label %.if.end.2421
.if.end.2421:
br label %.if.end.2408
.if.end.2408:
br label %.if.end.2395
.if.end.2395:
%.tmp2447 = load i8*, i8** %buf.2388
ret i8* %.tmp2447
}
%m2448$.SYStack.type = type {%m980$.Node.type*,%m2448$.SYStack.type*}
@SYStack_size = constant i32 16
define %m2448$.SYStack.type* @m2448$stack_new.m2448$.SYStack.typep() {
%.tmp2449 = load i32, i32* @SYStack_size
%.tmp2450 = call i8*(i32) @malloc(i32 %.tmp2449)
%.tmp2451 = bitcast i8* %.tmp2450 to %m2448$.SYStack.type*
%s.2452 = alloca %m2448$.SYStack.type*
store %m2448$.SYStack.type* %.tmp2451, %m2448$.SYStack.type** %s.2452
%.tmp2453 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %s.2452
%.tmp2454 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2453, i32 0, i32 0
store %m980$.Node.type* null, %m980$.Node.type** %.tmp2454
%.tmp2455 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %s.2452
%.tmp2456 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2455, i32 0, i32 1
store %m2448$.SYStack.type* null, %m2448$.SYStack.type** %.tmp2456
%.tmp2457 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %s.2452
ret %m2448$.SYStack.type* %.tmp2457
}
define %m2448$.SYStack.type* @m2448$sy_algorithm.m2448$.SYStack.typep.m980$.Node.typep(%m980$.Node.type* %.assignable.arg) {
%assignable = alloca %m980$.Node.type*
store %m980$.Node.type* %.assignable.arg, %m980$.Node.type** %assignable
%.tmp2458 = call %m2448$.SYStack.type*() @m2448$stack_new.m2448$.SYStack.typep()
%out_stack.2459 = alloca %m2448$.SYStack.type*
store %m2448$.SYStack.type* %.tmp2458, %m2448$.SYStack.type** %out_stack.2459
%.tmp2460 = call %m2448$.SYStack.type*() @m2448$stack_new.m2448$.SYStack.typep()
%op_stack.2461 = alloca %m2448$.SYStack.type*
store %m2448$.SYStack.type* %.tmp2460, %m2448$.SYStack.type** %op_stack.2461
%.tmp2462 = call %m2448$.SYStack.type*() @m2448$stack_new.m2448$.SYStack.typep()
%token_stack.2463 = alloca %m2448$.SYStack.type*
store %m2448$.SYStack.type* %.tmp2462, %m2448$.SYStack.type** %token_stack.2463
%ptr.2464 = alloca %m980$.Node.type*
store %m980$.Node.type* null, %m980$.Node.type** %ptr.2464
%.tmp2466 = load %m980$.Node.type*, %m980$.Node.type** %assignable
store %m980$.Node.type* %.tmp2466, %m980$.Node.type** %ptr.2464
br label %.for.start.2465
.for.start.2465:
%.tmp2467 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2464
%.tmp2468 = icmp ne %m980$.Node.type* %.tmp2467, null
br i1 %.tmp2468, label %.for.continue.2465, label %.for.end.2465
.for.continue.2465:
%.tmp2469 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %token_stack.2463
%.tmp2470 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2464
%.tmp2471 = call %m2448$.SYStack.type*(%m2448$.SYStack.type*,%m980$.Node.type*) @m2448$stack_push.m2448$.SYStack.typep.m2448$.SYStack.typep.m980$.Node.typep(%m2448$.SYStack.type* %.tmp2469, %m980$.Node.type* %.tmp2470)
store %m2448$.SYStack.type* %.tmp2471, %m2448$.SYStack.type** %token_stack.2463
%.tmp2472 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2464
%.tmp2473 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2472, i32 0, i32 7
%.tmp2474 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2473
store %m980$.Node.type* %.tmp2474, %m980$.Node.type** %ptr.2464
br label %.for.start.2465
.for.end.2465:
%.tmp2476 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %token_stack.2463
%.tmp2477 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2476, i32 0, i32 0
%.tmp2478 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2477
store %m980$.Node.type* %.tmp2478, %m980$.Node.type** %ptr.2464
br label %.for.start.2475
.for.start.2475:
%.tmp2479 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2464
%.tmp2480 = icmp ne %m980$.Node.type* %.tmp2479, null
br i1 %.tmp2480, label %.for.continue.2475, label %.for.end.2475
.for.continue.2475:
%.tmp2481 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %token_stack.2463
%cs.2482 = alloca %m2448$.SYStack.type*
store %m2448$.SYStack.type* %.tmp2481, %m2448$.SYStack.type** %cs.2482
%.tmp2483 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %token_stack.2463
%.tmp2484 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2483, i32 0, i32 1
%.tmp2485 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %.tmp2484
store %m2448$.SYStack.type* %.tmp2485, %m2448$.SYStack.type** %token_stack.2463
%.tmp2486 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %cs.2482
%.tmp2487 = bitcast %m2448$.SYStack.type* %.tmp2486 to i8*
call void(i8*) @free(i8* %.tmp2487)
%.tmp2488 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2464
%.tmp2489 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2488, i32 0, i32 0
%.tmp2490 = load i8*, i8** %.tmp2489
%.tmp2492 = getelementptr [16 x i8], [16 x i8]*@.str2491, i32 0, i32 0
%.tmp2493 = call i32(i8*,i8*) @strcmp(i8* %.tmp2490, i8* %.tmp2492)
%.tmp2494 = icmp eq i32 %.tmp2493, 0
br i1 %.tmp2494, label %.if.true.2495, label %.if.false.2495
.if.true.2495:
%.tmp2496 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %out_stack.2459
%.tmp2497 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2464
%.tmp2498 = call %m2448$.SYStack.type*(%m2448$.SYStack.type*,%m980$.Node.type*) @m2448$stack_push.m2448$.SYStack.typep.m2448$.SYStack.typep.m980$.Node.typep(%m2448$.SYStack.type* %.tmp2496, %m980$.Node.type* %.tmp2497)
store %m2448$.SYStack.type* %.tmp2498, %m2448$.SYStack.type** %out_stack.2459
br label %.if.end.2495
.if.false.2495:
%.tmp2499 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2464
%.tmp2500 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2499, i32 0, i32 0
%.tmp2501 = load i8*, i8** %.tmp2500
%.tmp2503 = getelementptr [9 x i8], [9 x i8]*@.str2502, i32 0, i32 0
%.tmp2504 = call i32(i8*,i8*) @strcmp(i8* %.tmp2501, i8* %.tmp2503)
%.tmp2505 = icmp eq i32 %.tmp2504, 0
br i1 %.tmp2505, label %.if.true.2506, label %.if.false.2506
.if.true.2506:
%quit.2507 = alloca i1
store i1 0, i1* %quit.2507
br label %.for.start.2508
.for.start.2508:
%.tmp2509 = load i1, i1* %quit.2507
%.tmp2510 = icmp eq i1 %.tmp2509, 0
br i1 %.tmp2510, label %.for.continue.2508, label %.for.end.2508
.for.continue.2508:
%.tmp2511 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %op_stack.2461
%.tmp2512 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2511, i32 0, i32 0
%.tmp2513 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2512
%.tmp2514 = icmp eq %m980$.Node.type* %.tmp2513, null
br i1 %.tmp2514, label %.if.true.2515, label %.if.false.2515
.if.true.2515:
store i1 1, i1* %quit.2507
br label %.if.end.2515
.if.false.2515:
%.tmp2516 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %op_stack.2461
%.tmp2517 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2516, i32 0, i32 0
%.tmp2518 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2517
%.tmp2519 = call i32(%m980$.Node.type*) @m2448$op_precedence.i.m980$.Node.typep(%m980$.Node.type* %.tmp2518)
%.tmp2520 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2464
%.tmp2521 = call i32(%m980$.Node.type*) @m2448$op_precedence.i.m980$.Node.typep(%m980$.Node.type* %.tmp2520)
%.tmp2522 = icmp slt i32 %.tmp2519, %.tmp2521
br i1 %.tmp2522, label %.if.true.2523, label %.if.false.2523
.if.true.2523:
%.tmp2524 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %op_stack.2461
%top.2525 = alloca %m2448$.SYStack.type*
store %m2448$.SYStack.type* %.tmp2524, %m2448$.SYStack.type** %top.2525
%.tmp2526 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %op_stack.2461
%.tmp2527 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2526, i32 0, i32 1
%.tmp2528 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %.tmp2527
store %m2448$.SYStack.type* %.tmp2528, %m2448$.SYStack.type** %op_stack.2461
%.tmp2529 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %out_stack.2459
%.tmp2530 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %top.2525
%.tmp2531 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2530, i32 0, i32 0
%.tmp2532 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2531
%.tmp2533 = call %m2448$.SYStack.type*(%m2448$.SYStack.type*,%m980$.Node.type*) @m2448$stack_push.m2448$.SYStack.typep.m2448$.SYStack.typep.m980$.Node.typep(%m2448$.SYStack.type* %.tmp2529, %m980$.Node.type* %.tmp2532)
store %m2448$.SYStack.type* %.tmp2533, %m2448$.SYStack.type** %out_stack.2459
%.tmp2534 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %top.2525
%.tmp2535 = bitcast %m2448$.SYStack.type* %.tmp2534 to i8*
call void(i8*) @free(i8* %.tmp2535)
br label %.if.end.2523
.if.false.2523:
store i1 1, i1* %quit.2507
br label %.if.end.2523
.if.end.2523:
br label %.if.end.2515
.if.end.2515:
br label %.for.start.2508
.for.end.2508:
%.tmp2536 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %op_stack.2461
%.tmp2537 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2464
%.tmp2538 = call %m2448$.SYStack.type*(%m2448$.SYStack.type*,%m980$.Node.type*) @m2448$stack_push.m2448$.SYStack.typep.m2448$.SYStack.typep.m980$.Node.typep(%m2448$.SYStack.type* %.tmp2536, %m980$.Node.type* %.tmp2537)
store %m2448$.SYStack.type* %.tmp2538, %m2448$.SYStack.type** %op_stack.2461
br label %.if.end.2506
.if.false.2506:
%.tmp2540 = getelementptr [68 x i8], [68 x i8]*@.str2539, i32 0, i32 0
%.tmp2541 = load %m980$.Node.type*, %m980$.Node.type** %ptr.2464
%.tmp2542 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2541, i32 0, i32 0
%.tmp2543 = load i8*, i8** %.tmp2542
%.tmp2544 = call i32(i8*,...) @printf(i8* %.tmp2540, i8* %.tmp2543)
br label %.if.end.2506
.if.end.2506:
br label %.if.end.2495
.if.end.2495:
%.tmp2545 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %token_stack.2463
%.tmp2546 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2545, i32 0, i32 0
%.tmp2547 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2546
store %m980$.Node.type* %.tmp2547, %m980$.Node.type** %ptr.2464
br label %.for.start.2475
.for.end.2475:
br label %.for.start.2548
.for.start.2548:
%.tmp2549 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %op_stack.2461
%.tmp2550 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2549, i32 0, i32 0
%.tmp2551 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2550
%.tmp2552 = icmp ne %m980$.Node.type* %.tmp2551, null
br i1 %.tmp2552, label %.for.continue.2548, label %.for.end.2548
.for.continue.2548:
%.tmp2553 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %op_stack.2461
%.tmp2554 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2553, i32 0, i32 0
%.tmp2555 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2554
%node.2556 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp2555, %m980$.Node.type** %node.2556
%.tmp2557 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %op_stack.2461
%s.2558 = alloca %m2448$.SYStack.type*
store %m2448$.SYStack.type* %.tmp2557, %m2448$.SYStack.type** %s.2558
%.tmp2559 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %op_stack.2461
%.tmp2560 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2559, i32 0, i32 1
%.tmp2561 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %.tmp2560
store %m2448$.SYStack.type* %.tmp2561, %m2448$.SYStack.type** %op_stack.2461
%.tmp2562 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %s.2558
%.tmp2563 = bitcast %m2448$.SYStack.type* %.tmp2562 to i8*
call void(i8*) @free(i8* %.tmp2563)
%.tmp2564 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %out_stack.2459
%.tmp2565 = load %m980$.Node.type*, %m980$.Node.type** %node.2556
%.tmp2566 = call %m2448$.SYStack.type*(%m2448$.SYStack.type*,%m980$.Node.type*) @m2448$stack_push.m2448$.SYStack.typep.m2448$.SYStack.typep.m980$.Node.typep(%m2448$.SYStack.type* %.tmp2564, %m980$.Node.type* %.tmp2565)
store %m2448$.SYStack.type* %.tmp2566, %m2448$.SYStack.type** %out_stack.2459
br label %.for.start.2548
.for.end.2548:
%.tmp2567 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %out_stack.2459
ret %m2448$.SYStack.type* %.tmp2567
}
define %m2448$.SYStack.type* @m2448$stack_push.m2448$.SYStack.typep.m2448$.SYStack.typep.m980$.Node.typep(%m2448$.SYStack.type* %.curr_stack.arg, %m980$.Node.type* %.node.arg) {
%curr_stack = alloca %m2448$.SYStack.type*
store %m2448$.SYStack.type* %.curr_stack.arg, %m2448$.SYStack.type** %curr_stack
%node = alloca %m980$.Node.type*
store %m980$.Node.type* %.node.arg, %m980$.Node.type** %node
%.tmp2568 = load i32, i32* @SYStack_size
%.tmp2569 = call i8*(i32) @malloc(i32 %.tmp2568)
%.tmp2570 = bitcast i8* %.tmp2569 to %m2448$.SYStack.type*
%s.2571 = alloca %m2448$.SYStack.type*
store %m2448$.SYStack.type* %.tmp2570, %m2448$.SYStack.type** %s.2571
%.tmp2572 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %s.2571
%.tmp2573 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2572, i32 0, i32 0
%.tmp2574 = load %m980$.Node.type*, %m980$.Node.type** %node
store %m980$.Node.type* %.tmp2574, %m980$.Node.type** %.tmp2573
%.tmp2575 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %s.2571
%.tmp2576 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp2575, i32 0, i32 1
%.tmp2577 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %curr_stack
store %m2448$.SYStack.type* %.tmp2577, %m2448$.SYStack.type** %.tmp2576
%.tmp2578 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %s.2571
ret %m2448$.SYStack.type* %.tmp2578
}
define i32 @m2448$op_precedence.i.m980$.Node.typep(%m980$.Node.type* %.n.arg) {
%n = alloca %m980$.Node.type*
store %m980$.Node.type* %.n.arg, %m980$.Node.type** %n
%.tmp2579 = load %m980$.Node.type*, %m980$.Node.type** %n
%.tmp2580 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2579, i32 0, i32 6
%.tmp2581 = load %m980$.Node.type*, %m980$.Node.type** %.tmp2580
%op.2582 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp2581, %m980$.Node.type** %op.2582
%.tmp2583 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2584 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2583, i32 0, i32 1
%.tmp2585 = load i8*, i8** %.tmp2584
%.tmp2587 = getelementptr [2 x i8], [2 x i8]*@.str2586, i32 0, i32 0
%.tmp2588 = call i32(i8*,i8*) @strcmp(i8* %.tmp2585, i8* %.tmp2587)
%.tmp2589 = icmp eq i32 %.tmp2588, 0
%.tmp2590 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2591 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2590, i32 0, i32 1
%.tmp2592 = load i8*, i8** %.tmp2591
%.tmp2594 = getelementptr [2 x i8], [2 x i8]*@.str2593, i32 0, i32 0
%.tmp2595 = call i32(i8*,i8*) @strcmp(i8* %.tmp2592, i8* %.tmp2594)
%.tmp2596 = icmp eq i32 %.tmp2595, 0
%.tmp2597 = or i1 %.tmp2589, %.tmp2596
br i1 %.tmp2597, label %.if.true.2598, label %.if.false.2598
.if.true.2598:
ret i32 4
br label %.if.end.2598
.if.false.2598:
%.tmp2599 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2600 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2599, i32 0, i32 1
%.tmp2601 = load i8*, i8** %.tmp2600
%.tmp2603 = getelementptr [2 x i8], [2 x i8]*@.str2602, i32 0, i32 0
%.tmp2604 = call i32(i8*,i8*) @strcmp(i8* %.tmp2601, i8* %.tmp2603)
%.tmp2605 = icmp eq i32 %.tmp2604, 0
%.tmp2606 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2607 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2606, i32 0, i32 1
%.tmp2608 = load i8*, i8** %.tmp2607
%.tmp2610 = getelementptr [2 x i8], [2 x i8]*@.str2609, i32 0, i32 0
%.tmp2611 = call i32(i8*,i8*) @strcmp(i8* %.tmp2608, i8* %.tmp2610)
%.tmp2612 = icmp eq i32 %.tmp2611, 0
%.tmp2613 = or i1 %.tmp2605, %.tmp2612
%.tmp2614 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2615 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2614, i32 0, i32 1
%.tmp2616 = load i8*, i8** %.tmp2615
%.tmp2618 = getelementptr [2 x i8], [2 x i8]*@.str2617, i32 0, i32 0
%.tmp2619 = call i32(i8*,i8*) @strcmp(i8* %.tmp2616, i8* %.tmp2618)
%.tmp2620 = icmp eq i32 %.tmp2619, 0
%.tmp2621 = or i1 %.tmp2613, %.tmp2620
br i1 %.tmp2621, label %.if.true.2622, label %.if.false.2622
.if.true.2622:
ret i32 3
br label %.if.end.2622
.if.false.2622:
%.tmp2623 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2624 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2623, i32 0, i32 1
%.tmp2625 = load i8*, i8** %.tmp2624
%.tmp2627 = getelementptr [3 x i8], [3 x i8]*@.str2626, i32 0, i32 0
%.tmp2628 = call i32(i8*,i8*) @strcmp(i8* %.tmp2625, i8* %.tmp2627)
%.tmp2629 = icmp eq i32 %.tmp2628, 0
%.tmp2630 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2631 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2630, i32 0, i32 1
%.tmp2632 = load i8*, i8** %.tmp2631
%.tmp2634 = getelementptr [3 x i8], [3 x i8]*@.str2633, i32 0, i32 0
%.tmp2635 = call i32(i8*,i8*) @strcmp(i8* %.tmp2632, i8* %.tmp2634)
%.tmp2636 = icmp eq i32 %.tmp2635, 0
%.tmp2637 = or i1 %.tmp2629, %.tmp2636
br i1 %.tmp2637, label %.if.true.2638, label %.if.false.2638
.if.true.2638:
ret i32 7
br label %.if.end.2638
.if.false.2638:
%.tmp2639 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2640 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2639, i32 0, i32 1
%.tmp2641 = load i8*, i8** %.tmp2640
%.tmp2643 = getelementptr [3 x i8], [3 x i8]*@.str2642, i32 0, i32 0
%.tmp2644 = call i32(i8*,i8*) @strcmp(i8* %.tmp2641, i8* %.tmp2643)
%.tmp2645 = icmp eq i32 %.tmp2644, 0
%.tmp2646 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2647 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2646, i32 0, i32 1
%.tmp2648 = load i8*, i8** %.tmp2647
%.tmp2650 = getelementptr [3 x i8], [3 x i8]*@.str2649, i32 0, i32 0
%.tmp2651 = call i32(i8*,i8*) @strcmp(i8* %.tmp2648, i8* %.tmp2650)
%.tmp2652 = icmp eq i32 %.tmp2651, 0
%.tmp2653 = or i1 %.tmp2645, %.tmp2652
br i1 %.tmp2653, label %.if.true.2654, label %.if.false.2654
.if.true.2654:
ret i32 6
br label %.if.end.2654
.if.false.2654:
%.tmp2655 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2656 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2655, i32 0, i32 1
%.tmp2657 = load i8*, i8** %.tmp2656
%.tmp2659 = getelementptr [2 x i8], [2 x i8]*@.str2658, i32 0, i32 0
%.tmp2660 = call i32(i8*,i8*) @strcmp(i8* %.tmp2657, i8* %.tmp2659)
%.tmp2661 = icmp eq i32 %.tmp2660, 0
%.tmp2662 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2663 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2662, i32 0, i32 1
%.tmp2664 = load i8*, i8** %.tmp2663
%.tmp2666 = getelementptr [2 x i8], [2 x i8]*@.str2665, i32 0, i32 0
%.tmp2667 = call i32(i8*,i8*) @strcmp(i8* %.tmp2664, i8* %.tmp2666)
%.tmp2668 = icmp eq i32 %.tmp2667, 0
%.tmp2669 = or i1 %.tmp2661, %.tmp2668
br i1 %.tmp2669, label %.if.true.2670, label %.if.false.2670
.if.true.2670:
ret i32 6
br label %.if.end.2670
.if.false.2670:
%.tmp2671 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2672 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2671, i32 0, i32 1
%.tmp2673 = load i8*, i8** %.tmp2672
%.tmp2675 = getelementptr [2 x i8], [2 x i8]*@.str2674, i32 0, i32 0
%.tmp2676 = call i32(i8*,i8*) @strcmp(i8* %.tmp2673, i8* %.tmp2675)
%.tmp2677 = icmp eq i32 %.tmp2676, 0
br i1 %.tmp2677, label %.if.true.2678, label %.if.false.2678
.if.true.2678:
ret i32 11
br label %.if.end.2678
.if.false.2678:
%.tmp2679 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2680 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2679, i32 0, i32 1
%.tmp2681 = load i8*, i8** %.tmp2680
%.tmp2683 = getelementptr [2 x i8], [2 x i8]*@.str2682, i32 0, i32 0
%.tmp2684 = call i32(i8*,i8*) @strcmp(i8* %.tmp2681, i8* %.tmp2683)
%.tmp2685 = icmp eq i32 %.tmp2684, 0
br i1 %.tmp2685, label %.if.true.2686, label %.if.false.2686
.if.true.2686:
ret i32 12
br label %.if.end.2686
.if.false.2686:
br label %.if.end.2686
.if.end.2686:
br label %.if.end.2678
.if.end.2678:
br label %.if.end.2670
.if.end.2670:
br label %.if.end.2654
.if.end.2654:
br label %.if.end.2638
.if.end.2638:
br label %.if.end.2622
.if.end.2622:
br label %.if.end.2598
.if.end.2598:
%.tmp2688 = getelementptr [65 x i8], [65 x i8]*@.str2687, i32 0, i32 0
%.tmp2689 = load %m980$.Node.type*, %m980$.Node.type** %op.2582
%.tmp2690 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp2689, i32 0, i32 1
%.tmp2691 = load i8*, i8** %.tmp2690
%.tmp2692 = call i32(i8*,...) @printf(i8* %.tmp2688, i8* %.tmp2691)
ret i32 4
}
%m2693$.Type.type = type {i8*,i8*,i8*,%m2693$.Type.type*,%m2693$.Type.type*}
%m2693$.ErrorList.type = type {%m296$.Error.type*,%m2693$.ErrorList.type*,i1}
%m2693$.AssignableInfo.type = type {i8*,i8,i8*,i8*,%m2693$.Type.type*,i32,i32,i8*}
%m2693$.ScopeItem.type = type {i8*,%m2693$.AssignableInfo.type*,%m2693$.ScopeItem.type*}
%m2693$.Scope.type = type {i8*,%m2693$.ScopeItem.type*,i8*,i8*,i8*,%m2693$.Scope.type*,%m2693$.Type.type*}
%m2693$.GlobalName.type = type {i8*,i8*,i1,i1,%m2693$.AssignableInfo.type*,%m2693$.GlobalName.type*}
%m2693$.ModuleLookup.type = type {i8*,i8*,%m2693$.ModuleLookup.type*,%m2693$.Scope.type*}
%m2693$.AnonFn.type = type {i8*,%m2693$.AnonFn.type*}
%m2693$.CompilerCtx.type = type {%m980$.Node.type*,%m0$.File.type*,%m2693$.ErrorList.type*,%m2693$.GlobalName.type*,%m980$.Rule.type**,i32,%m2693$.ModuleLookup.type*,i8*,%m2693$.AnonFn.type*}
define i8* @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.Type.type* %.type.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%type = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.type.arg, %m2693$.Type.type** %type
%.tmp2695 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2696 = icmp eq %m2693$.Type.type* %.tmp2695, null
br i1 %.tmp2696, label %.if.true.2697, label %.if.false.2697
.if.true.2697:
%.tmp2699 = getelementptr [2 x i8], [2 x i8]*@.str2698, i32 0, i32 0
ret i8* %.tmp2699
br label %.if.end.2697
.if.false.2697:
br label %.if.end.2697
.if.end.2697:
%.tmp2700 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2701 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2700, i32 0, i32 0
%.tmp2702 = load i8*, i8** %.tmp2701
%.tmp2703 = icmp ne i8* %.tmp2702, null
%.tmp2705 = getelementptr [54 x i8], [54 x i8]*@.str2704, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2703, i8* %.tmp2705)
%buf.2706 = alloca i8*
store i8* null, i8** %buf.2706
%.tmp2707 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2708 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2707, i32 0, i32 0
%.tmp2709 = load i8*, i8** %.tmp2708
%.tmp2711 = getelementptr [4 x i8], [4 x i8]*@.str2710, i32 0, i32 0
%.tmp2712 = call i32(i8*,i8*) @strcmp(i8* %.tmp2709, i8* %.tmp2711)
%.tmp2713 = icmp eq i32 %.tmp2712, 0
br i1 %.tmp2713, label %.if.true.2714, label %.if.false.2714
.if.true.2714:
%.tmp2716 = getelementptr [4 x i8], [4 x i8]*@.str2715, i32 0, i32 0
ret i8* %.tmp2716
br label %.if.end.2714
.if.false.2714:
%.tmp2717 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2718 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2717, i32 0, i32 0
%.tmp2719 = load i8*, i8** %.tmp2718
%.tmp2721 = getelementptr [5 x i8], [5 x i8]*@.str2720, i32 0, i32 0
%.tmp2722 = call i32(i8*,i8*) @strcmp(i8* %.tmp2719, i8* %.tmp2721)
%.tmp2723 = icmp eq i32 %.tmp2722, 0
br i1 %.tmp2723, label %.if.true.2724, label %.if.false.2724
.if.true.2724:
%.tmp2726 = getelementptr [5 x i8], [5 x i8]*@.str2725, i32 0, i32 0
ret i8* %.tmp2726
br label %.if.end.2724
.if.false.2724:
%.tmp2727 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2728 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2727, i32 0, i32 0
%.tmp2729 = load i8*, i8** %.tmp2728
%.tmp2731 = getelementptr [5 x i8], [5 x i8]*@.str2730, i32 0, i32 0
%.tmp2732 = call i32(i8*,i8*) @strcmp(i8* %.tmp2729, i8* %.tmp2731)
%.tmp2733 = icmp eq i32 %.tmp2732, 0
br i1 %.tmp2733, label %.if.true.2734, label %.if.false.2734
.if.true.2734:
%.tmp2736 = getelementptr [3 x i8], [3 x i8]*@.str2735, i32 0, i32 0
ret i8* %.tmp2736
br label %.if.end.2734
.if.false.2734:
%.tmp2737 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2738 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2737, i32 0, i32 0
%.tmp2739 = load i8*, i8** %.tmp2738
%.tmp2741 = getelementptr [8 x i8], [8 x i8]*@.str2740, i32 0, i32 0
%.tmp2742 = call i32(i8*,i8*) @strcmp(i8* %.tmp2739, i8* %.tmp2741)
%.tmp2743 = icmp eq i32 %.tmp2742, 0
br i1 %.tmp2743, label %.if.true.2744, label %.if.false.2744
.if.true.2744:
%.tmp2746 = getelementptr [4 x i8], [4 x i8]*@.str2745, i32 0, i32 0
ret i8* %.tmp2746
br label %.if.end.2744
.if.false.2744:
%.tmp2747 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2748 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2747, i32 0, i32 0
%.tmp2749 = load i8*, i8** %.tmp2748
%.tmp2751 = getelementptr [4 x i8], [4 x i8]*@.str2750, i32 0, i32 0
%.tmp2752 = call i32(i8*,i8*) @strcmp(i8* %.tmp2749, i8* %.tmp2751)
%.tmp2753 = icmp eq i32 %.tmp2752, 0
br i1 %.tmp2753, label %.if.true.2754, label %.if.false.2754
.if.true.2754:
%.tmp2756 = getelementptr [3 x i8], [3 x i8]*@.str2755, i32 0, i32 0
ret i8* %.tmp2756
br label %.if.end.2754
.if.false.2754:
%.tmp2757 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2758 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2757, i32 0, i32 0
%.tmp2759 = load i8*, i8** %.tmp2758
%.tmp2761 = getelementptr [9 x i8], [9 x i8]*@.str2760, i32 0, i32 0
%.tmp2762 = call i32(i8*,i8*) @strcmp(i8* %.tmp2759, i8* %.tmp2761)
%.tmp2763 = icmp eq i32 %.tmp2762, 0
br i1 %.tmp2763, label %.if.true.2764, label %.if.false.2764
.if.true.2764:
%.tmp2765 = getelementptr i8*, i8** %buf.2706, i32 0
%.tmp2767 = getelementptr [4 x i8], [4 x i8]*@.str2766, i32 0, i32 0
%.tmp2768 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp2769 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2770 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2769, i32 0, i32 3
%.tmp2771 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2770
%.tmp2772 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp2768, %m2693$.Type.type* %.tmp2771)
%.tmp2773 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2765, i8* %.tmp2767, i8* %.tmp2772)
%.tmp2775 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2776 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2775, i32 0, i32 3
%.tmp2777 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2776
%.tmp2778 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2777, i32 0, i32 4
%.tmp2779 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2778
%p.2780 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp2779, %m2693$.Type.type** %p.2780
br label %.for.start.2774
.for.start.2774:
%.tmp2781 = load %m2693$.Type.type*, %m2693$.Type.type** %p.2780
%.tmp2782 = icmp ne %m2693$.Type.type* %.tmp2781, null
br i1 %.tmp2782, label %.for.continue.2774, label %.for.end.2774
.for.continue.2774:
%.tmp2783 = load %m2693$.Type.type*, %m2693$.Type.type** %p.2780
%.tmp2784 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2785 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2784, i32 0, i32 3
%.tmp2786 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2785
%.tmp2787 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2786, i32 0, i32 4
%.tmp2788 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2787
%.tmp2789 = icmp ne %m2693$.Type.type* %.tmp2783, %.tmp2788
br i1 %.tmp2789, label %.if.true.2790, label %.if.false.2790
.if.true.2790:
%.tmp2791 = getelementptr i8*, i8** %buf.2706, i32 0
%.tmp2793 = getelementptr [4 x i8], [4 x i8]*@.str2792, i32 0, i32 0
%.tmp2794 = load i8*, i8** %buf.2706
%.tmp2795 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2791, i8* %.tmp2793, i8* %.tmp2794)
br label %.if.end.2790
.if.false.2790:
br label %.if.end.2790
.if.end.2790:
%.tmp2796 = getelementptr i8*, i8** %buf.2706, i32 0
%.tmp2798 = getelementptr [5 x i8], [5 x i8]*@.str2797, i32 0, i32 0
%.tmp2799 = load i8*, i8** %buf.2706
%.tmp2800 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp2801 = load %m2693$.Type.type*, %m2693$.Type.type** %p.2780
%.tmp2802 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp2800, %m2693$.Type.type* %.tmp2801)
%.tmp2803 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2796, i8* %.tmp2798, i8* %.tmp2799, i8* %.tmp2802)
%.tmp2804 = load %m2693$.Type.type*, %m2693$.Type.type** %p.2780
%.tmp2805 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2804, i32 0, i32 4
%.tmp2806 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2805
store %m2693$.Type.type* %.tmp2806, %m2693$.Type.type** %p.2780
br label %.for.start.2774
.for.end.2774:
%.tmp2807 = getelementptr i8*, i8** %buf.2706, i32 0
%.tmp2809 = getelementptr [4 x i8], [4 x i8]*@.str2808, i32 0, i32 0
%.tmp2810 = load i8*, i8** %buf.2706
%.tmp2811 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2807, i8* %.tmp2809, i8* %.tmp2810)
%.tmp2812 = load i8*, i8** %buf.2706
ret i8* %.tmp2812
br label %.if.end.2764
.if.false.2764:
%.tmp2813 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2814 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2813, i32 0, i32 0
%.tmp2815 = load i8*, i8** %.tmp2814
%.tmp2817 = getelementptr [4 x i8], [4 x i8]*@.str2816, i32 0, i32 0
%.tmp2818 = call i32(i8*,i8*) @strcmp(i8* %.tmp2815, i8* %.tmp2817)
%.tmp2819 = icmp eq i32 %.tmp2818, 0
br i1 %.tmp2819, label %.if.true.2820, label %.if.false.2820
.if.true.2820:
%.tmp2821 = getelementptr i8*, i8** %buf.2706, i32 0
%.tmp2823 = getelementptr [4 x i8], [4 x i8]*@.str2822, i32 0, i32 0
%.tmp2824 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp2825 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2826 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2825, i32 0, i32 3
%.tmp2827 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2826
%.tmp2828 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp2824, %m2693$.Type.type* %.tmp2827)
%.tmp2829 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2821, i8* %.tmp2823, i8* %.tmp2828)
%.tmp2830 = load i8*, i8** %buf.2706
ret i8* %.tmp2830
br label %.if.end.2820
.if.false.2820:
%.tmp2831 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2832 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2831, i32 0, i32 0
%.tmp2833 = load i8*, i8** %.tmp2832
%.tmp2835 = getelementptr [7 x i8], [7 x i8]*@.str2834, i32 0, i32 0
%.tmp2836 = call i32(i8*,i8*) @strcmp(i8* %.tmp2833, i8* %.tmp2835)
%.tmp2837 = icmp eq i32 %.tmp2836, 0
br i1 %.tmp2837, label %.if.true.2838, label %.if.false.2838
.if.true.2838:
%.tmp2839 = getelementptr i8*, i8** %buf.2706, i32 0
%.tmp2841 = getelementptr [2 x i8], [2 x i8]*@.str2840, i32 0, i32 0
%.tmp2842 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2839, i8* %.tmp2841)
%.tmp2844 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2845 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2844, i32 0, i32 3
%.tmp2846 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2845
%t.2847 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp2846, %m2693$.Type.type** %t.2847
br label %.for.start.2843
.for.start.2843:
%.tmp2848 = load %m2693$.Type.type*, %m2693$.Type.type** %t.2847
%.tmp2849 = icmp ne %m2693$.Type.type* %.tmp2848, null
br i1 %.tmp2849, label %.for.continue.2843, label %.for.end.2843
.for.continue.2843:
%.tmp2850 = load %m2693$.Type.type*, %m2693$.Type.type** %t.2847
%.tmp2851 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2852 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2851, i32 0, i32 3
%.tmp2853 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2852
%.tmp2854 = icmp ne %m2693$.Type.type* %.tmp2850, %.tmp2853
br i1 %.tmp2854, label %.if.true.2855, label %.if.false.2855
.if.true.2855:
%.tmp2856 = getelementptr i8*, i8** %buf.2706, i32 0
%.tmp2858 = getelementptr [4 x i8], [4 x i8]*@.str2857, i32 0, i32 0
%.tmp2859 = load i8*, i8** %buf.2706
%.tmp2860 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2856, i8* %.tmp2858, i8* %.tmp2859)
br label %.if.end.2855
.if.false.2855:
br label %.if.end.2855
.if.end.2855:
%.tmp2861 = getelementptr i8*, i8** %buf.2706, i32 0
%.tmp2863 = getelementptr [5 x i8], [5 x i8]*@.str2862, i32 0, i32 0
%.tmp2864 = load i8*, i8** %buf.2706
%.tmp2865 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp2866 = load %m2693$.Type.type*, %m2693$.Type.type** %t.2847
%.tmp2867 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp2865, %m2693$.Type.type* %.tmp2866)
%.tmp2868 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2861, i8* %.tmp2863, i8* %.tmp2864, i8* %.tmp2867)
%.tmp2869 = load %m2693$.Type.type*, %m2693$.Type.type** %t.2847
%.tmp2870 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2869, i32 0, i32 4
%.tmp2871 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2870
store %m2693$.Type.type* %.tmp2871, %m2693$.Type.type** %t.2847
br label %.for.start.2843
.for.end.2843:
%.tmp2872 = getelementptr i8*, i8** %buf.2706, i32 0
%.tmp2874 = getelementptr [4 x i8], [4 x i8]*@.str2873, i32 0, i32 0
%.tmp2875 = load i8*, i8** %buf.2706
%.tmp2876 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2872, i8* %.tmp2874, i8* %.tmp2875)
%.tmp2877 = load i8*, i8** %buf.2706
ret i8* %.tmp2877
br label %.if.end.2838
.if.false.2838:
%.tmp2878 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2879 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2878, i32 0, i32 0
%.tmp2880 = load i8*, i8** %.tmp2879
%.tmp2882 = getelementptr [6 x i8], [6 x i8]*@.str2881, i32 0, i32 0
%.tmp2883 = call i32(i8*,i8*) @strcmp(i8* %.tmp2880, i8* %.tmp2882)
%.tmp2884 = icmp eq i32 %.tmp2883, 0
br i1 %.tmp2884, label %.if.true.2885, label %.if.false.2885
.if.true.2885:
%.tmp2886 = getelementptr i8*, i8** %buf.2706, i32 0
%.tmp2888 = getelementptr [10 x i8], [10 x i8]*@.str2887, i32 0, i32 0
%.tmp2889 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2890 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2889, i32 0, i32 3
%.tmp2891 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2890
%.tmp2892 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2891, i32 0, i32 4
%.tmp2893 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2892
%.tmp2894 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2893, i32 0, i32 0
%.tmp2895 = load i8*, i8** %.tmp2894
%.tmp2896 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp2897 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2898 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2897, i32 0, i32 3
%.tmp2899 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2898
%.tmp2900 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp2896, %m2693$.Type.type* %.tmp2899)
%.tmp2901 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2886, i8* %.tmp2888, i8* %.tmp2895, i8* %.tmp2900)
%.tmp2902 = load i8*, i8** %buf.2706
ret i8* %.tmp2902
br label %.if.end.2885
.if.false.2885:
%.tmp2903 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2904 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2903, i32 0, i32 0
%.tmp2905 = load i8*, i8** %.tmp2904
%.tmp2907 = getelementptr [10 x i8], [10 x i8]*@.str2906, i32 0, i32 0
%.tmp2908 = call i32(i8*,i8*) @strcmp(i8* %.tmp2905, i8* %.tmp2907)
%.tmp2909 = icmp eq i32 %.tmp2908, 0
br i1 %.tmp2909, label %.if.true.2910, label %.if.false.2910
.if.true.2910:
%.tmp2911 = getelementptr i8*, i8** %buf.2706, i32 0
%.tmp2913 = getelementptr [5 x i8], [5 x i8]*@.str2912, i32 0, i32 0
%.tmp2914 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2915 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2914, i32 0, i32 2
%.tmp2916 = load i8*, i8** %.tmp2915
%.tmp2917 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2911, i8* %.tmp2913, i8* %.tmp2916)
%.tmp2918 = load i8*, i8** %buf.2706
ret i8* %.tmp2918
br label %.if.end.2910
.if.false.2910:
%.tmp2919 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2920 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2919, i32 0, i32 0
%.tmp2921 = load i8*, i8** %.tmp2920
%.tmp2923 = getelementptr [7 x i8], [7 x i8]*@.str2922, i32 0, i32 0
%.tmp2924 = call i32(i8*,i8*) @strcmp(i8* %.tmp2921, i8* %.tmp2923)
%.tmp2925 = icmp eq i32 %.tmp2924, 0
br i1 %.tmp2925, label %.if.true.2926, label %.if.false.2926
.if.true.2926:
%.tmp2928 = getelementptr [4 x i8], [4 x i8]*@.str2927, i32 0, i32 0
ret i8* %.tmp2928
br label %.if.end.2926
.if.false.2926:
%.tmp2929 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2930 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2929, i32 0, i32 0
%.tmp2931 = load i8*, i8** %.tmp2930
%.tmp2933 = getelementptr [6 x i8], [6 x i8]*@.str2932, i32 0, i32 0
%.tmp2934 = call i32(i8*,i8*) @strcmp(i8* %.tmp2931, i8* %.tmp2933)
%.tmp2935 = icmp eq i32 %.tmp2934, 0
br i1 %.tmp2935, label %.if.true.2936, label %.if.false.2936
.if.true.2936:
br label %.if.end.2936
.if.false.2936:
%.tmp2938 = getelementptr [53 x i8], [53 x i8]*@.str2937, i32 0, i32 0
%.tmp2939 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp2940 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2939, i32 0, i32 0
%.tmp2941 = load i8*, i8** %.tmp2940
%.tmp2942 = call i32(i8*,...) @printf(i8* %.tmp2938, i8* %.tmp2941)
br label %.if.end.2936
.if.end.2936:
br label %.if.end.2926
.if.end.2926:
br label %.if.end.2910
.if.end.2910:
br label %.if.end.2885
.if.end.2885:
br label %.if.end.2838
.if.end.2838:
br label %.if.end.2820
.if.end.2820:
br label %.if.end.2764
.if.end.2764:
br label %.if.end.2754
.if.end.2754:
br label %.if.end.2744
.if.end.2744:
br label %.if.end.2734
.if.end.2734:
br label %.if.end.2724
.if.end.2724:
br label %.if.end.2714
.if.end.2714:
%.tmp2943 = bitcast ptr null to i8*
ret i8* %.tmp2943
}
define i1 @m2694$cmp.b.m2693$.CompilerCtx.typep.m2693$.Type.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.Type.type* %.a.arg, %m2693$.Type.type* %.b.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%a = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.a.arg, %m2693$.Type.type** %a
%b = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.b.arg, %m2693$.Type.type** %b
%.tmp2944 = load %m2693$.Type.type*, %m2693$.Type.type** %a
%.tmp2945 = icmp eq %m2693$.Type.type* %.tmp2944, null
%.tmp2946 = load %m2693$.Type.type*, %m2693$.Type.type** %b
%.tmp2947 = icmp eq %m2693$.Type.type* %.tmp2946, null
%.tmp2948 = or i1 %.tmp2945, %.tmp2947
br i1 %.tmp2948, label %.if.true.2949, label %.if.false.2949
.if.true.2949:
ret i1 0
br label %.if.end.2949
.if.false.2949:
br label %.if.end.2949
.if.end.2949:
%.tmp2950 = load %m2693$.Type.type*, %m2693$.Type.type** %a
%.tmp2951 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2950, i32 0, i32 0
%.tmp2952 = load i8*, i8** %.tmp2951
%.tmp2954 = getelementptr [8 x i8], [8 x i8]*@.str2953, i32 0, i32 0
%.tmp2955 = call i32(i8*,i8*) @strcmp(i8* %.tmp2952, i8* %.tmp2954)
%.tmp2956 = icmp eq i32 %.tmp2955, 0
%.tmp2957 = load %m2693$.Type.type*, %m2693$.Type.type** %b
%.tmp2958 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2957, i32 0, i32 0
%.tmp2959 = load i8*, i8** %.tmp2958
%.tmp2961 = getelementptr [8 x i8], [8 x i8]*@.str2960, i32 0, i32 0
%.tmp2962 = call i32(i8*,i8*) @strcmp(i8* %.tmp2959, i8* %.tmp2961)
%.tmp2963 = icmp eq i32 %.tmp2962, 0
%.tmp2964 = or i1 %.tmp2956, %.tmp2963
br i1 %.tmp2964, label %.if.true.2965, label %.if.false.2965
.if.true.2965:
%.tmp2966 = load %m2693$.Type.type*, %m2693$.Type.type** %a
%.tmp2967 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2966, i32 0, i32 0
%.tmp2968 = load i8*, i8** %.tmp2967
%.tmp2970 = getelementptr [4 x i8], [4 x i8]*@.str2969, i32 0, i32 0
%.tmp2971 = call i32(i8*,i8*) @strcmp(i8* %.tmp2968, i8* %.tmp2970)
%.tmp2972 = icmp eq i32 %.tmp2971, 0
%.tmp2973 = load %m2693$.Type.type*, %m2693$.Type.type** %b
%.tmp2974 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2973, i32 0, i32 0
%.tmp2975 = load i8*, i8** %.tmp2974
%.tmp2977 = getelementptr [4 x i8], [4 x i8]*@.str2976, i32 0, i32 0
%.tmp2978 = call i32(i8*,i8*) @strcmp(i8* %.tmp2975, i8* %.tmp2977)
%.tmp2979 = icmp eq i32 %.tmp2978, 0
%.tmp2980 = or i1 %.tmp2972, %.tmp2979
ret i1 %.tmp2980
br label %.if.end.2965
.if.false.2965:
br label %.if.end.2965
.if.end.2965:
%.tmp2981 = load %m2693$.Type.type*, %m2693$.Type.type** %a
%.tmp2982 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2981, i32 0, i32 0
%.tmp2983 = load i8*, i8** %.tmp2982
%.tmp2985 = getelementptr [10 x i8], [10 x i8]*@.str2984, i32 0, i32 0
%.tmp2986 = call i32(i8*,i8*) @strcmp(i8* %.tmp2983, i8* %.tmp2985)
%.tmp2987 = icmp eq i32 %.tmp2986, 0
br i1 %.tmp2987, label %.if.true.2988, label %.if.false.2988
.if.true.2988:
%.tmp2989 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp2990 = load %m2693$.Type.type*, %m2693$.Type.type** %a
%.tmp2991 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2990, i32 0, i32 3
%.tmp2992 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp2991
%.tmp2993 = load %m2693$.Type.type*, %m2693$.Type.type** %b
%.tmp2994 = call i1(%m2693$.CompilerCtx.type*,%m2693$.Type.type*,%m2693$.Type.type*) @m2694$cmp.b.m2693$.CompilerCtx.typep.m2693$.Type.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp2989, %m2693$.Type.type* %.tmp2992, %m2693$.Type.type* %.tmp2993)
ret i1 %.tmp2994
br label %.if.end.2988
.if.false.2988:
br label %.if.end.2988
.if.end.2988:
%.tmp2995 = load %m2693$.Type.type*, %m2693$.Type.type** %b
%.tmp2996 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp2995, i32 0, i32 0
%.tmp2997 = load i8*, i8** %.tmp2996
%.tmp2999 = getelementptr [10 x i8], [10 x i8]*@.str2998, i32 0, i32 0
%.tmp3000 = call i32(i8*,i8*) @strcmp(i8* %.tmp2997, i8* %.tmp2999)
%.tmp3001 = icmp eq i32 %.tmp3000, 0
br i1 %.tmp3001, label %.if.true.3002, label %.if.false.3002
.if.true.3002:
%.tmp3003 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3004 = load %m2693$.Type.type*, %m2693$.Type.type** %a
%.tmp3005 = load %m2693$.Type.type*, %m2693$.Type.type** %b
%.tmp3006 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3005, i32 0, i32 3
%.tmp3007 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3006
%.tmp3008 = call i1(%m2693$.CompilerCtx.type*,%m2693$.Type.type*,%m2693$.Type.type*) @m2694$cmp.b.m2693$.CompilerCtx.typep.m2693$.Type.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp3003, %m2693$.Type.type* %.tmp3004, %m2693$.Type.type* %.tmp3007)
ret i1 %.tmp3008
br label %.if.end.3002
.if.false.3002:
br label %.if.end.3002
.if.end.3002:
%.tmp3009 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3010 = load %m2693$.Type.type*, %m2693$.Type.type** %a
%.tmp3011 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp3009, %m2693$.Type.type* %.tmp3010)
%a_repr.3012 = alloca i8*
store i8* %.tmp3011, i8** %a_repr.3012
%.tmp3013 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3014 = load %m2693$.Type.type*, %m2693$.Type.type** %b
%.tmp3015 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp3013, %m2693$.Type.type* %.tmp3014)
%b_repr.3016 = alloca i8*
store i8* %.tmp3015, i8** %b_repr.3016
%.tmp3017 = load i8*, i8** %a_repr.3012
%.tmp3018 = load i8*, i8** %b_repr.3016
%.tmp3019 = call i32(i8*,i8*) @strcmp(i8* %.tmp3017, i8* %.tmp3018)
%.tmp3020 = icmp eq i32 %.tmp3019, 0
ret i1 %.tmp3020
}
@DEBUG_INTERNALS = constant i1 0
define %m2693$.Type.type* @m295$type_clone.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.t.arg) {
%t = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.t.arg, %m2693$.Type.type** %t
%.tmp3021 = load %m2693$.Type.type*, %m2693$.Type.type** %t
%.tmp3022 = icmp eq %m2693$.Type.type* %.tmp3021, null
br i1 %.tmp3022, label %.if.true.3023, label %.if.false.3023
.if.true.3023:
%.tmp3024 = bitcast ptr null to %m2693$.Type.type*
ret %m2693$.Type.type* %.tmp3024
br label %.if.end.3023
.if.false.3023:
br label %.if.end.3023
.if.end.3023:
%.tmp3025 = getelementptr %m2693$.Type.type, %m2693$.Type.type* null, i32 1
%.tmp3026 = ptrtoint %m2693$.Type.type* %.tmp3025 to i32
%.tmp3027 = call i8*(i32) @malloc(i32 %.tmp3026)
%.tmp3028 = bitcast i8* %.tmp3027 to %m2693$.Type.type*
%clone.3029 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp3028, %m2693$.Type.type** %clone.3029
%.tmp3030 = load %m2693$.Type.type*, %m2693$.Type.type** %clone.3029
%.tmp3031 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3030, i32 0, i32 3
%.tmp3032 = load %m2693$.Type.type*, %m2693$.Type.type** %t
%.tmp3033 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3032, i32 0, i32 3
%.tmp3034 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3033
store %m2693$.Type.type* %.tmp3034, %m2693$.Type.type** %.tmp3031
%.tmp3035 = load %m2693$.Type.type*, %m2693$.Type.type** %clone.3029
%.tmp3036 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3035, i32 0, i32 4
%.tmp3037 = load %m2693$.Type.type*, %m2693$.Type.type** %t
%.tmp3038 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3037, i32 0, i32 4
%.tmp3039 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3038
%.tmp3040 = call %m2693$.Type.type*(%m2693$.Type.type*) @m295$type_clone.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.tmp3039)
store %m2693$.Type.type* %.tmp3040, %m2693$.Type.type** %.tmp3036
%.tmp3041 = load %m2693$.Type.type*, %m2693$.Type.type** %clone.3029
%.tmp3042 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3041, i32 0, i32 2
%.tmp3043 = load %m2693$.Type.type*, %m2693$.Type.type** %t
%.tmp3044 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3043, i32 0, i32 2
%.tmp3045 = load i8*, i8** %.tmp3044
store i8* %.tmp3045, i8** %.tmp3042
%.tmp3046 = load %m2693$.Type.type*, %m2693$.Type.type** %clone.3029
%.tmp3047 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3046, i32 0, i32 0
%.tmp3048 = load %m2693$.Type.type*, %m2693$.Type.type** %t
%.tmp3049 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3048, i32 0, i32 0
%.tmp3050 = load i8*, i8** %.tmp3049
store i8* %.tmp3050, i8** %.tmp3047
%.tmp3051 = load %m2693$.Type.type*, %m2693$.Type.type** %clone.3029
%.tmp3052 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3051, i32 0, i32 1
%.tmp3053 = load %m2693$.Type.type*, %m2693$.Type.type** %t
%.tmp3054 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3053, i32 0, i32 1
%.tmp3055 = load i8*, i8** %.tmp3054
store i8* %.tmp3055, i8** %.tmp3052
%.tmp3056 = load %m2693$.Type.type*, %m2693$.Type.type** %clone.3029
ret %m2693$.Type.type* %.tmp3056
}
define i8* @m295$get_root.cp() {
%.tmp3058 = getelementptr [12 x i8], [12 x i8]*@.str3057, i32 0, i32 0
%.tmp3059 = call i8*(i8*) @getenv(i8* %.tmp3058)
%project_root.3060 = alloca i8*
store i8* %.tmp3059, i8** %project_root.3060
%.tmp3061 = load i8*, i8** %project_root.3060
%.tmp3062 = icmp eq i8* %.tmp3061, null
br i1 %.tmp3062, label %.if.true.3063, label %.if.false.3063
.if.true.3063:
%.tmp3065 = getelementptr [5 x i8], [5 x i8]*@.str3064, i32 0, i32 0
%.tmp3066 = call i8*(i8*) @getenv(i8* %.tmp3065)
%home.3067 = alloca i8*
store i8* %.tmp3066, i8** %home.3067
%.tmp3068 = getelementptr i8*, i8** %project_root.3060, i32 0
%.tmp3070 = getelementptr [11 x i8], [11 x i8]*@.str3069, i32 0, i32 0
%.tmp3071 = load i8*, i8** %home.3067
%.tmp3072 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3068, i8* %.tmp3070, i8* %.tmp3071)
br label %.if.end.3063
.if.false.3063:
br label %.if.end.3063
.if.end.3063:
%.tmp3073 = load i8*, i8** %project_root.3060
ret i8* %.tmp3073
}
define %m2693$.Type.type* @m295$new_type.m2693$.Type.typep() {
%.tmp3074 = getelementptr %m2693$.Type.type, %m2693$.Type.type* null, i32 1
%.tmp3075 = ptrtoint %m2693$.Type.type* %.tmp3074 to i32
%.tmp3076 = call i8*(i32) @malloc(i32 %.tmp3075)
%.tmp3077 = bitcast i8* %.tmp3076 to %m2693$.Type.type*
%type.3078 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp3077, %m2693$.Type.type** %type.3078
%.tmp3079 = load %m2693$.Type.type*, %m2693$.Type.type** %type.3078
%.tmp3080 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3079, i32 0, i32 1
store i8* null, i8** %.tmp3080
%.tmp3081 = load %m2693$.Type.type*, %m2693$.Type.type** %type.3078
%.tmp3082 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3081, i32 0, i32 2
store i8* null, i8** %.tmp3082
%.tmp3083 = load %m2693$.Type.type*, %m2693$.Type.type** %type.3078
%.tmp3084 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3083, i32 0, i32 0
store i8* null, i8** %.tmp3084
%.tmp3085 = load %m2693$.Type.type*, %m2693$.Type.type** %type.3078
%.tmp3086 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3085, i32 0, i32 3
store %m2693$.Type.type* null, %m2693$.Type.type** %.tmp3086
%.tmp3087 = load %m2693$.Type.type*, %m2693$.Type.type** %type.3078
%.tmp3088 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3087, i32 0, i32 4
store %m2693$.Type.type* null, %m2693$.Type.type** %.tmp3088
%.tmp3089 = load %m2693$.Type.type*, %m2693$.Type.type** %type.3078
ret %m2693$.Type.type* %.tmp3089
}
define void @m295$copy_type.v.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.dest.arg, %m2693$.Type.type* %.src.arg) {
%dest = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.dest.arg, %m2693$.Type.type** %dest
%src = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.src.arg, %m2693$.Type.type** %src
%.tmp3090 = load %m2693$.Type.type*, %m2693$.Type.type** %dest
%.tmp3091 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3090, i32 0, i32 0
%.tmp3092 = load %m2693$.Type.type*, %m2693$.Type.type** %src
%.tmp3093 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3092, i32 0, i32 0
%.tmp3094 = load i8*, i8** %.tmp3093
store i8* %.tmp3094, i8** %.tmp3091
%.tmp3095 = load %m2693$.Type.type*, %m2693$.Type.type** %dest
%.tmp3096 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3095, i32 0, i32 1
%.tmp3097 = load %m2693$.Type.type*, %m2693$.Type.type** %src
%.tmp3098 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3097, i32 0, i32 1
%.tmp3099 = load i8*, i8** %.tmp3098
store i8* %.tmp3099, i8** %.tmp3096
%.tmp3100 = load %m2693$.Type.type*, %m2693$.Type.type** %dest
%.tmp3101 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3100, i32 0, i32 2
%.tmp3102 = load %m2693$.Type.type*, %m2693$.Type.type** %src
%.tmp3103 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3102, i32 0, i32 2
%.tmp3104 = load i8*, i8** %.tmp3103
store i8* %.tmp3104, i8** %.tmp3101
%.tmp3105 = load %m2693$.Type.type*, %m2693$.Type.type** %dest
%.tmp3106 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3105, i32 0, i32 3
%.tmp3107 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3106
%.tmp3108 = load %m2693$.Type.type*, %m2693$.Type.type** %src
%.tmp3109 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3108, i32 0, i32 3
%.tmp3110 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3109
%.tmp3111 = icmp ne %m2693$.Type.type* %.tmp3107, %.tmp3110
br i1 %.tmp3111, label %.if.true.3112, label %.if.false.3112
.if.true.3112:
%.tmp3113 = load %m2693$.Type.type*, %m2693$.Type.type** %dest
%.tmp3114 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3113, i32 0, i32 3
%.tmp3115 = load %m2693$.Type.type*, %m2693$.Type.type** %src
%.tmp3116 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3115, i32 0, i32 3
%.tmp3117 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3116
store %m2693$.Type.type* %.tmp3117, %m2693$.Type.type** %.tmp3114
%.tmp3118 = load %m2693$.Type.type*, %m2693$.Type.type** %dest
%.tmp3119 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3118, i32 0, i32 3
%.tmp3120 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3119
%.tmp3121 = load %m2693$.Type.type*, %m2693$.Type.type** %src
%.tmp3122 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3121, i32 0, i32 3
%.tmp3123 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3122
call void(%m2693$.Type.type*,%m2693$.Type.type*) @m295$copy_type.v.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.tmp3120, %m2693$.Type.type* %.tmp3123)
br label %.if.end.3112
.if.false.3112:
br label %.if.end.3112
.if.end.3112:
%.tmp3124 = load %m2693$.Type.type*, %m2693$.Type.type** %dest
%.tmp3125 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3124, i32 0, i32 4
%.tmp3126 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3125
%.tmp3127 = load %m2693$.Type.type*, %m2693$.Type.type** %src
%.tmp3128 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3127, i32 0, i32 4
%.tmp3129 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3128
%.tmp3130 = icmp ne %m2693$.Type.type* %.tmp3126, %.tmp3129
br i1 %.tmp3130, label %.if.true.3131, label %.if.false.3131
.if.true.3131:
%.tmp3132 = load %m2693$.Type.type*, %m2693$.Type.type** %dest
%.tmp3133 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3132, i32 0, i32 4
%.tmp3134 = load %m2693$.Type.type*, %m2693$.Type.type** %src
%.tmp3135 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3134, i32 0, i32 4
%.tmp3136 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3135
store %m2693$.Type.type* %.tmp3136, %m2693$.Type.type** %.tmp3133
%.tmp3137 = load %m2693$.Type.type*, %m2693$.Type.type** %dest
%.tmp3138 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3137, i32 0, i32 4
%.tmp3139 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3138
%.tmp3140 = load %m2693$.Type.type*, %m2693$.Type.type** %src
%.tmp3141 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3140, i32 0, i32 4
%.tmp3142 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3141
call void(%m2693$.Type.type*,%m2693$.Type.type*) @m295$copy_type.v.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.tmp3139, %m2693$.Type.type* %.tmp3142)
br label %.if.end.3131
.if.false.3131:
br label %.if.end.3131
.if.end.3131:
ret void
}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m2693$.AssignableInfo.type* @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.node.arg) {
%node = alloca %m980$.Node.type*
store %m980$.Node.type* %.node.arg, %m980$.Node.type** %node
%.tmp3143 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* null, i32 1
%.tmp3144 = ptrtoint %m2693$.AssignableInfo.type* %.tmp3143 to i32
%.tmp3145 = call i8*(i32) @malloc(i32 %.tmp3144)
%.tmp3146 = bitcast i8* %.tmp3145 to %m2693$.AssignableInfo.type*
%ptr.3147 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp3146, %m2693$.AssignableInfo.type** %ptr.3147
%.tmp3148 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %ptr.3147
%.tmp3149 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3148, i32 0, i32 1
%.tmp3150 = load i8, i8* @SCOPE_CONST
store i8 %.tmp3150, i8* %.tmp3149
%.tmp3151 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %ptr.3147
%.tmp3152 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3151, i32 0, i32 0
store i8* null, i8** %.tmp3152
%.tmp3153 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %ptr.3147
%.tmp3154 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3153, i32 0, i32 3
store i8* null, i8** %.tmp3154
%.tmp3155 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %ptr.3147
%.tmp3156 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3155, i32 0, i32 2
%.tmp3158 = getelementptr [1 x i8], [1 x i8]*@.str3157, i32 0, i32 0
store i8* %.tmp3158, i8** %.tmp3156
%.tmp3159 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %ptr.3147
%.tmp3160 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3159, i32 0, i32 4
store %m2693$.Type.type* null, %m2693$.Type.type** %.tmp3160
%.tmp3161 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp3162 = icmp ne %m980$.Node.type* %.tmp3161, null
br i1 %.tmp3162, label %.if.true.3163, label %.if.false.3163
.if.true.3163:
%.tmp3164 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %ptr.3147
%.tmp3165 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3164, i32 0, i32 5
%.tmp3166 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp3167 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3166, i32 0, i32 3
%.tmp3168 = load i32, i32* %.tmp3167
store i32 %.tmp3168, i32* %.tmp3165
%.tmp3169 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %ptr.3147
%.tmp3170 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3169, i32 0, i32 6
%.tmp3171 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp3172 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3171, i32 0, i32 4
%.tmp3173 = load i32, i32* %.tmp3172
store i32 %.tmp3173, i32* %.tmp3170
%.tmp3174 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %ptr.3147
%.tmp3175 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3174, i32 0, i32 7
%.tmp3176 = load %m980$.Node.type*, %m980$.Node.type** %node
%.tmp3177 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3176, i32 0, i32 2
%.tmp3178 = load i8*, i8** %.tmp3177
store i8* %.tmp3178, i8** %.tmp3175
br label %.if.end.3163
.if.false.3163:
%.tmp3179 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %ptr.3147
%.tmp3180 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3179, i32 0, i32 5
store i32 0, i32* %.tmp3180
%.tmp3181 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %ptr.3147
%.tmp3182 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3181, i32 0, i32 6
store i32 0, i32* %.tmp3182
%.tmp3183 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %ptr.3147
%.tmp3184 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3183, i32 0, i32 7
store i8* null, i8** %.tmp3184
br label %.if.end.3163
.if.end.3163:
%.tmp3185 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %ptr.3147
ret %m2693$.AssignableInfo.type* %.tmp3185
}
define void @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.info.arg, %m2693$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp3186 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp3187 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3186, i32 0, i32 0
%.tmp3188 = load i8*, i8** %id
store i8* %.tmp3188, i8** %.tmp3187
%.tmp3189 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp3190 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3189, i32 0, i32 1
%.tmp3191 = load i8, i8* %scope
store i8 %.tmp3191, i8* %.tmp3190
ret void
}
define i8* @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.info.arg) {
%info = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.info.arg, %m2693$.AssignableInfo.type** %info
%.tmp3192 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp3193 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3192, i32 0, i32 1
%.tmp3194 = load i8, i8* %.tmp3193
%.tmp3195 = load i8, i8* @SCOPE_CONST
%.tmp3196 = icmp eq i8 %.tmp3194, %.tmp3195
br i1 %.tmp3196, label %.if.true.3197, label %.if.false.3197
.if.true.3197:
%.tmp3198 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp3199 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3198, i32 0, i32 0
%.tmp3200 = load i8*, i8** %.tmp3199
ret i8* %.tmp3200
br label %.if.end.3197
.if.false.3197:
br label %.if.end.3197
.if.end.3197:
%.tmp3202 = getelementptr [1 x i8], [1 x i8]*@.str3201, i32 0, i32 0
%buf.3203 = alloca i8*
store i8* %.tmp3202, i8** %buf.3203
%.tmp3204 = getelementptr i8*, i8** %buf.3203, i32 0
%.tmp3206 = getelementptr [5 x i8], [5 x i8]*@.str3205, i32 0, i32 0
%.tmp3207 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp3208 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3207, i32 0, i32 1
%.tmp3209 = load i8, i8* %.tmp3208
%.tmp3210 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp3211 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3210, i32 0, i32 0
%.tmp3212 = load i8*, i8** %.tmp3211
%.tmp3213 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3204, i8* %.tmp3206, i8 %.tmp3209, i8* %.tmp3212)
%.tmp3214 = load i8*, i8** %buf.3203
ret i8* %.tmp3214
}
define void @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%info = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.info.arg, %m2693$.AssignableInfo.type** %info
%.tmp3216 = getelementptr [1 x i8], [1 x i8]*@.str3215, i32 0, i32 0
%tmp_buff.3217 = alloca i8*
store i8* %.tmp3216, i8** %tmp_buff.3217
%.tmp3218 = getelementptr i8*, i8** %tmp_buff.3217, i32 0
%.tmp3220 = getelementptr [7 x i8], [7 x i8]*@.str3219, i32 0, i32 0
%.tmp3221 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3222 = call i32(%m2693$.CompilerCtx.type*) @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp3221)
%.tmp3223 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3218, i8* %.tmp3220, i32 %.tmp3222)
%.tmp3224 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp3225 = load i8, i8* @SCOPE_LOCAL
%.tmp3226 = load i8*, i8** %tmp_buff.3217
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp3224, i8 %.tmp3225, i8* %.tmp3226)
ret void
}
define %m2693$.ModuleLookup.type* @m295$get_module.m2693$.ModuleLookup.typep.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp3228 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3229 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3228, i32 0, i32 6
%.tmp3230 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %.tmp3229
%m.3231 = alloca %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* %.tmp3230, %m2693$.ModuleLookup.type** %m.3231
br label %.for.start.3227
.for.start.3227:
%.tmp3232 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.3231
%.tmp3233 = icmp ne %m2693$.ModuleLookup.type* %.tmp3232, null
br i1 %.tmp3233, label %.for.continue.3227, label %.for.end.3227
.for.continue.3227:
%.tmp3234 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.3231
%.tmp3235 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3234, i32 0, i32 0
%.tmp3236 = load i8*, i8** %.tmp3235
%.tmp3237 = load i8*, i8** %filename
%.tmp3238 = call i32(i8*,i8*) @strcmp(i8* %.tmp3236, i8* %.tmp3237)
%.tmp3239 = icmp eq i32 %.tmp3238, 0
br i1 %.tmp3239, label %.if.true.3240, label %.if.false.3240
.if.true.3240:
%.tmp3241 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.3231
ret %m2693$.ModuleLookup.type* %.tmp3241
br label %.if.end.3240
.if.false.3240:
br label %.if.end.3240
.if.end.3240:
%.tmp3242 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.3231
%.tmp3243 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3242, i32 0, i32 2
%.tmp3244 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %.tmp3243
store %m2693$.ModuleLookup.type* %.tmp3244, %m2693$.ModuleLookup.type** %m.3231
br label %.for.start.3227
.for.end.3227:
%.tmp3245 = bitcast ptr null to %m2693$.ModuleLookup.type*
ret %m2693$.ModuleLookup.type* %.tmp3245
}
define %m2693$.ModuleLookup.type* @m295$get_current_module.m2693$.ModuleLookup.typep.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%.tmp3246 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3247 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3248 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3247, i32 0, i32 7
%.tmp3249 = load i8*, i8** %.tmp3248
%.tmp3250 = call %m2693$.ModuleLookup.type*(%m2693$.CompilerCtx.type*,i8*) @m295$get_module.m2693$.ModuleLookup.typep.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.tmp3246, i8* %.tmp3249)
ret %m2693$.ModuleLookup.type* %.tmp3250
}
define i32 @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%.tmp3251 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3252 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3251, i32 0, i32 5
%.tmp3253 = load i32, i32* %.tmp3252
%uid.3254 = alloca i32
store i32 %.tmp3253, i32* %uid.3254
%.tmp3255 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3256 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3255, i32 0, i32 5
%.tmp3257 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3258 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3257, i32 0, i32 5
%.tmp3259 = load i32, i32* %.tmp3258
%.tmp3260 = add i32 %.tmp3259, 1
store i32 %.tmp3260, i32* %.tmp3256
%.tmp3261 = load i32, i32* %uid.3254
ret i32 %.tmp3261
}
define %m2693$.CompilerCtx.type* @m295$new_context.m2693$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp3262 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* null, i32 1
%.tmp3263 = ptrtoint %m2693$.CompilerCtx.type* %.tmp3262 to i32
%.tmp3264 = call i8*(i32) @malloc(i32 %.tmp3263)
%.tmp3265 = bitcast i8* %.tmp3264 to %m2693$.CompilerCtx.type*
%ctx.3266 = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.tmp3265, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3267 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3268 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3267, i32 0, i32 1
%.tmp3269 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp3269, %m0$.File.type** %.tmp3268
%.tmp3270 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3271 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3270, i32 0, i32 0
%.tmp3272 = bitcast ptr null to %m980$.Node.type*
store %m980$.Node.type* %.tmp3272, %m980$.Node.type** %.tmp3271
%.tmp3273 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3274 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3273, i32 0, i32 2
store %m2693$.ErrorList.type* null, %m2693$.ErrorList.type** %.tmp3274
%.tmp3275 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3276 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3275, i32 0, i32 5
store i32 0, i32* %.tmp3276
%.tmp3277 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3278 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3277, i32 0, i32 3
store %m2693$.GlobalName.type* null, %m2693$.GlobalName.type** %.tmp3278
%.tmp3279 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3280 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3279, i32 0, i32 8
store %m2693$.AnonFn.type* null, %m2693$.AnonFn.type** %.tmp3280
%.tmp3281 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3282 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3281, i32 0, i32 7
%.tmp3283 = load i8*, i8** %filename
store i8* %.tmp3283, i8** %.tmp3282
%.tmp3284 = call i8*() @m2241$grammar.cp()
%.tmp3285 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp3284)
%grammar_file.3286 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp3285, %m0$.File.type** %grammar_file.3286
%.tmp3287 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3286
%.tmp3288 = icmp eq %m0$.File.type* %.tmp3287, null
br i1 %.tmp3288, label %.if.true.3289, label %.if.false.3289
.if.true.3289:
%.tmp3290 = bitcast ptr null to %m2693$.CompilerCtx.type*
ret %m2693$.CompilerCtx.type* %.tmp3290
br label %.if.end.3289
.if.false.3289:
br label %.if.end.3289
.if.end.3289:
%.tmp3291 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3286
%.tmp3292 = call %m980$.ParsingContext.type*(%m0$.File.type*) @m980$new_context.m980$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp3291)
%grammar_ctx.3293 = alloca %m980$.ParsingContext.type*
store %m980$.ParsingContext.type* %.tmp3292, %m980$.ParsingContext.type** %grammar_ctx.3293
%.tmp3294 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3286
%.tmp3295 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp3294)
%.tmp3296 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3297 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3296, i32 0, i32 4
%.tmp3298 = load %m980$.ParsingContext.type*, %m980$.ParsingContext.type** %grammar_ctx.3293
%.tmp3299 = call %m980$.Rule.type**(%m980$.ParsingContext.type*) @m980$parse_grammar.m980$.Rule.typepp.m980$.ParsingContext.typep(%m980$.ParsingContext.type* %.tmp3298)
store %m980$.Rule.type** %.tmp3299, %m980$.Rule.type*** %.tmp3297
%.tmp3300 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3301 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3300, i32 0, i32 4
%.tmp3302 = load %m980$.Rule.type**, %m980$.Rule.type*** %.tmp3301
%.tmp3303 = icmp eq %m980$.Rule.type** %.tmp3302, null
br i1 %.tmp3303, label %.if.true.3304, label %.if.false.3304
.if.true.3304:
%.tmp3306 = getelementptr [39 x i8], [39 x i8]*@.str3305, i32 0, i32 0
%.tmp3307 = call i32(i8*,...) @printf(i8* %.tmp3306)
call void(i32) @exit(i32 1)
br label %.if.end.3304
.if.false.3304:
br label %.if.end.3304
.if.end.3304:
%.tmp3308 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3309 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3308, i32 0, i32 6
%.tmp3310 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* null, i32 1
%.tmp3311 = ptrtoint %m2693$.ModuleLookup.type* %.tmp3310 to i32
%.tmp3312 = call i8*(i32) @malloc(i32 %.tmp3311)
%.tmp3313 = bitcast i8* %.tmp3312 to %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* %.tmp3313, %m2693$.ModuleLookup.type** %.tmp3309
%.tmp3314 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3315 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3314, i32 0, i32 6
%.tmp3316 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %.tmp3315
%.tmp3317 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3316, i32 0, i32 0
%.tmp3318 = load i8*, i8** %filename
store i8* %.tmp3318, i8** %.tmp3317
%.tmp3319 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3320 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3319, i32 0, i32 6
%.tmp3321 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %.tmp3320
%.tmp3322 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3321, i32 0, i32 3
store %m2693$.Scope.type* null, %m2693$.Scope.type** %.tmp3322
%.tmp3323 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3324 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3323, i32 0, i32 6
%.tmp3325 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %.tmp3324
%.tmp3326 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3325, i32 0, i32 1
%.tmp3328 = getelementptr [1 x i8], [1 x i8]*@.str3327, i32 0, i32 0
store i8* %.tmp3328, i8** %.tmp3326
%.tmp3329 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3330 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3329, i32 0, i32 6
%.tmp3331 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %.tmp3330
%.tmp3332 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3331, i32 0, i32 2
store %m2693$.ModuleLookup.type* null, %m2693$.ModuleLookup.type** %.tmp3332
%.tmp3333 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx.3266
%.tmp3334 = bitcast %m2693$.CompilerCtx.type* %.tmp3333 to %m2693$.CompilerCtx.type*
ret %m2693$.CompilerCtx.type* %.tmp3334
}
define void @m295$push_scope.v.m2693$.CompilerCtx.typep.cp.cp.cp.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.ctx.arg, i8* %.type.arg, i8* %.begin_id.arg, i8* %.end_id.arg, %m2693$.Type.type* %.t.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%type = alloca i8*
store i8* %.type.arg, i8** %type
%begin_id = alloca i8*
store i8* %.begin_id.arg, i8** %begin_id
%end_id = alloca i8*
store i8* %.end_id.arg, i8** %end_id
%t = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.t.arg, %m2693$.Type.type** %t
%.tmp3335 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* null, i32 1
%.tmp3336 = ptrtoint %m2693$.Scope.type* %.tmp3335 to i32
%.tmp3337 = call i8*(i32) @malloc(i32 %.tmp3336)
%.tmp3338 = bitcast i8* %.tmp3337 to %m2693$.Scope.type*
%s.3339 = alloca %m2693$.Scope.type*
store %m2693$.Scope.type* %.tmp3338, %m2693$.Scope.type** %s.3339
%.tmp3340 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3341 = call %m2693$.ModuleLookup.type*(%m2693$.CompilerCtx.type*) @m295$get_current_module.m2693$.ModuleLookup.typep.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp3340)
%m.3342 = alloca %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* %.tmp3341, %m2693$.ModuleLookup.type** %m.3342
%.tmp3343 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.3339
%.tmp3344 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp3343, i32 0, i32 5
%.tmp3345 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.3342
%.tmp3346 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3345, i32 0, i32 3
%.tmp3347 = load %m2693$.Scope.type*, %m2693$.Scope.type** %.tmp3346
store %m2693$.Scope.type* %.tmp3347, %m2693$.Scope.type** %.tmp3344
%.tmp3348 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.3339
%.tmp3349 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp3348, i32 0, i32 1
store %m2693$.ScopeItem.type* null, %m2693$.ScopeItem.type** %.tmp3349
%.tmp3350 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.3339
%.tmp3351 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp3350, i32 0, i32 2
%.tmp3352 = load i8*, i8** %type
store i8* %.tmp3352, i8** %.tmp3351
%.tmp3353 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.3339
%.tmp3354 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp3353, i32 0, i32 3
%.tmp3355 = load i8*, i8** %begin_id
store i8* %.tmp3355, i8** %.tmp3354
%.tmp3356 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.3339
%.tmp3357 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp3356, i32 0, i32 4
%.tmp3358 = load i8*, i8** %end_id
store i8* %.tmp3358, i8** %.tmp3357
%.tmp3359 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.3339
%.tmp3360 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp3359, i32 0, i32 6
%.tmp3361 = load %m2693$.Type.type*, %m2693$.Type.type** %t
store %m2693$.Type.type* %.tmp3361, %m2693$.Type.type** %.tmp3360
%.tmp3362 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.3342
%.tmp3363 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3362, i32 0, i32 3
%.tmp3364 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.3339
store %m2693$.Scope.type* %.tmp3364, %m2693$.Scope.type** %.tmp3363
ret void
}
define void @m295$pop_scope.v.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%.tmp3365 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3366 = call %m2693$.ModuleLookup.type*(%m2693$.CompilerCtx.type*) @m295$get_current_module.m2693$.ModuleLookup.typep.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp3365)
%m.3367 = alloca %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* %.tmp3366, %m2693$.ModuleLookup.type** %m.3367
%.tmp3368 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.3367
%.tmp3369 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3368, i32 0, i32 3
%.tmp3370 = load %m2693$.Scope.type*, %m2693$.Scope.type** %.tmp3369
%.tmp3371 = icmp ne %m2693$.Scope.type* %.tmp3370, null
%.tmp3373 = getelementptr [61 x i8], [61 x i8]*@.str3372, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp3371, i8* %.tmp3373)
%.tmp3374 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.3367
%.tmp3375 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3374, i32 0, i32 3
%.tmp3376 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.3367
%.tmp3377 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3376, i32 0, i32 3
%.tmp3378 = load %m2693$.Scope.type*, %m2693$.Scope.type** %.tmp3377
%.tmp3379 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp3378, i32 0, i32 5
%.tmp3380 = load %m2693$.Scope.type*, %m2693$.Scope.type** %.tmp3379
store %m2693$.Scope.type* %.tmp3380, %m2693$.Scope.type** %.tmp3375
ret void
}
define i1 @m295$compile_file.b.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp3381 = load i8*, i8** %filepath
%.tmp3382 = load i32, i32* @O_RDONLY
%.tmp3383 = call i32(i8*,i32) @open(i8* %.tmp3381, i32 %.tmp3382)
%input_fd.3384 = alloca i32
store i32 %.tmp3383, i32* %input_fd.3384
%.tmp3385 = load i32, i32* %input_fd.3384
%.tmp3386 = icmp sle i32 %.tmp3385, 0
br i1 %.tmp3386, label %.if.true.3387, label %.if.false.3387
.if.true.3387:
%.tmp3389 = getelementptr [1 x i8], [1 x i8]*@.str3388, i32 0, i32 0
%err_msg.3390 = alloca i8*
store i8* %.tmp3389, i8** %err_msg.3390
%.tmp3391 = getelementptr i8*, i8** %err_msg.3390, i32 0
%.tmp3393 = getelementptr [26 x i8], [26 x i8]*@.str3392, i32 0, i32 0
%.tmp3394 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3395 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3391, i8* %.tmp3393, %m980$.Node.type* %.tmp3394)
%.tmp3396 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3397 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3398 = load i8*, i8** %err_msg.3390
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp3396, %m980$.Node.type* %.tmp3397, i8* %.tmp3398)
ret i1 0
br label %.if.end.3387
.if.false.3387:
br label %.if.end.3387
.if.end.3387:
%.tmp3399 = load i32, i32* %input_fd.3384
%.tmp3400 = call %m298$.PeekerInfo.type*(i32) @m298$new.m298$.PeekerInfo.typep.i(i32 %.tmp3399)
%p.3401 = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.tmp3400, %m298$.PeekerInfo.type** %p.3401
%.tmp3402 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.3401
%.tmp3403 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp3402, i32 0, i32 6
%.tmp3404 = load i8*, i8** %filepath
store i8* %.tmp3404, i8** %.tmp3403
%.tmp3405 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.3401
%.tmp3406 = call %m297$.Token.type*(%m298$.PeekerInfo.type*,i1) @m297$tokenize.m297$.Token.typep.m298$.PeekerInfo.typep.b(%m298$.PeekerInfo.type* %.tmp3405, i1 0)
%tokens.3407 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp3406, %m297$.Token.type** %tokens.3407
%.tmp3408 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3409 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3408, i32 0, i32 4
%.tmp3410 = load %m980$.Rule.type**, %m980$.Rule.type*** %.tmp3409
%.tmp3412 = getelementptr [6 x i8], [6 x i8]*@.str3411, i32 0, i32 0
%.tmp3413 = load %m297$.Token.type*, %m297$.Token.type** %tokens.3407
%.tmp3414 = call %m980$.ParseResult.type*(%m980$.Rule.type**,i8*,%m297$.Token.type*) @m980$ast.m980$.ParseResult.typep.m980$.Rule.typepp.cp.m297$.Token.typep(%m980$.Rule.type** %.tmp3410, i8* %.tmp3412, %m297$.Token.type* %.tmp3413)
%ast.3415 = alloca %m980$.ParseResult.type*
store %m980$.ParseResult.type* %.tmp3414, %m980$.ParseResult.type** %ast.3415
%.tmp3416 = load i32, i32* %input_fd.3384
%.tmp3417 = call i32(i32) @close(i32 %.tmp3416)
%.tmp3418 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %ast.3415
%.tmp3419 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp3418, i32 0, i32 0
%.tmp3420 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3419
%.tmp3421 = icmp ne %m296$.Error.type* %.tmp3420, null
br i1 %.tmp3421, label %.if.true.3422, label %.if.false.3422
.if.true.3422:
%.tmp3423 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3424 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %ast.3415
%.tmp3425 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp3424, i32 0, i32 0
%.tmp3426 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3425
call void(%m2693$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2693$.CompilerCtx.typep.m296$.Error.typep(%m2693$.CompilerCtx.type* %.tmp3423, %m296$.Error.type* %.tmp3426)
%.tmp3427 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
call void(%m2693$.CompilerCtx.type*) @m295$report_errors.v.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp3427)
ret i1 1
br label %.if.end.3422
.if.false.3422:
br label %.if.end.3422
.if.end.3422:
%.tmp3428 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3429 = load %m980$.ParseResult.type*, %m980$.ParseResult.type** %ast.3415
%.tmp3430 = getelementptr %m980$.ParseResult.type, %m980$.ParseResult.type* %.tmp3429, i32 0, i32 1
%.tmp3431 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3430
%.tmp3432 = call i1(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile.b.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp3428, %m980$.Node.type* %.tmp3431)
ret i1 %.tmp3432
}
define void @m295$report_errors.v.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%.tmp3433 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3434 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3433, i32 0, i32 2
%.tmp3435 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %.tmp3434
%.tmp3436 = icmp ne %m2693$.ErrorList.type* %.tmp3435, null
br i1 %.tmp3436, label %.if.true.3437, label %.if.false.3437
.if.true.3437:
%.tmp3439 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3440 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3439, i32 0, i32 2
%.tmp3441 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %.tmp3440
%err.3442 = alloca %m2693$.ErrorList.type*
store %m2693$.ErrorList.type* %.tmp3441, %m2693$.ErrorList.type** %err.3442
br label %.for.start.3438
.for.start.3438:
%.tmp3443 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %err.3442
%.tmp3444 = icmp ne %m2693$.ErrorList.type* %.tmp3443, null
br i1 %.tmp3444, label %.for.continue.3438, label %.for.end.3438
.for.continue.3438:
%.tmp3445 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %err.3442
%.tmp3446 = getelementptr %m2693$.ErrorList.type, %m2693$.ErrorList.type* %.tmp3445, i32 0, i32 2
%.tmp3447 = load i1, i1* %.tmp3446
%.tmp3448 = icmp eq i1 %.tmp3447, 0
br i1 %.tmp3448, label %.if.true.3449, label %.if.false.3449
.if.true.3449:
%.tmp3450 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %err.3442
%.tmp3451 = getelementptr %m2693$.ErrorList.type, %m2693$.ErrorList.type* %.tmp3450, i32 0, i32 0
%.tmp3452 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3451
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp3452)
%.tmp3453 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %err.3442
%.tmp3454 = getelementptr %m2693$.ErrorList.type, %m2693$.ErrorList.type* %.tmp3453, i32 0, i32 2
store i1 1, i1* %.tmp3454
br label %.if.end.3449
.if.false.3449:
br label %.if.end.3449
.if.end.3449:
%.tmp3455 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %err.3442
%.tmp3456 = getelementptr %m2693$.ErrorList.type, %m2693$.ErrorList.type* %.tmp3455, i32 0, i32 1
%.tmp3457 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %.tmp3456
store %m2693$.ErrorList.type* %.tmp3457, %m2693$.ErrorList.type** %err.3442
br label %.for.start.3438
.for.end.3438:
br label %.if.end.3437
.if.false.3437:
br label %.if.end.3437
.if.end.3437:
ret void
}
define i1 @m295$compile.b.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.ast.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%ast = alloca %m980$.Node.type*
store %m980$.Node.type* %.ast.arg, %m980$.Node.type** %ast
%.tmp3458 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3459 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3458, i32 0, i32 2
%.tmp3460 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %.tmp3459
%.tmp3461 = icmp eq %m2693$.ErrorList.type* %.tmp3460, null
br i1 %.tmp3461, label %.if.true.3462, label %.if.false.3462
.if.true.3462:
%.tmp3463 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3464 = load %m980$.Node.type*, %m980$.Node.type** %ast
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_ast.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp3463, %m980$.Node.type* %.tmp3464)
br label %.if.end.3462
.if.false.3462:
br label %.if.end.3462
.if.end.3462:
%.tmp3465 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3466 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3465, i32 0, i32 2
%.tmp3467 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %.tmp3466
%.tmp3468 = icmp ne %m2693$.ErrorList.type* %.tmp3467, null
br i1 %.tmp3468, label %.if.true.3469, label %.if.false.3469
.if.true.3469:
%.tmp3470 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
call void(%m2693$.CompilerCtx.type*) @m295$report_errors.v.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp3470)
ret i1 1
br label %.if.end.3469
.if.false.3469:
br label %.if.end.3469
.if.end.3469:
ret i1 0
}
define void @m295$mark_weak_global.v.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp3472 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3473 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3472, i32 0, i32 3
%.tmp3474 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %.tmp3473
%g.3475 = alloca %m2693$.GlobalName.type*
store %m2693$.GlobalName.type* %.tmp3474, %m2693$.GlobalName.type** %g.3475
br label %.for.start.3471
.for.start.3471:
%.tmp3476 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g.3475
%.tmp3477 = icmp ne %m2693$.GlobalName.type* %.tmp3476, null
br i1 %.tmp3477, label %.for.continue.3471, label %.for.end.3471
.for.continue.3471:
%.tmp3478 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g.3475
%.tmp3479 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp3478, i32 0, i32 3
%.tmp3480 = load i1, i1* %.tmp3479
%.tmp3481 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g.3475
%.tmp3482 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp3481, i32 0, i32 0
%.tmp3483 = load i8*, i8** %.tmp3482
%.tmp3484 = load i8*, i8** %id
%.tmp3485 = call i32(i8*,i8*) @strcmp(i8* %.tmp3483, i8* %.tmp3484)
%.tmp3486 = icmp eq i32 %.tmp3485, 0
%.tmp3487 = and i1 %.tmp3480, %.tmp3486
br i1 %.tmp3487, label %.if.true.3488, label %.if.false.3488
.if.true.3488:
%.tmp3489 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g.3475
%.tmp3490 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp3489, i32 0, i32 2
store i1 1, i1* %.tmp3490
br label %.for.end.3471
br label %.if.end.3488
.if.false.3488:
br label %.if.end.3488
.if.end.3488:
%.tmp3491 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g.3475
%.tmp3492 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp3491, i32 0, i32 5
%.tmp3493 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %.tmp3492
store %m2693$.GlobalName.type* %.tmp3493, %m2693$.GlobalName.type** %g.3475
br label %.for.start.3471
.for.end.3471:
ret void
}
define void @m295$compile_ast.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.ast.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%ast = alloca %m980$.Node.type*
store %m980$.Node.type* %.ast.arg, %m980$.Node.type** %ast
%.tmp3494 = load %m980$.Node.type*, %m980$.Node.type** %ast
%.tmp3495 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3494, i32 0, i32 0
%.tmp3496 = load i8*, i8** %.tmp3495
%.tmp3498 = getelementptr [6 x i8], [6 x i8]*@.str3497, i32 0, i32 0
%.tmp3499 = call i32(i8*,i8*) @strcmp(i8* %.tmp3496, i8* %.tmp3498)
%.tmp3500 = icmp ne i32 %.tmp3499, 0
br i1 %.tmp3500, label %.if.true.3501, label %.if.false.3501
.if.true.3501:
%.tmp3502 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3503 = load %m980$.Node.type*, %m980$.Node.type** %ast
%.tmp3505 = getelementptr [29 x i8], [29 x i8]*@.str3504, i32 0, i32 0
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp3502, %m980$.Node.type* %.tmp3503, i8* %.tmp3505)
ret void
br label %.if.end.3501
.if.false.3501:
br label %.if.end.3501
.if.end.3501:
%.tmp3506 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3508 = getelementptr [7 x i8], [7 x i8]*@.str3507, i32 0, i32 0
%.tmp3509 = bitcast ptr null to i8*
%.tmp3510 = bitcast ptr null to i8*
%.tmp3511 = bitcast ptr null to %m2693$.Type.type*
call void(%m2693$.CompilerCtx.type*,i8*,i8*,i8*,%m2693$.Type.type*) @m295$push_scope.v.m2693$.CompilerCtx.typep.cp.cp.cp.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp3506, i8* %.tmp3508, i8* %.tmp3509, i8* %.tmp3510, %m2693$.Type.type* %.tmp3511)
%.tmp3512 = load %m980$.Node.type*, %m980$.Node.type** %ast
%.tmp3513 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3512, i32 0, i32 6
%.tmp3514 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3513
%start.3515 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3514, %m980$.Node.type** %start.3515
%.tmp3516 = load %m980$.Node.type*, %m980$.Node.type** %start.3515
%.tmp3517 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3516, i32 0, i32 0
%.tmp3518 = load i8*, i8** %.tmp3517
%.tmp3520 = getelementptr [13 x i8], [13 x i8]*@.str3519, i32 0, i32 0
%.tmp3521 = call i32(i8*,i8*) @strcmp(i8* %.tmp3518, i8* %.tmp3520)
%.tmp3522 = icmp eq i32 %.tmp3521, 0
br i1 %.tmp3522, label %.if.true.3523, label %.if.false.3523
.if.true.3523:
%.tmp3524 = load %m980$.Node.type*, %m980$.Node.type** %start.3515
%.tmp3525 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3524, i32 0, i32 7
%.tmp3526 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3525
store %m980$.Node.type* %.tmp3526, %m980$.Node.type** %start.3515
br label %.if.end.3523
.if.false.3523:
br label %.if.end.3523
.if.end.3523:
%.tmp3528 = load %m980$.Node.type*, %m980$.Node.type** %start.3515
%stmt.3529 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3528, %m980$.Node.type** %stmt.3529
br label %.for.start.3527
.for.start.3527:
%.tmp3530 = load %m980$.Node.type*, %m980$.Node.type** %stmt.3529
%.tmp3531 = icmp ne %m980$.Node.type* %.tmp3530, null
br i1 %.tmp3531, label %.for.continue.3527, label %.for.end.3527
.for.continue.3527:
%.tmp3532 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3533 = load %m980$.Node.type*, %m980$.Node.type** %stmt.3529
%.tmp3534 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3533, i32 0, i32 6
%.tmp3535 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3534
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i1) @m295$compile_statement.v.m2693$.CompilerCtx.typep.m980$.Node.typep.b(%m2693$.CompilerCtx.type* %.tmp3532, %m980$.Node.type* %.tmp3535, i1 1)
%.tmp3536 = load %m980$.Node.type*, %m980$.Node.type** %stmt.3529
%.tmp3537 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3536, i32 0, i32 7
%.tmp3538 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3537
store %m980$.Node.type* %.tmp3538, %m980$.Node.type** %stmt.3529
br label %.for.start.3527
.for.end.3527:
%.tmp3539 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3540 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3539, i32 0, i32 2
%.tmp3541 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %.tmp3540
%.tmp3542 = icmp ne %m2693$.ErrorList.type* %.tmp3541, null
br i1 %.tmp3542, label %.if.true.3543, label %.if.false.3543
.if.true.3543:
ret void
br label %.if.end.3543
.if.false.3543:
br label %.if.end.3543
.if.end.3543:
%.tmp3545 = load %m980$.Node.type*, %m980$.Node.type** %start.3515
%s.3546 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3545, %m980$.Node.type** %s.3546
br label %.for.start.3544
.for.start.3544:
%.tmp3547 = load %m980$.Node.type*, %m980$.Node.type** %s.3546
%.tmp3548 = icmp ne %m980$.Node.type* %.tmp3547, null
br i1 %.tmp3548, label %.for.continue.3544, label %.for.end.3544
.for.continue.3544:
%.tmp3549 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3550 = load %m980$.Node.type*, %m980$.Node.type** %s.3546
%.tmp3551 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3550, i32 0, i32 6
%.tmp3552 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3551
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i1) @m295$compile_statement.v.m2693$.CompilerCtx.typep.m980$.Node.typep.b(%m2693$.CompilerCtx.type* %.tmp3549, %m980$.Node.type* %.tmp3552, i1 0)
%.tmp3553 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
call void(%m2693$.CompilerCtx.type*) @m295$compile_anon_fn.v.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp3553)
%.tmp3554 = load %m980$.Node.type*, %m980$.Node.type** %s.3546
%.tmp3555 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3554, i32 0, i32 7
%.tmp3556 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3555
store %m980$.Node.type* %.tmp3556, %m980$.Node.type** %s.3546
br label %.for.start.3544
.for.end.3544:
%.tmp3557 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3558 = call %m2693$.ModuleLookup.type*(%m2693$.CompilerCtx.type*) @m295$get_current_module.m2693$.ModuleLookup.typep.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp3557)
%mod.3559 = alloca %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* %.tmp3558, %m2693$.ModuleLookup.type** %mod.3559
%.tmp3560 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.3559
%.tmp3561 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3560, i32 0, i32 1
%.tmp3562 = load i8*, i8** %.tmp3561
%.tmp3564 = getelementptr [1 x i8], [1 x i8]*@.str3563, i32 0, i32 0
%.tmp3565 = call i32(i8*,i8*) @strcmp(i8* %.tmp3562, i8* %.tmp3564)
%.tmp3566 = icmp eq i32 %.tmp3565, 0
br i1 %.tmp3566, label %.if.true.3567, label %.if.false.3567
.if.true.3567:
%.tmp3569 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3570 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3569, i32 0, i32 3
%.tmp3571 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %.tmp3570
%g.3572 = alloca %m2693$.GlobalName.type*
store %m2693$.GlobalName.type* %.tmp3571, %m2693$.GlobalName.type** %g.3572
br label %.for.start.3568
.for.start.3568:
%.tmp3573 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g.3572
%.tmp3574 = icmp ne %m2693$.GlobalName.type* %.tmp3573, null
br i1 %.tmp3574, label %.for.continue.3568, label %.for.end.3568
.for.continue.3568:
%.tmp3575 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3576 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g.3572
call void(%m2693$.CompilerCtx.type*,%m2693$.GlobalName.type*) @m295$compile_global.v.m2693$.CompilerCtx.typep.m2693$.GlobalName.typep(%m2693$.CompilerCtx.type* %.tmp3575, %m2693$.GlobalName.type* %.tmp3576)
%.tmp3577 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g.3572
%.tmp3578 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp3577, i32 0, i32 5
%.tmp3579 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %.tmp3578
store %m2693$.GlobalName.type* %.tmp3579, %m2693$.GlobalName.type** %g.3572
br label %.for.start.3568
.for.end.3568:
br label %.if.end.3567
.if.false.3567:
br label %.if.end.3567
.if.end.3567:
ret void
}
define void @m295$compile_global.v.m2693$.CompilerCtx.typep.m2693$.GlobalName.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%g = alloca %m2693$.GlobalName.type*
store %m2693$.GlobalName.type* %.g.arg, %m2693$.GlobalName.type** %g
%.tmp3580 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g
%.tmp3581 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp3580, i32 0, i32 2
%.tmp3582 = load i1, i1* %.tmp3581
br i1 %.tmp3582, label %.if.true.3583, label %.if.false.3583
.if.true.3583:
ret void
br label %.if.end.3583
.if.false.3583:
br label %.if.end.3583
.if.end.3583:
%.tmp3584 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g
%.tmp3585 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp3584, i32 0, i32 1
%.tmp3586 = load i8*, i8** %.tmp3585
%.tmp3588 = getelementptr [7 x i8], [7 x i8]*@.str3587, i32 0, i32 0
%.tmp3589 = call i32(i8*,i8*) @strcmp(i8* %.tmp3586, i8* %.tmp3588)
%.tmp3590 = icmp eq i32 %.tmp3589, 0
br i1 %.tmp3590, label %.if.true.3591, label %.if.false.3591
.if.true.3591:
%.tmp3592 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3593 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3592, i32 0, i32 1
%.tmp3594 = load %m0$.File.type*, %m0$.File.type** %.tmp3593
%.tmp3596 = getelementptr [21 x i8], [21 x i8]*@.str3595, i32 0, i32 0
%.tmp3597 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g
%.tmp3598 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp3597, i32 0, i32 4
%.tmp3599 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %.tmp3598
%.tmp3600 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp3599)
%.tmp3601 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3602 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g
%.tmp3603 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp3602, i32 0, i32 4
%.tmp3604 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %.tmp3603
%.tmp3605 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3604, i32 0, i32 4
%.tmp3606 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3605
%.tmp3607 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp3601, %m2693$.Type.type* %.tmp3606)
%.tmp3608 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g
%.tmp3609 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp3608, i32 0, i32 0
%.tmp3610 = load i8*, i8** %.tmp3609
%.tmp3611 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3594, i8* %.tmp3596, i8* %.tmp3600, i8* %.tmp3607, i8* %.tmp3610)
br label %.if.end.3591
.if.false.3591:
%.tmp3612 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g
%.tmp3613 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp3612, i32 0, i32 1
%.tmp3614 = load i8*, i8** %.tmp3613
%.tmp3616 = getelementptr [7 x i8], [7 x i8]*@.str3615, i32 0, i32 0
%.tmp3617 = call i32(i8*,i8*) @strcmp(i8* %.tmp3614, i8* %.tmp3616)
%.tmp3618 = icmp eq i32 %.tmp3617, 0
br i1 %.tmp3618, label %.if.true.3619, label %.if.false.3619
.if.true.3619:
%.tmp3620 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3621 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g
%.tmp3622 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp3621, i32 0, i32 4
%.tmp3623 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %.tmp3622
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$compile_extern.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp3620, %m2693$.AssignableInfo.type* %.tmp3623)
br label %.if.end.3619
.if.false.3619:
br label %.if.end.3619
.if.end.3619:
br label %.if.end.3591
.if.end.3591:
%.tmp3624 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g
%.tmp3625 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp3624, i32 0, i32 2
store i1 1, i1* %.tmp3625
ret void
}
define void @m295$compile_extern.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%info = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.info.arg, %m2693$.AssignableInfo.type** %info
%.tmp3626 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3627 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3626, i32 0, i32 1
%.tmp3628 = load %m0$.File.type*, %m0$.File.type** %.tmp3627
%.tmp3630 = getelementptr [15 x i8], [15 x i8]*@.str3629, i32 0, i32 0
%.tmp3631 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3632 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp3633 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3632, i32 0, i32 4
%.tmp3634 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3633
%.tmp3635 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3634, i32 0, i32 3
%.tmp3636 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3635
%.tmp3637 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp3631, %m2693$.Type.type* %.tmp3636)
%.tmp3638 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp3639 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp3638)
%.tmp3640 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3628, i8* %.tmp3630, i8* %.tmp3637, i8* %.tmp3639)
%.tmp3642 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp3643 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3642, i32 0, i32 4
%.tmp3644 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3643
%.tmp3645 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3644, i32 0, i32 3
%.tmp3646 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3645
%.tmp3647 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3646, i32 0, i32 4
%.tmp3648 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3647
%pt.3649 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp3648, %m2693$.Type.type** %pt.3649
br label %.for.start.3641
.for.start.3641:
%.tmp3650 = load %m2693$.Type.type*, %m2693$.Type.type** %pt.3649
%.tmp3651 = icmp ne %m2693$.Type.type* %.tmp3650, null
br i1 %.tmp3651, label %.for.continue.3641, label %.for.end.3641
.for.continue.3641:
%.tmp3652 = load %m2693$.Type.type*, %m2693$.Type.type** %pt.3649
%.tmp3653 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp3654 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3653, i32 0, i32 4
%.tmp3655 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3654
%.tmp3656 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3655, i32 0, i32 3
%.tmp3657 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3656
%.tmp3658 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3657, i32 0, i32 4
%.tmp3659 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3658
%.tmp3660 = icmp ne %m2693$.Type.type* %.tmp3652, %.tmp3659
br i1 %.tmp3660, label %.if.true.3661, label %.if.false.3661
.if.true.3661:
%.tmp3662 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3663 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3662, i32 0, i32 1
%.tmp3664 = load %m0$.File.type*, %m0$.File.type** %.tmp3663
%.tmp3666 = getelementptr [3 x i8], [3 x i8]*@.str3665, i32 0, i32 0
%.tmp3667 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3664, i8* %.tmp3666)
br label %.if.end.3661
.if.false.3661:
br label %.if.end.3661
.if.end.3661:
%.tmp3668 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3669 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3668, i32 0, i32 1
%.tmp3670 = load %m0$.File.type*, %m0$.File.type** %.tmp3669
%.tmp3672 = getelementptr [3 x i8], [3 x i8]*@.str3671, i32 0, i32 0
%.tmp3673 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3674 = load %m2693$.Type.type*, %m2693$.Type.type** %pt.3649
%.tmp3675 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp3673, %m2693$.Type.type* %.tmp3674)
%.tmp3676 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3670, i8* %.tmp3672, i8* %.tmp3675)
%.tmp3677 = load %m2693$.Type.type*, %m2693$.Type.type** %pt.3649
%.tmp3678 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3677, i32 0, i32 4
%.tmp3679 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3678
store %m2693$.Type.type* %.tmp3679, %m2693$.Type.type** %pt.3649
br label %.for.start.3641
.for.end.3641:
%.tmp3680 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3681 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3680, i32 0, i32 1
%.tmp3682 = load %m0$.File.type*, %m0$.File.type** %.tmp3681
%.tmp3684 = getelementptr [3 x i8], [3 x i8]*@.str3683, i32 0, i32 0
%.tmp3685 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3682, i8* %.tmp3684)
ret void
}
define i8* @m295$get_mod_prefix.cp.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3686 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3687 = call %m2693$.ModuleLookup.type*(%m2693$.CompilerCtx.type*) @m295$get_current_module.m2693$.ModuleLookup.typep.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp3686)
%m.3688 = alloca %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* %.tmp3687, %m2693$.ModuleLookup.type** %m.3688
%.tmp3689 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.3688
%.tmp3690 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3689, i32 0, i32 1
%.tmp3691 = load i8*, i8** %.tmp3690
ret i8* %.tmp3691
}
define i8* @m295$name_mangle.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.fn.arg, i8* %.original_name.arg, %m2693$.Type.type* %.type.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%fn = alloca %m980$.Node.type*
store %m980$.Node.type* %.fn.arg, %m980$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.type.arg, %m2693$.Type.type** %type
%.tmp3693 = getelementptr [1 x i8], [1 x i8]*@.str3692, i32 0, i32 0
%mangled_name.3694 = alloca i8*
store i8* %.tmp3693, i8** %mangled_name.3694
%.tmp3695 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3696 = load %m980$.Node.type*, %m980$.Node.type** %fn
%.tmp3697 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3696, i32 0, i32 2
%.tmp3698 = load i8*, i8** %.tmp3697
%.tmp3699 = call i8*(%m2693$.CompilerCtx.type*,i8*) @m295$get_mod_prefix.cp.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.tmp3695, i8* %.tmp3698)
%prefix.3700 = alloca i8*
store i8* %.tmp3699, i8** %prefix.3700
%.tmp3701 = getelementptr i8*, i8** %mangled_name.3694, i32 0
%.tmp3703 = getelementptr [5 x i8], [5 x i8]*@.str3702, i32 0, i32 0
%.tmp3704 = load i8*, i8** %prefix.3700
%.tmp3705 = load i8*, i8** %original_name
%.tmp3706 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3701, i8* %.tmp3703, i8* %.tmp3704, i8* %.tmp3705)
%.tmp3707 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp3708 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3707, i32 0, i32 0
%.tmp3709 = load i8*, i8** %.tmp3708
%.tmp3711 = getelementptr [9 x i8], [9 x i8]*@.str3710, i32 0, i32 0
%.tmp3712 = call i32(i8*,i8*) @strcmp(i8* %.tmp3709, i8* %.tmp3711)
%.tmp3713 = icmp eq i32 %.tmp3712, 0
br i1 %.tmp3713, label %.if.true.3714, label %.if.false.3714
.if.true.3714:
%.tmp3715 = load i8*, i8** %mangled_name.3694
%.tmp3717 = getelementptr [5 x i8], [5 x i8]*@.str3716, i32 0, i32 0
%.tmp3718 = call i32(i8*,i8*) @strcmp(i8* %.tmp3715, i8* %.tmp3717)
%.tmp3719 = icmp ne i32 %.tmp3718, 0
br i1 %.tmp3719, label %.if.true.3720, label %.if.false.3720
.if.true.3720:
%.tmp3722 = getelementptr [1 x i8], [1 x i8]*@.str3721, i32 0, i32 0
%tmp_buff.3723 = alloca i8*
store i8* %.tmp3722, i8** %tmp_buff.3723
%.tmp3725 = getelementptr [1 x i8], [1 x i8]*@.str3724, i32 0, i32 0
%swap_var.3726 = alloca i8*
store i8* %.tmp3725, i8** %swap_var.3726
%.tmp3728 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp3729 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3728, i32 0, i32 3
%.tmp3730 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3729
%tp.3731 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp3730, %m2693$.Type.type** %tp.3731
br label %.for.start.3727
.for.start.3727:
%.tmp3732 = load %m2693$.Type.type*, %m2693$.Type.type** %tp.3731
%.tmp3733 = icmp ne %m2693$.Type.type* %.tmp3732, null
br i1 %.tmp3733, label %.for.continue.3727, label %.for.end.3727
.for.continue.3727:
%.tmp3734 = getelementptr i8*, i8** %tmp_buff.3723, i32 0
%.tmp3736 = getelementptr [6 x i8], [6 x i8]*@.str3735, i32 0, i32 0
%.tmp3737 = load i8*, i8** %mangled_name.3694
%.tmp3738 = load %m2693$.Type.type*, %m2693$.Type.type** %tp.3731
%.tmp3739 = call i8*(%m2693$.Type.type*) @m295$type_abbr.cp.m2693$.Type.typep(%m2693$.Type.type* %.tmp3738)
%.tmp3740 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3734, i8* %.tmp3736, i8* %.tmp3737, i8* %.tmp3739)
%.tmp3741 = load i8*, i8** %tmp_buff.3723
store i8* %.tmp3741, i8** %swap_var.3726
%.tmp3742 = load i8*, i8** %mangled_name.3694
store i8* %.tmp3742, i8** %tmp_buff.3723
%.tmp3743 = load i8*, i8** %swap_var.3726
store i8* %.tmp3743, i8** %mangled_name.3694
%.tmp3744 = load i8*, i8** %tmp_buff.3723
call void(i8*) @free(i8* %.tmp3744)
%.tmp3745 = load %m2693$.Type.type*, %m2693$.Type.type** %tp.3731
%.tmp3746 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3745, i32 0, i32 4
%.tmp3747 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3746
store %m2693$.Type.type* %.tmp3747, %m2693$.Type.type** %tp.3731
br label %.for.start.3727
.for.end.3727:
br label %.if.end.3720
.if.false.3720:
br label %.if.end.3720
.if.end.3720:
br label %.if.end.3714
.if.false.3714:
br label %.if.end.3714
.if.end.3714:
%.tmp3748 = load i8*, i8** %mangled_name.3694
ret i8* %.tmp3748
}
define void @m295$compile_statement.v.m2693$.CompilerCtx.typep.m980$.Node.typep.b(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3749 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* null, %m2693$.AssignableInfo.type** %info.3749
%return_type.3750 = alloca %m2693$.Type.type*
store %m2693$.Type.type* null, %m2693$.Type.type** %return_type.3750
%.tmp3752 = getelementptr [1 x i8], [1 x i8]*@.str3751, i32 0, i32 0
%err_buf.3753 = alloca i8*
store i8* %.tmp3752, i8** %err_buf.3753
%.tmp3755 = getelementptr [1 x i8], [1 x i8]*@.str3754, i32 0, i32 0
%tmp_buff.3756 = alloca i8*
store i8* %.tmp3755, i8** %tmp_buff.3756
%.tmp3757 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3758 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3757, i32 0, i32 0
%.tmp3759 = load i8*, i8** %.tmp3758
%.tmp3761 = getelementptr [3 x i8], [3 x i8]*@.str3760, i32 0, i32 0
%.tmp3762 = call i32(i8*,i8*) @strcmp(i8* %.tmp3759, i8* %.tmp3761)
%.tmp3763 = icmp eq i32 %.tmp3762, 0
br i1 %.tmp3763, label %.if.true.3764, label %.if.false.3764
.if.true.3764:
ret void
br label %.if.end.3764
.if.false.3764:
%.tmp3765 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3766 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3765, i32 0, i32 0
%.tmp3767 = load i8*, i8** %.tmp3766
%.tmp3769 = getelementptr [7 x i8], [7 x i8]*@.str3768, i32 0, i32 0
%.tmp3770 = call i32(i8*,i8*) @strcmp(i8* %.tmp3767, i8* %.tmp3769)
%.tmp3771 = icmp eq i32 %.tmp3770, 0
br i1 %.tmp3771, label %.if.true.3772, label %.if.false.3772
.if.true.3772:
%.tmp3773 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3774 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3773, i32 0, i32 6
%.tmp3775 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3774
%.tmp3777 = getelementptr [11 x i8], [11 x i8]*@.str3776, i32 0, i32 0
%.tmp3778 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp3775, i8* %.tmp3777)
%assignable.3779 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3778, %m980$.Node.type** %assignable.3779
%.tmp3780 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3781 = load %m980$.Node.type*, %m980$.Node.type** %assignable.3779
%.tmp3782 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp3780, %m980$.Node.type* %.tmp3781)
%a_info.3783 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp3782, %m2693$.AssignableInfo.type** %a_info.3783
%.tmp3784 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.3783
%.tmp3785 = icmp eq %m2693$.AssignableInfo.type* %.tmp3784, null
br i1 %.tmp3785, label %.if.true.3786, label %.if.false.3786
.if.true.3786:
ret void
br label %.if.end.3786
.if.false.3786:
br label %.if.end.3786
.if.end.3786:
%.tmp3787 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3788 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp3787)
store %m2693$.AssignableInfo.type* %.tmp3788, %m2693$.AssignableInfo.type** %info.3749
%.tmp3789 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3790 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3789, i32 0, i32 6
%.tmp3791 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3790
%.tmp3792 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3791, i32 0, i32 7
%.tmp3793 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3792
%.tmp3794 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3793, i32 0, i32 1
%.tmp3795 = load i8*, i8** %.tmp3794
%global_name.3796 = alloca i8*
store i8* %.tmp3795, i8** %global_name.3796
%.tmp3797 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3798 = load i8, i8* @SCOPE_GLOBAL
%.tmp3799 = load i8*, i8** %global_name.3796
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp3797, i8 %.tmp3798, i8* %.tmp3799)
%.tmp3800 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3801 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3800, i32 0, i32 4
%.tmp3802 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.3783
%.tmp3803 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3802, i32 0, i32 4
%.tmp3804 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3803
store %m2693$.Type.type* %.tmp3804, %m2693$.Type.type** %.tmp3801
%.tmp3805 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3806 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3805, i32 0, i32 3
%.tmp3808 = getelementptr [9 x i8], [9 x i8]*@.str3807, i32 0, i32 0
store i8* %.tmp3808, i8** %.tmp3806
%.tmp3809 = load i1, i1* %shallow
%.tmp3810 = icmp eq i1 %.tmp3809, 1
br i1 %.tmp3810, label %.if.true.3811, label %.if.false.3811
.if.true.3811:
%.tmp3812 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3813 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3814 = load i8*, i8** %global_name.3796
%.tmp3815 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2693$.AssignableInfo.type*) @m295$define_assignable.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp3812, %m980$.Node.type* %.tmp3813, i8* %.tmp3814, %m2693$.AssignableInfo.type* %.tmp3815)
br label %.if.end.3811
.if.false.3811:
%.tmp3816 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3817 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3816, i32 0, i32 1
%.tmp3818 = load %m0$.File.type*, %m0$.File.type** %.tmp3817
%.tmp3820 = getelementptr [21 x i8], [21 x i8]*@.str3819, i32 0, i32 0
%.tmp3821 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3822 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp3821)
%.tmp3823 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3824 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3825 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3824, i32 0, i32 4
%.tmp3826 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3825
%.tmp3827 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp3823, %m2693$.Type.type* %.tmp3826)
%.tmp3828 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.3783
%.tmp3829 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp3828)
%.tmp3830 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3818, i8* %.tmp3820, i8* %.tmp3822, i8* %.tmp3827, i8* %.tmp3829)
br label %.if.end.3811
.if.end.3811:
br label %.if.end.3772
.if.false.3772:
%.tmp3831 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3832 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3831, i32 0, i32 0
%.tmp3833 = load i8*, i8** %.tmp3832
%.tmp3835 = getelementptr [10 x i8], [10 x i8]*@.str3834, i32 0, i32 0
%.tmp3836 = call i32(i8*,i8*) @strcmp(i8* %.tmp3833, i8* %.tmp3835)
%.tmp3837 = icmp eq i32 %.tmp3836, 0
br i1 %.tmp3837, label %.if.true.3838, label %.if.false.3838
.if.true.3838:
%.tmp3839 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3840 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3839, i32 0, i32 6
%.tmp3841 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3840
%.tmp3842 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3841, i32 0, i32 7
%.tmp3843 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3842
%.tmp3844 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3843, i32 0, i32 1
%.tmp3845 = load i8*, i8** %.tmp3844
%type_name.3846 = alloca i8*
store i8* %.tmp3845, i8** %type_name.3846
%.tmp3847 = load i1, i1* %shallow
%.tmp3848 = icmp eq i1 %.tmp3847, 1
br i1 %.tmp3848, label %.if.true.3849, label %.if.false.3849
.if.true.3849:
%.tmp3850 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3851 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp3850)
store %m2693$.AssignableInfo.type* %.tmp3851, %m2693$.AssignableInfo.type** %info.3749
%.tmp3852 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3853 = call %m2693$.ModuleLookup.type*(%m2693$.CompilerCtx.type*) @m295$get_current_module.m2693$.ModuleLookup.typep.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp3852)
%mod_from.3854 = alloca %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* %.tmp3853, %m2693$.ModuleLookup.type** %mod_from.3854
%.tmp3855 = getelementptr i8*, i8** %tmp_buff.3756, i32 0
%.tmp3857 = getelementptr [11 x i8], [11 x i8]*@.str3856, i32 0, i32 0
%.tmp3858 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod_from.3854
%.tmp3859 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp3858, i32 0, i32 1
%.tmp3860 = load i8*, i8** %.tmp3859
%.tmp3861 = load i8*, i8** %type_name.3846
%.tmp3862 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3855, i8* %.tmp3857, i8* %.tmp3860, i8* %.tmp3861)
%.tmp3863 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3864 = load i8, i8* @SCOPE_LOCAL
%.tmp3865 = load i8*, i8** %tmp_buff.3756
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp3863, i8 %.tmp3864, i8* %.tmp3865)
%.tmp3866 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3867 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3866, i32 0, i32 3
%.tmp3869 = getelementptr [10 x i8], [10 x i8]*@.str3868, i32 0, i32 0
store i8* %.tmp3869, i8** %.tmp3867
%.tmp3870 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3871 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3870, i32 0, i32 5
%.tmp3872 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3873 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3872, i32 0, i32 3
%.tmp3874 = load i32, i32* %.tmp3873
store i32 %.tmp3874, i32* %.tmp3871
%.tmp3875 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3876 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3875, i32 0, i32 6
%.tmp3877 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3878 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3877, i32 0, i32 4
%.tmp3879 = load i32, i32* %.tmp3878
store i32 %.tmp3879, i32* %.tmp3876
%.tmp3880 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3881 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3880, i32 0, i32 4
%.tmp3882 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp3882, %m2693$.Type.type** %.tmp3881
%.tmp3883 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3884 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3885 = load i8*, i8** %type_name.3846
%.tmp3886 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2693$.AssignableInfo.type*) @m295$define_assignable.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp3883, %m980$.Node.type* %.tmp3884, i8* %.tmp3885, %m2693$.AssignableInfo.type* %.tmp3886)
%.tmp3887 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3888 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3887, i32 0, i32 6
%.tmp3889 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3888
%.tmp3891 = getelementptr [5 x i8], [5 x i8]*@.str3890, i32 0, i32 0
%.tmp3892 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp3889, i8* %.tmp3891)
%type_decl.3893 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp3892, %m980$.Node.type** %type_decl.3893
%.tmp3894 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3895 = load %m980$.Node.type*, %m980$.Node.type** %type_decl.3893
%.tmp3896 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3895, i32 0, i32 6
%.tmp3897 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3896
%.tmp3898 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp3894, %m980$.Node.type* %.tmp3897)
%type_struct.3899 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp3898, %m2693$.Type.type** %type_struct.3899
%.tmp3900 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3901 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3900, i32 0, i32 4
%.tmp3902 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3901
%.tmp3903 = load %m2693$.Type.type*, %m2693$.Type.type** %type_struct.3899
call void(%m2693$.Type.type*,%m2693$.Type.type*) @m295$copy_type.v.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.tmp3902, %m2693$.Type.type* %.tmp3903)
%.tmp3904 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3905 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3904, i32 0, i32 4
%.tmp3906 = load %m2693$.Type.type*, %m2693$.Type.type** %type_struct.3899
store %m2693$.Type.type* %.tmp3906, %m2693$.Type.type** %.tmp3905
br label %.if.end.3849
.if.false.3849:
%.tmp3907 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3908 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3909 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3908, i32 0, i32 7
%.tmp3910 = load i8*, i8** %.tmp3909
%.tmp3911 = load i8*, i8** %type_name.3846
%.tmp3912 = call %m2693$.ScopeItem.type*(%m2693$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2693$.ScopeItem.typep.m2693$.CompilerCtx.typep.cp.cp(%m2693$.CompilerCtx.type* %.tmp3907, i8* %.tmp3910, i8* %.tmp3911)
%scope.3913 = alloca %m2693$.ScopeItem.type*
store %m2693$.ScopeItem.type* %.tmp3912, %m2693$.ScopeItem.type** %scope.3913
%.tmp3914 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %scope.3913
%.tmp3915 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp3914, i32 0, i32 1
%.tmp3916 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %.tmp3915
store %m2693$.AssignableInfo.type* %.tmp3916, %m2693$.AssignableInfo.type** %info.3749
%.tmp3917 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3918 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp3917, i32 0, i32 1
%.tmp3919 = load %m0$.File.type*, %m0$.File.type** %.tmp3918
%.tmp3921 = getelementptr [14 x i8], [14 x i8]*@.str3920, i32 0, i32 0
%.tmp3922 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3923 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp3922)
%.tmp3924 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3925 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3926 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3925, i32 0, i32 4
%.tmp3927 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3926
%.tmp3928 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp3924, %m2693$.Type.type* %.tmp3927)
%.tmp3929 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3919, i8* %.tmp3921, i8* %.tmp3923, i8* %.tmp3928)
br label %.if.end.3849
.if.end.3849:
br label %.if.end.3838
.if.false.3838:
%.tmp3930 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3931 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3930, i32 0, i32 0
%.tmp3932 = load i8*, i8** %.tmp3931
%.tmp3934 = getelementptr [7 x i8], [7 x i8]*@.str3933, i32 0, i32 0
%.tmp3935 = call i32(i8*,i8*) @strcmp(i8* %.tmp3932, i8* %.tmp3934)
%.tmp3936 = icmp eq i32 %.tmp3935, 0
br i1 %.tmp3936, label %.if.true.3937, label %.if.false.3937
.if.true.3937:
%.tmp3938 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3939 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp3938)
store %m2693$.AssignableInfo.type* %.tmp3939, %m2693$.AssignableInfo.type** %info.3749
%.tmp3940 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3941 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3940, i32 0, i32 4
%.tmp3942 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3943 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3944 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3943, i32 0, i32 6
%.tmp3945 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3944
%.tmp3946 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3945, i32 0, i32 7
%.tmp3947 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3946
%.tmp3948 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$syn_function_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp3942, %m980$.Node.type* %.tmp3947)
store %m2693$.Type.type* %.tmp3948, %m2693$.Type.type** %.tmp3941
%.tmp3949 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3950 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3949, i32 0, i32 3
%.tmp3952 = getelementptr [7 x i8], [7 x i8]*@.str3951, i32 0, i32 0
store i8* %.tmp3952, i8** %.tmp3950
%.tmp3953 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3954 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3953, i32 0, i32 6
%.tmp3955 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3954
%.tmp3956 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3955, i32 0, i32 7
%.tmp3957 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3956
%.tmp3958 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3957, i32 0, i32 7
%.tmp3959 = load %m980$.Node.type*, %m980$.Node.type** %.tmp3958
%.tmp3960 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp3959, i32 0, i32 1
%.tmp3961 = load i8*, i8** %.tmp3960
%fn_name.3962 = alloca i8*
store i8* %.tmp3961, i8** %fn_name.3962
%.tmp3963 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3964 = load i8, i8* @SCOPE_GLOBAL
%.tmp3965 = load i8*, i8** %fn_name.3962
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp3963, i8 %.tmp3964, i8* %.tmp3965)
%.tmp3966 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp3966, %m2693$.Type.type** %return_type.3750
%.tmp3967 = load %m2693$.Type.type*, %m2693$.Type.type** %return_type.3750
%.tmp3968 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3967, i32 0, i32 0
%.tmp3969 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3970 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3969, i32 0, i32 4
%.tmp3971 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3970
%.tmp3972 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3971, i32 0, i32 3
%.tmp3973 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3972
%.tmp3974 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3973, i32 0, i32 0
%.tmp3975 = load i8*, i8** %.tmp3974
store i8* %.tmp3975, i8** %.tmp3968
%.tmp3976 = load %m2693$.Type.type*, %m2693$.Type.type** %return_type.3750
%.tmp3977 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3976, i32 0, i32 3
%.tmp3978 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp3979 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp3978, i32 0, i32 4
%.tmp3980 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3979
%.tmp3981 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3980, i32 0, i32 3
%.tmp3982 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3981
%.tmp3983 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp3982, i32 0, i32 3
%.tmp3984 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp3983
store %m2693$.Type.type* %.tmp3984, %m2693$.Type.type** %.tmp3977
%.tmp3985 = load i1, i1* %shallow
%.tmp3986 = icmp eq i1 %.tmp3985, 0
br i1 %.tmp3986, label %.if.true.3987, label %.if.false.3987
.if.true.3987:
%.tmp3988 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3989 = load i8*, i8** %fn_name.3962
call void(%m2693$.CompilerCtx.type*,i8*) @m295$mark_weak_global.v.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.tmp3988, i8* %.tmp3989)
%.tmp3990 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3991 = load i8*, i8** %fn_name.3962
%.tmp3993 = getelementptr [7 x i8], [7 x i8]*@.str3992, i32 0, i32 0
%.tmp3994 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
call void(%m2693$.CompilerCtx.type*,i8*,i8*,%m2693$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2693$.CompilerCtx.typep.cp.cp.m2693$.AssignableInfo.typep.b.b(%m2693$.CompilerCtx.type* %.tmp3990, i8* %.tmp3991, i8* %.tmp3993, %m2693$.AssignableInfo.type* %.tmp3994, i1 1, i1 1)
%.tmp3995 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3996 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$compile_extern.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp3995, %m2693$.AssignableInfo.type* %.tmp3996)
br label %.if.end.3987
.if.false.3987:
%.tmp3997 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp3998 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp3999 = load i8*, i8** %fn_name.3962
%.tmp4000 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2693$.AssignableInfo.type*) @m295$define_assignable.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp3997, %m980$.Node.type* %.tmp3998, i8* %.tmp3999, %m2693$.AssignableInfo.type* %.tmp4000)
br label %.if.end.3987
.if.end.3987:
br label %.if.end.3937
.if.false.3937:
%.tmp4001 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4002 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4001, i32 0, i32 0
%.tmp4003 = load i8*, i8** %.tmp4002
%.tmp4005 = getelementptr [9 x i8], [9 x i8]*@.str4004, i32 0, i32 0
%.tmp4006 = call i32(i8*,i8*) @strcmp(i8* %.tmp4003, i8* %.tmp4005)
%.tmp4007 = icmp eq i32 %.tmp4006, 0
br i1 %.tmp4007, label %.if.true.4008, label %.if.false.4008
.if.true.4008:
%.tmp4009 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4010 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4009)
store %m2693$.AssignableInfo.type* %.tmp4010, %m2693$.AssignableInfo.type** %info.3749
%.tmp4011 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp4012 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4011, i32 0, i32 3
%.tmp4014 = getelementptr [9 x i8], [9 x i8]*@.str4013, i32 0, i32 0
store i8* %.tmp4014, i8** %.tmp4012
%.tmp4015 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp4016 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4015, i32 0, i32 4
%.tmp4017 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4018 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4019 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4018, i32 0, i32 6
%.tmp4020 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4019
%.tmp4021 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$syn_function_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp4017, %m980$.Node.type* %.tmp4020)
store %m2693$.Type.type* %.tmp4021, %m2693$.Type.type** %.tmp4016
%.tmp4022 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4023 = call i8*(%m980$.Node.type*) @m295$syn_function_name.cp.m980$.Node.typep(%m980$.Node.type* %.tmp4022)
%name.4024 = alloca i8*
store i8* %.tmp4023, i8** %name.4024
%.tmp4025 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4026 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4027 = load i8*, i8** %name.4024
%.tmp4028 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp4029 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4028, i32 0, i32 4
%.tmp4030 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4029
%.tmp4031 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2693$.Type.type*) @m295$name_mangle.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4025, %m980$.Node.type* %.tmp4026, i8* %.tmp4027, %m2693$.Type.type* %.tmp4030)
store i8* %.tmp4031, i8** %tmp_buff.3756
%.tmp4032 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp4033 = load i8, i8* @SCOPE_GLOBAL
%.tmp4034 = load i8*, i8** %tmp_buff.3756
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp4032, i8 %.tmp4033, i8* %.tmp4034)
%.tmp4035 = load i1, i1* %shallow
%.tmp4036 = icmp eq i1 %.tmp4035, 1
br i1 %.tmp4036, label %.if.true.4037, label %.if.false.4037
.if.true.4037:
%.tmp4038 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4039 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4040 = load i8*, i8** %name.4024
%.tmp4041 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2693$.AssignableInfo.type*) @m295$define_assignable.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp4038, %m980$.Node.type* %.tmp4039, i8* %.tmp4040, %m2693$.AssignableInfo.type* %.tmp4041)
br label %.if.end.4037
.if.false.4037:
%.tmp4042 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp4042, %m2693$.Type.type** %return_type.3750
%.tmp4043 = load %m2693$.Type.type*, %m2693$.Type.type** %return_type.3750
%.tmp4044 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp4045 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4044, i32 0, i32 4
%.tmp4046 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4045
%.tmp4047 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4046, i32 0, i32 3
%.tmp4048 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4047
call void(%m2693$.Type.type*,%m2693$.Type.type*) @m295$copy_type.v.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.tmp4043, %m2693$.Type.type* %.tmp4048)
%.tmp4049 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4050 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4049, i32 0, i32 1
%.tmp4051 = load %m0$.File.type*, %m0$.File.type** %.tmp4050
%.tmp4053 = getelementptr [14 x i8], [14 x i8]*@.str4052, i32 0, i32 0
%.tmp4054 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4055 = load %m2693$.Type.type*, %m2693$.Type.type** %return_type.3750
%.tmp4056 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4054, %m2693$.Type.type* %.tmp4055)
%.tmp4057 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.3749
%.tmp4058 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp4057)
%.tmp4059 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4051, i8* %.tmp4053, i8* %.tmp4056, i8* %.tmp4058)
%.tmp4060 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4061 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4060, i32 0, i32 6
%.tmp4062 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4061
%.tmp4063 = call %m980$.Node.type*(%m980$.Node.type*) @m295$syn_function_params.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4062)
%params.4064 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4063, %m980$.Node.type** %params.4064
%param_type.4065 = alloca %m2693$.Type.type*
store %m2693$.Type.type* null, %m2693$.Type.type** %param_type.4065
%.tmp4067 = load %m980$.Node.type*, %m980$.Node.type** %params.4064
%param_ptr.4068 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4067, %m980$.Node.type** %param_ptr.4068
br label %.for.start.4066
.for.start.4066:
%.tmp4069 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4068
%.tmp4070 = icmp ne %m980$.Node.type* %.tmp4069, null
br i1 %.tmp4070, label %.for.continue.4066, label %.for.end.4066
.for.continue.4066:
%.tmp4071 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4068
%.tmp4072 = load %m980$.Node.type*, %m980$.Node.type** %params.4064
%.tmp4073 = icmp ne %m980$.Node.type* %.tmp4071, %.tmp4072
br i1 %.tmp4073, label %.if.true.4074, label %.if.false.4074
.if.true.4074:
%.tmp4075 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4068
%.tmp4076 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4075, i32 0, i32 7
%.tmp4077 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4076
store %m980$.Node.type* %.tmp4077, %m980$.Node.type** %param_ptr.4068
%.tmp4078 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4079 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4078, i32 0, i32 1
%.tmp4080 = load %m0$.File.type*, %m0$.File.type** %.tmp4079
%.tmp4082 = getelementptr [3 x i8], [3 x i8]*@.str4081, i32 0, i32 0
%.tmp4083 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4080, i8* %.tmp4082)
br label %.if.end.4074
.if.false.4074:
br label %.if.end.4074
.if.end.4074:
%.tmp4084 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4068
%.tmp4085 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4084, i32 0, i32 0
%.tmp4086 = load i8*, i8** %.tmp4085
%.tmp4088 = getelementptr [5 x i8], [5 x i8]*@.str4087, i32 0, i32 0
%.tmp4089 = call i32(i8*,i8*) @strcmp(i8* %.tmp4086, i8* %.tmp4088)
%.tmp4090 = icmp eq i32 %.tmp4089, 0
br i1 %.tmp4090, label %.if.true.4091, label %.if.false.4091
.if.true.4091:
%.tmp4092 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4093 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4068
%.tmp4094 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4093, i32 0, i32 6
%.tmp4095 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4094
%.tmp4096 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp4092, %m980$.Node.type* %.tmp4095)
store %m2693$.Type.type* %.tmp4096, %m2693$.Type.type** %param_type.4065
%.tmp4097 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4068
%.tmp4098 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4097, i32 0, i32 7
%.tmp4099 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4098
store %m980$.Node.type* %.tmp4099, %m980$.Node.type** %param_ptr.4068
br label %.if.end.4091
.if.false.4091:
br label %.if.end.4091
.if.end.4091:
%.tmp4100 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4101 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4100, i32 0, i32 1
%.tmp4102 = load %m0$.File.type*, %m0$.File.type** %.tmp4101
%.tmp4104 = getelementptr [13 x i8], [13 x i8]*@.str4103, i32 0, i32 0
%.tmp4105 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4106 = load %m2693$.Type.type*, %m2693$.Type.type** %param_type.4065
%.tmp4107 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4105, %m2693$.Type.type* %.tmp4106)
%.tmp4108 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4068
%.tmp4109 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4108, i32 0, i32 1
%.tmp4110 = load i8*, i8** %.tmp4109
%.tmp4111 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4102, i8* %.tmp4104, i8* %.tmp4107, i8* %.tmp4110)
%.tmp4112 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4068
%.tmp4113 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4112, i32 0, i32 7
%.tmp4114 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4113
store %m980$.Node.type* %.tmp4114, %m980$.Node.type** %param_ptr.4068
br label %.for.start.4066
.for.end.4066:
%.tmp4115 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4116 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4115, i32 0, i32 1
%.tmp4117 = load %m0$.File.type*, %m0$.File.type** %.tmp4116
%.tmp4119 = getelementptr [5 x i8], [5 x i8]*@.str4118, i32 0, i32 0
%.tmp4120 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4117, i8* %.tmp4119)
%.tmp4121 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4123 = getelementptr [9 x i8], [9 x i8]*@.str4122, i32 0, i32 0
%.tmp4124 = bitcast ptr null to i8*
%.tmp4125 = bitcast ptr null to i8*
%.tmp4126 = load %m2693$.Type.type*, %m2693$.Type.type** %return_type.3750
call void(%m2693$.CompilerCtx.type*,i8*,i8*,i8*,%m2693$.Type.type*) @m295$push_scope.v.m2693$.CompilerCtx.typep.cp.cp.cp.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4121, i8* %.tmp4123, i8* %.tmp4124, i8* %.tmp4125, %m2693$.Type.type* %.tmp4126)
%.tmp4127 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4128 = load %m980$.Node.type*, %m980$.Node.type** %params.4064
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_fn_params.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp4127, %m980$.Node.type* %.tmp4128)
%.tmp4129 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4130 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4129, i32 0, i32 6
%.tmp4131 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4130
%.tmp4133 = getelementptr [6 x i8], [6 x i8]*@.str4132, i32 0, i32 0
%.tmp4134 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4131, i8* %.tmp4133)
%fn_block.4135 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4134, %m980$.Node.type** %fn_block.4135
%.tmp4136 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4137 = load %m980$.Node.type*, %m980$.Node.type** %fn_block.4135
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp4136, %m980$.Node.type* %.tmp4137)
%.tmp4138 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
call void(%m2693$.CompilerCtx.type*) @m295$pop_scope.v.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp4138)
%.tmp4139 = bitcast ptr null to %m980$.Node.type*
%last_valid_instruction.4140 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4139, %m980$.Node.type** %last_valid_instruction.4140
%.tmp4141 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4142 = load %m980$.Node.type*, %m980$.Node.type** %fn_block.4135
%.tmp4143 = load %m2693$.Type.type*, %m2693$.Type.type** %return_type.3750
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,%m2693$.Type.type*) @m295$check_n_add_implicit_return.v.m2693$.CompilerCtx.typep.m980$.Node.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4141, %m980$.Node.type* %.tmp4142, %m2693$.Type.type* %.tmp4143)
%.tmp4144 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4145 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4144, i32 0, i32 1
%.tmp4146 = load %m0$.File.type*, %m0$.File.type** %.tmp4145
%.tmp4148 = getelementptr [3 x i8], [3 x i8]*@.str4147, i32 0, i32 0
%.tmp4149 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4146, i8* %.tmp4148)
br label %.if.end.4037
.if.end.4037:
br label %.if.end.4008
.if.false.4008:
%.tmp4150 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4151 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4150, i32 0, i32 0
%.tmp4152 = load i8*, i8** %.tmp4151
%.tmp4154 = getelementptr [7 x i8], [7 x i8]*@.str4153, i32 0, i32 0
%.tmp4155 = call i32(i8*,i8*) @strcmp(i8* %.tmp4152, i8* %.tmp4154)
%.tmp4156 = icmp eq i32 %.tmp4155, 0
br i1 %.tmp4156, label %.if.true.4157, label %.if.false.4157
.if.true.4157:
%.tmp4158 = load i1, i1* %shallow
%.tmp4159 = icmp eq i1 %.tmp4158, 1
br i1 %.tmp4159, label %.if.true.4160, label %.if.false.4160
.if.true.4160:
%.tmp4161 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4162 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4161, i32 0, i32 6
%.tmp4163 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4162
%.tmp4164 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4163, i32 0, i32 7
%.tmp4165 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4164
%.tmp4166 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4165, i32 0, i32 1
%.tmp4167 = load i8*, i8** %.tmp4166
%mod_name.4168 = alloca i8*
store i8* %.tmp4167, i8** %mod_name.4168
%.tmp4169 = load i8*, i8** %mod_name.4168
%.tmp4170 = call i32(i8*) @strlen(i8* %.tmp4169)
%mod_name_len.4171 = alloca i32
store i32 %.tmp4170, i32* %mod_name_len.4171
%.tmp4172 = load i32, i32* %mod_name_len.4171
%.tmp4173 = sub i32 %.tmp4172, 1
%.tmp4174 = call i8*(i32) @malloc(i32 %.tmp4173)
%trimmed_path.4175 = alloca i8*
store i8* %.tmp4174, i8** %trimmed_path.4175
%i.4177 = alloca i32
store i32 1, i32* %i.4177
br label %.for.start.4176
.for.start.4176:
%.tmp4178 = load i32, i32* %i.4177
%.tmp4179 = load i32, i32* %mod_name_len.4171
%.tmp4180 = sub i32 %.tmp4179, 1
%.tmp4181 = icmp slt i32 %.tmp4178, %.tmp4180
br i1 %.tmp4181, label %.for.continue.4176, label %.for.end.4176
.for.continue.4176:
%.tmp4182 = load i32, i32* %i.4177
%.tmp4183 = sub i32 %.tmp4182, 1
%.tmp4184 = load i8*, i8** %trimmed_path.4175
%.tmp4185 = getelementptr i8, i8* %.tmp4184, i32 %.tmp4183
%.tmp4186 = load i32, i32* %i.4177
%.tmp4187 = load i8*, i8** %mod_name.4168
%.tmp4188 = getelementptr i8, i8* %.tmp4187, i32 %.tmp4186
%.tmp4189 = load i8, i8* %.tmp4188
store i8 %.tmp4189, i8* %.tmp4185
%.tmp4190 = load i32, i32* %i.4177
%.tmp4191 = add i32 %.tmp4190, 1
store i32 %.tmp4191, i32* %i.4177
br label %.for.start.4176
.for.end.4176:
%.tmp4192 = load i32, i32* %mod_name_len.4171
%.tmp4193 = sub i32 %.tmp4192, 2
%.tmp4194 = load i8*, i8** %trimmed_path.4175
%.tmp4195 = getelementptr i8, i8* %.tmp4194, i32 %.tmp4193
store i8 0, i8* %.tmp4195
%.tmp4196 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4197 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4198 = load i8*, i8** %trimmed_path.4175
%.tmp4199 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$resolve_import_path.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp4196, %m980$.Node.type* %.tmp4197, i8* %.tmp4198)
%mod_abspath.4200 = alloca i8*
store i8* %.tmp4199, i8** %mod_abspath.4200
%.tmp4201 = load i8*, i8** %mod_abspath.4200
%.tmp4202 = call i8*(i32) @malloc(i32 4096)
%.tmp4203 = call i8*(i8*,i8*) @realpath(i8* %.tmp4201, i8* %.tmp4202)
%relpath.4204 = alloca i8*
store i8* %.tmp4203, i8** %relpath.4204
%.tmp4205 = load i8*, i8** %relpath.4204
%.tmp4206 = icmp eq i8* %.tmp4205, null
br i1 %.tmp4206, label %.if.true.4207, label %.if.false.4207
.if.true.4207:
%.tmp4208 = getelementptr i8*, i8** %err_buf.3753, i32 0
%.tmp4210 = getelementptr [54 x i8], [54 x i8]*@.str4209, i32 0, i32 0
%.tmp4211 = load i8*, i8** %mod_name.4168
%.tmp4212 = load i8*, i8** %mod_abspath.4200
%.tmp4213 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4208, i8* %.tmp4210, i8* %.tmp4211, i8* %.tmp4212)
%.tmp4214 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4215 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4216 = load i8*, i8** %err_buf.3753
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp4214, %m980$.Node.type* %.tmp4215, i8* %.tmp4216)
ret void
br label %.if.end.4207
.if.false.4207:
br label %.if.end.4207
.if.end.4207:
%.tmp4217 = load i8*, i8** %relpath.4204
store i8* %.tmp4217, i8** %mod_abspath.4200
%m.4218 = alloca %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* null, %m2693$.ModuleLookup.type** %m.4218
%.tmp4219 = bitcast ptr null to %m2693$.ModuleLookup.type*
%mod.4220 = alloca %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* %.tmp4219, %m2693$.ModuleLookup.type** %mod.4220
%.tmp4222 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4223 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4222, i32 0, i32 6
%.tmp4224 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %.tmp4223
store %m2693$.ModuleLookup.type* %.tmp4224, %m2693$.ModuleLookup.type** %m.4218
br label %.for.start.4221
.for.start.4221:
%.tmp4225 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.4218
%.tmp4226 = icmp ne %m2693$.ModuleLookup.type* %.tmp4225, null
%.tmp4227 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.4220
%.tmp4228 = icmp eq %m2693$.ModuleLookup.type* %.tmp4227, null
%.tmp4229 = and i1 %.tmp4226, %.tmp4228
br i1 %.tmp4229, label %.for.continue.4221, label %.for.end.4221
.for.continue.4221:
%.tmp4230 = load i8*, i8** %mod_abspath.4200
%.tmp4231 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.4218
%.tmp4232 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp4231, i32 0, i32 0
%.tmp4233 = load i8*, i8** %.tmp4232
%.tmp4234 = call i32(i8*,i8*) @strcmp(i8* %.tmp4230, i8* %.tmp4233)
%.tmp4235 = icmp eq i32 %.tmp4234, 0
br i1 %.tmp4235, label %.if.true.4236, label %.if.false.4236
.if.true.4236:
%.tmp4237 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.4218
store %m2693$.ModuleLookup.type* %.tmp4237, %m2693$.ModuleLookup.type** %mod.4220
br label %.if.end.4236
.if.false.4236:
br label %.if.end.4236
.if.end.4236:
%.tmp4238 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.4218
%.tmp4239 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp4238, i32 0, i32 2
%.tmp4240 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %.tmp4239
store %m2693$.ModuleLookup.type* %.tmp4240, %m2693$.ModuleLookup.type** %m.4218
br label %.for.start.4221
.for.end.4221:
%.tmp4241 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4242 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4241, i32 0, i32 6
%.tmp4243 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4242
%.tmp4244 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4243, i32 0, i32 7
%.tmp4245 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4244
%.tmp4246 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4245, i32 0, i32 7
%.tmp4247 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4246
%.tmp4248 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4247, i32 0, i32 7
%.tmp4249 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4248
%.tmp4250 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4249, i32 0, i32 1
%.tmp4251 = load i8*, i8** %.tmp4250
%asname.4252 = alloca i8*
store i8* %.tmp4251, i8** %asname.4252
%.tmp4253 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.4220
%.tmp4254 = icmp eq %m2693$.ModuleLookup.type* %.tmp4253, null
br i1 %.tmp4254, label %.if.true.4255, label %.if.false.4255
.if.true.4255:
%.tmp4256 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* null, i32 1
%.tmp4257 = ptrtoint %m2693$.ModuleLookup.type* %.tmp4256 to i32
%.tmp4258 = call i8*(i32) @malloc(i32 %.tmp4257)
%.tmp4259 = bitcast i8* %.tmp4258 to %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* %.tmp4259, %m2693$.ModuleLookup.type** %mod.4220
%.tmp4260 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.4220
%.tmp4261 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp4260, i32 0, i32 0
%.tmp4262 = load i8*, i8** %mod_abspath.4200
store i8* %.tmp4262, i8** %.tmp4261
%.tmp4263 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.4220
%.tmp4264 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp4263, i32 0, i32 2
store %m2693$.ModuleLookup.type* null, %m2693$.ModuleLookup.type** %.tmp4264
%.tmp4265 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.4220
%.tmp4266 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp4265, i32 0, i32 3
store %m2693$.Scope.type* null, %m2693$.Scope.type** %.tmp4266
%.tmp4267 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.4220
%.tmp4268 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp4267, i32 0, i32 1
%.tmp4269 = getelementptr i8*, i8** %.tmp4268, i32 0
%.tmp4271 = getelementptr [5 x i8], [5 x i8]*@.str4270, i32 0, i32 0
%.tmp4272 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4273 = call i32(%m2693$.CompilerCtx.type*) @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp4272)
%.tmp4274 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4269, i8* %.tmp4271, i32 %.tmp4273)
%.tmp4276 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4277 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4276, i32 0, i32 6
%.tmp4278 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %.tmp4277
store %m2693$.ModuleLookup.type* %.tmp4278, %m2693$.ModuleLookup.type** %m.4218
br label %.for.start.4275
.for.start.4275:
%.tmp4279 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.4218
%.tmp4280 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp4279, i32 0, i32 2
%.tmp4281 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %.tmp4280
%.tmp4282 = icmp ne %m2693$.ModuleLookup.type* %.tmp4281, null
br i1 %.tmp4282, label %.for.continue.4275, label %.for.end.4275
.for.continue.4275:
%.tmp4283 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.4218
%.tmp4284 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp4283, i32 0, i32 2
%.tmp4285 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %.tmp4284
store %m2693$.ModuleLookup.type* %.tmp4285, %m2693$.ModuleLookup.type** %m.4218
br label %.for.start.4275
.for.end.4275:
%.tmp4286 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %m.4218
%.tmp4287 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp4286, i32 0, i32 2
%.tmp4288 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.4220
store %m2693$.ModuleLookup.type* %.tmp4288, %m2693$.ModuleLookup.type** %.tmp4287
%.tmp4289 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4290 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4291 = load i8*, i8** %asname.4252
%.tmp4292 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.4220
%.tmp4293 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp4292, i32 0, i32 0
%.tmp4294 = load i8*, i8** %.tmp4293
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*,i8*) @m295$define_module.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.cp(%m2693$.CompilerCtx.type* %.tmp4289, %m980$.Node.type* %.tmp4290, i8* %.tmp4291, i8* %.tmp4294)
%.tmp4295 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4296 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4295, i32 0, i32 7
%.tmp4297 = load i8*, i8** %.tmp4296
%curr_mod.4298 = alloca i8*
store i8* %.tmp4297, i8** %curr_mod.4298
%.tmp4299 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4300 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4299, i32 0, i32 7
%.tmp4301 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.4220
%.tmp4302 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp4301, i32 0, i32 0
%.tmp4303 = load i8*, i8** %.tmp4302
store i8* %.tmp4303, i8** %.tmp4300
%.tmp4304 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4305 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4306 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.4220
%.tmp4307 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp4306, i32 0, i32 0
%.tmp4308 = load i8*, i8** %.tmp4307
%.tmp4309 = call i1(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$compile_file.b.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp4304, %m980$.Node.type* %.tmp4305, i8* %.tmp4308)
%.tmp4310 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4311 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4310, i32 0, i32 7
%.tmp4312 = load i8*, i8** %curr_mod.4298
store i8* %.tmp4312, i8** %.tmp4311
br label %.if.end.4255
.if.false.4255:
%.tmp4313 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4314 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4315 = load i8*, i8** %asname.4252
%.tmp4316 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.4220
%.tmp4317 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp4316, i32 0, i32 0
%.tmp4318 = load i8*, i8** %.tmp4317
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*,i8*) @m295$define_module.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.cp(%m2693$.CompilerCtx.type* %.tmp4313, %m980$.Node.type* %.tmp4314, i8* %.tmp4315, i8* %.tmp4318)
br label %.if.end.4255
.if.end.4255:
br label %.if.end.4160
.if.false.4160:
br label %.if.end.4160
.if.end.4160:
br label %.if.end.4157
.if.false.4157:
%.tmp4319 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4320 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4322 = getelementptr [40 x i8], [40 x i8]*@.str4321, i32 0, i32 0
%.tmp4323 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp4319, %m980$.Node.type* %.tmp4320, i8* %.tmp4322)
%.tmp4324 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4325 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4324, i32 0, i32 0
%.tmp4326 = load i8*, i8** %.tmp4325
%.tmp4327 = call i32(i8*,...) @printf(i8* %.tmp4323, i8* %.tmp4326)
br label %.if.end.4157
.if.end.4157:
br label %.if.end.4008
.if.end.4008:
br label %.if.end.3937
.if.end.3937:
br label %.if.end.3838
.if.end.3838:
br label %.if.end.3772
.if.end.3772:
br label %.if.end.3764
.if.end.3764:
ret void
}
define i8* @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp4329 = getelementptr [1 x i8], [1 x i8]*@.str4328, i32 0, i32 0
%buf.4330 = alloca i8*
store i8* %.tmp4329, i8** %buf.4330
%.tmp4331 = getelementptr i8*, i8** %buf.4330, i32 0
%.tmp4333 = getelementptr [31 x i8], [31 x i8]*@.str4332, i32 0, i32 0
%.tmp4334 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4335 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4334, i32 0, i32 7
%.tmp4336 = load i8*, i8** %.tmp4335
%.tmp4337 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4338 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4337, i32 0, i32 3
%.tmp4339 = load i32, i32* %.tmp4338
%.tmp4340 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4341 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4340, i32 0, i32 4
%.tmp4342 = load i32, i32* %.tmp4341
%.tmp4343 = load i8*, i8** %msg
%.tmp4344 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4331, i8* %.tmp4333, i8* %.tmp4336, i32 %.tmp4339, i32 %.tmp4342, i8* %.tmp4343)
%.tmp4345 = load i8*, i8** %buf.4330
ret i8* %.tmp4345
}
define void @m295$compile_fn_params.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.fn_params.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%fn_params = alloca %m980$.Node.type*
store %m980$.Node.type* %.fn_params.arg, %m980$.Node.type** %fn_params
%param_type.4346 = alloca %m2693$.Type.type*
store %m2693$.Type.type* null, %m2693$.Type.type** %param_type.4346
%.tmp4348 = load %m980$.Node.type*, %m980$.Node.type** %fn_params
%param_ptr.4349 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4348, %m980$.Node.type** %param_ptr.4349
br label %.for.start.4347
.for.start.4347:
%.tmp4350 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4349
%.tmp4351 = icmp ne %m980$.Node.type* %.tmp4350, null
br i1 %.tmp4351, label %.for.continue.4347, label %.for.end.4347
.for.continue.4347:
%.tmp4352 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4349
%.tmp4353 = load %m980$.Node.type*, %m980$.Node.type** %fn_params
%.tmp4354 = icmp ne %m980$.Node.type* %.tmp4352, %.tmp4353
br i1 %.tmp4354, label %.if.true.4355, label %.if.false.4355
.if.true.4355:
%.tmp4356 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4349
%.tmp4357 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4356, i32 0, i32 7
%.tmp4358 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4357
store %m980$.Node.type* %.tmp4358, %m980$.Node.type** %param_ptr.4349
br label %.if.end.4355
.if.false.4355:
br label %.if.end.4355
.if.end.4355:
%.tmp4359 = load %m980$.Node.type*, %m980$.Node.type** %fn_params
%.tmp4360 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4359)
%param_info.4361 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp4360, %m2693$.AssignableInfo.type** %param_info.4361
%.tmp4362 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %param_info.4361
%.tmp4363 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4362, i32 0, i32 3
%.tmp4365 = getelementptr [9 x i8], [9 x i8]*@.str4364, i32 0, i32 0
store i8* %.tmp4365, i8** %.tmp4363
%.tmp4366 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4349
%.tmp4367 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4366, i32 0, i32 0
%.tmp4368 = load i8*, i8** %.tmp4367
%.tmp4370 = getelementptr [5 x i8], [5 x i8]*@.str4369, i32 0, i32 0
%.tmp4371 = call i32(i8*,i8*) @strcmp(i8* %.tmp4368, i8* %.tmp4370)
%.tmp4372 = icmp eq i32 %.tmp4371, 0
br i1 %.tmp4372, label %.if.true.4373, label %.if.false.4373
.if.true.4373:
%.tmp4374 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4375 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4349
%.tmp4376 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4375, i32 0, i32 6
%.tmp4377 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4376
%.tmp4378 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp4374, %m980$.Node.type* %.tmp4377)
store %m2693$.Type.type* %.tmp4378, %m2693$.Type.type** %param_type.4346
%.tmp4379 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4349
%.tmp4380 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4379, i32 0, i32 7
%.tmp4381 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4380
store %m980$.Node.type* %.tmp4381, %m980$.Node.type** %param_ptr.4349
br label %.if.end.4373
.if.false.4373:
br label %.if.end.4373
.if.end.4373:
%.tmp4382 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %param_info.4361
%.tmp4383 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4382, i32 0, i32 4
%.tmp4384 = load %m2693$.Type.type*, %m2693$.Type.type** %param_type.4346
store %m2693$.Type.type* %.tmp4384, %m2693$.Type.type** %.tmp4383
%.tmp4385 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4349
%.tmp4386 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4385, i32 0, i32 1
%.tmp4387 = load i8*, i8** %.tmp4386
%var_name.4388 = alloca i8*
store i8* %.tmp4387, i8** %var_name.4388
%.tmp4389 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %param_info.4361
%.tmp4390 = load i8, i8* @SCOPE_LOCAL
%.tmp4391 = load i8*, i8** %var_name.4388
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp4389, i8 %.tmp4390, i8* %.tmp4391)
%.tmp4392 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4393 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %param_info.4361
%.tmp4394 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4393, i32 0, i32 4
%.tmp4395 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4394
%.tmp4396 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4392, %m2693$.Type.type* %.tmp4395)
%param_info_tr.4397 = alloca i8*
store i8* %.tmp4396, i8** %param_info_tr.4397
%.tmp4398 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4399 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4398, i32 0, i32 1
%.tmp4400 = load %m0$.File.type*, %m0$.File.type** %.tmp4399
%.tmp4402 = getelementptr [16 x i8], [16 x i8]*@.str4401, i32 0, i32 0
%.tmp4403 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %param_info.4361
%.tmp4404 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp4403)
%.tmp4405 = load i8*, i8** %param_info_tr.4397
%.tmp4406 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4400, i8* %.tmp4402, i8* %.tmp4404, i8* %.tmp4405)
%.tmp4407 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4408 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4349
%.tmp4409 = load i8*, i8** %var_name.4388
%.tmp4410 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %param_info.4361
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2693$.AssignableInfo.type*) @m295$define_assignable.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp4407, %m980$.Node.type* %.tmp4408, i8* %.tmp4409, %m2693$.AssignableInfo.type* %.tmp4410)
%.tmp4411 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4412 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4411, i32 0, i32 1
%.tmp4413 = load %m0$.File.type*, %m0$.File.type** %.tmp4412
%.tmp4415 = getelementptr [28 x i8], [28 x i8]*@.str4414, i32 0, i32 0
%.tmp4416 = load i8*, i8** %param_info_tr.4397
%.tmp4417 = load i8*, i8** %var_name.4388
%.tmp4418 = load i8*, i8** %param_info_tr.4397
%.tmp4419 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %param_info.4361
%.tmp4420 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp4419)
%.tmp4421 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4413, i8* %.tmp4415, i8* %.tmp4416, i8* %.tmp4417, i8* %.tmp4418, i8* %.tmp4420)
%.tmp4422 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.4349
%.tmp4423 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4422, i32 0, i32 7
%.tmp4424 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4423
store %m980$.Node.type* %.tmp4424, %m980$.Node.type** %param_ptr.4349
br label %.for.start.4347
.for.end.4347:
ret void
}
define void @m295$compile_block.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp4425 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4427 = getelementptr [6 x i8], [6 x i8]*@.str4426, i32 0, i32 0
%.tmp4428 = bitcast ptr null to i8*
%.tmp4429 = bitcast ptr null to i8*
%.tmp4430 = bitcast ptr null to %m2693$.Type.type*
call void(%m2693$.CompilerCtx.type*,i8*,i8*,i8*,%m2693$.Type.type*) @m295$push_scope.v.m2693$.CompilerCtx.typep.cp.cp.cp.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4425, i8* %.tmp4427, i8* %.tmp4428, i8* %.tmp4429, %m2693$.Type.type* %.tmp4430)
%.tmp4431 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4432 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4431, i32 0, i32 6
%.tmp4433 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4432
%.tmp4435 = getelementptr [12 x i8], [12 x i8]*@.str4434, i32 0, i32 0
%.tmp4436 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4433, i8* %.tmp4435)
%exprs.4437 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4436, %m980$.Node.type** %exprs.4437
%.tmp4438 = load %m980$.Node.type*, %m980$.Node.type** %exprs.4437
%.tmp4439 = icmp ne %m980$.Node.type* %.tmp4438, null
br i1 %.tmp4439, label %.if.true.4440, label %.if.false.4440
.if.true.4440:
%.tmp4442 = load %m980$.Node.type*, %m980$.Node.type** %exprs.4437
%.tmp4443 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4442, i32 0, i32 6
%.tmp4444 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4443
%b.4445 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4444, %m980$.Node.type** %b.4445
br label %.for.start.4441
.for.start.4441:
%.tmp4446 = load %m980$.Node.type*, %m980$.Node.type** %b.4445
%.tmp4447 = icmp ne %m980$.Node.type* %.tmp4446, null
br i1 %.tmp4447, label %.for.continue.4441, label %.for.end.4441
.for.continue.4441:
%.tmp4448 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4449 = load %m980$.Node.type*, %m980$.Node.type** %b.4445
%.tmp4450 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4449, i32 0, i32 6
%.tmp4451 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4450
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_expression.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp4448, %m980$.Node.type* %.tmp4451)
%.tmp4452 = load %m980$.Node.type*, %m980$.Node.type** %b.4445
%.tmp4453 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4452, i32 0, i32 7
%.tmp4454 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4453
store %m980$.Node.type* %.tmp4454, %m980$.Node.type** %b.4445
br label %.for.start.4441
.for.end.4441:
br label %.if.end.4440
.if.false.4440:
br label %.if.end.4440
.if.end.4440:
%.tmp4455 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
call void(%m2693$.CompilerCtx.type*) @m295$pop_scope.v.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp4455)
ret void
}
define %m2693$.AssignableInfo.type* @m295$get_struct_attr.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep.i(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp4456 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4457 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4458 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp4456, %m980$.Node.type* %.tmp4457)
%val.4459 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp4458, %m2693$.AssignableInfo.type** %val.4459
%.tmp4460 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %val.4459
%.tmp4461 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4460, i32 0, i32 4
%.tmp4462 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4461
%.tmp4463 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4462, i32 0, i32 0
%.tmp4464 = load i8*, i8** %.tmp4463
%.tmp4466 = getelementptr [7 x i8], [7 x i8]*@.str4465, i32 0, i32 0
%.tmp4467 = call i32(i8*,i8*) @strcmp(i8* %.tmp4464, i8* %.tmp4466)
%.tmp4468 = icmp ne i32 %.tmp4467, 0
br i1 %.tmp4468, label %.if.true.4469, label %.if.false.4469
.if.true.4469:
%.tmp4471 = getelementptr [7 x i8], [7 x i8]*@.str4470, i32 0, i32 0
%.tmp4472 = call i32(i8*,...) @printf(i8* %.tmp4471)
%.tmp4473 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp4473
br label %.if.end.4469
.if.false.4469:
br label %.if.end.4469
.if.end.4469:
%.tmp4474 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %val.4459
%.tmp4475 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4474, i32 0, i32 4
%.tmp4476 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4475
%.tmp4477 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4476, i32 0, i32 3
%.tmp4478 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4477
%node_type.4479 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp4478, %m2693$.Type.type** %node_type.4479
%i.4481 = alloca i32
store i32 0, i32* %i.4481
br label %.for.start.4480
.for.start.4480:
%.tmp4482 = load i32, i32* %i.4481
%.tmp4483 = load i32, i32* %attr_id
%.tmp4484 = icmp slt i32 %.tmp4482, %.tmp4483
br i1 %.tmp4484, label %.for.continue.4480, label %.for.end.4480
.for.continue.4480:
%.tmp4485 = load %m2693$.Type.type*, %m2693$.Type.type** %node_type.4479
%.tmp4486 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4485, i32 0, i32 4
%.tmp4487 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4486
store %m2693$.Type.type* %.tmp4487, %m2693$.Type.type** %node_type.4479
%.tmp4488 = load i32, i32* %i.4481
%.tmp4489 = add i32 %.tmp4488, 1
store i32 %.tmp4489, i32* %i.4481
br label %.for.start.4480
.for.end.4480:
%.tmp4490 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4491 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4490)
%info.4492 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp4491, %m2693$.AssignableInfo.type** %info.4492
%.tmp4493 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4492
%.tmp4494 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4493, i32 0, i32 4
%.tmp4495 = load %m2693$.Type.type*, %m2693$.Type.type** %node_type.4479
store %m2693$.Type.type* %.tmp4495, %m2693$.Type.type** %.tmp4494
%.tmp4496 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4497 = call i32(%m2693$.CompilerCtx.type*) @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp4496)
%tmp_id.4498 = alloca i32
store i32 %.tmp4497, i32* %tmp_id.4498
%.tmp4499 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4500 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %val.4459
%.tmp4501 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4500, i32 0, i32 4
%.tmp4502 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4501
%.tmp4503 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4499, %m2693$.Type.type* %.tmp4502)
%type_as_str.4504 = alloca i8*
store i8* %.tmp4503, i8** %type_as_str.4504
%.tmp4505 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4506 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4492
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp4505, %m2693$.AssignableInfo.type* %.tmp4506)
%.tmp4507 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4508 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4507, i32 0, i32 1
%.tmp4509 = load %m0$.File.type*, %m0$.File.type** %.tmp4508
%.tmp4511 = getelementptr [52 x i8], [52 x i8]*@.str4510, i32 0, i32 0
%.tmp4512 = load i32, i32* %tmp_id.4498
%.tmp4513 = load i8*, i8** %type_as_str.4504
%.tmp4514 = load i8*, i8** %type_as_str.4504
%.tmp4515 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %val.4459
%.tmp4516 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp4515)
%.tmp4517 = load i32, i32* %attr_id
%.tmp4518 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4509, i8* %.tmp4511, i32 %.tmp4512, i8* %.tmp4513, i8* %.tmp4514, i8* %.tmp4516, i32 %.tmp4517)
%.tmp4519 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4520 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4519, i32 0, i32 1
%.tmp4521 = load %m0$.File.type*, %m0$.File.type** %.tmp4520
%.tmp4523 = getelementptr [28 x i8], [28 x i8]*@.str4522, i32 0, i32 0
%.tmp4524 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4492
%.tmp4525 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp4524)
%.tmp4526 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4527 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4492
%.tmp4528 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4527, i32 0, i32 4
%.tmp4529 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4528
%.tmp4530 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4526, %m2693$.Type.type* %.tmp4529)
%.tmp4531 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4532 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4492
%.tmp4533 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4532, i32 0, i32 4
%.tmp4534 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4533
%.tmp4535 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4531, %m2693$.Type.type* %.tmp4534)
%.tmp4536 = load i32, i32* %tmp_id.4498
%.tmp4537 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4521, i8* %.tmp4523, i8* %.tmp4525, i8* %.tmp4530, i8* %.tmp4535, i32 %.tmp4536)
%.tmp4538 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4492
ret %m2693$.AssignableInfo.type* %.tmp4538
}
define void @m295$set_struct_attr.v.m2693$.CompilerCtx.typep.m980$.Node.typep.i.cp(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i32 %.attr_id.arg, i8* %.attr.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%attr = alloca i8*
store i8* %.attr.arg, i8** %attr
%.tmp4539 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4540 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4541 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp4539, %m980$.Node.type* %.tmp4540)
%val.4542 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp4541, %m2693$.AssignableInfo.type** %val.4542
%.tmp4543 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %val.4542
%.tmp4544 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4543, i32 0, i32 4
%.tmp4545 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4544
%.tmp4546 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4545, i32 0, i32 0
%.tmp4547 = load i8*, i8** %.tmp4546
%.tmp4549 = getelementptr [7 x i8], [7 x i8]*@.str4548, i32 0, i32 0
%.tmp4550 = call i32(i8*,i8*) @strcmp(i8* %.tmp4547, i8* %.tmp4549)
%.tmp4551 = icmp ne i32 %.tmp4550, 0
br i1 %.tmp4551, label %.if.true.4552, label %.if.false.4552
.if.true.4552:
%.tmp4554 = getelementptr [7 x i8], [7 x i8]*@.str4553, i32 0, i32 0
%.tmp4555 = call i32(i8*,...) @printf(i8* %.tmp4554)
ret void
br label %.if.end.4552
.if.false.4552:
br label %.if.end.4552
.if.end.4552:
%.tmp4556 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %val.4542
%.tmp4557 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4556, i32 0, i32 4
%.tmp4558 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4557
%.tmp4559 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4558, i32 0, i32 3
%.tmp4560 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4559
%node_type.4561 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp4560, %m2693$.Type.type** %node_type.4561
%i.4563 = alloca i32
store i32 0, i32* %i.4563
br label %.for.start.4562
.for.start.4562:
%.tmp4564 = load i32, i32* %i.4563
%.tmp4565 = load i32, i32* %attr_id
%.tmp4566 = icmp slt i32 %.tmp4564, %.tmp4565
br i1 %.tmp4566, label %.for.continue.4562, label %.for.end.4562
.for.continue.4562:
%.tmp4567 = load %m2693$.Type.type*, %m2693$.Type.type** %node_type.4561
%.tmp4568 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4567, i32 0, i32 4
%.tmp4569 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4568
store %m2693$.Type.type* %.tmp4569, %m2693$.Type.type** %node_type.4561
%.tmp4570 = load i32, i32* %i.4563
%.tmp4571 = add i32 %.tmp4570, 1
store i32 %.tmp4571, i32* %i.4563
br label %.for.start.4562
.for.end.4562:
%.tmp4572 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4573 = call i32(%m2693$.CompilerCtx.type*) @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp4572)
%tmp_id.4574 = alloca i32
store i32 %.tmp4573, i32* %tmp_id.4574
%.tmp4575 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4576 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %val.4542
%.tmp4577 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4576, i32 0, i32 4
%.tmp4578 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4577
%.tmp4579 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4575, %m2693$.Type.type* %.tmp4578)
%type_as_str.4580 = alloca i8*
store i8* %.tmp4579, i8** %type_as_str.4580
%.tmp4581 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4582 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4581, i32 0, i32 1
%.tmp4583 = load %m0$.File.type*, %m0$.File.type** %.tmp4582
%.tmp4585 = getelementptr [52 x i8], [52 x i8]*@.str4584, i32 0, i32 0
%.tmp4586 = load i32, i32* %tmp_id.4574
%.tmp4587 = load i8*, i8** %type_as_str.4580
%.tmp4588 = load i8*, i8** %type_as_str.4580
%.tmp4589 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %val.4542
%.tmp4590 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp4589)
%.tmp4591 = load i32, i32* %attr_id
%.tmp4592 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4583, i8* %.tmp4585, i32 %.tmp4586, i8* %.tmp4587, i8* %.tmp4588, i8* %.tmp4590, i32 %.tmp4591)
%.tmp4593 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4594 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4593, i32 0, i32 1
%.tmp4595 = load %m0$.File.type*, %m0$.File.type** %.tmp4594
%.tmp4597 = getelementptr [18 x i8], [18 x i8]*@.str4596, i32 0, i32 0
%.tmp4598 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4599 = load %m2693$.Type.type*, %m2693$.Type.type** %node_type.4561
%.tmp4600 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4598, %m2693$.Type.type* %.tmp4599)
%.tmp4601 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4602 = load %m2693$.Type.type*, %m2693$.Type.type** %node_type.4561
%.tmp4603 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4601, %m2693$.Type.type* %.tmp4602)
%.tmp4604 = load i8*, i8** %attr
%.tmp4605 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4595, i8* %.tmp4597, i8* %.tmp4600, i8* %.tmp4603, i8* %.tmp4604)
ret void
}
define %m2693$.AssignableInfo.type* @m295$compile_builtin.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp4606 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4607 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4606, i32 0, i32 6
%.tmp4608 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4607
%.tmp4609 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4608, i32 0, i32 6
%.tmp4610 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4609
%dotted.4611 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4610, %m980$.Node.type** %dotted.4611
%.tmp4612 = load %m980$.Node.type*, %m980$.Node.type** %dotted.4611
%.tmp4613 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4612, i32 0, i32 7
%.tmp4614 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4613
%.tmp4615 = icmp ne %m980$.Node.type* %.tmp4614, null
br i1 %.tmp4615, label %.if.true.4616, label %.if.false.4616
.if.true.4616:
%.tmp4617 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp4617
br label %.if.end.4616
.if.false.4616:
br label %.if.end.4616
.if.end.4616:
%.tmp4618 = load %m980$.Node.type*, %m980$.Node.type** %dotted.4611
%.tmp4619 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4618, i32 0, i32 1
%.tmp4620 = load i8*, i8** %.tmp4619
%.tmp4622 = getelementptr [7 x i8], [7 x i8]*@.str4621, i32 0, i32 0
%.tmp4623 = call i32(i8*,i8*) @strcmp(i8* %.tmp4620, i8* %.tmp4622)
%.tmp4624 = icmp eq i32 %.tmp4623, 0
br i1 %.tmp4624, label %.if.true.4625, label %.if.false.4625
.if.true.4625:
%.tmp4626 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4628 = getelementptr [8 x i8], [8 x i8]*@.str4627, i32 0, i32 0
%.tmp4629 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4626, i8* %.tmp4628)
%args.4630 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4629, %m980$.Node.type** %args.4630
%.tmp4631 = load %m980$.Node.type*, %m980$.Node.type** %args.4630
%.tmp4632 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4631, i32 0, i32 6
%.tmp4633 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4632
%.tmp4635 = getelementptr [11 x i8], [11 x i8]*@.str4634, i32 0, i32 0
%.tmp4636 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4633, i8* %.tmp4635)
%value.4637 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4636, %m980$.Node.type** %value.4637
%.tmp4638 = load %m980$.Node.type*, %m980$.Node.type** %value.4637
%.tmp4639 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4638, i32 0, i32 6
%.tmp4640 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4639
%.tmp4641 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4640, i32 0, i32 6
%.tmp4642 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4641
%.tmp4643 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4642, i32 0, i32 6
%.tmp4644 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4643
%.tmp4645 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4644, i32 0, i32 6
%.tmp4646 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4645
store %m980$.Node.type* %.tmp4646, %m980$.Node.type** %value.4637
%.tmp4647 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4648 = call i32(%m2693$.CompilerCtx.type*) @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp4647)
%tmp_id.4649 = alloca i32
store i32 %.tmp4648, i32* %tmp_id.4649
%.tmp4650 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4651 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4650)
%info.4652 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp4651, %m2693$.AssignableInfo.type** %info.4652
%.tmp4653 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4654 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4652
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp4653, %m2693$.AssignableInfo.type* %.tmp4654)
%.tmp4655 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4652
%.tmp4656 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4655, i32 0, i32 4
%.tmp4657 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp4657, %m2693$.Type.type** %.tmp4656
%.tmp4658 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4652
%.tmp4659 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4658, i32 0, i32 4
%.tmp4660 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4659
%.tmp4661 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4660, i32 0, i32 0
%.tmp4663 = getelementptr [4 x i8], [4 x i8]*@.str4662, i32 0, i32 0
store i8* %.tmp4663, i8** %.tmp4661
%.tmp4664 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4665 = load %m980$.Node.type*, %m980$.Node.type** %value.4637
%.tmp4666 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp4664, %m980$.Node.type* %.tmp4665)
%inspected_type.4667 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp4666, %m2693$.Type.type** %inspected_type.4667
%.tmp4668 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4669 = load %m2693$.Type.type*, %m2693$.Type.type** %inspected_type.4667
%.tmp4670 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4668, %m2693$.Type.type* %.tmp4669)
%type_as_str.4671 = alloca i8*
store i8* %.tmp4670, i8** %type_as_str.4671
%.tmp4672 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4673 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4672, i32 0, i32 1
%.tmp4674 = load %m0$.File.type*, %m0$.File.type** %.tmp4673
%.tmp4676 = getelementptr [46 x i8], [46 x i8]*@.str4675, i32 0, i32 0
%.tmp4677 = load i32, i32* %tmp_id.4649
%.tmp4678 = load i8*, i8** %type_as_str.4671
%.tmp4679 = load i8*, i8** %type_as_str.4671
%.tmp4680 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4674, i8* %.tmp4676, i32 %.tmp4677, i8* %.tmp4678, i8* %.tmp4679)
%.tmp4681 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4682 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4681, i32 0, i32 1
%.tmp4683 = load %m0$.File.type*, %m0$.File.type** %.tmp4682
%.tmp4685 = getelementptr [35 x i8], [35 x i8]*@.str4684, i32 0, i32 0
%.tmp4686 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4652
%.tmp4687 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp4686)
%.tmp4688 = load i8*, i8** %type_as_str.4671
%.tmp4689 = load i32, i32* %tmp_id.4649
%.tmp4690 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4683, i8* %.tmp4685, i8* %.tmp4687, i8* %.tmp4688, i32 %.tmp4689)
%.tmp4691 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4652
ret %m2693$.AssignableInfo.type* %.tmp4691
br label %.if.end.4625
.if.false.4625:
%.tmp4692 = load %m980$.Node.type*, %m980$.Node.type** %dotted.4611
%.tmp4693 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4692, i32 0, i32 1
%.tmp4694 = load i8*, i8** %.tmp4693
%.tmp4696 = getelementptr [7 x i8], [7 x i8]*@.str4695, i32 0, i32 0
%.tmp4697 = call i32(i8*,i8*) @strcmp(i8* %.tmp4694, i8* %.tmp4696)
%.tmp4698 = icmp eq i32 %.tmp4697, 0
br i1 %.tmp4698, label %.if.true.4699, label %.if.false.4699
.if.true.4699:
%.tmp4700 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4702 = getelementptr [8 x i8], [8 x i8]*@.str4701, i32 0, i32 0
%.tmp4703 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4700, i8* %.tmp4702)
%args.4704 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4703, %m980$.Node.type** %args.4704
%.tmp4705 = load %m980$.Node.type*, %m980$.Node.type** %args.4704
%.tmp4706 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4705, i32 0, i32 6
%.tmp4707 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4706
%.tmp4709 = getelementptr [11 x i8], [11 x i8]*@.str4708, i32 0, i32 0
%.tmp4710 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4707, i8* %.tmp4709)
%array.4711 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4710, %m980$.Node.type** %array.4711
%.tmp4712 = load %m980$.Node.type*, %m980$.Node.type** %array.4711
%.tmp4713 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4712, i32 0, i32 7
%.tmp4714 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4713
%.tmp4716 = getelementptr [11 x i8], [11 x i8]*@.str4715, i32 0, i32 0
%.tmp4717 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4714, i8* %.tmp4716)
%value.4718 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4717, %m980$.Node.type** %value.4718
%.tmp4719 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4720 = load %m980$.Node.type*, %m980$.Node.type** %value.4718
%.tmp4721 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp4719, %m980$.Node.type* %.tmp4720)
%value_info.4722 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp4721, %m2693$.AssignableInfo.type** %value_info.4722
%.tmp4723 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4724 = load %m980$.Node.type*, %m980$.Node.type** %array.4711
%.tmp4725 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp4723, %m980$.Node.type* %.tmp4724)
%array_info.4726 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp4725, %m2693$.AssignableInfo.type** %array_info.4726
%.tmp4727 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4728 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4727)
%info.4729 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp4728, %m2693$.AssignableInfo.type** %info.4729
%.tmp4730 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4731 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4729
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp4730, %m2693$.AssignableInfo.type* %.tmp4731)
%.tmp4732 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4729
%.tmp4733 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4732, i32 0, i32 4
%.tmp4734 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %array_info.4726
%.tmp4735 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4734, i32 0, i32 4
%.tmp4736 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4735
store %m2693$.Type.type* %.tmp4736, %m2693$.Type.type** %.tmp4733
%.tmp4738 = getelementptr [1 x i8], [1 x i8]*@.str4737, i32 0, i32 0
%builtin_prefix.4739 = alloca i8*
store i8* %.tmp4738, i8** %builtin_prefix.4739
%.tmp4740 = getelementptr i8*, i8** %builtin_prefix.4739, i32 0
%.tmp4742 = getelementptr [5 x i8], [5 x i8]*@.str4741, i32 0, i32 0
%.tmp4743 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4744 = call i32(%m2693$.CompilerCtx.type*) @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp4743)
%.tmp4745 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4740, i8* %.tmp4742, i32 %.tmp4744)
%.tmp4746 = call i8*() @m2244$append_tmpl.cp()
%tmpl.4747 = alloca i8*
store i8* %.tmp4746, i8** %tmpl.4747
%.tmp4748 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4749 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4748, i32 0, i32 1
%.tmp4750 = load %m0$.File.type*, %m0$.File.type** %.tmp4749
%.tmp4751 = load i8*, i8** %tmpl.4747
%.tmp4752 = load i8*, i8** %builtin_prefix.4739
%.tmp4753 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4754 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %array_info.4726
%.tmp4755 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4754, i32 0, i32 4
%.tmp4756 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4755
%.tmp4757 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4753, %m2693$.Type.type* %.tmp4756)
%.tmp4758 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %array_info.4726
%.tmp4759 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp4758)
%.tmp4760 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4761 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %value_info.4722
%.tmp4762 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4761, i32 0, i32 4
%.tmp4763 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4762
%.tmp4764 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp4760, %m2693$.Type.type* %.tmp4763)
%.tmp4765 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %value_info.4722
%.tmp4766 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp4765)
%.tmp4767 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4729
%.tmp4768 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp4767)
%.tmp4769 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4750, i8* %.tmp4751, i8* %.tmp4752, i8* %.tmp4757, i8* %.tmp4759, i8* %.tmp4764, i8* %.tmp4766, i8* %.tmp4768)
%.tmp4770 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4771 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp4770)
%info_g.4772 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp4771, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4773 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4774 = load i8, i8* @SCOPE_GLOBAL
%.tmp4776 = getelementptr [8 x i8], [8 x i8]*@.str4775, i32 0, i32 0
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp4773, i8 %.tmp4774, i8* %.tmp4776)
%.tmp4777 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4778 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4777, i32 0, i32 4
%.tmp4779 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp4779, %m2693$.Type.type** %.tmp4778
%.tmp4780 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4781 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4780, i32 0, i32 4
%.tmp4782 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4781
%.tmp4783 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4782, i32 0, i32 0
%.tmp4785 = getelementptr [9 x i8], [9 x i8]*@.str4784, i32 0, i32 0
store i8* %.tmp4785, i8** %.tmp4783
%.tmp4786 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4787 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4786, i32 0, i32 4
%.tmp4788 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4787
%.tmp4789 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4788, i32 0, i32 3
%.tmp4790 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp4790, %m2693$.Type.type** %.tmp4789
%.tmp4791 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4792 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4791, i32 0, i32 4
%.tmp4793 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4792
%.tmp4794 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4793, i32 0, i32 3
%.tmp4795 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4794
%.tmp4796 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4795, i32 0, i32 0
%.tmp4798 = getelementptr [4 x i8], [4 x i8]*@.str4797, i32 0, i32 0
store i8* %.tmp4798, i8** %.tmp4796
%.tmp4799 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4800 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4799, i32 0, i32 4
%.tmp4801 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4800
%.tmp4802 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4801, i32 0, i32 3
%.tmp4803 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4802
%.tmp4804 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4803, i32 0, i32 3
%.tmp4805 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp4805, %m2693$.Type.type** %.tmp4804
%.tmp4806 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4807 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4806, i32 0, i32 4
%.tmp4808 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4807
%.tmp4809 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4808, i32 0, i32 3
%.tmp4810 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4809
%.tmp4811 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4810, i32 0, i32 3
%.tmp4812 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4811
%.tmp4813 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4812, i32 0, i32 0
%.tmp4815 = getelementptr [4 x i8], [4 x i8]*@.str4814, i32 0, i32 0
store i8* %.tmp4815, i8** %.tmp4813
%.tmp4816 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4817 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4816, i32 0, i32 4
%.tmp4818 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4817
%.tmp4819 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4818, i32 0, i32 3
%.tmp4820 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4819
%.tmp4821 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4820, i32 0, i32 4
%.tmp4822 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp4822, %m2693$.Type.type** %.tmp4821
%.tmp4823 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4824 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4823, i32 0, i32 4
%.tmp4825 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4824
%.tmp4826 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4825, i32 0, i32 3
%.tmp4827 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4826
%.tmp4828 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4827, i32 0, i32 4
%.tmp4829 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4828
%.tmp4830 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4829, i32 0, i32 0
%.tmp4832 = getelementptr [4 x i8], [4 x i8]*@.str4831, i32 0, i32 0
store i8* %.tmp4832, i8** %.tmp4830
%.tmp4833 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4834 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4833, i32 0, i32 4
%.tmp4835 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4834
%.tmp4836 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4835, i32 0, i32 3
%.tmp4837 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4836
%.tmp4838 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4837, i32 0, i32 4
%.tmp4839 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4838
%.tmp4840 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4839, i32 0, i32 3
%.tmp4841 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp4841, %m2693$.Type.type** %.tmp4840
%.tmp4842 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4843 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4842, i32 0, i32 4
%.tmp4844 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4843
%.tmp4845 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4844, i32 0, i32 3
%.tmp4846 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4845
%.tmp4847 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4846, i32 0, i32 4
%.tmp4848 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4847
%.tmp4849 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4848, i32 0, i32 3
%.tmp4850 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4849
%.tmp4851 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4850, i32 0, i32 0
%.tmp4853 = getelementptr [4 x i8], [4 x i8]*@.str4852, i32 0, i32 0
store i8* %.tmp4853, i8** %.tmp4851
%.tmp4854 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4855 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4854, i32 0, i32 4
%.tmp4856 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4855
%.tmp4857 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4856, i32 0, i32 3
%.tmp4858 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4857
%.tmp4859 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4858, i32 0, i32 4
%.tmp4860 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4859
%.tmp4861 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4860, i32 0, i32 4
%.tmp4862 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp4862, %m2693$.Type.type** %.tmp4861
%.tmp4863 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
%.tmp4864 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp4863, i32 0, i32 4
%.tmp4865 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4864
%.tmp4866 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4865, i32 0, i32 3
%.tmp4867 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4866
%.tmp4868 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4867, i32 0, i32 4
%.tmp4869 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4868
%.tmp4870 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4869, i32 0, i32 4
%.tmp4871 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp4870
%.tmp4872 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp4871, i32 0, i32 0
%.tmp4874 = getelementptr [4 x i8], [4 x i8]*@.str4873, i32 0, i32 0
store i8* %.tmp4874, i8** %.tmp4872
%.tmp4875 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4877 = getelementptr [8 x i8], [8 x i8]*@.str4876, i32 0, i32 0
%.tmp4879 = getelementptr [7 x i8], [7 x i8]*@.str4878, i32 0, i32 0
%.tmp4880 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_g.4772
call void(%m2693$.CompilerCtx.type*,i8*,i8*,%m2693$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2693$.CompilerCtx.typep.cp.cp.m2693$.AssignableInfo.typep.b.b(%m2693$.CompilerCtx.type* %.tmp4875, i8* %.tmp4877, i8* %.tmp4879, %m2693$.AssignableInfo.type* %.tmp4880, i1 1, i1 0)
%.tmp4881 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4729
ret %m2693$.AssignableInfo.type* %.tmp4881
br label %.if.end.4699
.if.false.4699:
%.tmp4882 = load %m980$.Node.type*, %m980$.Node.type** %dotted.4611
%.tmp4883 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4882, i32 0, i32 1
%.tmp4884 = load i8*, i8** %.tmp4883
%.tmp4886 = getelementptr [4 x i8], [4 x i8]*@.str4885, i32 0, i32 0
%.tmp4887 = call i32(i8*,i8*) @strcmp(i8* %.tmp4884, i8* %.tmp4886)
%.tmp4888 = icmp eq i32 %.tmp4887, 0
br i1 %.tmp4888, label %.if.true.4889, label %.if.false.4889
.if.true.4889:
%.tmp4890 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4892 = getelementptr [8 x i8], [8 x i8]*@.str4891, i32 0, i32 0
%.tmp4893 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4890, i8* %.tmp4892)
%args.4894 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4893, %m980$.Node.type** %args.4894
%.tmp4895 = load %m980$.Node.type*, %m980$.Node.type** %args.4894
%.tmp4896 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp4895, i32 0, i32 6
%.tmp4897 = load %m980$.Node.type*, %m980$.Node.type** %.tmp4896
%.tmp4899 = getelementptr [11 x i8], [11 x i8]*@.str4898, i32 0, i32 0
%.tmp4900 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4897, i8* %.tmp4899)
%value.4901 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4900, %m980$.Node.type** %value.4901
%.tmp4902 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4903 = load %m980$.Node.type*, %m980$.Node.type** %value.4901
%.tmp4904 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i32) @m295$get_struct_attr.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep.i(%m2693$.CompilerCtx.type* %.tmp4902, %m980$.Node.type* %.tmp4903, i32 1)
ret %m2693$.AssignableInfo.type* %.tmp4904
br label %.if.end.4889
.if.false.4889:
br label %.if.end.4889
.if.end.4889:
br label %.if.end.4699
.if.end.4699:
br label %.if.end.4625
.if.end.4625:
%.tmp4905 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp4905
}
define i8* @m295$resolve_import_path.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp4907 = getelementptr [1 x i8], [1 x i8]*@.str4906, i32 0, i32 0
%err_buf.4908 = alloca i8*
store i8* %.tmp4907, i8** %err_buf.4908
%.tmp4909 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4910 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp4909, i32 0, i32 7
%.tmp4911 = load i8*, i8** %.tmp4910
%mod_abspath.4912 = alloca i8*
store i8* %.tmp4911, i8** %mod_abspath.4912
%.tmp4913 = load i8*, i8** %mod_abspath.4912
%.tmp4914 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp4913)
%dirname.4915 = alloca i8*
store i8* %.tmp4914, i8** %dirname.4915
%.tmp4916 = load i8*, i8** %import_str
%.tmp4917 = getelementptr i8, i8* %.tmp4916, i32 0
%.tmp4918 = load i8, i8* %.tmp4917
%.tmp4919 = icmp eq i8 %.tmp4918, 47
br i1 %.tmp4919, label %.if.true.4920, label %.if.false.4920
.if.true.4920:
%.tmp4921 = getelementptr i8*, i8** %err_buf.4908, i32 0
%.tmp4923 = getelementptr [46 x i8], [46 x i8]*@.str4922, i32 0, i32 0
%.tmp4924 = load i8*, i8** %import_str
%.tmp4925 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4921, i8* %.tmp4923, i8* %.tmp4924)
%.tmp4926 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4927 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4928 = load i8*, i8** %err_buf.4908
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp4926, %m980$.Node.type* %.tmp4927, i8* %.tmp4928)
%.tmp4929 = bitcast ptr null to i8*
ret i8* %.tmp4929
br label %.if.end.4920
.if.false.4920:
br label %.if.end.4920
.if.end.4920:
%.tmp4930 = load i8*, i8** %import_str
%.tmp4931 = getelementptr i8, i8* %.tmp4930, i32 0
%.tmp4932 = load i8, i8* %.tmp4931
%.tmp4933 = icmp ne i8 %.tmp4932, 46
%.tmp4934 = load i8*, i8** %import_str
%.tmp4935 = getelementptr i8, i8* %.tmp4934, i32 1
%.tmp4936 = load i8, i8* %.tmp4935
%.tmp4937 = icmp ne i8 %.tmp4936, 47
%.tmp4938 = and i1 %.tmp4933, %.tmp4937
br i1 %.tmp4938, label %.if.true.4939, label %.if.false.4939
.if.true.4939:
%.tmp4940 = call i8*() @m295$get_root.cp()
%root.4941 = alloca i8*
store i8* %.tmp4940, i8** %root.4941
%.tmp4942 = getelementptr i8*, i8** %mod_abspath.4912, i32 0
%.tmp4944 = getelementptr [13 x i8], [13 x i8]*@.str4943, i32 0, i32 0
%.tmp4945 = load i8*, i8** %root.4941
%.tmp4946 = load i8*, i8** %import_str
%.tmp4947 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4942, i8* %.tmp4944, i8* %.tmp4945, i8* %.tmp4946)
br label %.if.end.4939
.if.false.4939:
%.tmp4948 = load i8*, i8** %dirname.4915
%.tmp4950 = getelementptr [1 x i8], [1 x i8]*@.str4949, i32 0, i32 0
%.tmp4951 = call i32(i8*,i8*) @strcmp(i8* %.tmp4948, i8* %.tmp4950)
%.tmp4952 = icmp eq i32 %.tmp4951, 0
br i1 %.tmp4952, label %.if.true.4953, label %.if.false.4953
.if.true.4953:
%.tmp4954 = getelementptr i8*, i8** %mod_abspath.4912, i32 0
%.tmp4956 = getelementptr [6 x i8], [6 x i8]*@.str4955, i32 0, i32 0
%.tmp4957 = load i8*, i8** %import_str
%.tmp4958 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4954, i8* %.tmp4956, i8* %.tmp4957)
br label %.if.end.4953
.if.false.4953:
%.tmp4959 = getelementptr i8*, i8** %mod_abspath.4912, i32 0
%.tmp4961 = getelementptr [9 x i8], [9 x i8]*@.str4960, i32 0, i32 0
%.tmp4962 = load i8*, i8** %dirname.4915
%.tmp4963 = load i8*, i8** %import_str
%.tmp4964 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4959, i8* %.tmp4961, i8* %.tmp4962, i8* %.tmp4963)
br label %.if.end.4953
.if.end.4953:
br label %.if.end.4939
.if.end.4939:
%.tmp4965 = load i8*, i8** %mod_abspath.4912
ret i8* %.tmp4965
}
define %m2693$.AssignableInfo.type* @m295$compile_fn_call.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp4966 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4967 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4968 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_builtin.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp4966, %m980$.Node.type* %.tmp4967)
%info.4969 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp4968, %m2693$.AssignableInfo.type** %info.4969
%.tmp4970 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp4971 = icmp ne %m2693$.AssignableInfo.type* %.tmp4970, null
br i1 %.tmp4971, label %.if.true.4972, label %.if.false.4972
.if.true.4972:
%.tmp4973 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
ret %m2693$.AssignableInfo.type* %.tmp4973
br label %.if.end.4972
.if.false.4972:
br label %.if.end.4972
.if.end.4972:
%.tmp4974 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4975 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4976 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp4974, %m980$.Node.type* %.tmp4975)
store %m2693$.AssignableInfo.type* %.tmp4976, %m2693$.AssignableInfo.type** %info.4969
%.tmp4977 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp4978 = icmp eq %m2693$.AssignableInfo.type* %.tmp4977, null
br i1 %.tmp4978, label %.if.true.4979, label %.if.false.4979
.if.true.4979:
%.tmp4980 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4980, label %.if.true.4981, label %.if.false.4981
.if.true.4981:
%.tmp4982 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp4983 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4985 = getelementptr [35 x i8], [35 x i8]*@.str4984, i32 0, i32 0
%.tmp4986 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp4982, %m980$.Node.type* %.tmp4983, i8* %.tmp4985)
%.tmp4987 = call i32(i8*,...) @printf(i8* %.tmp4986)
br label %.if.end.4981
.if.false.4981:
br label %.if.end.4981
.if.end.4981:
%.tmp4988 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp4988
br label %.if.end.4979
.if.false.4979:
br label %.if.end.4979
.if.end.4979:
%.tmp4989 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp4991 = getelementptr [8 x i8], [8 x i8]*@.str4990, i32 0, i32 0
%.tmp4992 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp4989, i8* %.tmp4991)
%args.4993 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp4992, %m980$.Node.type** %args.4993
%.tmp4995 = getelementptr [1 x i8], [1 x i8]*@.str4994, i32 0, i32 0
%params_buff.4996 = alloca i8*
store i8* %.tmp4995, i8** %params_buff.4996
%.tmp4998 = getelementptr [1 x i8], [1 x i8]*@.str4997, i32 0, i32 0
%tmp.4999 = alloca i8*
store i8* %.tmp4998, i8** %tmp.4999
%.tmp5000 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5001 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5000, i32 0, i32 4
%.tmp5002 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5001
%.tmp5003 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5002, i32 0, i32 0
%.tmp5004 = load i8*, i8** %.tmp5003
%.tmp5006 = getelementptr [4 x i8], [4 x i8]*@.str5005, i32 0, i32 0
%.tmp5007 = call i32(i8*,i8*) @strcmp(i8* %.tmp5004, i8* %.tmp5006)
%.tmp5008 = icmp eq i32 %.tmp5007, 0
br i1 %.tmp5008, label %.if.true.5009, label %.if.false.5009
.if.true.5009:
%.tmp5010 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5011 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5010)
%new_info.5012 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp5011, %m2693$.AssignableInfo.type** %new_info.5012
%.tmp5013 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5014 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_info.5012
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp5013, %m2693$.AssignableInfo.type* %.tmp5014)
%.tmp5015 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_info.5012
%.tmp5016 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5015, i32 0, i32 4
%.tmp5017 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5018 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5017, i32 0, i32 4
%.tmp5019 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5018
%.tmp5020 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5019, i32 0, i32 3
%.tmp5021 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5020
store %m2693$.Type.type* %.tmp5021, %m2693$.Type.type** %.tmp5016
%.tmp5022 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5023 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp5022, i32 0, i32 1
%.tmp5024 = load %m0$.File.type*, %m0$.File.type** %.tmp5023
%.tmp5026 = getelementptr [22 x i8], [22 x i8]*@.str5025, i32 0, i32 0
%.tmp5027 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_info.5012
%.tmp5028 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp5027)
%.tmp5029 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5030 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5031 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5030, i32 0, i32 4
%.tmp5032 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5031
%.tmp5033 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5029, %m2693$.Type.type* %.tmp5032)
%.tmp5034 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5035 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5036 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5035, i32 0, i32 4
%.tmp5037 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5036
%.tmp5038 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5034, %m2693$.Type.type* %.tmp5037)
%.tmp5039 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5040 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp5039)
%.tmp5041 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5024, i8* %.tmp5026, i8* %.tmp5028, i8* %.tmp5033, i8* %.tmp5038, i8* %.tmp5040)
%.tmp5042 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_info.5012
store %m2693$.AssignableInfo.type* %.tmp5042, %m2693$.AssignableInfo.type** %info.4969
br label %.if.end.5009
.if.false.5009:
br label %.if.end.5009
.if.end.5009:
%.tmp5043 = load %m980$.Node.type*, %m980$.Node.type** %args.4993
%.tmp5044 = icmp ne %m980$.Node.type* %.tmp5043, null
br i1 %.tmp5044, label %.if.true.5045, label %.if.false.5045
.if.true.5045:
%.tmp5046 = load %m980$.Node.type*, %m980$.Node.type** %args.4993
%.tmp5047 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5046, i32 0, i32 6
%.tmp5048 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5047
%.tmp5050 = getelementptr [11 x i8], [11 x i8]*@.str5049, i32 0, i32 0
%.tmp5051 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5048, i8* %.tmp5050)
%start.5052 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp5051, %m980$.Node.type** %start.5052
%argno.5053 = alloca i32
store i32 1, i32* %argno.5053
%.tmp5054 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5055 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5054, i32 0, i32 4
%.tmp5056 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5055
%.tmp5057 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5056, i32 0, i32 3
%.tmp5058 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5057
%.tmp5059 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5058, i32 0, i32 4
%.tmp5060 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5059
%expect_type.5061 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp5060, %m2693$.Type.type** %expect_type.5061
%provided_args.5062 = alloca i32
store i32 0, i32* %provided_args.5062
%.tmp5064 = load %m980$.Node.type*, %m980$.Node.type** %start.5052
%pp.5065 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp5064, %m980$.Node.type** %pp.5065
br label %.for.start.5063
.for.start.5063:
%.tmp5066 = load %m980$.Node.type*, %m980$.Node.type** %pp.5065
%.tmp5067 = icmp ne %m980$.Node.type* %.tmp5066, null
br i1 %.tmp5067, label %.for.continue.5063, label %.for.end.5063
.for.continue.5063:
%.tmp5068 = load i32, i32* %provided_args.5062
%.tmp5069 = add i32 %.tmp5068, 1
store i32 %.tmp5069, i32* %provided_args.5062
%.tmp5070 = load %m980$.Node.type*, %m980$.Node.type** %pp.5065
%.tmp5071 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5070, i32 0, i32 7
%.tmp5072 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5071
%.tmp5074 = getelementptr [11 x i8], [11 x i8]*@.str5073, i32 0, i32 0
%.tmp5075 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5072, i8* %.tmp5074)
store %m980$.Node.type* %.tmp5075, %m980$.Node.type** %pp.5065
br label %.for.start.5063
.for.end.5063:
%.tmp5077 = load %m980$.Node.type*, %m980$.Node.type** %start.5052
%pp.5078 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp5077, %m980$.Node.type** %pp.5078
br label %.for.start.5076
.for.start.5076:
%.tmp5079 = load %m980$.Node.type*, %m980$.Node.type** %pp.5078
%.tmp5080 = icmp ne %m980$.Node.type* %.tmp5079, null
br i1 %.tmp5080, label %.for.continue.5076, label %.for.end.5076
.for.continue.5076:
%.tmp5081 = load %m2693$.Type.type*, %m2693$.Type.type** %expect_type.5061
%.tmp5082 = icmp eq %m2693$.Type.type* %.tmp5081, null
br i1 %.tmp5082, label %.if.true.5083, label %.if.false.5083
.if.true.5083:
%.tmp5084 = getelementptr i8*, i8** %tmp.4999, i32 0
%.tmp5086 = getelementptr [43 x i8], [43 x i8]*@.str5085, i32 0, i32 0
%.tmp5087 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5088 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5087, i32 0, i32 2
%.tmp5089 = load i8*, i8** %.tmp5088
%.tmp5090 = load i32, i32* %argno.5053
%.tmp5091 = sub i32 %.tmp5090, 1
%.tmp5092 = load i32, i32* %provided_args.5062
%.tmp5093 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5084, i8* %.tmp5086, i8* %.tmp5089, i32 %.tmp5091, i32 %.tmp5092)
%.tmp5094 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5095 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5096 = load i8*, i8** %tmp.4999
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp5094, %m980$.Node.type* %.tmp5095, i8* %.tmp5096)
%.tmp5097 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp5097
br label %.if.end.5083
.if.false.5083:
br label %.if.end.5083
.if.end.5083:
%.tmp5098 = load %m980$.Node.type*, %m980$.Node.type** %pp.5078
%.tmp5099 = load %m980$.Node.type*, %m980$.Node.type** %start.5052
%.tmp5100 = icmp ne %m980$.Node.type* %.tmp5098, %.tmp5099
br i1 %.tmp5100, label %.if.true.5101, label %.if.false.5101
.if.true.5101:
%.tmp5102 = getelementptr i8*, i8** %tmp.4999, i32 0
%.tmp5104 = getelementptr [5 x i8], [5 x i8]*@.str5103, i32 0, i32 0
%.tmp5105 = load i8*, i8** %params_buff.4996
%.tmp5106 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5102, i8* %.tmp5104, i8* %.tmp5105)
%.tmp5107 = load i8*, i8** %params_buff.4996
%tmp_buff.5108 = alloca i8*
store i8* %.tmp5107, i8** %tmp_buff.5108
%.tmp5109 = load i8*, i8** %tmp.4999
store i8* %.tmp5109, i8** %params_buff.4996
%.tmp5110 = load i8*, i8** %tmp_buff.5108
store i8* %.tmp5110, i8** %tmp.4999
%.tmp5111 = load i8*, i8** %tmp.4999
call void(i8*) @free(i8* %.tmp5111)
br label %.if.end.5101
.if.false.5101:
br label %.if.end.5101
.if.end.5101:
%.tmp5112 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5113 = load %m980$.Node.type*, %m980$.Node.type** %pp.5078
%.tmp5114 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp5112, %m980$.Node.type* %.tmp5113)
%a_info.5115 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp5114, %m2693$.AssignableInfo.type** %a_info.5115
%.tmp5116 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.5115
%.tmp5117 = icmp eq %m2693$.AssignableInfo.type* %.tmp5116, null
br i1 %.tmp5117, label %.if.true.5118, label %.if.false.5118
.if.true.5118:
%.tmp5119 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp5119
br label %.if.end.5118
.if.false.5118:
br label %.if.end.5118
.if.end.5118:
%.tmp5120 = load %m2693$.Type.type*, %m2693$.Type.type** %expect_type.5061
%.tmp5121 = call %m2693$.Type.type*(%m2693$.Type.type*) @m295$type_clone.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.tmp5120)
%exp.5122 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp5121, %m2693$.Type.type** %exp.5122
%.tmp5123 = load %m2693$.Type.type*, %m2693$.Type.type** %exp.5122
%.tmp5124 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5123, i32 0, i32 4
store %m2693$.Type.type* null, %m2693$.Type.type** %.tmp5124
%.tmp5125 = load %m2693$.Type.type*, %m2693$.Type.type** %expect_type.5061
%.tmp5126 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5125, i32 0, i32 0
%.tmp5127 = load i8*, i8** %.tmp5126
%.tmp5129 = getelementptr [7 x i8], [7 x i8]*@.str5128, i32 0, i32 0
%.tmp5130 = call i32(i8*,i8*) @strcmp(i8* %.tmp5127, i8* %.tmp5129)
%.tmp5131 = icmp ne i32 %.tmp5130, 0
%.tmp5132 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5133 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.5115
%.tmp5134 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5133, i32 0, i32 4
%.tmp5135 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5134
%.tmp5136 = load %m2693$.Type.type*, %m2693$.Type.type** %exp.5122
%.tmp5137 = call i1(%m2693$.CompilerCtx.type*,%m2693$.Type.type*,%m2693$.Type.type*) @m2694$cmp.b.m2693$.CompilerCtx.typep.m2693$.Type.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5132, %m2693$.Type.type* %.tmp5135, %m2693$.Type.type* %.tmp5136)
%.tmp5138 = icmp eq i1 %.tmp5137, 0
%.tmp5139 = and i1 %.tmp5131, %.tmp5138
br i1 %.tmp5139, label %.if.true.5140, label %.if.false.5140
.if.true.5140:
%.tmp5142 = getelementptr [1 x i8], [1 x i8]*@.str5141, i32 0, i32 0
%err_buf.5143 = alloca i8*
store i8* %.tmp5142, i8** %err_buf.5143
%.tmp5144 = getelementptr i8*, i8** %err_buf.5143, i32 0
%.tmp5146 = getelementptr [58 x i8], [58 x i8]*@.str5145, i32 0, i32 0
%.tmp5147 = load i32, i32* %argno.5053
%.tmp5148 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5149 = load %m2693$.Type.type*, %m2693$.Type.type** %exp.5122
%.tmp5150 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5148, %m2693$.Type.type* %.tmp5149)
%.tmp5151 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5152 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.5115
%.tmp5153 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5152, i32 0, i32 4
%.tmp5154 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5153
%.tmp5155 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5151, %m2693$.Type.type* %.tmp5154)
%.tmp5156 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5144, i8* %.tmp5146, i32 %.tmp5147, i8* %.tmp5150, i8* %.tmp5155)
%.tmp5157 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5158 = load %m980$.Node.type*, %m980$.Node.type** %pp.5078
%.tmp5159 = load i8*, i8** %err_buf.5143
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp5157, %m980$.Node.type* %.tmp5158, i8* %.tmp5159)
%.tmp5160 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp5160
br label %.if.end.5140
.if.false.5140:
br label %.if.end.5140
.if.end.5140:
%.tmp5161 = getelementptr i8*, i8** %params_buff.4996, i32 0
%.tmp5163 = getelementptr [8 x i8], [8 x i8]*@.str5162, i32 0, i32 0
%.tmp5164 = load i8*, i8** %params_buff.4996
%.tmp5165 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5166 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.5115
%.tmp5167 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5166, i32 0, i32 4
%.tmp5168 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5167
%.tmp5169 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5165, %m2693$.Type.type* %.tmp5168)
%.tmp5170 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.5115
%.tmp5171 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp5170)
%.tmp5172 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5161, i8* %.tmp5163, i8* %.tmp5164, i8* %.tmp5169, i8* %.tmp5171)
%.tmp5173 = load %m980$.Node.type*, %m980$.Node.type** %pp.5078
%.tmp5174 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5173, i32 0, i32 7
%.tmp5175 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5174
store %m980$.Node.type* %.tmp5175, %m980$.Node.type** %pp.5078
%.tmp5176 = load %m2693$.Type.type*, %m2693$.Type.type** %expect_type.5061
%.tmp5177 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5176, i32 0, i32 0
%.tmp5178 = load i8*, i8** %.tmp5177
%.tmp5180 = getelementptr [7 x i8], [7 x i8]*@.str5179, i32 0, i32 0
%.tmp5181 = call i32(i8*,i8*) @strcmp(i8* %.tmp5178, i8* %.tmp5180)
%.tmp5182 = icmp ne i32 %.tmp5181, 0
br i1 %.tmp5182, label %.if.true.5183, label %.if.false.5183
.if.true.5183:
%.tmp5184 = load %m2693$.Type.type*, %m2693$.Type.type** %expect_type.5061
%.tmp5185 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5184, i32 0, i32 4
%.tmp5186 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5185
store %m2693$.Type.type* %.tmp5186, %m2693$.Type.type** %expect_type.5061
br label %.if.end.5183
.if.false.5183:
br label %.if.end.5183
.if.end.5183:
%.tmp5187 = load i32, i32* %argno.5053
%.tmp5188 = add i32 %.tmp5187, 1
store i32 %.tmp5188, i32* %argno.5053
%.tmp5189 = load %m980$.Node.type*, %m980$.Node.type** %pp.5078
%.tmp5191 = getelementptr [11 x i8], [11 x i8]*@.str5190, i32 0, i32 0
%.tmp5192 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5189, i8* %.tmp5191)
store %m980$.Node.type* %.tmp5192, %m980$.Node.type** %pp.5078
br label %.for.start.5076
.for.end.5076:
%.tmp5193 = load %m2693$.Type.type*, %m2693$.Type.type** %expect_type.5061
%.tmp5194 = icmp ne %m2693$.Type.type* %.tmp5193, null
br i1 %.tmp5194, label %.if.true.5195, label %.if.false.5195
.if.true.5195:
%.tmp5196 = load %m2693$.Type.type*, %m2693$.Type.type** %expect_type.5061
%.tmp5197 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5196, i32 0, i32 0
%.tmp5198 = load i8*, i8** %.tmp5197
%.tmp5200 = getelementptr [7 x i8], [7 x i8]*@.str5199, i32 0, i32 0
%.tmp5201 = call i32(i8*,i8*) @strcmp(i8* %.tmp5198, i8* %.tmp5200)
%.tmp5202 = icmp ne i32 %.tmp5201, 0
br i1 %.tmp5202, label %.if.true.5203, label %.if.false.5203
.if.true.5203:
%.tmp5204 = getelementptr i8*, i8** %tmp.4999, i32 0
%.tmp5206 = getelementptr [43 x i8], [43 x i8]*@.str5205, i32 0, i32 0
%.tmp5207 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5208 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5207, i32 0, i32 2
%.tmp5209 = load i8*, i8** %.tmp5208
%.tmp5210 = load i32, i32* %argno.5053
%.tmp5211 = load i32, i32* %provided_args.5062
%.tmp5212 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5204, i8* %.tmp5206, i8* %.tmp5209, i32 %.tmp5210, i32 %.tmp5211)
%.tmp5213 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5214 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5215 = load i8*, i8** %tmp.4999
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp5213, %m980$.Node.type* %.tmp5214, i8* %.tmp5215)
%.tmp5216 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp5216
br label %.if.end.5203
.if.false.5203:
br label %.if.end.5203
.if.end.5203:
br label %.if.end.5195
.if.false.5195:
br label %.if.end.5195
.if.end.5195:
br label %.if.end.5045
.if.false.5045:
%.tmp5217 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5218 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5217, i32 0, i32 4
%.tmp5219 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5218
%.tmp5220 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5219, i32 0, i32 3
%.tmp5221 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5220
%.tmp5222 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5221, i32 0, i32 4
%.tmp5223 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5222
%.tmp5224 = icmp ne %m2693$.Type.type* %.tmp5223, null
br i1 %.tmp5224, label %.if.true.5225, label %.if.false.5225
.if.true.5225:
%args_required.5226 = alloca i32
store i32 0, i32* %args_required.5226
%.tmp5228 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5229 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5228, i32 0, i32 4
%.tmp5230 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5229
%.tmp5231 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5230, i32 0, i32 3
%.tmp5232 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5231
%.tmp5233 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5232, i32 0, i32 4
%.tmp5234 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5233
%pp.5235 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp5234, %m2693$.Type.type** %pp.5235
br label %.for.start.5227
.for.start.5227:
%.tmp5236 = load %m2693$.Type.type*, %m2693$.Type.type** %pp.5235
%.tmp5237 = icmp ne %m2693$.Type.type* %.tmp5236, null
br i1 %.tmp5237, label %.for.continue.5227, label %.for.else.5227
.for.continue.5227:
%.tmp5238 = load %m2693$.Type.type*, %m2693$.Type.type** %pp.5235
%.tmp5239 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5238, i32 0, i32 0
%.tmp5240 = load i8*, i8** %.tmp5239
%.tmp5242 = getelementptr [7 x i8], [7 x i8]*@.str5241, i32 0, i32 0
%.tmp5243 = call i32(i8*,i8*) @strcmp(i8* %.tmp5240, i8* %.tmp5242)
%.tmp5244 = icmp eq i32 %.tmp5243, 0
br i1 %.tmp5244, label %.if.true.5245, label %.if.false.5245
.if.true.5245:
br label %.for.end.5227
br label %.if.end.5245
.if.false.5245:
br label %.if.end.5245
.if.end.5245:
%.tmp5246 = load i32, i32* %args_required.5226
%.tmp5247 = add i32 %.tmp5246, 1
store i32 %.tmp5247, i32* %args_required.5226
%.tmp5248 = load %m2693$.Type.type*, %m2693$.Type.type** %pp.5235
%.tmp5249 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5248, i32 0, i32 4
%.tmp5250 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5249
store %m2693$.Type.type* %.tmp5250, %m2693$.Type.type** %pp.5235
br label %.for.start.5227
.for.else.5227:
%.tmp5251 = getelementptr i8*, i8** %tmp.4999, i32 0
%.tmp5253 = getelementptr [42 x i8], [42 x i8]*@.str5252, i32 0, i32 0
%.tmp5254 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5255 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5254, i32 0, i32 2
%.tmp5256 = load i8*, i8** %.tmp5255
%.tmp5257 = load i32, i32* %args_required.5226
%.tmp5258 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5251, i8* %.tmp5253, i8* %.tmp5256, i32 %.tmp5257)
%.tmp5259 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5260 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5261 = load i8*, i8** %tmp.4999
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp5259, %m980$.Node.type* %.tmp5260, i8* %.tmp5261)
%.tmp5262 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp5262
br label %.for.end.5227
.for.end.5227:
br label %.if.end.5225
.if.false.5225:
br label %.if.end.5225
.if.end.5225:
br label %.if.end.5045
.if.end.5045:
%.tmp5263 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5264 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5265 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5264, i32 0, i32 4
%.tmp5266 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5265
%.tmp5267 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5266, i32 0, i32 3
%.tmp5268 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5267
%.tmp5269 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5263, %m2693$.Type.type* %.tmp5268)
%.tmp5271 = getelementptr [5 x i8], [5 x i8]*@.str5270, i32 0, i32 0
%.tmp5272 = call i32(i8*,i8*) @strcmp(i8* %.tmp5269, i8* %.tmp5271)
%.tmp5273 = icmp eq i32 %.tmp5272, 0
br i1 %.tmp5273, label %.if.true.5274, label %.if.false.5274
.if.true.5274:
%.tmp5275 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5276 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp5275, i32 0, i32 1
%.tmp5277 = load %m0$.File.type*, %m0$.File.type** %.tmp5276
%.tmp5279 = getelementptr [16 x i8], [16 x i8]*@.str5278, i32 0, i32 0
%.tmp5280 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5281 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5282 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5281, i32 0, i32 4
%.tmp5283 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5282
%.tmp5284 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5280, %m2693$.Type.type* %.tmp5283)
%.tmp5285 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5286 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp5285)
%.tmp5287 = load i8*, i8** %params_buff.4996
%.tmp5288 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5277, i8* %.tmp5279, i8* %.tmp5284, i8* %.tmp5286, i8* %.tmp5287)
%.tmp5289 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp5289
br label %.if.end.5274
.if.false.5274:
br label %.if.end.5274
.if.end.5274:
%.tmp5290 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5291 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5290)
%call_info.5292 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp5291, %m2693$.AssignableInfo.type** %call_info.5292
%.tmp5293 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5294 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %call_info.5292
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp5293, %m2693$.AssignableInfo.type* %.tmp5294)
%.tmp5295 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %call_info.5292
%.tmp5296 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5295, i32 0, i32 4
%.tmp5297 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5298 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5297, i32 0, i32 4
%.tmp5299 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5298
%.tmp5300 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5299, i32 0, i32 3
%.tmp5301 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5300
%.tmp5302 = call %m2693$.Type.type*(%m2693$.Type.type*) @m295$type_clone.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.tmp5301)
store %m2693$.Type.type* %.tmp5302, %m2693$.Type.type** %.tmp5296
%.tmp5303 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %call_info.5292
%.tmp5304 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5303, i32 0, i32 4
%.tmp5305 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5304
%.tmp5306 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5305, i32 0, i32 4
store %m2693$.Type.type* null, %m2693$.Type.type** %.tmp5306
%.tmp5307 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5308 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp5307, i32 0, i32 1
%.tmp5309 = load %m0$.File.type*, %m0$.File.type** %.tmp5308
%.tmp5311 = getelementptr [21 x i8], [21 x i8]*@.str5310, i32 0, i32 0
%.tmp5312 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %call_info.5292
%.tmp5313 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp5312)
%.tmp5314 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5315 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5316 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5315, i32 0, i32 4
%.tmp5317 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5316
%.tmp5318 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5314, %m2693$.Type.type* %.tmp5317)
%.tmp5319 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.4969
%.tmp5320 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp5319)
%.tmp5321 = load i8*, i8** %params_buff.4996
%.tmp5322 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5309, i8* %.tmp5311, i8* %.tmp5313, i8* %.tmp5318, i8* %.tmp5320, i8* %.tmp5321)
%.tmp5323 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %call_info.5292
%.tmp5324 = bitcast %m2693$.AssignableInfo.type* %.tmp5323 to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp5324
}
define void @m295$compile_expression.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp5326 = getelementptr [1 x i8], [1 x i8]*@.str5325, i32 0, i32 0
%err_msg.5327 = alloca i8*
store i8* %.tmp5326, i8** %err_msg.5327
%.tmp5328 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5329 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5328, i32 0, i32 0
%.tmp5330 = load i8*, i8** %.tmp5329
%expr_type.5331 = alloca i8*
store i8* %.tmp5330, i8** %expr_type.5331
%.tmp5332 = bitcast ptr null to %m2693$.AssignableInfo.type*
%info.5333 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp5332, %m2693$.AssignableInfo.type** %info.5333
%assignable.5334 = alloca %m980$.Node.type*
store %m980$.Node.type* null, %m980$.Node.type** %assignable.5334
%.tmp5335 = bitcast ptr null to %m2693$.AssignableInfo.type*
%a_info.5336 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp5335, %m2693$.AssignableInfo.type** %a_info.5336
%.tmp5337 = load i8*, i8** %expr_type.5331
%.tmp5339 = getelementptr [7 x i8], [7 x i8]*@.str5338, i32 0, i32 0
%.tmp5340 = call i32(i8*,i8*) @strcmp(i8* %.tmp5337, i8* %.tmp5339)
%.tmp5341 = icmp eq i32 %.tmp5340, 0
br i1 %.tmp5341, label %.if.true.5342, label %.if.false.5342
.if.true.5342:
%.tmp5343 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5345 = getelementptr [9 x i8], [9 x i8]*@.str5344, i32 0, i32 0
%.tmp5346 = call %m2693$.Scope.type*(%m2693$.CompilerCtx.type*,i8*) @m295$get_scope.m2693$.Scope.typep.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.tmp5343, i8* %.tmp5345)
%fn_scope.5347 = alloca %m2693$.Scope.type*
store %m2693$.Scope.type* %.tmp5346, %m2693$.Scope.type** %fn_scope.5347
%.tmp5348 = load %m2693$.Scope.type*, %m2693$.Scope.type** %fn_scope.5347
%.tmp5349 = icmp eq %m2693$.Scope.type* %.tmp5348, null
br i1 %.tmp5349, label %.if.true.5350, label %.if.false.5350
.if.true.5350:
%.tmp5351 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5352 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5354 = getelementptr [40 x i8], [40 x i8]*@.str5353, i32 0, i32 0
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp5351, %m980$.Node.type* %.tmp5352, i8* %.tmp5354)
ret void
br label %.if.end.5350
.if.false.5350:
br label %.if.end.5350
.if.end.5350:
%.tmp5355 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5356 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5355, i32 0, i32 6
%.tmp5357 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5356
%.tmp5358 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5357, i32 0, i32 7
%.tmp5359 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5358
%.tmp5360 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5359, i32 0, i32 0
%.tmp5361 = load i8*, i8** %.tmp5360
%.tmp5363 = getelementptr [3 x i8], [3 x i8]*@.str5362, i32 0, i32 0
%.tmp5364 = call i32(i8*,i8*) @strcmp(i8* %.tmp5361, i8* %.tmp5363)
%.tmp5365 = icmp ne i32 %.tmp5364, 0
br i1 %.tmp5365, label %.if.true.5366, label %.if.false.5366
.if.true.5366:
%.tmp5367 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5368 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5369 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5368, i32 0, i32 6
%.tmp5370 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5369
%.tmp5371 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5370, i32 0, i32 7
%.tmp5372 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5371
%.tmp5373 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp5367, %m980$.Node.type* %.tmp5372)
store %m2693$.AssignableInfo.type* %.tmp5373, %m2693$.AssignableInfo.type** %info.5333
%.tmp5374 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.5333
%.tmp5375 = icmp eq %m2693$.AssignableInfo.type* %.tmp5374, null
br i1 %.tmp5375, label %.if.true.5376, label %.if.false.5376
.if.true.5376:
ret void
br label %.if.end.5376
.if.false.5376:
br label %.if.end.5376
.if.end.5376:
%.tmp5377 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5378 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.5333
%.tmp5379 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5378, i32 0, i32 4
%.tmp5380 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5379
%.tmp5381 = load %m2693$.Scope.type*, %m2693$.Scope.type** %fn_scope.5347
%.tmp5382 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp5381, i32 0, i32 6
%.tmp5383 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5382
%.tmp5384 = call i1(%m2693$.CompilerCtx.type*,%m2693$.Type.type*,%m2693$.Type.type*) @m2694$cmp.b.m2693$.CompilerCtx.typep.m2693$.Type.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5377, %m2693$.Type.type* %.tmp5380, %m2693$.Type.type* %.tmp5383)
%.tmp5385 = icmp eq i1 %.tmp5384, 0
br i1 %.tmp5385, label %.if.true.5386, label %.if.false.5386
.if.true.5386:
%.tmp5388 = getelementptr [1 x i8], [1 x i8]*@.str5387, i32 0, i32 0
%buf.5389 = alloca i8*
store i8* %.tmp5388, i8** %buf.5389
%.tmp5390 = getelementptr i8*, i8** %buf.5389, i32 0
%.tmp5392 = getelementptr [67 x i8], [67 x i8]*@.str5391, i32 0, i32 0
%.tmp5393 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5394 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.5333
%.tmp5395 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5394, i32 0, i32 4
%.tmp5396 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5395
%.tmp5397 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5393, %m2693$.Type.type* %.tmp5396)
%.tmp5398 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5399 = load %m2693$.Scope.type*, %m2693$.Scope.type** %fn_scope.5347
%.tmp5400 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp5399, i32 0, i32 6
%.tmp5401 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5400
%.tmp5402 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5398, %m2693$.Type.type* %.tmp5401)
%.tmp5403 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5390, i8* %.tmp5392, i8* %.tmp5397, i8* %.tmp5402)
%.tmp5404 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5405 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5406 = load i8*, i8** %buf.5389
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp5404, %m980$.Node.type* %.tmp5405, i8* %.tmp5406)
ret void
br label %.if.end.5386
.if.false.5386:
br label %.if.end.5386
.if.end.5386:
%.tmp5407 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5408 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp5407, i32 0, i32 1
%.tmp5409 = load %m0$.File.type*, %m0$.File.type** %.tmp5408
%.tmp5411 = getelementptr [11 x i8], [11 x i8]*@.str5410, i32 0, i32 0
%.tmp5412 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5413 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.5333
%.tmp5414 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5413, i32 0, i32 4
%.tmp5415 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5414
%.tmp5416 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5412, %m2693$.Type.type* %.tmp5415)
%.tmp5417 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.5333
%.tmp5418 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp5417)
%.tmp5419 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5409, i8* %.tmp5411, i8* %.tmp5416, i8* %.tmp5418)
br label %.if.end.5366
.if.false.5366:
%.tmp5420 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5421 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp5420, i32 0, i32 1
%.tmp5422 = load %m0$.File.type*, %m0$.File.type** %.tmp5421
%.tmp5424 = getelementptr [10 x i8], [10 x i8]*@.str5423, i32 0, i32 0
%.tmp5425 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5422, i8* %.tmp5424)
br label %.if.end.5366
.if.end.5366:
br label %.if.end.5342
.if.false.5342:
%.tmp5426 = load i8*, i8** %expr_type.5331
%.tmp5428 = getelementptr [3 x i8], [3 x i8]*@.str5427, i32 0, i32 0
%.tmp5429 = call i32(i8*,i8*) @strcmp(i8* %.tmp5426, i8* %.tmp5428)
%.tmp5430 = icmp eq i32 %.tmp5429, 0
br i1 %.tmp5430, label %.if.true.5431, label %.if.false.5431
.if.true.5431:
br label %.if.end.5431
.if.false.5431:
%.tmp5432 = load i8*, i8** %expr_type.5331
%.tmp5434 = getelementptr [8 x i8], [8 x i8]*@.str5433, i32 0, i32 0
%.tmp5435 = call i32(i8*,i8*) @strcmp(i8* %.tmp5432, i8* %.tmp5434)
%.tmp5436 = icmp eq i32 %.tmp5435, 0
br i1 %.tmp5436, label %.if.true.5437, label %.if.false.5437
.if.true.5437:
%.tmp5438 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5439 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5440 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5439, i32 0, i32 6
%.tmp5441 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5440
%.tmp5442 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_fn_call.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp5438, %m980$.Node.type* %.tmp5441)
br label %.if.end.5437
.if.false.5437:
%.tmp5443 = load i8*, i8** %expr_type.5331
%.tmp5445 = getelementptr [12 x i8], [12 x i8]*@.str5444, i32 0, i32 0
%.tmp5446 = call i32(i8*,i8*) @strcmp(i8* %.tmp5443, i8* %.tmp5445)
%.tmp5447 = icmp eq i32 %.tmp5446, 0
br i1 %.tmp5447, label %.if.true.5448, label %.if.false.5448
.if.true.5448:
%.tmp5449 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5450 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5451 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_declaration.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp5449, %m980$.Node.type* %.tmp5450)
br label %.if.end.5448
.if.false.5448:
%.tmp5452 = load i8*, i8** %expr_type.5331
%.tmp5454 = getelementptr [11 x i8], [11 x i8]*@.str5453, i32 0, i32 0
%.tmp5455 = call i32(i8*,i8*) @strcmp(i8* %.tmp5452, i8* %.tmp5454)
%.tmp5456 = icmp eq i32 %.tmp5455, 0
br i1 %.tmp5456, label %.if.true.5457, label %.if.false.5457
.if.true.5457:
%.tmp5458 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5459 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5458, i32 0, i32 6
%.tmp5460 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5459
%.tmp5462 = getelementptr [11 x i8], [11 x i8]*@.str5461, i32 0, i32 0
%.tmp5463 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5460, i8* %.tmp5462)
store %m980$.Node.type* %.tmp5463, %m980$.Node.type** %assignable.5334
%.tmp5464 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5465 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5466 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5465, i32 0, i32 6
%.tmp5467 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5466
%.tmp5468 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp5464, %m980$.Node.type* %.tmp5467)
%dest.5469 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp5468, %m2693$.AssignableInfo.type** %dest.5469
%.tmp5470 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %dest.5469
%.tmp5471 = icmp eq %m2693$.AssignableInfo.type* %.tmp5470, null
br i1 %.tmp5471, label %.if.true.5472, label %.if.false.5472
.if.true.5472:
ret void
br label %.if.end.5472
.if.false.5472:
br label %.if.end.5472
.if.end.5472:
%.tmp5473 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5474 = load %m980$.Node.type*, %m980$.Node.type** %assignable.5334
%.tmp5475 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp5473, %m980$.Node.type* %.tmp5474)
store %m2693$.AssignableInfo.type* %.tmp5475, %m2693$.AssignableInfo.type** %a_info.5336
%.tmp5476 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.5336
%.tmp5477 = icmp eq %m2693$.AssignableInfo.type* %.tmp5476, null
br i1 %.tmp5477, label %.if.true.5478, label %.if.false.5478
.if.true.5478:
ret void
br label %.if.end.5478
.if.false.5478:
br label %.if.end.5478
.if.end.5478:
%.tmp5479 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5480 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.5336
%.tmp5481 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5480, i32 0, i32 4
%.tmp5482 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5481
%.tmp5483 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %dest.5469
%.tmp5484 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5483, i32 0, i32 4
%.tmp5485 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5484
%.tmp5486 = call i1(%m2693$.CompilerCtx.type*,%m2693$.Type.type*,%m2693$.Type.type*) @m2694$cmp.b.m2693$.CompilerCtx.typep.m2693$.Type.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5479, %m2693$.Type.type* %.tmp5482, %m2693$.Type.type* %.tmp5485)
%.tmp5487 = icmp eq i1 %.tmp5486, 0
br i1 %.tmp5487, label %.if.true.5488, label %.if.false.5488
.if.true.5488:
%.tmp5490 = getelementptr [1 x i8], [1 x i8]*@.str5489, i32 0, i32 0
%err_buf.5491 = alloca i8*
store i8* %.tmp5490, i8** %err_buf.5491
%.tmp5492 = getelementptr i8*, i8** %err_buf.5491, i32 0
%.tmp5494 = getelementptr [37 x i8], [37 x i8]*@.str5493, i32 0, i32 0
%.tmp5495 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5496 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.5336
%.tmp5497 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5496, i32 0, i32 4
%.tmp5498 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5497
%.tmp5499 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5495, %m2693$.Type.type* %.tmp5498)
%.tmp5500 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5501 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %dest.5469
%.tmp5502 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5501, i32 0, i32 4
%.tmp5503 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5502
%.tmp5504 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5500, %m2693$.Type.type* %.tmp5503)
%.tmp5505 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5492, i8* %.tmp5494, i8* %.tmp5499, i8* %.tmp5504)
%.tmp5506 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5507 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5508 = load i8*, i8** %err_buf.5491
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp5506, %m980$.Node.type* %.tmp5507, i8* %.tmp5508)
br label %.if.end.5488
.if.false.5488:
br label %.if.end.5488
.if.end.5488:
%.tmp5509 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5510 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %dest.5469
%.tmp5511 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5510, i32 0, i32 4
%.tmp5512 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5511
%.tmp5513 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5509, %m2693$.Type.type* %.tmp5512)
%dest_tr.5514 = alloca i8*
store i8* %.tmp5513, i8** %dest_tr.5514
%.tmp5515 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5516 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.5336
%.tmp5517 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5516, i32 0, i32 4
%.tmp5518 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5517
%.tmp5519 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5515, %m2693$.Type.type* %.tmp5518)
%src_tr.5520 = alloca i8*
store i8* %.tmp5519, i8** %src_tr.5520
%.tmp5521 = load i8*, i8** %src_tr.5520
%.tmp5523 = getelementptr [4 x i8], [4 x i8]*@.str5522, i32 0, i32 0
%.tmp5524 = call i32(i8*,i8*) @strcmp(i8* %.tmp5521, i8* %.tmp5523)
%.tmp5525 = icmp eq i32 %.tmp5524, 0
br i1 %.tmp5525, label %.if.true.5526, label %.if.false.5526
.if.true.5526:
%.tmp5527 = load i8*, i8** %dest_tr.5514
store i8* %.tmp5527, i8** %src_tr.5520
br label %.if.end.5526
.if.false.5526:
br label %.if.end.5526
.if.end.5526:
%.tmp5528 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5529 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp5528, i32 0, i32 1
%.tmp5530 = load %m0$.File.type*, %m0$.File.type** %.tmp5529
%.tmp5532 = getelementptr [21 x i8], [21 x i8]*@.str5531, i32 0, i32 0
%.tmp5533 = load i8*, i8** %src_tr.5520
%.tmp5534 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.5336
%.tmp5535 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp5534)
%.tmp5536 = load i8*, i8** %dest_tr.5514
%.tmp5537 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %dest.5469
%.tmp5538 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp5537)
%.tmp5539 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5530, i8* %.tmp5532, i8* %.tmp5533, i8* %.tmp5535, i8* %.tmp5536, i8* %.tmp5538)
br label %.if.end.5457
.if.false.5457:
%.tmp5540 = load i8*, i8** %expr_type.5331
%.tmp5542 = getelementptr [9 x i8], [9 x i8]*@.str5541, i32 0, i32 0
%.tmp5543 = call i32(i8*,i8*) @strcmp(i8* %.tmp5540, i8* %.tmp5542)
%.tmp5544 = icmp eq i32 %.tmp5543, 0
br i1 %.tmp5544, label %.if.true.5545, label %.if.false.5545
.if.true.5545:
%.tmp5546 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5547 = load %m980$.Node.type*, %m980$.Node.type** %stmt
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_if_block.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp5546, %m980$.Node.type* %.tmp5547)
br label %.if.end.5545
.if.false.5545:
%.tmp5548 = load i8*, i8** %expr_type.5331
%.tmp5550 = getelementptr [9 x i8], [9 x i8]*@.str5549, i32 0, i32 0
%.tmp5551 = call i32(i8*,i8*) @strcmp(i8* %.tmp5548, i8* %.tmp5550)
%.tmp5552 = icmp eq i32 %.tmp5551, 0
br i1 %.tmp5552, label %.if.true.5553, label %.if.false.5553
.if.true.5553:
%.tmp5554 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5555 = load %m980$.Node.type*, %m980$.Node.type** %stmt
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_for_loop.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp5554, %m980$.Node.type* %.tmp5555)
br label %.if.end.5553
.if.false.5553:
%.tmp5556 = load i8*, i8** %expr_type.5331
%.tmp5558 = getelementptr [8 x i8], [8 x i8]*@.str5557, i32 0, i32 0
%.tmp5559 = call i32(i8*,i8*) @strcmp(i8* %.tmp5556, i8* %.tmp5558)
%.tmp5560 = icmp eq i32 %.tmp5559, 0
br i1 %.tmp5560, label %.if.true.5561, label %.if.false.5561
.if.true.5561:
%.tmp5562 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5564 = getelementptr [4 x i8], [4 x i8]*@.str5563, i32 0, i32 0
%.tmp5565 = call %m2693$.Scope.type*(%m2693$.CompilerCtx.type*,i8*) @m295$get_scope.m2693$.Scope.typep.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.tmp5562, i8* %.tmp5564)
%for_scope.5566 = alloca %m2693$.Scope.type*
store %m2693$.Scope.type* %.tmp5565, %m2693$.Scope.type** %for_scope.5566
%.tmp5567 = load %m2693$.Scope.type*, %m2693$.Scope.type** %for_scope.5566
%.tmp5568 = icmp eq %m2693$.Scope.type* %.tmp5567, null
br i1 %.tmp5568, label %.if.true.5569, label %.if.false.5569
.if.true.5569:
%.tmp5571 = getelementptr [1 x i8], [1 x i8]*@.str5570, i32 0, i32 0
%buf.5572 = alloca i8*
store i8* %.tmp5571, i8** %buf.5572
%.tmp5573 = getelementptr i8*, i8** %buf.5572, i32 0
%.tmp5575 = getelementptr [42 x i8], [42 x i8]*@.str5574, i32 0, i32 0
%.tmp5576 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5577 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5576, i32 0, i32 6
%.tmp5578 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5577
%.tmp5579 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5578, i32 0, i32 1
%.tmp5580 = load i8*, i8** %.tmp5579
%.tmp5581 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5573, i8* %.tmp5575, i8* %.tmp5580)
%.tmp5582 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5583 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5584 = load i8*, i8** %buf.5572
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp5582, %m980$.Node.type* %.tmp5583, i8* %.tmp5584)
ret void
br label %.if.end.5569
.if.false.5569:
br label %.if.end.5569
.if.end.5569:
%.tmp5585 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5586 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5585, i32 0, i32 6
%.tmp5587 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5586
%.tmp5588 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5587, i32 0, i32 1
%.tmp5589 = load i8*, i8** %.tmp5588
%.tmp5591 = getelementptr [6 x i8], [6 x i8]*@.str5590, i32 0, i32 0
%.tmp5592 = call i32(i8*,i8*) @strcmp(i8* %.tmp5589, i8* %.tmp5591)
%.tmp5593 = icmp eq i32 %.tmp5592, 0
br i1 %.tmp5593, label %.if.true.5594, label %.if.false.5594
.if.true.5594:
%.tmp5595 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5596 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp5595, i32 0, i32 1
%.tmp5597 = load %m0$.File.type*, %m0$.File.type** %.tmp5596
%.tmp5599 = getelementptr [15 x i8], [15 x i8]*@.str5598, i32 0, i32 0
%.tmp5600 = load %m2693$.Scope.type*, %m2693$.Scope.type** %for_scope.5566
%.tmp5601 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp5600, i32 0, i32 4
%.tmp5602 = load i8*, i8** %.tmp5601
%.tmp5603 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5597, i8* %.tmp5599, i8* %.tmp5602)
br label %.if.end.5594
.if.false.5594:
%.tmp5604 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5605 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5604, i32 0, i32 6
%.tmp5606 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5605
%.tmp5607 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5606, i32 0, i32 1
%.tmp5608 = load i8*, i8** %.tmp5607
%.tmp5610 = getelementptr [9 x i8], [9 x i8]*@.str5609, i32 0, i32 0
%.tmp5611 = call i32(i8*,i8*) @strcmp(i8* %.tmp5608, i8* %.tmp5610)
%.tmp5612 = icmp eq i32 %.tmp5611, 0
br i1 %.tmp5612, label %.if.true.5613, label %.if.false.5613
.if.true.5613:
%.tmp5614 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5615 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp5614, i32 0, i32 1
%.tmp5616 = load %m0$.File.type*, %m0$.File.type** %.tmp5615
%.tmp5618 = getelementptr [15 x i8], [15 x i8]*@.str5617, i32 0, i32 0
%.tmp5619 = load %m2693$.Scope.type*, %m2693$.Scope.type** %for_scope.5566
%.tmp5620 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp5619, i32 0, i32 3
%.tmp5621 = load i8*, i8** %.tmp5620
%.tmp5622 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5616, i8* %.tmp5618, i8* %.tmp5621)
br label %.if.end.5613
.if.false.5613:
br label %.if.end.5613
.if.end.5613:
br label %.if.end.5594
.if.end.5594:
br label %.if.end.5561
.if.false.5561:
%.tmp5623 = load i8*, i8** %expr_type.5331
%.tmp5625 = getelementptr [9 x i8], [9 x i8]*@.str5624, i32 0, i32 0
%.tmp5626 = call i32(i8*,i8*) @strcmp(i8* %.tmp5623, i8* %.tmp5625)
%.tmp5627 = icmp eq i32 %.tmp5626, 0
br i1 %.tmp5627, label %.if.true.5628, label %.if.false.5628
.if.true.5628:
%.tmp5629 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5630 = load %m980$.Node.type*, %m980$.Node.type** %stmt
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_closure.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp5629, %m980$.Node.type* %.tmp5630)
br label %.if.end.5628
.if.false.5628:
%.tmp5631 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5632 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5634 = getelementptr [34 x i8], [34 x i8]*@.str5633, i32 0, i32 0
%.tmp5635 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp5631, %m980$.Node.type* %.tmp5632, i8* %.tmp5634)
%.tmp5636 = load i8*, i8** %expr_type.5331
%.tmp5637 = call i32(i8*,...) @printf(i8* %.tmp5635, i8* %.tmp5636)
br label %.if.end.5628
.if.end.5628:
br label %.if.end.5561
.if.end.5561:
br label %.if.end.5553
.if.end.5553:
br label %.if.end.5545
.if.end.5545:
br label %.if.end.5457
.if.end.5457:
br label %.if.end.5448
.if.end.5448:
br label %.if.end.5437
.if.end.5437:
br label %.if.end.5431
.if.end.5431:
br label %.if.end.5342
.if.end.5342:
ret void
}
define %m2693$.Scope.type* @m295$get_scope.m2693$.Scope.typep.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.ctx.arg, i8* %.scope_type.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%scope_type = alloca i8*
store i8* %.scope_type.arg, i8** %scope_type
%.tmp5638 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5639 = call %m2693$.ModuleLookup.type*(%m2693$.CompilerCtx.type*) @m295$get_current_module.m2693$.ModuleLookup.typep.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp5638)
%mod.5640 = alloca %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* %.tmp5639, %m2693$.ModuleLookup.type** %mod.5640
%.tmp5642 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.5640
%.tmp5643 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp5642, i32 0, i32 3
%.tmp5644 = load %m2693$.Scope.type*, %m2693$.Scope.type** %.tmp5643
%s.5645 = alloca %m2693$.Scope.type*
store %m2693$.Scope.type* %.tmp5644, %m2693$.Scope.type** %s.5645
br label %.for.start.5641
.for.start.5641:
%.tmp5646 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.5645
%.tmp5647 = icmp ne %m2693$.Scope.type* %.tmp5646, null
br i1 %.tmp5647, label %.for.continue.5641, label %.for.end.5641
.for.continue.5641:
%.tmp5648 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.5645
%.tmp5649 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp5648, i32 0, i32 2
%.tmp5650 = load i8*, i8** %.tmp5649
%.tmp5651 = load i8*, i8** %scope_type
%.tmp5652 = call i32(i8*,i8*) @strcmp(i8* %.tmp5650, i8* %.tmp5651)
%.tmp5653 = icmp eq i32 %.tmp5652, 0
br i1 %.tmp5653, label %.if.true.5654, label %.if.false.5654
.if.true.5654:
%.tmp5655 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.5645
ret %m2693$.Scope.type* %.tmp5655
br label %.if.end.5654
.if.false.5654:
br label %.if.end.5654
.if.end.5654:
%.tmp5656 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.5645
%.tmp5657 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp5656, i32 0, i32 5
%.tmp5658 = load %m2693$.Scope.type*, %m2693$.Scope.type** %.tmp5657
store %m2693$.Scope.type* %.tmp5658, %m2693$.Scope.type** %s.5645
br label %.for.start.5641
.for.end.5641:
%.tmp5659 = bitcast ptr null to %m2693$.Scope.type*
ret %m2693$.Scope.type* %.tmp5659
}
define %m2693$.Type.type* @m295$type_ptr_of_chr.m2693$.Type.typep() {
%.tmp5660 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%t.5661 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp5660, %m2693$.Type.type** %t.5661
%.tmp5662 = load %m2693$.Type.type*, %m2693$.Type.type** %t.5661
%.tmp5663 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5662, i32 0, i32 0
%.tmp5665 = getelementptr [4 x i8], [4 x i8]*@.str5664, i32 0, i32 0
store i8* %.tmp5665, i8** %.tmp5663
%.tmp5666 = load %m2693$.Type.type*, %m2693$.Type.type** %t.5661
%.tmp5667 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5666, i32 0, i32 3
%.tmp5668 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5668, %m2693$.Type.type** %.tmp5667
%.tmp5669 = load %m2693$.Type.type*, %m2693$.Type.type** %t.5661
%.tmp5670 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5669, i32 0, i32 3
%.tmp5671 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5670
%.tmp5672 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5671, i32 0, i32 0
%.tmp5674 = getelementptr [4 x i8], [4 x i8]*@.str5673, i32 0, i32 0
store i8* %.tmp5674, i8** %.tmp5672
%.tmp5675 = load %m2693$.Type.type*, %m2693$.Type.type** %t.5661
ret %m2693$.Type.type* %.tmp5675
}
define void @m295$compile_closure.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp5676 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5677 = call i32(%m2693$.CompilerCtx.type*) @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp5676)
%cj_id.5678 = alloca i32
store i32 %.tmp5677, i32* %cj_id.5678
%.tmp5679 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5680 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5679)
%info_lit.5681 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp5680, %m2693$.AssignableInfo.type** %info_lit.5681
%.tmp5682 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lit.5681
%.tmp5683 = load i8, i8* @SCOPE_GLOBAL
%.tmp5685 = getelementptr [21 x i8], [21 x i8]*@.str5684, i32 0, i32 0
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp5682, i8 %.tmp5683, i8* %.tmp5685)
%.tmp5686 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lit.5681
%.tmp5687 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5686, i32 0, i32 4
%.tmp5688 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5688, %m2693$.Type.type** %.tmp5687
%.tmp5689 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lit.5681
%.tmp5690 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5689, i32 0, i32 4
%.tmp5691 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5690
%.tmp5692 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5691, i32 0, i32 0
%.tmp5694 = getelementptr [9 x i8], [9 x i8]*@.str5693, i32 0, i32 0
store i8* %.tmp5694, i8** %.tmp5692
%.tmp5695 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lit.5681
%.tmp5696 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5695, i32 0, i32 4
%.tmp5697 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5696
%.tmp5698 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5697, i32 0, i32 3
%.tmp5699 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5699, %m2693$.Type.type** %.tmp5698
%.tmp5700 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lit.5681
%.tmp5701 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5700, i32 0, i32 4
%.tmp5702 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5701
%.tmp5703 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5702, i32 0, i32 3
%.tmp5704 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5703
%.tmp5705 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5704, i32 0, i32 0
%.tmp5707 = getelementptr [5 x i8], [5 x i8]*@.str5706, i32 0, i32 0
store i8* %.tmp5707, i8** %.tmp5705
%.tmp5708 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lit.5681
%.tmp5709 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5708, i32 0, i32 4
%.tmp5710 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5709
%.tmp5711 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5710, i32 0, i32 3
%.tmp5712 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5711
%.tmp5713 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5712, i32 0, i32 4
%.tmp5714 = call %m2693$.Type.type*() @m295$type_ptr_of_chr.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5714, %m2693$.Type.type** %.tmp5713
%.tmp5715 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lit.5681
%.tmp5716 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5715, i32 0, i32 4
%.tmp5717 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5716
%.tmp5718 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5717, i32 0, i32 3
%.tmp5719 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5718
%.tmp5720 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5719, i32 0, i32 4
%.tmp5721 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5720
%.tmp5722 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5721, i32 0, i32 4
%.tmp5723 = call %m2693$.Type.type*() @m295$type_ptr_of_chr.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5723, %m2693$.Type.type** %.tmp5722
%.tmp5724 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lit.5681
%.tmp5725 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5724, i32 0, i32 4
%.tmp5726 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5725
%.tmp5727 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5726, i32 0, i32 3
%.tmp5728 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5727
%.tmp5729 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5728, i32 0, i32 4
%.tmp5730 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5729
%.tmp5731 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5730, i32 0, i32 4
%.tmp5732 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5731
%.tmp5733 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5732, i32 0, i32 4
%.tmp5734 = call %m2693$.Type.type*() @m295$type_ptr_of_chr.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5734, %m2693$.Type.type** %.tmp5733
%.tmp5735 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5737 = getelementptr [21 x i8], [21 x i8]*@.str5736, i32 0, i32 0
%.tmp5739 = getelementptr [7 x i8], [7 x i8]*@.str5738, i32 0, i32 0
%.tmp5740 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lit.5681
call void(%m2693$.CompilerCtx.type*,i8*,i8*,%m2693$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2693$.CompilerCtx.typep.cp.cp.m2693$.AssignableInfo.typep.b.b(%m2693$.CompilerCtx.type* %.tmp5735, i8* %.tmp5737, i8* %.tmp5739, %m2693$.AssignableInfo.type* %.tmp5740, i1 1, i1 0)
%.tmp5741 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5742 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5741)
%info_lat.5743 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp5742, %m2693$.AssignableInfo.type** %info_lat.5743
%.tmp5744 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lat.5743
%.tmp5745 = load i8, i8* @SCOPE_GLOBAL
%.tmp5747 = getelementptr [23 x i8], [23 x i8]*@.str5746, i32 0, i32 0
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp5744, i8 %.tmp5745, i8* %.tmp5747)
%.tmp5748 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lat.5743
%.tmp5749 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5748, i32 0, i32 4
%.tmp5750 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5750, %m2693$.Type.type** %.tmp5749
%.tmp5751 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lat.5743
%.tmp5752 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5751, i32 0, i32 4
%.tmp5753 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5752
%.tmp5754 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5753, i32 0, i32 0
%.tmp5756 = getelementptr [9 x i8], [9 x i8]*@.str5755, i32 0, i32 0
store i8* %.tmp5756, i8** %.tmp5754
%.tmp5757 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lat.5743
%.tmp5758 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5757, i32 0, i32 4
%.tmp5759 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5758
%.tmp5760 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5759, i32 0, i32 3
%.tmp5761 = call %m2693$.Type.type*() @m295$type_ptr_of_chr.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5761, %m2693$.Type.type** %.tmp5760
%.tmp5762 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lat.5743
%.tmp5763 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5762, i32 0, i32 4
%.tmp5764 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5763
%.tmp5765 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5764, i32 0, i32 3
%.tmp5766 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5765
%.tmp5767 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5766, i32 0, i32 4
%.tmp5768 = call %m2693$.Type.type*() @m295$type_ptr_of_chr.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5768, %m2693$.Type.type** %.tmp5767
%.tmp5769 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5771 = getelementptr [23 x i8], [23 x i8]*@.str5770, i32 0, i32 0
%.tmp5773 = getelementptr [7 x i8], [7 x i8]*@.str5772, i32 0, i32 0
%.tmp5774 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_lat.5743
call void(%m2693$.CompilerCtx.type*,i8*,i8*,%m2693$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2693$.CompilerCtx.typep.cp.cp.m2693$.AssignableInfo.typep.b.b(%m2693$.CompilerCtx.type* %.tmp5769, i8* %.tmp5771, i8* %.tmp5773, %m2693$.AssignableInfo.type* %.tmp5774, i1 1, i1 0)
%.tmp5775 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5776 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5775)
%info_mmap.5777 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp5776, %m2693$.AssignableInfo.type** %info_mmap.5777
%.tmp5778 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_mmap.5777
%.tmp5779 = load i8, i8* @SCOPE_GLOBAL
%.tmp5781 = getelementptr [5 x i8], [5 x i8]*@.str5780, i32 0, i32 0
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp5778, i8 %.tmp5779, i8* %.tmp5781)
%.tmp5782 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_mmap.5777
%.tmp5783 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5782, i32 0, i32 4
%.tmp5784 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5784, %m2693$.Type.type** %.tmp5783
%.tmp5785 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_mmap.5777
%.tmp5786 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5785, i32 0, i32 4
%.tmp5787 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5786
%.tmp5788 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5787, i32 0, i32 0
%.tmp5790 = getelementptr [9 x i8], [9 x i8]*@.str5789, i32 0, i32 0
store i8* %.tmp5790, i8** %.tmp5788
%.tmp5791 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_mmap.5777
%.tmp5792 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5791, i32 0, i32 4
%.tmp5793 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5792
%.tmp5794 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5793, i32 0, i32 3
%.tmp5795 = call %m2693$.Type.type*() @m295$type_ptr_of_chr.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5795, %m2693$.Type.type** %.tmp5794
%.tmp5796 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_mmap.5777
%.tmp5797 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5796, i32 0, i32 4
%.tmp5798 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5797
%.tmp5799 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5798, i32 0, i32 3
%.tmp5800 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5799
%lt.5801 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp5800, %m2693$.Type.type** %lt.5801
%.tmp5802 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5803 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5802, i32 0, i32 4
%.tmp5804 = call %m2693$.Type.type*() @m295$type_ptr_of_chr.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5804, %m2693$.Type.type** %.tmp5803
%.tmp5805 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5806 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5805, i32 0, i32 4
%.tmp5807 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5806
store %m2693$.Type.type* %.tmp5807, %m2693$.Type.type** %lt.5801
%.tmp5808 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5809 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5808, i32 0, i32 4
%.tmp5810 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5810, %m2693$.Type.type** %.tmp5809
%.tmp5811 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5812 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5811, i32 0, i32 4
%.tmp5813 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5812
%.tmp5814 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5813, i32 0, i32 0
%.tmp5816 = getelementptr [4 x i8], [4 x i8]*@.str5815, i32 0, i32 0
store i8* %.tmp5816, i8** %.tmp5814
%.tmp5817 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5818 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5817, i32 0, i32 4
%.tmp5819 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5818
store %m2693$.Type.type* %.tmp5819, %m2693$.Type.type** %lt.5801
%.tmp5820 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5821 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5820, i32 0, i32 4
%.tmp5822 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5822, %m2693$.Type.type** %.tmp5821
%.tmp5823 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5824 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5823, i32 0, i32 4
%.tmp5825 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5824
%.tmp5826 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5825, i32 0, i32 0
%.tmp5828 = getelementptr [4 x i8], [4 x i8]*@.str5827, i32 0, i32 0
store i8* %.tmp5828, i8** %.tmp5826
%.tmp5829 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5830 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5829, i32 0, i32 4
%.tmp5831 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5830
store %m2693$.Type.type* %.tmp5831, %m2693$.Type.type** %lt.5801
%.tmp5832 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5833 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5832, i32 0, i32 4
%.tmp5834 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5834, %m2693$.Type.type** %.tmp5833
%.tmp5835 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5836 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5835, i32 0, i32 4
%.tmp5837 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5836
%.tmp5838 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5837, i32 0, i32 0
%.tmp5840 = getelementptr [4 x i8], [4 x i8]*@.str5839, i32 0, i32 0
store i8* %.tmp5840, i8** %.tmp5838
%.tmp5841 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5842 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5841, i32 0, i32 4
%.tmp5843 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5842
store %m2693$.Type.type* %.tmp5843, %m2693$.Type.type** %lt.5801
%.tmp5844 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5845 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5844, i32 0, i32 4
%.tmp5846 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5846, %m2693$.Type.type** %.tmp5845
%.tmp5847 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5848 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5847, i32 0, i32 4
%.tmp5849 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5848
%.tmp5850 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5849, i32 0, i32 0
%.tmp5852 = getelementptr [4 x i8], [4 x i8]*@.str5851, i32 0, i32 0
store i8* %.tmp5852, i8** %.tmp5850
%.tmp5853 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5854 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5853, i32 0, i32 4
%.tmp5855 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5854
store %m2693$.Type.type* %.tmp5855, %m2693$.Type.type** %lt.5801
%.tmp5856 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5857 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5856, i32 0, i32 4
%.tmp5858 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5858, %m2693$.Type.type** %.tmp5857
%.tmp5859 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5860 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5859, i32 0, i32 4
%.tmp5861 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5860
%.tmp5862 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5861, i32 0, i32 0
%.tmp5864 = getelementptr [4 x i8], [4 x i8]*@.str5863, i32 0, i32 0
store i8* %.tmp5864, i8** %.tmp5862
%.tmp5865 = load %m2693$.Type.type*, %m2693$.Type.type** %lt.5801
%.tmp5866 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5865, i32 0, i32 4
%.tmp5867 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5866
store %m2693$.Type.type* %.tmp5867, %m2693$.Type.type** %lt.5801
%.tmp5868 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5870 = getelementptr [5 x i8], [5 x i8]*@.str5869, i32 0, i32 0
%.tmp5872 = getelementptr [7 x i8], [7 x i8]*@.str5871, i32 0, i32 0
%.tmp5873 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info_mmap.5777
call void(%m2693$.CompilerCtx.type*,i8*,i8*,%m2693$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2693$.CompilerCtx.typep.cp.cp.m2693$.AssignableInfo.typep.b.b(%m2693$.CompilerCtx.type* %.tmp5868, i8* %.tmp5870, i8* %.tmp5872, %m2693$.AssignableInfo.type* %.tmp5873, i1 1, i1 0)
%.tmp5874 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5875 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5874, i32 0, i32 6
%.tmp5876 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5875
%.tmp5878 = getelementptr [5 x i8], [5 x i8]*@.str5877, i32 0, i32 0
%.tmp5879 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp5876, i8* %.tmp5878)
%fn_name_node.5880 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp5879, %m980$.Node.type** %fn_name_node.5880
%.tmp5881 = load %m980$.Node.type*, %m980$.Node.type** %fn_name_node.5880
%.tmp5882 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5881, i32 0, i32 1
%.tmp5883 = load i8*, i8** %.tmp5882
%fn_name.5884 = alloca i8*
store i8* %.tmp5883, i8** %fn_name.5884
%.tmp5885 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5886 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp5885)
%info.5887 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp5886, %m2693$.AssignableInfo.type** %info.5887
%.tmp5888 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.5887
%.tmp5889 = load i8, i8* @SCOPE_LOCAL
%.tmp5890 = load i8*, i8** %fn_name.5884
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp5888, i8 %.tmp5889, i8* %.tmp5890)
%.tmp5891 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.5887
%.tmp5892 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5891, i32 0, i32 4
%.tmp5893 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5894 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5895 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp5894, i32 0, i32 6
%.tmp5896 = load %m980$.Node.type*, %m980$.Node.type** %.tmp5895
%.tmp5897 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$syn_function_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp5893, %m980$.Node.type* %.tmp5896)
store %m2693$.Type.type* %.tmp5897, %m2693$.Type.type** %.tmp5892
%.tmp5898 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.5887
%.tmp5899 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5898, i32 0, i32 3
%.tmp5901 = getelementptr [9 x i8], [9 x i8]*@.str5900, i32 0, i32 0
store i8* %.tmp5901, i8** %.tmp5899
%.tmp5902 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5903 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp5904 = load i8*, i8** %fn_name.5884
%.tmp5905 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.5887
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2693$.AssignableInfo.type*) @m295$define_assignable.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp5902, %m980$.Node.type* %.tmp5903, i8* %.tmp5904, %m2693$.AssignableInfo.type* %.tmp5905)
%.tmp5906 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5907 = call i32(%m2693$.CompilerCtx.type*) @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp5906)
%closure_id.5908 = alloca i32
store i32 %.tmp5907, i32* %closure_id.5908
%.tmp5909 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.5887
%.tmp5910 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5909, i32 0, i32 4
%.tmp5911 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5910
%.tmp5912 = call %m2693$.Type.type*(%m2693$.Type.type*) @m295$type_clone.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.tmp5911)
%closure_type.5913 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp5912, %m2693$.Type.type** %closure_type.5913
%.tmp5914 = load %m2693$.Type.type*, %m2693$.Type.type** %closure_type.5913
%.tmp5915 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5914, i32 0, i32 3
%.tmp5916 = load %m2693$.Type.type*, %m2693$.Type.type** %closure_type.5913
%.tmp5917 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5916, i32 0, i32 3
%.tmp5918 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5917
%.tmp5919 = call %m2693$.Type.type*(%m2693$.Type.type*) @m295$type_clone.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.tmp5918)
store %m2693$.Type.type* %.tmp5919, %m2693$.Type.type** %.tmp5915
%.tmp5920 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%ctx_param.5921 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp5920, %m2693$.Type.type** %ctx_param.5921
%.tmp5922 = load %m2693$.Type.type*, %m2693$.Type.type** %ctx_param.5921
%.tmp5923 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5922, i32 0, i32 0
%.tmp5925 = getelementptr [4 x i8], [4 x i8]*@.str5924, i32 0, i32 0
store i8* %.tmp5925, i8** %.tmp5923
%.tmp5926 = load %m2693$.Type.type*, %m2693$.Type.type** %ctx_param.5921
%.tmp5927 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5926, i32 0, i32 3
%.tmp5928 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp5928, %m2693$.Type.type** %.tmp5927
%.tmp5929 = load %m2693$.Type.type*, %m2693$.Type.type** %ctx_param.5921
%.tmp5930 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5929, i32 0, i32 3
%.tmp5931 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5930
%.tmp5932 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5931, i32 0, i32 0
%.tmp5934 = getelementptr [7 x i8], [7 x i8]*@.str5933, i32 0, i32 0
store i8* %.tmp5934, i8** %.tmp5932
%.tmp5935 = load %m2693$.Type.type*, %m2693$.Type.type** %ctx_param.5921
%.tmp5936 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5935, i32 0, i32 4
%.tmp5937 = load %m2693$.Type.type*, %m2693$.Type.type** %closure_type.5913
%.tmp5938 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5937, i32 0, i32 3
%.tmp5939 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5938
%.tmp5940 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5939, i32 0, i32 4
%.tmp5941 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5940
store %m2693$.Type.type* %.tmp5941, %m2693$.Type.type** %.tmp5936
%.tmp5942 = load %m2693$.Type.type*, %m2693$.Type.type** %closure_type.5913
%.tmp5943 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5942, i32 0, i32 3
%.tmp5944 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5943
%.tmp5945 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5944, i32 0, i32 4
%.tmp5946 = load %m2693$.Type.type*, %m2693$.Type.type** %ctx_param.5921
store %m2693$.Type.type* %.tmp5946, %m2693$.Type.type** %.tmp5945
%.tmp5948 = getelementptr [1 x i8], [1 x i8]*@.str5947, i32 0, i32 0
%closure_name.5949 = alloca i8*
store i8* %.tmp5948, i8** %closure_name.5949
%.tmp5950 = getelementptr i8*, i8** %closure_name.5949, i32 0
%.tmp5952 = getelementptr [5 x i8], [5 x i8]*@.str5951, i32 0, i32 0
%.tmp5953 = load i32, i32* %closure_id.5908
%.tmp5954 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5950, i8* %.tmp5952, i32 %.tmp5953)
%.tmp5955 = load %m2693$.Type.type*, %m2693$.Type.type** %closure_type.5913
%.tmp5956 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5955, i32 0, i32 3
%.tmp5957 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5956
%.tmp5958 = call %m2693$.Type.type*(%m2693$.Type.type*) @m295$type_clone.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.tmp5957)
%ret_type.5959 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp5958, %m2693$.Type.type** %ret_type.5959
%.tmp5960 = load %m2693$.Type.type*, %m2693$.Type.type** %ret_type.5959
%.tmp5961 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp5960, i32 0, i32 3
store %m2693$.Type.type* null, %m2693$.Type.type** %.tmp5961
%.tmp5962 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5963 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp5962, i32 0, i32 1
%.tmp5964 = load %m0$.File.type*, %m0$.File.type** %.tmp5963
%.tmp5966 = getelementptr [101 x i8], [101 x i8]*@.str5965, i32 0, i32 0
%.tmp5967 = load i32, i32* %closure_id.5908
%.tmp5968 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5964, i8* %.tmp5966, i32 %.tmp5967)
%.tmp5969 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5970 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp5969, i32 0, i32 1
%.tmp5971 = load %m0$.File.type*, %m0$.File.type** %.tmp5970
%.tmp5973 = getelementptr [100 x i8], [100 x i8]*@.str5972, i32 0, i32 0
%.tmp5974 = load i32, i32* %closure_id.5908
%.tmp5975 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5976 = load %m2693$.Type.type*, %m2693$.Type.type** %closure_type.5913
%.tmp5977 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5975, %m2693$.Type.type* %.tmp5976)
%.tmp5978 = load i8*, i8** %closure_name.5949
%.tmp5979 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5971, i8* %.tmp5973, i32 %.tmp5974, i8* %.tmp5977, i8* %.tmp5978)
%.tmp5980 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5981 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp5980, i32 0, i32 1
%.tmp5982 = load %m0$.File.type*, %m0$.File.type** %.tmp5981
%.tmp5984 = getelementptr [66 x i8], [66 x i8]*@.str5983, i32 0, i32 0
%.tmp5985 = load i32, i32* %closure_id.5908
%.tmp5986 = load i32, i32* %closure_id.5908
%.tmp5987 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5982, i8* %.tmp5984, i32 %.tmp5985, i32 %.tmp5986)
%.tmp5988 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5989 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp5988, i32 0, i32 1
%.tmp5990 = load %m0$.File.type*, %m0$.File.type** %.tmp5989
%.tmp5992 = getelementptr [35 x i8], [35 x i8]*@.str5991, i32 0, i32 0
%.tmp5993 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.5887
%.tmp5994 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp5993)
%.tmp5995 = load i32, i32* %closure_id.5908
%.tmp5996 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp5997 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.5887
%.tmp5998 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp5997, i32 0, i32 4
%.tmp5999 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp5998
%.tmp6000 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp5996, %m2693$.Type.type* %.tmp5999)
%.tmp6001 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5990, i8* %.tmp5992, i8* %.tmp5994, i32 %.tmp5995, i8* %.tmp6000)
%.tmp6002 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6003 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6002, i32 0, i32 1
%.tmp6004 = load %m0$.File.type*, %m0$.File.type** %.tmp6003
%bkp_ctx.6005 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6004, %m0$.File.type** %bkp_ctx.6005
%.tmp6006 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6007 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6006, i32 0, i32 1
%.tmp6008 = call %m0$.File.type*() @tmpfile()
store %m0$.File.type* %.tmp6008, %m0$.File.type** %.tmp6007
%.tmp6009 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6010 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6009, i32 0, i32 1
%.tmp6011 = load %m0$.File.type*, %m0$.File.type** %.tmp6010
%.tmp6013 = getelementptr [14 x i8], [14 x i8]*@.str6012, i32 0, i32 0
%.tmp6014 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6015 = load %m2693$.Type.type*, %m2693$.Type.type** %ret_type.5959
%.tmp6016 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6014, %m2693$.Type.type* %.tmp6015)
%.tmp6017 = load i8*, i8** %closure_name.5949
%.tmp6018 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6011, i8* %.tmp6013, i8* %.tmp6016, i8* %.tmp6017)
%.tmp6019 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6021 = getelementptr [9 x i8], [9 x i8]*@.str6020, i32 0, i32 0
%.tmp6022 = bitcast ptr null to i8*
%.tmp6023 = bitcast ptr null to i8*
%.tmp6024 = load %m2693$.Type.type*, %m2693$.Type.type** %ret_type.5959
call void(%m2693$.CompilerCtx.type*,i8*,i8*,i8*,%m2693$.Type.type*) @m295$push_scope.v.m2693$.CompilerCtx.typep.cp.cp.cp.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6019, i8* %.tmp6021, i8* %.tmp6022, i8* %.tmp6023, %m2693$.Type.type* %.tmp6024)
%.tmp6025 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6026 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6025, i32 0, i32 1
%.tmp6027 = load %m0$.File.type*, %m0$.File.type** %.tmp6026
%.tmp6029 = getelementptr [13 x i8], [13 x i8]*@.str6028, i32 0, i32 0
%.tmp6030 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6031 = load %m2693$.Type.type*, %m2693$.Type.type** %ctx_param.5921
%.tmp6032 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6030, %m2693$.Type.type* %.tmp6031)
%.tmp6033 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6027, i8* %.tmp6029, i8* %.tmp6032)
%.tmp6034 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6035 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6034, i32 0, i32 6
%.tmp6036 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6035
%.tmp6037 = call %m980$.Node.type*(%m980$.Node.type*) @m295$syn_function_params.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.tmp6036)
%params.6038 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6037, %m980$.Node.type** %params.6038
%param_type.6039 = alloca %m2693$.Type.type*
store %m2693$.Type.type* null, %m2693$.Type.type** %param_type.6039
%.tmp6041 = load %m980$.Node.type*, %m980$.Node.type** %params.6038
%param_ptr.6042 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6041, %m980$.Node.type** %param_ptr.6042
br label %.for.start.6040
.for.start.6040:
%.tmp6043 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6042
%.tmp6044 = icmp ne %m980$.Node.type* %.tmp6043, null
br i1 %.tmp6044, label %.for.continue.6040, label %.for.end.6040
.for.continue.6040:
%.tmp6045 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6042
%.tmp6046 = load %m980$.Node.type*, %m980$.Node.type** %params.6038
%.tmp6047 = icmp ne %m980$.Node.type* %.tmp6045, %.tmp6046
br i1 %.tmp6047, label %.if.true.6048, label %.if.false.6048
.if.true.6048:
%.tmp6049 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6042
%.tmp6050 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6049, i32 0, i32 7
%.tmp6051 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6050
store %m980$.Node.type* %.tmp6051, %m980$.Node.type** %param_ptr.6042
br label %.if.end.6048
.if.false.6048:
br label %.if.end.6048
.if.end.6048:
%.tmp6052 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6053 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6052, i32 0, i32 1
%.tmp6054 = load %m0$.File.type*, %m0$.File.type** %.tmp6053
%.tmp6056 = getelementptr [3 x i8], [3 x i8]*@.str6055, i32 0, i32 0
%.tmp6057 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6054, i8* %.tmp6056)
%.tmp6058 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6042
%.tmp6059 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6058, i32 0, i32 0
%.tmp6060 = load i8*, i8** %.tmp6059
%.tmp6062 = getelementptr [5 x i8], [5 x i8]*@.str6061, i32 0, i32 0
%.tmp6063 = call i32(i8*,i8*) @strcmp(i8* %.tmp6060, i8* %.tmp6062)
%.tmp6064 = icmp eq i32 %.tmp6063, 0
br i1 %.tmp6064, label %.if.true.6065, label %.if.false.6065
.if.true.6065:
%.tmp6066 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6067 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6042
%.tmp6068 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6067, i32 0, i32 6
%.tmp6069 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6068
%.tmp6070 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6066, %m980$.Node.type* %.tmp6069)
store %m2693$.Type.type* %.tmp6070, %m2693$.Type.type** %param_type.6039
%.tmp6071 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6042
%.tmp6072 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6071, i32 0, i32 7
%.tmp6073 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6072
store %m980$.Node.type* %.tmp6073, %m980$.Node.type** %param_ptr.6042
br label %.if.end.6065
.if.false.6065:
br label %.if.end.6065
.if.end.6065:
%.tmp6074 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6075 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6074, i32 0, i32 1
%.tmp6076 = load %m0$.File.type*, %m0$.File.type** %.tmp6075
%.tmp6078 = getelementptr [13 x i8], [13 x i8]*@.str6077, i32 0, i32 0
%.tmp6079 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6080 = load %m2693$.Type.type*, %m2693$.Type.type** %param_type.6039
%.tmp6081 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6079, %m2693$.Type.type* %.tmp6080)
%.tmp6082 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6042
%.tmp6083 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6082, i32 0, i32 1
%.tmp6084 = load i8*, i8** %.tmp6083
%.tmp6085 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6076, i8* %.tmp6078, i8* %.tmp6081, i8* %.tmp6084)
%.tmp6086 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.6042
%.tmp6087 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6086, i32 0, i32 7
%.tmp6088 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6087
store %m980$.Node.type* %.tmp6088, %m980$.Node.type** %param_ptr.6042
br label %.for.start.6040
.for.end.6040:
%.tmp6089 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6090 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6089, i32 0, i32 1
%.tmp6091 = load %m0$.File.type*, %m0$.File.type** %.tmp6090
%.tmp6093 = getelementptr [5 x i8], [5 x i8]*@.str6092, i32 0, i32 0
%.tmp6094 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6091, i8* %.tmp6093)
%.tmp6095 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6096 = load %m980$.Node.type*, %m980$.Node.type** %params.6038
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_fn_params.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6095, %m980$.Node.type* %.tmp6096)
%.tmp6097 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6098 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6097, i32 0, i32 6
%.tmp6099 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6098
%.tmp6101 = getelementptr [6 x i8], [6 x i8]*@.str6100, i32 0, i32 0
%.tmp6102 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6099, i8* %.tmp6101)
%block.6103 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6102, %m980$.Node.type** %block.6103
%.tmp6104 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6105 = load %m980$.Node.type*, %m980$.Node.type** %block.6103
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6104, %m980$.Node.type* %.tmp6105)
%.tmp6106 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6107 = load %m980$.Node.type*, %m980$.Node.type** %block.6103
%.tmp6108 = load %m2693$.Type.type*, %m2693$.Type.type** %ret_type.5959
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,%m2693$.Type.type*) @m295$check_n_add_implicit_return.v.m2693$.CompilerCtx.typep.m980$.Node.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6106, %m980$.Node.type* %.tmp6107, %m2693$.Type.type* %.tmp6108)
%.tmp6109 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
call void(%m2693$.CompilerCtx.type*) @m295$pop_scope.v.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp6109)
%.tmp6110 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6111 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6110, i32 0, i32 1
%.tmp6112 = load %m0$.File.type*, %m0$.File.type** %.tmp6111
%.tmp6114 = getelementptr [3 x i8], [3 x i8]*@.str6113, i32 0, i32 0
%.tmp6115 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6112, i8* %.tmp6114)
%.tmp6116 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6117 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6116, i32 0, i32 1
%.tmp6118 = load %m0$.File.type*, %m0$.File.type** %.tmp6117
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp6118)
%.tmp6119 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6120 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6119, i32 0, i32 1
%.tmp6121 = load %m0$.File.type*, %m0$.File.type** %.tmp6120
%.tmp6122 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6121)
%.tmp6123 = call i8*(i32) @m1$readall.cp.i(i32 %.tmp6122)
%code.6124 = alloca i8*
store i8* %.tmp6123, i8** %code.6124
%.tmp6125 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6126 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6125, i32 0, i32 1
%.tmp6127 = load %m0$.File.type*, %m0$.File.type** %.tmp6126
%.tmp6128 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp6127)
%.tmp6129 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6130 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6129, i32 0, i32 1
%.tmp6131 = load %m0$.File.type*, %m0$.File.type** %bkp_ctx.6005
store %m0$.File.type* %.tmp6131, %m0$.File.type** %.tmp6130
%.tmp6132 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6133 = load i8*, i8** %code.6124
call void(%m2693$.CompilerCtx.type*,i8*) @m295$append_anon_fn.v.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.tmp6132, i8* %.tmp6133)
ret void
}
define void @m295$check_n_add_implicit_return.v.m2693$.CompilerCtx.typep.m980$.Node.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, %m2693$.Type.type* %.return_type.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%return_type = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.return_type.arg, %m2693$.Type.type** %return_type
%.tmp6134 = bitcast ptr null to %m980$.Node.type*
%li.6135 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6134, %m980$.Node.type** %li.6135
%.tmp6136 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6137 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6136, i32 0, i32 6
%.tmp6138 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6137
%.tmp6140 = getelementptr [12 x i8], [12 x i8]*@.str6139, i32 0, i32 0
%.tmp6141 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6138, i8* %.tmp6140)
%exprs.6142 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6141, %m980$.Node.type** %exprs.6142
%.tmp6144 = load %m980$.Node.type*, %m980$.Node.type** %exprs.6142
%.tmp6145 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6144, i32 0, i32 6
%.tmp6146 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6145
%ci.6147 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6146, %m980$.Node.type** %ci.6147
br label %.for.start.6143
.for.start.6143:
%.tmp6148 = load %m980$.Node.type*, %m980$.Node.type** %ci.6147
%.tmp6149 = icmp ne %m980$.Node.type* %.tmp6148, null
br i1 %.tmp6149, label %.for.continue.6143, label %.for.end.6143
.for.continue.6143:
%.tmp6150 = load %m980$.Node.type*, %m980$.Node.type** %ci.6147
%.tmp6151 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6150, i32 0, i32 6
%.tmp6152 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6151
%.tmp6153 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6152, i32 0, i32 0
%.tmp6154 = load i8*, i8** %.tmp6153
%.tmp6156 = getelementptr [3 x i8], [3 x i8]*@.str6155, i32 0, i32 0
%.tmp6157 = call i32(i8*,i8*) @strcmp(i8* %.tmp6154, i8* %.tmp6156)
%.tmp6158 = icmp ne i32 %.tmp6157, 0
br i1 %.tmp6158, label %.if.true.6159, label %.if.false.6159
.if.true.6159:
%.tmp6160 = load %m980$.Node.type*, %m980$.Node.type** %ci.6147
store %m980$.Node.type* %.tmp6160, %m980$.Node.type** %li.6135
br label %.if.end.6159
.if.false.6159:
br label %.if.end.6159
.if.end.6159:
%.tmp6161 = load %m980$.Node.type*, %m980$.Node.type** %ci.6147
%.tmp6162 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6161, i32 0, i32 7
%.tmp6163 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6162
store %m980$.Node.type* %.tmp6163, %m980$.Node.type** %ci.6147
br label %.for.start.6143
.for.end.6143:
%.tmp6164 = load %m980$.Node.type*, %m980$.Node.type** %li.6135
%.tmp6165 = icmp ne %m980$.Node.type* %.tmp6164, null
br i1 %.tmp6165, label %.if.true.6166, label %.if.false.6166
.if.true.6166:
%.tmp6167 = load %m980$.Node.type*, %m980$.Node.type** %li.6135
%.tmp6168 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6167, i32 0, i32 6
%.tmp6169 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6168
%.tmp6170 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6169, i32 0, i32 0
%.tmp6171 = load i8*, i8** %.tmp6170
%.tmp6173 = getelementptr [7 x i8], [7 x i8]*@.str6172, i32 0, i32 0
%.tmp6174 = call i32(i8*,i8*) @strcmp(i8* %.tmp6171, i8* %.tmp6173)
%.tmp6175 = icmp eq i32 %.tmp6174, 0
br i1 %.tmp6175, label %.if.true.6176, label %.if.false.6176
.if.true.6176:
ret void
br label %.if.end.6176
.if.false.6176:
br label %.if.end.6176
.if.end.6176:
br label %.if.end.6166
.if.false.6166:
br label %.if.end.6166
.if.end.6166:
%.tmp6177 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6178 = load %m2693$.Type.type*, %m2693$.Type.type** %return_type
%.tmp6179 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6177, %m2693$.Type.type* %.tmp6178)
%.tmp6181 = getelementptr [5 x i8], [5 x i8]*@.str6180, i32 0, i32 0
%.tmp6182 = call i32(i8*,i8*) @strcmp(i8* %.tmp6179, i8* %.tmp6181)
%.tmp6183 = icmp ne i32 %.tmp6182, 0
br i1 %.tmp6183, label %.if.true.6184, label %.if.false.6184
.if.true.6184:
%.tmp6185 = load %m980$.Node.type*, %m980$.Node.type** %li.6135
%.tmp6186 = icmp ne %m980$.Node.type* %.tmp6185, null
br i1 %.tmp6186, label %.if.true.6187, label %.if.false.6187
.if.true.6187:
%.tmp6188 = load %m980$.Node.type*, %m980$.Node.type** %li.6135
store %m980$.Node.type* %.tmp6188, %m980$.Node.type** %stmt
br label %.if.end.6187
.if.false.6187:
br label %.if.end.6187
.if.end.6187:
%.tmp6189 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6190 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6192 = getelementptr [21 x i8], [21 x i8]*@.str6191, i32 0, i32 0
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp6189, %m980$.Node.type* %.tmp6190, i8* %.tmp6192)
br label %.if.end.6184
.if.false.6184:
%.tmp6193 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6194 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6193, i32 0, i32 1
%.tmp6195 = load %m0$.File.type*, %m0$.File.type** %.tmp6194
%.tmp6197 = getelementptr [10 x i8], [10 x i8]*@.str6196, i32 0, i32 0
%.tmp6198 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6195, i8* %.tmp6197)
br label %.if.end.6184
.if.end.6184:
ret void
}
define void @m295$compile_for_loop.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp6199 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6200 = call i32(%m2693$.CompilerCtx.type*) @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp6199)
%for_id.6201 = alloca i32
store i32 %.tmp6200, i32* %for_id.6201
%.tmp6202 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6203 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6202, i32 0, i32 6
%.tmp6204 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6203
%.tmp6205 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6204, i32 0, i32 7
%.tmp6206 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6205
%init_stmt.6207 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6206, %m980$.Node.type** %init_stmt.6207
%.tmp6208 = bitcast ptr null to i8*
%begin_lbl.6209 = alloca i8*
store i8* %.tmp6208, i8** %begin_lbl.6209
%.tmp6210 = bitcast ptr null to i8*
%end_lbl.6211 = alloca i8*
store i8* %.tmp6210, i8** %end_lbl.6211
%.tmp6212 = getelementptr i8*, i8** %begin_lbl.6209, i32 0
%.tmp6214 = getelementptr [14 x i8], [14 x i8]*@.str6213, i32 0, i32 0
%.tmp6215 = load i32, i32* %for_id.6201
%.tmp6216 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6212, i8* %.tmp6214, i32 %.tmp6215)
%.tmp6217 = getelementptr i8*, i8** %end_lbl.6211, i32 0
%.tmp6219 = getelementptr [12 x i8], [12 x i8]*@.str6218, i32 0, i32 0
%.tmp6220 = load i32, i32* %for_id.6201
%.tmp6221 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6217, i8* %.tmp6219, i32 %.tmp6220)
%.tmp6222 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6224 = getelementptr [4 x i8], [4 x i8]*@.str6223, i32 0, i32 0
%.tmp6225 = load i8*, i8** %begin_lbl.6209
%.tmp6226 = load i8*, i8** %end_lbl.6211
%.tmp6227 = bitcast ptr null to %m2693$.Type.type*
call void(%m2693$.CompilerCtx.type*,i8*,i8*,i8*,%m2693$.Type.type*) @m295$push_scope.v.m2693$.CompilerCtx.typep.cp.cp.cp.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6222, i8* %.tmp6224, i8* %.tmp6225, i8* %.tmp6226, %m2693$.Type.type* %.tmp6227)
%.tmp6228 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6207
%.tmp6229 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6228, i32 0, i32 0
%.tmp6230 = load i8*, i8** %.tmp6229
%.tmp6232 = getelementptr [12 x i8], [12 x i8]*@.str6231, i32 0, i32 0
%.tmp6233 = call i32(i8*,i8*) @strcmp(i8* %.tmp6230, i8* %.tmp6232)
%.tmp6234 = icmp eq i32 %.tmp6233, 0
br i1 %.tmp6234, label %.if.true.6235, label %.if.false.6235
.if.true.6235:
%.tmp6236 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6237 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6207
%.tmp6238 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_declaration.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6236, %m980$.Node.type* %.tmp6237)
br label %.if.end.6235
.if.false.6235:
%.tmp6239 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6207
%.tmp6240 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6239, i32 0, i32 0
%.tmp6241 = load i8*, i8** %.tmp6240
%.tmp6243 = getelementptr [11 x i8], [11 x i8]*@.str6242, i32 0, i32 0
%.tmp6244 = call i32(i8*,i8*) @strcmp(i8* %.tmp6241, i8* %.tmp6243)
%.tmp6245 = icmp eq i32 %.tmp6244, 0
br i1 %.tmp6245, label %.if.true.6246, label %.if.false.6246
.if.true.6246:
%.tmp6247 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6248 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6207
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_expression.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6247, %m980$.Node.type* %.tmp6248)
br label %.if.end.6246
.if.false.6246:
%.tmp6249 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6207
%.tmp6250 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6249, i32 0, i32 0
%.tmp6251 = load i8*, i8** %.tmp6250
%.tmp6253 = getelementptr [9 x i8], [9 x i8]*@.str6252, i32 0, i32 0
%.tmp6254 = call i32(i8*,i8*) @strcmp(i8* %.tmp6251, i8* %.tmp6253)
%.tmp6255 = icmp eq i32 %.tmp6254, 0
br i1 %.tmp6255, label %.if.true.6256, label %.if.false.6256
.if.true.6256:
br label %.if.end.6256
.if.false.6256:
%.tmp6257 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6258 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6207
%.tmp6260 = getelementptr [66 x i8], [66 x i8]*@.str6259, i32 0, i32 0
%.tmp6261 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp6257, %m980$.Node.type* %.tmp6258, i8* %.tmp6260)
%.tmp6262 = load %m980$.Node.type*, %m980$.Node.type** %init_stmt.6207
%.tmp6263 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6262, i32 0, i32 0
%.tmp6264 = load i8*, i8** %.tmp6263
%.tmp6265 = call i32(i8*,...) @printf(i8* %.tmp6261, i8* %.tmp6264)
%.tmp6266 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
call void(%m2693$.CompilerCtx.type*) @m295$pop_scope.v.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp6266)
ret void
br label %.if.end.6256
.if.end.6256:
br label %.if.end.6246
.if.end.6246:
br label %.if.end.6235
.if.end.6235:
%.tmp6267 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6268 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6267, i32 0, i32 1
%.tmp6269 = load %m0$.File.type*, %m0$.File.type** %.tmp6268
%.tmp6271 = getelementptr [26 x i8], [26 x i8]*@.str6270, i32 0, i32 0
%.tmp6272 = load i32, i32* %for_id.6201
%.tmp6273 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6269, i8* %.tmp6271, i32 %.tmp6272)
%.tmp6274 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6275 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6274, i32 0, i32 1
%.tmp6276 = load %m0$.File.type*, %m0$.File.type** %.tmp6275
%.tmp6278 = getelementptr [16 x i8], [16 x i8]*@.str6277, i32 0, i32 0
%.tmp6279 = load i32, i32* %for_id.6201
%.tmp6280 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6276, i8* %.tmp6278, i32 %.tmp6279)
%.tmp6281 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6282 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6281, i32 0, i32 6
%.tmp6283 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6282
%.tmp6285 = getelementptr [9 x i8], [9 x i8]*@.str6284, i32 0, i32 0
%.tmp6286 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6283, i8* %.tmp6285)
%fst_colon.6287 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6286, %m980$.Node.type** %fst_colon.6287
%.tmp6288 = load %m980$.Node.type*, %m980$.Node.type** %fst_colon.6287
%.tmp6289 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6288, i32 0, i32 7
%.tmp6290 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6289
%condition.6291 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6290, %m980$.Node.type** %condition.6291
%.tmp6292 = load %m980$.Node.type*, %m980$.Node.type** %condition.6291
%.tmp6293 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6292, i32 0, i32 0
%.tmp6294 = load i8*, i8** %.tmp6293
%.tmp6296 = getelementptr [9 x i8], [9 x i8]*@.str6295, i32 0, i32 0
%.tmp6297 = call i32(i8*,i8*) @strcmp(i8* %.tmp6294, i8* %.tmp6296)
%.tmp6298 = icmp eq i32 %.tmp6297, 0
br i1 %.tmp6298, label %.if.true.6299, label %.if.false.6299
.if.true.6299:
%.tmp6300 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6301 = load %m980$.Node.type*, %m980$.Node.type** %condition.6291
%.tmp6303 = getelementptr [39 x i8], [39 x i8]*@.str6302, i32 0, i32 0
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp6300, %m980$.Node.type* %.tmp6301, i8* %.tmp6303)
ret void
br label %.if.end.6299
.if.false.6299:
br label %.if.end.6299
.if.end.6299:
%.tmp6304 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6305 = load %m980$.Node.type*, %m980$.Node.type** %condition.6291
%.tmp6306 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6304, %m980$.Node.type* %.tmp6305)
%condition_info.6307 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp6306, %m2693$.AssignableInfo.type** %condition_info.6307
%.tmp6308 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %condition_info.6307
%.tmp6309 = icmp eq %m2693$.AssignableInfo.type* %.tmp6308, null
br i1 %.tmp6309, label %.if.true.6310, label %.if.false.6310
.if.true.6310:
ret void
br label %.if.end.6310
.if.false.6310:
br label %.if.end.6310
.if.end.6310:
%.tmp6311 = load %m980$.Node.type*, %m980$.Node.type** %fst_colon.6287
%.tmp6312 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6311, i32 0, i32 7
%.tmp6313 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6312
%.tmp6315 = getelementptr [9 x i8], [9 x i8]*@.str6314, i32 0, i32 0
%.tmp6316 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6313, i8* %.tmp6315)
%snd_colon.6317 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6316, %m980$.Node.type** %snd_colon.6317
%.tmp6318 = load %m980$.Node.type*, %m980$.Node.type** %snd_colon.6317
%.tmp6320 = getelementptr [6 x i8], [6 x i8]*@.str6319, i32 0, i32 0
%.tmp6321 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6318, i8* %.tmp6320)
%for_body.6322 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6321, %m980$.Node.type** %for_body.6322
%.tmp6323 = load %m980$.Node.type*, %m980$.Node.type** %for_body.6322
%.tmp6325 = getelementptr [11 x i8], [11 x i8]*@.str6324, i32 0, i32 0
%.tmp6326 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6323, i8* %.tmp6325)
%else_block.6327 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6326, %m980$.Node.type** %else_block.6327
%.tmp6328 = load i8*, i8** %end_lbl.6211
%on_end.6329 = alloca i8*
store i8* %.tmp6328, i8** %on_end.6329
%.tmp6330 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6327
%.tmp6331 = icmp ne %m980$.Node.type* %.tmp6330, null
br i1 %.tmp6331, label %.if.true.6332, label %.if.false.6332
.if.true.6332:
%.tmp6333 = getelementptr i8*, i8** %on_end.6329, i32 0
%.tmp6335 = getelementptr [13 x i8], [13 x i8]*@.str6334, i32 0, i32 0
%.tmp6336 = load i32, i32* %for_id.6201
%.tmp6337 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6333, i8* %.tmp6335, i32 %.tmp6336)
br label %.if.end.6332
.if.false.6332:
br label %.if.end.6332
.if.end.6332:
%.tmp6338 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6339 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6338, i32 0, i32 1
%.tmp6340 = load %m0$.File.type*, %m0$.File.type** %.tmp6339
%.tmp6342 = getelementptr [48 x i8], [48 x i8]*@.str6341, i32 0, i32 0
%.tmp6343 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6344 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %condition_info.6307
%.tmp6345 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6344, i32 0, i32 4
%.tmp6346 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6345
%.tmp6347 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6343, %m2693$.Type.type* %.tmp6346)
%.tmp6348 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %condition_info.6307
%.tmp6349 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp6348)
%.tmp6350 = load i32, i32* %for_id.6201
%.tmp6351 = load i8*, i8** %on_end.6329
%.tmp6352 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6340, i8* %.tmp6342, i8* %.tmp6347, i8* %.tmp6349, i32 %.tmp6350, i8* %.tmp6351)
%.tmp6353 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6354 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6353, i32 0, i32 1
%.tmp6355 = load %m0$.File.type*, %m0$.File.type** %.tmp6354
%.tmp6357 = getelementptr [19 x i8], [19 x i8]*@.str6356, i32 0, i32 0
%.tmp6358 = load i32, i32* %for_id.6201
%.tmp6359 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6355, i8* %.tmp6357, i32 %.tmp6358)
%.tmp6360 = load %m980$.Node.type*, %m980$.Node.type** %snd_colon.6317
%.tmp6361 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6360, i32 0, i32 7
%.tmp6362 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6361
%increment.6363 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6362, %m980$.Node.type** %increment.6363
%.tmp6364 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6365 = load %m980$.Node.type*, %m980$.Node.type** %for_body.6322
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6364, %m980$.Node.type* %.tmp6365)
%.tmp6366 = load %m980$.Node.type*, %m980$.Node.type** %increment.6363
%.tmp6367 = load %m980$.Node.type*, %m980$.Node.type** %for_body.6322
%.tmp6368 = icmp ne %m980$.Node.type* %.tmp6366, %.tmp6367
br i1 %.tmp6368, label %.if.true.6369, label %.if.false.6369
.if.true.6369:
%.tmp6370 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6371 = load %m980$.Node.type*, %m980$.Node.type** %increment.6363
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_expression.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6370, %m980$.Node.type* %.tmp6371)
br label %.if.end.6369
.if.false.6369:
br label %.if.end.6369
.if.end.6369:
%.tmp6372 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6373 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6372, i32 0, i32 1
%.tmp6374 = load %m0$.File.type*, %m0$.File.type** %.tmp6373
%.tmp6376 = getelementptr [15 x i8], [15 x i8]*@.str6375, i32 0, i32 0
%.tmp6377 = load i8*, i8** %begin_lbl.6209
%.tmp6378 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6374, i8* %.tmp6376, i8* %.tmp6377)
%.tmp6379 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6327
%.tmp6380 = icmp ne %m980$.Node.type* %.tmp6379, null
br i1 %.tmp6380, label %.if.true.6381, label %.if.false.6381
.if.true.6381:
%.tmp6382 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6383 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6382, i32 0, i32 1
%.tmp6384 = load %m0$.File.type*, %m0$.File.type** %.tmp6383
%.tmp6386 = getelementptr [15 x i8], [15 x i8]*@.str6385, i32 0, i32 0
%.tmp6387 = load i32, i32* %for_id.6201
%.tmp6388 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6384, i8* %.tmp6386, i32 %.tmp6387)
%.tmp6389 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6327
%.tmp6390 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6389, i32 0, i32 6
%.tmp6391 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6390
%.tmp6393 = getelementptr [6 x i8], [6 x i8]*@.str6392, i32 0, i32 0
%.tmp6394 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6391, i8* %.tmp6393)
%block.6395 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6394, %m980$.Node.type** %block.6395
%.tmp6396 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6397 = load %m980$.Node.type*, %m980$.Node.type** %block.6395
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6396, %m980$.Node.type* %.tmp6397)
%.tmp6398 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6399 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6398, i32 0, i32 1
%.tmp6400 = load %m0$.File.type*, %m0$.File.type** %.tmp6399
%.tmp6402 = getelementptr [15 x i8], [15 x i8]*@.str6401, i32 0, i32 0
%.tmp6403 = load i8*, i8** %end_lbl.6211
%.tmp6404 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6400, i8* %.tmp6402, i8* %.tmp6403)
br label %.if.end.6381
.if.false.6381:
br label %.if.end.6381
.if.end.6381:
%.tmp6405 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6406 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6405, i32 0, i32 1
%.tmp6407 = load %m0$.File.type*, %m0$.File.type** %.tmp6406
%.tmp6409 = getelementptr [5 x i8], [5 x i8]*@.str6408, i32 0, i32 0
%.tmp6410 = load i8*, i8** %end_lbl.6211
%.tmp6411 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6407, i8* %.tmp6409, i8* %.tmp6410)
%.tmp6412 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
call void(%m2693$.CompilerCtx.type*) @m295$pop_scope.v.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp6412)
ret void
}
define %m2693$.AssignableInfo.type* @m295$compile_declaration.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp6413 = bitcast ptr null to %m2693$.Type.type*
%decl_type.6414 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp6413, %m2693$.Type.type** %decl_type.6414
%.tmp6415 = bitcast ptr null to %m2693$.AssignableInfo.type*
%a_info.6416 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp6415, %m2693$.AssignableInfo.type** %a_info.6416
%.tmp6417 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6418 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6417, i32 0, i32 6
%.tmp6419 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6418
%.tmp6420 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6419, i32 0, i32 0
%.tmp6421 = load i8*, i8** %.tmp6420
%.tmp6423 = getelementptr [5 x i8], [5 x i8]*@.str6422, i32 0, i32 0
%.tmp6424 = call i32(i8*,i8*) @strcmp(i8* %.tmp6421, i8* %.tmp6423)
%.tmp6425 = icmp eq i32 %.tmp6424, 0
br i1 %.tmp6425, label %.if.true.6426, label %.if.false.6426
.if.true.6426:
%.tmp6427 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6428 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6429 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6428, i32 0, i32 6
%.tmp6430 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6429
%.tmp6431 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6430, i32 0, i32 6
%.tmp6432 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6431
%.tmp6433 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6427, %m980$.Node.type* %.tmp6432)
store %m2693$.Type.type* %.tmp6433, %m2693$.Type.type** %decl_type.6414
br label %.if.end.6426
.if.false.6426:
br label %.if.end.6426
.if.end.6426:
%.tmp6434 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6435 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6434, i32 0, i32 6
%.tmp6436 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6435
%.tmp6438 = getelementptr [11 x i8], [11 x i8]*@.str6437, i32 0, i32 0
%.tmp6439 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6436, i8* %.tmp6438)
%assignable.6440 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6439, %m980$.Node.type** %assignable.6440
%.tmp6441 = load %m980$.Node.type*, %m980$.Node.type** %assignable.6440
%.tmp6442 = icmp ne %m980$.Node.type* %.tmp6441, null
br i1 %.tmp6442, label %.if.true.6443, label %.if.false.6443
.if.true.6443:
%.tmp6444 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6445 = load %m980$.Node.type*, %m980$.Node.type** %assignable.6440
%.tmp6446 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6444, %m980$.Node.type* %.tmp6445)
store %m2693$.AssignableInfo.type* %.tmp6446, %m2693$.AssignableInfo.type** %a_info.6416
br label %.if.end.6443
.if.false.6443:
br label %.if.end.6443
.if.end.6443:
%.tmp6447 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6448 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp6447)
%info.6449 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp6448, %m2693$.AssignableInfo.type** %info.6449
%.tmp6450 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.6449
%.tmp6451 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6450, i32 0, i32 3
%.tmp6453 = getelementptr [9 x i8], [9 x i8]*@.str6452, i32 0, i32 0
store i8* %.tmp6453, i8** %.tmp6451
%.tmp6454 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6455 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6454, i32 0, i32 6
%.tmp6456 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6455
%.tmp6458 = getelementptr [5 x i8], [5 x i8]*@.str6457, i32 0, i32 0
%.tmp6459 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6456, i8* %.tmp6458)
%var_name.6460 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6459, %m980$.Node.type** %var_name.6460
%.tmp6461 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6460
%.tmp6462 = icmp eq %m980$.Node.type* %.tmp6461, null
br i1 %.tmp6462, label %.if.true.6463, label %.if.false.6463
.if.true.6463:
%.tmp6464 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6465 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6467 = getelementptr [31 x i8], [31 x i8]*@.str6466, i32 0, i32 0
%.tmp6468 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp6464, %m980$.Node.type* %.tmp6465, i8* %.tmp6467)
%.tmp6469 = call i32(i8*,...) @printf(i8* %.tmp6468)
%.tmp6470 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp6470
br label %.if.end.6463
.if.false.6463:
br label %.if.end.6463
.if.end.6463:
%.tmp6471 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6472 = call %m2693$.ModuleLookup.type*(%m2693$.CompilerCtx.type*) @m295$get_current_module.m2693$.ModuleLookup.typep.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp6471)
%mod.6473 = alloca %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* %.tmp6472, %m2693$.ModuleLookup.type** %mod.6473
%.tmp6474 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6475 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.6473
%.tmp6476 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp6475, i32 0, i32 3
%.tmp6477 = load %m2693$.Scope.type*, %m2693$.Scope.type** %.tmp6476
%.tmp6478 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6460
%.tmp6479 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6478, i32 0, i32 1
%.tmp6480 = load i8*, i8** %.tmp6479
%.tmp6481 = call %m2693$.ScopeItem.type*(%m2693$.CompilerCtx.type*,%m2693$.Scope.type*,i8*) @m295$find_defined_here.m2693$.ScopeItem.typep.m2693$.CompilerCtx.typep.m2693$.Scope.typep.cp(%m2693$.CompilerCtx.type* %.tmp6474, %m2693$.Scope.type* %.tmp6477, i8* %.tmp6480)
%.tmp6482 = icmp ne %m2693$.ScopeItem.type* %.tmp6481, null
br i1 %.tmp6482, label %.if.true.6483, label %.if.false.6483
.if.true.6483:
%.tmp6485 = getelementptr [1 x i8], [1 x i8]*@.str6484, i32 0, i32 0
%err_buf.6486 = alloca i8*
store i8* %.tmp6485, i8** %err_buf.6486
%.tmp6487 = getelementptr i8*, i8** %err_buf.6486, i32 0
%.tmp6489 = getelementptr [43 x i8], [43 x i8]*@.str6488, i32 0, i32 0
%.tmp6490 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6460
%.tmp6491 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6490, i32 0, i32 1
%.tmp6492 = load i8*, i8** %.tmp6491
%.tmp6493 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6487, i8* %.tmp6489, i8* %.tmp6492)
%.tmp6494 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6495 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6496 = load i8*, i8** %err_buf.6486
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp6494, %m980$.Node.type* %.tmp6495, i8* %.tmp6496)
%.tmp6497 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp6497
br label %.if.end.6483
.if.false.6483:
br label %.if.end.6483
.if.end.6483:
%.tmp6499 = getelementptr [1 x i8], [1 x i8]*@.str6498, i32 0, i32 0
%var_id.6500 = alloca i8*
store i8* %.tmp6499, i8** %var_id.6500
%.tmp6501 = getelementptr i8*, i8** %var_id.6500, i32 0
%.tmp6503 = getelementptr [6 x i8], [6 x i8]*@.str6502, i32 0, i32 0
%.tmp6504 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6460
%.tmp6505 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6504, i32 0, i32 1
%.tmp6506 = load i8*, i8** %.tmp6505
%.tmp6507 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6508 = call i32(%m2693$.CompilerCtx.type*) @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp6507)
%.tmp6509 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6501, i8* %.tmp6503, i8* %.tmp6506, i32 %.tmp6508)
%.tmp6510 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.6449
%.tmp6511 = load i8, i8* @SCOPE_LOCAL
%.tmp6512 = load i8*, i8** %var_id.6500
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp6510, i8 %.tmp6511, i8* %.tmp6512)
%.tmp6513 = load %m2693$.Type.type*, %m2693$.Type.type** %decl_type.6414
%.tmp6514 = icmp ne %m2693$.Type.type* %.tmp6513, null
br i1 %.tmp6514, label %.if.true.6515, label %.if.false.6515
.if.true.6515:
%.tmp6516 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.6449
%.tmp6517 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6516, i32 0, i32 4
%.tmp6518 = load %m2693$.Type.type*, %m2693$.Type.type** %decl_type.6414
store %m2693$.Type.type* %.tmp6518, %m2693$.Type.type** %.tmp6517
br label %.if.end.6515
.if.false.6515:
%.tmp6519 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.6416
%.tmp6520 = icmp ne %m2693$.AssignableInfo.type* %.tmp6519, null
br i1 %.tmp6520, label %.if.true.6521, label %.if.false.6521
.if.true.6521:
%.tmp6522 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.6449
%.tmp6523 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6522, i32 0, i32 4
%.tmp6524 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.6416
%.tmp6525 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6524, i32 0, i32 4
%.tmp6526 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6525
store %m2693$.Type.type* %.tmp6526, %m2693$.Type.type** %.tmp6523
br label %.if.end.6521
.if.false.6521:
br label %.if.end.6521
.if.end.6521:
br label %.if.end.6515
.if.end.6515:
%.tmp6527 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6528 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.6449
%.tmp6529 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6528, i32 0, i32 4
%.tmp6530 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6529
%.tmp6531 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6527, %m2693$.Type.type* %.tmp6530)
%var_type_repr.6532 = alloca i8*
store i8* %.tmp6531, i8** %var_type_repr.6532
%.tmp6533 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.6416
%.tmp6534 = icmp ne %m2693$.AssignableInfo.type* %.tmp6533, null
br i1 %.tmp6534, label %.if.true.6535, label %.if.false.6535
.if.true.6535:
%.tmp6536 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6537 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.6416
%.tmp6538 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6537, i32 0, i32 4
%.tmp6539 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6538
%.tmp6540 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6536, %m2693$.Type.type* %.tmp6539)
%a_type_repr.6541 = alloca i8*
store i8* %.tmp6540, i8** %a_type_repr.6541
%.tmp6542 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6543 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.6416
%.tmp6544 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6543, i32 0, i32 4
%.tmp6545 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6544
%.tmp6546 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.6449
%.tmp6547 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6546, i32 0, i32 4
%.tmp6548 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6547
%.tmp6549 = call i1(%m2693$.CompilerCtx.type*,%m2693$.Type.type*,%m2693$.Type.type*) @m2694$cmp.b.m2693$.CompilerCtx.typep.m2693$.Type.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6542, %m2693$.Type.type* %.tmp6545, %m2693$.Type.type* %.tmp6548)
%.tmp6550 = icmp eq i1 %.tmp6549, 0
br i1 %.tmp6550, label %.if.true.6551, label %.if.false.6551
.if.true.6551:
%.tmp6553 = getelementptr [1 x i8], [1 x i8]*@.str6552, i32 0, i32 0
%err_msg.6554 = alloca i8*
store i8* %.tmp6553, i8** %err_msg.6554
%.tmp6555 = getelementptr i8*, i8** %err_msg.6554, i32 0
%.tmp6557 = getelementptr [49 x i8], [49 x i8]*@.str6556, i32 0, i32 0
%.tmp6558 = load i8*, i8** %a_type_repr.6541
%.tmp6559 = load i8*, i8** %var_type_repr.6532
%.tmp6560 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6555, i8* %.tmp6557, i8* %.tmp6558, i8* %.tmp6559)
%.tmp6561 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6562 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6563 = load i8*, i8** %err_msg.6554
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp6561, %m980$.Node.type* %.tmp6562, i8* %.tmp6563)
br label %.if.end.6551
.if.false.6551:
br label %.if.end.6551
.if.end.6551:
br label %.if.end.6535
.if.false.6535:
br label %.if.end.6535
.if.end.6535:
%.tmp6564 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6565 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6566 = load %m980$.Node.type*, %m980$.Node.type** %var_name.6460
%.tmp6567 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6566, i32 0, i32 1
%.tmp6568 = load i8*, i8** %.tmp6567
%.tmp6569 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.6449
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2693$.AssignableInfo.type*) @m295$define_assignable.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp6564, %m980$.Node.type* %.tmp6565, i8* %.tmp6568, %m2693$.AssignableInfo.type* %.tmp6569)
%.tmp6570 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6571 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6570, i32 0, i32 1
%.tmp6572 = load %m0$.File.type*, %m0$.File.type** %.tmp6571
%.tmp6574 = getelementptr [16 x i8], [16 x i8]*@.str6573, i32 0, i32 0
%.tmp6575 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.6449
%.tmp6576 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp6575)
%.tmp6577 = load i8*, i8** %var_type_repr.6532
%.tmp6578 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6572, i8* %.tmp6574, i8* %.tmp6576, i8* %.tmp6577)
%.tmp6579 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.6416
%.tmp6580 = icmp ne %m2693$.AssignableInfo.type* %.tmp6579, null
br i1 %.tmp6580, label %.if.true.6581, label %.if.false.6581
.if.true.6581:
%.tmp6582 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6583 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6582, i32 0, i32 1
%.tmp6584 = load %m0$.File.type*, %m0$.File.type** %.tmp6583
%.tmp6586 = getelementptr [21 x i8], [21 x i8]*@.str6585, i32 0, i32 0
%.tmp6587 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6588 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.6416
%.tmp6589 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6588, i32 0, i32 4
%.tmp6590 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6589
%.tmp6591 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6587, %m2693$.Type.type* %.tmp6590)
%.tmp6592 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.6416
%.tmp6593 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp6592)
%.tmp6594 = load i8*, i8** %var_type_repr.6532
%.tmp6595 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.6449
%.tmp6596 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp6595)
%.tmp6597 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6584, i8* %.tmp6586, i8* %.tmp6591, i8* %.tmp6593, i8* %.tmp6594, i8* %.tmp6596)
br label %.if.end.6581
.if.false.6581:
%.tmp6598 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6599 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6600 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.6449
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,%m2693$.AssignableInfo.type*) @m295$compile_zero_value.v.m2693$.CompilerCtx.typep.m980$.Node.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp6598, %m980$.Node.type* %.tmp6599, %m2693$.AssignableInfo.type* %.tmp6600)
br label %.if.end.6581
.if.end.6581:
%.tmp6601 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.6449
ret %m2693$.AssignableInfo.type* %.tmp6601
}
define void @m295$compile_zero_value.v.m2693$.CompilerCtx.typep.m980$.Node.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, %m2693$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%info = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.info.arg, %m2693$.AssignableInfo.type** %info
%.tmp6602 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp6603 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6602, i32 0, i32 4
%.tmp6604 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6603
%.tmp6605 = icmp eq %m2693$.Type.type* %.tmp6604, null
br i1 %.tmp6605, label %.if.true.6606, label %.if.false.6606
.if.true.6606:
ret void
br label %.if.end.6606
.if.false.6606:
br label %.if.end.6606
.if.end.6606:
%.tmp6607 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6608 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp6609 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6608, i32 0, i32 4
%.tmp6610 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6609
%.tmp6611 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6607, %m2693$.Type.type* %.tmp6610)
%t_repr.6612 = alloca i8*
store i8* %.tmp6611, i8** %t_repr.6612
%.tmp6613 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp6614 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp6613)
%id.6615 = alloca i8*
store i8* %.tmp6614, i8** %id.6615
%field_id.6616 = alloca i32
store i32 0, i32* %field_id.6616
%field.6617 = alloca %m2693$.Type.type*
store %m2693$.Type.type* null, %m2693$.Type.type** %field.6617
%field_info.6618 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* null, %m2693$.AssignableInfo.type** %field_info.6618
%.tmp6619 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp6620 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6619, i32 0, i32 4
%.tmp6621 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6620
%t.6622 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp6621, %m2693$.Type.type** %t.6622
%.tmp6623 = load %m2693$.Type.type*, %m2693$.Type.type** %t.6622
%.tmp6624 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp6623, i32 0, i32 0
%.tmp6625 = load i8*, i8** %.tmp6624
%.tmp6627 = getelementptr [4 x i8], [4 x i8]*@.str6626, i32 0, i32 0
%.tmp6628 = call i32(i8*,i8*) @strcmp(i8* %.tmp6625, i8* %.tmp6627)
%.tmp6629 = icmp eq i32 %.tmp6628, 0
%.tmp6630 = load %m2693$.Type.type*, %m2693$.Type.type** %t.6622
%.tmp6631 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp6630, i32 0, i32 0
%.tmp6632 = load i8*, i8** %.tmp6631
%.tmp6634 = getelementptr [4 x i8], [4 x i8]*@.str6633, i32 0, i32 0
%.tmp6635 = call i32(i8*,i8*) @strcmp(i8* %.tmp6632, i8* %.tmp6634)
%.tmp6636 = icmp eq i32 %.tmp6635, 0
%.tmp6637 = or i1 %.tmp6629, %.tmp6636
%.tmp6638 = load %m2693$.Type.type*, %m2693$.Type.type** %t.6622
%.tmp6639 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp6638, i32 0, i32 0
%.tmp6640 = load i8*, i8** %.tmp6639
%.tmp6642 = getelementptr [5 x i8], [5 x i8]*@.str6641, i32 0, i32 0
%.tmp6643 = call i32(i8*,i8*) @strcmp(i8* %.tmp6640, i8* %.tmp6642)
%.tmp6644 = icmp eq i32 %.tmp6643, 0
%.tmp6645 = or i1 %.tmp6637, %.tmp6644
br i1 %.tmp6645, label %.if.true.6646, label %.if.false.6646
.if.true.6646:
%.tmp6647 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6648 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6647, i32 0, i32 1
%.tmp6649 = load %m0$.File.type*, %m0$.File.type** %.tmp6648
%.tmp6651 = getelementptr [21 x i8], [21 x i8]*@.str6650, i32 0, i32 0
%.tmp6652 = load i8*, i8** %t_repr.6612
%.tmp6653 = load i8*, i8** %t_repr.6612
%.tmp6654 = load i8*, i8** %id.6615
%.tmp6655 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6649, i8* %.tmp6651, i8* %.tmp6652, i32 0, i8* %.tmp6653, i8* %.tmp6654)
br label %.if.end.6646
.if.false.6646:
%.tmp6656 = load %m2693$.Type.type*, %m2693$.Type.type** %t.6622
%.tmp6657 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp6656, i32 0, i32 0
%.tmp6658 = load i8*, i8** %.tmp6657
%.tmp6660 = getelementptr [4 x i8], [4 x i8]*@.str6659, i32 0, i32 0
%.tmp6661 = call i32(i8*,i8*) @strcmp(i8* %.tmp6658, i8* %.tmp6660)
%.tmp6662 = icmp eq i32 %.tmp6661, 0
br i1 %.tmp6662, label %.if.true.6663, label %.if.false.6663
.if.true.6663:
%.tmp6664 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6665 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6664, i32 0, i32 1
%.tmp6666 = load %m0$.File.type*, %m0$.File.type** %.tmp6665
%.tmp6668 = getelementptr [21 x i8], [21 x i8]*@.str6667, i32 0, i32 0
%.tmp6669 = load i8*, i8** %t_repr.6612
%.tmp6671 = getelementptr [5 x i8], [5 x i8]*@.str6670, i32 0, i32 0
%.tmp6672 = load i8*, i8** %t_repr.6612
%.tmp6673 = load i8*, i8** %id.6615
%.tmp6674 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6666, i8* %.tmp6668, i8* %.tmp6669, i8* %.tmp6671, i8* %.tmp6672, i8* %.tmp6673)
br label %.if.end.6663
.if.false.6663:
%.tmp6675 = load %m2693$.Type.type*, %m2693$.Type.type** %t.6622
%.tmp6676 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp6675, i32 0, i32 0
%.tmp6677 = load i8*, i8** %.tmp6676
%.tmp6679 = getelementptr [7 x i8], [7 x i8]*@.str6678, i32 0, i32 0
%.tmp6680 = call i32(i8*,i8*) @strcmp(i8* %.tmp6677, i8* %.tmp6679)
%.tmp6681 = icmp eq i32 %.tmp6680, 0
br i1 %.tmp6681, label %.if.true.6682, label %.if.false.6682
.if.true.6682:
%.tmp6684 = load %m2693$.Type.type*, %m2693$.Type.type** %t.6622
%.tmp6685 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp6684, i32 0, i32 3
%.tmp6686 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6685
store %m2693$.Type.type* %.tmp6686, %m2693$.Type.type** %field.6617
br label %.for.start.6683
.for.start.6683:
%.tmp6687 = load %m2693$.Type.type*, %m2693$.Type.type** %field.6617
%.tmp6688 = icmp ne %m2693$.Type.type* %.tmp6687, null
br i1 %.tmp6688, label %.for.continue.6683, label %.for.end.6683
.for.continue.6683:
%.tmp6689 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6690 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp6689)
store %m2693$.AssignableInfo.type* %.tmp6690, %m2693$.AssignableInfo.type** %field_info.6618
%.tmp6691 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6692 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %field_info.6618
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp6691, %m2693$.AssignableInfo.type* %.tmp6692)
%.tmp6693 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %field_info.6618
%.tmp6694 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6693, i32 0, i32 4
%.tmp6695 = load %m2693$.Type.type*, %m2693$.Type.type** %field.6617
store %m2693$.Type.type* %.tmp6695, %m2693$.Type.type** %.tmp6694
%.tmp6696 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6697 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6696, i32 0, i32 1
%.tmp6698 = load %m0$.File.type*, %m0$.File.type** %.tmp6697
%.tmp6700 = getelementptr [46 x i8], [46 x i8]*@.str6699, i32 0, i32 0
%.tmp6701 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %field_info.6618
%.tmp6702 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp6701)
%.tmp6703 = load i8*, i8** %t_repr.6612
%.tmp6704 = load i8*, i8** %t_repr.6612
%.tmp6705 = load i8*, i8** %id.6615
%.tmp6706 = load i32, i32* %field_id.6616
%.tmp6707 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6698, i8* %.tmp6700, i8* %.tmp6702, i8* %.tmp6703, i8* %.tmp6704, i8* %.tmp6705, i32 %.tmp6706)
%.tmp6708 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6709 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6710 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %field_info.6618
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,%m2693$.AssignableInfo.type*) @m295$compile_zero_value.v.m2693$.CompilerCtx.typep.m980$.Node.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp6708, %m980$.Node.type* %.tmp6709, %m2693$.AssignableInfo.type* %.tmp6710)
%.tmp6711 = load i32, i32* %field_id.6616
%.tmp6712 = add i32 %.tmp6711, 1
store i32 %.tmp6712, i32* %field_id.6616
%.tmp6713 = load %m2693$.Type.type*, %m2693$.Type.type** %field.6617
%.tmp6714 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp6713, i32 0, i32 4
%.tmp6715 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6714
store %m2693$.Type.type* %.tmp6715, %m2693$.Type.type** %field.6617
br label %.for.start.6683
.for.end.6683:
br label %.if.end.6682
.if.false.6682:
%.tmp6716 = load %m2693$.Type.type*, %m2693$.Type.type** %t.6622
%.tmp6717 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp6716, i32 0, i32 0
%.tmp6718 = load i8*, i8** %.tmp6717
%.tmp6720 = getelementptr [10 x i8], [10 x i8]*@.str6719, i32 0, i32 0
%.tmp6721 = call i32(i8*,i8*) @strcmp(i8* %.tmp6718, i8* %.tmp6720)
%.tmp6722 = icmp eq i32 %.tmp6721, 0
br i1 %.tmp6722, label %.if.true.6723, label %.if.false.6723
.if.true.6723:
%.tmp6725 = load %m2693$.Type.type*, %m2693$.Type.type** %t.6622
%.tmp6726 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp6725, i32 0, i32 3
%.tmp6727 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6726
%.tmp6728 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp6727, i32 0, i32 3
%.tmp6729 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6728
store %m2693$.Type.type* %.tmp6729, %m2693$.Type.type** %field.6617
br label %.for.start.6724
.for.start.6724:
%.tmp6730 = load %m2693$.Type.type*, %m2693$.Type.type** %field.6617
%.tmp6731 = icmp ne %m2693$.Type.type* %.tmp6730, null
br i1 %.tmp6731, label %.for.continue.6724, label %.for.end.6724
.for.continue.6724:
%.tmp6732 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6733 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp6732)
store %m2693$.AssignableInfo.type* %.tmp6733, %m2693$.AssignableInfo.type** %field_info.6618
%.tmp6734 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6735 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %field_info.6618
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp6734, %m2693$.AssignableInfo.type* %.tmp6735)
%.tmp6736 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %field_info.6618
%.tmp6737 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6736, i32 0, i32 4
%.tmp6738 = load %m2693$.Type.type*, %m2693$.Type.type** %field.6617
store %m2693$.Type.type* %.tmp6738, %m2693$.Type.type** %.tmp6737
%.tmp6739 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6740 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6739, i32 0, i32 1
%.tmp6741 = load %m0$.File.type*, %m0$.File.type** %.tmp6740
%.tmp6743 = getelementptr [46 x i8], [46 x i8]*@.str6742, i32 0, i32 0
%.tmp6744 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %field_info.6618
%.tmp6745 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp6744)
%.tmp6746 = load i8*, i8** %t_repr.6612
%.tmp6747 = load i8*, i8** %t_repr.6612
%.tmp6748 = load i8*, i8** %id.6615
%.tmp6749 = load i32, i32* %field_id.6616
%.tmp6750 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6741, i8* %.tmp6743, i8* %.tmp6745, i8* %.tmp6746, i8* %.tmp6747, i8* %.tmp6748, i32 %.tmp6749)
%.tmp6751 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6752 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6753 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %field_info.6618
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,%m2693$.AssignableInfo.type*) @m295$compile_zero_value.v.m2693$.CompilerCtx.typep.m980$.Node.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp6751, %m980$.Node.type* %.tmp6752, %m2693$.AssignableInfo.type* %.tmp6753)
%.tmp6754 = load i32, i32* %field_id.6616
%.tmp6755 = add i32 %.tmp6754, 1
store i32 %.tmp6755, i32* %field_id.6616
%.tmp6756 = load %m2693$.Type.type*, %m2693$.Type.type** %field.6617
%.tmp6757 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp6756, i32 0, i32 4
%.tmp6758 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6757
store %m2693$.Type.type* %.tmp6758, %m2693$.Type.type** %field.6617
br label %.for.start.6724
.for.end.6724:
br label %.if.end.6723
.if.false.6723:
%.tmp6759 = load %m2693$.Type.type*, %m2693$.Type.type** %t.6622
%.tmp6760 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp6759, i32 0, i32 0
%.tmp6761 = load i8*, i8** %.tmp6760
%.tmp6763 = getelementptr [6 x i8], [6 x i8]*@.str6762, i32 0, i32 0
%.tmp6764 = call i32(i8*,i8*) @strcmp(i8* %.tmp6761, i8* %.tmp6763)
%.tmp6765 = icmp eq i32 %.tmp6764, 0
br i1 %.tmp6765, label %.if.true.6766, label %.if.false.6766
.if.true.6766:
ret void
br label %.if.end.6766
.if.false.6766:
%.tmp6767 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6768 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6770 = getelementptr [44 x i8], [44 x i8]*@.str6769, i32 0, i32 0
%.tmp6771 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp6767, %m980$.Node.type* %.tmp6768, i8* %.tmp6770)
%.tmp6772 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp6773 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6772, i32 0, i32 4
%.tmp6774 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6773
%.tmp6775 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp6774, i32 0, i32 0
%.tmp6776 = load i8*, i8** %.tmp6775
%.tmp6777 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6778 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp6779 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6778, i32 0, i32 4
%.tmp6780 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6779
%.tmp6781 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6777, %m2693$.Type.type* %.tmp6780)
%.tmp6782 = call i32(i8*,...) @printf(i8* %.tmp6771, i8* %.tmp6776, i8* %.tmp6781)
ret void
br label %.if.end.6766
.if.end.6766:
br label %.if.end.6723
.if.end.6723:
br label %.if.end.6682
.if.end.6682:
br label %.if.end.6663
.if.end.6663:
br label %.if.end.6646
.if.end.6646:
ret void
}
define void @m295$compile_if_block.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp6783 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6784 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6783, i32 0, i32 6
%.tmp6785 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6784
%.tmp6787 = getelementptr [11 x i8], [11 x i8]*@.str6786, i32 0, i32 0
%.tmp6788 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6785, i8* %.tmp6787)
%assignable.6789 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6788, %m980$.Node.type** %assignable.6789
%.tmp6790 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6791 = load %m980$.Node.type*, %m980$.Node.type** %assignable.6789
%.tmp6792 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6790, %m980$.Node.type* %.tmp6791)
%a_info.6793 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp6792, %m2693$.AssignableInfo.type** %a_info.6793
%.tmp6794 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.6793
%.tmp6795 = icmp eq %m2693$.AssignableInfo.type* %.tmp6794, null
br i1 %.tmp6795, label %.if.true.6796, label %.if.false.6796
.if.true.6796:
ret void
br label %.if.end.6796
.if.false.6796:
br label %.if.end.6796
.if.end.6796:
%.tmp6797 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6798 = call i32(%m2693$.CompilerCtx.type*) @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp6797)
%if_id.6799 = alloca i32
store i32 %.tmp6798, i32* %if_id.6799
%.tmp6800 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6801 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6800, i32 0, i32 1
%.tmp6802 = load %m0$.File.type*, %m0$.File.type** %.tmp6801
%.tmp6804 = getelementptr [53 x i8], [53 x i8]*@.str6803, i32 0, i32 0
%.tmp6805 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6806 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.6793
%.tmp6807 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6806, i32 0, i32 4
%.tmp6808 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp6807
%.tmp6809 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp6805, %m2693$.Type.type* %.tmp6808)
%.tmp6810 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %a_info.6793
%.tmp6811 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp6810)
%.tmp6812 = load i32, i32* %if_id.6799
%.tmp6813 = load i32, i32* %if_id.6799
%.tmp6814 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6802, i8* %.tmp6804, i8* %.tmp6809, i8* %.tmp6811, i32 %.tmp6812, i32 %.tmp6813)
%.tmp6815 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6816 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6815, i32 0, i32 1
%.tmp6817 = load %m0$.File.type*, %m0$.File.type** %.tmp6816
%.tmp6819 = getelementptr [14 x i8], [14 x i8]*@.str6818, i32 0, i32 0
%.tmp6820 = load i32, i32* %if_id.6799
%.tmp6821 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6817, i8* %.tmp6819, i32 %.tmp6820)
%.tmp6822 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6823 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6822, i32 0, i32 6
%.tmp6824 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6823
%.tmp6826 = getelementptr [6 x i8], [6 x i8]*@.str6825, i32 0, i32 0
%.tmp6827 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6824, i8* %.tmp6826)
%block.6828 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6827, %m980$.Node.type** %block.6828
%.tmp6829 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6830 = load %m980$.Node.type*, %m980$.Node.type** %block.6828
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6829, %m980$.Node.type* %.tmp6830)
%.tmp6831 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6832 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6831, i32 0, i32 1
%.tmp6833 = load %m0$.File.type*, %m0$.File.type** %.tmp6832
%.tmp6835 = getelementptr [23 x i8], [23 x i8]*@.str6834, i32 0, i32 0
%.tmp6836 = load i32, i32* %if_id.6799
%.tmp6837 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6833, i8* %.tmp6835, i32 %.tmp6836)
%.tmp6838 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6839 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6838, i32 0, i32 1
%.tmp6840 = load %m0$.File.type*, %m0$.File.type** %.tmp6839
%.tmp6842 = getelementptr [15 x i8], [15 x i8]*@.str6841, i32 0, i32 0
%.tmp6843 = load i32, i32* %if_id.6799
%.tmp6844 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6840, i8* %.tmp6842, i32 %.tmp6843)
%.tmp6845 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6846 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6845, i32 0, i32 6
%.tmp6847 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6846
%.tmp6849 = getelementptr [11 x i8], [11 x i8]*@.str6848, i32 0, i32 0
%.tmp6850 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6847, i8* %.tmp6849)
%else_block.6851 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp6850, %m980$.Node.type** %else_block.6851
%.tmp6852 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6851
%.tmp6853 = icmp ne %m980$.Node.type* %.tmp6852, null
br i1 %.tmp6853, label %.if.true.6854, label %.if.false.6854
.if.true.6854:
%.tmp6855 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6851
%.tmp6856 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6855, i32 0, i32 6
%.tmp6857 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6856
%.tmp6858 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6857, i32 0, i32 0
%.tmp6859 = load i8*, i8** %.tmp6858
%.tmp6861 = getelementptr [11 x i8], [11 x i8]*@.str6860, i32 0, i32 0
%.tmp6862 = call i32(i8*,i8*) @strcmp(i8* %.tmp6859, i8* %.tmp6861)
%.tmp6863 = icmp eq i32 %.tmp6862, 0
br i1 %.tmp6863, label %.if.true.6864, label %.if.false.6864
.if.true.6864:
%.tmp6865 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6851
%.tmp6866 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6865, i32 0, i32 6
%.tmp6867 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6866
%.tmp6868 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6867, i32 0, i32 6
%.tmp6869 = load %m980$.Node.type*, %m980$.Node.type** %.tmp6868
%.tmp6871 = getelementptr [6 x i8], [6 x i8]*@.str6870, i32 0, i32 0
%.tmp6872 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp6869, i8* %.tmp6871)
store %m980$.Node.type* %.tmp6872, %m980$.Node.type** %block.6828
%.tmp6873 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6874 = load %m980$.Node.type*, %m980$.Node.type** %block.6828
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_block.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6873, %m980$.Node.type* %.tmp6874)
br label %.if.end.6864
.if.false.6864:
%.tmp6875 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6876 = load %m980$.Node.type*, %m980$.Node.type** %else_block.6851
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_if_block.v.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp6875, %m980$.Node.type* %.tmp6876)
br label %.if.end.6864
.if.end.6864:
br label %.if.end.6854
.if.false.6854:
br label %.if.end.6854
.if.end.6854:
%.tmp6877 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6878 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6877, i32 0, i32 1
%.tmp6879 = load %m0$.File.type*, %m0$.File.type** %.tmp6878
%.tmp6881 = getelementptr [23 x i8], [23 x i8]*@.str6880, i32 0, i32 0
%.tmp6882 = load i32, i32* %if_id.6799
%.tmp6883 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6879, i8* %.tmp6881, i32 %.tmp6882)
%.tmp6884 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6885 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6884, i32 0, i32 1
%.tmp6886 = load %m0$.File.type*, %m0$.File.type** %.tmp6885
%.tmp6888 = getelementptr [13 x i8], [13 x i8]*@.str6887, i32 0, i32 0
%.tmp6889 = load i32, i32* %if_id.6799
%.tmp6890 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6886, i8* %.tmp6888, i32 %.tmp6889)
ret void
}
define void @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%curr_node = alloca %m980$.Node.type*
store %m980$.Node.type* %.curr_node.arg, %m980$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp6891 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp6892 = icmp ne %m980$.Node.type* %.tmp6891, null
br i1 %.tmp6892, label %.if.true.6893, label %.if.false.6893
.if.true.6893:
%.tmp6894 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6895 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp6894, i32 0, i32 7
%.tmp6896 = load i8*, i8** %.tmp6895
%.tmp6897 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp6898 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6897, i32 0, i32 3
%.tmp6899 = load i32, i32* %.tmp6898
%.tmp6900 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp6901 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6900, i32 0, i32 4
%.tmp6902 = load i32, i32* %.tmp6901
%.tmp6903 = load i8*, i8** %msg
%.tmp6904 = call %m296$.Error.type*(i8*,i32,i32,i8*) @m296$new.m296$.Error.typep.cp.i.i.cp(i8* %.tmp6896, i32 %.tmp6899, i32 %.tmp6902, i8* %.tmp6903)
%err.6905 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp6904, %m296$.Error.type** %err.6905
%.tmp6906 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6907 = load %m296$.Error.type*, %m296$.Error.type** %err.6905
call void(%m2693$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2693$.CompilerCtx.typep.m296$.Error.typep(%m2693$.CompilerCtx.type* %.tmp6906, %m296$.Error.type* %.tmp6907)
br label %.if.end.6893
.if.false.6893:
%.tmp6909 = getelementptr [61 x i8], [61 x i8]*@.str6908, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp6909)
br label %.if.end.6893
.if.end.6893:
ret void
}
define void @m295$define_assignable.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg, i8* %.name.arg, %m2693$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.info.arg, %m2693$.AssignableInfo.type** %info
%.tmp6910 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6911 = call %m2693$.ModuleLookup.type*(%m2693$.CompilerCtx.type*) @m295$get_current_module.m2693$.ModuleLookup.typep.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp6910)
%mod.6912 = alloca %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* %.tmp6911, %m2693$.ModuleLookup.type** %mod.6912
%.tmp6913 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.6912
%.tmp6914 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp6913, i32 0, i32 3
%.tmp6915 = load %m2693$.Scope.type*, %m2693$.Scope.type** %.tmp6914
%.tmp6916 = icmp ne %m2693$.Scope.type* %.tmp6915, null
%.tmp6918 = getelementptr [82 x i8], [82 x i8]*@.str6917, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6916, i8* %.tmp6918)
%.tmp6919 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.6912
%.tmp6920 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp6919, i32 0, i32 3
%.tmp6921 = load %m2693$.Scope.type*, %m2693$.Scope.type** %.tmp6920
%current_scope.6922 = alloca %m2693$.Scope.type*
store %m2693$.Scope.type* %.tmp6921, %m2693$.Scope.type** %current_scope.6922
%.tmp6923 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* null, i32 1
%.tmp6924 = ptrtoint %m2693$.ScopeItem.type* %.tmp6923 to i32
%.tmp6925 = call i8*(i32) @malloc(i32 %.tmp6924)
%.tmp6926 = bitcast i8* %.tmp6925 to %m2693$.ScopeItem.type*
%newitem.6927 = alloca %m2693$.ScopeItem.type*
store %m2693$.ScopeItem.type* %.tmp6926, %m2693$.ScopeItem.type** %newitem.6927
%.tmp6928 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %newitem.6927
%.tmp6929 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp6928, i32 0, i32 0
%.tmp6930 = load i8*, i8** %name
store i8* %.tmp6930, i8** %.tmp6929
%.tmp6931 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %newitem.6927
%.tmp6932 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp6931, i32 0, i32 1
%.tmp6933 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
store %m2693$.AssignableInfo.type* %.tmp6933, %m2693$.AssignableInfo.type** %.tmp6932
%.tmp6934 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %newitem.6927
%.tmp6935 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp6934, i32 0, i32 2
store %m2693$.ScopeItem.type* null, %m2693$.ScopeItem.type** %.tmp6935
%.tmp6936 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp6937 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp6936, i32 0, i32 2
%.tmp6938 = load i8*, i8** %name
store i8* %.tmp6938, i8** %.tmp6937
%.tmp6939 = load %m2693$.Scope.type*, %m2693$.Scope.type** %current_scope.6922
%.tmp6940 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp6939, i32 0, i32 1
%.tmp6941 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %.tmp6940
%.tmp6942 = icmp eq %m2693$.ScopeItem.type* %.tmp6941, null
br i1 %.tmp6942, label %.if.true.6943, label %.if.false.6943
.if.true.6943:
%.tmp6944 = load %m2693$.Scope.type*, %m2693$.Scope.type** %current_scope.6922
%.tmp6945 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp6944, i32 0, i32 1
%.tmp6946 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %newitem.6927
store %m2693$.ScopeItem.type* %.tmp6946, %m2693$.ScopeItem.type** %.tmp6945
ret void
br label %.if.end.6943
.if.false.6943:
br label %.if.end.6943
.if.end.6943:
%.tmp6947 = load %m2693$.Scope.type*, %m2693$.Scope.type** %current_scope.6922
%.tmp6948 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp6947, i32 0, i32 1
%.tmp6949 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %.tmp6948
%last_item.6950 = alloca %m2693$.ScopeItem.type*
store %m2693$.ScopeItem.type* %.tmp6949, %m2693$.ScopeItem.type** %last_item.6950
%.tmp6952 = getelementptr [1 x i8], [1 x i8]*@.str6951, i32 0, i32 0
%err_buf.6953 = alloca i8*
store i8* %.tmp6952, i8** %err_buf.6953
%.tmp6954 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %last_item.6950
%.tmp6955 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp6954, i32 0, i32 0
%.tmp6956 = load i8*, i8** %.tmp6955
%.tmp6957 = load i8*, i8** %name
%.tmp6958 = call i32(i8*,i8*) @strcmp(i8* %.tmp6956, i8* %.tmp6957)
%.tmp6959 = icmp eq i32 %.tmp6958, 0
br i1 %.tmp6959, label %.if.true.6960, label %.if.false.6960
.if.true.6960:
%.tmp6961 = getelementptr i8*, i8** %err_buf.6953, i32 0
%.tmp6963 = getelementptr [43 x i8], [43 x i8]*@.str6962, i32 0, i32 0
%.tmp6964 = load i8*, i8** %name
%.tmp6965 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6961, i8* %.tmp6963, i8* %.tmp6964)
%.tmp6966 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6967 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6968 = load i8*, i8** %err_buf.6953
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp6966, %m980$.Node.type* %.tmp6967, i8* %.tmp6968)
br label %.if.end.6960
.if.false.6960:
br label %.if.end.6960
.if.end.6960:
br label %.for.start.6969
.for.start.6969:
%.tmp6970 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %last_item.6950
%.tmp6971 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp6970, i32 0, i32 2
%.tmp6972 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %.tmp6971
%.tmp6973 = icmp ne %m2693$.ScopeItem.type* %.tmp6972, null
br i1 %.tmp6973, label %.for.continue.6969, label %.for.else.6969
.for.continue.6969:
%.tmp6974 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %last_item.6950
%.tmp6975 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp6974, i32 0, i32 0
%.tmp6976 = load i8*, i8** %.tmp6975
%.tmp6977 = load i8*, i8** %name
%.tmp6978 = call i32(i8*,i8*) @strcmp(i8* %.tmp6976, i8* %.tmp6977)
%.tmp6979 = icmp eq i32 %.tmp6978, 0
br i1 %.tmp6979, label %.if.true.6980, label %.if.false.6980
.if.true.6980:
%.tmp6981 = getelementptr i8*, i8** %err_buf.6953, i32 0
%.tmp6983 = getelementptr [43 x i8], [43 x i8]*@.str6982, i32 0, i32 0
%.tmp6984 = load i8*, i8** %name
%.tmp6985 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6981, i8* %.tmp6983, i8* %.tmp6984)
%.tmp6986 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6987 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp6988 = load i8*, i8** %err_buf.6953
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp6986, %m980$.Node.type* %.tmp6987, i8* %.tmp6988)
br label %.for.end.6969
br label %.if.end.6980
.if.false.6980:
br label %.if.end.6980
.if.end.6980:
%.tmp6989 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %last_item.6950
%.tmp6990 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp6989, i32 0, i32 2
%.tmp6991 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %.tmp6990
store %m2693$.ScopeItem.type* %.tmp6991, %m2693$.ScopeItem.type** %last_item.6950
br label %.for.start.6969
.for.else.6969:
%.tmp6992 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %last_item.6950
%.tmp6993 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp6992, i32 0, i32 2
%.tmp6994 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %newitem.6927
store %m2693$.ScopeItem.type* %.tmp6994, %m2693$.ScopeItem.type** %.tmp6993
br label %.for.end.6969
.for.end.6969:
ret void
}
define %m2693$.ScopeItem.type* @m295$find_defined_in.m2693$.ScopeItem.typep.m2693$.CompilerCtx.typep.cp.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m980$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m980$.Node.type*
store %m980$.Node.type* %.dotted_name.arg, %m980$.Node.type** %dotted_name
%.tmp6995 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp6996 = load i8*, i8** %module
%.tmp6997 = load %m980$.Node.type*, %m980$.Node.type** %dotted_name
%.tmp6998 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp6997, i32 0, i32 1
%.tmp6999 = load i8*, i8** %.tmp6998
%.tmp7000 = call %m2693$.ScopeItem.type*(%m2693$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2693$.ScopeItem.typep.m2693$.CompilerCtx.typep.cp.cp(%m2693$.CompilerCtx.type* %.tmp6995, i8* %.tmp6996, i8* %.tmp6999)
%found.7001 = alloca %m2693$.ScopeItem.type*
store %m2693$.ScopeItem.type* %.tmp7000, %m2693$.ScopeItem.type** %found.7001
%.tmp7002 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %found.7001
%.tmp7003 = icmp eq %m2693$.ScopeItem.type* %.tmp7002, null
br i1 %.tmp7003, label %.if.true.7004, label %.if.false.7004
.if.true.7004:
%.tmp7005 = bitcast ptr null to %m2693$.ScopeItem.type*
ret %m2693$.ScopeItem.type* %.tmp7005
br label %.if.end.7004
.if.false.7004:
br label %.if.end.7004
.if.end.7004:
br label %.for.start.7006
.for.start.7006:
%.tmp7007 = load %m980$.Node.type*, %m980$.Node.type** %dotted_name
%.tmp7008 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7007, i32 0, i32 7
%.tmp7009 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7008
%.tmp7010 = icmp ne %m980$.Node.type* %.tmp7009, null
%.tmp7011 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %found.7001
%.tmp7012 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp7011, i32 0, i32 1
%.tmp7013 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %.tmp7012
%.tmp7014 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7013, i32 0, i32 3
%.tmp7015 = load i8*, i8** %.tmp7014
%.tmp7017 = getelementptr [7 x i8], [7 x i8]*@.str7016, i32 0, i32 0
%.tmp7018 = call i32(i8*,i8*) @strcmp(i8* %.tmp7015, i8* %.tmp7017)
%.tmp7019 = icmp eq i32 %.tmp7018, 0
%.tmp7020 = and i1 %.tmp7010, %.tmp7019
br i1 %.tmp7020, label %.for.continue.7006, label %.for.end.7006
.for.continue.7006:
%.tmp7021 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7022 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %found.7001
%.tmp7023 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp7022, i32 0, i32 1
%.tmp7024 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %.tmp7023
%.tmp7025 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7024, i32 0, i32 0
%.tmp7026 = load i8*, i8** %.tmp7025
%.tmp7027 = load %m980$.Node.type*, %m980$.Node.type** %dotted_name
%.tmp7028 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7027, i32 0, i32 7
%.tmp7029 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7028
%.tmp7030 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7029, i32 0, i32 7
%.tmp7031 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7030
%.tmp7032 = call %m2693$.ScopeItem.type*(%m2693$.CompilerCtx.type*,i8*,%m980$.Node.type*) @m295$find_defined_in.m2693$.ScopeItem.typep.m2693$.CompilerCtx.typep.cp.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp7021, i8* %.tmp7026, %m980$.Node.type* %.tmp7031)
store %m2693$.ScopeItem.type* %.tmp7032, %m2693$.ScopeItem.type** %found.7001
%.tmp7033 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %found.7001
%.tmp7034 = icmp eq %m2693$.ScopeItem.type* %.tmp7033, null
br i1 %.tmp7034, label %.if.true.7035, label %.if.false.7035
.if.true.7035:
%.tmp7036 = bitcast ptr null to %m2693$.ScopeItem.type*
ret %m2693$.ScopeItem.type* %.tmp7036
br label %.if.end.7035
.if.false.7035:
br label %.if.end.7035
.if.end.7035:
br label %.for.start.7006
.for.end.7006:
%.tmp7037 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %found.7001
ret %m2693$.ScopeItem.type* %.tmp7037
}
define %m2693$.ScopeItem.type* @m295$find_defined_here.m2693$.ScopeItem.typep.m2693$.CompilerCtx.typep.m2693$.Scope.typep.cp(%m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%s = alloca %m2693$.Scope.type*
store %m2693$.Scope.type* %.s.arg, %m2693$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp7038 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s
%.tmp7039 = icmp eq %m2693$.Scope.type* %.tmp7038, null
br i1 %.tmp7039, label %.if.true.7040, label %.if.false.7040
.if.true.7040:
%.tmp7041 = bitcast ptr null to %m2693$.ScopeItem.type*
ret %m2693$.ScopeItem.type* %.tmp7041
br label %.if.end.7040
.if.false.7040:
br label %.if.end.7040
.if.end.7040:
%.tmp7043 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s
%.tmp7044 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp7043, i32 0, i32 1
%.tmp7045 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %.tmp7044
%item.7046 = alloca %m2693$.ScopeItem.type*
store %m2693$.ScopeItem.type* %.tmp7045, %m2693$.ScopeItem.type** %item.7046
br label %.for.start.7042
.for.start.7042:
%.tmp7047 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %item.7046
%.tmp7048 = icmp ne %m2693$.ScopeItem.type* %.tmp7047, null
br i1 %.tmp7048, label %.for.continue.7042, label %.for.end.7042
.for.continue.7042:
%.tmp7049 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %item.7046
%.tmp7050 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp7049, i32 0, i32 0
%.tmp7051 = load i8*, i8** %.tmp7050
%.tmp7052 = load i8*, i8** %name
%.tmp7053 = call i32(i8*,i8*) @strcmp(i8* %.tmp7051, i8* %.tmp7052)
%.tmp7054 = icmp eq i32 %.tmp7053, 0
br i1 %.tmp7054, label %.if.true.7055, label %.if.false.7055
.if.true.7055:
%.tmp7056 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %item.7046
ret %m2693$.ScopeItem.type* %.tmp7056
br label %.if.end.7055
.if.false.7055:
br label %.if.end.7055
.if.end.7055:
%.tmp7057 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %item.7046
%.tmp7058 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp7057, i32 0, i32 2
%.tmp7059 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %.tmp7058
store %m2693$.ScopeItem.type* %.tmp7059, %m2693$.ScopeItem.type** %item.7046
br label %.for.start.7042
.for.end.7042:
%.tmp7060 = bitcast ptr null to %m2693$.ScopeItem.type*
ret %m2693$.ScopeItem.type* %.tmp7060
}
define %m2693$.ScopeItem.type* @m295$find_defined_str.m2693$.ScopeItem.typep.m2693$.CompilerCtx.typep.cp.cp(%m2693$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp7061 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7062 = load i8*, i8** %module
%.tmp7063 = call %m2693$.ModuleLookup.type*(%m2693$.CompilerCtx.type*,i8*) @m295$get_module.m2693$.ModuleLookup.typep.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.tmp7061, i8* %.tmp7062)
%mod.7064 = alloca %m2693$.ModuleLookup.type*
store %m2693$.ModuleLookup.type* %.tmp7063, %m2693$.ModuleLookup.type** %mod.7064
%.tmp7065 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.7064
%.tmp7066 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp7065, i32 0, i32 3
%.tmp7067 = load %m2693$.Scope.type*, %m2693$.Scope.type** %.tmp7066
%.tmp7068 = icmp ne %m2693$.Scope.type* %.tmp7067, null
%.tmp7070 = getelementptr [77 x i8], [77 x i8]*@.str7069, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7068, i8* %.tmp7070)
%.tmp7072 = load %m2693$.ModuleLookup.type*, %m2693$.ModuleLookup.type** %mod.7064
%.tmp7073 = getelementptr %m2693$.ModuleLookup.type, %m2693$.ModuleLookup.type* %.tmp7072, i32 0, i32 3
%.tmp7074 = load %m2693$.Scope.type*, %m2693$.Scope.type** %.tmp7073
%s.7075 = alloca %m2693$.Scope.type*
store %m2693$.Scope.type* %.tmp7074, %m2693$.Scope.type** %s.7075
br label %.for.start.7071
.for.start.7071:
%.tmp7076 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.7075
%.tmp7077 = icmp ne %m2693$.Scope.type* %.tmp7076, null
br i1 %.tmp7077, label %.for.continue.7071, label %.for.end.7071
.for.continue.7071:
%.tmp7078 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7079 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.7075
%.tmp7080 = load i8*, i8** %assignable_name
%.tmp7081 = call %m2693$.ScopeItem.type*(%m2693$.CompilerCtx.type*,%m2693$.Scope.type*,i8*) @m295$find_defined_here.m2693$.ScopeItem.typep.m2693$.CompilerCtx.typep.m2693$.Scope.typep.cp(%m2693$.CompilerCtx.type* %.tmp7078, %m2693$.Scope.type* %.tmp7079, i8* %.tmp7080)
%item.7082 = alloca %m2693$.ScopeItem.type*
store %m2693$.ScopeItem.type* %.tmp7081, %m2693$.ScopeItem.type** %item.7082
%.tmp7083 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %item.7082
%.tmp7084 = icmp ne %m2693$.ScopeItem.type* %.tmp7083, null
br i1 %.tmp7084, label %.if.true.7085, label %.if.false.7085
.if.true.7085:
%.tmp7086 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %item.7082
ret %m2693$.ScopeItem.type* %.tmp7086
br label %.if.end.7085
.if.false.7085:
br label %.if.end.7085
.if.end.7085:
%.tmp7087 = load %m2693$.Scope.type*, %m2693$.Scope.type** %s.7075
%.tmp7088 = getelementptr %m2693$.Scope.type, %m2693$.Scope.type* %.tmp7087, i32 0, i32 5
%.tmp7089 = load %m2693$.Scope.type*, %m2693$.Scope.type** %.tmp7088
store %m2693$.Scope.type* %.tmp7089, %m2693$.Scope.type** %s.7075
br label %.for.start.7071
.for.end.7071:
%.tmp7090 = bitcast ptr null to %m2693$.ScopeItem.type*
ret %m2693$.ScopeItem.type* %.tmp7090
}
define %m2693$.ScopeItem.type* @m295$find_defined.m2693$.ScopeItem.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%dotted_name = alloca %m980$.Node.type*
store %m980$.Node.type* %.dotted_name.arg, %m980$.Node.type** %dotted_name
%.tmp7091 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7092 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7093 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp7092, i32 0, i32 7
%.tmp7094 = load i8*, i8** %.tmp7093
%.tmp7095 = load %m980$.Node.type*, %m980$.Node.type** %dotted_name
%.tmp7096 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7095, i32 0, i32 6
%.tmp7097 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7096
%.tmp7098 = call %m2693$.ScopeItem.type*(%m2693$.CompilerCtx.type*,i8*,%m980$.Node.type*) @m295$find_defined_in.m2693$.ScopeItem.typep.m2693$.CompilerCtx.typep.cp.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp7091, i8* %.tmp7094, %m980$.Node.type* %.tmp7097)
ret %m2693$.ScopeItem.type* %.tmp7098
}
define %m2693$.AssignableInfo.type* @m295$get_dotted_name.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.dot_name_ptr.arg, %m2693$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m980$.Node.type*
store %m980$.Node.type* %.dot_name_ptr.arg, %m980$.Node.type** %dot_name_ptr
%info = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.info.arg, %m2693$.AssignableInfo.type** %info
%.tmp7100 = getelementptr [1 x i8], [1 x i8]*@.str7099, i32 0, i32 0
%err_msg.7101 = alloca i8*
store i8* %.tmp7100, i8** %err_msg.7101
%.tmp7103 = getelementptr [1 x i8], [1 x i8]*@.str7102, i32 0, i32 0
%buf.7104 = alloca i8*
store i8* %.tmp7103, i8** %buf.7104
%.tmp7105 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp7106 = icmp eq %m2693$.AssignableInfo.type* %.tmp7105, null
br i1 %.tmp7106, label %.if.true.7107, label %.if.false.7107
.if.true.7107:
%.tmp7108 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7109 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7111 = getelementptr [54 x i8], [54 x i8]*@.str7110, i32 0, i32 0
%.tmp7112 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp7108, %m980$.Node.type* %.tmp7109, i8* %.tmp7111)
%.tmp7113 = call i32(i8*,...) @printf(i8* %.tmp7112)
%.tmp7114 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp7114
br label %.if.end.7107
.if.false.7107:
br label %.if.end.7107
.if.end.7107:
%.tmp7115 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp7116 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7115, i32 0, i32 3
%.tmp7117 = load i8*, i8** %.tmp7116
%.tmp7119 = getelementptr [9 x i8], [9 x i8]*@.str7118, i32 0, i32 0
%.tmp7120 = call i32(i8*,i8*) @strcmp(i8* %.tmp7117, i8* %.tmp7119)
%.tmp7121 = icmp eq i32 %.tmp7120, 0
%.tmp7122 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp7123 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7122, i32 0, i32 3
%.tmp7124 = load i8*, i8** %.tmp7123
%.tmp7126 = getelementptr [7 x i8], [7 x i8]*@.str7125, i32 0, i32 0
%.tmp7127 = call i32(i8*,i8*) @strcmp(i8* %.tmp7124, i8* %.tmp7126)
%.tmp7128 = icmp eq i32 %.tmp7127, 0
%.tmp7129 = or i1 %.tmp7121, %.tmp7128
br i1 %.tmp7129, label %.if.true.7130, label %.if.false.7130
.if.true.7130:
%.tmp7131 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7132 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7131, i32 0, i32 7
%.tmp7133 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7132
%.tmp7134 = icmp ne %m980$.Node.type* %.tmp7133, null
br i1 %.tmp7134, label %.if.true.7135, label %.if.false.7135
.if.true.7135:
%.tmp7136 = getelementptr i8*, i8** %err_msg.7101, i32 0
%.tmp7138 = getelementptr [46 x i8], [46 x i8]*@.str7137, i32 0, i32 0
%.tmp7139 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7140 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7139, i32 0, i32 7
%.tmp7141 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7140
%.tmp7142 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7141, i32 0, i32 7
%.tmp7143 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7142
%.tmp7144 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7143, i32 0, i32 1
%.tmp7145 = load i8*, i8** %.tmp7144
%.tmp7146 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7147 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7146, i32 0, i32 1
%.tmp7148 = load i8*, i8** %.tmp7147
%.tmp7149 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7136, i8* %.tmp7138, i8* %.tmp7145, i8* %.tmp7148)
%.tmp7150 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7151 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7152 = load i8*, i8** %err_msg.7101
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp7150, %m980$.Node.type* %.tmp7151, i8* %.tmp7152)
%.tmp7153 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp7153
br label %.if.end.7135
.if.false.7135:
br label %.if.end.7135
.if.end.7135:
%.tmp7154 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
ret %m2693$.AssignableInfo.type* %.tmp7154
br label %.if.end.7130
.if.false.7130:
%.tmp7155 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp7156 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7155, i32 0, i32 3
%.tmp7157 = load i8*, i8** %.tmp7156
%.tmp7159 = getelementptr [9 x i8], [9 x i8]*@.str7158, i32 0, i32 0
%.tmp7160 = call i32(i8*,i8*) @strcmp(i8* %.tmp7157, i8* %.tmp7159)
%.tmp7161 = icmp eq i32 %.tmp7160, 0
%.tmp7162 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7163 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7162, i32 0, i32 7
%.tmp7164 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7163
%.tmp7165 = icmp ne %m980$.Node.type* %.tmp7164, null
%.tmp7166 = and i1 %.tmp7161, %.tmp7165
br i1 %.tmp7166, label %.if.true.7167, label %.if.false.7167
.if.true.7167:
%.tmp7168 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%base_var.7169 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp7168, %m2693$.AssignableInfo.type** %base_var.7169
%.tmp7170 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base_var.7169
%.tmp7171 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7170, i32 0, i32 4
%.tmp7172 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7171
%struct_info.7173 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp7172, %m2693$.Type.type** %struct_info.7173
br label %.for.start.7174
.for.start.7174:
%.tmp7175 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base_var.7169
%.tmp7176 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7175, i32 0, i32 4
%.tmp7177 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7176
%.tmp7178 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7177, i32 0, i32 0
%.tmp7179 = load i8*, i8** %.tmp7178
%.tmp7181 = getelementptr [4 x i8], [4 x i8]*@.str7180, i32 0, i32 0
%.tmp7182 = call i32(i8*,i8*) @strcmp(i8* %.tmp7179, i8* %.tmp7181)
%.tmp7183 = icmp eq i32 %.tmp7182, 0
br i1 %.tmp7183, label %.for.continue.7174, label %.for.end.7174
.for.continue.7174:
%.tmp7184 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7185 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7184)
%new_base.7186 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp7185, %m2693$.AssignableInfo.type** %new_base.7186
%.tmp7187 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7188 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7186
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp7187, %m2693$.AssignableInfo.type* %.tmp7188)
%.tmp7189 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7186
%.tmp7190 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7189, i32 0, i32 4
%.tmp7191 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base_var.7169
%.tmp7192 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7191, i32 0, i32 4
%.tmp7193 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7192
%.tmp7194 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7193, i32 0, i32 3
%.tmp7195 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7194
store %m2693$.Type.type* %.tmp7195, %m2693$.Type.type** %.tmp7190
%.tmp7196 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7197 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp7196, i32 0, i32 1
%.tmp7198 = load %m0$.File.type*, %m0$.File.type** %.tmp7197
%.tmp7200 = getelementptr [23 x i8], [23 x i8]*@.str7199, i32 0, i32 0
%.tmp7201 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7186
%.tmp7202 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7201)
%.tmp7203 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7204 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7186
%.tmp7205 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7204, i32 0, i32 4
%.tmp7206 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7205
%.tmp7207 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp7203, %m2693$.Type.type* %.tmp7206)
%.tmp7208 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7209 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base_var.7169
%.tmp7210 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7209, i32 0, i32 4
%.tmp7211 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7210
%.tmp7212 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp7208, %m2693$.Type.type* %.tmp7211)
%.tmp7213 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base_var.7169
%.tmp7214 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7213)
%.tmp7215 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7198, i8* %.tmp7200, i8* %.tmp7202, i8* %.tmp7207, i8* %.tmp7212, i8* %.tmp7214)
%.tmp7216 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7186
store %m2693$.AssignableInfo.type* %.tmp7216, %m2693$.AssignableInfo.type** %base_var.7169
%.tmp7217 = load %m2693$.Type.type*, %m2693$.Type.type** %struct_info.7173
%.tmp7218 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7217, i32 0, i32 3
%.tmp7219 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7218
store %m2693$.Type.type* %.tmp7219, %m2693$.Type.type** %struct_info.7173
br label %.for.start.7174
.for.end.7174:
%.tmp7220 = load %m2693$.Type.type*, %m2693$.Type.type** %struct_info.7173
%.tmp7221 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7220, i32 0, i32 0
%.tmp7222 = load i8*, i8** %.tmp7221
%.tmp7224 = getelementptr [10 x i8], [10 x i8]*@.str7223, i32 0, i32 0
%.tmp7225 = call i32(i8*,i8*) @strcmp(i8* %.tmp7222, i8* %.tmp7224)
%.tmp7226 = icmp eq i32 %.tmp7225, 0
br i1 %.tmp7226, label %.if.true.7227, label %.if.false.7227
.if.true.7227:
%.tmp7228 = load %m2693$.Type.type*, %m2693$.Type.type** %struct_info.7173
%.tmp7229 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7228, i32 0, i32 3
%.tmp7230 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7229
store %m2693$.Type.type* %.tmp7230, %m2693$.Type.type** %struct_info.7173
br label %.if.end.7227
.if.false.7227:
br label %.if.end.7227
.if.end.7227:
%.tmp7231 = load %m2693$.Type.type*, %m2693$.Type.type** %struct_info.7173
%.tmp7232 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7231, i32 0, i32 0
%.tmp7233 = load i8*, i8** %.tmp7232
%.tmp7235 = getelementptr [7 x i8], [7 x i8]*@.str7234, i32 0, i32 0
%.tmp7236 = call i32(i8*,i8*) @strcmp(i8* %.tmp7233, i8* %.tmp7235)
%.tmp7237 = icmp ne i32 %.tmp7236, 0
br i1 %.tmp7237, label %.if.true.7238, label %.if.false.7238
.if.true.7238:
%.tmp7239 = getelementptr i8*, i8** %err_msg.7101, i32 0
%.tmp7241 = getelementptr [48 x i8], [48 x i8]*@.str7240, i32 0, i32 0
%.tmp7242 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7243 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7242, i32 0, i32 7
%.tmp7244 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7243
%.tmp7245 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7244, i32 0, i32 7
%.tmp7246 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7245
%.tmp7247 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7246, i32 0, i32 1
%.tmp7248 = load i8*, i8** %.tmp7247
%.tmp7249 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7250 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7249, i32 0, i32 1
%.tmp7251 = load i8*, i8** %.tmp7250
%.tmp7252 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7239, i8* %.tmp7241, i8* %.tmp7248, i8* %.tmp7251)
%.tmp7253 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7254 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7255 = load i8*, i8** %err_msg.7101
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp7253, %m980$.Node.type* %.tmp7254, i8* %.tmp7255)
%.tmp7256 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp7256
br label %.if.end.7238
.if.false.7238:
br label %.if.end.7238
.if.end.7238:
%.tmp7257 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7258 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7257, i32 0, i32 7
%.tmp7259 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7258
%.tmp7260 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7259, i32 0, i32 7
%.tmp7261 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7260
%.tmp7262 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7261, i32 0, i32 1
%.tmp7263 = load i8*, i8** %.tmp7262
%field_name.7264 = alloca i8*
store i8* %.tmp7263, i8** %field_name.7264
%field_id.7265 = alloca i32
store i32 0, i32* %field_id.7265
%.tmp7266 = bitcast ptr null to %m2693$.Type.type*
%found_field.7267 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp7266, %m2693$.Type.type** %found_field.7267
%.tmp7269 = load %m2693$.Type.type*, %m2693$.Type.type** %struct_info.7173
%.tmp7270 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7269, i32 0, i32 3
%.tmp7271 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7270
%field.7272 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp7271, %m2693$.Type.type** %field.7272
br label %.for.start.7268
.for.start.7268:
%.tmp7273 = load %m2693$.Type.type*, %m2693$.Type.type** %field.7272
%.tmp7274 = icmp ne %m2693$.Type.type* %.tmp7273, null
br i1 %.tmp7274, label %.for.continue.7268, label %.for.end.7268
.for.continue.7268:
%.tmp7275 = load %m2693$.Type.type*, %m2693$.Type.type** %field.7272
%.tmp7276 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7275, i32 0, i32 1
%.tmp7277 = load i8*, i8** %.tmp7276
%.tmp7278 = load i8*, i8** %field_name.7264
%.tmp7279 = call i32(i8*,i8*) @strcmp(i8* %.tmp7277, i8* %.tmp7278)
%.tmp7280 = icmp eq i32 %.tmp7279, 0
br i1 %.tmp7280, label %.if.true.7281, label %.if.false.7281
.if.true.7281:
%.tmp7282 = load %m2693$.Type.type*, %m2693$.Type.type** %field.7272
store %m2693$.Type.type* %.tmp7282, %m2693$.Type.type** %found_field.7267
br label %.for.end.7268
br label %.if.end.7281
.if.false.7281:
%.tmp7283 = load i32, i32* %field_id.7265
%.tmp7284 = add i32 %.tmp7283, 1
store i32 %.tmp7284, i32* %field_id.7265
br label %.if.end.7281
.if.end.7281:
%.tmp7285 = load %m2693$.Type.type*, %m2693$.Type.type** %field.7272
%.tmp7286 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7285, i32 0, i32 4
%.tmp7287 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7286
store %m2693$.Type.type* %.tmp7287, %m2693$.Type.type** %field.7272
br label %.for.start.7268
.for.end.7268:
%.tmp7288 = load %m2693$.Type.type*, %m2693$.Type.type** %found_field.7267
%.tmp7289 = icmp eq %m2693$.Type.type* %.tmp7288, null
br i1 %.tmp7289, label %.if.true.7290, label %.if.false.7290
.if.true.7290:
%.tmp7291 = getelementptr i8*, i8** %err_msg.7101, i32 0
%.tmp7293 = getelementptr [34 x i8], [34 x i8]*@.str7292, i32 0, i32 0
%.tmp7294 = load i8*, i8** %field_name.7264
%.tmp7295 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7296 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7295, i32 0, i32 1
%.tmp7297 = load i8*, i8** %.tmp7296
%.tmp7298 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7291, i8* %.tmp7293, i8* %.tmp7294, i8* %.tmp7297)
%.tmp7299 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7300 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7301 = load i8*, i8** %err_msg.7101
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp7299, %m980$.Node.type* %.tmp7300, i8* %.tmp7301)
%.tmp7302 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp7302
br label %.if.end.7290
.if.false.7290:
br label %.if.end.7290
.if.end.7290:
%.tmp7303 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7304 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7303)
%new_info.7305 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp7304, %m2693$.AssignableInfo.type** %new_info.7305
%.tmp7306 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_info.7305
%.tmp7307 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7306, i32 0, i32 4
%.tmp7308 = load %m2693$.Type.type*, %m2693$.Type.type** %found_field.7267
store %m2693$.Type.type* %.tmp7308, %m2693$.Type.type** %.tmp7307
%.tmp7309 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7310 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_info.7305
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp7309, %m2693$.AssignableInfo.type* %.tmp7310)
%.tmp7311 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_info.7305
%.tmp7312 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7311, i32 0, i32 3
%.tmp7314 = getelementptr [9 x i8], [9 x i8]*@.str7313, i32 0, i32 0
store i8* %.tmp7314, i8** %.tmp7312
%.tmp7315 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7316 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base_var.7169
%.tmp7317 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7316, i32 0, i32 4
%.tmp7318 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7317
%.tmp7319 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp7315, %m2693$.Type.type* %.tmp7318)
%info_tr.7320 = alloca i8*
store i8* %.tmp7319, i8** %info_tr.7320
%.tmp7321 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7322 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp7321, i32 0, i32 1
%.tmp7323 = load %m0$.File.type*, %m0$.File.type** %.tmp7322
%.tmp7325 = getelementptr [46 x i8], [46 x i8]*@.str7324, i32 0, i32 0
%.tmp7326 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_info.7305
%.tmp7327 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7326)
%.tmp7328 = load i8*, i8** %info_tr.7320
%.tmp7329 = load i8*, i8** %info_tr.7320
%.tmp7330 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base_var.7169
%.tmp7331 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7330)
%.tmp7332 = load i32, i32* %field_id.7265
%.tmp7333 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7323, i8* %.tmp7325, i8* %.tmp7327, i8* %.tmp7328, i8* %.tmp7329, i8* %.tmp7331, i32 %.tmp7332)
%.tmp7334 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7335 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7336 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7335, i32 0, i32 7
%.tmp7337 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7336
%.tmp7338 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7337, i32 0, i32 7
%.tmp7339 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7338
%.tmp7340 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_info.7305
%.tmp7341 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,%m2693$.AssignableInfo.type*) @m295$get_dotted_name.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp7334, %m980$.Node.type* %.tmp7339, %m2693$.AssignableInfo.type* %.tmp7340)
ret %m2693$.AssignableInfo.type* %.tmp7341
br label %.if.end.7167
.if.false.7167:
%.tmp7342 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp7343 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7342, i32 0, i32 3
%.tmp7344 = load i8*, i8** %.tmp7343
%.tmp7346 = getelementptr [9 x i8], [9 x i8]*@.str7345, i32 0, i32 0
%.tmp7347 = call i32(i8*,i8*) @strcmp(i8* %.tmp7344, i8* %.tmp7346)
%.tmp7348 = icmp eq i32 %.tmp7347, 0
br i1 %.tmp7348, label %.if.true.7349, label %.if.false.7349
.if.true.7349:
%.tmp7350 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
ret %m2693$.AssignableInfo.type* %.tmp7350
br label %.if.end.7349
.if.false.7349:
br label %.if.end.7349
.if.end.7349:
br label %.if.end.7167
.if.end.7167:
br label %.if.end.7130
.if.end.7130:
%.tmp7351 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7352 = load %m980$.Node.type*, %m980$.Node.type** %dot_name_ptr
%.tmp7354 = getelementptr [43 x i8], [43 x i8]*@.str7353, i32 0, i32 0
%.tmp7355 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp7351, %m980$.Node.type* %.tmp7352, i8* %.tmp7354)
%.tmp7356 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
%.tmp7357 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7356, i32 0, i32 3
%.tmp7358 = load i8*, i8** %.tmp7357
%.tmp7359 = call i32(i8*,...) @printf(i8* %.tmp7355, i8* %.tmp7358)
%.tmp7360 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp7360
}
define %m2693$.AssignableInfo.type* @m295$compile_addr.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp7362 = getelementptr [1 x i8], [1 x i8]*@.str7361, i32 0, i32 0
%err_msg.7363 = alloca i8*
store i8* %.tmp7362, i8** %err_msg.7363
%.tmp7364 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%curr_node.7365 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7364, %m980$.Node.type** %curr_node.7365
%.tmp7366 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7365
%.tmp7367 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7366, i32 0, i32 0
%.tmp7368 = load i8*, i8** %.tmp7367
%.tmp7370 = getelementptr [17 x i8], [17 x i8]*@.str7369, i32 0, i32 0
%.tmp7371 = call i32(i8*,i8*) @strcmp(i8* %.tmp7368, i8* %.tmp7370)
%.tmp7372 = icmp eq i32 %.tmp7371, 0
%.tmp7373 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7365
%.tmp7374 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7373, i32 0, i32 0
%.tmp7375 = load i8*, i8** %.tmp7374
%.tmp7377 = getelementptr [16 x i8], [16 x i8]*@.str7376, i32 0, i32 0
%.tmp7378 = call i32(i8*,i8*) @strcmp(i8* %.tmp7375, i8* %.tmp7377)
%.tmp7379 = icmp eq i32 %.tmp7378, 0
%.tmp7380 = or i1 %.tmp7372, %.tmp7379
%.tmp7381 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7365
%.tmp7382 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7381, i32 0, i32 0
%.tmp7383 = load i8*, i8** %.tmp7382
%.tmp7385 = getelementptr [11 x i8], [11 x i8]*@.str7384, i32 0, i32 0
%.tmp7386 = call i32(i8*,i8*) @strcmp(i8* %.tmp7383, i8* %.tmp7385)
%.tmp7387 = icmp eq i32 %.tmp7386, 0
%.tmp7388 = or i1 %.tmp7380, %.tmp7387
br i1 %.tmp7388, label %.if.true.7389, label %.if.false.7389
.if.true.7389:
%.tmp7390 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7391 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp7392 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7391, i32 0, i32 6
%.tmp7393 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7392
%.tmp7394 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp7390, %m980$.Node.type* %.tmp7393)
ret %m2693$.AssignableInfo.type* %.tmp7394
br label %.if.end.7389
.if.false.7389:
br label %.if.end.7389
.if.end.7389:
%.tmp7395 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7365
%.tmp7396 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7395, i32 0, i32 0
%.tmp7397 = load i8*, i8** %.tmp7396
%.tmp7399 = getelementptr [12 x i8], [12 x i8]*@.str7398, i32 0, i32 0
%.tmp7400 = call i32(i8*,i8*) @strcmp(i8* %.tmp7397, i8* %.tmp7399)
%.tmp7401 = icmp ne i32 %.tmp7400, 0
br i1 %.tmp7401, label %.if.true.7402, label %.if.false.7402
.if.true.7402:
%.tmp7404 = getelementptr [92 x i8], [92 x i8]*@.str7403, i32 0, i32 0
%.tmp7405 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7365
%.tmp7406 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7405, i32 0, i32 0
%.tmp7407 = load i8*, i8** %.tmp7406
%.tmp7408 = call i32(i8*,...) @printf(i8* %.tmp7404, i8* %.tmp7407)
%.tmp7409 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp7410 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7409, i32 0, i32 6
%.tmp7411 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7410
store %m980$.Node.type* %.tmp7411, %m980$.Node.type** %curr_node.7365
br label %.if.end.7402
.if.false.7402:
br label %.if.end.7402
.if.end.7402:
%.tmp7412 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7365
%.tmp7413 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7412, i32 0, i32 6
%.tmp7414 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7413
%assignable_name.7415 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7414, %m980$.Node.type** %assignable_name.7415
%.tmp7416 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7417 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7418 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp7417, i32 0, i32 7
%.tmp7419 = load i8*, i8** %.tmp7418
%.tmp7420 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7415
%.tmp7421 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7420, i32 0, i32 6
%.tmp7422 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7421
%.tmp7423 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7422, i32 0, i32 1
%.tmp7424 = load i8*, i8** %.tmp7423
%.tmp7425 = call %m2693$.ScopeItem.type*(%m2693$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2693$.ScopeItem.typep.m2693$.CompilerCtx.typep.cp.cp(%m2693$.CompilerCtx.type* %.tmp7416, i8* %.tmp7419, i8* %.tmp7424)
%scope_info.7426 = alloca %m2693$.ScopeItem.type*
store %m2693$.ScopeItem.type* %.tmp7425, %m2693$.ScopeItem.type** %scope_info.7426
%.tmp7427 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %scope_info.7426
%.tmp7428 = icmp eq %m2693$.ScopeItem.type* %.tmp7427, null
br i1 %.tmp7428, label %.if.true.7429, label %.if.false.7429
.if.true.7429:
%.tmp7430 = getelementptr i8*, i8** %err_msg.7363, i32 0
%.tmp7432 = getelementptr [41 x i8], [41 x i8]*@.str7431, i32 0, i32 0
%.tmp7433 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7415
%.tmp7434 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7433, i32 0, i32 6
%.tmp7435 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7434
%.tmp7436 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7435, i32 0, i32 1
%.tmp7437 = load i8*, i8** %.tmp7436
%.tmp7438 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7430, i8* %.tmp7432, i8* %.tmp7437)
%.tmp7439 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7440 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7415
%.tmp7441 = load i8*, i8** %err_msg.7363
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp7439, %m980$.Node.type* %.tmp7440, i8* %.tmp7441)
%.tmp7442 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp7442
br label %.if.end.7429
.if.false.7429:
br label %.if.end.7429
.if.end.7429:
%.tmp7443 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %scope_info.7426
%.tmp7444 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp7443, i32 0, i32 1
%.tmp7445 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %.tmp7444
%info.7446 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp7445, %m2693$.AssignableInfo.type** %info.7446
%.tmp7447 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7446
%.tmp7448 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7447, i32 0, i32 3
%.tmp7449 = load i8*, i8** %.tmp7448
%.tmp7451 = getelementptr [7 x i8], [7 x i8]*@.str7450, i32 0, i32 0
%.tmp7452 = call i32(i8*,i8*) @strcmp(i8* %.tmp7449, i8* %.tmp7451)
%.tmp7453 = icmp eq i32 %.tmp7452, 0
br i1 %.tmp7453, label %.if.true.7454, label %.if.false.7454
.if.true.7454:
%.tmp7455 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7456 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7446
%.tmp7457 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7456)
%.tmp7458 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7415
%.tmp7459 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7458, i32 0, i32 6
%.tmp7460 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7459
%.tmp7461 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7460, i32 0, i32 7
%.tmp7462 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7461
%.tmp7463 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7462, i32 0, i32 7
%.tmp7464 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7463
%.tmp7465 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7464, i32 0, i32 1
%.tmp7466 = load i8*, i8** %.tmp7465
%.tmp7467 = call %m2693$.ScopeItem.type*(%m2693$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2693$.ScopeItem.typep.m2693$.CompilerCtx.typep.cp.cp(%m2693$.CompilerCtx.type* %.tmp7455, i8* %.tmp7457, i8* %.tmp7466)
store %m2693$.ScopeItem.type* %.tmp7467, %m2693$.ScopeItem.type** %scope_info.7426
%.tmp7468 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %scope_info.7426
%.tmp7469 = icmp eq %m2693$.ScopeItem.type* %.tmp7468, null
br i1 %.tmp7469, label %.if.true.7470, label %.if.false.7470
.if.true.7470:
%.tmp7471 = getelementptr i8*, i8** %err_msg.7363, i32 0
%.tmp7473 = getelementptr [31 x i8], [31 x i8]*@.str7472, i32 0, i32 0
%.tmp7474 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7415
%.tmp7475 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7474, i32 0, i32 6
%.tmp7476 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7475
%.tmp7477 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7476, i32 0, i32 7
%.tmp7478 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7477
%.tmp7479 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7478, i32 0, i32 7
%.tmp7480 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7479
%.tmp7481 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7480, i32 0, i32 1
%.tmp7482 = load i8*, i8** %.tmp7481
%.tmp7483 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7446
%.tmp7484 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7483)
%.tmp7485 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7471, i8* %.tmp7473, i8* %.tmp7482, i8* %.tmp7484)
%.tmp7486 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7487 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7365
%.tmp7488 = load i8*, i8** %err_msg.7363
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp7486, %m980$.Node.type* %.tmp7487, i8* %.tmp7488)
%.tmp7489 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp7489
br label %.if.end.7470
.if.false.7470:
br label %.if.end.7470
.if.end.7470:
%.tmp7490 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %scope_info.7426
%.tmp7491 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp7490, i32 0, i32 1
%.tmp7492 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %.tmp7491
store %m2693$.AssignableInfo.type* %.tmp7492, %m2693$.AssignableInfo.type** %info.7446
%.tmp7493 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7415
%.tmp7494 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7493, i32 0, i32 6
%.tmp7495 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7494
%.tmp7496 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7495, i32 0, i32 7
%.tmp7497 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7496
%.tmp7498 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7497, i32 0, i32 7
%.tmp7499 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7498
store %m980$.Node.type* %.tmp7499, %m980$.Node.type** %assignable_name.7415
br label %.if.end.7454
.if.false.7454:
%.tmp7500 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7415
%.tmp7501 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7500, i32 0, i32 6
%.tmp7502 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7501
store %m980$.Node.type* %.tmp7502, %m980$.Node.type** %assignable_name.7415
br label %.if.end.7454
.if.end.7454:
%.tmp7503 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7504 = load %m980$.Node.type*, %m980$.Node.type** %assignable_name.7415
%.tmp7505 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7446
%.tmp7506 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,%m2693$.AssignableInfo.type*) @m295$get_dotted_name.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp7503, %m980$.Node.type* %.tmp7504, %m2693$.AssignableInfo.type* %.tmp7505)
%base.7507 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp7506, %m2693$.AssignableInfo.type** %base.7507
%.tmp7509 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7365
%.tmp7510 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7509, i32 0, i32 6
%.tmp7511 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7510
%.tmp7512 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7511, i32 0, i32 7
%.tmp7513 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7512
%addr.7514 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7513, %m980$.Node.type** %addr.7514
br label %.for.start.7508
.for.start.7508:
%.tmp7515 = load %m980$.Node.type*, %m980$.Node.type** %addr.7514
%.tmp7516 = icmp ne %m980$.Node.type* %.tmp7515, null
br i1 %.tmp7516, label %.for.continue.7508, label %.for.end.7508
.for.continue.7508:
%.tmp7517 = load %m980$.Node.type*, %m980$.Node.type** %addr.7514
%.tmp7518 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7517, i32 0, i32 7
%.tmp7519 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7518
%index.7520 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7519, %m980$.Node.type** %index.7520
%.tmp7521 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7522 = load %m980$.Node.type*, %m980$.Node.type** %index.7520
%.tmp7523 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_assignable.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp7521, %m980$.Node.type* %.tmp7522)
%index_info.7524 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp7523, %m2693$.AssignableInfo.type** %index_info.7524
%.tmp7525 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7526 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %index_info.7524
%.tmp7527 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7526, i32 0, i32 4
%.tmp7528 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7527
%.tmp7529 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp7525, %m2693$.Type.type* %.tmp7528)
%index_type.7530 = alloca i8*
store i8* %.tmp7529, i8** %index_type.7530
%.tmp7531 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base.7507
%.tmp7532 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7531, i32 0, i32 4
%.tmp7533 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7532
%.tmp7534 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7533, i32 0, i32 1
%.tmp7535 = load i8*, i8** %.tmp7534
%.tmp7536 = icmp ne i8* %.tmp7535, null
br i1 %.tmp7536, label %.if.true.7537, label %.if.false.7537
.if.true.7537:
%.tmp7538 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base.7507
%.tmp7539 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7538, i32 0, i32 4
%.tmp7540 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7539
%.tmp7541 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7540, i32 0, i32 1
%.tmp7542 = load i8*, i8** %.tmp7541
%.tmp7544 = getelementptr [6 x i8], [6 x i8]*@.str7543, i32 0, i32 0
%.tmp7545 = call i32(i8*,i8*) @strcmp(i8* %.tmp7542, i8* %.tmp7544)
%.tmp7546 = icmp eq i32 %.tmp7545, 0
br i1 %.tmp7546, label %.if.true.7547, label %.if.false.7547
.if.true.7547:
%.tmp7548 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7365
%.tmp7549 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7548)
%new_base.7550 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp7549, %m2693$.AssignableInfo.type** %new_base.7550
%.tmp7551 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7552 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7550
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp7551, %m2693$.AssignableInfo.type* %.tmp7552)
%.tmp7553 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7554 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp7553, i32 0, i32 1
%.tmp7555 = load %m0$.File.type*, %m0$.File.type** %.tmp7554
%.tmp7557 = getelementptr [45 x i8], [45 x i8]*@.str7556, i32 0, i32 0
%.tmp7558 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7550
%.tmp7559 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7558)
%.tmp7560 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7561 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base.7507
%.tmp7562 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7561, i32 0, i32 4
%.tmp7563 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7562
%.tmp7564 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp7560, %m2693$.Type.type* %.tmp7563)
%.tmp7565 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7566 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base.7507
%.tmp7567 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7566, i32 0, i32 4
%.tmp7568 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7567
%.tmp7569 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp7565, %m2693$.Type.type* %.tmp7568)
%.tmp7570 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base.7507
%.tmp7571 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7570)
%.tmp7572 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7555, i8* %.tmp7557, i8* %.tmp7559, i8* %.tmp7564, i8* %.tmp7569, i8* %.tmp7571)
%.tmp7573 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7550
%.tmp7574 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7573, i32 0, i32 4
%.tmp7575 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base.7507
%.tmp7576 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7575, i32 0, i32 4
%.tmp7577 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7576
%.tmp7578 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7577, i32 0, i32 3
%.tmp7579 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7578
%.tmp7580 = call %m2693$.Type.type*(%m2693$.Type.type*) @m295$type_clone.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.tmp7579)
store %m2693$.Type.type* %.tmp7580, %m2693$.Type.type** %.tmp7574
%.tmp7581 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7550
%.tmp7582 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7581, i32 0, i32 4
%.tmp7583 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7582
%.tmp7584 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7583, i32 0, i32 4
store %m2693$.Type.type* null, %m2693$.Type.type** %.tmp7584
%.tmp7585 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7550
store %m2693$.AssignableInfo.type* %.tmp7585, %m2693$.AssignableInfo.type** %base.7507
br label %.if.end.7547
.if.false.7547:
br label %.if.end.7547
.if.end.7547:
br label %.if.end.7537
.if.false.7537:
br label %.if.end.7537
.if.end.7537:
%.tmp7586 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7587 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base.7507
%.tmp7588 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7587, i32 0, i32 4
%.tmp7589 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7588
%.tmp7590 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp7586, %m2693$.Type.type* %.tmp7589)
%base_type.7591 = alloca i8*
store i8* %.tmp7590, i8** %base_type.7591
%.tmp7592 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7593 = call i32(%m2693$.CompilerCtx.type*) @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp7592)
%tmp_id.7594 = alloca i32
store i32 %.tmp7593, i32* %tmp_id.7594
%.tmp7595 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7596 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp7595, i32 0, i32 1
%.tmp7597 = load %m0$.File.type*, %m0$.File.type** %.tmp7596
%.tmp7599 = getelementptr [28 x i8], [28 x i8]*@.str7598, i32 0, i32 0
%.tmp7600 = load i32, i32* %tmp_id.7594
%.tmp7601 = load i8*, i8** %base_type.7591
%.tmp7602 = load i8*, i8** %base_type.7591
%.tmp7603 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base.7507
%.tmp7604 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7603)
%.tmp7605 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7597, i8* %.tmp7599, i32 %.tmp7600, i8* %.tmp7601, i8* %.tmp7602, i8* %.tmp7604)
%.tmp7606 = load %m980$.Node.type*, %m980$.Node.type** %curr_node.7365
%.tmp7607 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7606)
%new_base.7608 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp7607, %m2693$.AssignableInfo.type** %new_base.7608
%.tmp7609 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7610 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7608
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp7609, %m2693$.AssignableInfo.type* %.tmp7610)
%.tmp7611 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base.7507
%.tmp7612 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7611, i32 0, i32 4
%.tmp7613 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7612
%.tmp7614 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7613, i32 0, i32 3
%.tmp7615 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7614
%.tmp7616 = icmp eq %m2693$.Type.type* %.tmp7615, null
br i1 %.tmp7616, label %.if.true.7617, label %.if.false.7617
.if.true.7617:
%.tmp7618 = getelementptr i8*, i8** %err_msg.7363, i32 0
%.tmp7620 = getelementptr [35 x i8], [35 x i8]*@.str7619, i32 0, i32 0
%.tmp7621 = load i8*, i8** %base_type.7591
%.tmp7622 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7618, i8* %.tmp7620, i8* %.tmp7621)
%.tmp7623 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7624 = load %m980$.Node.type*, %m980$.Node.type** %addr.7514
%.tmp7625 = load i8*, i8** %err_msg.7363
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp7623, %m980$.Node.type* %.tmp7624, i8* %.tmp7625)
%.tmp7626 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp7626
br label %.if.end.7617
.if.false.7617:
br label %.if.end.7617
.if.end.7617:
%.tmp7627 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7608
%.tmp7628 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7627, i32 0, i32 4
%.tmp7629 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base.7507
%.tmp7630 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7629, i32 0, i32 4
%.tmp7631 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7630
%.tmp7632 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7631, i32 0, i32 3
%.tmp7633 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7632
store %m2693$.Type.type* %.tmp7633, %m2693$.Type.type** %.tmp7628
%.tmp7634 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7635 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7608
%.tmp7636 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7635, i32 0, i32 4
%.tmp7637 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7636
%.tmp7638 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp7634, %m2693$.Type.type* %.tmp7637)
%base_type_2.7639 = alloca i8*
store i8* %.tmp7638, i8** %base_type_2.7639
%.tmp7640 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7641 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp7640, i32 0, i32 1
%.tmp7642 = load %m0$.File.type*, %m0$.File.type** %.tmp7641
%.tmp7644 = getelementptr [44 x i8], [44 x i8]*@.str7643, i32 0, i32 0
%.tmp7645 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7608
%.tmp7646 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7645)
%.tmp7647 = load i8*, i8** %base_type_2.7639
%.tmp7648 = load i8*, i8** %base_type_2.7639
%.tmp7649 = load i32, i32* %tmp_id.7594
%.tmp7650 = load i8*, i8** %index_type.7530
%.tmp7651 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %index_info.7524
%.tmp7652 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7651)
%.tmp7653 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7642, i8* %.tmp7644, i8* %.tmp7646, i8* %.tmp7647, i8* %.tmp7648, i32 %.tmp7649, i8* %.tmp7650, i8* %.tmp7652)
%.tmp7654 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %new_base.7608
store %m2693$.AssignableInfo.type* %.tmp7654, %m2693$.AssignableInfo.type** %base.7507
%.tmp7655 = load %m980$.Node.type*, %m980$.Node.type** %addr.7514
%.tmp7656 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7655, i32 0, i32 7
%.tmp7657 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7656
%.tmp7658 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7657, i32 0, i32 7
%.tmp7659 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7658
%.tmp7660 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7659, i32 0, i32 7
%.tmp7661 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7660
store %m980$.Node.type* %.tmp7661, %m980$.Node.type** %addr.7514
br label %.for.start.7508
.for.end.7508:
%.tmp7662 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %base.7507
ret %m2693$.AssignableInfo.type* %.tmp7662
}
%m295$.StackHead.type = type {%m2448$.SYStack.type*}
define %m2693$.AssignableInfo.type* @m295$compile_assignable.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%curr_node = alloca %m980$.Node.type*
store %m980$.Node.type* %.curr_node.arg, %m980$.Node.type** %curr_node
%.tmp7663 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp7664 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7663, i32 0, i32 6
%.tmp7665 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7664
%.tmp7667 = getelementptr [16 x i8], [16 x i8]*@.str7666, i32 0, i32 0
%.tmp7668 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp7665, i8* %.tmp7667)
%assignable_start.7669 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7668, %m980$.Node.type** %assignable_start.7669
%.tmp7670 = load %m980$.Node.type*, %m980$.Node.type** %assignable_start.7669
%.tmp7671 = call %m2448$.SYStack.type*(%m980$.Node.type*) @m2448$sy_algorithm.m2448$.SYStack.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7670)
%operator_stack.7672 = alloca %m2448$.SYStack.type*
store %m2448$.SYStack.type* %.tmp7671, %m2448$.SYStack.type** %operator_stack.7672
%.tmp7673 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* null, i32 1
%.tmp7674 = ptrtoint %m295$.StackHead.type* %.tmp7673 to i32
%.tmp7675 = call i8*(i32) @malloc(i32 %.tmp7674)
%.tmp7676 = bitcast i8* %.tmp7675 to %m295$.StackHead.type*
%stack.7677 = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.tmp7676, %m295$.StackHead.type** %stack.7677
%.tmp7678 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7677
%.tmp7679 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7678, i32 0, i32 0
%.tmp7680 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %operator_stack.7672
store %m2448$.SYStack.type* %.tmp7680, %m2448$.SYStack.type** %.tmp7679
%.tmp7681 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7682 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7677
%.tmp7683 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m295$.StackHead.typep(%m2693$.CompilerCtx.type* %.tmp7681, %m295$.StackHead.type* %.tmp7682)
%info.7684 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp7683, %m2693$.AssignableInfo.type** %info.7684
%.tmp7685 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7684
%.tmp7686 = icmp eq %m2693$.AssignableInfo.type* %.tmp7685, null
br i1 %.tmp7686, label %.if.true.7687, label %.if.false.7687
.if.true.7687:
%.tmp7688 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7684
ret %m2693$.AssignableInfo.type* %.tmp7688
br label %.if.end.7687
.if.false.7687:
br label %.if.end.7687
.if.end.7687:
%.tmp7689 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp7690 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7689, i32 0, i32 6
%.tmp7691 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7690
%.tmp7693 = getelementptr [5 x i8], [5 x i8]*@.str7692, i32 0, i32 0
%.tmp7694 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp7691, i8* %.tmp7693)
%cast.7695 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7694, %m980$.Node.type** %cast.7695
%.tmp7696 = load %m980$.Node.type*, %m980$.Node.type** %cast.7695
%.tmp7697 = icmp ne %m980$.Node.type* %.tmp7696, null
br i1 %.tmp7697, label %.if.true.7698, label %.if.false.7698
.if.true.7698:
%.tmp7699 = load %m980$.Node.type*, %m980$.Node.type** %cast.7695
%.tmp7700 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7699, i32 0, i32 6
%.tmp7701 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7700
%.tmp7703 = getelementptr [5 x i8], [5 x i8]*@.str7702, i32 0, i32 0
%.tmp7704 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp7701, i8* %.tmp7703)
%cast_type.7705 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7704, %m980$.Node.type** %cast_type.7705
%.tmp7706 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7707 = load %m980$.Node.type*, %m980$.Node.type** %cast_type.7705
%.tmp7708 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7707, i32 0, i32 6
%.tmp7709 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7708
%.tmp7710 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp7706, %m980$.Node.type* %.tmp7709)
%type.7711 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp7710, %m2693$.Type.type** %type.7711
%.tmp7712 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7684
%.tmp7713 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7712)
%prev_id.7714 = alloca i8*
store i8* %.tmp7713, i8** %prev_id.7714
%.tmp7715 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7716 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7684
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp7715, %m2693$.AssignableInfo.type* %.tmp7716)
%.tmp7717 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7718 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7684
%.tmp7719 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7718, i32 0, i32 4
%.tmp7720 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7719
%.tmp7721 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp7717, %m2693$.Type.type* %.tmp7720)
%from_type.7722 = alloca i8*
store i8* %.tmp7721, i8** %from_type.7722
%.tmp7723 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7724 = load %m2693$.Type.type*, %m2693$.Type.type** %type.7711
%.tmp7725 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp7723, %m2693$.Type.type* %.tmp7724)
%to_type.7726 = alloca i8*
store i8* %.tmp7725, i8** %to_type.7726
%.tmp7728 = getelementptr [8 x i8], [8 x i8]*@.str7727, i32 0, i32 0
%cast_fn.7729 = alloca i8*
store i8* %.tmp7728, i8** %cast_fn.7729
%.tmp7730 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7684
%.tmp7731 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7730, i32 0, i32 4
%.tmp7732 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7731
%.tmp7733 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7732, i32 0, i32 1
%.tmp7734 = load i8*, i8** %.tmp7733
%.tmp7735 = icmp ne i8* %.tmp7734, null
br i1 %.tmp7735, label %.if.true.7736, label %.if.false.7736
.if.true.7736:
%.tmp7737 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7684
%.tmp7738 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7737, i32 0, i32 4
%.tmp7739 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7738
%.tmp7740 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7739, i32 0, i32 1
%.tmp7741 = load i8*, i8** %.tmp7740
%.tmp7743 = getelementptr [6 x i8], [6 x i8]*@.str7742, i32 0, i32 0
%.tmp7744 = call i32(i8*,i8*) @strcmp(i8* %.tmp7741, i8* %.tmp7743)
%.tmp7745 = icmp eq i32 %.tmp7744, 0
br i1 %.tmp7745, label %.if.true.7746, label %.if.false.7746
.if.true.7746:
%.tmp7748 = getelementptr [48 x i8], [48 x i8]*@.str7747, i32 0, i32 0
%.tmp7749 = call i32(i8*,...) @printf(i8* %.tmp7748)
br label %.if.end.7746
.if.false.7746:
br label %.if.end.7746
.if.end.7746:
br label %.if.end.7736
.if.false.7736:
br label %.if.end.7736
.if.end.7736:
%.tmp7750 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7684
%.tmp7751 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7750, i32 0, i32 4
%.tmp7752 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7751
%.tmp7753 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7752, i32 0, i32 0
%.tmp7754 = load i8*, i8** %.tmp7753
%.tmp7756 = getelementptr [4 x i8], [4 x i8]*@.str7755, i32 0, i32 0
%.tmp7757 = call i32(i8*,i8*) @strcmp(i8* %.tmp7754, i8* %.tmp7756)
%.tmp7758 = icmp ne i32 %.tmp7757, 0
%.tmp7759 = load %m2693$.Type.type*, %m2693$.Type.type** %type.7711
%.tmp7760 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp7759, i32 0, i32 0
%.tmp7761 = load i8*, i8** %.tmp7760
%.tmp7763 = getelementptr [4 x i8], [4 x i8]*@.str7762, i32 0, i32 0
%.tmp7764 = call i32(i8*,i8*) @strcmp(i8* %.tmp7761, i8* %.tmp7763)
%.tmp7765 = icmp ne i32 %.tmp7764, 0
%.tmp7766 = and i1 %.tmp7758, %.tmp7765
br i1 %.tmp7766, label %.if.true.7767, label %.if.false.7767
.if.true.7767:
%.tmp7768 = load i8*, i8** %from_type.7722
%.tmp7769 = getelementptr i8, i8* %.tmp7768, i32 0
%.tmp7770 = load i8, i8* %.tmp7769
%.tmp7771 = icmp eq i8 %.tmp7770, 105
%.tmp7772 = load i8*, i8** %to_type.7726
%.tmp7773 = getelementptr i8, i8* %.tmp7772, i32 0
%.tmp7774 = load i8, i8* %.tmp7773
%.tmp7775 = icmp eq i8 %.tmp7774, 105
%.tmp7776 = and i1 %.tmp7771, %.tmp7775
br i1 %.tmp7776, label %.if.true.7777, label %.if.false.7777
.if.true.7777:
%from_size.7778 = alloca i32
store i32 0, i32* %from_size.7778
%to_size.7779 = alloca i32
store i32 0, i32* %to_size.7779
%.tmp7780 = load i8*, i8** %from_type.7722
%.tmp7782 = getelementptr [4 x i8], [4 x i8]*@.str7781, i32 0, i32 0
%.tmp7783 = getelementptr i32, i32* %from_size.7778, i32 0
%.tmp7784 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7780, i8* %.tmp7782, i32* %.tmp7783)
%.tmp7785 = load i8*, i8** %to_type.7726
%.tmp7787 = getelementptr [4 x i8], [4 x i8]*@.str7786, i32 0, i32 0
%.tmp7788 = getelementptr i32, i32* %to_size.7779, i32 0
%.tmp7789 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7785, i8* %.tmp7787, i32* %.tmp7788)
%.tmp7790 = load i32, i32* %from_size.7778
%.tmp7791 = load i32, i32* %to_size.7779
%.tmp7792 = icmp slt i32 %.tmp7790, %.tmp7791
br i1 %.tmp7792, label %.if.true.7793, label %.if.false.7793
.if.true.7793:
%.tmp7795 = getelementptr [5 x i8], [5 x i8]*@.str7794, i32 0, i32 0
store i8* %.tmp7795, i8** %cast_fn.7729
br label %.if.end.7793
.if.false.7793:
%.tmp7797 = getelementptr [6 x i8], [6 x i8]*@.str7796, i32 0, i32 0
store i8* %.tmp7797, i8** %cast_fn.7729
br label %.if.end.7793
.if.end.7793:
br label %.if.end.7777
.if.false.7777:
br label %.if.end.7777
.if.end.7777:
br label %.if.end.7767
.if.false.7767:
br label %.if.end.7767
.if.end.7767:
%.tmp7798 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7799 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp7798, i32 0, i32 1
%.tmp7800 = load %m0$.File.type*, %m0$.File.type** %.tmp7799
%.tmp7802 = getelementptr [21 x i8], [21 x i8]*@.str7801, i32 0, i32 0
%.tmp7803 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7684
%.tmp7804 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7803)
%.tmp7805 = load i8*, i8** %cast_fn.7729
%.tmp7806 = load i8*, i8** %from_type.7722
%.tmp7807 = load i8*, i8** %prev_id.7714
%.tmp7808 = load i8*, i8** %to_type.7726
%.tmp7809 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7800, i8* %.tmp7802, i8* %.tmp7804, i8* %.tmp7805, i8* %.tmp7806, i8* %.tmp7807, i8* %.tmp7808)
%.tmp7810 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7684
%.tmp7811 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7810, i32 0, i32 4
%.tmp7812 = load %m2693$.Type.type*, %m2693$.Type.type** %type.7711
store %m2693$.Type.type* %.tmp7812, %m2693$.Type.type** %.tmp7811
br label %.if.end.7698
.if.false.7698:
br label %.if.end.7698
.if.end.7698:
%.tmp7813 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.7684
ret %m2693$.AssignableInfo.type* %.tmp7813
}
define %m2693$.AssignableInfo.type* @m295$compile_assignable_stack.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m295$.StackHead.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m295$.StackHead.type* %.stack.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stack = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.stack.arg, %m295$.StackHead.type** %stack
%.tmp7814 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7815 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7814, i32 0, i32 0
%.tmp7816 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %.tmp7815
%.tmp7817 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp7816, i32 0, i32 0
%.tmp7818 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7817
%.tmp7819 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7818, i32 0, i32 0
%.tmp7820 = load i8*, i8** %.tmp7819
%.tmp7822 = getelementptr [16 x i8], [16 x i8]*@.str7821, i32 0, i32 0
%.tmp7823 = call i32(i8*,i8*) @strcmp(i8* %.tmp7820, i8* %.tmp7822)
%.tmp7824 = icmp eq i32 %.tmp7823, 0
br i1 %.tmp7824, label %.if.true.7825, label %.if.false.7825
.if.true.7825:
%.tmp7826 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7827 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7828 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7827, i32 0, i32 0
%.tmp7829 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %.tmp7828
%.tmp7830 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp7829, i32 0, i32 0
%.tmp7831 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7830
%.tmp7832 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_mono_assignable.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp7826, %m980$.Node.type* %.tmp7831)
ret %m2693$.AssignableInfo.type* %.tmp7832
br label %.if.end.7825
.if.false.7825:
br label %.if.end.7825
.if.end.7825:
%.tmp7833 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7834 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7833, i32 0, i32 0
%.tmp7835 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %.tmp7834
%.tmp7836 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp7835, i32 0, i32 0
%.tmp7837 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7836
%.tmp7838 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7837, i32 0, i32 6
%.tmp7839 = load %m980$.Node.type*, %m980$.Node.type** %.tmp7838
%operator.7840 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp7839, %m980$.Node.type** %operator.7840
%.tmp7841 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7842 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7841, i32 0, i32 0
%.tmp7843 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7844 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7843, i32 0, i32 0
%.tmp7845 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %.tmp7844
%.tmp7846 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp7845, i32 0, i32 1
%.tmp7847 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %.tmp7846
store %m2448$.SYStack.type* %.tmp7847, %m2448$.SYStack.type** %.tmp7842
%.tmp7848 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7849 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7850 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m295$.StackHead.typep(%m2693$.CompilerCtx.type* %.tmp7848, %m295$.StackHead.type* %.tmp7849)
%A.7851 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp7850, %m2693$.AssignableInfo.type** %A.7851
%.tmp7852 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %A.7851
%.tmp7853 = icmp eq %m2693$.AssignableInfo.type* %.tmp7852, null
br i1 %.tmp7853, label %.if.true.7854, label %.if.false.7854
.if.true.7854:
%.tmp7855 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %A.7851
ret %m2693$.AssignableInfo.type* %.tmp7855
br label %.if.end.7854
.if.false.7854:
br label %.if.end.7854
.if.end.7854:
%.tmp7856 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7857 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7856, i32 0, i32 0
%.tmp7858 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7859 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7858, i32 0, i32 0
%.tmp7860 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %.tmp7859
%.tmp7861 = getelementptr %m2448$.SYStack.type, %m2448$.SYStack.type* %.tmp7860, i32 0, i32 1
%.tmp7862 = load %m2448$.SYStack.type*, %m2448$.SYStack.type** %.tmp7861
store %m2448$.SYStack.type* %.tmp7862, %m2448$.SYStack.type** %.tmp7857
%.tmp7863 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7864 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7865 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m295$.StackHead.typep(%m2693$.CompilerCtx.type* %.tmp7863, %m295$.StackHead.type* %.tmp7864)
%B.7866 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp7865, %m2693$.AssignableInfo.type** %B.7866
%.tmp7867 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %B.7866
%.tmp7868 = icmp eq %m2693$.AssignableInfo.type* %.tmp7867, null
br i1 %.tmp7868, label %.if.true.7869, label %.if.false.7869
.if.true.7869:
%.tmp7870 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %B.7866
ret %m2693$.AssignableInfo.type* %.tmp7870
br label %.if.end.7869
.if.false.7869:
br label %.if.end.7869
.if.end.7869:
%.tmp7871 = bitcast ptr null to %m980$.Node.type*
%.tmp7872 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7871)
%op_info.7873 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp7872, %m2693$.AssignableInfo.type** %op_info.7873
%.tmp7874 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %op_info.7873
%.tmp7875 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7874, i32 0, i32 4
%.tmp7876 = load %m980$.Node.type*, %m980$.Node.type** %operator.7840
%.tmp7877 = call %m2693$.Type.type*(%m980$.Node.type*) @m295$operator_type.m2693$.Type.typep.m980$.Node.typep(%m980$.Node.type* %.tmp7876)
store %m2693$.Type.type* %.tmp7877, %m2693$.Type.type** %.tmp7875
%.tmp7878 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7879 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %op_info.7873
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp7878, %m2693$.AssignableInfo.type* %.tmp7879)
%.tmp7880 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7881 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp7880, i32 0, i32 1
%.tmp7882 = load %m0$.File.type*, %m0$.File.type** %.tmp7881
%.tmp7884 = getelementptr [19 x i8], [19 x i8]*@.str7883, i32 0, i32 0
%.tmp7885 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %op_info.7873
%.tmp7886 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7885)
%.tmp7887 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7888 = load %m980$.Node.type*, %m980$.Node.type** %operator.7840
%.tmp7889 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$operator_op.cp.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp7887, %m980$.Node.type* %.tmp7888)
%.tmp7890 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7891 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %A.7851
%.tmp7892 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp7891, i32 0, i32 4
%.tmp7893 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp7892
%.tmp7894 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp7890, %m2693$.Type.type* %.tmp7893)
%.tmp7895 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %A.7851
%.tmp7896 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7895)
%.tmp7897 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %B.7866
%.tmp7898 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp7897)
%.tmp7899 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7882, i8* %.tmp7884, i8* %.tmp7886, i8* %.tmp7889, i8* %.tmp7894, i8* %.tmp7896, i8* %.tmp7898)
%.tmp7900 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %op_info.7873
ret %m2693$.AssignableInfo.type* %.tmp7900
}
define i8* @m295$operator_op.cp.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.op.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%op = alloca %m980$.Node.type*
store %m980$.Node.type* %.op.arg, %m980$.Node.type** %op
%.tmp7901 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7902 = icmp eq %m980$.Node.type* %.tmp7901, null
br i1 %.tmp7902, label %.if.true.7903, label %.if.false.7903
.if.true.7903:
%.tmp7904 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp7905 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7907 = getelementptr [31 x i8], [31 x i8]*@.str7906, i32 0, i32 0
%.tmp7908 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp7904, %m980$.Node.type* %.tmp7905, i8* %.tmp7907)
%.tmp7909 = call i32(i8*,...) @printf(i8* %.tmp7908)
br label %.if.end.7903
.if.false.7903:
br label %.if.end.7903
.if.end.7903:
%.tmp7910 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7911 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7910, i32 0, i32 1
%.tmp7912 = load i8*, i8** %.tmp7911
%.tmp7914 = getelementptr [2 x i8], [2 x i8]*@.str7913, i32 0, i32 0
%.tmp7915 = call i32(i8*,i8*) @strcmp(i8* %.tmp7912, i8* %.tmp7914)
%.tmp7916 = icmp eq i32 %.tmp7915, 0
br i1 %.tmp7916, label %.if.true.7917, label %.if.false.7917
.if.true.7917:
%.tmp7919 = getelementptr [4 x i8], [4 x i8]*@.str7918, i32 0, i32 0
ret i8* %.tmp7919
br label %.if.end.7917
.if.false.7917:
%.tmp7920 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7921 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7920, i32 0, i32 1
%.tmp7922 = load i8*, i8** %.tmp7921
%.tmp7924 = getelementptr [2 x i8], [2 x i8]*@.str7923, i32 0, i32 0
%.tmp7925 = call i32(i8*,i8*) @strcmp(i8* %.tmp7922, i8* %.tmp7924)
%.tmp7926 = icmp eq i32 %.tmp7925, 0
br i1 %.tmp7926, label %.if.true.7927, label %.if.false.7927
.if.true.7927:
%.tmp7929 = getelementptr [4 x i8], [4 x i8]*@.str7928, i32 0, i32 0
ret i8* %.tmp7929
br label %.if.end.7927
.if.false.7927:
%.tmp7930 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7931 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7930, i32 0, i32 1
%.tmp7932 = load i8*, i8** %.tmp7931
%.tmp7934 = getelementptr [2 x i8], [2 x i8]*@.str7933, i32 0, i32 0
%.tmp7935 = call i32(i8*,i8*) @strcmp(i8* %.tmp7932, i8* %.tmp7934)
%.tmp7936 = icmp eq i32 %.tmp7935, 0
br i1 %.tmp7936, label %.if.true.7937, label %.if.false.7937
.if.true.7937:
%.tmp7939 = getelementptr [4 x i8], [4 x i8]*@.str7938, i32 0, i32 0
ret i8* %.tmp7939
br label %.if.end.7937
.if.false.7937:
%.tmp7940 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7941 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7940, i32 0, i32 1
%.tmp7942 = load i8*, i8** %.tmp7941
%.tmp7944 = getelementptr [2 x i8], [2 x i8]*@.str7943, i32 0, i32 0
%.tmp7945 = call i32(i8*,i8*) @strcmp(i8* %.tmp7942, i8* %.tmp7944)
%.tmp7946 = icmp eq i32 %.tmp7945, 0
br i1 %.tmp7946, label %.if.true.7947, label %.if.false.7947
.if.true.7947:
%.tmp7949 = getelementptr [5 x i8], [5 x i8]*@.str7948, i32 0, i32 0
ret i8* %.tmp7949
br label %.if.end.7947
.if.false.7947:
%.tmp7950 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7951 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7950, i32 0, i32 1
%.tmp7952 = load i8*, i8** %.tmp7951
%.tmp7954 = getelementptr [3 x i8], [3 x i8]*@.str7953, i32 0, i32 0
%.tmp7955 = call i32(i8*,i8*) @strcmp(i8* %.tmp7952, i8* %.tmp7954)
%.tmp7956 = icmp eq i32 %.tmp7955, 0
br i1 %.tmp7956, label %.if.true.7957, label %.if.false.7957
.if.true.7957:
%.tmp7959 = getelementptr [8 x i8], [8 x i8]*@.str7958, i32 0, i32 0
ret i8* %.tmp7959
br label %.if.end.7957
.if.false.7957:
%.tmp7960 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7961 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7960, i32 0, i32 1
%.tmp7962 = load i8*, i8** %.tmp7961
%.tmp7964 = getelementptr [3 x i8], [3 x i8]*@.str7963, i32 0, i32 0
%.tmp7965 = call i32(i8*,i8*) @strcmp(i8* %.tmp7962, i8* %.tmp7964)
%.tmp7966 = icmp eq i32 %.tmp7965, 0
br i1 %.tmp7966, label %.if.true.7967, label %.if.false.7967
.if.true.7967:
%.tmp7969 = getelementptr [8 x i8], [8 x i8]*@.str7968, i32 0, i32 0
ret i8* %.tmp7969
br label %.if.end.7967
.if.false.7967:
%.tmp7970 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7971 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7970, i32 0, i32 1
%.tmp7972 = load i8*, i8** %.tmp7971
%.tmp7974 = getelementptr [2 x i8], [2 x i8]*@.str7973, i32 0, i32 0
%.tmp7975 = call i32(i8*,i8*) @strcmp(i8* %.tmp7972, i8* %.tmp7974)
%.tmp7976 = icmp eq i32 %.tmp7975, 0
br i1 %.tmp7976, label %.if.true.7977, label %.if.false.7977
.if.true.7977:
%.tmp7979 = getelementptr [9 x i8], [9 x i8]*@.str7978, i32 0, i32 0
ret i8* %.tmp7979
br label %.if.end.7977
.if.false.7977:
%.tmp7980 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7981 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7980, i32 0, i32 1
%.tmp7982 = load i8*, i8** %.tmp7981
%.tmp7984 = getelementptr [2 x i8], [2 x i8]*@.str7983, i32 0, i32 0
%.tmp7985 = call i32(i8*,i8*) @strcmp(i8* %.tmp7982, i8* %.tmp7984)
%.tmp7986 = icmp eq i32 %.tmp7985, 0
br i1 %.tmp7986, label %.if.true.7987, label %.if.false.7987
.if.true.7987:
%.tmp7989 = getelementptr [9 x i8], [9 x i8]*@.str7988, i32 0, i32 0
ret i8* %.tmp7989
br label %.if.end.7987
.if.false.7987:
%.tmp7990 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp7991 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp7990, i32 0, i32 1
%.tmp7992 = load i8*, i8** %.tmp7991
%.tmp7994 = getelementptr [2 x i8], [2 x i8]*@.str7993, i32 0, i32 0
%.tmp7995 = call i32(i8*,i8*) @strcmp(i8* %.tmp7992, i8* %.tmp7994)
%.tmp7996 = icmp eq i32 %.tmp7995, 0
br i1 %.tmp7996, label %.if.true.7997, label %.if.false.7997
.if.true.7997:
%.tmp7999 = getelementptr [4 x i8], [4 x i8]*@.str7998, i32 0, i32 0
ret i8* %.tmp7999
br label %.if.end.7997
.if.false.7997:
%.tmp8000 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8001 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8000, i32 0, i32 1
%.tmp8002 = load i8*, i8** %.tmp8001
%.tmp8004 = getelementptr [2 x i8], [2 x i8]*@.str8003, i32 0, i32 0
%.tmp8005 = call i32(i8*,i8*) @strcmp(i8* %.tmp8002, i8* %.tmp8004)
%.tmp8006 = icmp eq i32 %.tmp8005, 0
br i1 %.tmp8006, label %.if.true.8007, label %.if.false.8007
.if.true.8007:
%.tmp8009 = getelementptr [3 x i8], [3 x i8]*@.str8008, i32 0, i32 0
ret i8* %.tmp8009
br label %.if.end.8007
.if.false.8007:
%.tmp8010 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8011 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8010, i32 0, i32 1
%.tmp8012 = load i8*, i8** %.tmp8011
%.tmp8014 = getelementptr [3 x i8], [3 x i8]*@.str8013, i32 0, i32 0
%.tmp8015 = call i32(i8*,i8*) @strcmp(i8* %.tmp8012, i8* %.tmp8014)
%.tmp8016 = icmp eq i32 %.tmp8015, 0
br i1 %.tmp8016, label %.if.true.8017, label %.if.false.8017
.if.true.8017:
%.tmp8019 = getelementptr [9 x i8], [9 x i8]*@.str8018, i32 0, i32 0
ret i8* %.tmp8019
br label %.if.end.8017
.if.false.8017:
%.tmp8020 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8021 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8020, i32 0, i32 1
%.tmp8022 = load i8*, i8** %.tmp8021
%.tmp8024 = getelementptr [3 x i8], [3 x i8]*@.str8023, i32 0, i32 0
%.tmp8025 = call i32(i8*,i8*) @strcmp(i8* %.tmp8022, i8* %.tmp8024)
%.tmp8026 = icmp eq i32 %.tmp8025, 0
br i1 %.tmp8026, label %.if.true.8027, label %.if.false.8027
.if.true.8027:
%.tmp8029 = getelementptr [9 x i8], [9 x i8]*@.str8028, i32 0, i32 0
ret i8* %.tmp8029
br label %.if.end.8027
.if.false.8027:
%.tmp8030 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8031 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8030, i32 0, i32 1
%.tmp8032 = load i8*, i8** %.tmp8031
%.tmp8034 = getelementptr [2 x i8], [2 x i8]*@.str8033, i32 0, i32 0
%.tmp8035 = call i32(i8*,i8*) @strcmp(i8* %.tmp8032, i8* %.tmp8034)
%.tmp8036 = icmp eq i32 %.tmp8035, 0
br i1 %.tmp8036, label %.if.true.8037, label %.if.false.8037
.if.true.8037:
%.tmp8039 = getelementptr [5 x i8], [5 x i8]*@.str8038, i32 0, i32 0
ret i8* %.tmp8039
br label %.if.end.8037
.if.false.8037:
%.tmp8040 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8041 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8043 = getelementptr [30 x i8], [30 x i8]*@.str8042, i32 0, i32 0
%.tmp8044 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp8040, %m980$.Node.type* %.tmp8041, i8* %.tmp8043)
%.tmp8045 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8046 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8045, i32 0, i32 1
%.tmp8047 = load i8*, i8** %.tmp8046
%.tmp8048 = call i32(i8*,...) @printf(i8* %.tmp8044, i8* %.tmp8047)
br label %.if.end.8037
.if.end.8037:
br label %.if.end.8027
.if.end.8027:
br label %.if.end.8017
.if.end.8017:
br label %.if.end.8007
.if.end.8007:
br label %.if.end.7997
.if.end.7997:
br label %.if.end.7987
.if.end.7987:
br label %.if.end.7977
.if.end.7977:
br label %.if.end.7967
.if.end.7967:
br label %.if.end.7957
.if.end.7957:
br label %.if.end.7947
.if.end.7947:
br label %.if.end.7937
.if.end.7937:
br label %.if.end.7927
.if.end.7927:
br label %.if.end.7917
.if.end.7917:
%.tmp8050 = getelementptr [4 x i8], [4 x i8]*@.str8049, i32 0, i32 0
ret i8* %.tmp8050
}
define %m2693$.Type.type* @m295$operator_type.m2693$.Type.typep.m980$.Node.typep(%m980$.Node.type* %.op.arg) {
%op = alloca %m980$.Node.type*
store %m980$.Node.type* %.op.arg, %m980$.Node.type** %op
%.tmp8051 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%type.8052 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp8051, %m2693$.Type.type** %type.8052
%.tmp8053 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8054 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8053, i32 0, i32 1
%.tmp8055 = load i8*, i8** %.tmp8054
%.tmp8057 = getelementptr [3 x i8], [3 x i8]*@.str8056, i32 0, i32 0
%.tmp8058 = call i32(i8*,i8*) @strcmp(i8* %.tmp8055, i8* %.tmp8057)
%.tmp8059 = icmp eq i32 %.tmp8058, 0
%.tmp8060 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8061 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8060, i32 0, i32 1
%.tmp8062 = load i8*, i8** %.tmp8061
%.tmp8064 = getelementptr [3 x i8], [3 x i8]*@.str8063, i32 0, i32 0
%.tmp8065 = call i32(i8*,i8*) @strcmp(i8* %.tmp8062, i8* %.tmp8064)
%.tmp8066 = icmp eq i32 %.tmp8065, 0
%.tmp8067 = or i1 %.tmp8059, %.tmp8066
%.tmp8068 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8069 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8068, i32 0, i32 1
%.tmp8070 = load i8*, i8** %.tmp8069
%.tmp8072 = getelementptr [2 x i8], [2 x i8]*@.str8071, i32 0, i32 0
%.tmp8073 = call i32(i8*,i8*) @strcmp(i8* %.tmp8070, i8* %.tmp8072)
%.tmp8074 = icmp eq i32 %.tmp8073, 0
%.tmp8075 = or i1 %.tmp8067, %.tmp8074
%.tmp8076 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8077 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8076, i32 0, i32 1
%.tmp8078 = load i8*, i8** %.tmp8077
%.tmp8080 = getelementptr [2 x i8], [2 x i8]*@.str8079, i32 0, i32 0
%.tmp8081 = call i32(i8*,i8*) @strcmp(i8* %.tmp8078, i8* %.tmp8080)
%.tmp8082 = icmp eq i32 %.tmp8081, 0
%.tmp8083 = or i1 %.tmp8075, %.tmp8082
%.tmp8084 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8085 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8084, i32 0, i32 1
%.tmp8086 = load i8*, i8** %.tmp8085
%.tmp8088 = getelementptr [2 x i8], [2 x i8]*@.str8087, i32 0, i32 0
%.tmp8089 = call i32(i8*,i8*) @strcmp(i8* %.tmp8086, i8* %.tmp8088)
%.tmp8090 = icmp eq i32 %.tmp8089, 0
%.tmp8091 = or i1 %.tmp8083, %.tmp8090
%.tmp8092 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8093 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8092, i32 0, i32 1
%.tmp8094 = load i8*, i8** %.tmp8093
%.tmp8096 = getelementptr [2 x i8], [2 x i8]*@.str8095, i32 0, i32 0
%.tmp8097 = call i32(i8*,i8*) @strcmp(i8* %.tmp8094, i8* %.tmp8096)
%.tmp8098 = icmp eq i32 %.tmp8097, 0
%.tmp8099 = or i1 %.tmp8091, %.tmp8098
%.tmp8100 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8101 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8100, i32 0, i32 1
%.tmp8102 = load i8*, i8** %.tmp8101
%.tmp8104 = getelementptr [3 x i8], [3 x i8]*@.str8103, i32 0, i32 0
%.tmp8105 = call i32(i8*,i8*) @strcmp(i8* %.tmp8102, i8* %.tmp8104)
%.tmp8106 = icmp eq i32 %.tmp8105, 0
%.tmp8107 = or i1 %.tmp8099, %.tmp8106
%.tmp8108 = load %m980$.Node.type*, %m980$.Node.type** %op
%.tmp8109 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8108, i32 0, i32 1
%.tmp8110 = load i8*, i8** %.tmp8109
%.tmp8112 = getelementptr [3 x i8], [3 x i8]*@.str8111, i32 0, i32 0
%.tmp8113 = call i32(i8*,i8*) @strcmp(i8* %.tmp8110, i8* %.tmp8112)
%.tmp8114 = icmp eq i32 %.tmp8113, 0
%.tmp8115 = or i1 %.tmp8107, %.tmp8114
br i1 %.tmp8115, label %.if.true.8116, label %.if.false.8116
.if.true.8116:
%.tmp8117 = load %m2693$.Type.type*, %m2693$.Type.type** %type.8052
%.tmp8118 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8117, i32 0, i32 0
%.tmp8120 = getelementptr [5 x i8], [5 x i8]*@.str8119, i32 0, i32 0
store i8* %.tmp8120, i8** %.tmp8118
br label %.if.end.8116
.if.false.8116:
%.tmp8121 = load %m2693$.Type.type*, %m2693$.Type.type** %type.8052
%.tmp8122 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8121, i32 0, i32 0
%.tmp8124 = getelementptr [4 x i8], [4 x i8]*@.str8123, i32 0, i32 0
store i8* %.tmp8124, i8** %.tmp8122
br label %.if.end.8116
.if.end.8116:
%.tmp8125 = load %m2693$.Type.type*, %m2693$.Type.type** %type.8052
ret %m2693$.Type.type* %.tmp8125
}
define %m2693$.AssignableInfo.type* @m295$compile_mono_assignable.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%curr_node = alloca %m980$.Node.type*
store %m980$.Node.type* %.curr_node.arg, %m980$.Node.type** %curr_node
%.tmp8126 = bitcast ptr null to %m2693$.AssignableInfo.type*
%assignable_info.8127 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp8126, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8128 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%mono.8129 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8128, %m980$.Node.type** %mono.8129
%.tmp8131 = getelementptr [1 x i8], [1 x i8]*@.str8130, i32 0, i32 0
%err_buf.8132 = alloca i8*
store i8* %.tmp8131, i8** %err_buf.8132
%.tmp8134 = getelementptr [1 x i8], [1 x i8]*@.str8133, i32 0, i32 0
%buf.8135 = alloca i8*
store i8* %.tmp8134, i8** %buf.8135
%.tmp8136 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8137 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8136, i32 0, i32 6
%.tmp8138 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8137
%.tmp8139 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8138, i32 0, i32 0
%.tmp8140 = load i8*, i8** %.tmp8139
%.tmp8142 = getelementptr [7 x i8], [7 x i8]*@.str8141, i32 0, i32 0
%.tmp8143 = call i32(i8*,i8*) @strcmp(i8* %.tmp8140, i8* %.tmp8142)
%.tmp8144 = icmp eq i32 %.tmp8143, 0
br i1 %.tmp8144, label %.if.true.8145, label %.if.false.8145
.if.true.8145:
%.tmp8146 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8147 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8146)
store %m2693$.AssignableInfo.type* %.tmp8147, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8148 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8149 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8148, i32 0, i32 4
%.tmp8150 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp8150, %m2693$.Type.type** %.tmp8149
%.tmp8151 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8152 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8151, i32 0, i32 4
%.tmp8153 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8152
%.tmp8154 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8153, i32 0, i32 0
%.tmp8156 = getelementptr [4 x i8], [4 x i8]*@.str8155, i32 0, i32 0
store i8* %.tmp8156, i8** %.tmp8154
%.tmp8157 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8158 = load i8, i8* @SCOPE_CONST
%.tmp8159 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8160 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8159, i32 0, i32 6
%.tmp8161 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8160
%.tmp8162 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8161, i32 0, i32 1
%.tmp8163 = load i8*, i8** %.tmp8162
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp8157, i8 %.tmp8158, i8* %.tmp8163)
br label %.if.end.8145
.if.false.8145:
%.tmp8164 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8165 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8164, i32 0, i32 6
%.tmp8166 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8165
%.tmp8167 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8166, i32 0, i32 0
%.tmp8168 = load i8*, i8** %.tmp8167
%.tmp8170 = getelementptr [5 x i8], [5 x i8]*@.str8169, i32 0, i32 0
%.tmp8171 = call i32(i8*,i8*) @strcmp(i8* %.tmp8168, i8* %.tmp8170)
%.tmp8172 = icmp eq i32 %.tmp8171, 0
br i1 %.tmp8172, label %.if.true.8173, label %.if.false.8173
.if.true.8173:
%.tmp8174 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8175 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8174, i32 0, i32 6
%.tmp8176 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8175
%.tmp8177 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8176, i32 0, i32 1
%.tmp8178 = load i8*, i8** %.tmp8177
%.tmp8180 = getelementptr [5 x i8], [5 x i8]*@.str8179, i32 0, i32 0
%.tmp8181 = call i32(i8*,i8*) @strcmp(i8* %.tmp8178, i8* %.tmp8180)
%.tmp8182 = icmp ne i32 %.tmp8181, 0
br i1 %.tmp8182, label %.if.true.8183, label %.if.false.8183
.if.true.8183:
%.tmp8184 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8185 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8187 = getelementptr [42 x i8], [42 x i8]*@.str8186, i32 0, i32 0
%.tmp8188 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp8184, %m980$.Node.type* %.tmp8185, i8* %.tmp8187)
%.tmp8189 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8190 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8189, i32 0, i32 6
%.tmp8191 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8190
%.tmp8192 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8191, i32 0, i32 1
%.tmp8193 = load i8*, i8** %.tmp8192
%.tmp8194 = call i32(i8*,...) @printf(i8* %.tmp8188, i8* %.tmp8193)
%.tmp8195 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp8195
br label %.if.end.8183
.if.false.8183:
br label %.if.end.8183
.if.end.8183:
%.tmp8196 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8197 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8196)
store %m2693$.AssignableInfo.type* %.tmp8197, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8198 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8199 = load i8, i8* @SCOPE_CONST
%.tmp8201 = getelementptr [5 x i8], [5 x i8]*@.str8200, i32 0, i32 0
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp8198, i8 %.tmp8199, i8* %.tmp8201)
%.tmp8202 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8203 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8202, i32 0, i32 4
%.tmp8204 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp8204, %m2693$.Type.type** %.tmp8203
%.tmp8205 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8206 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8205, i32 0, i32 4
%.tmp8207 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8206
%.tmp8208 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8207, i32 0, i32 0
%.tmp8210 = getelementptr [8 x i8], [8 x i8]*@.str8209, i32 0, i32 0
store i8* %.tmp8210, i8** %.tmp8208
br label %.if.end.8173
.if.false.8173:
%.tmp8211 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8212 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8211, i32 0, i32 6
%.tmp8213 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8212
%.tmp8214 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8213, i32 0, i32 0
%.tmp8215 = load i8*, i8** %.tmp8214
%.tmp8217 = getelementptr [17 x i8], [17 x i8]*@.str8216, i32 0, i32 0
%.tmp8218 = call i32(i8*,i8*) @strcmp(i8* %.tmp8215, i8* %.tmp8217)
%.tmp8219 = icmp eq i32 %.tmp8218, 0
br i1 %.tmp8219, label %.if.true.8220, label %.if.false.8220
.if.true.8220:
%.tmp8221 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8222 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8221)
store %m2693$.AssignableInfo.type* %.tmp8222, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8223 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8224 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8223, i32 0, i32 6
%.tmp8225 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8224
%.tmp8226 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8225, i32 0, i32 6
%.tmp8227 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8226
%.tmp8229 = getelementptr [12 x i8], [12 x i8]*@.str8228, i32 0, i32 0
%.tmp8230 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp8227, i8* %.tmp8229)
%dest.8231 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8230, %m980$.Node.type** %dest.8231
%.tmp8232 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8233 = load %m980$.Node.type*, %m980$.Node.type** %dest.8231
%.tmp8234 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_addr.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp8232, %m980$.Node.type* %.tmp8233)
%var_info.8235 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp8234, %m2693$.AssignableInfo.type** %var_info.8235
%.tmp8236 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %var_info.8235
%.tmp8237 = icmp eq %m2693$.AssignableInfo.type* %.tmp8236, null
br i1 %.tmp8237, label %.if.true.8238, label %.if.false.8238
.if.true.8238:
%.tmp8239 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp8239
br label %.if.end.8238
.if.false.8238:
br label %.if.end.8238
.if.end.8238:
%.tmp8240 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %var_info.8235
%.tmp8241 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8240, i32 0, i32 4
%.tmp8242 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8241
%.tmp8243 = icmp eq %m2693$.Type.type* %.tmp8242, null
br i1 %.tmp8243, label %.if.true.8244, label %.if.false.8244
.if.true.8244:
%.tmp8245 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp8245
br label %.if.end.8244
.if.false.8244:
br label %.if.end.8244
.if.end.8244:
%.tmp8246 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8247 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %var_info.8235
%.tmp8248 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8247, i32 0, i32 4
%.tmp8249 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8248
%.tmp8250 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp8246, %m2693$.Type.type* %.tmp8249)
%var_type_repr.8251 = alloca i8*
store i8* %.tmp8250, i8** %var_type_repr.8251
%.tmp8252 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8253 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp8252, %m2693$.AssignableInfo.type* %.tmp8253)
%.tmp8254 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8255 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8254, i32 0, i32 4
%.tmp8256 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %var_info.8235
%.tmp8257 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8256, i32 0, i32 4
%.tmp8258 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8257
store %m2693$.Type.type* %.tmp8258, %m2693$.Type.type** %.tmp8255
%.tmp8260 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8261 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8260, i32 0, i32 6
%.tmp8262 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8261
%.tmp8263 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8262, i32 0, i32 6
%.tmp8264 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8263
%ptr.8265 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8264, %m980$.Node.type** %ptr.8265
br label %.for.start.8259
.for.start.8259:
%.tmp8266 = load %m980$.Node.type*, %m980$.Node.type** %ptr.8265
%.tmp8267 = load %m980$.Node.type*, %m980$.Node.type** %dest.8231
%.tmp8268 = icmp ne %m980$.Node.type* %.tmp8266, %.tmp8267
br i1 %.tmp8268, label %.for.continue.8259, label %.for.end.8259
.for.continue.8259:
%.tmp8269 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%type.8270 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp8269, %m2693$.Type.type** %type.8270
%.tmp8271 = load %m2693$.Type.type*, %m2693$.Type.type** %type.8270
%.tmp8272 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8271, i32 0, i32 3
%.tmp8273 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8274 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8273, i32 0, i32 4
%.tmp8275 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8274
store %m2693$.Type.type* %.tmp8275, %m2693$.Type.type** %.tmp8272
%.tmp8276 = load %m2693$.Type.type*, %m2693$.Type.type** %type.8270
%.tmp8277 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8276, i32 0, i32 0
%.tmp8279 = getelementptr [4 x i8], [4 x i8]*@.str8278, i32 0, i32 0
store i8* %.tmp8279, i8** %.tmp8277
%.tmp8280 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8281 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8280, i32 0, i32 4
%.tmp8282 = load %m2693$.Type.type*, %m2693$.Type.type** %type.8270
store %m2693$.Type.type* %.tmp8282, %m2693$.Type.type** %.tmp8281
%.tmp8283 = load %m980$.Node.type*, %m980$.Node.type** %ptr.8265
%.tmp8284 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8283, i32 0, i32 7
%.tmp8285 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8284
store %m980$.Node.type* %.tmp8285, %m980$.Node.type** %ptr.8265
br label %.for.start.8259
.for.end.8259:
%.tmp8286 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8287 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8286, i32 0, i32 6
%.tmp8288 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8287
%.tmp8289 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8288, i32 0, i32 6
%.tmp8290 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8289
%.tmp8291 = load %m980$.Node.type*, %m980$.Node.type** %dest.8231
%.tmp8292 = icmp ne %m980$.Node.type* %.tmp8290, %.tmp8291
br i1 %.tmp8292, label %.if.true.8293, label %.if.false.8293
.if.true.8293:
%.tmp8294 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8295 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8294, i32 0, i32 1
%.tmp8296 = load %m0$.File.type*, %m0$.File.type** %.tmp8295
%.tmp8298 = getelementptr [38 x i8], [38 x i8]*@.str8297, i32 0, i32 0
%.tmp8299 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8300 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp8299)
%.tmp8301 = load i8*, i8** %var_type_repr.8251
%.tmp8302 = load i8*, i8** %var_type_repr.8251
%.tmp8303 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %var_info.8235
%.tmp8304 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp8303)
%.tmp8305 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8296, i8* %.tmp8298, i8* %.tmp8300, i8* %.tmp8301, i8* %.tmp8302, i8* %.tmp8304)
br label %.if.end.8293
.if.false.8293:
%.tmp8306 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8307 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8306, i32 0, i32 4
%.tmp8308 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8307
%.tmp8309 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8308, i32 0, i32 0
%.tmp8310 = load i8*, i8** %.tmp8309
%.tmp8312 = getelementptr [9 x i8], [9 x i8]*@.str8311, i32 0, i32 0
%.tmp8313 = call i32(i8*,i8*) @strcmp(i8* %.tmp8310, i8* %.tmp8312)
%.tmp8314 = icmp eq i32 %.tmp8313, 0
br i1 %.tmp8314, label %.if.true.8315, label %.if.false.8315
.if.true.8315:
%.tmp8316 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %var_info.8235
store %m2693$.AssignableInfo.type* %.tmp8316, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8317 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%type.8318 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp8317, %m2693$.Type.type** %type.8318
%.tmp8319 = load %m2693$.Type.type*, %m2693$.Type.type** %type.8318
%.tmp8320 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8319, i32 0, i32 3
%.tmp8321 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8322 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8321, i32 0, i32 4
%.tmp8323 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8322
store %m2693$.Type.type* %.tmp8323, %m2693$.Type.type** %.tmp8320
%.tmp8324 = load %m2693$.Type.type*, %m2693$.Type.type** %type.8318
%.tmp8325 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8324, i32 0, i32 0
%.tmp8327 = getelementptr [4 x i8], [4 x i8]*@.str8326, i32 0, i32 0
store i8* %.tmp8327, i8** %.tmp8325
%.tmp8328 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8329 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8328, i32 0, i32 4
%.tmp8330 = load %m2693$.Type.type*, %m2693$.Type.type** %type.8318
store %m2693$.Type.type* %.tmp8330, %m2693$.Type.type** %.tmp8329
br label %.if.end.8315
.if.false.8315:
%.tmp8331 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8332 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8331, i32 0, i32 1
%.tmp8333 = load %m0$.File.type*, %m0$.File.type** %.tmp8332
%.tmp8335 = getelementptr [22 x i8], [22 x i8]*@.str8334, i32 0, i32 0
%.tmp8336 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8337 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp8336)
%.tmp8338 = load i8*, i8** %var_type_repr.8251
%.tmp8339 = load i8*, i8** %var_type_repr.8251
%.tmp8340 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %var_info.8235
%.tmp8341 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp8340)
%.tmp8342 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8333, i8* %.tmp8335, i8* %.tmp8337, i8* %.tmp8338, i8* %.tmp8339, i8* %.tmp8341)
br label %.if.end.8315
.if.end.8315:
br label %.if.end.8293
.if.end.8293:
br label %.if.end.8220
.if.false.8220:
%.tmp8343 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8344 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8343, i32 0, i32 6
%.tmp8345 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8344
%.tmp8346 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8345, i32 0, i32 0
%.tmp8347 = load i8*, i8** %.tmp8346
%.tmp8349 = getelementptr [8 x i8], [8 x i8]*@.str8348, i32 0, i32 0
%.tmp8350 = call i32(i8*,i8*) @strcmp(i8* %.tmp8347, i8* %.tmp8349)
%.tmp8351 = icmp eq i32 %.tmp8350, 0
br i1 %.tmp8351, label %.if.true.8352, label %.if.false.8352
.if.true.8352:
%.tmp8353 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8354 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8353)
store %m2693$.AssignableInfo.type* %.tmp8354, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8355 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8356 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8355, i32 0, i32 4
%.tmp8357 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp8357, %m2693$.Type.type** %.tmp8356
%.tmp8358 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8359 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8358, i32 0, i32 4
%.tmp8360 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8359
%.tmp8361 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8360, i32 0, i32 0
%.tmp8363 = getelementptr [5 x i8], [5 x i8]*@.str8362, i32 0, i32 0
store i8* %.tmp8363, i8** %.tmp8361
%.tmp8364 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8365 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8364, i32 0, i32 6
%.tmp8366 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8365
%.tmp8367 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8366, i32 0, i32 6
%.tmp8368 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8367
%.tmp8369 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8368, i32 0, i32 1
%.tmp8370 = load i8*, i8** %.tmp8369
%.tmp8372 = getelementptr [6 x i8], [6 x i8]*@.str8371, i32 0, i32 0
%.tmp8373 = call i32(i8*,i8*) @strcmp(i8* %.tmp8370, i8* %.tmp8372)
%.tmp8374 = icmp eq i32 %.tmp8373, 0
br i1 %.tmp8374, label %.if.true.8375, label %.if.false.8375
.if.true.8375:
%.tmp8376 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8377 = load i8, i8* @SCOPE_CONST
%.tmp8379 = getelementptr [2 x i8], [2 x i8]*@.str8378, i32 0, i32 0
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp8376, i8 %.tmp8377, i8* %.tmp8379)
br label %.if.end.8375
.if.false.8375:
%.tmp8380 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8381 = load i8, i8* @SCOPE_CONST
%.tmp8383 = getelementptr [2 x i8], [2 x i8]*@.str8382, i32 0, i32 0
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp8380, i8 %.tmp8381, i8* %.tmp8383)
br label %.if.end.8375
.if.end.8375:
br label %.if.end.8352
.if.false.8352:
%.tmp8384 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8385 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8384, i32 0, i32 6
%.tmp8386 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8385
%.tmp8387 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8386, i32 0, i32 0
%.tmp8388 = load i8*, i8** %.tmp8387
%.tmp8390 = getelementptr [8 x i8], [8 x i8]*@.str8389, i32 0, i32 0
%.tmp8391 = call i32(i8*,i8*) @strcmp(i8* %.tmp8388, i8* %.tmp8390)
%.tmp8392 = icmp eq i32 %.tmp8391, 0
br i1 %.tmp8392, label %.if.true.8393, label %.if.false.8393
.if.true.8393:
%.tmp8394 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8395 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8396 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8395, i32 0, i32 6
%.tmp8397 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8396
%.tmp8398 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8397, i32 0, i32 6
%.tmp8399 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8398
%.tmp8400 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$compile_fn_call.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp8394, %m980$.Node.type* %.tmp8399)
store %m2693$.AssignableInfo.type* %.tmp8400, %m2693$.AssignableInfo.type** %assignable_info.8127
br label %.if.end.8393
.if.false.8393:
%.tmp8401 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8402 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8401, i32 0, i32 6
%.tmp8403 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8402
%.tmp8404 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8403, i32 0, i32 0
%.tmp8405 = load i8*, i8** %.tmp8404
%.tmp8407 = getelementptr [7 x i8], [7 x i8]*@.str8406, i32 0, i32 0
%.tmp8408 = call i32(i8*,i8*) @strcmp(i8* %.tmp8405, i8* %.tmp8407)
%.tmp8409 = icmp eq i32 %.tmp8408, 0
br i1 %.tmp8409, label %.if.true.8410, label %.if.false.8410
.if.true.8410:
%.tmp8411 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8412 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8413 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8412, i32 0, i32 6
%.tmp8414 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8413
%.tmp8415 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8414, i32 0, i32 1
%.tmp8416 = load i8*, i8** %.tmp8415
%.tmp8417 = call %m2693$.AssignableInfo.type*(%m2693$.CompilerCtx.type*,i8*) @m295$define_string.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.tmp8411, i8* %.tmp8416)
%string_info.8418 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp8417, %m2693$.AssignableInfo.type** %string_info.8418
%.tmp8419 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8420 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8419)
store %m2693$.AssignableInfo.type* %.tmp8420, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8421 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8422 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
call void(%m2693$.CompilerCtx.type*,%m2693$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2693$.CompilerCtx.typep.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp8421, %m2693$.AssignableInfo.type* %.tmp8422)
%.tmp8423 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8424 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %string_info.8418
%.tmp8425 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8424, i32 0, i32 4
%.tmp8426 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8425
%.tmp8427 = call i8*(%m2693$.CompilerCtx.type*,%m2693$.Type.type*) @m2694$repr.cp.m2693$.CompilerCtx.typep.m2693$.Type.typep(%m2693$.CompilerCtx.type* %.tmp8423, %m2693$.Type.type* %.tmp8426)
%str_tr.8428 = alloca i8*
store i8* %.tmp8427, i8** %str_tr.8428
%.tmp8429 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8430 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8429, i32 0, i32 1
%.tmp8431 = load %m0$.File.type*, %m0$.File.type** %.tmp8430
%.tmp8433 = getelementptr [44 x i8], [44 x i8]*@.str8432, i32 0, i32 0
%.tmp8434 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8435 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp8434)
%.tmp8436 = load i8*, i8** %str_tr.8428
%.tmp8437 = load i8*, i8** %str_tr.8428
%.tmp8438 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %string_info.8418
%.tmp8439 = call i8*(%m2693$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2693$.AssignableInfo.typep(%m2693$.AssignableInfo.type* %.tmp8438)
%.tmp8440 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8431, i8* %.tmp8433, i8* %.tmp8435, i8* %.tmp8436, i8* %.tmp8437, i8* %.tmp8439)
%.tmp8441 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8442 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8441, i32 0, i32 4
%.tmp8443 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp8443, %m2693$.Type.type** %.tmp8442
%.tmp8444 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8445 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8444, i32 0, i32 4
%.tmp8446 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8445
%.tmp8447 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8446, i32 0, i32 0
%.tmp8449 = getelementptr [4 x i8], [4 x i8]*@.str8448, i32 0, i32 0
store i8* %.tmp8449, i8** %.tmp8447
%.tmp8450 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8451 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8450, i32 0, i32 4
%.tmp8452 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8451
%.tmp8453 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8452, i32 0, i32 3
%.tmp8454 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp8454, %m2693$.Type.type** %.tmp8453
%.tmp8455 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8456 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8455, i32 0, i32 4
%.tmp8457 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8456
%.tmp8458 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8457, i32 0, i32 3
%.tmp8459 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8458
%.tmp8460 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8459, i32 0, i32 0
%.tmp8462 = getelementptr [4 x i8], [4 x i8]*@.str8461, i32 0, i32 0
store i8* %.tmp8462, i8** %.tmp8460
br label %.if.end.8410
.if.false.8410:
%.tmp8463 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8464 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8463, i32 0, i32 6
%.tmp8465 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8464
%.tmp8466 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8465, i32 0, i32 0
%.tmp8467 = load i8*, i8** %.tmp8466
%.tmp8469 = getelementptr [4 x i8], [4 x i8]*@.str8468, i32 0, i32 0
%.tmp8470 = call i32(i8*,i8*) @strcmp(i8* %.tmp8467, i8* %.tmp8469)
%.tmp8471 = icmp eq i32 %.tmp8470, 0
br i1 %.tmp8471, label %.if.true.8472, label %.if.false.8472
.if.true.8472:
%.tmp8473 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8474 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8473)
store %m2693$.AssignableInfo.type* %.tmp8474, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8475 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8476 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8475, i32 0, i32 6
%.tmp8477 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8476
%.tmp8478 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8477, i32 0, i32 1
%.tmp8479 = load i8*, i8** %.tmp8478
%.tmp8480 = call i32(i8*) @strlen(i8* %.tmp8479)
%chr_len.8481 = alloca i32
store i32 %.tmp8480, i32* %chr_len.8481
%.tmp8482 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8483 = load i8, i8* @SCOPE_CONST
%.tmp8485 = getelementptr [2 x i8], [2 x i8]*@.str8484, i32 0, i32 0
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp8482, i8 %.tmp8483, i8* %.tmp8485)
%.tmp8486 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8487 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8486, i32 0, i32 0
%.tmp8488 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8489 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8488, i32 0, i32 6
%.tmp8490 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8489
%.tmp8491 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8490, i32 0, i32 1
%.tmp8492 = load i8*, i8** %.tmp8491
%.tmp8493 = call i8*(i8*) @m2247$chr_to_llvm.cp.cp(i8* %.tmp8492)
store i8* %.tmp8493, i8** %.tmp8487
%.tmp8494 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8495 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8494, i32 0, i32 0
%.tmp8496 = load i8*, i8** %.tmp8495
%.tmp8497 = icmp eq i8* %.tmp8496, null
br i1 %.tmp8497, label %.if.true.8498, label %.if.false.8498
.if.true.8498:
%.tmp8499 = getelementptr i8*, i8** %err_buf.8132, i32 0
%.tmp8501 = getelementptr [22 x i8], [22 x i8]*@.str8500, i32 0, i32 0
%.tmp8502 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8503 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8502, i32 0, i32 6
%.tmp8504 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8503
%.tmp8505 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8504, i32 0, i32 1
%.tmp8506 = load i8*, i8** %.tmp8505
%.tmp8507 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8499, i8* %.tmp8501, i8* %.tmp8506)
%.tmp8508 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp8508
br label %.if.end.8498
.if.false.8498:
br label %.if.end.8498
.if.end.8498:
%.tmp8509 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8510 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8509, i32 0, i32 4
%.tmp8511 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp8511, %m2693$.Type.type** %.tmp8510
%.tmp8512 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8513 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8512, i32 0, i32 4
%.tmp8514 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8513
%.tmp8515 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8514, i32 0, i32 0
%.tmp8517 = getelementptr [4 x i8], [4 x i8]*@.str8516, i32 0, i32 0
store i8* %.tmp8517, i8** %.tmp8515
br label %.if.end.8472
.if.false.8472:
%.tmp8518 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8519 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8521 = getelementptr [40 x i8], [40 x i8]*@.str8520, i32 0, i32 0
%.tmp8522 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp8518, %m980$.Node.type* %.tmp8519, i8* %.tmp8521)
%.tmp8523 = load %m980$.Node.type*, %m980$.Node.type** %mono.8129
%.tmp8524 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8523, i32 0, i32 6
%.tmp8525 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8524
%.tmp8526 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8525, i32 0, i32 0
%.tmp8527 = load i8*, i8** %.tmp8526
%.tmp8528 = call i32(i8*,...) @printf(i8* %.tmp8522, i8* %.tmp8527)
%.tmp8529 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp8529
br label %.if.end.8472
.if.end.8472:
br label %.if.end.8410
.if.end.8410:
br label %.if.end.8393
.if.end.8393:
br label %.if.end.8352
.if.end.8352:
br label %.if.end.8220
.if.end.8220:
br label %.if.end.8173
.if.end.8173:
br label %.if.end.8145
.if.end.8145:
%.tmp8530 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8531 = icmp eq %m2693$.AssignableInfo.type* %.tmp8530, null
br i1 %.tmp8531, label %.if.true.8532, label %.if.false.8532
.if.true.8532:
%.tmp8533 = bitcast ptr null to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp8533
br label %.if.end.8532
.if.false.8532:
br label %.if.end.8532
.if.end.8532:
%.tmp8534 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8535 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8534, i32 0, i32 5
%.tmp8536 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8537 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8536, i32 0, i32 3
%.tmp8538 = load i32, i32* %.tmp8537
store i32 %.tmp8538, i32* %.tmp8535
%.tmp8539 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8540 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8539, i32 0, i32 6
%.tmp8541 = load %m980$.Node.type*, %m980$.Node.type** %curr_node
%.tmp8542 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8541, i32 0, i32 4
%.tmp8543 = load i32, i32* %.tmp8542
store i32 %.tmp8543, i32* %.tmp8540
%.tmp8544 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %assignable_info.8127
%.tmp8545 = bitcast %m2693$.AssignableInfo.type* %.tmp8544 to %m2693$.AssignableInfo.type*
ret %m2693$.AssignableInfo.type* %.tmp8545
}
define i8* @m295$type_abbr.cp.m2693$.Type.typep(%m2693$.Type.type* %.type.arg) {
%type = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.type.arg, %m2693$.Type.type** %type
%.tmp8546 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8547 = icmp ne %m2693$.Type.type* %.tmp8546, null
%.tmp8549 = getelementptr [22 x i8], [22 x i8]*@.str8548, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8547, i8* %.tmp8549)
%.tmp8550 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8551 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8550, i32 0, i32 0
%.tmp8552 = load i8*, i8** %.tmp8551
%.tmp8553 = icmp ne i8* %.tmp8552, null
%.tmp8555 = getelementptr [59 x i8], [59 x i8]*@.str8554, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8553, i8* %.tmp8555)
%.tmp8556 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8557 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8556, i32 0, i32 0
%.tmp8558 = load i8*, i8** %.tmp8557
%.tmp8560 = getelementptr [4 x i8], [4 x i8]*@.str8559, i32 0, i32 0
%.tmp8561 = call i32(i8*,i8*) @strcmp(i8* %.tmp8558, i8* %.tmp8560)
%.tmp8562 = icmp eq i32 %.tmp8561, 0
br i1 %.tmp8562, label %.if.true.8563, label %.if.false.8563
.if.true.8563:
%.tmp8565 = getelementptr [2 x i8], [2 x i8]*@.str8564, i32 0, i32 0
ret i8* %.tmp8565
br label %.if.end.8563
.if.false.8563:
%.tmp8566 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8567 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8566, i32 0, i32 0
%.tmp8568 = load i8*, i8** %.tmp8567
%.tmp8570 = getelementptr [5 x i8], [5 x i8]*@.str8569, i32 0, i32 0
%.tmp8571 = call i32(i8*,i8*) @strcmp(i8* %.tmp8568, i8* %.tmp8570)
%.tmp8572 = icmp eq i32 %.tmp8571, 0
br i1 %.tmp8572, label %.if.true.8573, label %.if.false.8573
.if.true.8573:
%.tmp8575 = getelementptr [2 x i8], [2 x i8]*@.str8574, i32 0, i32 0
ret i8* %.tmp8575
br label %.if.end.8573
.if.false.8573:
%.tmp8576 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8577 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8576, i32 0, i32 0
%.tmp8578 = load i8*, i8** %.tmp8577
%.tmp8580 = getelementptr [5 x i8], [5 x i8]*@.str8579, i32 0, i32 0
%.tmp8581 = call i32(i8*,i8*) @strcmp(i8* %.tmp8578, i8* %.tmp8580)
%.tmp8582 = icmp eq i32 %.tmp8581, 0
br i1 %.tmp8582, label %.if.true.8583, label %.if.false.8583
.if.true.8583:
%.tmp8585 = getelementptr [2 x i8], [2 x i8]*@.str8584, i32 0, i32 0
ret i8* %.tmp8585
br label %.if.end.8583
.if.false.8583:
%.tmp8586 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8587 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8586, i32 0, i32 0
%.tmp8588 = load i8*, i8** %.tmp8587
%.tmp8590 = getelementptr [4 x i8], [4 x i8]*@.str8589, i32 0, i32 0
%.tmp8591 = call i32(i8*,i8*) @strcmp(i8* %.tmp8588, i8* %.tmp8590)
%.tmp8592 = icmp eq i32 %.tmp8591, 0
br i1 %.tmp8592, label %.if.true.8593, label %.if.false.8593
.if.true.8593:
%.tmp8595 = getelementptr [2 x i8], [2 x i8]*@.str8594, i32 0, i32 0
ret i8* %.tmp8595
br label %.if.end.8593
.if.false.8593:
%.tmp8596 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8597 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8596, i32 0, i32 0
%.tmp8598 = load i8*, i8** %.tmp8597
%.tmp8600 = getelementptr [4 x i8], [4 x i8]*@.str8599, i32 0, i32 0
%.tmp8601 = call i32(i8*,i8*) @strcmp(i8* %.tmp8598, i8* %.tmp8600)
%.tmp8602 = icmp eq i32 %.tmp8601, 0
br i1 %.tmp8602, label %.if.true.8603, label %.if.false.8603
.if.true.8603:
%.tmp8605 = getelementptr [1 x i8], [1 x i8]*@.str8604, i32 0, i32 0
%buf.8606 = alloca i8*
store i8* %.tmp8605, i8** %buf.8606
%.tmp8607 = getelementptr i8*, i8** %buf.8606, i32 0
%.tmp8609 = getelementptr [4 x i8], [4 x i8]*@.str8608, i32 0, i32 0
%.tmp8610 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8611 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8610, i32 0, i32 3
%.tmp8612 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8611
%.tmp8613 = call i8*(%m2693$.Type.type*) @m295$type_abbr.cp.m2693$.Type.typep(%m2693$.Type.type* %.tmp8612)
%.tmp8614 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8607, i8* %.tmp8609, i8* %.tmp8613)
%.tmp8615 = load i8*, i8** %buf.8606
ret i8* %.tmp8615
br label %.if.end.8603
.if.false.8603:
%.tmp8616 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8617 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8616, i32 0, i32 0
%.tmp8618 = load i8*, i8** %.tmp8617
%.tmp8620 = getelementptr [10 x i8], [10 x i8]*@.str8619, i32 0, i32 0
%.tmp8621 = call i32(i8*,i8*) @strcmp(i8* %.tmp8618, i8* %.tmp8620)
%.tmp8622 = icmp eq i32 %.tmp8621, 0
br i1 %.tmp8622, label %.if.true.8623, label %.if.false.8623
.if.true.8623:
%.tmp8624 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8625 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8624, i32 0, i32 2
%.tmp8626 = load i8*, i8** %.tmp8625
ret i8* %.tmp8626
br label %.if.end.8623
.if.false.8623:
%.tmp8627 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8628 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8627, i32 0, i32 0
%.tmp8629 = load i8*, i8** %.tmp8628
%.tmp8631 = getelementptr [7 x i8], [7 x i8]*@.str8630, i32 0, i32 0
%.tmp8632 = call i32(i8*,i8*) @strcmp(i8* %.tmp8629, i8* %.tmp8631)
%.tmp8633 = icmp eq i32 %.tmp8632, 0
br i1 %.tmp8633, label %.if.true.8634, label %.if.false.8634
.if.true.8634:
%.tmp8636 = getelementptr [2 x i8], [2 x i8]*@.str8635, i32 0, i32 0
%buf.8637 = alloca i8*
store i8* %.tmp8636, i8** %buf.8637
%.tmp8639 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8640 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8639, i32 0, i32 3
%.tmp8641 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8640
%t.8642 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp8641, %m2693$.Type.type** %t.8642
br label %.for.start.8638
.for.start.8638:
%.tmp8643 = load %m2693$.Type.type*, %m2693$.Type.type** %t.8642
%.tmp8644 = icmp ne %m2693$.Type.type* %.tmp8643, null
br i1 %.tmp8644, label %.for.continue.8638, label %.for.end.8638
.for.continue.8638:
%.tmp8645 = getelementptr i8*, i8** %buf.8637, i32 0
%.tmp8647 = getelementptr [5 x i8], [5 x i8]*@.str8646, i32 0, i32 0
%.tmp8648 = load i8*, i8** %buf.8637
%.tmp8649 = load %m2693$.Type.type*, %m2693$.Type.type** %t.8642
%.tmp8650 = call i8*(%m2693$.Type.type*) @m295$type_abbr.cp.m2693$.Type.typep(%m2693$.Type.type* %.tmp8649)
%.tmp8651 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8645, i8* %.tmp8647, i8* %.tmp8648, i8* %.tmp8650)
%.tmp8652 = load %m2693$.Type.type*, %m2693$.Type.type** %t.8642
%.tmp8653 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8652, i32 0, i32 4
%.tmp8654 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8653
store %m2693$.Type.type* %.tmp8654, %m2693$.Type.type** %t.8642
br label %.for.start.8638
.for.end.8638:
%.tmp8655 = load i8*, i8** %buf.8637
ret i8* %.tmp8655
br label %.if.end.8634
.if.false.8634:
%.tmp8656 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8657 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8656, i32 0, i32 0
%.tmp8658 = load i8*, i8** %.tmp8657
%.tmp8660 = getelementptr [9 x i8], [9 x i8]*@.str8659, i32 0, i32 0
%.tmp8661 = call i32(i8*,i8*) @strcmp(i8* %.tmp8658, i8* %.tmp8660)
%.tmp8662 = icmp eq i32 %.tmp8661, 0
br i1 %.tmp8662, label %.if.true.8663, label %.if.false.8663
.if.true.8663:
%.tmp8665 = getelementptr [2 x i8], [2 x i8]*@.str8664, i32 0, i32 0
ret i8* %.tmp8665
br label %.if.end.8663
.if.false.8663:
%.tmp8666 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8667 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8666, i32 0, i32 0
%.tmp8668 = load i8*, i8** %.tmp8667
%.tmp8670 = getelementptr [6 x i8], [6 x i8]*@.str8669, i32 0, i32 0
%.tmp8671 = call i32(i8*,i8*) @strcmp(i8* %.tmp8668, i8* %.tmp8670)
%.tmp8672 = icmp eq i32 %.tmp8671, 0
br i1 %.tmp8672, label %.if.true.8673, label %.if.false.8673
.if.true.8673:
%.tmp8675 = getelementptr [2 x i8], [2 x i8]*@.str8674, i32 0, i32 0
ret i8* %.tmp8675
br label %.if.end.8673
.if.false.8673:
%.tmp8677 = getelementptr [45 x i8], [45 x i8]*@.str8676, i32 0, i32 0
%.tmp8678 = load %m2693$.Type.type*, %m2693$.Type.type** %type
%.tmp8679 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8678, i32 0, i32 0
%.tmp8680 = load i8*, i8** %.tmp8679
%.tmp8681 = call i32(i8*,...) @printf(i8* %.tmp8677, i8* %.tmp8680)
br label %.if.end.8673
.if.end.8673:
br label %.if.end.8663
.if.end.8663:
br label %.if.end.8634
.if.end.8634:
br label %.if.end.8623
.if.end.8623:
br label %.if.end.8603
.if.end.8603:
br label %.if.end.8593
.if.end.8593:
br label %.if.end.8583
.if.end.8583:
br label %.if.end.8573
.if.end.8573:
br label %.if.end.8563
.if.end.8563:
%.tmp8682 = bitcast ptr null to i8*
ret i8* %.tmp8682
}
define %m2693$.AssignableInfo.type* @m295$define_string.m2693$.AssignableInfo.typep.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp8683 = bitcast ptr null to %m980$.Node.type*
%.tmp8684 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8683)
%info.8685 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp8684, %m2693$.AssignableInfo.type** %info.8685
%.tmp8687 = getelementptr [1 x i8], [1 x i8]*@.str8686, i32 0, i32 0
%tmp_buff.8688 = alloca i8*
store i8* %.tmp8687, i8** %tmp_buff.8688
%.tmp8689 = getelementptr i8*, i8** %tmp_buff.8688, i32 0
%.tmp8691 = getelementptr [7 x i8], [7 x i8]*@.str8690, i32 0, i32 0
%.tmp8692 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8693 = call i32(%m2693$.CompilerCtx.type*) @m295$new_uid.i.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.tmp8692)
%.tmp8694 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8689, i8* %.tmp8691, i32 %.tmp8693)
%.tmp8695 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.8685
%.tmp8696 = load i8, i8* @SCOPE_GLOBAL
%.tmp8697 = load i8*, i8** %tmp_buff.8688
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp8695, i8 %.tmp8696, i8* %.tmp8697)
%.tmp8698 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.8685
%.tmp8699 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8698, i32 0, i32 4
%.tmp8700 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp8700, %m2693$.Type.type** %.tmp8699
%.tmp8701 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.8685
%.tmp8702 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8701, i32 0, i32 4
%.tmp8703 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8702
%.tmp8704 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8703, i32 0, i32 0
%.tmp8706 = getelementptr [6 x i8], [6 x i8]*@.str8705, i32 0, i32 0
store i8* %.tmp8706, i8** %.tmp8704
%.tmp8707 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.8685
%.tmp8708 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8707, i32 0, i32 4
%.tmp8709 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8708
%.tmp8710 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8709, i32 0, i32 3
%.tmp8711 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp8711, %m2693$.Type.type** %.tmp8710
%.tmp8712 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.8685
%.tmp8713 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8712, i32 0, i32 4
%.tmp8714 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8713
%.tmp8715 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8714, i32 0, i32 3
%.tmp8716 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8715
%.tmp8717 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8716, i32 0, i32 0
%.tmp8719 = getelementptr [4 x i8], [4 x i8]*@.str8718, i32 0, i32 0
store i8* %.tmp8719, i8** %.tmp8717
%.tmp8720 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.8685
%.tmp8721 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8720, i32 0, i32 4
%.tmp8722 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8721
%.tmp8723 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8722, i32 0, i32 3
%.tmp8724 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8723
%.tmp8725 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8724, i32 0, i32 4
%.tmp8726 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp8726, %m2693$.Type.type** %.tmp8725
%.tmp8727 = load i8*, i8** %text
%.tmp8728 = call i8*(i8*) @m2247$string_to_llvm.cp.cp(i8* %.tmp8727)
%identifier.8729 = alloca i8*
store i8* %.tmp8728, i8** %identifier.8729
%.tmp8730 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.8685
%.tmp8731 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8730, i32 0, i32 4
%.tmp8732 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8731
%.tmp8733 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8732, i32 0, i32 3
%.tmp8734 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8733
%.tmp8735 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8734, i32 0, i32 4
%.tmp8736 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8735
%.tmp8737 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8736, i32 0, i32 0
%.tmp8738 = getelementptr i8*, i8** %.tmp8737, i32 0
%.tmp8740 = getelementptr [3 x i8], [3 x i8]*@.str8739, i32 0, i32 0
%.tmp8741 = load i8*, i8** %identifier.8729
%.tmp8742 = call i32(i8*) @m2247$llvm_str_len.i.cp(i8* %.tmp8741)
%.tmp8743 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8738, i8* %.tmp8740, i32 %.tmp8742)
%.tmp8744 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8745 = load i8*, i8** %identifier.8729
%.tmp8747 = getelementptr [7 x i8], [7 x i8]*@.str8746, i32 0, i32 0
%.tmp8748 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.8685
call void(%m2693$.CompilerCtx.type*,i8*,i8*,%m2693$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2693$.CompilerCtx.typep.cp.cp.m2693$.AssignableInfo.typep.b.b(%m2693$.CompilerCtx.type* %.tmp8744, i8* %.tmp8745, i8* %.tmp8747, %m2693$.AssignableInfo.type* %.tmp8748, i1 0, i1 0)
%.tmp8749 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.8685
ret %m2693$.AssignableInfo.type* %.tmp8749
}
define void @m295$define_global.v.m2693$.CompilerCtx.typep.cp.cp.m2693$.AssignableInfo.typep.b.b(%m2693$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg, i8* %.type.arg, %m2693$.AssignableInfo.type* %.info.arg, i1 %.weak.arg, i1 %.compiled.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%type = alloca i8*
store i8* %.type.arg, i8** %type
%info = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.info.arg, %m2693$.AssignableInfo.type** %info
%weak = alloca i1
store i1 %.weak.arg, i1* %weak
%compiled = alloca i1
store i1 %.compiled.arg, i1* %compiled
%.tmp8750 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* null, i32 1
%.tmp8751 = ptrtoint %m2693$.GlobalName.type* %.tmp8750 to i32
%.tmp8752 = call i8*(i32) @malloc(i32 %.tmp8751)
%.tmp8753 = bitcast i8* %.tmp8752 to %m2693$.GlobalName.type*
%global.8754 = alloca %m2693$.GlobalName.type*
store %m2693$.GlobalName.type* %.tmp8753, %m2693$.GlobalName.type** %global.8754
%.tmp8755 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %global.8754
%.tmp8756 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp8755, i32 0, i32 0
%.tmp8757 = load i8*, i8** %id
store i8* %.tmp8757, i8** %.tmp8756
%.tmp8758 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %global.8754
%.tmp8759 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp8758, i32 0, i32 1
%.tmp8760 = load i8*, i8** %type
store i8* %.tmp8760, i8** %.tmp8759
%.tmp8761 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %global.8754
%.tmp8762 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp8761, i32 0, i32 4
%.tmp8763 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info
store %m2693$.AssignableInfo.type* %.tmp8763, %m2693$.AssignableInfo.type** %.tmp8762
%.tmp8764 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %global.8754
%.tmp8765 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp8764, i32 0, i32 2
%.tmp8766 = load i1, i1* %compiled
store i1 %.tmp8766, i1* %.tmp8765
%.tmp8767 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %global.8754
%.tmp8768 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp8767, i32 0, i32 5
store %m2693$.GlobalName.type* null, %m2693$.GlobalName.type** %.tmp8768
%.tmp8769 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %global.8754
%.tmp8770 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp8769, i32 0, i32 3
%.tmp8771 = load i1, i1* %weak
store i1 %.tmp8771, i1* %.tmp8770
%.tmp8772 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8773 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %global.8754
call void(%m2693$.CompilerCtx.type*,%m2693$.GlobalName.type*) @m295$append_global.v.m2693$.CompilerCtx.typep.m2693$.GlobalName.typep(%m2693$.CompilerCtx.type* %.tmp8772, %m2693$.GlobalName.type* %.tmp8773)
ret void
}
define void @m295$define_module.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.cp(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%mod = alloca %m980$.Node.type*
store %m980$.Node.type* %.mod.arg, %m980$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp8774 = load %m980$.Node.type*, %m980$.Node.type** %mod
%.tmp8775 = call %m2693$.AssignableInfo.type*(%m980$.Node.type*) @m295$new_assignable_info.m2693$.AssignableInfo.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8774)
%info.8776 = alloca %m2693$.AssignableInfo.type*
store %m2693$.AssignableInfo.type* %.tmp8775, %m2693$.AssignableInfo.type** %info.8776
%.tmp8777 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.8776
%.tmp8778 = load i8, i8* @SCOPE_CONST
%.tmp8779 = load i8*, i8** %abspath
call void(%m2693$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2693$.AssignableInfo.typep.c.cp(%m2693$.AssignableInfo.type* %.tmp8777, i8 %.tmp8778, i8* %.tmp8779)
%.tmp8780 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.8776
%.tmp8781 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8780, i32 0, i32 3
%.tmp8783 = getelementptr [7 x i8], [7 x i8]*@.str8782, i32 0, i32 0
store i8* %.tmp8783, i8** %.tmp8781
%.tmp8784 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.8776
%.tmp8785 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8784, i32 0, i32 4
store %m2693$.Type.type* null, %m2693$.Type.type** %.tmp8785
%.tmp8786 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8787 = load %m980$.Node.type*, %m980$.Node.type** %mod
%.tmp8788 = load i8*, i8** %as_name
%.tmp8789 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %info.8776
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*,%m2693$.AssignableInfo.type*) @m295$define_assignable.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp.m2693$.AssignableInfo.typep(%m2693$.CompilerCtx.type* %.tmp8786, %m980$.Node.type* %.tmp8787, i8* %.tmp8788, %m2693$.AssignableInfo.type* %.tmp8789)
ret void
}
define void @m295$append_anon_fn.v.m2693$.CompilerCtx.typep.cp(%m2693$.CompilerCtx.type* %.ctx.arg, i8* %.code.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%code = alloca i8*
store i8* %.code.arg, i8** %code
%.tmp8790 = getelementptr %m2693$.AnonFn.type, %m2693$.AnonFn.type* null, i32 1
%.tmp8791 = ptrtoint %m2693$.AnonFn.type* %.tmp8790 to i32
%.tmp8792 = call i8*(i32) @malloc(i32 %.tmp8791)
%.tmp8793 = bitcast i8* %.tmp8792 to %m2693$.AnonFn.type*
%fn.8794 = alloca %m2693$.AnonFn.type*
store %m2693$.AnonFn.type* %.tmp8793, %m2693$.AnonFn.type** %fn.8794
%.tmp8795 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %fn.8794
%.tmp8796 = getelementptr %m2693$.AnonFn.type, %m2693$.AnonFn.type* %.tmp8795, i32 0, i32 0
%.tmp8797 = load i8*, i8** %code
store i8* %.tmp8797, i8** %.tmp8796
%.tmp8798 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8799 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8798, i32 0, i32 8
%.tmp8800 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %.tmp8799
%.tmp8801 = icmp eq %m2693$.AnonFn.type* %.tmp8800, null
br i1 %.tmp8801, label %.if.true.8802, label %.if.false.8802
.if.true.8802:
%.tmp8803 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8804 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8803, i32 0, i32 8
%.tmp8805 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %fn.8794
store %m2693$.AnonFn.type* %.tmp8805, %m2693$.AnonFn.type** %.tmp8804
%.tmp8806 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %fn.8794
%.tmp8807 = getelementptr %m2693$.AnonFn.type, %m2693$.AnonFn.type* %.tmp8806, i32 0, i32 1
store %m2693$.AnonFn.type* null, %m2693$.AnonFn.type** %.tmp8807
br label %.if.end.8802
.if.false.8802:
%.tmp8808 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8809 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8808, i32 0, i32 8
%.tmp8810 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %.tmp8809
%last.8811 = alloca %m2693$.AnonFn.type*
store %m2693$.AnonFn.type* %.tmp8810, %m2693$.AnonFn.type** %last.8811
br label %.for.start.8812
.for.start.8812:
%.tmp8813 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %last.8811
%.tmp8814 = getelementptr %m2693$.AnonFn.type, %m2693$.AnonFn.type* %.tmp8813, i32 0, i32 1
%.tmp8815 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %.tmp8814
%.tmp8816 = icmp ne %m2693$.AnonFn.type* %.tmp8815, null
br i1 %.tmp8816, label %.for.continue.8812, label %.for.end.8812
.for.continue.8812:
%.tmp8817 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %last.8811
%.tmp8818 = getelementptr %m2693$.AnonFn.type, %m2693$.AnonFn.type* %.tmp8817, i32 0, i32 1
%.tmp8819 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %.tmp8818
store %m2693$.AnonFn.type* %.tmp8819, %m2693$.AnonFn.type** %last.8811
br label %.for.start.8812
.for.end.8812:
%.tmp8820 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %last.8811
%.tmp8821 = getelementptr %m2693$.AnonFn.type, %m2693$.AnonFn.type* %.tmp8820, i32 0, i32 1
%.tmp8822 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %fn.8794
store %m2693$.AnonFn.type* %.tmp8822, %m2693$.AnonFn.type** %.tmp8821
br label %.if.end.8802
.if.end.8802:
ret void
}
define void @m295$compile_anon_fn.v.m2693$.CompilerCtx.typep(%m2693$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%.tmp8824 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8825 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8824, i32 0, i32 8
%.tmp8826 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %.tmp8825
%fn.8827 = alloca %m2693$.AnonFn.type*
store %m2693$.AnonFn.type* %.tmp8826, %m2693$.AnonFn.type** %fn.8827
br label %.for.start.8823
.for.start.8823:
%.tmp8828 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %fn.8827
%.tmp8829 = icmp ne %m2693$.AnonFn.type* %.tmp8828, null
br i1 %.tmp8829, label %.for.continue.8823, label %.for.end.8823
.for.continue.8823:
%.tmp8830 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8831 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8830, i32 0, i32 1
%.tmp8832 = load %m0$.File.type*, %m0$.File.type** %.tmp8831
%.tmp8834 = getelementptr [4 x i8], [4 x i8]*@.str8833, i32 0, i32 0
%.tmp8835 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %fn.8827
%.tmp8836 = getelementptr %m2693$.AnonFn.type, %m2693$.AnonFn.type* %.tmp8835, i32 0, i32 0
%.tmp8837 = load i8*, i8** %.tmp8836
%.tmp8838 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8832, i8* %.tmp8834, i8* %.tmp8837)
%.tmp8839 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %fn.8827
%.tmp8840 = getelementptr %m2693$.AnonFn.type, %m2693$.AnonFn.type* %.tmp8839, i32 0, i32 1
%.tmp8841 = load %m2693$.AnonFn.type*, %m2693$.AnonFn.type** %.tmp8840
store %m2693$.AnonFn.type* %.tmp8841, %m2693$.AnonFn.type** %fn.8827
br label %.for.start.8823
.for.end.8823:
%.tmp8842 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8843 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8842, i32 0, i32 8
store %m2693$.AnonFn.type* null, %m2693$.AnonFn.type** %.tmp8843
ret void
}
define void @m295$append_global.v.m2693$.CompilerCtx.typep.m2693$.GlobalName.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%g = alloca %m2693$.GlobalName.type*
store %m2693$.GlobalName.type* %.g.arg, %m2693$.GlobalName.type** %g
%.tmp8844 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8845 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8844, i32 0, i32 3
%.tmp8846 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %.tmp8845
%.tmp8847 = icmp eq %m2693$.GlobalName.type* %.tmp8846, null
br i1 %.tmp8847, label %.if.true.8848, label %.if.false.8848
.if.true.8848:
%.tmp8849 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8850 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8849, i32 0, i32 3
%.tmp8851 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g
store %m2693$.GlobalName.type* %.tmp8851, %m2693$.GlobalName.type** %.tmp8850
ret void
br label %.if.end.8848
.if.false.8848:
br label %.if.end.8848
.if.end.8848:
%.tmp8852 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8853 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8852, i32 0, i32 3
%.tmp8854 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %.tmp8853
%last_global.8855 = alloca %m2693$.GlobalName.type*
store %m2693$.GlobalName.type* %.tmp8854, %m2693$.GlobalName.type** %last_global.8855
%.tmp8857 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8858 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8857, i32 0, i32 3
%.tmp8859 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %.tmp8858
%curr_global.8860 = alloca %m2693$.GlobalName.type*
store %m2693$.GlobalName.type* %.tmp8859, %m2693$.GlobalName.type** %curr_global.8860
br label %.for.start.8856
.for.start.8856:
%.tmp8861 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %curr_global.8860
%.tmp8862 = icmp ne %m2693$.GlobalName.type* %.tmp8861, null
br i1 %.tmp8862, label %.for.continue.8856, label %.for.end.8856
.for.continue.8856:
%.tmp8863 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %curr_global.8860
%.tmp8864 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp8863, i32 0, i32 4
%.tmp8865 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %.tmp8864
%.tmp8866 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8865, i32 0, i32 0
%.tmp8867 = load i8*, i8** %.tmp8866
%.tmp8868 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g
%.tmp8869 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp8868, i32 0, i32 4
%.tmp8870 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %.tmp8869
%.tmp8871 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp8870, i32 0, i32 0
%.tmp8872 = load i8*, i8** %.tmp8871
%.tmp8873 = call i32(i8*,i8*) @strcmp(i8* %.tmp8867, i8* %.tmp8872)
%.tmp8874 = icmp eq i32 %.tmp8873, 0
br i1 %.tmp8874, label %.if.true.8875, label %.if.false.8875
.if.true.8875:
ret void
br label %.if.end.8875
.if.false.8875:
br label %.if.end.8875
.if.end.8875:
%.tmp8876 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %curr_global.8860
store %m2693$.GlobalName.type* %.tmp8876, %m2693$.GlobalName.type** %last_global.8855
%.tmp8877 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %curr_global.8860
%.tmp8878 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp8877, i32 0, i32 5
%.tmp8879 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %.tmp8878
store %m2693$.GlobalName.type* %.tmp8879, %m2693$.GlobalName.type** %curr_global.8860
br label %.for.start.8856
.for.end.8856:
%.tmp8880 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %last_global.8855
%.tmp8881 = getelementptr %m2693$.GlobalName.type, %m2693$.GlobalName.type* %.tmp8880, i32 0, i32 5
%.tmp8882 = load %m2693$.GlobalName.type*, %m2693$.GlobalName.type** %g
store %m2693$.GlobalName.type* %.tmp8882, %m2693$.GlobalName.type** %.tmp8881
ret void
}
define void @m295$append_error.v.m2693$.CompilerCtx.typep.m296$.Error.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m296$.Error.type* %.e.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp8883 = getelementptr %m2693$.ErrorList.type, %m2693$.ErrorList.type* null, i32 1
%.tmp8884 = ptrtoint %m2693$.ErrorList.type* %.tmp8883 to i32
%.tmp8885 = call i8*(i32) @malloc(i32 %.tmp8884)
%.tmp8886 = bitcast i8* %.tmp8885 to %m2693$.ErrorList.type*
%new_err.8887 = alloca %m2693$.ErrorList.type*
store %m2693$.ErrorList.type* %.tmp8886, %m2693$.ErrorList.type** %new_err.8887
%.tmp8888 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %new_err.8887
%.tmp8889 = getelementptr %m2693$.ErrorList.type, %m2693$.ErrorList.type* %.tmp8888, i32 0, i32 2
store i1 0, i1* %.tmp8889
%.tmp8890 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %new_err.8887
%.tmp8891 = getelementptr %m2693$.ErrorList.type, %m2693$.ErrorList.type* %.tmp8890, i32 0, i32 0
%.tmp8892 = load %m296$.Error.type*, %m296$.Error.type** %e
store %m296$.Error.type* %.tmp8892, %m296$.Error.type** %.tmp8891
%.tmp8893 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %new_err.8887
%.tmp8894 = getelementptr %m2693$.ErrorList.type, %m2693$.ErrorList.type* %.tmp8893, i32 0, i32 1
store %m2693$.ErrorList.type* null, %m2693$.ErrorList.type** %.tmp8894
%.tmp8895 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8896 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8895, i32 0, i32 2
%.tmp8897 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %.tmp8896
%.tmp8898 = icmp eq %m2693$.ErrorList.type* %.tmp8897, null
br i1 %.tmp8898, label %.if.true.8899, label %.if.false.8899
.if.true.8899:
%.tmp8900 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8901 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8900, i32 0, i32 2
%.tmp8902 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %new_err.8887
store %m2693$.ErrorList.type* %.tmp8902, %m2693$.ErrorList.type** %.tmp8901
ret void
br label %.if.end.8899
.if.false.8899:
br label %.if.end.8899
.if.end.8899:
%last.8903 = alloca %m2693$.ErrorList.type*
store %m2693$.ErrorList.type* null, %m2693$.ErrorList.type** %last.8903
%.tmp8905 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8906 = getelementptr %m2693$.CompilerCtx.type, %m2693$.CompilerCtx.type* %.tmp8905, i32 0, i32 2
%.tmp8907 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %.tmp8906
store %m2693$.ErrorList.type* %.tmp8907, %m2693$.ErrorList.type** %last.8903
br label %.for.start.8904
.for.start.8904:
%.tmp8908 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %last.8903
%.tmp8909 = getelementptr %m2693$.ErrorList.type, %m2693$.ErrorList.type* %.tmp8908, i32 0, i32 1
%.tmp8910 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %.tmp8909
%.tmp8911 = icmp ne %m2693$.ErrorList.type* %.tmp8910, null
br i1 %.tmp8911, label %.for.continue.8904, label %.for.end.8904
.for.continue.8904:
%.tmp8912 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %last.8903
%.tmp8913 = getelementptr %m2693$.ErrorList.type, %m2693$.ErrorList.type* %.tmp8912, i32 0, i32 1
%.tmp8914 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %.tmp8913
store %m2693$.ErrorList.type* %.tmp8914, %m2693$.ErrorList.type** %last.8903
br label %.for.start.8904
.for.end.8904:
%.tmp8915 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %last.8903
%.tmp8916 = getelementptr %m2693$.ErrorList.type, %m2693$.ErrorList.type* %.tmp8915, i32 0, i32 1
%.tmp8917 = load %m2693$.ErrorList.type*, %m2693$.ErrorList.type** %new_err.8887
store %m2693$.ErrorList.type* %.tmp8917, %m2693$.ErrorList.type** %.tmp8916
ret void
}
define i8* @m295$syn_function_name.cp.m980$.Node.typep(%m980$.Node.type* %.stmt.arg) {
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp8918 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp8919 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8918, i32 0, i32 6
%.tmp8920 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8919
%.tmp8921 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8920, i32 0, i32 7
%.tmp8922 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8921
%.tmp8923 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8922, i32 0, i32 1
%.tmp8924 = load i8*, i8** %.tmp8923
ret i8* %.tmp8924
}
define %m980$.Node.type* @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m980$.Node.type*
store %m980$.Node.type* %.node.arg, %m980$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp8926 = load %m980$.Node.type*, %m980$.Node.type** %node
%n.8927 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8926, %m980$.Node.type** %n.8927
br label %.for.start.8925
.for.start.8925:
%.tmp8928 = load %m980$.Node.type*, %m980$.Node.type** %n.8927
%.tmp8929 = icmp ne %m980$.Node.type* %.tmp8928, null
br i1 %.tmp8929, label %.for.continue.8925, label %.for.end.8925
.for.continue.8925:
%.tmp8930 = load %m980$.Node.type*, %m980$.Node.type** %n.8927
%.tmp8931 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8930, i32 0, i32 0
%.tmp8932 = load i8*, i8** %.tmp8931
%.tmp8933 = load i8*, i8** %type
%.tmp8934 = call i32(i8*,i8*) @strcmp(i8* %.tmp8932, i8* %.tmp8933)
%.tmp8935 = icmp eq i32 %.tmp8934, 0
br i1 %.tmp8935, label %.if.true.8936, label %.if.false.8936
.if.true.8936:
%.tmp8937 = load %m980$.Node.type*, %m980$.Node.type** %n.8927
ret %m980$.Node.type* %.tmp8937
br label %.if.end.8936
.if.false.8936:
br label %.if.end.8936
.if.end.8936:
%.tmp8938 = load %m980$.Node.type*, %m980$.Node.type** %n.8927
%.tmp8939 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8938, i32 0, i32 7
%.tmp8940 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8939
store %m980$.Node.type* %.tmp8940, %m980$.Node.type** %n.8927
br label %.for.start.8925
.for.end.8925:
%.tmp8941 = bitcast ptr null to %m980$.Node.type*
ret %m980$.Node.type* %.tmp8941
}
define %m2693$.Type.type* @m295$syn_function_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp8942 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%function_type.8943 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp8942, %m2693$.Type.type** %function_type.8943
%.tmp8944 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp8945 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp8946 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8945, i32 0, i32 6
%.tmp8947 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8946
%.tmp8948 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp8944, %m980$.Node.type* %.tmp8947)
%return_value_type.8949 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp8948, %m2693$.Type.type** %return_value_type.8949
%.tmp8950 = load %m2693$.Type.type*, %m2693$.Type.type** %function_type.8943
%.tmp8951 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8950, i32 0, i32 0
%.tmp8953 = getelementptr [9 x i8], [9 x i8]*@.str8952, i32 0, i32 0
store i8* %.tmp8953, i8** %.tmp8951
%.tmp8954 = load %m2693$.Type.type*, %m2693$.Type.type** %function_type.8943
%.tmp8955 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8954, i32 0, i32 3
%.tmp8956 = load %m2693$.Type.type*, %m2693$.Type.type** %return_value_type.8949
store %m2693$.Type.type* %.tmp8956, %m2693$.Type.type** %.tmp8955
%.tmp8957 = load %m2693$.Type.type*, %m2693$.Type.type** %return_value_type.8949
%last_type.8958 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp8957, %m2693$.Type.type** %last_type.8958
%.tmp8959 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp8960 = call %m980$.Node.type*(%m980$.Node.type*) @m295$syn_function_params.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.tmp8959)
%params.8961 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8960, %m980$.Node.type** %params.8961
%.tmp8963 = load %m980$.Node.type*, %m980$.Node.type** %params.8961
%param_ptr.8964 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp8963, %m980$.Node.type** %param_ptr.8964
br label %.for.start.8962
.for.start.8962:
%.tmp8965 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8964
%.tmp8966 = icmp ne %m980$.Node.type* %.tmp8965, null
br i1 %.tmp8966, label %.for.continue.8962, label %.for.end.8962
.for.continue.8962:
%.tmp8967 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8964
%.tmp8968 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8967, i32 0, i32 0
%.tmp8969 = load i8*, i8** %.tmp8968
%.tmp8971 = getelementptr [5 x i8], [5 x i8]*@.str8970, i32 0, i32 0
%.tmp8972 = call i32(i8*,i8*) @strcmp(i8* %.tmp8969, i8* %.tmp8971)
%.tmp8973 = icmp eq i32 %.tmp8972, 0
br i1 %.tmp8973, label %.if.true.8974, label %.if.false.8974
.if.true.8974:
%.tmp8975 = load %m2693$.Type.type*, %m2693$.Type.type** %last_type.8958
%.tmp8976 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8975, i32 0, i32 4
%.tmp8977 = load %m2693$.Type.type*, %m2693$.Type.type** %last_type.8958
%.tmp8978 = call %m2693$.Type.type*(%m2693$.Type.type*) @m295$type_clone.m2693$.Type.typep.m2693$.Type.typep(%m2693$.Type.type* %.tmp8977)
store %m2693$.Type.type* %.tmp8978, %m2693$.Type.type** %.tmp8976
%.tmp8979 = load %m2693$.Type.type*, %m2693$.Type.type** %last_type.8958
%.tmp8980 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8979, i32 0, i32 4
%.tmp8981 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8980
%.tmp8982 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8981, i32 0, i32 4
store %m2693$.Type.type* null, %m2693$.Type.type** %.tmp8982
%.tmp8983 = load %m2693$.Type.type*, %m2693$.Type.type** %last_type.8958
%.tmp8984 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp8983, i32 0, i32 4
%.tmp8985 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp8984
store %m2693$.Type.type* %.tmp8985, %m2693$.Type.type** %last_type.8958
%.tmp8986 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8964
%.tmp8987 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8986, i32 0, i32 7
%.tmp8988 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8987
%.tmp8989 = icmp ne %m980$.Node.type* %.tmp8988, null
br i1 %.tmp8989, label %.if.true.8990, label %.if.false.8990
.if.true.8990:
%.tmp8991 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8964
%.tmp8992 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8991, i32 0, i32 7
%.tmp8993 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8992
store %m980$.Node.type* %.tmp8993, %m980$.Node.type** %param_ptr.8964
br label %.if.end.8990
.if.false.8990:
br label %.if.end.8990
.if.end.8990:
%.tmp8994 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8964
%.tmp8995 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8994, i32 0, i32 7
%.tmp8996 = load %m980$.Node.type*, %m980$.Node.type** %.tmp8995
%.tmp8997 = icmp ne %m980$.Node.type* %.tmp8996, null
br i1 %.tmp8997, label %.if.true.8998, label %.if.false.8998
.if.true.8998:
%.tmp8999 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8964
%.tmp9000 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp8999, i32 0, i32 7
%.tmp9001 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9000
store %m980$.Node.type* %.tmp9001, %m980$.Node.type** %param_ptr.8964
br label %.if.end.8998
.if.false.8998:
store %m980$.Node.type* null, %m980$.Node.type** %param_ptr.8964
br label %.if.end.8998
.if.end.8998:
br label %.if.end.8974
.if.false.8974:
%.tmp9002 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp9003 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8964
%.tmp9004 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9003, i32 0, i32 6
%.tmp9005 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9004
%.tmp9006 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp9002, %m980$.Node.type* %.tmp9005)
%param_type.9007 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp9006, %m2693$.Type.type** %param_type.9007
%.tmp9008 = load %m2693$.Type.type*, %m2693$.Type.type** %last_type.8958
%.tmp9009 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9008, i32 0, i32 4
%.tmp9010 = load %m2693$.Type.type*, %m2693$.Type.type** %param_type.9007
store %m2693$.Type.type* %.tmp9010, %m2693$.Type.type** %.tmp9009
%.tmp9011 = load %m2693$.Type.type*, %m2693$.Type.type** %param_type.9007
store %m2693$.Type.type* %.tmp9011, %m2693$.Type.type** %last_type.8958
%.tmp9012 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8964
%.tmp9013 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9012, i32 0, i32 7
%.tmp9014 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9013
store %m980$.Node.type* %.tmp9014, %m980$.Node.type** %param_ptr.8964
%.tmp9015 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8964
%.tmp9016 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9015, i32 0, i32 7
%.tmp9017 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9016
%.tmp9018 = icmp ne %m980$.Node.type* %.tmp9017, null
br i1 %.tmp9018, label %.if.true.9019, label %.if.false.9019
.if.true.9019:
%.tmp9020 = load %m980$.Node.type*, %m980$.Node.type** %param_ptr.8964
%.tmp9021 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9020, i32 0, i32 7
%.tmp9022 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9021
%.tmp9023 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9022, i32 0, i32 7
%.tmp9024 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9023
store %m980$.Node.type* %.tmp9024, %m980$.Node.type** %param_ptr.8964
br label %.if.end.9019
.if.false.9019:
store %m980$.Node.type* null, %m980$.Node.type** %param_ptr.8964
br label %.if.end.9019
.if.end.9019:
br label %.if.end.8974
.if.end.8974:
br label %.for.start.8962
.for.end.8962:
%.tmp9025 = load %m2693$.Type.type*, %m2693$.Type.type** %function_type.8943
ret %m2693$.Type.type* %.tmp9025
}
define %m980$.Node.type* @m295$syn_function_params.m980$.Node.typep.m980$.Node.typep(%m980$.Node.type* %.stmt.arg) {
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp9026 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9028 = getelementptr [10 x i8], [10 x i8]*@.str9027, i32 0, i32 0
%.tmp9029 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp9026, i8* %.tmp9028)
%params.9030 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9029, %m980$.Node.type** %params.9030
%.tmp9031 = load %m980$.Node.type*, %m980$.Node.type** %params.9030
%.tmp9032 = icmp eq %m980$.Node.type* %.tmp9031, null
br i1 %.tmp9032, label %.if.true.9033, label %.if.false.9033
.if.true.9033:
%.tmp9034 = bitcast ptr null to %m980$.Node.type*
ret %m980$.Node.type* %.tmp9034
br label %.if.end.9033
.if.false.9033:
br label %.if.end.9033
.if.end.9033:
%.tmp9035 = load %m980$.Node.type*, %m980$.Node.type** %params.9030
%.tmp9036 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9035, i32 0, i32 6
%.tmp9037 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9036
ret %m980$.Node.type* %.tmp9037
}
define %m2693$.Type.type* @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.ctx.arg, %m980$.Node.type* %.stmt.arg) {
%ctx = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.ctx.arg, %m2693$.CompilerCtx.type** %ctx
%stmt = alloca %m980$.Node.type*
store %m980$.Node.type* %.stmt.arg, %m980$.Node.type** %stmt
%.tmp9038 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9039 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9038, i32 0, i32 0
%.tmp9040 = load i8*, i8** %.tmp9039
%.tmp9042 = getelementptr [11 x i8], [11 x i8]*@.str9041, i32 0, i32 0
%.tmp9043 = call i32(i8*,i8*) @strcmp(i8* %.tmp9040, i8* %.tmp9042)
%.tmp9044 = icmp eq i32 %.tmp9043, 0
br i1 %.tmp9044, label %.if.true.9045, label %.if.false.9045
.if.true.9045:
%.tmp9046 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp9047 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9048 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9047, i32 0, i32 6
%.tmp9049 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9048
%.tmp9050 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp9046, %m980$.Node.type* %.tmp9049)
%t.9051 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp9050, %m2693$.Type.type** %t.9051
%.tmp9052 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9053 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9052, i32 0, i32 7
%.tmp9054 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9053
%.tmp9055 = icmp ne %m980$.Node.type* %.tmp9054, null
br i1 %.tmp9055, label %.if.true.9056, label %.if.false.9056
.if.true.9056:
%.tmp9057 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9058 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9057, i32 0, i32 7
%.tmp9059 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9058
%.tmp9060 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9059, i32 0, i32 0
%.tmp9061 = load i8*, i8** %.tmp9060
%.tmp9063 = getelementptr [13 x i8], [13 x i8]*@.str9062, i32 0, i32 0
%.tmp9064 = call i32(i8*,i8*) @strcmp(i8* %.tmp9061, i8* %.tmp9063)
%.tmp9065 = icmp eq i32 %.tmp9064, 0
br i1 %.tmp9065, label %.if.true.9066, label %.if.false.9066
.if.true.9066:
%.tmp9067 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%fn_type.9068 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp9067, %m2693$.Type.type** %fn_type.9068
%.tmp9069 = load %m2693$.Type.type*, %m2693$.Type.type** %fn_type.9068
%.tmp9070 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9069, i32 0, i32 0
%.tmp9072 = getelementptr [9 x i8], [9 x i8]*@.str9071, i32 0, i32 0
store i8* %.tmp9072, i8** %.tmp9070
%.tmp9073 = load %m2693$.Type.type*, %m2693$.Type.type** %fn_type.9068
%.tmp9074 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9073, i32 0, i32 3
%.tmp9075 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9051
store %m2693$.Type.type* %.tmp9075, %m2693$.Type.type** %.tmp9074
%.tmp9076 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9077 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9076, i32 0, i32 7
%.tmp9078 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9077
%.tmp9079 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9078, i32 0, i32 6
%.tmp9080 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9079
%.tmp9081 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9080, i32 0, i32 7
%.tmp9082 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9081
%fst_operator.9083 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9082, %m980$.Node.type** %fst_operator.9083
%.tmp9084 = load %m980$.Node.type*, %m980$.Node.type** %fst_operator.9083
%.tmp9085 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9084, i32 0, i32 0
%.tmp9086 = load i8*, i8** %.tmp9085
%.tmp9088 = getelementptr [15 x i8], [15 x i8]*@.str9087, i32 0, i32 0
%.tmp9089 = call i32(i8*,i8*) @strcmp(i8* %.tmp9086, i8* %.tmp9088)
%.tmp9090 = icmp eq i32 %.tmp9089, 0
br i1 %.tmp9090, label %.if.true.9091, label %.if.false.9091
.if.true.9091:
%.tmp9092 = load %m2693$.Type.type*, %m2693$.Type.type** %fn_type.9068
%.tmp9093 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9092, i32 0, i32 3
%.tmp9094 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp9093
%last_fn_value.9095 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp9094, %m2693$.Type.type** %last_fn_value.9095
%.tmp9097 = load %m980$.Node.type*, %m980$.Node.type** %fst_operator.9083
%.tmp9098 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9097, i32 0, i32 6
%.tmp9099 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9098
%t.9100 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9099, %m980$.Node.type** %t.9100
br label %.for.start.9096
.for.start.9096:
%.tmp9101 = load %m980$.Node.type*, %m980$.Node.type** %t.9100
%.tmp9102 = icmp ne %m980$.Node.type* %.tmp9101, null
br i1 %.tmp9102, label %.for.continue.9096, label %.for.end.9096
.for.continue.9096:
%.tmp9103 = load %m2693$.Type.type*, %m2693$.Type.type** %last_fn_value.9095
%.tmp9104 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9103, i32 0, i32 4
%.tmp9105 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp9106 = load %m980$.Node.type*, %m980$.Node.type** %t.9100
%.tmp9107 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9106, i32 0, i32 6
%.tmp9108 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9107
%.tmp9109 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp9105, %m980$.Node.type* %.tmp9108)
store %m2693$.Type.type* %.tmp9109, %m2693$.Type.type** %.tmp9104
%.tmp9110 = load %m2693$.Type.type*, %m2693$.Type.type** %last_fn_value.9095
%.tmp9111 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9110, i32 0, i32 4
%.tmp9112 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp9111
store %m2693$.Type.type* %.tmp9112, %m2693$.Type.type** %last_fn_value.9095
%.tmp9113 = load %m980$.Node.type*, %m980$.Node.type** %t.9100
%.tmp9114 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9113, i32 0, i32 7
%.tmp9115 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9114
%.tmp9116 = icmp ne %m980$.Node.type* %.tmp9115, null
br i1 %.tmp9116, label %.if.true.9117, label %.if.false.9117
.if.true.9117:
%.tmp9118 = load %m980$.Node.type*, %m980$.Node.type** %t.9100
%.tmp9119 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9118, i32 0, i32 7
%.tmp9120 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9119
store %m980$.Node.type* %.tmp9120, %m980$.Node.type** %t.9100
br label %.if.end.9117
.if.false.9117:
br label %.if.end.9117
.if.end.9117:
%.tmp9121 = load %m980$.Node.type*, %m980$.Node.type** %t.9100
%.tmp9122 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9121, i32 0, i32 7
%.tmp9123 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9122
store %m980$.Node.type* %.tmp9123, %m980$.Node.type** %t.9100
br label %.for.start.9096
.for.end.9096:
br label %.if.end.9091
.if.false.9091:
br label %.if.end.9091
.if.end.9091:
%.tmp9124 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%t_ptr.9125 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp9124, %m2693$.Type.type** %t_ptr.9125
%.tmp9126 = load %m2693$.Type.type*, %m2693$.Type.type** %t_ptr.9125
%.tmp9127 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9126, i32 0, i32 0
%.tmp9129 = getelementptr [4 x i8], [4 x i8]*@.str9128, i32 0, i32 0
store i8* %.tmp9129, i8** %.tmp9127
%.tmp9130 = load %m2693$.Type.type*, %m2693$.Type.type** %t_ptr.9125
%.tmp9131 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9130, i32 0, i32 3
%.tmp9132 = load %m2693$.Type.type*, %m2693$.Type.type** %fn_type.9068
store %m2693$.Type.type* %.tmp9132, %m2693$.Type.type** %.tmp9131
%.tmp9133 = load %m2693$.Type.type*, %m2693$.Type.type** %t_ptr.9125
store %m2693$.Type.type* %.tmp9133, %m2693$.Type.type** %t.9051
br label %.if.end.9066
.if.false.9066:
br label %.if.end.9066
.if.end.9066:
br label %.if.end.9056
.if.false.9056:
br label %.if.end.9056
.if.end.9056:
%.tmp9134 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9051
ret %m2693$.Type.type* %.tmp9134
br label %.if.end.9045
.if.false.9045:
br label %.if.end.9045
.if.end.9045:
%.tmp9135 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%t.9136 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp9135, %m2693$.Type.type** %t.9136
%.tmp9137 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9138 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9137, i32 0, i32 0
%.tmp9139 = load i8*, i8** %.tmp9138
%.tmp9141 = getelementptr [10 x i8], [10 x i8]*@.str9140, i32 0, i32 0
%.tmp9142 = call i32(i8*,i8*) @strcmp(i8* %.tmp9139, i8* %.tmp9141)
%.tmp9143 = icmp eq i32 %.tmp9142, 0
br i1 %.tmp9143, label %.if.true.9144, label %.if.false.9144
.if.true.9144:
%.tmp9145 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9146 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9145, i32 0, i32 0
%.tmp9148 = getelementptr [7 x i8], [7 x i8]*@.str9147, i32 0, i32 0
store i8* %.tmp9148, i8** %.tmp9146
%.tmp9149 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9150 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9149, i32 0, i32 1
store i8* null, i8** %.tmp9150
%.tmp9151 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9152 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9151, i32 0, i32 6
%.tmp9153 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9152
%.tmp9155 = getelementptr [5 x i8], [5 x i8]*@.str9154, i32 0, i32 0
%.tmp9156 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp9153, i8* %.tmp9155)
%curr_type.9157 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9156, %m980$.Node.type** %curr_type.9157
%.tmp9158 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9157
%.tmp9159 = icmp ne %m980$.Node.type* %.tmp9158, null
br i1 %.tmp9159, label %.if.true.9160, label %.if.false.9160
.if.true.9160:
%.tmp9161 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9162 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9161, i32 0, i32 3
%.tmp9163 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp9164 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9157
%.tmp9165 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9164, i32 0, i32 6
%.tmp9166 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9165
%.tmp9167 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp9163, %m980$.Node.type* %.tmp9166)
store %m2693$.Type.type* %.tmp9167, %m2693$.Type.type** %.tmp9162
%.tmp9168 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9169 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9168, i32 0, i32 3
%.tmp9170 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp9169
%.tmp9171 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9170, i32 0, i32 1
%.tmp9172 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9157
%.tmp9173 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9172, i32 0, i32 7
%.tmp9174 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9173
%.tmp9175 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9174, i32 0, i32 1
%.tmp9176 = load i8*, i8** %.tmp9175
store i8* %.tmp9176, i8** %.tmp9171
%.tmp9177 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9178 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9177, i32 0, i32 3
%.tmp9179 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp9178
%curr_t.9180 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp9179, %m2693$.Type.type** %curr_t.9180
%.tmp9182 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9157
%.tmp9183 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9182, i32 0, i32 7
%.tmp9184 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9183
%.tmp9186 = getelementptr [5 x i8], [5 x i8]*@.str9185, i32 0, i32 0
%.tmp9187 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp9184, i8* %.tmp9186)
store %m980$.Node.type* %.tmp9187, %m980$.Node.type** %curr_type.9157
br label %.for.start.9181
.for.start.9181:
%.tmp9188 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9157
%.tmp9189 = icmp ne %m980$.Node.type* %.tmp9188, null
br i1 %.tmp9189, label %.for.continue.9181, label %.for.end.9181
.for.continue.9181:
%.tmp9190 = load %m2693$.Type.type*, %m2693$.Type.type** %curr_t.9180
%.tmp9191 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9190, i32 0, i32 4
%.tmp9192 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp9193 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9157
%.tmp9194 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9193, i32 0, i32 6
%.tmp9195 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9194
%.tmp9196 = call %m2693$.Type.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$node_to_type.m2693$.Type.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp9192, %m980$.Node.type* %.tmp9195)
store %m2693$.Type.type* %.tmp9196, %m2693$.Type.type** %.tmp9191
%.tmp9197 = load %m2693$.Type.type*, %m2693$.Type.type** %curr_t.9180
%.tmp9198 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9197, i32 0, i32 4
%.tmp9199 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp9198
%.tmp9200 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9199, i32 0, i32 1
%.tmp9201 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9157
%.tmp9202 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9201, i32 0, i32 7
%.tmp9203 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9202
%.tmp9204 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9203, i32 0, i32 1
%.tmp9205 = load i8*, i8** %.tmp9204
store i8* %.tmp9205, i8** %.tmp9200
%.tmp9206 = load %m2693$.Type.type*, %m2693$.Type.type** %curr_t.9180
%.tmp9207 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9206, i32 0, i32 4
%.tmp9208 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp9207
store %m2693$.Type.type* %.tmp9208, %m2693$.Type.type** %curr_t.9180
%.tmp9209 = load %m980$.Node.type*, %m980$.Node.type** %curr_type.9157
%.tmp9210 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9209, i32 0, i32 7
%.tmp9211 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9210
%.tmp9213 = getelementptr [5 x i8], [5 x i8]*@.str9212, i32 0, i32 0
%.tmp9214 = call %m980$.Node.type*(%m980$.Node.type*,i8*) @m295$skip_to_type.m980$.Node.typep.m980$.Node.typep.cp(%m980$.Node.type* %.tmp9211, i8* %.tmp9213)
store %m980$.Node.type* %.tmp9214, %m980$.Node.type** %curr_type.9157
br label %.for.start.9181
.for.end.9181:
br label %.if.end.9160
.if.false.9160:
br label %.if.end.9160
.if.end.9160:
br label %.if.end.9144
.if.false.9144:
%.tmp9215 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9216 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9215, i32 0, i32 0
%.tmp9217 = load i8*, i8** %.tmp9216
%.tmp9219 = getelementptr [12 x i8], [12 x i8]*@.str9218, i32 0, i32 0
%.tmp9220 = call i32(i8*,i8*) @strcmp(i8* %.tmp9217, i8* %.tmp9219)
%.tmp9221 = icmp eq i32 %.tmp9220, 0
br i1 %.tmp9221, label %.if.true.9222, label %.if.false.9222
.if.true.9222:
%.tmp9224 = getelementptr [1 x i8], [1 x i8]*@.str9223, i32 0, i32 0
%err_msg.9225 = alloca i8*
store i8* %.tmp9224, i8** %err_msg.9225
%.tmp9226 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp9227 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9228 = call %m2693$.ScopeItem.type*(%m2693$.CompilerCtx.type*,%m980$.Node.type*) @m295$find_defined.m2693$.ScopeItem.typep.m2693$.CompilerCtx.typep.m980$.Node.typep(%m2693$.CompilerCtx.type* %.tmp9226, %m980$.Node.type* %.tmp9227)
%base.9229 = alloca %m2693$.ScopeItem.type*
store %m2693$.ScopeItem.type* %.tmp9228, %m2693$.ScopeItem.type** %base.9229
%.tmp9230 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %base.9229
%.tmp9231 = icmp eq %m2693$.ScopeItem.type* %.tmp9230, null
br i1 %.tmp9231, label %.if.true.9232, label %.if.false.9232
.if.true.9232:
%.tmp9233 = getelementptr i8*, i8** %err_msg.9225, i32 0
%.tmp9235 = getelementptr [37 x i8], [37 x i8]*@.str9234, i32 0, i32 0
%.tmp9236 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9237 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9236, i32 0, i32 6
%.tmp9238 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9237
%.tmp9239 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9238, i32 0, i32 1
%.tmp9240 = load i8*, i8** %.tmp9239
%.tmp9241 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9233, i8* %.tmp9235, i8* %.tmp9240)
%.tmp9242 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp9243 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9244 = load i8*, i8** %err_msg.9225
call void(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$new_error.v.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp9242, %m980$.Node.type* %.tmp9243, i8* %.tmp9244)
%.tmp9245 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9246 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9245, i32 0, i32 0
%.tmp9248 = getelementptr [6 x i8], [6 x i8]*@.str9247, i32 0, i32 0
store i8* %.tmp9248, i8** %.tmp9246
%.tmp9249 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
ret %m2693$.Type.type* %.tmp9249
br label %.if.end.9232
.if.false.9232:
br label %.if.end.9232
.if.end.9232:
%.tmp9250 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9251 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9250, i32 0, i32 0
%.tmp9253 = getelementptr [10 x i8], [10 x i8]*@.str9252, i32 0, i32 0
store i8* %.tmp9253, i8** %.tmp9251
%.tmp9254 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9255 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9254, i32 0, i32 1
%.tmp9256 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %base.9229
%.tmp9257 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp9256, i32 0, i32 0
%.tmp9258 = load i8*, i8** %.tmp9257
store i8* %.tmp9258, i8** %.tmp9255
%.tmp9259 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9260 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9259, i32 0, i32 2
%.tmp9261 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %base.9229
%.tmp9262 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp9261, i32 0, i32 1
%.tmp9263 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %.tmp9262
%.tmp9264 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp9263, i32 0, i32 0
%.tmp9265 = load i8*, i8** %.tmp9264
store i8* %.tmp9265, i8** %.tmp9260
%.tmp9266 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9267 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9266, i32 0, i32 3
%.tmp9268 = load %m2693$.ScopeItem.type*, %m2693$.ScopeItem.type** %base.9229
%.tmp9269 = getelementptr %m2693$.ScopeItem.type, %m2693$.ScopeItem.type* %.tmp9268, i32 0, i32 1
%.tmp9270 = load %m2693$.AssignableInfo.type*, %m2693$.AssignableInfo.type** %.tmp9269
%.tmp9271 = getelementptr %m2693$.AssignableInfo.type, %m2693$.AssignableInfo.type* %.tmp9270, i32 0, i32 4
%.tmp9272 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp9271
store %m2693$.Type.type* %.tmp9272, %m2693$.Type.type** %.tmp9267
br label %.if.end.9222
.if.false.9222:
%.tmp9273 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9274 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9273, i32 0, i32 1
%.tmp9275 = load i8*, i8** %.tmp9274
%.tmp9277 = getelementptr [4 x i8], [4 x i8]*@.str9276, i32 0, i32 0
%.tmp9278 = call i32(i8*,i8*) @strcmp(i8* %.tmp9275, i8* %.tmp9277)
%.tmp9279 = icmp eq i32 %.tmp9278, 0
br i1 %.tmp9279, label %.if.true.9280, label %.if.false.9280
.if.true.9280:
%.tmp9281 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9282 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9281, i32 0, i32 0
%.tmp9284 = getelementptr [4 x i8], [4 x i8]*@.str9283, i32 0, i32 0
store i8* %.tmp9284, i8** %.tmp9282
%.tmp9285 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9286 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9285, i32 0, i32 3
%.tmp9287 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
store %m2693$.Type.type* %.tmp9287, %m2693$.Type.type** %.tmp9286
%.tmp9288 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9289 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9288, i32 0, i32 3
%.tmp9290 = load %m2693$.Type.type*, %m2693$.Type.type** %.tmp9289
%.tmp9291 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9290, i32 0, i32 0
%.tmp9293 = getelementptr [4 x i8], [4 x i8]*@.str9292, i32 0, i32 0
store i8* %.tmp9293, i8** %.tmp9291
br label %.if.end.9280
.if.false.9280:
%.tmp9294 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9295 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9294, i32 0, i32 0
%.tmp9296 = load i8*, i8** %.tmp9295
%.tmp9298 = getelementptr [5 x i8], [5 x i8]*@.str9297, i32 0, i32 0
%.tmp9299 = call i32(i8*,i8*) @strcmp(i8* %.tmp9296, i8* %.tmp9298)
%.tmp9300 = icmp eq i32 %.tmp9299, 0
br i1 %.tmp9300, label %.if.true.9301, label %.if.false.9301
.if.true.9301:
%.tmp9302 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9303 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9302, i32 0, i32 0
%.tmp9304 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9305 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9304, i32 0, i32 1
%.tmp9306 = load i8*, i8** %.tmp9305
store i8* %.tmp9306, i8** %.tmp9303
br label %.if.end.9301
.if.false.9301:
%.tmp9307 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9308 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9307, i32 0, i32 1
%.tmp9309 = load i8*, i8** %.tmp9308
%.tmp9311 = getelementptr [4 x i8], [4 x i8]*@.str9310, i32 0, i32 0
%.tmp9312 = call i32(i8*,i8*) @strcmp(i8* %.tmp9309, i8* %.tmp9311)
%.tmp9313 = icmp eq i32 %.tmp9312, 0
br i1 %.tmp9313, label %.if.true.9314, label %.if.false.9314
.if.true.9314:
%.tmp9315 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
%.tmp9316 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9315, i32 0, i32 0
%.tmp9318 = getelementptr [7 x i8], [7 x i8]*@.str9317, i32 0, i32 0
store i8* %.tmp9318, i8** %.tmp9316
br label %.if.end.9314
.if.false.9314:
%.tmp9319 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp9320 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9322 = getelementptr [54 x i8], [54 x i8]*@.str9321, i32 0, i32 0
%.tmp9323 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp9319, %m980$.Node.type* %.tmp9320, i8* %.tmp9322)
%.tmp9324 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9325 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9324, i32 0, i32 0
%.tmp9326 = load i8*, i8** %.tmp9325
%.tmp9327 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9328 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9327, i32 0, i32 1
%.tmp9329 = load i8*, i8** %.tmp9328
%.tmp9330 = call i32(i8*,...) @printf(i8* %.tmp9323, i8* %.tmp9326, i8* %.tmp9329)
%.tmp9331 = bitcast ptr null to %m2693$.Type.type*
ret %m2693$.Type.type* %.tmp9331
br label %.if.end.9314
.if.end.9314:
br label %.if.end.9301
.if.end.9301:
br label %.if.end.9280
.if.end.9280:
br label %.if.end.9222
.if.end.9222:
br label %.if.end.9144
.if.end.9144:
%.tmp9333 = load %m980$.Node.type*, %m980$.Node.type** %stmt
%.tmp9334 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9333, i32 0, i32 7
%.tmp9335 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9334
%ptr.9336 = alloca %m980$.Node.type*
store %m980$.Node.type* %.tmp9335, %m980$.Node.type** %ptr.9336
br label %.for.start.9332
.for.start.9332:
%.tmp9337 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9336
%.tmp9338 = icmp ne %m980$.Node.type* %.tmp9337, null
br i1 %.tmp9338, label %.for.continue.9332, label %.for.end.9332
.for.continue.9332:
%.tmp9339 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9336
%.tmp9340 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9339, i32 0, i32 1
%.tmp9341 = load i8*, i8** %.tmp9340
%.tmp9343 = getelementptr [2 x i8], [2 x i8]*@.str9342, i32 0, i32 0
%.tmp9344 = call i32(i8*,i8*) @strcmp(i8* %.tmp9341, i8* %.tmp9343)
%.tmp9345 = icmp eq i32 %.tmp9344, 0
br i1 %.tmp9345, label %.if.true.9346, label %.if.false.9346
.if.true.9346:
%.tmp9347 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%pt.9348 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp9347, %m2693$.Type.type** %pt.9348
%.tmp9349 = load %m2693$.Type.type*, %m2693$.Type.type** %pt.9348
%.tmp9350 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9349, i32 0, i32 0
%.tmp9352 = getelementptr [4 x i8], [4 x i8]*@.str9351, i32 0, i32 0
store i8* %.tmp9352, i8** %.tmp9350
%.tmp9353 = load %m2693$.Type.type*, %m2693$.Type.type** %pt.9348
%.tmp9354 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9353, i32 0, i32 3
%.tmp9355 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
store %m2693$.Type.type* %.tmp9355, %m2693$.Type.type** %.tmp9354
%.tmp9356 = load %m2693$.Type.type*, %m2693$.Type.type** %pt.9348
store %m2693$.Type.type* %.tmp9356, %m2693$.Type.type** %t.9136
br label %.if.end.9346
.if.false.9346:
%.tmp9357 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9336
%.tmp9358 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9357, i32 0, i32 1
%.tmp9359 = load i8*, i8** %.tmp9358
%.tmp9361 = getelementptr [2 x i8], [2 x i8]*@.str9360, i32 0, i32 0
%.tmp9362 = call i32(i8*,i8*) @strcmp(i8* %.tmp9359, i8* %.tmp9361)
%.tmp9363 = icmp eq i32 %.tmp9362, 0
br i1 %.tmp9363, label %.if.true.9364, label %.if.false.9364
.if.true.9364:
%.tmp9365 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9336
%.tmp9366 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9365, i32 0, i32 7
%.tmp9367 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9366
%.tmp9368 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9367, i32 0, i32 1
%.tmp9369 = load i8*, i8** %.tmp9368
%.tmp9371 = getelementptr [2 x i8], [2 x i8]*@.str9370, i32 0, i32 0
%.tmp9372 = call i32(i8*,i8*) @strcmp(i8* %.tmp9369, i8* %.tmp9371)
%.tmp9373 = icmp eq i32 %.tmp9372, 0
br i1 %.tmp9373, label %.if.true.9374, label %.if.false.9374
.if.true.9374:
%.tmp9375 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%slice_type.9376 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp9375, %m2693$.Type.type** %slice_type.9376
%.tmp9377 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_type.9376
%.tmp9378 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9377, i32 0, i32 0
%.tmp9380 = getelementptr [7 x i8], [7 x i8]*@.str9379, i32 0, i32 0
store i8* %.tmp9380, i8** %.tmp9378
%.tmp9381 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_type.9376
%.tmp9382 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9381, i32 0, i32 1
%.tmp9384 = getelementptr [6 x i8], [6 x i8]*@.str9383, i32 0, i32 0
store i8* %.tmp9384, i8** %.tmp9382
%.tmp9385 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%slice_c_array.9386 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp9385, %m2693$.Type.type** %slice_c_array.9386
%.tmp9387 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_c_array.9386
%.tmp9388 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9387, i32 0, i32 0
%.tmp9390 = getelementptr [4 x i8], [4 x i8]*@.str9389, i32 0, i32 0
store i8* %.tmp9390, i8** %.tmp9388
%.tmp9391 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_c_array.9386
%.tmp9392 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9391, i32 0, i32 1
%.tmp9394 = getelementptr [6 x i8], [6 x i8]*@.str9393, i32 0, i32 0
store i8* %.tmp9394, i8** %.tmp9392
%.tmp9395 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_c_array.9386
%.tmp9396 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9395, i32 0, i32 3
%.tmp9397 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
store %m2693$.Type.type* %.tmp9397, %m2693$.Type.type** %.tmp9396
%.tmp9398 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_type.9376
%.tmp9399 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9398, i32 0, i32 3
%.tmp9400 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_c_array.9386
store %m2693$.Type.type* %.tmp9400, %m2693$.Type.type** %.tmp9399
%.tmp9401 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%slice_len.9402 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp9401, %m2693$.Type.type** %slice_len.9402
%.tmp9403 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_len.9402
%.tmp9404 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9403, i32 0, i32 0
%.tmp9406 = getelementptr [4 x i8], [4 x i8]*@.str9405, i32 0, i32 0
store i8* %.tmp9406, i8** %.tmp9404
%.tmp9407 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_len.9402
%.tmp9408 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9407, i32 0, i32 1
%.tmp9410 = getelementptr [4 x i8], [4 x i8]*@.str9409, i32 0, i32 0
store i8* %.tmp9410, i8** %.tmp9408
%.tmp9411 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_c_array.9386
%.tmp9412 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9411, i32 0, i32 4
%.tmp9413 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_len.9402
store %m2693$.Type.type* %.tmp9413, %m2693$.Type.type** %.tmp9412
%.tmp9414 = call %m2693$.Type.type*() @m295$new_type.m2693$.Type.typep()
%slice_cap.9415 = alloca %m2693$.Type.type*
store %m2693$.Type.type* %.tmp9414, %m2693$.Type.type** %slice_cap.9415
%.tmp9416 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_cap.9415
%.tmp9417 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9416, i32 0, i32 0
%.tmp9419 = getelementptr [4 x i8], [4 x i8]*@.str9418, i32 0, i32 0
store i8* %.tmp9419, i8** %.tmp9417
%.tmp9420 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_cap.9415
%.tmp9421 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9420, i32 0, i32 1
%.tmp9423 = getelementptr [4 x i8], [4 x i8]*@.str9422, i32 0, i32 0
store i8* %.tmp9423, i8** %.tmp9421
%.tmp9424 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_len.9402
%.tmp9425 = getelementptr %m2693$.Type.type, %m2693$.Type.type* %.tmp9424, i32 0, i32 4
%.tmp9426 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_cap.9415
store %m2693$.Type.type* %.tmp9426, %m2693$.Type.type** %.tmp9425
%.tmp9427 = load %m2693$.Type.type*, %m2693$.Type.type** %slice_type.9376
store %m2693$.Type.type* %.tmp9427, %m2693$.Type.type** %t.9136
%.tmp9428 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9336
%.tmp9429 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9428, i32 0, i32 7
%.tmp9430 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9429
store %m980$.Node.type* %.tmp9430, %m980$.Node.type** %ptr.9336
br label %.if.end.9374
.if.false.9374:
br label %.if.end.9374
.if.end.9374:
br label %.if.end.9364
.if.false.9364:
%.tmp9431 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %ctx
%.tmp9432 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9336
%.tmp9434 = getelementptr [49 x i8], [49 x i8]*@.str9433, i32 0, i32 0
%.tmp9435 = call i8*(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$err_tmpl.cp.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp9431, %m980$.Node.type* %.tmp9432, i8* %.tmp9434)
%.tmp9436 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9336
%.tmp9437 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9436, i32 0, i32 1
%.tmp9438 = load i8*, i8** %.tmp9437
%.tmp9439 = call i32(i8*,...) @printf(i8* %.tmp9435, i8* %.tmp9438)
%.tmp9440 = bitcast ptr null to %m2693$.Type.type*
ret %m2693$.Type.type* %.tmp9440
br label %.if.end.9364
.if.end.9364:
br label %.if.end.9346
.if.end.9346:
%.tmp9441 = load %m980$.Node.type*, %m980$.Node.type** %ptr.9336
%.tmp9442 = getelementptr %m980$.Node.type, %m980$.Node.type* %.tmp9441, i32 0, i32 7
%.tmp9443 = load %m980$.Node.type*, %m980$.Node.type** %.tmp9442
store %m980$.Node.type* %.tmp9443, %m980$.Node.type** %ptr.9336
br label %.for.start.9332
.for.end.9332:
%.tmp9444 = load %m2693$.Type.type*, %m2693$.Type.type** %t.9136
ret %m2693$.Type.type* %.tmp9444
}
define i1 @compile_file.b.cp.cp(i8* %.filename.arg, i8* %.outname.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%outname = alloca i8*
store i8* %.outname.arg, i8** %outname
%.tmp9445 = load i32, i32* @STDERR
%.tmp9447 = getelementptr [2 x i8], [2 x i8]*@.str9446, i32 0, i32 0
%.tmp9448 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp9445, i8* %.tmp9447)
%stderr.9449 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9448, %m0$.File.type** %stderr.9449
%.tmp9450 = call %m0$.File.type*() @tmpfile()
%llvm_code.9451 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9450, %m0$.File.type** %llvm_code.9451
%.tmp9452 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9451
%.tmp9453 = load i8*, i8** %filename
%.tmp9454 = call %m2693$.CompilerCtx.type*(%m0$.File.type*,i8*) @m295$new_context.m2693$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp9452, i8* %.tmp9453)
%compiler_ctx.9455 = alloca %m2693$.CompilerCtx.type*
store %m2693$.CompilerCtx.type* %.tmp9454, %m2693$.CompilerCtx.type** %compiler_ctx.9455
%.tmp9456 = load %m2693$.CompilerCtx.type*, %m2693$.CompilerCtx.type** %compiler_ctx.9455
%.tmp9457 = bitcast ptr null to %m980$.Node.type*
%.tmp9458 = load i8*, i8** %filename
%.tmp9459 = call i1(%m2693$.CompilerCtx.type*,%m980$.Node.type*,i8*) @m295$compile_file.b.m2693$.CompilerCtx.typep.m980$.Node.typep.cp(%m2693$.CompilerCtx.type* %.tmp9456, %m980$.Node.type* %.tmp9457, i8* %.tmp9458)
br i1 %.tmp9459, label %.if.true.9460, label %.if.false.9460
.if.true.9460:
%.tmp9461 = load %m0$.File.type*, %m0$.File.type** %stderr.9449
%.tmp9463 = getelementptr [34 x i8], [34 x i8]*@.str9462, i32 0, i32 0
%.tmp9464 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9461, i8* %.tmp9463)
ret i1 0
br label %.if.end.9460
.if.false.9460:
br label %.if.end.9460
.if.end.9460:
%.tmp9465 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9451
%.tmp9466 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp9465)
%.tmp9467 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9451
%.tmp9468 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp9467)
%llvm_code_size.9469 = alloca i32
store i32 %.tmp9468, i32* %llvm_code_size.9469
%.tmp9470 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9451
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp9470)
%.tmp9472 = getelementptr [1 x i8], [1 x i8]*@.str9471, i32 0, i32 0
%cmd.9473 = alloca i8*
store i8* %.tmp9472, i8** %cmd.9473
%.tmp9474 = getelementptr i8*, i8** %cmd.9473, i32 0
%.tmp9476 = getelementptr [32 x i8], [32 x i8]*@.str9475, i32 0, i32 0
%.tmp9477 = load i8*, i8** %outname
%.tmp9478 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9474, i8* %.tmp9476, i8* %.tmp9477)
%.tmp9479 = load i8*, i8** %cmd.9473
%.tmp9481 = getelementptr [2 x i8], [2 x i8]*@.str9480, i32 0, i32 0
%.tmp9482 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9479, i8* %.tmp9481)
%proc.9483 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9482, %m0$.File.type** %proc.9483
%.tmp9484 = load %m0$.File.type*, %m0$.File.type** %proc.9483
%.tmp9485 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9484)
%.tmp9486 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9451
%.tmp9487 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9486)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp9485, i32 %.tmp9487)
%.tmp9488 = load %m0$.File.type*, %m0$.File.type** %proc.9483
%.tmp9489 = icmp eq %m0$.File.type* %.tmp9488, null
br i1 %.tmp9489, label %.if.true.9490, label %.if.false.9490
.if.true.9490:
%.tmp9491 = load %m0$.File.type*, %m0$.File.type** %stderr.9449
%.tmp9493 = getelementptr [28 x i8], [28 x i8]*@.str9492, i32 0, i32 0
%.tmp9494 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9491, i8* %.tmp9493)
ret i1 0
br label %.if.end.9490
.if.false.9490:
br label %.if.end.9490
.if.end.9490:
%.tmp9495 = load %m0$.File.type*, %m0$.File.type** %proc.9483
%.tmp9496 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9495)
%.tmp9497 = icmp ne i32 %.tmp9496, 0
br i1 %.tmp9497, label %.if.true.9498, label %.if.false.9498
.if.true.9498:
%.tmp9499 = load %m0$.File.type*, %m0$.File.type** %stderr.9449
%.tmp9501 = getelementptr [24 x i8], [24 x i8]*@.str9500, i32 0, i32 0
%.tmp9502 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9499, i8* %.tmp9501)
ret i1 0
br label %.if.end.9498
.if.false.9498:
br label %.if.end.9498
.if.end.9498:
%.tmp9503 = getelementptr i8*, i8** %cmd.9473, i32 0
%.tmp9505 = getelementptr [17 x i8], [17 x i8]*@.str9504, i32 0, i32 0
%.tmp9506 = load i8*, i8** %outname
%.tmp9507 = load i8*, i8** %outname
%.tmp9508 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9503, i8* %.tmp9505, i8* %.tmp9506, i8* %.tmp9507)
%.tmp9509 = load i8*, i8** %cmd.9473
%.tmp9511 = getelementptr [2 x i8], [2 x i8]*@.str9510, i32 0, i32 0
%.tmp9512 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9509, i8* %.tmp9511)
%cc_proc.9513 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9512, %m0$.File.type** %cc_proc.9513
%.tmp9514 = load %m0$.File.type*, %m0$.File.type** %cc_proc.9513
%.tmp9515 = icmp eq %m0$.File.type* %.tmp9514, null
br i1 %.tmp9515, label %.if.true.9516, label %.if.false.9516
.if.true.9516:
%.tmp9517 = load %m0$.File.type*, %m0$.File.type** %stderr.9449
%.tmp9519 = getelementptr [28 x i8], [28 x i8]*@.str9518, i32 0, i32 0
%.tmp9520 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9517, i8* %.tmp9519)
ret i1 0
br label %.if.end.9516
.if.false.9516:
br label %.if.end.9516
.if.end.9516:
%.tmp9521 = load %m0$.File.type*, %m0$.File.type** %proc.9483
%.tmp9522 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9521)
%.tmp9523 = icmp ne i32 %.tmp9522, 0
br i1 %.tmp9523, label %.if.true.9524, label %.if.false.9524
.if.true.9524:
%.tmp9525 = load %m0$.File.type*, %m0$.File.type** %stderr.9449
%.tmp9527 = getelementptr [22 x i8], [22 x i8]*@.str9526, i32 0, i32 0
%.tmp9528 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9525, i8* %.tmp9527)
br label %.if.end.9524
.if.false.9524:
%.tmp9530 = getelementptr [32 x i8], [32 x i8]*@.str9529, i32 0, i32 0
%.tmp9531 = load i8*, i8** %outname
%.tmp9532 = call i32(i8*,...) @printf(i8* %.tmp9530, i8* %.tmp9531)
br label %.if.end.9524
.if.end.9524:
ret i1 1
}
%.Args.type = type {i8*,i8*,i8*,i8**}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9533 = load i32, i32* %argc
%.tmp9534 = load i8**, i8*** %argv
%.tmp9535 = call %.Args.type(i32,i8**) @check_args..Args.type.i.cpp(i32 %.tmp9533, i8** %.tmp9534)
%args.9536 = alloca %.Args.type
store %.Args.type %.tmp9535, %.Args.type* %args.9536
%.tmp9537 = getelementptr %.Args.type, %.Args.type* %args.9536, i32 0, i32 1
%.tmp9538 = load i8*, i8** %.tmp9537
%.tmp9539 = getelementptr %.Args.type, %.Args.type* %args.9536, i32 0, i32 2
%.tmp9540 = load i8*, i8** %.tmp9539
%.tmp9541 = call i1(i8*,i8*) @compile_file.b.cp.cp(i8* %.tmp9538, i8* %.tmp9540)
%.tmp9542 = icmp eq i1 %.tmp9541, 0
br i1 %.tmp9542, label %.if.true.9543, label %.if.false.9543
.if.true.9543:
ret i32 0
br label %.if.end.9543
.if.false.9543:
br label %.if.end.9543
.if.end.9543:
%.tmp9544 = getelementptr %.Args.type, %.Args.type* %args.9536, i32 0, i32 0
%.tmp9545 = load i8*, i8** %.tmp9544
%.tmp9547 = getelementptr [4 x i8], [4 x i8]*@.str9546, i32 0, i32 0
%.tmp9548 = call i32(i8*,i8*) @strcmp(i8* %.tmp9545, i8* %.tmp9547)
%.tmp9549 = icmp eq i32 %.tmp9548, 0
br i1 %.tmp9549, label %.if.true.9550, label %.if.false.9550
.if.true.9550:
%.tmp9552 = getelementptr [1 x i8], [1 x i8]*@.str9551, i32 0, i32 0
%cmd.9553 = alloca i8*
store i8* %.tmp9552, i8** %cmd.9553
%.tmp9554 = getelementptr i8*, i8** %cmd.9553, i32 0
%.tmp9556 = getelementptr [5 x i8], [5 x i8]*@.str9555, i32 0, i32 0
%.tmp9557 = getelementptr %.Args.type, %.Args.type* %args.9536, i32 0, i32 2
%.tmp9558 = load i8*, i8** %.tmp9557
%.tmp9559 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9554, i8* %.tmp9556, i8* %.tmp9558)
%.tmp9560 = load i8*, i8** %cmd.9553
%.tmp9561 = getelementptr %.Args.type, %.Args.type* %args.9536, i32 0, i32 3
%.tmp9562 = load i8**, i8*** %.tmp9561
%.tmp9563 = call i32(i8*,i8**) @execvp(i8* %.tmp9560, i8** %.tmp9562)
ret i32 %.tmp9563
br label %.if.end.9550
.if.false.9550:
br label %.if.end.9550
.if.end.9550:
ret i32 0
}
define %.Args.type @check_args..Args.type.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9565 = getelementptr [22 x i8], [22 x i8]*@.str9564, i32 0, i32 0
%tmpl.9566 = alloca i8*
store i8* %.tmp9565, i8** %tmpl.9566
%args.9567 = alloca %.Args.type
%.tmp9568 = getelementptr %.Args.type, %.Args.type* %args.9567, i32 0, i32 0
store i8* null, i8** %.tmp9568
%.tmp9569 = getelementptr %.Args.type, %.Args.type* %args.9567, i32 0, i32 1
store i8* null, i8** %.tmp9569
%.tmp9570 = getelementptr %.Args.type, %.Args.type* %args.9567, i32 0, i32 2
store i8* null, i8** %.tmp9570
%.tmp9571 = getelementptr %.Args.type, %.Args.type* %args.9567, i32 0, i32 3
store i8** null, i8*** %.tmp9571
%.tmp9572 = load i32, i32* %argc
%.tmp9573 = icmp slt i32 %.tmp9572, 2
br i1 %.tmp9573, label %.if.true.9574, label %.if.false.9574
.if.true.9574:
%.tmp9575 = load i8*, i8** %tmpl.9566
%.tmp9576 = load i8**, i8*** %argv
%.tmp9577 = getelementptr i8*, i8** %.tmp9576, i32 0
%.tmp9578 = load i8*, i8** %.tmp9577
%.tmp9579 = call i32(i8*,...) @printf(i8* %.tmp9575, i8* %.tmp9578)
call void(i32) @exit(i32 1)
br label %.if.end.9574
.if.false.9574:
br label %.if.end.9574
.if.end.9574:
%fp.9580 = alloca i32
store i32 1, i32* %fp.9580
%.tmp9581 = getelementptr %.Args.type, %.Args.type* %args.9567, i32 0, i32 0
%.tmp9583 = getelementptr [8 x i8], [8 x i8]*@.str9582, i32 0, i32 0
store i8* %.tmp9583, i8** %.tmp9581
%.tmp9584 = load i8**, i8*** %argv
%.tmp9585 = getelementptr i8*, i8** %.tmp9584, i32 1
%.tmp9586 = load i8*, i8** %.tmp9585
%.tmp9588 = getelementptr [4 x i8], [4 x i8]*@.str9587, i32 0, i32 0
%.tmp9589 = call i32(i8*,i8*) @strcmp(i8* %.tmp9586, i8* %.tmp9588)
%.tmp9590 = icmp eq i32 %.tmp9589, 0
br i1 %.tmp9590, label %.if.true.9591, label %.if.false.9591
.if.true.9591:
%.tmp9592 = getelementptr %.Args.type, %.Args.type* %args.9567, i32 0, i32 0
%.tmp9594 = getelementptr [4 x i8], [4 x i8]*@.str9593, i32 0, i32 0
store i8* %.tmp9594, i8** %.tmp9592
store i32 2, i32* %fp.9580
br label %.if.end.9591
.if.false.9591:
br label %.if.end.9591
.if.end.9591:
%.tmp9595 = load i32, i32* %argc
%.tmp9596 = load i32, i32* %fp.9580
%.tmp9597 = add i32 %.tmp9596, 1
%.tmp9598 = icmp slt i32 %.tmp9595, %.tmp9597
br i1 %.tmp9598, label %.if.true.9599, label %.if.false.9599
.if.true.9599:
%.tmp9600 = load i8*, i8** %tmpl.9566
%.tmp9601 = load i8**, i8*** %argv
%.tmp9602 = getelementptr i8*, i8** %.tmp9601, i32 0
%.tmp9603 = load i8*, i8** %.tmp9602
%.tmp9604 = call i32(i8*,...) @printf(i8* %.tmp9600, i8* %.tmp9603)
call void(i32) @exit(i32 1)
br label %.if.end.9599
.if.false.9599:
br label %.if.end.9599
.if.end.9599:
%.tmp9605 = getelementptr %.Args.type, %.Args.type* %args.9567, i32 0, i32 1
%.tmp9606 = load i32, i32* %fp.9580
%.tmp9607 = load i8**, i8*** %argv
%.tmp9608 = getelementptr i8*, i8** %.tmp9607, i32 %.tmp9606
%.tmp9609 = load i8*, i8** %.tmp9608
store i8* %.tmp9609, i8** %.tmp9605
%.tmp9610 = getelementptr %.Args.type, %.Args.type* %args.9567, i32 0, i32 1
%.tmp9611 = load i8*, i8** %.tmp9610
%.tmp9612 = call {i8*,i8*}(i8*) @m2$splitext.scpcp.cp(i8* %.tmp9611)
%ext.9613 = alloca {i8*,i8*}
store {i8*,i8*} %.tmp9612, {i8*,i8*}* %ext.9613
%.tmp9614 = getelementptr %.Args.type, %.Args.type* %args.9567, i32 0, i32 2
%.tmp9615 = getelementptr {i8*,i8*}, {i8*,i8*}* %ext.9613, i32 0, i32 0
%.tmp9616 = load i8*, i8** %.tmp9615
store i8* %.tmp9616, i8** %.tmp9614
%.tmp9617 = load i32, i32* %argc
%.tmp9618 = load i32, i32* %fp.9580
%.tmp9619 = sub i32 %.tmp9617, %.tmp9618
%.tmp9620 = add i32 %.tmp9619, 1
%ac.9621 = alloca i32
store i32 %.tmp9620, i32* %ac.9621
%.tmp9622 = getelementptr %.Args.type, %.Args.type* %args.9567, i32 0, i32 3
%.tmp9623 = load i32, i32* %ac.9621
%.tmp9624 = mul i32 8, %.tmp9623
%.tmp9625 = call i8*(i32) @malloc(i32 %.tmp9624)
%.tmp9626 = bitcast i8* %.tmp9625 to i8**
store i8** %.tmp9626, i8*** %.tmp9622
%.tmp9627 = getelementptr %.Args.type, %.Args.type* %args.9567, i32 0, i32 3
%.tmp9628 = load i8**, i8*** %.tmp9627
%.tmp9629 = getelementptr i8*, i8** %.tmp9628, i32 0
%.tmp9630 = getelementptr %.Args.type, %.Args.type* %args.9567, i32 0, i32 2
%.tmp9631 = load i8*, i8** %.tmp9630
store i8* %.tmp9631, i8** %.tmp9629
%i.9633 = alloca i32
store i32 0, i32* %i.9633
br label %.for.start.9632
.for.start.9632:
%.tmp9634 = load i32, i32* %i.9633
%.tmp9635 = load i32, i32* %argc
%.tmp9636 = load i32, i32* %fp.9580
%.tmp9637 = sub i32 %.tmp9635, %.tmp9636
%.tmp9638 = icmp slt i32 %.tmp9634, %.tmp9637
br i1 %.tmp9638, label %.for.continue.9632, label %.for.end.9632
.for.continue.9632:
%.tmp9639 = getelementptr %.Args.type, %.Args.type* %args.9567, i32 0, i32 3
%.tmp9640 = load i32, i32* %i.9633
%.tmp9641 = add i32 %.tmp9640, 1
%.tmp9642 = load i8**, i8*** %.tmp9639
%.tmp9643 = getelementptr i8*, i8** %.tmp9642, i32 %.tmp9641
%.tmp9644 = load i32, i32* %fp.9580
%.tmp9645 = load i32, i32* %i.9633
%.tmp9646 = add i32 %.tmp9644, %.tmp9645
%.tmp9647 = add i32 %.tmp9646, 1
%.tmp9648 = load i8**, i8*** %argv
%.tmp9649 = getelementptr i8*, i8** %.tmp9648, i32 %.tmp9647
%.tmp9650 = load i8*, i8** %.tmp9649
store i8* %.tmp9650, i8** %.tmp9643
%.tmp9651 = load i32, i32* %i.9633
%.tmp9652 = add i32 %.tmp9651, 1
store i32 %.tmp9652, i32* %i.9633
br label %.for.start.9632
.for.end.9632:
%.tmp9653 = load %.Args.type, %.Args.type* %args.9567
ret %.Args.type %.tmp9653
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
@.str1810 = constant [1 x i8] c"\00"
@.str1850 = constant [22 x i8] c"Matcher type is null\0A\00"
@.str1863 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1877 = constant [43 x i8] c"Unable to match token by value: %s != \22%s\22\00"
@.str1918 = constant [22 x i8] c"Matcher type is null\0A\00"
@.str1933 = constant [54 x i8] c"Unable to match token by type, expecing \22%s\22 got \22%s\22\00"
@.str1985 = constant [26 x i8] c"Unable to find alias rule\00"
@.str2003 = constant [33 x i8] c"CRITICAL: Parser not implemented\00"
@.str2080 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str2100 = constant [4 x i8] c"EOF\00"
@.str2114 = constant [32 x i8] c"SyntaxError: parsing ended here\00"
@.str2149 = constant [2 x i8] c"\0A\00"
@.str2158 = constant [3 x i8] c"  \00"
@.str2167 = constant [7 x i8] c"(null)\00"
@.str2171 = constant [2 x i8] c"{\00"
@.str2177 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str2186 = constant [12 x i8] c"\22value\22: %s\00"
@.str2195 = constant [11 x i8] c"\22line\22: %d\00"
@.str2204 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str2213 = constant [9 x i8] c"\22next\22: \00"
@.str2225 = constant [13 x i8] c"\22children\22: \00"
@.str2238 = constant [2 x i8] c"}\00"
@.str2242 = constant [1886 x i8] c"
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
@.str2245 = constant [1885 x i8] c"%%%1$s.tmp0 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
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
@.str2251 = constant [1 x i8] c"\00"
@.str2267 = constant [6 x i8] c"%s\5C22\00"
@.str2292 = constant [6 x i8] c"%s\5C0A\00"
@.str2306 = constant [6 x i8] c"%s\5C5C\00"
@.str2322 = constant [8 x i8] c"%s\5C%c%c\00"
@.str2340 = constant [5 x i8] c"%s%c\00"
@.str2349 = constant [5 x i8] c"%s%c\00"
@.str2360 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2397 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2402 = constant [3 x i8] c"%d\00"
@.str2410 = constant [6 x i8] c"'\5C%x'\00"
@.str2415 = constant [3 x i8] c"%d\00"
@.str2423 = constant [6 x i8] c"'\5C%c'\00"
@.str2430 = constant [3 x i8] c"10\00"
@.str2437 = constant [5 x i8] c"'%c'\00"
@.str2442 = constant [3 x i8] c"%d\00"
@.str2491 = constant [16 x i8] c"mono_assignable\00"
@.str2502 = constant [9 x i8] c"operator\00"
@.str2539 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2586 = constant [2 x i8] c"+\00"
@.str2593 = constant [2 x i8] c"-\00"
@.str2602 = constant [2 x i8] c"*\00"
@.str2609 = constant [2 x i8] c"/\00"
@.str2617 = constant [2 x i8] c"%\00"
@.str2626 = constant [3 x i8] c"==\00"
@.str2633 = constant [3 x i8] c"!=\00"
@.str2642 = constant [3 x i8] c">=\00"
@.str2649 = constant [3 x i8] c"<=\00"
@.str2658 = constant [2 x i8] c">\00"
@.str2665 = constant [2 x i8] c"<\00"
@.str2674 = constant [2 x i8] c"&\00"
@.str2682 = constant [2 x i8] c"|\00"
@.str2687 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
@.str2698 = constant [2 x i8] c"?\00"
@.str2704 = constant [54 x i8] c"called 'repr' with malformed type, container is null.\00"
@.str2710 = constant [4 x i8] c"int\00"
@.str2715 = constant [4 x i8] c"i32\00"
@.str2720 = constant [5 x i8] c"void\00"
@.str2725 = constant [5 x i8] c"void\00"
@.str2730 = constant [5 x i8] c"bool\00"
@.str2735 = constant [3 x i8] c"i1\00"
@.str2740 = constant [8 x i8] c"nullptr\00"
@.str2745 = constant [4 x i8] c"ptr\00"
@.str2750 = constant [4 x i8] c"chr\00"
@.str2755 = constant [3 x i8] c"i8\00"
@.str2760 = constant [9 x i8] c"function\00"
@.str2766 = constant [4 x i8] c"%s(\00"
@.str2792 = constant [4 x i8] c"%s,\00"
@.str2797 = constant [5 x i8] c"%s%s\00"
@.str2808 = constant [4 x i8] c"%s)\00"
@.str2816 = constant [4 x i8] c"ptr\00"
@.str2822 = constant [4 x i8] c"%s*\00"
@.str2834 = constant [7 x i8] c"struct\00"
@.str2840 = constant [2 x i8] c"{\00"
@.str2857 = constant [4 x i8] c"%s,\00"
@.str2862 = constant [5 x i8] c"%s%s\00"
@.str2873 = constant [4 x i8] c"%s}\00"
@.str2881 = constant [6 x i8] c"array\00"
@.str2887 = constant [10 x i8] c"[%s x %s]\00"
@.str2906 = constant [10 x i8] c"typealias\00"
@.str2912 = constant [5 x i8] c"%%%s\00"
@.str2922 = constant [7 x i8] c"vararg\00"
@.str2927 = constant [4 x i8] c"...\00"
@.str2932 = constant [6 x i8] c"error\00"
@.str2937 = constant [53 x i8] c":coffee-error: 'repr' not implemented for type '%s'\0A\00"
@.str2953 = constant [8 x i8] c"nullptr\00"
@.str2960 = constant [8 x i8] c"nullptr\00"
@.str2969 = constant [4 x i8] c"ptr\00"
@.str2976 = constant [4 x i8] c"ptr\00"
@.str2984 = constant [10 x i8] c"typealias\00"
@.str2998 = constant [10 x i8] c"typealias\00"
@.str3057 = constant [12 x i8] c"COFFEE_ROOT\00"
@.str3064 = constant [5 x i8] c"HOME\00"
@.str3069 = constant [11 x i8] c"%s/.coffee\00"
@.str3157 = constant [1 x i8] c"\00"
@.str3201 = constant [1 x i8] c"\00"
@.str3205 = constant [5 x i8] c"%c%s\00"
@.str3215 = constant [1 x i8] c"\00"
@.str3219 = constant [7 x i8] c".tmp%d\00"
@.str3305 = constant [39 x i8] c"Grammar error unable to create context\00"
@.str3327 = constant [1 x i8] c"\00"
@.str3372 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str3388 = constant [1 x i8] c"\00"
@.str3392 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str3411 = constant [6 x i8] c"start\00"
@.str3497 = constant [6 x i8] c"start\00"
@.str3504 = constant [29 x i8] c"Expecting 'start' expression\00"
@.str3507 = constant [7 x i8] c"global\00"
@.str3519 = constant [13 x i8] c"head_comment\00"
@.str3563 = constant [1 x i8] c"\00"
@.str3587 = constant [7 x i8] c"string\00"
@.str3595 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3615 = constant [7 x i8] c"extern\00"
@.str3629 = constant [15 x i8] c"declare %s %s(\00"
@.str3665 = constant [3 x i8] c", \00"
@.str3671 = constant [3 x i8] c"%s\00"
@.str3683 = constant [3 x i8] c")\0A\00"
@.str3692 = constant [1 x i8] c"\00"
@.str3702 = constant [5 x i8] c"%s%s\00"
@.str3710 = constant [9 x i8] c"function\00"
@.str3716 = constant [5 x i8] c"main\00"
@.str3721 = constant [1 x i8] c"\00"
@.str3724 = constant [1 x i8] c"\00"
@.str3735 = constant [6 x i8] c"%s.%s\00"
@.str3751 = constant [1 x i8] c"\00"
@.str3754 = constant [1 x i8] c"\00"
@.str3760 = constant [3 x i8] c"NL\00"
@.str3768 = constant [7 x i8] c"global\00"
@.str3776 = constant [11 x i8] c"assignable\00"
@.str3807 = constant [9 x i8] c"variable\00"
@.str3819 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3834 = constant [10 x i8] c"typealias\00"
@.str3856 = constant [11 x i8] c"%s.%s.type\00"
@.str3868 = constant [10 x i8] c"typealias\00"
@.str3890 = constant [5 x i8] c"type\00"
@.str3920 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3933 = constant [7 x i8] c"extern\00"
@.str3951 = constant [7 x i8] c"extern\00"
@.str3992 = constant [7 x i8] c"extern\00"
@.str4004 = constant [9 x i8] c"function\00"
@.str4013 = constant [9 x i8] c"function\00"
@.str4052 = constant [14 x i8] c"define %s %s(\00"
@.str4081 = constant [3 x i8] c", \00"
@.str4087 = constant [5 x i8] c"type\00"
@.str4103 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str4118 = constant [5 x i8] c") {\0A\00"
@.str4122 = constant [9 x i8] c"function\00"
@.str4132 = constant [6 x i8] c"block\00"
@.str4147 = constant [3 x i8] c"}\0A\00"
@.str4153 = constant [7 x i8] c"import\00"
@.str4209 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str4270 = constant [5 x i8] c"m%d$\00"
@.str4321 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str4328 = constant [1 x i8] c"\00"
@.str4332 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str4364 = constant [9 x i8] c"variable\00"
@.str4369 = constant [5 x i8] c"type\00"
@.str4401 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4414 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str4426 = constant [6 x i8] c"block\00"
@.str4434 = constant [12 x i8] c"expressions\00"
@.str4465 = constant [7 x i8] c"struct\00"
@.str4470 = constant [7 x i8] c"WhAT!\0A\00"
@.str4510 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4522 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4548 = constant [7 x i8] c"struct\00"
@.str4553 = constant [7 x i8] c"WhAT!\0A\00"
@.str4584 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4596 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4621 = constant [7 x i8] c"sizeof\00"
@.str4627 = constant [8 x i8] c"fn_args\00"
@.str4634 = constant [11 x i8] c"assignable\00"
@.str4662 = constant [4 x i8] c"int\00"
@.str4675 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4684 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4695 = constant [7 x i8] c"append\00"
@.str4701 = constant [8 x i8] c"fn_args\00"
@.str4708 = constant [11 x i8] c"assignable\00"
@.str4715 = constant [11 x i8] c"assignable\00"
@.str4737 = constant [1 x i8] c"\00"
@.str4741 = constant [5 x i8] c".b%d\00"
@.str4775 = constant [8 x i8] c"realloc\00"
@.str4784 = constant [9 x i8] c"function\00"
@.str4797 = constant [4 x i8] c"ptr\00"
@.str4814 = constant [4 x i8] c"chr\00"
@.str4831 = constant [4 x i8] c"ptr\00"
@.str4852 = constant [4 x i8] c"chr\00"
@.str4873 = constant [4 x i8] c"int\00"
@.str4876 = constant [8 x i8] c"realloc\00"
@.str4878 = constant [7 x i8] c"extern\00"
@.str4885 = constant [4 x i8] c"len\00"
@.str4891 = constant [8 x i8] c"fn_args\00"
@.str4898 = constant [11 x i8] c"assignable\00"
@.str4906 = constant [1 x i8] c"\00"
@.str4922 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str4943 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str4949 = constant [1 x i8] c"\00"
@.str4955 = constant [6 x i8] c"%s.bn\00"
@.str4960 = constant [9 x i8] c"%s/%s.bn\00"
@.str4984 = constant [35 x i8] c"unable to compile function address\00"
@.str4990 = constant [8 x i8] c"fn_args\00"
@.str4994 = constant [1 x i8] c"\00"
@.str4997 = constant [1 x i8] c"\00"
@.str5005 = constant [4 x i8] c"ptr\00"
@.str5025 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str5049 = constant [11 x i8] c"assignable\00"
@.str5073 = constant [11 x i8] c"assignable\00"
@.str5085 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str5103 = constant [5 x i8] c"%s, \00"
@.str5128 = constant [7 x i8] c"vararg\00"
@.str5141 = constant [1 x i8] c"\00"
@.str5145 = constant [58 x i8] c"types.Type for argument %d does not match: '%s', got '%s'\00"
@.str5162 = constant [8 x i8] c"%s%s %s\00"
@.str5179 = constant [7 x i8] c"vararg\00"
@.str5190 = constant [11 x i8] c"assignable\00"
@.str5199 = constant [7 x i8] c"vararg\00"
@.str5205 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str5241 = constant [7 x i8] c"vararg\00"
@.str5252 = constant [42 x i8] c"Function '%s' takes %d arguments, 0 given\00"
@.str5270 = constant [5 x i8] c"void\00"
@.str5278 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str5310 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str5325 = constant [1 x i8] c"\00"
@.str5338 = constant [7 x i8] c"return\00"
@.str5344 = constant [9 x i8] c"function\00"
@.str5353 = constant [40 x i8] c"'return' used outside of function scope\00"
@.str5362 = constant [3 x i8] c"NL\00"
@.str5387 = constant [1 x i8] c"\00"
@.str5391 = constant [67 x i8] c"trying to return '%s' from function declared with return type '%s'\00"
@.str5410 = constant [11 x i8] c"ret %s %s\0A\00"
@.str5423 = constant [10 x i8] c"ret void\0A\00"
@.str5427 = constant [3 x i8] c"NL\00"
@.str5433 = constant [8 x i8] c"fn_call\00"
@.str5444 = constant [12 x i8] c"declaration\00"
@.str5453 = constant [11 x i8] c"assignment\00"
@.str5461 = constant [11 x i8] c"assignable\00"
@.str5489 = constant [1 x i8] c"\00"
@.str5493 = constant [37 x i8] c"cannot assign type '%s' to type '%s'\00"
@.str5522 = constant [4 x i8] c"ptr\00"
@.str5531 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5541 = constant [9 x i8] c"if_block\00"
@.str5549 = constant [9 x i8] c"for_loop\00"
@.str5557 = constant [8 x i8] c"keyword\00"
@.str5563 = constant [4 x i8] c"for\00"
@.str5570 = constant [1 x i8] c"\00"
@.str5574 = constant [42 x i8] c"'%s' keyword used outside 'for' statement\00"
@.str5590 = constant [6 x i8] c"break\00"
@.str5598 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5609 = constant [9 x i8] c"continue\00"
@.str5617 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5624 = constant [9 x i8] c"function\00"
@.str5633 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str5664 = constant [4 x i8] c"ptr\00"
@.str5673 = constant [4 x i8] c"chr\00"
@.str5684 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5693 = constant [9 x i8] c"function\00"
@.str5706 = constant [5 x i8] c"void\00"
@.str5736 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5738 = constant [7 x i8] c"extern\00"
@.str5746 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5755 = constant [9 x i8] c"function\00"
@.str5770 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5772 = constant [7 x i8] c"extern\00"
@.str5780 = constant [5 x i8] c"mmap\00"
@.str5789 = constant [9 x i8] c"function\00"
@.str5815 = constant [4 x i8] c"int\00"
@.str5827 = constant [4 x i8] c"int\00"
@.str5839 = constant [4 x i8] c"int\00"
@.str5851 = constant [4 x i8] c"int\00"
@.str5863 = constant [4 x i8] c"int\00"
@.str5869 = constant [5 x i8] c"mmap\00"
@.str5871 = constant [7 x i8] c"extern\00"
@.str5877 = constant [5 x i8] c"WORD\00"
@.str5900 = constant [9 x i8] c"function\00"
@.str5924 = constant [4 x i8] c"ptr\00"
@.str5933 = constant [7 x i8] c"struct\00"
@.str5947 = constant [1 x i8] c"\00"
@.str5951 = constant [5 x i8] c"@.%d\00"
@.str5965 = constant [101 x i8] c"%%.tmem%d = call i8*(i8*,i32,i32,i32,i32,i32) @mmap(i8* null, i32 72, i32 7, i32 34, i32 -1, i32 0)\0A\00"
@.str5972 = constant [100 x i8] c"call void(i8*,i8*,i8*) @llvm.init.trampoline(i8* %%.tmem%d, i8* bitcast (%s* %s to i8*), i8* null)\0A\00"
@.str5983 = constant [66 x i8] c"%%.trmp%d = call i8*(i8*) @llvm.adjust.trampoline(i8* %%.tmem%d)\0A\00"
@.str5991 = constant [35 x i8] c"%s = bitcast i8* %%.trmp%d to %s*\0A\00"
@.str6012 = constant [14 x i8] c"define %s %s(\00"
@.str6020 = constant [9 x i8] c"function\00"
@.str6028 = constant [13 x i8] c"%s nest %%.0\00"
@.str6055 = constant [3 x i8] c", \00"
@.str6061 = constant [5 x i8] c"type\00"
@.str6077 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str6092 = constant [5 x i8] c") {\0A\00"
@.str6100 = constant [6 x i8] c"block\00"
@.str6113 = constant [3 x i8] c"}\0A\00"
@.str6139 = constant [12 x i8] c"expressions\00"
@.str6155 = constant [3 x i8] c"NL\00"
@.str6172 = constant [7 x i8] c"return\00"
@.str6180 = constant [5 x i8] c"void\00"
@.str6191 = constant [21 x i8] c"Missing return value\00"
@.str6196 = constant [10 x i8] c"ret void\0A\00"
@.str6213 = constant [14 x i8] c".for.start.%d\00"
@.str6218 = constant [12 x i8] c".for.end.%d\00"
@.str6223 = constant [4 x i8] c"for\00"
@.str6231 = constant [12 x i8] c"declaration\00"
@.str6242 = constant [11 x i8] c"assignment\00"
@.str6252 = constant [9 x i8] c"OPERATOR\00"
@.str6259 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str6270 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str6277 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str6284 = constant [9 x i8] c"OPERATOR\00"
@.str6295 = constant [9 x i8] c"OPERATOR\00"
@.str6302 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str6314 = constant [9 x i8] c"OPERATOR\00"
@.str6319 = constant [6 x i8] c"block\00"
@.str6324 = constant [11 x i8] c"else_block\00"
@.str6334 = constant [13 x i8] c".for.else.%d\00"
@.str6341 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str6356 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str6375 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6385 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str6392 = constant [6 x i8] c"block\00"
@.str6401 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6408 = constant [5 x i8] c"%s:\0A\00"
@.str6422 = constant [5 x i8] c"type\00"
@.str6437 = constant [11 x i8] c"assignable\00"
@.str6452 = constant [9 x i8] c"variable\00"
@.str6457 = constant [5 x i8] c"WORD\00"
@.str6466 = constant [31 x i8] c"unable to get declaration name\00"
@.str6484 = constant [1 x i8] c"\00"
@.str6488 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6498 = constant [1 x i8] c"\00"
@.str6502 = constant [6 x i8] c"%s.%d\00"
@.str6552 = constant [1 x i8] c"\00"
@.str6556 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str6573 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str6585 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6626 = constant [4 x i8] c"int\00"
@.str6633 = constant [4 x i8] c"chr\00"
@.str6641 = constant [5 x i8] c"bool\00"
@.str6650 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str6659 = constant [4 x i8] c"ptr\00"
@.str6667 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6670 = constant [5 x i8] c"null\00"
@.str6678 = constant [7 x i8] c"struct\00"
@.str6699 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6719 = constant [10 x i8] c"typealias\00"
@.str6742 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6762 = constant [6 x i8] c"error\00"
@.str6769 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str6786 = constant [11 x i8] c"assignable\00"
@.str6803 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str6818 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str6825 = constant [6 x i8] c"block\00"
@.str6834 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6841 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str6848 = constant [11 x i8] c"elif_block\00"
@.str6860 = constant [11 x i8] c"else_block\00"
@.str6870 = constant [6 x i8] c"block\00"
@.str6880 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6887 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str6908 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str6917 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str6951 = constant [1 x i8] c"\00"
@.str6962 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6982 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str7016 = constant [7 x i8] c"module\00"
@.str7069 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str7099 = constant [1 x i8] c"\00"
@.str7102 = constant [1 x i8] c"\00"
@.str7110 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str7118 = constant [9 x i8] c"function\00"
@.str7125 = constant [7 x i8] c"extern\00"
@.str7137 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str7158 = constant [9 x i8] c"variable\00"
@.str7180 = constant [4 x i8] c"ptr\00"
@.str7199 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str7223 = constant [10 x i8] c"typealias\00"
@.str7234 = constant [7 x i8] c"struct\00"
@.str7240 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str7292 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str7313 = constant [9 x i8] c"variable\00"
@.str7324 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str7345 = constant [9 x i8] c"variable\00"
@.str7353 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str7361 = constant [1 x i8] c"\00"
@.str7369 = constant [17 x i8] c"addr_destination\00"
@.str7376 = constant [16 x i8] c"mono_assignable\00"
@.str7384 = constant [11 x i8] c"assignable\00"
@.str7398 = constant [12 x i8] c"destination\00"
@.str7403 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str7431 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str7450 = constant [7 x i8] c"module\00"
@.str7472 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str7543 = constant [6 x i8] c"slice\00"
@.str7556 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str7598 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str7619 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str7643 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str7666 = constant [16 x i8] c"mono_assignable\00"
@.str7692 = constant [5 x i8] c"cast\00"
@.str7702 = constant [5 x i8] c"type\00"
@.str7727 = constant [8 x i8] c"bitcast\00"
@.str7742 = constant [6 x i8] c"slice\00"
@.str7747 = constant [48 x i8] c"Casting array to slices is not implemented yet\0A\00"
@.str7755 = constant [4 x i8] c"ptr\00"
@.str7762 = constant [4 x i8] c"ptr\00"
@.str7781 = constant [4 x i8] c"i%d\00"
@.str7786 = constant [4 x i8] c"i%d\00"
@.str7794 = constant [5 x i8] c"sext\00"
@.str7796 = constant [6 x i8] c"trunc\00"
@.str7801 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str7821 = constant [16 x i8] c"mono_assignable\00"
@.str7883 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str7906 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str7913 = constant [2 x i8] c"+\00"
@.str7918 = constant [4 x i8] c"add\00"
@.str7923 = constant [2 x i8] c"-\00"
@.str7928 = constant [4 x i8] c"sub\00"
@.str7933 = constant [2 x i8] c"*\00"
@.str7938 = constant [4 x i8] c"mul\00"
@.str7943 = constant [2 x i8] c"/\00"
@.str7948 = constant [5 x i8] c"sdiv\00"
@.str7953 = constant [3 x i8] c"==\00"
@.str7958 = constant [8 x i8] c"icmp eq\00"
@.str7963 = constant [3 x i8] c"!=\00"
@.str7968 = constant [8 x i8] c"icmp ne\00"
@.str7973 = constant [2 x i8] c">\00"
@.str7978 = constant [9 x i8] c"icmp sgt\00"
@.str7983 = constant [2 x i8] c"<\00"
@.str7988 = constant [9 x i8] c"icmp slt\00"
@.str7993 = constant [2 x i8] c"&\00"
@.str7998 = constant [4 x i8] c"and\00"
@.str8003 = constant [2 x i8] c"|\00"
@.str8008 = constant [3 x i8] c"or\00"
@.str8013 = constant [3 x i8] c">=\00"
@.str8018 = constant [9 x i8] c"icmp sge\00"
@.str8023 = constant [3 x i8] c"<=\00"
@.str8028 = constant [9 x i8] c"icmp sle\00"
@.str8033 = constant [2 x i8] c"%\00"
@.str8038 = constant [5 x i8] c"srem\00"
@.str8042 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str8049 = constant [4 x i8] c"add\00"
@.str8056 = constant [3 x i8] c"==\00"
@.str8063 = constant [3 x i8] c"!=\00"
@.str8071 = constant [2 x i8] c"|\00"
@.str8079 = constant [2 x i8] c"&\00"
@.str8087 = constant [2 x i8] c">\00"
@.str8095 = constant [2 x i8] c"<\00"
@.str8103 = constant [3 x i8] c">=\00"
@.str8111 = constant [3 x i8] c"<=\00"
@.str8119 = constant [5 x i8] c"bool\00"
@.str8123 = constant [4 x i8] c"int\00"
@.str8130 = constant [1 x i8] c"\00"
@.str8133 = constant [1 x i8] c"\00"
@.str8141 = constant [7 x i8] c"NUMBER\00"
@.str8155 = constant [4 x i8] c"int\00"
@.str8169 = constant [5 x i8] c"WORD\00"
@.str8179 = constant [5 x i8] c"null\00"
@.str8186 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str8200 = constant [5 x i8] c"null\00"
@.str8209 = constant [8 x i8] c"nullptr\00"
@.str8216 = constant [17 x i8] c"addr_destination\00"
@.str8228 = constant [12 x i8] c"destination\00"
@.str8278 = constant [4 x i8] c"ptr\00"
@.str8297 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str8311 = constant [9 x i8] c"function\00"
@.str8326 = constant [4 x i8] c"ptr\00"
@.str8334 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str8348 = constant [8 x i8] c"boolean\00"
@.str8362 = constant [5 x i8] c"bool\00"
@.str8371 = constant [6 x i8] c"false\00"
@.str8378 = constant [2 x i8] c"0\00"
@.str8382 = constant [2 x i8] c"1\00"
@.str8389 = constant [8 x i8] c"fn_call\00"
@.str8406 = constant [7 x i8] c"STRING\00"
@.str8432 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str8448 = constant [4 x i8] c"ptr\00"
@.str8461 = constant [4 x i8] c"chr\00"
@.str8468 = constant [4 x i8] c"CHR\00"
@.str8484 = constant [2 x i8] c"0\00"
@.str8500 = constant [22 x i8] c"Invalid character: %s\00"
@.str8516 = constant [4 x i8] c"chr\00"
@.str8520 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str8548 = constant [22 x i8] c"called 'abbr' on null\00"
@.str8554 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str8559 = constant [4 x i8] c"int\00"
@.str8564 = constant [2 x i8] c"i\00"
@.str8569 = constant [5 x i8] c"bool\00"
@.str8574 = constant [2 x i8] c"b\00"
@.str8579 = constant [5 x i8] c"void\00"
@.str8584 = constant [2 x i8] c"v\00"
@.str8589 = constant [4 x i8] c"chr\00"
@.str8594 = constant [2 x i8] c"c\00"
@.str8599 = constant [4 x i8] c"ptr\00"
@.str8604 = constant [1 x i8] c"\00"
@.str8608 = constant [4 x i8] c"%sp\00"
@.str8619 = constant [10 x i8] c"typealias\00"
@.str8630 = constant [7 x i8] c"struct\00"
@.str8635 = constant [2 x i8] c"s\00"
@.str8646 = constant [5 x i8] c"%s%s\00"
@.str8659 = constant [9 x i8] c"function\00"
@.str8664 = constant [2 x i8] c"f\00"
@.str8669 = constant [6 x i8] c"error\00"
@.str8674 = constant [2 x i8] c"?\00"
@.str8676 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str8686 = constant [1 x i8] c"\00"
@.str8690 = constant [7 x i8] c".str%d\00"
@.str8705 = constant [6 x i8] c"array\00"
@.str8718 = constant [4 x i8] c"chr\00"
@.str8739 = constant [3 x i8] c"%d\00"
@.str8746 = constant [7 x i8] c"string\00"
@.str8782 = constant [7 x i8] c"module\00"
@.str8833 = constant [4 x i8] c"%s\0A\00"
@.str8952 = constant [9 x i8] c"function\00"
@.str8970 = constant [5 x i8] c"WORD\00"
@.str9027 = constant [10 x i8] c"fn_params\00"
@.str9041 = constant [11 x i8] c"basic_type\00"
@.str9062 = constant [13 x i8] c"type_trailer\00"
@.str9071 = constant [9 x i8] c"function\00"
@.str9087 = constant [15 x i8] c"type_fn_params\00"
@.str9128 = constant [4 x i8] c"ptr\00"
@.str9140 = constant [10 x i8] c"structdef\00"
@.str9147 = constant [7 x i8] c"struct\00"
@.str9154 = constant [5 x i8] c"type\00"
@.str9185 = constant [5 x i8] c"type\00"
@.str9212 = constant [5 x i8] c"type\00"
@.str9218 = constant [12 x i8] c"dotted_name\00"
@.str9223 = constant [1 x i8] c"\00"
@.str9234 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str9247 = constant [6 x i8] c"error\00"
@.str9252 = constant [10 x i8] c"typealias\00"
@.str9276 = constant [4 x i8] c"str\00"
@.str9283 = constant [4 x i8] c"ptr\00"
@.str9292 = constant [4 x i8] c"chr\00"
@.str9297 = constant [5 x i8] c"WORD\00"
@.str9310 = constant [4 x i8] c"...\00"
@.str9317 = constant [7 x i8] c"vararg\00"
@.str9321 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str9342 = constant [2 x i8] c"*\00"
@.str9351 = constant [4 x i8] c"ptr\00"
@.str9360 = constant [2 x i8] c"[\00"
@.str9370 = constant [2 x i8] c"]\00"
@.str9379 = constant [7 x i8] c"struct\00"
@.str9383 = constant [6 x i8] c"slice\00"
@.str9389 = constant [4 x i8] c"ptr\00"
@.str9393 = constant [6 x i8] c"c_arr\00"
@.str9405 = constant [4 x i8] c"int\00"
@.str9409 = constant [4 x i8] c"len\00"
@.str9418 = constant [4 x i8] c"int\00"
@.str9422 = constant [4 x i8] c"cap\00"
@.str9433 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str9446 = constant [2 x i8] c"w\00"
@.str9462 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str9471 = constant [1 x i8] c"\00"
@.str9475 = constant [32 x i8] c"tee debug.ll | llc - -o debug.s\00"
@.str9480 = constant [2 x i8] c"w\00"
@.str9492 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9500 = constant [24 x i8] c"error on llc execution\0A\00"
@.str9504 = constant [17 x i8] c"cc debug.s -o %s\00"
@.str9510 = constant [2 x i8] c"w\00"
@.str9518 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9526 = constant [22 x i8] c"error on cc execution\00"
@.str9529 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str9546 = constant [4 x i8] c"run\00"
@.str9551 = constant [1 x i8] c"\00"
@.str9555 = constant [5 x i8] c"./%s\00"
@.str9564 = constant [22 x i8] c"Usage: %s <filename>\0A\00"
@.str9582 = constant [8 x i8] c"compile\00"
@.str9587 = constant [4 x i8] c"run\00"
@.str9593 = constant [4 x i8] c"run\00"
